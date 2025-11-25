from lark import Tree, Token
from parser_utils import _flatten_tokens_only
from typing import Dict, List, Any, Optional
from spec_rule import Rule
from spec_method import Variable, Mapping
from spec_invariant import Invariant

class IR:
    def __init__(self, sol_symbols: Dict[str, Any]):
        # variables parsed from a 'variables { ... }' block (new grammar)
        # stored as mapping name -> Variable
        self.variables: Dict[str, Variable] = {}
        self.rules: List[Rule] = []
        self.invariants: List[Invariant] = []
        self._sol_symbols = sol_symbols

    @classmethod
    def from_ast(cls, ast, sol_symbols: Dict[str, Any]) -> "IR":
        ir = cls(sol_symbols)
        ir._parse_variables(ast, sol_symbols)
        ir._parse_rules(ast, sol_symbols)
        ir._parse_invariants(ast, sol_symbols)
        return ir

    @staticmethod
    def _render_type(type_obj: Any) -> str:
        if isinstance(type_obj, Mapping):
            from_part = type_obj.from_type or ""
            to_part = IR._render_type(type_obj.to_type)
            return f"mapping({from_part}=>{to_part})"
        return str(type_obj) if type_obj is not None else ""

    def _parse_variables(self, ast: Tree, sol_symbols: Dict[str, Any]) -> None:
        """
        Parse a 'variables { ... }' block (as in parser_certora_new.lark):
          variables: "variables" "{" (variable_spec)* "}"
          variable_spec: variable_type ID ";"
          variable_type: cvl_type | mapping

        We store variables as: self.variables[name] = Variable(...).
        If the grammar doesn't provide these nodes, this is a no-op.
        """
        def _build_mapping(mnode: Tree) -> Optional[Mapping]:
            if not (isinstance(mnode, Tree) and mnode.data == "mapping"):
                return None

            map_from_node = next((c for c in mnode.children if isinstance(c, Tree) and c.data == "map_from"), None)
            map_to_node = next((c for c in mnode.children if isinstance(c, Tree) and c.data == "map_to"), None)

            from_type = _flatten_tokens_only(map_from_node).strip() if map_from_node else ""
            to_type: Any = ""

            nested = next((c for c in map_to_node.children if isinstance(c, Tree) and c.data == "mapping"), None) if map_to_node else None
            if nested:
                to_type = _build_mapping(nested)
            elif map_to_node:
                to_type = _flatten_tokens_only(map_to_node).strip()

            return Mapping(from_type, to_type)

        for node in ast.iter_subtrees_topdown():
            if not isinstance(node, Tree) or node.data != "variable_spec":
                continue

            vname = None
            vtype = None
            mapping_info: Optional[Mapping] = None

            name_tok = next((t for t in node.children if isinstance(t, Token) and t.type == "ID"), None)
            if name_tok:
                vname = name_tok.value

            vtype_node = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data in ("variable_type", "cvl_type", "mapping")), None)

            mapping_node = None
            if isinstance(vtype_node, Tree):
                if vtype_node.data == "mapping":
                    mapping_node = vtype_node
                else:
                    mapping_node = next((c for c in vtype_node.children if isinstance(c, Tree) and c.data == "mapping"), None)

            if mapping_node is not None:
                mapping_info = _build_mapping(mapping_node)
                vtype = self._render_type(mapping_info) if mapping_info else _flatten_tokens_only(mapping_node).strip()
            elif vtype_node is not None:
                vtype = _flatten_tokens_only(vtype_node).strip()

            if vname:
                self.variables[vname] = Variable(name=vname, vtype=vtype or "", mapping_info=mapping_info)

    def _parse_rules(self, ast: Tree, sol_symbols: Dict[str, Any]) -> None:
        for node in ast.iter_subtrees_topdown():
            if isinstance(node, Tree) and node.data == "rule":
                r = Rule(node, self.variables, sol_symbols)
                self.rules.append(r)
    
    def _parse_invariants(self, ast: Tree, sol_symbols: Dict[str, Any]) -> None:
        for node in ast.iter_subtrees_topdown():
            if isinstance(node, Tree) and node.data == "invariant_rule":
                # Provide variable types to invariant builder to help choose sum over int/uint
                # For mappings, pass the value type (map_to) to invariants; otherwise pass the declared type
                var_types_map = {}
                for name, var in self.variables.items():
                    if var.mapping_info:
                        var_types_map[name] = self._render_type(var.mapping_info.to_type)
                    else:
                        var_types_map[name] = var.vtype
                inv = Invariant(node, var_types_map, sol_symbols)
                self.invariants.append(inv)

    def __repr__(self):
        return f"<IR variables={len(self.variables)} rules={len(self.rules)} invariants={len(self.invariants)}>"
    
    def to_dict(self) -> Dict[str, Any]:
        """Nếu cần giữ tương thích ngược với pipeline cũ"""
        return {
            "variables": [
                {
                    "name": var.name,
                    "type": var.vtype,
                }
                for var in self.variables.values()
            ],
            "rules": [
                {
                    "name": r.name,
                    "params": r.params,
                    "steps": [ {"kind": s.kind, **s.data} for s in r.steps ],
                    "snapshots": r.snapshots,
                }
                for r in self.rules
            ],
            "invariants": [
                {
                    "name": inv.name,
                    "steps": [ {"kind": s.kind, **s.data} for s in inv.steps ],
                }
                for inv in self.invariants
            ],
        }
