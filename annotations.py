import os
from typing import Dict, List, Optional
from slither.slither import Slither
from io_utils import _rewrite_pragma_to_0_7_0, _insert_lines_before, _scan_function_lines_in_file

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
                # Chỉ key theo tên hàm, giống phần annotate
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
                      target_funcs: List[str],
                      preconds: Dict[str, List[str]],
                      postconds: Dict[str, List[str]],
                      out_path: Optional[str] = None) -> str:
    if out_path is None:
        base, ext = os.path.splitext(os.path.abspath(sol_in))
        out_path = base + ".annotated" + ext

    with open(sol_in, "r", encoding="utf-8") as rf:
        original = rf.read()
    with open(out_path, "w", encoding="utf-8") as wf:
        wf.write(original)

    _rewrite_pragma_to_0_7_0(out_path)

    occ = _scan_function_lines_in_file(out_path, target_funcs)
    inserts: List[tuple[int, List[str]]] = []

    for fn in target_funcs:
        lines: List[str] = []
        for pre in preconds.get(fn, []):
            lines.append(f"    /// @notice precondition {pre}")
        for post in postconds.get(fn, []):
            lines.append(f"    /// @notice postcondition {post}")
        if not lines:
            continue
        for ln in occ.get(fn, []):
            inserts.append((ln, lines))

    for ln, lines in sorted(inserts, key=lambda x: x[0], reverse=True):
        _insert_lines_before(out_path, ln, lines)

    return out_path
