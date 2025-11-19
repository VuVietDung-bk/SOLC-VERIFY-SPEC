variables {
    mapping(address=>Entry) entries;
}

rule addSpec(int x) {
    add(x);
    assert_emit new_entry(msg.sender, value);
}

rule updateSpec(int x) {
    update(x);
    assert_emit updated_entry(msg.sender, value);
}

rule addOrUpdateSpec(int x) {
    add_or_update(x);
    assert_emit new_entry(msg.sender, value);
    assert_emit updated_entry(msg.sender, value);
}

rule emitNewEntry(){
    address a;
    int x;
    require(!entries[a].set);
    emits new_entry(msg.sender, x);
    assert entries[a].set && entries[a].data == x;
}

rule emitUpdateEntry(){
    address a;
    int x;
    require(entries[a].set && entries[a].data < x);
    emits update_entry(msg.sender, x);
    assert entries[a].set && entries[a].data == x;
}