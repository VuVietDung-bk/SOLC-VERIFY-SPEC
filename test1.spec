variables
{
    uint x;
}

rule xSpec(uint n) {
    
    mathint xBefore = x;

    add_to_x(n);

    mathint xAfter = x;

    assert xBefore <= xAfter,
        "x must increase";
    assert forall uint256 i. i < arr.a => !(arr[i] == 71);

    assert_modify x.y if x.y > 0;

    assert_revert if x < 0;
}