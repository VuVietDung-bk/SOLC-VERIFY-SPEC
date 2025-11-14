variables
{
    int[] a; // a là array
}

invariant sorted {
    assert forall uint i. !(0 <= i && i < a.length) || (a(i) >= 0);
    assert exists uint i. 0 <= i && i < a.length && (a(i) > 0);
}