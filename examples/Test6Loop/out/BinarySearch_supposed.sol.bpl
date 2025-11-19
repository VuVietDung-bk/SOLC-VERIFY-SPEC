// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: BinarySearch_supposed.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: BinarySearch -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
// Contract invariant: forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])
// 
// State variable: a: uint256[] storage ref
var {:sourceloc "BinarySearch_supposed.sol", 7, 5} {:message "a"} a#5: [address_t]int_arr_type;
// 
// Function: find : function (uint256) view returns (uint256)
procedure {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "BinarySearch::find"} find#135(__this: address_t, __msg_sender: address_t, __msg_value: int, _elem#8: int)
	returns (index#11: int)
	requires {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "Variables in invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "Invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might not hold when entering function."} (forall i#2: int, j#4: int :: (!(((((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (0 <= j#4)) && (j#4 < length#int_arr#constr(a#5[__this])))) || ((i#2 >= j#4) || (arr#int_arr#constr(a#5[__this])[i#2] < arr#int_arr#constr(a#5[__this])[j#4]))));
	requires {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "Precondition '_elem >= 0' might not hold when entering function."} (_elem#8 >= 0);

	ensures {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "Variables in invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "Invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might not hold at end of function."} (forall i#2: int, j#4: int :: (!(((((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (0 <= j#4)) && (j#4 < length#int_arr#constr(a#5[__this])))) || ((i#2 >= j#4) || (arr#int_arr#constr(a#5[__this])[i#2] < arr#int_arr#constr(a#5[__this])[j#4]))));
	ensures {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "Postcondition 'forall (uint i) !(0 <= i && i < a.length) || (a[i] != _elem || i == index)' might not hold at end of function."} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || ((arr#int_arr#constr(a#5[__this])[i#2] != _elem#8) || (i#2 == index#11))));
	ensures {:sourceloc "BinarySearch_supposed.sol", 11, 5} {:message "Variables in postcondition 'forall (uint i) !(0 <= i && i < a.length) || (a[i] != _elem || i == index)' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));

{
	var {:sourceloc "BinarySearch_supposed.sol", 14, 9} {:message "bIndex"} bIndex#14: int;
	var {:sourceloc "BinarySearch_supposed.sol", 15, 9} {:message "left"} left#19: int;
	var {:sourceloc "BinarySearch_supposed.sol", 16, 9} {:message "right"} right#23: int;
	var {:sourceloc "BinarySearch_supposed.sol", 22, 13} {:message "m"} m#32: int;
	var {:sourceloc "BinarySearch_supposed.sol", 36, 9} {:message "lIndex"} lIndex#83: int;
	var {:sourceloc "BinarySearch_supposed.sol", 37, 9} {:message "found"} found#87: bool;
	var tmp#4: int;
	// TCC assumptions
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	bIndex#14 := length#int_arr#constr(a#5[__this]);
	left#19 := 0;
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	right#23 := length#int_arr#constr(a#5[__this]);
	while ((left#19 < right#23))
	invariant {:sourceloc "BinarySearch_supposed.sol", 21, 9} {:message "variables in range for '(0 <= left) && (left <= right) && (right <= a.length)'"} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));

	invariant {:sourceloc "BinarySearch_supposed.sol", 21, 9} {:message "(0 <= left) && (left <= right) && (right <= a.length)"} (((0 <= left#19) && (left#19 <= right#23)) && (right#23 <= length#int_arr#constr(a#5[__this])));

	invariant {:sourceloc "BinarySearch_supposed.sol", 21, 9} {:message "variables in range for 'forall (uint i) !(0 <= i && i < a.length) || (i >= left || a[i] < _elem)'"} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));

	invariant {:sourceloc "BinarySearch_supposed.sol", 21, 9} {:message "forall (uint i) !(0 <= i && i < a.length) || (i >= left || a[i] < _elem)"} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || ((i#2 >= left#19) || (arr#int_arr#constr(a#5[__this])[i#2] < _elem#8))));

	invariant {:sourceloc "BinarySearch_supposed.sol", 21, 9} {:message "variables in range for 'forall (uint i) !(0 <= i && i < a.length) || (i < right || _elem < a[i])'"} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));

	invariant {:sourceloc "BinarySearch_supposed.sol", 21, 9} {:message "forall (uint i) !(0 <= i && i < a.length) || (i < right || _elem < a[i])"} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || ((i#2 < right#23) || (_elem#8 < arr#int_arr#constr(a#5[__this])[i#2]))));


	{
	m#32 := ((left#19 + right#23) div 2);
	if ((arr#int_arr#constr(a#5[__this])[m#32] == _elem#8)) {
	bIndex#14 := m#32;
	goto break1;
	}
	else {
	if ((arr#int_arr#constr(a#5[__this])[m#32] > _elem#8)) {
	right#23 := m#32;
	}
	else {
	left#19 := m#32;
	}

	}

	$continue0:
	}

	break1:
	assert {:sourceloc "BinarySearch_supposed.sol", 33, 9} {:message "Assertion might not hold."} ((left#19 >= right#23) || (arr#int_arr#constr(a#5[__this])[bIndex#14] == _elem#8));
	lIndex#83 := 0;
	found#87 := false;
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((!(found#87) && (lIndex#83 < length#int_arr#constr(a#5[__this]))))
	invariant {:sourceloc "BinarySearch_supposed.sol", 41, 9} {:message "variables in range for '(0 <= lIndex) && (lIndex <= a.length)'"} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));

	invariant {:sourceloc "BinarySearch_supposed.sol", 41, 9} {:message "(0 <= lIndex) && (lIndex <= a.length)"} ((0 <= lIndex#83) && (lIndex#83 <= length#int_arr#constr(a#5[__this])));

	invariant {:sourceloc "BinarySearch_supposed.sol", 41, 9} {:message "variables in range for 'forall (uint i) !(0 <= i && i < a.length) || (i >= lIndex || a[i] != _elem)'"} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));

	invariant {:sourceloc "BinarySearch_supposed.sol", 41, 9} {:message "forall (uint i) !(0 <= i && i < a.length) || (i >= lIndex || a[i] != _elem)"} (forall i#2: int :: (!(((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this])))) || ((i#2 >= lIndex#83) || (arr#int_arr#constr(a#5[__this])[i#2] != _elem#8))));

	invariant {:sourceloc "BinarySearch_supposed.sol", 41, 9} {:message "!found || a[lIndex] == _elem"} (!(found#87) || (arr#int_arr#constr(a#5[__this])[lIndex#83] == _elem#8));


	{
	if ((arr#int_arr#constr(a#5[__this])[lIndex#83] == _elem#8)) {
	found#87 := true;
	}
	else {
	lIndex#83 := (lIndex#83 + 1);
	tmp#4 := lIndex#83;
	}

	$continue2:
	assume ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break3:
	assert {:sourceloc "BinarySearch_supposed.sol", 49, 9} {:message "Assertion might not hold."} (!(found#87) || (arr#int_arr#constr(a#5[__this])[lIndex#83] == _elem#8));
	assert {:sourceloc "BinarySearch_supposed.sol", 51, 9} {:message "Assertion might not hold."} (lIndex#83 == bIndex#14);
	index#11 := bIndex#14;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
procedure {:sourceloc "BinarySearch_supposed.sol", 5, 1} {:message "BinarySearch::[implicit_constructor]"} __constructor#136(__this: address_t, __msg_sender: address_t, __msg_value: int)
	ensures {:sourceloc "BinarySearch_supposed.sol", 5, 1} {:message "State variable initializers might violate invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])'."} (forall i#2: int, j#4: int :: (!(((((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (0 <= j#4)) && (j#4 < length#int_arr#constr(a#5[__this])))) || ((i#2 >= j#4) || (arr#int_arr#constr(a#5[__this])[i#2] < arr#int_arr#constr(a#5[__this])[j#4]))));

{
	assume (__balance[__this] >= 0);
	a#5 := a#5[__this := int_arr#constr(default_int_int(), 0)];
}

procedure {:sourceloc "BinarySearch_supposed.sol", 5, 1} {:message "BinarySearch::[receive_ether_selfdestruct]"} BinarySearch_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "BinarySearch_supposed.sol", 5, 1} {:message "Variables in invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might be out of range when entering function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "BinarySearch_supposed.sol", 5, 1} {:message "Invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might not hold when entering function."} (forall i#2: int, j#4: int :: (!(((((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (0 <= j#4)) && (j#4 < length#int_arr#constr(a#5[__this])))) || ((i#2 >= j#4) || (arr#int_arr#constr(a#5[__this])[i#2] < arr#int_arr#constr(a#5[__this])[j#4]))));

	ensures {:sourceloc "BinarySearch_supposed.sol", 5, 1} {:message "Variables in invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might be out of range at end of function."} ((0 <= length#int_arr#constr(a#5[__this])) && (length#int_arr#constr(a#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "BinarySearch_supposed.sol", 5, 1} {:message "Invariant 'forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])' might not hold at end of function."} (forall i#2: int, j#4: int :: (!(((((0 <= i#2) && (i#2 < length#int_arr#constr(a#5[__this]))) && (0 <= j#4)) && (j#4 < length#int_arr#constr(a#5[__this])))) || ((i#2 >= j#4) || (arr#int_arr#constr(a#5[__this])[i#2] < arr#int_arr#constr(a#5[__this])[j#4]))));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

