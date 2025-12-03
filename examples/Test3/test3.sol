// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

contract Example3 {
    uint public x;
    uint public y;
    mapping (uint => bool) public isSet;

    function setNextIndex(uint n) external {
        x = n + 2;
        _set(n + 2);
    }

    function _set(uint idx) internal {
        isSet[idx] = true;
    }

}