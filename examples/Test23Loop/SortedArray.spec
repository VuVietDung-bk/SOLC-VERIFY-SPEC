
variables {
    uint256[] arr;
}

invariant isSorted(uint256 i) {
    assert forall uint256 i. i < arr.length - 1 => arr[i] <= arr[i + 1];
}
    

invariant incorrect(uint256 i) {
    assert forall uint256 i. i < arr.length => arr[i] == 71;
}