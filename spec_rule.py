from typing import List, Dict, Any, Optional, Tuple
from lark import Tree, Token
from parser_utils import (
    _extract_rule_params,
    _get_function_call_info,
    _is_zero_arg_function_call,
    _split_call_args,
    _flatten_expr_with_symbols,
    to_text,
    _collect_call_like_from_expr,
    to_text
)
from spec_method import Method, Step

"""
    TO-DO:
    - Tạo hàm to_preconditions() từ require_statement và call_statement, cụ thể ví dụ:
        + Gọi f(1) thì có precondition n == 1
        + Hàm define f(uint n) mà gọi f(n) thì phải gắn snapshot n <=> m
    - TO-DO-1: Observe tất cả các loại call state_var. Nếu là function call thì observe biến return value của hàm
    - Xử lý chỗ verifier_old_uint trong assert, phải so sánh vị trí define snapshot với vị trí của function call (hiện tại đang so sánh 2 vị trí với nhau)
    - Câu lệnh forall exist
    - Chỉnh lại phần snapshot để ghi nhớ những biến được truyền vào hàm.
    - Xử lý cú pháp if-else bằng cách tạo một hàm biến cú pháp if-else thành List[List[Step]], đồng thời ghi nhận điều kiện rẽ nhánh tương tự một require statement
"""

class Rule:
    def __init__(self, ast_node: Tree, methods: Dict[str, "Method"], sol_symbols: Dict[str, Any]):
        self.name: str = "<unnamed>"
        self.params: List[Dict[str, str]] = []
        self.steps: List[Step] = []
        self.calls: List[str] = []
        self.snapshots: Dict[str, Dict[str, Any]] = {}

        self._parse(ast_node, methods, sol_symbols)

    def _parse(self, node: Tree, methods, sol_symbols):
        self.name = next(node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"))
        params_node = next((c for c in node.children if isinstance(c, Tree) and c.data == "params"), None)
        if params_node:
            self.params = _extract_rule_params(params_node)

        # Lấy block chính của rule
        block_node = next((c for c in node.children if isinstance(c, Tree) and c.data == "block"), None)
        if block_node:
            self.steps = self._parse_block(block_node, methods, sol_symbols)

    def _parse_block(self, block_node: Tree, methods, sol_symbols) -> List[Step]:
        steps = []
        for st in block_node.children:
            if isinstance(st, Tree):
                result = self._parse_statement(st, methods, sol_symbols)
                if result:
                    steps.extend(result)

        return steps

    def _parse_statement(self, st: Tree, methods, sol_symbols) -> List[Step]:

        kind = st.data

        if kind == "define_statement":
            return [self._handle_define(st, sol_symbols)]

        elif kind == "require_statement":
            return [self._handle_require(st, sol_symbols)]

        elif kind == "assert_statement":
            return [self._handle_assert(st, sol_symbols)]

        elif kind == "assignment_statement":
            return [self._handle_assign(st)]

        elif kind == "funccall_statement":
            return [self._handle_call(st, sol_symbols)]

        elif kind == "assert_modify_statement":
            return [self._handle_assert_modify(st, sol_symbols)]

        elif kind == "assert_revert_statement":
            return [self._handle_assert_revert(st, sol_symbols)]

        elif kind == "assert_emit_statement":
            return [self._handle_assert_emit(st, sol_symbols)]

        elif kind == "emits_statement":
            return [self._handle_emits(st, sol_symbols)]
        
        elif kind == "ifelse_statement":
            return [self._parse_ifelse(st, methods, sol_symbols)]

        elif kind == "block_statement":
            block = next(ch for ch in st.children if isinstance(ch, Tree) and ch.data == "block")
            return self._parse_block(block, methods, sol_symbols)
        
        else:
            return None

    # --- Handlers for each statement type ---
    def _handle_define(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
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

        expr_node = next((x for x in chs if isinstance(x, Tree) and x.data in ("expr", "function_call")), None)
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

        if ghost:
            self.snapshots[ghost] = {
                "type": ghost_type,
                "expr_text": rhs_text,
                "rhs_calls": rhs_calls,
                "observed": observed,
            }

        return Step("define", {
            "ghost": ghost,
            "type": ghost_type,
            "expr": rhs_text,
            "rhs_calls": rhs_calls,
            "observed": observed,
        }, st)

    def _handle_call(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        fcall = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "function_call"), None)
        if not fcall:
            return
        fname, _ = _get_function_call_info(fcall)
        if not fname:
            return
        exprs_node = next((ch for ch in fcall.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        fargs = _split_call_args(exprs_node, sol_symbols)
        self.calls.append(fname)
        return Step("call", {"name": fname, "args": fargs}, st)

    def _handle_assert(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        expr_node, msg = None, None
        for ch in st.children:
            if isinstance(ch, Tree):
                expr_node = ch
            if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                msg = ch.value[1:-1]

        func_calls = _collect_call_like_from_expr(expr_node, sol_symbols)
        return Step("assert", {
            "expr_text": to_text(expr_node) if expr_node else "",
            "func_calls": func_calls,
            "message": msg
        }, st)

    def _handle_require(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        expr_node, msg = None, None
        for ch in st.children:
            if isinstance(ch, Tree):
                expr_node = ch
            if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                msg = ch.value[1:-1]

        func_calls = _collect_call_like_from_expr(expr_node, sol_symbols)
        return Step("require", {
            "expr_text": to_text(expr_node) if expr_node else "",
            "func_calls": func_calls,
            "message": msg
        }, st)

    def _handle_assign(self, st: Tree) -> Step:
        lhs_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "lhs"), None)
        targets: List[str] = []
        if lhs_node:
            for t in lhs_node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                targets.append(t.value)
        return Step("assign", {"targets": targets}, st)

    def _handle_assert_modify(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        
        # Extract condition and message
        extra_expr_node = None
        message = None
        
        for ch in st.children:
            if isinstance(ch, Tree):
                if ch.data != "modify_var":
                    extra_expr_node = ch
                else: target_node = ch
            elif isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                message = ch.value[1:-1]  # Remove quotes

        return Step("assert_modify", {
            "target": to_text(target_node) if target_node else None,
            "expr_text": to_text(extra_expr_node) if extra_expr_node else None,
            "message": message  # Added message field
        }, st)

    def _handle_assert_revert(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        message = None
        extra_expr_node = None
        
        for ch in st.children:
            if isinstance(ch, Tree):
                extra_expr_node = ch
            elif isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                message = ch.value[1:-1]

        return Step("assert_revert", {
            "expr_text": to_text(extra_expr_node) if extra_expr_node else None,
            "message": message
        }, st)

    def _handle_assert_emit(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        event_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "event_call"), None)
        msg = None

        if not event_node:
            return

        # Lấy tên event
        event_name_tok = next(event_node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"), None)
        event_name = event_name_tok.value if event_name_tok else None

        # Lấy args
        exprs_node = next((ch for ch in event_node.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        args = _split_call_args(exprs_node, sol_symbols)

        # Optional message
        for ch in st.children:
            if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                msg = ch.value[1:-1]

        return Step("assert_emit", {
            "event": event_name,
            "args": args,
            "message": msg
        }, st)

    def _handle_emits(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        event_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "event_call"), None)
        if not event_node:
            return

        event_name_tok = next(event_node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"), None)
        event_name = event_name_tok.value if event_name_tok else None

        exprs_node = next((ch for ch in event_node.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        args = _split_call_args(exprs_node, sol_symbols)

        return Step("emits", {
            "event": event_name,
            "args": args,
        }, st)

    def _parse_ifelse(self, node:Tree, methods, sol_symbols) -> Step:
        cond_expr = node.children[0]
        then_stmt = node.children[1]
        else_stmt = node.children[2] if len(node.children) == 3 else None

        cond_text = to_text(cond_expr)

        then_steps = self._parse_statement(then_stmt, methods, sol_symbols)
        if not isinstance(then_steps, list):
            then_steps = [then_steps]

        if else_stmt:
            else_steps = self._parse_statement(else_stmt, methods, sol_symbols)
            if not isinstance(else_steps, list):
                else_steps = [else_steps]
        else:
            else_steps = []

        return Step("ifelse", {
            "cond": cond_text,
            "then": then_steps,
            "else": else_steps
        }, node)
    
    # Hàm sinh tất cả path từ đầu đến cuối Rule
    def get_all_paths(self) -> List[List[Step]]:
        all_paths: List[List[Step]] = []
        # DFS qua danh sách step, bung rộng if-else thành các path tuyến tính
        def _normalize(seq):
            """Đảm bảo seq là List[Step] phẳng."""
            if seq is None:
                return []
            if isinstance(seq, list):
                out = []
                for s in seq:
                    if isinstance(s, list):
                        out.extend(_normalize(s))
                    else:
                        out.append(s)
                return out
            return [seq]

        def _dfs(remaining: List[Step], acc: List[Step]):
            if not remaining:
                all_paths.append(list(acc))
                return

            cur, rest = remaining[0], remaining[1:]
            if cur.kind == "ifelse":
                from copy import deepcopy
                from logic_utils import negative

                cond_text = cur.data.get("cond", "")
                then_steps = _normalize(cur.data.get("then"))
                else_steps = _normalize(cur.data.get("else"))

                cond_node = None
                if isinstance(cur.node, Tree) and cur.node.children:
                    cond_node = cur.node.children[0]

                then_node = Tree("require_statement", [deepcopy(cond_node)]) if cond_node else cur.node
                # Nhánh then: yêu cầu điều kiện đúng
                then_require = Step("require", {
                    "expr_text": cond_text,
                    "func_calls": [],
                    "message": None
                }, then_node)
                _dfs(then_steps + rest, acc + [then_require])

                # Nhánh else: điều kiện sai
                neg_expr = negative(deepcopy(cond_node)) if cond_node else None
                else_cond = to_text(neg_expr) if neg_expr is not None else ""
                else_node = Tree("require_statement", [neg_expr]) if neg_expr is not None else cur.node
                else_require = Step("require", {
                    "expr_text": else_cond,
                    "func_calls": [],
                    "message": None
                }, else_node)
                _dfs(else_steps + rest, acc + [else_require])
            else:
                _dfs(rest, acc + [cur])

        _dfs(self.steps, [])
        return all_paths
    
    # Hàm lấy precond từ 1 path
    def get_preconditions_from_path(self, steps: List[Step]) -> Dict[str, List[str]]:
        import re
        # Khởi tạo map biến → giá trị đại diện
        var_to_value: Dict[str, Optional[str]] = {}
        for p in self.params:
            if isinstance(p, dict) and p.get("name"):
                var_to_value[p["name"]] = None

        preconds: List[str] = []
        func_name: Optional[str] = None
        unknown_call = False

        def _subst(text: Optional[str]) -> Optional[str]:
            if text is None:
                return None
            out = text
            for v, val in var_to_value.items():
                if val is None:
                    continue
                out = re.sub(rf"\\b{re.escape(v)}\\b", val, out)
            return out

        for step in steps:
            if step.kind == "define":
                ghost = step.data.get("ghost")
                expr = step.data.get("expr")
                if not ghost:
                    continue
                if ghost in var_to_value:
                    raise SystemExit(f"[ERROR] Variable '{ghost}' declared twice in rule '{self.name}'.")
                var_to_value[ghost] = _subst(expr)

            elif step.kind == "assign":
                for tgt in step.data.get("targets", []):
                    if tgt in var_to_value:
                        raise SystemExit(f"[ERROR] Variable '{tgt}' assigned after declaration in rule '{self.name}'.")
                    var_to_value[tgt] = None

            elif step.kind == "require":
                expr_text = step.data.get("expr_text") or ""
                expr_subst = _subst(expr_text)
                if expr_subst:
                    preconds.append(expr_subst)

            elif step.kind == "call":
                name = step.data.get("name")
                args = step.data.get("args", [])
                if func_name is None:
                    func_name = name
                elif name != func_name:
                    raise SystemExit(f"[ERROR] Multiple function calls detected in one path of rule '{self.name}'.")

                if name and name not in self.calls:
                    unknown_call = True

                # ghép đối số với params (nếu có) để tạo precondition n == arg
                param_names = [p.get("name") for p in self.params if isinstance(p, dict) and p.get("name")]
                for idx, arg in enumerate(args):
                    if idx >= len(param_names):
                        break
                    resolved_arg = _subst(arg) or arg
                    preconds.append(f"{param_names[idx]} == {resolved_arg}")

        if func_name is None:
            return {}

        preconds = list(dict.fromkeys(preconds))

        if unknown_call:
            # ghi nhận để xử lý sau (không thay đổi key để không phá namespace)
            self._has_unknown_call = True

        return {func_name: preconds}
    
    # Hàm lấy postcond từ 1 path
    def get_postconditions_from_path(self, steps: List[Step]) -> Dict[str, List[str]]:
        func = "None"
        postconds: List[str] = []
        var_to_value: Dict[str, Any]
        for step in steps:
            #Phân tích từng trường hợp
            break
        return {func: postconds}
    
    def to_conditions(self) -> Tuple[Dict[str, List[str]], Dict[str, List[str]]]:
        """
        Thu thập pre/post theo mọi path, dựa trên dict đầu ra của
        get_preconditions_from_path và get_postconditions_from_path.
        """
        preconds_dict: Dict[str, List[str]] = {}
        postconds_dict: Dict[str, List[str]] = {}

        for path in self.get_all_paths():
            path_pre = self.get_preconditions_from_path(path) or {}
            for fn, conds in path_pre.items():
                bucket = preconds_dict.setdefault(fn, [])
                for c in conds:
                    if c not in bucket:
                        bucket.append(c)

            path_post = self.get_postconditions_from_path(path) or {}
            for fn, conds in path_post.items():
                bucket = postconds_dict.setdefault(fn, [])
                for c in conds:
                    if c not in bucket:
                        bucket.append(c)

        return preconds_dict, postconds_dict

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
