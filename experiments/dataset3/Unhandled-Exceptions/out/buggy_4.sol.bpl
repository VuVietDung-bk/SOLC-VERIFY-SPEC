// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_4.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_4.sol", 21, 3} {:message "[event] IERC20::Transfer"} Transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, from#25: address_t, to#27: address_t, value#29: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_4.sol", 18, 3} {:message "IERC20::totalSupply"} totalSupply#7(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#5: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_4.sol", 19, 3} {:message "IERC20::balanceOf"} balanceOf#14(__this: address_t, __msg_sender: address_t, __msg_value: int, who#9: address_t)
	returns (#12: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_4.sol", 20, 3} {:message "IERC20::transfer"} transfer#23(__this: address_t, __msg_sender: address_t, __msg_value: int, to#16: address_t, value#18: int)
	returns (#21: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_4.sol", 17, 1} {:message "IERC20::[implicit_constructor]"} __constructor#32(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: PHO -------
// Inherits from: IERC20
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
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_4.sol", 29, 3} {:message "PHO::unhandledsend_unchk38"} unhandledsend_unchk38#47(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#37: address_t)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := 5000000000000000000;
	assume {:sourceloc "buggy_4.sol", 30, 5} {:message ""} true;
	call __send_ret#1 := __send(callee#37, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_4.sol", 32, 3} {:message "name"} name#50: [address_t]int_arr_type;
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_4.sol", 33, 3} {:message "PHO::cash_unchk46"} cash_unchk46#74(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#52: int, subpotIndex#54: int, winner_unchk46#56: address_t)
{
	var {:sourceloc "buggy_4.sol", 34, 9} {:message "subpot_unchk46"} subpot_unchk46#60: int;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#60 := 3000000000000000000;
	call_arg#2 := subpot_unchk46#60;
	assume {:sourceloc "buggy_4.sol", 35, 9} {:message ""} true;
	call __send_ret#3 := __send(winner_unchk46#56, __this, 0, call_arg#2);
	subpot_unchk46#60 := 0;
	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_4.sol", 38, 3} {:message "symbol"} symbol#77: [address_t]int_arr_type;
// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_4.sol", 39, 3} {:message "PHO::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#92(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 40, 4} {:message "addr_unchk4"} addr_unchk4#81: address_t;
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#81 := 0;
	call_arg#4 := 42000000000000000000;
	assume {:sourceloc "buggy_4.sol", 41, 10} {:message ""} true;
	call __send_ret#5 := __send(addr_unchk4#81, __this, 0, call_arg#4);
	if (!(__send_ret#5)) {
	
	}
	else {
	
	}

	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_4.sol", 48, 3} {:message "decimals"} decimals#95: [address_t]int;
// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_4.sol", 50, 3} {:message "PHO::bug_unchk7"} bug_unchk7#116(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 51, 1} {:message "addr_unchk7"} addr_unchk7#99: address_t;
	var call_arg#6: int;
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#99 := 0;
	call_arg#6 := 10000000000000000000;
	assume {:sourceloc "buggy_4.sol", 52, 6} {:message ""} true;
	call __send_ret#7 := __send(addr_unchk7#99, __this, 0, call_arg#6);
	if ((!(__send_ret#7) || (1 == 1))) {
	assume false;
	}

	$return3:
	// Function body ends here
}

// 
// State variable: saleAmount: uint256
var {:sourceloc "buggy_4.sol", 55, 3} {:message "saleAmount"} saleAmount#118: [address_t]int;
// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_4.sol", 56, 3} {:message "PHO::my_func_unchk23"} my_func_unchk23#131(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#120: address_t)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_4.sol", 57, 9} {:message ""} true;
	call __send_ret#8 := __send(dst#120, __this, 0, __msg_value);
	$return4:
	// Function body ends here
}

// 
// State variable: evtAmount: uint256
var {:sourceloc "buggy_4.sol", 59, 3} {:message "evtAmount"} evtAmount#133: [address_t]int;
// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_4.sol", 60, 3} {:message "PHO::unhandledsend_unchk14"} unhandledsend_unchk14#145(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#135: address_t)
{
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#9 := 5000000000000000000;
	assume {:sourceloc "buggy_4.sol", 61, 5} {:message ""} true;
	call __send_ret#10 := __send(callee#135, __this, 0, call_arg#9);
	$return5:
	// Function body ends here
}

// 
// State variable: teamAmount: uint256
var {:sourceloc "buggy_4.sol", 63, 3} {:message "teamAmount"} teamAmount#147: [address_t]int;
// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_4.sol", 65, 3} {:message "PHO::bug_unchk30"} bug_unchk30#172(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 66, 1} {:message "receivers_unchk30"} receivers_unchk30#151: int;
	var {:sourceloc "buggy_4.sol", 67, 1} {:message "addr_unchk30"} addr_unchk30#154: address_t;
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#151 := 0;
	addr_unchk30#154 := 0;
	call_arg#11 := 42000000000000000000;
	assume {:sourceloc "buggy_4.sol", 68, 6} {:message ""} true;
	call __send_ret#12 := __send(addr_unchk30#154, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	receivers_unchk30#151 := (receivers_unchk30#151 + 1);
	}
	else {
	assume false;
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_4.sol", 73, 3} {:message "_totalSupply"} _totalSupply#174: [address_t]int;
// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_4.sol", 74, 3} {:message "payedOut_unchk8"} payedOut_unchk8#177: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_4.sol", 75, 1} {:message "winner_unchk8"} winner_unchk8#179: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_4.sol", 76, 1} {:message "winAmount_unchk8"} winAmount_unchk8#181: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_4.sol", 78, 1} {:message "PHO::sendToWinner_unchk8"} sendToWinner_unchk8#200(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#177[__this]);
	assume {:sourceloc "buggy_4.sol", 80, 9} {:message ""} true;
	call __send_ret#13 := __send(winner_unchk8#179[__this], __this, 0, winAmount_unchk8#181[__this]);
	payedOut_unchk8#177 := payedOut_unchk8#177[__this := true];
	$return7:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 83, 3} {:message "balances"} balances#204: [address_t][address_t]int;
// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_4.sol", 85, 3} {:message "PHO::bug_unchk39"} bug_unchk39#216(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#206: address_t)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := 4000000000000000000;
	assume {:sourceloc "buggy_4.sol", 86, 8} {:message ""} true;
	call __send_ret#15 := __send(addr#206, __this, 0, call_arg#14);
	$return8:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_4.sol", 87, 3} {:message "owner"} owner#218: [address_t]address_t;
type int_arr_ptr = int;
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
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_4.sol", 88, 3} {:message "PHO::my_func_uncheck36"} my_func_uncheck36#233(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#220: address_t)
{
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_4.sol", 89, 7} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(dst#220, __this, __msg_value);
	if (__call_ret#16) {
	havoc name#50;
	havoc symbol#77;
	havoc decimals#95;
	havoc saleAmount#118;
	havoc evtAmount#133;
	havoc teamAmount#147;
	havoc _totalSupply#174;
	havoc payedOut_unchk8#177;
	havoc winner_unchk8#179;
	havoc winAmount_unchk8#181;
	havoc balances#204;
	havoc owner#218;
	havoc sale#235;
	havoc evt#250;
	havoc payedOut_unchk44#253;
	havoc winner_unchk44#255;
	havoc winAmount_unchk44#257;
	havoc team#278;
	havoc payedOut_unchk33#411;
	havoc payedOut_unchk45#657;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: sale: address
var {:sourceloc "buggy_4.sol", 91, 3} {:message "sale"} sale#235: [address_t]address_t;
// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_4.sol", 92, 3} {:message "PHO::my_func_unchk35"} my_func_unchk35#248(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#237: address_t)
{
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_4.sol", 93, 9} {:message ""} true;
	call __send_ret#18 := __send(dst#237, __this, 0, __msg_value);
	$return10:
	// Function body ends here
}

// 
// State variable: evt: address
var {:sourceloc "buggy_4.sol", 95, 3} {:message "evt"} evt#250: [address_t]address_t;
// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_4.sol", 96, 3} {:message "payedOut_unchk44"} payedOut_unchk44#253: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_4.sol", 97, 1} {:message "winner_unchk44"} winner_unchk44#255: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_4.sol", 98, 1} {:message "winAmount_unchk44"} winAmount_unchk44#257: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_4.sol", 100, 1} {:message "PHO::sendToWinner_unchk44"} sendToWinner_unchk44#276(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#253[__this]);
	assume {:sourceloc "buggy_4.sol", 102, 9} {:message ""} true;
	call __send_ret#19 := __send(winner_unchk44#255[__this], __this, 0, winAmount_unchk44#257[__this]);
	payedOut_unchk44#253 := payedOut_unchk44#253[__this := true];
	$return11:
	// Function body ends here
}

// 
// State variable: team: address
var {:sourceloc "buggy_4.sol", 105, 3} {:message "team"} team#278: [address_t]address_t;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
const unique address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561: address_t;
const unique address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6: address_t;
const unique address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_4.sol", 112, 5} {:message "PHO::[constructor]"} __constructor#706(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	var toWei#691_ret#21: int;
	var call_arg#22: int;
	var toWei#691_ret#23: int;
	var call_arg#24: int;
	var toWei#691_ret#25: int;
	var call_arg#26: int;
	var toWei#691_ret#27: int;
	var call_arg#28: address_t;
	var transfer#591_ret#29: bool;
	var transfer#591_ret#30: bool;
	var transfer#591_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#50 := name#50[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	symbol#77 := symbol#77[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	decimals#95 := decimals#95[__this := 18];
	saleAmount#118 := saleAmount#118[__this := 0];
	evtAmount#133 := evtAmount#133[__this := 0];
	teamAmount#147 := teamAmount#147[__this := 0];
	_totalSupply#174 := _totalSupply#174[__this := 0];
	payedOut_unchk8#177 := payedOut_unchk8#177[__this := false];
	winner_unchk8#179 := winner_unchk8#179[__this := 0];
	winAmount_unchk8#181 := winAmount_unchk8#181[__this := 0];
	balances#204 := balances#204[__this := default_address_t_int()];
	owner#218 := owner#218[__this := 0];
	sale#235 := sale#235[__this := 0];
	evt#250 := evt#250[__this := 0];
	payedOut_unchk44#253 := payedOut_unchk44#253[__this := false];
	winner_unchk44#255 := winner_unchk44#255[__this := 0];
	winAmount_unchk44#257 := winAmount_unchk44#257[__this := 0];
	team#278 := team#278[__this := 0];
	payedOut_unchk33#411 := payedOut_unchk33#411[__this := false];
	payedOut_unchk45#657 := payedOut_unchk45#657[__this := false];
	// Function body starts here
	owner#218 := owner#218[__this := __msg_sender];
	sale#235 := sale#235[__this := address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561];
	evt#250 := evt#250[__this := address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6];
	team#278 := team#278[__this := address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C];
	call_arg#20 := 1000000000;
	assume {:sourceloc "buggy_4.sol", 118, 25} {:message ""} true;
	call toWei#691_ret#21 := toWei#691(__this, __msg_sender, __msg_value, call_arg#20);
	saleAmount#118 := saleAmount#118[__this := toWei#691_ret#21];
	call_arg#22 := 200000000;
	assume {:sourceloc "buggy_4.sol", 119, 25} {:message ""} true;
	call toWei#691_ret#23 := toWei#691(__this, __msg_sender, __msg_value, call_arg#22);
	evtAmount#133 := evtAmount#133[__this := toWei#691_ret#23];
	call_arg#24 := 800000000;
	assume {:sourceloc "buggy_4.sol", 120, 25} {:message ""} true;
	call toWei#691_ret#25 := toWei#691(__this, __msg_sender, __msg_value, call_arg#24);
	teamAmount#147 := teamAmount#147[__this := toWei#691_ret#25];
	call_arg#26 := 2000000000;
	assume {:sourceloc "buggy_4.sol", 121, 25} {:message ""} true;
	call toWei#691_ret#27 := toWei#691(__this, __msg_sender, __msg_value, call_arg#26);
	_totalSupply#174 := _totalSupply#174[__this := toWei#691_ret#27];
	assume (_totalSupply#174[__this] == ((saleAmount#118[__this] + evtAmount#133[__this]) + teamAmount#147[__this]));
	balances#204 := balances#204[__this := balances#204[__this][owner#218[__this] := _totalSupply#174[__this]]];
	call_arg#28 := 0;
	assume {:sourceloc "buggy_4.sol", 126, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#28, owner#218[__this], balances#204[__this][owner#218[__this]]);
	assume {:sourceloc "buggy_4.sol", 128, 9} {:message ""} true;
	call transfer#591_ret#29 := transfer#591(__this, __msg_sender, __msg_value, sale#235[__this], saleAmount#118[__this]);
	assume {:sourceloc "buggy_4.sol", 129, 9} {:message ""} true;
	call transfer#591_ret#30 := transfer#591(__this, __msg_sender, __msg_value, evt#250[__this], evtAmount#133[__this]);
	assume {:sourceloc "buggy_4.sol", 130, 9} {:message ""} true;
	call transfer#591_ret#31 := transfer#591(__this, __msg_sender, __msg_value, team#278[__this], teamAmount#147[__this]);
	assume (balances#204[__this][owner#218[__this]] == 0);
	$return12:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_4.sol", 133, 1} {:message "PHO::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#399(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 134, 4} {:message "addr_unchk40"} addr_unchk40#388: address_t;
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#388 := 0;
	call_arg#32 := 2000000000000000000;
	assume {:sourceloc "buggy_4.sol", 135, 10} {:message ""} true;
	call __send_ret#33 := __send(addr_unchk40#388, __this, 0, call_arg#32);
	if (!(__send_ret#33)) {
	
	}
	else {
	
	}

	$return13:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 143, 5} {:message "PHO::totalSupply"} totalSupply#408(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#403: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#403 := _totalSupply#174[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_4.sol", 146, 1} {:message "payedOut_unchk33"} payedOut_unchk33#411: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_4.sol", 148, 1} {:message "PHO::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#432(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#411[__this];
	assume {:sourceloc "buggy_4.sol", 150, 3} {:message ""} true;
	call __send_ret#34 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return15:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 153, 5} {:message "PHO::balanceOf"} balanceOf#445(__this: address_t, __msg_sender: address_t, __msg_value: int, who#434: address_t)
	returns (#438: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#438 := balances#204[__this][who#434];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_4.sol", 156, 1} {:message "PHO::bug_unchk27"} bug_unchk27#457(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#447: address_t)
{
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#35 := 42000000000000000000;
	assume {:sourceloc "buggy_4.sol", 157, 8} {:message ""} true;
	call __send_ret#36 := __send(addr#447, __this, 0, call_arg#35);
	$return17:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_4.sol", 159, 5} {:message "PHO::transfer"} transfer#591(__this: address_t, __msg_sender: address_t, __msg_value: int, to#459: address_t, value#461: int)
	returns (success#465: bool)
{
	var call_arg#37: int;
	var toWei#691_ret#38: int;
	var call_arg#39: int;
	var toWei#691_ret#40: int;
	var call_arg#41: int;
	var toWei#691_ret#42: int;
	var call_arg#43: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender != to#459);
	assume (value#461 > 0);
	assume (balances#204[__this][__msg_sender] >= value#461);
	assume ((balances#204[__this][to#459] + value#461) >= balances#204[__this][to#459]);
	if ((__msg_sender == team#278[__this])) {
	assume (__block_timestamp >= 1589036400);
	call_arg#37 := 600000000;
	assume {:sourceloc "buggy_4.sol", 168, 47} {:message ""} true;
	call toWei#691_ret#38 := toWei#691(__this, __msg_sender, __msg_value, call_arg#37);
	if (((balances#204[__this][__msg_sender] - value#461) < toWei#691_ret#38)) {
	assume (__block_timestamp >= 1620572400);
	}

	call_arg#39 := 400000000;
	assume {:sourceloc "buggy_4.sol", 170, 47} {:message ""} true;
	call toWei#691_ret#40 := toWei#691(__this, __msg_sender, __msg_value, call_arg#39);
	if (((balances#204[__this][__msg_sender] - value#461) < toWei#691_ret#40)) {
	assume (__block_timestamp >= 1652108400);
	}

	call_arg#41 := 200000000;
	assume {:sourceloc "buggy_4.sol", 172, 47} {:message ""} true;
	call toWei#691_ret#42 := toWei#691(__this, __msg_sender, __msg_value, call_arg#41);
	if (((balances#204[__this][__msg_sender] - value#461) < toWei#691_ret#42)) {
	assume (__block_timestamp >= 1683644400);
	}

	}

	balances#204 := balances#204[__this := balances#204[__this][__msg_sender := (balances#204[__this][__msg_sender] - value#461)]];
	balances#204 := balances#204[__this := balances#204[__this][to#459 := (balances#204[__this][to#459] + value#461)]];
	call_arg#43 := __msg_sender;
	assume {:sourceloc "buggy_4.sol", 179, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#43, to#459, value#461);
	success#465 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_4.sol", 182, 1} {:message "PHO::bug_unchk31"} bug_unchk31#612(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 183, 1} {:message "addr_unchk31"} addr_unchk31#595: address_t;
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#595 := 0;
	call_arg#44 := 10000000000000000000;
	assume {:sourceloc "buggy_4.sol", 184, 6} {:message ""} true;
	call __send_ret#45 := __send(addr_unchk31#595, __this, 0, call_arg#44);
	if ((!(__send_ret#45) || (1 == 1))) {
	assume false;
	}

	$return19:
	// Function body ends here
}

// 
// Function: burnCoins : function (uint256)
procedure {:sourceloc "buggy_4.sol", 188, 5} {:message "PHO::burnCoins"} burnCoins#654(__this: address_t, __msg_sender: address_t, __msg_value: int, value#614: int)
{
	var call_arg#46: address_t;
	var call_arg#47: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#204[__this][__msg_sender] >= value#614);
	assume (_totalSupply#174[__this] >= value#614);
	balances#204 := balances#204[__this := balances#204[__this][__msg_sender := (balances#204[__this][__msg_sender] - value#614)]];
	_totalSupply#174 := _totalSupply#174[__this := (_totalSupply#174[__this] - value#614)];
	call_arg#46 := __msg_sender;
	call_arg#47 := 0;
	assume {:sourceloc "buggy_4.sol", 195, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#46, call_arg#47, value#614);
	$return20:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_4.sol", 197, 1} {:message "payedOut_unchk45"} payedOut_unchk45#657: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_4.sol", 199, 1} {:message "PHO::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#678(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#657[__this];
	assume {:sourceloc "buggy_4.sol", 201, 3} {:message ""} true;
	call __send_ret#48 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return21:
	// Function body ends here
}

// 
// Function: toWei : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_4.sol", 208, 5} {:message "PHO::toWei"} toWei#691(__this: address_t, __msg_sender: address_t, __msg_value: int, value#681: int)
	returns (#684: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#684 := (value#681 * 1000000000000000000);
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_4.sol", 211, 1} {:message "PHO::callnotchecked_unchk13"} callnotchecked_unchk13#705(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#693: address_t)
{
	var __call_ret#49: bool;
	var __call_ret#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_4.sol", 212, 3} {:message ""} true;
	call __call_ret#49, __call_ret#50 := __call(callee#693, __this, 1000000000000000000);
	if (__call_ret#49) {
	havoc name#50;
	havoc symbol#77;
	havoc decimals#95;
	havoc saleAmount#118;
	havoc evtAmount#133;
	havoc teamAmount#147;
	havoc _totalSupply#174;
	havoc payedOut_unchk8#177;
	havoc winner_unchk8#179;
	havoc winAmount_unchk8#181;
	havoc balances#204;
	havoc owner#218;
	havoc sale#235;
	havoc evt#250;
	havoc payedOut_unchk44#253;
	havoc winner_unchk44#255;
	havoc winAmount_unchk44#257;
	havoc team#278;
	havoc payedOut_unchk33#411;
	havoc payedOut_unchk45#657;
	havoc __balance;
	}

	if (!(__call_ret#49)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return23:
	// Function body ends here
}

