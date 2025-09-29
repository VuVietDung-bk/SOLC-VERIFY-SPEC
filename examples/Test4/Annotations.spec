methods
{
    function x() external returns (int) envfree;
    function y() external returns (int) envfree;
    function add(int) external envfree;
}

rule modifyXandY(int n) {

    env e;

    add(n);

    assert_modify x(), n > 0;
    assert_modify y(), n > 0;
}

invariant equal {
    assert x() == y();
}