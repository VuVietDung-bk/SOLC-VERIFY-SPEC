/*
 * @source: http://blockchain.unica.it/projects/ethereum-survey/attacks.html#oddsandevens
 * @author: -
 * @vulnerable_at_lines: 25,28
 */

pragma solidity >=0.7.0;

contract OddsAndEvens{

  struct Player {
    address addr;
    uint number;
  }

  Player[2] public players;         //public only for debug purpose

  uint8 tot;
  address owner;

  constructor() {
    owner = msg.sender;
  }
// <yes> <report> FRONT_RUNNING
  function play(uint number) public payable {
    if (msg.value != 1 ether) revert();
    // <yes> <report> FRONT_RUNNING
    players[tot] = Player(msg.sender, number);
    tot++;

    if (tot==2) andTheWinnerIs();
  }

  function andTheWinnerIs() private {
    bool res ;
    uint n = players[0].number+players[1].number;
    if (n%2==0) {
      address playerAddr = players[0].addr;
      res = payable(playerAddr).send(1800);
    }
    else {
      address playerAddr = players[1].addr;
      res = payable(playerAddr).send(1800);
    }

    delete players;
    tot=0;
  }

  function getProfit() public {
    if(msg.sender!=owner) revert();
    bool res = payable(msg.sender).send(address(this).balance);
  }

}
