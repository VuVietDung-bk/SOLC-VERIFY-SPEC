import argparse
import os
import time
from lark import Lark

from spec_ir import IR
from annotations import write_annotations
from utils import build_call_graph, build_function_writes, build_sol_symbols, split_sol_and_contract
from runner import run_sv  
from validate import validate_ir

TIME_COLOR = "\033[94m"
RESET_COLOR = "\033[0m"

def main():
    parser = argparse.ArgumentParser(
        description="SOLC-VERIFY-SPEC: Annotate Solidity code with specifications from a spec file.",
        usage="%(prog)s [-h] [options] file_sol[:contract_name] file_spec"
    )
    parser.add_argument("file_sol", help="Path to the Solidity file, optionally with a contract name (format: path-to-file.sol:ContractName)")
    parser.add_argument("file_spec", help="Path to the specification file (format: path-to-file.spec)")
    parser.add_argument("--arithmetic", help="Encoding of the arithmetic operations (int,bv,mod,mod-overflow)")
    parser.add_argument("--errors-only", action="store_true", help="Only display error messages and omit displaying names of correct functions (not given by default)")
    parser.add_argument("--event-analysis", action="store_true", help="Checking emitting events and tracking data changes related to events is only performed if there are event annotations or if this flag is explicitly given.")
    parser.add_argument("--grammar", default="./parser_certora.lark", help="Path to the .lark grammar")
    parser.add_argument("--modifies-analysis", action="store_true", help="State variables and balances are checked for modifications if there are modification annotations or if this flag is explicitly given")
    parser.add_argument("--no-run", action="store_true", help="Do not run the solc-verify after generating annotations")
    parser.add_argument("--show-warnings", action="store_true", help="Display warning messages (not given by default)")
    parser.add_argument("--solver", default="all", help="SMT solver used by the verifier (z3, cvc4, all), default is \"all\"")
    parser.add_argument("--timeout", default="10", help="Timeout for running the Boogie verifier in seconds (default is 10)")
    args = parser.parse_args()

    overall_start = time.time()

    sol_path, target_contract = split_sol_and_contract(args.file_sol)

    print("[1/7] Loading grammar...")
    with open(args.grammar, "r", encoding="utf-8") as f:
        grammar_text = f.read()
    lark = Lark(grammar_text)

    print("[2/7] Parsing specification file...")
    with open(args.file_spec, "r", encoding="utf-8") as f:
        spec_text = f.read()
    try:
        ast = lark.parse(spec_text)
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

    print("[3/7] Building Solidity symbols and IR...")
    sol_symbols = build_sol_symbols(sol_path, only_contract=target_contract)
    ir = IR.from_ast(ast, sol_symbols)

    call_graph = build_call_graph(sol_path)
    func_writes = build_function_writes(sol_path)
    for r in ir.rules:
        r.call_graph = call_graph
        r.func_state_writes = func_writes

    print("[4/7] Validating IR...")
    validate_ir(ir, sol_symbols)

    print("[5/7] Inserting preconditions, postconditions and invariants...")
    out_files = write_annotations(sol_path, ir, only_contract=target_contract)

    print("[6/7] Annotated files:", out_files)

    print("[7/7] Running SOLC-VERIFY...")

    rule_times = []

    if not args.no_run:
        for file in out_files:
            print(f"\033[95mVerifying {file}\033[0m")
            start_rule = time.time()
            extra = []
            if args.arithmetic:
                extra.extend(["--arithmetic", args.arithmetic])
            if args.errors_only:
                extra.append("--errors-only")
            if args.event_analysis:
                extra.append("--event-analysis")
            if args.modifies_analysis:
                extra.append("--modifies-analysis")
            if args.show_warnings:
                extra.append("--show-warnings")
            if args.solver:
                extra.extend(["--solver", args.solver])
            if args.timeout:
                extra.extend(["--timeout", args.timeout])
            run_sv(file, extra_args=extra)
            elapsed_rule = time.time() - start_rule
            rule_label = os.path.basename(file)
            print(f"{TIME_COLOR}[TIME] {rule_label}: {elapsed_rule:.2f}s{RESET_COLOR}")
            rule_times.append(elapsed_rule)
    else:
        print("No run was performed")

    if rule_times:
        print(f"{TIME_COLOR}[TIME] Total rule verification time: {sum(rule_times):.2f}s{RESET_COLOR}")

    overall_elapsed = time.time() - overall_start
    print(f"{TIME_COLOR}[TIME] End-to-end time: {overall_elapsed:.2f}s{RESET_COLOR}")

if __name__ == "__main__":
    main()
