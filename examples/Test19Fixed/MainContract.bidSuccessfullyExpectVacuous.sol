// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract MainContract 
{
    address currentBidder;
    uint256 public currentBid;

    /// @notice precondition msg.value >= 0
    /// @notice precondition address(this).balance >= 0
    /// @notice precondition msg.sender != address(this)
    /// @notice precondition msg.value > 0 && msg.value > address(this).balance
    /// @notice precondition address(this).balance > 0
    /// @notice postcondition address(this).balance >= __verifier_old_uint(address(this).balance)
    function bid() public payable
    {
        require(msg.value >= currentBid);
        payable(currentBidder).transfer(currentBid);
        currentBidder = msg.sender; 
        currentBid = msg.value;
    }
}
