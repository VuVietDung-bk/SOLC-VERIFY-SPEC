/*
 * @source: https://github.com/etherpot/contract/blob/master/app/contracts/lotto.sol
 * @author: -
 * @vulnerable_at_lines: 109,141
 */

//added pragma version
pragma solidity >=0.7.0;

contract Lotto {

    uint constant public blocksPerRound = 6800;
    // there are an infinite number of rounds (just like a real lottery that takes place every week). `blocksPerRound` decides how many blocks each round will last. 6800 is around a day.

    uint constant public ticketPrice = 100000000000000000;
    // the cost of each ticket is .1 ether.

    uint constant public blockReward = 5000000000000000000;

    function getBlocksPerRound() public pure returns(uint){ return blocksPerRound; }
    function getTicketPrice() public pure returns(uint){ return ticketPrice; }
    //accessors for constants

    struct Round {
        address payable[] buyers;
        uint pot;
        uint ticketsCount;
        mapping(uint=>bool) isCashed;
        mapping(address=>uint) ticketsCountByBuyer;
    }
    mapping(uint => Round) rounds;
    //the contract maintains a mapping of rounds. Each round maintains a list of tickets, the total amount of the pot, and whether or not the round was "cashed". "Cashing" is the act of paying out the pot to the winner.

    function getRoundIndex() public view returns (uint){
        //The round index tells us which round we're on. For example if we're on block 24, we're on round 2. Division in Solidity automatically rounds down, so we don't need to worry about decimals.

        return block.number/blocksPerRound;
    }

    function getIsCashed(uint roundIndex,uint subpotIndex) public view returns (bool){
        //Determine if a given.

        return rounds[roundIndex].isCashed[subpotIndex];
    }


    function calculateWinner(uint roundIndex, uint subpotIndex) public view returns(address payable){
        //note this function only calculates the winners. It does not do any state changes and therefore does not include various validitiy checks

        uint decisionBlockNumber = getDecisionBlockNumber(roundIndex,subpotIndex);

        if(decisionBlockNumber>block.number)
            return payable(address(0));
        //We can't decided the winner if the round isn't over yet

        uint decisionBlockHash = getHashOfBlock(decisionBlockNumber);
        uint winningTicketIndex = decisionBlockHash%rounds[roundIndex].ticketsCount;
        //We perform a modulus of the blockhash to determine the winner

        uint256 ticketIndex = 0;

        for(uint buyerIndex = 0; buyerIndex<rounds[roundIndex].buyers.length; buyerIndex++){
            address payable buyer = rounds[roundIndex].buyers[buyerIndex];
            ticketIndex+=rounds[roundIndex].ticketsCountByBuyer[buyer];

            if(ticketIndex>winningTicketIndex){
                return buyer;
            }
        }
        return payable(address(0));
    }

    function getDecisionBlockNumber(uint roundIndex,uint subpotIndex) public pure returns (uint){
        return ((roundIndex+1)*blocksPerRound)+subpotIndex;
    }

    function getSubpotsCount(uint roundIndex) public view returns(uint){
        uint subpotsCount = rounds[roundIndex].pot/blockReward;

        if(rounds[roundIndex].pot%blockReward>0)
            subpotsCount++;

        return subpotsCount;
    }

    function getSubpot(uint roundIndex) public view returns(uint){
        uint count = getSubpotsCount(roundIndex);
        if (count == 0) {
            return 0;
        }
        return rounds[roundIndex].pot/count;
    }

    function cash(uint roundIndex, uint subpotIndex) public{

        uint subpotsCount = getSubpotsCount(roundIndex);

        if(subpotIndex>=subpotsCount)
            return;

        uint decisionBlockNumber = getDecisionBlockNumber(roundIndex,subpotIndex);

        if(decisionBlockNumber>block.number)
            return;

        if(rounds[roundIndex].isCashed[subpotIndex])
            return;
        //Subpots can only be cashed once. This is to prevent double payouts

        address payable winner = calculateWinner(roundIndex,subpotIndex);
        uint subpot = getSubpot(roundIndex);

        // <yes> <report> UNCHECKED_LL_CALLS
        winner.send(subpot);

        rounds[roundIndex].isCashed[subpotIndex] = true;
        //Mark the round as cashed
    }

    function getHashOfBlock(uint blockIndex) public view returns(uint){
        return uint(blockhash(blockIndex));
    }

    function getBuyers(uint roundIndex,address buyer) public view returns (address payable[] memory){
        return rounds[roundIndex].buyers;
    }

    function getTicketsCountByBuyer(uint roundIndex,address buyer) public view returns (uint){
        return rounds[roundIndex].ticketsCountByBuyer[buyer];
    }

    function getPot(uint roundIndex) public view returns(uint){
        return rounds[roundIndex].pot;
    }

    receive() external payable {
        //this is the function that gets called when people send money to the contract.

        uint roundIndex = getRoundIndex();
        uint value = msg.value-(msg.value%ticketPrice);

        if(value==0) return;

        if(value<msg.value){
            // <yes> <report> UNCHECKED_LL_CALLS
            payable(msg.sender).send(msg.value-value);
        }
        //no partial tickets, send a partial refund

        uint ticketsCount = value/ticketPrice;
        rounds[roundIndex].ticketsCount+=ticketsCount;

        if(rounds[roundIndex].ticketsCountByBuyer[msg.sender]==0){
            rounds[roundIndex].buyers.push(payable(msg.sender));
        }

        rounds[roundIndex].ticketsCountByBuyer[msg.sender]+=ticketsCount;
        rounds[roundIndex].ticketsCount+=ticketsCount;
        //keep track of the total tickets

        rounds[roundIndex].pot+=value;
        //keep track of the total pot

    }

}
