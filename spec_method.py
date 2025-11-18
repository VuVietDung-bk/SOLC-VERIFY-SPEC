from typing import Dict, List, Optional, Any

class Step:
    """Đại diện cho một bước (define, call, assert, ...) trong Rule."""
    def __init__(self, kind: str, data: Dict[str, Any]):
        self.kind = kind
        self.data = data
        
    def __repr__(self):
        return f"<Step {self.kind} {self.data}>"
class Mapping:
    def __init__(self, from_type: str, to_type: Any):
        self.from_type = from_type
        self.to_type = to_type

    def __repr__(self):
        return f"<Mapping from={self.from_type} to={self.to_type}>"
class Variable:
    def __init__(self, name: str, vtype: str, mapping_info: Optional[Mapping] = None):
        self.name = name
        self.vtype = vtype
        self.mapping_info = mapping_info

    def __repr__(self):
        return f"<Variable name={self.name} type={self.vtype}>"
    
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
