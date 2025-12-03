import re
from copy import deepcopy
from typing import Dict, List, Tuple, Optional, Any
from lark import Tree, Token

_ATOM_TOKEN_TYPES = {
    "ID", "INTEGER_LITERAL", "STRING_LITERAL", "TRUE", "FALSE"
}

def _flatten_expr(tree_or_tok: Any) -> str:
    """Flatten a Token or Tree into a whitespace-normalized string."""
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
    Get the list of parameter types from the 'params' subtree inside exact_pattern / wildcard_pattern.
    Return the flattened list (e.g. ['uint', 'address', 'bytes32[]']).
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
    """Extract function name and argument strings from a function_call node."""
    children = list(call_tree.children)
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx]
                  if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None
    args = _split_call_args(exprs_node, sol_symbols={})
    return func_name, args

def _is_zero_arg_function_call(tree: Tree) -> Optional[str]:
    """Return the function name if the node is a zero-argument function call, else None."""
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
    Return rule parameters as:
    [{"type": "<flatten cvl_type>", "name": "<id|None>"}]

    Grammar:
      params : cvl_type data_location? ID? param*
      param  : "," cvl_type data_location? (ID)?

    In the AST:
      - First parameter: appears directly under 'params' (cvl_type then ID).
      - Remaining parameters: each inside a 'param' subtree within 'params'.
    """
    out: List[dict] = []
    if params_node is None:
        return out

    children = list(params_node.children)

    def _add_param(type_node: Optional[Tree], name_tok: Optional[Token]) -> None:
        if type_node is None:
            return
        out.append({"type": _flatten_tokens_only(type_node), "name": name_tok.value if name_tok else None})

    first_type = next((c for c in children if isinstance(c, Tree) and c.data == "cvl_type"), None)
    if first_type:
        name_tok = None
        seen_type = False
        for ch in children:
            if ch is first_type:
                seen_type = True
                continue
            if isinstance(ch, Tree) and ch.data == "param":
                break
            if seen_type and isinstance(ch, Token) and ch.type == "ID":
                name_tok = ch
                break
        _add_param(first_type, name_tok)

    for ch in children:
        if isinstance(ch, Tree) and ch.data == "param":
            ptype = next((sub for sub in ch.children if isinstance(sub, Tree) and sub.data == "cvl_type"), None)
            pname = next((sub for sub in ch.children if isinstance(sub, Token) and sub.type == "ID"), None)
            _add_param(ptype, pname)

    return out

def _flatten_tokens_only(x: Any) -> str:
    """
    Combine tokens as before, WITHOUT state-var mapping logic.
    Internal use to build the raw string.
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
    Render based on the symbol table:
    - If name is state_var:
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
    return f"{name}(" + ", ".join(args) + ")"


def _flatten_expr_with_symbols(tree_or_tok: Any, sol_symbols: dict) -> str:
    """
    Flatten expressions while distinguishing function vs state_var/mapping for correct rendering.
    - Recursive on all nodes: ensures nested function_call inside expr are rendered properly.
    """
    if isinstance(tree_or_tok, Token):
        return tree_or_tok.value

    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "function_call":
        fname, fargs = _get_function_call_info(tree_or_tok)
        if fname is None:
            return ""
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
    
    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "special_var_attribute_call":
        name_tok = next(
            (t for t in tree_or_tok.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")),
            None
        )
        attr_tok = next(
            (t for t in tree_or_tok.scan_values(
                lambda v: isinstance(v, Token) and getattr(v, "type", None) in ("SUM",)
            )),
            None
        )
        if name_tok and attr_tok:
            return f"{name_tok.value}.{attr_tok.value}"
        return _flatten_tokens_only(tree_or_tok)
    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "contract_attribute_call":
        attr_node = next(
            (ch for ch in tree_or_tok.children if isinstance(ch, Tree) and ch.data == "contract_attribute"),
            None
        )
        attr = _flatten_tokens_only(attr_node) if attr_node is not None else None
        return f"contract.{attr}" if attr else "contract"

    if isinstance(tree_or_tok, Tree):
        parts = []
        for ch in tree_or_tok.children:
            parts.append(_flatten_expr_with_symbols(ch, sol_symbols))
        s = " ".join([p for p in parts if p is not None])
        s = s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
        return s.strip()

    return str(tree_or_tok)

def _collect_call_like_from_expr(expr_node: Optional[Tree], sol_symbols: dict) -> List[Dict[str, Any]]:
    """
    Return a list of 'func_calls' from one expr:
      - function_call: {"name", "args", "decl_kind", "rendered"}
      - special_var_attribute_call: {"name", "attr", "decl_kind":"state_var_attr", "rendered": "name.attr"}
      - contract_attribute_call: {"name":"contract", "attr":("balance"|"address"), "decl_kind":"contract_attr", "rendered":"contract.balance"}
    """
    if expr_node is None:
        return []

    calls: List[Dict[str, Any]] = []

    for fc in expr_node.iter_subtrees_topdown():
        if not (isinstance(fc, Tree) and fc.data == "function_call"):
            continue
        fname, _ = _get_function_call_info(fc)
        if not fname:
            continue

        fargs: List[str] = []
        exprs_node = next((ch for ch in fc.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        if exprs_node is not None:
            cur = []
            for ch in exprs_node.children:
                if isinstance(ch, Token) and ch.value == ",":
                    if cur:
                        fargs.append(_flatten_expr_with_symbols_list(cur, sol_symbols))
                        cur = []
                else:
                    cur.append(ch)
            if cur:
                fargs.append(_flatten_expr_with_symbols_list(cur, sol_symbols))

        if fname in sol_symbols.get("state_vars", set()):
            decl_kind = "state_var"
        elif fname in sol_symbols.get("functions", set()):
            decl_kind = "function"
        else:
            decl_kind = "unknown"

        rendered = _render_call(fname, fargs, sol_symbols)
        calls.append({
            "name": fname,
            "args": fargs,
            "decl_kind": decl_kind,
            "rendered": rendered
        })

    for sv in expr_node.iter_subtrees_topdown():
        if not (isinstance(sv, Tree) and sv.data == "special_var_attribute_call"):
            continue
        id_tok = next((t for t in sv.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")), None)
        attr_tok = next((t for t in sv.scan_values(lambda v: isinstance(v, Token) and v.type in ("SUM",))), None)
        name = id_tok.value if id_tok else None
        attr = (attr_tok.value.lower() if attr_tok else None)
        if not name:
            continue
        rendered = f"{name}.{attr}" if attr else name
        calls.append({
            "name": name,
            "args": [],
            "decl_kind": "state_var_attr",
            "attr": attr,
            "rendered": rendered
        })

    for ca in expr_node.iter_subtrees_topdown():
        if not (isinstance(ca, Tree) and ca.data == "contract_attribute_call"):
            continue

        attr_node = next(
            (ch for ch in ca.children if isinstance(ch, Tree) and ch.data == "contract_attribute"),
            None
        )
        attr = _flatten_tokens_only(attr_node) if attr_node is not None else None
        rendered = f"contract.{attr}" if attr else "contract"

        calls.append({
            "name": "contract",
            "args": [],
            "decl_kind": "contract_attr",
            "attr": attr,
            "rendered": rendered
        })

    return calls

def _flatten_expr_with_symbols_list(nodes: List[Any], sol_symbols: dict) -> str:
    """Flatten a list of nodes into a single string with symbol-aware rendering."""
    parts = []
    for n in nodes:
        parts.append(_flatten_expr_with_symbols(n, sol_symbols))
    s = " ".join(parts)
    return s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".").strip()

def _is_atom_token(tok: Token) -> bool:
    """Return True if the token represents an atomic argument component."""
    return isinstance(tok, Token) and tok.type in _ATOM_TOKEN_TYPES

def _split_call_args(exprs_node: Optional[Tree], sol_symbols: dict) -> List[str]:
    """
    Split args from 'exprs' node WITHOUT relying on commas in the AST.
    Strategy:
      - If any child Tree exists (complex expr) → flatten whole thing into a single argument.
      - If only Tokens:
          * If a comma appears → use existing logic to split by ','.
          * If NO comma:
              - If all tokens are 'atomic' (ID/number/string/true/false) → each token is ONE argument.
              - Otherwise (operators/brackets/...) → treat as ONE argument.
    """
    if exprs_node is None:
        return []

    if any(isinstance(ch, Tree) for ch in exprs_node.children):
        return [_flatten_expr_with_symbols_list(list(exprs_node.children), sol_symbols).strip()]

    toks = [ch for ch in exprs_node.children if isinstance(ch, Token)]
    if not toks:
        return []

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

    if all(_is_atom_token(t) for t in toks):
        return [t.value for t in toks]

    return [_flatten_expr_with_symbols_list(toks, sol_symbols).strip()]

BIN_PRECEDENCE = {
    "||": 1,
    "&&": 2,

    "=>": 3,
    "<=>": 4,

    "==": 5, "!=": 5,

    "<": 6, "<=": 6, ">": 6, ">=": 6,

    "+": 7, "-": 7,

    "*": 8, "/": 8, "%": 8,
}

UNARY_PRECEDENCE = 9

UNARY_PRECEDENCE = 7

def fmt(node):
    """Format an expression tree into Solidity-like text with precedence tracking."""
    if isinstance(node, Token):
        return node.value, 100
    if not isinstance(node, Tree):
        return str(node), 100

    if (
        node.data == "expr"
        and len(node.children) >= 4
        and isinstance(node.children[0], Token)
        and node.children[0].type == "QUANTIFIER"
    ):
        quant_tok = node.children[0]
        type_node = node.children[1]
        var_tok = node.children[2]
        body_node = node.children[3]

        type_txt, _ = fmt(type_node)
        var_txt, _ = fmt(var_tok)
        body_txt, _ = fmt(body_node)

        return f"{quant_tok.value} ({type_txt} {var_txt}) {body_txt}", 100

    if node.data == "unary_expr":
        op = node.children[0].children[0].value
        t, p = fmt(node.children[1])
        if p < UNARY_PRECEDENCE: t = f"({t})"
        return f"{op}{t}", UNARY_PRECEDENCE

    if node.data == "special_var_attribute_call":
        base = node.children[0]
        attr = node.children[1]
        base_txt, _ = fmt(base)
        attr_tok = attr.children[0]
        if attr_tok.value == "sum":
            return f"__verifier_sum_uint({base_txt})", 100
        elif attr_tok.value == "isum":
            return f"__verifier_sum_int({base_txt})", 100
        return f"{base_txt}.{attr_tok.value}", 100

    if node.data == "contract_attribute_call":
        c = node.children[0]
        a = node.children[1]
        attr_val = a.children[0].value if getattr(a, "children", None) else a.value
        if attr_val == "address":
            return "address(this)", 100
        if attr_val == "balance":
            return "address(this).balance", 100
        return f"{c.value}.{attr_val}", 100

    if node.data == "function_call":
        exprs_node = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        id_toks = [t.value for t in node.children if isinstance(t, Token) and t.type == "ID"]
        fname = ".".join(id_toks) if id_toks else ""
        args: List[str] = []
        if exprs_node:
            for ch in exprs_node.children:
                if isinstance(ch, Tree):
                    atxt, _ = fmt(ch)
                    args.append(atxt)
        return f"{fname}(" + ", ".join(args) + ")", 10
    
    if node.data == "cast_function_expr":
        # Handle casts like address(0)
        cast_name = next(
            (_flatten_tokens_only(ch) for ch in node.children
             if isinstance(ch, Tree) and ch.data == "cast_function"),
            None
        )
        arg_txt = next((t.value for t in node.children if isinstance(t, Token) and t.type == "INTEGER_LITERAL"), None)
        if cast_name and arg_txt is not None:
            return f"{cast_name}({arg_txt})", 10

        # Fallback to generic formatting in case the grammar expands
        exprs_node = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        id_toks = [t.value for t in node.children if isinstance(t, Token) and t.type == "ID"]
        fname = ".".join(id_toks) if id_toks else ""
        args: List[str] = []
        if exprs_node:
            for ch in exprs_node.children:
                if isinstance(ch, Tree):
                    atxt, _ = fmt(ch)
                    args.append(atxt)
        return f"{fname}(" + ", ".join(args) + ")", 10

    if node.data == "index":
        items = []
        for e in node.children:
            t, _ = fmt(e)
            items.append(f"[{t}]")
        return "".join(items), 100
    
    if node.data == "attribute":
        items = []
        for e in node.children:
            t, _ = fmt(e)
            items.append(f".{t}")
        return "".join(items), 100
    
    if node.data == "logic_bi_expr":
        left = node.children[0]
        op_node = node.children[1]
        right = node.children[2]

        op = op_node.children[0].value

        my_prec = BIN_PRECEDENCE[op]

        if op == "=>":
            ltxt, lp = fmt(left)
            rtxt, rp = fmt(right)

            if lp < my_prec:
                ltxt = f"({ltxt})"

            if rp <= my_prec:
                rtxt = f"({rtxt})"

            return f"{ltxt} {op} {rtxt}", my_prec

        ltxt, lp = fmt(left)
        rtxt, rp = fmt(right)

        if lp < my_prec:
            ltxt = f"({ltxt})"
        if rp < my_prec:
            rtxt = f"({rtxt})"

        return f"{ltxt} {op} {rtxt}", my_prec

    if node.data == "bi_expr" or node.data == "compare_bi_expr":
        if (len(node.children) == 3 and
            isinstance(node.children[1], Tree) and
            (node.children[1].data == "binop" or node.children[1].data == "compare_binop")):

            left, op_node, right = node.children
            op = op_node.children[0].value
            prec = BIN_PRECEDENCE.get(op, 1)

            ltxt, lp = fmt(left)
            rtxt, rp = fmt(right)
            if lp < prec: ltxt = f"({ltxt})"
            if rp < prec: rtxt = f"({rtxt})"

            return f"{ltxt} {op} {rtxt}", prec

        parts = []
        mp = 0
        for c in node.children:
            t, p = fmt(c)
            parts.append(t)
            mp = max(mp, p)
        return " ".join(parts), mp
    
    if node.data == "expr" or node.data == "modify_var":
        if len(node.children) == 2 and isinstance(node.children[0], Token) and node.children[0].type == "ID" and isinstance(node.children[1], Tree) and node.children[1].data == "index":
            base_txt, _ = fmt(node.children[0])
            idx_txt, _ = fmt(node.children[1])
            return f"{base_txt}{idx_txt}", 100
        if len(node.children) == 2 and isinstance(node.children[0], Token) and node.children[0].type == "ID" and isinstance(node.children[1], Tree) and node.children[1].data == "attribute":
            base_txt, _ = fmt(node.children[0])
            attr_txt, _ = fmt(node.children[1])
            return f"{base_txt}{attr_txt}", 100
        if len(node.children) == 3 and isinstance(node.children[0], Token) and node.children[0].type == "ID" and isinstance(node.children[1], Tree) and node.children[1].data == "index" and isinstance(node.children[2], Tree) and node.children[2].data == "attribute":
            base_txt, _ = fmt(node.children[0])
            idx_txt, _ = fmt(node.children[1])
            attr_txt, _ = fmt(node.children[2])
            return f"{base_txt}{idx_txt}{attr_txt}", 100

    if len(node.children) == 1:
        return fmt(node.children[0])

    parts = []
    mp = 0
    for c in node.children:
        t, p = fmt(c)
        parts.append(t)
        mp = max(mp, p)
    return " ".join(parts), mp

def to_text(expr : Tree) -> str:
    """Convert a Tree expression to formatted text."""
    text, _ = fmt(expr)
    return text
