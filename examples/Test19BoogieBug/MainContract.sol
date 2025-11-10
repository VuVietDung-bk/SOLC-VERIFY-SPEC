// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MainContract 
{
    address currentBidder;
    uint256 public currentBid;

    function bid() public payable
    {
        require(msg.value >= address(this).balance);
        payable(currentBidder).transfer(address(this).balance);
        currentBidder = msg.sender; 
        currentBid = msg.value;
    }
}