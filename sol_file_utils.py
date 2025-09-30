import os
from typing import Dict, List, Set, Optional, Tuple
from slither.slither import Slither
from slither.core.declarations import Function as SlitherFunction

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

def build_sol_symbols(sol_file: str, only_contract: Optional[str] = None) -> Dict[str, Set[str]]:
    """
    Trả về bảng symbol để render biểu thức:
      {
        "functions": {name1, name2, ...},        # tên function public/external/internal,... trong contract chọn
        "state_vars": {var1, var2, ...}          # tên state variables (kể cả mapping) trong contract chọn
      }
    Nếu only_contract=None → gộp từ tất cả contract trong file.
    """
    sl = Slither(os.path.abspath(sol_file))
    functions: Set[str] = set()
    state_vars: Set[str] = set()

    def _collect_from_contract(c):
        # State vars
        for sv in c.state_variables:
            state_vars.add(sv.name)
        # Functions (bao gồm cả internal/private; để phân biệt với state var khi render)
        for f in c.functions:
            # Dùng f.name (không bao gồm signature) vì trong spec cũng viết theo tên
            functions.add(f.name)
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

    return {"functions": functions, "state_vars": state_vars}


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