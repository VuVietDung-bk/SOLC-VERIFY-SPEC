variables
{
    uint x;
}

rule xSpec(uint n) {

    env e;
    
    mathint xBefore = x + 1;

    add_to_x(n);

    if (f == "transfer(address, uint256)") {
        transfer(to, amount);
    } else if (f == "allowance(address, address)") {
        allowance(from, to);
    } else {
        calldataarg args;
        f(args);
    }

    mathint xAfter = x;

    assert 2 * xBefore + 2 <= xAfter || false,
        "x must increase";
    assert forall uint256 i. i < arr.length => arr[i] == 71;
}