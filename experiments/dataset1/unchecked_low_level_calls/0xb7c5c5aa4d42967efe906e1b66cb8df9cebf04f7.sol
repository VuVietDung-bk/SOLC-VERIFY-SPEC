/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 25
 */

pragma solidity >=0.7.0;

/*
!!! THIS CONTRACT IS EXPLOITABLE AND FOR EDUCATIONAL PURPOSES ONLY !!!

This smart contract allows a user to (insecurely) store funds
in this smart contract and withdraw them at any later point in time
*/

contract keepMyEther {
    mapping(address => uint256) public balances;
    
    fallback() payable external {
        balances[msg.sender] += msg.value;
    }

    receive() payable external {
        
    }
    
    function withdraw() public {
        // <yes> <report> UNCHECKED_LL_CALLS
        msg.sender.call{value: balances[msg.sender]}("");
        balances[msg.sender] = 0;
    }
}