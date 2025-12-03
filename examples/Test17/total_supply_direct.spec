variables {
    mapping (address => uint256) balanceOf;   
    uint256 totalSupply; 
}


invariant directSumOfTwo {
    assert forall address a. forall address b. (a != b) => (balanceOf[a] + balanceOf[b] <= totalSupply);
}