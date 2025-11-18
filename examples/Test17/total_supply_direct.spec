/**
 * Failed attempt to prove that the sum of two distinct balances is not greater than
 * total supply, using a direct approach.
 */
variables {
    mapping (address => uint256) balanceOf;   // balanceOf(address)
    uint256 totalSupply; // totalSupply()
}


invariant directSumOfTwo {
    assert forall address a. address b. (a != b) => (balanceOf[a] + balanceOf[b] <= to_mathint(totalSupply));
}
    

