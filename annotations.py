import os
from typing import Dict, List, Optional
from slither.slither import Slither

from utils import _rewrite_pragma_to_0_7_0, _insert_lines_before, _scan_function_lines_in_file
from spec_ir import IR   # IR object

def collect_param_preconds(sol_file: str, only_contract: Optional[str] = None) -> Dict[str, List[str]]:
    """
    Trả về preconditions đơn giản dựa trên kiểu tham số (uint* → param >= 0)
    Nếu only_contract != None → chỉ lấy functions của contract đó.
    """
    sl = Slither(os.path.abspath(sol_file))
    pre: Dict[str, List[str]] = {}

    def _handle_contract(c):
        for f in c.functions:
            pcs: List[str] = []
            for p in f.parameters:
                t = getattr(p.type, "type", None) or str(p.type)
                if "uint" in str(t) and not str(t).startswith("int"):
                    pcs.append(f"{p.name} >= 0")
            if pcs:
                pre.setdefault(f.name, []).extend(pcs)

    if only_contract:
        cs = [c for c in sl.contracts if c.name == only_contract]
        if not cs:
            raise SystemExit(f"[ERROR] Contract '{only_contract}' not found when collecting preconditions.")
        for c in cs:
            _handle_contract(c)
    else:
        for c in sl.contracts:
            _handle_contract(c)

    # unique
    for k, v in list(pre.items()):
        pre[k] = list(dict.fromkeys(v))
    return pre


def write_annotations(sol_in: str,
                      ir: IR,
                      only_contract: Optional[str] = None) -> str:
    """
    Ghi pre/post/invariant vào file Solidity đã annotate.
    - ir: đối tượng IR đã parse từ spec
    - preconds: preconditions thu thập bằng Slither
    """
    preconds = collect_param_preconds(sol_in, only_contract=only_contract)

    base, ext = os.path.splitext(os.path.abspath(sol_in))
    out_path = base + ".annotated" + ext

    # copy gốc sang file annotate
    with open(sol_in, "r", encoding="utf-8") as rf:
        original = rf.read()
    with open(out_path, "w", encoding="utf-8") as wf:
        wf.write(original)

    # rewrite pragma
    _rewrite_pragma_to_0_7_0(out_path)

    # ================= POSTCONDITIONS =================
    post_by_func: Dict[str, List[str]] = {}
    for rule in ir.rules:
        posts = rule.to_postconditions()
        for fn in rule.calls:
            if posts:
                post_by_func.setdefault(fn, [])
                for p in posts:
                    if p not in post_by_func[fn]:
                        post_by_func[fn].append(p)

    # ================= FUNC TARGETS =================
    target_funcs = sorted(set(list(post_by_func.keys()) + list(preconds.keys())))
    occ = _scan_function_lines_in_file(out_path, target_funcs)
    inserts: List[tuple[int, List[str]]] = []

    for fn in target_funcs:
        lines: List[str] = []
        for pre in preconds.get(fn, []):
            lines.append(f"    /// @notice precondition {pre}")
        for post in post_by_func.get(fn, []):
            lines.append(f"    /// @notice postcondition {post}")
        if not lines:
            continue
        for ln in occ.get(fn, []):
            inserts.append((ln, lines))

    # chèn vào file (theo thứ tự từ cuối lên đầu để không lệch line)
    for ln, lines in sorted(inserts, key=lambda x: x[0], reverse=True):
        _insert_lines_before(out_path, ln, lines)

    # ================= INVARIANTS =================
    inv_lines: List[str] = []
    for inv in ir.invariants:
        inv_lines.extend(inv.to_invariants())

    if inv_lines:
        insert_invariants_into_contract(out_path, inv_lines, None)

    return out_path


# giữ lại util chèn invariant vào file contract
def _indent_of_line(line: str) -> str:
    import re
    m = re.match(r"^(\s*)", line)
    return m.group(1) if m else ""


def _find_contract_line_numbers(sol_text: str, contract_name: Optional[str]) -> List[int]:
    import re
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


def insert_invariants_into_contract(
    sol_file: str,
    invariant_lines: List[str],
    contract_name: Optional[str] = None,
) -> None:
    """
    Chèn các dòng invariant vào trước tiêu đề `contract` mong muốn.
    - Nếu contract_name=None, chèn vào tất cả hợp đồng trong file.
    """
    if not invariant_lines:
        return

    with open(sol_file, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    hits = _find_contract_line_numbers("\n".join(lines), contract_name)
    if not hits:
        return

    for ln in sorted(hits, reverse=True):
        original_line = lines[ln - 1]
        indent = _indent_of_line(original_line)
        to_insert = [indent + s for s in invariant_lines]
        lines[ln - 1:ln - 1] = to_insert

    with open(sol_file, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")