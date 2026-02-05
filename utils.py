import os, re
from typing import Dict, List, Set, Optional, Tuple, Any
from slither.slither import Slither
from slither.core.declarations import Function as SlitherFunction
from slither.core.variables.state_variable import StateVariable

def _rewrite_pragma_to_0_7_0(filepath: str) -> None:
    """Rewrite 'pragma solidity ^...;' to 'pragma solidity >=0.7.0;' (idempotent)."""
    pragma_re = re.compile(r'^\s*pragma\s+solidity\s+[^;]+;', re.IGNORECASE)
    changed = False
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()
    for i, line in enumerate(lines):
        if pragma_re.match(line):
            lines[i] = "pragma solidity >=0.7.0;"
            changed = True
            break
    if changed:
        with open(filepath, "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")

def _insert_lines_before(filepath: str, line_no_1based: int, new_lines: List[str]) -> None:
    """Insert new_lines before the specified 1-based line number."""
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()
    insert_at = max(0, min(len(lines), line_no_1based - 1))
    for idx, ln in enumerate(new_lines):
        lines.insert(insert_at + idx, ln)
    with open(filepath, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

def _scan_function_lines_in_file(sol_file: str, target_names: List[str]) -> Dict[str, List[int]]:
    """Find lines with 'function <name>(' (1-indexed)."""
    with open(sol_file, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()
    name_set = set(target_names)
    patterns = {
        name: re.compile(rf'^\s*function\s+{re.escape(name)}\s*\(')
        for name in name_set
        if name != "constructor"
    }
    if "constructor" in name_set:
        patterns["constructor"] = re.compile(r'^\s*constructor\s*\(')
    found: Dict[str, List[int]] = {name: [] for name in name_set}
    for i, line in enumerate(lines, start=1):
        for name, pat in patterns.items():
            if pat.search(line):
                found[name].append(i)
    return found

def _scan_event_lines_in_file(sol_file: str, target_names: List[str]) -> Dict[str, List[int]]:
    """Find lines with 'event <name>(' (1-indexed)."""
    with open(sol_file, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()
    name_set = set(target_names)
    patterns = {name: re.compile(rf'^\s*event\s+{re.escape(name)}\s*\(') for name in name_set}
    found: Dict[str, List[int]] = {name: [] for name in name_set}
    for i, line in enumerate(lines, start=1):
        for name, pat in patterns.items():
            if pat.search(line):
                found[name].append(i)
    return found

def build_call_graph(sol_file: str) -> Dict[str, List[str]]:
    """Build a mapping from function name to the list of called function names."""
    sl = Slither(os.path.abspath(sol_file))
    graph: Dict[str, List[str]] = {}
    for c in sl.contracts:
        for f in c.functions:
            src = f.canonical_name
            def _simple_name(canonical: str) -> str:
                s = canonical.split(".", 1)[-1]
                return s.split("(", 1)[0]
            src_name = _simple_name(src)
            callees: List[str] = []
            for ic in f.internal_calls:
                callee = getattr(ic, "function", None)
                if isinstance(callee, SlitherFunction):
                    callees.append(_simple_name(callee.canonical_name))
            for (_dest_contract, hl) in f.high_level_calls:
                callee = getattr(hl, "function", None)
                if isinstance(callee, SlitherFunction):
                    callees.append(_simple_name(callee.canonical_name))
            graph[src_name] = sorted(set(callees))
    return graph

def build_function_writes(sol_file: str) -> Dict[str, List[str]]:
    """
    Collect state variables written (assign/update) by each function.
    Returns map: { function_name: [var1, var2, ...] }
    """
    sl = Slither(os.path.abspath(sol_file))
    writes: Dict[str, Set[str]] = {}

    def _simple_name(canonical: str) -> str:
        s = canonical.split(".", 1)[-1]
        return s.split("(", 1)[0]

    for c in sl.contracts:
        for f in c.functions:
            fname = _simple_name(f.canonical_name)
            vars_written = getattr(f, "state_variables_written", []) or []
            for sv in vars_written:
                if isinstance(sv, StateVariable):
                    writes.setdefault(fname, set()).add(sv.name)
    return {k: sorted(v) for k, v in writes.items()}

def build_sol_symbols(sol_file: str, only_contract: Optional[str] = None) -> Dict[str, Any]:
    """
    Return a symbol table for rendering expressions:
    - "functions": names of public/external/internal functions in the chosen contract
    - "state_vars": state variable names (including mappings) in the chosen contract
    - "functions_returns": map of function to return variable names
    - "functions_return_types": map of function to return type strings
    - "functions_params": map of callable (functions/events) to parameter names
    - "functions_param_types": map of callable (functions/events) to parameter type strings
    - "functions_public_nonview": names of public/external functions that are not view/pure

    If only_contract=None the values are merged from all contracts in the file.
    """
    sl = Slither(os.path.abspath(sol_file))
    functions: Set[str] = set()
    state_vars: Set[str] = set()
    functions_returns: Dict[str, list] = {}
    functions_return_types: Dict[str, List[str]] = {}
    functions_params: Dict[str, List[str]] = {}
    functions_param_types: Dict[str, List[str]] = {}
    functions_public_nonview: Set[str] = set()

    def _collect_from_contract(c):
        for sv in c.state_variables:
            state_vars.add(sv.name)
        for f in c.functions:
            functions.add(f.name)
            if getattr(f, "visibility", None) in ("public", "external") and getattr(f, "state_mutability", getattr(f, "stateMutability", None)) not in ("view", "pure"):
                functions_public_nonview.add(f.name)
            params = []
            param_types = []
            for p in getattr(f, "parameters", []):
                pname = getattr(p, "name", None)
                ptype = str(getattr(p, "type", "")) if hasattr(p, "type") else None
                if pname:
                    params.append(pname)
                    if ptype:
                        param_types.append(ptype)
            if params:
                functions_params[f.name] = params
            if param_types:
                functions_param_types[f.name] = param_types
            rets = []
            ret_types = []
            for r in getattr(f, "returns", getattr(f, "return_parameters", [])):
                rname = getattr(r, "name", None)
                rtype = str(getattr(r, "type", "")) if hasattr(r, "type") else None
                if rname:
                    rets.append(rname)
                if rtype:
                    ret_types.append(rtype)
            if rets:
                functions_returns.setdefault(f.name, [])
                for r in rets:
                    if r not in functions_returns[f.name]:
                        functions_returns[f.name].append(r)
            if ret_types:
                functions_return_types[f.name] = ret_types
        for m in getattr(c, "modifiers", []):
            functions.add(m.name)
        for ev in getattr(c, "events", []):
            ename = getattr(ev, "_name", None)
            if not ename:
                continue
            params = []
            param_types = []
            for p in getattr(ev, "elems", []):
                pname = getattr(p, "name", None)
                ptype = str(getattr(p, "type", "")) if hasattr(p, "type") else None
                if pname:
                    params.append(pname)
                if ptype:
                    param_types.append(ptype)
            if params:
                functions_params[ename] = params
            if param_types:
                functions_param_types[ename] = param_types

    if only_contract:
        cs = [c for c in sl.contracts if c.name == only_contract]
        if not cs:
            raise SystemExit(f"[ERROR] Contract '{only_contract}' not found in {sol_file}.")
        for c in cs:
            _collect_from_contract(c)
    else:
        for c in sl.contracts:
            _collect_from_contract(c)

    return {
        "functions": functions,
        "state_vars": state_vars,
        "functions_returns": functions_returns,
        "functions_return_types": functions_return_types,
        "functions_params": functions_params,
        "functions_param_types": functions_param_types,
        "functions_public_nonview": functions_public_nonview,
    }


def split_sol_and_contract(arg: str) -> Tuple[str, Optional[str]]:
    """
    Allow 'path/File.sol:ContractName'. If there is no ':', return (arg, None).
    Note: split only after the last ':' (Unix/Windows paths are OK).
    """
    if ":" in arg:
        path, contract = arg.rsplit(":", 1)
        if contract.strip() == "":
            return path, None
        return path, contract.strip()
    return arg, None
