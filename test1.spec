variables
{
    uint x;
}

rule xSpec(uint n) {

    env e;
    
    uint xBefore = x + 1;

    add_to_x(n);

    if (funcCompare(f, "transfer")) {
        transfer(to, amount);
    } else if (f == "allowance(address, address)") {
        allowance(from, to);
    } else {
        calldataarg args;
        f(args);
    }

    uint xAfter = x;

    assert contract.isum > address(0),
        "x must increase";
    assert forall uint256 i. i < arr[i] => !(arr[i] == 71);

    assert_modify x.y if x.y > 0;

    assert_revert, "Nah";

    assert_emit XChanged(xBefore, xAfter);
    emits XChanged(xBefore, xAfter);
}