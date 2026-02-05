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
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_40.sol", 216, 3} {:message "ERC20::bug_unchk_send21"} bug_unchk_send21#233(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 217, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 218, 3} {:message "_balances"} _balances#237: [address_t][address_t]int;
// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_40.sol", 220, 3} {:message "ERC20::bug_unchk_send10"} bug_unchk_send10#250(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 221, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_40.sol", 222, 3} {:message "_allowances"} _allowances#256: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_40.sol", 224, 3} {:message "ERC20::bug_unchk_send22"} bug_unchk_send22#269(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 225, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_40.sol", 226, 3} {:message "_totalSupply"} _totalSupply#271: [address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 231, 9} {:message "ERC20::totalSupply"} totalSupply#281(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#276: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#276 := _totalSupply#271[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_40.sol", 234, 1} {:message "ERC20::bug_unchk_send2"} bug_unchk_send2#294(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 235, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 240, 9} {:message "ERC20::balanceOf"} balanceOf#308(__this: address_t, __msg_sender: address_t, __msg_value: int, account#297: address_t)
	returns (#301: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#301 := _balances#237[__this][account#297];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_40.sol", 243, 1} {:message "ERC20::bug_unchk_send17"} bug_unchk_send17#321(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 244, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 254, 9} {:message "ERC20::transfer"} transfer#342(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#324: address_t, amount#326: int)
	returns (#330: bool)
{
	var call_arg#15: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 255, 9} {:message ""} true;
	call _transfer#611(__this, __msg_sender, __msg_value, call_arg#15, recipient#324, amount#326);
	#330 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_40.sol", 258, 1} {:message "ERC20::bug_unchk_send3"} bug_unchk_send3#355(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 259, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return13:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 264, 9} {:message "ERC20::allowance"} allowance#373(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#358: address_t, spender#360: address_t)
	returns (#364: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#364 := _allowances#256[__this][owner#358][spender#360];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_40.sol", 267, 1} {:message "ERC20::bug_unchk_send9"} bug_unchk_send9#386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 268, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 277, 9} {:message "ERC20::approve"} approve#407(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#389: address_t, value#391: int)
	returns (#395: bool)
{
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 278, 9} {:message ""} true;
	call _approve#787(__this, __msg_sender, __msg_value, call_arg#18, spender#389, value#391);
	#395 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_40.sol", 281, 1} {:message "ERC20::bug_unchk_send25"} bug_unchk_send25#420(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 282, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 296, 9} {:message "ERC20::transferFrom"} transferFrom#457(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#423: address_t, recipient#425: address_t, amount#427: int)
	returns (#431: bool)
{
	var call_arg#20: address_t;
	var sub#54_ret#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 297, 9} {:message ""} true;
	call _transfer#611(__this, __msg_sender, __msg_value, sender#423, recipient#425, amount#427);
	call_arg#20 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 298, 38} {:message ""} true;
	call sub#54_ret#21 := sub#54(__this, __msg_sender, __msg_value, _allowances#256[__this][sender#423][__msg_sender], amount#427);
	assume {:sourceloc "buggy_40.sol", 298, 9} {:message ""} true;
	call _approve#787(__this, __msg_sender, __msg_value, sender#423, call_arg#20, sub#54_ret#21);
	#431 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_40.sol", 301, 1} {:message "ERC20::bug_unchk_send19"} bug_unchk_send19#470(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 302, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 316, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#498(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#473: address_t, addedValue#475: int)
	returns (#478: bool)
{
	var call_arg#23: address_t;
	var add#28_ret#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 317, 39} {:message ""} true;
	call add#28_ret#24 := add#28(__this, __msg_sender, __msg_value, _allowances#256[__this][__msg_sender][spender#473], addedValue#475);
	assume {:sourceloc "buggy_40.sol", 317, 9} {:message ""} true;
	call _approve#787(__this, __msg_sender, __msg_value, call_arg#23, spender#473, add#28_ret#24);
	#478 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_40.sol", 320, 1} {:message "ERC20::bug_unchk_send26"} bug_unchk_send26#511(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 321, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 337, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#539(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#514: address_t, subtractedValue#516: int)
	returns (#519: bool)
{
	var call_arg#26: address_t;
	var sub#54_ret#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 338, 39} {:message ""} true;
	call sub#54_ret#27 := sub#54(__this, __msg_sender, __msg_value, _allowances#256[__this][__msg_sender][spender#514], subtractedValue#516);
	assume {:sourceloc "buggy_40.sol", 338, 9} {:message ""} true;
	call _approve#787(__this, __msg_sender, __msg_value, call_arg#26, spender#514, sub#54_ret#27);
	#519 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_40.sol", 341, 1} {:message "ERC20::bug_unchk_send20"} bug_unchk_send20#552(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 342, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 358, 5} {:message "ERC20::_transfer"} _transfer#611(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#555: address_t, recipient#557: address_t, amount#559: int)
{
	var call_arg#29: int_arr_ptr;
	var new_array#30: int_arr_ptr;
	var call_arg#31: int_arr_ptr;
	var new_array#32: int_arr_ptr;
	var sub#54_ret#33: int;
	var add#28_ret#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#30 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#29 := new_array#30;
	mem_arr_int := mem_arr_int[call_arg#29 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#555 != 0);
	new_array#32 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#31 := new_array#32;
	mem_arr_int := mem_arr_int[call_arg#31 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#557 != 0);
	assume {:sourceloc "buggy_40.sol", 362, 29} {:message ""} true;
	call sub#54_ret#33 := sub#54(__this, __msg_sender, __msg_value, _balances#237[__this][sender#555], amount#559);
	_balances#237 := _balances#237[__this := _balances#237[__this][sender#555 := sub#54_ret#33]];
	assume {:sourceloc "buggy_40.sol", 363, 32} {:message ""} true;
	call add#28_ret#34 := add#28(__this, __msg_sender, __msg_value, _balances#237[__this][recipient#557], amount#559);
	_balances#237 := _balances#237[__this := _balances#237[__this][recipient#557 := add#28_ret#34]];
	assume {:sourceloc "buggy_40.sol", 364, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, sender#555, recipient#557, amount#559);
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_40.sol", 366, 1} {:message "ERC20::bug_unchk_send32"} bug_unchk_send32#624(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#35 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 367, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#35);
	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 378, 5} {:message "ERC20::_mint"} _mint#670(__this: address_t, __msg_sender: address_t, __msg_value: int, account#627: address_t, amount#629: int)
{
	var call_arg#36: int_arr_ptr;
	var new_array#37: int_arr_ptr;
	var add#28_ret#38: int;
	var add#28_ret#39: int;
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#37 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#36 := new_array#37;
	mem_arr_int := mem_arr_int[call_arg#36 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#627 != 0);
	assume {:sourceloc "buggy_40.sol", 381, 24} {:message ""} true;
	call add#28_ret#38 := add#28(__this, __msg_sender, __msg_value, _totalSupply#271[__this], amount#629);
	_totalSupply#271 := _totalSupply#271[__this := add#28_ret#38];
	assume {:sourceloc "buggy_40.sol", 382, 30} {:message ""} true;
	call add#28_ret#39 := add#28(__this, __msg_sender, __msg_value, _balances#237[__this][account#627], amount#629);
	_balances#237 := _balances#237[__this := _balances#237[__this][account#627 := add#28_ret#39]];
	call_arg#40 := 0;
	assume {:sourceloc "buggy_40.sol", 383, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, call_arg#40, account#627, amount#629);
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_40.sol", 385, 1} {:message "ERC20::bug_unchk_send4"} bug_unchk_send4#683(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 386, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#41);
	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 399, 5} {:message "ERC20::_burn"} _burn#729(__this: address_t, __msg_sender: address_t, __msg_value: int, account#686: address_t, value#688: int)
{
	var call_arg#42: int_arr_ptr;
	var new_array#43: int_arr_ptr;
	var sub#54_ret#44: int;
	var sub#54_ret#45: int;
	var call_arg#46: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#42 := new_array#43;
	mem_arr_int := mem_arr_int[call_arg#42 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#686 != 0);
	assume {:sourceloc "buggy_40.sol", 402, 24} {:message ""} true;
	call sub#54_ret#44 := sub#54(__this, __msg_sender, __msg_value, _totalSupply#271[__this], value#688);
	_totalSupply#271 := _totalSupply#271[__this := sub#54_ret#44];
	assume {:sourceloc "buggy_40.sol", 403, 30} {:message ""} true;
	call sub#54_ret#45 := sub#54(__this, __msg_sender, __msg_value, _balances#237[__this][account#686], value#688);
	_balances#237 := _balances#237[__this := _balances#237[__this][account#686 := sub#54_ret#45]];
	call_arg#46 := 0;
	assume {:sourceloc "buggy_40.sol", 404, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, account#686, call_arg#46, value#688);
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_40.sol", 406, 1} {:message "ERC20::bug_unchk_send7"} bug_unchk_send7#742(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#47: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#47 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 407, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#47);
	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 422, 5} {:message "ERC20::_approve"} _approve#787(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#745: address_t, spender#747: address_t, value#749: int)
{
	var call_arg#48: int_arr_ptr;
	var new_array#49: int_arr_ptr;
	var call_arg#50: int_arr_ptr;
	var new_array#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#49 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#48 := new_array#49;
	mem_arr_int := mem_arr_int[call_arg#48 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#745 != 0);
	new_array#51 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#50 := new_array#51;
	mem_arr_int := mem_arr_int[call_arg#50 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#747 != 0);
	_allowances#256 := _allowances#256[__this := _allowances#256[__this][owner#745 := _allowances#256[__this][owner#745][spender#747 := value#749]]];
	assume {:sourceloc "buggy_40.sol", 427, 14} {:message ""} true;
	call Approval#213(__this, __msg_sender, __msg_value, owner#745, spender#747, value#749);
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_40.sol", 429, 1} {:message "ERC20::bug_unchk_send23"} bug_unchk_send23#800(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#52: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#52 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 430, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#52);
	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 438, 5} {:message "ERC20::_burnFrom"} _burnFrom#829(__this: address_t, __msg_sender: address_t, __msg_value: int, account#803: address_t, amount#805: int)
{
	var call_arg#53: address_t;
	var sub#54_ret#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 439, 9} {:message ""} true;
	call _burn#729(__this, __msg_sender, __msg_value, account#803, amount#805);
	call_arg#53 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 440, 39} {:message ""} true;
	call sub#54_ret#54 := sub#54(__this, __msg_sender, __msg_value, _allowances#256[__this][account#803][__msg_sender], amount#805);
	assume {:sourceloc "buggy_40.sol", 440, 9} {:message ""} true;
	call _approve#787(__this, __msg_sender, __msg_value, account#803, call_arg#53, sub#54_ret#54);
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_40.sol", 442, 1} {:message "ERC20::bug_unchk_send14"} bug_unchk_send14#842(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#55: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#55 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 443, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#55);
	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_40.sol", 213, 1} {:message "ERC20::[implicit_constructor]"} __constructor#843(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_balances#237 := _balances#237[__this := default_address_t_int()];
	_allowances#256 := _allowances#256[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#271 := _totalSupply#271[__this := 0];
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_40.sol", 450, 3} {:message "ERC20Detailed::bug_unchk_send12"} bug_unchk_send12#859(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#56: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#56 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 451, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#56);
	$return34:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_40.sol", 452, 3} {:message "_name"} _name#861: [address_t]int_arr_type;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_40.sol", 453, 3} {:message "ERC20Detailed::bug_unchk_send11"} bug_unchk_send11#874(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#57: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#57 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 454, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#57);
	$return35:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_40.sol", 455, 3} {:message "_symbol"} _symbol#876: [address_t]int_arr_type;
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_40.sol", 456, 3} {:message "ERC20Detailed::bug_unchk_send1"} bug_unchk_send1#889(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#58: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#58 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 457, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#58);
	$return36:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_40.sol", 458, 3} {:message "_decimals"} _decimals#891: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 465, 5} {:message "ERC20Detailed::[constructor]"} __constructor#994(__this: address_t, __msg_sender: address_t, __msg_value: int, name#894: int_arr_ptr, symbol#896: int_arr_ptr, decimals#898: int)
{
	// TCC assumptions
	assume (name#894 < __alloc_counter);
	assume (symbol#896 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#861 := _name#861[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#876 := _symbol#876[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#891 := _decimals#891[__this := 0];
	// Function body starts here
	_name#861 := _name#861[__this := mem_arr_int[name#894]];
	_symbol#876 := _symbol#876[__this := mem_arr_int[symbol#896]];
	_decimals#891 := _decimals#891[__this := decimals#898];
	$return37:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_40.sol", 470, 1} {:message "ERC20Detailed::bug_unchk_send30"} bug_unchk_send30#927(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#59 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 471, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#59);
	$return38:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 476, 5} {:message "ERC20Detailed::name"} name#936(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#931: int_arr_ptr)
{
	var new_array#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#60 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#931 := new_array#60;
	mem_arr_int := mem_arr_int[#931 := _name#861[__this]];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_40.sol", 479, 1} {:message "ERC20Detailed::bug_unchk_send8"} bug_unchk_send8#949(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#61: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#61 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 480, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#61);
	$return40:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 486, 5} {:message "ERC20Detailed::symbol"} symbol#958(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#953: int_arr_ptr)
{
	var new_array#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#62 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#953 := new_array#62;
	mem_arr_int := mem_arr_int[#953 := _symbol#876[__this]];
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_40.sol", 489, 1} {:message "ERC20Detailed::bug_unchk_send27"} bug_unchk_send27#971(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#63: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#63 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 490, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#63);
	$return42:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_40.sol", 504, 5} {:message "ERC20Detailed::decimals"} decimals#980(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#975: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#975 := _decimals#891[__this];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_40.sol", 507, 1} {:message "ERC20Detailed::bug_unchk_send31"} bug_unchk_send31#993(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#64: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#64 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 508, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#64);
	$return44:
	// Function body ends here
}

// 
// ------- Contract: SimpleSwapCoin -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 512, 5} {:message "SimpleSwapCoin::[constructor]"} __constructor#1035(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1000: int_arr_ptr, _symbol#1002: int_arr_ptr, _decimals#1004: int)
{
	var name#894#65: int_arr_ptr;
	var symbol#896#65: int_arr_ptr;
	var decimals#898#65: int;
	var call_arg#67: address_t;
	var call_arg#68: int;
	// TCC assumptions
	assume (_name#1000 < __alloc_counter);
	assume (_symbol#1002 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#861 := _name#861[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#876 := _symbol#876[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#891 := _decimals#891[__this := 0];
	_balances#237 := _balances#237[__this := default_address_t_int()];
	_allowances#256 := _allowances#256[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#271 := _totalSupply#271[__this := 0];
	// Arguments for ERC20Detailed
	name#894#65 := _name#1000;
	symbol#896#65 := _symbol#1002;
	decimals#898#65 := _decimals#1004;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#861 := _name#861[__this := mem_arr_int[name#894#65]];
	_symbol#876 := _symbol#876[__this := mem_arr_int[symbol#896#65]];
	_decimals#891 := _decimals#891[__this := decimals#898#65];
	$return45:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#67 := __msg_sender;
	call_arg#68 := 10000000000000000;
	assume {:sourceloc "buggy_40.sol", 513, 9} {:message ""} true;
	call _mint#670(__this, __msg_sender, __msg_value, call_arg#67, call_arg#68);
	$return46:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_40.sol", 515, 1} {:message "SimpleSwapCoin::bug_unchk_send13"} bug_unchk_send13#1034(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#69: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#69 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 516, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#69);
	$return47:
	// Function body ends here
}

