// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: Fibonacci.fifthFibonacciElementIsFive.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: Fibonacci -------
// 
// Function: fibonacci
procedure {:sourceloc "Fibonacci.fifthFibonacciElementIsFive.s.sol", 11, 5} {:message "Fibonacci::fibonacci"} fibonacci#35(__this: address_t, __msg_sender: address_t, __msg_value: int, i#4: int)
	returns (re1#7: int)
	requires {:sourceloc "Fibonacci.fifthFibonacciElementIsFive.s.sol", 11, 5} {:message "Precondition 'i >= 0' might not hold when entering function."} (i#4 >= 0);
	requires {:sourceloc "Fibonacci.fifthFibonacciElementIsFive.s.sol", 11, 5} {:message "Precondition 'i == 5' might not hold when entering function."} (i#4 == 5);

	ensures {:sourceloc "Fibonacci.fifthFibonacciElementIsFive.s.sol", 11, 5} {:message "Postcondition 're1 == 5' might not hold at end of function."} (re1#7 == 5);

{
	var fibonacci#35_ret#0: int;
	var fibonacci#35_ret#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((i#4 == 1) || (i#4 == 2))) {
	re1#7 := 1;
	goto $return0;
	}

	assume {:sourceloc "Fibonacci.fifthFibonacciElementIsFive.s.sol", 15, 39} {:message ""} true;
	call fibonacci#35_ret#0 := fibonacci#35(__this, __this, 0, (i#4 - 2));
	assume {:sourceloc "Fibonacci.fifthFibonacciElementIsFive.s.sol", 15, 16} {:message ""} true;
	call fibonacci#35_ret#1 := fibonacci#35(__this, __this, 0, (i#4 - 1));
	re1#7 := (fibonacci#35_ret#1 + fibonacci#35_ret#0);
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "Fibonacci.fifthFibonacciElementIsFive.s.sol", 6, 1} {:message "Fibonacci::[implicit_constructor]"} __constructor#36(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

