// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: QuantifiersSimple_supposed.sol -------
// Pragma: solidity>=0.5.0
// 
// ------- Contract: QuantifiersSimple -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
// Contract invariant: forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)
// Contract invariant: exists (uint i) 0 <= i && i < a.length && (a[i] > 0)
// 
// State variable: a: int256[] storage ref
var {:sourceloc "QuantifiersSimple_supposed.sol", 12, 5} {:message "a"} a#5: [address_t]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "QuantifiersSimple_supposed.sol", 15, 5} {:message "QuantifiersSimple::[constructor]"} __constructor#55(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 15, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 15, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));

	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 15, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 15, 5} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold at end of function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 15, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 15, 5} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold at end of function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	a#5 := a#5[__this := int_arr#constr(default_int_int(), 0)];
	// Function body starts here
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this])[length#int_arr#constr(a#5[__this]) := 0], length#int_arr#constr(a#5[__this]))];
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this])[length#int_arr#constr(a#5[__this]) := 1], length#int_arr#constr(a#5[__this]))];
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#int_arr#constr(a#5[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this]), (length#int_arr#constr(a#5[__this]) + 1))];
	$return0:
	// Function body ends here
}

// 
// Function: add : function (int256)
procedure {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "QuantifiersSimple::add"} add#33(__this: address_t, __msg_sender: address_t, __msg_value: int, d#17: int)
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold when entering function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold when entering function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold at end of function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 20, 5} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold at end of function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (d#17 >= 0);
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this])[length#int_arr#constr(a#5[__this]) := 0], length#int_arr#constr(a#5[__this]))];
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this])[length#int_arr#constr(a#5[__this]) := d#17], length#int_arr#constr(a#5[__this]))];
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#int_arr#constr(a#5[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this]), (length#int_arr#constr(a#5[__this]) + 1))];
	$return1:
	// Function body ends here
}

// 
// Function: add_incorrect : function (int256)
procedure {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "QuantifiersSimple::add_incorrect"} add_incorrect#45(__this: address_t, __msg_sender: address_t, __msg_value: int, d#35: int)
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold when entering function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold when entering function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold at end of function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 26, 5} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold at end of function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this])[length#int_arr#constr(a#5[__this]) := 0], length#int_arr#constr(a#5[__this]))];
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this])[length#int_arr#constr(a#5[__this]) := d#35], length#int_arr#constr(a#5[__this]))];
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#int_arr#constr(a#5[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this]), (length#int_arr#constr(a#5[__this]) + 1))];
	$return2:
	// Function body ends here
}

// 
// Function: remove_incorrect : function ()
procedure {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "QuantifiersSimple::remove_incorrect"} remove_incorrect#54(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold when entering function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold when entering function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold at end of function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 31, 5} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold at end of function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this]), (length#int_arr#constr(a#5[__this]) - 1))];
	a#5 := a#5[__this := int_arr#constr(arr#int_arr#constr(a#5[__this])[length#int_arr#constr(a#5[__this]) := 0], length#int_arr#constr(a#5[__this]))];
	$return3:
	// Function body ends here
}

procedure {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "QuantifiersSimple::[receive_ether_selfdestruct]"} QuantifiersSimple_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold when entering function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold when entering function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Variables in invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Invariant 'forall (uint i) !(0 <= i && i < a.length) || (a[i] >= 0)' might not hold at end of function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || (arr#int_arr#constr(a#5[__this])[i#2] >= 0)));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Variables in invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "QuantifiersSimple_supposed.sol", 10, 1} {:message "Invariant 'exists (uint i) 0 <= i && i < a.length && (a[i] > 0)' might not hold at end of function."} (exists i#2: int :: (((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (arr#int_arr#constr(a#5[__this])[i#2] > 0)));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

