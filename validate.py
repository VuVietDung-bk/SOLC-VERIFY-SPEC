import re
from typing import Dict, List, Optional, Any
from lark import Tree, Token
from spec_ir import IR
from parser_utils import _get_function_call_info

_EXPR_NODES = ("expr", "logic_bi_expr", "compare_bi_expr", "bi_expr", "unary_expr", "function_call", "special_var_attribute_call", "contract_attribute_call", "cast_function_expr")


def _rhs_node_from_step(step) -> Optional[Tree | Token]:
    """Extract the RHS expression node (or token) from a Step."""
    node = getattr(step, "node", None)
    if not isinstance(node, Tree):
        return None
    rhs = None
    for ch in node.children:
        if isinstance(ch, Tree) and ch.data in _EXPR_NODES:
            rhs = ch
    if not rhs:
        if len(node.children) >= 3:
            id_node: Token = node.children[2]
            return id_node
        elif node.data in ("assign_statement", "assignment_statement") and len(node.children) >= 2:
            id_node: Token = node.children[1]
            return id_node
    return rhs


def _collect_call_nodes(node: Optional[Tree]) -> List[Tree]:
    """Collect direct function_call nodes inside a subtree."""
    if not isinstance(node, Tree):
        return []
    return [fc for fc in node.iter_subtrees_topdown() if isinstance(fc, Tree) and fc.data == "function_call"]


def _type_category(t: Optional[str]) -> str:
    """Rough type categorization for simple compatibility checks."""
    if not t:
        return "unknown"
    s = t.strip().lower()
    if s.startswith("uint"):
        return "uint"
    if s.startswith("int"):
        return "int"
    if s == "bool":
        return "bool"
    if s == "address":
        return "address"
    if s == "string":
        return "string"
    if s.startswith("bytes"):
        return "bytes"
    if s.startswith("mapping"):
        return "mapping"
    if s == "method":
        return "method"
    return "unknown"


def _mapping_value_type(mapping_type: str, depth: int = 1) -> Optional[str]:
    """
    Extract the value type from a mapping type string like 'mapping(address=>uint)'.
    Supports nested mappings: depth specifies how many indices are applied.
    Returns the raw value type string or None.
    """
    if not mapping_type or "mapping" not in mapping_type:
        return None
    cleaned = mapping_type.replace(" ", "")
    cur = cleaned
    for _ in range(max(1, depth)):
        if not cur.lower().startswith("mapping("):
            return None
        # Find the position of "=>"
        open_idx = cur.find("(")
        if open_idx == -1:
            return None
        arrow_idx = None
        paren = 0
        for i in range(open_idx + 1, len(cur)):
            ch = cur[i]
            if ch == "(":
                paren += 1
            elif ch == ")":
                if paren == 0:
                    break
                paren -= 1
            elif ch == "=" and i + 1 < len(cur) and cur[i + 1] == ">" and paren == 0:
                arrow_idx = i
                break
        if arrow_idx is None:
            return None
        # Extract the value type until the matching closing parenthesis of this mapping
        start_val = arrow_idx + 2
        paren = 0
        end_idx = None
        for i in range(start_val, len(cur)):
            ch = cur[i]
            if ch == "(":
                paren += 1
            elif ch == ")":
                if paren == 0:
                    end_idx = i
                    break
                paren -= 1
        val = cur[start_val:end_idx].strip() if end_idx is not None else cur[start_val:].strip()
        cur = val
    return cur


def _index_depth(expr_node: Tree) -> int:
    """Count how many index operations are applied in an expr node."""
    depth = 0
    for ch in expr_node.children:
        if isinstance(ch, Tree) and ch.data == "index":
            depth += len([c for c in ch.children])
    return depth


def _arg_nodes_from_call(fc_node: Tree) -> List[Any]:
    """Return list of argument expression nodes from a function_call Tree."""
    if not isinstance(fc_node, Tree):
        return []
    exprs_node = next((ch for ch in fc_node.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    if exprs_node is None:
        return []
    return exprs_node.children

def _get_return_types(fname: Optional[str], sol_symbols: Dict[str, Any]) -> List[str]:
    """Return list of raw return type strings for a function name from sol_symbols."""
    if not fname or not isinstance(sol_symbols, dict):
        return []
    return sol_symbols.get("functions_return_types", {}).get(fname, []) or []


def _check_call_arg_types(fc_node: Tree, symbols: Dict[str, str], sol_symbols: Dict[str, Any], rule_name: str) -> None:
    """Ensure the argument expressions of a call match the Solidity parameter types when available."""
    fname, _ = _get_function_call_info(fc_node)
    if not fname:
        return
    param_types_map = sol_symbols.get("functions_param_types", {}) if isinstance(sol_symbols, dict) else {}
    expected = param_types_map.get(fname)
    if not isinstance(expected, list) or not expected:
        return

    arg_nodes = _arg_nodes_from_call(fc_node)
    if len(arg_nodes) != len(expected):
        raise SystemExit(
            f"\033[91m[ERROR] Function '{fname}' in rule '{rule_name}' expects {len(expected)} argument(s) but got {len(arg_nodes)}.\033[0m"
        )

    for idx, (arg_node, exp_type) in enumerate(zip(arg_nodes, expected)):
        arg_type = _type_category(_infer_expr_type(arg_node, symbols, sol_symbols))
        exp_cat = _type_category(exp_type)
        if not _is_compatible(exp_cat, arg_type):
            raise SystemExit(
                f"\033[91m[ERROR] Type mismatch for parameter {idx+1} of '{fname}' in rule '{rule_name}': expected {exp_cat}, got {arg_type}.\033[0m"
            )


def _infer_expr_type(node: Optional[Tree | Token], symbols: Dict[str, str], sol_symbols: Optional[Dict[str, Any]] = None) -> Optional[str]:
    """Best-effort type inference for expressions."""
    if node is None:
        return None

    if isinstance(node, Token):
        if node.type in ("TRUE", "FALSE"):
            return "bool"
        if node.type == "INTEGER_LITERAL":
            return "uint"
        if node.type == "STRING_LITERAL":
            return "string"
        if node.type == "ID":
            base = symbols.get(node.value)
            return _type_category(base)
        return None

    if not isinstance(node, Tree):
        return None

    # Simple variable or indexed access
    if node.data == "expr" and node.children:
        base_tok = node.children[0] if isinstance(node.children[0], Token) else None
        if base_tok and base_tok.type == "ID":
            base_name = base_tok.value
            base_type = symbols.get(base_name)
            cat = _type_category(base_type)
            idx_depth = _index_depth(node)
            for ch in node.children:
                if isinstance(ch, Tree) and ch.data == "attribute":
                    attr_tok = next(
                        (t for t in ch.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")),
                        None
                    )
                    if attr_tok:
                        if attr_tok.value == "balance":
                            return "uint"
            if cat == "mapping" and idx_depth > 0:
                val_raw = _mapping_value_type(base_type or "", idx_depth)
                return _type_category(val_raw)
            return cat

    if node.data == "special_var_attribute_call":
        return "uint"

    if node.data == "contract_attribute_call":
        attr_tok = next(
            (t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type in ("BALANCE", "ADDRESS"))),
            None
        )
        if attr_tok and attr_tok.type == "BALANCE":
            return "uint"
        if attr_tok and attr_tok.type == "ADDRESS":
            return "address"
        return None

    if node.data == "function_call":
        fname, _ = _get_function_call_info(node)
        ret_list = _get_return_types(fname, sol_symbols or {})
        if ret_list:
            return _type_category(ret_list[0])
        return None

    if node.data == "unary_expr":
        return _infer_expr_type(node.children[1] if len(node.children) >= 2 else None, symbols, sol_symbols)

    if node.data == "bi_expr":
        left = _type_category(_infer_expr_type(node.children[0], symbols, sol_symbols))
        right = _type_category(_infer_expr_type(node.children[2], symbols, sol_symbols)) if len(node.children) >= 3 else "unknown"
        if left in ("uint", "int") or right in ("uint", "int"):
            if left == "int" or right == "int":
                return "int"
            return "uint"
        return None

    if node.data in ("logic_bi_expr", "compare_bi_expr"):
        return "bool"

    return None


def _is_compatible(lhs_type: str, rhs_type: Optional[str]) -> bool:
    """Check if rhs_type can be assigned to lhs_type."""
    if lhs_type == "unknown" or rhs_type is None or rhs_type == "unknown":
        return True
    if lhs_type == rhs_type:
        return True
    # numeric compatibility
    if lhs_type in ("uint", "int") and rhs_type in ("uint", "int"):
        return True
    return False


def validate_ir(ir: IR, sol_symbols: Dict[str, Any]):
    """
    Type-check define/assign/function-call statements to ensure arguments and assigned expressions
    align with available Solidity type info (best-effort categories).
    """
    for rule in getattr(ir, "rules", []):
        # symbol table for rule-scoped variables (params + globals + ghost defines)
        symbols: Dict[str, str] = {var.name: var.vtype for var in getattr(ir, "variables", [])}
        for p in getattr(rule, "params", []):
            if isinstance(p, dict) and p.get("name"):
                symbols[p["name"]] = p.get("type", "")

        for step in getattr(rule, "steps", []):
            kind = getattr(step, "kind", None)
            rhs_node = _rhs_node_from_step(step)
            # Validate any function calls appearing inside the RHS expression.
            for fc in _collect_call_nodes(rhs_node):
                _check_call_arg_types(fc, symbols, sol_symbols, rule.name)

            if kind == "define":
                ghost = step.data.get("ghost")
                gtype = step.data.get("type") or ""
                rhs_type = _infer_expr_type(rhs_node, symbols, sol_symbols)
                if not _is_compatible(_type_category(gtype), rhs_type):
                    raise SystemExit(
                        f"\033[91m[ERROR] Type mismatch in rule '{rule.name}' for '{ghost}': expected {_type_category(gtype)}, got {rhs_type or 'unknown'}.\033[0m"
                    )
                if ghost:
                    symbols[ghost] = gtype

            elif kind == "assign":
                targets = step.data.get("targets", [])
                rhs_type = _infer_expr_type(rhs_node, symbols, sol_symbols)

                # If RHS is a function call, try to use return type info and check arity.
                if isinstance(rhs_node, Tree) and rhs_node.data == "function_call":
                    fname, _ = _get_function_call_info(rhs_node)
                    ret_types = [_type_category(rt) for rt in _get_return_types(fname, sol_symbols)]
                    if len(targets) > 1 and ret_types:
                        if len(ret_types) != len(targets):
                            raise SystemExit(
                                f"\033[91m[ERROR] Function '{fname}' in rule '{rule.name}' returns {len(ret_types)} value(s) but assignment targets {len(targets)} variable(s).\033[0m"
                            )
                        for tgt, rcat in zip(targets, ret_types):
                            ltype = _type_category(symbols.get(tgt))
                            if not _is_compatible(ltype, rcat):
                                raise SystemExit(
                                    f"\033[91m[ERROR] Type mismatch in rule '{rule.name}' for '{tgt}': expected {ltype}, got {rcat or 'unknown'} from '{fname}'.\033[0m"
                                )
                        continue
                    if ret_types:
                        rhs_type = ret_types[0]

                for tgt in targets:
                    ltype = _type_category(symbols.get(tgt))
                    if not _is_compatible(ltype, rhs_type):
                        raise SystemExit(
                            f"\033[91m[ERROR] Type mismatch in rule '{rule.name}' for '{tgt}': expected {ltype}, got {rhs_type or 'unknown'}.\033[0m"
                        )

            elif kind == "call":
                step_node = getattr(step, "node", None)
                fc_node = None
                if isinstance(step_node, Tree):
                    fc_node = next((ch for ch in step_node.children if isinstance(ch, Tree) and ch.data == "function_call"), None)
                if fc_node:
                    _check_call_arg_types(fc_node, symbols, sol_symbols, rule.name)

    return
