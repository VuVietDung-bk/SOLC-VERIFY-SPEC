// SPDX-License-Identifier: MIT
pragma solidity ^0.7.0;

contract MainContract 
{
    address currentBidder;
    uint256 public currentBid;

    /// @notice precondition msg.sender != address(this)
    /// @notice precondition msg.value > currentBid
    /// @notice postcondition address(this).balance > __verifier_old_uint(address(this).balance)
    function bid() public payable
    {
        require(msg.value >= address(this).balance);
        payable(currentBidder).transfer(address(this).balance);
        currentBidder = msg.sender; 
        currentBid = msg.value;
    }
}