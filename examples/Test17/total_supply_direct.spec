/**
 * Failed attempt to prove that the sum of two distinct balances is not greater than
 * total supply, using a direct approach.
 */
methods {
    function balanceOf(address) external returns (uint256) envfree;
    function totalSupply() external returns (uint256) envfree;

}


invariant directSumOfTwo {
    assert forall address a. address b. (a != b) => (balanceOf(a) + balanceOf(b) <= to_mathint(totalSupply()));
}
    

