from lark import Tree, Token
from parser_utils import (
    _get_function_call_info,
    _is_zero_arg_function_call,
    _flatten_expr_with_symbols,
    to_text,
    _collect_call_like_from_expr
)
from typing import Dict, List, Optional, Any
from spec_method import Step, Variable, Mapping

'''
    TO-DO:
        - Xử lý phần forall và exist để giải được Test7
'''

class Invariant:
    _COMPARE_TOKENS = ["==", "!=", "<=", ">=", "<", ">"]

    def __init__(self, ast_node: Tree, variables: Dict[str, Variable], sol_symbols: Dict[str, Any]):
        self.name: str = "<unnamed_invariant>"
        self.steps: List[Step] = []
        # Map variable name -> Variable object
        self.variables = variables
        self._var_types = {name: var.vtype for name, var in variables.items()}
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
                expr_node = st.children[0]
                # Check if first child is a quantifier
                first_child = expr_node.children[0] if isinstance(expr_node, Tree) and expr_node.children else None
                if isinstance(first_child, Token) and first_child.type == "QUANTIFIER":
                    self._handle_quantifier_assert(expr_node, sol_symbols, st)
                else:
                    expr_node, msg = None, None
                    for ch in st.children:
                        if isinstance(ch, Tree):
                            expr_node = ch
                        if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                            msg = ch.value[1:-1]
                    func_calls = _collect_call_like_from_expr(expr_node, sol_symbols)
                    self.steps.append(Step("assert", {
                        "expr_text": to_text(expr_node) if expr_node else "",
                        "func_calls": func_calls,
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

                expr_node = next((x for x in chs if isinstance(x, Tree) and x.data in ("expr", "function_call", "special_var_attribute_call")), None)
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
                }, st))


    def _handle_quantifier_assert(self, qnode: Tree, sol_symbols: Dict[str, Any], st: Tree):
        """Parse quantifier expression: QUANTIFIER cvl_type ID "." expr
        Extract condition and body for proper implication rendering.
        """
        qtok = None
        vtype_node = None
        var_tok = None
        body_expr = None
        
        for ch in qnode.children:
            if isinstance(ch, Token) and ch.type == "QUANTIFIER":
                qtok = ch
            elif isinstance(ch, Tree) and ch.data == "cvl_type":
                vtype_node = ch
            elif isinstance(ch, Token) and ch.type == "ID" and var_tok is None:
                var_tok = ch
            elif isinstance(ch, Tree) and ch.data == "expr":
                body_expr = ch
        
        qkind = qtok.value if qtok else "forall"
        vtype_text = to_text(vtype_node) if vtype_node else "uint"
        var_name = var_tok.value if var_tok else "_i"
        
        # Parse body to extract condition and main expression
        condition_text, main_expr_text = self._parse_quantifier_body(body_expr)
        
        func_calls = _collect_call_like_from_expr(body_expr, sol_symbols) if body_expr else []
        
        self.steps.append(Step("quant_assert", {
            "quantifier": qkind,
            "var_type": vtype_text,
            "var_name": var_name,
            "condition": condition_text,
            "main_expr": main_expr_text,
            "func_calls": func_calls
        }, st))

    def _parse_quantifier_body(self, body_expr: Optional[Tree]) -> tuple[Optional[str], str]:
        """Parse quantifier body to extract condition and main expression.
        Handles patterns like: !(cond) || expr  →  cond => expr
        Or: cond && expr (for exists)
        """
        if not body_expr:
            return None, "true"
        
        body_text = to_text(body_expr)
        
        # Check if it's a logic_bi_expr (binary logical operation)
        if isinstance(body_expr, Tree) and body_expr.data == "logic_bi_expr":
            children = list(body_expr.children)
            if len(children) >= 3:
                left = children[0]
                op_tok = children[1]
                right = children[2]
                
                op = op_tok.value if isinstance(op_tok, Token) else str(op_tok)
                
                # Pattern: !(cond) || expr → condition: cond, main: expr
                if op == "||" and isinstance(left, Tree) and left.data == "unary_expr":
                    unary_children = list(left.children)
                    if len(unary_children) >= 2:
                        unop = unary_children[0]
                        if isinstance(unop, Token) and unop.value == "!":
                            # Extract condition (negated part)
                            condition = to_text(unary_children[1])
                            main_expr = to_text(right)
                            return condition, main_expr
                
                # Pattern: cond && expr → for exists, keep as is
                elif op == "&&":
                    condition = to_text(left)
                    main_expr = to_text(right)
                    return condition, main_expr
        
        # No clear condition/expression split, return whole body as main expression
        return None, body_text
    
    @classmethod
    def _pick_compare_op(cls, expr_text: str) -> str:
        s = expr_text or ""
        for tok in cls._COMPARE_TOKENS:
            if f" {tok} " in s or s.strip().startswith(tok) or s.strip().endswith(tok):
                return tok
        return "=="

    @staticmethod
    def _normalize_type(t: Optional[str]) -> Optional[str]:
        if t is None: return None
        s = str(t).strip()
        if not s: return None
        # If it's a mapping type string, unwrap to the value (right-hand) type.
        # Supports nested mapping by repeatedly unwrapping.
        if s.startswith("mapping"):
            import re
            while isinstance(s, str) and s.startswith("mapping"):
                m = re.match(r"^mapping\s*\(\s*(.+?)\s*=>\s*(.+?)\s*\)\s*$", s)
                if not m:
                    break
                s = m.group(2).strip()
        if s == "bool": return "bool"
        if s == "mathint": return "mathint"
        if s.startswith("uint"): return "uint"
        if s.startswith("int"): return "int"
        if s == "string" or s.startswith("bytes"): return "string"
        return s

    @classmethod
    def _sum_fun_for_value_type(cls, value_type: Optional[str]) -> str:
        nt = cls._normalize_type(value_type)
        if nt == "int": return "__verifier_sum_int"
        return "__verifier_sum_uint"

    def _name_to_type_map(self) -> Dict[str, Optional[str]]:
        """
        Build name->type map from declared variables for invariant expression helpers.
        """
        return dict(self._var_types or {})

    # ---------------- Core ----------------

    def _build_invariant_from_assert_step(self, step: Step) -> Optional[str]:
        func_calls = step.data.get("func_calls", [])
        expr_text = step.data.get("expr_text", "") or ""
        op = self._pick_compare_op(expr_text)

        parts: List[str] = []
        name_to_type = self._name_to_type_map()

        for fc in func_calls:
            kind = fc.get("decl_kind")
            name = fc.get("name")
            rendered = fc.get("rendered")

            if not name:
                continue

            if kind == "state_var_attr":
                attr = fc.get("attr")
                if attr == "sum":
                    vtyp = name_to_type.get(name)
                    sum_fun = self._sum_fun_for_value_type(vtyp)
                    parts.append(f"{sum_fun}({name})")
                elif attr == "length":
                    # For arrays: a.length
                    parts.append(rendered or f"{name}.length")
                else:
                    parts.append(rendered or f"{name}.{attr}" if attr else name)
                continue

            if kind == "contract_attr":
                attr = fc.get("attr")
                if attr == "balance":
                    parts.append("address(this).balance")
                elif attr == "address":
                    parts.append("address(this)")
                continue

            if rendered:
                parts.append(rendered)
                continue

            parts.append(name)

        if len(parts) == 2:
            return f"{parts[0]} {op} {parts[1]}"
        return None

    def to_invariants(self) -> List[str]:
        out: List[str] = []
        for st in self.steps:
            if st.kind == "assert":
                inv_expr = self._build_invariant_from_assert_step(st)
                if inv_expr:
                    out.append(f"/// @notice invariant {inv_expr}")
            elif st.kind == "quant_assert":
                # Render quantifier invariants with proper implication format
                q = st.data.get("quantifier", "forall")
                vt = st.data.get("var_type", "uint")
                vn = st.data.get("var_name", "_i")
                condition = st.data.get("condition")
                main_expr = st.data.get("main_expr", "true")
                
                if condition:
                    # Render as implication: forall (type var) (condition => main_expr)
                    if q == "forall":
                        inv_text = f"{q} ({vt} {vn}) ({condition} => {main_expr})"
                    else:  # exists
                        inv_text = f"{q} ({vt} {vn}) ({condition} && {main_expr})"
                else:
                    # No condition, just the main expression
                    inv_text = f"{q} ({vt} {vn}) {main_expr}"
                
                out.append(f"/// @notice invariant {inv_text}")

        seen, uniq = set(), []
        for s in out:
            if s not in seen:
                seen.add(s)
                uniq.append(s)
        return uniq

    def __repr__(self):
        return f"<Invariant name={self.name} steps={len(self.steps)}>"
