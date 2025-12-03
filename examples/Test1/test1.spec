variables
{
    uint x;
}

rule xSpec(uint n) {
    
    uint xBefore = x;

    add_to_x(n);

    uint xAfter = x;

    assert xBefore <= xAfter,
        "x must increase";
}