// SPDX-License-Identifier: AGPL-3.0-only

pragma solidity ^0.7.0;


contract Fibonacci {

    /// @notice precondition i > 0
    function fibonacci(uint32 i) external returns (uint32 re1) {
        if(i == 1 || i == 2) {
            return 1;
        }
        return this.fibonacci(i- 1) + this.fibonacci(i - 2);
    }

    /// @notice precondition i > 0
    /// @notice precondition i == 5
    /// @notice postcondition re1 == 5
    function fibonacci1(uint32 i) external returns (uint32 re1) {
        if(i == 1 || i == 2) {
            return 1;
        }
        return this.fibonacci(i- 1) + this.fibonacci(i - 2);
    }
}