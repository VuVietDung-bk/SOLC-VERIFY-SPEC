
/// The ball should never get to player 2 - strenghened invariant
invariant playerTwoNeverReceivesBall() 
    ballPosition() == 1 || ballPosition() == 3;


