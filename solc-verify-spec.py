import argparse
from lark import Lark
from typing import Dict, List

from spec_parser import parse_spec_to_ir
from typecheck import validate_spec_ir
from callgraph import build_call_graph
from build_conditions import rule_to_posts
from annotations import collect_param_preconds, write_annotations
from runner import run_sv

def main():
    parser = argparse.ArgumentParser(description="Spec→Annotation (single-hop, no propagation)")
    parser.add_argument("file_sol", help="Path to the Solidity file")
    parser.add_argument("file_spec", help="Path to the spec file")
    parser.add_argument("--grammar", default="./parser_certora.lark", help="Path to the .lark grammar")
    parser.add_argument("--no-run", action="store_true", help="Run ./docker/runsv.sh on the annotated output")
    args = parser.parse_args()

    print("[1/8] Loading grammar...")
    with open(args.grammar, "r", encoding="utf-8") as f:
        grammar_text = f.read()
    lark = Lark(grammar_text)

    print("[2/8] Parsing spec...")
    with open(args.file_spec, "r", encoding="utf-8") as f:
        spec_text = f.read()
    try:
        ast = lark.parse(spec_text)
    except Exception as e:
        line = getattr(e, "line", None); column = getattr(e, "column", None)
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

    print("[3/8] Building IR (ordered rule steps + snapshots)...")
    ir = parse_spec_to_ir(ast)
    print(ir)
    rules = ir["rules"]

    print("[3.5/8] Validating spec IR...")
    validate_spec_ir(ir)

    print("[4/8] Building call graph (Slither)...")
    call_graph = build_call_graph(args.file_sol)
    # giữ để dùng sau

    print("[5/8] Generating postconditions from rules...")
    post_by_func: Dict[str, List[str]] = {}
    for r in rules:
        posts = rule_to_posts(r)
        seeds = r.get("calls", [])
        for fn in seeds:
            if posts:
                post_by_func.setdefault(fn, [])
                for p in posts:
                    if p not in post_by_func[fn]:
                        post_by_func[fn].append(p)

    print("[6/8] Collecting parameter-based preconditions (Slither)...")
    pre_by_func = collect_param_preconds(args.file_sol)

    target_funcs = sorted(set(list(post_by_func.keys()) + list(pre_by_func.keys())))

    print("[7/8] Writing annotations into Solidity...")
    out_file = write_annotations(args.file_sol, target_funcs, pre_by_func, post_by_func)

    print("[8/8] Done. Annotated file:", out_file)

    if args.no_run is False:
        run_sv(out_file)

if __name__ == "__main__":
    main()