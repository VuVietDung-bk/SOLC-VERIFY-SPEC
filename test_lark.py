import sys
from lark import Lark, UnexpectedInput

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

    except UnexpectedInput as e:
        print("Parse error:", file=sys.stderr)
        print(e, file=sys.stderr)
        sys.exit(1)

if __name__ == "__main__":
    main()