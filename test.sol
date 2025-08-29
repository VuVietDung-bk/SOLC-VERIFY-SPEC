// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

/// @notice invariant x == y
contract Example1 {
    uint public x;
    uint public y;

    function add_to_x(uint n) external {
        x = x + n;
        //require(x >= y); // Ensures that there is no overflow
        _add(n);
    }

    function _add(uint n) internal {
        x = x + n;
        y = y + n;
    }
    
    function add_to_y(uint n) external {
        y = y + n;
        //require(x >= y); // Ensures that there is no overflow
    }
    
    // function add(int n) public {
    //     require(n >= 0);
    //     add_to_x(n);
    //     /// @notice invariant y <= x
    //     while (y < x) {
    //         y = y + 1;
    //     }
    // }
}