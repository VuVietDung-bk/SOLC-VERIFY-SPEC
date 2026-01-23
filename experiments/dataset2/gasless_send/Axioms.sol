/*
 * @source: Source Code first verified at https://etherscan.io on Friday
 * @author: -
 * @vulnerable_at_lines: 93
 */

pragma solidity >=0.7.0;

interface Token {
    function transfer(address receiver, uint amount) external returns (bool);
    function balanceOf(address receiver) external view returns (uint);
}

///@title Axioms-Airdrops
///@author  Lucasxhy & Kafcioo

contract Axioms {
    Airdrop [] public airdrops;
    address payable public owner;

    ///@notice  Set the creator of the smart contract to be its sole owner
    constructor () {
        owner = payable(msg.sender);
    }


    ///@notice  Modifier to require a minimum amount fo ether for the function to add and airdrop
    modifier minEth {
        require(msg.value >= 200000000000000000); // 0.2ETH Change this to amount of eth needed for gas fee in GWEI!
        _;
    }
    ///@notice  Modifier that only allows the owner to execute a function
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    ///@notice  Creates a structure for airdrops, which stores all the necessary information for users to look up the history effectively and directly from the smart contract.
    struct Airdrop {
        string name;
        uint id;
        uint tokenAmount;
        uint countDown;
        uint timeStamp;
        uint gasFeePaid;
        uint decimals;
        address distributor;
        Token tokenSC;
    }
    ///@notice  Adds a new airdrop to the smart contract and starts the count down until it is distributed
   function addNewAirdrop(
    string memory _name,
    uint _tokenAmount,
    uint _countDown,
    address  _smartContract,
    uint _decimals
   )
   public
   minEth
   payable
   {
       Token t = Token(_smartContract);
       if(t.balanceOf(address(this))>=_tokenAmount){
        airdrops.push(Airdrop({
            name: _name,
            id: airdrops.length,
            tokenAmount: _tokenAmount,
            countDown: _countDown,
            timeStamp: block.timestamp,
            gasFeePaid: msg.value,
            decimals: _decimals,
            distributor: msg.sender,
            tokenSC: Token(_smartContract)
        }));
       }else revert('Air Drop not added, Please make sure you send your ERC20 tokens to the smart contract before adding new airdrop');
   }

    ///@notice  Distirbutes a differen quantity of tokens to all the specified addresses.
    ///@dev Distribution will only occur when a distribute function is called, and passed the correct parameters, it is not the smart contracts job to produce the addresses or determine the ammounts
    ///@param index  The airdrop to distribute based in the the array in which is saved
    ///@param _addrs The set of addresses in array form, to which the airdrop will be distributed
    ///@param _vals  The set of values to be distributed to each address in array form
    function distributeAirdrop(
        uint index,
        address[] memory _addrs,
        uint[] memory _vals
    )
        public
        onlyOwner
    {
        Airdrop memory airdrop = airdrops[index];
        if(airdrop.countDown <=block.timestamp) {
            // <yes> <report> Gasless_Send
            for(uint i = 0; i < _addrs.length; ++i) {
                airdrop.tokenSC.transfer(_addrs[i], _vals[i]);
            }
        } else revert("Distribution Failed: Count Down not gone yet");
    }


  // Refound tokens back to the to airdrop creator
    function refoundTokens(
        uint index

    )
        public
        onlyOwner
    {

        Airdrop memory airdrop = airdrops[index];
        airdrop.tokenSC.transfer(airdrop.distributor,airdrop.tokenAmount);
    }

    function transferGasFee(uint index) public onlyOwner {
            Airdrop memory airdrop = airdrops[index];
            owner.transfer(airdrop.gasFeePaid);
       }
}