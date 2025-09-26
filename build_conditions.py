from typing import Any, Dict, List, Optional, Tuple

def _infer_total_change_post(assert_text: str, snapshots: Dict[str, str]) -> Optional[str]:
    s = assert_text.strip()
    if "==" not in s:
        return None
    left, right = [p.strip() for p in s.split("==", 1)]

    def parse_minus(expr: str) -> Optional[Tuple[str, str]]:
        if " - " not in expr:
            return None
        a, b = expr.split(" - ", 1)
        a, b = a.strip(), b.strip()
        if a in snapshots:
            return snapshots[a], b
        return None

    if left in snapshots:
        pr = parse_minus(right)
        if pr and pr[0] == snapshots[left]:
            obs, expr_total = pr
            return f"__verifier_old_uint({obs}) == {obs} - {expr_total}"
    if right in snapshots:
        pl = parse_minus(left)
        if pl and pl[0] == snapshots[right]:
            obs, expr_total = pl
            return f"{obs} - {expr_total} == __verifier_old_uint({obs})"
    return None

def _infer_rel_post(assert_text: str, snapshots: Dict[str, str]) -> Optional[str]:
    s = assert_text.strip()
    ops = ["<=", ">=", "==", "!=", "<", ">"]
    op = next((o for o in ops if f" {o} " in s), None)
    if not op:
        return None
    left, right = [p.strip() for p in s.split(f" {op} ", 1)]
    if left not in snapshots or right not in snapshots:
        return None
    obsL, obsR = snapshots[left], snapshots[right]
    if obsL != obsR:
        return None
    return f"__verifier_old_uint({obsL}) {op} {obsR}"

def rule_to_posts(rule: Dict[str, Any]) -> List[str]:
    """
    Sinh hậu-điều-kiện từ:
      (A) assert gọi vào state-var/mapping: isSet(xAfter) → 'isSet[<resolved-arg>]'
          - thay ghost trong args bằng expr_text từ snapshot (vd 'xAfter' → 'x + 2').
      (B) quan hệ BEFORE/AFTER (<=, >=, ==, ...) dùng simple snapshots ghost→observed.
    """
    posts: List[str] = []

    # --- A) Mapping-like assertions (state variables with args) ---
    rich_snaps: Dict[str, Dict[str, Any]] = rule.get("snapshots", {}) or {}

    def _resolve_arg(a: str) -> str:
        """Nếu 'a' là ghost và snapshot có 'expr_text' thì thay bằng expr_text; ngược lại giữ nguyên."""
        info = rich_snaps.get(a)
        if isinstance(info, dict):
            et = info.get("expr_text")
            if et:
                return et
        return a

    # xử lý mapping/state-var assertions
    for st in rule.get("steps", []):
        if st.get("kind") != "assert":
            continue
        for fc in st.get("func_calls", []):
            if fc.get("decl_kind") == "state_var":
                name = fc.get("name")
                args = fc.get("args", [])
                if not name:
                    continue
                if len(args) == 0:
                    posts.append(f"{name}")
                elif len(args) == 1:
                    resolved = [_resolve_arg(a) for a in args]
                    posts.append(f"{name}[{', '.join(resolved)}]")
                else:
                    resolved = [_resolve_arg(a) for a in args]
                    posts.append(f"{name}[" + "][".join(resolved) + "]")

    # --- B) Quan hệ BEFORE/AFTER cho delta/relational ---
    # rút simple map: ghost -> observed (nếu có)
    simple_snaps: Dict[str, str] = {}
    for g, info in rich_snaps.items():
        if isinstance(info, dict) and info.get("observed"):
            simple_snaps[g] = info["observed"]

    # xử lý phần relational/delta từ expr_text
    for st in rule.get("steps", []):
        if st.get("kind") != "assert":
            continue
        expr = st.get("expr_text", "") or st.get("text", "") or ""
        # delta-equality ưu tiên trước
        eq = _infer_total_change_post(expr, simple_snaps)
        if eq:
            posts.append(eq)
            continue
        # quan hệ bất đẳng thức
        rel = _infer_rel_post(expr, simple_snaps)
        if rel:
            posts.append(rel)

    # unique, giữ thứ tự
    seen = set()
    out: List[str] = []
    for p in posts:
        if p not in seen:
            seen.add(p)
            out.append(p)
    return out