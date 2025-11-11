methods {
    function justANonPayableFunction() external;
}

rule NonPayableRevertingConditions {
    env e;
    justANonPayableFunction@withrevert(e);

    assert_revert if e.msg.value > 0;
}