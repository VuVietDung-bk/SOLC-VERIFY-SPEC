// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_11.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 9, 5} {:message "SafeMath::add"} add#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
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

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 13, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#25: int, b#27: int)
	returns (c#30: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#27 <= a#25);
	c#30 := (a#25 - b#27);
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 17, 5} {:message "SafeMath::mul"} mul#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#47: int, b#49: int)
	returns (c#52: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#52 := (a#47 * b#49);
	assume ((a#47 == 0) || ((c#52 div a#47) == b#49));
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 21, 5} {:message "SafeMath::div"} div#95(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
	returns (c#80: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#77 > 0);
	c#80 := (a#75 div b#77);
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 8, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_11.sol", 72, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#286(__this: address_t, __msg_sender: address_t, __msg_value: int, from#280: address_t, to#282: address_t, tokens#284: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_11.sol", 79, 3} {:message "[event] ERC20Interface::Approval"} Approval#318(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#312: address_t, spender#314: address_t, tokens#316: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 28, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);
	modifies payedOut_unchk20#176, winner_unchk20#178, winAmount_unchk20#180, payedOut_unchk32#211, winner_unchk32#213, winAmount_unchk32#215, payedOut_unchk45#289;

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
procedure {:sourceloc "buggy_11.sol", 29, 1} {:message "ERC20Interface::callnotchecked_unchk25"} callnotchecked_unchk25#115(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#103: address_t)
{
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_11.sol", 30, 5} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(callee#103, __this, 1000000000000000000);
	if (__call_ret#0) {
	havoc payedOut_unchk20#176;
	havoc winner_unchk20#178;
	havoc winAmount_unchk20#180;
	havoc payedOut_unchk32#211;
	havoc winner_unchk32#213;
	havoc winAmount_unchk32#215;
	havoc payedOut_unchk45#289;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 32, 5} {:message "ERC20Interface::balanceOf"} balanceOf#122(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#117: address_t)
	returns (balance#120: int);
	modifies payedOut_unchk20#176, winner_unchk20#178, winAmount_unchk20#180, payedOut_unchk32#211, winner_unchk32#213, winAmount_unchk32#215, payedOut_unchk45#289;

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
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_11.sol", 33, 1} {:message "ERC20Interface::bug_unchk19"} bug_unchk19#143(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 34, 1} {:message "addr_unchk19"} addr_unchk19#126: address_t;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#126 := 0;
	call_arg#2 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 35, 6} {:message ""} true;
	call __send_ret#3 := __send(addr_unchk19#126, __this, 0, call_arg#2);
	if ((!(__send_ret#3) || (1 == 1))) {
	assume false;
	}

	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 38, 5} {:message "ERC20Interface::allowance"} allowance#152(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#145: address_t, spender#147: address_t)
	returns (remaining#150: int);
	modifies payedOut_unchk20#176, winner_unchk20#178, winAmount_unchk20#180, payedOut_unchk32#211, winner_unchk32#213, winAmount_unchk32#215, payedOut_unchk45#289;

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 39, 1} {:message "ERC20Interface::unhandledsend_unchk26"} unhandledsend_unchk26#164(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#154: address_t)
{
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#4 := 5000000000000000000;
	assume {:sourceloc "buggy_11.sol", 40, 5} {:message ""} true;
	call __send_ret#5 := __send(callee#154, __this, 0, call_arg#4);
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 42, 5} {:message "ERC20Interface::transfer"} transfer#173(__this: address_t, __msg_sender: address_t, __msg_value: int, to#166: address_t, tokens#168: int)
	returns (success#171: bool);
	modifies payedOut_unchk20#176, winner_unchk20#178, winAmount_unchk20#180, payedOut_unchk32#211, winner_unchk32#213, winAmount_unchk32#215, payedOut_unchk45#289;

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_11.sol", 43, 1} {:message "payedOut_unchk20"} payedOut_unchk20#176: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_11.sol", 44, 1} {:message "winner_unchk20"} winner_unchk20#178: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_11.sol", 45, 1} {:message "winAmount_unchk20"} winAmount_unchk20#180: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_11.sol", 47, 1} {:message "ERC20Interface::sendToWinner_unchk20"} sendToWinner_unchk20#199(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#176[__this]);
	assume {:sourceloc "buggy_11.sol", 49, 9} {:message ""} true;
	call __send_ret#6 := __send(winner_unchk20#178[__this], __this, 0, winAmount_unchk20#180[__this]);
	payedOut_unchk20#176 := payedOut_unchk20#176[__this := true];
	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 52, 5} {:message "ERC20Interface::approve"} approve#208(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#201: address_t, tokens#203: int)
	returns (success#206: bool);
	modifies payedOut_unchk20#176, winner_unchk20#178, winAmount_unchk20#180, payedOut_unchk32#211, winner_unchk32#213, winAmount_unchk32#215, payedOut_unchk45#289;

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_11.sol", 53, 1} {:message "payedOut_unchk32"} payedOut_unchk32#211: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_11.sol", 54, 1} {:message "winner_unchk32"} winner_unchk32#213: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_11.sol", 55, 1} {:message "winAmount_unchk32"} winAmount_unchk32#215: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_11.sol", 57, 1} {:message "ERC20Interface::sendToWinner_unchk32"} sendToWinner_unchk32#234(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#211[__this]);
	assume {:sourceloc "buggy_11.sol", 59, 9} {:message ""} true;
	call __send_ret#7 := __send(winner_unchk32#213[__this], __this, 0, winAmount_unchk32#215[__this]);
	payedOut_unchk32#211 := payedOut_unchk32#211[__this := true];
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 62, 5} {:message "ERC20Interface::transferFrom"} transferFrom#245(__this: address_t, __msg_sender: address_t, __msg_value: int, from#236: address_t, to#238: address_t, tokens#240: int)
	returns (success#243: bool);
	modifies payedOut_unchk20#176, winner_unchk20#178, winAmount_unchk20#180, payedOut_unchk32#211, winner_unchk32#213, winAmount_unchk32#215, payedOut_unchk45#289;

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 63, 1} {:message "ERC20Interface::unhandledsend_unchk38"} unhandledsend_unchk38#257(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#247: address_t)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#8 := 5000000000000000000;
	assume {:sourceloc "buggy_11.sol", 64, 5} {:message ""} true;
	call __send_ret#9 := __send(callee#247, __this, 0, call_arg#8);
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_11.sol", 67, 3} {:message "ERC20Interface::bug_unchk31"} bug_unchk31#278(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 68, 1} {:message "addr_unchk31"} addr_unchk31#261: address_t;
	var call_arg#10: int;
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#261 := 0;
	call_arg#10 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 69, 6} {:message ""} true;
	call __send_ret#11 := __send(addr_unchk31#261, __this, 0, call_arg#10);
	if ((!(__send_ret#11) || (1 == 1))) {
	assume false;
	}

	$return10:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_11.sol", 73, 3} {:message "payedOut_unchk45"} payedOut_unchk45#289: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_11.sol", 75, 1} {:message "ERC20Interface::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#310(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#289[__this];
	assume {:sourceloc "buggy_11.sol", 77, 5} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 27, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#319(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk20#176 := payedOut_unchk20#176[__this := false];
	winner_unchk20#178 := winner_unchk20#178[__this := 0];
	winAmount_unchk20#180 := winAmount_unchk20#180[__this := 0];
	payedOut_unchk32#211 := payedOut_unchk32#211[__this := false];
	winner_unchk32#213 := winner_unchk32#213[__this := 0];
	winAmount_unchk32#215 := winAmount_unchk32#215[__this := 0];
	payedOut_unchk45#289 := payedOut_unchk45#289[__this := false];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_11.sol", 84, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#330(__this: address_t, __msg_sender: address_t, __msg_value: int, from#321: address_t, tokens#323: int, token#325: address_t, data#327: int_arr_ptr);

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_11.sol", 85, 1} {:message "ApproveAndCallFallBack::cash_unchk46"} cash_unchk46#354(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#332: int, subpotIndex#334: int, winner_unchk46#336: address_t)
{
	var {:sourceloc "buggy_11.sol", 86, 9} {:message "subpot_unchk46"} subpot_unchk46#340: int;
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#340 := 3000000000000000000;
	call_arg#13 := subpot_unchk46#340;
	assume {:sourceloc "buggy_11.sol", 87, 9} {:message ""} true;
	call __send_ret#14 := __send(winner_unchk46#336, __this, 0, call_arg#13);
	subpot_unchk46#340 := 0;
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 83, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#355(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_11.sol", 111, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#416(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#412: address_t, _to#414: address_t)
{
	
}

// 
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_11.sol", 94, 3} {:message "Owned::bug_unchk42"} bug_unchk42#380(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 95, 1} {:message "receivers_unchk42"} receivers_unchk42#359: int;
	var {:sourceloc "buggy_11.sol", 96, 1} {:message "addr_unchk42"} addr_unchk42#362: address_t;
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#359 := 0;
	addr_unchk42#362 := 0;
	call_arg#15 := 42000000000000000000;
	assume {:sourceloc "buggy_11.sol", 97, 6} {:message ""} true;
	call __send_ret#16 := __send(addr_unchk42#362, __this, 0, call_arg#15);
	if (!(__send_ret#16)) {
	receivers_unchk42#359 := (receivers_unchk42#359 + 1);
	}
	else {
	assume false;
	}

	$return13:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_11.sol", 102, 3} {:message "owner"} owner#382: [address_t]address_t;
// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 103, 3} {:message "Owned::unhandledsend_unchk2"} unhandledsend_unchk2#394(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#384: address_t)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := 5000000000000000000;
	assume {:sourceloc "buggy_11.sol", 104, 5} {:message ""} true;
	call __send_ret#18 := __send(callee#384, __this, 0, call_arg#17);
	$return14:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_11.sol", 106, 3} {:message "newOwner"} newOwner#396: [address_t]address_t;
// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_11.sol", 108, 5} {:message "Owned::callnotchecked_unchk13"} callnotchecked_unchk13#410(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#398: address_t)
{
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_11.sol", 109, 9} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(callee#398, __this, 1000000000000000000);
	if (__call_ret#19) {
	havoc owner#382;
	havoc newOwner#396;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return15:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 113, 5} {:message "Owned::[constructor]"} __constructor#525(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#382 := owner#382[__this := 0];
	newOwner#396 := newOwner#396[__this := 0];
	// Function body starts here
	owner#382 := owner#382[__this := __msg_sender];
	$return16:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_11.sol", 116, 1} {:message "Owned::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#440(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 117, 4} {:message "addr_unchk4"} addr_unchk4#429: address_t;
	var call_arg#21: int;
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#429 := 0;
	call_arg#21 := 42000000000000000000;
	assume {:sourceloc "buggy_11.sol", 118, 10} {:message ""} true;
	call __send_ret#22 := __send(addr_unchk4#429, __this, 0, call_arg#21);
	if (!(__send_ret#22)) {
	
	}
	else {
	
	}

	$return17:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_11.sol", 131, 5} {:message "Owned::transferOwnership"} transferOwnership#463(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#453: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#382[__this]);
	// Function body starts here
	newOwner#396 := newOwner#396[__this := _newOwner#453];
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_11.sol", 134, 1} {:message "Owned::bug_unchk7"} bug_unchk7#484(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 135, 1} {:message "addr_unchk7"} addr_unchk7#467: address_t;
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#467 := 0;
	call_arg#25 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 136, 6} {:message ""} true;
	call __send_ret#26 := __send(addr_unchk7#467, __this, 0, call_arg#25);
	if ((!(__send_ret#26) || (1 == 1))) {
	assume false;
	}

	$return20:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_11.sol", 139, 5} {:message "Owned::acceptOwnership"} acceptOwnership#511(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#396[__this]);
	assume {:sourceloc "buggy_11.sol", 141, 14} {:message ""} true;
	call OwnershipTransferred#416(__this, __msg_sender, __msg_value, owner#382[__this], newOwner#396[__this]);
	owner#382 := owner#382[__this := newOwner#396[__this]];
	newOwner#396 := newOwner#396[__this := 0];
	$return21:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 145, 1} {:message "Owned::my_func_unchk23"} my_func_unchk23#524(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#513: address_t)
{
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 146, 9} {:message ""} true;
	call __send_ret#27 := __send(dst#513, __this, 0, __msg_value);
	$return22:
	// Function body ends here
}

// 
// ------- Contract: ForTheBlockchain -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_11.sol", 154, 3} {:message "ForTheBlockchain::bug_unchk43"} bug_unchk43#553(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 155, 1} {:message "addr_unchk43"} addr_unchk43#536: address_t;
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#536 := 0;
	call_arg#28 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 156, 6} {:message ""} true;
	call __send_ret#29 := __send(addr_unchk43#536, __this, 0, call_arg#28);
	if ((!(__send_ret#29) || (1 == 1))) {
	assume false;
	}

	$return23:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_11.sol", 159, 3} {:message "symbol"} symbol#555: [address_t]int_arr_type;
// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 160, 3} {:message "ForTheBlockchain::my_func_uncheck48"} my_func_uncheck48#570(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#557: address_t)
{
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_11.sol", 161, 7} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(dst#557, __this, __msg_value);
	if (__call_ret#30) {
	havoc symbol#555;
	havoc decimals#572;
	havoc name#591;
	havoc _totalSupply#607;
	havoc balances#623;
	havoc payedOut_unchk9#626;
	havoc allowed#653;
	havoc payedOut_unchk8#760;
	havoc winner_unchk8#762;
	havoc winAmount_unchk8#764;
	havoc payedOut_unchk44#976;
	havoc winner_unchk44#978;
	havoc winAmount_unchk44#980;
	havoc payedOut_unchk33#1075;
	havoc owner#382;
	havoc newOwner#396;
	havoc payedOut_unchk20#176;
	havoc winner_unchk20#178;
	havoc winAmount_unchk20#180;
	havoc payedOut_unchk32#211;
	havoc winner_unchk32#213;
	havoc winAmount_unchk32#215;
	havoc payedOut_unchk45#289;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return24:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_11.sol", 163, 3} {:message "decimals"} decimals#572: [address_t]int;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_11.sol", 164, 3} {:message "ForTheBlockchain::withdrawBal_unchk17"} withdrawBal_unchk17#589(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 165, 2} {:message "Balances_unchk17"} Balances_unchk17#576: int;
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#576 := 0;
	call_arg#32 := Balances_unchk17#576;
	assume {:sourceloc "buggy_11.sol", 166, 5} {:message ""} true;
	call __send_ret#33 := __send(__msg_sender, __this, 0, call_arg#32);
	$return25:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_11.sol", 167, 3} {:message "name"} name#591: [address_t]int_arr_type;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 168, 3} {:message "ForTheBlockchain::callnotchecked_unchk37"} callnotchecked_unchk37#605(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#593: address_t)
{
	var __call_ret#34: bool;
	var __call_ret#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_11.sol", 169, 9} {:message ""} true;
	call __call_ret#34, __call_ret#35 := __call(callee#593, __this, 1000000000000000000);
	if (__call_ret#34) {
	havoc symbol#555;
	havoc decimals#572;
	havoc name#591;
	havoc _totalSupply#607;
	havoc balances#623;
	havoc payedOut_unchk9#626;
	havoc allowed#653;
	havoc payedOut_unchk8#760;
	havoc winner_unchk8#762;
	havoc winAmount_unchk8#764;
	havoc payedOut_unchk44#976;
	havoc winner_unchk44#978;
	havoc winAmount_unchk44#980;
	havoc payedOut_unchk33#1075;
	havoc owner#382;
	havoc newOwner#396;
	havoc payedOut_unchk20#176;
	havoc winner_unchk20#178;
	havoc winAmount_unchk20#180;
	havoc payedOut_unchk32#211;
	havoc winner_unchk32#213;
	havoc winAmount_unchk32#215;
	havoc payedOut_unchk45#289;
	havoc __balance;
	}

	if (!(__call_ret#34)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return26:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_11.sol", 171, 3} {:message "_totalSupply"} _totalSupply#607: [address_t]int;
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 174, 3} {:message "ForTheBlockchain::bug_unchk3"} bug_unchk3#619(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#609: address_t)
{
	var call_arg#36: int;
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#36 := 42000000000000000000;
	assume {:sourceloc "buggy_11.sol", 175, 8} {:message ""} true;
	call __send_ret#37 := __send(addr#609, __this, 0, call_arg#36);
	$return27:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 176, 3} {:message "balances"} balances#623: [address_t][address_t]int;
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_11.sol", 177, 3} {:message "payedOut_unchk9"} payedOut_unchk9#626: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_11.sol", 179, 1} {:message "ForTheBlockchain::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#647(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#626[__this];
	assume {:sourceloc "buggy_11.sol", 181, 5} {:message ""} true;
	call __send_ret#38 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return28:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_11.sol", 183, 3} {:message "allowed"} allowed#653: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 189, 5} {:message "ForTheBlockchain::[constructor]"} __constructor#1129(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	symbol#555 := symbol#555[__this := int_arr#constr(default_int_int(), 0)];
	decimals#572 := decimals#572[__this := 0];
	name#591 := name#591[__this := int_arr#constr(default_int_int(), 0)];
	_totalSupply#607 := _totalSupply#607[__this := 0];
	balances#623 := balances#623[__this := default_address_t_int()];
	payedOut_unchk9#626 := payedOut_unchk9#626[__this := false];
	allowed#653 := allowed#653[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk8#760 := payedOut_unchk8#760[__this := false];
	winner_unchk8#762 := winner_unchk8#762[__this := 0];
	winAmount_unchk8#764 := winAmount_unchk8#764[__this := 0];
	payedOut_unchk44#976 := payedOut_unchk44#976[__this := false];
	winner_unchk44#978 := winner_unchk44#978[__this := 0];
	winAmount_unchk44#980 := winAmount_unchk44#980[__this := 0];
	payedOut_unchk33#1075 := payedOut_unchk33#1075[__this := false];
	owner#382 := owner#382[__this := 0];
	newOwner#396 := newOwner#396[__this := 0];
	payedOut_unchk20#176 := payedOut_unchk20#176[__this := false];
	winner_unchk20#178 := winner_unchk20#178[__this := 0];
	winAmount_unchk20#180 := winAmount_unchk20#180[__this := 0];
	payedOut_unchk32#211 := payedOut_unchk32#211[__this := false];
	winner_unchk32#213 := winner_unchk32#213[__this := 0];
	winAmount_unchk32#215 := winAmount_unchk32#215[__this := 0];
	payedOut_unchk45#289 := payedOut_unchk45#289[__this := false];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#382 := owner#382[__this := __msg_sender];
	$return29:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#555 := symbol#555[__this := int_arr#constr(default_int_int()[0 := 70][1 := 84][2 := 66], 3)];
	name#591 := name#591[__this := int_arr#constr(default_int_int()[0 := 70][1 := 111][2 := 114][3 := 84][4 := 104][5 := 101][6 := 66][7 := 108][8 := 111][9 := 99][10 := 107][11 := 99][12 := 104][13 := 97][14 := 105][15 := 110], 16)];
	decimals#572 := decimals#572[__this := 8];
	_totalSupply#607 := _totalSupply#607[__this := 10000000000000000];
	balances#623 := balances#623[__this := balances#623[__this][owner#382[__this] := _totalSupply#607[__this]]];
	call_arg#40 := 0;
	assume {:sourceloc "buggy_11.sol", 195, 14} {:message ""} true;
	call Transfer#286(__this, __msg_sender, __msg_value, call_arg#40, owner#382[__this], _totalSupply#607[__this]);
	$return30:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 198, 1} {:message "ForTheBlockchain::unhandledsend_unchk14"} unhandledsend_unchk14#702(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#692: address_t)
{
	var call_arg#41: int;
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#41 := 5000000000000000000;
	assume {:sourceloc "buggy_11.sol", 199, 5} {:message ""} true;
	call __send_ret#42 := __send(callee#692, __this, 0, call_arg#41);
	$return31:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 206, 5} {:message "ForTheBlockchain::totalSupply"} totalSupply#719(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#706: int)
{
	var sub#45_ret#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 207, 16} {:message ""} true;
	call sub#45_ret#43 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#607[__this], balances#623[__this][0]);
	#706 := sub#45_ret#43;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_11.sol", 209, 1} {:message "ForTheBlockchain::bug_unchk30"} bug_unchk30#744(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 210, 1} {:message "receivers_unchk30"} receivers_unchk30#723: int;
	var {:sourceloc "buggy_11.sol", 211, 1} {:message "addr_unchk30"} addr_unchk30#726: address_t;
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#723 := 0;
	addr_unchk30#726 := 0;
	call_arg#44 := 42000000000000000000;
	assume {:sourceloc "buggy_11.sol", 212, 6} {:message ""} true;
	call __send_ret#45 := __send(addr_unchk30#726, __this, 0, call_arg#44);
	if (!(__send_ret#45)) {
	receivers_unchk30#723 := (receivers_unchk30#723 + 1);
	}
	else {
	assume false;
	}

	$return33:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 222, 5} {:message "ForTheBlockchain::balanceOf"} balanceOf#757(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#746: address_t)
	returns (balance#750: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#750 := balances#623[__this][tokenOwner#746];
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_11.sol", 225, 1} {:message "payedOut_unchk8"} payedOut_unchk8#760: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_11.sol", 226, 1} {:message "winner_unchk8"} winner_unchk8#762: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_11.sol", 227, 1} {:message "winAmount_unchk8"} winAmount_unchk8#764: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_11.sol", 229, 1} {:message "ForTheBlockchain::sendToWinner_unchk8"} sendToWinner_unchk8#783(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#760[__this]);
	assume {:sourceloc "buggy_11.sol", 231, 9} {:message ""} true;
	call __send_ret#46 := __send(winner_unchk8#762[__this], __this, 0, winAmount_unchk8#764[__this]);
	payedOut_unchk8#760 := payedOut_unchk8#760[__this := true];
	$return35:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 241, 5} {:message "ForTheBlockchain::transfer"} transfer#827(__this: address_t, __msg_sender: address_t, __msg_value: int, to#785: address_t, tokens#787: int)
	returns (success#791: bool)
{
	var sub#45_ret#47: int;
	var add#23_ret#48: int;
	var call_arg#49: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 242, 32} {:message ""} true;
	call sub#45_ret#47 := sub#45(__this, __msg_sender, __msg_value, balances#623[__this][__msg_sender], tokens#787);
	balances#623 := balances#623[__this := balances#623[__this][__msg_sender := sub#45_ret#47]];
	assume {:sourceloc "buggy_11.sol", 243, 24} {:message ""} true;
	call add#23_ret#48 := add#23(__this, __msg_sender, __msg_value, balances#623[__this][to#785], tokens#787);
	balances#623 := balances#623[__this := balances#623[__this][to#785 := add#23_ret#48]];
	call_arg#49 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 244, 14} {:message ""} true;
	call Transfer#286(__this, __msg_sender, __msg_value, call_arg#49, to#785, tokens#787);
	success#791 := true;
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 247, 1} {:message "ForTheBlockchain::bug_unchk39"} bug_unchk39#839(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#829: address_t)
{
	var call_arg#50: int;
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#50 := 4000000000000000000;
	assume {:sourceloc "buggy_11.sol", 248, 8} {:message ""} true;
	call __send_ret#51 := __send(addr#829, __this, 0, call_arg#50);
	$return37:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 259, 5} {:message "ForTheBlockchain::approve"} approve#868(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#841: address_t, tokens#843: int)
	returns (success#847: bool)
{
	var call_arg#52: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#653 := allowed#653[__this := allowed#653[__this][__msg_sender := allowed#653[__this][__msg_sender][spender#841 := tokens#843]]];
	call_arg#52 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 261, 14} {:message ""} true;
	call Approval#318(__this, __msg_sender, __msg_value, call_arg#52, spender#841, tokens#843);
	success#847 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 264, 1} {:message "ForTheBlockchain::my_func_uncheck36"} my_func_uncheck36#883(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#870: address_t)
{
	var __call_ret#53: bool;
	var __call_ret#54: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_11.sol", 265, 5} {:message ""} true;
	call __call_ret#53, __call_ret#54 := __call(dst#870, __this, __msg_value);
	if (__call_ret#53) {
	havoc symbol#555;
	havoc decimals#572;
	havoc name#591;
	havoc _totalSupply#607;
	havoc balances#623;
	havoc payedOut_unchk9#626;
	havoc allowed#653;
	havoc payedOut_unchk8#760;
	havoc winner_unchk8#762;
	havoc winAmount_unchk8#764;
	havoc payedOut_unchk44#976;
	havoc winner_unchk44#978;
	havoc winAmount_unchk44#980;
	havoc payedOut_unchk33#1075;
	havoc owner#382;
	havoc newOwner#396;
	havoc payedOut_unchk20#176;
	havoc winner_unchk20#178;
	havoc winAmount_unchk20#180;
	havoc payedOut_unchk32#211;
	havoc winner_unchk32#213;
	havoc winAmount_unchk32#215;
	havoc payedOut_unchk45#289;
	havoc __balance;
	}

	if (!(__call_ret#53)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return39:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 278, 5} {:message "ForTheBlockchain::transferFrom"} transferFrom#943(__this: address_t, __msg_sender: address_t, __msg_value: int, from#885: address_t, to#887: address_t, tokens#889: int)
	returns (success#893: bool)
{
	var sub#45_ret#55: int;
	var sub#45_ret#56: int;
	var add#23_ret#57: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 279, 26} {:message ""} true;
	call sub#45_ret#55 := sub#45(__this, __msg_sender, __msg_value, balances#623[__this][from#885], tokens#889);
	balances#623 := balances#623[__this := balances#623[__this][from#885 := sub#45_ret#55]];
	assume {:sourceloc "buggy_11.sol", 280, 37} {:message ""} true;
	call sub#45_ret#56 := sub#45(__this, __msg_sender, __msg_value, allowed#653[__this][from#885][__msg_sender], tokens#889);
	allowed#653 := allowed#653[__this := allowed#653[__this][from#885 := allowed#653[__this][from#885][__msg_sender := sub#45_ret#56]]];
	assume {:sourceloc "buggy_11.sol", 281, 24} {:message ""} true;
	call add#23_ret#57 := add#23(__this, __msg_sender, __msg_value, balances#623[__this][to#887], tokens#889);
	balances#623 := balances#623[__this := balances#623[__this][to#887 := add#23_ret#57]];
	assume {:sourceloc "buggy_11.sol", 282, 14} {:message ""} true;
	call Transfer#286(__this, __msg_sender, __msg_value, from#885, to#887, tokens#889);
	success#893 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 285, 1} {:message "ForTheBlockchain::my_func_unchk35"} my_func_unchk35#956(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#945: address_t)
{
	var __send_ret#58: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 286, 9} {:message ""} true;
	call __send_ret#58 := __send(dst#945, __this, 0, __msg_value);
	$return41:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 294, 5} {:message "ForTheBlockchain::allowance"} allowance#973(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#958: address_t, spender#960: address_t)
	returns (remaining#964: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#964 := allowed#653[__this][tokenOwner#958][spender#960];
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_11.sol", 297, 1} {:message "payedOut_unchk44"} payedOut_unchk44#976: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_11.sol", 298, 1} {:message "winner_unchk44"} winner_unchk44#978: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_11.sol", 299, 1} {:message "winAmount_unchk44"} winAmount_unchk44#980: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_11.sol", 301, 1} {:message "ForTheBlockchain::sendToWinner_unchk44"} sendToWinner_unchk44#999(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#59: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#976[__this]);
	assume {:sourceloc "buggy_11.sol", 303, 9} {:message ""} true;
	call __send_ret#59 := __send(winner_unchk44#978[__this], __this, 0, winAmount_unchk44#980[__this]);
	payedOut_unchk44#976 := payedOut_unchk44#976[__this := true];
	$return43:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_11.sol", 313, 5} {:message "ForTheBlockchain::approveAndCall"} approveAndCall#1043(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1001: address_t, tokens#1003: int, data#1005: int_arr_ptr)
	returns (success#1008: bool)
{
	var call_arg#60: address_t;
	var call_arg#61: address_t;
	var call_arg#62: address_t;
	// TCC assumptions
	assume (data#1005 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#653 := allowed#653[__this := allowed#653[__this][__msg_sender := allowed#653[__this][__msg_sender][spender#1001 := tokens#1003]]];
	call_arg#60 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 315, 14} {:message ""} true;
	call Approval#318(__this, __msg_sender, __msg_value, call_arg#60, spender#1001, tokens#1003);
	call_arg#61 := __msg_sender;
	call_arg#62 := __this;
	assume {:sourceloc "buggy_11.sol", 316, 9} {:message ""} true;
	call receiveApproval#330(spender#1001, __this, 0, call_arg#61, tokens#1003, call_arg#62, data#1005);
	success#1008 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_11.sol", 319, 1} {:message "ForTheBlockchain::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1058(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 320, 4} {:message "addr_unchk40"} addr_unchk40#1047: address_t;
	var call_arg#63: int;
	var __send_ret#64: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1047 := 0;
	call_arg#63 := 2000000000000000000;
	assume {:sourceloc "buggy_11.sol", 321, 10} {:message ""} true;
	call __send_ret#64 := __send(addr_unchk40#1047, __this, 0, call_arg#63);
	if (!(__send_ret#64)) {
	
	}
	else {
	
	}

	$return45:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 333, 5} {:message "ForTheBlockchain::[fallback]"} #1065(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return46:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 336, 5} {:message "ForTheBlockchain::[receive]"} #1072(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return47:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_11.sol", 339, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1075: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_11.sol", 341, 1} {:message "ForTheBlockchain::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1096(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#65: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1075[__this];
	assume {:sourceloc "buggy_11.sol", 343, 5} {:message ""} true;
	call __send_ret#65 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return48:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 350, 5} {:message "ForTheBlockchain::transferAnyERC20Token"} transferAnyERC20Token#1116(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1098: address_t, tokens#1100: int)
	returns (success#1105: bool)
{
	var transfer#173_ret#68: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#382[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 351, 16} {:message ""} true;
	call transfer#173_ret#68 := transfer#173(tokenAddress#1098, __this, 0, owner#382[__this], tokens#1100);
	success#1105 := transfer#173_ret#68;
	goto $return50;
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_11.sol", 353, 1} {:message "ForTheBlockchain::bug_unchk27"} bug_unchk27#1128(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1118: address_t)
{
	var call_arg#69: int;
	var __send_ret#70: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#69 := 42000000000000000000;
	assume {:sourceloc "buggy_11.sol", 354, 8} {:message ""} true;
	call __send_ret#70 := __send(addr#1118, __this, 0, call_arg#69);
	$return51:
	// Function body ends here
}

