# spec_parser.py
import re
from typing import Dict, List, Tuple, Optional, Any
from lark import Tree, Token

# === NEW: helpers for robust arg splitting without commas in AST ===
_ATOM_TOKEN_TYPES = {
    "ID", "INTEGER_LITERAL", "STRING_LITERAL", "TRUE", "FALSE"
}

# ===== Helpers (public if other modules import) =====
def _flatten_expr(tree_or_tok: Any) -> str:
    if isinstance(tree_or_tok, Token):
        return tree_or_tok.value
    if isinstance(tree_or_tok, Tree):
        toks = []
        for t in tree_or_tok.scan_values(lambda v: isinstance(v, Token)):
            toks.append(t.value)
        s = " ".join(toks)
        return s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".").strip()
    return str(tree_or_tok)

def _extract_param_types_from_pattern(pat: Tree) -> List[str]:
    """
    Lấy danh sách kiểu tham số từ subtree 'params' bên trong exact_pattern / wildcard_pattern.
    Trả về list chuỗi đã flatten (ví dụ: ['uint', 'address', 'bytes32[]']).
    """
    params_node = next((ch for ch in pat.children
                        if isinstance(ch, Tree) and ch.data == "params"), None)
    if params_node is None:
        return []

    types: List[str] = []

    for tnode in params_node.iter_subtrees_topdown():
        if isinstance(tnode, Tree) and tnode.data == "cvl_type":
            types.append(_flatten_tokens_only(tnode))

    return types

def _get_function_call_info(call_tree: Tree) -> Tuple[Optional[str], List[str]]:
    children = list(call_tree.children)
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx]
                  if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None
    # DÙNG splitter mới; ở đây không cần sol_symbols nên pass {} để chỉ tách theo dấu phẩy
    args = _split_call_args(exprs_node, sol_symbols={})
    return func_name, args

def _is_zero_arg_function_call(tree: Tree) -> Optional[str]:
    if not (isinstance(tree, Tree) and tree.data == "function_call"):
        return None
    children = list(tree.children)
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx] if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None
    if func_name and (exprs_node is None or len(exprs_node.children) == 0):
        return func_name
    return None

def _extract_rule_params(params_node: Tree) -> List[dict]:
    """
    Trả về danh sách tham số của rule dạng:
    [{"type": "<flatten cvl_type>", "name": "<id|None>"}]

    Grammar:
      params : cvl_type data_location? ID? param*
      param  : "," cvl_type data_location? (ID)?

    Thực tế trong AST:
      - Tham số đầu tiên: xuất hiện trực tiếp dưới 'params' (cvl_type rồi ID).
      - Các tham số còn lại: mỗi cái nằm trong một subtree 'param' bên trong 'params'.
    """
    out: List[dict] = []
    if params_node is None:
        return out

    # 1) Lấy tham số đầu tiên trực tiếp dưới 'params'
    children = list(params_node.children)
    i = 0
    while i < len(children):
        ch = children[i]
        if isinstance(ch, Tree) and ch.data == "cvl_type":
            ty = _flatten_tokens_only(ch)
            name = None
            # token ID ngay sau đó (nếu có) thuộc tham số đầu tiên
            j = i + 1
            while j < len(children):
                nxt = children[j]
                # gặp 'param' -> dừng, vì phần sau là các tham số tiếp theo
                if isinstance(nxt, Tree) and nxt.data == "param":
                    break
                if isinstance(nxt, Token) and nxt.type == "ID":
                    name = nxt.value
                    j += 1
                    break
                j += 1
            out.append({"type": ty, "name": name})
            break  # chỉ có duy nhất 1 "đầu" trực tiếp dưới params
        i += 1

    # 2) Lấy các tham số còn lại bên trong từng 'param'
    for ch in children:
        if isinstance(ch, Tree) and ch.data == "param":
            ptype = None
            pname = None
            for sub in ch.children:
                if isinstance(sub, Tree) and sub.data == "cvl_type":
                    ptype = _flatten_tokens_only(sub)
                elif isinstance(sub, Token) and sub.type == "ID":
                    pname = sub.value
            if ptype:
                out.append({"type": ptype, "name": pname})

    return out

def _flatten_tokens_only(x: Any) -> str:
    """
    Gộp tokens như trước, KHÔNG có logic state-var mapping.
    Dùng nội bộ để gom chuỗi 'thô'.
    """
    if isinstance(x, Token):
        return x.value
    if isinstance(x, Tree):
        toks = []
        for t in x.scan_values(lambda v: isinstance(v, Token)):
            toks.append(t.value)
        s = " ".join(toks)
        return s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".").strip()
    return str(x)


def _render_call(name: str, args: List[str], sol_symbols: dict) -> str:
    """
    Render theo bảng symbol:
    - Nếu name là state_var: 
        0 arg  -> name
        1+ arg -> name[a][b]...
    - Else (function): name(a, b, ...)
    """
    if name in sol_symbols.get("state_vars", set()):
        if not args:
            return name
        if len(args) == 1:
            return f"{name}[{args[0]}]"
        return f"{name}[" + "][".join(args) + "]"
    # function
    return f"{name}(" + ", ".join(args) + ")"


def _flatten_expr_with_symbols(tree_or_tok: Any, sol_symbols: dict) -> str:
    """
    Flatten biểu thức nhưng biết phân biệt function vs state_var/mapping để render đúng.
    - ĐỆ QUY trên mọi node: đảm bảo các function_call lồng trong expr đều được render chuẩn.
    """
    # Token → trả lại nguyên giá trị
    if isinstance(tree_or_tok, Token):
        return tree_or_tok.value

    # function_call → render đặc biệt (function vs state var/mapping)
    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "function_call":
        fname, fargs = _get_function_call_info(tree_or_tok)
        if fname is None:
            return ""
        # Flatten từng arg (đệ quy) để giữ chuẩn hoá
        args = []
        exprs_node = next((ch for ch in tree_or_tok.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        if exprs_node is not None:
            cur = []
            for ch in exprs_node.children:
                if isinstance(ch, Token) and ch.value == ",":
                    if cur:
                        args.append(_flatten_expr_with_symbols_list(cur, sol_symbols))
                        cur = []
                else:
                    cur.append(ch)
            if cur:
                args.append(_flatten_expr_with_symbols_list(cur, sol_symbols))
        return _render_call(fname, args, sol_symbols)
    
    # --- special_var_attribute_call: ID "." special_var_attribute
    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "special_var_attribute_call":
        # Tên: ID có thể là con trực tiếp
        name_tok = next(
            (t for t in tree_or_tok.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")),
            None
        )
        # Thuộc tính: token SUM có thể nằm trong Tree('special_var_attribute', [Token('SUM','sum')])
        attr_tok = next(
            (t for t in tree_or_tok.scan_values(
                lambda v: isinstance(v, Token) and getattr(v, "type", None) in ("SUM",)
            )),
            None
        )
        if name_tok and attr_tok:
            return f"{name_tok.value}.{attr_tok.value}"
        # fallback (nếu grammar thay đổi)
        return _flatten_tokens_only(tree_or_tok)

    # Các Tree khác (expr, binop, literal, ...) → duyệt đệ quy toàn bộ children
    if isinstance(tree_or_tok, Tree):
        parts = []
        for ch in tree_or_tok.children:
            parts.append(_flatten_expr_with_symbols(ch, sol_symbols))
        s = " ".join([p for p in parts if p is not None])
        # làm sạch spacing
        s = s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
        return s.strip()

    # fallback
    return str(tree_or_tok)

def _collect_calls_in_expr(expr_node: Optional[Tree], sol_symbols: dict) -> List[Dict[str, Any]]:
    """
    Trả về danh sách các "gọi" xuất hiện trong expr:
    - function_call → {"name", "args", "decl_kind": "function"/"state_var"/"unknown", "rendered"}
    - special_var_attribute_call → {"name", "attr", "decl_kind":"state_var_attr", "rendered": "balances.sum"}
    """
    out: List[Dict[str, Any]] = []
    if expr_node is None:
        return out

    # 1) function_call
    for fc in expr_node.iter_subtrees_topdown():
        if not (isinstance(fc, Tree) and fc.data == "function_call"):
            continue
        fname, _ = _get_function_call_info(fc)
        if not fname:
            continue

        exprs_node = next((ch for ch in fc.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        fargs = _split_call_args(exprs_node, sol_symbols) if exprs_node is not None else []

        if fname in sol_symbols.get("state_vars", set()):
            decl_kind = "state_var"
        elif fname in sol_symbols.get("functions", set()):
            decl_kind = "function"
        else:
            decl_kind = "unknown"

        rendered = _render_call(fname, fargs, sol_symbols)
        out.append({
            "name": fname,
            "args": fargs,
            "decl_kind": decl_kind,
            "rendered": rendered
        })

    # 2) special_var_attribute_call
    for sc in expr_node.iter_subtrees_topdown():
        if not (isinstance(sc, Tree) and sc.data == "special_var_attribute_call"):
            continue
        # Tên state var
        name_tok = next(
            (t for t in sc.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")),
            None
        )
        # Thuộc tính (SUM)
        attr_tok = next(
            (t for t in sc.scan_values(
                lambda v: isinstance(v, Token) and getattr(v, "type", None) in ("SUM",)
            )),
            None
        )
        if name_tok and attr_tok:
            rendered = f"{name_tok.value}.{attr_tok.value}"
            out.append({
                "name": name_tok.value,
                "attr": attr_tok.value,
                "decl_kind": "state_var_attr",
                "rendered": rendered
            })

    return out

def _flatten_expr_with_symbols_list(nodes: List[Any], sol_symbols: dict) -> str:
    parts = []
    for n in nodes:
        parts.append(_flatten_expr_with_symbols(n, sol_symbols))
    s = " ".join(parts)
    return s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".").strip()

def _is_atom_token(tok: Token) -> bool:
    return isinstance(tok, Token) and tok.type in _ATOM_TOKEN_TYPES

def _split_call_args(exprs_node: Optional[Tree], sol_symbols: dict) -> List[str]:
    """
    Tách args từ node 'exprs' mà KHÔNG dựa vào comma tồn tại trong AST.
    Chiến lược:
      - Nếu có bất kỳ Tree con (tức là có expr phức tạp) → flatten toàn bộ thành 1 đối số duy nhất.
      - Nếu chỉ có Tokens:
          * Nếu xuất hiện dấu phẩy → dùng logic tách theo ',' (đang có sẵn).
          * Nếu KHÔNG có dấu phẩy:
              - Nếu tất cả tokens đều 'atomic' (ID/number/string/true/false) → mỗi token là MỘT đối số.
              - Ngược lại (thấy toán tử/ngoặc...) → coi là MỘT đối số duy nhất.
    """
    if exprs_node is None:
        return []

    # 1) Nếu có subtree (Tree) → coi như 1 expr (vì không còn delimiter rõ ràng)
    if any(isinstance(ch, Tree) for ch in exprs_node.children):
        # render cả exprs thành 1 đối số
        return [_flatten_expr_with_symbols_list(list(exprs_node.children), sol_symbols).strip()]

    # 2) Chỉ còn Tokens
    toks = [ch for ch in exprs_node.children if isinstance(ch, Token)]
    if not toks:
        return []

    # 2a) Nếu có dấu phẩy trong tokens → tách theo dấu phẩy
    if any(t.value == "," for t in toks):
        args: List[str] = []
        cur: List[Any] = []
        for t in toks:
            if isinstance(t, Token) and t.value == ",":
                if cur:
                    args.append(_flatten_expr_with_symbols_list(cur, sol_symbols))
                    cur = []
            else:
                cur.append(t)
        if cur:
            args.append(_flatten_expr_with_symbols_list(cur, sol_symbols))
        return [a.strip() for a in args]

    # 2b) KHÔNG có dấu phẩy:
    #     - Nếu TẤT CẢ tokens đều là atomic → mỗi token là MỘT đối số.
    #     - Nếu có token không-atomic (toán tử/ngoặc/…): coi toàn bộ là MỘT biểu thức (1 đối số).
    if all(_is_atom_token(t) for t in toks):
        return [t.value for t in toks]  # mỗi token là 1 arg

    # Không thuần atomic → 1 đối số duy nhất
    return [_flatten_expr_with_symbols_list(toks, sol_symbols).strip()]

def parse_spec_to_ir(ast: Tree, sol_symbols: dict) -> Dict[str, Any]:
    """
    Trả về:
    {
      "methods": [{"name":..., "kind":..., "visibility":..., "returns":..., "decl_kind": "function"|"state_var"|"unknown"}, ...],
      "rules": [
         {
           "name": str,
           "steps": [
              {"kind":"define","ghost":"xAfter","type":"mathint","expr":"x + 2","rhs_calls":["x"], ...},
              {"kind":"call","name":"setNextIndex","args":["n"]},
              {"kind":"assert",
               "expr_text":"isSet xAfter",
               "func_calls":[{"name":"isSet","args":["xAfter"],"decl_kind":"state_var","rendered":"isSet[xAfter]"}],
               "message": None}
           ],
           "calls": ["setNextIndex", ...],
           "snapshots": { "xAfter": {"type":"mathint","expr_text":"x + 2","rhs_calls":["x"]} }
         }, ...
      ]
    }
    """
    # ===== methods =====
    methods: List[Dict[str, Any]] = []
    for node in ast.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "method_spec":
            method_name = None
            kind = None
            visibility = None
            returns_type = None
            params_types = None

            # exact/wildcard/catch_...
            exact_pat = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "exact_pattern"), None)
            if exact_pat is not None:
                ids = [t.value for t in exact_pat.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
                if ids:
                    method_name = ids[-1]
                vis_tok = next((t for t in exact_pat.scan_values(lambda v: isinstance(v, Token) and v.type == "VISIBILITY")), None)
                visibility = vis_tok.value if vis_tok is not None else visibility
                kind = "exact"

                # NEW: lấy loại tham số
                params_types = _extract_param_types_from_pattern(exact_pat)

            elif next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "wildcard_pattern"), None) is not None:
                wp = next(ch for ch in node.children if isinstance(ch, Tree) and ch.data == "wildcard_pattern")
                ids = [t.value for t in wp.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
                method_name = ids[-1] if ids else None
                kind = "wildcard"

                # NEW: lấy loại tham số (wildcard_pattern cũng có "( params? )" theo grammar)
                params_types = _extract_param_types_from_pattern(wp)

            elif next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "catch_all_pattern"), None) is not None:
                kind = "catch_all"
                visibility = "external"

            elif next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "catch_unresolved_calls_pattern"), None) is not None:
                kind = "catch_unresolved"
                visibility = "external"

            # returns cvl_type nếu có — nằm là sibling (tree 'cvl_type') của method_spec
            ret_node = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "cvl_type"), None)
            if ret_node is not None:
                returns_type = _flatten_tokens_only(ret_node)

            # decl_kind từ sol_symbols
            if method_name in sol_symbols.get("functions", set()):
                decl_kind = "function"
            elif method_name in sol_symbols.get("state_vars", set()):
                decl_kind = "state_var"
            else:
                decl_kind = "unknown"

            methods.append({
                "name": method_name,
                "kind": kind or "unknown",
                "visibility": visibility,
                "returns": returns_type,
                "decl_kind": decl_kind,
                "params": params_types if params_types is not None else []
            })

    # ===== rules =====
    rules: List[Dict[str, Any]] = []
    for node in ast.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "rule":
            # 1) rule name
            rule_name = None
            for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                rule_name = t.value
                break

            steps: List[Dict[str, Any]] = []
            calls: List[str] = []
            snapshots: Dict[str, Dict[str, Any]] = {}
            # Lấy params của rule (nếu có)
            params_node = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "params"), None)
            rule_params = _extract_rule_params(params_node) if params_node is not None else []


            # 2) Duyệt tất cả statement theo thứ tự xuất hiện (top-down)
            for st in node.iter_subtrees_topdown():
                if not isinstance(st, Tree):
                    continue

                if st.data == "define_statement":
                    # cvl_type ID ("=" expr)? ";"
                    chs = list(st.children)
                    ghost = None
                    ghost_type = None
                    rhs_text = None
                    rhs_calls: List[str] = []
                    observed: Optional[str] = None  # <-- NEW

                    # 1) type
                    cvl_type_node = next((x for x in chs if isinstance(x, Tree) and x.data == "cvl_type"), None)
                    if cvl_type_node is not None:
                        ghost_type = _flatten_tokens_only(cvl_type_node)

                    # 2) ghost name (ID ngay sau type)
                    ghost_tok = None
                    seen_cvl = False
                    for ch in chs:
                        if ch is cvl_type_node:
                            seen_cvl = True
                            continue
                        if seen_cvl and isinstance(ch, Token) and ch.type == "ID":
                            ghost_tok = ch
                            break
                    if ghost_tok is not None:
                        ghost = ghost_tok.value

                    # 3) RHS (expr hoặc function_call)
                    expr_node = next((x for x in chs if isinstance(x, Tree) and x.data in ("expr", "function_call")), None)
                    if expr_node is not None:
                        rhs_text = _flatten_expr_with_symbols(expr_node, sol_symbols)
                        # thu thập tên hàm trong RHS
                        for fc in expr_node.iter_subtrees_topdown():
                            if isinstance(fc, Tree) and fc.data == "function_call":
                                fname, _ = _get_function_call_info(fc)
                                if fname:
                                    rhs_calls.append(fname)

                        # Nếu TOP-LEVEL là function_call & zero-arg → snapshot quan sát biến/hàm 'observed'
                        if isinstance(expr_node, Tree) and expr_node.data == "function_call":
                            zname = _is_zero_arg_function_call(expr_node)
                            if zname:
                                observed = zname  # ví dụ 'x' từ 'x()'

                    # Ghi step (giữ nguyên + observed để debug)
                    steps.append({
                        "kind": "define",
                        "ghost": ghost,
                        "type": ghost_type,
                        "expr": rhs_text,
                        "rhs_calls": rhs_calls,
                        "observed": observed,           
                    })

                    # Ghi snapshot “giàu thông tin” (CHỦ ĐIỂM: thêm 'observed')
                    if ghost:
                        snapshots[ghost] = {
                            "type": ghost_type,
                            "expr_text": rhs_text,
                            "rhs_calls": rhs_calls,
                            "observed": observed,       
                        }

                elif st.data == "funccall_statement":
                    fcall = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "function_call"), None)
                    if fcall is not None:
                        fname, _ = _get_function_call_info(fcall)
                        if fname:
                            exprs_node = next((ch for ch in fcall.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
                            fargs = _split_call_args(exprs_node, sol_symbols)
                            calls.append(fname)
                            steps.append({"kind": "call", "name": fname, "args": fargs})

                elif st.data == "assert_statement":
                    expr_node = None
                    msg = None
                    for ch in st.children:
                        if isinstance(ch, Tree):
                            expr_node = ch
                        if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                            msg = ch.value[1:-1]

                    func_calls = _collect_calls_in_expr(expr_node, sol_symbols)
                    steps.append({
                        "kind": "assert",
                        "expr_text": _flatten_tokens_only(expr_node) if expr_node is not None else "",
                        "func_calls": func_calls,
                        "message": msg
                    })
                
                elif st.data == "require_statement":
                    expr_node = None
                    msg = None
                    for ch in st.children:
                        if isinstance(ch, Tree):
                            expr_node = ch
                        if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                            msg = ch.value[1:-1]

                    func_calls = _collect_calls_in_expr(expr_node, sol_symbols)
                    steps.append({
                        "kind": "require",
                        "expr_text": _flatten_tokens_only(expr_node) if expr_node is not None else "",
                        "func_calls": func_calls,
                        "message": msg
                    })

                elif st.data == "assignment_statement":
                    # bắt mọi ID ở LHS (để phát hiện thay đổi ghost – nếu cần)
                    lhs_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "lhs"), None)
                    targets: List[str] = []
                    if lhs_node is not None:
                        for t in lhs_node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                            targets.append(t.value)
                    steps.append({"kind": "assign", "targets": targets})

            rules.append({
                "name": rule_name,
                "params": rule_params,   # <-- NEW
                "steps": steps,
                "calls": calls,
                "snapshots": snapshots,
            })

    # ==== invariant_rules ====
    invariants: List[Dict[str, Any]] = []
    for node in ast.iter_subtrees_topdown():
        if not (isinstance(node, Tree) and node.data == "invariant_rule"):
            continue

        inv_name_tok = next((t for t in node.children if isinstance(t, Token) and t.type == "ID"), None)
        inv_name = inv_name_tok.value if inv_name_tok else "<unnamed_invariant>"

        steps: List[Dict[str, Any]] = []
        # Duyệt block bên trong invariant_rule giống như rule
        for st in node.iter_subtrees_topdown():
            if not isinstance(st, Tree):
                continue

            if st.data == "assert_statement":
                expr_node = None
                msg = None
                for ch in st.children:
                    if isinstance(ch, Tree):
                        expr_node = ch
                    if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                        msg = ch.value[1:-1]
                func_calls = _collect_calls_in_expr(expr_node, sol_symbols)
                steps.append({
                    "kind": "assert",
                    "expr_text": _flatten_tokens_only(expr_node) if expr_node is not None else "",
                    "func_calls": func_calls,
                    "message": msg
                })

            elif st.data == "require_statement":
                expr_node = None
                msg = None
                for ch in st.children:
                    if isinstance(ch, Tree):
                        expr_node = ch
                    if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                        msg = ch.value[1:-1]
                func_calls = _collect_calls_in_expr(expr_node, sol_symbols)
                steps.append({
                    "kind": "require",
                    "expr_text": _flatten_tokens_only(expr_node) if expr_node is not None else "",
                    "func_calls": func_calls,
                    "message": msg
                })

            elif st.data == "define_statement":
                # Cho phép define/havoc… bên trong invariant block nếu bạn muốn giữ nguyên
                chs = list(st.children)
                ghost = None
                ghost_type = None
                rhs_text = None
                rhs_calls: List[str] = []
                observed: Optional[str] = None

                cvl_type_node = next((x for x in chs if isinstance(x, Tree) and x.data == "cvl_type"), None)
                if cvl_type_node is not None:
                    ghost_type = _flatten_tokens_only(cvl_type_node)

                ghost_tok = None
                seen_cvl = False
                for ch in chs:
                    if ch is cvl_type_node:
                        seen_cvl = True
                        continue
                    if seen_cvl and isinstance(ch, Token) and ch.type == "ID":
                        ghost_tok = ch
                        break
                if ghost_tok is not None:
                    ghost = ghost_tok.value

                expr_node = next((x for x in chs if isinstance(x, Tree) and x.data in ("expr", "function_call", "special_var_attribute_call")), None)
                if expr_node is not None:
                    rhs_text = _flatten_expr_with_symbols(expr_node, sol_symbols)
                    for fc in expr_node.iter_subtrees_topdown():
                        if isinstance(fc, Tree) and fc.data == "function_call":
                            fname, _ = _get_function_call_info(fc)
                            if fname:
                                rhs_calls.append(fname)
                    if isinstance(expr_node, Tree) and expr_node.data == "function_call":
                        zname = _is_zero_arg_function_call(expr_node)
                        if zname:
                            observed = zname

                steps.append({
                    "kind": "define",
                    "ghost": ghost,
                    "type": ghost_type,
                    "expr": rhs_text,
                    "rhs_calls": rhs_calls,
                    "observed": observed,
                })

        invariants.append({
            "name": inv_name,
            "steps": steps
        })
    
    return {"methods": methods, "rules": rules, "invariants": invariants}
