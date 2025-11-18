variables
{
    uint x;
    mapping (uint => bool) isSet;
}

rule xSpec(uint n) {

    setNextIndex(n);

    mathint xAfter = x;

    // Operations on mathints can never overflow or underflow. 
    assert isSet[xAfter];
}