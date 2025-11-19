variables
{
    mapping(address=>Record) records;
    address owner;
}

rule onlyChangeOwnerIfIsOwner(address a) {

    assert_modify owner if msg.sender == owner;

    changeOwner(a);
}

rule setRule(int data) {

    assert_modify records[msg.sender] if !records[msg.sender].set;

    set(data);

    assert records[msg.sender].set;
    assert records[msg.sender].data == data;
}

rule update(int data) {

    assert_modify records[msg.sender].data if records[msg.sender].set;

    update(data);

    assert records[msg.sender].data == data;
}

rule clear(address a) {

    assert_modify records[msg.sender];
    assert_modify records if msg.sender == owner;

    clear(a);

    assert !records[a].set;
    assert records[a].data == 0;
}