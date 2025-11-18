# spec_parser.py
import re
from typing import Dict, List, Tuple, Optional, Any
from lark import Tree, Token

# === NEW: helpers for robust arg splitting without commas in AST ===
_ATOM_TOKEN_TYPES = {
    "ID", "INTEGER_LITERAL", "STRING_LITERAL", "TRUE", "FALSE"
}

# ===== Helpers (public if other modules import) =====
def _flatten_expr(tree_or_tok: Any) -> str:
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
    Lấy danh sách kiểu tham số từ subtree 'params' bên trong exact_pattern / wildcard_pattern.
    Trả về list chuỗi đã flatten (ví dụ: ['uint', 'address', 'bytes32[]']).
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
    children = list(call_tree.children)
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx]
                  if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None
    # DÙNG splitter mới; ở đây không cần sol_symbols nên pass {} để chỉ tách theo dấu phẩy
    args = _split_call_args(exprs_node, sol_symbols={})
    return func_name, args

def _is_zero_arg_function_call(tree: Tree) -> Optional[str]:
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
    Trả về danh sách tham số của rule dạng:
    [{"type": "<flatten cvl_type>", "name": "<id|None>"}]

    Grammar:
      params : cvl_type data_location? ID? param*
      param  : "," cvl_type data_location? (ID)?

    Thực tế trong AST:
      - Tham số đầu tiên: xuất hiện trực tiếp dưới 'params' (cvl_type rồi ID).
      - Các tham số còn lại: mỗi cái nằm trong một subtree 'param' bên trong 'params'.
    """
    out: List[dict] = []
    if params_node is None:
        return out

    # 1) Lấy tham số đầu tiên trực tiếp dưới 'params'
    children = list(params_node.children)
    i = 0
    while i < len(children):
        ch = children[i]
        if isinstance(ch, Tree) and ch.data == "cvl_type":
            ty = _flatten_tokens_only(ch)
            name = None
            # token ID ngay sau đó (nếu có) thuộc tham số đầu tiên
            j = i + 1
            while j < len(children):
                nxt = children[j]
                # gặp 'param' -> dừng, vì phần sau là các tham số tiếp theo
                if isinstance(nxt, Tree) and nxt.data == "param":
                    break
                if isinstance(nxt, Token) and nxt.type == "ID":
                    name = nxt.value
                    j += 1
                    break
                j += 1
            out.append({"type": ty, "name": name})
            break  # chỉ có duy nhất 1 "đầu" trực tiếp dưới params
        i += 1

    # 2) Lấy các tham số còn lại bên trong từng 'param'
    for ch in children:
        if isinstance(ch, Tree) and ch.data == "param":
            ptype = None
            pname = None
            for sub in ch.children:
                if isinstance(sub, Tree) and sub.data == "cvl_type":
                    ptype = _flatten_tokens_only(sub)
                elif isinstance(sub, Token) and sub.type == "ID":
                    pname = sub.value
            if ptype:
                out.append({"type": ptype, "name": pname})

    return out

def _flatten_tokens_only(x: Any) -> str:
    """
    Gộp tokens như trước, KHÔNG có logic state-var mapping.
    Dùng nội bộ để gom chuỗi 'thô'.
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
    Render theo bảng symbol:
    - Nếu name là state_var: 
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
    # function
    return f"{name}(" + ", ".join(args) + ")"


def _flatten_expr_with_symbols(tree_or_tok: Any, sol_symbols: dict) -> str:
    """
    Flatten biểu thức nhưng biết phân biệt function vs state_var/mapping để render đúng.
    - ĐỆ QUY trên mọi node: đảm bảo các function_call lồng trong expr đều được render chuẩn.
    """
    # Token → trả lại nguyên giá trị
    if isinstance(tree_or_tok, Token):
        return tree_or_tok.value

    # function_call → render đặc biệt (function vs state var/mapping)
    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "function_call":
        fname, fargs = _get_function_call_info(tree_or_tok)
        if fname is None:
            return ""
        # Flatten từng arg (đệ quy) để giữ chuẩn hoá
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
    
    # --- special_var_attribute_call: ID "." special_var_attribute
    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "special_var_attribute_call":
        # Tên: ID có thể là con trực tiếp
        name_tok = next(
            (t for t in tree_or_tok.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")),
            None
        )
        # Thuộc tính: token SUM có thể nằm trong Tree('special_var_attribute', [Token('SUM','sum')])
        attr_tok = next(
            (t for t in tree_or_tok.scan_values(
                lambda v: isinstance(v, Token) and getattr(v, "type", None) in ("SUM",)
            )),
            None
        )
        if name_tok and attr_tok:
            return f"{name_tok.value}.{attr_tok.value}"
        # fallback (nếu grammar thay đổi)
        return _flatten_tokens_only(tree_or_tok)
    # contract_attribute_call → "contract.balance" / "contract.address"
    if isinstance(tree_or_tok, Tree) and tree_or_tok.data == "contract_attribute_call":
        # Tìm nhánh con 'contract_attribute', rồi lấy token bên trong (balance/address)
        attr_node = next(
            (ch for ch in tree_or_tok.children if isinstance(ch, Tree) and ch.data == "contract_attribute"),
            None
        )
        attr = _flatten_tokens_only(attr_node) if attr_node is not None else None
        return f"contract.{attr}" if attr else "contract"

    # Các Tree khác (expr, binop, literal, ...) → duyệt đệ quy toàn bộ children
    if isinstance(tree_or_tok, Tree):
        parts = []
        for ch in tree_or_tok.children:
            parts.append(_flatten_expr_with_symbols(ch, sol_symbols))
        s = " ".join([p for p in parts if p is not None])
        # làm sạch spacing
        s = s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
        return s.strip()

    # fallback
    return str(tree_or_tok)

def _collect_call_like_from_expr(expr_node: Optional[Tree], sol_symbols: dict) -> List[Dict[str, Any]]:
    """
    Trả về danh sách 'func_calls' từ 1 expr:
      - function_call: {"name", "args", "decl_kind", "rendered"}
      - special_var_attribute_call: {"name", "attr", "decl_kind":"state_var_attr", "rendered": "name.attr"}
      - contract_attribute_call: {"name":"contract", "attr":("balance"|"address"), "decl_kind":"contract_attr", "rendered":"contract.balance"}
    """
    if expr_node is None:
        return []

    calls: List[Dict[str, Any]] = []

    # 1) function_call
    for fc in expr_node.iter_subtrees_topdown():
        if not (isinstance(fc, Tree) and fc.data == "function_call"):
            continue
        fname, _ = _get_function_call_info(fc)
        if not fname:
            continue

        # render args chuẩn
        fargs: List[str] = []
        exprs_node = next((ch for ch in fc.children if isinstance(ch, Tree) and ch.data == "exprs"), None)
        if exprs_node is not None:
            # dùng lại splitter hiện có (nếu bạn đã tạo); nếu chưa, giữ cách build cur tương tự logic trước
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

        # phân loại từ bảng symbol
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

    # 2) special_var_attribute_call: ID "." special_var_attribute (ví dụ balances.sum)
    for sv in expr_node.iter_subtrees_topdown():
        if not (isinstance(sv, Tree) and sv.data == "special_var_attribute_call"):
            continue
        # Lấy ID và attr
        id_tok = next((t for t in sv.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")), None)
        attr_tok = next((t for t in sv.scan_values(lambda v: isinstance(v, Token) and v.type in ("SUM",))), None)
        name = id_tok.value if id_tok else None
        attr = (attr_tok.value.lower() if attr_tok else None)  # "sum"
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

    # 3) contract_attribute_call: "contract.balance" | "contract.address"
    for ca in expr_node.iter_subtrees_topdown():
        if not (isinstance(ca, Tree) and ca.data == "contract_attribute_call"):
            continue

        # Lấy attr qua nhánh con 'contract_attribute'
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
            "attr": attr,                 # <-- giờ có 'balance' hoặc 'address'
            "rendered": rendered          # <-- "contract.balance" hoặc "contract.address"
        })

    return calls

def _flatten_expr_with_symbols_list(nodes: List[Any], sol_symbols: dict) -> str:
    parts = []
    for n in nodes:
        parts.append(_flatten_expr_with_symbols(n, sol_symbols))
    s = " ".join(parts)
    return s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".").strip()

def _is_atom_token(tok: Token) -> bool:
    return isinstance(tok, Token) and tok.type in _ATOM_TOKEN_TYPES

def _split_call_args(exprs_node: Optional[Tree], sol_symbols: dict) -> List[str]:
    """
    Tách args từ node 'exprs' mà KHÔNG dựa vào comma tồn tại trong AST.
    Chiến lược:
      - Nếu có bất kỳ Tree con (tức là có expr phức tạp) → flatten toàn bộ thành 1 đối số duy nhất.
      - Nếu chỉ có Tokens:
          * Nếu xuất hiện dấu phẩy → dùng logic tách theo ',' (đang có sẵn).
          * Nếu KHÔNG có dấu phẩy:
              - Nếu tất cả tokens đều 'atomic' (ID/number/string/true/false) → mỗi token là MỘT đối số.
              - Ngược lại (thấy toán tử/ngoặc...) → coi là MỘT đối số duy nhất.
    """
    if exprs_node is None:
        return []

    # 1) Nếu có subtree (Tree) → coi như 1 expr (vì không còn delimiter rõ ràng)
    if any(isinstance(ch, Tree) for ch in exprs_node.children):
        # render cả exprs thành 1 đối số
        return [_flatten_expr_with_symbols_list(list(exprs_node.children), sol_symbols).strip()]

    # 2) Chỉ còn Tokens
    toks = [ch for ch in exprs_node.children if isinstance(ch, Token)]
    if not toks:
        return []

    # 2a) Nếu có dấu phẩy trong tokens → tách theo dấu phẩy
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

    # 2b) KHÔNG có dấu phẩy:
    #     - Nếu TẤT CẢ tokens đều là atomic → mỗi token là MỘT đối số.
    #     - Nếu có token không-atomic (toán tử/ngoặc/…): coi toàn bộ là MỘT biểu thức (1 đối số).
    if all(_is_atom_token(t) for t in toks):
        return [t.value for t in toks]  # mỗi token là 1 arg

    # Không thuần atomic → 1 đối số duy nhất
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

from lark import Tree, Token

def fmt(node):
    if isinstance(node, Token):
        return node.value, 100
    if not isinstance(node, Tree):
        return str(node), 100

    # ---- unary ----
    if node.data == "unary_expr":
        op = node.children[0].children[0].value
        t, p = fmt(node.children[1])
        if p < UNARY_PRECEDENCE: t = f"({t})"
        return f"{op}{t}", UNARY_PRECEDENCE

    # ---- special_var_attribute_call : ID "." special_var_attribute ----
    if node.data == "special_var_attribute_call":
        base = node.children[0]
        attr = node.children[1]
        base_txt, _ = fmt(base)
        attr_tok = attr.children[0]
        return f"{base_txt}.{attr_tok.value}", 100

    # ---- contract_attribute_call : contract "." field ----
    if node.data == "contract_attribute_call":
        c = node.children[0]   # CONTRACT token
        a = node.children[1]   # field token
        return f"{c.value}.{a.value}", 100

    # ---- index : "[" expr "]" ... ----
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

        # precedence của logic operator
        my_prec = BIN_PRECEDENCE[op]

        # ---- right associative cho "=>" ----
        if op == "=>":
            ltxt, lp = fmt(left)
            rtxt, rp = fmt(right)

            # left phải ngoặc nếu precedence < my_prec
            if lp < my_prec:
                ltxt = f"({ltxt})"

            # right phải ngoặc nếu precedence <= my_prec
            # (vì right-assoc)
            if rp <= my_prec:
                rtxt = f"({rtxt})"

            return f"{ltxt} {op} {rtxt}", my_prec

        # ---- mặc định: left-associative ----
        ltxt, lp = fmt(left)
        rtxt, rp = fmt(right)

        if lp < my_prec:
            ltxt = f"({ltxt})"
        if rp < my_prec:
            rtxt = f"({rtxt})"

        return f"{ltxt} {op} {rtxt}", my_prec

    # ---- bi_expr ----
    if node.data == "bi_expr":
        if (len(node.children) == 3 and
            isinstance(node.children[1], Tree) and
            node.children[1].data == "binop"):

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
    
    if node.data == "expr":
        if len(node.children) == 2 and isinstance(node.children[0], Token) and node.children[0].type == "ID" and isinstance(node.children[1], Tree) and node.children[1].data == "index":
            base_txt, _ = fmt(node.children[0])
            idx_txt, _ = fmt(node.children[1])
            return f"{base_txt}{idx_txt}", 100
        if len(node.children) == 2 and isinstance(node.children[0], Token) and node.children[0].type == "ID" and isinstance(node.children[1], Tree) and node.children[1].data == "attribute":
            base_txt, _ = fmt(node.children[0])
            idx_txt, _ = fmt(node.children[1])
            return f"{base_txt}{idx_txt}", 100

    # ---- wrapper (exprs, literal, general trees) ----
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
    text, _ = fmt(expr)
    return text
