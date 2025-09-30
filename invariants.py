# invariants.py
import os
import re
from typing import Any, Dict, List, Optional, Tuple


# --- helpers ---------------------------------------------------------------

_COMPARE_TOKENS = ["==", "!=", "<=", ">=", "<", ">"]

def _pick_compare_op(expr_text: str) -> str:
    """Lấy toán tử so sánh đầu tiên nhìn thấy trong expr_text (nếu có); mặc định '=='."""
    s = expr_text or ""
    for tok in _COMPARE_TOKENS:
        if f" {tok} " in s or s.strip().startswith(tok) or s.strip().endswith(tok):
            return tok
    return "=="


def _normalize_type(t: Optional[str]) -> Optional[str]:
    """Chuẩn hóa chuỗi kiểu: 'uint256' -> 'uint', 'int128' -> 'int', None giữ nguyên."""
    if t is None:
        return None
    s = str(t).strip()
    if not s:
        return None
    if s == "bool":
        return "bool"
    if s == "mathint":
        return "mathint"
    if s.startswith("uint"):
        return "uint"
    if s.startswith("int"):
        return "int"
    if s == "string" or s.startswith("bytes"):
        return "string"
    return s  # giữ nguyên nếu kiểu đặc biệt


def _sum_fun_for_value_type(value_type: Optional[str]) -> str:
    """
    Chọn hàm sum phù hợp theo kiểu value của mapping.
    - uint*  -> __verifier_sum_uint
    - int*   -> __verifier_sum_int
    - khác   -> __verifier_sum_uint (fallback an toàn)
    """
    nt = _normalize_type(value_type)
    if nt == "int":
        return "__verifier_sum_int"
    # default/fallback
    return "__verifier_sum_uint"


def _method_returns_map(methods: List[Dict[str, Any]]) -> Dict[str, Optional[str]]:
    """Trả về map {method_name: returns_type or None} từ IR methods."""
    m = {}
    for mm in methods:
        name = mm.get("name")
        if not name:
            continue
        m[name] = mm.get("returns")
    return m


def _indent_of_line(line: str) -> str:
    m = re.match(r"^(\s*)", line)
    return m.group(1) if m else ""


def _find_contract_line_numbers(sol_text: str, contract_name: Optional[str]) -> List[int]:
    """
    Trả về danh sách line numbers (1-indexed) nơi bắt đầu 'contract <Name> {'.
    Nếu contract_name=None -> trả tất cả contracts trong file.
    """
    lines = sol_text.splitlines()
    hits: List[int] = []
    if contract_name:
        pat = re.compile(rf'^\s*contract\s+{re.escape(contract_name)}\b')
        for i, line in enumerate(lines, start=1):
            if pat.search(line):
                hits.append(i)
    else:
        pat = re.compile(r'^\s*contract\s+[A-Za-z_][A-Za-z0-9_]*\b')
        for i, line in enumerate(lines, start=1):
            if pat.search(line):
                hits.append(i)
    return hits


# --- core: build invariant strings from IR --------------------------------

def _build_invariant_from_assert_step(
    step: Dict[str, Any],
    methods: List[Dict[str, Any]],
) -> Optional[str]:
    """
    Nhận 1 step 'assert' của invariant IR và dựng chuỗi invariant Solidity.

    Quy tắc:
    - Bất kỳ 'contract.balance' nào cũng render thành 'address(this).balance'.
    - Nếu gặp '<stateVar>.sum' thì render thành '__verifier_sum_{uint|int}(<stateVar>)'
      (chọn uint/int theo returns-type của method mang tên <stateVar> trong IR).
    - Còn lại dùng giá trị 'rendered' đã có sẵn trong IR.
    - Ghép thành 'A <op> B' với <op> lấy từ expr_text (mặc định '==').
    - Nếu không thu được đúng 2 vế (A, B) thì tạm thời trả None (bỏ qua).
    """
    func_calls = step.get("func_calls", [])
    expr_text = step.get("expr_text", "") or ""
    op = _pick_compare_op(expr_text)

    parts: List[str] = []
    name_to_returns = _method_returns_map(methods)

    for fc in func_calls:
        kind = fc.get("decl_kind")
        name = fc.get("name")
        rendered = fc.get("rendered")

        if not name:
            continue

        # 1) special: state_var_attr (ví dụ balances.sum)
        if kind == "state_var_attr":
            attr = fc.get("attr")
            if attr == "sum":
                vtyp = name_to_returns.get(name)          # returns-type của balances(addr)
                sum_fun = _sum_fun_for_value_type(vtyp)   # __verifier_sum_uint | __verifier_sum_int
                parts.append(f"{sum_fun}({name})")
            else:
                # attr khác: giữ nguyên (nếu có 'rendered'), hoặc fallback name.attr
                if rendered:
                    parts.append(rendered)
                else:
                    parts.append(f"{name}.{attr}" if attr else name)
            continue

        # 2) special: contract_attr (ví dụ contract.balance)
        if kind == "contract_attr":
            attr = fc.get("attr")
            if attr == "balance":
                parts.append("address(this).balance")
            elif attr == "address":
                parts.append("address(this)") 
            continue

        # 3) mặc định: dùng 'rendered' nếu có
        if rendered:
            parts.append(rendered)
            continue

        # 4) fallback
        parts.append(name)

    if len(parts) == 2:
        return f"{parts[0]} {op} {parts[1]}"

    return None


def build_invariant_strings(ir: Dict[str, Any]) -> List[str]:
    """
    Từ IR (‘invariants’: [{steps:[assert,...]}]), dựng ra danh sách chuỗi invariant:
      ["/// @notice invariant <expr1>", "/// @notice invariant <expr2>", ...]
    """
    methods = ir.get("methods", [])
    out: List[str] = []

    for inv in ir.get("invariants", []):
        for st in inv.get("steps", []):
            if st.get("kind") != "assert":
                continue
            inv_expr = _build_invariant_from_assert_step(st, methods)
            if inv_expr:
                out.append(f"/// @notice invariant {inv_expr}")

    # unique, giữ thứ tự
    seen = set(); uniq = []
    for s in out:
        if s not in seen:
            seen.add(s); uniq.append(s)
    return uniq


# --- write into Solidity ---------------------------------------------------

def insert_invariants_into_contract(
    sol_file: str,
    invariant_lines: List[str],
    contract_name: Optional[str] = None,
) -> None:
    """
    Chèn các dòng invariant vào trước tiêu đề `contract` mong muốn.
    - Nếu contract_name=None, chèn vào TẤT CẢ hợp đồng trong file.
    - Tôn trọng thụt lề của dòng 'contract ...'.
    - Chỉnh sửa file IN-PLACE.
    """
    if not invariant_lines:
        return

    with open(sol_file, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    # Tìm vị trí contract(s)
    hits = _find_contract_line_numbers("\n".join(lines), contract_name)
    if not hits:
        # Không tìm thấy contract phù hợp → không chèn
        return

    # Với mỗi contract line, chèn bộ invariant_lines (theo indent của dòng đó)
    for ln in sorted(hits, reverse=True):
        original_line = lines[ln - 1]
        indent = _indent_of_line(original_line)
        to_insert = [indent + s for s in invariant_lines]
        lines[ln - 1:ln - 1] = to_insert

    with open(sol_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")