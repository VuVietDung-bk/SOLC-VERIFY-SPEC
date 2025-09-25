import re
from typing import Dict, List, Optional

_NUMERIC_OPS = ("+", "-", "*", "/", "%", "<<", ">>", "^")
_BOOL_TOKENS = ("==", "!=", "<=", ">=", "<", ">", "&&", "||")
_NUMERIC_RE = re.compile(r"\b\d+\b")
_STRING_RE = re.compile(r'"([^"\\]|\\.)*"')

def _build_methods_type_map(ir: dict) -> Dict[str, Optional[str]]:
    out: Dict[str, Optional[str]] = {}
    for m in ir.get("methods", []):
        name = m.get("name")
        rtyp = m.get("returns")
        if not name: 
            continue
        if not rtyp:
            out[name] = None
        else:
            t = str(rtyp).strip()
            if t == "bool": out[name] = "bool"
            elif t == "mathint": out[name] = "mathint"
            elif t.startswith("uint"): out[name] = "uint"
            elif t.startswith("int"): out[name] = "int"
            elif t == "string" or t.startswith("bytes"): out[name] = "string"
            else: out[name] = t
    return out

def _infer_rhs_type(expr: Optional[str],
                    rhs_calls: Optional[List[str]],
                    methods_ret_types: Dict[str, Optional[str]]) -> Optional[str]:
    if expr is None:
        return "unknown"
    s = expr.strip()
    if rhs_calls:
        if len(rhs_calls) == 1 and all(op not in s for op in _NUMERIC_OPS + _BOOL_TOKENS):
            fn = rhs_calls[0]
            return methods_ret_types.get(fn, "unknown")
    if any(tok in s for tok in _BOOL_TOKENS): return "bool"
    if any(op in s for op in _NUMERIC_OPS): return "mathint"
    if _STRING_RE.fullmatch(s): return "string"
    if _NUMERIC_RE.fullmatch(s): return "mathint"
    m = re.match(r'^\s*([a-zA-Z_][a-zA-Z0-9_]*)\s*\(', s)
    if m:
        fn = m.group(1)
        return methods_ret_types.get(fn, "unknown")
    return "unknown"

def _types_compatible(lhs: str, rhs: Optional[str]) -> bool:
    if rhs is None:
        return False
    def norm(t: str) -> str:
        t = t.strip()
        if t == "bool": return "bool"
        if t == "mathint": return "mathint"
        if t.startswith("uint"): return "uint"
        if t.startswith("int"): return "int"
        if t == "string" or t.startswith("bytes"): return "string"
        return t
    L, R = norm(lhs), norm(rhs)
    if L == "bool": return R == "bool"
    if L == "string": return R == "string"
    if L in ("mathint","uint","int"): return R in ("mathint","uint","int")
    return L == R

def validate_spec_ir(ir: dict) -> None:
    errors: List[str] = []
    methods_ret_types = _build_methods_type_map(ir)

    # unique method names
    method_names = [m["name"] for m in ir.get("methods", []) if m.get("name")]
    dup_methods = sorted({n for n in method_names if method_names.count(n) > 1})
    if dup_methods:
        errors.append(f"- Duplicate method names: {', '.join(dup_methods)}")

    # unique rule names
    rule_names = [r.get("name") for r in ir.get("rules", []) if r.get("name")]
    dup_rules = sorted({n for n in rule_names if rule_names.count(n) > 1})
    if dup_rules:
        errors.append(f"- Duplicate rule names: {', '.join(dup_rules)}")

    declared_methods = {m["name"] for m in ir.get("methods", []) if m.get("name")}

    for r in ir.get("rules", []):
        rname = r.get("name") or "<unnamed>"

        # calls must be declared
        for fn in r.get("calls", []):
            if fn not in declared_methods:
                errors.append(f"- Rule '{rname}': function call '{fn}' is not declared in methods")

        # ghost vars immutability + type check
        declared_vars: set = set()
        for st in r.get("steps", []):
            kind = st.get("kind")
            if kind == "define":
                g = st.get("ghost")
                if g:
                    if g in declared_vars:
                        errors.append(f"- Rule '{rname}': ghost variable '{g}' is declared more than once")
                    else:
                        declared_vars.add(g)

                lhs_type = st.get("type")
                rhs_expr = st.get("expr")
                rhs_calls = st.get("rhs_calls", [])

                if rhs_expr is not None:
                    inferred_rhs = _infer_rhs_type(rhs_expr, rhs_calls, methods_ret_types)
                    if inferred_rhs is None:
                        if rhs_calls:
                            errors.append(f"- Rule '{rname}': assignment to '{g}' uses '{rhs_calls[0]}(...)' which returns no value")
                        else:
                            errors.append(f"- Rule '{rname}': assignment to '{g}' has no value (void expression)")
                    elif lhs_type and not _types_compatible(lhs_type, inferred_rhs):
                        errors.append(f"- Rule '{rname}': type mismatch in assignment to '{g}': declared '{lhs_type}' but RHS inferred as '{inferred_rhs}'")

            elif kind == "assign":
                for tgt in st.get("targets", []):
                    if tgt in declared_vars:
                        errors.append(f"- Rule '{rname}': ghost variable '{tgt}' was declared but is being modified")

    if errors:
        print("\033[91mSPEC VALIDATION ERROR:\033[0m")
        for e in errors:
            print(e)
        raise SystemExit(1)
