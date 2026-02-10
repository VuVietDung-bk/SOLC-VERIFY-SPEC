from lark import Tree, Token
from typing import Dict, Any, List, Optional, Tuple
import re
from copy import deepcopy
from parser_utils import to_text
from spec_method import Variable

def make_unary_not(child: Tree) -> Tree:
    """Create a unary negation node wrapping the given child."""
    return Tree("unary_expr", [
        Tree("unop", [Token("BANG", "!")]),
        child
    ])

def make_binary(left: Tree, op: str, right: Tree) -> Tree:
    """Create a generic binary expression node."""
    return Tree("bi_expr", [
        left,
        Tree("binop", [Token(op, op)]),
        right
    ])

def make_binary_logic(left: Tree, op: str, right: Tree) -> Tree:
    """Create a logical binary expression node."""
    return Tree("logic_bi_expr", [
        left,
        Tree("logic_binop", [Token(op, op)]),
        right
    ])

def make_binary_compare(left: Tree, op: str, right: Tree) -> Tree:
    """Create a comparison binary expression node."""
    return Tree("compare_bi_expr", [
        left,
        Tree("compare_bi_expr", [Token(op, op)]),
        right
    ])

NEGATE_BINOP = {
    "<":  ">=",
    "<=": ">",
    ">":  "<=",
    ">=": "<",
    "==": "!=",
    "!=": "==",
}

def negative(expr: Tree) -> Tree:
    """
    Return the logical negation of an expression following the Lark AST structure.
    Covers literals, unary, binary, exprs and QUANTIFIER.
    """

    if isinstance(expr, Tree) and expr.data == "literal":
        tok = expr.children[0]
        if tok.type == "TRUE":
            return Tree("literal", [Token("FALSE", "false")])
        if tok.type == "FALSE":
            return Tree("literal", [Token("TRUE", "true")])
        return make_unary_not(expr)

    if isinstance(expr, Tree) and expr.children:
        if (len(expr.children) >= 4 and 
            isinstance(expr.children[0], Token) and 
            expr.children[0].type == "QUANTIFIER"):

            quant_tok   = expr.children[0]
            cvl_type    = expr.children[1]
            var_name    = expr.children[2]
            body        = expr.children[3]

            quant = quant_tok.value
            neg_body = negative(body)

            if quant == "forall":
                new_quant = Token("QUANTIFIER", "exists")
            else:
                new_quant = Token("QUANTIFIER", "forall")

            return Tree(expr.data, [
                new_quant,
                cvl_type,
                var_name,
                neg_body
            ])

    if isinstance(expr, Tree) and expr.data == "unary_expr":
        unop_node = expr.children[0]
        op_tok = unop_node.children[0]

        if op_tok.type == "BANG":
            return expr.children[1]

        return make_unary_not(expr)


    if isinstance(expr, Tree) and (expr.data == "logic_bi_expr" or expr.data == "compare_bi_expr"):

        if (
            len(expr.children) == 3
            and isinstance(expr.children[1], Tree)
            and (expr.children[1].data == "logic_binop" or expr.children[1].data == "compare_binop")
        ):
            left = expr.children[0]
            binop_node = expr.children[1]
            right = expr.children[2]

            op_tok = binop_node.children[0]
            op = op_tok.value

            if op == "&&":
                return make_binary_logic(
                    negative(left), "||", negative(right)
                )
            if op == "||":
                return make_binary_logic(
                    negative(left), "&&", negative(right)
                )

            if op in NEGATE_BINOP:
                new_op = NEGATE_BINOP[op]
                return make_binary_compare(left, new_op, right)

            return make_unary_not(expr)

    if isinstance(expr, Tree) and expr.data == "exprs":
        if len(expr.children) == 1:
            return negative(expr.children[0])
        return make_unary_not(expr)

    return make_unary_not(expr)

def remove_arrows(expr: Tree) -> Tree:
    """Rewrite implications and biconditionals into equivalent expressions without arrows."""
    if isinstance(expr, Token):
        return expr

    if not isinstance(expr, Tree):
        return expr

    new_children = [remove_arrows(c) for c in expr.children]

    if expr.data != "logic_bi_expr":
        expr.children = new_children
        return expr

    left  = new_children[0]
    opnode = new_children[1]   
    right = new_children[2]

    op = opnode.children[0].value

    if op == "=>":
        return make_binary_logic(
            negative(left),
            "||",
            right
        )

    if op == "<=>":
        p_and_q = make_binary_logic(left, "&&", right)
        np_and_nq = make_binary_logic(
            negative(left),
            "&&",
            negative(right)
        )
        return make_binary_logic(p_and_q, "||", np_and_nq)

    expr.children = new_children
    return expr

def subst_expr(expr: Tree, subst_dict: Dict[str, Any]) -> Tree:
    """Replace variables in an expression according to subst_dict."""
    if isinstance(expr, Token):
        if expr.type == "ID" and expr.value in subst_dict:
            new_value = subst_dict[expr.value]
            return new_value
        return expr
    elif isinstance(expr, Tree):
        new_children = [subst_expr(ch, subst_dict) for ch in expr.children]
        return Tree(expr.data, new_children)
    else:
        return expr
    
def to_expr_piece(val: Any) -> Any:
    """
    Normalize a value into a Token/Tree for embedding into an expression.
    """
    if val is None:
        return None
    if isinstance(val, Tree):
        return deepcopy(val)
    if isinstance(val, Token):
        return Token(val.type, val.value)
    if isinstance(val, str):
        v = val.strip()
        if re.fullmatch(r"\d+", v):
            return Token("INTEGER_LITERAL", v)
        if v == "true":
            return Token("TRUE", v)
        if v == "false":
            return Token("FALSE", v)
        if len(v) >= 2 and ((v[0] == "\"" and v[-1] == "\"") or (v[0] == "'" and v[-1] == "'")):
            return Token("STRING_LITERAL", v)
        return Token("ID", v)
    return Token("ID", str(val))


def wrap_expr(val: Any) -> Optional[Tree]:
    """
    Wrap a value into Tree('expr', ...) when needed.
    """
    if val is None:
        return None
    if isinstance(val, Tree):
        return deepcopy(val)
    if isinstance(val, Token):
        return Tree("expr", [Token(val.type, val.value)])
    piece = to_expr_piece(val)
    if isinstance(piece, Tree):
        return deepcopy(piece)
    if isinstance(piece, Token):
        return Tree("expr", [piece])
    return None


def make_eq_expr(lhs: Any, rhs: Any) -> Optional[Tree]:
    """Create an equality comparison node for two values."""
    lhs_expr = wrap_expr(lhs)
    rhs_expr = wrap_expr(rhs)
    if lhs_expr is None or rhs_expr is None:
        return None
    return Tree("compare_bi_expr", [
        lhs_expr,
        Tree("compare_binop", [Token("EQEQ", "==")]),
        rhs_expr
    ])


def unique_exprs(exprs: List[Any]) -> List[Any]:
    """
    Dedupe the list of expressions based on the to_text string.
    """
    seen = set()
    out: List[Any] = []
    for e in exprs:
        if e is None:
            continue
        key = to_text(e) if isinstance(e, Tree) else str(e)
        if key in seen:
            continue
        seen.add(key)
        out.append(e)
    return out

def wrap_old_access(access: Tree | Token, kind: str) -> Tree:
    """
    Create a call node __verifier_old_<kind>(access) while keeping Tree shape.
    kind: 'uint' | 'int' | 'bytes'
    """
    func_name = f"__verifier_old_{kind}"
    return Tree("function_call", [
        Token("ID", func_name),
        Tree("exprs", [Tree("expr", [deepcopy(access)])])
    ])

def wrap_old_access_event(access: Tree | Token, kind: str) -> Tree:
    """
    Create a call node __verifier_old_<kind>(access) while keeping Tree shape.
    kind: 'uint' | 'int' | 'bytes'
    """
    func_name = f"__verifier_before_{kind}"
    return Tree("function_call", [
        Token("ID", func_name),
        Tree("exprs", [Tree("expr", [deepcopy(access)])])
    ])

def oldify_expr(expr_node: Optional[Tree], variables: List[Variable], skip=None) -> Optional[Tree]:
    """
    Thay các biến thuộc self.variables thành __verifier_old_<kind>(var)
    (uint*/int*/bytes*/string) trừ những biến trong skip.
    """
    if expr_node is None:
        return None
    skip_set = set(skip) if skip else set()
    subst_map: Dict[str, Any] = {}
    vars_iter = []
    if isinstance(variables, dict):
        vars_iter = variables.values()
    elif isinstance(variables, list):
        vars_iter = variables
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
            elif vtype == "address":
                wrap = "__verifier_old_address"
        if wrap:
            subst_map[vname] = Token("ID", f"{wrap}({vname})")
    new_node: Tree = None
    if not subst_map:
        new_node = expr_node
    new_node = subst_expr(deepcopy(expr_node), subst_map)
    
    return wrap_old_expr(new_node, vars_iter)

def wrap_old_expr(expr: Tree | Token, vars_iter: List[Variable]) -> Tree:
    """
    Filter mapping variables, then traverse expr to wrap accesses with __verifier_old_<kind>().
    Return the wrapped expr.
    """
    if expr is None:
        return expr

    type_map: Dict[str, str] = {}
    for v in vars_iter or []:
        vname = getattr(v, "name", None) if hasattr(v, "name") else None
        vtype = getattr(v, "vtype", None) if hasattr(v, "vtype") else None
        if vname and isinstance(vtype, str):
            type_map[vname] = vtype

    def _choose_wrap(vtype: Optional[str]) -> Optional[str]:
        if not isinstance(vtype, str):
            return None
        vt = vtype.strip()
        if vt.startswith("uint"):
            return "uint"
        if vt.startswith("int"):
            return "int"
        if vt.startswith("bytes") or vt == "string":
            return "bytes"
        if vt == "bool":
            return "bool"
        if vt == "address":
            return "address"
        return None

    def _peel_element(vt: Optional[str], depth: int) -> Optional[str]:
        cur = vt or ""
        d = depth
        while d > 0 and isinstance(cur, str):
            cur = cur.strip()
            if cur.startswith("mapping") and "=>" in cur:
                tail = cur.split("=>", 1)[1]
                if tail.endswith(")"):
                    tail = tail[:-1]
                cur = tail.strip()
            elif cur.endswith("]"):
                cur = cur[:cur.rfind("[")].strip()
            else:
                break
            d -= 1
        return cur

    def _rule_name(data):
        return data.value if isinstance(data, Token) else data

    def _index_depth(expr_node):
        depth = 0
        for ch in expr_node.children:
            if isinstance(ch, Tree) and _rule_name(ch.data) == "index":
                depth += len(ch.children)
        return depth

    def _transform(node: Any) -> Any:
        if isinstance(node, Token):
            return node
        if not isinstance(node, Tree):
            return node

        if _rule_name(node.data) == "contract_attribute_call":
            attr_tok = next(
                (t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type in ("BALANCE", "ADDRESS"))),
                None
            )
            if attr_tok and attr_tok.type == "BALANCE":
                return wrap_old_access(deepcopy(node), "uint")
            return node

        if _rule_name(node.data) == "special_var_attribute_call":
            id_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")), None)
            address_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "INTEGER_LITERAL")), None)
            attr_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "LENGTH")), None)
            if (id_tok or address_tok) and attr_tok:
                return wrap_old_access(deepcopy(node), "uint")
            attr_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "BALANCE")), None)
            if (id_tok or address_tok) and attr_tok:
                return wrap_old_access(deepcopy(node), "uint")
            return node

        if _rule_name(node.data) == "expr" and node.children:
            base_tok = node.children[0] if isinstance(node.children[0], Token) else None
            if base_tok and base_tok.type == "ID":
                base_name = base_tok.value
                for ch in node.children:
                    if isinstance(ch, Tree) and ch.data == "attribute":
                        attr_tok = next(
                            (t for t in ch.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")),
                            None
                        )
                        if attr_tok:
                            if attr_tok.value == "balance":
                                return wrap_old_access(deepcopy(node), "uint")
                if base_name in type_map:
                    idx_count = _index_depth(node)
                    vtype = _peel_element(type_map.get(base_name), idx_count)
                    wrap_kind = _choose_wrap(vtype)
                    if wrap_kind:
                        return wrap_old_access(deepcopy(node), wrap_kind)

        new_children = [_transform(ch) for ch in node.children]
        return Tree(node.data, new_children)

    return _transform(deepcopy(expr))

def wrap_old_expr_event(expr: Tree | Token, vars_iter: List[Variable]) -> Tree:
    """
    Filter mapping variables, then traverse expr to wrap accesses with __verifier_old_<kind>().
    Return the wrapped expr.
    """
    if expr is None:
        return expr

    type_map: Dict[str, str] = {}
    for v in vars_iter or []:
        vname = getattr(v, "name", None) if hasattr(v, "name") else None
        vtype = getattr(v, "vtype", None) if hasattr(v, "vtype") else None
        if vname and isinstance(vtype, str):
            type_map[vname] = vtype

    def _choose_wrap(vtype: Optional[str]) -> Optional[str]:
        if not isinstance(vtype, str):
            return None
        vt = vtype.strip()
        if vt.startswith("uint"):
            return "uint"
        if vt.startswith("int"):
            return "int"
        if vt.startswith("bytes") or vt == "string":
            return "bytes"
        if vt == "bool":
            return "bool"
        if vt == "address":
            return "address"
        return None

    def _peel_element(vt: Optional[str], depth: int) -> Optional[str]:
        cur = vt or ""
        d = depth
        while d > 0 and isinstance(cur, str):
            cur = cur.strip()
            if cur.startswith("mapping") and "=>" in cur:
                tail = cur.split("=>", 1)[1]
                if tail.endswith(")"):
                    tail = tail[:-1]
                cur = tail.strip()
            elif cur.endswith("]"):
                cur = cur[:cur.rfind("[")].strip()
            else:
                break
            d -= 1
        return cur

    def _rule_name(data):
        return data.value if isinstance(data, Token) else data

    def _index_depth(expr_node):
        depth = 0
        for ch in expr_node.children:
            if isinstance(ch, Tree) and _rule_name(ch.data) == "index":
                depth += len(ch.children)
        return depth

    def _transform(node: Any) -> Any:
        if isinstance(node, Token):
            return node
        if not isinstance(node, Tree):
            return node
        
        if _rule_name(node.data) == "contract_attribute_call":
            attr_tok = next(
                (t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type in ("BALANCE", "ADDRESS"))),
                None
            )
            if attr_tok and attr_tok.type == "BALANCE":
                return wrap_old_access_event(deepcopy(node), "uint")
            return node

        if _rule_name(node.data) == "special_var_attribute_call":
            id_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")), None)
            attr_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "LENGTH")), None)
            if id_tok and attr_tok:
                return wrap_old_access_event(deepcopy(node), "uint")
            return node

        if _rule_name(node.data) == "expr" and node.children:
            base_tok = node.children[0] if isinstance(node.children[0], Token) else None
            if base_tok and base_tok.type == "ID":
                base_name = base_tok.value
                if base_name in type_map:
                    idx_count = _index_depth(node)
                    vtype = _peel_element(type_map.get(base_name), idx_count)
                    wrap_kind = _choose_wrap(vtype)
                    if wrap_kind:
                        return wrap_old_access_event(deepcopy(node), wrap_kind)

        new_children = [_transform(ch) for ch in node.children]
        return Tree(node.data, new_children)

    return _transform(deepcopy(expr))

def evaluate_expr_at_function(expr: Tree, func: str) -> Tree:
    """
    Resolve func_compare_expr at a specific function.
    """
    if not isinstance(expr, Tree):
        return expr

    def _eval(node: Tree) -> Tree:
        if not isinstance(node, Tree):
            return node
        if node.data == "func_compare_expr":
            fn_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")), None)
            str_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "STRING_LITERAL")), None)
            target = str_tok.value[1:-1] if str_tok else ""
            val_bool = (target == func)
            val = "true" if val_bool else "false"
            return Tree("literal", [Token("TRUE" if val == "true" else "FALSE", val)])
        new_children = [_eval(ch) if isinstance(ch, Tree) else ch for ch in node.children]
        return Tree(node.data, new_children)

    return _eval(expr)

def solve_free_vars_in_pres_and_posts(
    pres: Dict[str, List[Any]],
    posts: Dict[str, List[Any]],
    var_to_type: Dict[str, str],
    var_to_value: Dict[str, Any],
    variables: List[Variable]
) -> Tuple[Dict[str, List[Any]], Dict[str, List[Any]]]:
    """
    Resolve free variables in pre/postconditions per function.
    - If Q contains an unknown free var n: Post(forall n. Q, f)
    - If require P; f(); assert Q; → Post(forall n. P => Q, f)
      (here pres/posts are already separated per function; we only add quantifiers for vars in Q absent from var_to_type/var_to_value)
    - Preconditions with unmatched free vars are dropped when they cannot pair with a postcondition.
    """
    def _free_vars(expr: Tree) -> set:
        free = set()
        for tok in expr.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
            name = tok.value
            in_type = name in var_to_type
            val = var_to_value.get(name, None)
            if in_type and val is None:
                free.add(name)
        return free

    def _wrap_forall(vars_set: set, body: Tree) -> Tree:
        if not vars_set:
            return body
        res = body
        for v in sorted(vars_set):
            res = Tree("expr", [
                Token("QUANTIFIER", "forall"),
                Tree("cvl_type", [Token("PRIMITIVE_CVL_TYPE", var_to_type[v])]),
                Token("ID", v),
                res
            ])
        return res

    new_pres: Dict[str, List[Any]] = {}
    new_posts: Dict[str, List[Any]] = {}

    all_funcs = set(pres.keys()) | set(posts.keys())

    for fn in all_funcs:
        pre_list = pres.get(fn, []) or []
        post_list = posts.get(fn, []) or []
        used_pre_idx: set = set()

        out_posts: List[Any] = []

        for post_ex in post_list:
            if not isinstance(post_ex, Tree):
                out_posts.append(post_ex)
                continue
            fv_post = _free_vars(post_ex)
            matched = False
            for idx, pre_ex in enumerate(pre_list):
                if not isinstance(pre_ex, Tree):
                    continue
                fv_pre = _free_vars(pre_ex)
                if fv_pre & fv_post:
                    matched = True
                    used_pre_idx.add(idx)
                    union_vars = fv_pre | fv_post
                    
                    oldified_pre = oldify_expr(pre_ex, variables)
                    neg_pre = negative(deepcopy(oldified_pre))
                    implication = Tree("logic_bi_expr", [
                        neg_pre,
                        Tree("logic_binop", [Token("OROR", "||")]),
                        deepcopy(post_ex)
                    ])
                    out_posts.append(_wrap_forall(union_vars, implication))
            if not matched:
                out_posts.append(_wrap_forall(fv_post, post_ex))

        remaining_pre = []
        for idx, pre_ex in enumerate(pre_list):
            if idx in used_pre_idx:
                continue
            if isinstance(pre_ex, Tree):
                fv_pre = _free_vars(pre_ex)
                if fv_pre:
                    continue
            remaining_pre.append(pre_ex)
        if remaining_pre:
            new_pres[fn] = remaining_pre
        if out_posts:
            new_posts[fn] = out_posts

    return new_pres, new_posts
