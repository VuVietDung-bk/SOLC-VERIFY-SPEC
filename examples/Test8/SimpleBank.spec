variables
{
    uint balances; 
}

invariant sorted {
    assert balances.sum <= contract.balance;
}