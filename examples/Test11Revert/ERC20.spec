variables
{
    mapping (address => uint) _balances;      
}


rule transferSpec(address recipient, uint amount) {
    uint balance_sender_before = _balances[msg.sender];
    uint balance_recip_before = _balances[recipient];

    transfer(recipient, amount);

    uint balance_sender_after = _balances[msg.sender];
    uint balance_recip_after = _balances[recipient];

    assert recipient != msg.sender => balance_sender_after == balance_sender_before - amount,
        "transfer must decrease sender's balance by amount";

    assert recipient != msg.sender => balance_recip_after == balance_recip_before + amount,
        "transfer must increase recipient's balance by amount";
    
    assert recipient == msg.sender => balance_sender_after == balance_sender_before,
        "transfer must not change sender's balancer when transferring to self";
}


rule transferReverts(address recipient, uint amount) {
    require _balances[msg.sender] < amount;

    transfer(recipient, amount);

    assert_revert,
        "transfer(recipient,amount) must revert if sender's balance is less than `amount`";
}