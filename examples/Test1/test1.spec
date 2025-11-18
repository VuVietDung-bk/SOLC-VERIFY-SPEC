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
}