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
    
#python3 solc-verify-spec.py examples/Test3/test3.sol:Example3 examples/Test3/test3.spec
#python3 solc-verify-spec.py examples/Test4/Annotations.sol:C examples/Test4/Annotations.spec
#python3 solc-verify-spec.py examples/Test5/BecToken.sol:BecToken examples/Test5/BecToken.spec
#python3 solc-verify-spec.py examples/Test6Loop/BinarySearch.sol:BinarySearch examples/Test6Loop/BinarySearch.spec
#python3 solc-verify-spec.py examples/Test7/QuantifiersSimple.sol:QuantifiersSimple examples/Test7/QuantifiersSimple.spec
#python3 solc-verify-spec.py examples/Test8/SimpleBank.sol:SimpleBank examples/Test8/SimpleBank.spec
#python3 solc-verify-spec.py examples/Test9/Reentrancy.sol:SimpleBank examples/Test9/Reentrancy.spec