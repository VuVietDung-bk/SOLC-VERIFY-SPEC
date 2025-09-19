import os
from typing import Dict, List
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
