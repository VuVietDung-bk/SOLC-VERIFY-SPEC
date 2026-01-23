/*
 * @source: https://github.com/ntu-SRSLab/vultron/blob/master/benchmark/gaslesssend/CreditDepositBank/
 * @author: Vultron
 * @vulnerable_at_lines: 60
 */

pragma solidity >=0.7.0;

contract Etheramid {

    struct Participant {
        address inviter;
        address itself;
        uint totalPayout;
    }
    
    mapping (address => Participant) Tree;
    mapping (uint => address) Index;
	
	uint Count = 0;
    address top;
    uint constant contribution = 1 ether;
 
    constructor() {
        addParticipant(msg.sender,msg.sender);
        top = msg.sender;
    }
    
    receive() external payable {
		uint rand = (block.timestamp + block.number) % Count;
        enter(Index[rand]);
    }
    
        function getParticipantById (uint id) public view returns ( address inviter, address itself, uint totalPayout ){
		if (id >= Count) return (address(0), address(0), 0);
		address ida = Index[id];
        inviter = Tree[ida].inviter;
        itself = Tree[ida].itself;
        totalPayout = Tree[ida].totalPayout;
    }
	function getParticipantByAddress (address adr) public view returns ( address inviter, address itself, uint totalPayout ){
		if (Tree[adr].itself == address(0)) return (address(0), address(0), 0);
        inviter = Tree[adr].inviter;
        itself = Tree[adr].itself;
        totalPayout = Tree[adr].totalPayout;
    }
    
    function addParticipant(address itself, address inviter) private{
        Index[Count] = itself;
		Tree[itself] = Participant( {itself: itself, inviter: inviter, totalPayout: 0});
        Count +=1;
    }
    
     function getParticipantCount () public view returns ( uint count ){
       count = Count;
    }
    
    function enter(address inviter) payable public {
        uint amount = msg.value;
        if ((amount < contribution) || (Tree[msg.sender].inviter != address(0)) || (Tree[inviter].inviter == address(0))) {
             // <yes> <report> Gasless_Send
            payable(msg.sender).send(msg.value);
            return;
        }
        
        addParticipant(msg.sender, inviter);
        address next = inviter;
        uint rest = amount;
        uint level = 1;
        while ( (next != top) && (level < 7) ){
            uint toSend = rest/2;
            payable(next).send(toSend);
            Tree[next].totalPayout += toSend;
            rest -= toSend;
            next = Tree[next].inviter;
            level++;
        }
        payable(next).send(rest);
		Tree[next].totalPayout += rest;
    }
}


contract Attack_Etheramid0 {

    Etheramid public target_contract;

    constructor(address payable _targetContract) public payable {
        target_contract = Etheramid(_targetContract);
    } 

    function vultron_enter(uint256 vultron_amount, address inviter) public payable{
    target_contract.enter{value:vultron_amount}(inviter);
    } 

    receive() external payable {
        revert();
    }
} 