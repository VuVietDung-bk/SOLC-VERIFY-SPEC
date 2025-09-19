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
    posts: List[str] = []
    snaps = rule.get("snapshots", {})
    for st in rule.get("steps", []):
        if st.get("kind") == "assert":
            expr = st.get("text", "")
            eq = _infer_total_change_post(expr, snaps)
            if eq:
                posts.append(eq); continue
            rel = _infer_rel_post(expr, snaps)
            if rel:
                posts.append(rel)
    seen = set(); out = []
    for p in posts:
        if p not in seen:
            seen.add(p); out.append(p)
    return out
