/*
 * @source: etherscan.io 
 * @author: -
 * @vulnerable_at_lines: 55
 */

pragma solidity >=0.7.0;

/// @author Jordi Baylina
/// Auditors: Griff Green & psdev
/// @notice Based on http://hudsonjameson.com/ethereummarriage/
/// License: GNU-3

/// @dev `Owned` is a base level contract that assigns an `owner` that can be
///  later changed
contract Owned {

    /// @dev `owner` is the only address that can call a function with this
    /// modifier
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    address public owner;

    /// @notice The Constructor assigns the message sender to be `owner`
    constructor() {
        owner = msg.sender;
    }

    address public newOwner;

    /// @notice `owner` can step down and assign some other address to this role
    /// @param _newOwner The address of the new owner
    ///  an unowned neutral vault, however that cannot be undone
    function changeOwner(address _newOwner) public onlyOwner {
        newOwner = _newOwner;
    }
    /// @notice `newOwner` has to accept the ownership before it is transferred
    ///  Any account or any contract with the ability to call `acceptOwnership`
    ///  can be used to accept ownership of this contract, including a contract
    ///  with no other functions
    function acceptOwnership() public {
        if (msg.sender == newOwner) {
            owner = newOwner;
        }
    }

    // This is a general safty function that allows the owner to do a lot
    //  of things in the unlikely event that something goes wrong
    // _dst is the contract being called making this like a 1/1 multisig
    function execute(address _dst, uint _value, bytes memory _data) public onlyOwner {
         // <yes> <report> UNCHECKED_LL_CALLS
        (bool success, ) = _dst.call{value: _value}(_data);
        require(success);
    }
}


contract Marriage is Owned
{
    // Marriage status enum
    enum MarriageStatusEnum { Single, Married, Divorced }
    
    // Marriage data variables
    string public partner1;
    string public partner2;
    uint public marriageDate;
    MarriageStatusEnum public marriageStatus;
    string public vows;

    Event[] public majorEvents;
    Message[] public messages;

    struct Event {
        uint date;
        string name;
        string description;
        string url;
    }

    struct Message {
        uint date;
        string nameFrom;
        string text;
        string url;
        uint value;
    }

    modifier areMarried {
        require(marriageStatus == MarriageStatusEnum.Married);
        _;
    }

    //Set Owner
    constructor(address _owner) {
        owner = _owner;
    }

    function numberOfMajorEvents() public view returns (uint) {
        return majorEvents.length;
    }

    function numberOfMessages() public view returns (uint) {
        return messages.length;
    }

    // Create initial marriage contract
    function createMarriage(
        string memory _partner1,
        string memory _partner2,
        string memory _vows,
        string memory url) public onlyOwner
    {
        require(majorEvents.length == 0);
        partner1 = _partner1;
        partner2 = _partner2;
        marriageDate = block.timestamp;
        vows = _vows;
        marriageStatus = MarriageStatusEnum.Married;
        majorEvents.push(Event(block.timestamp, "Marriage", vows, url));
        emit MajorEvent("Marrigage", vows, url);
    }

    // Set the marriage status if it changes
    function setStatus(MarriageStatusEnum status, string memory url) public onlyOwner
    {
        marriageStatus = status;
        setMajorEvent("Changed Status", "", url);
    }

    // Set the IPFS hash of the image of the couple
    function setMajorEvent(string memory name, string memory description, string memory url) public onlyOwner areMarried
    {
        majorEvents.push(Event(block.timestamp, name, description, url));
        emit MajorEvent(name, description, url);
    }

    function sendMessage(string memory nameFrom, string memory text, string memory url) public payable areMarried {
        if (msg.value > 0) {
            (bool success, ) = owner.call{value: address(this).balance}("");
            require(success);
        }
        messages.push(Message(block.timestamp, nameFrom, text, url, msg.value));
        emit MessageSent(nameFrom, text, url, msg.value);
    }

    // Declare event structure
    event MajorEvent(string name, string description, string url);
    event MessageSent(string name, string description, string url, uint value);
}