from typing import Optional, Dict, List
from spec_ir import IR
from utils import build_call_graph

def generate_loop_invariant(sol_file: str, only_contract: Optional[str] = None):
    # TO-DO: Cài thuật toán loop invariant
    return

def write_loop_invariants(sol_file: str,
                      ir: IR) -> str:
    # TO-DO: Viết loop invariant vào file Solidity đã annotate.
    call_graph = build_call_graph(sol_file)
    return sol_file