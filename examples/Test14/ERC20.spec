variables
{
    mapping (address => uint) _balances;      
    mapping (address => mapping (address => uint)) _allowances;      
    uint _totalSupply;  
    address _owner;
}

// @title Checks that `transferFrom()`  decreases allowance of `msg.sender`
rule integrityOfTransferFrom(address sender, address recipient, uint256 amount) {
    require sender != recipient;

    uint256 allowanceBefore = _allowances[sender][msg.sender];
    transferFrom(sender, recipient, amount);
    uint256 allowanceAfter = _allowances[sender][msg.sender];
    
    assert (
        allowanceBefore > allowanceAfter
        ),
        "allowance must decrease after using the allowance to pay on behalf of somebody else";
}

/*
    Given addresses [msg.sender], [from], [to] and [thirdParty], we check that 
    there is no method [f] that would:
    1] not take [thirdParty] as an input argument, and
    2] yet changed the balance of [thirdParty].
    Intuitively, we target the case where a transfer of tokens [from] -> [to]
    changes the balance of [thirdParty]. 
*/
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
        calldataarg args;
        f(args);
    }

    assert _balances[thirdParty] == thirdBalanceBefore;
}

/** @title Users' balance can only be changed as a result of `transfer()`,
 * `transferFrom()`,`mint()`, and `burn()`.
 *
 * @notice The use of `f.selector` in this rule is very similar to its use in solidity.
 * Since f is a parametric method that can be any function in the contract, we use
 * `f.selector` to specify the functions that may change the balance.
 */
rule balanceChangesFromCertainFunctions(method f, address user){
    calldataarg args;
    uint256 userBalanceBefore = _balances[user];
    f(args);
    uint256 userBalanceAfter = _balances[user];

    assert(
        userBalanceBefore != userBalanceAfter =>
        (
            funcCompare(f, "transfer") ||
            funcCompare(f, "mint") ||
            funcCompare(f, "burn")
        ),
        "user's balance changed as a result function other than transfer(), transferFrom(), mint() or burn()"
    );
}


rule onlyOwnersMayChangeTotalSupply(method f) {
    uint256 totalSupplyBefore = _totalSupply;
    calldataarg args;
    f(args);
    uint256 totalSupplyAfter = _totalSupply;
    assert msg.sender == _owner => totalSupplyAfter != totalSupplyBefore;
}