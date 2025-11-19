variables
{
    mapping (address => uint) _balances;           
    uint _totalSupply;  
}

/// @title Total supply after mint is at least the balance of the receiving account
rule totalSupplyAfterMint(address account, uint256 amount) {
    mint(account, amount);
    
    uint256 userBalanceAfter = _balances[account];
    uint256 totalAfter = _totalSupply;
    
    // Verify that the total supply of the system is at least the current balance of the account.
    assert totalAfter >=  userBalanceAfter, "total supply is less than a user's balance";
}


/** @title Total supply after mint is at least the balance of the receiving account, with
 *  precondition.
 */
rule totalSupplyAfterMintWithPrecondition(address account, uint256 amount) {
    // Assume that in the current state before calling mint, the total supply of the 
    // system is at least the user balance.
    uint256 userBalanceBefore =  _balances[account];
    uint256 totalBefore = _totalSupply;
    require totalBefore >= userBalanceBefore; 
    
    mint(account, amount);
    
    uint256 userBalanceAfter = _balances[account];
    uint256 totalAfter = _totalSupply;
    
    // Verify that the total supply of the system is at least the current balance of the account.
    assert totalAfter >= userBalanceAfter, "total supply is less than a user's balance ";
}
