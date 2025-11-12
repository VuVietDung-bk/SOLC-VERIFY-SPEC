variables
{
    uint x;
}

rule xSpec(uint n) {

    env e;
    
    mathint xBefore = x;

    add_to_x(n);

    mathint xAfter = x;

    assert xBefore <= xAfter,
        "x must increase";
}