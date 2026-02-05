// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_47.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_47.sol", 56, 5} {:message "[event] ERC20Interface::Transfer"} Transfer#182(__this: address_t, __msg_sender: address_t, __msg_value: int, from#176: address_t, to#178: address_t, tokens#180: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_47.sol", 57, 5} {:message "[event] ERC20Interface::Approval"} Approval#190(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#184: address_t, spender#186: address_t, tokens#188: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 12, 3} {:message "ERC20Interface::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);
	modifies payedOut_unchk9#9, payedOut_unchk20#114, winner_unchk20#116, winAmount_unchk20#118, payedOut_unchk32#151, winner_unchk32#153, winAmount_unchk32#155;

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_47.sol", 13, 1} {:message "payedOut_unchk9"} payedOut_unchk9#9: [address_t]bool;
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
procedure {:sourceloc "buggy_47.sol", 15, 1} {:message "ERC20Interface::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#30(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#9[__this];
	assume {:sourceloc "buggy_47.sol", 17, 5} {:message ""} true;
	call __send_ret#0 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return0:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 19, 3} {:message "ERC20Interface::balanceOf"} balanceOf#37(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#32: address_t)
	returns (balance#35: int);
	modifies payedOut_unchk9#9, payedOut_unchk20#114, winner_unchk20#116, winAmount_unchk20#118, payedOut_unchk32#151, winner_unchk32#153, winAmount_unchk32#155;

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
procedure {:sourceloc "buggy_47.sol", 20, 1} {:message "ERC20Interface::callnotchecked_unchk25"} callnotchecked_unchk25#51(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#39: address_t)
{
	var __call_ret#1: bool;
	var __call_ret#2: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 21, 3} {:message ""} true;
	call __call_ret#1, __call_ret#2 := __call(callee#39, __this, 1000000000000000000);
	if (__call_ret#1) {
	havoc payedOut_unchk9#9;
	havoc payedOut_unchk20#114;
	havoc winner_unchk20#116;
	havoc winAmount_unchk20#118;
	havoc payedOut_unchk32#151;
	havoc winner_unchk32#153;
	havoc winAmount_unchk32#155;
	havoc __balance;
	}

	if (!(__call_ret#1)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return1:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 23, 3} {:message "ERC20Interface::transfer"} transfer#60(__this: address_t, __msg_sender: address_t, __msg_value: int, to#53: address_t, tokens#55: int)
	returns (success#58: bool);
	modifies payedOut_unchk9#9, payedOut_unchk20#114, winner_unchk20#116, winAmount_unchk20#118, payedOut_unchk32#151, winner_unchk32#153, winAmount_unchk32#155;

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_47.sol", 24, 1} {:message "ERC20Interface::bug_unchk19"} bug_unchk19#81(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 25, 1} {:message "addr_unchk19"} addr_unchk19#64: address_t;
	var call_arg#3: int;
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#64 := 0;
	call_arg#3 := 10000000000000000000;
	assume {:sourceloc "buggy_47.sol", 26, 6} {:message ""} true;
	call __send_ret#4 := __send(addr_unchk19#64, __this, 0, call_arg#3);
	if ((!(__send_ret#4) || (1 == 1))) {
	assume false;
	}

	$return2:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 31, 3} {:message "ERC20Interface::allowance"} allowance#90(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#83: address_t, spender#85: address_t)
	returns (remaining#88: int);
	modifies payedOut_unchk9#9, payedOut_unchk20#114, winner_unchk20#116, winAmount_unchk20#118, payedOut_unchk32#151, winner_unchk32#153, winAmount_unchk32#155;

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 32, 1} {:message "ERC20Interface::unhandledsend_unchk26"} unhandledsend_unchk26#102(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#92: address_t)
{
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#5 := 5000000000000000000;
	assume {:sourceloc "buggy_47.sol", 33, 5} {:message ""} true;
	call __send_ret#6 := __send(callee#92, __this, 0, call_arg#5);
	$return3:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 35, 3} {:message "ERC20Interface::approve"} approve#111(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#104: address_t, tokens#106: int)
	returns (success#109: bool);
	modifies payedOut_unchk9#9, payedOut_unchk20#114, winner_unchk20#116, winAmount_unchk20#118, payedOut_unchk32#151, winner_unchk32#153, winAmount_unchk32#155;

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_47.sol", 36, 1} {:message "payedOut_unchk20"} payedOut_unchk20#114: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_47.sol", 37, 1} {:message "winner_unchk20"} winner_unchk20#116: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_47.sol", 38, 1} {:message "winAmount_unchk20"} winAmount_unchk20#118: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_47.sol", 40, 1} {:message "ERC20Interface::sendToWinner_unchk20"} sendToWinner_unchk20#137(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#114[__this]);
	assume {:sourceloc "buggy_47.sol", 42, 9} {:message ""} true;
	call __send_ret#7 := __send(winner_unchk20#116[__this], __this, 0, winAmount_unchk20#118[__this]);
	payedOut_unchk20#114 := payedOut_unchk20#114[__this := true];
	$return4:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 45, 7} {:message "ERC20Interface::transferFrom"} transferFrom#148(__this: address_t, __msg_sender: address_t, __msg_value: int, from#139: address_t, to#141: address_t, tokens#143: int)
	returns (success#146: bool);
	modifies payedOut_unchk9#9, payedOut_unchk20#114, winner_unchk20#116, winAmount_unchk20#118, payedOut_unchk32#151, winner_unchk32#153, winAmount_unchk32#155;

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_47.sol", 46, 1} {:message "payedOut_unchk32"} payedOut_unchk32#151: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_47.sol", 47, 1} {:message "winner_unchk32"} winner_unchk32#153: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_47.sol", 48, 1} {:message "winAmount_unchk32"} winAmount_unchk32#155: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_47.sol", 50, 1} {:message "ERC20Interface::sendToWinner_unchk32"} sendToWinner_unchk32#174(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#151[__this]);
	assume {:sourceloc "buggy_47.sol", 52, 9} {:message ""} true;
	call __send_ret#8 := __send(winner_unchk32#153[__this], __this, 0, winAmount_unchk32#155[__this]);
	payedOut_unchk32#151 := payedOut_unchk32#151[__this := true];
	$return5:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_47.sol", 11, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#191(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk9#9 := payedOut_unchk9#9[__this := false];
	payedOut_unchk20#114 := payedOut_unchk20#114[__this := false];
	winner_unchk20#116 := winner_unchk20#116[__this := 0];
	winAmount_unchk20#118 := winAmount_unchk20#118[__this := 0];
	payedOut_unchk32#151 := payedOut_unchk32#151[__this := false];
	winner_unchk32#153 := winner_unchk32#153[__this := 0];
	winAmount_unchk32#155 := winAmount_unchk32#155[__this := 0];
}

// 
// ------- Contract: AcunarToken -------
// Inherits from: ERC20Interface
// 
// Function: cash_unchk34 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_47.sol", 61, 3} {:message "AcunarToken::cash_unchk34"} cash_unchk34#217(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#195: int, subpotIndex#197: int, winner_unchk34#199: address_t)
{
	var {:sourceloc "buggy_47.sol", 62, 9} {:message "subpot_unchk34"} subpot_unchk34#203: int;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk34#203 := 10000000000000000000;
	call_arg#9 := subpot_unchk34#203;
	assume {:sourceloc "buggy_47.sol", 63, 9} {:message ""} true;
	call __send_ret#10 := __send(winner_unchk34#199, __this, 0, call_arg#9);
	subpot_unchk34#203 := 0;
	$return6:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_47.sol", 66, 3} {:message "name"} name#220: [address_t]int_arr_type;
// 
// State variable: payedOut_unchk21: bool
var {:sourceloc "buggy_47.sol", 67, 3} {:message "payedOut_unchk21"} payedOut_unchk21#223: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk21 : function ()
procedure {:sourceloc "buggy_47.sol", 69, 1} {:message "AcunarToken::withdrawLeftOver_unchk21"} withdrawLeftOver_unchk21#244(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk21#223[__this];
	assume {:sourceloc "buggy_47.sol", 71, 3} {:message ""} true;
	call __send_ret#11 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return7:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_47.sol", 73, 3} {:message "symbol"} symbol#247: [address_t]int_arr_type;
// 
// Function: cash_unchk10 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_47.sol", 74, 3} {:message "AcunarToken::cash_unchk10"} cash_unchk10#271(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#249: int, subpotIndex#251: int, winner_unchk10#253: address_t)
{
	var {:sourceloc "buggy_47.sol", 75, 9} {:message "subpot_unchk10"} subpot_unchk10#257: int;
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk10#257 := 10000000000000000000;
	call_arg#12 := subpot_unchk10#257;
	assume {:sourceloc "buggy_47.sol", 76, 9} {:message ""} true;
	call __send_ret#13 := __send(winner_unchk10#253, __this, 0, call_arg#12);
	subpot_unchk10#257 := 0;
	$return8:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_47.sol", 79, 3} {:message "decimals"} decimals#274: [address_t]int;
// 
// Function: my_func_unchk47 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 81, 3} {:message "AcunarToken::my_func_unchk47"} my_func_unchk47#287(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#276: address_t)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 82, 9} {:message ""} true;
	call __send_ret#14 := __send(dst#276, __this, 0, __msg_value);
	$return9:
	// Function body ends here
}

// 
// State variable: supply: uint256
var {:sourceloc "buggy_47.sol", 84, 3} {:message "supply"} supply#289: [address_t]int;
// 
// Function: cash_unchk22 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_47.sol", 85, 3} {:message "AcunarToken::cash_unchk22"} cash_unchk22#313(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#291: int, subpotIndex#293: int, winner_unchk22#295: address_t)
{
	var {:sourceloc "buggy_47.sol", 86, 9} {:message "subpot_unchk22"} subpot_unchk22#299: int;
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk22#299 := 10000000000000000000;
	call_arg#15 := subpot_unchk22#299;
	assume {:sourceloc "buggy_47.sol", 87, 9} {:message ""} true;
	call __send_ret#16 := __send(winner_unchk22#295, __this, 0, call_arg#15);
	subpot_unchk22#299 := 0;
	$return10:
	// Function body ends here
}

// 
// State variable: founder: address
var {:sourceloc "buggy_47.sol", 90, 3} {:message "founder"} founder#315: [address_t]address_t;
// 
// Function: my_func_uncheck12 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 92, 3} {:message "AcunarToken::my_func_uncheck12"} my_func_uncheck12#330(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#317: address_t)
{
	var __call_ret#17: bool;
	var __call_ret#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_47.sol", 93, 7} {:message ""} true;
	call __call_ret#17, __call_ret#18 := __call(dst#317, __this, __msg_value);
	if (__call_ret#17) {
	havoc name#220;
	havoc payedOut_unchk21#223;
	havoc symbol#247;
	havoc decimals#274;
	havoc supply#289;
	havoc founder#315;
	havoc balances#334;
	havoc allowed#353;
	havoc payedOut_unchk9#9;
	havoc payedOut_unchk20#114;
	havoc winner_unchk20#116;
	havoc winAmount_unchk20#118;
	havoc payedOut_unchk32#151;
	havoc winner_unchk32#153;
	havoc winAmount_unchk32#155;
	havoc __balance;
	}

	if (!(__call_ret#17)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return11:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 95, 3} {:message "balances"} balances#334: [address_t][address_t]int;
// 
// Function: my_func_unchk11 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 97, 3} {:message "AcunarToken::my_func_unchk11"} my_func_unchk11#347(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#336: address_t)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 98, 9} {:message ""} true;
	call __send_ret#19 := __send(dst#336, __this, 0, __msg_value);
	$return12:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_47.sol", 100, 3} {:message "allowed"} allowed#353: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 105, 5} {:message "AcunarToken::[constructor]"} __constructor#677(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#220 := name#220[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	payedOut_unchk21#223 := payedOut_unchk21#223[__this := false];
	symbol#247 := symbol#247[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	decimals#274 := decimals#274[__this := 0];
	supply#289 := supply#289[__this := 0];
	founder#315 := founder#315[__this := 0];
	balances#334 := balances#334[__this := default_address_t_int()];
	allowed#353 := allowed#353[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk9#9 := payedOut_unchk9#9[__this := false];
	payedOut_unchk20#114 := payedOut_unchk20#114[__this := false];
	winner_unchk20#116 := winner_unchk20#116[__this := 0];
	winAmount_unchk20#118 := winAmount_unchk20#118[__this := 0];
	payedOut_unchk32#151 := payedOut_unchk32#151[__this := false];
	winner_unchk32#153 := winner_unchk32#153[__this := 0];
	winAmount_unchk32#155 := winAmount_unchk32#155[__this := 0];
	// Function body starts here
	supply#289 := supply#289[__this := 200000000];
	founder#315 := founder#315[__this := __msg_sender];
	balances#334 := balances#334[__this := balances#334[__this][founder#315[__this] := supply#289[__this]]];
	$return13:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 110, 1} {:message "AcunarToken::unhandledsend_unchk38"} unhandledsend_unchk38#384(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#374: address_t)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#20 := 5000000000000000000;
	assume {:sourceloc "buggy_47.sol", 111, 5} {:message ""} true;
	call __send_ret#21 := __send(callee#374, __this, 0, call_arg#20);
	$return14:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 115, 5} {:message "AcunarToken::allowance"} allowance#401(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#386: address_t, spender#388: address_t)
	returns (#392: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#392 := allowed#353[__this][tokenOwner#386][spender#388];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_47.sol", 118, 1} {:message "AcunarToken::cash_unchk46"} cash_unchk46#425(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#403: int, subpotIndex#405: int, winner_unchk46#407: address_t)
{
	var {:sourceloc "buggy_47.sol", 119, 9} {:message "subpot_unchk46"} subpot_unchk46#411: int;
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#411 := 3000000000000000000;
	call_arg#22 := subpot_unchk46#411;
	assume {:sourceloc "buggy_47.sol", 120, 9} {:message ""} true;
	call __send_ret#23 := __send(winner_unchk46#407, __this, 0, call_arg#22);
	subpot_unchk46#411 := 0;
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 126, 5} {:message "AcunarToken::approve"} approve#469(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#427: address_t, tokens#429: int)
	returns (#433: bool)
{
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#334[__this][__msg_sender] >= tokens#429);
	assume (tokens#429 > 0);
	allowed#353 := allowed#353[__this := allowed#353[__this][__msg_sender := allowed#353[__this][__msg_sender][spender#427 := tokens#429]]];
	call_arg#24 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 131, 14} {:message ""} true;
	call Approval#190(__this, __msg_sender, __msg_value, call_arg#24, spender#427, tokens#429);
	#433 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_47.sol", 134, 1} {:message "AcunarToken::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#484(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 135, 4} {:message "addr_unchk4"} addr_unchk4#473: address_t;
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#473 := 0;
	call_arg#25 := 42000000000000000000;
	assume {:sourceloc "buggy_47.sol", 136, 10} {:message ""} true;
	call __send_ret#26 := __send(addr_unchk4#473, __this, 0, call_arg#25);
	if (!(__send_ret#26)) {
	
	}
	else {
	
	}

	$return18:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 145, 5} {:message "AcunarToken::transferFrom"} transferFrom#537(__this: address_t, __msg_sender: address_t, __msg_value: int, from#486: address_t, to#488: address_t, tokens#490: int)
	returns (#494: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#353[__this][from#486][to#488] >= tokens#490);
	assume (balances#334[__this][from#486] >= tokens#490);
	balances#334 := balances#334[__this := balances#334[__this][from#486 := (balances#334[__this][from#486] - tokens#490)]];
	balances#334 := balances#334[__this := balances#334[__this][to#488 := (balances#334[__this][to#488] + tokens#490)]];
	allowed#353 := allowed#353[__this := allowed#353[__this][from#486 := allowed#353[__this][from#486][to#488 := (allowed#353[__this][from#486][to#488] - tokens#490)]]];
	#494 := true;
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_47.sol", 157, 1} {:message "AcunarToken::bug_unchk7"} bug_unchk7#558(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 158, 1} {:message "addr_unchk7"} addr_unchk7#541: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#541 := 0;
	call_arg#27 := 10000000000000000000;
	assume {:sourceloc "buggy_47.sol", 159, 6} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk7#541, __this, 0, call_arg#27);
	if ((!(__send_ret#28) || (1 == 1))) {
	assume false;
	}

	$return20:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 163, 5} {:message "AcunarToken::totalSupply"} totalSupply#567(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#562: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#562 := supply#289[__this];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 166, 1} {:message "AcunarToken::my_func_unchk23"} my_func_unchk23#580(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#569: address_t)
{
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 167, 9} {:message ""} true;
	call __send_ret#29 := __send(dst#569, __this, 0, __msg_value);
	$return22:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 170, 5} {:message "AcunarToken::balanceOf"} balanceOf#593(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#582: address_t)
	returns (balance#586: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#586 := balances#334[__this][tokenOwner#582];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 173, 1} {:message "AcunarToken::unhandledsend_unchk14"} unhandledsend_unchk14#605(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#595: address_t)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#30 := 5000000000000000000;
	assume {:sourceloc "buggy_47.sol", 174, 5} {:message ""} true;
	call __send_ret#31 := __send(callee#595, __this, 0, call_arg#30);
	$return24:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 178, 5} {:message "AcunarToken::transfer"} transfer#651(__this: address_t, __msg_sender: address_t, __msg_value: int, to#607: address_t, tokens#609: int)
	returns (success#613: bool)
{
	var call_arg#32: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((balances#334[__this][__msg_sender] >= tokens#609) && (tokens#609 > 0));
	balances#334 := balances#334[__this := balances#334[__this][to#607 := (balances#334[__this][to#607] + tokens#609)]];
	balances#334 := balances#334[__this := balances#334[__this][__msg_sender := (balances#334[__this][__msg_sender] - tokens#609)]];
	call_arg#32 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 183, 15} {:message ""} true;
	call Transfer#182(__this, __msg_sender, __msg_value, call_arg#32, to#607, tokens#609);
	success#613 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_47.sol", 186, 1} {:message "AcunarToken::bug_unchk30"} bug_unchk30#676(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 187, 1} {:message "receivers_unchk30"} receivers_unchk30#655: int;
	var {:sourceloc "buggy_47.sol", 188, 1} {:message "addr_unchk30"} addr_unchk30#658: address_t;
	var call_arg#33: int;
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#655 := 0;
	addr_unchk30#658 := 0;
	call_arg#33 := 42000000000000000000;
	assume {:sourceloc "buggy_47.sol", 189, 6} {:message ""} true;
	call __send_ret#34 := __send(addr_unchk30#658, __this, 0, call_arg#33);
	if (!(__send_ret#34)) {
	receivers_unchk30#655 := (receivers_unchk30#655 + 1);
	}
	else {
	assume false;
	}

	$return26:
	// Function body ends here
}

// 
// ------- Contract: AcunarIEO -------
// Inherits from: AcunarToken
// 
// Event: Invest
procedure {:inline 1} {:sourceloc "buggy_47.sol", 265, 3} {:message "[event] AcunarIEO::Invest"} Invest#901(__this: address_t, __msg_sender: address_t, __msg_value: int, investor#895: address_t, value#897: int, tokens#899: int)
{
	
}

// 
// Function: callnotchecked_unchk1 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 198, 3} {:message "AcunarIEO::callnotchecked_unchk1"} callnotchecked_unchk1#693(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#681: address_t)
{
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 2000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 2000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 199, 5} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(callee#681, __this, 2000000000000000000);
	if (__call_ret#35) {
	havoc admin#695;
	havoc deposit#714;
	havoc tokenPrice#742;
	havoc hardCap#757;
	havoc raisedAmount#780;
	havoc saleStart#799;
	havoc saleEnd#805;
	havoc coinTradeStart#810;
	havoc maxInvestment#830;
	havoc minInvestment#847;
	havoc ieoState#866;
	havoc payedOut_unchk8#924;
	havoc winner_unchk8#926;
	havoc winAmount_unchk8#928;
	havoc payedOut_unchk44#1066;
	havoc winner_unchk44#1068;
	havoc winAmount_unchk44#1070;
	havoc payedOut_unchk33#1195;
	havoc payedOut_unchk45#1327;
	havoc name#220;
	havoc payedOut_unchk21#223;
	havoc symbol#247;
	havoc decimals#274;
	havoc supply#289;
	havoc founder#315;
	havoc balances#334;
	havoc allowed#353;
	havoc payedOut_unchk9#9;
	havoc payedOut_unchk20#114;
	havoc winner_unchk20#116;
	havoc winAmount_unchk20#118;
	havoc payedOut_unchk32#151;
	havoc winner_unchk32#153;
	havoc winAmount_unchk32#155;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + 2000000000000000000)];
	}

	$return27:
	// Function body ends here
}

// 
// State variable: admin: address
var {:sourceloc "buggy_47.sol", 201, 3} {:message "admin"} admin#695: [address_t]address_t;
// 
// Function: withdrawBal_unchk41 : function ()
procedure {:sourceloc "buggy_47.sol", 206, 3} {:message "AcunarIEO::withdrawBal_unchk41"} withdrawBal_unchk41#712(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 207, 2} {:message "Balances_unchk41"} Balances_unchk41#699: int;
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk41#699 := 0;
	call_arg#37 := Balances_unchk41#699;
	assume {:sourceloc "buggy_47.sol", 208, 3} {:message ""} true;
	call __send_ret#38 := __send(__msg_sender, __this, 0, call_arg#37);
	$return28:
	// Function body ends here
}

// 
// State variable: deposit: address payable
var {:sourceloc "buggy_47.sol", 209, 3} {:message "deposit"} deposit#714: [address_t]address_t;
// 
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_47.sol", 212, 3} {:message "AcunarIEO::bug_unchk42"} bug_unchk42#739(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 213, 1} {:message "receivers_unchk42"} receivers_unchk42#718: int;
	var {:sourceloc "buggy_47.sol", 214, 1} {:message "addr_unchk42"} addr_unchk42#721: address_t;
	var call_arg#39: int;
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#718 := 0;
	addr_unchk42#721 := 0;
	call_arg#39 := 42000000000000000000;
	assume {:sourceloc "buggy_47.sol", 215, 6} {:message ""} true;
	call __send_ret#40 := __send(addr_unchk42#721, __this, 0, call_arg#39);
	if (!(__send_ret#40)) {
	receivers_unchk42#718 := (receivers_unchk42#718 + 1);
	}
	else {
	assume false;
	}

	$return29:
	// Function body ends here
}

// 
// State variable: tokenPrice: uint256
var {:sourceloc "buggy_47.sol", 220, 3} {:message "tokenPrice"} tokenPrice#742: [address_t]int;
// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 223, 3} {:message "AcunarIEO::unhandledsend_unchk2"} unhandledsend_unchk2#754(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#744: address_t)
{
	var call_arg#41: int;
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#41 := 5000000000000000000;
	assume {:sourceloc "buggy_47.sol", 224, 5} {:message ""} true;
	call __send_ret#42 := __send(callee#744, __this, 0, call_arg#41);
	$return30:
	// Function body ends here
}

// 
// State variable: hardCap: uint256
var {:sourceloc "buggy_47.sol", 226, 3} {:message "hardCap"} hardCap#757: [address_t]int;
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_47.sol", 228, 3} {:message "AcunarIEO::bug_unchk43"} bug_unchk43#778(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 229, 1} {:message "addr_unchk43"} addr_unchk43#761: address_t;
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#761 := 0;
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_47.sol", 230, 6} {:message ""} true;
	call __send_ret#44 := __send(addr_unchk43#761, __this, 0, call_arg#43);
	if ((!(__send_ret#44) || (1 == 1))) {
	assume false;
	}

	$return31:
	// Function body ends here
}

// 
// State variable: raisedAmount: uint256
var {:sourceloc "buggy_47.sol", 233, 3} {:message "raisedAmount"} raisedAmount#780: [address_t]int;
// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 235, 3} {:message "AcunarIEO::my_func_uncheck48"} my_func_uncheck48#795(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#782: address_t)
{
	var __call_ret#45: bool;
	var __call_ret#46: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_47.sol", 236, 9} {:message ""} true;
	call __call_ret#45, __call_ret#46 := __call(dst#782, __this, __msg_value);
	if (__call_ret#45) {
	havoc admin#695;
	havoc deposit#714;
	havoc tokenPrice#742;
	havoc hardCap#757;
	havoc raisedAmount#780;
	havoc saleStart#799;
	havoc saleEnd#805;
	havoc coinTradeStart#810;
	havoc maxInvestment#830;
	havoc minInvestment#847;
	havoc ieoState#866;
	havoc payedOut_unchk8#924;
	havoc winner_unchk8#926;
	havoc winAmount_unchk8#928;
	havoc payedOut_unchk44#1066;
	havoc winner_unchk44#1068;
	havoc winAmount_unchk44#1070;
	havoc payedOut_unchk33#1195;
	havoc payedOut_unchk45#1327;
	havoc name#220;
	havoc payedOut_unchk21#223;
	havoc symbol#247;
	havoc decimals#274;
	havoc supply#289;
	havoc founder#315;
	havoc balances#334;
	havoc allowed#353;
	havoc payedOut_unchk9#9;
	havoc payedOut_unchk20#114;
	havoc winner_unchk20#116;
	havoc winAmount_unchk20#118;
	havoc payedOut_unchk32#151;
	havoc winner_unchk32#153;
	havoc winAmount_unchk32#155;
	havoc __balance;
	}

	if (!(__call_ret#45)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return32:
	// Function body ends here
}

// 
// State variable: saleStart: uint256
var {:sourceloc "buggy_47.sol", 238, 3} {:message "saleStart"} saleStart#799: [address_t]int;
// 
// State variable: saleEnd: uint256
var {:sourceloc "buggy_47.sol", 239, 5} {:message "saleEnd"} saleEnd#805: [address_t]int;
// 
// State variable: coinTradeStart: uint256
var {:sourceloc "buggy_47.sol", 240, 5} {:message "coinTradeStart"} coinTradeStart#810: [address_t]int;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_47.sol", 242, 3} {:message "AcunarIEO::withdrawBal_unchk17"} withdrawBal_unchk17#827(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 243, 2} {:message "Balances_unchk17"} Balances_unchk17#814: int;
	var call_arg#47: int;
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#814 := 0;
	call_arg#47 := Balances_unchk17#814;
	assume {:sourceloc "buggy_47.sol", 244, 3} {:message ""} true;
	call __send_ret#48 := __send(__msg_sender, __this, 0, call_arg#47);
	$return33:
	// Function body ends here
}

// 
// State variable: maxInvestment: uint256
var {:sourceloc "buggy_47.sol", 245, 3} {:message "maxInvestment"} maxInvestment#830: [address_t]int;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 246, 3} {:message "AcunarIEO::callnotchecked_unchk37"} callnotchecked_unchk37#844(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#832: address_t)
{
	var __call_ret#49: bool;
	var __call_ret#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 247, 5} {:message ""} true;
	call __call_ret#49, __call_ret#50 := __call(callee#832, __this, 1000000000000000000);
	if (__call_ret#49) {
	havoc admin#695;
	havoc deposit#714;
	havoc tokenPrice#742;
	havoc hardCap#757;
	havoc raisedAmount#780;
	havoc saleStart#799;
	havoc saleEnd#805;
	havoc coinTradeStart#810;
	havoc maxInvestment#830;
	havoc minInvestment#847;
	havoc ieoState#866;
	havoc payedOut_unchk8#924;
	havoc winner_unchk8#926;
	havoc winAmount_unchk8#928;
	havoc payedOut_unchk44#1066;
	havoc winner_unchk44#1068;
	havoc winAmount_unchk44#1070;
	havoc payedOut_unchk33#1195;
	havoc payedOut_unchk45#1327;
	havoc name#220;
	havoc payedOut_unchk21#223;
	havoc symbol#247;
	havoc decimals#274;
	havoc supply#289;
	havoc founder#315;
	havoc balances#334;
	havoc allowed#353;
	havoc payedOut_unchk9#9;
	havoc payedOut_unchk20#114;
	havoc winner_unchk20#116;
	havoc winAmount_unchk20#118;
	havoc payedOut_unchk32#151;
	havoc winner_unchk32#153;
	havoc winAmount_unchk32#155;
	havoc __balance;
	}

	if (!(__call_ret#49)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return34:
	// Function body ends here
}

// 
// State variable: minInvestment: uint256
var {:sourceloc "buggy_47.sol", 249, 3} {:message "minInvestment"} minInvestment#847: [address_t]int;
// Enum definition State mapped to int
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 252, 3} {:message "AcunarIEO::bug_unchk3"} bug_unchk3#864(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#854: address_t)
{
	var call_arg#51: int;
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#51 := 42000000000000000000;
	assume {:sourceloc "buggy_47.sol", 253, 8} {:message ""} true;
	call __send_ret#52 := __send(addr#854, __this, 0, call_arg#51);
	$return35:
	// Function body ends here
}

// 
// State variable: ieoState: enum AcunarIEO.State
var {:sourceloc "buggy_47.sol", 254, 3} {:message "ieoState"} ieoState#866: [address_t]int;
// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_47.sol", 262, 3} {:message "AcunarIEO::callnotchecked_unchk13"} callnotchecked_unchk13#893(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#879: address_t)
{
	var __call_ret#53: bool;
	var __call_ret#54: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 263, 5} {:message ""} true;
	call __call_ret#53, __call_ret#54 := __call(callee#879, __this, 1000000000000000000);
	if (__call_ret#53) {
	havoc admin#695;
	havoc deposit#714;
	havoc tokenPrice#742;
	havoc hardCap#757;
	havoc raisedAmount#780;
	havoc saleStart#799;
	havoc saleEnd#805;
	havoc coinTradeStart#810;
	havoc maxInvestment#830;
	havoc minInvestment#847;
	havoc ieoState#866;
	havoc payedOut_unchk8#924;
	havoc winner_unchk8#926;
	havoc winAmount_unchk8#928;
	havoc payedOut_unchk44#1066;
	havoc winner_unchk44#1068;
	havoc winAmount_unchk44#1070;
	havoc payedOut_unchk33#1195;
	havoc payedOut_unchk45#1327;
	havoc name#220;
	havoc payedOut_unchk21#223;
	havoc symbol#247;
	havoc decimals#274;
	havoc supply#289;
	havoc founder#315;
	havoc balances#334;
	havoc allowed#353;
	havoc payedOut_unchk9#9;
	havoc payedOut_unchk20#114;
	havoc winner_unchk20#116;
	havoc winAmount_unchk20#118;
	havoc payedOut_unchk32#151;
	havoc winner_unchk32#153;
	havoc winAmount_unchk32#155;
	havoc __balance;
	}

	if (!(__call_ret#53)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return36:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 269, 5} {:message "AcunarIEO::[constructor]"} __constructor#1349(__this: address_t, __msg_sender: address_t, __msg_value: int, _deposit#903: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	admin#695 := admin#695[__this := 0];
	deposit#714 := deposit#714[__this := 0];
	tokenPrice#742 := tokenPrice#742[__this := 100000000000000];
	hardCap#757 := hardCap#757[__this := 21000000000000000000000];
	raisedAmount#780 := raisedAmount#780[__this := 0];
	saleStart#799 := saleStart#799[__this := __block_timestamp];
	saleEnd#805 := saleEnd#805[__this := (__block_timestamp + 14515200)];
	coinTradeStart#810 := coinTradeStart#810[__this := (saleEnd#805[__this] + 15120000)];
	maxInvestment#830 := maxInvestment#830[__this := 30000000000000000000];
	minInvestment#847 := minInvestment#847[__this := 100000000000000000];
	ieoState#866 := ieoState#866[__this := 0];
	payedOut_unchk8#924 := payedOut_unchk8#924[__this := false];
	winner_unchk8#926 := winner_unchk8#926[__this := 0];
	winAmount_unchk8#928 := winAmount_unchk8#928[__this := 0];
	payedOut_unchk44#1066 := payedOut_unchk44#1066[__this := false];
	winner_unchk44#1068 := winner_unchk44#1068[__this := 0];
	winAmount_unchk44#1070 := winAmount_unchk44#1070[__this := 0];
	payedOut_unchk33#1195 := payedOut_unchk33#1195[__this := false];
	payedOut_unchk45#1327 := payedOut_unchk45#1327[__this := false];
	name#220 := name#220[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	payedOut_unchk21#223 := payedOut_unchk21#223[__this := false];
	symbol#247 := symbol#247[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	decimals#274 := decimals#274[__this := 0];
	supply#289 := supply#289[__this := 0];
	founder#315 := founder#315[__this := 0];
	balances#334 := balances#334[__this := default_address_t_int()];
	allowed#353 := allowed#353[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk9#9 := payedOut_unchk9#9[__this := false];
	payedOut_unchk20#114 := payedOut_unchk20#114[__this := false];
	winner_unchk20#116 := winner_unchk20#116[__this := 0];
	winAmount_unchk20#118 := winAmount_unchk20#118[__this := 0];
	payedOut_unchk32#151 := payedOut_unchk32#151[__this := false];
	winner_unchk32#153 := winner_unchk32#153[__this := 0];
	winAmount_unchk32#155 := winAmount_unchk32#155[__this := 0];
	// Arguments for AcunarToken
	// Inlined constructor for AcunarToken starts here
	// Function body starts here
	supply#289 := supply#289[__this := 200000000];
	founder#315 := founder#315[__this := __msg_sender];
	balances#334 := balances#334[__this := balances#334[__this][founder#315[__this] := supply#289[__this]]];
	$return37:
	// Function body ends here
	// Inlined constructor for AcunarToken ends here
	// Function body starts here
	deposit#714 := deposit#714[__this := _deposit#903];
	admin#695 := admin#695[__this := __msg_sender];
	ieoState#866 := ieoState#866[__this := 0];
	$return38:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_47.sol", 274, 1} {:message "payedOut_unchk8"} payedOut_unchk8#924: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_47.sol", 275, 1} {:message "winner_unchk8"} winner_unchk8#926: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_47.sol", 276, 1} {:message "winAmount_unchk8"} winAmount_unchk8#928: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_47.sol", 278, 1} {:message "AcunarIEO::sendToWinner_unchk8"} sendToWinner_unchk8#947(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#924[__this]);
	assume {:sourceloc "buggy_47.sol", 280, 9} {:message ""} true;
	call __send_ret#56 := __send(winner_unchk8#926[__this], __this, 0, winAmount_unchk8#928[__this]);
	payedOut_unchk8#924 := payedOut_unchk8#924[__this := true];
	$return39:
	// Function body ends here
}

// 
// Function: halt : function ()
procedure {:sourceloc "buggy_47.sol", 285, 5} {:message "AcunarIEO::halt"} halt#958(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#695[__this]);
	// Function body starts here
	ieoState#866 := ieoState#866[__this := 3];
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 288, 1} {:message "AcunarIEO::bug_unchk39"} bug_unchk39#970(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#960: address_t)
{
	var call_arg#59: int;
	var __send_ret#60: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#59 := 4000000000000000000;
	assume {:sourceloc "buggy_47.sol", 289, 8} {:message ""} true;
	call __send_ret#60 := __send(addr#960, __this, 0, call_arg#59);
	$return42:
	// Function body ends here
}

// 
// Function: unhalt : function ()
procedure {:sourceloc "buggy_47.sol", 292, 5} {:message "AcunarIEO::unhalt"} unhalt#981(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#695[__this]);
	// Function body starts here
	ieoState#866 := ieoState#866[__this := 1];
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 295, 1} {:message "AcunarIEO::my_func_uncheck36"} my_func_uncheck36#996(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#983: address_t)
{
	var __call_ret#63: bool;
	var __call_ret#64: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_47.sol", 296, 9} {:message ""} true;
	call __call_ret#63, __call_ret#64 := __call(dst#983, __this, __msg_value);
	if (__call_ret#63) {
	havoc admin#695;
	havoc deposit#714;
	havoc tokenPrice#742;
	havoc hardCap#757;
	havoc raisedAmount#780;
	havoc saleStart#799;
	havoc saleEnd#805;
	havoc coinTradeStart#810;
	havoc maxInvestment#830;
	havoc minInvestment#847;
	havoc ieoState#866;
	havoc payedOut_unchk8#924;
	havoc winner_unchk8#926;
	havoc winAmount_unchk8#928;
	havoc payedOut_unchk44#1066;
	havoc winner_unchk44#1068;
	havoc winAmount_unchk44#1070;
	havoc payedOut_unchk33#1195;
	havoc payedOut_unchk45#1327;
	havoc name#220;
	havoc payedOut_unchk21#223;
	havoc symbol#247;
	havoc decimals#274;
	havoc supply#289;
	havoc founder#315;
	havoc balances#334;
	havoc allowed#353;
	havoc payedOut_unchk9#9;
	havoc payedOut_unchk20#114;
	havoc winner_unchk20#116;
	havoc winAmount_unchk20#118;
	havoc payedOut_unchk32#151;
	havoc winner_unchk32#153;
	havoc winAmount_unchk32#155;
	havoc __balance;
	}

	if (!(__call_ret#63)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return45:
	// Function body ends here
}

// 
// Function: changeDepositAddress : function (address payable)
procedure {:sourceloc "buggy_47.sol", 302, 5} {:message "AcunarIEO::changeDepositAddress"} changeDepositAddress#1008(__this: address_t, __msg_sender: address_t, __msg_value: int, newDeposit#998: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#695[__this]);
	// Function body starts here
	deposit#714 := deposit#714[__this := newDeposit#998];
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 305, 1} {:message "AcunarIEO::my_func_unchk35"} my_func_unchk35#1021(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1010: address_t)
{
	var __send_ret#67: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 306, 9} {:message ""} true;
	call __send_ret#67 := __send(dst#1010, __this, 0, __msg_value);
	$return48:
	// Function body ends here
}

// 
// Function: getCurrentState : function () view returns (enum AcunarIEO.State)
procedure {:sourceloc "buggy_47.sol", 311, 5} {:message "AcunarIEO::getCurrentState"} getCurrentState#1063(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1024: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((ieoState#866[__this] == 3)) {
	#1024 := 3;
	goto $return49;
	}
	else {
	if ((__block_timestamp < saleStart#799[__this])) {
	#1024 := 0;
	goto $return49;
	}
	else {
	if (((__block_timestamp >= saleStart#799[__this]) && (__block_timestamp <= saleEnd#805[__this]))) {
	#1024 := 1;
	goto $return49;
	}
	else {
	#1024 := 2;
	goto $return49;
	}

	}

	}

	$return49:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_47.sol", 322, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1066: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_47.sol", 323, 1} {:message "winner_unchk44"} winner_unchk44#1068: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_47.sol", 324, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1070: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_47.sol", 326, 1} {:message "AcunarIEO::sendToWinner_unchk44"} sendToWinner_unchk44#1089(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#68: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1066[__this]);
	assume {:sourceloc "buggy_47.sol", 328, 9} {:message ""} true;
	call __send_ret#68 := __send(winner_unchk44#1068[__this], __this, 0, winAmount_unchk44#1070[__this]);
	payedOut_unchk44#1066 := payedOut_unchk44#1066[__this := true];
	$return50:
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
// Function: invest : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 333, 5} {:message "AcunarIEO::invest"} invest#1170(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1092: bool)
{
	var getCurrentState#1063_ret#69: int;
	var {:sourceloc "buggy_47.sol", 340, 9} {:message "tokens"} tokens#1119: int;
	var call_arg#70: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 335, 20} {:message ""} true;
	call getCurrentState#1063_ret#69 := getCurrentState#1063(__this, __msg_sender, __msg_value);
	ieoState#866 := ieoState#866[__this := getCurrentState#1063_ret#69];
	assume (ieoState#866[__this] == 1);
	assume ((__msg_value >= minInvestment#847[__this]) && (__msg_value <= maxInvestment#830[__this]));
	tokens#1119 := (__msg_value div tokenPrice#742[__this]);
	assume ((raisedAmount#780[__this] + __msg_value) <= hardCap#757[__this]);
	raisedAmount#780 := raisedAmount#780[__this := (raisedAmount#780[__this] + __msg_value)];
	balances#334 := balances#334[__this := balances#334[__this][__msg_sender := (balances#334[__this][__msg_sender] + tokens#1119)]];
	balances#334 := balances#334[__this := balances#334[__this][founder#315[__this] := (balances#334[__this][founder#315[__this]] - tokens#1119)]];
	assume {:sourceloc "buggy_47.sol", 351, 9} {:message ""} true;
	call __transfer(deposit#714[__this], __this, 0, __msg_value);
	call_arg#70 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 354, 14} {:message ""} true;
	call Invest#901(__this, __msg_sender, __msg_value, call_arg#70, __msg_value, tokens#1119);
	#1092 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_47.sol", 360, 1} {:message "AcunarIEO::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1185(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 361, 4} {:message "addr_unchk40"} addr_unchk40#1174: address_t;
	var call_arg#71: int;
	var __send_ret#72: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1174 := 0;
	call_arg#71 := 2000000000000000000;
	assume {:sourceloc "buggy_47.sol", 362, 10} {:message ""} true;
	call __send_ret#72 := __send(addr_unchk40#1174, __this, 0, call_arg#71);
	if (!(__send_ret#72)) {
	
	}
	else {
	
	}

	$return52:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 371, 5} {:message "AcunarIEO::[fallback]"} #1192(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var invest#1170_ret#73: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 372, 9} {:message ""} true;
	call invest#1170_ret#73 := invest#1170(__this, __msg_sender, __msg_value);
	$return53:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_47.sol", 374, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1195: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_47.sol", 376, 1} {:message "AcunarIEO::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1216(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#74: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1195[__this];
	assume {:sourceloc "buggy_47.sol", 378, 3} {:message ""} true;
	call __send_ret#74 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return54:
	// Function body ends here
}

// 
// Function: burn : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 383, 5} {:message "AcunarIEO::burn"} burn#1240(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1219: bool)
{
	var getCurrentState#1063_ret#75: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 384, 20} {:message ""} true;
	call getCurrentState#1063_ret#75 := getCurrentState#1063(__this, __msg_sender, __msg_value);
	ieoState#866 := ieoState#866[__this := getCurrentState#1063_ret#75];
	assume (ieoState#866[__this] == 2);
	balances#334 := balances#334[__this := balances#334[__this][founder#315[__this] := 0]];
	$return55:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_47.sol", 389, 1} {:message "AcunarIEO::bug_unchk27"} bug_unchk27#1252(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1242: address_t)
{
	var call_arg#76: int;
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#76 := 42000000000000000000;
	assume {:sourceloc "buggy_47.sol", 390, 8} {:message ""} true;
	call __send_ret#77 := __send(addr#1242, __this, 0, call_arg#76);
	$return56:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 393, 5} {:message "AcunarIEO::transfer"} transfer#1276(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1254: address_t, value#1256: int)
	returns (#1260: bool)
{
	var transfer#651_ret#78: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#810[__this]);
	assume {:sourceloc "buggy_47.sol", 395, 14} {:message ""} true;
	call transfer#651_ret#78 := transfer#651(__this, __msg_sender, __msg_value, to#1254, value#1256);
	#1260 := transfer#651_ret#78;
	goto $return57;
	$return57:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_47.sol", 397, 1} {:message "AcunarIEO::bug_unchk31"} bug_unchk31#1297(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 398, 1} {:message "addr_unchk31"} addr_unchk31#1280: address_t;
	var call_arg#79: int;
	var __send_ret#80: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#1280 := 0;
	call_arg#79 := 10000000000000000000;
	assume {:sourceloc "buggy_47.sol", 399, 6} {:message ""} true;
	call __send_ret#80 := __send(addr_unchk31#1280, __this, 0, call_arg#79);
	if ((!(__send_ret#80) || (1 == 1))) {
	assume false;
	}

	$return58:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 403, 5} {:message "AcunarIEO::transferFrom"} transferFrom#1324(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1299: address_t, _to#1301: address_t, _value#1303: int)
	returns (#1307: bool)
{
	var transferFrom#537_ret#81: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#810[__this]);
	assume {:sourceloc "buggy_47.sol", 405, 14} {:message ""} true;
	call transferFrom#537_ret#81 := transferFrom#537(__this, __msg_sender, __msg_value, _from#1299, _to#1301, _value#1303);
	#1307 := transferFrom#537_ret#81;
	goto $return59;
	$return59:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_47.sol", 407, 1} {:message "payedOut_unchk45"} payedOut_unchk45#1327: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_47.sol", 409, 1} {:message "AcunarIEO::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#1348(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#82: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#1327[__this];
	assume {:sourceloc "buggy_47.sol", 411, 3} {:message ""} true;
	call __send_ret#82 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return60:
	// Function body ends here
}

