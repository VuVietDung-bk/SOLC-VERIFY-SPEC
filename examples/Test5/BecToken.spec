variables
{
    uint256 totalSupply;
    mapping (address => uint256) balances;
}

invariant totalEqualSumBalances {
    assert totalSupply == balances.sum;
}