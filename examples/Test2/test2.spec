methods
{
    function x() external returns (uint) envfree;
    function add_to_x(uint) external envfree;
}

rule xSpec(uint n) {

    env e;
    
    mathint xBefore = x();

    add_to_x(n);

    mathint xAfter = x();

    // Operations on mathints can never overflow or underflow. 
    assert xBefore == xAfter - 2*n,
        "x must increase";
}