// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

// Example demonstrating possible outcomes of verification
contract VerifResults {
    int x;

    // Constructor: OK
    /// @notice postcondition x == 0
    constructor() {
    }

    // Setting a value: OK
    /// @notice modifies x
    /// @notice postcondition x == x1
    function set_correct(int x1) public {
        x = x1;
    }

    // Setting a value: ERROR
    /// @notice modifies x
    /// @notice postcondition x == x1
    function set_incorrect(int x1) public {
        x = x1 + 1; // Wrong
    }

    // Unsupported feature, but can be specified
    /// @notice modifies x
    /// @notice postcondition x == 0
    function unsupported() public pure {
        assembly {
            // ... set x to 0
        }
    }

    // Relies on specification of unsupported
    // function to prove assertion
    /// @notice modifies x
    function use_unsupported() public view {
        unsupported();
        assert(x == 0);
    }
}
