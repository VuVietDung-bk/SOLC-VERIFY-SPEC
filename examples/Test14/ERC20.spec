variables
{
    mapping (address => uint) _balances;      
    mapping (address => mapping (address => uint)) _allowances;      
    uint _totalSupply;  
    address _owner;
}

rule integrityOfTransferFrom(address sender, address recipient, uint256 amount) {
    require sender != recipient;

    uint256 allowanceBefore = _allowances[sender][msg.sender];
    transferFrom(sender, recipient, amount);
    uint256 allowanceAfter = _allowances[sender][msg.sender];
    
    assert allowanceBefore > allowanceAfter;
}

rule doesNotAffectAThirdPartyBalance(method f) {
    address from;
    address to;
    address thirdParty;

    require (thirdParty != from) && (thirdParty != to);

    uint256 thirdBalanceBefore = _balances[thirdParty];
    uint256 amount;

    if (funcCompare(f, "transfer")) {
        transfer(to, amount);
    } else if (funcCompare(f, "allowance")) {
        allowance(from, to);
    } else if (funcCompare(f, "approve")) {
        approve(to, amount);
    } else if (funcCompare(f, "transferFrom")) {
        transferFrom(from, to, amount);
    } else if (funcCompare(f, "increaseAllowance")) {
        increaseAllowance(to, amount);
    } else if (funcCompare(f, "decreaseAllowance")) {
        decreaseAllowance(to, amount);
    } else if (funcCompare(f, "mint")) {
        mint(to, amount);
    } else if (funcCompare(f, "burn")) {
        burn(from, amount);
    } else {
        f();
    }

    assert _balances[thirdParty] == thirdBalanceBefore;
}

rule balanceChangesFromCertainFunctions(method f, address user){
    uint256 userBalanceBefore = _balances[user];
    f();
    uint256 userBalanceAfter = _balances[user];

    assert userBalanceBefore != userBalanceAfter =>
        (
            funcCompare(f, "transfer") ||
            funcCompare(f, "mint") ||
            funcCompare(f, "burn")
        );
}

rule onlyOwnersMayChangeTotalSupply(method f) {
    uint256 totalSupplyBefore = _totalSupply;
    f();
    uint256 totalSupplyAfter = _totalSupply;
    assert msg.sender == _owner => totalSupplyAfter != totalSupplyBefore;
}