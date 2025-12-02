from lark import Tree, Token
from typing import Dict, Any, List, Optional, Tuple
import re
from copy import deepcopy
from parser_utils import to_text

def make_unary_not(child: Tree) -> Tree:
    return Tree("unary_expr", [
        Tree("unop", [Token("BANG", "!")]),
        child
    ])

def make_binary(left: Tree, op: str, right: Tree) -> Tree:
    return Tree("bi_expr", [
        left,
        Tree("binop", [Token(op, op)]),
        right
    ])

def make_binary_logic(left: Tree, op: str, right: Tree) -> Tree:
    return Tree("logic_bi_expr", [
        left,
        Tree("logic_binop", [Token(op, op)]),
        right
    ])

def make_binary_compare(left: Tree, op: str, right: Tree) -> Tree:
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
    Trả về phủ định logic của expression theo cấu trúc AST Lark.
    Bao gồm literal, unary, binary, exprs và QUANTIFIER.
    """

    if isinstance(expr, Tree) and expr.data == "literal":
        tok = expr.children[0]
        if tok.type == "TRUE":
            return Tree("literal", [Token("FALSE", "false")])
        if tok.type == "FALSE":
            return Tree("literal", [Token("TRUE", "true")])
        # literal khác → phủ định bằng unary
        return make_unary_not(expr)

    if isinstance(expr, Tree) and expr.children:
        if (len(expr.children) >= 4 and 
            isinstance(expr.children[0], Token) and 
            expr.children[0].type == "QUANTIFIER"):

            quant_tok   = expr.children[0]   # QUANTIFIER token
            cvl_type    = expr.children[1]   # type tree
            var_name    = expr.children[2]   # Token ID
            body        = expr.children[3]   # expr

            quant = quant_tok.value
            neg_body = negative(body)

            if quant == "forall":
                new_quant = Token("QUANTIFIER", "exists")
            else:
                new_quant = Token("QUANTIFIER", "forall")

            # tái tạo node:
            return Tree(expr.data, [
                new_quant,
                cvl_type,
                var_name,
                neg_body
            ])

    if isinstance(expr, Tree) and expr.data == "unary_expr":
        unop_node = expr.children[0]         # Tree('unop')
        op_tok = unop_node.children[0]       # Token

        if op_tok.type == "BANG":
            # !( !A ) → A
            return expr.children[1]

        # phủ định các unary khác: -(A), ~(A)
        return make_unary_not(expr)


    if isinstance(expr, Tree) and expr.data == "logic_bi_expr" or expr.data == "compare_bi_expr":

        if (
            len(expr.children) == 3
            and isinstance(expr.children[1], Tree)
            and expr.children[1].data == "logic_binop" or expr.children[1].data == "compare_binop"
        ):
            left = expr.children[0]
            binop_node = expr.children[1]
            right = expr.children[2]

            op_tok = binop_node.children[0]
            op = op_tok.value

            # AND/OR → De Morgan
            if op == "&&":
                return make_binary_logic(
                    negative(left), "||", negative(right)
                )
            if op == "||":
                return make_binary_logic(
                    negative(left), "&&", negative(right)
                )

            # So sánh → đổi operator
            if op in NEGATE_BINOP:
                new_op = NEGATE_BINOP[op]
                return make_binary_compare(left, new_op, right)

            # các binary khác → bọc phủ định
            return make_unary_not(expr)

    if isinstance(expr, Tree) and expr.data == "exprs":
        if len(expr.children) == 1:
            return negative(expr.children[0])
        # nhiều expr, không có nghĩa logic → bọc !
        return make_unary_not(expr)

    return make_unary_not(expr)

def remove_arrows(expr: Tree) -> Tree:
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
    """Hàm thay thế biến trong biểu thức theo subst_dict."""
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
    Chuẩn hoá giá trị thành Token/Tree để nhúng vào biểu thức.
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
    Bọc giá trị thành Tree('expr', ...) nếu cần.
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
    Dedupe danh sách biểu thức theo chuỗi to_text.
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

def evaluate_expr_at_function(expr: Tree, func: str) -> Tree:
    """
    Giải quyết func_compare_expr tại function cụ thể.
    """
    if not isinstance(expr, Tree):
        return expr

    def _eval(node: Tree) -> Tree:
        if not isinstance(node, Tree):
            return node
        # func_compare_expr: "funcCompare(" ID "," STRING_LITERAL ")"
        if node.data == "func_compare_expr":
            fn_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")), None)
            str_tok = next((t for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "STRING_LITERAL")), None)
            target = str_tok.value[1:-1] if str_tok else ""
            val_bool = (target == func)
            val = "true" if val_bool else "false"
            return Tree("literal", [Token("TRUE" if val == "true" else "FALSE", val)])
        # default: recurse
        new_children = [_eval(ch) if isinstance(ch, Tree) else ch for ch in node.children]
        return Tree(node.data, new_children)

    return _eval(expr)

def solve_free_vars_in_pres_and_posts(
    pres: Dict[str, List[Any]],
    posts: Dict[str, List[Any]],
    var_to_type: Dict[str, str],
    var_to_value: Dict[str, Any]
) -> Tuple[Dict[str, List[Any]], Dict[str, List[Any]]]:
    """
    Giải quyết các biến tự do trong pre/postconditions của từng hàm.
    - Nếu Q chứa biến tự do n chưa biết: Post(forall n. Q, f)
    - Nếu require P; f(); assert Q; → Post(forall n. P => Q, f)
      (ở đây pres/posts đã tách theo hàm; ta sẽ chỉ thêm quantifier với biến xuất hiện trong Q nhưng không có trong var_to_type/var_to_value)
    - require P; f() -> None (pre không propagate ở đây)
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
        # đơn giản gói từng biến bằng quantifier forall (mathint)
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
                    neg_pre = negative(deepcopy(pre_ex))
                    implication = Tree("logic_bi_expr", [
                        neg_pre,
                        Tree("logic_binop", [Token("OROR", "||")]),
                        deepcopy(post_ex)
                    ])
                    out_posts.append(_wrap_forall(union_vars, implication))
            if not matched:
                out_posts.append(_wrap_forall(fv_post, post_ex))

        # keep preconditions not consumed
        remaining_pre = []
        for idx, pre_ex in enumerate(pre_list):
            if idx in used_pre_idx:
                continue
            if isinstance(pre_ex, Tree):
                fv_pre = _free_vars(pre_ex)
                if fv_pre:
                    # require P; f() with free vars and no matching post → drop
                    continue
            remaining_pre.append(pre_ex)
        if remaining_pre:
            new_pres[fn] = remaining_pre
        if out_posts:
            new_posts[fn] = out_posts

    return new_pres, new_posts
