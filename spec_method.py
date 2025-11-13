from typing import Dict, List, Optional, Any
from lark import Tree

class Step:
    """Đại diện cho một bước (define, call, assert, ...) trong Rule."""
    def __init__(self, kind: str, data: Dict[str, Any], node: Tree):
        self.kind = kind
        self.data = data
        self.node = node

    def __repr__(self):
        return f"<Step {self.kind} {self.data}>"
    
class Method:
    def __init__(self,
                 name: str,
                 kind: str,
                 visibility: Optional[str],
                 returns: Optional[str],
                 decl_kind: str,
                 params: List[str]):
        self.name = name
        self.kind = kind
        self.visibility = visibility
        self.returns = returns
        self.decl_kind = decl_kind  # "function" | "state_var" | "unknown"
        self.params = params

    def __repr__(self) -> str:
        return f"<Method name={self.name} kind={self.kind} returns={self.returns} decl={self.decl_kind}>"
