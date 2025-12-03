variables {
    mapping (address => uint256) _points;
    mapping (address => bool) _voted;
    address _winner;
}

/*
After voting, a user is marked as voted
    vote(f, s, t) => voted(msg.sender)
*/
rule integrityVote(address f, address s, address t) {
    vote(f, s, t); //considering only non reverting cases 
    assert _voted[msg.sender], "A user voted without being marked accordingly";
}

/*
Single vote per user
    A user cannot vote if he has voted before
    voted(msg.sender) => ㄱvote(f, s, t)
*/
rule singleVote(address f, address s, address t) {
    bool has_voted_before = _voted[msg.sender];
    require has_voted_before;
    vote(f, s, t); //considering all cases
    assert_revert, "Double voting is not allowed";
}

/*
Integrity of points:
    When voting, the points each candidate gets are updated as expected. 
    This rule also verifies that there are three distinct candidates.

    { points(f) = f_points ⋀ points(s) = s_points ⋀ points(t) = t_points }
    vote(f, s, t)
    { points(f) = f_points + 3 ⋀ points(s) = s_points + 2 ⋀ points(t) = t_points + 1 }
*/
rule integrityPoints(address f, address s, address t) {
    uint256 f_points = _points[f];
    uint256 s_points = _points[s];
    uint256 t_points = _points[t];
    vote(f, s, t);
    assert _points[f] == f_points + 3 &&
           _points[s] == s_points + 2 &&
           _points[t] == t_points + 1,   "unexpected change of points";
}

/*
Integrity of voted:
    Once a user casts their votthey are marked as voted globally (for all future states).
    vote(f, s, t)  Globally voted(msg.sender)
*/
rule globallyVoted(address x, method f) {
    require _voted[x];
    f(); //taking into account all external function with all possible arguments 
    assert _voted[x], "Once a user voted, he is marked as voted in all future states";
}

/*
 Integrity of winner
    The winner has the most points.
    winner() = forall ∀address c. points(c) ≤ points(w)


    Note: The Prover checks that the invariant is established after the constructor. In addition, Prover checks that the invariant holds after the execution of any contract method, assuming that it held before the method was executed.
    Note that c is an unconstrained variable therefore this invariant is checked against all possible values of c. 
*/
invariant integrityPointsOfWinner {
    assert forall address c. _points[_winner] >= _points[c];
}
            
/*
Vote is the only state-changing function. 
A vote can only affect the voter and the selected candidates, and has no effect on other addresses.
    ∀address c, c ≠ {f, s, t}.
    { c_points = points(c) ⋀ b = voted(c) }  vote(f, s, t)  { points(c) = c_points ⋀ ( voted(c) = b V c = msg.sender ) }
*/
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

/*
Participation criterion
    Abstaining from an election can not help a voter's preferred choice
    https://en.wikipedia.org/wiki/Participation_criterion

    { w1 = winner() }
        ( vote(f, s, t) )
    { winner() = f => (w1 = f) }
*/
rule participationCriterion(address f, address s, address t) {
    
    address w1 = _winner;
    require _points[w1] >= _points[f];
    require _points[w1] >= _points[s];
    require _points[w1] >= _points[t];
    vote(f, s, t);
    address w2 = _winner;
    assert w1 == f => w2 == f, "winner changed unexpectedly";
}