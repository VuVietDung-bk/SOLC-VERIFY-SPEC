/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 14
 */

pragma solidity >=0.7.0;

contract Proxy {
    address public Owner;
    
    modifier onlyOwner() {
        require(msg.sender == Owner);
        _;
    }
    
    constructor() {
        Owner = msg.sender;
    }
    
    function transferOwner(address _owner) public onlyOwner {
        Owner = _owner;
    }
    
    function proxy(address target, bytes memory data) public payable {
        // <yes> <report> UNCHECKED_LL_CALLS
        target.call{value: msg.value}(data);
    }
}

contract DepositProxy is Proxy {
    mapping (address => uint256) public Deposits;

    receive() external payable { }
    
    constructor() payable {
        if (msg.sender == tx.origin) {
            Owner = msg.sender;
            deposit();
        }
    }
    
    function deposit() public payable {
        if (msg.value > 0.5 ether) {
            Deposits[msg.sender] += msg.value;
        }
    }
    
    function withdraw(uint256 amount) public onlyOwner {
        if (amount > 0 && Deposits[msg.sender] >= amount) {
            (bool success, ) = msg.sender.call{value: amount}("");
            require(success);
        }
    }
}