from typing import Any, Dict, List, Set
from lark import Tree
from parser_utils import to_text


def append_unique(bucket: List[Any], expr: Any) -> None:
    """
    Thêm expr vào bucket nếu chưa có (so sánh dựa trên chuỗi to_text/str).
    """
    if expr is None:
        return
    key = to_text(expr) if isinstance(expr, Tree) else str(expr)
    for existing in bucket:
        cmp_key = to_text(existing) if isinstance(existing, Tree) else str(existing)
        if cmp_key == key:
            return
    bucket.append(expr)


def propagate_modifies(
    modify_dict: Dict[str, List[str]],
    call_graph: Dict[str, List[str]],
    func_writes: Dict[str, List[str]],
) -> Dict[str, List[str]]:
    """
    Lan truyền thông tin modifies qua call graph.
    - modify_dict: {fn: ['x if cond', 'y', ...]} trực tiếp trong spec.
    - call_graph: {fn: [callee1, ...]}
    - func_writes: {fn: [state_var1, ...]} thu được từ Slither.
    Trả về dict đã được propagate, bỏ điều kiện khi gán cho hàm con.
    """
    direct_modifies = {fn: list(vals) for fn, vals in modify_dict.items()}
    memo_modifies: Dict[str, bool] = {}
    vars_memo: Dict[str, Set[str]] = {}

    def _strip_cond(m: str) -> str:
        return m.split(" if ", 1)[0].strip() if isinstance(m, str) else str(m)

    def _vars_modified(fn: str, visiting=None) -> Set[str]:
        if fn in vars_memo:
            return vars_memo[fn]
        if visiting is None:
            visiting = set()
        if fn in visiting:
            vars_memo[fn] = set()
            return vars_memo[fn]
        visiting.add(fn)
        vars_set: Set[str] = set(func_writes.get(fn, []))
        for m in direct_modifies.get(fn, []):
            base = _strip_cond(m)
            if base:
                vars_set.add(base)
        for callee in call_graph.get(fn, []):
            vars_set.update(_vars_modified(callee, visiting))
        vars_memo[fn] = vars_set
        visiting.remove(fn)
        return vars_set

    def _does_modify(fn: str, visiting=None) -> bool:
        if fn in memo_modifies:
            return memo_modifies[fn]
        if visiting is None:
            visiting = set()
        if fn in visiting:
            memo_modifies[fn] = False
            return False
        visiting.add(fn)
        if direct_modifies.get(fn) or func_writes.get(fn):
            memo_modifies[fn] = True
            visiting.remove(fn)
            return True
        for callee in call_graph.get(fn, []):
            if _does_modify(callee, visiting):
                memo_modifies[fn] = True
                visiting.remove(fn)
                return True
        memo_modifies[fn] = False
        visiting.remove(fn)
        return False

    propagated = {fn: list(vals) for fn, vals in modify_dict.items()}

    def _dfs_prop(fn: str, mods: List[str], visited=None):
        if visited is None:
            visited = set()
        if fn in visited:
            return
        visited.add(fn)
        for callee in call_graph.get(fn, []):
            if not _does_modify(callee):
                _dfs_prop(callee, mods, visited)
                continue
            bucket = propagated.setdefault(callee, [])
            for m in mods:
                base = _strip_cond(m)
                if base and base in _vars_modified(callee):
                    if base not in [_strip_cond(x) for x in bucket]:
                        bucket.append(base)
            _dfs_prop(callee, mods, visited)

    for fn, mods in list(modify_dict.items()):
        _dfs_prop(fn, mods, set())

    return propagated
