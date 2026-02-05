// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_37.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: safeAdd : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 26, 5} {:message "SafeMath::safeAdd"} safeAdd#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (c#8: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#8 := (a#3 + b#5);
	assume (c#8 >= a#3);
	$return0:
	// Function body ends here
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
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_37.sol", 30, 1} {:message "SafeMath::withdrawBal_unchk17"} withdrawBal_unchk17#40(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 31, 2} {:message "Balances_unchk17"} Balances_unchk17#27: int;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#27 := 0;
	call_arg#0 := Balances_unchk17#27;
	assume {:sourceloc "buggy_37.sol", 32, 5} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	$return1:
	// Function body ends here
}

// 
// Function: safeSub : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 33, 5} {:message "SafeMath::safeSub"} safeSub#62(__this: address_t, __msg_sender: address_t, __msg_value: int, a#42: int, b#44: int)
	returns (c#47: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#44 <= a#42);
	c#47 := (a#42 - b#44);
	$return2:
	// Function body ends here
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
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 37, 1} {:message "SafeMath::callnotchecked_unchk37"} callnotchecked_unchk37#76(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#64: address_t)
{
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_37.sol", 38, 5} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(callee#64, __this, 1000000000000000000);
	if (__call_ret#2) {
	havoc payedOut_unchk9#141;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return3:
	// Function body ends here
}

// 
// Function: safeMul : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 40, 5} {:message "SafeMath::safeMul"} safeMul#104(__this: address_t, __msg_sender: address_t, __msg_value: int, a#78: int, b#80: int)
	returns (c#83: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#83 := (a#78 * b#80);
	assume ((a#78 == 0) || ((c#83 div a#78) == b#80));
	$return4:
	// Function body ends here
}

// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 44, 1} {:message "SafeMath::bug_unchk3"} bug_unchk3#116(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#106: address_t)
{
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#4 := 42000000000000000000;
	assume {:sourceloc "buggy_37.sol", 45, 8} {:message ""} true;
	call __send_ret#5 := __send(addr#106, __this, 0, call_arg#4);
	$return5:
	// Function body ends here
}

// 
// Function: safeDiv : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 46, 5} {:message "SafeMath::safeDiv"} safeDiv#138(__this: address_t, __msg_sender: address_t, __msg_value: int, a#118: int, b#120: int)
	returns (c#123: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#120 > 0);
	c#123 := (a#118 div b#120);
	$return6:
	// Function body ends here
}

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_37.sol", 50, 1} {:message "payedOut_unchk9"} payedOut_unchk9#141: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_37.sol", 52, 1} {:message "SafeMath::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#162(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#141[__this];
	assume {:sourceloc "buggy_37.sol", 54, 5} {:message ""} true;
	call __send_ret#6 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return7:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 25, 1} {:message "SafeMath::[implicit_constructor]"} __constructor#163(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk9#141 := payedOut_unchk9#141[__this := false];
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_37.sol", 108, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#353(__this: address_t, __msg_sender: address_t, __msg_value: int, from#347: address_t, to#349: address_t, tokens#351: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_37.sol", 115, 3} {:message "[event] ERC20Interface::Approval"} Approval#385(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#379: address_t, spender#381: address_t, tokens#383: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 64, 5} {:message "ERC20Interface::totalSupply"} totalSupply#168(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#166: int);
	modifies payedOut_unchk20#243, winner_unchk20#245, winAmount_unchk20#247, payedOut_unchk32#278, winner_unchk32#280, winAmount_unchk32#282, payedOut_unchk45#356;

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 65, 1} {:message "ERC20Interface::callnotchecked_unchk25"} callnotchecked_unchk25#182(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#170: address_t)
{
	var __call_ret#7: bool;
	var __call_ret#8: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_37.sol", 66, 5} {:message ""} true;
	call __call_ret#7, __call_ret#8 := __call(callee#170, __this, 1000000000000000000);
	if (__call_ret#7) {
	havoc payedOut_unchk20#243;
	havoc winner_unchk20#245;
	havoc winAmount_unchk20#247;
	havoc payedOut_unchk32#278;
	havoc winner_unchk32#280;
	havoc winAmount_unchk32#282;
	havoc payedOut_unchk45#356;
	havoc __balance;
	}

	if (!(__call_ret#7)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return8:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 68, 5} {:message "ERC20Interface::balanceOf"} balanceOf#189(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#184: address_t)
	returns (balance#187: int);
	modifies payedOut_unchk20#243, winner_unchk20#245, winAmount_unchk20#247, payedOut_unchk32#278, winner_unchk32#280, winAmount_unchk32#282, payedOut_unchk45#356;

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_37.sol", 69, 1} {:message "ERC20Interface::bug_unchk19"} bug_unchk19#210(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 70, 1} {:message "addr_unchk19"} addr_unchk19#193: address_t;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#193 := 0;
	call_arg#9 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 71, 6} {:message ""} true;
	call __send_ret#10 := __send(addr_unchk19#193, __this, 0, call_arg#9);
	if ((!(__send_ret#10) || (1 == 1))) {
	assume false;
	}

	$return9:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 74, 5} {:message "ERC20Interface::allowance"} allowance#219(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#212: address_t, spender#214: address_t)
	returns (remaining#217: int);
	modifies payedOut_unchk20#243, winner_unchk20#245, winAmount_unchk20#247, payedOut_unchk32#278, winner_unchk32#280, winAmount_unchk32#282, payedOut_unchk45#356;

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 75, 1} {:message "ERC20Interface::unhandledsend_unchk26"} unhandledsend_unchk26#231(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#221: address_t)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := 5000000000000000000;
	assume {:sourceloc "buggy_37.sol", 76, 5} {:message ""} true;
	call __send_ret#12 := __send(callee#221, __this, 0, call_arg#11);
	$return10:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 78, 5} {:message "ERC20Interface::transfer"} transfer#240(__this: address_t, __msg_sender: address_t, __msg_value: int, to#233: address_t, tokens#235: int)
	returns (success#238: bool);
	modifies payedOut_unchk20#243, winner_unchk20#245, winAmount_unchk20#247, payedOut_unchk32#278, winner_unchk32#280, winAmount_unchk32#282, payedOut_unchk45#356;

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_37.sol", 79, 1} {:message "payedOut_unchk20"} payedOut_unchk20#243: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_37.sol", 80, 1} {:message "winner_unchk20"} winner_unchk20#245: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_37.sol", 81, 1} {:message "winAmount_unchk20"} winAmount_unchk20#247: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_37.sol", 83, 1} {:message "ERC20Interface::sendToWinner_unchk20"} sendToWinner_unchk20#266(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#243[__this]);
	assume {:sourceloc "buggy_37.sol", 85, 9} {:message ""} true;
	call __send_ret#13 := __send(winner_unchk20#245[__this], __this, 0, winAmount_unchk20#247[__this]);
	payedOut_unchk20#243 := payedOut_unchk20#243[__this := true];
	$return11:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 88, 5} {:message "ERC20Interface::approve"} approve#275(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#268: address_t, tokens#270: int)
	returns (success#273: bool);
	modifies payedOut_unchk20#243, winner_unchk20#245, winAmount_unchk20#247, payedOut_unchk32#278, winner_unchk32#280, winAmount_unchk32#282, payedOut_unchk45#356;

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_37.sol", 89, 1} {:message "payedOut_unchk32"} payedOut_unchk32#278: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_37.sol", 90, 1} {:message "winner_unchk32"} winner_unchk32#280: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_37.sol", 91, 1} {:message "winAmount_unchk32"} winAmount_unchk32#282: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_37.sol", 93, 1} {:message "ERC20Interface::sendToWinner_unchk32"} sendToWinner_unchk32#301(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#278[__this]);
	assume {:sourceloc "buggy_37.sol", 95, 9} {:message ""} true;
	call __send_ret#14 := __send(winner_unchk32#280[__this], __this, 0, winAmount_unchk32#282[__this]);
	payedOut_unchk32#278 := payedOut_unchk32#278[__this := true];
	$return12:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 98, 5} {:message "ERC20Interface::transferFrom"} transferFrom#312(__this: address_t, __msg_sender: address_t, __msg_value: int, from#303: address_t, to#305: address_t, tokens#307: int)
	returns (success#310: bool);
	modifies payedOut_unchk20#243, winner_unchk20#245, winAmount_unchk20#247, payedOut_unchk32#278, winner_unchk32#280, winAmount_unchk32#282, payedOut_unchk45#356;

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 99, 1} {:message "ERC20Interface::unhandledsend_unchk38"} unhandledsend_unchk38#324(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#314: address_t)
{
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#15 := 5000000000000000000;
	assume {:sourceloc "buggy_37.sol", 100, 5} {:message ""} true;
	call __send_ret#16 := __send(callee#314, __this, 0, call_arg#15);
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_37.sol", 103, 3} {:message "ERC20Interface::bug_unchk31"} bug_unchk31#345(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 104, 1} {:message "addr_unchk31"} addr_unchk31#328: address_t;
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#328 := 0;
	call_arg#17 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 105, 6} {:message ""} true;
	call __send_ret#18 := __send(addr_unchk31#328, __this, 0, call_arg#17);
	if ((!(__send_ret#18) || (1 == 1))) {
	assume false;
	}

	$return14:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_37.sol", 109, 3} {:message "payedOut_unchk45"} payedOut_unchk45#356: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_37.sol", 111, 1} {:message "ERC20Interface::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#377(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#356[__this];
	assume {:sourceloc "buggy_37.sol", 113, 5} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return15:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 63, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk20#243 := payedOut_unchk20#243[__this := false];
	winner_unchk20#245 := winner_unchk20#245[__this := 0];
	winAmount_unchk20#247 := winAmount_unchk20#247[__this := 0];
	payedOut_unchk32#278 := payedOut_unchk32#278[__this := false];
	winner_unchk32#280 := winner_unchk32#280[__this := 0];
	winAmount_unchk32#282 := winAmount_unchk32#282[__this := 0];
	payedOut_unchk45#356 := payedOut_unchk45#356[__this := false];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_37.sol", 125, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#397(__this: address_t, __msg_sender: address_t, __msg_value: int, from#388: address_t, tokens#390: int, token#392: address_t, data#394: int_arr_ptr);

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_37.sol", 126, 1} {:message "ApproveAndCallFallBack::cash_unchk46"} cash_unchk46#421(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#399: int, subpotIndex#401: int, winner_unchk46#403: address_t)
{
	var {:sourceloc "buggy_37.sol", 127, 9} {:message "subpot_unchk46"} subpot_unchk46#407: int;
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#407 := 3000000000000000000;
	call_arg#20 := subpot_unchk46#407;
	assume {:sourceloc "buggy_37.sol", 128, 9} {:message ""} true;
	call __send_ret#21 := __send(winner_unchk46#403, __this, 0, call_arg#20);
	subpot_unchk46#407 := 0;
	$return16:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 124, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#422(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_37.sol", 150, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#474(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#470: address_t, _to#472: address_t)
{
	
}

// 
// Function: my_func_uncheck12 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 138, 3} {:message "Owned::my_func_uncheck12"} my_func_uncheck12#437(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#424: address_t)
{
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_37.sol", 139, 5} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(dst#424, __this, __msg_value);
	if (__call_ret#22) {
	havoc owner#439;
	havoc newOwner#454;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return17:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_37.sol", 141, 3} {:message "owner"} owner#439: [address_t]address_t;
// 
// Function: my_func_unchk11 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 142, 3} {:message "Owned::my_func_unchk11"} my_func_unchk11#452(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#441: address_t)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 143, 9} {:message ""} true;
	call __send_ret#24 := __send(dst#441, __this, 0, __msg_value);
	$return18:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_37.sol", 145, 3} {:message "newOwner"} newOwner#454: [address_t]address_t;
// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_37.sol", 147, 3} {:message "Owned::callnotchecked_unchk13"} callnotchecked_unchk13#468(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#456: address_t)
{
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_37.sol", 148, 9} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(callee#456, __this, 1000000000000000000);
	if (__call_ret#25) {
	havoc owner#439;
	havoc newOwner#454;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return19:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 152, 5} {:message "Owned::[constructor]"} __constructor#583(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#439 := owner#439[__this := 0];
	newOwner#454 := newOwner#454[__this := 0];
	// Function body starts here
	owner#439 := owner#439[__this := __msg_sender];
	$return20:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_37.sol", 155, 1} {:message "Owned::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#498(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 156, 4} {:message "addr_unchk4"} addr_unchk4#487: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#487 := 0;
	call_arg#27 := 42000000000000000000;
	assume {:sourceloc "buggy_37.sol", 157, 10} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk4#487, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	
	}
	else {
	
	}

	$return21:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_37.sol", 170, 5} {:message "Owned::transferOwnership"} transferOwnership#521(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#511: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#439[__this]);
	// Function body starts here
	newOwner#454 := newOwner#454[__this := _newOwner#511];
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_37.sol", 173, 1} {:message "Owned::bug_unchk7"} bug_unchk7#542(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 174, 1} {:message "addr_unchk7"} addr_unchk7#525: address_t;
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#525 := 0;
	call_arg#31 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 175, 6} {:message ""} true;
	call __send_ret#32 := __send(addr_unchk7#525, __this, 0, call_arg#31);
	if ((!(__send_ret#32) || (1 == 1))) {
	assume false;
	}

	$return24:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_37.sol", 178, 5} {:message "Owned::acceptOwnership"} acceptOwnership#569(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#454[__this]);
	assume {:sourceloc "buggy_37.sol", 180, 14} {:message ""} true;
	call OwnershipTransferred#474(__this, __msg_sender, __msg_value, owner#439[__this], newOwner#454[__this]);
	owner#439 := owner#439[__this := newOwner#454[__this]];
	newOwner#454 := newOwner#454[__this := 0];
	$return25:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 184, 1} {:message "Owned::my_func_unchk23"} my_func_unchk23#582(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#571: address_t)
{
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 185, 9} {:message ""} true;
	call __send_ret#33 := __send(dst#571, __this, 0, __msg_value);
	$return26:
	// Function body ends here
}

// 
// ------- Contract: AugustCoin -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Inherits from: SafeMath
// 
// Function: callnotchecked_unchk1 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 195, 3} {:message "AugustCoin::callnotchecked_unchk1"} callnotchecked_unchk1#603(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#591: address_t)
{
	var __call_ret#34: bool;
	var __call_ret#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 2000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 2000000000000000000)];
	assume {:sourceloc "buggy_37.sol", 196, 9} {:message ""} true;
	call __call_ret#34, __call_ret#35 := __call(callee#591, __this, 2000000000000000000);
	if (__call_ret#34) {
	havoc symbol#605;
	havoc name#624;
	havoc decimals#651;
	havoc _totalSupply#665;
	havoc balances#690;
	havoc allowed#711;
	havoc payedOut_unchk8#815;
	havoc winner_unchk8#817;
	havoc winAmount_unchk8#819;
	havoc payedOut_unchk44#1031;
	havoc winner_unchk44#1033;
	havoc winAmount_unchk44#1035;
	havoc payedOut_unchk33#1123;
	havoc payedOut_unchk9#141;
	havoc owner#439;
	havoc newOwner#454;
	havoc payedOut_unchk20#243;
	havoc winner_unchk20#245;
	havoc winAmount_unchk20#247;
	havoc payedOut_unchk32#278;
	havoc winner_unchk32#280;
	havoc winAmount_unchk32#282;
	havoc payedOut_unchk45#356;
	havoc __balance;
	}

	if (!(__call_ret#34)) {
	__balance := __balance[__this := (__balance[__this] + 2000000000000000000)];
	}

	$return27:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_37.sol", 198, 3} {:message "symbol"} symbol#605: [address_t]int_arr_type;
// 
// Function: withdrawBal_unchk41 : function ()
procedure {:sourceloc "buggy_37.sol", 199, 3} {:message "AugustCoin::withdrawBal_unchk41"} withdrawBal_unchk41#622(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 200, 2} {:message "Balances_unchk41"} Balances_unchk41#609: int;
	var call_arg#36: int;
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk41#609 := 0;
	call_arg#36 := Balances_unchk41#609;
	assume {:sourceloc "buggy_37.sol", 201, 5} {:message ""} true;
	call __send_ret#37 := __send(__msg_sender, __this, 0, call_arg#36);
	$return28:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_37.sol", 202, 3} {:message "name"} name#624: [address_t]int_arr_type;
// 
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_37.sol", 203, 3} {:message "AugustCoin::bug_unchk42"} bug_unchk42#649(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 204, 1} {:message "receivers_unchk42"} receivers_unchk42#628: int;
	var {:sourceloc "buggy_37.sol", 205, 1} {:message "addr_unchk42"} addr_unchk42#631: address_t;
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#628 := 0;
	addr_unchk42#631 := 0;
	call_arg#38 := 42000000000000000000;
	assume {:sourceloc "buggy_37.sol", 206, 6} {:message ""} true;
	call __send_ret#39 := __send(addr_unchk42#631, __this, 0, call_arg#38);
	if (!(__send_ret#39)) {
	receivers_unchk42#628 := (receivers_unchk42#628 + 1);
	}
	else {
	assume false;
	}

	$return29:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_37.sol", 211, 3} {:message "decimals"} decimals#651: [address_t]int;
// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 212, 3} {:message "AugustCoin::unhandledsend_unchk2"} unhandledsend_unchk2#663(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#653: address_t)
{
	var call_arg#40: int;
	var __send_ret#41: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#40 := 5000000000000000000;
	assume {:sourceloc "buggy_37.sol", 213, 5} {:message ""} true;
	call __send_ret#41 := __send(callee#653, __this, 0, call_arg#40);
	$return30:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_37.sol", 215, 3} {:message "_totalSupply"} _totalSupply#665: [address_t]int;
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_37.sol", 217, 3} {:message "AugustCoin::bug_unchk43"} bug_unchk43#686(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 218, 1} {:message "addr_unchk43"} addr_unchk43#669: address_t;
	var call_arg#42: int;
	var __send_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#669 := 0;
	call_arg#42 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 219, 6} {:message ""} true;
	call __send_ret#43 := __send(addr_unchk43#669, __this, 0, call_arg#42);
	if ((!(__send_ret#43) || (1 == 1))) {
	assume false;
	}

	$return31:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 222, 3} {:message "balances"} balances#690: [address_t][address_t]int;
// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 223, 3} {:message "AugustCoin::my_func_uncheck48"} my_func_uncheck48#705(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#692: address_t)
{
	var __call_ret#44: bool;
	var __call_ret#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_37.sol", 224, 7} {:message ""} true;
	call __call_ret#44, __call_ret#45 := __call(dst#692, __this, __msg_value);
	if (__call_ret#44) {
	havoc symbol#605;
	havoc name#624;
	havoc decimals#651;
	havoc _totalSupply#665;
	havoc balances#690;
	havoc allowed#711;
	havoc payedOut_unchk8#815;
	havoc winner_unchk8#817;
	havoc winAmount_unchk8#819;
	havoc payedOut_unchk44#1031;
	havoc winner_unchk44#1033;
	havoc winAmount_unchk44#1035;
	havoc payedOut_unchk33#1123;
	havoc payedOut_unchk9#141;
	havoc owner#439;
	havoc newOwner#454;
	havoc payedOut_unchk20#243;
	havoc winner_unchk20#245;
	havoc winAmount_unchk20#247;
	havoc payedOut_unchk32#278;
	havoc winner_unchk32#280;
	havoc winAmount_unchk32#282;
	havoc payedOut_unchk45#356;
	havoc __balance;
	}

	if (!(__call_ret#44)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return32:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_37.sol", 226, 3} {:message "allowed"} allowed#711: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 232, 5} {:message "AugustCoin::[constructor]"} __constructor#1177(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#47: address_t;
	var call_arg#48: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	symbol#605 := symbol#605[__this := int_arr#constr(default_int_int(), 0)];
	name#624 := name#624[__this := int_arr#constr(default_int_int(), 0)];
	decimals#651 := decimals#651[__this := 0];
	_totalSupply#665 := _totalSupply#665[__this := 0];
	balances#690 := balances#690[__this := default_address_t_int()];
	allowed#711 := allowed#711[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk8#815 := payedOut_unchk8#815[__this := false];
	winner_unchk8#817 := winner_unchk8#817[__this := 0];
	winAmount_unchk8#819 := winAmount_unchk8#819[__this := 0];
	payedOut_unchk44#1031 := payedOut_unchk44#1031[__this := false];
	winner_unchk44#1033 := winner_unchk44#1033[__this := 0];
	winAmount_unchk44#1035 := winAmount_unchk44#1035[__this := 0];
	payedOut_unchk33#1123 := payedOut_unchk33#1123[__this := false];
	payedOut_unchk9#141 := payedOut_unchk9#141[__this := false];
	owner#439 := owner#439[__this := 0];
	newOwner#454 := newOwner#454[__this := 0];
	payedOut_unchk20#243 := payedOut_unchk20#243[__this := false];
	winner_unchk20#245 := winner_unchk20#245[__this := 0];
	winAmount_unchk20#247 := winAmount_unchk20#247[__this := 0];
	payedOut_unchk32#278 := payedOut_unchk32#278[__this := false];
	winner_unchk32#280 := winner_unchk32#280[__this := 0];
	winAmount_unchk32#282 := winAmount_unchk32#282[__this := 0];
	payedOut_unchk45#356 := payedOut_unchk45#356[__this := false];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#439 := owner#439[__this := __msg_sender];
	$return33:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#605 := symbol#605[__this := int_arr#constr(default_int_int()[0 := 65][1 := 85][2 := 67], 3)];
	name#624 := name#624[__this := int_arr#constr(default_int_int()[0 := 65][1 := 117][2 := 103][3 := 117][4 := 115][5 := 116][6 := 67][7 := 111][8 := 105][9 := 110], 10)];
	decimals#651 := decimals#651[__this := 18];
	_totalSupply#665 := _totalSupply#665[__this := 100000000000000000000000000];
	balances#690 := balances#690[__this := balances#690[__this][address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD := _totalSupply#665[__this]]];
	call_arg#47 := 0;
	call_arg#48 := address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD;
	assume {:sourceloc "buggy_37.sol", 238, 14} {:message ""} true;
	call Transfer#353(__this, __msg_sender, __msg_value, call_arg#47, call_arg#48, _totalSupply#665[__this]);
	$return34:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 240, 1} {:message "AugustCoin::unhandledsend_unchk14"} unhandledsend_unchk14#758(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#748: address_t)
{
	var call_arg#49: int;
	var __send_ret#50: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#49 := 5000000000000000000;
	assume {:sourceloc "buggy_37.sol", 241, 5} {:message ""} true;
	call __send_ret#50 := __send(callee#748, __this, 0, call_arg#49);
	$return35:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 248, 5} {:message "AugustCoin::totalSupply"} totalSupply#774(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#762: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#762 := (_totalSupply#665[__this] - balances#690[__this][0]);
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_37.sol", 251, 1} {:message "AugustCoin::bug_unchk30"} bug_unchk30#799(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 252, 1} {:message "receivers_unchk30"} receivers_unchk30#778: int;
	var {:sourceloc "buggy_37.sol", 253, 1} {:message "addr_unchk30"} addr_unchk30#781: address_t;
	var call_arg#51: int;
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#778 := 0;
	addr_unchk30#781 := 0;
	call_arg#51 := 42000000000000000000;
	assume {:sourceloc "buggy_37.sol", 254, 6} {:message ""} true;
	call __send_ret#52 := __send(addr_unchk30#781, __this, 0, call_arg#51);
	if (!(__send_ret#52)) {
	receivers_unchk30#778 := (receivers_unchk30#778 + 1);
	}
	else {
	assume false;
	}

	$return37:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 264, 5} {:message "AugustCoin::balanceOf"} balanceOf#812(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#801: address_t)
	returns (balance#805: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#805 := balances#690[__this][tokenOwner#801];
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_37.sol", 267, 1} {:message "payedOut_unchk8"} payedOut_unchk8#815: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_37.sol", 268, 1} {:message "winner_unchk8"} winner_unchk8#817: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_37.sol", 269, 1} {:message "winAmount_unchk8"} winAmount_unchk8#819: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_37.sol", 271, 1} {:message "AugustCoin::sendToWinner_unchk8"} sendToWinner_unchk8#838(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#53: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#815[__this]);
	assume {:sourceloc "buggy_37.sol", 273, 9} {:message ""} true;
	call __send_ret#53 := __send(winner_unchk8#817[__this], __this, 0, winAmount_unchk8#819[__this]);
	payedOut_unchk8#815 := payedOut_unchk8#815[__this := true];
	$return39:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 283, 5} {:message "AugustCoin::transfer"} transfer#882(__this: address_t, __msg_sender: address_t, __msg_value: int, to#840: address_t, tokens#842: int)
	returns (success#846: bool)
{
	var safeSub#62_ret#54: int;
	var safeAdd#23_ret#55: int;
	var call_arg#56: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 284, 32} {:message ""} true;
	call safeSub#62_ret#54 := safeSub#62(__this, __msg_sender, __msg_value, balances#690[__this][__msg_sender], tokens#842);
	balances#690 := balances#690[__this := balances#690[__this][__msg_sender := safeSub#62_ret#54]];
	assume {:sourceloc "buggy_37.sol", 285, 24} {:message ""} true;
	call safeAdd#23_ret#55 := safeAdd#23(__this, __msg_sender, __msg_value, balances#690[__this][to#840], tokens#842);
	balances#690 := balances#690[__this := balances#690[__this][to#840 := safeAdd#23_ret#55]];
	call_arg#56 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 286, 14} {:message ""} true;
	call Transfer#353(__this, __msg_sender, __msg_value, call_arg#56, to#840, tokens#842);
	success#846 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 289, 1} {:message "AugustCoin::bug_unchk39"} bug_unchk39#894(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#884: address_t)
{
	var call_arg#57: int;
	var __send_ret#58: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#57 := 4000000000000000000;
	assume {:sourceloc "buggy_37.sol", 290, 8} {:message ""} true;
	call __send_ret#58 := __send(addr#884, __this, 0, call_arg#57);
	$return41:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 301, 5} {:message "AugustCoin::approve"} approve#923(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#896: address_t, tokens#898: int)
	returns (success#902: bool)
{
	var call_arg#59: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#711 := allowed#711[__this := allowed#711[__this][__msg_sender := allowed#711[__this][__msg_sender][spender#896 := tokens#898]]];
	call_arg#59 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 303, 14} {:message ""} true;
	call Approval#385(__this, __msg_sender, __msg_value, call_arg#59, spender#896, tokens#898);
	success#902 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 306, 1} {:message "AugustCoin::my_func_uncheck36"} my_func_uncheck36#938(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#925: address_t)
{
	var __call_ret#60: bool;
	var __call_ret#61: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_37.sol", 307, 5} {:message ""} true;
	call __call_ret#60, __call_ret#61 := __call(dst#925, __this, __msg_value);
	if (__call_ret#60) {
	havoc symbol#605;
	havoc name#624;
	havoc decimals#651;
	havoc _totalSupply#665;
	havoc balances#690;
	havoc allowed#711;
	havoc payedOut_unchk8#815;
	havoc winner_unchk8#817;
	havoc winAmount_unchk8#819;
	havoc payedOut_unchk44#1031;
	havoc winner_unchk44#1033;
	havoc winAmount_unchk44#1035;
	havoc payedOut_unchk33#1123;
	havoc payedOut_unchk9#141;
	havoc owner#439;
	havoc newOwner#454;
	havoc payedOut_unchk20#243;
	havoc winner_unchk20#245;
	havoc winAmount_unchk20#247;
	havoc payedOut_unchk32#278;
	havoc winner_unchk32#280;
	havoc winAmount_unchk32#282;
	havoc payedOut_unchk45#356;
	havoc __balance;
	}

	if (!(__call_ret#60)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return43:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 320, 5} {:message "AugustCoin::transferFrom"} transferFrom#998(__this: address_t, __msg_sender: address_t, __msg_value: int, from#940: address_t, to#942: address_t, tokens#944: int)
	returns (success#948: bool)
{
	var safeSub#62_ret#62: int;
	var safeSub#62_ret#63: int;
	var safeAdd#23_ret#64: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 321, 26} {:message ""} true;
	call safeSub#62_ret#62 := safeSub#62(__this, __msg_sender, __msg_value, balances#690[__this][from#940], tokens#944);
	balances#690 := balances#690[__this := balances#690[__this][from#940 := safeSub#62_ret#62]];
	assume {:sourceloc "buggy_37.sol", 322, 37} {:message ""} true;
	call safeSub#62_ret#63 := safeSub#62(__this, __msg_sender, __msg_value, allowed#711[__this][from#940][__msg_sender], tokens#944);
	allowed#711 := allowed#711[__this := allowed#711[__this][from#940 := allowed#711[__this][from#940][__msg_sender := safeSub#62_ret#63]]];
	assume {:sourceloc "buggy_37.sol", 323, 24} {:message ""} true;
	call safeAdd#23_ret#64 := safeAdd#23(__this, __msg_sender, __msg_value, balances#690[__this][to#942], tokens#944);
	balances#690 := balances#690[__this := balances#690[__this][to#942 := safeAdd#23_ret#64]];
	assume {:sourceloc "buggy_37.sol", 324, 14} {:message ""} true;
	call Transfer#353(__this, __msg_sender, __msg_value, from#940, to#942, tokens#944);
	success#948 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 327, 1} {:message "AugustCoin::my_func_unchk35"} my_func_unchk35#1011(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1000: address_t)
{
	var __send_ret#65: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 328, 9} {:message ""} true;
	call __send_ret#65 := __send(dst#1000, __this, 0, __msg_value);
	$return45:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 336, 5} {:message "AugustCoin::allowance"} allowance#1028(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1013: address_t, spender#1015: address_t)
	returns (remaining#1019: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1019 := allowed#711[__this][tokenOwner#1013][spender#1015];
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_37.sol", 339, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1031: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_37.sol", 340, 1} {:message "winner_unchk44"} winner_unchk44#1033: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_37.sol", 341, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1035: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_37.sol", 343, 1} {:message "AugustCoin::sendToWinner_unchk44"} sendToWinner_unchk44#1054(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1031[__this]);
	assume {:sourceloc "buggy_37.sol", 345, 9} {:message ""} true;
	call __send_ret#66 := __send(winner_unchk44#1033[__this], __this, 0, winAmount_unchk44#1035[__this]);
	payedOut_unchk44#1031 := payedOut_unchk44#1031[__this := true];
	$return47:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_37.sol", 355, 5} {:message "AugustCoin::approveAndCall"} approveAndCall#1098(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1056: address_t, tokens#1058: int, data#1060: int_arr_ptr)
	returns (success#1063: bool)
{
	var call_arg#67: address_t;
	var call_arg#68: address_t;
	var call_arg#69: address_t;
	// TCC assumptions
	assume (data#1060 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#711 := allowed#711[__this := allowed#711[__this][__msg_sender := allowed#711[__this][__msg_sender][spender#1056 := tokens#1058]]];
	call_arg#67 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 357, 14} {:message ""} true;
	call Approval#385(__this, __msg_sender, __msg_value, call_arg#67, spender#1056, tokens#1058);
	call_arg#68 := __msg_sender;
	call_arg#69 := __this;
	assume {:sourceloc "buggy_37.sol", 358, 9} {:message ""} true;
	call receiveApproval#397(spender#1056, __this, 0, call_arg#68, tokens#1058, call_arg#69, data#1060);
	success#1063 := true;
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_37.sol", 361, 1} {:message "AugustCoin::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1113(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 362, 4} {:message "addr_unchk40"} addr_unchk40#1102: address_t;
	var call_arg#70: int;
	var __send_ret#71: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1102 := 0;
	call_arg#70 := 2000000000000000000;
	assume {:sourceloc "buggy_37.sol", 363, 10} {:message ""} true;
	call __send_ret#71 := __send(addr_unchk40#1102, __this, 0, call_arg#70);
	if (!(__send_ret#71)) {
	
	}
	else {
	
	}

	$return49:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 375, 5} {:message "AugustCoin::[fallback]"} #1120(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return50:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_37.sol", 378, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1123: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_37.sol", 380, 1} {:message "AugustCoin::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1144(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#72: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1123[__this];
	assume {:sourceloc "buggy_37.sol", 382, 5} {:message ""} true;
	call __send_ret#72 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return51:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 389, 5} {:message "AugustCoin::transferAnyERC20Token"} transferAnyERC20Token#1164(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1146: address_t, tokens#1148: int)
	returns (success#1153: bool)
{
	var transfer#240_ret#75: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#439[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 390, 16} {:message ""} true;
	call transfer#240_ret#75 := transfer#240(tokenAddress#1146, __this, 0, owner#439[__this], tokens#1148);
	success#1153 := transfer#240_ret#75;
	goto $return53;
	$return53:
	// Function body ends here
	$return52:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_37.sol", 392, 1} {:message "AugustCoin::bug_unchk27"} bug_unchk27#1176(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1166: address_t)
{
	var call_arg#76: int;
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#76 := 42000000000000000000;
	assume {:sourceloc "buggy_37.sol", 393, 8} {:message ""} true;
	call __send_ret#77 := __send(addr#1166, __this, 0, call_arg#76);
	$return54:
	// Function body ends here
}

