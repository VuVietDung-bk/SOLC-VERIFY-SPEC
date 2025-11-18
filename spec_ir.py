from lark import Tree, Token
from parser_utils import (
    _flatten_tokens_only,
    _extract_param_types_from_pattern
)
from typing import Dict, List, Any
from spec_rule import Rule
from spec_method import Method
from spec_invariant import Invariant

class IR:
    def __init__(self, sol_symbols: Dict[str, Any]):
        self.methods: Dict[str, Method] = {}
        # variables parsed from a 'variables { ... }' block (new grammar)
        # stored as mapping name -> {"type": str}
        self.variables: Dict[str, Dict[str, Any]] = {}
        self.rules: List[Rule] = []
        self.invariants: List[Invariant] = []
        self._sol_symbols = sol_symbols

    @classmethod
    def from_ast(cls, ast, sol_symbols: Dict[str, Any]) -> "IR":
        ir = cls(sol_symbols)
        # Note: for the new grammar, variables may exist and methods may not.
        ir._parse_variables(ast, sol_symbols)
        ir._parse_methods(ast, sol_symbols)
        ir._parse_rules(ast, sol_symbols)
        ir._parse_invariants(ast, sol_symbols)
        return ir

    def _parse_variables(self, ast, sol_symbols: Dict[str, Any]) -> None:
        """
        Parse a 'variables { ... }' block (as in parser_certora_new.lark):
          variables: "variables" "{" (variable_spec)* "}"
          variable_spec: variable_type ID ";"
          variable_type: cvl_type | mapping

        We store variables as: self.variables[name] = {"type": <flattened type>}.
        If the grammar doesn't provide these nodes, this is a no-op.
        """
        for node in ast.iter_subtrees_topdown():
            if not (isinstance(node, Tree) and node.data == "variables"):
                continue
            # Inside, look for 'variable_spec' nodes
            for vs in (ch for ch in node.children if isinstance(ch, Tree) and ch.data == "variable_spec"):
                vname: Any = None
                vtype_text: Any = None
                # Expect children: variable_type Tree, then ID token
                # Be robust: scan subtrees/tokens
                vtype_node = next((ch for ch in vs.children if isinstance(ch, Tree) and ch.data in ("variable_type", "cvl_type", "mapping")), None)
                if vtype_node is not None:
                    vtype_text = _flatten_tokens_only(vtype_node)
                name_tok = next((t for t in vs.children if isinstance(t, Token) and t.type == "ID"), None)
                if name_tok is not None:
                    vname = name_tok.value
                if vname:
                    self.variables[vname] = {"type": (str(vtype_text).strip() if vtype_text else None)}

    def _parse_methods(self, ast, sol_symbols: Dict[str, Any]) -> None:
        """
        Di chuyển logic parse methods từ parse_spec_to_ir cũ.
        Kết quả: self.methods = {name: Method(...), ...}
        """

        for node in ast.iter_subtrees_topdown():
            if not isinstance(node, Tree) or node.data != "method_spec":
                continue

            method_name = None
            kind = None
            visibility = None
            returns_type = None
            params_types: List[str] = []

            # exact_pattern
            exact_pat = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "exact_pattern"), None)
            if exact_pat is not None:
                ids = [t.value for t in exact_pat.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
                if ids:
                    method_name = ids[-1]
                vis_tok = next((t for t in exact_pat.scan_values(lambda v: isinstance(v, Token) and v.type == "VISIBILITY")), None)
                visibility = vis_tok.value if vis_tok is not None else None
                kind = "exact"
                params_types = _extract_param_types_from_pattern(exact_pat)

            # wildcard_pattern
            elif next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "wildcard_pattern"), None):
                wp = next(ch for ch in node.children if isinstance(ch, Tree) and ch.data == "wildcard_pattern")
                ids = [t.value for t in wp.scan_values(lambda v: isinstance(v, Token) and v.type == "ID")]
                method_name = ids[-1] if ids else None
                kind = "wildcard"
                params_types = _extract_param_types_from_pattern(wp)

            # catch_all_pattern
            elif next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "catch_all_pattern"), None):
                kind = "catch_all"
                visibility = "external"

            # catch_unresolved_calls_pattern
            elif next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "catch_unresolved_calls_pattern"), None):
                kind = "catch_unresolved"
                visibility = "external"

            # returns
            ret_node = next((ch for ch in node.children if isinstance(ch, Tree) and ch.data == "cvl_type"), None)
            if ret_node is not None:
                returns_type = _flatten_tokens_only(ret_node)

            # decl_kind
            if method_name in sol_symbols.get("functions", set()):
                decl_kind = "function"
            elif method_name in sol_symbols.get("state_vars", set()):
                decl_kind = "state_var"
            else:
                decl_kind = "unknown"

            if method_name:
                self.methods[method_name] = Method(
                    name=method_name,
                    kind=kind or "unknown",
                    visibility=visibility,
                    returns=returns_type,
                    decl_kind=decl_kind,
                    params=params_types,
                )

    def _parse_rules(self, ast, sol_symbols: Dict[str, Any]) -> None:
        for node in ast.iter_subtrees_topdown():
            if isinstance(node, Tree) and node.data == "rule":
                r = Rule(node, self.methods, sol_symbols)
                self.rules.append(r)
    
    def _parse_invariants(self, ast, sol_symbols: Dict[str, Any]) -> None:
        for node in ast.iter_subtrees_topdown():
            if isinstance(node, Tree) and node.data == "invariant_rule":
                # Provide variable types to invariant builder to help choose sum over int/uint
                var_types_map = {name: info.get("type") for name, info in self.variables.items()}
                inv = Invariant(node, self.methods, var_types_map, sol_symbols)
                self.invariants.append(inv)

    def __repr__(self):
        return f"<IR methods={len(self.methods)} rules={len(self.rules)} invariants={len(self.invariants)}>"
    
    def to_dict(self) -> Dict[str, Any]:
        """Nếu cần giữ tương thích ngược với pipeline cũ"""
        return {
            "variables": [
                {
                    "name": name,
                    "type": info.get("type"),
                }
                for name, info in self.variables.items()
            ],
            "methods": [
                {
                    "name": m.name,
                    "kind": m.kind,
                    "visibility": m.visibility,
                    "returns": m.returns,
                    "decl_kind": m.decl_kind,
                    "params": m.params,
                }
                for m in self.methods.values()
            ],
            "rules": [
                {
                    "name": r.name,
                    "params": r.params,
                    "steps": [ {"kind": s.kind, **s.data} for s in r.steps ],
                    "calls": r.calls,
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
