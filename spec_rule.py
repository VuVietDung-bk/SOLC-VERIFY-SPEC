import re
from copy import deepcopy
from typing import List, Dict, Any, Optional, Tuple
from lark import Tree, Token
from parser_utils import (
    _extract_rule_params,
    _get_function_call_info,
    _is_zero_arg_function_call,
    _split_call_args,
    _flatten_expr_with_symbols,
    to_text,
    _collect_call_like_from_expr
)
from spec_method import Step, Variable, Mapping

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
    def __init__(self, ast_node: Tree, variables: List[Variable], sol_symbols: Dict[str, Any]):
        self.name: str = "<unnamed>"
        self.params: List[Dict[str, str]] = []
        self.steps: List[Step] = []
        self.snapshots: Dict[str, Dict[str, Any]] = {}
        self.sol_symbols = sol_symbols
        self.variables = variables

        self._parse(ast_node, sol_symbols)

    def _parse(self, node: Tree, sol_symbols):
        self.name = next(node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"))
        params_node = next((c for c in node.children if isinstance(c, Tree) and c.data == "params"), None)
        if params_node:
            self.params = _extract_rule_params(params_node)

        # Lấy block chính của rule
        block_node = next((c for c in node.children if isinstance(c, Tree) and c.data == "block"), None)
        if block_node:
            self.steps = self._parse_block(block_node, sol_symbols)

    def _parse_block(self, block_node: Tree, sol_symbols) -> List[Step]:
        steps = []
        for st in block_node.children:
            if isinstance(st, Tree):
                result = self._parse_statement(st, sol_symbols)
                if result:
                    steps.extend(result)

        return steps

    def _parse_statement(self, st: Tree, sol_symbols) -> List[Step]:

        kind = st.data

        if kind == "define_statement":
            return [self._handle_define(st, sol_symbols)]

        elif kind == "require_statement":
            return [self._handle_require(st, sol_symbols)]

        elif kind == "assert_statement":
            return [self._handle_assert(st, sol_symbols)]

        elif kind == "assignment_statement":
            return [self._handle_assign(st, sol_symbols)]

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
            return [self._parse_ifelse(st, sol_symbols)]

        elif kind == "block_statement":
            block = next(ch for ch in st.children if isinstance(ch, Tree) and ch.data == "block")
            return self._parse_block(block, sol_symbols)
        
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

        expr_node = next((x for x in chs if isinstance(x, Tree) and x.data in ("expr", "logic_bi_expr", "bi_expr", "unary_expr", "function_call")), None)
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
            print(chs)
            id_node: Token = chs[2]
            rhs_text = id_node.value

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
        return Step("call", {"name": fname, "args": fargs}, st)

    def _handle_assert(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        expr_node, msg = None, None
        for ch in st.children:
            if isinstance(ch, Tree):
                expr_node = ch
            if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                msg = ch.value[1:-1]

        return Step("assert", {
            "expr_text": to_text(expr_node) if expr_node else "",
            "message": msg
        }, st)

    def _handle_require(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        expr_node, msg, id_text = None, None, None
        for ch in st.children:
            if isinstance(ch, Tree):
                expr_node = ch
            if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                msg = ch.value[1:-1]
            elif isinstance(ch, Token) and ch.type == "ID":
                id_text = ch.value

        return Step("require", {
            "expr_text": to_text(expr_node) if expr_node else id_text,
            "message": msg
        }, st)

    def _handle_assign(self, st: Tree, sol_symbols: Dict[str, Any]) -> Step:
        lhs_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data == "lhs"), None)
        rhs_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data in ("expr", "logic_bi_expr", "bi_expr", "unary_expr", "function_call")), None)
        targets: List[str] = []
        lhs_texts: List[str] = []

        # Thu thập từng biến bên trái, bao gồm cả chỉ số nếu có
        def _collect_lhs(node: Optional[Tree]):
            if not isinstance(node, Tree):
                return
            name_tok = next((t for t in node.children if isinstance(t, Token) and t.type == "ID"), None)
            idx_node = next((c for c in node.children if isinstance(c, Tree) and c.data == "expr"), None)
            next_lhs = next((c for c in node.children if isinstance(c, Tree) and c.data == "lhs"), None)

            if name_tok:
                targets.append(name_tok.value)
                if idx_node:
                    lhs_texts.append(f"{name_tok.value}[{to_text(idx_node)}]")
                else:
                    lhs_texts.append(name_tok.value)

            if next_lhs:
                _collect_lhs(next_lhs)

        _collect_lhs(lhs_node)

        rhs_text = to_text(rhs_node) if rhs_node else None
        if not rhs_text:
            id_node: Token = st.children[1]
            rhs_text = id_node.value
        func_calls = _collect_call_like_from_expr(rhs_node, sol_symbols)
        rhs_calls = [fc.get("name") for fc in func_calls if fc.get("name")]

        return Step("assign", {
            "targets": targets,
            "lhs_texts": lhs_texts,
            "rhs_text": rhs_text,
            "func_calls": func_calls,
            "rhs_calls": rhs_calls
        }, st)

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

    def _parse_ifelse(self, node:Tree, sol_symbols: Dict[str, Any]) -> Step:
        cond_expr = node.children[0]
        then_stmt = node.children[1]
        else_stmt = node.children[2] if len(node.children) == 3 else None

        cond_text = to_text(cond_expr)

        then_steps = self._parse_statement(then_stmt, sol_symbols)
        if not isinstance(then_steps, list):
            then_steps = [then_steps]

        if else_stmt:
            else_steps = self._parse_statement(else_stmt, sol_symbols)
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
        # Khởi tạo map biến → giá trị đại diện (Token/Tree/str)
        var_to_value: Dict[str, Any] = {}
        for p in self.params:
            if isinstance(p, dict) and p.get("name"):
                var_to_value[p["name"]] = None

        preconds: List[str] = []
        func_name: Optional[str] = None
        unknown_call = False

        returns_map: Dict[str, List[str]] = {}
        if isinstance(self.params, list) and isinstance(getattr(self, "sol_symbols", None), dict):
            rm = self.sol_symbols.get("functions_returns", {})
            if isinstance(rm, dict):
                returns_map = rm
        sol_declared_funcs = set(self.sol_symbols.get("functions", [])) if isinstance(getattr(self, "sol_symbols", None), dict) else set()

        def _render_val(val: Any) -> str:
            if isinstance(val, Token):
                return val.value
            if isinstance(val, Tree):
                return to_text(val)
            return str(val)

        def _subst_text(text: Optional[str], skip=None) -> Optional[str]:
            if text is None:
                return None
            skip_set = set(skip) if skip else set()
            out = text
            for v, val in var_to_value.items():
                if val is None or v in skip_set:
                    continue
                out = re.sub(rf"\b{re.escape(v)}\b", _render_val(val), out)
            return out

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
                if isinstance(ch, Tree) and ch.data in ("expr", "logic_bi_expr", "bi_expr", "unary_expr", "function_call"):
                    rhs = ch
            if not rhs:
                if len(node.children) >= 3:
                    id_node: Token = node.children[2]
                    return id_node
                else:
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

        def _first_ret(fn: str) -> Optional[str]:
            vals = returns_map.get(fn)
            if vals is None:
                return None
            if isinstance(vals, list):
                for v in vals:
                    if v:
                        return v
                return None
            if isinstance(vals, str):
                return vals or None
            return None

        def _all_rets(fn: str) -> List[str]:
            vals = returns_map.get(fn)
            if vals is None:
                return []
            if isinstance(vals, list):
                return [v for v in vals if v]
            if isinstance(vals, str):
                return [vals] if vals else []
            return []

        for step in steps:
            if step.kind == "define":
                ghost = step.data.get("ghost")
                rhs_node = _rhs_node_from_step(step)
                called_fn = None
                print("RHS Node:", rhs_node)  # DEBUG
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
                    if func_name is None:
                        func_name = called_fn
                    else:
                        raise SystemExit(f"\033[91m[ERROR] Multiple function calls detected in one path of rule '{self.name}'.\033[0m")
                    if called_fn not in sol_declared_funcs:
                        unknown_call = True
                    ret = _first_ret(called_fn)
                    if not ret:
                        raise SystemExit(
                            f"\033[91m[ERROR] Function '{called_fn}' in rule '{self.name}' has unnamed return; cannot assign to '{ghost}'.\033[0m"
                        )
                    rhs_subst = _subst_expr(rhs_node, skip=[ghost])
                    replaced = _replace_call(rhs_subst or rhs_node, called_fn, ret)
                    var_to_value[ghost] = replaced
                else:
                    var_to_value[ghost] = _subst_expr(rhs_node, skip=[ghost]) or rhs_node

            elif step.kind == "assign":
                targets = step.data.get("targets", [])
                rhs_node = _rhs_node_from_step(step)
                called_fn = None
                print("RHS Node:", rhs_node)  # DEBUG
                if isinstance(rhs_node, Tree):
                    call_names = _call_names(rhs_node)
                    if len(call_names) > 1:
                        raise SystemExit(f"\033[91m[ERROR] Multiple function calls detected in assignment of rule '{self.name}'.\033[0m")
                    called_fn = call_names[0] if call_names else None
                if called_fn:
                    if func_name is None:
                        func_name = called_fn
                    else:
                        raise SystemExit(f"\033[91m[ERROR] Multiple function calls detected in one path of rule '{self.name}'.\033[0m")
                    if called_fn not in sol_declared_funcs:
                        unknown_call = True
                if called_fn and len(targets) > 1:
                    ret_list = _all_rets(called_fn)
                    if len(ret_list) != len(targets):
                        raise SystemExit(
                            f"\033[91m[ERROR] Function '{called_fn}' in rule '{self.name}' returns {len(ret_list)} value(s) but assignment targets {len(targets)} variable(s).\033[0m"
                        )
                    if any(not r for r in ret_list):
                        raise SystemExit(
                            f"\033[91m[ERROR] Function '{called_fn}' in rule '{self.name}' has unnamed return values; cannot assign to {targets}.\033[0m"
                        )
                    for tgt, retname in zip(targets, ret_list):
                        var_to_value[tgt] = Token("ID", retname)
                elif called_fn:
                    ret = _first_ret(called_fn)
                    if not ret:
                        raise SystemExit(
                            f"\033[91m[ERROR] Function '{called_fn}' in rule '{self.name}' has unnamed return; cannot assign to {targets}.\033[0m"
                        )
                    rhs_subst = _subst_expr(rhs_node, skip=targets)
                    replaced = _replace_call(rhs_subst or rhs_node, called_fn, ret)
                    for tgt in targets:
                        var_to_value[tgt] = replaced
                else:
                    rhs_subst = _subst_expr(rhs_node, skip=targets)
                    for tgt in targets:
                        var_to_value[tgt] = deepcopy(rhs_subst) if rhs_subst is not None else rhs_node

            elif step.kind == "require":
                if func_name is not None:
                    raise SystemExit(f"\033[91m[ERROR] All require statements must appear before function calls in rule '{self.name}'.\033[0m")
                expr_node = _require_expr_from_step(step)
                expr_subst = _subst_expr(expr_node)
                expr_text = to_text(expr_subst or expr_node) if (expr_subst or expr_node) else ""
                if expr_text:
                    preconds.append(expr_text)

            elif step.kind == "call":
                name = step.data.get("name")
                args = step.data.get("args", [])
                if func_name is None:
                    func_name = name
                elif name != func_name:
                    raise SystemExit(f"\033[91m[ERROR] Multiple function calls detected in one path of rule '{self.name}'.\033[0m")

                if name and name not in sol_declared_funcs:
                    unknown_call = True

                # ghép đối số với params (nếu có) để tạo precondition n == arg
                param_names = [p.get("name") for p in self.params if isinstance(p, dict) and p.get("name")]
                for idx, arg in enumerate(args):
                    if idx >= len(param_names):
                        break
                    resolved_arg = _subst_text(arg) or arg
                    preconds.append(f"{param_names[idx]} == {resolved_arg}")

        print(var_to_value)

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
        return f"<Rule name={self.name} steps={len(self.steps)} snapshots={self.snapshots}>"
