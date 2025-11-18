import argparse
from lark import Lark

from spec_ir import IR
from annotations import write_annotations
from validate import validate_spec_ir
from utils import build_call_graph, build_sol_symbols, split_sol_and_contract
from runner import run_sv  

'''
    TO-DO:
        - Loại bỏ, thêm hoặc sửa những cú pháp không cần thiết trong ngôn ngữ
            + Tính năng environment là không cần thiết - không bao giờ dùng nhiều hơn 1 environment
            + Có thể cân nhắc loại bỏ phần method và thay bằng storage variables
            + Hỗ trợ phần cú pháp so sánh chữ ký của function
        - Tạo một hàm chuyển expression về dạng CNF/DNF
'''

def main():
    parser = argparse.ArgumentParser(
        description="SOLC-VERIFY-SPEC: Annotate Solidity code with specifications from a spec file.",
        usage="%(prog)s [-h] [--grammar file_lark] [--no-run] file_sol[:contract_name] file_spec"
    )
    parser.add_argument("file_sol", help="Path to the Solidity file, optionally with a contract name (format: path-to-file.sol:ContractName)")
    parser.add_argument("file_spec", help="Path to the specification file (format: path-to-file.spec)")
    parser.add_argument("--grammar", default=None, help="Path to the .lark grammar (defaults to parser_certora_new.lark)")
    parser.add_argument("--no-run", action="store_true", help="Do not run the solc-verify after generating annotations")
    args = parser.parse_args()

    sol_path, target_contract = split_sol_and_contract(args.file_sol)

    # Load spec text for parsing
    print("[1/8] Loading grammar...")
    with open(args.file_spec, "r", encoding="utf-8") as f:
        spec_text_for_detection = f.read()

    grammar_path = args.grammar
    if grammar_path is None:
        # Default to the new simplified grammar
        grammar_path = "./parser_certora_new.lark"

    def _load_lark(path: str):
        with open(path, "r", encoding="utf-8") as f:
            return Lark(f.read())
    lark = _load_lark(grammar_path)
    print(f"[1/8] Using grammar: {grammar_path}")

    print("[2/8] Parsing spec...")
    spec_text = spec_text_for_detection
    try:
        ast = lark.parse(spec_text)
        print(ast.pretty()) # DEBUG
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

    print("[3/8] Building IR object...")
    sol_symbols = build_sol_symbols(sol_path, only_contract=target_contract)
    ir = IR.from_ast(ast, sol_symbols)
    print(ir.to_dict())  # DEBUG

    print("[4/8] Validating IR...")
    validate_spec_ir(ir.to_dict())

    print("[5/8] Building call graph...")
    call_graph = build_call_graph(sol_path)
    # (kept for later use)

    print("[6/8] Inserting preconditions, postconditions and invariants...")
    out_files = write_annotations(sol_path, ir, only_contract=target_contract)

    print("[7/8] Annotated files:", out_files)

    if not args.no_run:
        for file in out_files:
            run_sv(file)

if __name__ == "__main__":
    main()