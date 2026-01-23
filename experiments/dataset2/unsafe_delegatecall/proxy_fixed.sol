/*
 * @source: https://github.com/christoftorres/ConFuzzius/tree/master/dataset/curated
 * @author: -
 * @vulnerable_at_lines: 30
 */

pragma solidity >=0.7.0;

contract Proxy {

  address callee;
  address owner;

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  constructor() {
  	callee = address(0x0);
    owner = msg.sender;
  }

  function setCallee(address newCallee) public onlyOwner {
  	callee = newCallee;
  }

  function forward(bytes memory _data) public {
    // <yes> <report> unsafe delegatecall
    (bool ok,) = callee.delegatecall(_data);
    require(ok, "delegatecall failed");
  }

}