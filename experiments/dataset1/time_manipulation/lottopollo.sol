/*
 * @source: https://github.com/seresistvanandras/EthBench/blob/master/Benchmark/Simple/timestampdependent.sol
 * @author: -
 * @vulnerable_at_lines: 13,27
 */

pragma solidity >=0.7.0;
contract lottopollo {
  address leader;
  uint    timestamp;
  function payOut(uint rand) internal {
    // <yes> <report> TIME MANIPULATION
    if ( rand> 0 && block.timestamp - rand > 24 hours ) {
      payable(msg.sender).transfer(msg.value );

      if (address(this).balance > 0 ) {
        payable(leader).transfer(address(this).balance );
      }
    }
    else if ( msg.value >= 1 ether ) {
      leader = msg.sender;
      timestamp = rand;
    }
  }
  function randomGen() public returns (uint randomNumber) {
      // <yes> <report> TIME MANIPULATION
      return block.timestamp;   
    }
  function draw(uint seed) public {
    uint randomNumber=randomGen(); 
    payOut(randomNumber);
  }
}