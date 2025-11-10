// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: BallGame.annotated.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: BallGame -------
// Contract invariant: ballPosition != 2
// 
// State variable: ballPosition: uint8
var {:sourceloc "BallGame.annotated.sol", 21, 5} {:message "ballPosition"} ballPosition#5: [address_t]int;
// 
// Function: 
procedure {:sourceloc "BallGame.annotated.sol", 24, 5} {:message "BallGame::[constructor]"} __constructor#40(__this: address_t, __msg_sender: address_t, __msg_value: int)
	ensures {:sourceloc "BallGame.annotated.sol", 24, 5} {:message "Invariant 'ballPosition != 2' might not hold at end of function."} (ballPosition#5[__this] != 2);

{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	ballPosition#5 := ballPosition#5[__this := 0];
	// Function body starts here
	ballPosition#5 := ballPosition#5[__this := 1];
	$return0:
	// Function body ends here
}

// 
// Function: pass
procedure {:sourceloc "BallGame.annotated.sol", 32, 5} {:message "BallGame::pass"} pass#39(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "BallGame.annotated.sol", 32, 5} {:message "Invariant 'ballPosition != 2' might not hold when entering function."} (ballPosition#5[__this] != 2);

	ensures {:sourceloc "BallGame.annotated.sol", 32, 5} {:message "Invariant 'ballPosition != 2' might not hold at end of function."} (ballPosition#5[__this] != 2);

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((ballPosition#5[__this] == 1)) {
	ballPosition#5 := ballPosition#5[__this := 3];
	}
	else {
	if ((ballPosition#5[__this] == 3)) {
	ballPosition#5 := ballPosition#5[__this := 1];
	}
	else {
	ballPosition#5 := ballPosition#5[__this := 2];
	}

	}

	$return1:
	// Function body ends here
}

procedure {:sourceloc "BallGame.annotated.sol", 18, 1} {:message "BallGame::[receive_ether_selfdestruct]"} BallGame_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "BallGame.annotated.sol", 18, 1} {:message "Invariant 'ballPosition != 2' might not hold when entering function."} (ballPosition#5[__this] != 2);

	ensures {:sourceloc "BallGame.annotated.sol", 18, 1} {:message "Invariant 'ballPosition != 2' might not hold at end of function."} (ballPosition#5[__this] != 2);

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

