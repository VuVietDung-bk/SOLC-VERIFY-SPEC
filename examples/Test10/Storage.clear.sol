// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

// A simple storage example, where each user can set, update
// or clear their data (represented as an integer) in the
// storage. The owner can clear any data.
contract Storage {
    struct Record {
        int data;
        bool set;
    }

    mapping(address=>Record) records;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    // Only owner can change the owner
    function changeOwner(address newOwner) public {
        require(msg.sender == owner);
        owner = newOwner;
    }

    function isSet(Record storage record) internal view returns(bool) {
        return record.set;
    }

    function set(int data) public {
        require(!isSet(records[msg.sender]));
        Record memory rec = Record(data, true);
        records[msg.sender] = rec;
    }

    function update(int data) public {
        Record storage rec = records[msg.sender];
        require(isSet(rec));
        rec.data = data;
    }

    // Anyone can modify their record, but owner can modify any record
    /// @notice postcondition !records[at].set
    /// @notice postcondition records[at].data == 0
    /// @notice modifies records[msg.sender]
    /// @notice modifies records if msg.sender == owner
    function clear(address at) public {
        require(msg.sender == owner || msg.sender == at);
        Record storage rec = records[at];
        rec.set = false;
        rec.data = 0;
    }
}
