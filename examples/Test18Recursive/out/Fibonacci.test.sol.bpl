// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: Fibonacci.test.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: Fibonacci -------
// 
// Function: fibonacci
procedure {:sourceloc "Fibonacci.test.sol", 9, 5} {:message "Fibonacci::fibonacci"} fibonacci#35(__this: address_t, __msg_sender: address_t, __msg_value: int, i#4: int)
	returns (re1#7: int)
	requires {:sourceloc "Fibonacci.test.sol", 9, 5} {:message "Precondition 'i > 0' might not hold when entering function."} (i#4 > 0);

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

	assume {:sourceloc "Fibonacci.test.sol", 13, 39} {:message ""} true;
	call fibonacci#35_ret#0 := fibonacci#35(__this, __this, 0, (i#4 - 2));
	assume {:sourceloc "Fibonacci.test.sol", 13, 16} {:message ""} true;
	call fibonacci#35_ret#1 := fibonacci#35(__this, __this, 0, (i#4 - 1));
	re1#7 := (fibonacci#35_ret#1 + fibonacci#35_ret#0);
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: fibonacci1
procedure {:sourceloc "Fibonacci.test.sol", 19, 5} {:message "Fibonacci::fibonacci1"} fibonacci1#69(__this: address_t, __msg_sender: address_t, __msg_value: int, i#38: int)
	returns (re1#41: int)
	requires {:sourceloc "Fibonacci.test.sol", 19, 5} {:message "Precondition 'i > 0' might not hold when entering function."} (i#38 > 0);
	requires {:sourceloc "Fibonacci.test.sol", 19, 5} {:message "Precondition 'i == 5' might not hold when entering function."} (i#38 == 5);

	ensures {:sourceloc "Fibonacci.test.sol", 19, 5} {:message "Postcondition 're1 == 5' might not hold at end of function."} (re1#41 == 5);

{
	var fibonacci#35_ret#2: int;
	var fibonacci#35_ret#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((i#38 == 1) || (i#38 == 2))) {
	re1#41 := 1;
	goto $return1;
	}

	assume {:sourceloc "Fibonacci.test.sol", 23, 39} {:message ""} true;
	call fibonacci#35_ret#2 := fibonacci#35(__this, __this, 0, (i#38 - 2));
	assume {:sourceloc "Fibonacci.test.sol", 23, 16} {:message ""} true;
	call fibonacci#35_ret#3 := fibonacci#35(__this, __this, 0, (i#38 - 1));
	re1#41 := (fibonacci#35_ret#3 + fibonacci#35_ret#2);
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "Fibonacci.test.sol", 6, 1} {:message "Fibonacci::[implicit_constructor]"} __constructor#70(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

