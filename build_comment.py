import os
import re
from typing import Dict, List, Tuple, Optional
from lark import Tree, Token, Lark
import argparse
from slither.slither import Slither
from slither.core.declarations import Function as SlitherFunction


# ---------- 1) Phân tích AST: methods + rules (calls, asserts) ----------

def _flatten_any(x) -> str:
    # Flatten 1 token hoặc 1 subtree bất kỳ thành chuỗi
    if isinstance(x, Token):
        return x.value
    if isinstance(x, Tree):
        toks = []
        for t in x.scan_values(lambda v: isinstance(v, Token)):
            toks.append(t.value)
        s = " ".join(toks)
        s = s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
        return s.strip()
    return str(x)

def _flatten_expr_text(expr_tree: Tree) -> str:
    if expr_tree is None:
        return ""
    toks = []
    for t in expr_tree.scan_values(lambda v: isinstance(v, Token)):
        toks.append(t.value)
    s = " ".join(toks)
    s = s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
    return s.strip()

def _extract_method_from_pattern(pattern_tree: Tree) -> Tuple[Optional[str], Optional[str], str, Optional[str]]:
    """
    Trả về: (name, contract, kind, visibility)
    kind ∈ {"exact","wildcard","catch_all","catch_unresolved"}
    """
    name = None
    contract = None
    kind = None
    visibility = None

    for t in pattern_tree.scan_values(lambda v: isinstance(v, Token)):
        if getattr(t, "type", None) == "VISIBILITY":
            visibility = t.value

    if pattern_tree.data == "exact_pattern":
        ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
        if len(ids) >= 2:
            contract, name = ids[0], ids[1]
        elif len(ids) == 1:
            name = ids[0]
        kind = "exact"

    elif pattern_tree.data == "wildcard_pattern":
        ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
        name = ids[-1] if ids else None
        kind = "wildcard"

    elif pattern_tree.data == "catch_all_pattern":
        ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
        contract = ids[0] if ids else None
        kind = "catch_all"
        visibility = "external"

    elif pattern_tree.data == "catch_unresolved_calls_pattern":
        kind = "catch_unresolved"
        visibility = "external"

    return name, contract, kind, visibility

def _extract_call_args_from_exprs(exprs_tree: Tree) -> list[str]:
    """
    exprs: expr ("," expr)*
    Do 'expr' là inline ('?expr'), children của 'exprs' có thể KHÔNG phải Tree('expr').
    Ta tách theo dấu ',' ở cấp trực tiếp rồi flatten từng cụm.
    """
    if exprs_tree is None:
        return []
    args = []
    cur_chunk = []

    for ch in exprs_tree.children:
        if isinstance(ch, Token) and ch.value == ",":
            # kết thúc 1 đối số
            if cur_chunk:
                arg_text = " ".join(_flatten_any(x) for x in cur_chunk).strip()
                # dọn spacing
                arg_text = arg_text.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
                args.append(arg_text)
                cur_chunk = []
        else:
            cur_chunk.append(ch)

    # đối số cuối cùng (nếu có)
    if cur_chunk:
        arg_text = " ".join(_flatten_any(x) for x in cur_chunk).strip()
        arg_text = arg_text.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
        args.append(arg_text)

    return args

def _get_function_call_info(call_tree: Tree) -> tuple[Optional[str], list[str]]:
    """
    function_call: (ID ".")? ID ("@" CALL_MODIFIER)? "(" exprs? ")" ("at" ID)?
    Trả về (func_name, args)
      - func_name = ID ngay trước node 'exprs' (nếu có), hoặc ID cuối cùng trong các con trực tiếp
      - args      = danh sách chuỗi biểu diễn từng expr trong 'exprs' (tách theo ',' cấp trực tiếp)
    """
    children = list(call_tree.children)

    # Tìm node exprs (nếu có) trong các con trực tiếp
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)

    # Lấy ID tokens trước exprs_node → tên hàm là ID cuối cùng trước exprs
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx] if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None

    # LẤY ARGS ĐÚNG CÁCH (gọi helper tách theo dấu phẩy ở cấp trực tiếp)
    args = _extract_call_args_from_exprs(exprs_node) if exprs_node is not None else []
    return func_name, args

def extract_spec_summary(ast_tree: Tree) -> dict:
    methods = []
    rules = []

    # (giữ nguyên phần quét methods như bạn đã có)
    for node in ast_tree.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "method_spec":
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
                    name, ctt, kd, vis = _extract_method_from_pattern(ch)
                    if name is not None:
                        method_name = name
                    if ctt is not None:
                        contract = ctt
                    if kd is not None:
                        kind = kd
                    if vis is not None:
                        visibility = vis

            methods.append({
                "name": method_name,
                "contract": contract,
                "kind": kind if kind else "unknown",
                "visibility": visibility
            })

    allow_all_calls = any(m["kind"] in ("catch_all", "catch_unresolved") for m in methods)
    allowed_names = {m["name"] for m in methods if m.get("name")}

    for node in ast_tree.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "rule":
            rule_name = None
            for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                rule_name = t.value
                break

            calls = []
            undefined = []
            asserts = []

            for sub in node.iter_subtrees_topdown():
                if isinstance(sub, Tree) and sub.data == "function_call":
                    fname, fargs = _get_function_call_info(sub)
                    if fname:
                        calls.append({"name": fname, "args": fargs})
                        if not allow_all_calls and (fname not in allowed_names):
                            undefined.append(fname)

                if isinstance(sub, Tree) and sub.data == "assert_statement":
                    expr_node = None
                    msg = None
                    for ch in sub.children:
                        if isinstance(ch, Tree):
                            expr_node = ch
                        if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                            msg = ch.value[1:-1]
                    expr_txt = _flatten_expr_text(expr_node)
                    asserts.append({"expr": expr_txt, "message": msg})

            rules.append({
                "name": rule_name,
                "calls": calls,  # mỗi phần tử: {"name": ..., "args": [...]}
                "undefined_calls": sorted(set(undefined)),
                "asserts": asserts
            })

    return {
        "methods": methods,
        "allow_all_calls": allow_all_calls,
        "allowed_names": allowed_names,
        "rules": rules
    }


# ---------- 2) Tìm vị trí hàm trong Solidity bằng Slither ----------

def _scan_function_lines_in_file(sol_file: str, target_names: List[str]) -> Dict[str, List[int]]:
    """
    Quét trực tiếp source để tìm các dòng bắt đầu khai báo function theo tên.
    Trả về: {func_name: [line1, line2, ...]} (1-indexed)
    Hỗ trợ overload (nhiều lần xuất hiện cùng tên).
    """
    with open(sol_file, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    name_set = set(target_names)
    patterns = {name: re.compile(rf'^\s*function\s+{re.escape(name)}\s*\(') for name in name_set}

    found: Dict[str, List[int]] = {name: [] for name in name_set}
    for i, line in enumerate(lines, start=1):
        for name, pat in patterns.items():
            if pat.search(line):
                found[name].append(i)
    return found

def _build_comments_for_function_name(func_name: str, rules: list[dict], rule_call_edges: Dict[str, List[Tuple[str, Optional[str]]]]) -> list[str]:
    """
    - Hiển thị:
      + Các lần gọi trực tiếp (có args) từ rule
      + Các lần gọi gián tiếp: 'Indirect from rule R via add_to_x'
      + Các assert của rule (vẫn thuộc rule gốc)
    """
    lines: List[str] = []

    # edges theo rule cho func_name
    edges = rule_call_edges.get(func_name, [])
    if not edges:
        return []

    lines.append('/// === SPEC ASSERTS (auto-generated) ===')

    # 1) Direct calls: lấy args từ rules
    for r in rules:
        rname = r["name"]
        # rule này có edge tới func_name?
        if not any(e[0] == rname for e in edges):
            continue

        # direct calls trong rule (có thể nhiều lần)
        direct_calls = [c for c in r["calls"] if c["name"] == func_name]
        for c in direct_calls:
            if c["args"]:
                lines.append(f'/// Call from rule {rname}: {func_name}({", ".join(c["args"])})')
            else:
                lines.append(f'/// Call from rule {rname}: {func_name}()')

        # indirect edges: (rule, caller_name)
        for (erule, caller) in edges:
            if erule != rname or caller is None:
                continue
            lines.append(f'/// Indirect from rule {rname} via {caller}()')

        # Assert của rule
        for a in r["asserts"]:
            if a.get("message"):
                lines.append(f'/// - {a["expr"]}  // {a["message"]}')
            else:
                lines.append(f'/// - {a["expr"]}')

    return lines

def _insert_lines_before(filepath: str, line_no_1based: int, new_lines: List[str]) -> None:
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    insert_at = max(0, min(len(lines), line_no_1based - 1))
    for idx, ln in enumerate(new_lines):
        lines.insert(insert_at + idx, ln)

    with open(filepath, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

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

def annotate_spec_asserts(ast_tree: Tree, sol_file: str, output_path: Optional[str] = None) -> str:
    """
    - Lấy rules/calls/asserts từ AST
    - Lọc call theo methods (trừ khi có catch_all/catch_unresolved)
    - Quét trực tiếp file .sol để tìm dòng function và chèn comment /// ngay trước đó
    - Ghi ra <sol_file>.annotated.sol
    """
    spec = extract_spec_summary(ast_tree)
    methods = spec["methods"]
    allow_all = spec["allow_all_calls"]
    allowed_names = {m["name"] for m in methods if m.get("name")}

    # Lọc calls theo methods nếu không allow_all
    filtered_rules = []
    for r in spec["rules"]:
        calls = r["calls"] if allow_all else [c for c in r["calls"] if c["name"] in allowed_names]
        filtered_rules.append({**r, "calls": calls})

    print(spec["rules"])

    # 1) Xây call graph bằng Slither
    callmap = build_call_mapping(sol_file)  # dùng đúng hàm bạn đã đưa

    def _simple_name(canonical: str) -> str:
        # "MyContract.myFunc(uint256)" -> "myFunc"
        name_sig = canonical.split(".", 1)[-1]     # "myFunc(uint256)"
        return name_sig.split("(", 1)[0]           # "myFunc"

    # Map caller_simple_name -> set(callee_simple_name)
    caller2callees: Dict[str, set] = {}
    for src, callees in callmap.items():
        src_name = _simple_name(src)
        for cal in callees:
            cal_name = _simple_name(cal)
            caller2callees.setdefault(src_name, set()).add(cal_name)

    # 2) Tập “seed” là các hàm xuất hiện trực tiếp trong rule
    seed_func_names = sorted({c["name"] for r in filtered_rules for c in r["calls"]})

    # 3) Mở rộng thêm một bậc: tất cả callee của seed
    transitive_func_names = set(seed_func_names)
    for seed in seed_func_names:
        for cal in caller2callees.get(seed, set()):
            transitive_func_names.add(cal)

    # 4) Gộp lại thành danh sách tên hàm cần chèn
    target_func_names = sorted(transitive_func_names)

    # rule_call_edges: func_name -> list of (rule_name, direct_caller_name or None)
    # - direct: (rule_name, func_name) chính nó
    # - indirect (callee): (rule_name, caller_name) nơi caller_name ∈ seed
    rule_call_edges: Dict[str, List[Tuple[str, Optional[str]]]] = {}

    for r in filtered_rules:
        rule_name = r["name"]
        direct_names = {c["name"] for c in r["calls"]}
        # direct edges
        for fn in direct_names:
            rule_call_edges.setdefault(fn, []).append((rule_name, None))
        # indirect edges: qua các caller xuất hiện trong rule
        for caller in direct_names:
            for cal in caller2callees.get(caller, set()):
                rule_call_edges.setdefault(cal, []).append((rule_name, caller))

    # Nếu không có gì để chèn, cứ copy file và trả path
    if output_path is None:
        base, ext = os.path.splitext(os.path.abspath(sol_file))
        output_path = base + ".annotated" + ext

    with open(sol_file, "r", encoding="utf-8") as rf:
        original = rf.read()
    with open(output_path, "w", encoding="utf-8") as wf:
        wf.write(original)

    if not target_func_names:
        return output_path

    # Quét file để tìm dòng function theo tên
    occ = _scan_function_lines_in_file(sol_file, target_func_names)

    inserts: List[Tuple[int, List[str]]] = []
    for name, lines in occ.items():
        if not lines:
            continue
        comments = _build_comments_for_function_name(name, filtered_rules, rule_call_edges)
        if not comments:
            continue
        for ln in lines:
            inserts.append((ln, comments))


    # Chèn theo thứ tự giảm dần dòng để không làm lệch vị trí
    for ln, comments in sorted(inserts, key=lambda x: x[0], reverse=True):
        _insert_lines_before(output_path, ln, comments)

    return output_path


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

    ast_tree = l.parse(data)
    out_file = annotate_spec_asserts(ast_tree, args.file_sol)
    print("Annotated file written to:", out_file)

if __name__ == "__main__":
    main()