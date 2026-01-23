/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 29
 */

 pragma solidity >=0.7.0;

contract MultiplicatorX4
{
    address public Owner = msg.sender;
   
    function withdraw()
    payable
    public
    {
        require(msg.sender == Owner);
        payable(Owner).transfer(address(this).balance);
    }
    
    function Command(address adr,bytes memory data)
    payable
    public
    {
        require(msg.sender == Owner);
        // <yes> <report> UNCHECKED_LL_CALLS
        adr.call{value: msg.value}(data);
    }
    
    function multiplicate(address adr)
    public
    payable
    {
        if(msg.value>=address(this).balance)
        {        
            payable(adr).transfer(address(this).balance+msg.value);
        }
    }
}