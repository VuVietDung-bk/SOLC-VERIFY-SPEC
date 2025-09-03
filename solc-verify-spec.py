import os
import re
from typing import Dict, List, Tuple, Optional
from lark import Tree, Token, Lark
import argparse
from slither.slither import Slither
from slither.core.declarations import Function as SlitherFunction
import io
import subprocess

def _rewrite_pragma_to_0_7_0(filepath: str) -> None:
    """
    Đổi dòng pragma solidity bất kỳ về: pragma solidity ^0.7.0;
    Idempotent: chạy nhiều lần vẫn ra cùng kết quả.
    """
    pragma_re = re.compile(r'^\s*pragma\s+solidity\s+[^;]+;', re.IGNORECASE)
    changed = False
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    for i, line in enumerate(lines):
        if pragma_re.match(line):
            lines[i] = "pragma solidity ^0.7.0;"
            changed = True
            break

    if changed:
        with open(filepath, "w", encoding="utf-8") as f:
            f.write("\n".join(lines) + "\n")

def _flatten_any(x) -> str:
    if isinstance(x, Token):
        return x.value
    if isinstance(x, Tree):
        toks = []
        for t in x.scan_values(lambda v: isinstance(v, Token)):
            toks.append(t.value)
        s = " ".join(toks)
        s = s.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
        return s.strip()
    return str(x)

def _extract_call_args_from_exprs(exprs_tree: Tree) -> list[str]:
    # exprs: expr ("," expr)* nhưng ?expr là inline → children không chắc là Tree('expr')
    if exprs_tree is None:
        return []
    args = []
    cur = []
    for ch in exprs_tree.children:
        if isinstance(ch, Token) and ch.value == ",":
            if cur:
                arg = " ".join(_flatten_any(x) for x in cur).strip()
                arg = arg.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
                args.append(arg)
                cur = []
        else:
            cur.append(ch)
    if cur:
        arg = " ".join(_flatten_any(x) for x in cur).strip()
        arg = arg.replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".")
        args.append(arg)
    return args

def _get_function_call_info(call_tree: Tree) -> tuple[Optional[str], list[str]]:
    """
    function_call: (ID ".")? ID ("@" CALL_MODIFIER)? "(" exprs? ")" ("at" ID)?
    Trả về (func_name, args)
    """
    children = list(call_tree.children)
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx] if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None
    args = _extract_call_args_from_exprs(exprs_node) if exprs_node is not None else []
    return func_name, args

def _is_zero_arg_function_call(tree: Tree) -> Optional[str]:
    # trả về tên hàm nếu là function_call không có exprs (0 args), ngược lại None
    if not (isinstance(tree, Tree) and tree.data == "function_call"):
        return None
    # tìm exprs node ở cấp con trực tiếp
    children = list(tree.children)
    exprs_node = next((ch for ch in children if isinstance(ch, Tree) and ch.data == "exprs"), None)
    # lấy tên hàm như _get_function_call_info đã làm
    cutoff_idx = children.index(exprs_node) if exprs_node is not None else len(children)
    ids_before = [ch.value for ch in children[:cutoff_idx] if isinstance(ch, Token) and ch.type == "ID"]
    func_name = ids_before[-1] if ids_before else None
    if func_name and exprs_node is None:
        return func_name
    # cũng coi là zero-arg nếu exprs_node tồn tại nhưng rỗng:
    if func_name and exprs_node is not None and len(exprs_node.children) == 0:
        return func_name
    return None

def _infer_post_from_assert(assert_expr_text: str, snapshots: dict) -> Optional[str]:
    """
    Từ chuỗi như 'xBefore <= xAfter' và mapping snapshots {xBefore: 'x', xAfter: 'x'}
    → 'x >= __verifier_old_uint(x)'
    Hỗ trợ các toán tử cơ bản: <=, <, >=, >, ==, !=
    """
    # tách rất đơn giản theo các toán tử hai ký tự trước
    ops = ["<=", ">=", "==", "!=", "<", ">"]
    op = next((o for o in ops if f" {o} " in assert_expr_text), None)
    if not op:
        return None
    left, right = [p.strip() for p in assert_expr_text.split(f" {op} ", 1)]
    if left not in snapshots or right not in snapshots:
        return None
    obsL = snapshots[left]
    obsR = snapshots[right]
    if obsL != obsR:
        return None  # chỉ xử lý cùng một quan sát
    # ánh xạ ngược: a<=b  => obs >= old(obs); a<b => obs > old(obs), v.v.
    # mặc định dùng __verifier_old_uint, có thể tổng quát hóa theo kiểu
    mapping = {
        "<=": ">=",
        "<":  ">",
        ">=": "<=",
        ">":  "<",
        "==": "==",
        "!=": "!=",
    }
    new_op = mapping[op]
    return f"{obsL} {new_op} __verifier_old_uint({obsL})"

def infer_rule_posts(rule: dict) -> List[str]:
    posts = []
    snapshots = rule.get("snapshots", {})
    for a in rule.get("asserts", []):
        pc = _infer_post_from_assert(a["expr"], snapshots)
        if pc:
            posts.append(pc)
    return posts

def collect_solidity_param_preconds(sol_file: str) -> Dict[str, List[str]]:
    """
    Trả về map func_name -> list preconditions suy từ kiểu param (đơn giản):
    - uint... → param >= 0
    (Bạn có thể mở rộng thêm nếu muốn)
    """
    sol_path = os.path.abspath(sol_file)
    sl = Slither(sol_path)
    preconds: Dict[str, List[str]] = {}
    for c in sl.contracts:
        for f in c.functions:
            pcs = []
            for p in f.parameters:
                typ = getattr(p.type, "type", None) or str(p.type)
                # bắt các kiểu uint..., ví dụ 'uint256'/'uint128'/...
                if "uint" in typ and not typ.startswith("int"):
                    pcs.append(f"{p.name} >= 0")
            if pcs:
                preconds.setdefault(f.name, []).extend(pcs)
    return preconds

def _build_notice_annotations(func_name: str,
                              rules: List[dict],
                              rule_call_edges: Dict[str, List[Tuple[str, Optional[str]]]],
                              rule_posts: Dict[str, List[str]],
                              param_preconds: Dict[str, List[str]]) -> List[str]:
    """
    Tạo các dòng:
      /// @notice precondition ...
      /// @notice postcondition ...
    Nếu có nhiều rule chạm tới cùng hàm, gộp các postcondition (unique).
    Với case gián tiếp, vẫn dùng postcondition của rule gốc.
    """
    lines: List[str] = []

    # Pre từ kiểu tham số
    pres = list(dict.fromkeys(param_preconds.get(func_name, [])))  # unique, giữ thứ tự
    for pre in pres:
        lines.append(f"    /// @notice precondition {pre}")

    # Post từ các rule liên quan (direct or indirect)
    edges = rule_call_edges.get(func_name, [])
    if not edges and not pres:
        return []  # không có gì để ghi

    posts_set = []
    seen = set()
    for (rname, _caller) in edges:
        for post in rule_posts.get(rname, []):
            if post not in seen:
                posts_set.append(post); seen.add(post)

    for post in posts_set:
        lines.append(f"    /// @notice postcondition {post}")

    return lines

def _extract_method_from_pattern(pattern_tree: Tree) -> Tuple[Optional[str], Optional[str], str, Optional[str]]:
    """
    Trả về: (name, contract, kind, visibility)
    kind ∈ {"exact","wildcard","catch_all","catch_unresolved"}
    """
    name = None
    contract = None
    kind = None
    visibility = None

    for t in pattern_tree.scan_values(lambda v: isinstance(v, Token)):
        if getattr(t, "type", None) == "VISIBILITY":
            visibility = t.value

    if pattern_tree.data == "exact_pattern":
        ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
        if len(ids) >= 2:
            contract, name = ids[0], ids[1]
        elif len(ids) == 1:
            name = ids[0]
        kind = "exact"

    elif pattern_tree.data == "wildcard_pattern":
        ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
        name = ids[-1] if ids else None
        kind = "wildcard"

    elif pattern_tree.data == "catch_all_pattern":
        ids = [t.value for t in pattern_tree.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
        contract = ids[0] if ids else None
        kind = "catch_all"
        visibility = "external"

    elif pattern_tree.data == "catch_unresolved_calls_pattern":
        kind = "catch_unresolved"
        visibility = "external"

    return name, contract, kind, visibility

def extract_spec_summary(ast_tree: Tree) -> dict:
    methods = []
    rules = []

    # (giữ nguyên phần quét methods như bạn đã có)
    for node in ast_tree.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "method_spec":
            method_name = None
            contract = None
            kind = None
            visibility = None
            for ch in node.children:
                if isinstance(ch, Tree) and ch.data in (
                    "exact_pattern",
                    "wildcard_pattern",
                    "catch_all_pattern",
                    "catch_unresolved_calls_pattern",
                ):
                    name, ctt, kd, vis = _extract_method_from_pattern(ch)
                    if name is not None:
                        method_name = name
                    if ctt is not None:
                        contract = ctt
                    if kd is not None:
                        kind = kd
                    if vis is not None:
                        visibility = vis

            methods.append({
                "name": method_name,
                "contract": contract,
                "kind": kind if kind else "unknown",
                "visibility": visibility
            })

    allow_all_calls = any(m["kind"] in ("catch_all", "catch_unresolved") for m in methods)
    allowed_names = {m["name"] for m in methods if m.get("name")}

    for node in ast_tree.iter_subtrees_topdown():
        if isinstance(node, Tree) and node.data == "rule":
            rule_name = None
            for t in node.scan_values(lambda v: isinstance(v, Token) and v.type == "ID"):
                rule_name = t.value
                break

            calls = []
            undefined = []
            asserts = []
            snapshots = {}  # ghost_var -> observed_fn_name

            for sub in node.iter_subtrees_topdown():
                # 1) function calls (thu cả args)
                if isinstance(sub, Tree) and sub.data == "function_call":
                    fname, fargs = _get_function_call_info(sub)
                    if fname:
                        calls.append({"name": fname, "args": fargs})
                        if not allow_all_calls and (fname not in allowed_names):
                            undefined.append(fname)

                # 2) assert statements
                if isinstance(sub, Tree) and sub.data == "assert_statement":
                    expr_node = None
                    msg = None
                    for ch in sub.children:
                        if isinstance(ch, Tree):
                            expr_node = ch
                        if isinstance(ch, Token) and ch.type == "STRING_LITERAL":
                            msg = ch.value[1:-1]
                    # flatten expr_node
                    toks = []
                    if expr_node is not None:
                        for t in expr_node.scan_values(lambda v: isinstance(v, Token)):
                            toks.append(t.value)
                    expr_txt = " ".join(toks).replace(" ,", ",").replace("( ", "(").replace(" )", ")").replace(" .", ".").strip()
                    asserts.append({"expr": expr_txt, "message": msg})

                # 3) snapshots từ define_statement có RHS là zero-arg function_call
                if isinstance(sub, Tree) and sub.data == "define_statement":
                    lhs_name = None
                    for ch in sub.children:
                        if isinstance(ch, Token) and ch.type == "ID":
                            lhs_name = ch.value
                            break
                    expr_node = next((ch for ch in sub.children if isinstance(ch, Tree) and ch.data in ("expr","function_call")), None)
                    fc = None
                    if isinstance(expr_node, Tree) and expr_node.data == "function_call":
                        fc = expr_node
                    elif isinstance(expr_node, Tree):
                        fc = next((t for t in expr_node.iter_subtrees_topdown() if t.data == "function_call"), None)
                    if lhs_name and fc:
                        zname = _is_zero_arg_function_call(fc)
                        if zname:
                            snapshots[lhs_name] = zname

            rules.append({
                "name": rule_name,
                "calls": calls,
                "undefined_calls": sorted(set(undefined)),
                "asserts": asserts,
                "snapshots": snapshots
            })



    return {
        "methods": methods,
        "allow_all_calls": allow_all_calls,
        "allowed_names": allowed_names,
        "rules": rules
    }


# ---------- 2) Tìm vị trí hàm trong Solidity bằng Slither ----------

def _scan_function_lines_in_file(sol_file: str, target_names: List[str]) -> Dict[str, List[int]]:
    """
    Quét trực tiếp source để tìm các dòng bắt đầu khai báo function theo tên.
    Trả về: {func_name: [line1, line2, ...]} (1-indexed)
    Hỗ trợ overload (nhiều lần xuất hiện cùng tên).
    """
    with open(sol_file, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    name_set = set(target_names)
    patterns = {name: re.compile(rf'^\s*function\s+{re.escape(name)}\s*\(') for name in name_set}

    found: Dict[str, List[int]] = {name: [] for name in name_set}
    for i, line in enumerate(lines, start=1):
        for name, pat in patterns.items():
            if pat.search(line):
                found[name].append(i)
    return found

def _build_comments_for_function_name(func_name: str, rules: list[dict], rule_call_edges: Dict[str, List[Tuple[str, Optional[str]]]]) -> list[str]:
    """
    - Hiển thị:
      + Các lần gọi trực tiếp (có args) từ rule
      + Các lần gọi gián tiếp: 'Indirect from rule R via add_to_x'
      + Các assert của rule (vẫn thuộc rule gốc)
    """
    lines: List[str] = []

    # edges theo rule cho func_name
    edges = rule_call_edges.get(func_name, [])
    if not edges:
        return []

    lines.append('/// === SPEC ASSERTS (auto-generated) ===')

    # 1) Direct calls: lấy args từ rules
    for r in rules:
        rname = r["name"]
        # rule này có edge tới func_name?
        if not any(e[0] == rname for e in edges):
            continue

        # direct calls trong rule (có thể nhiều lần)
        direct_calls = [c for c in r["calls"] if c["name"] == func_name]
        for c in direct_calls:
            if c["args"]:
                lines.append(f'/// Call from rule {rname}: {func_name}({", ".join(c["args"])})')
            else:
                lines.append(f'/// Call from rule {rname}: {func_name}()')

        # indirect edges: (rule, caller_name)
        for (erule, caller) in edges:
            if erule != rname or caller is None:
                continue
            lines.append(f'/// Indirect from rule {rname} via {caller}()')

        # Assert của rule
        for a in r["asserts"]:
            if a.get("message"):
                lines.append(f'/// - {a["expr"]}  // {a["message"]}')
            else:
                lines.append(f'/// - {a["expr"]}')

    return lines

def _insert_lines_before(filepath: str, line_no_1based: int, new_lines: List[str]) -> None:
    with open(filepath, "r", encoding="utf-8") as f:
        lines = f.read().splitlines()

    insert_at = max(0, min(len(lines), line_no_1based - 1))
    for idx, ln in enumerate(new_lines):
        lines.insert(insert_at + idx, ln)

    with open(filepath, "w", encoding="utf-8") as f:
        f.write("\n".join(lines) + "\n")

def build_call_mapping(sol_file: str) -> dict[str, list[str]]:
    sol_path = os.path.abspath(sol_file)
    sl = Slither(sol_path)

    callmap: dict[str, list[str]] = {}

    for c in sl.contracts:
        for f in c.functions:
            src_name = f.canonical_name  # ví dụ: "MyContract.myFunc(uint256)"
            callees = []

            # internal calls (IR InternalCall)
            for ic in f.internal_calls:
                callee = getattr(ic, "function", None)
                if isinstance(callee, SlitherFunction):
                    callees.append(callee.canonical_name)

            # external/high-level calls (tuple (Contract, HighLevelCall))
            for (_dest_contract, hl) in f.high_level_calls:
                callee = getattr(hl, "function", None)
                if isinstance(callee, SlitherFunction):
                    callees.append(callee.canonical_name)

            callmap[src_name] = callees

    return callmap

def annotate_spec_asserts(ast_tree: Tree, sol_file: str, output_path: Optional[str] = None) -> str:
    """
    - Lấy rules/calls/asserts từ AST
    - Lọc call theo methods (trừ khi có catch_all/catch_unresolved)
    - Quét trực tiếp file .sol để tìm dòng function và chèn comment /// ngay trước đó
    - Ghi ra <sol_file>.annotated.sol
    """
    spec = extract_spec_summary(ast_tree)
    print(spec)
    methods = spec["methods"]
    allow_all = spec["allow_all_calls"]
    allowed_names = {m["name"] for m in methods if m.get("name")}

    # lọc calls
    filtered_rules = []
    for r in spec["rules"]:
        calls = r["calls"] if allow_all else [c for c in r["calls"] if c["name"] in allowed_names]
        filtered_rules.append({**r, "calls": calls})

    # 1) Xây call graph bằng Slither
    callmap = build_call_mapping(sol_file)

    def _simple_name(canonical: str) -> str:
        s = canonical.split(".", 1)[-1]
        return s.split("(", 1)[0]

    caller2callees: Dict[str, set] = {}
    for src, callees in callmap.items():
        src_name = _simple_name(src)
        for cal in callees:
            caller2callees.setdefault(src_name, set()).add(_simple_name(cal))

    seed_names = sorted({c["name"] for r in filtered_rules for c in r["calls"]})
    transitive_names = set(seed_names)
    for seed in seed_names:
        transitive_names |= caller2callees.get(seed, set())

    # 2) Tập “seed” là các hàm xuất hiện trực tiếp trong rule
    seed_func_names = sorted({c["name"] for r in filtered_rules for c in r["calls"]})

    # 3) Mở rộng thêm một bậc: tất cả callee của seed
    transitive_func_names = set(seed_func_names)
    for seed in seed_func_names:
        for cal in caller2callees.get(seed, set()):
            transitive_func_names.add(cal)

    # rule_call_edges: func_name -> list of (rule_name, direct_caller_name or None)
    # - direct: (rule_name, func_name) chính nó
    # - indirect (callee): (rule_name, caller_name) nơi caller_name ∈ seed
    rule_call_edges: Dict[str, List[Tuple[str, Optional[str]]]] = {}
    for r in filtered_rules:
        rname = r["name"]
        direct = {c["name"] for c in r["calls"]}
        for fn in direct:
            rule_call_edges.setdefault(fn, []).append((rname, None))
        for caller in direct:
            for cal in caller2callees.get(caller, set()):
                rule_call_edges.setdefault(cal, []).append((rname, caller))

    rule_posts: Dict[str, List[str]] = {r["name"]: infer_rule_posts(r) for r in filtered_rules}
    param_preconds = collect_solidity_param_preconds(sol_file)
    target_func_names = sorted(transitive_names)

    # Nếu không có gì để chèn, cứ copy file và trả path
    if output_path is None:
        base, ext = os.path.splitext(os.path.abspath(sol_file))
        output_path = base + ".annotated" + ext

    with open(sol_file, "r", encoding="utf-8") as rf:
        original = rf.read()
    with open(output_path, "w", encoding="utf-8") as wf:
        wf.write(original)

    # đổi pragma sang ^0.7.0
    _rewrite_pragma_to_0_7_0(output_path)

    if not target_func_names:
        return output_path

    # Quét file để tìm dòng function theo tên
    occ = _scan_function_lines_in_file(sol_file, target_func_names)
    inserts: List[Tuple[int, List[str]]] = []
    for name, lines in occ.items():
        if not lines:
            continue
        comments = _build_notice_annotations(name, filtered_rules, rule_call_edges, rule_posts, param_preconds)
        if not comments:
            continue
        for ln in lines:
            inserts.append((ln, comments))


    # Chèn theo thứ tự giảm dần dòng để không làm lệch vị trí
    for ln, comments in sorted(inserts, key=lambda x: x[0], reverse=True):
        _insert_lines_before(output_path, ln, comments)

    return output_path

def run_sv(out_file: str) -> int:
    """
    Chạy ./docker/runsv.sh {out_file} và in stdout/stderr ra terminal.
    Trả về mã thoát (return code).
    """
    cmd = ["./docker/runsv.sh", out_file]
    try:
        proc = subprocess.run(cmd, capture_output=True, text=True, check=False)
    except FileNotFoundError:
        # fallback: dùng bash
        proc = subprocess.run(["bash", "./docker/runsv.sh", out_file],
                              capture_output=True, text=True, check=False)

    if proc.stdout:
        print("\033[96mSOLC-VERIFY OUTPUT:\033[0m") 
        print(proc.stdout, end="")
    return proc.returncode


def main():
    parser = argparse.ArgumentParser(description="Parse a file with Lark grammar")
    parser.add_argument("file_sol", help="Path to the solidity file")
    parser.add_argument("file_spec", help="Path to the spec file")
    parser.add_argument("--grammar", default="./parser_certora.lark", help="Path to the grammar file (default: ./parser_certora.lark)")
    args = parser.parse_args()

    with open(args.grammar, "r", encoding="utf-8") as f:
        parser_text = f.read()

    l = Lark(parser_text)

    with open(args.file_spec, "r", encoding="utf-8") as f:
        data = f.read()

    ast_tree = l.parse(data)
    out_file = annotate_spec_asserts(ast_tree, args.file_sol)
    print("Annotated file written to:", out_file)
    run_sv(out_file)


if __name__ == "__main__":
    main()