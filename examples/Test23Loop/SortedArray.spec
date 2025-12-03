
variables {
    uint256[] arr;
}

invariant isSorted {
    assert forall uint256 i. (i >= 0 && i < arr.length - 1) => arr[i] <= arr[i + 1];
}
    

invariant incorrect {
    assert forall uint256 i. (i >= 0 && i < arr.length) => arr[i] == 71;
}