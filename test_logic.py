import sys
from lark import Lark, UnexpectedInput, Tree, Token
from parser_utils import to_text
from logic_utils import *
from spec_ir import IR


def main():
    if len(sys.argv) != 3:
        print(f"Usage: {sys.argv[0]} <grammar_file.lark> <input_file>", file=sys.stderr)
        sys.exit(1)

    grammar_path = sys.argv[1]
    input_path = sys.argv[2]

    # Đọc grammar
    try:
        with open(grammar_path, "r", encoding="utf-8") as f:
            grammar = f.read()

    except OSError as e:
        print(f"Error reading grammar file '{grammar_path}': {e}", file=sys.stderr)
        sys.exit(1)

    # Đọc file cần parse
    try:
        with open(input_path, "r", encoding="utf-8") as f:
            text = f.read()
    except OSError as e:
        print(f"Error reading input file '{input_path}': {e}", file=sys.stderr)
        sys.exit(1)

    # Tạo parser
    try:
        parser = Lark(
            grammar
        )
        tree = parser.parse(text)
        print(tree.pretty())
        ir = IR.from_ast(tree, {})
        print(ir.to_dict())
    except UnexpectedInput as e:
        print("Parse error:", file=sys.stderr)
        print(e, file=sys.stderr)
        sys.exit(1)

    for node in tree.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "rule":
            for st in node.iter_subtrees_topdown():
                if not isinstance(st, Tree):
                    continue
                elif st.data == "assert_statement":
                    for ch in st.children:
                        if isinstance(ch, Tree):
                            expr_node = ch
                            dnf_node = remove_arrows(expr_node)
                            print(to_text(negative(dnf_node)))
                elif st.data == "require_statement":
                    for ch in st.children:
                        if isinstance(ch, Tree):
                            expr_node = ch
                            dnf_node = remove_arrows(expr_node)
                            print(dnf_node.pretty())

if __name__ == "__main__":
    main()
