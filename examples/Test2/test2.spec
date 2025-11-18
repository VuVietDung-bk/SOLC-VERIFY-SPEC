variables
{
    uint x;
}

rule xSpec(uint n) {

    mathint xBefore = x;

    add_to_x(n);

    mathint xAfter = x;

    // Operations on mathints can never overflow or underflow. 
    assert xBefore == xAfter - 2*n,
        "x must increase";
    assert xBefore <= xAfter,
        "x must increase";
}
