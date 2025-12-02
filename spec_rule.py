import re
from copy import deepcopy
from typing import List, Dict, Any, Optional, Tuple
from lark import Tree, Token
from parser_utils import (
    _extract_rule_params,
    _get_function_call_info,
    _is_zero_arg_function_call,
    _split_call_args,
    to_text,
    _collect_call_like_from_expr,
)
from logic_utils import (
    wrap_expr,
    make_eq_expr,
    unique_exprs,
    negative,
    remove_arrows,
    evaluate_expr_at_function,
    solve_free_vars_in_pres_and_posts,
    subst_expr,
    wrap_old_expr,
    wrap_old_expr_event
)
from rule_helpers import append_unique, propagate_modifies
from spec_method import Step, Variable

"""
    TO-DO:
    - Tìm biến tự do trong precondition và postcondition, rồi xử lý tương ứng để tạo postcondition chính xác hơn.
    - Xử lý trường hợp hàm không xác định, lọc danh sách hàm cần chèn từ precondition và postcondition.
    - Xử lý các loại cú pháp còn lại
    - Type-checking, bọc casting address cho các hằng số address
    - Xử lý song song emits và function call
"""

class Rule:
    def __init__(self, ast_node: Tree, variables: List[Variable], sol_symbols: Dict[str, Any]):
        self.name: str = "<unnamed>"
        self.params: List[Dict[str, str]] = []
        self.steps: List[Step] = []
        self.snapshots: Dict[str, Dict[str, Any]] = {}
        self.sol_symbols = sol_symbols
        self.variables = variables
        self.var_to_type: Dict[str, str] = {}
        self.call_graph: Dict[str, List[str]] = {}
        self.func_state_writes: Dict[str, List[str]] = {}

        self._parse(ast_node, sol_symbols)

    def _parse(self, node: Tree, sol_symbols):
        self.name = next(node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"))
        params_node = next((c for c in node.children if isinstance(c, Tree) and c.data == "params"), None)
        if params_node:
            self.params = _extract_rule_params(params_node)

        for param in self.params:
            if isinstance(param, dict) and param.get("name") and param.get("type"):
                self.var_to_type[param["name"]] = param["type"]

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

        if ghost:
            self.snapshots[ghost] = {
                "type": ghost_type,
                "expr_text": rhs_text,
                "rhs_calls": rhs_calls,
                "observed": observed,
            }

        self.var_to_type[ghost] = ghost_type

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
        rhs_node = next((ch for ch in st.children if isinstance(ch, Tree) and ch.data in ("expr", "logic_bi_expr", "compare_bi_expr", "bi_expr", "unary_expr", "function_call")), None)
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
    def get_preconditions_from_path(self, steps: List[Step]) -> Tuple[Dict[str, List[Tree]], bool]:
        # Khởi tạo map biến → giá trị đại diện (Token/Tree/str)
        var_to_value: Dict[str, Any] = {}
        for p in self.params:
            if isinstance(p, dict) and p.get("name"):
                var_to_value[p["name"]] = None

        preconds: List[Any] = []
        require_steps: List[Step] = []
        func_name: Optional[str] = None
        unknown_call = False
        is_event = False

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
                require_steps.append(step)

            elif step.kind == "call":
                name = step.data.get("name")
                args = step.data.get("args", [])
                if func_name is None:
                    func_name = name
                elif name != func_name:
                    raise SystemExit(f"\033[91m[ERROR] Multiple function calls or events detected in one path of rule '{self.name}'.\033[0m")

                if name and name not in sol_declared_funcs:
                    unknown_call = True

                # ghép đối số với params của hàm được gọi (lấy từ sol_symbols nếu có)
                fn_params_map = self.sol_symbols.get("functions_params", {}) if isinstance(self.sol_symbols, dict) else {}
                param_names = fn_params_map.get(name, []) if isinstance(fn_params_map, dict) else []
                def _is_const(s: Optional[str]) -> bool:
                    if s is None:
                        return False
                    s = s.strip()
                    return bool(re.fullmatch(r"\d+", s)) or s in ("true", "false") or (len(s) >= 2 and s[0] == "\"" and s[-1] == "\"")

                rendered_args: List[Optional[str]] = []
                rendered_arg_nodes: List[Optional[Tree]] = []
                for arg in args:
                    ra = _subst_text(arg)
                    if ra is None and arg in var_to_value and var_to_value[arg] is not None:
                        ra = _render_val(var_to_value[arg])
                    rendered_args.append(ra or arg)
                    prefer_val = var_to_value.get(arg)
                    rendered_arg_nodes.append(wrap_expr(prefer_val if prefer_val is not None else (ra or arg)))

                # Nếu cùng một biểu thức truyền cho nhiều param (vd f(n,n)) → thêm a==b
                for i in range(len(rendered_args)):
                    for j in range(i + 1, len(rendered_args)):
                        if i >= len(param_names) or j >= len(param_names):
                            continue
                        if rendered_args[i] == rendered_args[j]:
                            eq_expr = make_eq_expr(param_names[i], param_names[j])
                            if eq_expr:
                                preconds.append(eq_expr)

                for idx, arg in enumerate(rendered_args):
                    if idx >= len(param_names):
                        break
                    if arg is not None and (arg != args[idx] or _is_const(arg)):
                        eq_expr = make_eq_expr(param_names[idx], rendered_arg_nodes[idx] or arg)
                        if eq_expr:
                            preconds.append(eq_expr)

                for idx, arg in enumerate(args):
                    if var_to_value[arg] is None:
                        var_to_value[arg] = Token("ID", param_names[idx])
            elif step.kind == "emits":
                # xử lý event như call với parameters
                is_event = True
                name = step.data.get("event")
                args = step.data.get("args", [])
                if func_name is None:
                    func_name = name
                elif name != func_name:
                    raise SystemExit(f"\033[91m[ERROR] Multiple function calls detected in one path of rule '{self.name}'.\033[0m")

                fn_params_map = self.sol_symbols.get("functions_params", {}) if isinstance(self.sol_symbols, dict) else {}
                param_names = fn_params_map.get(name, []) if isinstance(fn_params_map, dict) else []

                def _is_const(s: Optional[str]) -> bool:
                    if s is None:
                        return False
                    s = s.strip()
                    return bool(re.fullmatch(r"\d+", s)) or s in ("true", "false") or (len(s) >= 2 and s[0] == "\"" and s[-1] == "\"")

                rendered_args: List[Optional[str]] = []
                rendered_arg_nodes: List[Optional[Tree]] = []
                for arg in args:
                    ra = _subst_text(arg)
                    if ra is None and arg in var_to_value and var_to_value[arg] is not None:
                        ra = _render_val(var_to_value[arg])
                    rendered_args.append(ra or arg)
                    prefer_val = var_to_value.get(arg)
                    rendered_arg_nodes.append(wrap_expr(prefer_val if prefer_val is not None else (ra or arg)))

                for idx, arg in enumerate(rendered_args):
                    if idx >= len(param_names):
                        break
                    if arg is not None and (arg != args[idx] or _is_const(arg)):
                        eq_expr = make_eq_expr(param_names[idx], rendered_arg_nodes[idx] or arg)
                        if eq_expr:
                            preconds.append(eq_expr)

                for idx, arg in enumerate(args):
                    if var_to_value[arg] is None:
                        var_to_value[arg] = Token("ID", param_names[idx])

        for step in require_steps:
            expr_node = _require_expr_from_step(step)
            expr_subst = _subst_expr(expr_node)
            cond_expr = expr_subst or expr_node
            if cond_expr:
                preconds.append(cond_expr)

        if func_name is None:
            return None

        return {func_name: unique_exprs(preconds)}, unknown_call, is_event
    
    # Hàm lấy postcond từ 1 path 
    def get_postconditions_from_path(self, steps: List[Step]) -> Tuple[Dict[str, List[Tree]], bool, Dict[str, Any]]:
        var_to_value: Dict[str, Any] = {}
        for p in self.params:
            if isinstance(p, dict) and p.get("name"):
                var_to_value[p["name"]] = None

        postconds: List[Any] = []
        func_name: Optional[str] = None
        unknown_call = False
        is_event = False

        returns_map: Dict[str, List[str]] = {}
        fn_params_map: Dict[str, List[str]] = {}
        sol_declared_funcs = set()
        if isinstance(getattr(self, "sol_symbols", None), dict):
            rm = self.sol_symbols.get("functions_returns", {}) or {}
            if isinstance(rm, dict):
                returns_map = rm
            pm = self.sol_symbols.get("functions_params", {}) or {}
            if isinstance(pm, dict):
                fn_params_map = pm
            sol_declared_funcs = set(self.sol_symbols.get("functions", []) or [])

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

        def _assert_expr_from_step(step: Step) -> Optional[Tree]:
            node = step.node
            if not isinstance(node, Tree):
                return None
            for ch in node.children:
                if isinstance(ch, Tree):
                    return ch
                if isinstance(ch, Token):
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
        
        def _oldify_expr(expr_node: Optional[Tree], skip=None) -> Optional[Tree]:
            """
            Thay các biến thuộc self.variables thành __verifier_old_<kind>(var)
            (uint*/int*/bytes*/string) trừ những biến trong skip.
            """
            if expr_node is None:
                return None
            skip_set = set(skip) if skip else set()
            subst_map: Dict[str, Any] = {}
            vars_iter = []
            if isinstance(self.variables, dict):
                vars_iter = self.variables.values()
            elif isinstance(self.variables, list):
                vars_iter = self.variables
            for v in vars_iter:
                vname = getattr(v, "name", None) if hasattr(v, "name") else None
                vtype = getattr(v, "vtype", None) if hasattr(v, "vtype") else None
                if not vname or vname in skip_set:
                    continue
                wrap = None
                if isinstance(vtype, str):
                    if vtype.startswith("uint"):
                        wrap = "__verifier_old_uint"
                    elif vtype.startswith("int"):
                        wrap = "__verifier_old_int"
                    elif vtype.startswith("bytes") or vtype == "string":
                        wrap = "__verifier_old_bytes"
                    elif vtype == "bool":
                        wrap = "__verifier_old_bool"
                if wrap:
                    subst_map[vname] = Token("ID", f"{wrap}({vname})")
            new_node: Tree = None
            if not subst_map:
                new_node = expr_node
            new_node = subst_expr(deepcopy(expr_node), subst_map)
            
            return wrap_old_expr(new_node, vars_iter)
        
        def _oldify_expr_event(expr_node: Optional[Tree], skip=None) -> Optional[Tree]:
            """
            Thay các biến thuộc self.variables thành __verifier_before_<kind>(var)
            (uint*/int*/bytes*/string) trừ những biến trong skip.
            """
            if expr_node is None:
                return None
            skip_set = set(skip) if skip else set()
            subst_map: Dict[str, Any] = {}
            vars_iter = []
            if isinstance(self.variables, dict):
                vars_iter = self.variables.values()
            elif isinstance(self.variables, list):
                vars_iter = self.variables
            for v in vars_iter:
                vname = getattr(v, "name", None) if hasattr(v, "name") else None
                vtype = getattr(v, "vtype", None) if hasattr(v, "vtype") else None
                if not vname or vname in skip_set:
                    continue
                wrap = None
                if isinstance(vtype, str):
                    if vtype.startswith("uint"):
                        wrap = "__verifier_before_uint"
                    elif vtype.startswith("int"):
                        wrap = "__verifier_before_int"
                    elif vtype.startswith("bytes") or vtype == "string":
                        wrap = "__verifier_before_bytes"
                    elif vtype == "bool":
                        wrap = "__verifier_before_bool"
                if wrap:
                    subst_map[vname] = Token("ID", f"{wrap}({vname})")
            new_node: Tree = None
            if not subst_map:
                new_node = expr_node
            new_node = subst_expr(deepcopy(expr_node), subst_map)
            
            return wrap_old_expr_event(new_node, vars_iter)

        assert_steps: List[Step] = []

        for step in steps:
            if step.kind == "emits":
                is_event = True

        for step in steps:
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
                    base_rhs = None
                    base_rhs_sub = _subst_expr(rhs_node, skip=[ghost])
                    if func_name is None:
                        if not is_event:
                            base_rhs = _oldify_expr(base_rhs_sub, skip=[ghost]) or base_rhs_sub
                        else:
                            base_rhs = _oldify_expr_event(base_rhs_sub, skip=[ghost]) or base_rhs_sub
                    var_to_value[ghost] = base_rhs or base_rhs_sub

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

            elif step.kind == "call":
                name = step.data.get("name")
                args = step.data.get("args", [])
                if func_name is None:
                    func_name = name
                elif name != func_name:
                    raise SystemExit(f"\033[91m[ERROR] Multiple function calls or events detected in one path of rule '{self.name}'.\033[0m")

                if name and name not in sol_declared_funcs:
                    unknown_call = True

                # ghi chú param mapping cho các assert sau (tương tự precondition)
                param_names = fn_params_map.get(name, []) if isinstance(fn_params_map, dict) else []

                for idx, arg in enumerate(args):
                    if var_to_value[arg] is None:
                        var_to_value[arg] = Token("ID", param_names[idx])

            elif step.kind == "emits":
                name = step.data.get("event")
                args = step.data.get("args", [])
                if func_name is None:
                    func_name = name
                else: 
                    raise SystemExit(f"\033[91m[ERROR] Multiple function calls or events detected in one path of rule '{self.name}'.\033[0m")
                # map event params
                param_names = fn_params_map.get(name, []) if isinstance(fn_params_map, dict) else []
                for idx, arg in enumerate(args):
                    if var_to_value[arg] is None and idx < len(param_names):
                        var_to_value[arg] = Token("ID", param_names[idx])

            elif step.kind == "assert":
                if func_name is None:
                    raise SystemExit(f"\033[91m[ERROR] All assert statements must appear after function calls in rule '{self.name}'.\033[0m")
                assert_steps.append(step)
            elif step.kind == "assert_revert":
                if func_name is None:
                    raise SystemExit(f"\033[91m[ERROR] All assert_revert statements must appear after function calls in rule '{self.name}'.\033[0m")
                assert_steps.append(step)

        for step in assert_steps:
            expr_node = _assert_expr_from_step(step)
            expr_subst = _subst_expr(expr_node)
            cond_expr = expr_subst or expr_node
            if step.kind == "assert_revert":
                # Post(!P) nếu có P, else false
                if cond_expr is not None:
                    neg_expr = negative(deepcopy(cond_expr))
                    postconds.append(neg_expr)
                else:
                    postconds.append(Tree("literal", [Token("FALSE", "false")]))
            else:
                if cond_expr:
                    postconds.append(cond_expr)

        if func_name is None:
            return None

        return {func_name: unique_exprs(postconds)}, unknown_call, var_to_value, is_event
    
    def get_modify_from_path(self, steps: List[Step]) -> Dict[str, List[Tuple[str, str]]]:
        func_name: Optional[str] = None
        modifies: List[str] = []

        for step in steps:
            if step.kind == "call" and func_name is None:
                func_name = step.data.get("name")

            if step.kind == "assert_modify":
                target = step.data.get("target")
                cond = step.data.get("expr_text") or None
                if not target:
                    continue
                entry = f"{target} if {cond}" if cond else target
                modifies.append(entry)

        if func_name is None or not modifies:
            return {}

        return {func_name: modifies}
    
    def get_emits_from_path(self, steps: List[Step]) -> Dict[str, List[str]]:
        func_name: Optional[str] = None
        emits: List[str] = []

        for step in steps:
            if step.kind == "call" and func_name is None:
                func_name = step.data.get("name")

            if step.kind == "assert_emit":
                ev = step.data.get("event")
                if not ev:
                    continue
                emits.append(ev)

        if func_name is None or not emits:
            return {}

        return {func_name: emits}
    
    def to_conditions(self) -> Tuple[Dict[str, List[str]], Dict[str, List[str]], Dict[str, List[str]], Dict[str, List[str]], Dict[str, List[str]], Dict[str, List[str]]]:
        """
        Thu thập pre/post/modify/emits theo mọi path, dựa trên dict đầu ra của
        get_preconditions_from_path, get_postconditions_from_path, get_modify_from_path, get_emits_from_path.
        """
        preconds_dict: Dict[str, List[Any]] = {}
        postconds_dict: Dict[str, List[Any]] = {}
        modify_dict: Dict[str, List[Any]] = {}
        emits_dict: Dict[str, List[Any]] = {}
        preconds_event_dict: Dict[str, List[Any]] = {}
        postconds_event_dict: Dict[str, List[Any]] = {}
        sol_functions = []
        temp_no_conditions = set()
        if isinstance(self.sol_symbols, dict):
            sol_functions = list(self.sol_symbols.get("functions", []) or [])
            # filter only public/non-view if info is available
            pub_nonview = self.sol_symbols.get("functions_public_nonview")
            if isinstance(pub_nonview, (set, list)):
                sol_functions = [fn for fn in sol_functions if fn in pub_nonview]

        def _append_evaluated(bucket_dict: Dict[str, List[Any]], conds: Dict[str, List[Tree]], unknown: bool, is_pre: bool):
            if not conds:
                return
            if not unknown:
                for fn, cs in conds.items():
                    bucket = bucket_dict.setdefault(fn, [])
                    for c in cs:
                        append_unique(bucket, c)
                return
            # unknown call → áp dụng cho mọi hàm, đánh giá funcCompare để lọc
            for fn in sol_functions:
                bucket = bucket_dict.setdefault(fn, [])
                for c in sum(conds.values(), []):  # flatten all conds
                    ce = c
                    if isinstance(c, Tree):
                        ce = evaluate_expr_at_function(c, fn)
                        txt = to_text(ce)
                        if txt.lower() == "false" and is_pre:
                            temp_no_conditions.add(fn)
                            break
                if fn in temp_no_conditions:
                    continue  # skip postconds if precond is false
                for c in sum(conds.values(), []):  # flatten all conds
                    ce = c
                    if isinstance(c, Tree):
                        ce = evaluate_expr_at_function(c, fn)
                        txt = to_text(ce)
                        if txt.lower() == "true":
                            continue  # skip tautology
                    append_unique(bucket, ce)

        for path in self.get_all_paths():
            temp_no_conditions = set()
            pre_res = self.get_preconditions_from_path(path)
            if pre_res:
                path_pre, unknown_call, is_event = pre_res
            else:
                path_pre = {}
                unknown_call = False
            if not is_event:
                _append_evaluated(preconds_dict, path_pre, unknown_call, True)
            else:
                _append_evaluated(preconds_event_dict, path_pre, unknown_call, True)

            post_res = self.get_postconditions_from_path(path)
            if post_res:
                path_post, post_unknown, var_to_value, is_event = post_res
            else:
                path_post = {}
                post_unknown = False
            if not is_event:
                _append_evaluated(postconds_dict, path_post, post_unknown, False)
            else:
                _append_evaluated(postconds_event_dict, path_post, post_unknown, False)

            path_modify = self.get_modify_from_path(path) or {}
            for fn, conds in path_modify.items():
                bucket = modify_dict.setdefault(fn, [])
                for c in conds:
                    append_unique(bucket, c)

            path_emits = self.get_emits_from_path(path) or {}
            for fn, conds in path_emits.items():
                bucket = emits_dict.setdefault(fn, [])
                for c in conds:
                    append_unique(bucket, c)

        # ---- Propagate modifies through call graph ----
        call_graph = {}
        if isinstance(getattr(self, "call_graph", None), dict):
            call_graph = self.call_graph
        func_writes = {}
        if isinstance(getattr(self, "func_state_writes", None), dict):
            func_writes = self.func_state_writes

        propagated = propagate_modifies(modify_dict, call_graph, func_writes)

        solved_preconds, solved_postconds = solve_free_vars_in_pres_and_posts(
            preconds_dict, postconds_dict, self.var_to_type, var_to_value
        )

        solved_pre_event_dict, solved_post_event_dict = solve_free_vars_in_pres_and_posts(
            preconds_event_dict, postconds_event_dict, self.var_to_type, var_to_value
        )

        def _exprs_to_text_map(expr_dict: Dict[str, List[Any]]) -> Dict[str, List[str]]:
            out: Dict[str, List[str]] = {}
            for fn, exprs in expr_dict.items():
                seen = set()
                texts: List[str] = []
                for ex in exprs:
                    txt = to_text(remove_arrows(ex)) if isinstance(ex, Tree) else str(ex)
                    if txt in seen:
                        continue
                    seen.add(txt)
                    texts.append(txt)
                # TO-DO: giữ nguyên biểu thức (Tree) thay vì to_text sau khi cập nhật downstream
                out[fn] = texts
            return out

        # TO-DO: gộp pre/post ở dạng AST trước khi stringify để tối ưu dedup
        return (
            _exprs_to_text_map(solved_preconds),
            _exprs_to_text_map(solved_postconds),
            _exprs_to_text_map(propagated),
            _exprs_to_text_map(emits_dict),
            _exprs_to_text_map(solved_pre_event_dict),
            _exprs_to_text_map(solved_post_event_dict)
        )
    
    def __repr__(self):
        return f"<Rule name={self.name} steps={len(self.steps)} snapshots={self.snapshots}>"
