// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

/// @notice invariant __verifier_sum_uint(balances) <= address(this).balance
contract SimpleBank {
    mapping(address=>uint) balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    /// @notice precondition amount >= 0
    function withdraw(uint256 amount) public {
        require(balances[msg.sender] > amount);
        balances[msg.sender] -= amount;
        bool ok;
        (ok, ) = msg.sender.call{value: amount}(""); // No reentrancy attack
        if (!ok) revert();
    }
}
