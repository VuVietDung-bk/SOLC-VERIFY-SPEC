methods
{
    function totalSupply() external returns (uint256) envfree;
    function balances(address) external returns (uint256) envfree;
}

invariant totalEqualSumBalances {
    assert totalSupply() == balances.sum;
}