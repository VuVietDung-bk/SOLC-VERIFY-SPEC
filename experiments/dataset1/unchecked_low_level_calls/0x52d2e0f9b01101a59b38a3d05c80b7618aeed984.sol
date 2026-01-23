/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 27
 */

pragma solidity >=0.7.0;
abstract contract Token {
    function transfer(address _to, uint _value) public virtual returns (bool success);
    function balanceOf(address _owner) public virtual returns (uint balance);
}
contract EtherGet {
    address owner;
    constructor() {
        owner = msg.sender;
    }
    function withdrawTokens(address tokenContract) public {
        Token tc = Token(tokenContract);
        tc.transfer(owner, tc.balanceOf(address(this)));
    }
    function withdrawEther() public {
        payable(owner).transfer(address(this).balance);
    }
    function getTokens(uint num, address addr) public {
        for(uint i = 0; i < num; i++){
            // <yes> <report> UNCHECKED_LL_CALLS
            addr.call{value: 0 wei}("");
        }
    }
}