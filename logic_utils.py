from lark import Tree, Token
from typing import Dict, Any, List, Optional
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
    return