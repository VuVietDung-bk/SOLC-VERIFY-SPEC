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
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_9.sol", 55, 3} {:message "payedOut_unchk9"} payedOut_unchk9#101: [address_t]bool;
procedure {:inline 1} {:message "send"} __send(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
	returns (__result: bool)
{
	assume (__balance[__msg_sender] >= amount);
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	__result := true;
	}
	else {
	__result := false;
	}

}

// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_9.sol", 57, 1} {:message "Ownable::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#122(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#101[__this];
	assume {:sourceloc "buggy_9.sol", 59, 3} {:message ""} true;
	call __send_ret#0 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_9.sol", 61, 3} {:message "owner"} owner#124: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 63, 5} {:message "Ownable::[constructor]"} __constructor#160(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk9#101 := payedOut_unchk9#101[__this := false];
	owner#124 := owner#124[__this := 0];
	// Function body starts here
	owner#124 := owner#124[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_9.sol", 66, 1} {:message "Ownable::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#148(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 67, 4} {:message "addr_unchk4"} addr_unchk4#137: address_t;
	var call_arg#1: int;
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#137 := 0;
	call_arg#1 := 42000000000000000000;
	assume {:sourceloc "buggy_9.sol", 68, 10} {:message ""} true;
	call __send_ret#2 := __send(addr_unchk4#137, __this, 0, call_arg#1);
	if (!(__send_ret#2)) {
	
	}
	else {
	
	}

	$return6:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_9.sol", 140, 3} {:message "[event] TokenERC20::Transfer"} Transfer#349(__this: address_t, __msg_sender: address_t, __msg_value: int, from#343: address_t, to#345: address_t, value#347: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_9.sol", 149, 3} {:message "[event] TokenERC20::Approval"} Approval#381(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#375: address_t, spender#377: address_t, value#379: int)
{
	
}

// 
// Event: Mint
procedure {:inline 1} {:sourceloc "buggy_9.sol", 155, 3} {:message "[event] TokenERC20::Mint"} Mint#401(__this: address_t, __msg_sender: address_t, __msg_value: int, to#397: address_t, amount#399: int)
{
	
}

// Using library SafeMath for uint256
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
procedure {:inline 1} {:message "call"} __call(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (__result: bool, __calldata: int_arr_ptr)
{
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	__result := true;
	}
	else {
	__result := false;
	}

}

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 86, 3} {:message "TokenERC20::callnotchecked_unchk25"} callnotchecked_unchk25#179(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#167: address_t)
{
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_9.sol", 87, 5} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(callee#167, __this, 1000000000000000000);
	if (__call_ret#3) {
	havoc name#181;
	havoc symbol#204;
	havoc decimals#218;
	havoc payedOut_unchk20#221;
	havoc winner_unchk20#223;
	havoc winAmount_unchk20#225;
	havoc _totalSupply#246;
	havoc payedOut_unchk32#249;
	havoc winner_unchk32#251;
	havoc winAmount_unchk32#253;
	havoc cap#274;
	havoc _balances#290;
	havoc _allowed#320;
	havoc payedOut_unchk45#352;
	havoc payedOut_unchk8#607;
	havoc winner_unchk8#609;
	havoc winAmount_unchk8#611;
	havoc payedOut_unchk44#823;
	havoc winner_unchk44#825;
	havoc winAmount_unchk44#827;
	havoc payedOut_unchk33#965;
	havoc payedOut_unchk9#101;
	havoc owner#124;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_9.sol", 89, 3} {:message "name"} name#181: [address_t]int_arr_type;
// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_9.sol", 90, 3} {:message "TokenERC20::bug_unchk19"} bug_unchk19#202(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 91, 1} {:message "addr_unchk19"} addr_unchk19#185: address_t;
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#185 := 0;
	call_arg#5 := 10000000000000000000;
	assume {:sourceloc "buggy_9.sol", 92, 6} {:message ""} true;
	call __send_ret#6 := __send(addr_unchk19#185, __this, 0, call_arg#5);
	if ((!(__send_ret#6) || (1 == 1))) {
	assume false;
	}

	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_9.sol", 95, 3} {:message "symbol"} symbol#204: [address_t]int_arr_type;
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 96, 3} {:message "TokenERC20::unhandledsend_unchk26"} unhandledsend_unchk26#216(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#206: address_t)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := 5000000000000000000;
	assume {:sourceloc "buggy_9.sol", 97, 5} {:message ""} true;
	call __send_ret#8 := __send(callee#206, __this, 0, call_arg#7);
	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_9.sol", 99, 3} {:message "decimals"} decimals#218: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_9.sol", 101, 3} {:message "payedOut_unchk20"} payedOut_unchk20#221: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_9.sol", 102, 1} {:message "winner_unchk20"} winner_unchk20#223: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_9.sol", 103, 1} {:message "winAmount_unchk20"} winAmount_unchk20#225: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_9.sol", 105, 1} {:message "TokenERC20::sendToWinner_unchk20"} sendToWinner_unchk20#244(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#221[__this]);
	assume {:sourceloc "buggy_9.sol", 107, 9} {:message ""} true;
	call __send_ret#9 := __send(winner_unchk20#223[__this], __this, 0, winAmount_unchk20#225[__this]);
	payedOut_unchk20#221 := payedOut_unchk20#221[__this := true];
	$return10:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_9.sol", 110, 3} {:message "_totalSupply"} _totalSupply#246: [address_t]int;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_9.sol", 111, 3} {:message "payedOut_unchk32"} payedOut_unchk32#249: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_9.sol", 112, 1} {:message "winner_unchk32"} winner_unchk32#251: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_9.sol", 113, 1} {:message "winAmount_unchk32"} winAmount_unchk32#253: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_9.sol", 115, 1} {:message "TokenERC20::sendToWinner_unchk32"} sendToWinner_unchk32#272(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#249[__this]);
	assume {:sourceloc "buggy_9.sol", 117, 9} {:message ""} true;
	call __send_ret#10 := __send(winner_unchk32#251[__this], __this, 0, winAmount_unchk32#253[__this]);
	payedOut_unchk32#249 := payedOut_unchk32#249[__this := true];
	$return11:
	// Function body ends here
}

// 
// State variable: cap: uint256
var {:sourceloc "buggy_9.sol", 120, 3} {:message "cap"} cap#274: [address_t]int;
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 123, 3} {:message "TokenERC20::unhandledsend_unchk38"} unhandledsend_unchk38#286(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#276: address_t)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := 5000000000000000000;
	assume {:sourceloc "buggy_9.sol", 124, 5} {:message ""} true;
	call __send_ret#12 := __send(callee#276, __this, 0, call_arg#11);
	$return12:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 126, 3} {:message "_balances"} _balances#290: [address_t][address_t]int;
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_9.sol", 127, 3} {:message "TokenERC20::cash_unchk46"} cash_unchk46#314(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#292: int, subpotIndex#294: int, winner_unchk46#296: address_t)
{
	var {:sourceloc "buggy_9.sol", 128, 9} {:message "subpot_unchk46"} subpot_unchk46#300: int;
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#300 := 3000000000000000000;
	call_arg#13 := subpot_unchk46#300;
	assume {:sourceloc "buggy_9.sol", 129, 9} {:message ""} true;
	call __send_ret#14 := __send(winner_unchk46#296, __this, 0, call_arg#13);
	subpot_unchk46#300 := 0;
	$return13:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_9.sol", 132, 3} {:message "_allowed"} _allowed#320: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_9.sol", 135, 3} {:message "TokenERC20::bug_unchk31"} bug_unchk31#341(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 136, 1} {:message "addr_unchk31"} addr_unchk31#324: address_t;
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#324 := 0;
	call_arg#15 := 10000000000000000000;
	assume {:sourceloc "buggy_9.sol", 137, 6} {:message ""} true;
	call __send_ret#16 := __send(addr_unchk31#324, __this, 0, call_arg#15);
	if ((!(__send_ret#16) || (1 == 1))) {
	assume false;
	}

	$return14:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_9.sol", 143, 3} {:message "payedOut_unchk45"} payedOut_unchk45#352: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_9.sol", 145, 1} {:message "TokenERC20::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#373(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#352[__this];
	assume {:sourceloc "buggy_9.sol", 147, 3} {:message ""} true;
	call __send_ret#17 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return15:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_9.sol", 152, 3} {:message "TokenERC20::callnotchecked_unchk13"} callnotchecked_unchk13#395(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#383: address_t)
{
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_9.sol", 153, 5} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(callee#383, __this, 1000000000000000000);
	if (__call_ret#18) {
	havoc name#181;
	havoc symbol#204;
	havoc decimals#218;
	havoc payedOut_unchk20#221;
	havoc winner_unchk20#223;
	havoc winAmount_unchk20#225;
	havoc _totalSupply#246;
	havoc payedOut_unchk32#249;
	havoc winner_unchk32#251;
	havoc winAmount_unchk32#253;
	havoc cap#274;
	havoc _balances#290;
	havoc _allowed#320;
	havoc payedOut_unchk45#352;
	havoc payedOut_unchk8#607;
	havoc winner_unchk8#609;
	havoc winAmount_unchk8#611;
	havoc payedOut_unchk44#823;
	havoc winner_unchk44#825;
	havoc winAmount_unchk44#827;
	havoc payedOut_unchk33#965;
	havoc payedOut_unchk9#101;
	havoc owner#124;
	havoc __balance;
	}

	if (!(__call_ret#18)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return16:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 170, 5} {:message "TokenERC20::[constructor]"} __constructor#987(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#421: int, _initialSupply#423: int, _name#425: int_arr_ptr, _symbol#427: int_arr_ptr, _decimals#429: int)
{
	var call_arg#21: address_t;
	// TCC assumptions
	assume (_name#425 < __alloc_counter);
	assume (_symbol#427 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#181 := name#181[__this := int_arr#constr(default_int_int(), 0)];
	symbol#204 := symbol#204[__this := int_arr#constr(default_int_int(), 0)];
	decimals#218 := decimals#218[__this := 0];
	payedOut_unchk20#221 := payedOut_unchk20#221[__this := false];
	winner_unchk20#223 := winner_unchk20#223[__this := 0];
	winAmount_unchk20#225 := winAmount_unchk20#225[__this := 0];
	_totalSupply#246 := _totalSupply#246[__this := 0];
	payedOut_unchk32#249 := payedOut_unchk32#249[__this := false];
	winner_unchk32#251 := winner_unchk32#251[__this := 0];
	winAmount_unchk32#253 := winAmount_unchk32#253[__this := 0];
	cap#274 := cap#274[__this := 0];
	_balances#290 := _balances#290[__this := default_address_t_int()];
	_allowed#320 := _allowed#320[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#352 := payedOut_unchk45#352[__this := false];
	payedOut_unchk8#607 := payedOut_unchk8#607[__this := false];
	winner_unchk8#609 := winner_unchk8#609[__this := 0];
	winAmount_unchk8#611 := winAmount_unchk8#611[__this := 0];
	payedOut_unchk44#823 := payedOut_unchk44#823[__this := false];
	winner_unchk44#825 := winner_unchk44#825[__this := 0];
	winAmount_unchk44#827 := winAmount_unchk44#827[__this := 0];
	payedOut_unchk33#965 := payedOut_unchk33#965[__this := false];
	payedOut_unchk9#101 := payedOut_unchk9#101[__this := false];
	owner#124 := owner#124[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#124 := owner#124[__this := __msg_sender];
	$return17:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	assume (_cap#421 >= _initialSupply#423);
	cap#274 := cap#274[__this := _cap#421];
	name#181 := name#181[__this := mem_arr_int[_name#425]];
	symbol#204 := symbol#204[__this := mem_arr_int[_symbol#427]];
	decimals#218 := decimals#218[__this := _decimals#429];
	_totalSupply#246 := _totalSupply#246[__this := _initialSupply#423];
	_balances#290 := _balances#290[__this := _balances#290[__this][owner#124[__this] := _totalSupply#246[__this]]];
	call_arg#21 := 0;
	assume {:sourceloc "buggy_9.sol", 186, 14} {:message ""} true;
	call Transfer#349(__this, __msg_sender, __msg_value, call_arg#21, owner#124[__this], _totalSupply#246[__this]);
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_9.sol", 188, 1} {:message "TokenERC20::bug_unchk7"} bug_unchk7#495(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 189, 1} {:message "addr_unchk7"} addr_unchk7#478: address_t;
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#478 := 0;
	call_arg#22 := 10000000000000000000;
	assume {:sourceloc "buggy_9.sol", 190, 6} {:message ""} true;
	call __send_ret#23 := __send(addr_unchk7#478, __this, 0, call_arg#22);
	if ((!(__send_ret#23) || (1 == 1))) {
	assume false;
	}

	$return19:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 197, 5} {:message "TokenERC20::totalSupply"} totalSupply#504(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#499: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#499 := _totalSupply#246[__this];
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 200, 1} {:message "TokenERC20::my_func_unchk23"} my_func_unchk23#517(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#506: address_t)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 201, 9} {:message ""} true;
	call __send_ret#24 := __send(dst#506, __this, 0, __msg_value);
	$return21:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 209, 5} {:message "TokenERC20::balanceOf"} balanceOf#530(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#520: address_t)
	returns (#523: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#523 := _balances#290[__this][_owner#520];
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 212, 1} {:message "TokenERC20::unhandledsend_unchk14"} unhandledsend_unchk14#542(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#532: address_t)
{
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#25 := 5000000000000000000;
	assume {:sourceloc "buggy_9.sol", 213, 5} {:message ""} true;
	call __send_ret#26 := __send(callee#532, __this, 0, call_arg#25);
	$return23:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 222, 5} {:message "TokenERC20::allowance"} allowance#559(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#545: address_t, _spender#547: address_t)
	returns (#550: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#550 := _allowed#320[__this][_owner#545][_spender#547];
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_9.sol", 225, 1} {:message "TokenERC20::bug_unchk30"} bug_unchk30#584(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 226, 1} {:message "receivers_unchk30"} receivers_unchk30#563: int;
	var {:sourceloc "buggy_9.sol", 227, 1} {:message "addr_unchk30"} addr_unchk30#566: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#563 := 0;
	addr_unchk30#566 := 0;
	call_arg#27 := 42000000000000000000;
	assume {:sourceloc "buggy_9.sol", 228, 6} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk30#566, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	receivers_unchk30#563 := (receivers_unchk30#563 + 1);
	}
	else {
	assume false;
	}

	$return25:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 239, 5} {:message "TokenERC20::transfer"} transfer#604(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#587: address_t, _value#589: int)
	returns (#592: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 240, 9} {:message ""} true;
	call _transfer#762(__this, __msg_sender, __msg_value, call_arg#29, _to#587, _value#589);
	#592 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_9.sol", 243, 1} {:message "payedOut_unchk8"} payedOut_unchk8#607: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_9.sol", 244, 1} {:message "winner_unchk8"} winner_unchk8#609: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_9.sol", 245, 1} {:message "winAmount_unchk8"} winAmount_unchk8#611: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_9.sol", 247, 1} {:message "TokenERC20::sendToWinner_unchk8"} sendToWinner_unchk8#630(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#607[__this]);
	assume {:sourceloc "buggy_9.sol", 249, 9} {:message ""} true;
	call __send_ret#30 := __send(winner_unchk8#609[__this], __this, 0, winAmount_unchk8#611[__this]);
	payedOut_unchk8#607 := payedOut_unchk8#607[__this := true];
	$return27:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 262, 5} {:message "TokenERC20::approve"} approve#650(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#633: address_t, _value#635: int)
	returns (#638: bool)
{
	var call_arg#31: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#31 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 263, 9} {:message ""} true;
	call _approve#820(__this, __msg_sender, __msg_value, call_arg#31, _spender#633, _value#635);
	#638 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 266, 1} {:message "TokenERC20::bug_unchk39"} bug_unchk39#662(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#652: address_t)
{
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#32 := 4000000000000000000;
	assume {:sourceloc "buggy_9.sol", 267, 8} {:message ""} true;
	call __send_ret#33 := __send(addr#652, __this, 0, call_arg#32);
	$return29:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 277, 5} {:message "TokenERC20::transferFrom"} transferFrom#698(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#665: address_t, _to#667: address_t, _value#669: int)
	returns (#672: bool)
{
	var call_arg#34: address_t;
	var sub#72_ret#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 278, 9} {:message ""} true;
	call _transfer#762(__this, __msg_sender, __msg_value, _from#665, _to#667, _value#669);
	call_arg#34 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 279, 37} {:message ""} true;
	call sub#72_ret#35 := sub#72(__this, __msg_sender, __msg_value, _allowed#320[__this][_from#665][__msg_sender], _value#669);
	assume {:sourceloc "buggy_9.sol", 279, 9} {:message ""} true;
	call _approve#820(__this, __msg_sender, __msg_value, _from#665, call_arg#34, sub#72_ret#35);
	#672 := true;
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 282, 1} {:message "TokenERC20::my_func_uncheck36"} my_func_uncheck36#713(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#700: address_t)
{
	var __call_ret#36: bool;
	var __call_ret#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_9.sol", 283, 3} {:message ""} true;
	call __call_ret#36, __call_ret#37 := __call(dst#700, __this, __msg_value);
	if (__call_ret#36) {
	havoc name#181;
	havoc symbol#204;
	havoc decimals#218;
	havoc payedOut_unchk20#221;
	havoc winner_unchk20#223;
	havoc winAmount_unchk20#225;
	havoc _totalSupply#246;
	havoc payedOut_unchk32#249;
	havoc winner_unchk32#251;
	havoc winAmount_unchk32#253;
	havoc cap#274;
	havoc _balances#290;
	havoc _allowed#320;
	havoc payedOut_unchk45#352;
	havoc payedOut_unchk8#607;
	havoc winner_unchk8#609;
	havoc winAmount_unchk8#611;
	havoc payedOut_unchk44#823;
	havoc winner_unchk44#825;
	havoc winAmount_unchk44#827;
	havoc payedOut_unchk33#965;
	havoc payedOut_unchk9#101;
	havoc owner#124;
	havoc __balance;
	}

	if (!(__call_ret#36)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return31:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 292, 5} {:message "TokenERC20::_transfer"} _transfer#762(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#716: address_t, _to#718: address_t, _value#720: int)
{
	var call_arg#38: int_arr_ptr;
	var new_array#39: int_arr_ptr;
	var sub#72_ret#40: int;
	var add#97_ret#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#39 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#38 := new_array#39;
	mem_arr_int := mem_arr_int[call_arg#38 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (_to#718 != 0);
	assume {:sourceloc "buggy_9.sol", 295, 28} {:message ""} true;
	call sub#72_ret#40 := sub#72(__this, __msg_sender, __msg_value, _balances#290[__this][_from#716], _value#720);
	_balances#290 := _balances#290[__this := _balances#290[__this][_from#716 := sub#72_ret#40]];
	assume {:sourceloc "buggy_9.sol", 296, 26} {:message ""} true;
	call add#97_ret#41 := add#97(__this, __msg_sender, __msg_value, _balances#290[__this][_to#718], _value#720);
	_balances#290 := _balances#290[__this := _balances#290[__this][_to#718 := add#97_ret#41]];
	assume {:sourceloc "buggy_9.sol", 297, 14} {:message ""} true;
	call Transfer#349(__this, __msg_sender, __msg_value, _from#716, _to#718, _value#720);
	$return32:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 299, 1} {:message "TokenERC20::my_func_unchk35"} my_func_unchk35#775(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#764: address_t)
{
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 300, 9} {:message ""} true;
	call __send_ret#42 := __send(dst#764, __this, 0, __msg_value);
	$return33:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 309, 5} {:message "TokenERC20::_approve"} _approve#820(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#778: address_t, _spender#780: address_t, _value#782: int)
{
	var call_arg#43: int_arr_ptr;
	var new_array#44: int_arr_ptr;
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#44 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#43 := new_array#44;
	mem_arr_int := mem_arr_int[call_arg#43 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (_owner#778 != 0);
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (_spender#780 != 0);
	_allowed#320 := _allowed#320[__this := _allowed#320[__this][_owner#778 := _allowed#320[__this][_owner#778][_spender#780 := _value#782]]];
	assume {:sourceloc "buggy_9.sol", 314, 14} {:message ""} true;
	call Approval#381(__this, __msg_sender, __msg_value, _owner#778, _spender#780, _value#782);
	$return34:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_9.sol", 316, 1} {:message "payedOut_unchk44"} payedOut_unchk44#823: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_9.sol", 317, 1} {:message "winner_unchk44"} winner_unchk44#825: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_9.sol", 318, 1} {:message "winAmount_unchk44"} winAmount_unchk44#827: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_9.sol", 320, 1} {:message "TokenERC20::sendToWinner_unchk44"} sendToWinner_unchk44#846(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#823[__this]);
	assume {:sourceloc "buggy_9.sol", 322, 9} {:message ""} true;
	call __send_ret#47 := __send(winner_unchk44#825[__this], __this, 0, winAmount_unchk44#827[__this]);
	payedOut_unchk44#823 := payedOut_unchk44#823[__this := true];
	$return35:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 332, 5} {:message "TokenERC20::mint"} mint#902(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#849: address_t, _amount#851: int)
	returns (#856: bool)
{
	var add#97_ret#50: int;
	var add#97_ret#51: int;
	var add#97_ret#52: int;
	var call_arg#53: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#124[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 333, 17} {:message ""} true;
	call add#97_ret#50 := add#97(__this, __msg_sender, __msg_value, _totalSupply#246[__this], _amount#851);
	assume (add#97_ret#50 <= cap#274[__this]);
	assume {:sourceloc "buggy_9.sol", 335, 24} {:message ""} true;
	call add#97_ret#51 := add#97(__this, __msg_sender, __msg_value, _totalSupply#246[__this], _amount#851);
	_totalSupply#246 := _totalSupply#246[__this := add#97_ret#51];
	assume {:sourceloc "buggy_9.sol", 336, 26} {:message ""} true;
	call add#97_ret#52 := add#97(__this, __msg_sender, __msg_value, _balances#290[__this][_to#849], _amount#851);
	_balances#290 := _balances#290[__this := _balances#290[__this][_to#849 := add#97_ret#52]];
	assume {:sourceloc "buggy_9.sol", 337, 14} {:message ""} true;
	call Mint#401(__this, __msg_sender, __msg_value, _to#849, _amount#851);
	call_arg#53 := 0;
	assume {:sourceloc "buggy_9.sol", 338, 14} {:message ""} true;
	call Transfer#349(__this, __msg_sender, __msg_value, call_arg#53, _to#849, _amount#851);
	#856 := true;
	goto $return37;
	$return37:
	// Function body ends here
	$return36:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_9.sol", 341, 1} {:message "TokenERC20::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#917(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 342, 4} {:message "addr_unchk40"} addr_unchk40#906: address_t;
	var call_arg#54: int;
	var __send_ret#55: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#906 := 0;
	call_arg#54 := 2000000000000000000;
	assume {:sourceloc "buggy_9.sol", 343, 10} {:message ""} true;
	call __send_ret#55 := __send(addr_unchk40#906, __this, 0, call_arg#54);
	if (!(__send_ret#55)) {
	
	}
	else {
	
	}

	$return38:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: transferBatch : function (address[] memory,uint256[] memory) returns (bool)
procedure {:sourceloc "buggy_9.sol", 356, 5} {:message "TokenERC20::transferBatch"} transferBatch#962(__this: address_t, __msg_sender: address_t, __msg_value: int, _tos#921: address_t_arr_ptr, _values#924: int_arr_ptr)
	returns (#927: bool)
{
	var {:sourceloc "buggy_9.sol", 359, 14} {:message "i"} i#938: int;
	var transfer#604_ret#58: bool;
	var tmp#59: int;
	// TCC assumptions
	assume (_tos#921 < __alloc_counter);
	assume (_values#924 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#921])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#921]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_values#924])) && (length#int_arr#constr(mem_arr_int[_values#924]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_tos#921]) == length#int_arr#constr(mem_arr_int[_values#924]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#938 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#921])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#921]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#938 < length#address_t_arr#constr(mem_arr_address_t[_tos#921]))) {
	// Body
	assume {:sourceloc "buggy_9.sol", 360, 13} {:message ""} true;
	call transfer#604_ret#58 := transfer#604(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_tos#921])[i#938], arr#int_arr#constr(mem_arr_int[_values#924])[i#938]);
	$continue56:
	// Loop expression
	tmp#59 := i#938;
	i#938 := (i#938 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#921])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#921]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break57:
	#927 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_9.sol", 364, 1} {:message "payedOut_unchk33"} payedOut_unchk33#965: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_9.sol", 366, 1} {:message "TokenERC20::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#986(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#60: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#965[__this];
	assume {:sourceloc "buggy_9.sol", 368, 3} {:message ""} true;
	call __send_ret#60 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return40:
	// Function body ends here
}

// 
// ------- Contract: XLToken -------
// Inherits from: TokenERC20
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 378, 3} {:message "XLToken::[constructor]"} __constructor#1023(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#991: int, _initialSupply#993: int, _name#995: int_arr_ptr, _symbol#997: int_arr_ptr, _decimals#999: int)
{
	var _cap#421#61: int;
	var _initialSupply#423#61: int;
	var _name#425#61: int_arr_ptr;
	var _symbol#427#61: int_arr_ptr;
	var _decimals#429#61: int;
	var call_arg#63: address_t;
	// TCC assumptions
	assume (_name#995 < __alloc_counter);
	assume (_symbol#997 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#181 := name#181[__this := int_arr#constr(default_int_int(), 0)];
	symbol#204 := symbol#204[__this := int_arr#constr(default_int_int(), 0)];
	decimals#218 := decimals#218[__this := 0];
	payedOut_unchk20#221 := payedOut_unchk20#221[__this := false];
	winner_unchk20#223 := winner_unchk20#223[__this := 0];
	winAmount_unchk20#225 := winAmount_unchk20#225[__this := 0];
	_totalSupply#246 := _totalSupply#246[__this := 0];
	payedOut_unchk32#249 := payedOut_unchk32#249[__this := false];
	winner_unchk32#251 := winner_unchk32#251[__this := 0];
	winAmount_unchk32#253 := winAmount_unchk32#253[__this := 0];
	cap#274 := cap#274[__this := 0];
	_balances#290 := _balances#290[__this := default_address_t_int()];
	_allowed#320 := _allowed#320[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#352 := payedOut_unchk45#352[__this := false];
	payedOut_unchk8#607 := payedOut_unchk8#607[__this := false];
	winner_unchk8#609 := winner_unchk8#609[__this := 0];
	winAmount_unchk8#611 := winAmount_unchk8#611[__this := 0];
	payedOut_unchk44#823 := payedOut_unchk44#823[__this := false];
	winner_unchk44#825 := winner_unchk44#825[__this := 0];
	winAmount_unchk44#827 := winAmount_unchk44#827[__this := 0];
	payedOut_unchk33#965 := payedOut_unchk33#965[__this := false];
	payedOut_unchk9#101 := payedOut_unchk9#101[__this := false];
	owner#124 := owner#124[__this := 0];
	// Arguments for TokenERC20
	_cap#421#61 := _cap#991;
	_initialSupply#423#61 := _initialSupply#993;
	_name#425#61 := _name#995;
	_symbol#427#61 := _symbol#997;
	_decimals#429#61 := _decimals#999;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#124 := owner#124[__this := __msg_sender];
	$return41:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	assume (_cap#421#61 >= _initialSupply#423#61);
	cap#274 := cap#274[__this := _cap#421#61];
	name#181 := name#181[__this := mem_arr_int[_name#425#61]];
	symbol#204 := symbol#204[__this := mem_arr_int[_symbol#427#61]];
	decimals#218 := decimals#218[__this := _decimals#429#61];
	_totalSupply#246 := _totalSupply#246[__this := _initialSupply#423#61];
	_balances#290 := _balances#290[__this := _balances#290[__this][owner#124[__this] := _totalSupply#246[__this]]];
	call_arg#63 := 0;
	assume {:sourceloc "buggy_9.sol", 186, 14} {:message ""} true;
	call Transfer#349(__this, __msg_sender, __msg_value, call_arg#63, owner#124[__this], _totalSupply#246[__this]);
	$return42:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_9.sol", 379, 1} {:message "XLToken::bug_unchk27"} bug_unchk27#1022(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1012: address_t)
{
	var call_arg#65: int;
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#65 := 42000000000000000000;
	assume {:sourceloc "buggy_9.sol", 380, 8} {:message ""} true;
	call __send_ret#66 := __send(addr#1012, __this, 0, call_arg#65);
	$return44:
	// Function body ends here
}

