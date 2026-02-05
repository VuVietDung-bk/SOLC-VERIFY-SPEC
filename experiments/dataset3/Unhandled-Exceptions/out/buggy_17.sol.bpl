// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_17.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 9, 3} {:message "SafeMath::mul"} mul#34(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_17.sol", 13, 5} {:message "c"} c#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#3 == 0)) {
	#8 := 0;
	goto $return0;
	}

	c#18 := (a#3 * b#5);
	assume ((c#18 div a#3) == b#5);
	#8 := c#18;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 17, 3} {:message "SafeMath::div"} div#58(__this: address_t, __msg_sender: address_t, __msg_value: int, a#36: int, b#38: int)
	returns (#41: int)
{
	var {:sourceloc "buggy_17.sol", 19, 5} {:message "c"} c#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#38 > 0);
	c#50 := (a#36 div b#38);
	#41 := c#50;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 22, 3} {:message "SafeMath::sub"} sub#82(__this: address_t, __msg_sender: address_t, __msg_value: int, a#60: int, b#62: int)
	returns (#65: int)
{
	var {:sourceloc "buggy_17.sol", 24, 5} {:message "c"} c#74: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#62 <= a#60);
	c#74 := (a#60 - b#62);
	#65 := c#74;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 27, 3} {:message "SafeMath::add"} add#110(__this: address_t, __msg_sender: address_t, __msg_value: int, a#84: int, b#86: int)
	returns (#89: int)
{
	var {:sourceloc "buggy_17.sol", 28, 5} {:message "c"} c#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#92 := (a#84 + b#86);
	assume ((c#92 >= a#84) && (c#92 >= b#86));
	#89 := c#92;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 32, 3} {:message "SafeMath::mod"} mod#130(__this: address_t, __msg_sender: address_t, __msg_value: int, a#112: int, b#114: int)
	returns (#117: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#114 != 0);
	#117 := (a#112 mod b#114);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Function: max256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 36, 3} {:message "SafeMath::max256"} max256#147(__this: address_t, __msg_sender: address_t, __msg_value: int, a#132: int, b#134: int)
	returns (#137: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#137 := (if (a#132 >= b#134) then a#132 else b#134);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: min256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 39, 3} {:message "SafeMath::min256"} min256#164(__this: address_t, __msg_sender: address_t, __msg_value: int, a#149: int, b#151: int)
	returns (#154: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#154 := (if (a#149 < b#151) then a#149 else b#151);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 8, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#165(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: owned -------
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
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 49, 1} {:message "owned::unhandledsend_unchk2"} unhandledsend_unchk2#177(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#167: address_t)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := 5000000000000000000;
	assume {:sourceloc "buggy_17.sol", 50, 5} {:message ""} true;
	call __send_ret#1 := __send(callee#167, __this, 0, call_arg#0);
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_17.sol", 52, 3} {:message "owner"} owner#179: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 54, 3} {:message "owned::[constructor]"} __constructor#251(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#179 := owner#179[__this := 0];
	// Function body starts here
	owner#179 := owner#179[__this := __msg_sender];
	$return8:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_17.sol", 57, 1} {:message "owned::cash_unchk46"} cash_unchk46#212(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#190: int, subpotIndex#192: int, winner_unchk46#194: address_t)
{
	var {:sourceloc "buggy_17.sol", 58, 9} {:message "subpot_unchk46"} subpot_unchk46#198: int;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#198 := 3000000000000000000;
	call_arg#2 := subpot_unchk46#198;
	assume {:sourceloc "buggy_17.sol", 59, 9} {:message ""} true;
	call __send_ret#3 := __send(winner_unchk46#194, __this, 0, call_arg#2);
	subpot_unchk46#198 := 0;
	$return9:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_17.sol", 68, 3} {:message "owned::transferOwnership"} transferOwnership#235(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#225: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#179[__this]);
	// Function body starts here
	owner#179 := owner#179[__this := newOwner#225];
	$return11:
	// Function body ends here
	$return10:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_17.sol", 71, 1} {:message "owned::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#250(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 72, 4} {:message "addr_unchk4"} addr_unchk4#239: address_t;
	var call_arg#6: int;
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#239 := 0;
	call_arg#6 := 42000000000000000000;
	assume {:sourceloc "buggy_17.sol", 73, 10} {:message ""} true;
	call __send_ret#7 := __send(addr_unchk4#239, __this, 0, call_arg#6);
	if (!(__send_ret#7)) {
	
	}
	else {
	
	}

	$return12:
	// Function body ends here
}

// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_17.sol", 83, 3} {:message "tokenRecipient::receiveApproval"} receiveApproval#262(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#253: address_t, _value#255: int, _token#257: address_t, _extraData#259: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 82, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#263(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_17.sol", 124, 3} {:message "[event] TokenERC20::Transfer"} Transfer#416(__this: address_t, __msg_sender: address_t, __msg_value: int, from#410: address_t, to#412: address_t, value#414: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_17.sol", 132, 3} {:message "[event] TokenERC20::Approval"} Approval#448(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#442: address_t, _spender#444: address_t, _value#446: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_17.sol", 137, 3} {:message "[event] TokenERC20::Burn"} Burn#468(__this: address_t, __msg_sender: address_t, __msg_value: int, from#464: address_t, value#466: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_17.sol", 89, 1} {:message "TokenERC20::bug_unchk43"} bug_unchk43#287(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 90, 1} {:message "addr_unchk43"} addr_unchk43#270: address_t;
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#270 := 0;
	call_arg#8 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 91, 6} {:message ""} true;
	call __send_ret#9 := __send(addr_unchk43#270, __this, 0, call_arg#8);
	if ((!(__send_ret#9) || (1 == 1))) {
	assume false;
	}

	$return13:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_17.sol", 94, 3} {:message "name"} name#289: [address_t]int_arr_type;
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
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 95, 1} {:message "TokenERC20::my_func_uncheck48"} my_func_uncheck48#304(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#291: address_t)
{
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_17.sol", 96, 3} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(dst#291, __this, __msg_value);
	if (__call_ret#10) {
	havoc name#289;
	havoc symbol#306;
	havoc decimals#325;
	havoc totalSupply#341;
	havoc balanceOf#357;
	havoc payedOut_unchk9#360;
	havoc allowance#387;
	havoc payedOut_unchk45#419;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_17.sol", 98, 3} {:message "symbol"} symbol#306: [address_t]int_arr_type;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_17.sol", 99, 1} {:message "TokenERC20::withdrawBal_unchk17"} withdrawBal_unchk17#323(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 100, 2} {:message "Balances_unchk17"} Balances_unchk17#310: int;
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#310 := 0;
	call_arg#12 := Balances_unchk17#310;
	assume {:sourceloc "buggy_17.sol", 101, 3} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, call_arg#12);
	$return15:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_17.sol", 102, 3} {:message "decimals"} decimals#325: [address_t]int;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 103, 1} {:message "TokenERC20::callnotchecked_unchk37"} callnotchecked_unchk37#339(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#327: address_t)
{
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_17.sol", 104, 3} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(callee#327, __this, 1000000000000000000);
	if (__call_ret#14) {
	havoc name#289;
	havoc symbol#306;
	havoc decimals#325;
	havoc totalSupply#341;
	havoc balanceOf#357;
	havoc payedOut_unchk9#360;
	havoc allowance#387;
	havoc payedOut_unchk45#419;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc __balance;
	}

	if (!(__call_ret#14)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_17.sol", 106, 3} {:message "totalSupply"} totalSupply#341: [address_t]int;
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 108, 1} {:message "TokenERC20::bug_unchk3"} bug_unchk3#353(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#343: address_t)
{
	var call_arg#16: int;
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#16 := 42000000000000000000;
	assume {:sourceloc "buggy_17.sol", 109, 8} {:message ""} true;
	call __send_ret#17 := __send(addr#343, __this, 0, call_arg#16);
	$return17:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 110, 3} {:message "balanceOf"} balanceOf#357: [address_t][address_t]int;
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_17.sol", 111, 1} {:message "payedOut_unchk9"} payedOut_unchk9#360: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_17.sol", 113, 1} {:message "TokenERC20::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#381(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#360[__this];
	assume {:sourceloc "buggy_17.sol", 115, 3} {:message ""} true;
	call __send_ret#18 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return18:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_17.sol", 117, 3} {:message "allowance"} allowance#387: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_17.sol", 119, 1} {:message "TokenERC20::bug_unchk31"} bug_unchk31#408(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 120, 1} {:message "addr_unchk31"} addr_unchk31#391: address_t;
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#391 := 0;
	call_arg#19 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 121, 6} {:message ""} true;
	call __send_ret#20 := __send(addr_unchk31#391, __this, 0, call_arg#19);
	if ((!(__send_ret#20) || (1 == 1))) {
	assume false;
	}

	$return19:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_17.sol", 126, 1} {:message "payedOut_unchk45"} payedOut_unchk45#419: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_17.sol", 128, 1} {:message "TokenERC20::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#440(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#419[__this];
	assume {:sourceloc "buggy_17.sol", 130, 3} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return20:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_17.sol", 134, 1} {:message "TokenERC20::callnotchecked_unchk13"} callnotchecked_unchk13#462(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#450: address_t)
{
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_17.sol", 135, 3} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(callee#450, __this, 1000000000000000000);
	if (__call_ret#22) {
	havoc name#289;
	havoc symbol#306;
	havoc decimals#325;
	havoc totalSupply#341;
	havoc balanceOf#357;
	havoc payedOut_unchk9#360;
	havoc allowance#387;
	havoc payedOut_unchk45#419;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return21:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 140, 3} {:message "TokenERC20::[constructor]"} __constructor#770(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenName#470: int_arr_ptr, tokenSymbol#472: int_arr_ptr, dec#474: int)
{
	// TCC assumptions
	assume (tokenName#470 < __alloc_counter);
	assume (tokenSymbol#472 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#289 := name#289[__this := int_arr#constr(default_int_int(), 0)];
	symbol#306 := symbol#306[__this := int_arr#constr(default_int_int(), 0)];
	decimals#325 := decimals#325[__this := 0];
	totalSupply#341 := totalSupply#341[__this := 0];
	balanceOf#357 := balanceOf#357[__this := default_address_t_int()];
	payedOut_unchk9#360 := payedOut_unchk9#360[__this := false];
	allowance#387 := allowance#387[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#419 := payedOut_unchk45#419[__this := false];
	payedOut_unchk8#695 := payedOut_unchk8#695[__this := false];
	winner_unchk8#697 := winner_unchk8#697[__this := 0];
	winAmount_unchk8#699 := winAmount_unchk8#699[__this := 0];
	// Function body starts here
	decimals#325 := decimals#325[__this := dec#474];
	name#289 := name#289[__this := mem_arr_int[tokenName#470]];
	symbol#306 := symbol#306[__this := mem_arr_int[tokenSymbol#472]];
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_17.sol", 145, 1} {:message "TokenERC20::bug_unchk7"} bug_unchk7#511(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 146, 1} {:message "addr_unchk7"} addr_unchk7#494: address_t;
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#494 := 0;
	call_arg#24 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 147, 6} {:message ""} true;
	call __send_ret#25 := __send(addr_unchk7#494, __this, 0, call_arg#24);
	if ((!(__send_ret#25) || (1 == 1))) {
	assume false;
	}

	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 151, 3} {:message "TokenERC20::_transfer"} _transfer#558(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#513: address_t, _to#515: address_t, _value#517: int)
{
	var sub#82_ret#26: int;
	var add#110_ret#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#515 != 0);
	assume {:sourceloc "buggy_17.sol", 153, 24} {:message ""} true;
	call sub#82_ret#26 := sub#82(__this, __msg_sender, __msg_value, balanceOf#357[__this][_from#513], _value#517);
	balanceOf#357 := balanceOf#357[__this := balanceOf#357[__this][_from#513 := sub#82_ret#26]];
	assume {:sourceloc "buggy_17.sol", 154, 22} {:message ""} true;
	call add#110_ret#27 := add#110(__this, __msg_sender, __msg_value, balanceOf#357[__this][_to#515], _value#517);
	balanceOf#357 := balanceOf#357[__this := balanceOf#357[__this][_to#515 := add#110_ret#27]];
	assume {:sourceloc "buggy_17.sol", 155, 10} {:message ""} true;
	call Transfer#416(__this, __msg_sender, __msg_value, _from#513, _to#515, _value#517);
	$return24:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 157, 1} {:message "TokenERC20::my_func_unchk23"} my_func_unchk23#571(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#560: address_t)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 158, 9} {:message ""} true;
	call __send_ret#28 := __send(dst#560, __this, 0, __msg_value);
	$return25:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 161, 3} {:message "TokenERC20::transfer"} transfer#590(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#573: address_t, _value#575: int)
	returns (success#578: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 162, 5} {:message ""} true;
	call _transfer#558(__this, __msg_sender, __msg_value, call_arg#29, _to#573, _value#575);
	success#578 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 165, 1} {:message "TokenERC20::unhandledsend_unchk14"} unhandledsend_unchk14#602(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#592: address_t)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#30 := 5000000000000000000;
	assume {:sourceloc "buggy_17.sol", 166, 5} {:message ""} true;
	call __send_ret#31 := __send(callee#592, __this, 0, call_arg#30);
	$return27:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 170, 3} {:message "TokenERC20::transferFrom"} transferFrom#639(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#604: address_t, _to#606: address_t, _value#608: int)
	returns (success#611: bool)
{
	var sub#82_ret#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 171, 36} {:message ""} true;
	call sub#82_ret#32 := sub#82(__this, __msg_sender, __msg_value, allowance#387[__this][_from#604][__msg_sender], _value#608);
	allowance#387 := allowance#387[__this := allowance#387[__this][_from#604 := allowance#387[__this][_from#604][__msg_sender := sub#82_ret#32]]];
	assume {:sourceloc "buggy_17.sol", 172, 3} {:message ""} true;
	call _transfer#558(__this, __msg_sender, __msg_value, _from#604, _to#606, _value#608);
	success#611 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_17.sol", 175, 1} {:message "TokenERC20::bug_unchk30"} bug_unchk30#664(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 176, 1} {:message "receivers_unchk30"} receivers_unchk30#643: int;
	var {:sourceloc "buggy_17.sol", 177, 1} {:message "addr_unchk30"} addr_unchk30#646: address_t;
	var call_arg#33: int;
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#643 := 0;
	addr_unchk30#646 := 0;
	call_arg#33 := 42000000000000000000;
	assume {:sourceloc "buggy_17.sol", 178, 6} {:message ""} true;
	call __send_ret#34 := __send(addr_unchk30#646, __this, 0, call_arg#33);
	if (!(__send_ret#34)) {
	receivers_unchk30#643 := (receivers_unchk30#643 + 1);
	}
	else {
	assume false;
	}

	$return29:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 185, 3} {:message "TokenERC20::approve"} approve#692(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#666: address_t, _value#668: int)
	returns (success#671: bool)
{
	var call_arg#35: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#387 := allowance#387[__this := allowance#387[__this][__msg_sender := allowance#387[__this][__msg_sender][_spender#666 := _value#668]]];
	call_arg#35 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 187, 10} {:message ""} true;
	call Approval#448(__this, __msg_sender, __msg_value, call_arg#35, _spender#666, _value#668);
	success#671 := true;
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_17.sol", 190, 1} {:message "payedOut_unchk8"} payedOut_unchk8#695: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_17.sol", 191, 1} {:message "winner_unchk8"} winner_unchk8#697: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_17.sol", 192, 1} {:message "winAmount_unchk8"} winAmount_unchk8#699: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_17.sol", 194, 1} {:message "TokenERC20::sendToWinner_unchk8"} sendToWinner_unchk8#718(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#695[__this]);
	assume {:sourceloc "buggy_17.sol", 196, 9} {:message ""} true;
	call __send_ret#36 := __send(winner_unchk8#697[__this], __this, 0, winAmount_unchk8#699[__this]);
	payedOut_unchk8#695 := payedOut_unchk8#695[__this := true];
	$return31:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_17.sol", 201, 3} {:message "TokenERC20::approveAndCall"} approveAndCall#757(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#720: address_t, _value#722: int, _extraData#724: int_arr_ptr)
	returns (success#727: bool)
{
	var {:sourceloc "buggy_17.sol", 202, 5} {:message "spender"} spender#730: address_t;
	var approve#692_ret#37: bool;
	var call_arg#38: address_t;
	// TCC assumptions
	assume (_extraData#724 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#730 := _spender#720;
	assume {:sourceloc "buggy_17.sol", 203, 9} {:message ""} true;
	call approve#692_ret#37 := approve#692(__this, __msg_sender, __msg_value, _spender#720, _value#722);
	if (approve#692_ret#37) {
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 204, 7} {:message ""} true;
	call receiveApproval#262(spender#730, __this, 0, call_arg#38, _value#722, __this, _extraData#724);
	success#727 := true;
	goto $return32;
	}

	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 208, 1} {:message "TokenERC20::bug_unchk39"} bug_unchk39#769(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#759: address_t)
{
	var call_arg#39: int;
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#39 := 4000000000000000000;
	assume {:sourceloc "buggy_17.sol", 209, 8} {:message ""} true;
	call __send_ret#40 := __send(addr#759, __this, 0, call_arg#39);
	$return33:
	// Function body ends here
}

// 
// ------- Contract: AZT -------
// Inherits from: owned
// Inherits from: TokenERC20
// Using library SafeMath for uint256
// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 220, 1} {:message "AZT::callnotchecked_unchk25"} callnotchecked_unchk25#791(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#779: address_t)
{
	var __call_ret#41: bool;
	var __call_ret#42: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_17.sol", 221, 3} {:message ""} true;
	call __call_ret#41, __call_ret#42 := __call(callee#779, __this, 1000000000000000000);
	if (__call_ret#41) {
	havoc _decimals#827;
	havoc payedOut_unchk20#830;
	havoc winner_unchk20#832;
	havoc winAmount_unchk20#834;
	havoc frozenAddresses#856;
	havoc payedOut_unchk32#859;
	havoc winner_unchk32#861;
	havoc winAmount_unchk32#863;
	havoc tokenFrozen#884;
	havoc frozenWallets#909;
	havoc payedOut_unchk44#1119;
	havoc winner_unchk44#1121;
	havoc winAmount_unchk44#1123;
	havoc payedOut_unchk33#1250;
	havoc name#289;
	havoc symbol#306;
	havoc decimals#325;
	havoc totalSupply#341;
	havoc balanceOf#357;
	havoc payedOut_unchk9#360;
	havoc allowance#387;
	havoc payedOut_unchk45#419;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc owner#179;
	havoc __balance;
	}

	if (!(__call_ret#41)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_17.sol", 224, 2} {:message "AZT::bug_unchk19"} bug_unchk19#812(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 225, 1} {:message "addr_unchk19"} addr_unchk19#795: address_t;
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#795 := 0;
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 226, 6} {:message ""} true;
	call __send_ret#44 := __send(addr_unchk19#795, __this, 0, call_arg#43);
	if ((!(__send_ret#44) || (1 == 1))) {
	assume false;
	}

	$return35:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 230, 1} {:message "AZT::unhandledsend_unchk26"} unhandledsend_unchk26#824(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#814: address_t)
{
	var call_arg#45: int;
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#45 := 5000000000000000000;
	assume {:sourceloc "buggy_17.sol", 231, 5} {:message ""} true;
	call __send_ret#46 := __send(callee#814, __this, 0, call_arg#45);
	$return36:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_17.sol", 233, 3} {:message "_decimals"} _decimals#827: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_17.sol", 235, 1} {:message "payedOut_unchk20"} payedOut_unchk20#830: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_17.sol", 236, 1} {:message "winner_unchk20"} winner_unchk20#832: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_17.sol", 237, 1} {:message "winAmount_unchk20"} winAmount_unchk20#834: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_17.sol", 239, 1} {:message "AZT::sendToWinner_unchk20"} sendToWinner_unchk20#853(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#830[__this]);
	assume {:sourceloc "buggy_17.sol", 241, 9} {:message ""} true;
	call __send_ret#47 := __send(winner_unchk20#832[__this], __this, 0, winAmount_unchk20#834[__this]);
	payedOut_unchk20#830 := payedOut_unchk20#830[__this := true];
	$return37:
	// Function body ends here
}

// 
// State variable: frozenAddresses: address[] storage ref
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var {:sourceloc "buggy_17.sol", 244, 3} {:message "frozenAddresses"} frozenAddresses#856: [address_t]address_t_arr_type;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_17.sol", 245, 1} {:message "payedOut_unchk32"} payedOut_unchk32#859: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_17.sol", 246, 1} {:message "winner_unchk32"} winner_unchk32#861: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_17.sol", 247, 1} {:message "winAmount_unchk32"} winAmount_unchk32#863: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_17.sol", 249, 1} {:message "AZT::sendToWinner_unchk32"} sendToWinner_unchk32#882(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#859[__this]);
	assume {:sourceloc "buggy_17.sol", 251, 9} {:message ""} true;
	call __send_ret#48 := __send(winner_unchk32#861[__this], __this, 0, winAmount_unchk32#863[__this]);
	payedOut_unchk32#859 := payedOut_unchk32#859[__this := true];
	$return38:
	// Function body ends here
}

// 
// State variable: tokenFrozen: bool
var {:sourceloc "buggy_17.sol", 254, 3} {:message "tokenFrozen"} tokenFrozen#884: [address_t]bool;
// 
// ------- Struct frozenWallet -------
// Storage
type {:datatype} struct_storage_frozenWallet#893;
function {:constructor} frozenWallet#893#constr(isFrozen#886: bool, rewardedAmount#888: int, frozenAmount#890: int, frozenTime#892: int) returns (struct_storage_frozenWallet#893);
// Memory
type address_struct_memory_frozenWallet#893 = int;
// Member isFrozen
var {:sourceloc "buggy_17.sol", 257, 5} {:message "isFrozen"} isFrozen#886: [address_struct_memory_frozenWallet#893]bool;
// Member rewardedAmount
var {:sourceloc "buggy_17.sol", 258, 5} {:message "rewardedAmount"} rewardedAmount#888: [address_struct_memory_frozenWallet#893]int;
// Member frozenAmount
var {:sourceloc "buggy_17.sol", 259, 5} {:message "frozenAmount"} frozenAmount#890: [address_struct_memory_frozenWallet#893]int;
// Member frozenTime
var {:sourceloc "buggy_17.sol", 260, 5} {:message "frozenTime"} frozenTime#892: [address_struct_memory_frozenWallet#893]int;
// 
// ------- End of struct frozenWallet -------
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 263, 1} {:message "AZT::unhandledsend_unchk38"} unhandledsend_unchk38#905(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#895: address_t)
{
	var call_arg#49: int;
	var __send_ret#50: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#49 := 5000000000000000000;
	assume {:sourceloc "buggy_17.sol", 264, 5} {:message ""} true;
	call __send_ret#50 := __send(callee#895, __this, 0, call_arg#49);
	$return39:
	// Function body ends here
}

// 
// State variable: frozenWallets: mapping(address => struct AZT.frozenWallet storage ref)
var {:sourceloc "buggy_17.sol", 266, 3} {:message "frozenWallets"} frozenWallets#909: [address_t][address_t]struct_storage_frozenWallet#893;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
function {:builtin "((as const (Array Int |T@struct_storage_frozenWallet#893|)) (|frozenWallet#893#constr| false 0 0 0))"} default_address_t_struct_storage_frozenWallet#893() returns ([address_t]struct_storage_frozenWallet#893);
const unique address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 270, 3} {:message "AZT::[constructor]"} __constructor#1296(__this: address_t, __msg_sender: address_t, __msg_value: int, _tokenName#911: int_arr_ptr, _tokenSymbol#913: int_arr_ptr)
{
	var tokenName#470#51: int_arr_ptr;
	var tokenSymbol#472#51: int_arr_ptr;
	var dec#474#51: int;
	var call_arg#54: int;
	var call_arg#55: int;
	var new_struct_frozenWallet#56: address_struct_memory_frozenWallet#893;
	var {:sourceloc "buggy_17.sol", 281, 10} {:message "i"} i#949#53: int;
	var add#110_ret#59: int;
	var tmp#60: int;
	// TCC assumptions
	assume (_tokenName#911 < __alloc_counter);
	assume (_tokenSymbol#913 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_decimals#827 := _decimals#827[__this := 18];
	payedOut_unchk20#830 := payedOut_unchk20#830[__this := false];
	winner_unchk20#832 := winner_unchk20#832[__this := 0];
	winAmount_unchk20#834 := winAmount_unchk20#834[__this := 0];
	frozenAddresses#856 := frozenAddresses#856[__this := address_t_arr#constr(default_int_address_t(), 0)];
	payedOut_unchk32#859 := payedOut_unchk32#859[__this := false];
	winner_unchk32#861 := winner_unchk32#861[__this := 0];
	winAmount_unchk32#863 := winAmount_unchk32#863[__this := 0];
	tokenFrozen#884 := tokenFrozen#884[__this := false];
	frozenWallets#909 := frozenWallets#909[__this := default_address_t_struct_storage_frozenWallet#893()];
	payedOut_unchk44#1119 := payedOut_unchk44#1119[__this := false];
	winner_unchk44#1121 := winner_unchk44#1121[__this := 0];
	winAmount_unchk44#1123 := winAmount_unchk44#1123[__this := 0];
	payedOut_unchk33#1250 := payedOut_unchk33#1250[__this := false];
	name#289 := name#289[__this := int_arr#constr(default_int_int(), 0)];
	symbol#306 := symbol#306[__this := int_arr#constr(default_int_int(), 0)];
	decimals#325 := decimals#325[__this := 0];
	totalSupply#341 := totalSupply#341[__this := 0];
	balanceOf#357 := balanceOf#357[__this := default_address_t_int()];
	payedOut_unchk9#360 := payedOut_unchk9#360[__this := false];
	allowance#387 := allowance#387[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#419 := payedOut_unchk45#419[__this := false];
	payedOut_unchk8#695 := payedOut_unchk8#695[__this := false];
	winner_unchk8#697 := winner_unchk8#697[__this := 0];
	winAmount_unchk8#699 := winAmount_unchk8#699[__this := 0];
	owner#179 := owner#179[__this := 0];
	// Arguments for TokenERC20
	tokenName#470#51 := _tokenName#911;
	tokenSymbol#472#51 := _tokenSymbol#913;
	dec#474#51 := _decimals#827[__this];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#179 := owner#179[__this := __msg_sender];
	$return40:
	// Function body ends here
	// Inlined constructor for owned ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	decimals#325 := decimals#325[__this := dec#474#51];
	name#289 := name#289[__this := mem_arr_int[tokenName#470#51]];
	symbol#306 := symbol#306[__this := mem_arr_int[tokenSymbol#472#51]];
	$return41:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	frozenAddresses#856 := frozenAddresses#856[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#856[__this])[length#address_t_arr#constr(frozenAddresses#856[__this]) := 0], length#address_t_arr#constr(frozenAddresses#856[__this]))];
	frozenAddresses#856 := frozenAddresses#856[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#856[__this])[length#address_t_arr#constr(frozenAddresses#856[__this]) := address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05], length#address_t_arr#constr(frozenAddresses#856[__this]))];
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#856[__this])) && (length#address_t_arr#constr(frozenAddresses#856[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#address_t_arr#constr(frozenAddresses#856[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	frozenAddresses#856 := frozenAddresses#856[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#856[__this]), (length#address_t_arr#constr(frozenAddresses#856[__this]) + 1))];
	call_arg#54 := 30000000;
	call_arg#55 := 0;
	new_struct_frozenWallet#56 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	isFrozen#886 := isFrozen#886[new_struct_frozenWallet#56 := true];
	rewardedAmount#888 := rewardedAmount#888[new_struct_frozenWallet#56 := call_arg#54];
	frozenAmount#890 := frozenAmount#890[new_struct_frozenWallet#56 := call_arg#55];
	frozenTime#892 := frozenTime#892[new_struct_frozenWallet#56 := (__block_timestamp + 3600)];
	// Deep copy struct frozenWallet
	frozenWallets#909 := frozenWallets#909[__this := frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0] := frozenWallet#893#constr(isFrozen#886[new_struct_frozenWallet#56], rewardedAmount#888#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), frozenAmount#890#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), frozenTime#892#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]))]];
	frozenWallets#909 := frozenWallets#909[__this := frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0] := frozenWallet#893#constr(isFrozen#886#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), rewardedAmount#888[new_struct_frozenWallet#56], frozenAmount#890#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), frozenTime#892#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]))]];
	frozenWallets#909 := frozenWallets#909[__this := frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0] := frozenWallet#893#constr(isFrozen#886#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), rewardedAmount#888#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), frozenAmount#890[new_struct_frozenWallet#56], frozenTime#892#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]))]];
	frozenWallets#909 := frozenWallets#909[__this := frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0] := frozenWallet#893#constr(isFrozen#886#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), rewardedAmount#888#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), frozenAmount#890#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[0]]), frozenTime#892[new_struct_frozenWallet#56])]];
	// The following while loop was mapped from a for loop
	// Initialization
	i#949#53 := 0;
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#856[__this])) && (length#address_t_arr#constr(frozenAddresses#856[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#949#53 < length#address_t_arr#constr(frozenAddresses#856[__this]))) {
	// Body
	balanceOf#357 := balanceOf#357[__this := balanceOf#357[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[i#949#53] := rewardedAmount#888#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[i#949#53]])]];
	assume {:sourceloc "buggy_17.sol", 283, 21} {:message ""} true;
	call add#110_ret#59 := add#110(__this, __msg_sender, __msg_value, totalSupply#341[__this], rewardedAmount#888#frozenWallet#893#constr(frozenWallets#909[__this][arr#address_t_arr#constr(frozenAddresses#856[__this])[i#949#53]]));
	totalSupply#341 := totalSupply#341[__this := add#110_ret#59];
	$continue57:
	// Loop expression
	tmp#60 := i#949#53;
	i#949#53 := (i#949#53 + 1);
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#856[__this])) && (length#address_t_arr#constr(frozenAddresses#856[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break58:
	$return42:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 286, 1} {:message "AZT::my_func_uncheck36"} my_func_uncheck36#1002(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#989: address_t)
{
	var __call_ret#61: bool;
	var __call_ret#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_17.sol", 287, 3} {:message ""} true;
	call __call_ret#61, __call_ret#62 := __call(dst#989, __this, __msg_value);
	if (__call_ret#61) {
	havoc _decimals#827;
	havoc payedOut_unchk20#830;
	havoc winner_unchk20#832;
	havoc winAmount_unchk20#834;
	havoc frozenAddresses#856;
	havoc payedOut_unchk32#859;
	havoc winner_unchk32#861;
	havoc winAmount_unchk32#863;
	havoc tokenFrozen#884;
	havoc frozenWallets#909;
	havoc payedOut_unchk44#1119;
	havoc winner_unchk44#1121;
	havoc winAmount_unchk44#1123;
	havoc payedOut_unchk33#1250;
	havoc name#289;
	havoc symbol#306;
	havoc decimals#325;
	havoc totalSupply#341;
	havoc balanceOf#357;
	havoc payedOut_unchk9#360;
	havoc allowance#387;
	havoc payedOut_unchk45#419;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc owner#179;
	havoc __balance;
	}

	if (!(__call_ret#61)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return43:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 290, 3} {:message "AZT::_transfer"} _transfer#1057(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1004: address_t, _to#1006: address_t, _value#1008: int)
{
	var checkFrozenWallet#1116_ret#63: bool;
	var sub#82_ret#64: int;
	var add#110_ret#65: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1006 != 0);
	assume {:sourceloc "buggy_17.sol", 292, 13} {:message ""} true;
	call checkFrozenWallet#1116_ret#63 := checkFrozenWallet#1116(__this, __msg_sender, __msg_value, _from#1004, _value#1008);
	assume checkFrozenWallet#1116_ret#63;
	assume {:sourceloc "buggy_17.sol", 293, 24} {:message ""} true;
	call sub#82_ret#64 := sub#82(__this, __msg_sender, __msg_value, balanceOf#357[__this][_from#1004], _value#1008);
	balanceOf#357 := balanceOf#357[__this := balanceOf#357[__this][_from#1004 := sub#82_ret#64]];
	assume {:sourceloc "buggy_17.sol", 294, 22} {:message ""} true;
	call add#110_ret#65 := add#110(__this, __msg_sender, __msg_value, balanceOf#357[__this][_to#1006], _value#1008);
	balanceOf#357 := balanceOf#357[__this := balanceOf#357[__this][_to#1006 := add#110_ret#65]];
	assume {:sourceloc "buggy_17.sol", 295, 10} {:message ""} true;
	call Transfer#416(__this, __msg_sender, __msg_value, _from#1004, _to#1006, _value#1008);
	$return44:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 297, 1} {:message "AZT::my_func_unchk35"} my_func_unchk35#1070(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1059: address_t)
{
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 298, 9} {:message ""} true;
	call __send_ret#66 := __send(dst#1059, __this, 0, __msg_value);
	$return45:
	// Function body ends here
}

// 
// Function: checkFrozenWallet : function (address,uint256) view returns (bool)
procedure {:sourceloc "buggy_17.sol", 301, 3} {:message "AZT::checkFrozenWallet"} checkFrozenWallet#1116(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1072: address_t, _value#1074: int)
	returns (#1077: bool)
{
	var sub#82_ret#67: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 307, 8} {:message ""} true;
	call sub#82_ret#67 := sub#82(__this, __msg_sender, __msg_value, balanceOf#357[__this][_from#1072], _value#1074);
	#1077 := ((_from#1072 == owner#179[__this]) || (!(tokenFrozen#884[__this]) && ((!(isFrozen#886#frozenWallet#893#constr(frozenWallets#909[__this][_from#1072])) || (__block_timestamp >= frozenTime#892#frozenWallet#893#constr(frozenWallets#909[__this][_from#1072]))) || (sub#82_ret#67 >= frozenAmount#890#frozenWallet#893#constr(frozenWallets#909[__this][_from#1072])))));
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_17.sol", 310, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1119: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_17.sol", 311, 1} {:message "winner_unchk44"} winner_unchk44#1121: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_17.sol", 312, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1123: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_17.sol", 314, 1} {:message "AZT::sendToWinner_unchk44"} sendToWinner_unchk44#1142(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#68: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1119[__this]);
	assume {:sourceloc "buggy_17.sol", 316, 9} {:message ""} true;
	call __send_ret#68 := __send(winner_unchk44#1121[__this], __this, 0, winAmount_unchk44#1123[__this]);
	payedOut_unchk44#1119 := payedOut_unchk44#1119[__this := true];
	$return47:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 321, 3} {:message "AZT::burn"} burn#1180(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#1144: int)
	returns (success#1149: bool)
{
	var sub#82_ret#71: int;
	var sub#82_ret#72: int;
	var call_arg#73: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#179[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 322, 29} {:message ""} true;
	call sub#82_ret#71 := sub#82(__this, __msg_sender, __msg_value, balanceOf#357[__this][__msg_sender], _value#1144);
	balanceOf#357 := balanceOf#357[__this := balanceOf#357[__this][__msg_sender := sub#82_ret#71]];
	assume {:sourceloc "buggy_17.sol", 323, 19} {:message ""} true;
	call sub#82_ret#72 := sub#82(__this, __msg_sender, __msg_value, totalSupply#341[__this], _value#1144);
	totalSupply#341 := totalSupply#341[__this := sub#82_ret#72];
	call_arg#73 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 324, 10} {:message ""} true;
	call Burn#468(__this, __msg_sender, __msg_value, call_arg#73, _value#1144);
	success#1149 := true;
	goto $return49;
	$return49:
	// Function body ends here
	$return48:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_17.sol", 327, 1} {:message "AZT::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 328, 4} {:message "addr_unchk40"} addr_unchk40#1184: address_t;
	var call_arg#74: int;
	var __send_ret#75: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1184 := 0;
	call_arg#74 := 2000000000000000000;
	assume {:sourceloc "buggy_17.sol", 329, 10} {:message ""} true;
	call __send_ret#75 := __send(addr_unchk40#1184, __this, 0, call_arg#74);
	if (!(__send_ret#75)) {
	
	}
	else {
	
	}

	$return50:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 337, 3} {:message "AZT::burnFrom"} burnFrom#1247(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1197: address_t, _value#1199: int)
	returns (success#1202: bool)
{
	var sub#82_ret#76: int;
	var sub#82_ret#77: int;
	var sub#82_ret#78: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 338, 24} {:message ""} true;
	call sub#82_ret#76 := sub#82(__this, __msg_sender, __msg_value, balanceOf#357[__this][_from#1197], _value#1199);
	balanceOf#357 := balanceOf#357[__this := balanceOf#357[__this][_from#1197 := sub#82_ret#76]];
	assume {:sourceloc "buggy_17.sol", 339, 36} {:message ""} true;
	call sub#82_ret#77 := sub#82(__this, __msg_sender, __msg_value, allowance#387[__this][_from#1197][__msg_sender], _value#1199);
	allowance#387 := allowance#387[__this := allowance#387[__this][_from#1197 := allowance#387[__this][_from#1197][__msg_sender := sub#82_ret#77]]];
	assume {:sourceloc "buggy_17.sol", 340, 19} {:message ""} true;
	call sub#82_ret#78 := sub#82(__this, __msg_sender, __msg_value, totalSupply#341[__this], _value#1199);
	totalSupply#341 := totalSupply#341[__this := sub#82_ret#78];
	assume {:sourceloc "buggy_17.sol", 341, 10} {:message ""} true;
	call Burn#468(__this, __msg_sender, __msg_value, _from#1197, _value#1199);
	success#1202 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_17.sol", 344, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1250: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_17.sol", 346, 1} {:message "AZT::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1271(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#79: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1250[__this];
	assume {:sourceloc "buggy_17.sol", 348, 3} {:message ""} true;
	call __send_ret#79 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return52:
	// Function body ends here
}

// 
// Function: freezeToken : function (bool)
procedure {:sourceloc "buggy_17.sol", 351, 3} {:message "AZT::freezeToken"} freezeToken#1283(__this: address_t, __msg_sender: address_t, __msg_value: int, freeze#1273: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#179[__this]);
	// Function body starts here
	tokenFrozen#884 := tokenFrozen#884[__this := freeze#1273];
	$return54:
	// Function body ends here
	$return53:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_17.sol", 354, 1} {:message "AZT::bug_unchk27"} bug_unchk27#1295(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1285: address_t)
{
	var call_arg#82: int;
	var __send_ret#83: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#82 := 42000000000000000000;
	assume {:sourceloc "buggy_17.sol", 355, 8} {:message ""} true;
	call __send_ret#83 := __send(addr#1285, __this, 0, call_arg#82);
	$return55:
	// Function body ends here
}

