variables {
    uint8 ballPosition;
}
/// The ball should never get to player 2 - too weak version.
invariant playerTwoNeverReceivesBall{
    assert ballPosition != 2;
}