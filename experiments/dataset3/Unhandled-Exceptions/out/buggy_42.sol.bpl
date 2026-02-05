// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_42.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_42.sol", 24, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#68(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#64: address_t, _to#66: address_t)
{
	
}

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
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 8, 3} {:message "Owned::bug_unchk3"} bug_unchk3#13(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#3: address_t)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := 42000000000000000000;
	assume {:sourceloc "buggy_42.sol", 9, 8} {:message ""} true;
	call __send_ret#1 := __send(addr#3, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_42.sol", 10, 3} {:message "owner"} owner#15: [address_t]address_t;
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_42.sol", 11, 3} {:message "payedOut_unchk9"} payedOut_unchk9#18: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_42.sol", 13, 1} {:message "Owned::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#39(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#18[__this];
	assume {:sourceloc "buggy_42.sol", 15, 3} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return1:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_42.sol", 17, 3} {:message "newOwner"} newOwner#41: [address_t]address_t;
// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_42.sol", 19, 3} {:message "Owned::bug_unchk31"} bug_unchk31#62(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 20, 1} {:message "addr_unchk31"} addr_unchk31#45: address_t;
	var call_arg#3: int;
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#45 := 0;
	call_arg#3 := 10000000000000000000;
	assume {:sourceloc "buggy_42.sol", 21, 6} {:message ""} true;
	call __send_ret#4 := __send(addr_unchk31#45, __this, 0, call_arg#3);
	if ((!(__send_ret#4) || (1 == 1))) {
	assume false;
	}

	$return2:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_42.sol", 26, 5} {:message "Owned::[constructor]"} __constructor#145(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#15 := owner#15[__this := 0];
	payedOut_unchk9#18 := payedOut_unchk9#18[__this := false];
	newOwner#41 := newOwner#41[__this := 0];
	// Function body starts here
	owner#15 := owner#15[__this := __msg_sender];
	$return3:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_42.sol", 29, 1} {:message "Owned::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#92(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 30, 4} {:message "addr_unchk4"} addr_unchk4#81: address_t;
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#81 := 0;
	call_arg#5 := 42000000000000000000;
	assume {:sourceloc "buggy_42.sol", 31, 10} {:message ""} true;
	call __send_ret#6 := __send(addr_unchk4#81, __this, 0, call_arg#5);
	if (!(__send_ret#6)) {
	
	}
	else {
	
	}

	$return4:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_42.sol", 44, 5} {:message "Owned::transferOwnership"} transferOwnership#123(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#113: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#15[__this]) || (__msg_sender == __this));
	// Function body starts here
	newOwner#41 := newOwner#41[__this := _newOwner#113];
	$return6:
	// Function body ends here
	$return5:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_42.sol", 47, 1} {:message "Owned::bug_unchk7"} bug_unchk7#144(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 48, 1} {:message "addr_unchk7"} addr_unchk7#127: address_t;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#127 := 0;
	call_arg#9 := 10000000000000000000;
	assume {:sourceloc "buggy_42.sol", 49, 6} {:message ""} true;
	call __send_ret#10 := __send(addr_unchk7#127, __this, 0, call_arg#9);
	if ((!(__send_ret#10) || (1 == 1))) {
	assume false;
	}

	$return7:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 55, 3} {:message "SafeMath::mul"} mul#178(__this: address_t, __msg_sender: address_t, __msg_value: int, a#147: int, b#149: int)
	returns (#152: int)
{
	var {:sourceloc "buggy_42.sol", 59, 5} {:message "c"} c#162: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#147 == 0)) {
	#152 := 0;
	goto $return8;
	}

	c#162 := (a#147 * b#149);
	assert {:sourceloc "buggy_42.sol", 60, 5} {:message "Assertion might not hold."} ((c#162 div a#147) == b#149);
	#152 := c#162;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 64, 3} {:message "SafeMath::div"} div#196(__this: address_t, __msg_sender: address_t, __msg_value: int, a#180: int, b#182: int)
	returns (#185: int)
{
	var {:sourceloc "buggy_42.sol", 65, 5} {:message "c"} c#188: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#188 := (a#180 div b#182);
	#185 := c#188;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 69, 3} {:message "SafeMath::sub"} sub#216(__this: address_t, __msg_sender: address_t, __msg_value: int, a#198: int, b#200: int)
	returns (#203: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_42.sol", 70, 5} {:message "Assertion might not hold."} (b#200 <= a#198);
	#203 := (a#198 - b#200);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 74, 3} {:message "SafeMath::add"} add#240(__this: address_t, __msg_sender: address_t, __msg_value: int, a#218: int, b#220: int)
	returns (#223: int)
{
	var {:sourceloc "buggy_42.sol", 75, 5} {:message "c"} c#226: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#226 := (a#218 + b#220);
	assert {:sourceloc "buggy_42.sol", 76, 5} {:message "Assertion might not hold."} (c#226 >= a#218);
	#223 := c#226;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 80, 3} {:message "SafeMath::ceil"} ceil#272(__this: address_t, __msg_sender: address_t, __msg_value: int, a#242: int, m#244: int)
	returns (#247: int)
{
	var {:sourceloc "buggy_42.sol", 81, 5} {:message "c"} c#250: int;
	var add#240_ret#11: int;
	var {:sourceloc "buggy_42.sol", 82, 5} {:message "d"} d#257: int;
	var call_arg#12: int;
	var sub#216_ret#13: int;
	var div#196_ret#14: int;
	var mul#178_ret#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 81, 17} {:message ""} true;
	call add#240_ret#11 := add#240(__this, __msg_sender, __msg_value, a#242, m#244);
	c#250 := add#240_ret#11;
	call_arg#12 := 1;
	assume {:sourceloc "buggy_42.sol", 82, 17} {:message ""} true;
	call sub#216_ret#13 := sub#216(__this, __msg_sender, __msg_value, c#250, call_arg#12);
	d#257 := sub#216_ret#13;
	assume {:sourceloc "buggy_42.sol", 83, 16} {:message ""} true;
	call div#196_ret#14 := div#196(__this, __msg_sender, __msg_value, d#257, m#244);
	assume {:sourceloc "buggy_42.sol", 83, 12} {:message ""} true;
	call mul#178_ret#15 := mul#178(__this, __msg_sender, __msg_value, div#196_ret#14, m#244);
	#247 := mul#178_ret#15;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_42.sol", 54, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#273(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Token -------
// 
// Function: balanceOf
procedure {:sourceloc "buggy_42.sol", 88, 3} {:message "Token::balanceOf"} balanceOf#280(__this: address_t, __msg_sender: address_t, __msg_value: int, who#275: address_t)
	returns (#278: int);

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 89, 1} {:message "Token::my_func_unchk23"} my_func_unchk23#293(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#282: address_t)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 90, 9} {:message ""} true;
	call __send_ret#16 := __send(dst#282, __this, 0, __msg_value);
	$return13:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_42.sol", 92, 5} {:message "Token::transferFrom"} transferFrom#304(__this: address_t, __msg_sender: address_t, __msg_value: int, from#295: address_t, to#297: address_t, value#299: int)
	returns (#302: bool);

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 93, 1} {:message "Token::unhandledsend_unchk14"} unhandledsend_unchk14#316(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#306: address_t)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := 5000000000000000000;
	assume {:sourceloc "buggy_42.sol", 94, 5} {:message ""} true;
	call __send_ret#18 := __send(callee#306, __this, 0, call_arg#17);
	$return14:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_42.sol", 96, 5} {:message "Token::transfer"} transfer#325(__this: address_t, __msg_sender: address_t, __msg_value: int, to#318: address_t, value#320: int)
	returns (#323: bool);

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_42.sol", 97, 1} {:message "Token::bug_unchk30"} bug_unchk30#350(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 98, 1} {:message "receivers_unchk30"} receivers_unchk30#329: int;
	var {:sourceloc "buggy_42.sol", 99, 1} {:message "addr_unchk30"} addr_unchk30#332: address_t;
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#329 := 0;
	addr_unchk30#332 := 0;
	call_arg#19 := 42000000000000000000;
	assume {:sourceloc "buggy_42.sol", 100, 6} {:message ""} true;
	call __send_ret#20 := __send(addr_unchk30#332, __this, 0, call_arg#19);
	if (!(__send_ret#20)) {
	receivers_unchk30#329 := (receivers_unchk30#329 + 1);
	}
	else {
	assume false;
	}

	$return15:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_42.sol", 87, 1} {:message "Token::[implicit_constructor]"} __constructor#351(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Staking -------
// Inherits from: Owned
// 
// Event: stakingstarted
procedure {:inline 1} {:sourceloc "buggy_42.sol", 153, 3} {:message "[event] Staking::stakingstarted"} stakingstarted#514(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#508: address_t, tokens#510: int, time#512: int)
{
	
}

// 
// Event: tokensRedeemed
procedure {:inline 1} {:sourceloc "buggy_42.sol", 157, 3} {:message "[event] Staking::tokensRedeemed"} tokensRedeemed#536(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#530: address_t, stakedTokens#532: int, reward#534: int)
{
	
}

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
procedure {:sourceloc "buggy_42.sol", 108, 3} {:message "Staking::callnotchecked_unchk25"} callnotchecked_unchk25#367(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#355: address_t)
{
	var __call_ret#21: bool;
	var __call_ret#22: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 109, 5} {:message ""} true;
	call __call_ret#21, __call_ret#22 := __call(callee#355, __this, 1000000000000000000);
	if (__call_ret#21) {
	havoc token#369;
	havoc lock#392;
	havoc stakeTokens#406;
	havoc payedOut_unchk20#409;
	havoc winner_unchk20#411;
	havoc winAmount_unchk20#413;
	havoc basePercent#435;
	havoc payedOut_unchk32#441;
	havoc winner_unchk32#443;
	havoc winAmount_unchk32#445;
	havoc stakeTime#467;
	havoc stakePercentage#482;
	havoc payedOut_unchk45#485;
	havoc staker#571;
	havoc payedOut_unchk8#602;
	havoc winner_unchk8#604;
	havoc winAmount_unchk8#606;
	havoc payedOut_unchk44#873;
	havoc winner_unchk44#875;
	havoc winAmount_unchk44#877;
	havoc payedOut_unchk33#936;
	havoc owner#15;
	havoc payedOut_unchk9#18;
	havoc newOwner#41;
	havoc __balance;
	}

	if (!(__call_ret#21)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: token: contract Token
var {:sourceloc "buggy_42.sol", 111, 3} {:message "token"} token#369: [address_t]address_t;
// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_42.sol", 112, 3} {:message "Staking::bug_unchk19"} bug_unchk19#390(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 113, 1} {:message "addr_unchk19"} addr_unchk19#373: address_t;
	var call_arg#23: int;
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#373 := 0;
	call_arg#23 := 10000000000000000000;
	assume {:sourceloc "buggy_42.sol", 114, 6} {:message ""} true;
	call __send_ret#24 := __send(addr_unchk19#373, __this, 0, call_arg#23);
	if ((!(__send_ret#24) || (1 == 1))) {
	assume false;
	}

	$return17:
	// Function body ends here
}

// 
// State variable: lock: bool
var {:sourceloc "buggy_42.sol", 117, 3} {:message "lock"} lock#392: [address_t]bool;
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 118, 3} {:message "Staking::unhandledsend_unchk26"} unhandledsend_unchk26#404(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#394: address_t)
{
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#25 := 5000000000000000000;
	assume {:sourceloc "buggy_42.sol", 119, 5} {:message ""} true;
	call __send_ret#26 := __send(callee#394, __this, 0, call_arg#25);
	$return18:
	// Function body ends here
}

// 
// State variable: stakeTokens: uint256
var {:sourceloc "buggy_42.sol", 121, 3} {:message "stakeTokens"} stakeTokens#406: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_42.sol", 122, 3} {:message "payedOut_unchk20"} payedOut_unchk20#409: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_42.sol", 123, 1} {:message "winner_unchk20"} winner_unchk20#411: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_42.sol", 124, 1} {:message "winAmount_unchk20"} winAmount_unchk20#413: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_42.sol", 126, 1} {:message "Staking::sendToWinner_unchk20"} sendToWinner_unchk20#432(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#409[__this]);
	assume {:sourceloc "buggy_42.sol", 128, 9} {:message ""} true;
	call __send_ret#27 := __send(winner_unchk20#411[__this], __this, 0, winAmount_unchk20#413[__this]);
	payedOut_unchk20#409 := payedOut_unchk20#409[__this := true];
	$return19:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_42.sol", 131, 3} {:message "basePercent"} basePercent#435: [address_t]int;
// Using library SafeMath for uint256
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_42.sol", 133, 3} {:message "payedOut_unchk32"} payedOut_unchk32#441: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_42.sol", 134, 1} {:message "winner_unchk32"} winner_unchk32#443: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_42.sol", 135, 1} {:message "winAmount_unchk32"} winAmount_unchk32#445: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_42.sol", 137, 1} {:message "Staking::sendToWinner_unchk32"} sendToWinner_unchk32#464(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#441[__this]);
	assume {:sourceloc "buggy_42.sol", 139, 9} {:message ""} true;
	call __send_ret#28 := __send(winner_unchk32#443[__this], __this, 0, winAmount_unchk32#445[__this]);
	payedOut_unchk32#441 := payedOut_unchk32#441[__this := true];
	$return20:
	// Function body ends here
}

// 
// State variable: stakeTime: uint256
var {:sourceloc "buggy_42.sol", 142, 3} {:message "stakeTime"} stakeTime#467: [address_t]int;
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 143, 3} {:message "Staking::unhandledsend_unchk38"} unhandledsend_unchk38#479(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#469: address_t)
{
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := 5000000000000000000;
	assume {:sourceloc "buggy_42.sol", 144, 5} {:message ""} true;
	call __send_ret#30 := __send(callee#469, __this, 0, call_arg#29);
	$return21:
	// Function body ends here
}

// 
// State variable: stakePercentage: uint256
var {:sourceloc "buggy_42.sol", 146, 3} {:message "stakePercentage"} stakePercentage#482: [address_t]int;
// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_42.sol", 147, 3} {:message "payedOut_unchk45"} payedOut_unchk45#485: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_42.sol", 149, 1} {:message "Staking::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#506(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#485[__this];
	assume {:sourceloc "buggy_42.sol", 151, 3} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return22:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_42.sol", 154, 3} {:message "Staking::callnotchecked_unchk13"} callnotchecked_unchk13#528(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#516: address_t)
{
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 155, 5} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(callee#516, __this, 1000000000000000000);
	if (__call_ret#32) {
	havoc token#369;
	havoc lock#392;
	havoc stakeTokens#406;
	havoc payedOut_unchk20#409;
	havoc winner_unchk20#411;
	havoc winAmount_unchk20#413;
	havoc basePercent#435;
	havoc payedOut_unchk32#441;
	havoc winner_unchk32#443;
	havoc winAmount_unchk32#445;
	havoc stakeTime#467;
	havoc stakePercentage#482;
	havoc payedOut_unchk45#485;
	havoc staker#571;
	havoc payedOut_unchk8#602;
	havoc winner_unchk8#604;
	havoc winAmount_unchk8#606;
	havoc payedOut_unchk44#873;
	havoc winner_unchk44#875;
	havoc winAmount_unchk44#877;
	havoc payedOut_unchk33#936;
	havoc owner#15;
	havoc payedOut_unchk9#18;
	havoc newOwner#41;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return23:
	// Function body ends here
}

// 
// ------- Struct stake -------
// Storage
type {:datatype} struct_storage_stake#543;
function {:constructor} stake#543#constr(time#538: int, redeem#540: bool, tokens#542: int) returns (struct_storage_stake#543);
// Memory
type address_struct_memory_stake#543 = int;
// Member time
var {:sourceloc "buggy_42.sol", 160, 9} {:message "time"} time#538: [address_struct_memory_stake#543]int;
// Member redeem
var {:sourceloc "buggy_42.sol", 161, 9} {:message "redeem"} redeem#540: [address_struct_memory_stake#543]bool;
// Member tokens
var {:sourceloc "buggy_42.sol", 162, 9} {:message "tokens"} tokens#542: [address_struct_memory_stake#543]int;
// 
// ------- End of struct stake -------
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_42.sol", 164, 3} {:message "Staking::cash_unchk46"} cash_unchk46#567(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#545: int, subpotIndex#547: int, winner_unchk46#549: address_t)
{
	var {:sourceloc "buggy_42.sol", 165, 9} {:message "subpot_unchk46"} subpot_unchk46#553: int;
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#553 := 3000000000000000000;
	call_arg#34 := subpot_unchk46#553;
	assume {:sourceloc "buggy_42.sol", 166, 9} {:message ""} true;
	call __send_ret#35 := __send(winner_unchk46#549, __this, 0, call_arg#34);
	subpot_unchk46#553 := 0;
	$return24:
	// Function body ends here
}

// 
// State variable: staker: mapping(address => struct Staking.stake storage ref)
var {:sourceloc "buggy_42.sol", 169, 3} {:message "staker"} staker#571: [address_t][address_t]struct_storage_stake#543;
function {:builtin "((as const (Array Int |T@struct_storage_stake#543|)) (|stake#543#constr| 0 false 0))"} default_address_t_struct_storage_stake#543() returns ([address_t]struct_storage_stake#543);
// 
// Function: 
procedure {:sourceloc "buggy_42.sol", 172, 5} {:message "Staking::[constructor]"} __constructor#997(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenContractAddress#573: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	token#369 := token#369[__this := 0];
	lock#392 := lock#392[__this := false];
	stakeTokens#406 := stakeTokens#406[__this := 0];
	payedOut_unchk20#409 := payedOut_unchk20#409[__this := false];
	winner_unchk20#411 := winner_unchk20#411[__this := 0];
	winAmount_unchk20#413 := winAmount_unchk20#413[__this := 0];
	basePercent#435 := basePercent#435[__this := 200];
	payedOut_unchk32#441 := payedOut_unchk32#441[__this := false];
	winner_unchk32#443 := winner_unchk32#443[__this := 0];
	winAmount_unchk32#445 := winAmount_unchk32#445[__this := 0];
	stakeTime#467 := stakeTime#467[__this := 1814400];
	stakePercentage#482 := stakePercentage#482[__this := 30];
	payedOut_unchk45#485 := payedOut_unchk45#485[__this := false];
	staker#571 := staker#571[__this := default_address_t_struct_storage_stake#543()];
	payedOut_unchk8#602 := payedOut_unchk8#602[__this := false];
	winner_unchk8#604 := winner_unchk8#604[__this := 0];
	winAmount_unchk8#606 := winAmount_unchk8#606[__this := 0];
	payedOut_unchk44#873 := payedOut_unchk44#873[__this := false];
	winner_unchk44#875 := winner_unchk44#875[__this := 0];
	winAmount_unchk44#877 := winAmount_unchk44#877[__this := 0];
	payedOut_unchk33#936 := payedOut_unchk33#936[__this := false];
	owner#15 := owner#15[__this := 0];
	payedOut_unchk9#18 := payedOut_unchk9#18[__this := false];
	newOwner#41 := newOwner#41[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#15 := owner#15[__this := __msg_sender];
	$return25:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	token#369 := token#369[__this := tokenContractAddress#573];
	owner#15 := owner#15[__this := __msg_sender];
	stakeTokens#406 := stakeTokens#406[__this := (500 * 10000000000)];
	$return26:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_42.sol", 177, 1} {:message "payedOut_unchk8"} payedOut_unchk8#602: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_42.sol", 178, 1} {:message "winner_unchk8"} winner_unchk8#604: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_42.sol", 179, 1} {:message "winAmount_unchk8"} winAmount_unchk8#606: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_42.sol", 181, 1} {:message "Staking::sendToWinner_unchk8"} sendToWinner_unchk8#625(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#602[__this]);
	assume {:sourceloc "buggy_42.sol", 183, 9} {:message ""} true;
	call __send_ret#37 := __send(winner_unchk8#604[__this], __this, 0, winAmount_unchk8#606[__this]);
	payedOut_unchk8#602 := payedOut_unchk8#602[__this := true];
	$return27:
	// Function body ends here
}

// 
// Function: startStaking : function ()
procedure {:sourceloc "buggy_42.sol", 187, 5} {:message "Staking::startStaking"} startStaking#698(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var findOnePercent#984_ret#38: int;
	var call_arg#39: address_t;
	var balanceOf#280_ret#40: int;
	var call_arg#41: address_t;
	var findOnePercent#984_ret#42: int;
	var transferFrom#304_ret#43: bool;
	var call_arg#44: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 188, 62} {:message ""} true;
	call findOnePercent#984_ret#38 := findOnePercent#984(__this, __msg_sender, __msg_value, stakeTokens#406[__this]);
	call_arg#39 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 188, 17} {:message ""} true;
	call balanceOf#280_ret#40 := balanceOf#280(token#369[__this], __this, 0, call_arg#39);
	assume (balanceOf#280_ret#40 >= (stakeTokens#406[__this] + findOnePercent#984_ret#38));
	call_arg#41 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 189, 78} {:message ""} true;
	call findOnePercent#984_ret#42 := findOnePercent#984(__this, __msg_sender, __msg_value, stakeTokens#406[__this]);
	assume {:sourceloc "buggy_42.sol", 189, 17} {:message ""} true;
	call transferFrom#304_ret#43 := transferFrom#304(token#369[__this], __this, 0, call_arg#41, __this, (stakeTokens#406[__this] + findOnePercent#984_ret#42));
	assume transferFrom#304_ret#43;
	staker#571 := staker#571[__this := staker#571[__this][__msg_sender := stake#543#constr(__block_timestamp, redeem#540#stake#543#constr(staker#571[__this][__msg_sender]), tokens#542#stake#543#constr(staker#571[__this][__msg_sender]))]];
	staker#571 := staker#571[__this := staker#571[__this][__msg_sender := stake#543#constr(time#538#stake#543#constr(staker#571[__this][__msg_sender]), redeem#540#stake#543#constr(staker#571[__this][__msg_sender]), (tokens#542#stake#543#constr(staker#571[__this][__msg_sender]) + stakeTokens#406[__this]))]];
	call_arg#44 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 192, 14} {:message ""} true;
	call stakingstarted#514(__this, __msg_sender, __msg_value, call_arg#44, tokens#542#stake#543#constr(staker#571[__this][__msg_sender]), time#538#stake#543#constr(staker#571[__this][__msg_sender]));
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 194, 1} {:message "Staking::bug_unchk39"} bug_unchk39#710(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#700: address_t)
{
	var call_arg#45: int;
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#45 := 4000000000000000000;
	assume {:sourceloc "buggy_42.sol", 195, 8} {:message ""} true;
	call __send_ret#46 := __send(addr#700, __this, 0, call_arg#45);
	$return29:
	// Function body ends here
}

// 
// Function: redeem : function ()
procedure {:sourceloc "buggy_42.sol", 197, 5} {:message "Staking::redeem"} redeem#811(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#47: address_t;
	var transfer#325_ret#48: bool;
	var call_arg#49: address_t;
	var transferFrom#304_ret#50: bool;
	var call_arg#51: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(lock#392[__this]);
	assume !(redeem#540#stake#543#constr(staker#571[__this][__msg_sender]));
	assume ((time#538#stake#543#constr(staker#571[__this][__msg_sender]) + stakeTime#467[__this]) <= __block_timestamp);
	call_arg#47 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 201, 17} {:message ""} true;
	call transfer#325_ret#48 := transfer#325(token#369[__this], __this, 0, call_arg#47, tokens#542#stake#543#constr(staker#571[__this][__msg_sender]));
	assume transfer#325_ret#48;
	call_arg#49 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 202, 17} {:message ""} true;
	call transferFrom#304_ret#50 := transferFrom#304(token#369[__this], __this, 0, owner#15[__this], call_arg#49, (((tokens#542#stake#543#constr(staker#571[__this][__msg_sender]) * stakePercentage#482[__this]) * 100) div 10000));
	assume transferFrom#304_ret#50;
	call_arg#51 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 203, 14} {:message ""} true;
	call tokensRedeemed#536(__this, __msg_sender, __msg_value, call_arg#51, tokens#542#stake#543#constr(staker#571[__this][__msg_sender]), (((tokens#542#stake#543#constr(staker#571[__this][__msg_sender]) * stakePercentage#482[__this]) * 100) div 10000));
	staker#571 := staker#571[__this := staker#571[__this][__msg_sender := stake#543#constr(time#538#stake#543#constr(staker#571[__this][__msg_sender]), true, tokens#542#stake#543#constr(staker#571[__this][__msg_sender]))]];
	staker#571 := staker#571[__this := staker#571[__this][__msg_sender := stake#543#constr(time#538#stake#543#constr(staker#571[__this][__msg_sender]), redeem#540#stake#543#constr(staker#571[__this][__msg_sender]), 0)]];
	$return30:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 207, 1} {:message "Staking::my_func_uncheck36"} my_func_uncheck36#826(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#813: address_t)
{
	var __call_ret#52: bool;
	var __call_ret#53: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_42.sol", 208, 3} {:message ""} true;
	call __call_ret#52, __call_ret#53 := __call(dst#813, __this, __msg_value);
	if (__call_ret#52) {
	havoc token#369;
	havoc lock#392;
	havoc stakeTokens#406;
	havoc payedOut_unchk20#409;
	havoc winner_unchk20#411;
	havoc winAmount_unchk20#413;
	havoc basePercent#435;
	havoc payedOut_unchk32#441;
	havoc winner_unchk32#443;
	havoc winAmount_unchk32#445;
	havoc stakeTime#467;
	havoc stakePercentage#482;
	havoc payedOut_unchk45#485;
	havoc staker#571;
	havoc payedOut_unchk8#602;
	havoc winner_unchk8#604;
	havoc winAmount_unchk8#606;
	havoc payedOut_unchk44#873;
	havoc winner_unchk44#875;
	havoc winAmount_unchk44#877;
	havoc payedOut_unchk33#936;
	havoc owner#15;
	havoc payedOut_unchk9#18;
	havoc newOwner#41;
	havoc __balance;
	}

	if (!(__call_ret#52)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return31:
	// Function body ends here
}

// 
// Function: changeStakeTokens : function (uint256)
procedure {:sourceloc "buggy_42.sol", 211, 5} {:message "Staking::changeStakeTokens"} changeStakeTokens#845(__this: address_t, __msg_sender: address_t, __msg_value: int, _NewTokensThreshold#828: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#15[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTokens#406 := stakeTokens#406[__this := (_NewTokensThreshold#828 * 10000000000)];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 214, 1} {:message "Staking::my_func_unchk35"} my_func_unchk35#858(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#847: address_t)
{
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 215, 9} {:message ""} true;
	call __send_ret#56 := __send(dst#847, __this, 0, __msg_value);
	$return34:
	// Function body ends here
}

// 
// Function: changeStakeTime : function (uint256)
procedure {:sourceloc "buggy_42.sol", 218, 5} {:message "Staking::changeStakeTime"} changeStakeTime#870(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakeTime#860: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#15[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTime#467 := stakeTime#467[__this := _newStakeTime#860];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_42.sol", 221, 1} {:message "payedOut_unchk44"} payedOut_unchk44#873: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_42.sol", 222, 1} {:message "winner_unchk44"} winner_unchk44#875: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_42.sol", 223, 1} {:message "winAmount_unchk44"} winAmount_unchk44#877: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_42.sol", 225, 1} {:message "Staking::sendToWinner_unchk44"} sendToWinner_unchk44#896(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#59: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#873[__this]);
	assume {:sourceloc "buggy_42.sol", 227, 9} {:message ""} true;
	call __send_ret#59 := __send(winner_unchk44#875[__this], __this, 0, winAmount_unchk44#877[__this]);
	payedOut_unchk44#873 := payedOut_unchk44#873[__this := true];
	$return37:
	// Function body ends here
}

// 
// Function: changeStakingPercentage : function (uint256)
procedure {:sourceloc "buggy_42.sol", 231, 5} {:message "Staking::changeStakingPercentage"} changeStakingPercentage#908(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakePercentage#898: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#15[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakePercentage#482 := stakePercentage#482[__this := _newStakePercentage#898];
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_42.sol", 235, 1} {:message "Staking::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#923(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 236, 4} {:message "addr_unchk40"} addr_unchk40#912: address_t;
	var call_arg#62: int;
	var __send_ret#63: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#912 := 0;
	call_arg#62 := 2000000000000000000;
	assume {:sourceloc "buggy_42.sol", 237, 10} {:message ""} true;
	call __send_ret#63 := __send(addr_unchk40#912, __this, 0, call_arg#62);
	if (!(__send_ret#63)) {
	
	}
	else {
	
	}

	$return40:
	// Function body ends here
}

// 
// Function: lockWithdrawals : function ()
procedure {:sourceloc "buggy_42.sol", 245, 5} {:message "Staking::lockWithdrawals"} lockWithdrawals#933(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#15[__this]) || (__msg_sender == __this));
	// Function body starts here
	lock#392 := lock#392[__this := true];
	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_42.sol", 248, 1} {:message "payedOut_unchk33"} payedOut_unchk33#936: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_42.sol", 250, 1} {:message "Staking::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#957(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#936[__this];
	assume {:sourceloc "buggy_42.sol", 252, 3} {:message ""} true;
	call __send_ret#66 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return43:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 255, 5} {:message "Staking::findOnePercent"} findOnePercent#984(__this: address_t, __msg_sender: address_t, __msg_value: int, value#959: int)
	returns (#962: int)
{
	var {:sourceloc "buggy_42.sol", 256, 9} {:message "roundValue"} roundValue#965: int;
	var ceil#272_ret#67: int;
	var {:sourceloc "buggy_42.sol", 257, 9} {:message "onePercent"} onePercent#972: int;
	var mul#178_ret#68: int;
	var call_arg#69: int;
	var div#196_ret#70: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 256, 30} {:message ""} true;
	call ceil#272_ret#67 := ceil#272(__this, __msg_sender, __msg_value, value#959, basePercent#435[__this]);
	roundValue#965 := ceil#272_ret#67;
	assume {:sourceloc "buggy_42.sol", 257, 30} {:message ""} true;
	call mul#178_ret#68 := mul#178(__this, __msg_sender, __msg_value, roundValue#965, basePercent#435[__this]);
	call_arg#69 := 10000;
	assume {:sourceloc "buggy_42.sol", 257, 30} {:message ""} true;
	call div#196_ret#70 := div#196(__this, __msg_sender, __msg_value, mul#178_ret#68, call_arg#69);
	onePercent#972 := div#196_ret#70;
	#962 := onePercent#972;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_42.sol", 260, 1} {:message "Staking::bug_unchk27"} bug_unchk27#996(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#986: address_t)
{
	var call_arg#71: int;
	var __send_ret#72: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#71 := 42000000000000000000;
	assume {:sourceloc "buggy_42.sol", 261, 8} {:message ""} true;
	call __send_ret#72 := __send(addr#986, __this, 0, call_arg#71);
	$return45:
	// Function body ends here
}

