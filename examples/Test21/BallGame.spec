/// The ball should never get to player 2 - too weak version.
invariant playerTwoNeverReceivesBall() 
    ballPosition() != 2;

