variables
{
    uint[] a; // a là array, biểu diễn bằng kiểu mảng trong variables
}

rule searchTheRightNumber(uint n) {

    uint index = find(n);

    assert forall uint i. a[i] != n || i == index;
}

invariant sorted {
    assert forall uint i. forall uint j. i >= j || a[i] < a[j];
}
