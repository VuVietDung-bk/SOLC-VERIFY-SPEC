from typing import Any, Dict, List, Optional, Tuple
from lark import Tree, Token

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

def _get_function_call_info(call_tree: Tree) -> Tuple[Optional[str], List[str]]:
    """function_call: (ID ".")? ID ("@" CALL_MODIFIER)? "(" exprs? ")" ("at" ID)? → (name, args)"""
    children = list(call_tree.children)
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx] if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None

    def _extract_args(exprs_tree: Optional[Tree]) -> List[str]:
        if exprs_tree is None:
            return []
        args, cur = [], []
        for ch in exprs_tree.children:
            if isinstance(ch, Token) and ch.value == ",":
                if cur:
                    arg = " ".join(_flatten_expr(x) for x in cur).strip()
                    args.append(arg); cur = []
            else:
                cur.append(ch)
        if cur:
            arg = " ".join(_flatten_expr(x) for x in cur).strip()
            args.append(arg)
        return args

    args = _extract_args(exprs_node)
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

def parse_spec_to_ir(ast: Tree) -> Dict[str, Any]:
    methods = []
    # ----- METHODS -----
    for node in ast.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "method_spec":
            method_name = None
            kind = None
            visibility = None
            returns_type = None

            # 1) Tìm pattern con (exact/wildcard/catch...)
            pattern_node = next(
                (ch for ch in node.children
                 if isinstance(ch, Tree) and ch.data in (
                     "exact_pattern", "wildcard_pattern",
                     "catch_all_pattern", "catch_unresolved_calls_pattern")),
                None
            )

            # 2) Lấy name/kind/visibility từ pattern
            if pattern_node is not None:
                ids_in_pat = [t.value for t in pattern_node.scan_values(
                    lambda v: isinstance(v, Token) and v.type == "ID"
                )]

                if pattern_node.data == "exact_pattern":
                    # (ID ".")? ID → nếu có 2 ID thì cái thứ 2 là tên hàm; không thì dùng ID duy nhất
                    if len(ids_in_pat) >= 2:
                        method_name = ids_in_pat[-1]
                    elif len(ids_in_pat) == 1:
                        method_name = ids_in_pat[0]
                    kind = "exact"

                elif pattern_node.data == "wildcard_pattern":
                    method_name = ids_in_pat[-1] if ids_in_pat else None
                    kind = "wildcard"

                elif pattern_node.data == "catch_all_pattern":
                    kind = "catch_all"
                    visibility = "external"

                elif pattern_node.data == "catch_unresolved_calls_pattern":
                    kind = "catch_unresolved"
                    visibility = "external"

                # VISIBILITY token (nếu có) nằm trong pattern
                vis_tok = next((t.value for t in pattern_node.scan_values(
                    lambda v: isinstance(v, Token) and getattr(v, "type", None) == "VISIBILITY"
                )), None)
                if vis_tok:
                    visibility = vis_tok

            # 3) Lấy returns type: cvl_type là CON TRỰC TIẾP của method_spec
            #    (không đụng vào cvl_type nằm trong params của exact_pattern)
            top_level_returns = next(
                (ch for ch in node.children if isinstance(ch, Tree) and ch.data == "cvl_type"),
                None
            )
            if top_level_returns is not None:
                returns_type = _flatten_expr(top_level_returns)

            methods.append({
                "name": method_name,
                "kind": kind or "unknown",
                "visibility": visibility,
                "returns": returns_type
            })

    rules: List[Dict[str, Any]] = []
    for node in ast.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "rule":
            rule_name = None
            for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                rule_name = t.value; break

            steps: List[Dict[str, Any]] = []
            calls: List[str] = []
            snapshots: Dict[str, str] = {}

            for sub in node.iter_subtrees_topdown():
                if not isinstance(sub, Tree):
                    continue
                if sub.data == "define_statement":
                    ghost = None; ghost_type = None
                    rhs_text = None; rhs_calls: List[str] = []
                    rhs_call_name = None
                    chs = list(sub.children)
                    cvl_type_node = next((ch for ch in chs if isinstance(ch, Tree) and ch.data == "cvl_type"), None)
                    if cvl_type_node is not None:
                        ghost_type = _flatten_expr(cvl_type_node)
                    ghost_tok = None; seen_cvl = False
                    for ch in chs:
                        if ch is cvl_type_node:
                            seen_cvl = True; continue
                        if seen_cvl and isinstance(ch, Token) and ch.type == "ID":
                            ghost_tok = ch; break
                    if ghost_tok is not None:
                        ghost = ghost_tok.value
                    expr_node = next((ch for ch in chs if isinstance(ch, Tree) and ch.data in ("expr","function_call")), None)
                    if expr_node is not None:
                        rhs_text = _flatten_expr(expr_node)
                        for fc in expr_node.iter_subtrees_topdown():
                            if isinstance(fc, Tree) and fc.data == "function_call":
                                fname, _ = _get_function_call_info(fc)
                                if fname: rhs_calls.append(fname)
                        if isinstance(expr_node, Tree) and expr_node.data == "function_call":
                            z = _is_zero_arg_function_call(expr_node)
                            if z and ghost:
                                rhs_call_name = z
                                snapshots[ghost] = z
                    steps.append({
                        "kind":"define","ghost":ghost,"type":ghost_type,
                        "expr":rhs_text,"rhs_calls":rhs_calls,"rhs_call":rhs_call_name
                    })
                elif sub.data == "funccall_statement":
                    fcall = next((ch for ch in sub.children if isinstance(ch, Tree) and ch.data == "function_call"), None)
                    if fcall is not None:
                        fname, fargs = _get_function_call_info(fcall)
                        if fname:
                            calls.append(fname)
                            steps.append({"kind":"call","name":fname,"args":fargs})
                elif sub.data == "assert_statement":
                    expr_node = None; msg = None
                    for ch in sub.children:
                        if isinstance(ch, Tree): expr_node = ch
                        if isinstance(ch, Token) and ch.type == "STRING_LITERAL": msg = ch.value[1:-1]
                    expr_txt = _flatten_expr(expr_node) if expr_node is not None else ""
                    steps.append({"kind":"assert","text":expr_txt,"message":msg})
                elif sub.data == "assignment_statement":
                    lhs_node = next((ch for ch in sub.children if isinstance(ch, Tree) and ch.data == "lhs"), None)
                    targets: List[str] = []
                    if lhs_node is not None:
                        for t in lhs_node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                            targets.append(t.value)
                    steps.append({"kind":"assign","targets":targets})

            rules.append({"name":rule_name,"steps":steps,"calls":calls,"snapshots":snapshots})

    return {"methods": methods, "rules": rules}
