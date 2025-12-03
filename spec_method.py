from typing import Dict, List, Optional, Any
from lark import Tree

class Step:
    def __init__(self, kind: str, data: Dict[str, Any], node: Tree):
        self.kind = kind
        self.data = data
        self.node = node
        
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