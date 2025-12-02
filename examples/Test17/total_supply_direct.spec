variables {
    mapping (address => uint256) _balances;   
    uint256 _totalSupply; 
}


invariant directSumOfTwo {
    assert forall address a. address b. (a != b) => (_balances[a] + _balances[b] <= _totalSupply);
}