// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: SortedArray.annotated.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: SortedArray -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
// Contract invariant: property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])
// Contract invariant: property(arr) (i) !(i < arr.length) || (arr[i] == 71)
// 
// State variable: arr: uint256[] storage ref
var {:sourceloc "SortedArray.annotated.s.sol", 12, 5} {:message "arr"} arr#5: [address_t]int_arr_type;
// 
// Function: insert
procedure {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "SortedArray::insert"} insert#68(__this: address_t, __msg_sender: address_t, __msg_value: int, val#8: int)
	requires {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	requires {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

	ensures {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 18, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

{
	var {:sourceloc "SortedArray.annotated.s.sol", 22, 9} {:message "pos"} pos#12: int;
	var tmp#2: int;
	var {:sourceloc "SortedArray.annotated.s.sol", 29, 14} {:message "i"} i#37: int;
	var tmp#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	pos#12 := 0;
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while (((pos#12 < length#int_arr#constr(arr#5[__this])) && (arr#int_arr#constr(arr#5[__this])[pos#12] <= val#8))) {
	tmp#2 := pos#12;
	pos#12 := (pos#12 + 1);
	$continue0:
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break1:
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this])[length#int_arr#constr(arr#5[__this]) := 0], length#int_arr#constr(arr#5[__this]))];
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this])[length#int_arr#constr(arr#5[__this]) := val#8], length#int_arr#constr(arr#5[__this]))];
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#int_arr#constr(arr#5[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this]), (length#int_arr#constr(arr#5[__this]) + 1))];
	// The following while loop was mapped from a for loop
	// Initialization
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	i#37 := (length#int_arr#constr(arr#5[__this]) - 1);
	while ((i#37 > pos#12)) {
	// Body
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this])[i#37 := arr#int_arr#constr(arr#5[__this])[(i#37 - 1)]], length#int_arr#constr(arr#5[__this]))];
	$continue3:
	// Loop expression
	tmp#5 := i#37;
	i#37 := (i#37 - 1);
	}

	break4:
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this])[pos#12 := val#8], length#int_arr#constr(arr#5[__this]))];
	$return0:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: remove
procedure {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "SortedArray::remove"} remove#113(__this: address_t, __msg_sender: address_t, __msg_value: int, index#71: int)
	requires {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	requires {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

	ensures {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 39, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	var {:sourceloc "SortedArray.annotated.s.sol", 41, 14} {:message "i"} i#83: int;
	var tmp#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 100][3 := 101][4 := 120][5 := 32][6 := 111][7 := 117][8 := 116][9 := 32][10 := 111][11 := 102][12 := 32][13 := 114][14 := 97][15 := 110][16 := 103][17 := 101], 18)];
	assume (index#71 < length#int_arr#constr(arr#5[__this]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#83 := index#71;
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#83 < (length#int_arr#constr(arr#5[__this]) - 1))) {
	// Body
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this])[i#83 := arr#int_arr#constr(arr#5[__this])[(i#83 + 1)]], length#int_arr#constr(arr#5[__this]))];
	$continue8:
	// Loop expression
	tmp#10 := i#83;
	i#83 := (i#83 + 1);
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break9:
	assume ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this]), (length#int_arr#constr(arr#5[__this]) - 1))];
	arr#5 := arr#5[__this := int_arr#constr(arr#int_arr#constr(arr#5[__this])[length#int_arr#constr(arr#5[__this]) := 0], length#int_arr#constr(arr#5[__this]))];
	$return1:
	// Function body ends here
}

// 
// Function: readAt
procedure {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "SortedArray::readAt"} readAt#126(__this: address_t, __msg_sender: address_t, __msg_value: int, index#116: int)
	returns (#119: int)
	requires {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	requires {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

	ensures {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 51, 5} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#119 := arr#int_arr#constr(arr#5[__this])[index#116];
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "SortedArray::[implicit_constructor]"} __constructor#127(__this: address_t, __msg_sender: address_t, __msg_value: int)
	ensures {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "State variable initializers might violate invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])'."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "State variable initializers might violate invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)'."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

{
	assume (__balance[__this] >= 0);
	arr#5 := arr#5[__this := int_arr#constr(default_int_int(), 0)];
}

procedure {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "SortedArray::[receive_ether_selfdestruct]"} SortedArray_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	requires {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range when entering function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	requires {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold when entering function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

	ensures {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Invariant 'property(arr) (i) !(i < arr.length - 1) || (arr[i] <= arr[i + 1])' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < (length#int_arr#constr(arr#5[__this]) - 1))) || (arr#int_arr#constr(arr#5[__this])[i#3] <= arr#int_arr#constr(arr#5[__this])[(i#3 + 1)]))));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Variables in invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might be out of range at end of function."} ((0 <= length#int_arr#constr(arr#5[__this])) && (length#int_arr#constr(arr#5[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	ensures {:sourceloc "SortedArray.annotated.s.sol", 11, 1} {:message "Invariant 'property(arr) (i) !(i < arr.length) || (arr[i] == 71)' might not hold at end of function."} (forall i#3: int :: (((0 <= i#3) && (i#3 < length#int_arr#constr(arr#5[__this]))) ==> (!((i#3 < length#int_arr#constr(arr#5[__this]))) || (arr#int_arr#constr(arr#5[__this])[i#3] == 71))));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

