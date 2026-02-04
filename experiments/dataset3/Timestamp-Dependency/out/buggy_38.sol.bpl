// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_38.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_38.sol", 15, 3} {:message "[event] IERC20::Transfer"} Transfer#59(__this: address_t, __msg_sender: address_t, __msg_value: int, from#53: address_t, to#55: address_t, value#57: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_38.sol", 16, 3} {:message "[event] IERC20::Approval"} Approval#67(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#61: address_t, spender#63: address_t, value#65: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_38.sol", 8, 3} {:message "IERC20::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_38.sol", 9, 3} {:message "IERC20::balanceOf"} balanceOf#13(__this: address_t, __msg_sender: address_t, __msg_value: int, who#8: address_t)
	returns (#11: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_38.sol", 10, 3} {:message "IERC20::allowance"} allowance#22(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#15: address_t, spender#17: address_t)
	returns (#20: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_38.sol", 11, 3} {:message "IERC20::transfer"} transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_38.sol", 12, 3} {:message "IERC20::approve"} approve#40(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#33: address_t, value#35: int)
	returns (#38: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_38.sol", 13, 3} {:message "IERC20::transferFrom"} transferFrom#51(__this: address_t, __msg_sender: address_t, __msg_value: int, from#42: address_t, to#44: address_t, value#46: int)
	returns (#49: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_38.sol", 7, 1} {:message "IERC20::[implicit_constructor]"} __constructor#68(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 20, 3} {:message "SafeMath::mul"} mul#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#70: int, b#72: int)
	returns (#75: int)
{
	var {:sourceloc "buggy_38.sol", 24, 5} {:message "c"} c#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#70 == 0)) {
	#75 := 0;
	goto $return0;
	}

	c#85 := (a#70 * b#72);
	assert {:sourceloc "buggy_38.sol", 25, 5} {:message "Assertion might not hold."} ((c#85 div a#70) == b#72);
	#75 := c#85;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 29, 3} {:message "SafeMath::div"} div#119(__this: address_t, __msg_sender: address_t, __msg_value: int, a#103: int, b#105: int)
	returns (#108: int)
{
	var {:sourceloc "buggy_38.sol", 30, 5} {:message "c"} c#111: int;
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
procedure {:inline 1} {:sourceloc "buggy_38.sol", 34, 3} {:message "SafeMath::sub"} sub#139(__this: address_t, __msg_sender: address_t, __msg_value: int, a#121: int, b#123: int)
	returns (#126: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_38.sol", 35, 5} {:message "Assertion might not hold."} (b#123 <= a#121);
	#126 := (a#121 - b#123);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 39, 3} {:message "SafeMath::add"} add#163(__this: address_t, __msg_sender: address_t, __msg_value: int, a#141: int, b#143: int)
	returns (#146: int)
{
	var {:sourceloc "buggy_38.sol", 40, 5} {:message "c"} c#149: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#149 := (a#141 + b#143);
	assert {:sourceloc "buggy_38.sol", 41, 5} {:message "Assertion might not hold."} (c#149 >= a#141);
	#146 := c#149;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 45, 3} {:message "SafeMath::ceil"} ceil#195(__this: address_t, __msg_sender: address_t, __msg_value: int, a#165: int, m#167: int)
	returns (#170: int)
{
	var {:sourceloc "buggy_38.sol", 46, 5} {:message "c"} c#173: int;
	var add#163_ret#0: int;
	var {:sourceloc "buggy_38.sol", 47, 5} {:message "d"} d#180: int;
	var call_arg#1: int;
	var sub#139_ret#2: int;
	var div#119_ret#3: int;
	var mul#101_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_38.sol", 46, 17} {:message ""} true;
	call add#163_ret#0 := add#163(__this, __msg_sender, __msg_value, a#165, m#167);
	c#173 := add#163_ret#0;
	call_arg#1 := 1;
	assume {:sourceloc "buggy_38.sol", 47, 17} {:message ""} true;
	call sub#139_ret#2 := sub#139(__this, __msg_sender, __msg_value, c#173, call_arg#1);
	d#180 := sub#139_ret#2;
	assume {:sourceloc "buggy_38.sol", 48, 16} {:message ""} true;
	call div#119_ret#3 := div#119(__this, __msg_sender, __msg_value, d#180, m#167);
	assume {:sourceloc "buggy_38.sol", 48, 12} {:message ""} true;
	call mul#101_ret#4 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#3, m#167);
	#170 := mul#101_ret#4;
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_38.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Detailed -------
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_38.sol", 54, 1} {:message "ERC20Detailed::bug_tmstmp17"} bug_tmstmp17#207(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#199: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#199 := (__block_timestamp >= 1546300800);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_38.sol", 57, 3} {:message "_name"} _name#209: [address_t]int_arr_type;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_38.sol", 58, 1} {:message "ERC20Detailed::bug_tmstmp37"} bug_tmstmp37#220(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#212: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#212 := (__block_timestamp >= 1546300800);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_38.sol", 61, 3} {:message "_symbol"} _symbol#222: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_38.sol", 62, 1} {:message "winner_tmstmp3"} winner_tmstmp3#224: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 63, 1} {:message "ERC20Detailed::play_tmstmp3"} play_tmstmp3#250(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#226: int)
{
	var {:sourceloc "buggy_38.sol", 64, 2} {:message "_vtime"} _vtime#230: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#230 := __block_timestamp;
	if (((startTime#226 + 432000) == _vtime#230)) {
	winner_tmstmp3#224 := winner_tmstmp3#224[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_38.sol", 67, 3} {:message "_decimals"} _decimals#252: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_38.sol", 69, 3} {:message "ERC20Detailed::[constructor]"} __constructor#426(__this: address_t, __msg_sender: address_t, __msg_value: int, name#254: int_arr_ptr, symbol#256: int_arr_ptr, decimals#258: int)
{
	// TCC assumptions
	assume (name#254 < __alloc_counter);
	assume (symbol#256 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#209 := _name#209[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#222 := _symbol#222[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp3#224 := winner_tmstmp3#224[__this := 0];
	_decimals#252 := _decimals#252[__this := 0];
	winner_tmstmp7#331 := winner_tmstmp7#331[__this := 0];
	winner_tmstmp23#367 := winner_tmstmp23#367[__this := 0];
	winner_tmstmp14#403 := winner_tmstmp14#403[__this := 0];
	// Function body starts here
	_name#209 := _name#209[__this := mem_arr_int[name#254]];
	_symbol#222 := _symbol#222[__this := mem_arr_int[symbol#256]];
	_decimals#252 := _decimals#252[__this := decimals#258];
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
procedure {:sourceloc "buggy_38.sol", 74, 1} {:message "ERC20Detailed::bug_tmstmp4"} bug_tmstmp4#321(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 75, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#278: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#278 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#278);
	pastBlockTime_tmstmp4#278 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_38.sol", 80, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_38.sol", 84, 3} {:message "ERC20Detailed::name"} name#329(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#324: int_arr_ptr)
{
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#324 := new_array#5;
	mem_arr_int := mem_arr_int[#324 := _name#209[__this]];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_38.sol", 87, 1} {:message "winner_tmstmp7"} winner_tmstmp7#331: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 88, 1} {:message "ERC20Detailed::play_tmstmp7"} play_tmstmp7#357(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#333: int)
{
	var {:sourceloc "buggy_38.sol", 89, 2} {:message "_vtime"} _vtime#337: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#337 := __block_timestamp;
	if (((startTime#333 + 432000) == _vtime#337)) {
	winner_tmstmp7#331 := winner_tmstmp7#331[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_38.sol", 93, 3} {:message "ERC20Detailed::symbol"} symbol#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#360: int_arr_ptr)
{
	var new_array#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#6 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#360 := new_array#6;
	mem_arr_int := mem_arr_int[#360 := _symbol#222[__this]];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_38.sol", 96, 1} {:message "winner_tmstmp23"} winner_tmstmp23#367: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 97, 1} {:message "ERC20Detailed::play_tmstmp23"} play_tmstmp23#393(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#369: int)
{
	var {:sourceloc "buggy_38.sol", 98, 2} {:message "_vtime"} _vtime#373: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#373 := __block_timestamp;
	if (((startTime#369 + 432000) == _vtime#373)) {
	winner_tmstmp23#367 := winner_tmstmp23#367[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_38.sol", 102, 3} {:message "ERC20Detailed::decimals"} decimals#401(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#396: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#396 := _decimals#252[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_38.sol", 105, 1} {:message "winner_tmstmp14"} winner_tmstmp14#403: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 106, 1} {:message "ERC20Detailed::play_tmstmp14"} play_tmstmp14#425(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#405: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#405 + 432000) == __block_timestamp)) {
	winner_tmstmp14#403 := winner_tmstmp14#403[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// ------- Contract: BIGBOMBv2 -------
// Inherits from: ERC20Detailed
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_38.sol", 122, 3} {:message "[event] BIGBOMBv2::Transfer"} Transfer#471(__this: address_t, __msg_sender: address_t, __msg_value: int, from#465: address_t, to#467: address_t, value#469: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_38.sol", 123, 3} {:message "[event] BIGBOMBv2::Approval"} Approval#479(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#473: address_t, spender#475: address_t, value#477: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_38.sol", 114, 1} {:message "BIGBOMBv2::bug_tmstmp9"} bug_tmstmp9#442(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#434: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#434 := (__block_timestamp >= 1546300800);
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_38.sol", 117, 3} {:message "_balances"} _balances#446: [address_t][address_t]int;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_38.sol", 118, 1} {:message "BIGBOMBv2::bug_tmstmp25"} bug_tmstmp25#457(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#449: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#449 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_38.sol", 121, 3} {:message "_allowed"} _allowed#463: [address_t][address_t][address_t]int;
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_38.sol", 125, 1} {:message "winner_tmstmp19"} winner_tmstmp19#481: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 126, 1} {:message "BIGBOMBv2::play_tmstmp19"} play_tmstmp19#507(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#483: int)
{
	var {:sourceloc "buggy_38.sol", 127, 2} {:message "_vtime"} _vtime#487: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#487 := __block_timestamp;
	if (((startTime#483 + 432000) == _vtime#487)) {
	winner_tmstmp19#481 := winner_tmstmp19#481[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_38.sol", 131, 1} {:message "winner_tmstmp26"} winner_tmstmp26#512: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 132, 1} {:message "BIGBOMBv2::play_tmstmp26"} play_tmstmp26#534(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#514: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#514 + 432000) == __block_timestamp)) {
	winner_tmstmp26#512 := winner_tmstmp26#512[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_38.sol", 136, 1} {:message "BIGBOMBv2::bug_tmstmp20"} bug_tmstmp20#584(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 137, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#541: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#541 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#541);
	pastBlockTime_tmstmp20#541 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_38.sol", 142, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return20:
	// Function body ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_38.sol", 146, 1} {:message "BIGBOMBv2::bug_tmstmp32"} bug_tmstmp32#634(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 147, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#591: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#591 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#591);
	pastBlockTime_tmstmp32#591 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_38.sol", 152, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return21:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_38.sol", 155, 3} {:message "_totalSupply"} _totalSupply#637: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_38.sol", 156, 1} {:message "winner_tmstmp38"} winner_tmstmp38#639: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 157, 1} {:message "BIGBOMBv2::play_tmstmp38"} play_tmstmp38#661(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#641: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#641 + 432000) == __block_timestamp)) {
	winner_tmstmp38#639 := winner_tmstmp38#639[__this := __msg_sender];
	}

	$return22:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_38.sol", 160, 3} {:message "basePercent"} basePercent#664: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_38.sol", 162, 3} {:message "BIGBOMBv2::[constructor]"} __constructor#1582(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#666: int_arr_ptr, _symbol#668: int_arr_ptr, _decimals#670: int)
{
	var name#254#7: int_arr_ptr;
	var symbol#256#7: int_arr_ptr;
	var decimals#258#7: int;
	var call_arg#9: address_t;
	// TCC assumptions
	assume (_name#666 < __alloc_counter);
	assume (_symbol#668 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#446 := _balances#446[__this := default_address_t_int()];
	_allowed#463 := _allowed#463[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp19#481 := winner_tmstmp19#481[__this := 0];
	winner_tmstmp26#512 := winner_tmstmp26#512[__this := 0];
	_totalSupply#637 := _totalSupply#637[__this := 800000000000000000000000];
	winner_tmstmp38#639 := winner_tmstmp38#639[__this := 0];
	basePercent#664 := basePercent#664[__this := 100];
	winner_tmstmp30#687 := winner_tmstmp30#687[__this := 0];
	winner_tmstmp39#778 := winner_tmstmp39#778[__this := 0];
	winner_tmstmp35#896 := winner_tmstmp35#896[__this := 0];
	winner_tmstmp27#1142 := winner_tmstmp27#1142[__this := 0];
	winner_tmstmp31#1286 := winner_tmstmp31#1286[__this := 0];
	bugv_tmstmp5#1429 := bugv_tmstmp5#1429[__this := __block_timestamp];
	bugv_tmstmp1#1467 := bugv_tmstmp1#1467[__this := __block_timestamp];
	bugv_tmstmp2#1483 := bugv_tmstmp2#1483[__this := __block_timestamp];
	bugv_tmstmp3#1536 := bugv_tmstmp3#1536[__this := __block_timestamp];
	bugv_tmstmp4#1581 := bugv_tmstmp4#1581[__this := __block_timestamp];
	_name#209 := _name#209[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#222 := _symbol#222[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp3#224 := winner_tmstmp3#224[__this := 0];
	_decimals#252 := _decimals#252[__this := 0];
	winner_tmstmp7#331 := winner_tmstmp7#331[__this := 0];
	winner_tmstmp23#367 := winner_tmstmp23#367[__this := 0];
	winner_tmstmp14#403 := winner_tmstmp14#403[__this := 0];
	// Arguments for ERC20Detailed
	name#254#7 := _name#666;
	symbol#256#7 := _symbol#668;
	decimals#258#7 := _decimals#670;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#209 := _name#209[__this := mem_arr_int[name#254#7]];
	_symbol#222 := _symbol#222[__this := mem_arr_int[symbol#256#7]];
	_decimals#252 := _decimals#252[__this := decimals#258#7];
	$return23:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#9 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 163, 5} {:message ""} true;
	call _mint#1463(__this, __msg_sender, __msg_value, call_arg#9, _totalSupply#637[__this]);
	$return24:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_38.sol", 165, 1} {:message "winner_tmstmp30"} winner_tmstmp30#687: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 166, 1} {:message "BIGBOMBv2::play_tmstmp30"} play_tmstmp30#709(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#689: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#689 + 432000) == __block_timestamp)) {
	winner_tmstmp30#687 := winner_tmstmp30#687[__this := __msg_sender];
	}

	$return25:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 170, 3} {:message "BIGBOMBv2::totalSupply"} totalSupply#717(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#712: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#712 := _totalSupply#637[__this];
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_38.sol", 173, 1} {:message "BIGBOMBv2::bug_tmstmp8"} bug_tmstmp8#764(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 174, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#721: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#721 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#721);
	pastBlockTime_tmstmp8#721 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_38.sol", 179, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return27:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 183, 3} {:message "BIGBOMBv2::balanceOf"} balanceOf#776(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#766: address_t)
	returns (#769: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#769 := _balances#446[__this][owner#766];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_38.sol", 186, 1} {:message "winner_tmstmp39"} winner_tmstmp39#778: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 187, 1} {:message "BIGBOMBv2::play_tmstmp39"} play_tmstmp39#804(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#780: int)
{
	var {:sourceloc "buggy_38.sol", 188, 2} {:message "_vtime"} _vtime#784: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#784 := __block_timestamp;
	if (((startTime#780 + 432000) == _vtime#784)) {
	winner_tmstmp39#778 := winner_tmstmp39#778[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 192, 3} {:message "BIGBOMBv2::allowance"} allowance#820(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#806: address_t, spender#808: address_t)
	returns (#811: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#811 := _allowed#463[__this][owner#806][spender#808];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_38.sol", 195, 1} {:message "BIGBOMBv2::bug_tmstmp36"} bug_tmstmp36#867(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 196, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#824: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#824 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#824);
	pastBlockTime_tmstmp36#824 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_38.sol", 201, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return31:
	// Function body ends here
}

// 
// Function: findfourPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 205, 3} {:message "BIGBOMBv2::findfourPercent"} findfourPercent#894(__this: address_t, __msg_sender: address_t, __msg_value: int, value#869: int)
	returns (#872: int)
{
	var {:sourceloc "buggy_38.sol", 206, 5} {:message "roundValue"} roundValue#875: int;
	var ceil#195_ret#10: int;
	var {:sourceloc "buggy_38.sol", 207, 5} {:message "fourPercent"} fourPercent#882: int;
	var mul#101_ret#11: int;
	var call_arg#12: int;
	var div#119_ret#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_38.sol", 206, 26} {:message ""} true;
	call ceil#195_ret#10 := ceil#195(__this, __msg_sender, __msg_value, value#869, basePercent#664[__this]);
	roundValue#875 := ceil#195_ret#10;
	assume {:sourceloc "buggy_38.sol", 207, 27} {:message ""} true;
	call mul#101_ret#11 := mul#101(__this, __msg_sender, __msg_value, roundValue#875, basePercent#664[__this]);
	call_arg#12 := 2500;
	assume {:sourceloc "buggy_38.sol", 207, 27} {:message ""} true;
	call div#119_ret#13 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#11, call_arg#12);
	fourPercent#882 := div#119_ret#13;
	#872 := fourPercent#882;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_38.sol", 210, 1} {:message "winner_tmstmp35"} winner_tmstmp35#896: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 211, 1} {:message "BIGBOMBv2::play_tmstmp35"} play_tmstmp35#922(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#898: int)
{
	var {:sourceloc "buggy_38.sol", 212, 2} {:message "_vtime"} _vtime#902: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#902 := __block_timestamp;
	if (((startTime#898 + 432000) == _vtime#902)) {
	winner_tmstmp35#896 := winner_tmstmp35#896[__this := __msg_sender];
	}

	$return33:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 216, 3} {:message "BIGBOMBv2::transfer"} transfer#1013(__this: address_t, __msg_sender: address_t, __msg_value: int, to#924: address_t, value#926: int)
	returns (#929: bool)
{
	var {:sourceloc "buggy_38.sol", 220, 5} {:message "tokensToBurn"} tokensToBurn#950: int;
	var findfourPercent#894_ret#14: int;
	var {:sourceloc "buggy_38.sol", 221, 5} {:message "tokensToTransfer"} tokensToTransfer#956: int;
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
	assume (value#926 <= _balances#446[__this][__msg_sender]);
	assume (to#924 != 0);
	assume {:sourceloc "buggy_38.sol", 220, 28} {:message ""} true;
	call findfourPercent#894_ret#14 := findfourPercent#894(__this, __msg_sender, __msg_value, value#926);
	tokensToBurn#950 := findfourPercent#894_ret#14;
	assume {:sourceloc "buggy_38.sol", 221, 32} {:message ""} true;
	call sub#139_ret#15 := sub#139(__this, __msg_sender, __msg_value, value#926, tokensToBurn#950);
	tokensToTransfer#956 := sub#139_ret#15;
	assume {:sourceloc "buggy_38.sol", 223, 29} {:message ""} true;
	call sub#139_ret#16 := sub#139(__this, __msg_sender, __msg_value, _balances#446[__this][__msg_sender], value#926);
	_balances#446 := _balances#446[__this := _balances#446[__this][__msg_sender := sub#139_ret#16]];
	assume {:sourceloc "buggy_38.sol", 224, 21} {:message ""} true;
	call add#163_ret#17 := add#163(__this, __msg_sender, __msg_value, _balances#446[__this][to#924], tokensToTransfer#956);
	_balances#446 := _balances#446[__this := _balances#446[__this][to#924 := add#163_ret#17]];
	assume {:sourceloc "buggy_38.sol", 226, 20} {:message ""} true;
	call sub#139_ret#18 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#637[__this], tokensToBurn#950);
	_totalSupply#637 := _totalSupply#637[__this := sub#139_ret#18];
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 228, 10} {:message ""} true;
	call Transfer#471(__this, __msg_sender, __msg_value, call_arg#19, to#924, tokensToTransfer#956);
	call_arg#20 := __msg_sender;
	call_arg#21 := 0;
	assume {:sourceloc "buggy_38.sol", 229, 10} {:message ""} true;
	call Transfer#471(__this, __msg_sender, __msg_value, call_arg#20, call_arg#21, tokensToBurn#950);
	#929 := true;
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_38.sol", 232, 1} {:message "BIGBOMBv2::bug_tmstmp40"} bug_tmstmp40#1060(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 233, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1017: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1017 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1017);
	pastBlockTime_tmstmp40#1017 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_38.sol", 238, 7} {:message ""} true;
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
procedure {:sourceloc "buggy_38.sol", 242, 3} {:message "BIGBOMBv2::multiTransfer"} multiTransfer#1092(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1063: address_t_arr_ptr, amounts#1066: int_arr_ptr)
{
	var {:sourceloc "buggy_38.sol", 243, 10} {:message "i"} i#1070: int;
	var transfer#1013_ret#24: bool;
	var tmp#25: int;
	// TCC assumptions
	assume (receivers#1063 < __alloc_counter);
	assume (amounts#1066 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1070 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1063])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1063]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1070 < length#address_t_arr#constr(mem_arr_address_t[receivers#1063]))) {
	// Body
	assume {:sourceloc "buggy_38.sol", 244, 7} {:message ""} true;
	call transfer#1013_ret#24 := transfer#1013(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1063])[i#1070], arr#int_arr#constr(mem_arr_int[amounts#1066])[i#1070]);
	$continue22:
	// Loop expression
	tmp#25 := i#1070;
	i#1070 := (i#1070 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1063])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1063]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break23:
	$return36:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_38.sol", 247, 1} {:message "BIGBOMBv2::bug_tmstmp33"} bug_tmstmp33#1103(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1095: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1095 := (__block_timestamp >= 1546300800);
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 251, 3} {:message "BIGBOMBv2::approve"} approve#1140(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1105: address_t, value#1107: int)
	returns (#1110: bool)
{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1105 != 0);
	_allowed#463 := _allowed#463[__this := _allowed#463[__this][__msg_sender := _allowed#463[__this][__msg_sender][spender#1105 := value#1107]]];
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 254, 10} {:message ""} true;
	call Approval#479(__this, __msg_sender, __msg_value, call_arg#26, spender#1105, value#1107);
	#1110 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_38.sol", 257, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1142: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 258, 1} {:message "BIGBOMBv2::play_tmstmp27"} play_tmstmp27#1168(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1144: int)
{
	var {:sourceloc "buggy_38.sol", 259, 2} {:message "_vtime"} _vtime#1148: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1148 := __block_timestamp;
	if (((startTime#1144 + 432000) == _vtime#1148)) {
	winner_tmstmp27#1142 := winner_tmstmp27#1142[__this := __msg_sender];
	}

	$return39:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 263, 3} {:message "BIGBOMBv2::transferFrom"} transferFrom#1284(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1170: address_t, to#1172: address_t, value#1174: int)
	returns (#1177: bool)
{
	var sub#139_ret#27: int;
	var {:sourceloc "buggy_38.sol", 270, 5} {:message "tokensToBurn"} tokensToBurn#1219: int;
	var findfourPercent#894_ret#28: int;
	var {:sourceloc "buggy_38.sol", 271, 5} {:message "tokensToTransfer"} tokensToTransfer#1225: int;
	var sub#139_ret#29: int;
	var add#163_ret#30: int;
	var sub#139_ret#31: int;
	var sub#139_ret#32: int;
	var call_arg#33: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1174 <= _balances#446[__this][from#1170]);
	assume (value#1174 <= _allowed#463[__this][from#1170][__msg_sender]);
	assume (to#1172 != 0);
	assume {:sourceloc "buggy_38.sol", 268, 23} {:message ""} true;
	call sub#139_ret#27 := sub#139(__this, __msg_sender, __msg_value, _balances#446[__this][from#1170], value#1174);
	_balances#446 := _balances#446[__this := _balances#446[__this][from#1170 := sub#139_ret#27]];
	assume {:sourceloc "buggy_38.sol", 270, 28} {:message ""} true;
	call findfourPercent#894_ret#28 := findfourPercent#894(__this, __msg_sender, __msg_value, value#1174);
	tokensToBurn#1219 := findfourPercent#894_ret#28;
	assume {:sourceloc "buggy_38.sol", 271, 32} {:message ""} true;
	call sub#139_ret#29 := sub#139(__this, __msg_sender, __msg_value, value#1174, tokensToBurn#1219);
	tokensToTransfer#1225 := sub#139_ret#29;
	assume {:sourceloc "buggy_38.sol", 273, 21} {:message ""} true;
	call add#163_ret#30 := add#163(__this, __msg_sender, __msg_value, _balances#446[__this][to#1172], tokensToTransfer#1225);
	_balances#446 := _balances#446[__this := _balances#446[__this][to#1172 := add#163_ret#30]];
	assume {:sourceloc "buggy_38.sol", 274, 20} {:message ""} true;
	call sub#139_ret#31 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#637[__this], tokensToBurn#1219);
	_totalSupply#637 := _totalSupply#637[__this := sub#139_ret#31];
	assume {:sourceloc "buggy_38.sol", 276, 34} {:message ""} true;
	call sub#139_ret#32 := sub#139(__this, __msg_sender, __msg_value, _allowed#463[__this][from#1170][__msg_sender], value#1174);
	_allowed#463 := _allowed#463[__this := _allowed#463[__this][from#1170 := _allowed#463[__this][from#1170][__msg_sender := sub#139_ret#32]]];
	assume {:sourceloc "buggy_38.sol", 278, 10} {:message ""} true;
	call Transfer#471(__this, __msg_sender, __msg_value, from#1170, to#1172, tokensToTransfer#1225);
	call_arg#33 := 0;
	assume {:sourceloc "buggy_38.sol", 279, 10} {:message ""} true;
	call Transfer#471(__this, __msg_sender, __msg_value, from#1170, call_arg#33, tokensToBurn#1219);
	#1177 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_38.sol", 283, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1286: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_38.sol", 284, 1} {:message "BIGBOMBv2::play_tmstmp31"} play_tmstmp31#1312(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1288: int)
{
	var {:sourceloc "buggy_38.sol", 285, 2} {:message "_vtime"} _vtime#1292: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1292 := __block_timestamp;
	if (((startTime#1288 + 432000) == _vtime#1292)) {
	winner_tmstmp31#1286 := winner_tmstmp31#1286[__this := __msg_sender];
	}

	$return41:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 289, 3} {:message "BIGBOMBv2::increaseAllowance"} increaseAllowance#1363(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1314: address_t, addedValue#1316: int)
	returns (#1319: bool)
{
	var add#163_ret#34: int;
	var call_arg#35: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1314 != 0);
	assume {:sourceloc "buggy_38.sol", 291, 38} {:message ""} true;
	call add#163_ret#34 := add#163(__this, __msg_sender, __msg_value, _allowed#463[__this][__msg_sender][spender#1314], addedValue#1316);
	_allowed#463 := _allowed#463[__this := _allowed#463[__this][__msg_sender := _allowed#463[__this][__msg_sender][spender#1314 := add#163_ret#34]]];
	call_arg#35 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 292, 10} {:message ""} true;
	call Approval#479(__this, __msg_sender, __msg_value, call_arg#35, spender#1314, _allowed#463[__this][__msg_sender][spender#1314]);
	#1319 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_38.sol", 295, 1} {:message "BIGBOMBv2::bug_tmstmp13"} bug_tmstmp13#1374(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1366: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1366 := (__block_timestamp >= 1546300800);
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 299, 3} {:message "BIGBOMBv2::decreaseAllowance"} decreaseAllowance#1425(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1376: address_t, subtractedValue#1378: int)
	returns (#1381: bool)
{
	var sub#139_ret#36: int;
	var call_arg#37: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1376 != 0);
	assume {:sourceloc "buggy_38.sol", 301, 38} {:message ""} true;
	call sub#139_ret#36 := sub#139(__this, __msg_sender, __msg_value, _allowed#463[__this][__msg_sender][spender#1376], subtractedValue#1378);
	_allowed#463 := _allowed#463[__this := _allowed#463[__this][__msg_sender := _allowed#463[__this][__msg_sender][spender#1376 := sub#139_ret#36]]];
	call_arg#37 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 302, 10} {:message ""} true;
	call Approval#479(__this, __msg_sender, __msg_value, call_arg#37, spender#1376, _allowed#463[__this][__msg_sender][spender#1376]);
	#1381 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_38.sol", 305, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1429: [address_t]int;
// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 307, 3} {:message "BIGBOMBv2::_mint"} _mint#1463(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1431: address_t, amount#1433: int)
{
	var add#163_ret#38: int;
	var call_arg#39: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1433 != 0);
	assume {:sourceloc "buggy_38.sol", 309, 26} {:message ""} true;
	call add#163_ret#38 := add#163(__this, __msg_sender, __msg_value, _balances#446[__this][account#1431], amount#1433);
	_balances#446 := _balances#446[__this := _balances#446[__this][account#1431 := add#163_ret#38]];
	call_arg#39 := 0;
	assume {:sourceloc "buggy_38.sol", 310, 10} {:message ""} true;
	call Transfer#471(__this, __msg_sender, __msg_value, call_arg#39, account#1431, amount#1433);
	$return45:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_38.sol", 312, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1467: [address_t]int;
// 
// Function: burn
procedure {:sourceloc "buggy_38.sol", 314, 3} {:message "BIGBOMBv2::burn"} burn#1479(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1469: int)
{
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 315, 5} {:message ""} true;
	call _burn#1532(__this, __msg_sender, __msg_value, call_arg#40, amount#1469);
	$return46:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_38.sol", 317, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1483: [address_t]int;
// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 319, 3} {:message "BIGBOMBv2::_burn"} _burn#1532(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1485: address_t, amount#1487: int)
{
	var sub#139_ret#41: int;
	var sub#139_ret#42: int;
	var call_arg#43: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1487 != 0);
	assume (amount#1487 <= _balances#446[__this][account#1485]);
	assume {:sourceloc "buggy_38.sol", 322, 20} {:message ""} true;
	call sub#139_ret#41 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#637[__this], amount#1487);
	_totalSupply#637 := _totalSupply#637[__this := sub#139_ret#41];
	assume {:sourceloc "buggy_38.sol", 323, 26} {:message ""} true;
	call sub#139_ret#42 := sub#139(__this, __msg_sender, __msg_value, _balances#446[__this][account#1485], amount#1487);
	_balances#446 := _balances#446[__this := _balances#446[__this][account#1485 := sub#139_ret#42]];
	call_arg#43 := 0;
	assume {:sourceloc "buggy_38.sol", 324, 10} {:message ""} true;
	call Transfer#471(__this, __msg_sender, __msg_value, account#1485, call_arg#43, amount#1487);
	$return47:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_38.sol", 326, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#1536: [address_t]int;
// 
// Function: burnFrom
procedure {:sourceloc "buggy_38.sol", 328, 3} {:message "BIGBOMBv2::burnFrom"} burnFrom#1577(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1538: address_t, amount#1540: int)
{
	var sub#139_ret#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1540 <= _allowed#463[__this][account#1538][__msg_sender]);
	assume {:sourceloc "buggy_38.sol", 330, 37} {:message ""} true;
	call sub#139_ret#44 := sub#139(__this, __msg_sender, __msg_value, _allowed#463[__this][account#1538][__msg_sender], amount#1540);
	_allowed#463 := _allowed#463[__this := _allowed#463[__this][account#1538 := _allowed#463[__this][account#1538][__msg_sender := sub#139_ret#44]]];
	assume {:sourceloc "buggy_38.sol", 331, 5} {:message ""} true;
	call _burn#1532(__this, __msg_sender, __msg_value, account#1538, amount#1540);
	$return48:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_38.sol", 333, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#1581: [address_t]int;
