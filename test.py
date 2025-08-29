import argparse
from lark import Lark
from lark import Tree, Token
from slither.slither import Slither
from slither.core.declarations.function import Function as SlitherFunction

import os

def build_call_mapping(sol_file: str) -> dict[str, list[str]]:
    sol_path = os.path.abspath(sol_file)
    sl = Slither(sol_path)

    callmap: dict[str, list[str]] = {}

    for c in sl.contracts:
        for f in c.functions:
            src_name = f.canonical_name  # ví dụ: "MyContract.myFunc(uint256)"
            callees = []

            # internal calls (IR InternalCall)
            for ic in f.internal_calls:
                callee = getattr(ic, "function", None)
                if isinstance(callee, SlitherFunction):
                    callees.append(callee.canonical_name)

            # external/high-level calls (tuple (Contract, HighLevelCall))
            for (_dest_contract, hl) in f.high_level_calls:
                callee = getattr(hl, "function", None)
                if isinstance(callee, SlitherFunction):
                    callees.append(callee.canonical_name)

            callmap[src_name] = callees

    return callmap

def run_slither(sol_file: str):
    sol_path = os.path.abspath(sol_file)

    sl = Slither(sol_path)
    for contract in sl.contracts:
        for f in contract.functions:
            print(f.name, f.source_mapping)

def extract_rules_and_methods(ast_tree):
    rules = []
    methods = []

    def walk(t):
        if isinstance(t, Tree):
            # Rule
            if t.data == "rule":
                # t.children thường có ID là tên rule, params và block
                # Lấy tên rule
                rule_name = None
                for child in t.children:
                    if isinstance(child, Tree) and child.data == "params":
                        continue
                    elif hasattr(child, 'type') and child.type == "ID":
                        rule_name = child.value
                        break
                if rule_name:
                    rules.append(rule_name)

            # Method
            if t.data == "method_spec":
                # method_spec bắt đầu với từ khóa 'function' rồi pattern
                method_name = None
                for child in t.children:
                    if isinstance(child, Tree) and child.data in ("exact_pattern",
                                                                 "wildcard_pattern",
                                                                 "catch_all_pattern",
                                                                 "catch_unresolved_calls_pattern"):
                        # lấy tên hàm từ pattern
                        for c in child.children:
                            if hasattr(c, "type") and c.type == "ID":
                                method_name = c.value
                                break
                    elif hasattr(child, "type") and child.type == "ID":
                        method_name = child.value
                if method_name:
                    methods.append(method_name)

            # Đệ quy
            for c in t.children:
                walk(c)

    walk(ast_tree)
    return rules, methods

def analyze_ast(ast_tree):
    """
    Trả về:
    {
      "methods": [
         {"name": "x", "kind": "exact", "contract": None, "visibility": "external"},
         {"name": "add_to_x", "kind": "exact", "contract": None, "visibility": "external"},
         {"name": "transfer", "kind": "wildcard", "contract": None, "visibility": "external"},
         {"name": None, "kind": "catch_all", "contract": "ERC20", "visibility": "external"},
         {"name": None, "kind": "catch_unresolved", "contract": None, "visibility": "external"},
      ],
      "rules": [
         {
           "name": "xSpec",
           "calls": {"x", "add_to_x"},
           "undefined_calls": [],
           "asserts": [{"expr": "xBefore <= xAfter", "message": "x must increase"}]
         }
      ]
    }
    """
    methods = []
    rules = []

    # --- Helpers ---
    def iter_tokens(node):
        for obj in node.iter_subtrees_topdown():
            for ch in obj.children:
                if isinstance(ch, Token):
                    yield ch
        # also include tokens directly attached at this level
        for ch in node.children:
            if isinstance(ch, Token):
                yield ch

    def flatten_expr_text(expr_tree):
        # Thu thập token text trong subtree và nén khoảng trắng
        toks = []
        for t in expr_tree.scan_values(lambda v: isinstance(v, Token)):
            # Bỏ WS vì grammar đã %ignore WS; chỉ còn token thực
            toks.append(t.value)
        # Làm gọn một số dấu câu cơ bản để nhìn đỡ rườm
        s = " ".join(toks)
        s = s.replace(" ,", ",").replace("( ", "(").replace(" )", ")")
        s = s.replace(" ;", ";").replace(" .", ".")
        return s.strip()

    def get_id_tokens_before_at(node):
        ids = []
        for t in node.scan_values(lambda v: isinstance(v, Token)):
            if t.value == "at":   # literal 'at'
                break
            if t.type == "ID":
                ids.append(t.value)
        return ids

    def extract_method_from_pattern(pattern_tree):
        # Trả về (name, contract, kind, visibility)
        # visibility là token cuối cùng thuộc VISIBILITY nếu có
        # exact_pattern: (ID ".")? ID "(" ... ")" VISIBILITY ...
        # wildcard_pattern: "_" "." ID "(" ... ")" VISIBILITY
        # catch_all_pattern: ID "." "_" "external"
        # catch_unresolved_calls_pattern: "_" "." "_" "external"
        name = None
        contract = None
        kind = None
        visibility = None

        # lấy visibility nếu có trong subtree (token 'internal'|'external')
        for t in pattern_tree.scan_values(lambda v: isinstance(v, Token)):
            if t.type == "VISIBILITY":
                visibility = t.value

        if pattern_tree.data == "exact_pattern":
            # các ID đầu: có thể là [contract, name] hoặc chỉ [name]
            ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
            if len(ids) >= 2:
                contract, name = ids[0], ids[1]
            elif len(ids) == 1:
                name = ids[0]
            kind = "exact"

        elif pattern_tree.data == "wildcard_pattern":
            # "_" "." ID "(" ... ")" VISIBILITY
            ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
            # chỉ có 1 ID là tên hàm
            name = ids[-1] if ids else None
            kind = "wildcard"

        elif pattern_tree.data == "catch_all_pattern":
            # ID "." "_" "external" -> bất kỳ hàm trên contract nhất định
            ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
            contract = ids[0] if ids else None
            kind = "catch_all"
            visibility = "external"

        elif pattern_tree.data == "catch_unresolved_calls_pattern":
            # "_" "." "_" "external" -> tất cả
            kind = "catch_unresolved"
            visibility = "external"

        return name, contract, kind, visibility

    # --- 1) Quét methods ---
    # Đi qua tất cả method_spec trong cây
    for node in ast_tree.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "method_spec":
            # tìm pattern con
            method_name = None
            contract = None
            kind = None
            visibility = None

            for ch in node.children:
                if isinstance(ch, Tree) and ch.data in (
                    "exact_pattern",
                    "wildcard_pattern",
                    "catch_all_pattern",
                    "catch_unresolved_calls_pattern",
                ):
                    name, ctt, kd, vis = extract_method_from_pattern(ch)
                    method_name = name if name else method_name
                    contract = ctt if ctt else contract
                    kind = kd if kd else kind
                    visibility = vis if vis else visibility

            methods.append({
                "name": method_name,
                "contract": contract,
                "kind": kind if kind else "unknown",
                "visibility": visibility
            })

    # Lập chỉ mục kiểm tra call nhanh
    allow_all_calls = any(m["kind"] in ("catch_unresolved", "catch_all") for m in methods)
    allowed_names = set(m["name"] for m in methods if m["name"])
    # Nếu có wildcard_pattern cho tên X, coi như cho phép X
    # (đã cho vào allowed_names bên trên vì wildcard cũng có 'name')

    # --- 2) Quét rules ---
    for node in ast_tree.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "rule":
            # Rule name là ID đầu tiên trong children của rule
            rule_name = None
            for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                rule_name = t.value
                break

            calls = set()
            undefined = []
            asserts = []

            # Duyệt các function_call trong phạm vi rule
            for sub in node.iter_subtrees_topdown():
                if isinstance(sub, Tree) and sub.data == "function_call":
                    # lấy tên hàm là ID cuối cùng trước literal 'at' (nếu có)
                    ids_before_at = get_id_tokens_before_at(sub)
                    if ids_before_at:
                        func_name = ids_before_at[-1]
                        calls.add(func_name)
                        if not allow_all_calls and (func_name not in allowed_names):
                            undefined.append(func_name)

                if isinstance(sub, Tree) and sub.data == "assert_statement":
                    # children: expr, optional STRING_LITERAL
                    expr_node = None
                    msg = None
                    for ch in sub.children:
                        if isinstance(ch, Tree) and ch.data != "exprs":
                            expr_node = ch  # chính expr
                        if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                            # bỏ cặp quote ngoài
                            msg = ch.value[1:-1]
                    expr_txt = flatten_expr_text(expr_node) if expr_node is not None else ""
                    asserts.append({"expr": expr_txt, "message": msg})

            rules.append({
                "name": rule_name,
                "calls": sorted(calls),
                "undefined_calls": sorted(set(undefined)),
                "asserts": asserts
            })

    return {"methods": methods, "rules": rules}

def main():
    parser = argparse.ArgumentParser(description="Parse a file with Lark grammar")
    parser.add_argument("file_sol", help="Path to the solidity file")
    parser.add_argument("file_spec", help="Path to the spec file")
    parser.add_argument("--grammar", default="./parser_certora.lark", help="Path to the grammar file (default: ./parser_certora.lark)")
    args = parser.parse_args()

    with open(args.grammar, "r", encoding="utf-8") as f:
        parser_text = f.read()

    l = Lark(parser_text)

    with open(args.file_spec, "r", encoding="utf-8") as f:
        data = f.read()
    
    run_slither(args.file_sol)
    callMap = build_call_mapping(args.file_sol)
    print(callMap)

    ast_tree = l.parse(data)
    print(ast_tree.pretty())
    result = analyze_ast(ast_tree)
    print("Methods:", result["methods"])
    print("Rules:", result["rules"])

if __name__ == "__main__":
    main()