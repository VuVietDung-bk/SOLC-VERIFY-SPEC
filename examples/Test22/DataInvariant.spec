variables {
    mapping(address => int256) balance;
}

invariant alwaysPositive {
    assert forall address a. balance[a] >= 0;
}