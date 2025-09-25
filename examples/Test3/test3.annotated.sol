// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract Example2 {
    uint public x;
    uint public y;
    mapping (uint => bool) public isSet;

    /// @notice precondition n >= 0
    /// @notice postcondition isSet[x]
    function setNextIndex(uint n) external {
        x = n + 2;
        _set(n + 2);
    }

    /// @notice precondition idx >= 0
    function _set(uint idx) internal {
        isSet[idx] = true;
    }

}
