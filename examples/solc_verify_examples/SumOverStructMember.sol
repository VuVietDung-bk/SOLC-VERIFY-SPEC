// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

// Example for sum function over an integer member of a mapping of structs.
// Use '__verifier_idx_address' as a placeholder when indexing into the mapping.

/// @notice invariant __verifier_sum_uint(accounts[__verifier_idx_address].balance) <= address(this).balance
contract Bank {
    struct Account {
        uint balance;
        // ... possibly more members
    }

    mapping(address=>Account) accounts;

    function deposit() public payable {
        accounts[msg.sender].balance += msg.value;
    }

    function withdraw() public {
        uint amount = accounts[msg.sender].balance;
        require(amount > 0);
        accounts[msg.sender].balance = 0;
        msg.sender.transfer(amount);
    }
}
