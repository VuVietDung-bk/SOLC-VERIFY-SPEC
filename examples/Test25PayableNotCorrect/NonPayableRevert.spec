// Variables-only mode: remove methods block

rule NonPayableRevertingConditions {
    justANonPayableFunction();
    assert_revert if msg.value > 0;
}