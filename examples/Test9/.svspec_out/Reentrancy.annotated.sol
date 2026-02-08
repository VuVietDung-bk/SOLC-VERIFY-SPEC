// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

/// @notice invariant __verifier_sum_uint(balances) <= address(this).balance
contract SimpleBank {
    mapping(address=>uint) balances;

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition forall (address addr2005) addr2005.balance >= 0
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    /// @notice precondition forall (address extraVar0) balances[extraVar0] >= 0
    /// @notice precondition amount >= 0
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] > amount);
        bool ok;
        (ok, ) = msg.sender.call{value: amount}(""); // Reentrancy attack
        if (!ok) revert();
        balances[msg.sender] -= amount;
    }
}
