import os
from typing import Dict, List, Set
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

def build_sol_symbol_table(sol_file: str) -> dict:
    """
    Thu thập tên function và state variables từ Solidity để phân biệt cách render:
    - functions: gọi dạng fn(a, b)
    - state_vars: đọc dạng var hoặc var[a][b] (mapping)
    """
    sl = Slither(os.path.abspath(sol_file))
    fnames: Set[str] = set()
    vnames: Set[str] = set()
    for c in sl.contracts:
        for f in c.functions:
            fnames.add(f.name)
        for v in c.state_variables:
            vnames.add(v.name)
    return {"functions": fnames, "state_vars": vnames}