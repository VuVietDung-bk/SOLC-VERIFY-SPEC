/*
 * Borda Example
 * -------------
 *
 * Verification of a simple voting contract which uses a Borda election.
 * See https://en.wikipedia.org/wiki/Borda_count
 */



methods {
    function points(address) external returns uint256  envfree;
    function vote(address,address,address) external;
    function voted(address) external returns bool  envfree;
    function winner() external returns address  envfree;
}

/*
After voting, a user is marked as voted
    vote(e, f, s, t) => voted(e.msg.sender)
*/
rule integrityVote(address f, address s, address t) {
    env e;
    vote(e, f, s, t); //considering only non reverting cases 
    assert voted(e.msg.sender), "A user voted without being marked accordingly";
}

/*
Single vote per user
    A user cannot vote if he has voted before
    voted(e.msg.sender) => ㄱvote(e, f, s, t)
*/
rule singleVote(address f, address s, address t) {
    env e;
    bool has_voted_before = voted(e.msg.sender);
    vote@withrevert(e, f, s, t); //considering all cases
    assert has_voted_before => lastReverted, "Double voting is not allowed";
}

/*
Integrity of points:
    When voting, the points each candidate gets are updated as expected. 
    This rule also verifies that there are three distinct candidates.

    { points(f) = f_points ⋀ points(s) = s_points ⋀ points(t) = t_points }
    vote(e, f, s, t)
    { points(f) = f_points + 3 ⋀ points(s) = s_points + 2 ⋀ points(t) = t_points + 1 }
*/
rule integrityPoints(address f, address s, address t) {
    env e;
    uint256 f_points = points(f);
    uint256 s_points = points(s);
    uint256 t_points = points(t);
    vote(e, f, s, t);
    assert points(f) == f_points + 3 &&
           points(s) == s_points + 2 &&
           points(t) == t_points + 1,   "unexpected change of points";
}

/*
Integrity of voted:
    Once a user casts their vote, they are marked as voted globally (for all future states).
    vote(e, f, s, t)  Globally voted(e.msg.sender)
*/
rule globallyVoted(address x, method f) {
    require voted(x);
    env eF;
    calldataarg arg;
    f(eF,arg); //taking into account all external function with all possible arguments 
    assert voted(x), "Once a user voted, he is marked as voted in all future states";
}

/*
 Integrity of winner
    The winner has the most points.
    winner() = forall ∀address c. points(c) ≤ points(w)


    Note: The Prover checks that the invariant is established after the constructor. In addition, Prover checks that the invariant holds after the execution of any contract method, assuming that it held before the method was executed.
    Note that c is an unconstrained variable therefore this invariant is checked against all possible values of c. 
*/
invariant integrityPointsOfWinner(address c) {
    assert points(winner()) >= points(c);
}
            

/*
Vote is the only state-changing function. 
A vote can only affect the voter and the selected candidates, and has no effect on other addresses.
    ∀address c, c ≠ {f, s, t}.
    { c_points = points(c) ⋀ b = voted(c) }  vote(e, f, s, t)  { points(c) = c_points ⋀ ( voted(c) = b V c = e.msg.sender ) }
*/
rule noEffect(method m) {
    address c;
    env e;
    uint256 c_points = points(c);
    bool c_voted = voted(c);
    if (m.selector == sig:vote(address, address, address).selector) {
        address f;
        address s;
        address t;
        require( c != f  &&  c != s  &&  c != t );
        vote(e, f, s, t);
    }
    else {
        calldataarg args;
        m(e, args);
    }
    assert ( voted(c) == c_voted || c  == e.msg.sender ) &&
             points(c) == c_points, "unexpected change to others points or voted";
}

/*
Participation criterion
    Abstaining from an election can not help a voter's preferred choice
    https://en.wikipedia.org/wiki/Participation_criterion

    { w1 = winner() }
        ( vote(e, f, s, t) )
    { winner() = f => (w1 = f) }
*/
rule participationCriterion(address f, address s, address t) {
    env e;
    address w1 = winner();
    require points(w1) >= points(f);
    require points(w1) >= points(s);
    require points(w1) >= points(t);
    vote(e, f, s, t);
    address w2 = winner();
    assert w1 == f => w2 == f, "winner changed unexpectedly";
}