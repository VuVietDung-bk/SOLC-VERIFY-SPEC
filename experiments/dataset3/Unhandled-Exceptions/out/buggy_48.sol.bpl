// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_48.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 23, 5} {:message "SafeMath::add"} add#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
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
procedure {:inline 1} {:sourceloc "buggy_48.sol", 27, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#25: int, b#27: int)
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
procedure {:inline 1} {:sourceloc "buggy_48.sol", 31, 5} {:message "SafeMath::mul"} mul#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#47: int, b#49: int)
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
procedure {:inline 1} {:sourceloc "buggy_48.sol", 35, 5} {:message "SafeMath::div"} div#95(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
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
procedure {:sourceloc "buggy_48.sol", 22, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_48.sol", 94, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#298(__this: address_t, __msg_sender: address_t, __msg_value: int, from#292: address_t, to#294: address_t, tokens#296: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_48.sol", 101, 3} {:message "[event] ERC20Interface::Approval"} Approval#330(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#324: address_t, spender#326: address_t, tokens#328: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 47, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);
	modifies payedOut_unchk9#104, payedOut_unchk20#209, winner_unchk20#211, winAmount_unchk20#213, payedOut_unchk32#246, winner_unchk32#248, winAmount_unchk32#250, payedOut_unchk45#301;

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_48.sol", 48, 1} {:message "payedOut_unchk9"} payedOut_unchk9#104: [address_t]bool;
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
procedure {:sourceloc "buggy_48.sol", 50, 1} {:message "ERC20Interface::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#125(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#104[__this];
	assume {:sourceloc "buggy_48.sol", 52, 9} {:message ""} true;
	call __send_ret#0 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 54, 5} {:message "ERC20Interface::balanceOf"} balanceOf#132(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#127: address_t)
	returns (balance#130: int);
	modifies payedOut_unchk9#104, payedOut_unchk20#209, winner_unchk20#211, winAmount_unchk20#213, payedOut_unchk32#246, winner_unchk32#248, winAmount_unchk32#250, payedOut_unchk45#301;

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
procedure {:sourceloc "buggy_48.sol", 55, 1} {:message "ERC20Interface::callnotchecked_unchk25"} callnotchecked_unchk25#146(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#134: address_t)
{
	var __call_ret#1: bool;
	var __call_ret#2: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 56, 5} {:message ""} true;
	call __call_ret#1, __call_ret#2 := __call(callee#134, __this, 1000000000000000000);
	if (__call_ret#1) {
	havoc payedOut_unchk9#104;
	havoc payedOut_unchk20#209;
	havoc winner_unchk20#211;
	havoc winAmount_unchk20#213;
	havoc payedOut_unchk32#246;
	havoc winner_unchk32#248;
	havoc winAmount_unchk32#250;
	havoc payedOut_unchk45#301;
	havoc __balance;
	}

	if (!(__call_ret#1)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 58, 5} {:message "ERC20Interface::allowance"} allowance#155(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#148: address_t, spender#150: address_t)
	returns (remaining#153: int);
	modifies payedOut_unchk9#104, payedOut_unchk20#209, winner_unchk20#211, winAmount_unchk20#213, payedOut_unchk32#246, winner_unchk32#248, winAmount_unchk32#250, payedOut_unchk45#301;

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_48.sol", 59, 1} {:message "ERC20Interface::bug_unchk19"} bug_unchk19#176(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 60, 1} {:message "addr_unchk19"} addr_unchk19#159: address_t;
	var call_arg#3: int;
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#159 := 0;
	call_arg#3 := 10000000000000000000;
	assume {:sourceloc "buggy_48.sol", 61, 6} {:message ""} true;
	call __send_ret#4 := __send(addr_unchk19#159, __this, 0, call_arg#3);
	if ((!(__send_ret#4) || (1 == 1))) {
	assume false;
	}

	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 64, 5} {:message "ERC20Interface::transfer"} transfer#185(__this: address_t, __msg_sender: address_t, __msg_value: int, to#178: address_t, tokens#180: int)
	returns (success#183: bool);
	modifies payedOut_unchk9#104, payedOut_unchk20#209, winner_unchk20#211, winAmount_unchk20#213, payedOut_unchk32#246, winner_unchk32#248, winAmount_unchk32#250, payedOut_unchk45#301;

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 65, 1} {:message "ERC20Interface::unhandledsend_unchk26"} unhandledsend_unchk26#197(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#187: address_t)
{
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#5 := 5000000000000000000;
	assume {:sourceloc "buggy_48.sol", 66, 5} {:message ""} true;
	call __send_ret#6 := __send(callee#187, __this, 0, call_arg#5);
	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 68, 5} {:message "ERC20Interface::approve"} approve#206(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#199: address_t, tokens#201: int)
	returns (success#204: bool);
	modifies payedOut_unchk9#104, payedOut_unchk20#209, winner_unchk20#211, winAmount_unchk20#213, payedOut_unchk32#246, winner_unchk32#248, winAmount_unchk32#250, payedOut_unchk45#301;

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_48.sol", 69, 1} {:message "payedOut_unchk20"} payedOut_unchk20#209: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_48.sol", 70, 1} {:message "winner_unchk20"} winner_unchk20#211: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_48.sol", 71, 1} {:message "winAmount_unchk20"} winAmount_unchk20#213: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_48.sol", 73, 1} {:message "ERC20Interface::sendToWinner_unchk20"} sendToWinner_unchk20#232(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#209[__this]);
	assume {:sourceloc "buggy_48.sol", 75, 9} {:message ""} true;
	call __send_ret#7 := __send(winner_unchk20#211[__this], __this, 0, winAmount_unchk20#213[__this]);
	payedOut_unchk20#209 := payedOut_unchk20#209[__this := true];
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 78, 5} {:message "ERC20Interface::transferFrom"} transferFrom#243(__this: address_t, __msg_sender: address_t, __msg_value: int, from#234: address_t, to#236: address_t, tokens#238: int)
	returns (success#241: bool);
	modifies payedOut_unchk9#104, payedOut_unchk20#209, winner_unchk20#211, winAmount_unchk20#213, payedOut_unchk32#246, winner_unchk32#248, winAmount_unchk32#250, payedOut_unchk45#301;

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_48.sol", 79, 1} {:message "payedOut_unchk32"} payedOut_unchk32#246: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_48.sol", 80, 1} {:message "winner_unchk32"} winner_unchk32#248: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_48.sol", 81, 1} {:message "winAmount_unchk32"} winAmount_unchk32#250: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_48.sol", 83, 1} {:message "ERC20Interface::sendToWinner_unchk32"} sendToWinner_unchk32#269(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#246[__this]);
	assume {:sourceloc "buggy_48.sol", 85, 9} {:message ""} true;
	call __send_ret#8 := __send(winner_unchk32#248[__this], __this, 0, winAmount_unchk32#250[__this]);
	payedOut_unchk32#246 := payedOut_unchk32#246[__this := true];
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_48.sol", 89, 3} {:message "ERC20Interface::bug_unchk31"} bug_unchk31#290(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 90, 1} {:message "addr_unchk31"} addr_unchk31#273: address_t;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#273 := 0;
	call_arg#9 := 10000000000000000000;
	assume {:sourceloc "buggy_48.sol", 91, 6} {:message ""} true;
	call __send_ret#10 := __send(addr_unchk31#273, __this, 0, call_arg#9);
	if ((!(__send_ret#10) || (1 == 1))) {
	assume false;
	}

	$return10:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_48.sol", 95, 3} {:message "payedOut_unchk45"} payedOut_unchk45#301: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_48.sol", 97, 1} {:message "ERC20Interface::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#322(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#301[__this];
	assume {:sourceloc "buggy_48.sol", 99, 17} {:message ""} true;
	call __send_ret#11 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 46, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#331(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk9#104 := payedOut_unchk9#104[__this := false];
	payedOut_unchk20#209 := payedOut_unchk20#209[__this := false];
	winner_unchk20#211 := winner_unchk20#211[__this := 0];
	winAmount_unchk20#213 := winAmount_unchk20#213[__this := 0];
	payedOut_unchk32#246 := payedOut_unchk32#246[__this := false];
	winner_unchk32#248 := winner_unchk32#248[__this := 0];
	winAmount_unchk32#250 := winAmount_unchk32#250[__this := 0];
	payedOut_unchk45#301 := payedOut_unchk45#301[__this := false];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_48.sol", 111, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#342(__this: address_t, __msg_sender: address_t, __msg_value: int, from#333: address_t, tokens#335: int, token#337: address_t, data#339: int_arr_ptr);

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 112, 1} {:message "ApproveAndCallFallBack::unhandledsend_unchk38"} unhandledsend_unchk38#354(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#344: address_t)
{
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#12 := 5000000000000000000;
	assume {:sourceloc "buggy_48.sol", 113, 5} {:message ""} true;
	call __send_ret#13 := __send(callee#344, __this, 0, call_arg#12);
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 110, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#355(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_48.sol", 139, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#421(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#417: address_t, _to#419: address_t)
{
	
}

// 
// Function: withdrawBal_unchk41 : function ()
procedure {:sourceloc "buggy_48.sol", 122, 3} {:message "Owned::withdrawBal_unchk41"} withdrawBal_unchk41#372(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 123, 2} {:message "Balances_unchk41"} Balances_unchk41#359: int;
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk41#359 := 0;
	call_arg#14 := Balances_unchk41#359;
	assume {:sourceloc "buggy_48.sol", 124, 5} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, call_arg#14);
	$return13:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_48.sol", 125, 3} {:message "owner"} owner#374: [address_t]address_t;
// 
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_48.sol", 126, 3} {:message "Owned::bug_unchk42"} bug_unchk42#399(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 127, 1} {:message "receivers_unchk42"} receivers_unchk42#378: int;
	var {:sourceloc "buggy_48.sol", 128, 1} {:message "addr_unchk42"} addr_unchk42#381: address_t;
	var call_arg#16: int;
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#378 := 0;
	addr_unchk42#381 := 0;
	call_arg#16 := 42000000000000000000;
	assume {:sourceloc "buggy_48.sol", 129, 6} {:message ""} true;
	call __send_ret#17 := __send(addr_unchk42#381, __this, 0, call_arg#16);
	if (!(__send_ret#17)) {
	receivers_unchk42#378 := (receivers_unchk42#378 + 1);
	}
	else {
	assume false;
	}

	$return14:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_48.sol", 134, 3} {:message "newOwner"} newOwner#401: [address_t]address_t;
// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_48.sol", 136, 3} {:message "Owned::callnotchecked_unchk13"} callnotchecked_unchk13#415(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#403: address_t)
{
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 137, 5} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(callee#403, __this, 1000000000000000000);
	if (__call_ret#18) {
	havoc owner#374;
	havoc newOwner#401;
	havoc __balance;
	}

	if (!(__call_ret#18)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return15:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 141, 5} {:message "Owned::[constructor]"} __constructor#541(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#374 := owner#374[__this := 0];
	newOwner#401 := newOwner#401[__this := 0];
	// Function body starts here
	owner#374 := owner#374[__this := __msg_sender];
	$return16:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_48.sol", 144, 1} {:message "Owned::cash_unchk46"} cash_unchk46#454(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#432: int, subpotIndex#434: int, winner_unchk46#436: address_t)
{
	var {:sourceloc "buggy_48.sol", 145, 9} {:message "subpot_unchk46"} subpot_unchk46#440: int;
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#440 := 3000000000000000000;
	call_arg#20 := subpot_unchk46#440;
	assume {:sourceloc "buggy_48.sol", 146, 9} {:message ""} true;
	call __send_ret#21 := __send(winner_unchk46#436, __this, 0, call_arg#20);
	subpot_unchk46#440 := 0;
	$return17:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_48.sol", 155, 5} {:message "Owned::transferOwnership"} transferOwnership#477(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#467: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#374[__this]);
	// Function body starts here
	newOwner#401 := newOwner#401[__this := _newOwner#467];
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_48.sol", 158, 1} {:message "Owned::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#492(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 159, 4} {:message "addr_unchk4"} addr_unchk4#481: address_t;
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#481 := 0;
	call_arg#24 := 42000000000000000000;
	assume {:sourceloc "buggy_48.sol", 160, 10} {:message ""} true;
	call __send_ret#25 := __send(addr_unchk4#481, __this, 0, call_arg#24);
	if (!(__send_ret#25)) {
	
	}
	else {
	
	}

	$return20:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_48.sol", 167, 5} {:message "Owned::acceptOwnership"} acceptOwnership#519(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#401[__this]);
	assume {:sourceloc "buggy_48.sol", 169, 14} {:message ""} true;
	call OwnershipTransferred#421(__this, __msg_sender, __msg_value, owner#374[__this], newOwner#401[__this]);
	owner#374 := owner#374[__this := newOwner#401[__this]];
	newOwner#401 := newOwner#401[__this := 0];
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_48.sol", 173, 1} {:message "Owned::bug_unchk7"} bug_unchk7#540(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 174, 1} {:message "addr_unchk7"} addr_unchk7#523: address_t;
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#523 := 0;
	call_arg#26 := 10000000000000000000;
	assume {:sourceloc "buggy_48.sol", 175, 6} {:message ""} true;
	call __send_ret#27 := __send(addr_unchk7#523, __this, 0, call_arg#26);
	if ((!(__send_ret#27) || (1 == 1))) {
	assume false;
	}

	$return22:
	// Function body ends here
}

// 
// ------- Contract: QurasToken -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 188, 3} {:message "QurasToken::unhandledsend_unchk2"} unhandledsend_unchk2#560(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#550: address_t)
{
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#28 := 5000000000000000000;
	assume {:sourceloc "buggy_48.sol", 189, 5} {:message ""} true;
	call __send_ret#29 := __send(callee#550, __this, 0, call_arg#28);
	$return23:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_48.sol", 191, 3} {:message "symbol"} symbol#562: [address_t]int_arr_type;
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_48.sol", 192, 3} {:message "QurasToken::bug_unchk43"} bug_unchk43#583(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 193, 1} {:message "addr_unchk43"} addr_unchk43#566: address_t;
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#566 := 0;
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_48.sol", 194, 6} {:message ""} true;
	call __send_ret#31 := __send(addr_unchk43#566, __this, 0, call_arg#30);
	if ((!(__send_ret#31) || (1 == 1))) {
	assume false;
	}

	$return24:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_48.sol", 197, 3} {:message "name"} name#585: [address_t]int_arr_type;
// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 198, 3} {:message "QurasToken::my_func_uncheck48"} my_func_uncheck48#600(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#587: address_t)
{
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_48.sol", 199, 9} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(dst#587, __this, __msg_value);
	if (__call_ret#32) {
	havoc symbol#562;
	havoc name#585;
	havoc decimals#602;
	havoc _totalSupply#621;
	havoc balances#639;
	havoc allowed#657;
	havoc payedOut_unchk8#819;
	havoc winner_unchk8#821;
	havoc winAmount_unchk8#823;
	havoc payedOut_unchk44#1075;
	havoc winner_unchk44#1077;
	havoc winAmount_unchk44#1079;
	havoc payedOut_unchk33#1177;
	havoc owner#374;
	havoc newOwner#401;
	havoc payedOut_unchk9#104;
	havoc payedOut_unchk20#209;
	havoc winner_unchk20#211;
	havoc winAmount_unchk20#213;
	havoc payedOut_unchk32#246;
	havoc winner_unchk32#248;
	havoc winAmount_unchk32#250;
	havoc payedOut_unchk45#301;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return25:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_48.sol", 201, 3} {:message "decimals"} decimals#602: [address_t]int;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_48.sol", 202, 3} {:message "QurasToken::withdrawBal_unchk17"} withdrawBal_unchk17#619(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 203, 2} {:message "Balances_unchk17"} Balances_unchk17#606: int;
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#606 := 0;
	call_arg#34 := Balances_unchk17#606;
	assume {:sourceloc "buggy_48.sol", 204, 5} {:message ""} true;
	call __send_ret#35 := __send(__msg_sender, __this, 0, call_arg#34);
	$return26:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_48.sol", 205, 3} {:message "_totalSupply"} _totalSupply#621: [address_t]int;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 207, 3} {:message "QurasToken::callnotchecked_unchk37"} callnotchecked_unchk37#635(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#623: address_t)
{
	var __call_ret#36: bool;
	var __call_ret#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 208, 5} {:message ""} true;
	call __call_ret#36, __call_ret#37 := __call(callee#623, __this, 1000000000000000000);
	if (__call_ret#36) {
	havoc symbol#562;
	havoc name#585;
	havoc decimals#602;
	havoc _totalSupply#621;
	havoc balances#639;
	havoc allowed#657;
	havoc payedOut_unchk8#819;
	havoc winner_unchk8#821;
	havoc winAmount_unchk8#823;
	havoc payedOut_unchk44#1075;
	havoc winner_unchk44#1077;
	havoc winAmount_unchk44#1079;
	havoc payedOut_unchk33#1177;
	havoc owner#374;
	havoc newOwner#401;
	havoc payedOut_unchk9#104;
	havoc payedOut_unchk20#209;
	havoc winner_unchk20#211;
	havoc winAmount_unchk20#213;
	havoc payedOut_unchk32#246;
	havoc winner_unchk32#248;
	havoc winAmount_unchk32#250;
	havoc payedOut_unchk45#301;
	havoc __balance;
	}

	if (!(__call_ret#36)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return27:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 210, 3} {:message "balances"} balances#639: [address_t][address_t]int;
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 211, 3} {:message "QurasToken::bug_unchk3"} bug_unchk3#651(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#641: address_t)
{
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#38 := 42000000000000000000;
	assume {:sourceloc "buggy_48.sol", 212, 8} {:message ""} true;
	call __send_ret#39 := __send(addr#641, __this, 0, call_arg#38);
	$return28:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_48.sol", 213, 3} {:message "allowed"} allowed#657: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 219, 5} {:message "QurasToken::[constructor]"} __constructor#1231(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	symbol#562 := symbol#562[__this := int_arr#constr(default_int_int(), 0)];
	name#585 := name#585[__this := int_arr#constr(default_int_int(), 0)];
	decimals#602 := decimals#602[__this := 0];
	_totalSupply#621 := _totalSupply#621[__this := 0];
	balances#639 := balances#639[__this := default_address_t_int()];
	allowed#657 := allowed#657[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk8#819 := payedOut_unchk8#819[__this := false];
	winner_unchk8#821 := winner_unchk8#821[__this := 0];
	winAmount_unchk8#823 := winAmount_unchk8#823[__this := 0];
	payedOut_unchk44#1075 := payedOut_unchk44#1075[__this := false];
	winner_unchk44#1077 := winner_unchk44#1077[__this := 0];
	winAmount_unchk44#1079 := winAmount_unchk44#1079[__this := 0];
	payedOut_unchk33#1177 := payedOut_unchk33#1177[__this := false];
	owner#374 := owner#374[__this := 0];
	newOwner#401 := newOwner#401[__this := 0];
	payedOut_unchk9#104 := payedOut_unchk9#104[__this := false];
	payedOut_unchk20#209 := payedOut_unchk20#209[__this := false];
	winner_unchk20#211 := winner_unchk20#211[__this := 0];
	winAmount_unchk20#213 := winAmount_unchk20#213[__this := 0];
	payedOut_unchk32#246 := payedOut_unchk32#246[__this := false];
	winner_unchk32#248 := winner_unchk32#248[__this := 0];
	winAmount_unchk32#250 := winAmount_unchk32#250[__this := 0];
	payedOut_unchk45#301 := payedOut_unchk45#301[__this := false];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#374 := owner#374[__this := __msg_sender];
	$return29:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#562 := symbol#562[__this := int_arr#constr(default_int_int()[0 := 88][1 := 81][2 := 67], 3)];
	name#585 := name#585[__this := int_arr#constr(default_int_int()[0 := 81][1 := 117][2 := 114][3 := 97][4 := 115][5 := 32][6 := 84][7 := 111][8 := 107][9 := 101][10 := 110], 11)];
	decimals#602 := decimals#602[__this := 8];
	_totalSupply#621 := _totalSupply#621[__this := 88888888800000000];
	balances#639 := balances#639[__this := balances#639[__this][owner#374[__this] := _totalSupply#621[__this]]];
	call_arg#41 := 0;
	assume {:sourceloc "buggy_48.sol", 225, 14} {:message ""} true;
	call Transfer#298(__this, __msg_sender, __msg_value, call_arg#41, owner#374[__this], _totalSupply#621[__this]);
	$return30:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 227, 1} {:message "QurasToken::my_func_unchk23"} my_func_unchk23#705(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#694: address_t)
{
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 228, 9} {:message ""} true;
	call __send_ret#42 := __send(dst#694, __this, 0, __msg_value);
	$return31:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 235, 5} {:message "QurasToken::totalSupply"} totalSupply#722(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#709: int)
{
	var sub#45_ret#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 236, 16} {:message ""} true;
	call sub#45_ret#43 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#621[__this], balances#639[__this][0]);
	#709 := sub#45_ret#43;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 238, 1} {:message "QurasToken::unhandledsend_unchk14"} unhandledsend_unchk14#734(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#724: address_t)
{
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#44 := 5000000000000000000;
	assume {:sourceloc "buggy_48.sol", 239, 5} {:message ""} true;
	call __send_ret#45 := __send(callee#724, __this, 0, call_arg#44);
	$return33:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 246, 5} {:message "QurasToken::balanceOf"} balanceOf#747(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#736: address_t)
	returns (balance#740: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#740 := balances#639[__this][tokenOwner#736];
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_48.sol", 249, 1} {:message "QurasToken::bug_unchk30"} bug_unchk30#772(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 250, 1} {:message "receivers_unchk30"} receivers_unchk30#751: int;
	var {:sourceloc "buggy_48.sol", 251, 1} {:message "addr_unchk30"} addr_unchk30#754: address_t;
	var call_arg#46: int;
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#751 := 0;
	addr_unchk30#754 := 0;
	call_arg#46 := 42000000000000000000;
	assume {:sourceloc "buggy_48.sol", 252, 6} {:message ""} true;
	call __send_ret#47 := __send(addr_unchk30#754, __this, 0, call_arg#46);
	if (!(__send_ret#47)) {
	receivers_unchk30#751 := (receivers_unchk30#751 + 1);
	}
	else {
	assume false;
	}

	$return35:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 264, 5} {:message "QurasToken::transfer"} transfer#816(__this: address_t, __msg_sender: address_t, __msg_value: int, to#774: address_t, tokens#776: int)
	returns (success#780: bool)
{
	var sub#45_ret#48: int;
	var add#23_ret#49: int;
	var call_arg#50: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 265, 32} {:message ""} true;
	call sub#45_ret#48 := sub#45(__this, __msg_sender, __msg_value, balances#639[__this][__msg_sender], tokens#776);
	balances#639 := balances#639[__this := balances#639[__this][__msg_sender := sub#45_ret#48]];
	assume {:sourceloc "buggy_48.sol", 266, 24} {:message ""} true;
	call add#23_ret#49 := add#23(__this, __msg_sender, __msg_value, balances#639[__this][to#774], tokens#776);
	balances#639 := balances#639[__this := balances#639[__this][to#774 := add#23_ret#49]];
	call_arg#50 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 267, 14} {:message ""} true;
	call Transfer#298(__this, __msg_sender, __msg_value, call_arg#50, to#774, tokens#776);
	success#780 := true;
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_48.sol", 270, 1} {:message "payedOut_unchk8"} payedOut_unchk8#819: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_48.sol", 271, 1} {:message "winner_unchk8"} winner_unchk8#821: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_48.sol", 272, 1} {:message "winAmount_unchk8"} winAmount_unchk8#823: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_48.sol", 274, 1} {:message "QurasToken::sendToWinner_unchk8"} sendToWinner_unchk8#842(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#819[__this]);
	assume {:sourceloc "buggy_48.sol", 276, 9} {:message ""} true;
	call __send_ret#51 := __send(winner_unchk8#821[__this], __this, 0, winAmount_unchk8#823[__this]);
	payedOut_unchk8#819 := payedOut_unchk8#819[__this := true];
	$return37:
	// Function body ends here
}

// 
// Function: increaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 281, 5} {:message "QurasToken::increaseApproval"} increaseApproval#883(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#844: address_t, _addedValue#846: int)
	returns (#849: bool)
{
	var add#23_ret#52: int;
	var call_arg#53: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 282, 41} {:message ""} true;
	call add#23_ret#52 := add#23(__this, __msg_sender, __msg_value, allowed#657[__this][__msg_sender][_spender#844], _addedValue#846);
	allowed#657 := allowed#657[__this := allowed#657[__this][__msg_sender := allowed#657[__this][__msg_sender][_spender#844 := add#23_ret#52]]];
	call_arg#53 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 283, 14} {:message ""} true;
	call Approval#330(__this, __msg_sender, __msg_value, call_arg#53, _spender#844, allowed#657[__this][__msg_sender][_spender#844]);
	#849 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 286, 1} {:message "QurasToken::bug_unchk39"} bug_unchk39#895(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#885: address_t)
{
	var call_arg#54: int;
	var __send_ret#55: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#54 := 4000000000000000000;
	assume {:sourceloc "buggy_48.sol", 287, 8} {:message ""} true;
	call __send_ret#55 := __send(addr#885, __this, 0, call_arg#54);
	$return39:
	// Function body ends here
}

// 
// Function: decreaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 289, 5} {:message "QurasToken::decreaseApproval"} decreaseApproval#955(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#897: address_t, _subtractedValue#899: int)
	returns (#902: bool)
{
	var {:sourceloc "buggy_48.sol", 290, 9} {:message "oldValue"} oldValue#905: int;
	var sub#45_ret#56: int;
	var call_arg#57: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	oldValue#905 := allowed#657[__this][__msg_sender][_spender#897];
	if ((_subtractedValue#899 > oldValue#905)) {
	allowed#657 := allowed#657[__this := allowed#657[__this][__msg_sender := allowed#657[__this][__msg_sender][_spender#897 := 0]]];
	}
	else {
	assume {:sourceloc "buggy_48.sol", 294, 45} {:message ""} true;
	call sub#45_ret#56 := sub#45(__this, __msg_sender, __msg_value, oldValue#905, _subtractedValue#899);
	allowed#657 := allowed#657[__this := allowed#657[__this][__msg_sender := allowed#657[__this][__msg_sender][_spender#897 := sub#45_ret#56]]];
	}

	call_arg#57 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 296, 14} {:message ""} true;
	call Approval#330(__this, __msg_sender, __msg_value, call_arg#57, _spender#897, allowed#657[__this][__msg_sender][_spender#897]);
	#902 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 299, 1} {:message "QurasToken::my_func_uncheck36"} my_func_uncheck36#970(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#957: address_t)
{
	var __call_ret#58: bool;
	var __call_ret#59: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_48.sol", 300, 9} {:message ""} true;
	call __call_ret#58, __call_ret#59 := __call(dst#957, __this, __msg_value);
	if (__call_ret#58) {
	havoc symbol#562;
	havoc name#585;
	havoc decimals#602;
	havoc _totalSupply#621;
	havoc balances#639;
	havoc allowed#657;
	havoc payedOut_unchk8#819;
	havoc winner_unchk8#821;
	havoc winAmount_unchk8#823;
	havoc payedOut_unchk44#1075;
	havoc winner_unchk44#1077;
	havoc winAmount_unchk44#1079;
	havoc payedOut_unchk33#1177;
	havoc owner#374;
	havoc newOwner#401;
	havoc payedOut_unchk9#104;
	havoc payedOut_unchk20#209;
	havoc winner_unchk20#211;
	havoc winAmount_unchk20#213;
	havoc payedOut_unchk32#246;
	havoc winner_unchk32#248;
	havoc winAmount_unchk32#250;
	havoc payedOut_unchk45#301;
	havoc __balance;
	}

	if (!(__call_ret#58)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return41:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 312, 5} {:message "QurasToken::approve"} approve#999(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#972: address_t, tokens#974: int)
	returns (success#978: bool)
{
	var call_arg#60: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#657 := allowed#657[__this := allowed#657[__this][__msg_sender := allowed#657[__this][__msg_sender][spender#972 := tokens#974]]];
	call_arg#60 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 314, 14} {:message ""} true;
	call Approval#330(__this, __msg_sender, __msg_value, call_arg#60, spender#972, tokens#974);
	success#978 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 317, 1} {:message "QurasToken::my_func_unchk35"} my_func_unchk35#1012(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1001: address_t)
{
	var __send_ret#61: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 318, 9} {:message ""} true;
	call __send_ret#61 := __send(dst#1001, __this, 0, __msg_value);
	$return43:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 331, 5} {:message "QurasToken::transferFrom"} transferFrom#1072(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1014: address_t, to#1016: address_t, tokens#1018: int)
	returns (success#1022: bool)
{
	var sub#45_ret#62: int;
	var sub#45_ret#63: int;
	var add#23_ret#64: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 332, 26} {:message ""} true;
	call sub#45_ret#62 := sub#45(__this, __msg_sender, __msg_value, balances#639[__this][from#1014], tokens#1018);
	balances#639 := balances#639[__this := balances#639[__this][from#1014 := sub#45_ret#62]];
	assume {:sourceloc "buggy_48.sol", 333, 37} {:message ""} true;
	call sub#45_ret#63 := sub#45(__this, __msg_sender, __msg_value, allowed#657[__this][from#1014][__msg_sender], tokens#1018);
	allowed#657 := allowed#657[__this := allowed#657[__this][from#1014 := allowed#657[__this][from#1014][__msg_sender := sub#45_ret#63]]];
	assume {:sourceloc "buggy_48.sol", 334, 24} {:message ""} true;
	call add#23_ret#64 := add#23(__this, __msg_sender, __msg_value, balances#639[__this][to#1016], tokens#1018);
	balances#639 := balances#639[__this := balances#639[__this][to#1016 := add#23_ret#64]];
	assume {:sourceloc "buggy_48.sol", 335, 14} {:message ""} true;
	call Transfer#298(__this, __msg_sender, __msg_value, from#1014, to#1016, tokens#1018);
	success#1022 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_48.sol", 338, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1075: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_48.sol", 339, 1} {:message "winner_unchk44"} winner_unchk44#1077: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_48.sol", 340, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1079: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_48.sol", 342, 1} {:message "QurasToken::sendToWinner_unchk44"} sendToWinner_unchk44#1098(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#65: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1075[__this]);
	assume {:sourceloc "buggy_48.sol", 344, 9} {:message ""} true;
	call __send_ret#65 := __send(winner_unchk44#1077[__this], __this, 0, winAmount_unchk44#1079[__this]);
	payedOut_unchk44#1075 := payedOut_unchk44#1075[__this := true];
	$return45:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 353, 5} {:message "QurasToken::allowance"} allowance#1115(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1100: address_t, spender#1102: address_t)
	returns (remaining#1106: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1106 := allowed#657[__this][tokenOwner#1100][spender#1102];
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_48.sol", 356, 1} {:message "QurasToken::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1130(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 357, 4} {:message "addr_unchk40"} addr_unchk40#1119: address_t;
	var call_arg#66: int;
	var __send_ret#67: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1119 := 0;
	call_arg#66 := 2000000000000000000;
	assume {:sourceloc "buggy_48.sol", 358, 10} {:message ""} true;
	call __send_ret#67 := __send(addr_unchk40#1119, __this, 0, call_arg#66);
	if (!(__send_ret#67)) {
	
	}
	else {
	
	}

	$return47:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_48.sol", 372, 5} {:message "QurasToken::approveAndCall"} approveAndCall#1174(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1132: address_t, tokens#1134: int, data#1136: int_arr_ptr)
	returns (success#1139: bool)
{
	var call_arg#68: address_t;
	var call_arg#69: address_t;
	// TCC assumptions
	assume (data#1136 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#657 := allowed#657[__this := allowed#657[__this][__msg_sender := allowed#657[__this][__msg_sender][spender#1132 := tokens#1134]]];
	call_arg#68 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 374, 14} {:message ""} true;
	call Approval#330(__this, __msg_sender, __msg_value, call_arg#68, spender#1132, tokens#1134);
	call_arg#69 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 375, 9} {:message ""} true;
	call receiveApproval#342(spender#1132, __this, 0, call_arg#69, tokens#1134, __this, data#1136);
	success#1139 := true;
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_48.sol", 378, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1177: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_48.sol", 380, 1} {:message "QurasToken::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1198(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#70: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1177[__this];
	assume {:sourceloc "buggy_48.sol", 382, 5} {:message ""} true;
	call __send_ret#70 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return49:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 389, 5} {:message "QurasToken::transferAnyERC20Token"} transferAnyERC20Token#1218(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1200: address_t, tokens#1202: int)
	returns (success#1207: bool)
{
	var transfer#185_ret#73: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#374[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 390, 16} {:message ""} true;
	call transfer#185_ret#73 := transfer#185(tokenAddress#1200, __this, 0, owner#374[__this], tokens#1202);
	success#1207 := transfer#185_ret#73;
	goto $return51;
	$return51:
	// Function body ends here
	$return50:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_48.sol", 392, 1} {:message "QurasToken::bug_unchk27"} bug_unchk27#1230(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1220: address_t)
{
	var call_arg#74: int;
	var __send_ret#75: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#74 := 42000000000000000000;
	assume {:sourceloc "buggy_48.sol", 393, 8} {:message ""} true;
	call __send_ret#75 := __send(addr#1220, __this, 0, call_arg#74);
	$return52:
	// Function body ends here
}

