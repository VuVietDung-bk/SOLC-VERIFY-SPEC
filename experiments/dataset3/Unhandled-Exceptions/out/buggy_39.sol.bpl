// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_39.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: TAMCContract -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_39.sol", 38, 3} {:message "[event] TAMCContract::Transfer"} Transfer#117(__this: address_t, __msg_sender: address_t, __msg_value: int, from#111: address_t, to#113: address_t, value#115: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_39.sol", 71, 3} {:message "[event] TAMCContract::Approval"} Approval#242(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#236: address_t, spender#238: address_t, value#240: int)
{
	
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_39.sol", 8, 3} {:message "payedOut_unchk8"} payedOut_unchk8#4: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_39.sol", 9, 1} {:message "winner_unchk8"} winner_unchk8#6: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_39.sol", 10, 1} {:message "winAmount_unchk8"} winAmount_unchk8#8: [address_t]int;
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
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_39.sol", 12, 1} {:message "TAMCContract::sendToWinner_unchk8"} sendToWinner_unchk8#27(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#4[__this]);
	assume {:sourceloc "buggy_39.sol", 14, 9} {:message ""} true;
	call __send_ret#0 := __send(winner_unchk8#6[__this], __this, 0, winAmount_unchk8#8[__this]);
	payedOut_unchk8#4 := payedOut_unchk8#4[__this := true];
	$return0:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 17, 3} {:message "balanceOf"} balanceOf#31: [address_t][address_t]int;
// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_39.sol", 19, 3} {:message "TAMCContract::bug_unchk39"} bug_unchk39#43(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#33: address_t)
{
	var call_arg#1: int;
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#1 := 4000000000000000000;
	assume {:sourceloc "buggy_39.sol", 20, 8} {:message ""} true;
	call __send_ret#2 := __send(addr#33, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_39.sol", 21, 3} {:message "name"} name#46: [address_t]int_arr_type;
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
procedure {:sourceloc "buggy_39.sol", 22, 3} {:message "TAMCContract::my_func_uncheck36"} my_func_uncheck36#61(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#48: address_t)
{
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_39.sol", 23, 7} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(dst#48, __this, __msg_value);
	if (__call_ret#3) {
	havoc payedOut_unchk8#4;
	havoc winner_unchk8#6;
	havoc winAmount_unchk8#8;
	havoc balanceOf#31;
	havoc name#46;
	havoc symbol#64;
	havoc decimals#80;
	havoc totalSupply#85;
	havoc payedOut_unchk45#88;
	havoc payedOut_unchk33#197;
	havoc payedOut_unchk44#245;
	havoc winner_unchk44#247;
	havoc winAmount_unchk44#249;
	havoc allowance#274;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_39.sol", 25, 3} {:message "symbol"} symbol#64: [address_t]int_arr_type;
// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_39.sol", 26, 3} {:message "TAMCContract::my_func_unchk35"} my_func_unchk35#77(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#66: address_t)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_39.sol", 27, 9} {:message ""} true;
	call __send_ret#5 := __send(dst#66, __this, 0, __msg_value);
	$return3:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_39.sol", 29, 3} {:message "decimals"} decimals#80: [address_t]int;
// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_39.sol", 30, 5} {:message "totalSupply"} totalSupply#85: [address_t]int;
// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_39.sol", 32, 3} {:message "payedOut_unchk45"} payedOut_unchk45#88: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_39.sol", 34, 1} {:message "TAMCContract::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#109(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#88[__this];
	assume {:sourceloc "buggy_39.sol", 36, 3} {:message ""} true;
	call __send_ret#6 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return4:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_39.sol", 40, 5} {:message "TAMCContract::[constructor]"} __constructor#396(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: address_t;
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk8#4 := payedOut_unchk8#4[__this := false];
	winner_unchk8#6 := winner_unchk8#6[__this := 0];
	winAmount_unchk8#8 := winAmount_unchk8#8[__this := 0];
	balanceOf#31 := balanceOf#31[__this := default_address_t_int()];
	name#46 := name#46[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	symbol#64 := symbol#64[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	decimals#80 := decimals#80[__this := 18];
	totalSupply#85 := totalSupply#85[__this := 1000000000000000000000000000];
	payedOut_unchk45#88 := payedOut_unchk45#88[__this := false];
	payedOut_unchk33#197 := payedOut_unchk33#197[__this := false];
	payedOut_unchk44#245 := payedOut_unchk44#245[__this := false];
	winner_unchk44#247 := winner_unchk44#247[__this := 0];
	winAmount_unchk44#249 := winAmount_unchk44#249[__this := 0];
	allowance#274 := allowance#274[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	balanceOf#31 := balanceOf#31[__this := balanceOf#31[__this][__msg_sender := totalSupply#85[__this]]];
	call_arg#7 := 0;
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_39.sol", 42, 14} {:message ""} true;
	call Transfer#117(__this, __msg_sender, __msg_value, call_arg#7, call_arg#8, totalSupply#85[__this]);
	$return5:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_39.sol", 44, 1} {:message "TAMCContract::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#153(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_39.sol", 45, 4} {:message "addr_unchk40"} addr_unchk40#142: address_t;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#142 := 0;
	call_arg#9 := 2000000000000000000;
	assume {:sourceloc "buggy_39.sol", 46, 10} {:message ""} true;
	call __send_ret#10 := __send(addr_unchk40#142, __this, 0, call_arg#9);
	if (!(__send_ret#10)) {
	
	}
	else {
	
	}

	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_39.sol", 54, 5} {:message "TAMCContract::transfer"} transfer#194(__this: address_t, __msg_sender: address_t, __msg_value: int, to#155: address_t, value#157: int)
	returns (success#160: bool)
{
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#31[__this][__msg_sender] >= value#157);
	balanceOf#31 := balanceOf#31[__this := balanceOf#31[__this][__msg_sender := (balanceOf#31[__this][__msg_sender] - value#157)]];
	balanceOf#31 := balanceOf#31[__this := balanceOf#31[__this][to#155 := (balanceOf#31[__this][to#155] + value#157)]];
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_39.sol", 58, 14} {:message ""} true;
	call Transfer#117(__this, __msg_sender, __msg_value, call_arg#11, to#155, value#157);
	success#160 := true;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_39.sol", 61, 1} {:message "payedOut_unchk33"} payedOut_unchk33#197: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_39.sol", 63, 1} {:message "TAMCContract::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#197[__this];
	assume {:sourceloc "buggy_39.sol", 65, 9} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return8:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_39.sol", 68, 3} {:message "TAMCContract::callnotchecked_unchk13"} callnotchecked_unchk13#234(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#220: address_t)
{
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_39.sol", 69, 5} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(callee#220, __this, 1000000000000000000);
	if (__call_ret#13) {
	havoc payedOut_unchk8#4;
	havoc winner_unchk8#6;
	havoc winAmount_unchk8#8;
	havoc balanceOf#31;
	havoc name#46;
	havoc symbol#64;
	havoc decimals#80;
	havoc totalSupply#85;
	havoc payedOut_unchk45#88;
	havoc payedOut_unchk33#197;
	havoc payedOut_unchk44#245;
	havoc winner_unchk44#247;
	havoc winAmount_unchk44#249;
	havoc allowance#274;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_39.sol", 73, 3} {:message "payedOut_unchk44"} payedOut_unchk44#245: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_39.sol", 74, 1} {:message "winner_unchk44"} winner_unchk44#247: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_39.sol", 75, 1} {:message "winAmount_unchk44"} winAmount_unchk44#249: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_39.sol", 77, 1} {:message "TAMCContract::sendToWinner_unchk44"} sendToWinner_unchk44#268(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#245[__this]);
	assume {:sourceloc "buggy_39.sol", 79, 9} {:message ""} true;
	call __send_ret#15 := __send(winner_unchk44#247[__this], __this, 0, winAmount_unchk44#249[__this]);
	payedOut_unchk44#245 := payedOut_unchk44#245[__this := true];
	$return10:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_39.sol", 82, 3} {:message "allowance"} allowance#274: [address_t][address_t][address_t]int;
// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_39.sol", 84, 5} {:message "TAMCContract::approve"} approve#302(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#276: address_t, value#278: int)
	returns (success#281: bool)
{
	var call_arg#16: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#274 := allowance#274[__this := allowance#274[__this][__msg_sender := allowance#274[__this][__msg_sender][spender#276 := value#278]]];
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_39.sol", 89, 14} {:message ""} true;
	call Approval#242(__this, __msg_sender, __msg_value, call_arg#16, spender#276, value#278);
	success#281 := true;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_39.sol", 92, 1} {:message "TAMCContract::bug_unchk27"} bug_unchk27#314(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#304: address_t)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := 42000000000000000000;
	assume {:sourceloc "buggy_39.sol", 93, 8} {:message ""} true;
	call __send_ret#18 := __send(addr#304, __this, 0, call_arg#17);
	$return12:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_39.sol", 95, 5} {:message "TAMCContract::transferFrom"} transferFrom#374(__this: address_t, __msg_sender: address_t, __msg_value: int, from#316: address_t, to#318: address_t, value#320: int)
	returns (success#323: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#320 <= balanceOf#31[__this][from#316]);
	assume (value#320 <= allowance#274[__this][from#316][__msg_sender]);
	balanceOf#31 := balanceOf#31[__this := balanceOf#31[__this][from#316 := (balanceOf#31[__this][from#316] - value#320)]];
	balanceOf#31 := balanceOf#31[__this := balanceOf#31[__this][to#318 := (balanceOf#31[__this][to#318] + value#320)]];
	allowance#274 := allowance#274[__this := allowance#274[__this][from#316 := allowance#274[__this][from#316][__msg_sender := (allowance#274[__this][from#316][__msg_sender] - value#320)]]];
	assume {:sourceloc "buggy_39.sol", 105, 14} {:message ""} true;
	call Transfer#117(__this, __msg_sender, __msg_value, from#316, to#318, value#320);
	success#323 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_39.sol", 108, 1} {:message "TAMCContract::bug_unchk31"} bug_unchk31#395(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_39.sol", 109, 1} {:message "addr_unchk31"} addr_unchk31#378: address_t;
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#378 := 0;
	call_arg#19 := 10000000000000000000;
	assume {:sourceloc "buggy_39.sol", 110, 6} {:message ""} true;
	call __send_ret#20 := __send(addr_unchk31#378, __this, 0, call_arg#19);
	if ((!(__send_ret#20) || (1 == 1))) {
	assume false;
	}

	$return14:
	// Function body ends here
}

