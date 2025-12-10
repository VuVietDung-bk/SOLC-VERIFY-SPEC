variables {
    mapping (address => uint256) _points;
    mapping (address => bool) _voted;
    address _winner;
}

rule integrityVote(address f, address s, address t) {
    vote(f, s, t); //considering only non reverting cases 
    assert _voted[msg.sender], "A user voted without being marked accordingly";
}

rule singleVote(address f, address s, address t) {
    bool has_voted_before = _voted[msg.sender];
    require has_voted_before;
    vote(f, s, t); //considering all cases
    assert_revert, "Double voting is not allowed";
}

rule integrityPoints(address f, address s, address t) {
    uint256 f_points = _points[f];
    uint256 s_points = _points[s];
    uint256 t_points = _points[t];
    vote(f, s, t);
    assert _points[f] == f_points + 3 &&
           _points[s] == s_points + 2 &&
           _points[t] == t_points + 1,   "unexpected change of points";
}

rule globallyVoted(address x, method f) {
    require _voted[x];
    f(); //taking into account all external function with all possible arguments 
    assert _voted[x], "Once a user voted, he is marked as voted in all future states";
}

invariant integrityPointsOfWinner {
    assert forall address c. _points[_winner] >= _points[c];
}
            
rule noEffect(method m) {
    address c;
    uint256 c_points = _points[c];
    bool c_voted = _voted[c];
    if (funcCompare(m, "vote")) {
        address f;
        address s;
        address t;
        require( c != f  &&  c != s  &&  c != t );
        vote(f, s, t);
    }
    else {
        m();
    }
    assert ( _voted[c] == c_voted || c  == msg.sender ) &&
             _points[c] == c_points, "unexpected change to others points or voted";
}

rule participationCriterion(address f, address s, address t) {
    address w1 = _winner;
    require _points[w1] >= _points[f];
    require _points[w1] >= _points[s];
    require _points[w1] >= _points[t];
    vote(f, s, t);
    address w2 = _winner;
    assert w1 == f => w2 == f, "winner changed unexpectedly";
}