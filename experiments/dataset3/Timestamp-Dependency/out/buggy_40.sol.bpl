// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_40.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 30, 5} {:message "SafeMath::add"} add#28(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var {:sourceloc "buggy_40.sol", 31, 9} {:message "c"} c#13: int;
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#13 := (a#5 + b#7);
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#13 >= a#5);
	#10 := c#13;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 46, 5} {:message "SafeMath::sub"} sub#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#31: int, b#33: int)
	returns (#36: int)
{
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var {:sourceloc "buggy_40.sol", 48, 9} {:message "c"} c#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#33 <= a#31);
	c#46 := (a#31 - b#33);
	#36 := c#46;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 62, 5} {:message "SafeMath::mul"} mul#89(__this: address_t, __msg_sender: address_t, __msg_value: int, a#57: int, b#59: int)
	returns (#62: int)
{
	var {:sourceloc "buggy_40.sol", 70, 9} {:message "c"} c#72: int;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#57 == 0)) {
	#62 := 0;
	goto $return2;
	}

	c#72 := (a#57 * b#59);
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#72 div a#57) == b#59);
	#62 := c#72;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 87, 5} {:message "SafeMath::div"} div#115(__this: address_t, __msg_sender: address_t, __msg_value: int, a#92: int, b#94: int)
	returns (#97: int)
{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	var {:sourceloc "buggy_40.sol", 90, 9} {:message "c"} c#107: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#94 > 0);
	c#107 := (a#92 div b#94);
	#97 := c#107;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 107, 5} {:message "SafeMath::mod"} mod#137(__this: address_t, __msg_sender: address_t, __msg_value: int, a#118: int, b#120: int)
	returns (#123: int)
{
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume (b#120 != 0);
	#123 := (a#118 mod b#120);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_40.sol", 20, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#138(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_40.sol", 180, 5} {:message "[event] IERC20::Transfer"} Transfer#204(__this: address_t, __msg_sender: address_t, __msg_value: int, from#198: address_t, to#200: address_t, value#202: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_40.sol", 186, 5} {:message "[event] IERC20::Approval"} Approval#213(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#207: address_t, spender#209: address_t, value#211: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_40.sol", 122, 5} {:message "IERC20::totalSupply"} totalSupply#145(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#143: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_40.sol", 127, 5} {:message "IERC20::balanceOf"} balanceOf#153(__this: address_t, __msg_sender: address_t, __msg_value: int, account#148: address_t)
	returns (#151: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_40.sol", 136, 5} {:message "IERC20::transfer"} transfer#163(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#156: address_t, amount#158: int)
	returns (#161: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_40.sol", 145, 5} {:message "IERC20::allowance"} allowance#173(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#166: address_t, spender#168: address_t)
	returns (#171: int);

// 
// Function: approve
procedure {:sourceloc "buggy_40.sol", 161, 5} {:message "IERC20::approve"} approve#183(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#176: address_t, amount#178: int)
	returns (#181: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_40.sol", 172, 5} {:message "IERC20::transferFrom"} transferFrom#195(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#186: address_t, recipient#188: address_t, amount#190: int)
	returns (#193: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_40.sol", 118, 1} {:message "IERC20::[implicit_constructor]"} __constructor#214(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Using library SafeMath for uint256
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_40.sol", 216, 3} {:message "winner_tmstmp19"} winner_tmstmp19#222: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 217, 1} {:message "ERC20::play_tmstmp19"} play_tmstmp19#248(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#224: int)
{
	var {:sourceloc "buggy_40.sol", 218, 2} {:message "_vtime"} _vtime#228: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#228 := __block_timestamp;
	if (((startTime#224 + 432000) == _vtime#228)) {
	winner_tmstmp19#222 := winner_tmstmp19#222[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 221, 3} {:message "_balances"} _balances#252: [address_t][address_t]int;
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_40.sol", 223, 3} {:message "winner_tmstmp26"} winner_tmstmp26#254: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 224, 1} {:message "ERC20::play_tmstmp26"} play_tmstmp26#276(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#256: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#256 + 432000) == __block_timestamp)) {
	winner_tmstmp26#254 := winner_tmstmp26#254[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_40.sol", 227, 3} {:message "_allowances"} _allowances#282: [address_t][address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_40.sol", 229, 3} {:message "ERC20::bug_tmstmp20"} bug_tmstmp20#329(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 230, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#286: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#286 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#286);
	pastBlockTime_tmstmp20#286 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_40.sol", 235, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_40.sol", 238, 3} {:message "_totalSupply"} _totalSupply#331: [address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 243, 5} {:message "ERC20::totalSupply"} totalSupply#341(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#336: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#336 := _totalSupply#331[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_40.sol", 246, 1} {:message "winner_tmstmp7"} winner_tmstmp7#343: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 247, 1} {:message "ERC20::play_tmstmp7"} play_tmstmp7#369(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#345: int)
{
	var {:sourceloc "buggy_40.sol", 248, 2} {:message "_vtime"} _vtime#349: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#349 := __block_timestamp;
	if (((startTime#345 + 432000) == _vtime#349)) {
	winner_tmstmp7#343 := winner_tmstmp7#343[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 255, 5} {:message "ERC20::balanceOf"} balanceOf#383(__this: address_t, __msg_sender: address_t, __msg_value: int, account#372: address_t)
	returns (#376: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#376 := _balances#252[__this][account#372];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_40.sol", 258, 1} {:message "winner_tmstmp23"} winner_tmstmp23#385: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 259, 1} {:message "ERC20::play_tmstmp23"} play_tmstmp23#411(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#387: int)
{
	var {:sourceloc "buggy_40.sol", 260, 2} {:message "_vtime"} _vtime#391: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#391 := __block_timestamp;
	if (((startTime#387 + 432000) == _vtime#391)) {
	winner_tmstmp23#385 := winner_tmstmp23#385[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 272, 5} {:message "ERC20::transfer"} transfer#432(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#414: address_t, amount#416: int)
	returns (#420: bool)
{
	var call_arg#10: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#10 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 273, 9} {:message ""} true;
	call _transfer#821(__this, __msg_sender, __msg_value, call_arg#10, recipient#414, amount#416);
	#420 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_40.sol", 276, 1} {:message "winner_tmstmp14"} winner_tmstmp14#434: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 277, 1} {:message "ERC20::play_tmstmp14"} play_tmstmp14#456(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#436: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#436 + 432000) == __block_timestamp)) {
	winner_tmstmp14#434 := winner_tmstmp14#434[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 284, 5} {:message "ERC20::allowance"} allowance#474(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#459: address_t, spender#461: address_t)
	returns (#465: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#465 := _allowances#282[__this][owner#459][spender#461];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_40.sol", 287, 1} {:message "winner_tmstmp30"} winner_tmstmp30#476: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 288, 1} {:message "ERC20::play_tmstmp30"} play_tmstmp30#498(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#478: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#478 + 432000) == __block_timestamp)) {
	winner_tmstmp30#476 := winner_tmstmp30#476[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 299, 5} {:message "ERC20::approve"} approve#519(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#501: address_t, value#503: int)
	returns (#507: bool)
{
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 300, 9} {:message ""} true;
	call _approve#1044(__this, __msg_sender, __msg_value, call_arg#11, spender#501, value#503);
	#507 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_40.sol", 303, 1} {:message "ERC20::bug_tmstmp8"} bug_tmstmp8#566(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 304, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#523: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#523 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#523);
	pastBlockTime_tmstmp8#523 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_40.sol", 309, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 325, 5} {:message "ERC20::transferFrom"} transferFrom#603(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#569: address_t, recipient#571: address_t, amount#573: int)
	returns (#577: bool)
{
	var call_arg#12: address_t;
	var sub#54_ret#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 326, 9} {:message ""} true;
	call _transfer#821(__this, __msg_sender, __msg_value, sender#569, recipient#571, amount#573);
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 327, 38} {:message ""} true;
	call sub#54_ret#13 := sub#54(__this, __msg_sender, __msg_value, _allowances#282[__this][sender#569][__msg_sender], amount#573);
	assume {:sourceloc "buggy_40.sol", 327, 9} {:message ""} true;
	call _approve#1044(__this, __msg_sender, __msg_value, sender#569, call_arg#12, sub#54_ret#13);
	#577 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_40.sol", 330, 1} {:message "winner_tmstmp39"} winner_tmstmp39#605: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 331, 1} {:message "ERC20::play_tmstmp39"} play_tmstmp39#631(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#607: int)
{
	var {:sourceloc "buggy_40.sol", 332, 2} {:message "_vtime"} _vtime#611: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#611 := __block_timestamp;
	if (((startTime#607 + 432000) == _vtime#611)) {
	winner_tmstmp39#605 := winner_tmstmp39#605[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 348, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#659(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#634: address_t, addedValue#636: int)
	returns (#639: bool)
{
	var call_arg#14: address_t;
	var add#28_ret#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 349, 39} {:message ""} true;
	call add#28_ret#15 := add#28(__this, __msg_sender, __msg_value, _allowances#282[__this][__msg_sender][spender#634], addedValue#636);
	assume {:sourceloc "buggy_40.sol", 349, 9} {:message ""} true;
	call _approve#1044(__this, __msg_sender, __msg_value, call_arg#14, spender#634, add#28_ret#15);
	#639 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_40.sol", 352, 1} {:message "ERC20::bug_tmstmp36"} bug_tmstmp36#706(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 353, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#663: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#663 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#663);
	pastBlockTime_tmstmp36#663 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_40.sol", 358, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 376, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#734(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#709: address_t, subtractedValue#711: int)
	returns (#714: bool)
{
	var call_arg#16: address_t;
	var sub#54_ret#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 377, 39} {:message ""} true;
	call sub#54_ret#17 := sub#54(__this, __msg_sender, __msg_value, _allowances#282[__this][__msg_sender][spender#709], subtractedValue#711);
	assume {:sourceloc "buggy_40.sol", 377, 9} {:message ""} true;
	call _approve#1044(__this, __msg_sender, __msg_value, call_arg#16, spender#709, sub#54_ret#17);
	#714 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_40.sol", 380, 1} {:message "winner_tmstmp35"} winner_tmstmp35#736: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 381, 1} {:message "ERC20::play_tmstmp35"} play_tmstmp35#762(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#738: int)
{
	var {:sourceloc "buggy_40.sol", 382, 2} {:message "_vtime"} _vtime#742: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#742 := __block_timestamp;
	if (((startTime#738 + 432000) == _vtime#742)) {
	winner_tmstmp35#736 := winner_tmstmp35#736[__this := __msg_sender];
	}

	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 400, 5} {:message "ERC20::_transfer"} _transfer#821(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#765: address_t, recipient#767: address_t, amount#769: int)
{
	var call_arg#18: int_arr_ptr;
	var new_array#19: int_arr_ptr;
	var call_arg#20: int_arr_ptr;
	var new_array#21: int_arr_ptr;
	var sub#54_ret#22: int;
	var add#28_ret#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#19 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#18 := new_array#19;
	mem_arr_int := mem_arr_int[call_arg#18 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#765 != 0);
	new_array#21 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#20 := new_array#21;
	mem_arr_int := mem_arr_int[call_arg#20 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#767 != 0);
	assume {:sourceloc "buggy_40.sol", 404, 29} {:message ""} true;
	call sub#54_ret#22 := sub#54(__this, __msg_sender, __msg_value, _balances#252[__this][sender#765], amount#769);
	_balances#252 := _balances#252[__this := _balances#252[__this][sender#765 := sub#54_ret#22]];
	assume {:sourceloc "buggy_40.sol", 405, 32} {:message ""} true;
	call add#28_ret#23 := add#28(__this, __msg_sender, __msg_value, _balances#252[__this][recipient#767], amount#769);
	_balances#252 := _balances#252[__this := _balances#252[__this][recipient#767 := add#28_ret#23]];
	assume {:sourceloc "buggy_40.sol", 406, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, sender#765, recipient#767, amount#769);
	$return24:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_40.sol", 408, 1} {:message "ERC20::bug_tmstmp40"} bug_tmstmp40#868(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 409, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#825: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#825 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#825);
	pastBlockTime_tmstmp40#825 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_40.sol", 414, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 427, 5} {:message "ERC20::_mint"} _mint#914(__this: address_t, __msg_sender: address_t, __msg_value: int, account#871: address_t, amount#873: int)
{
	var call_arg#24: int_arr_ptr;
	var new_array#25: int_arr_ptr;
	var add#28_ret#26: int;
	var add#28_ret#27: int;
	var call_arg#28: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#24 := new_array#25;
	mem_arr_int := mem_arr_int[call_arg#24 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#871 != 0);
	assume {:sourceloc "buggy_40.sol", 430, 24} {:message ""} true;
	call add#28_ret#26 := add#28(__this, __msg_sender, __msg_value, _totalSupply#331[__this], amount#873);
	_totalSupply#331 := _totalSupply#331[__this := add#28_ret#26];
	assume {:sourceloc "buggy_40.sol", 431, 30} {:message ""} true;
	call add#28_ret#27 := add#28(__this, __msg_sender, __msg_value, _balances#252[__this][account#871], amount#873);
	_balances#252 := _balances#252[__this := _balances#252[__this][account#871 := add#28_ret#27]];
	call_arg#28 := 0;
	assume {:sourceloc "buggy_40.sol", 432, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, call_arg#28, account#871, amount#873);
	$return26:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_40.sol", 434, 1} {:message "ERC20::bug_tmstmp33"} bug_tmstmp33#925(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#917: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#917 := (__block_timestamp >= 1546300800);
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 449, 5} {:message "ERC20::_burn"} _burn#971(__this: address_t, __msg_sender: address_t, __msg_value: int, account#928: address_t, value#930: int)
{
	var call_arg#29: int_arr_ptr;
	var new_array#30: int_arr_ptr;
	var sub#54_ret#31: int;
	var sub#54_ret#32: int;
	var call_arg#33: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#30 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#29 := new_array#30;
	mem_arr_int := mem_arr_int[call_arg#29 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#928 != 0);
	assume {:sourceloc "buggy_40.sol", 452, 24} {:message ""} true;
	call sub#54_ret#31 := sub#54(__this, __msg_sender, __msg_value, _totalSupply#331[__this], value#930);
	_totalSupply#331 := _totalSupply#331[__this := sub#54_ret#31];
	assume {:sourceloc "buggy_40.sol", 453, 30} {:message ""} true;
	call sub#54_ret#32 := sub#54(__this, __msg_sender, __msg_value, _balances#252[__this][account#928], value#930);
	_balances#252 := _balances#252[__this := _balances#252[__this][account#928 := sub#54_ret#32]];
	call_arg#33 := 0;
	assume {:sourceloc "buggy_40.sol", 454, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, account#928, call_arg#33, value#930);
	$return28:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_40.sol", 456, 1} {:message "winner_tmstmp27"} winner_tmstmp27#973: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 457, 1} {:message "ERC20::play_tmstmp27"} play_tmstmp27#999(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#975: int)
{
	var {:sourceloc "buggy_40.sol", 458, 2} {:message "_vtime"} _vtime#979: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#979 := __block_timestamp;
	if (((startTime#975 + 432000) == _vtime#979)) {
	winner_tmstmp27#973 := winner_tmstmp27#973[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 475, 5} {:message "ERC20::_approve"} _approve#1044(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1002: address_t, spender#1004: address_t, value#1006: int)
{
	var call_arg#34: int_arr_ptr;
	var new_array#35: int_arr_ptr;
	var call_arg#36: int_arr_ptr;
	var new_array#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#35 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#34 := new_array#35;
	mem_arr_int := mem_arr_int[call_arg#34 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#1002 != 0);
	new_array#37 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#36 := new_array#37;
	mem_arr_int := mem_arr_int[call_arg#36 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#1004 != 0);
	_allowances#282 := _allowances#282[__this := _allowances#282[__this][owner#1002 := _allowances#282[__this][owner#1002][spender#1004 := value#1006]]];
	assume {:sourceloc "buggy_40.sol", 480, 14} {:message ""} true;
	call Approval#213(__this, __msg_sender, __msg_value, owner#1002, spender#1004, value#1006);
	$return30:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_40.sol", 482, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1046: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 483, 1} {:message "ERC20::play_tmstmp31"} play_tmstmp31#1072(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1048: int)
{
	var {:sourceloc "buggy_40.sol", 484, 2} {:message "_vtime"} _vtime#1052: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1052 := __block_timestamp;
	if (((startTime#1048 + 432000) == _vtime#1052)) {
	winner_tmstmp31#1046 := winner_tmstmp31#1046[__this := __msg_sender];
	}

	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 494, 5} {:message "ERC20::_burnFrom"} _burnFrom#1101(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1075: address_t, amount#1077: int)
{
	var call_arg#38: address_t;
	var sub#54_ret#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 495, 9} {:message ""} true;
	call _burn#971(__this, __msg_sender, __msg_value, account#1075, amount#1077);
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 496, 39} {:message ""} true;
	call sub#54_ret#39 := sub#54(__this, __msg_sender, __msg_value, _allowances#282[__this][account#1075][__msg_sender], amount#1077);
	assume {:sourceloc "buggy_40.sol", 496, 9} {:message ""} true;
	call _approve#1044(__this, __msg_sender, __msg_value, account#1075, call_arg#38, sub#54_ret#39);
	$return32:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_40.sol", 498, 1} {:message "ERC20::bug_tmstmp13"} bug_tmstmp13#1112(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1104: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1104 := (__block_timestamp >= 1546300800);
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_40.sol", 213, 1} {:message "ERC20::[implicit_constructor]"} __constructor#1113(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp19#222 := winner_tmstmp19#222[__this := 0];
	_balances#252 := _balances#252[__this := default_address_t_int()];
	winner_tmstmp26#254 := winner_tmstmp26#254[__this := 0];
	_allowances#282 := _allowances#282[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#331 := _totalSupply#331[__this := 0];
	winner_tmstmp7#343 := winner_tmstmp7#343[__this := 0];
	winner_tmstmp23#385 := winner_tmstmp23#385[__this := 0];
	winner_tmstmp14#434 := winner_tmstmp14#434[__this := 0];
	winner_tmstmp30#476 := winner_tmstmp30#476[__this := 0];
	winner_tmstmp39#605 := winner_tmstmp39#605[__this := 0];
	winner_tmstmp35#736 := winner_tmstmp35#736[__this := 0];
	winner_tmstmp27#973 := winner_tmstmp27#973[__this := 0];
	winner_tmstmp31#1046 := winner_tmstmp31#1046[__this := 0];
}

// 
// ------- Contract: ERC20Detailed -------
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_40.sol", 507, 3} {:message "ERC20Detailed::bug_tmstmp32"} bug_tmstmp32#1161(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 508, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#1118: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#1118 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#1118);
	pastBlockTime_tmstmp32#1118 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_40.sol", 513, 25} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return34:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_40.sol", 516, 3} {:message "_name"} _name#1163: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_40.sol", 517, 3} {:message "winner_tmstmp38"} winner_tmstmp38#1165: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 518, 1} {:message "ERC20Detailed::play_tmstmp38"} play_tmstmp38#1187(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1167: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1167 + 432000) == __block_timestamp)) {
	winner_tmstmp38#1165 := winner_tmstmp38#1165[__this := __msg_sender];
	}

	$return35:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_40.sol", 521, 3} {:message "_symbol"} _symbol#1189: [address_t]int_arr_type;
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_40.sol", 522, 3} {:message "ERC20Detailed::bug_tmstmp4"} bug_tmstmp4#1236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 523, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#1193: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#1193 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#1193);
	pastBlockTime_tmstmp4#1193 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_40.sol", 528, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return36:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_40.sol", 531, 3} {:message "_decimals"} _decimals#1238: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 538, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1305(__this: address_t, __msg_sender: address_t, __msg_value: int, name#1241: int_arr_ptr, symbol#1243: int_arr_ptr, decimals#1245: int)
{
	// TCC assumptions
	assume (name#1241 < __alloc_counter);
	assume (symbol#1243 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#1163 := _name#1163[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp38#1165 := winner_tmstmp38#1165[__this := 0];
	_symbol#1189 := _symbol#1189[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#1238 := _decimals#1238[__this := 0];
	bugv_tmstmp5#1265 := bugv_tmstmp5#1265[__this := __block_timestamp];
	bugv_tmstmp1#1278 := bugv_tmstmp1#1278[__this := __block_timestamp];
	bugv_tmstmp2#1291 := bugv_tmstmp2#1291[__this := __block_timestamp];
	bugv_tmstmp3#1304 := bugv_tmstmp3#1304[__this := __block_timestamp];
	// Function body starts here
	_name#1163 := _name#1163[__this := mem_arr_int[name#1241]];
	_symbol#1189 := _symbol#1189[__this := mem_arr_int[symbol#1243]];
	_decimals#1238 := _decimals#1238[__this := decimals#1245];
	$return37:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_40.sol", 543, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1265: [address_t]int;
// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 548, 5} {:message "ERC20Detailed::name"} name#1274(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1269: int_arr_ptr)
{
	var new_array#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1269 := new_array#40;
	mem_arr_int := mem_arr_int[#1269 := _name#1163[__this]];
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_40.sol", 551, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1278: [address_t]int;
// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 557, 5} {:message "ERC20Detailed::symbol"} symbol#1287(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1282: int_arr_ptr)
{
	var new_array#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#41 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1282 := new_array#41;
	mem_arr_int := mem_arr_int[#1282 := _symbol#1189[__this]];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_40.sol", 560, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1291: [address_t]int;
// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_40.sol", 574, 5} {:message "ERC20Detailed::decimals"} decimals#1300(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1295: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1295 := _decimals#1238[__this];
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_40.sol", 577, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#1304: [address_t]int;
// 
// ------- Contract: SimpleSwapCoin -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 581, 5} {:message "SimpleSwapCoin::[constructor]"} __constructor#1337(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1311: int_arr_ptr, _symbol#1313: int_arr_ptr, _decimals#1315: int)
{
	var name#1241#42: int_arr_ptr;
	var symbol#1243#42: int_arr_ptr;
	var decimals#1245#42: int;
	var call_arg#44: address_t;
	var call_arg#45: int;
	// TCC assumptions
	assume (_name#1311 < __alloc_counter);
	assume (_symbol#1313 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	bugv_tmstmp4#1336 := bugv_tmstmp4#1336[__this := __block_timestamp];
	_name#1163 := _name#1163[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp38#1165 := winner_tmstmp38#1165[__this := 0];
	_symbol#1189 := _symbol#1189[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#1238 := _decimals#1238[__this := 0];
	bugv_tmstmp5#1265 := bugv_tmstmp5#1265[__this := __block_timestamp];
	bugv_tmstmp1#1278 := bugv_tmstmp1#1278[__this := __block_timestamp];
	bugv_tmstmp2#1291 := bugv_tmstmp2#1291[__this := __block_timestamp];
	bugv_tmstmp3#1304 := bugv_tmstmp3#1304[__this := __block_timestamp];
	winner_tmstmp19#222 := winner_tmstmp19#222[__this := 0];
	_balances#252 := _balances#252[__this := default_address_t_int()];
	winner_tmstmp26#254 := winner_tmstmp26#254[__this := 0];
	_allowances#282 := _allowances#282[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#331 := _totalSupply#331[__this := 0];
	winner_tmstmp7#343 := winner_tmstmp7#343[__this := 0];
	winner_tmstmp23#385 := winner_tmstmp23#385[__this := 0];
	winner_tmstmp14#434 := winner_tmstmp14#434[__this := 0];
	winner_tmstmp30#476 := winner_tmstmp30#476[__this := 0];
	winner_tmstmp39#605 := winner_tmstmp39#605[__this := 0];
	winner_tmstmp35#736 := winner_tmstmp35#736[__this := 0];
	winner_tmstmp27#973 := winner_tmstmp27#973[__this := 0];
	winner_tmstmp31#1046 := winner_tmstmp31#1046[__this := 0];
	// Arguments for ERC20Detailed
	name#1241#42 := _name#1311;
	symbol#1243#42 := _symbol#1313;
	decimals#1245#42 := _decimals#1315;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#1163 := _name#1163[__this := mem_arr_int[name#1241#42]];
	_symbol#1189 := _symbol#1189[__this := mem_arr_int[symbol#1243#42]];
	_decimals#1238 := _decimals#1238[__this := decimals#1245#42];
	$return41:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#44 := __msg_sender;
	call_arg#45 := 10000000000000000;
	assume {:sourceloc "buggy_40.sol", 582, 9} {:message ""} true;
	call _mint#914(__this, __msg_sender, __msg_value, call_arg#44, call_arg#45);
	$return42:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_40.sol", 584, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#1336: [address_t]int;
