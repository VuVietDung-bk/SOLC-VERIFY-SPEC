// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: NonPayable.NonPayableRevertingConditions.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: NonPayable -------
// 
// Function: justANonPayableFunction
procedure {:sourceloc "NonPayable.NonPayableRevertingConditions.s.sol", 9, 5} {:message "NonPayable::justANonPayableFunction"} justANonPayableFunction#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "NonPayable.NonPayableRevertingConditions.s.sol", 9, 5} {:message "Precondition 'msg.value > 0' might not hold when entering function."} (__msg_value > 0);

	ensures {:sourceloc "NonPayable.NonPayableRevertingConditions.s.sol", 9, 5} {:message "Postcondition 'false' might not hold at end of function."} false;

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	$return0:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "NonPayable.NonPayableRevertingConditions.s.sol", 5, 1} {:message "NonPayable::[implicit_constructor]"} __constructor#7(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

