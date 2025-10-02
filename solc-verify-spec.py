import argparse
from typing import Dict, List
from lark import Lark

from spec_ir import IR
from annotations import write_annotations
from validate import validate_spec_ir
from utils import build_call_graph, build_sol_symbols, split_sol_and_contract
from runner import run_sv  

def main():
    parser = argparse.ArgumentParser(
        description="SOLC-VERIFY-SPEC: Annotate Solidity code with specifications from a spec file.",
        usage="%(prog)s [-h] [--grammar file_lark] [--no-run] file_sol[:contract_name] file_spec"
    )
    parser.add_argument("file_sol", help="Path to the Solidity file, optionally with a contract name (format: path-to-file.sol:ContractName)")
    parser.add_argument("file_spec", help="Path to the specification file (format: path-to-file.spec)")
    parser.add_argument("--grammar", default="./parser_certora.lark", help="Path to the .lark grammar")
    parser.add_argument("--no-run", action="store_true", help="Do not run the solc-verify after generating annotations")
    args = parser.parse_args()

    sol_path, target_contract = split_sol_and_contract(args.file_sol)

    print("[1/9] Loading grammar...")
    with open(args.grammar, "r", encoding="utf-8") as f:
        grammar_text = f.read()
    lark = Lark(grammar_text)

    print("[2/9] Parsing spec...")
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

    print("[3/9] Building IR object...")
    sol_symbols = build_sol_symbols(sol_path, only_contract=target_contract)
    ir = IR.from_ast(ast, sol_symbols)
    print(ir.to_dict())  # DEBUG

    print("[4/9] Validating spec IR...")
    validate_spec_ir(ir.to_dict())

    print("[5/9] Building call graph (Slither)...")
    call_graph = build_call_graph(sol_path)
    # (kept for later use)

    print("[6/9] Generating postconditions from rules...")
    post_by_func: Dict[str, List[str]] = {}
    for rule in ir.rules:   # duyệt object thay vì dict
        posts = rule.to_postconditions()
        print(f"Rule '{rule.name}' → posts: {posts}")  # DEBUG
        for fn in rule.calls:
            if posts:
                post_by_func.setdefault(fn, [])
                for p in posts:
                    if p not in post_by_func[fn]:
                        post_by_func[fn].append(p)


    print("[8/9] Inserting preconditions, postconditions and invariants...")
    out_file = write_annotations(sol_path, ir, only_contract=target_contract)

    print("[9/9] Done. Annotated file:", out_file)

    if not args.no_run:
        run_sv(out_file)


if __name__ == "__main__":
    main()