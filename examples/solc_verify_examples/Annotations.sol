// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

/// @notice invariant x == y
contract C {
    int x;
    int y;

    /// @notice precondition x == y
    /// @notice postcondition x == (y + n)
    /// @notice modifies x
    function add_to_x(int n) internal {
        x = x + n;
        require(x >= y); // Ensures that there is no overflow
    }

    /// @notice modifies x if n > 0
    /// @notice modifies y if n > 0
    function add(int n) public {
        require(n >= 0);
        add_to_x(n);
        /// @notice invariant y <= x
        while (y < x) {
            y = y + 1;
        }
    }
}
