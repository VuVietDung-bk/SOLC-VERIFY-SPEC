// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.7.0;


contract NonPayable {
    /// @notice precondition msg.value > 0
    /// @notice postcondition false
    function justANonPayableFunction() external {

    }
}
