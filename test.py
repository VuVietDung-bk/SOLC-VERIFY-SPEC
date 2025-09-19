import argparse
from lark import Lark


def main():
    parser = argparse.ArgumentParser(description="Parse a file with Lark grammar")
    parser.add_argument("file_spec", help="Path to the spec file")
    parser.add_argument("--grammar", default="./parser_certora.lark", help="Path to the grammar file (default: ./parser_certora.lark)")
    args = parser.parse_args()

    with open(args.grammar, "r", encoding="utf-8") as f:
        parser_text = f.read()

    l = Lark(parser_text)

    with open(args.file_spec, "r", encoding="utf-8") as f:
        data = f.read()

    ast_tree = l.parse(data)
    print(ast_tree)

if __name__ == "__main__":
    main()