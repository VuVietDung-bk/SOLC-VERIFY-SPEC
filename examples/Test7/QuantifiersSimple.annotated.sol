// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

// Simple example that uses quantifiers in the specification. The contract invariants
// state that all element in the range of the array must be non-negative, and there must
// be at least one positive element (in range).

contract QuantifiersSimple {

    int[] a;

    // OK
    constructor() {
        a.push(1);
    }

    // OK
    function add(int d) public {
        require(d >= 0);
        a.push(d);
    }

    // WRONG: might insert negative element
    function add_incorrect(int d) public {
        a.push(d);
    }

    // WRONG: might remove the single positive element
    function remove_incorrect() public {
        a.pop();
    }
}
