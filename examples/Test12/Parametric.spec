variables
{
    mapping (address => mapping (address => uint)) _allowances;  
}

/// @title If `approve` changes a holder's _allowances, then it was called by the holder
rule onlyHolderCanChangeAllowance(address holder, address spender, method f) {
    mathint allowance_before = _allowances[holder][spender];

    calldataarg args;
    f(args);

    mathint allowance_after = _allowances[holder][spender];

    assert allowance_after > allowance_before => msg.sender == holder,
        "only the sender can change its own _allowances";

}
