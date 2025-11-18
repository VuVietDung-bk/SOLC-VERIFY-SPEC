// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: Borda.integrityVote.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: Borda -------
// Contract invariant: forall (address c) _points[_winner] >= _points[c]
// Inherits from: IBorda
// 
// State variable: _winner: address
var {:sourceloc "Borda.integrityVote.s.sol", 8, 5} {:message "_winner"} _winner#7: [address_t]address_t;
// 
// State variable: _voted: mapping(address => bool)
var {:sourceloc "Borda.integrityVote.s.sol", 11, 5} {:message "_voted"} _voted#11: [address_t][address_t]bool;
// 
// State variable: _points: mapping(address => uint256)
var {:sourceloc "Borda.integrityVote.s.sol", 14, 5} {:message "_points"} _points#15: [address_t][address_t]int;
// 
// State variable: pointsOfWinner: uint256
var {:sourceloc "Borda.integrityVote.s.sol", 17, 5} {:message "pointsOfWinner"} pointsOfWinner#17: [address_t]int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: vote : function (address,address,address)
procedure {:sourceloc "Borda.integrityVote.s.sol", 20, 5} {:message "Borda::vote"} vote#75(__this: address_t, __msg_sender: address_t, __msg_value: int, f#20: address_t, s#22: address_t, t#24: address_t)
	requires {:sourceloc "Borda.integrityVote.s.sol", 20, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold when entering function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

	ensures {:sourceloc "Borda.integrityVote.s.sol", 20, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold at end of function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));
	ensures {:sourceloc "Borda.integrityVote.s.sol", 20, 5} {:message "Postcondition '_voted[msg.sender]' might not hold at end of function."} _voted#11[__this][__msg_sender];

{
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var call_arg#4: int;
	var call_arg#5: int;
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 118][6 := 111][7 := 116][8 := 101][9 := 114][10 := 32][11 := 104][12 := 97][13 := 115][14 := 32][15 := 97][16 := 108][17 := 114][18 := 101][19 := 97][20 := 100][21 := 121][22 := 32][23 := 99][24 := 97][25 := 115][26 := 116][27 := 32][28 := 105][29 := 116][30 := 115][31 := 32][32 := 118][33 := 111][34 := 116][35 := 101], 36)];
	assume !(_voted#11[__this][__msg_sender]);
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 99][1 := 97][2 := 110][3 := 100][4 := 105][5 := 100][6 := 97][7 := 116][8 := 101][9 := 115][10 := 32][11 := 97][12 := 114][13 := 101][14 := 32][15 := 110][16 := 111][17 := 116][18 := 32][19 := 100][20 := 105][21 := 102][22 := 102][23 := 101][24 := 114][25 := 101][26 := 110][27 := 116], 28)];
	assume (((f#20 != s#22) && (f#20 != t#24)) && (s#22 != t#24));
	_voted#11 := _voted#11[__this := _voted#11[__this][__msg_sender := true]];
	call_arg#4 := 3;
	assume {:sourceloc "Borda.integrityVote.s.sol", 24, 9} {:message ""} true;
	call voteTo#107(__this, __msg_sender, __msg_value, f#20, call_arg#4);
	call_arg#5 := 2;
	assume {:sourceloc "Borda.integrityVote.s.sol", 25, 9} {:message ""} true;
	call voteTo#107(__this, __msg_sender, __msg_value, s#22, call_arg#5);
	call_arg#6 := 1;
	assume {:sourceloc "Borda.integrityVote.s.sol", 26, 9} {:message ""} true;
	call voteTo#107(__this, __msg_sender, __msg_value, t#24, call_arg#6);
	$return0:
	// Function body ends here
}

// 
// Function: voteTo : function (address,uint256)
procedure {:inline 1} {:sourceloc "Borda.integrityVote.s.sol", 30, 5} {:message "Borda::voteTo"} voteTo#107(__this: address_t, __msg_sender: address_t, __msg_value: int, c#78: address_t, p#80: int)
	requires {:sourceloc "Borda.integrityVote.s.sol", 30, 5} {:message "Precondition 'p >= 0' might not hold when entering function."} (p#80 >= 0);

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_points#15 := _points#15[__this := _points#15[__this][c#78 := (_points#15[__this][c#78] + p#80)]];
	if ((_points#15[__this][c#78] > _points#15[__this][_winner#7[__this]])) {
	_winner#7 := _winner#7[__this := c#78];
	}

	$return1:
	// Function body ends here
}

// 
// Function: winner
procedure {:sourceloc "Borda.integrityVote.s.sol", 39, 5} {:message "Borda::winner"} winner#116(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#111: address_t)
	requires {:sourceloc "Borda.integrityVote.s.sol", 39, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold when entering function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

	ensures {:sourceloc "Borda.integrityVote.s.sol", 39, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold at end of function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#111 := _winner#7[__this];
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: points : function (address) view returns (uint256)
procedure {:sourceloc "Borda.integrityVote.s.sol", 43, 5} {:message "Borda::points"} points#129(__this: address_t, __msg_sender: address_t, __msg_value: int, c#118: address_t)
	returns (#122: int)
	requires {:sourceloc "Borda.integrityVote.s.sol", 43, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold when entering function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

	ensures {:sourceloc "Borda.integrityVote.s.sol", 43, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold at end of function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#122 := _points#15[__this][c#118];
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: voted : function (address) view returns (bool)
procedure {:sourceloc "Borda.integrityVote.s.sol", 47, 5} {:message "Borda::voted"} voted#142(__this: address_t, __msg_sender: address_t, __msg_value: int, x#131: address_t)
	returns (#135: bool)
	requires {:sourceloc "Borda.integrityVote.s.sol", 47, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold when entering function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

	ensures {:sourceloc "Borda.integrityVote.s.sol", 47, 5} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold at end of function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#135 := _voted#11[__this][x#131];
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "Borda.integrityVote.s.sol", 5, 1} {:message "Borda::[implicit_constructor]"} __constructor#143(__this: address_t, __msg_sender: address_t, __msg_value: int)
	ensures {:sourceloc "Borda.integrityVote.s.sol", 5, 1} {:message "State variable initializers might violate invariant 'forall (address c) _points[_winner] >= _points[c]'."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

{
	assume (__balance[__this] >= 0);
	_winner#7 := _winner#7[__this := 0];
	_voted#11 := _voted#11[__this := default_address_t_bool()];
	_points#15 := _points#15[__this := default_address_t_int()];
	pointsOfWinner#17 := pointsOfWinner#17[__this := 0];
}

procedure {:sourceloc "Borda.integrityVote.s.sol", 5, 1} {:message "Borda::[receive_ether_selfdestruct]"} Borda_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "Borda.integrityVote.s.sol", 5, 1} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold when entering function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

	ensures {:sourceloc "Borda.integrityVote.s.sol", 5, 1} {:message "Invariant 'forall (address c) _points[_winner] >= _points[c]' might not hold at end of function."} (forall c#2: address_t :: (_points#15[__this][_winner#7[__this]] >= _points#15[__this][c#2]));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

// 
// ------- Source: IBorda.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: IBorda -------
// 
// Function: winner
procedure {:sourceloc "IBorda.sol", 21, 5} {:message "IBorda::winner"} winner#151(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#149: address_t);

// 
// Function: vote
procedure {:sourceloc "IBorda.sol", 24, 5} {:message "IBorda::vote"} vote#160(__this: address_t, __msg_sender: address_t, __msg_value: int, f#153: address_t, s#155: address_t, t#157: address_t);

// 
// Function: points
procedure {:sourceloc "IBorda.sol", 27, 5} {:message "IBorda::points"} points#167(__this: address_t, __msg_sender: address_t, __msg_value: int, c#162: address_t)
	returns (#165: int);

// 
// Function: voted
procedure {:sourceloc "IBorda.sol", 30, 5} {:message "IBorda::voted"} voted#174(__this: address_t, __msg_sender: address_t, __msg_value: int, x#169: address_t)
	returns (#172: bool);

// 
// Default constructor
procedure {:sourceloc "IBorda.sol", 18, 1} {:message "IBorda::[implicit_constructor]"} __constructor#175(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

