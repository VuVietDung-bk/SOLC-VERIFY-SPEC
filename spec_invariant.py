import re
from lark import Tree, Token
from copy import deepcopy
from parser_utils import (
    _get_function_call_info,
    _is_zero_arg_function_call,
    _flatten_expr_with_symbols,
    to_text
)
from logic_utils import (
    wrap_expr,
    make_eq_expr,
    unique_exprs,
)
from typing import Dict, List, Optional, Any
from spec_method import Step, Variable

'''
    TO-DO:
        - Xử lý phần forall và exist để giải được Test7
'''

class Invariant:
    _COMPARE_TOKENS = ["==", "!=", "<=", ">=", "<", ">"]

    def __init__(self, ast_node: Tree, variables: List[Variable], sol_symbols: Dict[str, Any]):
        self.name: str = "<unnamed_invariant>"
        self.steps: List[Step] = []
        # Map variable name -> declared type string (possibly None)
        self.variables = variables
        self._parse(ast_node, sol_symbols)

    def _parse(self, node: Tree, sol_symbols: Dict[str, Any]):
        # --- Invariant name ---
        inv_name_tok = next((t for t in node.children if isinstance(t, Token) and t.type == "ID"), None)
        if inv_name_tok:
            self.name = inv_name_tok.value

        # --- Steps ---
        for st in node.iter_subtrees_topdown():
            if not isinstance(st, Tree):
                continue

            if st.data == "assert_statement":
                expr_node, msg = None, None
                for ch in st.children:
                    if isinstance(ch, Tree):
                        expr_node = ch
                    if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                        msg = ch.value[1:-1]

                self.steps.append(Step("assert", {
                    "expr_text": to_text(expr_node) if expr_node else "",
                    "message": msg
                }, st))

            elif st.data == "define_statement":
                chs = list(st.children)
                ghost, ghost_type, rhs_text = None, None, None
                rhs_calls: List[str] = []
                observed: Optional[str] = None

                cvl_type_node = next((x for x in chs if isinstance(x, Tree) and x.data == "cvl_type"), None)
                if cvl_type_node:
                    ghost_type = to_text(cvl_type_node)

                ghost_tok = None
                seen_cvl = False
                for ch in chs:
                    if ch is cvl_type_node:
                        seen_cvl = True
                        continue
                    if seen_cvl and isinstance(ch, Token) and ch.type == "ID":
                        ghost_tok = ch
                        break
                if ghost_tok:
                    ghost = ghost_tok.value

                expr_node = next((x for x in chs if isinstance(x, Tree) and x.data in ("expr", "logic_bi_expr", "compare_bi_expr", "bi_expr", "unary_expr", "function_call")), None)
                if expr_node:
                    rhs_text = to_text(expr_node)
                    for fc in expr_node.iter_subtrees_topdown():
                        if isinstance(fc, Tree) and fc.data == "function_call":
                            fname, _ = _get_function_call_info(fc)
                            if fname:
                                rhs_calls.append(fname)

                    if isinstance(expr_node, Tree) and expr_node.data == "function_call":
                        zname = _is_zero_arg_function_call(expr_node) # TO-DO-1
                        if zname:
                            observed = zname
                else :
                    id_node: Token = chs[2] if len(chs) >=3 else None
                    rhs_text = id_node.value if id_node else ""

                self.steps.append(Step("define", {
                    "ghost": ghost,
                    "type": ghost_type,
                    "expr": rhs_text,
                    "rhs_calls": rhs_calls,
                    "observed": observed,
                }, st)) 

    def to_invariants(self) -> List[str]:
        # Khởi tạo map biến → giá trị đại diện (Token/Tree/str)
        var_to_value: Dict[str, Any] = {}

        inv: List[str] = []
        assert_steps: List[Step] = []

        def _subst_expr(expr_node: Optional[Tree], skip=None) -> Optional[Tree]:
            if expr_node is None:
                return None
            skip_set = set(skip) if skip else set()
            from logic_utils import subst_expr
            subst_map: Dict[str, Any] = {}
            for v, val in var_to_value.items():
                if val is None or v in skip_set:
                    continue
                subst_map[v] = val if isinstance(val, (Tree, Token)) else Token("ID", str(val))
            return subst_expr(deepcopy(expr_node), subst_map)

        def _rhs_node_from_step(step: Step) -> Optional[Tree]:
            node = step.node
            if not isinstance(node, Tree):
                return None
            rhs = None
            for ch in node.children:
                if isinstance(ch, Tree) and ch.data in ("expr", "logic_bi_expr", "compare_bi_expr", "bi_expr", "unary_expr", "function_call"):
                    rhs = ch
            if not rhs:
                if len(node.children) >= 3:
                    id_node: Token = node.children[2]
                    return id_node
                elif node.data == "assign_statement" and len(node.children) >= 2:
                    id_node: Token = node.children[1]
                    return id_node
            return rhs

        def _require_expr_from_step(step: Step) -> Optional[Tree]:
            node = step.node
            if not isinstance(node, Tree):
                return None
            for ch in node.children:
                if isinstance(ch, Tree):
                    return ch
                if isinstance(ch, Token) and ch.type == "ID":
                    return Tree("expr", [Token(ch.type, ch.value)])
            return None

        def _call_names(expr_node: Optional[Tree]) -> List[str]:
            if expr_node is None or not isinstance(expr_node, Tree):
                return []
            names: List[str] = []
            for fc in expr_node.iter_subtrees_topdown():
                if isinstance(fc, Tree) and fc.data == "function_call":
                    fname, _ = _get_function_call_info(fc)
                    if fname:
                        names.append(fname)
            return names

        def _replace_call(expr_node: Optional[Tree], fn: str, ret_name: str) -> Optional[Tree]:
            if expr_node is None:
                return None
            if isinstance(expr_node, Token):
                return expr_node
            if isinstance(expr_node, Tree) and expr_node.data == "function_call":
                fname, _ = _get_function_call_info(expr_node)
                if fname == fn:
                    return Token("ID", ret_name)
            if isinstance(expr_node, Tree):
                new_children = [_replace_call(ch, fn, ret_name) for ch in expr_node.children]
                return Tree(expr_node.data, new_children)
            return expr_node

        for step in self.steps:
            if step.kind == "define":
                ghost = step.data.get("ghost")
                rhs_node = _rhs_node_from_step(step)
                called_fn = None
                if not ghost:
                    continue
                if ghost in var_to_value:
                    raise SystemExit(f"\033[91m[ERROR] Variable '{ghost}' declared twice in rule '{self.name}'.\033[0m")
                if isinstance(rhs_node, Tree):
                    call_names = _call_names(rhs_node)
                    if len(call_names) > 1:
                        raise SystemExit(f"\033[91m[ERROR] Multiple function calls detected in assignment of rule '{self.name}'.\033[0m")
                    called_fn = call_names[0] if call_names else None
                if called_fn:
                    raise SystemExit(f"\033[91m[ERROR] Function calls detected in invariant '{self.name}'.\033[0m")
                else:
                    var_to_value[ghost] = _subst_expr(rhs_node, skip=[ghost]) or rhs_node

            elif step.kind == "assign":
                targets = step.data.get("targets", [])
                rhs_node = _rhs_node_from_step(step)
                called_fn = None
                if isinstance(rhs_node, Tree):
                    call_names = _call_names(rhs_node)
                    if len(call_names) > 1:
                        raise SystemExit(f"\033[91m[ERROR] Multiple function calls detected in assignment of rule '{self.name}'.\033[0m")
                    called_fn = call_names[0] if call_names else None
                if called_fn:
                    raise SystemExit(f"\033[91m[ERROR] Function calls detected in invariant '{self.name}'.\033[0m")
                else:
                    rhs_subst = _subst_expr(rhs_node, skip=targets)
                    for tgt in targets:
                        var_to_value[tgt] = deepcopy(rhs_subst) if rhs_subst is not None else rhs_node

            elif step.kind == "assert":
                assert_steps.append(step)

        for step in assert_steps:
            expr_node = _require_expr_from_step(step)
            expr_subst = _subst_expr(expr_node)
            cond_expr = expr_subst or expr_node
            if cond_expr:
                inv.append(to_text(cond_expr))

        return inv

    def __repr__(self):
        return f"<Invariant name={self.name} steps={len(self.steps)}>"
