// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

/**
 * @title DataInvariant
 * @dev A contract with a per-address balance array and a function that can break an intended invariant.
 */
/// @notice invariant forall (address a) balance[a] >= 0
contract DataInvariant {

    mapping(address => int256) public balance;
    mapping(address => bool) public accessInvariant;

    /**
     * @notice Decreases the address's balance by 2*value and then partially restores it, 
     * potentially leaving it negative if `balance[a]` wasn't large enough.
     */
    function breakInvariant(address a, int256 value) external returns (bool accessInv) {
        require(value >= 0, "Value must be nonnegative");
        balance[a] -= 2 * value;      // Force a large negative change
        accessInv = accessInvariant[a]; // Read from the 'accessInvariant' mapping
        balance[a] += value;         // Restore half, potentially leaving negative
    }
}
