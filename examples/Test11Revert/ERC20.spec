variables
{
    mapping (address => uint) balanceOf;      // balanceOf(address)
    mapping (address => mapping (address => uint)) allowance;      // allowance(address,address)
    uint totalSupply;    // totalSupply()
}


rule transferSpec(address recipient, uint amount) {
    mathint balance_sender_before = balanceOf[msg.sender];
    mathint balance_recip_before = balanceOf[recipient];

    transfer(recipient, amount);

    mathint balance_sender_after = balanceOf[msg.sender];
    mathint balance_recip_after = balanceOf[recipient];

    assert recipient != msg.sender => balance_sender_after == balance_sender_before - amount,
        "transfer must decrease sender's balance by amount";

    assert recipient != msg.sender => balance_recip_after == balance_recip_before + amount,
        "transfer must increase recipient's balance by amount";
    
    assert recipient == msg.sender => balance_sender_after == balance_sender_before,
        "transfer must not change sender's balancer when transferring to self";
}


rule transferReverts(address recipient, uint amount) {
    require balanceOf[msg.sender] < amount;

    transfer(recipient, amount);

    assert_revert,
        "transfer(recipient,amount) must revert if sender's balance is less than `amount`";
}