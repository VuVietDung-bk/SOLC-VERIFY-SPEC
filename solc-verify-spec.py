import os
import re
import argparse
from typing import Dict, List, Tuple, Optional, Any
from lark import Lark
import subprocess

from io_utils import _rewrite_pragma_to_0_7_0, _insert_lines_before, _scan_function_lines_in_file
from spec_parser import parse_spec_to_ir
from build_conditions import rule_to_posts
from annotations import write_annotations, collect_param_preconds 
from typecheck import validate_spec_ir
from sol_file_utils import build_call_graph, build_sol_symbols, split_sol_and_contract
from invariants import build_invariant_strings, insert_invariants_into_contract

def run_sv(out_file: str) -> int:
    cmd = ["./docker/runsv.sh", out_file]
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except FileNotFoundError:
        proc = subprocess.run(["bash", "./docker/runsv.sh", out_file],
                              capture_output=True, text=True, check=False)
    if proc.stdout:
        print("\033[96mSOLC-VERIFY OUTPUT:\033[0m")
        print(proc.stdout, end="")
    return proc.returncode

def main():
    parser = argparse.ArgumentParser(description="SOLC-VERIFY-SPEC: Annotate Solidity code with specifications from a spec file.",
                                     usage="%(prog)s [-h] [--grammar file_lark] [--no-run] file_sol[:contract_name] file_spec")
    parser.add_argument("file_sol", help="Path to the Solidity file, optionally with a contract name (format: path-to-file.sol:ContractName)")
    parser.add_argument("file_spec", help="Path to the specification file (format: path-to-file.spec)")
    parser.add_argument("--grammar", default="./parser_certora.lark",  help="Path to the .lark grammar")
    parser.add_argument("--no-run", action="store_true", help="Do not run the solc-verify after generating annotations")
    args = parser.parse_args()

    sol_path, target_contract = split_sol_and_contract(args.file_sol)

    print("[1/10] Loading grammar...")
    with open(args.grammar, "r", encoding="utf-8") as f:
        grammar_text = f.read()
    lark = Lark(grammar_text)

    print("[2/10] Parsing spec...")
    with open(args.file_spec, "r", encoding="utf-8") as f:
        spec_text = f.read()
    try:
        ast = lark.parse(spec_text)
        print(ast) # DEBUG
    except Exception as e:
        line = getattr(e, "line", None)
        column = getattr(e, "column", None)
        if line is not None:
            print(f"[ERROR] Syntax error at line {line}" + (f", column {column}" if column is not None else "") + ".")
            lines = spec_text.splitlines()
            if 1 <= line <= len(lines):
                print(f"  >> {lines[line-1]}")
                if column is not None and column > 0:
                    print("     " + " "*(column-1) + "^")
        else:
            print(f"[ERROR] Syntax error: {e}")
        raise SystemExit(1)

    print("[3/10] Building IR (ordered rule steps + snapshots)...")
    sol_symbols = build_sol_symbols(sol_path, only_contract=target_contract)
    ir = parse_spec_to_ir(ast, sol_symbols)
    print(ir) # DEBUG

    print("[4/10] Validating spec IR...")
    validate_spec_ir(ir)

    print("[5/10] Building call graph (Slither)...")
    call_graph = build_call_graph(sol_path)
    # (kept for later use)

    print("[6/10] Generating postconditions from rules...")
    post_by_func: Dict[str, List[str]] = {}
    for r in ir["rules"]:
        posts = rule_to_posts(r)
        print(f"Rule '{r.get('name', '<unnamed>')}' → posts: {posts}") # DEBUG
        seeds = r.get("calls", [])
        for fn in seeds:
            if posts:
                post_by_func.setdefault(fn, [])
                for p in posts:
                    if p not in post_by_func[fn]:
                        post_by_func[fn].append(p)

    print("[7/10] Collecting parameter-based preconditions (Slither)...")
    pre_by_func = collect_param_preconds(sol_path, only_contract=target_contract)

    target_funcs = sorted(set(list(post_by_func.keys()) + list(pre_by_func.keys())))

    print("[8/10] Inserting preconditions and postconditions...")
    out_file = write_annotations(sol_path, target_funcs, pre_by_func, post_by_func)

    print("[9/10] Inserting invariants into contract...")
    inv_lines = build_invariant_strings(ir)
    # Nếu bạn có cơ chế pick contract đích (ví dụ qua args.file_sol có dạng "file.sol:Contract"),
    # hãy truyền contract_name đó; nếu không, để None sẽ chèn vào tất cả contracts.
    contract_name = None
    if ":" in args.file_sol:
        # Bạn có thể đã tách file và contract từ trước; nếu có biến contract_name sẵn thì dùng nó
        contract_name = args.file_sol.split(":", 1)[1] or None

    insert_invariants_into_contract(out_file, inv_lines, contract_name)

    print("[10/10] Done. Annotated file:", out_file)

    if args.no_run is False:
        run_sv(out_file)


if __name__ == "__main__":
    main()