methods
{
    function a(uint) external returns (uint) envfree; // a là array, phải có cách phân biệt giữa array và mapping
    function find(uint) external returns (uint) envfree;
}

rule searchTheRightNumber(uint n) {

    env e;

    uint index = find(n);

    assert forall uint i. a(i) != n || i == index;
}

invariant sorted {
    assert forall uint i. forall uint j. i >= j || a(i) < a(j);
}