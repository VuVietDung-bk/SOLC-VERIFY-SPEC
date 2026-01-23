/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 12
 */

pragma solidity >=0.7.0;

contract Caller {
    function callAddress(address a) public {
        // <yes> <report> UNCHECKED_LL_CALLS
        a.call("");
    }
}