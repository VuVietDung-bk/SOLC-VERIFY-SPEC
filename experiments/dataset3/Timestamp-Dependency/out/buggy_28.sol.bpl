// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_28.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_28.sol", 15, 3} {:message "[event] IERC20::Transfer"} Transfer#59(__this: address_t, __msg_sender: address_t, __msg_value: int, from#53: address_t, to#55: address_t, value#57: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_28.sol", 16, 3} {:message "[event] IERC20::Approval"} Approval#67(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#61: address_t, spender#63: address_t, value#65: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_28.sol", 8, 3} {:message "IERC20::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_28.sol", 9, 3} {:message "IERC20::balanceOf"} balanceOf#13(__this: address_t, __msg_sender: address_t, __msg_value: int, who#8: address_t)
	returns (#11: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_28.sol", 10, 3} {:message "IERC20::allowance"} allowance#22(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#15: address_t, spender#17: address_t)
	returns (#20: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_28.sol", 11, 3} {:message "IERC20::transfer"} transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_28.sol", 12, 3} {:message "IERC20::approve"} approve#40(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#33: address_t, value#35: int)
	returns (#38: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_28.sol", 13, 3} {:message "IERC20::transferFrom"} transferFrom#51(__this: address_t, __msg_sender: address_t, __msg_value: int, from#42: address_t, to#44: address_t, value#46: int)
	returns (#49: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_28.sol", 7, 1} {:message "IERC20::[implicit_constructor]"} __constructor#68(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 20, 3} {:message "SafeMath::mul"} mul#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#70: int, b#72: int)
	returns (#75: int)
{
	var {:sourceloc "buggy_28.sol", 24, 5} {:message "c"} c#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#70 == 0)) {
	#75 := 0;
	goto $return0;
	}

	c#85 := (a#70 * b#72);
	assert {:sourceloc "buggy_28.sol", 25, 5} {:message "Assertion might not hold."} ((c#85 div a#70) == b#72);
	#75 := c#85;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 29, 3} {:message "SafeMath::div"} div#119(__this: address_t, __msg_sender: address_t, __msg_value: int, a#103: int, b#105: int)
	returns (#108: int)
{
	var {:sourceloc "buggy_28.sol", 30, 5} {:message "c"} c#111: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#111 := (a#103 div b#105);
	#108 := c#111;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 34, 3} {:message "SafeMath::sub"} sub#139(__this: address_t, __msg_sender: address_t, __msg_value: int, a#121: int, b#123: int)
	returns (#126: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_28.sol", 35, 5} {:message "Assertion might not hold."} (b#123 <= a#121);
	#126 := (a#121 - b#123);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 39, 3} {:message "SafeMath::add"} add#163(__this: address_t, __msg_sender: address_t, __msg_value: int, a#141: int, b#143: int)
	returns (#146: int)
{
	var {:sourceloc "buggy_28.sol", 40, 5} {:message "c"} c#149: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#149 := (a#141 + b#143);
	assert {:sourceloc "buggy_28.sol", 41, 5} {:message "Assertion might not hold."} (c#149 >= a#141);
	#146 := c#149;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 45, 3} {:message "SafeMath::ceil"} ceil#195(__this: address_t, __msg_sender: address_t, __msg_value: int, a#165: int, m#167: int)
	returns (#170: int)
{
	var {:sourceloc "buggy_28.sol", 46, 5} {:message "c"} c#173: int;
	var add#163_ret#0: int;
	var {:sourceloc "buggy_28.sol", 47, 5} {:message "d"} d#180: int;
	var call_arg#1: int;
	var sub#139_ret#2: int;
	var div#119_ret#3: int;
	var mul#101_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 46, 17} {:message ""} true;
	call add#163_ret#0 := add#163(__this, __msg_sender, __msg_value, a#165, m#167);
	c#173 := add#163_ret#0;
	call_arg#1 := 1;
	assume {:sourceloc "buggy_28.sol", 47, 17} {:message ""} true;
	call sub#139_ret#2 := sub#139(__this, __msg_sender, __msg_value, c#173, call_arg#1);
	d#180 := sub#139_ret#2;
	assume {:sourceloc "buggy_28.sol", 48, 16} {:message ""} true;
	call div#119_ret#3 := div#119(__this, __msg_sender, __msg_value, d#180, m#167);
	assume {:sourceloc "buggy_28.sol", 48, 12} {:message ""} true;
	call mul#101_ret#4 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#3, m#167);
	#170 := mul#101_ret#4;
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_28.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_28.sol", 54, 1} {:message "ERC20Detailed::bug_tmstmp17"} bug_tmstmp17#209(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#201: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#201 := (__block_timestamp >= 1546300800);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_28.sol", 57, 3} {:message "_name"} _name#211: [address_t]int_arr_type;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_28.sol", 58, 1} {:message "ERC20Detailed::bug_tmstmp37"} bug_tmstmp37#222(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#214: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#214 := (__block_timestamp >= 1546300800);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_28.sol", 61, 3} {:message "_symbol"} _symbol#224: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_28.sol", 62, 1} {:message "winner_tmstmp3"} winner_tmstmp3#226: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 63, 1} {:message "ERC20Detailed::play_tmstmp3"} play_tmstmp3#252(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#228: int)
{
	var {:sourceloc "buggy_28.sol", 64, 2} {:message "_vtime"} _vtime#232: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#232 := __block_timestamp;
	if (((startTime#228 + 432000) == _vtime#232)) {
	winner_tmstmp3#226 := winner_tmstmp3#226[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_28.sol", 67, 3} {:message "_decimals"} _decimals#254: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_28.sol", 69, 3} {:message "ERC20Detailed::[constructor]"} __constructor#428(__this: address_t, __msg_sender: address_t, __msg_value: int, name#256: int_arr_ptr, symbol#258: int_arr_ptr, decimals#260: int)
{
	// TCC assumptions
	assume (name#256 < __alloc_counter);
	assume (symbol#258 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#211 := _name#211[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#224 := _symbol#224[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp3#226 := winner_tmstmp3#226[__this := 0];
	_decimals#254 := _decimals#254[__this := 0];
	winner_tmstmp7#333 := winner_tmstmp7#333[__this := 0];
	winner_tmstmp23#369 := winner_tmstmp23#369[__this := 0];
	winner_tmstmp14#405 := winner_tmstmp14#405[__this := 0];
	// Function body starts here
	_name#211 := _name#211[__this := mem_arr_int[name#256]];
	_symbol#224 := _symbol#224[__this := mem_arr_int[symbol#258]];
	_decimals#254 := _decimals#254[__this := decimals#260];
	$return8:
	// Function body ends here
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_28.sol", 74, 1} {:message "ERC20Detailed::bug_tmstmp4"} bug_tmstmp4#323(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 75, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#280: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#280 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#280);
	pastBlockTime_tmstmp4#280 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_28.sol", 80, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_28.sol", 84, 3} {:message "ERC20Detailed::name"} name#331(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#326: int_arr_ptr)
{
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#326 := new_array#5;
	mem_arr_int := mem_arr_int[#326 := _name#211[__this]];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_28.sol", 87, 1} {:message "winner_tmstmp7"} winner_tmstmp7#333: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 88, 1} {:message "ERC20Detailed::play_tmstmp7"} play_tmstmp7#359(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#335: int)
{
	var {:sourceloc "buggy_28.sol", 89, 2} {:message "_vtime"} _vtime#339: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#339 := __block_timestamp;
	if (((startTime#335 + 432000) == _vtime#339)) {
	winner_tmstmp7#333 := winner_tmstmp7#333[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_28.sol", 93, 3} {:message "ERC20Detailed::symbol"} symbol#367(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#362: int_arr_ptr)
{
	var new_array#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#6 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#362 := new_array#6;
	mem_arr_int := mem_arr_int[#362 := _symbol#224[__this]];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_28.sol", 96, 1} {:message "winner_tmstmp23"} winner_tmstmp23#369: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 97, 1} {:message "ERC20Detailed::play_tmstmp23"} play_tmstmp23#395(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#371: int)
{
	var {:sourceloc "buggy_28.sol", 98, 2} {:message "_vtime"} _vtime#375: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#375 := __block_timestamp;
	if (((startTime#371 + 432000) == _vtime#375)) {
	winner_tmstmp23#369 := winner_tmstmp23#369[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_28.sol", 102, 3} {:message "ERC20Detailed::decimals"} decimals#403(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#398: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#398 := _decimals#254[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_28.sol", 105, 1} {:message "winner_tmstmp14"} winner_tmstmp14#405: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 106, 1} {:message "ERC20Detailed::play_tmstmp14"} play_tmstmp14#427(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#407: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#407 + 432000) == __block_timestamp)) {
	winner_tmstmp14#405 := winner_tmstmp14#405[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// ------- Contract: HYDROGEN -------
// Inherits from: ERC20Detailed
// Using library SafeMath for uint256
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_28.sol", 114, 1} {:message "HYDROGEN::bug_tmstmp9"} bug_tmstmp9#444(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#436: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#436 := (__block_timestamp >= 1546300800);
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 117, 3} {:message "_balances"} _balances#448: [address_t][address_t]int;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_28.sol", 118, 1} {:message "HYDROGEN::bug_tmstmp25"} bug_tmstmp25#459(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#451: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#451 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_28.sol", 121, 3} {:message "_allowed"} _allowed#465: [address_t][address_t][address_t]int;
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_28.sol", 123, 1} {:message "winner_tmstmp19"} winner_tmstmp19#467: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 124, 1} {:message "HYDROGEN::play_tmstmp19"} play_tmstmp19#493(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#469: int)
{
	var {:sourceloc "buggy_28.sol", 125, 2} {:message "_vtime"} _vtime#473: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#473 := __block_timestamp;
	if (((startTime#469 + 432000) == _vtime#473)) {
	winner_tmstmp19#467 := winner_tmstmp19#467[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_28.sol", 129, 1} {:message "winner_tmstmp26"} winner_tmstmp26#498: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 130, 1} {:message "HYDROGEN::play_tmstmp26"} play_tmstmp26#520(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#500: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#500 + 432000) == __block_timestamp)) {
	winner_tmstmp26#498 := winner_tmstmp26#498[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_28.sol", 134, 1} {:message "HYDROGEN::bug_tmstmp20"} bug_tmstmp20#570(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 135, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#527: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#527 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#527);
	pastBlockTime_tmstmp20#527 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_28.sol", 140, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return20:
	// Function body ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_28.sol", 144, 1} {:message "HYDROGEN::bug_tmstmp32"} bug_tmstmp32#620(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 145, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#577: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#577 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#577);
	pastBlockTime_tmstmp32#577 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_28.sol", 150, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return21:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_28.sol", 153, 3} {:message "_totalSupply"} _totalSupply#623: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_28.sol", 154, 1} {:message "winner_tmstmp38"} winner_tmstmp38#625: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 155, 1} {:message "HYDROGEN::play_tmstmp38"} play_tmstmp38#647(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#627: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#627 + 432000) == __block_timestamp)) {
	winner_tmstmp38#625 := winner_tmstmp38#625[__this := __msg_sender];
	}

	$return22:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_28.sol", 158, 3} {:message "basePercent"} basePercent#650: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_28.sol", 160, 3} {:message "HYDROGEN::[constructor]"} __constructor#1574(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#652: int_arr_ptr, _symbol#654: int_arr_ptr, _decimals#656: int)
{
	var name#256#7: int_arr_ptr;
	var symbol#258#7: int_arr_ptr;
	var decimals#260#7: int;
	var call_arg#9: address_t;
	// TCC assumptions
	assume (_name#652 < __alloc_counter);
	assume (_symbol#654 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#448 := _balances#448[__this := default_address_t_int()];
	_allowed#465 := _allowed#465[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp19#467 := winner_tmstmp19#467[__this := 0];
	winner_tmstmp26#498 := winner_tmstmp26#498[__this := 0];
	_totalSupply#623 := _totalSupply#623[__this := 8000000000];
	winner_tmstmp38#625 := winner_tmstmp38#625[__this := 0];
	basePercent#650 := basePercent#650[__this := 100];
	winner_tmstmp30#673 := winner_tmstmp30#673[__this := 0];
	winner_tmstmp39#766 := winner_tmstmp39#766[__this := 0];
	winner_tmstmp35#885 := winner_tmstmp35#885[__this := 0];
	winner_tmstmp27#1133 := winner_tmstmp27#1133[__this := 0];
	winner_tmstmp31#1278 := winner_tmstmp31#1278[__this := 0];
	bugv_tmstmp5#1421 := bugv_tmstmp5#1421[__this := __block_timestamp];
	bugv_tmstmp1#1459 := bugv_tmstmp1#1459[__this := __block_timestamp];
	bugv_tmstmp2#1475 := bugv_tmstmp2#1475[__this := __block_timestamp];
	bugv_tmstmp3#1528 := bugv_tmstmp3#1528[__this := __block_timestamp];
	bugv_tmstmp4#1573 := bugv_tmstmp4#1573[__this := __block_timestamp];
	_name#211 := _name#211[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#224 := _symbol#224[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp3#226 := winner_tmstmp3#226[__this := 0];
	_decimals#254 := _decimals#254[__this := 0];
	winner_tmstmp7#333 := winner_tmstmp7#333[__this := 0];
	winner_tmstmp23#369 := winner_tmstmp23#369[__this := 0];
	winner_tmstmp14#405 := winner_tmstmp14#405[__this := 0];
	// Arguments for ERC20Detailed
	name#256#7 := _name#652;
	symbol#258#7 := _symbol#654;
	decimals#260#7 := _decimals#656;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#211 := _name#211[__this := mem_arr_int[name#256#7]];
	_symbol#224 := _symbol#224[__this := mem_arr_int[symbol#258#7]];
	_decimals#254 := _decimals#254[__this := decimals#260#7];
	$return23:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#9 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 161, 5} {:message ""} true;
	call _mint#1455(__this, __msg_sender, __msg_value, call_arg#9, _totalSupply#623[__this]);
	$return24:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_28.sol", 163, 1} {:message "winner_tmstmp30"} winner_tmstmp30#673: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 164, 1} {:message "HYDROGEN::play_tmstmp30"} play_tmstmp30#695(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#675: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#675 + 432000) == __block_timestamp)) {
	winner_tmstmp30#673 := winner_tmstmp30#673[__this := __msg_sender];
	}

	$return25:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 168, 3} {:message "HYDROGEN::totalSupply"} totalSupply#704(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#699: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#699 := _totalSupply#623[__this];
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_28.sol", 171, 1} {:message "HYDROGEN::bug_tmstmp8"} bug_tmstmp8#751(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 172, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#708: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#708 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#708);
	pastBlockTime_tmstmp8#708 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_28.sol", 177, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return27:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 181, 3} {:message "HYDROGEN::balanceOf"} balanceOf#764(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#753: address_t)
	returns (#757: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#757 := _balances#448[__this][owner#753];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_28.sol", 184, 1} {:message "winner_tmstmp39"} winner_tmstmp39#766: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 185, 1} {:message "HYDROGEN::play_tmstmp39"} play_tmstmp39#792(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#768: int)
{
	var {:sourceloc "buggy_28.sol", 186, 2} {:message "_vtime"} _vtime#772: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#772 := __block_timestamp;
	if (((startTime#768 + 432000) == _vtime#772)) {
	winner_tmstmp39#766 := winner_tmstmp39#766[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 190, 3} {:message "HYDROGEN::allowance"} allowance#809(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#794: address_t, spender#796: address_t)
	returns (#800: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#800 := _allowed#465[__this][owner#794][spender#796];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_28.sol", 193, 1} {:message "HYDROGEN::bug_tmstmp36"} bug_tmstmp36#856(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 194, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#813: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#813 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#813);
	pastBlockTime_tmstmp36#813 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_28.sol", 199, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return31:
	// Function body ends here
}

// 
// Function: findtwoPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 203, 3} {:message "HYDROGEN::findtwoPercent"} findtwoPercent#883(__this: address_t, __msg_sender: address_t, __msg_value: int, value#858: int)
	returns (#861: int)
{
	var {:sourceloc "buggy_28.sol", 204, 5} {:message "roundValue"} roundValue#864: int;
	var ceil#195_ret#10: int;
	var {:sourceloc "buggy_28.sol", 205, 5} {:message "twoPercent"} twoPercent#871: int;
	var mul#101_ret#11: int;
	var call_arg#12: int;
	var div#119_ret#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 204, 26} {:message ""} true;
	call ceil#195_ret#10 := ceil#195(__this, __msg_sender, __msg_value, value#858, basePercent#650[__this]);
	roundValue#864 := ceil#195_ret#10;
	assume {:sourceloc "buggy_28.sol", 205, 26} {:message ""} true;
	call mul#101_ret#11 := mul#101(__this, __msg_sender, __msg_value, roundValue#864, basePercent#650[__this]);
	call_arg#12 := 5000;
	assume {:sourceloc "buggy_28.sol", 205, 26} {:message ""} true;
	call div#119_ret#13 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#11, call_arg#12);
	twoPercent#871 := div#119_ret#13;
	#861 := twoPercent#871;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_28.sol", 208, 1} {:message "winner_tmstmp35"} winner_tmstmp35#885: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 209, 1} {:message "HYDROGEN::play_tmstmp35"} play_tmstmp35#911(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#887: int)
{
	var {:sourceloc "buggy_28.sol", 210, 2} {:message "_vtime"} _vtime#891: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#891 := __block_timestamp;
	if (((startTime#887 + 432000) == _vtime#891)) {
	winner_tmstmp35#885 := winner_tmstmp35#885[__this := __msg_sender];
	}

	$return33:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 214, 3} {:message "HYDROGEN::transfer"} transfer#1003(__this: address_t, __msg_sender: address_t, __msg_value: int, to#913: address_t, value#915: int)
	returns (#919: bool)
{
	var {:sourceloc "buggy_28.sol", 218, 5} {:message "tokensToBurn"} tokensToBurn#940: int;
	var findtwoPercent#883_ret#14: int;
	var {:sourceloc "buggy_28.sol", 219, 5} {:message "tokensToTransfer"} tokensToTransfer#946: int;
	var sub#139_ret#15: int;
	var sub#139_ret#16: int;
	var add#163_ret#17: int;
	var sub#139_ret#18: int;
	var call_arg#19: address_t;
	var call_arg#20: address_t;
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#915 <= _balances#448[__this][__msg_sender]);
	assume (to#913 != 0);
	assume {:sourceloc "buggy_28.sol", 218, 28} {:message ""} true;
	call findtwoPercent#883_ret#14 := findtwoPercent#883(__this, __msg_sender, __msg_value, value#915);
	tokensToBurn#940 := findtwoPercent#883_ret#14;
	assume {:sourceloc "buggy_28.sol", 219, 32} {:message ""} true;
	call sub#139_ret#15 := sub#139(__this, __msg_sender, __msg_value, value#915, tokensToBurn#940);
	tokensToTransfer#946 := sub#139_ret#15;
	assume {:sourceloc "buggy_28.sol", 221, 29} {:message ""} true;
	call sub#139_ret#16 := sub#139(__this, __msg_sender, __msg_value, _balances#448[__this][__msg_sender], value#915);
	_balances#448 := _balances#448[__this := _balances#448[__this][__msg_sender := sub#139_ret#16]];
	assume {:sourceloc "buggy_28.sol", 222, 21} {:message ""} true;
	call add#163_ret#17 := add#163(__this, __msg_sender, __msg_value, _balances#448[__this][to#913], tokensToTransfer#946);
	_balances#448 := _balances#448[__this := _balances#448[__this][to#913 := add#163_ret#17]];
	assume {:sourceloc "buggy_28.sol", 224, 20} {:message ""} true;
	call sub#139_ret#18 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#623[__this], tokensToBurn#940);
	_totalSupply#623 := _totalSupply#623[__this := sub#139_ret#18];
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 226, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#19, to#913, tokensToTransfer#946);
	call_arg#20 := __msg_sender;
	call_arg#21 := 0;
	assume {:sourceloc "buggy_28.sol", 227, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#20, call_arg#21, tokensToBurn#940);
	#919 := true;
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_28.sol", 230, 1} {:message "HYDROGEN::bug_tmstmp40"} bug_tmstmp40#1050(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 231, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1007: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1007 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1007);
	pastBlockTime_tmstmp40#1007 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_28.sol", 236, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return35:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_28.sol", 240, 3} {:message "HYDROGEN::multiTransfer"} multiTransfer#1082(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1053: address_t_arr_ptr, amounts#1056: int_arr_ptr)
{
	var {:sourceloc "buggy_28.sol", 241, 10} {:message "i"} i#1060: int;
	var transfer#1003_ret#24: bool;
	var tmp#25: int;
	// TCC assumptions
	assume (receivers#1053 < __alloc_counter);
	assume (amounts#1056 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1060 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1053])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1053]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1060 < length#address_t_arr#constr(mem_arr_address_t[receivers#1053]))) {
	// Body
	assume {:sourceloc "buggy_28.sol", 242, 7} {:message ""} true;
	call transfer#1003_ret#24 := transfer#1003(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1053])[i#1060], arr#int_arr#constr(mem_arr_int[amounts#1056])[i#1060]);
	$continue22:
	// Loop expression
	tmp#25 := i#1060;
	i#1060 := (i#1060 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1053])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1053]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break23:
	$return36:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_28.sol", 245, 1} {:message "HYDROGEN::bug_tmstmp33"} bug_tmstmp33#1093(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1085: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1085 := (__block_timestamp >= 1546300800);
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 249, 3} {:message "HYDROGEN::approve"} approve#1131(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1095: address_t, value#1097: int)
	returns (#1101: bool)
{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1095 != 0);
	_allowed#465 := _allowed#465[__this := _allowed#465[__this][__msg_sender := _allowed#465[__this][__msg_sender][spender#1095 := value#1097]]];
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 252, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#26, spender#1095, value#1097);
	#1101 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_28.sol", 255, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1133: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 256, 1} {:message "HYDROGEN::play_tmstmp27"} play_tmstmp27#1159(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1135: int)
{
	var {:sourceloc "buggy_28.sol", 257, 2} {:message "_vtime"} _vtime#1139: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1139 := __block_timestamp;
	if (((startTime#1135 + 432000) == _vtime#1139)) {
	winner_tmstmp27#1133 := winner_tmstmp27#1133[__this := __msg_sender];
	}

	$return39:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 261, 3} {:message "HYDROGEN::transferFrom"} transferFrom#1276(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1161: address_t, to#1163: address_t, value#1165: int)
	returns (#1169: bool)
{
	var sub#139_ret#27: int;
	var {:sourceloc "buggy_28.sol", 268, 5} {:message "tokensToBurn"} tokensToBurn#1211: int;
	var findtwoPercent#883_ret#28: int;
	var {:sourceloc "buggy_28.sol", 269, 5} {:message "tokensToTransfer"} tokensToTransfer#1217: int;
	var sub#139_ret#29: int;
	var add#163_ret#30: int;
	var sub#139_ret#31: int;
	var sub#139_ret#32: int;
	var call_arg#33: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1165 <= _balances#448[__this][from#1161]);
	assume (value#1165 <= _allowed#465[__this][from#1161][__msg_sender]);
	assume (to#1163 != 0);
	assume {:sourceloc "buggy_28.sol", 266, 23} {:message ""} true;
	call sub#139_ret#27 := sub#139(__this, __msg_sender, __msg_value, _balances#448[__this][from#1161], value#1165);
	_balances#448 := _balances#448[__this := _balances#448[__this][from#1161 := sub#139_ret#27]];
	assume {:sourceloc "buggy_28.sol", 268, 28} {:message ""} true;
	call findtwoPercent#883_ret#28 := findtwoPercent#883(__this, __msg_sender, __msg_value, value#1165);
	tokensToBurn#1211 := findtwoPercent#883_ret#28;
	assume {:sourceloc "buggy_28.sol", 269, 32} {:message ""} true;
	call sub#139_ret#29 := sub#139(__this, __msg_sender, __msg_value, value#1165, tokensToBurn#1211);
	tokensToTransfer#1217 := sub#139_ret#29;
	assume {:sourceloc "buggy_28.sol", 271, 21} {:message ""} true;
	call add#163_ret#30 := add#163(__this, __msg_sender, __msg_value, _balances#448[__this][to#1163], tokensToTransfer#1217);
	_balances#448 := _balances#448[__this := _balances#448[__this][to#1163 := add#163_ret#30]];
	assume {:sourceloc "buggy_28.sol", 272, 20} {:message ""} true;
	call sub#139_ret#31 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#623[__this], tokensToBurn#1211);
	_totalSupply#623 := _totalSupply#623[__this := sub#139_ret#31];
	assume {:sourceloc "buggy_28.sol", 274, 34} {:message ""} true;
	call sub#139_ret#32 := sub#139(__this, __msg_sender, __msg_value, _allowed#465[__this][from#1161][__msg_sender], value#1165);
	_allowed#465 := _allowed#465[__this := _allowed#465[__this][from#1161 := _allowed#465[__this][from#1161][__msg_sender := sub#139_ret#32]]];
	assume {:sourceloc "buggy_28.sol", 276, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1161, to#1163, tokensToTransfer#1217);
	call_arg#33 := 0;
	assume {:sourceloc "buggy_28.sol", 277, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1161, call_arg#33, tokensToBurn#1211);
	#1169 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_28.sol", 281, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1278: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 282, 1} {:message "HYDROGEN::play_tmstmp31"} play_tmstmp31#1304(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1280: int)
{
	var {:sourceloc "buggy_28.sol", 283, 2} {:message "_vtime"} _vtime#1284: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1284 := __block_timestamp;
	if (((startTime#1280 + 432000) == _vtime#1284)) {
	winner_tmstmp31#1278 := winner_tmstmp31#1278[__this := __msg_sender];
	}

	$return41:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 287, 3} {:message "HYDROGEN::increaseAllowance"} increaseAllowance#1355(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1306: address_t, addedValue#1308: int)
	returns (#1311: bool)
{
	var add#163_ret#34: int;
	var call_arg#35: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1306 != 0);
	assume {:sourceloc "buggy_28.sol", 289, 38} {:message ""} true;
	call add#163_ret#34 := add#163(__this, __msg_sender, __msg_value, _allowed#465[__this][__msg_sender][spender#1306], addedValue#1308);
	_allowed#465 := _allowed#465[__this := _allowed#465[__this][__msg_sender := _allowed#465[__this][__msg_sender][spender#1306 := add#163_ret#34]]];
	call_arg#35 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 290, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#35, spender#1306, _allowed#465[__this][__msg_sender][spender#1306]);
	#1311 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_28.sol", 293, 1} {:message "HYDROGEN::bug_tmstmp13"} bug_tmstmp13#1366(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1358: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1358 := (__block_timestamp >= 1546300800);
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 297, 3} {:message "HYDROGEN::decreaseAllowance"} decreaseAllowance#1417(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1368: address_t, subtractedValue#1370: int)
	returns (#1373: bool)
{
	var sub#139_ret#36: int;
	var call_arg#37: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1368 != 0);
	assume {:sourceloc "buggy_28.sol", 299, 38} {:message ""} true;
	call sub#139_ret#36 := sub#139(__this, __msg_sender, __msg_value, _allowed#465[__this][__msg_sender][spender#1368], subtractedValue#1370);
	_allowed#465 := _allowed#465[__this := _allowed#465[__this][__msg_sender := _allowed#465[__this][__msg_sender][spender#1368 := sub#139_ret#36]]];
	call_arg#37 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 300, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#37, spender#1368, _allowed#465[__this][__msg_sender][spender#1368]);
	#1373 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_28.sol", 303, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1421: [address_t]int;
// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 305, 3} {:message "HYDROGEN::_mint"} _mint#1455(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1423: address_t, amount#1425: int)
{
	var add#163_ret#38: int;
	var call_arg#39: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1425 != 0);
	assume {:sourceloc "buggy_28.sol", 307, 26} {:message ""} true;
	call add#163_ret#38 := add#163(__this, __msg_sender, __msg_value, _balances#448[__this][account#1423], amount#1425);
	_balances#448 := _balances#448[__this := _balances#448[__this][account#1423 := add#163_ret#38]];
	call_arg#39 := 0;
	assume {:sourceloc "buggy_28.sol", 308, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#39, account#1423, amount#1425);
	$return45:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_28.sol", 310, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1459: [address_t]int;
// 
// Function: burn
procedure {:sourceloc "buggy_28.sol", 312, 3} {:message "HYDROGEN::burn"} burn#1471(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1461: int)
{
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 313, 5} {:message ""} true;
	call _burn#1524(__this, __msg_sender, __msg_value, call_arg#40, amount#1461);
	$return46:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_28.sol", 315, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1475: [address_t]int;
// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 317, 3} {:message "HYDROGEN::_burn"} _burn#1524(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1477: address_t, amount#1479: int)
{
	var sub#139_ret#41: int;
	var sub#139_ret#42: int;
	var call_arg#43: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1479 != 0);
	assume (amount#1479 <= _balances#448[__this][account#1477]);
	assume {:sourceloc "buggy_28.sol", 320, 20} {:message ""} true;
	call sub#139_ret#41 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#623[__this], amount#1479);
	_totalSupply#623 := _totalSupply#623[__this := sub#139_ret#41];
	assume {:sourceloc "buggy_28.sol", 321, 26} {:message ""} true;
	call sub#139_ret#42 := sub#139(__this, __msg_sender, __msg_value, _balances#448[__this][account#1477], amount#1479);
	_balances#448 := _balances#448[__this := _balances#448[__this][account#1477 := sub#139_ret#42]];
	call_arg#43 := 0;
	assume {:sourceloc "buggy_28.sol", 322, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, account#1477, call_arg#43, amount#1479);
	$return47:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_28.sol", 324, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#1528: [address_t]int;
// 
// Function: burnFrom
procedure {:sourceloc "buggy_28.sol", 326, 3} {:message "HYDROGEN::burnFrom"} burnFrom#1569(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1530: address_t, amount#1532: int)
{
	var sub#139_ret#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1532 <= _allowed#465[__this][account#1530][__msg_sender]);
	assume {:sourceloc "buggy_28.sol", 328, 37} {:message ""} true;
	call sub#139_ret#44 := sub#139(__this, __msg_sender, __msg_value, _allowed#465[__this][account#1530][__msg_sender], amount#1532);
	_allowed#465 := _allowed#465[__this := _allowed#465[__this][account#1530 := _allowed#465[__this][account#1530][__msg_sender := sub#139_ret#44]]];
	assume {:sourceloc "buggy_28.sol", 329, 5} {:message ""} true;
	call _burn#1524(__this, __msg_sender, __msg_value, account#1530, amount#1532);
	$return48:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_28.sol", 331, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#1573: [address_t]int;
