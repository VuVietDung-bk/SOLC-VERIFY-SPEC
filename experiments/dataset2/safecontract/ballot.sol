/*
 * @source: http://remix.ethereum.org/
 * @author: -
 * @vulnerable_at_lines: 0
 */


pragma solidity >=0.7.0;

contract Ballot{
    struct Voter{
        uint weight;
        bool voted;
        uint vote;
        address delegate;
    }
    struct Proposal{
        uint voteCount;
    }
    address public chairperson;
    Proposal[] public proposals;
    mapping(address => Voter) voters;

    constructor(uint8 _numberProposals) {
        chairperson = msg.sender;
        voters[chairperson].weight = 1;
        for (uint256 i = 0; i < _numberProposals; i++) {
            proposals.push(Proposal(0));
        }
    }
    function giveRightToVote(address voter) public{
        require(msg.sender == chairperson);
        require(voters[voter].voted == false);
        require(voters[voter].weight == 0);
        voters[voter].weight = 1;
    }
    function delegate(address to) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        require(to != msg.sender);
        address delegateAddr = to;
        while(voters[delegateAddr].delegate != address(0) && voters[delegateAddr].delegate != msg.sender){
            delegateAddr = voters[delegateAddr].delegate;
        }
        require(delegateAddr != msg.sender);
        sender.voted = true;
        sender.delegate = delegateAddr;
        Voter storage delegateTo = voters[delegateAddr];
        if(delegateTo.voted){
            proposals[delegateTo.vote].voteCount += sender.weight; 
        }else{
            delegateTo.weight += sender.weight;
        }
    }

    function vote(uint proposal) public {
        Voter storage sender = voters[msg.sender];
        require(!sender.voted);
        sender.voted = true;
        sender.vote = proposal;
        proposals[proposal].voteCount += sender.weight;
    }
    function winningProposal() public view returns(uint _winningProposal){
        uint winningCount = 0;
        for(uint prop = 0; prop < proposals.length; prop++){
            if(proposals[prop].voteCount > winningCount){
                winningCount = proposals[prop].voteCount;
                _winningProposal = prop;
            }
        }
    }

}