// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_19.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 16, 3} {:message "SafeMath::mul"} mul#36(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var {:sourceloc "buggy_19.sol", 20, 5} {:message "c"} c#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#5 == 0)) {
	#10 := 0;
	goto $return0;
	}

	c#20 := (a#5 * b#7);
	assert {:sourceloc "buggy_19.sol", 21, 5} {:message "Assertion might not hold."} ((c#20 div a#5) == b#7);
	#10 := c#20;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 28, 3} {:message "SafeMath::div"} div#55(__this: address_t, __msg_sender: address_t, __msg_value: int, a#39: int, b#41: int)
	returns (#44: int)
{
	var {:sourceloc "buggy_19.sol", 29, 5} {:message "c"} c#47: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#47 := (a#39 div b#41);
	#44 := c#47;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 36, 3} {:message "SafeMath::sub"} sub#76(__this: address_t, __msg_sender: address_t, __msg_value: int, a#58: int, b#60: int)
	returns (#63: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_19.sol", 37, 5} {:message "Assertion might not hold."} (b#60 <= a#58);
	#63 := (a#58 - b#60);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 44, 3} {:message "SafeMath::add"} add#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#79: int, b#81: int)
	returns (#84: int)
{
	var {:sourceloc "buggy_19.sol", 45, 5} {:message "c"} c#87: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#87 := (a#79 + b#81);
	assert {:sourceloc "buggy_19.sol", 46, 5} {:message "Assertion might not hold."} (c#87 >= a#79);
	#84 := c#87;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_19.sol", 11, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#102(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: owned -------
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_19.sol", 58, 3} {:message "owned::bug_tmstmp17"} bug_tmstmp17#114(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#106: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#106 := (__block_timestamp >= 1546300800);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_19.sol", 61, 3} {:message "owner"} owner#116: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 66, 5} {:message "owned::[constructor]"} __constructor#204(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#116 := owner#116[__this := 0];
	bugv_tmstmp4#153 := bugv_tmstmp4#153[__this := __block_timestamp];
	winner_tmstmp3#177 := winner_tmstmp3#177[__this := 0];
	// Function body starts here
	owner#116 := owner#116[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_19.sol", 69, 1} {:message "owned::bug_tmstmp37"} bug_tmstmp37#137(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#129: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#129 := (__block_timestamp >= 1546300800);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_19.sol", 80, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#153: [address_t]int;
// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_19.sol", 85, 5} {:message "owned::transferOwnership"} transferOwnership#175(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#156: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	assume (newOwner#156 != 0);
	owner#116 := owner#116[__this := newOwner#156];
	$return8:
	// Function body ends here
	$return7:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_19.sol", 89, 1} {:message "winner_tmstmp3"} winner_tmstmp3#177: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 90, 1} {:message "owned::play_tmstmp3"} play_tmstmp3#203(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#179: int)
{
	var {:sourceloc "buggy_19.sol", 91, 2} {:message "_vtime"} _vtime#183: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#183 := __block_timestamp;
	if (((startTime#179 + 432000) == _vtime#183)) {
	winner_tmstmp3#177 := winner_tmstmp3#177[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// ------- Contract: ethBank -------
// Inherits from: owned
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 98, 5} {:message "ethBank::[receive]"} #210(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	$return10:
	// Function body ends here
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_19.sol", 99, 1} {:message "ethBank::bug_tmstmp9"} bug_tmstmp9#221(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#213: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#213 := (__block_timestamp >= 1546300800);
	goto $return11;
	$return11:
	// Function body ends here
}

type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: withdrawForUser : function (address payable,uint256)
procedure {:sourceloc "buggy_19.sol", 103, 5} {:message "ethBank::withdrawForUser"} withdrawForUser#245(__this: address_t, __msg_sender: address_t, __msg_value: int, _address#223: address_t, amount#225: int)
{
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 105, 9} {:message ""} true;
	call __transfer(_address#223, __this, 0, amount#225);
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_19.sol", 107, 1} {:message "ethBank::bug_tmstmp25"} bug_tmstmp25#256(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#248: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#248 := (__block_timestamp >= 1546300800);
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: moveBrick : function (uint256)
procedure {:sourceloc "buggy_19.sol", 111, 5} {:message "ethBank::moveBrick"} moveBrick#281(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#258: int)
{
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 113, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, amount#258);
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_19.sol", 115, 1} {:message "winner_tmstmp19"} winner_tmstmp19#283: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 116, 1} {:message "ethBank::play_tmstmp19"} play_tmstmp19#309(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#285: int)
{
	var {:sourceloc "buggy_19.sol", 117, 2} {:message "_vtime"} _vtime#289: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#289 := __block_timestamp;
	if (((startTime#285 + 432000) == _vtime#289)) {
	winner_tmstmp19#283 := winner_tmstmp19#283[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// Function: moveBrickContracts : function ()
procedure {:sourceloc "buggy_19.sol", 125, 5} {:message "ethBank::moveBrickContracts"} moveBrickContracts#337(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 130, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_19.sol", 132, 1} {:message "winner_tmstmp26"} winner_tmstmp26#339: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 133, 1} {:message "ethBank::play_tmstmp26"} play_tmstmp26#361(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#341: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#341 + 432000) == __block_timestamp)) {
	winner_tmstmp26#339 := winner_tmstmp26#339[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// Function: moveBrickClear : function ()
procedure {:sourceloc "buggy_19.sol", 138, 5} {:message "ethBank::moveBrickClear"} moveBrickClear#383(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int_arr_ptr;
	var new_array#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#17 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#16 := new_array#17;
	mem_arr_int := mem_arr_int[call_arg#16 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 142, 9} {:message ""} true;
	call selfdestruct#-21(__this, __this, 0, __msg_sender);
	$return22:
	// Function body ends here
	$return21:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_19.sol", 144, 1} {:message "ethBank::bug_tmstmp20"} bug_tmstmp20#430(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 145, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#387: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#387 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#387);
	pastBlockTime_tmstmp20#387 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_19.sol", 150, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return23:
	// Function body ends here
}

// 
// Function: joinFlexible : function ()
procedure {:sourceloc "buggy_19.sol", 158, 5} {:message "ethBank::joinFlexible"} joinFlexible#457(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int_arr_ptr;
	var new_array#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#21 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#20 := new_array#21;
	mem_arr_int := mem_arr_int[call_arg#20 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 160, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return25:
	// Function body ends here
	$return24:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_19.sol", 163, 1} {:message "ethBank::bug_tmstmp32"} bug_tmstmp32#504(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 164, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#461: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#461 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#461);
	pastBlockTime_tmstmp32#461 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_19.sol", 169, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return26:
	// Function body ends here
}

// 
// Function: joinFixed : function ()
procedure {:sourceloc "buggy_19.sol", 172, 5} {:message "ethBank::joinFixed"} joinFixed#531(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int_arr_ptr;
	var new_array#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#24 := new_array#25;
	mem_arr_int := mem_arr_int[call_arg#24 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 174, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return28:
	// Function body ends here
	$return27:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_19.sol", 177, 1} {:message "winner_tmstmp38"} winner_tmstmp38#533: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 178, 1} {:message "ethBank::play_tmstmp38"} play_tmstmp38#555(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#535: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#535 + 432000) == __block_timestamp)) {
	winner_tmstmp38#533 := winner_tmstmp38#533[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// Function: staticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 181, 5} {:message "ethBank::staticBonus"} staticBonus#582(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int_arr_ptr;
	var new_array#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#29 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#28 := new_array#29;
	mem_arr_int := mem_arr_int[call_arg#28 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 183, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return31:
	// Function body ends here
	$return30:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_19.sol", 186, 1} {:message "ethBank::bug_tmstmp4"} bug_tmstmp4#629(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 187, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#586: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#586 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#586);
	pastBlockTime_tmstmp4#586 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_19.sol", 192, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return32:
	// Function body ends here
}

// 
// Function: activeBonus : function ()
procedure {:sourceloc "buggy_19.sol", 195, 5} {:message "ethBank::activeBonus"} activeBonus#656(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int_arr_ptr;
	var new_array#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#33 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#32 := new_array#33;
	mem_arr_int := mem_arr_int[call_arg#32 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 197, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_19.sol", 200, 1} {:message "winner_tmstmp7"} winner_tmstmp7#658: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 201, 1} {:message "ethBank::play_tmstmp7"} play_tmstmp7#684(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#660: int)
{
	var {:sourceloc "buggy_19.sol", 202, 2} {:message "_vtime"} _vtime#664: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#664 := __block_timestamp;
	if (((startTime#660 + 432000) == _vtime#664)) {
	winner_tmstmp7#658 := winner_tmstmp7#658[__this := __msg_sender];
	}

	$return35:
	// Function body ends here
}

// 
// Function: teamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 205, 5} {:message "ethBank::teamAddBonus"} teamAddBonus#711(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#36: int_arr_ptr;
	var new_array#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#37 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#36 := new_array#37;
	mem_arr_int := mem_arr_int[call_arg#36 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 207, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return37:
	// Function body ends here
	$return36:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_19.sol", 210, 1} {:message "winner_tmstmp23"} winner_tmstmp23#713: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 211, 1} {:message "ethBank::play_tmstmp23"} play_tmstmp23#739(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#715: int)
{
	var {:sourceloc "buggy_19.sol", 212, 2} {:message "_vtime"} _vtime#719: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#719 := __block_timestamp;
	if (((startTime#715 + 432000) == _vtime#719)) {
	winner_tmstmp23#713 := winner_tmstmp23#713[__this := __msg_sender];
	}

	$return38:
	// Function body ends here
}

// 
// Function: staticBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 215, 5} {:message "ethBank::staticBonusCacl"} staticBonusCacl#766(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int_arr_ptr;
	var new_array#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#41 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#40 := new_array#41;
	mem_arr_int := mem_arr_int[call_arg#40 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 217, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return40:
	// Function body ends here
	$return39:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_19.sol", 220, 1} {:message "winner_tmstmp14"} winner_tmstmp14#768: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 221, 1} {:message "ethBank::play_tmstmp14"} play_tmstmp14#790(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#770: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#770 + 432000) == __block_timestamp)) {
	winner_tmstmp14#768 := winner_tmstmp14#768[__this := __msg_sender];
	}

	$return41:
	// Function body ends here
}

// 
// Function: activeBonusCacl_1 : function ()
procedure {:sourceloc "buggy_19.sol", 224, 5} {:message "ethBank::activeBonusCacl_1"} activeBonusCacl_1#817(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int_arr_ptr;
	var new_array#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#45 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#44 := new_array#45;
	mem_arr_int := mem_arr_int[call_arg#44 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 226, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return43:
	// Function body ends here
	$return42:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_19.sol", 229, 1} {:message "winner_tmstmp30"} winner_tmstmp30#819: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 230, 1} {:message "ethBank::play_tmstmp30"} play_tmstmp30#841(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#821: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#821 + 432000) == __block_timestamp)) {
	winner_tmstmp30#819 := winner_tmstmp30#819[__this := __msg_sender];
	}

	$return44:
	// Function body ends here
}

// 
// Function: activeBonusCacl_2 : function ()
procedure {:sourceloc "buggy_19.sol", 233, 5} {:message "ethBank::activeBonusCacl_2"} activeBonusCacl_2#868(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#48: int_arr_ptr;
	var new_array#49: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#49 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#48 := new_array#49;
	mem_arr_int := mem_arr_int[call_arg#48 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 235, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return46:
	// Function body ends here
	$return45:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_19.sol", 238, 1} {:message "ethBank::bug_tmstmp8"} bug_tmstmp8#915(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 239, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#872: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#872 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#872);
	pastBlockTime_tmstmp8#872 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_19.sol", 244, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return47:
	// Function body ends here
}

// 
// Function: activeBonusCacl_3 : function ()
procedure {:sourceloc "buggy_19.sol", 247, 5} {:message "ethBank::activeBonusCacl_3"} activeBonusCacl_3#942(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#52: int_arr_ptr;
	var new_array#53: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#53 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#52 := new_array#53;
	mem_arr_int := mem_arr_int[call_arg#52 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 249, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return49:
	// Function body ends here
	$return48:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_19.sol", 252, 1} {:message "winner_tmstmp39"} winner_tmstmp39#944: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 253, 1} {:message "ethBank::play_tmstmp39"} play_tmstmp39#970(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#946: int)
{
	var {:sourceloc "buggy_19.sol", 254, 2} {:message "_vtime"} _vtime#950: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#950 := __block_timestamp;
	if (((startTime#946 + 432000) == _vtime#950)) {
	winner_tmstmp39#944 := winner_tmstmp39#944[__this := __msg_sender];
	}

	$return50:
	// Function body ends here
}

// 
// Function: activeBonusCacl_4 : function ()
procedure {:sourceloc "buggy_19.sol", 257, 5} {:message "ethBank::activeBonusCacl_4"} activeBonusCacl_4#997(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#56: int_arr_ptr;
	var new_array#57: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#57 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#56 := new_array#57;
	mem_arr_int := mem_arr_int[call_arg#56 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 259, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return52:
	// Function body ends here
	$return51:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_19.sol", 262, 1} {:message "ethBank::bug_tmstmp36"} bug_tmstmp36#1044(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 263, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#1001: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#1001 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#1001);
	pastBlockTime_tmstmp36#1001 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_19.sol", 268, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return53:
	// Function body ends here
}

// 
// Function: activeBonusCacl_5 : function ()
procedure {:sourceloc "buggy_19.sol", 271, 5} {:message "ethBank::activeBonusCacl_5"} activeBonusCacl_5#1071(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#60: int_arr_ptr;
	var new_array#61: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#61 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#60 := new_array#61;
	mem_arr_int := mem_arr_int[call_arg#60 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 273, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return55:
	// Function body ends here
	$return54:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_19.sol", 276, 1} {:message "winner_tmstmp35"} winner_tmstmp35#1073: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 277, 1} {:message "ethBank::play_tmstmp35"} play_tmstmp35#1099(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1075: int)
{
	var {:sourceloc "buggy_19.sol", 278, 2} {:message "_vtime"} _vtime#1079: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1079 := __block_timestamp;
	if (((startTime#1075 + 432000) == _vtime#1079)) {
	winner_tmstmp35#1073 := winner_tmstmp35#1073[__this := __msg_sender];
	}

	$return56:
	// Function body ends here
}

// 
// Function: activeBonusCacl_6 : function ()
procedure {:sourceloc "buggy_19.sol", 281, 5} {:message "ethBank::activeBonusCacl_6"} activeBonusCacl_6#1126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#64: int_arr_ptr;
	var new_array#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#65 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#64 := new_array#65;
	mem_arr_int := mem_arr_int[call_arg#64 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 283, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return58:
	// Function body ends here
	$return57:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_19.sol", 286, 1} {:message "ethBank::bug_tmstmp40"} bug_tmstmp40#1173(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 287, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1130: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1130 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1130);
	pastBlockTime_tmstmp40#1130 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_19.sol", 292, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return59:
	// Function body ends here
}

// 
// Function: activeBonusCacl_7 : function ()
procedure {:sourceloc "buggy_19.sol", 295, 5} {:message "ethBank::activeBonusCacl_7"} activeBonusCacl_7#1200(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#68: int_arr_ptr;
	var new_array#69: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#69 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#68 := new_array#69;
	mem_arr_int := mem_arr_int[call_arg#68 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 297, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return61:
	// Function body ends here
	$return60:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_19.sol", 300, 1} {:message "ethBank::bug_tmstmp33"} bug_tmstmp33#1211(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1203: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1203 := (__block_timestamp >= 1546300800);
	goto $return62;
	$return62:
	// Function body ends here
}

// 
// Function: activeBonusCacl_8 : function ()
procedure {:sourceloc "buggy_19.sol", 303, 5} {:message "ethBank::activeBonusCacl_8"} activeBonusCacl_8#1238(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#72: int_arr_ptr;
	var new_array#73: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#73 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#72 := new_array#73;
	mem_arr_int := mem_arr_int[call_arg#72 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 305, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return64:
	// Function body ends here
	$return63:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_19.sol", 308, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1240: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 309, 1} {:message "ethBank::play_tmstmp27"} play_tmstmp27#1266(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1242: int)
{
	var {:sourceloc "buggy_19.sol", 310, 2} {:message "_vtime"} _vtime#1246: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1246 := __block_timestamp;
	if (((startTime#1242 + 432000) == _vtime#1246)) {
	winner_tmstmp27#1240 := winner_tmstmp27#1240[__this := __msg_sender];
	}

	$return65:
	// Function body ends here
}

// 
// Function: activeBonusCacl_9 : function ()
procedure {:sourceloc "buggy_19.sol", 313, 5} {:message "ethBank::activeBonusCacl_9"} activeBonusCacl_9#1293(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#76: int_arr_ptr;
	var new_array#77: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#77 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#76 := new_array#77;
	mem_arr_int := mem_arr_int[call_arg#76 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 315, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return67:
	// Function body ends here
	$return66:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_19.sol", 318, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1295: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 319, 1} {:message "ethBank::play_tmstmp31"} play_tmstmp31#1321(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1297: int)
{
	var {:sourceloc "buggy_19.sol", 320, 2} {:message "_vtime"} _vtime#1301: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1301 := __block_timestamp;
	if (((startTime#1297 + 432000) == _vtime#1301)) {
	winner_tmstmp31#1295 := winner_tmstmp31#1295[__this := __msg_sender];
	}

	$return68:
	// Function body ends here
}

// 
// Function: teamAddBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 323, 5} {:message "ethBank::teamAddBonusCacl"} teamAddBonusCacl#1348(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#80: int_arr_ptr;
	var new_array#81: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#81 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#80 := new_array#81;
	mem_arr_int := mem_arr_int[call_arg#80 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 325, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return70:
	// Function body ends here
	$return69:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_19.sol", 328, 1} {:message "ethBank::bug_tmstmp13"} bug_tmstmp13#1359(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1351: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1351 := (__block_timestamp >= 1546300800);
	goto $return71;
	$return71:
	// Function body ends here
}

// 
// Function: caclTeamPerformance : function ()
procedure {:sourceloc "buggy_19.sol", 331, 5} {:message "ethBank::caclTeamPerformance"} caclTeamPerformance#1386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#84: int_arr_ptr;
	var new_array#85: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#85 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#84 := new_array#85;
	mem_arr_int := mem_arr_int[call_arg#84 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 333, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return73:
	// Function body ends here
	$return72:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_19.sol", 336, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1390: [address_t]int;
// 
// Function: releaStaticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 337, 5} {:message "ethBank::releaStaticBonus"} releaStaticBonus#1417(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#88: int_arr_ptr;
	var new_array#89: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#89 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#88 := new_array#89;
	mem_arr_int := mem_arr_int[call_arg#88 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 339, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return75:
	// Function body ends here
	$return74:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_19.sol", 342, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1421: [address_t]int;
// 
// Function: releaActiveBonus : function ()
procedure {:sourceloc "buggy_19.sol", 343, 5} {:message "ethBank::releaActiveBonus"} releaActiveBonus#1448(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#92: int_arr_ptr;
	var new_array#93: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#93 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#92 := new_array#93;
	mem_arr_int := mem_arr_int[call_arg#92 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 345, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return77:
	// Function body ends here
	$return76:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_19.sol", 348, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1452: [address_t]int;
// 
// Function: releaTeamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 349, 5} {:message "ethBank::releaTeamAddBonus"} releaTeamAddBonus#1479(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#96: int_arr_ptr;
	var new_array#97: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#116[__this]);
	// Function body starts here
	new_array#97 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#96 := new_array#97;
	mem_arr_int := mem_arr_int[call_arg#96 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#116[__this]);
	assume {:sourceloc "buggy_19.sol", 351, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return79:
	// Function body ends here
	$return78:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_19.sol", 354, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#1483: [address_t]int;
// 
// Default constructor
procedure {:sourceloc "buggy_19.sol", 96, 1} {:message "ethBank::[implicit_constructor]"} __constructor#1484(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp19#283 := winner_tmstmp19#283[__this := 0];
	winner_tmstmp26#339 := winner_tmstmp26#339[__this := 0];
	winner_tmstmp38#533 := winner_tmstmp38#533[__this := 0];
	winner_tmstmp7#658 := winner_tmstmp7#658[__this := 0];
	winner_tmstmp23#713 := winner_tmstmp23#713[__this := 0];
	winner_tmstmp14#768 := winner_tmstmp14#768[__this := 0];
	winner_tmstmp30#819 := winner_tmstmp30#819[__this := 0];
	winner_tmstmp39#944 := winner_tmstmp39#944[__this := 0];
	winner_tmstmp35#1073 := winner_tmstmp35#1073[__this := 0];
	winner_tmstmp27#1240 := winner_tmstmp27#1240[__this := 0];
	winner_tmstmp31#1295 := winner_tmstmp31#1295[__this := 0];
	bugv_tmstmp5#1390 := bugv_tmstmp5#1390[__this := __block_timestamp];
	bugv_tmstmp1#1421 := bugv_tmstmp1#1421[__this := __block_timestamp];
	bugv_tmstmp2#1452 := bugv_tmstmp2#1452[__this := __block_timestamp];
	bugv_tmstmp3#1483 := bugv_tmstmp3#1483[__this := __block_timestamp];
	owner#116 := owner#116[__this := 0];
	bugv_tmstmp4#153 := bugv_tmstmp4#153[__this := __block_timestamp];
	winner_tmstmp3#177 := winner_tmstmp3#177[__this := 0];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#116 := owner#116[__this := __msg_sender];
	$return80:
	// Function body ends here
	// Inlined constructor for owned ends here
}

