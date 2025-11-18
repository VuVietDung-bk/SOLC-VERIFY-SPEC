variables
{
    int x;
    int y;
}

rule modifyXandY(int n) {

    add(n);

    assert_modify x() if n > 0;
    assert_modify y() if n > 0;
}

invariant equal {
    assert x == y;
}
