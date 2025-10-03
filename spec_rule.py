from typing import List, Dict, Any, Optional, Tuple
from lark import Tree, Token
from spec_parser import (
    _extract_rule_params,
    _get_function_call_info,
    _is_zero_arg_function_call,
    _split_call_args,
    _flatten_expr_with_symbols,
    _flatten_tokens_only,
    _collect_call_like_from_expr
)
from spec_method import Method, Step

class Rule:
    def __init__(self, ast_node: Tree, methods: Dict[str, "Method"], sol_symbols: Dict[str, Any]):
        self.name: str = "<unnamed>"
        self.params: List[Dict[str, str]] = []
        self.steps: List[Step] = []
        self.calls: List[str] = []
        self.snapshots: Dict[str, Dict[str, Any]] = {}

        self._parse(ast_node, methods, sol_symbols)

    def _parse(self, node: Tree, methods: Dict[str, "Method"], sol_symbols: Dict[str, Any]):
        # --- Rule name ---
        for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
            self.name = t.value
            break

        # --- Params ---
        params_node = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "params"), None)
        if params_node is not None:
            self.params = _extract_rule_params(params_node)

        # --- Steps ---
        for st in node.iter_subtrees_topdown():
            if not isinstance(st, Tree):
                continue

            if st.data == "define_statement":
                self._handle_define(st, sol_symbols)
            elif st.data == "funccall_statement":
                self._handle_call(st, sol_symbols)
            elif st.data == "assert_statement":
                self._handle_assert(st, sol_symbols)
            elif st.data == "require_statement":
                self._handle_require(st, sol_symbols)
            elif st.data == "assignment_statement":
                self._handle_assign(st)
            elif st.data == "assert_modify_statement":
                self._handle_assert_modify(st, sol_symbols)

    # --- Handlers for each statement type ---
    def _handle_define(self, st: Tree, sol_symbols: Dict[str, Any]):
        chs = list(st.children)
        ghost, ghost_type, rhs_text = None, None, None
        rhs_calls: List[str] = []
        observed: Optional[str] = None

        cvl_type_node = next((x for x in chs if isinstance(x, Tree) and x.data == "cvl_type"), None)
        if cvl_type_node:
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
        if ghost_tok:
            ghost = ghost_tok.value

        expr_node = next((x for x in chs if isinstance(x, Tree) and x.data in ("expr", "function_call")), None)
        if expr_node:
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

        self.steps.append(Step("define", {
            "ghost": ghost,
            "type": ghost_type,
            "expr": rhs_text,
            "rhs_calls": rhs_calls,
            "observed": observed,
        }))

        if ghost:
            self.snapshots[ghost] = {
                "type": ghost_type,
                "expr_text": rhs_text,
                "rhs_calls": rhs_calls,
                "observed": observed,
            }

    def _handle_call(self, st: Tree, sol_symbols: Dict[str, Any]):
        fcall = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "function_call"), None)
        if not fcall:
            return
        fname, _ = _get_function_call_info(fcall)
        if not fname:
            return
        exprs_node = next((ch for ch in fcall.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        fargs = _split_call_args(exprs_node, sol_symbols)
        self.calls.append(fname)
        self.steps.append(Step("call", {"name": fname, "args": fargs}))

    def _handle_assert(self, st: Tree, sol_symbols: Dict[str, Any]):
        expr_node, msg = None, None
        for ch in st.children:
            if isinstance(ch, Tree):
                expr_node = ch
            if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                msg = ch.value[1:-1]

        func_calls = _collect_call_like_from_expr(expr_node, sol_symbols)
        self.steps.append(Step("assert", {
            "expr_text": _flatten_tokens_only(expr_node) if expr_node else "",
            "func_calls": func_calls,
            "message": msg
        }))

    def _handle_require(self, st: Tree, sol_symbols: Dict[str, Any]):
        expr_node, msg = None, None
        for ch in st.children:
            if isinstance(ch, Tree):
                expr_node = ch
            if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                msg = ch.value[1:-1]

        func_calls = _collect_call_like_from_expr(expr_node, sol_symbols)
        self.steps.append(Step("require", {
            "expr_text": _flatten_tokens_only(expr_node) if expr_node else "",
            "func_calls": func_calls,
            "message": msg
        }))

    def _handle_assign(self, st: Tree):
        lhs_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "lhs"), None)
        targets: List[str] = []
        if lhs_node:
            for t in lhs_node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                targets.append(t.value)
        self.steps.append(Step("assign", {"targets": targets}))

    def _handle_assert_modify(self, st: Tree, sol_symbols: Dict[str, Any]):
        target_name = next((t.value for t in st.children if isinstance(t, Token) and t.type == "ID"), None)
        param_types: List[str] = []
        params_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "params"), None)
        if params_node:
            for tnode in params_node.scan_values(lambda v: isinstance(v, Tree) and v.data == "cvl_type"):
                param_types.append(_flatten_tokens_only(tnode))
        extra_expr_node = None
        for ch in st.children:
            if isinstance(ch, Tree) and ch.data == "expr":
                extra_expr_node = ch
        extra_func_calls = _collect_call_like_from_expr(extra_expr_node, sol_symbols)

        self.steps.append(Step("assert_modify", {
            "target": target_name,
            "param_types": param_types,
            "extra_expr_text": _flatten_tokens_only(extra_expr_node) if extra_expr_node else None,
            "extra_func_calls": extra_func_calls
        }))

    # === BƯỚC 6: sinh hậu-điều-kiện ===
    def to_postconditions(self) -> List[str]:
        posts: List[str] = []

        # --- A) Mapping-like assertions ---
        def _resolve_arg(a: str) -> str:
            info = self.snapshots.get(a)
            if isinstance(info, dict):
                et = info.get("expr_text")
                if et:
                    return et
            return a

        for st in self.steps:
            if st.kind != "assert":
                continue
            for fc in st.data.get("func_calls", []):
                if fc.get("decl_kind") == "state_var":
                    name = fc.get("name")
                    args = fc.get("args", [])
                    if not name:
                        continue
                    if len(args) == 0:
                        posts.append(f"{name}")
                    elif len(args) == 1:
                        resolved = [_resolve_arg(a) for a in args]
                        posts.append(f"{name}[{', '.join(resolved)}]")
                    else:
                        resolved = [_resolve_arg(a) for a in args]
                        posts.append(f"{name}[" + "][".join(resolved) + "]")

        # --- B) Relational/delta assertions ---
        simple_snaps: Dict[str, str] = {}
        for g, info in self.snapshots.items():
            if isinstance(info, dict) and info.get("observed"):
                simple_snaps[g] = info["observed"]

        for st in self.steps:
            if st.kind != "assert":
                continue
            expr = st.data.get("expr_text", "") or st.data.get("text", "") or ""
            eq = self._infer_total_change_post(expr, simple_snaps)
            if eq:
                posts.append(eq)
                continue
            rel = self._infer_rel_post(expr, simple_snaps)
            if rel:
                posts.append(rel)

        # unique giữ thứ tự
        seen, out = set(), []
        for p in posts:
            if p not in seen:
                seen.add(p)
                out.append(p)
        return out

    # === helpers (private) ===
    @staticmethod
    def _infer_total_change_post(assert_text: str, snapshots: Dict[str, str]) -> Optional[str]:
        s = assert_text.strip()
        if "==" not in s:
            return None
        left, right = [p.strip() for p in s.split("==", 1)]

        def parse_minus(expr: str) -> Optional[Tuple[str, str]]:
            if " - " not in expr:
                return None
            a, b = expr.split(" - ", 1)
            a, b = a.strip(), b.strip()
            if a in snapshots:
                return snapshots[a], b
            return None

        if left in snapshots:
            pr = parse_minus(right)
            if pr and pr[0] == snapshots[left]:
                obs, expr_total = pr
                return f"__verifier_old_uint({obs}) == {obs} - {expr_total}"
        if right in snapshots:
            pl = parse_minus(left)
            if pl and pl[0] == snapshots[right]:
                obs, expr_total = pl
                return f"{obs} - {expr_total} == __verifier_old_uint({obs})"
        return None

    @staticmethod
    def _infer_rel_post(assert_text: str, snapshots: Dict[str, str]) -> Optional[str]:
        s = assert_text.strip()
        ops = ["<=", ">=", "==", "!=", "<", ">"]
        op = next((o for o in ops if f" {o} " in s), None)
        if not op:
            return None
        left, right = [p.strip() for p in s.split(f" {op} ", 1)]
        if left not in snapshots or right not in snapshots:
            return None
        obsL, obsR = snapshots[left], snapshots[right]
        if obsL != obsR:
            return None
        return f"__verifier_old_uint({obsL}) {op} {obsR}"
    
    def __repr__(self):
        return f"<Rule name={self.name} steps={len(self.steps)} calls={self.calls} snapshots={self.snapshots}>"