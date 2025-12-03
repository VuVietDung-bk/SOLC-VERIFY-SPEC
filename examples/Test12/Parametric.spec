variables
{
    mapping (address => mapping (address => uint)) _allowances;  
}

/// @title If `approve` changes a holder's _allowances, then it was called by the holder
rule onlyHolderCanChangeAllowance(address holder, address spender, method f) {
    uint allowance_before = _allowances[holder][spender];

    f();

    uint allowance_after = _allowances[holder][spender];

    assert allowance_after > allowance_before => msg.sender == holder,
        "only the sender can change its own _allowances";

}