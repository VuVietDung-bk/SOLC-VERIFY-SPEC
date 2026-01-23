/*
 * @article: https://blog.positive.com/predicting-random-numbers-in-ethereum-smart-contracts-e5358c6b8620
 * @source: https://etherscan.io/address/0x80ddae5251047d6ceb29765f38fed1c0013004b7#code
 * @vulnerable_at_lines: 38,42
 * @author: -
 */

 //added pragma version
pragma solidity >=0.7.0;
  
 contract Lottery {
     event GetBet(uint betAmount, uint blockNumber, bool won);

     struct Bet {
         uint betAmount;
         uint blockNumber;
         bool won;
     }

     address private organizer;
     Bet[] private bets;

     // Create a new lottery with numOfBets supported bets.
     constructor() {
         organizer = msg.sender;
     }

     receive() external payable {
        
     }

     // Fallback function returns ether
     fallback() external payable {
         revert();
     }

     // Make a bet
     function makeBet() public payable {
         // Won if block number is even
         // (note: this is a terrible source of randomness, please don't use this with real money)
         // <yes> <report> BAD_RANDOMNESS
         bool won = (block.number % 2) == 0;

         // Record the bet with an event
         // <yes> <report> BAD_RANDOMNESS
         bets.push(Bet(msg.value, block.number, won));

         // Payout if the user won, otherwise take their money
         if(won) {
             bool success = payable(msg.sender).send(msg.value);
             require(success, "send failed");
         }
     }

     // Get all bets that have been made
     function getBets() public {
         require(msg.sender == organizer, "not organizer");

         for (uint i = 0; i < bets.length; i++) {
             emit GetBet(bets[i].betAmount, bets[i].blockNumber, bets[i].won);
         }
     }
 }
