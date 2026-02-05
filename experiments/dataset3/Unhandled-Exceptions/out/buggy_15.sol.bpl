// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_15.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_15.sol", 8, 5} {:message "tokenRecipient::receiveApproval"} receiveApproval#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#3: address_t, _value#5: int, _token#7: address_t, _extraData#9: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_15.sol", 7, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#13(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: MD -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_15.sol", 62, 3} {:message "[event] MD::Transfer"} Transfer#171(__this: address_t, __msg_sender: address_t, __msg_value: int, from#165: address_t, to#167: address_t, value#169: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_15.sol", 71, 3} {:message "[event] MD::Approval"} Approval#203(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#197: address_t, _spender#199: address_t, _value#201: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_15.sol", 77, 3} {:message "[event] MD::Burn"} Burn#223(__this: address_t, __msg_sender: address_t, __msg_value: int, from#219: address_t, value#221: int)
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
procedure {:sourceloc "buggy_15.sol", 13, 3} {:message "MD::cash_unchk46"} cash_unchk46#37(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#15: int, subpotIndex#17: int, winner_unchk46#19: address_t)
{
	var {:sourceloc "buggy_15.sol", 14, 9} {:message "subpot_unchk46"} subpot_unchk46#23: int;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#23 := 3000000000000000000;
	call_arg#0 := subpot_unchk46#23;
	assume {:sourceloc "buggy_15.sol", 15, 9} {:message ""} true;
	call __send_ret#1 := __send(winner_unchk46#19, __this, 0, call_arg#0);
	subpot_unchk46#23 := 0;
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_15.sol", 18, 3} {:message "name"} name#39: [address_t]int_arr_type;
// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_15.sol", 19, 3} {:message "MD::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#54(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 20, 4} {:message "addr_unchk4"} addr_unchk4#43: address_t;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#43 := 0;
	call_arg#2 := 42000000000000000000;
	assume {:sourceloc "buggy_15.sol", 21, 10} {:message ""} true;
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
var {:sourceloc "buggy_15.sol", 28, 3} {:message "symbol"} symbol#56: [address_t]int_arr_type;
// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_15.sol", 29, 3} {:message "MD::bug_unchk7"} bug_unchk7#77(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 30, 1} {:message "addr_unchk7"} addr_unchk7#60: address_t;
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#60 := 0;
	call_arg#4 := 10000000000000000000;
	assume {:sourceloc "buggy_15.sol", 31, 6} {:message ""} true;
	call __send_ret#5 := __send(addr_unchk7#60, __this, 0, call_arg#4);
	if ((!(__send_ret#5) || (1 == 1))) {
	assume false;
	}

	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_15.sol", 34, 3} {:message "decimals"} decimals#80: [address_t]int;
// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_15.sol", 36, 3} {:message "MD::my_func_unchk23"} my_func_unchk23#93(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#82: address_t)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_15.sol", 37, 9} {:message ""} true;
	call __send_ret#6 := __send(dst#82, __this, 0, __msg_value);
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_15.sol", 39, 3} {:message "totalSupply"} totalSupply#95: [address_t]int;
// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_15.sol", 42, 3} {:message "MD::unhandledsend_unchk14"} unhandledsend_unchk14#107(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#97: address_t)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := 5000000000000000000;
	assume {:sourceloc "buggy_15.sol", 43, 5} {:message ""} true;
	call __send_ret#8 := __send(callee#97, __this, 0, call_arg#7);
	$return4:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 45, 3} {:message "balanceOf"} balanceOf#111: [address_t][address_t]int;
// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_15.sol", 46, 3} {:message "MD::bug_unchk30"} bug_unchk30#136(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 47, 1} {:message "receivers_unchk30"} receivers_unchk30#115: int;
	var {:sourceloc "buggy_15.sol", 48, 1} {:message "addr_unchk30"} addr_unchk30#118: address_t;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#115 := 0;
	addr_unchk30#118 := 0;
	call_arg#9 := 42000000000000000000;
	assume {:sourceloc "buggy_15.sol", 49, 6} {:message ""} true;
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
var {:sourceloc "buggy_15.sol", 54, 3} {:message "allowance"} allowance#142: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_15.sol", 57, 3} {:message "MD::bug_unchk31"} bug_unchk31#163(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 58, 1} {:message "addr_unchk31"} addr_unchk31#146: address_t;
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#146 := 0;
	call_arg#11 := 10000000000000000000;
	assume {:sourceloc "buggy_15.sol", 59, 6} {:message ""} true;
	call __send_ret#12 := __send(addr_unchk31#146, __this, 0, call_arg#11);
	if ((!(__send_ret#12) || (1 == 1))) {
	assume false;
	}

	$return6:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_15.sol", 65, 3} {:message "payedOut_unchk45"} payedOut_unchk45#174: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_15.sol", 67, 1} {:message "MD::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#174[__this];
	assume {:sourceloc "buggy_15.sol", 69, 3} {:message ""} true;
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
procedure {:sourceloc "buggy_15.sol", 74, 3} {:message "MD::callnotchecked_unchk13"} callnotchecked_unchk13#217(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#205: address_t)
{
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_15.sol", 75, 5} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(callee#205, __this, 1000000000000000000);
	if (__call_ret#14) {
	havoc name#39;
	havoc symbol#56;
	havoc decimals#80;
	havoc totalSupply#95;
	havoc balanceOf#111;
	havoc allowance#142;
	havoc payedOut_unchk45#174;
	havoc payedOut_unchk8#258;
	havoc winner_unchk8#260;
	havoc winAmount_unchk8#262;
	havoc payedOut_unchk44#494;
	havoc winner_unchk44#496;
	havoc winAmount_unchk44#498;
	havoc payedOut_unchk33#612;
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
procedure {:sourceloc "buggy_15.sol", 84, 5} {:message "MD::[constructor]"} __constructor#702(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#226: int, tokenName#228: int_arr_ptr, tokenSymbol#230: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#228 < __alloc_counter);
	assume (tokenSymbol#230 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#39 := name#39[__this := int_arr#constr(default_int_int(), 0)];
	symbol#56 := symbol#56[__this := int_arr#constr(default_int_int(), 0)];
	decimals#80 := decimals#80[__this := 18];
	totalSupply#95 := totalSupply#95[__this := 0];
	balanceOf#111 := balanceOf#111[__this := default_address_t_int()];
	allowance#142 := allowance#142[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#174 := payedOut_unchk45#174[__this := false];
	payedOut_unchk8#258 := payedOut_unchk8#258[__this := false];
	winner_unchk8#260 := winner_unchk8#260[__this := 0];
	winAmount_unchk8#262 := winAmount_unchk8#262[__this := 0];
	payedOut_unchk44#494 := payedOut_unchk44#494[__this := false];
	winner_unchk44#496 := winner_unchk44#496[__this := 0];
	winAmount_unchk44#498 := winAmount_unchk44#498[__this := 0];
	payedOut_unchk33#612 := payedOut_unchk33#612[__this := false];
	// Function body starts here
	totalSupply#95 := totalSupply#95[__this := (initialSupply#226 * 1000000000000000000)];
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][__msg_sender := totalSupply#95[__this]]];
	name#39 := name#39[__this := mem_arr_int[tokenName#228]];
	symbol#56 := symbol#56[__this := mem_arr_int[tokenSymbol#230]];
	$return9:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_15.sol", 94, 1} {:message "payedOut_unchk8"} payedOut_unchk8#258: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_15.sol", 95, 1} {:message "winner_unchk8"} winner_unchk8#260: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_15.sol", 96, 1} {:message "winAmount_unchk8"} winAmount_unchk8#262: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_15.sol", 98, 1} {:message "MD::sendToWinner_unchk8"} sendToWinner_unchk8#281(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#258[__this]);
	assume {:sourceloc "buggy_15.sol", 100, 9} {:message ""} true;
	call __send_ret#16 := __send(winner_unchk8#260[__this], __this, 0, winAmount_unchk8#262[__this]);
	payedOut_unchk8#258 := payedOut_unchk8#258[__this := true];
	$return10:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_15.sol", 107, 5} {:message "MD::_transfer"} _transfer#361(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#284: address_t, _to#286: address_t, _value#288: int)
{
	var {:sourceloc "buggy_15.sol", 115, 9} {:message "previousBalances"} previousBalances#321: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#286 != 0);
	assume (balanceOf#111[__this][_from#284] >= _value#288);
	assume ((balanceOf#111[__this][_to#286] + _value#288) >= balanceOf#111[__this][_to#286]);
	previousBalances#321 := (balanceOf#111[__this][_from#284] + balanceOf#111[__this][_to#286]);
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][_from#284 := (balanceOf#111[__this][_from#284] - _value#288)]];
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][_to#286 := (balanceOf#111[__this][_to#286] + _value#288)]];
	assume {:sourceloc "buggy_15.sol", 120, 14} {:message ""} true;
	call Transfer#171(__this, __msg_sender, __msg_value, _from#284, _to#286, _value#288);
	assert {:sourceloc "buggy_15.sol", 122, 9} {:message "Assertion might not hold."} ((balanceOf#111[__this][_from#284] + balanceOf#111[__this][_to#286]) == previousBalances#321);
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_15.sol", 124, 1} {:message "MD::bug_unchk39"} bug_unchk39#373(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#363: address_t)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := 4000000000000000000;
	assume {:sourceloc "buggy_15.sol", 125, 8} {:message ""} true;
	call __send_ret#18 := __send(addr#363, __this, 0, call_arg#17);
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 135, 5} {:message "MD::transfer"} transfer#393(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#376: address_t, _value#378: int)
	returns (success#381: bool)
{
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 136, 9} {:message ""} true;
	call _transfer#361(__this, __msg_sender, __msg_value, call_arg#19, _to#376, _value#378);
	success#381 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_15.sol", 139, 1} {:message "MD::my_func_uncheck36"} my_func_uncheck36#408(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#395: address_t)
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
	assume {:sourceloc "buggy_15.sol", 140, 3} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(dst#395, __this, __msg_value);
	if (__call_ret#20) {
	havoc name#39;
	havoc symbol#56;
	havoc decimals#80;
	havoc totalSupply#95;
	havoc balanceOf#111;
	havoc allowance#142;
	havoc payedOut_unchk45#174;
	havoc payedOut_unchk8#258;
	havoc winner_unchk8#260;
	havoc winAmount_unchk8#262;
	havoc payedOut_unchk44#494;
	havoc winner_unchk44#496;
	havoc winAmount_unchk44#498;
	havoc payedOut_unchk33#612;
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
procedure {:sourceloc "buggy_15.sol", 152, 5} {:message "MD::transferFrom"} transferFrom#449(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#411: address_t, _to#413: address_t, _value#415: int)
	returns (success#418: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#415 <= allowance#142[__this][_from#411][__msg_sender]);
	allowance#142 := allowance#142[__this := allowance#142[__this][_from#411 := allowance#142[__this][_from#411][__msg_sender := (allowance#142[__this][_from#411][__msg_sender] - _value#415)]]];
	assume {:sourceloc "buggy_15.sol", 155, 9} {:message ""} true;
	call _transfer#361(__this, __msg_sender, __msg_value, _from#411, _to#413, _value#415);
	success#418 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_15.sol", 158, 1} {:message "MD::my_func_unchk35"} my_func_unchk35#462(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#451: address_t)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_15.sol", 159, 9} {:message ""} true;
	call __send_ret#22 := __send(dst#451, __this, 0, __msg_value);
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 170, 5} {:message "MD::approve"} approve#491(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#465: address_t, _value#467: int)
	returns (success#470: bool)
{
	var call_arg#23: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#142 := allowance#142[__this := allowance#142[__this][__msg_sender := allowance#142[__this][__msg_sender][_spender#465 := _value#467]]];
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 173, 14} {:message ""} true;
	call Approval#203(__this, __msg_sender, __msg_value, call_arg#23, _spender#465, _value#467);
	success#470 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_15.sol", 176, 1} {:message "payedOut_unchk44"} payedOut_unchk44#494: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_15.sol", 177, 1} {:message "winner_unchk44"} winner_unchk44#496: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_15.sol", 178, 1} {:message "winAmount_unchk44"} winAmount_unchk44#498: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_15.sol", 180, 1} {:message "MD::sendToWinner_unchk44"} sendToWinner_unchk44#517(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#494[__this]);
	assume {:sourceloc "buggy_15.sol", 182, 9} {:message ""} true;
	call __send_ret#24 := __send(winner_unchk44#496[__this], __this, 0, winAmount_unchk44#498[__this]);
	payedOut_unchk44#494 := payedOut_unchk44#494[__this := true];
	$return18:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_15.sol", 195, 5} {:message "MD::approveAndCall"} approveAndCall#557(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#520: address_t, _value#522: int, _extraData#524: int_arr_ptr)
	returns (success#527: bool)
{
	var {:sourceloc "buggy_15.sol", 198, 9} {:message "spender"} spender#530: address_t;
	var approve#491_ret#25: bool;
	var call_arg#26: address_t;
	// TCC assumptions
	assume (_extraData#524 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#530 := _spender#520;
	assume {:sourceloc "buggy_15.sol", 199, 13} {:message ""} true;
	call approve#491_ret#25 := approve#491(__this, __msg_sender, __msg_value, _spender#520, _value#522);
	if (approve#491_ret#25) {
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 200, 13} {:message ""} true;
	call receiveApproval#12(spender#530, __this, 0, call_arg#26, _value#522, __this, _extraData#524);
	success#527 := true;
	goto $return19;
	}

	$return19:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_15.sol", 204, 1} {:message "MD::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#572(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 205, 4} {:message "addr_unchk40"} addr_unchk40#561: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#561 := 0;
	call_arg#27 := 2000000000000000000;
	assume {:sourceloc "buggy_15.sol", 206, 10} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk40#561, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	
	}
	else {
	
	}

	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 221, 5} {:message "MD::burn"} burn#609(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#575: int)
	returns (success#578: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#111[__this][__msg_sender] >= _value#575);
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][__msg_sender := (balanceOf#111[__this][__msg_sender] - _value#575)]];
	totalSupply#95 := totalSupply#95[__this := (totalSupply#95[__this] - _value#575)];
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 225, 14} {:message ""} true;
	call Burn#223(__this, __msg_sender, __msg_value, call_arg#29, _value#575);
	success#578 := true;
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_15.sol", 228, 1} {:message "payedOut_unchk33"} payedOut_unchk33#612: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_15.sol", 230, 1} {:message "MD::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#633(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#612[__this];
	assume {:sourceloc "buggy_15.sol", 232, 3} {:message ""} true;
	call __send_ret#30 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return22:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 243, 5} {:message "MD::burnFrom"} burnFrom#689(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#636: address_t, _value#638: int)
	returns (success#641: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#111[__this][_from#636] >= _value#638);
	assume (_value#638 <= allowance#142[__this][_from#636][__msg_sender]);
	balanceOf#111 := balanceOf#111[__this := balanceOf#111[__this][_from#636 := (balanceOf#111[__this][_from#636] - _value#638)]];
	allowance#142 := allowance#142[__this := allowance#142[__this][_from#636 := allowance#142[__this][_from#636][__msg_sender := (allowance#142[__this][_from#636][__msg_sender] - _value#638)]]];
	totalSupply#95 := totalSupply#95[__this := (totalSupply#95[__this] - _value#638)];
	assume {:sourceloc "buggy_15.sol", 249, 14} {:message ""} true;
	call Burn#223(__this, __msg_sender, __msg_value, _from#636, _value#638);
	success#641 := true;
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_15.sol", 252, 1} {:message "MD::bug_unchk27"} bug_unchk27#701(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#691: address_t)
{
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#31 := 42000000000000000000;
	assume {:sourceloc "buggy_15.sol", 253, 8} {:message ""} true;
	call __send_ret#32 := __send(addr#691, __this, 0, call_arg#31);
	$return24:
	// Function body ends here
}

