rule NonPayableRevertingConditions {
    justANonPayableFunction();
    assert_revert if msg.value > 0;
}