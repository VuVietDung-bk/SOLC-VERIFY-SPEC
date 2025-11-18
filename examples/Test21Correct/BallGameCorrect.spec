variables {
    uint8 ballPosition;
}

/// The ball should never get to player 2 - strengthened invariant
invariant playerTwoNeverReceivesBall {
    assert ballPosition == 1 || ballPosition == 3;
}


