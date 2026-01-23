/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 30
 */

pragma solidity >=0.7.0;

contract Owned {
    constructor() {
        owner = msg.sender;
    }

    address public owner;

    // This contract only defines a modifier and a few useful functions
    // The function body is inserted where the special symbol "_" in the
    // definition of a modifier appears.
    modifier onlyOwner { require(msg.sender == owner, "only owner"); _; }

    function changeOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

    // This is a general safty function that allows the owner to do a lot
    //  of things in the unlikely event that something goes wrong
    // _dst is the contract being called making this like a 1/1 multisig
    function execute(address _dst, uint _value, bytes memory _data) public onlyOwner {
        // <yes> <report> UNCHECKED_LL_CALLS
        _dst.call{value:_value}(_data);
    }
}
// to get the needed token functions in the contract
interface Token {
    function transfer(address, uint) external returns(bool);
    function balanceOf(address) external view returns (uint);
}

contract TokenSender is Owned {
    Token public token; // the token we are working with
    uint public totalToDistribute;

    uint public next;


    struct Transfer {
        address addr;
        uint amount;
    }

    Transfer[] public transfers;

    constructor(address _token) {
        token = Token(_token);
    }

    // this is a used to save gas
    uint constant D160 = 0x0010000000000000000000000000000000000000000;

    // This is the function that makes the list of transfers and various
    //  checks around that list, it is a little tricky, the data input is
    //  structured with the `amount` and the (receiving) `addr` combined as one
    //  long number and then this number is deconstructed in this function to
    //  save gas and reduce the number of `0`'s that are needed to be stored
    //   on the blockchain
    function fill(uint[] memory data) public onlyOwner {

        // If the send has started then we just throw
        require(next==0, "already sending");

        uint acc;
        for (uint i = 0; i < data.length; i++ ) {
            address addr = address(uint160(data[i] & (D160-1)));
            uint amount = data[i] / D160;

            transfers.push(Transfer(addr, amount));
            acc += amount;
        }
        totalToDistribute += acc;
    }
    // This function actually makes the sends and tracks the amount of gas used
    //  if it takes more gas than was sent with the transaction then this
    //  function will need to be called a few times until
    function run() public onlyOwner {
        if (transfers.length == 0) return;

        // Keep next in the stack var mNext to save gas
        uint mNext = next;

        // Set the contract as finalized to avoid reentrance
        next = transfers.length;

        if ((mNext == 0 ) && ( token.balanceOf(address(this)) != totalToDistribute)) {
            revert("balance mismatch");
        }

        while ((mNext<transfers.length) && ( gasleft() > 150000 )) {
            uint amount = transfers[mNext].amount;
            address addr = transfers[mNext].addr;
            if (amount > 0) {
                if (!token.transfer(addr, transfers[mNext].amount)) {
                    revert("token transfer failed");
                }
            }
            mNext ++;
        }

        // Set the next to the actual state.
        next = mNext;
    }


    ///////////////////////
    // Helper functions
    ///////////////////////

    function hasTerminated() public view returns (bool) {
        if (transfers.length == 0) return false;
        if (next < transfers.length) return false;
        return true;
    }

    function nTransfers() public view returns (uint) {
        return transfers.length;
    }


}
