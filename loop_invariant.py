from typing import Optional, Dict, List
from spec_ir import IR

def generate_loop_invariant(sol_file: str, only_contract: Optional[str] = None):
    # TO-DO: Cài thuật toán loop invariant
    return

def write_loop_invariants(sol_in: str,
                      ir: IR,
                      call_graph: Dict[str, List[str]]) -> str:
    # TO-DO: Viết loop invariant vào file Solidity đã annotate.
    return sol_in