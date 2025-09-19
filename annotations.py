import os
from typing import Dict, List, Optional
from io_utils import _rewrite_pragma_to_0_7_0, _insert_lines_before, _scan_function_lines_in_file

def collect_param_preconds(sol_file: str) -> Dict[str, List[str]]:
    from slither.slither import Slither  # local import to keep module lightweight
    sl = Slither(os.path.abspath(sol_file))
    pre: Dict[str, List[str]] = {}
    for c in sl.contracts:
        for f in c.functions:
            pcs: List[str] = []
            for p in f.parameters:
                t = getattr(p.type, "type", None) or str(p.type)
                if "uint" in str(t) and not str(t).startswith("int"):
                    pcs.append(f"{p.name} >= 0")
            if pcs:
                pre.setdefault(f.name, []).extend(pcs)
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
