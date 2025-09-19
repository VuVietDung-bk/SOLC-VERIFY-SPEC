methods
{
    function x() external returns (uint) envfree;
    function setNextIndex(uint) external envfree;
    function isSet(uint) external returns (bool) envfree;
}

rule xSpec(uint n) {

    env e;

    setNextIndex(n);

    mathint xAfter = x() + 2;
    bool nah = isSet(n);

    // Operations on mathints can never overflow or underflow. 
    assert isSet(xAfter);
}