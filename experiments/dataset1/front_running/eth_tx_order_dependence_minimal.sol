/*
 * @source: https://github.com/ConsenSys/evm-analyzer-benchmark-suite
 * @author: Suhabe Bugrara
 * @vulnerable_at_lines: 23,31
 */

pragma solidity >=0.7.0;

contract EthTxOrderDependenceMinimal {
    address public owner;
    bool public claimed;
    uint public reward;

    constructor() {
        owner = msg.sender;
    }

    function setReward() public payable {
        require (!claimed);

        require(msg.sender == owner);
        // <yes> <report> FRONT_RUNNING
        payable(owner).transfer(reward);
        reward = msg.value;
    }

    function claimReward(uint256 submission) public {
        require (!claimed);
        require(submission < 10);
        // <yes> <report> FRONT_RUNNING
        payable(msg.sender).transfer(reward);
        claimed = true;
    }
}
