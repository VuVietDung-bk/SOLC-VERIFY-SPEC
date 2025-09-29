methods
{
    function balances(address) external returns (int) envfree; // a là array, phải có cách phân biệt giữa array và mapping
}

invariant sorted {
    assert balances.sum <= contract.balance;
}