methods
{
    function balanceOf(address) external returns (uint) envfree;
    function allowance(address,address) external returns(uint) envfree;
    function totalSupply() external returns (uint) envfree;
}


rule transferSpec(address recipient, uint amount) {

    env e;
    
    mathint balance_sender_before = balanceOf(e.msg.sender);
    mathint balance_recip_before = balanceOf(recipient);

    transfer(e, recipient, amount);

    mathint balance_sender_after = balanceOf(e.msg.sender);
    mathint balance_recip_after = balanceOf(recipient);

    assert recipient != sender => balance_sender_after == balance_sender_before - amount,
        "transfer must decrease sender's balance by amount";

    assert recipient != sender => balance_recip_after == balance_recip_before + amount,
        "transfer must increase recipient's balance by amount";
    
    assert recipient == sender => balance_sender_after == balance_sender_before,
        "transfer must not change sender's balancer when transferring to self";
}


rule transferReverts(address recipient, uint amount) {
    env e;

    require balanceOf(e.msg.sender) < amount;

    transfer@withrevert(e, recipient, amount);

    assert lastReverted,
        "transfer(recipient,amount) must revert if sender's balance is less than `amount`";
}


rule transferDoesntRevert(address recipient, uint amount) {
    env e;

    require balanceOf(e.msg.sender) > amount;
    require e.msg.value == 0;  // No payment

    require balanceOf(recipient) + amount < to_mathint(max_uint);

    require e.msg.sender != 0;
    require recipient != 0;

    transfer@withrevert(e, recipient, amount);
    assert !lastReverted;
}
