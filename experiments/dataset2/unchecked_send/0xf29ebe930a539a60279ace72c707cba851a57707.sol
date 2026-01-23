/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 16
 */

pragma solidity >=0.7.0;


contract B {
    address payable public owner;
    constructor() {
        owner = payable(msg.sender);
    }
    
    function go() public payable {
        address payable target = payable(0xC8A60C51967F4022BF9424C337e9c6F0bD220E1C);
        // <yes> <report> UNCHECKED_LL_CALLS
        target.call{value: msg.value}("");
        owner.transfer(address(this).balance);
    }
    
    receive() external payable {
    }

    fallback() external payable {
    }
}