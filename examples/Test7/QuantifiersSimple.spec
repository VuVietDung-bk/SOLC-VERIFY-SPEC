methods
{
    function a(uint) external returns (int) envfree; // a là array, phải có cách phân biệt giữa array và mapping
}

invariant sorted {
    assert forall uint i. !(0 <= i && i < a.length) || (a(i) >= 0)
    assert exists uint i. 0 <= i && i < a.length && (a(i) > 0)
}