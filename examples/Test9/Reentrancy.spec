variables
{
    mapping (address => uint) balances; 
}

invariant sorted {
    assert balances.sum <= contract.balance;
}