variables
{
    uint x;
}

rule xSpec(uint n) {

    uint xBefore = x;

    add_to_x(n);

    uint xAfter = x;

    // Operations on mathints can never overflow or underflow. 
    assert xBefore == xAfter - 2*n,
        "x must increase";
    assert xBefore <= xAfter,
        "x must increase";
}