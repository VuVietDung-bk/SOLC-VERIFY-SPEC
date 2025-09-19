import os
import re
from typing import Dict, List

def _rewrite_pragma_to_0_7_0(filepath: str) -> None:
    """Đổi 'pragma solidity ^...;' thành 'pragma solidity ^0.7.0;' (idempotent)."""
    pragma_re = re.compile(r'^\s*pragma\s+solidity\s+[^;]+;', re.IGNORECASE)
    changed = False
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()
    for i, line in enumerate(lines):
        if pragma_re.match(line):
            lines[i] = "pragma solidity ^0.7.0;"
            changed = True
            break
    if changed:
        with open(filepath, "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")

def _insert_lines_before(filepath: str, line_no_1based: int, new_lines: List[str]) -> None:
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()
    insert_at = max(0, min(len(lines), line_no_1based - 1))
    for idx, ln in enumerate(new_lines):
        lines.insert(insert_at + idx, ln)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

def _scan_function_lines_in_file(sol_file: str, target_names: List[str]) -> Dict[str, List[int]]:
    """Tìm dòng 'function <name>(' (1-indexed)."""
    with open(sol_file, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()
    name_set = set(target_names)
    patterns = {name: re.compile(rf'^\s*function\s+{re.escape(name)}\s*\(') for name in name_set}
    found: Dict[str, List[int]] = {name: [] for name in name_set}
    for i, line in enumerate(lines, start=1):
        for name, pat in patterns.items():
            if pat.search(line):
                found[name].append(i)
    return found
