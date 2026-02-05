// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_9.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 16, 3} {:message "SafeMath::mul"} mul#36(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (c#10: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#5 == 0)) {
	c#10 := 0;
	goto $return0;
	}

	c#10 := (a#5 * b#7);
	assert {:sourceloc "buggy_9.sol", 21, 5} {:message "Assertion might not hold."} ((c#10 div a#5) == b#7);
	c#10 := c#10;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 28, 3} {:message "SafeMath::div"} div#51(__this: address_t, __msg_sender: address_t, __msg_value: int, a#39: int, b#41: int)
	returns (#44: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#44 := (a#39 div b#41);
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 38, 3} {:message "SafeMath::sub"} sub#72(__this: address_t, __msg_sender: address_t, __msg_value: int, a#54: int, b#56: int)
	returns (#59: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_9.sol", 39, 5} {:message "Assertion might not hold."} (b#56 <= a#54);
	#59 := (a#54 - b#56);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 46, 3} {:message "SafeMath::add"} add#97(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
	returns (c#80: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#80 := (a#75 + b#77);
	assert {:sourceloc "buggy_9.sol", 48, 5} {:message "Assertion might not hold."} (c#80 >= a#75);
	c#80 := c#80;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_9.sol", 11, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#98(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Ownable -------
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_9.sol", 55, 3} {:message "Ownable::bug_unchk_send21"} bug_unchk_send21#111(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 56, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_9.sol", 57, 3} {:message "owner"} owner#113: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 59, 3} {:message "Ownable::[constructor]"} __constructor#147(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#113 := owner#113[__this := 0];
	// Function body starts here
	owner#113 := owner#113[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_9.sol", 62, 1} {:message "Ownable::bug_unchk_send3"} bug_unchk_send3#135(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 63, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return6:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_9.sol", 103, 3} {:message "[event] TokenERC20::Transfer"} Transfer#284(__this: address_t, __msg_sender: address_t, __msg_value: int, from#278: address_t, to#280: address_t, value#282: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_9.sol", 108, 3} {:message "[event] TokenERC20::Approval"} Approval#305(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#299: address_t, spender#301: address_t, value#303: int)
{
	
}

// 
// Event: Mint
procedure {:inline 1} {:sourceloc "buggy_9.sol", 113, 3} {:message "[event] TokenERC20::Mint"} Mint#324(__this: address_t, __msg_sender: address_t, __msg_value: int, to#320: address_t, amount#322: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_9.sol", 75, 3} {:message "TokenERC20::bug_unchk_send10"} bug_unchk_send10#165(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 76, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_9.sol", 77, 3} {:message "name"} name#167: [address_t]int_arr_type;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_9.sol", 78, 3} {:message "TokenERC20::bug_unchk_send22"} bug_unchk_send22#180(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 79, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_9.sol", 80, 3} {:message "symbol"} symbol#182: [address_t]int_arr_type;
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_9.sol", 81, 3} {:message "TokenERC20::bug_unchk_send12"} bug_unchk_send12#195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 82, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_9.sol", 83, 3} {:message "decimals"} decimals#197: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_9.sol", 85, 3} {:message "TokenERC20::bug_unchk_send11"} bug_unchk_send11#210(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 86, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return10:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_9.sol", 87, 3} {:message "_totalSupply"} _totalSupply#212: [address_t]int;
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_9.sol", 88, 3} {:message "TokenERC20::bug_unchk_send1"} bug_unchk_send1#225(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 89, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return11:
	// Function body ends here
}

// 
// State variable: cap: uint256
var {:sourceloc "buggy_9.sol", 90, 3} {:message "cap"} cap#227: [address_t]int;
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_9.sol", 93, 3} {:message "TokenERC20::bug_unchk_send2"} bug_unchk_send2#240(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 94, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return12:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 95, 3} {:message "_balances"} _balances#244: [address_t][address_t]int;
// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_9.sol", 96, 3} {:message "TokenERC20::bug_unchk_send17"} bug_unchk_send17#257(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 97, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return13:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_9.sol", 98, 3} {:message "_allowed"} _allowed#263: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_9.sol", 101, 3} {:message "TokenERC20::bug_unchk_send27"} bug_unchk_send27#276(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 102, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_9.sol", 106, 3} {:message "TokenERC20::bug_unchk_send31"} bug_unchk_send31#297(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 107, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_9.sol", 111, 3} {:message "TokenERC20::bug_unchk_send13"} bug_unchk_send13#318(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 112, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return16:
	// Function body ends here
}

type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 128, 5} {:message "TokenERC20::[constructor]"} __constructor#851(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#344: int, _initialSupply#346: int, _name#348: int_arr_ptr, _symbol#350: int_arr_ptr, _decimals#352: int)
{
	var call_arg#13: address_t;
	// TCC assumptions
	assume (_name#348 < __alloc_counter);
	assume (_symbol#350 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#167 := name#167[__this := int_arr#constr(default_int_int(), 0)];
	symbol#182 := symbol#182[__this := int_arr#constr(default_int_int(), 0)];
	decimals#197 := decimals#197[__this := 0];
	_totalSupply#212 := _totalSupply#212[__this := 0];
	cap#227 := cap#227[__this := 0];
	_balances#244 := _balances#244[__this := default_address_t_int()];
	_allowed#263 := _allowed#263[__this := default_address_t__k_address_t_v_int()];
	owner#113 := owner#113[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#113 := owner#113[__this := __msg_sender];
	$return17:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	assume (_cap#344 >= _initialSupply#346);
	cap#227 := cap#227[__this := _cap#344];
	name#167 := name#167[__this := mem_arr_int[_name#348]];
	symbol#182 := symbol#182[__this := mem_arr_int[_symbol#350]];
	decimals#197 := decimals#197[__this := _decimals#352];
	_totalSupply#212 := _totalSupply#212[__this := _initialSupply#346];
	_balances#244 := _balances#244[__this := _balances#244[__this][owner#113[__this] := _totalSupply#212[__this]]];
	call_arg#13 := 0;
	assume {:sourceloc "buggy_9.sol", 144, 14} {:message ""} true;
	call Transfer#284(__this, __msg_sender, __msg_value, call_arg#13, owner#113[__this], _totalSupply#212[__this]);
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_9.sol", 146, 1} {:message "TokenERC20::bug_unchk_send9"} bug_unchk_send9#410(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 147, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return19:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 152, 5} {:message "TokenERC20::totalSupply"} totalSupply#419(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#414: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#414 := _totalSupply#212[__this];
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_9.sol", 155, 1} {:message "TokenERC20::bug_unchk_send25"} bug_unchk_send25#432(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 156, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return21:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 163, 5} {:message "TokenERC20::balanceOf"} balanceOf#445(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#435: address_t)
	returns (#438: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#438 := _balances#244[__this][_owner#435];
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_9.sol", 166, 1} {:message "TokenERC20::bug_unchk_send19"} bug_unchk_send19#458(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 167, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return23:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 175, 5} {:message "TokenERC20::allowance"} allowance#475(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#461: address_t, _spender#463: address_t)
	returns (#466: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#466 := _allowed#263[__this][_owner#461][_spender#463];
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_9.sol", 178, 1} {:message "TokenERC20::bug_unchk_send26"} bug_unchk_send26#488(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 179, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return25:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 186, 5} {:message "TokenERC20::transfer"} transfer#508(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#491: address_t, _value#493: int)
	returns (#496: bool)
{
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 187, 9} {:message ""} true;
	call _transfer#652(__this, __msg_sender, __msg_value, call_arg#18, _to#491, _value#493);
	#496 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_9.sol", 190, 1} {:message "TokenERC20::bug_unchk_send20"} bug_unchk_send20#521(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 191, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return27:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 202, 5} {:message "TokenERC20::approve"} approve#541(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#524: address_t, _value#526: int)
	returns (#529: bool)
{
	var call_arg#20: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#20 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 203, 9} {:message ""} true;
	call _approve#710(__this, __msg_sender, __msg_value, call_arg#20, _spender#524, _value#526);
	#529 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_9.sol", 206, 1} {:message "TokenERC20::bug_unchk_send32"} bug_unchk_send32#554(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 207, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return29:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 217, 5} {:message "TokenERC20::transferFrom"} transferFrom#590(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#557: address_t, _to#559: address_t, _value#561: int)
	returns (#564: bool)
{
	var call_arg#22: address_t;
	var sub#72_ret#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 218, 9} {:message ""} true;
	call _transfer#652(__this, __msg_sender, __msg_value, _from#557, _to#559, _value#561);
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 219, 37} {:message ""} true;
	call sub#72_ret#23 := sub#72(__this, __msg_sender, __msg_value, _allowed#263[__this][_from#557][__msg_sender], _value#561);
	assume {:sourceloc "buggy_9.sol", 219, 9} {:message ""} true;
	call _approve#710(__this, __msg_sender, __msg_value, _from#557, call_arg#22, sub#72_ret#23);
	#564 := true;
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_9.sol", 222, 1} {:message "TokenERC20::bug_unchk_send4"} bug_unchk_send4#603(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 223, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return31:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 231, 5} {:message "TokenERC20::_transfer"} _transfer#652(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#606: address_t, _to#608: address_t, _value#610: int)
{
	var call_arg#25: int_arr_ptr;
	var new_array#26: int_arr_ptr;
	var sub#72_ret#27: int;
	var add#97_ret#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#26 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#25 := new_array#26;
	mem_arr_int := mem_arr_int[call_arg#25 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (_to#608 != 0);
	assume {:sourceloc "buggy_9.sol", 234, 28} {:message ""} true;
	call sub#72_ret#27 := sub#72(__this, __msg_sender, __msg_value, _balances#244[__this][_from#606], _value#610);
	_balances#244 := _balances#244[__this := _balances#244[__this][_from#606 := sub#72_ret#27]];
	assume {:sourceloc "buggy_9.sol", 235, 26} {:message ""} true;
	call add#97_ret#28 := add#97(__this, __msg_sender, __msg_value, _balances#244[__this][_to#608], _value#610);
	_balances#244 := _balances#244[__this := _balances#244[__this][_to#608 := add#97_ret#28]];
	assume {:sourceloc "buggy_9.sol", 236, 14} {:message ""} true;
	call Transfer#284(__this, __msg_sender, __msg_value, _from#606, _to#608, _value#610);
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_9.sol", 238, 1} {:message "TokenERC20::bug_unchk_send7"} bug_unchk_send7#665(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#29 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 239, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#29);
	$return33:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 247, 5} {:message "TokenERC20::_approve"} _approve#710(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#668: address_t, _spender#670: address_t, _value#672: int)
{
	var call_arg#30: int_arr_ptr;
	var new_array#31: int_arr_ptr;
	var call_arg#32: int_arr_ptr;
	var new_array#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#31 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#30 := new_array#31;
	mem_arr_int := mem_arr_int[call_arg#30 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (_owner#668 != 0);
	new_array#33 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#32 := new_array#33;
	mem_arr_int := mem_arr_int[call_arg#32 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (_spender#670 != 0);
	_allowed#263 := _allowed#263[__this := _allowed#263[__this][_owner#668 := _allowed#263[__this][_owner#668][_spender#670 := _value#672]]];
	assume {:sourceloc "buggy_9.sol", 252, 14} {:message ""} true;
	call Approval#305(__this, __msg_sender, __msg_value, _owner#668, _spender#670, _value#672);
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_9.sol", 254, 1} {:message "TokenERC20::bug_unchk_send23"} bug_unchk_send23#723(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#34 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 255, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#34);
	$return35:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 263, 5} {:message "TokenERC20::mint"} mint#779(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#726: address_t, _amount#728: int)
	returns (#733: bool)
{
	var add#97_ret#37: int;
	var add#97_ret#38: int;
	var add#97_ret#39: int;
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#113[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 264, 17} {:message ""} true;
	call add#97_ret#37 := add#97(__this, __msg_sender, __msg_value, _totalSupply#212[__this], _amount#728);
	assume (add#97_ret#37 <= cap#227[__this]);
	assume {:sourceloc "buggy_9.sol", 266, 24} {:message ""} true;
	call add#97_ret#38 := add#97(__this, __msg_sender, __msg_value, _totalSupply#212[__this], _amount#728);
	_totalSupply#212 := _totalSupply#212[__this := add#97_ret#38];
	assume {:sourceloc "buggy_9.sol", 267, 26} {:message ""} true;
	call add#97_ret#39 := add#97(__this, __msg_sender, __msg_value, _balances#244[__this][_to#726], _amount#728);
	_balances#244 := _balances#244[__this := _balances#244[__this][_to#726 := add#97_ret#39]];
	assume {:sourceloc "buggy_9.sol", 268, 14} {:message ""} true;
	call Mint#324(__this, __msg_sender, __msg_value, _to#726, _amount#728);
	call_arg#40 := 0;
	assume {:sourceloc "buggy_9.sol", 269, 14} {:message ""} true;
	call Transfer#284(__this, __msg_sender, __msg_value, call_arg#40, _to#726, _amount#728);
	#733 := true;
	goto $return37;
	$return37:
	// Function body ends here
	$return36:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_9.sol", 272, 1} {:message "TokenERC20::bug_unchk_send14"} bug_unchk_send14#792(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 273, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#41);
	$return38:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: transferBatch : function (address[] memory,uint256[] memory) returns (bool)
procedure {:sourceloc "buggy_9.sol", 280, 5} {:message "TokenERC20::transferBatch"} transferBatch#837(__this: address_t, __msg_sender: address_t, __msg_value: int, _tos#796: address_t_arr_ptr, _values#799: int_arr_ptr)
	returns (#802: bool)
{
	var {:sourceloc "buggy_9.sol", 283, 14} {:message "i"} i#813: int;
	var transfer#508_ret#44: bool;
	var tmp#45: int;
	// TCC assumptions
	assume (_tos#796 < __alloc_counter);
	assume (_values#799 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#796])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#796]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_values#799])) && (length#int_arr#constr(mem_arr_int[_values#799]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_tos#796]) == length#int_arr#constr(mem_arr_int[_values#799]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#813 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#796])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#796]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#813 < length#address_t_arr#constr(mem_arr_address_t[_tos#796]))) {
	// Body
	assume {:sourceloc "buggy_9.sol", 284, 13} {:message ""} true;
	call transfer#508_ret#44 := transfer#508(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_tos#796])[i#813], arr#int_arr#constr(mem_arr_int[_values#799])[i#813]);
	$continue42:
	// Loop expression
	tmp#45 := i#813;
	i#813 := (i#813 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#796])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#796]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break43:
	#802 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_9.sol", 288, 1} {:message "TokenERC20::bug_unchk_send30"} bug_unchk_send30#850(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 289, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#46);
	$return40:
	// Function body ends here
}

// 
// ------- Contract: XLToken -------
// Inherits from: TokenERC20
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 298, 5} {:message "XLToken::[constructor]"} __constructor#888(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#855: int, _initialSupply#857: int, _name#859: int_arr_ptr, _symbol#861: int_arr_ptr, _decimals#863: int)
{
	var _cap#344#47: int;
	var _initialSupply#346#47: int;
	var _name#348#47: int_arr_ptr;
	var _symbol#350#47: int_arr_ptr;
	var _decimals#352#47: int;
	var call_arg#49: address_t;
	// TCC assumptions
	assume (_name#859 < __alloc_counter);
	assume (_symbol#861 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#167 := name#167[__this := int_arr#constr(default_int_int(), 0)];
	symbol#182 := symbol#182[__this := int_arr#constr(default_int_int(), 0)];
	decimals#197 := decimals#197[__this := 0];
	_totalSupply#212 := _totalSupply#212[__this := 0];
	cap#227 := cap#227[__this := 0];
	_balances#244 := _balances#244[__this := default_address_t_int()];
	_allowed#263 := _allowed#263[__this := default_address_t__k_address_t_v_int()];
	owner#113 := owner#113[__this := 0];
	// Arguments for TokenERC20
	_cap#344#47 := _cap#855;
	_initialSupply#346#47 := _initialSupply#857;
	_name#348#47 := _name#859;
	_symbol#350#47 := _symbol#861;
	_decimals#352#47 := _decimals#863;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#113 := owner#113[__this := __msg_sender];
	$return41:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	assume (_cap#344#47 >= _initialSupply#346#47);
	cap#227 := cap#227[__this := _cap#344#47];
	name#167 := name#167[__this := mem_arr_int[_name#348#47]];
	symbol#182 := symbol#182[__this := mem_arr_int[_symbol#350#47]];
	decimals#197 := decimals#197[__this := _decimals#352#47];
	_totalSupply#212 := _totalSupply#212[__this := _initialSupply#346#47];
	_balances#244 := _balances#244[__this := _balances#244[__this][owner#113[__this] := _totalSupply#212[__this]]];
	call_arg#49 := 0;
	assume {:sourceloc "buggy_9.sol", 144, 14} {:message ""} true;
	call Transfer#284(__this, __msg_sender, __msg_value, call_arg#49, owner#113[__this], _totalSupply#212[__this]);
	$return42:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_9.sol", 299, 1} {:message "XLToken::bug_unchk_send8"} bug_unchk_send8#887(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#51 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 300, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#51);
	$return44:
	// Function body ends here
}

