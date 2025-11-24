variables
{
    uint x;
    mapping (uint => bool) isSet;
}

rule xSpec(uint n) {

    mathint xBefore = x;
    require xBefore;

    setNextIndex(n);

    mathint xAfter = x;

    // Operations on mathints can never overflow or underflow. 
    assert isSet[xAfter];
}