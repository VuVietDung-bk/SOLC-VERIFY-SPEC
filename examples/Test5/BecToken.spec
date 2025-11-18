variables
{
    uint256 totalSupply;
    uint256 balances;
}

invariant totalEqualSumBalances {
    assert totalSupply == balances.sum;
}
