import os, re
from typing import Dict, List, Set, Optional, Tuple, Any
from slither.slither import Slither
from slither.core.declarations import Function as SlitherFunction

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

def build_call_graph(sol_file: str) -> Dict[str, List[str]]:
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

def build_sol_symbols(sol_file: str, only_contract: Optional[str] = None) -> Dict[str, Any]:
    """
    Trả về bảng symbol để render biểu thức:
      {
        "functions": {name1, name2, ...},        # tên function public/external/internal,... trong contract chọn
        "state_vars": {var1, var2, ...},         # tên state variables (kể cả mapping) trong contract chọn
        "functions_returns": {fname: [ret1, ret2, ...]}
      }
    Nếu only_contract=None → gộp từ tất cả contract trong file.
    """
    sl = Slither(os.path.abspath(sol_file))
    functions: Set[str] = set()
    state_vars: Set[str] = set()
    functions_returns: Dict[str, list] = {}

    def _collect_from_contract(c):
        # State vars
        for sv in c.state_variables:
            state_vars.add(sv.name)
        # Functions (bao gồm cả internal/private; để phân biệt với state var khi render)
        for f in c.functions:
            # Dùng f.name (không bao gồm signature) vì trong spec cũng viết theo tên
            functions.add(f.name)
            rets = []
            for r in getattr(f, "returns", getattr(f, "return_parameters", [])):
                rname = getattr(r, "name", None)
                if rname:
                    rets.append(rname)
            if rets:
                functions_returns.setdefault(f.name, [])
                for r in rets:
                    if r not in functions_returns[f.name]:
                        functions_returns[f.name].append(r)
        # Modifiers cũng là callable theo Slither; thêm vào nếu cần phân biệt
        for m in getattr(c, "modifiers", []):
            functions.add(m.name)

    if only_contract:
        # tìm đúng contract theo tên
        cs = [c for c in sl.contracts if c.name == only_contract]
        if not cs:
            raise SystemExit(f"[ERROR] Contract '{only_contract}' not found in {sol_file}.")
        for c in cs:
            _collect_from_contract(c)
    else:
        for c in sl.contracts:
            _collect_from_contract(c)

    return {"functions": functions, "state_vars": state_vars, "functions_returns": functions_returns}


def split_sol_and_contract(arg: str) -> Tuple[str, Optional[str]]:
    """
    Cho phép 'path/File.sol:ContractName'. Nếu không có ':', trả (arg, None).
    Lưu ý: chỉ tách phần sau dấu ':' cuối cùng (đường dẫn Unix/Windows đều OK).
    """
    # Bảo toàn đường dẫn chứa ':' (vd. Windows drive 'C:\...') → tách theo dấu ':' cuối cùng
    if ":" in arg:
        # nếu là Windows path 'C:\...' thì phần ':' đầu may thuộc drive; tách cuối vẫn ổn
        path, contract = arg.rsplit(":", 1)
        # Nếu contract rỗng (vd. kết thúc bằng ':'), coi như không chỉ định
        if contract.strip() == "":
            return path, None
        return path, contract.strip()
    return arg, None
