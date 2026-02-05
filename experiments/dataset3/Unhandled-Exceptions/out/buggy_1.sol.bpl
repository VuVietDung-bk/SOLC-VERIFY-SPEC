// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_1.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: EIP20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_1.sol", 79, 3} {:message "[event] EIP20Interface::Transfer"} Transfer#176(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#170: address_t, _to#172: address_t, _value#174: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_1.sol", 83, 3} {:message "[event] EIP20Interface::Approval"} Approval#198(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#192: address_t, _spender#194: address_t, _value#196: int)
{
	
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_1.sol", 17, 5} {:message "totalSupply"} totalSupply#4: [address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 21, 5} {:message "EIP20Interface::balanceOf"} balanceOf#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#7: address_t)
	returns (balance#10: int);
	modifies totalSupply#4, payedOut_unchk8#74, winner_unchk8#76, winAmount_unchk8#78, payedOut_unchk45#147;

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
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_1.sol", 22, 1} {:message "EIP20Interface::unhandledsend_unchk14"} unhandledsend_unchk14#24(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#14: address_t)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := 5000000000000000000;
	assume {:sourceloc "buggy_1.sol", 23, 5} {:message ""} true;
	call __send_ret#1 := __send(callee#14, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 30, 5} {:message "EIP20Interface::transfer"} transfer#34(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#27: address_t, _value#29: int)
	returns (success#32: bool);
	modifies totalSupply#4, payedOut_unchk8#74, winner_unchk8#76, winAmount_unchk8#78, payedOut_unchk45#147;

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_1.sol", 31, 1} {:message "EIP20Interface::bug_unchk30"} bug_unchk30#59(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 32, 1} {:message "receivers_unchk30"} receivers_unchk30#38: int;
	var {:sourceloc "buggy_1.sol", 33, 1} {:message "addr_unchk30"} addr_unchk30#41: address_t;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#38 := 0;
	addr_unchk30#41 := 0;
	call_arg#2 := 42000000000000000000;
	assume {:sourceloc "buggy_1.sol", 34, 6} {:message ""} true;
	call __send_ret#3 := __send(addr_unchk30#41, __this, 0, call_arg#2);
	if (!(__send_ret#3)) {
	receivers_unchk30#38 := (receivers_unchk30#38 + 1);
	}
	else {
	assume false;
	}

	$return1:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 45, 5} {:message "EIP20Interface::transferFrom"} transferFrom#71(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#62: address_t, _to#64: address_t, _value#66: int)
	returns (success#69: bool);
	modifies totalSupply#4, payedOut_unchk8#74, winner_unchk8#76, winAmount_unchk8#78, payedOut_unchk45#147;

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_1.sol", 46, 1} {:message "payedOut_unchk8"} payedOut_unchk8#74: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_1.sol", 47, 1} {:message "winner_unchk8"} winner_unchk8#76: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_1.sol", 48, 1} {:message "winAmount_unchk8"} winAmount_unchk8#78: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_1.sol", 50, 1} {:message "EIP20Interface::sendToWinner_unchk8"} sendToWinner_unchk8#97(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#74[__this]);
	assume {:sourceloc "buggy_1.sol", 52, 9} {:message ""} true;
	call __send_ret#4 := __send(winner_unchk8#76[__this], __this, 0, winAmount_unchk8#78[__this]);
	payedOut_unchk8#74 := payedOut_unchk8#74[__this := true];
	$return2:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 60, 5} {:message "EIP20Interface::approve"} approve#107(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#100: address_t, _value#102: int)
	returns (success#105: bool);
	modifies totalSupply#4, payedOut_unchk8#74, winner_unchk8#76, winAmount_unchk8#78, payedOut_unchk45#147;

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_1.sol", 61, 1} {:message "EIP20Interface::bug_unchk39"} bug_unchk39#119(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#109: address_t)
{
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#5 := 4000000000000000000;
	assume {:sourceloc "buggy_1.sol", 62, 8} {:message ""} true;
	call __send_ret#6 := __send(addr#109, __this, 0, call_arg#5);
	$return3:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 67, 5} {:message "EIP20Interface::allowance"} allowance#129(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#122: address_t, _spender#124: address_t)
	returns (remaining#127: int);
	modifies totalSupply#4, payedOut_unchk8#74, winner_unchk8#76, winAmount_unchk8#78, payedOut_unchk45#147;

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
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_1.sol", 68, 1} {:message "EIP20Interface::my_func_uncheck36"} my_func_uncheck36#144(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#131: address_t)
{
	var __call_ret#7: bool;
	var __call_ret#8: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_1.sol", 69, 3} {:message ""} true;
	call __call_ret#7, __call_ret#8 := __call(dst#131, __this, __msg_value);
	if (__call_ret#7) {
	havoc totalSupply#4;
	havoc payedOut_unchk8#74;
	havoc winner_unchk8#76;
	havoc winAmount_unchk8#78;
	havoc payedOut_unchk45#147;
	havoc __balance;
	}

	if (!(__call_ret#7)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_1.sol", 73, 3} {:message "payedOut_unchk45"} payedOut_unchk45#147: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_1.sol", 75, 1} {:message "EIP20Interface::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#168(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#147[__this];
	assume {:sourceloc "buggy_1.sol", 77, 3} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return5:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_1.sol", 80, 3} {:message "EIP20Interface::callnotchecked_unchk13"} callnotchecked_unchk13#190(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#178: address_t)
{
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_1.sol", 81, 5} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(callee#178, __this, 1000000000000000000);
	if (__call_ret#10) {
	havoc totalSupply#4;
	havoc payedOut_unchk8#74;
	havoc winner_unchk8#76;
	havoc winAmount_unchk8#78;
	havoc payedOut_unchk45#147;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_1.sol", 6, 1} {:message "EIP20Interface::[implicit_constructor]"} __constructor#199(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	totalSupply#4 := totalSupply#4[__this := 0];
	payedOut_unchk8#74 := payedOut_unchk8#74[__this := false];
	winner_unchk8#76 := winner_unchk8#76[__this := 0];
	winAmount_unchk8#78 := winAmount_unchk8#78[__this := 0];
	payedOut_unchk45#147 := payedOut_unchk45#147[__this := false];
}

// 
// ------- Contract: HotDollarsToken -------
// Inherits from: EIP20Interface
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_1.sol", 88, 3} {:message "HotDollarsToken::unhandledsend_unchk38"} unhandledsend_unchk38#220(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#210: address_t)
{
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#12 := 5000000000000000000;
	assume {:sourceloc "buggy_1.sol", 89, 5} {:message ""} true;
	call __send_ret#13 := __send(callee#210, __this, 0, call_arg#12);
	$return7:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 91, 3} {:message "balances"} balances#224: [address_t][address_t]int;
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_1.sol", 92, 3} {:message "HotDollarsToken::cash_unchk46"} cash_unchk46#248(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#226: int, subpotIndex#228: int, winner_unchk46#230: address_t)
{
	var {:sourceloc "buggy_1.sol", 93, 9} {:message "subpot_unchk46"} subpot_unchk46#234: int;
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#234 := 3000000000000000000;
	call_arg#14 := subpot_unchk46#234;
	assume {:sourceloc "buggy_1.sol", 94, 9} {:message ""} true;
	call __send_ret#15 := __send(winner_unchk46#230, __this, 0, call_arg#14);
	subpot_unchk46#234 := 0;
	$return8:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_1.sol", 97, 3} {:message "allowed"} allowed#254: [address_t][address_t][address_t]int;
// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_1.sol", 104, 3} {:message "HotDollarsToken::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#269(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 105, 4} {:message "addr_unchk4"} addr_unchk4#258: address_t;
	var call_arg#16: int;
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#258 := 0;
	call_arg#16 := 42000000000000000000;
	assume {:sourceloc "buggy_1.sol", 106, 10} {:message ""} true;
	call __send_ret#17 := __send(addr_unchk4#258, __this, 0, call_arg#16);
	if (!(__send_ret#17)) {
	
	}
	else {
	
	}

	$return9:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_1.sol", 113, 3} {:message "name"} name#271: [address_t]int_arr_type;
// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_1.sol", 114, 3} {:message "HotDollarsToken::bug_unchk7"} bug_unchk7#292(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 115, 1} {:message "addr_unchk7"} addr_unchk7#275: address_t;
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#275 := 0;
	call_arg#18 := 10000000000000000000;
	assume {:sourceloc "buggy_1.sol", 116, 6} {:message ""} true;
	call __send_ret#19 := __send(addr_unchk7#275, __this, 0, call_arg#18);
	if ((!(__send_ret#19) || (1 == 1))) {
	assume false;
	}

	$return10:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_1.sol", 119, 3} {:message "decimals"} decimals#294: [address_t]int;
// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_1.sol", 120, 3} {:message "HotDollarsToken::my_func_unchk23"} my_func_unchk23#307(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#296: address_t)
{
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_1.sol", 121, 9} {:message ""} true;
	call __send_ret#20 := __send(dst#296, __this, 0, __msg_value);
	$return11:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_1.sol", 123, 3} {:message "symbol"} symbol#309: [address_t]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_1.sol", 125, 5} {:message "HotDollarsToken::[constructor]"} __constructor#619(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances#224 := balances#224[__this := default_address_t_int()];
	allowed#254 := allowed#254[__this := default_address_t__k_address_t_v_int()];
	name#271 := name#271[__this := int_arr#constr(default_int_int(), 0)];
	decimals#294 := decimals#294[__this := 0];
	symbol#309 := symbol#309[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk44#396 := payedOut_unchk44#396[__this := false];
	winner_unchk44#398 := winner_unchk44#398[__this := 0];
	winAmount_unchk44#400 := winAmount_unchk44#400[__this := 0];
	payedOut_unchk33#518 := payedOut_unchk33#518[__this := false];
	totalSupply#4 := totalSupply#4[__this := 0];
	payedOut_unchk8#74 := payedOut_unchk8#74[__this := false];
	winner_unchk8#76 := winner_unchk8#76[__this := 0];
	winAmount_unchk8#78 := winAmount_unchk8#78[__this := 0];
	payedOut_unchk45#147 := payedOut_unchk45#147[__this := false];
	// Function body starts here
	totalSupply#4 := totalSupply#4[__this := 30000000000000000000000000000];
	name#271 := name#271[__this := int_arr#constr(default_int_int()[0 := 72][1 := 111][2 := 116][3 := 68][4 := 111][5 := 108][6 := 108][7 := 97][8 := 114][9 := 115][10 := 32][11 := 84][12 := 111][13 := 107][14 := 101][15 := 110], 16)];
	decimals#294 := decimals#294[__this := 18];
	symbol#309 := symbol#309[__this := int_arr#constr(default_int_int()[0 := 72][1 := 68][2 := 83], 3)];
	balances#224 := balances#224[__this := balances#224[__this][__msg_sender := totalSupply#4[__this]]];
	$return12:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_1.sol", 132, 1} {:message "HotDollarsToken::my_func_unchk35"} my_func_unchk35#351(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#340: address_t)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_1.sol", 133, 9} {:message ""} true;
	call __send_ret#21 := __send(dst#340, __this, 0, __msg_value);
	$return13:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 136, 5} {:message "HotDollarsToken::transfer"} transfer#393(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#353: address_t, _value#355: int)
	returns (success#359: bool)
{
	var call_arg#22: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#224[__this][__msg_sender] >= _value#355);
	balances#224 := balances#224[__this := balances#224[__this][__msg_sender := (balances#224[__this][__msg_sender] - _value#355)]];
	balances#224 := balances#224[__this := balances#224[__this][_to#353 := (balances#224[__this][_to#353] + _value#355)]];
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 140, 14} {:message ""} true;
	call Transfer#176(__this, __msg_sender, __msg_value, call_arg#22, _to#353, _value#355);
	success#359 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_1.sol", 143, 1} {:message "payedOut_unchk44"} payedOut_unchk44#396: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_1.sol", 144, 1} {:message "winner_unchk44"} winner_unchk44#398: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_1.sol", 145, 1} {:message "winAmount_unchk44"} winAmount_unchk44#400: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_1.sol", 147, 1} {:message "HotDollarsToken::sendToWinner_unchk44"} sendToWinner_unchk44#419(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#396[__this]);
	assume {:sourceloc "buggy_1.sol", 149, 9} {:message ""} true;
	call __send_ret#23 := __send(winner_unchk44#398[__this], __this, 0, winAmount_unchk44#400[__this]);
	payedOut_unchk44#396 := payedOut_unchk44#396[__this := true];
	$return15:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 153, 5} {:message "HotDollarsToken::transferFrom"} transferFrom#487(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#421: address_t, _to#423: address_t, _value#425: int)
	returns (success#429: bool)
{
	var {:sourceloc "buggy_1.sol", 154, 9} {:message "currentAllowance"} currentAllowance#432: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	currentAllowance#432 := allowed#254[__this][_from#421][__msg_sender];
	assume ((balances#224[__this][_from#421] >= _value#425) && (currentAllowance#432 >= _value#425));
	balances#224 := balances#224[__this := balances#224[__this][_to#423 := (balances#224[__this][_to#423] + _value#425)]];
	balances#224 := balances#224[__this := balances#224[__this][_from#421 := (balances#224[__this][_from#421] - _value#425)]];
	if ((currentAllowance#432 < 115792089237316195423570985008687907853269984665640564039457584007913129639935)) {
	allowed#254 := allowed#254[__this := allowed#254[__this][_from#421 := allowed#254[__this][_from#421][__msg_sender := (allowed#254[__this][_from#421][__msg_sender] - _value#425)]]];
	}

	assume {:sourceloc "buggy_1.sol", 161, 14} {:message ""} true;
	call Transfer#176(__this, __msg_sender, __msg_value, _from#421, _to#423, _value#425);
	success#429 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_1.sol", 164, 1} {:message "HotDollarsToken::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#502(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 165, 4} {:message "addr_unchk40"} addr_unchk40#491: address_t;
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#491 := 0;
	call_arg#24 := 2000000000000000000;
	assume {:sourceloc "buggy_1.sol", 166, 10} {:message ""} true;
	call __send_ret#25 := __send(addr_unchk40#491, __this, 0, call_arg#24);
	if (!(__send_ret#25)) {
	
	}
	else {
	
	}

	$return17:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 174, 5} {:message "HotDollarsToken::balanceOf"} balanceOf#515(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#504: address_t)
	returns (balance#508: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#508 := balances#224[__this][_owner#504];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_1.sol", 177, 1} {:message "payedOut_unchk33"} payedOut_unchk33#518: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_1.sol", 179, 1} {:message "HotDollarsToken::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#539(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#518[__this];
	assume {:sourceloc "buggy_1.sol", 181, 3} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return19:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 184, 5} {:message "HotDollarsToken::approve"} approve#568(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#541: address_t, _value#543: int)
	returns (success#547: bool)
{
	var call_arg#27: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#254 := allowed#254[__this := allowed#254[__this][__msg_sender := allowed#254[__this][__msg_sender][_spender#541 := _value#543]]];
	call_arg#27 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 186, 14} {:message ""} true;
	call Approval#198(__this, __msg_sender, __msg_value, call_arg#27, _spender#541, _value#543);
	success#547 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_1.sol", 189, 1} {:message "HotDollarsToken::bug_unchk27"} bug_unchk27#580(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#570: address_t)
{
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#28 := 42000000000000000000;
	assume {:sourceloc "buggy_1.sol", 190, 8} {:message ""} true;
	call __send_ret#29 := __send(addr#570, __this, 0, call_arg#28);
	$return21:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 192, 5} {:message "HotDollarsToken::allowance"} allowance#597(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#582: address_t, _spender#584: address_t)
	returns (remaining#588: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#588 := allowed#254[__this][_owner#582][_spender#584];
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_1.sol", 195, 1} {:message "HotDollarsToken::bug_unchk31"} bug_unchk31#618(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 196, 1} {:message "addr_unchk31"} addr_unchk31#601: address_t;
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#601 := 0;
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_1.sol", 197, 6} {:message ""} true;
	call __send_ret#31 := __send(addr_unchk31#601, __this, 0, call_arg#30);
	if ((!(__send_ret#31) || (1 == 1))) {
	assume false;
	}

	$return23:
	// Function body ends here
}

