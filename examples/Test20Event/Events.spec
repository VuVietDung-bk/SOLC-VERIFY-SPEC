variables {
    mapping(address=>Entry) entries;
}

rule generalSpec(int x){
    address a;
    int y;
    method f;
    if(funcCompare(f, "add")){
        add(x);
        assert_emit new_entry(msg.sender, value);
    } else if (funcCompare(f, "update")) {
        update(x);
        assert_emit updated_entry(msg.sender, value);
    } else if (funcCompare(f, "add_or_update")) {
        add_or_update(x);
        assert_emit new_entry(msg.sender, value);
        assert_emit updated_entry(msg.sender, value);
    } else if (y == 0) {
        require(!entries[a].set);
        emits new_entry(a, x);
        assert entries[a].set && entries[a].data == x;
    } else {
        require(entries[a].set && entries[a].data < x);
        emits updated_entry(a, x);
        assert entries[a].set && entries[a].data == x;
    }
}