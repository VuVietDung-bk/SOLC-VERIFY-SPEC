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
// Inherits from: IERC20
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_38.sol", 54, 1} {:message "ERC20Detailed::bug_unchk_send16"} bug_unchk_send16#211(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 55, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_38.sol", 56, 3} {:message "_name"} _name#213: [address_t]int_arr_type;
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_38.sol", 57, 1} {:message "ERC20Detailed::bug_unchk_send24"} bug_unchk_send24#226(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 58, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return6:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_38.sol", 59, 3} {:message "_symbol"} _symbol#228: [address_t]int_arr_type;
// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_38.sol", 60, 1} {:message "ERC20Detailed::bug_unchk_send5"} bug_unchk_send5#241(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 61, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return7:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_38.sol", 62, 3} {:message "_decimals"} _decimals#243: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_38.sol", 64, 3} {:message "ERC20Detailed::[constructor]"} __constructor#342(__this: address_t, __msg_sender: address_t, __msg_value: int, name#245: int_arr_ptr, symbol#247: int_arr_ptr, decimals#249: int)
{
	// TCC assumptions
	assume (name#245 < __alloc_counter);
	assume (symbol#247 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#213 := _name#213[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#228 := _symbol#228[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#243 := _decimals#243[__this := 0];
	// Function body starts here
	_name#213 := _name#213[__this := mem_arr_int[name#245]];
	_symbol#228 := _symbol#228[__this := mem_arr_int[symbol#247]];
	_decimals#243 := _decimals#243[__this := decimals#249];
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_38.sol", 69, 1} {:message "ERC20Detailed::bug_unchk_send1"} bug_unchk_send1#278(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 70, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return9:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_38.sol", 72, 3} {:message "ERC20Detailed::name"} name#286(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#281: int_arr_ptr)
{
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#281 := new_array#9;
	mem_arr_int := mem_arr_int[#281 := _name#213[__this]];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_38.sol", 75, 1} {:message "ERC20Detailed::bug_unchk_send2"} bug_unchk_send2#299(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 76, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return11:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_38.sol", 78, 3} {:message "ERC20Detailed::symbol"} symbol#307(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#302: int_arr_ptr)
{
	var new_array#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#302 := new_array#11;
	mem_arr_int := mem_arr_int[#302 := _symbol#228[__this]];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_38.sol", 81, 1} {:message "ERC20Detailed::bug_unchk_send17"} bug_unchk_send17#320(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 82, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return13:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_38.sol", 84, 3} {:message "ERC20Detailed::decimals"} decimals#328(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#323: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#323 := _decimals#243[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_38.sol", 87, 1} {:message "ERC20Detailed::bug_unchk_send3"} bug_unchk_send3#341(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 88, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return15:
	// Function body ends here
}

// 
// ------- Contract: BIGBOMBv2 -------
// Inherits from: ERC20Detailed
// Using library SafeMath for uint256
// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_38.sol", 94, 1} {:message "BIGBOMBv2::bug_unchk_send15"} bug_unchk_send15#360(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 95, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return16:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_38.sol", 96, 3} {:message "_balances"} _balances#364: [address_t][address_t]int;
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_38.sol", 97, 1} {:message "BIGBOMBv2::bug_unchk_send28"} bug_unchk_send28#377(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 98, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return17:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_38.sol", 99, 3} {:message "_allowed"} _allowed#383: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_38.sol", 101, 1} {:message "BIGBOMBv2::bug_unchk_send21"} bug_unchk_send21#396(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 102, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_38.sol", 104, 1} {:message "BIGBOMBv2::bug_unchk_send10"} bug_unchk_send10#412(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 105, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_38.sol", 107, 1} {:message "BIGBOMBv2::bug_unchk_send22"} bug_unchk_send22#428(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 108, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_38.sol", 110, 1} {:message "BIGBOMBv2::bug_unchk_send12"} bug_unchk_send12#444(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 111, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return21:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_38.sol", 112, 3} {:message "_totalSupply"} _totalSupply#447: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_38.sol", 113, 1} {:message "BIGBOMBv2::bug_unchk_send11"} bug_unchk_send11#460(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 114, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return22:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_38.sol", 115, 3} {:message "basePercent"} basePercent#463: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_38.sol", 117, 3} {:message "BIGBOMBv2::[constructor]"} __constructor#1263(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#465: int_arr_ptr, _symbol#467: int_arr_ptr, _decimals#469: int)
{
	var name#245#21: int_arr_ptr;
	var symbol#247#21: int_arr_ptr;
	var decimals#249#21: int;
	var call_arg#23: address_t;
	// TCC assumptions
	assume (_name#465 < __alloc_counter);
	assume (_symbol#467 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#364 := _balances#364[__this := default_address_t_int()];
	_allowed#383 := _allowed#383[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#447 := _totalSupply#447[__this := 800000000000000000000000];
	basePercent#463 := basePercent#463[__this := 100];
	_name#213 := _name#213[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#228 := _symbol#228[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#243 := _decimals#243[__this := 0];
	// Arguments for ERC20Detailed
	name#245#21 := _name#465;
	symbol#247#21 := _symbol#467;
	decimals#249#21 := _decimals#469;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#213 := _name#213[__this := mem_arr_int[name#245#21]];
	_symbol#228 := _symbol#228[__this := mem_arr_int[symbol#247#21]];
	_decimals#243 := _decimals#243[__this := decimals#249#21];
	$return23:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 118, 5} {:message ""} true;
	call _mint#1108(__this, __msg_sender, __msg_value, call_arg#23, _totalSupply#447[__this]);
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_38.sol", 120, 1} {:message "BIGBOMBv2::bug_unchk_send9"} bug_unchk_send9#497(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 121, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return25:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 123, 3} {:message "BIGBOMBv2::totalSupply"} totalSupply#506(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#501: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#501 := _totalSupply#447[__this];
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_38.sol", 126, 1} {:message "BIGBOMBv2::bug_unchk_send25"} bug_unchk_send25#519(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 127, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return27:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 129, 3} {:message "BIGBOMBv2::balanceOf"} balanceOf#532(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#521: address_t)
	returns (#525: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#525 := _balances#364[__this][owner#521];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_38.sol", 132, 1} {:message "BIGBOMBv2::bug_unchk_send19"} bug_unchk_send19#545(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 133, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return29:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 135, 3} {:message "BIGBOMBv2::allowance"} allowance#562(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#547: address_t, spender#549: address_t)
	returns (#553: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#553 := _allowed#383[__this][owner#547][spender#549];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_38.sol", 138, 1} {:message "BIGBOMBv2::bug_unchk_send26"} bug_unchk_send26#575(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 139, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return31:
	// Function body ends here
}

// 
// Function: findfourPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 141, 3} {:message "BIGBOMBv2::findfourPercent"} findfourPercent#602(__this: address_t, __msg_sender: address_t, __msg_value: int, value#577: int)
	returns (#580: int)
{
	var {:sourceloc "buggy_38.sol", 142, 5} {:message "roundValue"} roundValue#583: int;
	var ceil#195_ret#28: int;
	var {:sourceloc "buggy_38.sol", 143, 5} {:message "fourPercent"} fourPercent#590: int;
	var mul#101_ret#29: int;
	var call_arg#30: int;
	var div#119_ret#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_38.sol", 142, 26} {:message ""} true;
	call ceil#195_ret#28 := ceil#195(__this, __msg_sender, __msg_value, value#577, basePercent#463[__this]);
	roundValue#583 := ceil#195_ret#28;
	assume {:sourceloc "buggy_38.sol", 143, 27} {:message ""} true;
	call mul#101_ret#29 := mul#101(__this, __msg_sender, __msg_value, roundValue#583, basePercent#463[__this]);
	call_arg#30 := 2500;
	assume {:sourceloc "buggy_38.sol", 143, 27} {:message ""} true;
	call div#119_ret#31 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#29, call_arg#30);
	fourPercent#590 := div#119_ret#31;
	#580 := fourPercent#590;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_38.sol", 146, 1} {:message "BIGBOMBv2::bug_unchk_send20"} bug_unchk_send20#615(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#32 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 147, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#32);
	$return33:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 149, 3} {:message "BIGBOMBv2::transfer"} transfer#707(__this: address_t, __msg_sender: address_t, __msg_value: int, to#617: address_t, value#619: int)
	returns (#623: bool)
{
	var {:sourceloc "buggy_38.sol", 153, 5} {:message "tokensToBurn"} tokensToBurn#644: int;
	var findfourPercent#602_ret#33: int;
	var {:sourceloc "buggy_38.sol", 154, 5} {:message "tokensToTransfer"} tokensToTransfer#650: int;
	var sub#139_ret#34: int;
	var sub#139_ret#35: int;
	var add#163_ret#36: int;
	var sub#139_ret#37: int;
	var call_arg#38: address_t;
	var call_arg#39: address_t;
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#619 <= _balances#364[__this][__msg_sender]);
	assume (to#617 != 0);
	assume {:sourceloc "buggy_38.sol", 153, 28} {:message ""} true;
	call findfourPercent#602_ret#33 := findfourPercent#602(__this, __msg_sender, __msg_value, value#619);
	tokensToBurn#644 := findfourPercent#602_ret#33;
	assume {:sourceloc "buggy_38.sol", 154, 32} {:message ""} true;
	call sub#139_ret#34 := sub#139(__this, __msg_sender, __msg_value, value#619, tokensToBurn#644);
	tokensToTransfer#650 := sub#139_ret#34;
	assume {:sourceloc "buggy_38.sol", 156, 29} {:message ""} true;
	call sub#139_ret#35 := sub#139(__this, __msg_sender, __msg_value, _balances#364[__this][__msg_sender], value#619);
	_balances#364 := _balances#364[__this := _balances#364[__this][__msg_sender := sub#139_ret#35]];
	assume {:sourceloc "buggy_38.sol", 157, 21} {:message ""} true;
	call add#163_ret#36 := add#163(__this, __msg_sender, __msg_value, _balances#364[__this][to#617], tokensToTransfer#650);
	_balances#364 := _balances#364[__this := _balances#364[__this][to#617 := add#163_ret#36]];
	assume {:sourceloc "buggy_38.sol", 159, 20} {:message ""} true;
	call sub#139_ret#37 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#447[__this], tokensToBurn#644);
	_totalSupply#447 := _totalSupply#447[__this := sub#139_ret#37];
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 161, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#38, to#617, tokensToTransfer#650);
	call_arg#39 := __msg_sender;
	call_arg#40 := 0;
	assume {:sourceloc "buggy_38.sol", 162, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#39, call_arg#40, tokensToBurn#644);
	#623 := true;
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_38.sol", 165, 1} {:message "BIGBOMBv2::bug_unchk_send32"} bug_unchk_send32#720(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 166, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#41);
	$return35:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_38.sol", 168, 3} {:message "BIGBOMBv2::multiTransfer"} multiTransfer#752(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#723: address_t_arr_ptr, amounts#726: int_arr_ptr)
{
	var {:sourceloc "buggy_38.sol", 169, 10} {:message "i"} i#730: int;
	var transfer#707_ret#44: bool;
	var tmp#45: int;
	// TCC assumptions
	assume (receivers#723 < __alloc_counter);
	assume (amounts#726 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#730 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#723])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#723]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#730 < length#address_t_arr#constr(mem_arr_address_t[receivers#723]))) {
	// Body
	assume {:sourceloc "buggy_38.sol", 170, 7} {:message ""} true;
	call transfer#707_ret#44 := transfer#707(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#723])[i#730], arr#int_arr#constr(mem_arr_int[amounts#726])[i#730]);
	$continue42:
	// Loop expression
	tmp#45 := i#730;
	i#730 := (i#730 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#723])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#723]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break43:
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_38.sol", 173, 1} {:message "BIGBOMBv2::bug_unchk_send4"} bug_unchk_send4#765(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 174, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#46);
	$return37:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 176, 3} {:message "BIGBOMBv2::approve"} approve#803(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#767: address_t, value#769: int)
	returns (#773: bool)
{
	var call_arg#47: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#767 != 0);
	_allowed#383 := _allowed#383[__this := _allowed#383[__this][__msg_sender := _allowed#383[__this][__msg_sender][spender#767 := value#769]]];
	call_arg#47 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 179, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#47, spender#767, value#769);
	#773 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_38.sol", 182, 1} {:message "BIGBOMBv2::bug_unchk_send7"} bug_unchk_send7#816(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#48: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#48 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 183, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#48);
	$return39:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 185, 3} {:message "BIGBOMBv2::transferFrom"} transferFrom#933(__this: address_t, __msg_sender: address_t, __msg_value: int, from#818: address_t, to#820: address_t, value#822: int)
	returns (#826: bool)
{
	var sub#139_ret#49: int;
	var {:sourceloc "buggy_38.sol", 192, 5} {:message "tokensToBurn"} tokensToBurn#868: int;
	var findfourPercent#602_ret#50: int;
	var {:sourceloc "buggy_38.sol", 193, 5} {:message "tokensToTransfer"} tokensToTransfer#874: int;
	var sub#139_ret#51: int;
	var add#163_ret#52: int;
	var sub#139_ret#53: int;
	var sub#139_ret#54: int;
	var call_arg#55: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#822 <= _balances#364[__this][from#818]);
	assume (value#822 <= _allowed#383[__this][from#818][__msg_sender]);
	assume (to#820 != 0);
	assume {:sourceloc "buggy_38.sol", 190, 23} {:message ""} true;
	call sub#139_ret#49 := sub#139(__this, __msg_sender, __msg_value, _balances#364[__this][from#818], value#822);
	_balances#364 := _balances#364[__this := _balances#364[__this][from#818 := sub#139_ret#49]];
	assume {:sourceloc "buggy_38.sol", 192, 28} {:message ""} true;
	call findfourPercent#602_ret#50 := findfourPercent#602(__this, __msg_sender, __msg_value, value#822);
	tokensToBurn#868 := findfourPercent#602_ret#50;
	assume {:sourceloc "buggy_38.sol", 193, 32} {:message ""} true;
	call sub#139_ret#51 := sub#139(__this, __msg_sender, __msg_value, value#822, tokensToBurn#868);
	tokensToTransfer#874 := sub#139_ret#51;
	assume {:sourceloc "buggy_38.sol", 195, 21} {:message ""} true;
	call add#163_ret#52 := add#163(__this, __msg_sender, __msg_value, _balances#364[__this][to#820], tokensToTransfer#874);
	_balances#364 := _balances#364[__this := _balances#364[__this][to#820 := add#163_ret#52]];
	assume {:sourceloc "buggy_38.sol", 196, 20} {:message ""} true;
	call sub#139_ret#53 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#447[__this], tokensToBurn#868);
	_totalSupply#447 := _totalSupply#447[__this := sub#139_ret#53];
	assume {:sourceloc "buggy_38.sol", 198, 34} {:message ""} true;
	call sub#139_ret#54 := sub#139(__this, __msg_sender, __msg_value, _allowed#383[__this][from#818][__msg_sender], value#822);
	_allowed#383 := _allowed#383[__this := _allowed#383[__this][from#818 := _allowed#383[__this][from#818][__msg_sender := sub#139_ret#54]]];
	assume {:sourceloc "buggy_38.sol", 200, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#818, to#820, tokensToTransfer#874);
	call_arg#55 := 0;
	assume {:sourceloc "buggy_38.sol", 201, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#818, call_arg#55, tokensToBurn#868);
	#826 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_38.sol", 205, 1} {:message "BIGBOMBv2::bug_unchk_send23"} bug_unchk_send23#946(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#56: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#56 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 206, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#56);
	$return41:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 208, 3} {:message "BIGBOMBv2::increaseAllowance"} increaseAllowance#997(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#948: address_t, addedValue#950: int)
	returns (#953: bool)
{
	var add#163_ret#57: int;
	var call_arg#58: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#948 != 0);
	assume {:sourceloc "buggy_38.sol", 210, 38} {:message ""} true;
	call add#163_ret#57 := add#163(__this, __msg_sender, __msg_value, _allowed#383[__this][__msg_sender][spender#948], addedValue#950);
	_allowed#383 := _allowed#383[__this := _allowed#383[__this][__msg_sender := _allowed#383[__this][__msg_sender][spender#948 := add#163_ret#57]]];
	call_arg#58 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 211, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#58, spender#948, _allowed#383[__this][__msg_sender][spender#948]);
	#953 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_38.sol", 214, 1} {:message "BIGBOMBv2::bug_unchk_send14"} bug_unchk_send14#1010(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#59 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 215, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#59);
	$return43:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 217, 3} {:message "BIGBOMBv2::decreaseAllowance"} decreaseAllowance#1061(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1012: address_t, subtractedValue#1014: int)
	returns (#1017: bool)
{
	var sub#139_ret#60: int;
	var call_arg#61: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1012 != 0);
	assume {:sourceloc "buggy_38.sol", 219, 38} {:message ""} true;
	call sub#139_ret#60 := sub#139(__this, __msg_sender, __msg_value, _allowed#383[__this][__msg_sender][spender#1012], subtractedValue#1014);
	_allowed#383 := _allowed#383[__this := _allowed#383[__this][__msg_sender := _allowed#383[__this][__msg_sender][spender#1012 := sub#139_ret#60]]];
	call_arg#61 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 220, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#61, spender#1012, _allowed#383[__this][__msg_sender][spender#1012]);
	#1017 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_38.sol", 223, 1} {:message "BIGBOMBv2::bug_unchk_send30"} bug_unchk_send30#1074(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#62: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#62 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 224, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#62);
	$return45:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 226, 3} {:message "BIGBOMBv2::_mint"} _mint#1108(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1076: address_t, amount#1078: int)
{
	var add#163_ret#63: int;
	var call_arg#64: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1078 != 0);
	assume {:sourceloc "buggy_38.sol", 228, 26} {:message ""} true;
	call add#163_ret#63 := add#163(__this, __msg_sender, __msg_value, _balances#364[__this][account#1076], amount#1078);
	_balances#364 := _balances#364[__this := _balances#364[__this][account#1076 := add#163_ret#63]];
	call_arg#64 := 0;
	assume {:sourceloc "buggy_38.sol", 229, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#64, account#1076, amount#1078);
	$return46:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_38.sol", 231, 1} {:message "BIGBOMBv2::bug_unchk_send8"} bug_unchk_send8#1121(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#65: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#65 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 232, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#65);
	$return47:
	// Function body ends here
}

// 
// Function: burn
procedure {:sourceloc "buggy_38.sol", 234, 3} {:message "BIGBOMBv2::burn"} burn#1133(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1123: int)
{
	var call_arg#66: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#66 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 235, 5} {:message ""} true;
	call _burn#1195(__this, __msg_sender, __msg_value, call_arg#66, amount#1123);
	$return48:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_38.sol", 237, 1} {:message "BIGBOMBv2::bug_unchk_send27"} bug_unchk_send27#1146(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#67: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#67 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 238, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#67);
	$return49:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 240, 3} {:message "BIGBOMBv2::_burn"} _burn#1195(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1148: address_t, amount#1150: int)
{
	var sub#139_ret#68: int;
	var sub#139_ret#69: int;
	var call_arg#70: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1150 != 0);
	assume (amount#1150 <= _balances#364[__this][account#1148]);
	assume {:sourceloc "buggy_38.sol", 243, 20} {:message ""} true;
	call sub#139_ret#68 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#447[__this], amount#1150);
	_totalSupply#447 := _totalSupply#447[__this := sub#139_ret#68];
	assume {:sourceloc "buggy_38.sol", 244, 26} {:message ""} true;
	call sub#139_ret#69 := sub#139(__this, __msg_sender, __msg_value, _balances#364[__this][account#1148], amount#1150);
	_balances#364 := _balances#364[__this := _balances#364[__this][account#1148 := sub#139_ret#69]];
	call_arg#70 := 0;
	assume {:sourceloc "buggy_38.sol", 245, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, account#1148, call_arg#70, amount#1150);
	$return50:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_38.sol", 247, 1} {:message "BIGBOMBv2::bug_unchk_send31"} bug_unchk_send31#1208(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#71: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#71 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 248, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#71);
	$return51:
	// Function body ends here
}

// 
// Function: burnFrom
procedure {:sourceloc "buggy_38.sol", 250, 3} {:message "BIGBOMBv2::burnFrom"} burnFrom#1249(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1210: address_t, amount#1212: int)
{
	var sub#139_ret#72: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1212 <= _allowed#383[__this][account#1210][__msg_sender]);
	assume {:sourceloc "buggy_38.sol", 252, 37} {:message ""} true;
	call sub#139_ret#72 := sub#139(__this, __msg_sender, __msg_value, _allowed#383[__this][account#1210][__msg_sender], amount#1212);
	_allowed#383 := _allowed#383[__this := _allowed#383[__this][account#1210 := _allowed#383[__this][account#1210][__msg_sender := sub#139_ret#72]]];
	assume {:sourceloc "buggy_38.sol", 253, 5} {:message ""} true;
	call _burn#1195(__this, __msg_sender, __msg_value, account#1210, amount#1212);
	$return52:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_38.sol", 255, 1} {:message "BIGBOMBv2::bug_unchk_send13"} bug_unchk_send13#1262(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#73: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#73 := 1000000000000000000;
	assume {:sourceloc "buggy_38.sol", 256, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#73);
	$return53:
	// Function body ends here
}

