/*
 * @source: https://github.com/christoftorres/ConFuzzius/tree/master/dataset/curated
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity >=0.7.0;

contract proxy{
  address owner;

  constructor() {
    owner = msg.sender;
  }

  function proxyCall(address _to, bytes memory _data) external {
    // <yes> <report> unsafe delegatecall
    (bool ok,) = _to.delegatecall(_data);
    require(!ok, "delegatecall unexpectedly succeeded");
  }
  function withdraw() external{
    require(msg.sender == owner);
    payable(msg.sender).transfer(address(this).balance);
  }
} 

/*
You can't use proxyCall to change the owner address as either: 

1) the delegatecall reverts and thus does not change owner
2) the delegatecall does not revert and therefore will cause the proxyCall to revert and preventing owner from changing

This false positive may seem like a really edge case, however since you can revert data back to proxy this patern is useful for proxy architectures
*/