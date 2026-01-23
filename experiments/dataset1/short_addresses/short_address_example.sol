/*
 * @source: https://ericrafaloff.com/analyzing-the-erc20-short-address-attack/
 * @author: -
 * @vulnerable_at_lines: 18
 */

 pragma solidity >=0.7.0;

 contract MyToken {
     mapping (address => uint) balances;

     event Transfer(address indexed _from, address indexed _to, uint256 _value);

     constructor() {
         balances[msg.sender] = 10000;
     }
     // <yes> <report> SHORT_ADDRESSES
     function sendCoin(address to, uint amount) public returns(bool sufficient) {
         if (balances[msg.sender] < amount) return false;
         balances[msg.sender] -= amount;
         balances[to] += amount;
         emit Transfer(msg.sender, to, amount);
         return true;
     }

     function getBalance(address addr) public returns(uint) {
         return balances[addr];
     }
 }
