import os
from typing import Dict, List, Optional
from slither.slither import Slither
import shutil

from utils import _rewrite_pragma_to_0_7_0, _insert_lines_before, _scan_function_lines_in_file, _scan_event_lines_in_file
from spec_ir import IR

def collect_param_preconds(sol_file: str, only_contract: Optional[str] = None) -> Dict[str, List[str]]:
    """Build simple preconditions from parameter types (uint* → param >= 0)."""
    sl = Slither(os.path.abspath(sol_file))
    pre: Dict[str, List[str]] = {}

    def _handle_contract(c):
        for f in c.functions:
            vis = getattr(f, "visibility", None) or ""
            if str(vis) not in ("public", "external"):
                continue
            pcs: List[str] = []
            if getattr(f, "payable", False):
                pcs.append("msg.value >= 0")
                pcs.append("address(this).balance >= 0")
            for p in f.parameters:
                t = getattr(p.type, "type", None) or str(p.type)
                if "uint" in str(t) and not str(t).startswith("int") and p.name:
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

    for k, v in list(pre.items()):
        pre[k] = list(dict.fromkeys(v))
    return pre

def write_annotations(sol_in: str, ir: IR, only_contract: Optional[str] = None) -> List[str]:
    """Emit annotated Solidity copies per rule with pre/post/modifies/emits and invariants."""
    preconds = collect_param_preconds(sol_in, only_contract=only_contract)

    base, ext = os.path.splitext(os.path.abspath(sol_in))
    out_files: List[str] = []
    for rule in ir.rules:
        out_path = base + f".{rule.name}" + ext
        shutil.copyfile(sol_in, out_path)
        _rewrite_pragma_to_0_7_0(out_path)

        rule_preconds, rule_postconds, rule_modifies, rule_emits, rule_event_preconds, rule_event_postconds = rule.to_conditions()
        post_by_func = {fn: list(dict.fromkeys(vals)) for fn, vals in rule_postconds.items()}
        modify_by_func = {fn: list(dict.fromkeys(vals)) for fn, vals in rule_modifies.items()}
        emits_by_func = {fn: list(dict.fromkeys(vals)) for fn, vals in rule_emits.items()}
        event_pre_by_name = {ev: list(dict.fromkeys(vals)) for ev, vals in rule_event_preconds.items()}
        event_post_by_name = {ev: list(dict.fromkeys(vals)) for ev, vals in rule_event_postconds.items()}

        target_funcs = sorted(
            set(
                list(post_by_func.keys())
                + list(preconds.keys())
                + list(rule_preconds.keys())
                + list(modify_by_func.keys())
                + list(emits_by_func.keys())
            )
        )
        target_events = sorted(set(list(event_pre_by_name.keys()) + list(event_post_by_name.keys())))

        occ = _scan_function_lines_in_file(out_path, target_funcs)
        occ_events = _scan_event_lines_in_file(out_path, target_events) if target_events else {}
        inserts: List[tuple[int, List[str]]] = []

        for fn in target_funcs:
            lines: List[str] = []
            pre_list = list(dict.fromkeys(preconds.get(fn, []) + rule_preconds.get(fn, [])))
            for pre in pre_list:
                lines.append(f"    /// @notice precondition {pre}")
            for post in post_by_func.get(fn, []):
                lines.append(f"    /// @notice postcondition {post}")
            for mod in modify_by_func.get(fn, []):
                lines.append(f"    /// @notice modifies {mod}")
            for em in emits_by_func.get(fn, []):
                lines.append(f"    /// @notice emits {em}")
            if not lines:
                continue
            for ln in occ.get(fn, []):
                inserts.append((ln, lines))

        for ev in target_events:
            lines: List[str] = []
            for pre in event_pre_by_name.get(ev, []):
                lines.append(f"    /// @notice precondition {pre}")
            for post in event_post_by_name.get(ev, []):
                lines.append(f"    /// @notice postcondition {post}")
            if not lines:
                continue
            for ln in occ_events.get(ev, []):
                inserts.append((ln, lines))

        for ln, lines in sorted(inserts, key=lambda x: x[0], reverse=True):
            _insert_lines_before(out_path, ln, lines)

        inv_lines: List[str] = []
        for inv in ir.invariants:
            inv_lines.extend(inv.to_invariants())
        if inv_lines:
            insert_invariants_into_contract(out_path, inv_lines, only_contract)

        out_files.append(out_path)

    if not out_files:
        out_path = base + f".annotated" + ext
        shutil.copyfile(sol_in, out_path)
        _rewrite_pragma_to_0_7_0(out_path)

        target_funcs = sorted(set(list(preconds.keys())))
        occ = _scan_function_lines_in_file(out_path, target_funcs)
        inserts: List[tuple[int, List[str]]] = []

        for fn in target_funcs:
            lines: List[str] = []
            for pre in preconds.get(fn, []):
                lines.append(f"    /// @notice precondition {pre}")
            if not lines:
                continue
            for ln in occ.get(fn, []):
                inserts.append((ln, lines))

        for ln, lines in sorted(inserts, key=lambda x: x[0], reverse=True):
            _insert_lines_before(out_path, ln, lines)
        
        inv_lines: List[str] = []
        for inv in ir.invariants:
            inv_lines.extend(inv.to_invariants())
        if inv_lines:
            insert_invariants_into_contract(out_path, inv_lines, only_contract)
        out_files.append(out_path)
    return out_files


def _indent_of_line(line: str) -> str:
    """Return the leading whitespace of a line."""
    import re
    m = re.match(r"^(\s*)", line)
    return m.group(1) if m else ""

def _find_contract_line_numbers(sol_text: str, contract_name: Optional[str]) -> List[int]:
    """Find line numbers where contract declarations appear, optionally filtered by name."""
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
    """Insert invariant lines before matching contract declarations (all if name not provided)."""
    if not invariant_lines:
        return
    invariant_lines = [f"/// @notice invariant {line}" for line in invariant_lines]

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
