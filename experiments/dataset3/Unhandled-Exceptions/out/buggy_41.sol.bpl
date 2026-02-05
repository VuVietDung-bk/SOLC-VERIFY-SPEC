// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_41.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_41.sol", 12, 5} {:message "tokenRecipient::receiveApproval"} receiveApproval#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#3: address_t, _value#5: int, _token#7: address_t, _extraData#9: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_41.sol", 11, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#13(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: AO -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_41.sol", 66, 3} {:message "[event] AO::Transfer"} Transfer#171(__this: address_t, __msg_sender: address_t, __msg_value: int, from#165: address_t, to#167: address_t, value#169: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_41.sol", 75, 3} {:message "[event] AO::Approval"} Approval#203(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#197: address_t, _spender#199: address_t, _value#201: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_41.sol", 81, 3} {:message "[event] AO::Burn"} Burn#225(__this: address_t, __msg_sender: address_t, __msg_value: int, from#221: address_t, value#223: int)
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
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_41.sol", 17, 3} {:message "AO::cash_unchk46"} cash_unchk46#37(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#15: int, subpotIndex#17: int, winner_unchk46#19: address_t)
{
	var {:sourceloc "buggy_41.sol", 18, 9} {:message "subpot_unchk46"} subpot_unchk46#23: int;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#23 := 3000000000000000000;
	call_arg#0 := subpot_unchk46#23;
	assume {:sourceloc "buggy_41.sol", 19, 9} {:message ""} true;
	call __send_ret#1 := __send(winner_unchk46#19, __this, 0, call_arg#0);
	subpot_unchk46#23 := 0;
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_41.sol", 22, 3} {:message "name"} name#39: [address_t]int_arr_type;
// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_41.sol", 23, 3} {:message "AO::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#54(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 24, 4} {:message "addr_unchk4"} addr_unchk4#43: address_t;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#43 := 0;
	call_arg#2 := 42000000000000000000;
	assume {:sourceloc "buggy_41.sol", 25, 10} {:message ""} true;
	call __send_ret#3 := __send(addr_unchk4#43, __this, 0, call_arg#2);
	if (!(__send_ret#3)) {
	
	}
	else {
	
	}

	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_41.sol", 32, 3} {:message "symbol"} symbol#56: [address_t]int_arr_type;
// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_41.sol", 33, 3} {:message "AO::bug_unchk7"} bug_unchk7#77(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 34, 1} {:message "addr_unchk7"} addr_unchk7#60: address_t;
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#60 := 0;
	call_arg#4 := 10000000000000000000;
	assume {:sourceloc "buggy_41.sol", 35, 6} {:message ""} true;
	call __send_ret#5 := __send(addr_unchk7#60, __this, 0, call_arg#4);
	if ((!(__send_ret#5) || (1 == 1))) {
	assume false;
	}

	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_41.sol", 38, 3} {:message "decimals"} decimals#80: [address_t]int;
// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_41.sol", 40, 3} {:message "AO::my_func_unchk23"} my_func_unchk23#93(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#82: address_t)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_41.sol", 41, 9} {:message ""} true;
	call __send_ret#6 := __send(dst#82, __this, 0, __msg_value);
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_41.sol", 43, 3} {:message "totalSupply"} totalSupply#95: [address_t]int;
// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_41.sol", 46, 3} {:message "AO::unhandledsend_unchk14"} unhandledsend_unchk14#107(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#97: address_t)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := 5000000000000000000;
	assume {:sourceloc "buggy_41.sol", 47, 5} {:message ""} true;
	call __send_ret#8 := __send(callee#97, __this, 0, call_arg#7);
	$return4:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 49, 3} {:message "balanceOf"} balanceOf#111: [address_t][address_t]int;
// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_41.sol", 50, 3} {:message "AO::bug_unchk30"} bug_unchk30#136(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 51, 1} {:message "receivers_unchk30"} receivers_unchk30#115: int;
	var {:sourceloc "buggy_41.sol", 52, 1} {:message "addr_unchk30"} addr_unchk30#118: address_t;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#115 := 0;
	addr_unchk30#118 := 0;
	call_arg#9 := 42000000000000000000;
	assume {:sourceloc "buggy_41.sol", 53, 6} {:message ""} true;
	call __send_ret#10 := __send(addr_unchk30#118, __this, 0, call_arg#9);
	if (!(__send_ret#10)) {
	receivers_unchk30#115 := (receivers_unchk30#115 + 1);
	}
	else {
	assume false;
	}

	$return5:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_41.sol", 58, 3} {:message "allowance"} allowance#142: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_41.sol", 61, 3} {:message "AO::bug_unchk31"} bug_unchk31#163(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 62, 1} {:message "addr_unchk31"} addr_unchk31#146: address_t;
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#146 := 0;
	call_arg#11 := 10000000000000000000;
	assume {:sourceloc "buggy_41.sol", 63, 6} {:message ""} true;
	call __send_ret#12 := __send(addr_unchk31#146, __this, 0, call_arg#11);
	if ((!(__send_ret#12) || (1 == 1))) {
	assume false;
	}

	$return6:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_41.sol", 69, 3} {:message "payedOut_unchk45"} payedOut_unchk45#174: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_41.sol", 71, 1} {:message "AO::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#174[__this];
	assume {:sourceloc "buggy_41.sol", 73, 3} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return7:
	// Function body ends here
}

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
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_41.sol", 78, 3} {:message "AO::callnotchecked_unchk13"} callnotchecked_unchk13#219(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#205: address_t)
{
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_41.sol", 79, 5} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(callee#205, __this, 1000000000000000000);
	if (__call_ret#14) {
	havoc name#39;
	havoc symbol#56;
	havoc decimals#80;
	havoc totalSupply#95;
	havoc balanceOf#111;
	havoc allowance#142;
	havoc payedOut_unchk45#174;
	havoc payedOut_unchk8#260;
	havoc winner_unchk8#262;
	havoc winAmount_unchk8#264;
	havoc payedOut_unchk44#496;
	havoc winner_unchk44#498;
	havoc winAmount_unchk44#500;
	havoc payedOut_unchk33#614;
	havoc __balance;
	}

	if (!(__call_ret#14)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return8:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_41.sol", 88, 5} {:message "AO::[constructor]"} __constructor#704(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#228: int, tokenName#230: int_arr_ptr, tokenSymbol#232: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#230 < __alloc_counter);
	assume (tokenSymbol#232 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#39 := name#39[__this := int_arr#constr(default_int_int(), 0)];
	symbol#56 := symbol#56[__this := int_arr#constr(default_int_int(), 0)];
	decimals#80 := decimals#80[__this := 18];
	totalSupply#95 := totalSupply#95[__this := 0];
	balanceOf#111 := balanceOf#111[__this := default_address_t_int()];
	allowance#142 := allowance#142[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#174 := payedOut_unchk45#174[__this := false];
	payedOut_unchk8#260 := payedOut_unchk8#260[__this := false];
	winner_unchk8#262 := winner_unchk8#262[__this := 0];
	winAmount_unchk8#264 := winAmount_unchk8#264[__this := 0];
	payedOut_unchk44#496 := payedOut_unchk44#496[__this := false];
	winner_unchk44#498 := winner_unchk44#498[__this := 0];
	winAmount_unchk44#500 := winAmount_unchk44#500[__this := 0];
	payedOut_unchk33#614 := payedOut_unchk33#614[__this := false];
	// Function body starts here
	totalSupply#95 := totalSupply#95[__this := (initialSupply#228 * 1000000000000000000)];
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][__msg_sender := totalSupply#95[__this]]];
	name#39 := name#39[__this := mem_arr_int[tokenName#230]];
	symbol#56 := symbol#56[__this := mem_arr_int[tokenSymbol#232]];
	$return9:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_41.sol", 98, 1} {:message "payedOut_unchk8"} payedOut_unchk8#260: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_41.sol", 99, 1} {:message "winner_unchk8"} winner_unchk8#262: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_41.sol", 100, 1} {:message "winAmount_unchk8"} winAmount_unchk8#264: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_41.sol", 102, 1} {:message "AO::sendToWinner_unchk8"} sendToWinner_unchk8#283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#260[__this]);
	assume {:sourceloc "buggy_41.sol", 104, 9} {:message ""} true;
	call __send_ret#16 := __send(winner_unchk8#262[__this], __this, 0, winAmount_unchk8#264[__this]);
	payedOut_unchk8#260 := payedOut_unchk8#260[__this := true];
	$return10:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_41.sol", 111, 5} {:message "AO::_transfer"} _transfer#363(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#286: address_t, _to#288: address_t, _value#290: int)
{
	var {:sourceloc "buggy_41.sol", 119, 9} {:message "previousBalances"} previousBalances#323: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#288 != 0);
	assume (balanceOf#111[__this][_from#286] >= _value#290);
	assume ((balanceOf#111[__this][_to#288] + _value#290) >= balanceOf#111[__this][_to#288]);
	previousBalances#323 := (balanceOf#111[__this][_from#286] + balanceOf#111[__this][_to#288]);
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][_from#286 := (balanceOf#111[__this][_from#286] - _value#290)]];
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][_to#288 := (balanceOf#111[__this][_to#288] + _value#290)]];
	assume {:sourceloc "buggy_41.sol", 124, 14} {:message ""} true;
	call Transfer#171(__this, __msg_sender, __msg_value, _from#286, _to#288, _value#290);
	assert {:sourceloc "buggy_41.sol", 126, 9} {:message "Assertion might not hold."} ((balanceOf#111[__this][_from#286] + balanceOf#111[__this][_to#288]) == previousBalances#323);
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_41.sol", 128, 1} {:message "AO::bug_unchk39"} bug_unchk39#375(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#365: address_t)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := 4000000000000000000;
	assume {:sourceloc "buggy_41.sol", 129, 8} {:message ""} true;
	call __send_ret#18 := __send(addr#365, __this, 0, call_arg#17);
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 139, 5} {:message "AO::transfer"} transfer#395(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#378: address_t, _value#380: int)
	returns (success#383: bool)
{
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 140, 9} {:message ""} true;
	call _transfer#363(__this, __msg_sender, __msg_value, call_arg#19, _to#378, _value#380);
	success#383 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_41.sol", 143, 1} {:message "AO::my_func_uncheck36"} my_func_uncheck36#410(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#397: address_t)
{
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_41.sol", 144, 3} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(dst#397, __this, __msg_value);
	if (__call_ret#20) {
	havoc name#39;
	havoc symbol#56;
	havoc decimals#80;
	havoc totalSupply#95;
	havoc balanceOf#111;
	havoc allowance#142;
	havoc payedOut_unchk45#174;
	havoc payedOut_unchk8#260;
	havoc winner_unchk8#262;
	havoc winAmount_unchk8#264;
	havoc payedOut_unchk44#496;
	havoc winner_unchk44#498;
	havoc winAmount_unchk44#500;
	havoc payedOut_unchk33#614;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 156, 5} {:message "AO::transferFrom"} transferFrom#451(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#413: address_t, _to#415: address_t, _value#417: int)
	returns (success#420: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#417 <= allowance#142[__this][_from#413][__msg_sender]);
	allowance#142 := allowance#142[__this := allowance#142[__this][_from#413 := allowance#142[__this][_from#413][__msg_sender := (allowance#142[__this][_from#413][__msg_sender] - _value#417)]]];
	assume {:sourceloc "buggy_41.sol", 159, 9} {:message ""} true;
	call _transfer#363(__this, __msg_sender, __msg_value, _from#413, _to#415, _value#417);
	success#420 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_41.sol", 162, 1} {:message "AO::my_func_unchk35"} my_func_unchk35#464(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#453: address_t)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_41.sol", 163, 9} {:message ""} true;
	call __send_ret#22 := __send(dst#453, __this, 0, __msg_value);
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 174, 5} {:message "AO::approve"} approve#493(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#467: address_t, _value#469: int)
	returns (success#472: bool)
{
	var call_arg#23: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#142 := allowance#142[__this := allowance#142[__this][__msg_sender := allowance#142[__this][__msg_sender][_spender#467 := _value#469]]];
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 177, 14} {:message ""} true;
	call Approval#203(__this, __msg_sender, __msg_value, call_arg#23, _spender#467, _value#469);
	success#472 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_41.sol", 180, 1} {:message "payedOut_unchk44"} payedOut_unchk44#496: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_41.sol", 181, 1} {:message "winner_unchk44"} winner_unchk44#498: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_41.sol", 182, 1} {:message "winAmount_unchk44"} winAmount_unchk44#500: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_41.sol", 184, 1} {:message "AO::sendToWinner_unchk44"} sendToWinner_unchk44#519(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#496[__this]);
	assume {:sourceloc "buggy_41.sol", 186, 9} {:message ""} true;
	call __send_ret#24 := __send(winner_unchk44#498[__this], __this, 0, winAmount_unchk44#500[__this]);
	payedOut_unchk44#496 := payedOut_unchk44#496[__this := true];
	$return18:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_41.sol", 199, 5} {:message "AO::approveAndCall"} approveAndCall#559(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#522: address_t, _value#524: int, _extraData#526: int_arr_ptr)
	returns (success#529: bool)
{
	var {:sourceloc "buggy_41.sol", 202, 9} {:message "spender"} spender#532: address_t;
	var approve#493_ret#25: bool;
	var call_arg#26: address_t;
	// TCC assumptions
	assume (_extraData#526 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#532 := _spender#522;
	assume {:sourceloc "buggy_41.sol", 203, 13} {:message ""} true;
	call approve#493_ret#25 := approve#493(__this, __msg_sender, __msg_value, _spender#522, _value#524);
	if (approve#493_ret#25) {
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 204, 13} {:message ""} true;
	call receiveApproval#12(spender#532, __this, 0, call_arg#26, _value#524, __this, _extraData#526);
	success#529 := true;
	goto $return19;
	}

	$return19:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_41.sol", 208, 1} {:message "AO::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#574(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 209, 4} {:message "addr_unchk40"} addr_unchk40#563: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#563 := 0;
	call_arg#27 := 2000000000000000000;
	assume {:sourceloc "buggy_41.sol", 210, 10} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk40#563, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	
	}
	else {
	
	}

	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 225, 5} {:message "AO::burn"} burn#611(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#577: int)
	returns (success#580: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#111[__this][__msg_sender] >= _value#577);
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][__msg_sender := (balanceOf#111[__this][__msg_sender] - _value#577)]];
	totalSupply#95 := totalSupply#95[__this := (totalSupply#95[__this] - _value#577)];
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 229, 14} {:message ""} true;
	call Burn#225(__this, __msg_sender, __msg_value, call_arg#29, _value#577);
	success#580 := true;
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_41.sol", 232, 1} {:message "payedOut_unchk33"} payedOut_unchk33#614: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_41.sol", 234, 1} {:message "AO::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#635(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#614[__this];
	assume {:sourceloc "buggy_41.sol", 236, 3} {:message ""} true;
	call __send_ret#30 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return22:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 247, 5} {:message "AO::burnFrom"} burnFrom#691(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#638: address_t, _value#640: int)
	returns (success#643: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#111[__this][_from#638] >= _value#640);
	assume (_value#640 <= allowance#142[__this][_from#638][__msg_sender]);
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][_from#638 := (balanceOf#111[__this][_from#638] - _value#640)]];
	allowance#142 := allowance#142[__this := allowance#142[__this][_from#638 := allowance#142[__this][_from#638][__msg_sender := (allowance#142[__this][_from#638][__msg_sender] - _value#640)]]];
	totalSupply#95 := totalSupply#95[__this := (totalSupply#95[__this] - _value#640)];
	assume {:sourceloc "buggy_41.sol", 253, 14} {:message ""} true;
	call Burn#225(__this, __msg_sender, __msg_value, _from#638, _value#640);
	success#643 := true;
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_41.sol", 256, 1} {:message "AO::bug_unchk27"} bug_unchk27#703(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#693: address_t)
{
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#31 := 42000000000000000000;
	assume {:sourceloc "buggy_41.sol", 257, 8} {:message ""} true;
	call __send_ret#32 := __send(addr#693, __this, 0, call_arg#31);
	$return24:
	// Function body ends here
}

