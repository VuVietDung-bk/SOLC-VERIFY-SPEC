// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

// Example on specifying events. Users of the contract can add register a number
// corresponding to their address and then update it but only with a greater number.
// Events keep track of such changes in the data and the verifier checks whether
// they are properly emitted.
contract Registry{
    struct Entry {
        bool set;
        int data;
    }

    mapping(address=>Entry) entries;

    event new_entry(address at, int value);

    event updated_entry(address at, int value);

    function add(int value) public {
        require(!entries[msg.sender].set);
        entries[msg.sender].set = true;
        entries[msg.sender].data = value;
        emit new_entry(msg.sender, value);
    }

    function update(int value) public {
        require(entries[msg.sender].set);
        require(entries[msg.sender].data < value);
        entries[msg.sender].data = value;
        emit updated_entry(msg.sender, value);
    }

    function add_or_update(int value) public {
        require(!entries[msg.sender].set || entries[msg.sender].data < value);
        entries[msg.sender].data = value;
        if (entries[msg.sender].set) {
            emit updated_entry(msg.sender, value);
        } else {
            entries[msg.sender].set = true;
            emit new_entry(msg.sender, value);
        }
    }
}
