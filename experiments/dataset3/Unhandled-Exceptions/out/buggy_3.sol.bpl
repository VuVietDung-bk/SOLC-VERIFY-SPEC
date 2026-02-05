// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_3.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: CareerOnToken -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_3.sol", 13, 3} {:message "[event] CareerOnToken::Transfer"} Transfer#30(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#24: address_t, _to#26: address_t, _value#28: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_3.sol", 20, 3} {:message "[event] CareerOnToken::Approval"} Approval#62(__this: address_t, __msg_sender: address_t, __msg_value: int, a_owner#56: address_t, _spender#58: address_t, _value#60: int)
{
	
}

// 
// Event: OwnerChang
procedure {:inline 1} {:sourceloc "buggy_3.sol", 24, 3} {:message "[event] CareerOnToken::OwnerChang"} OwnerChang#84(__this: address_t, __msg_sender: address_t, __msg_value: int, _old#78: address_t, _new#80: address_t, _coin_change#82: int)
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
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_3.sol", 8, 3} {:message "CareerOnToken::bug_unchk31"} bug_unchk31#22(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 9, 1} {:message "addr_unchk31"} addr_unchk31#5: address_t;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#5 := 0;
	call_arg#0 := 10000000000000000000;
	assume {:sourceloc "buggy_3.sol", 10, 6} {:message ""} true;
	call __send_ret#1 := __send(addr_unchk31#5, __this, 0, call_arg#0);
	if ((!(__send_ret#1) || (1 == 1))) {
	assume false;
	}

	$return0:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_3.sol", 14, 3} {:message "payedOut_unchk45"} payedOut_unchk45#33: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_3.sol", 16, 1} {:message "CareerOnToken::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#54(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#33[__this];
	assume {:sourceloc "buggy_3.sol", 18, 5} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return1:
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
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_3.sol", 21, 3} {:message "CareerOnToken::callnotchecked_unchk13"} callnotchecked_unchk13#76(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#64: address_t)
{
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_3.sol", 22, 9} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(callee#64, __this, 1000000000000000000);
	if (__call_ret#3) {
	havoc payedOut_unchk45#33;
	havoc totalSupply#98;
	havoc payedOut_unchk20#101;
	havoc winner_unchk20#103;
	havoc winAmount_unchk20#105;
	havoc name#126;
	havoc payedOut_unchk32#129;
	havoc winner_unchk32#131;
	havoc winAmount_unchk32#133;
	havoc decimals#154;
	havoc symbol#168;
	havoc owner#194;
	havoc balances#213;
	havoc allowed#240;
	havoc isTransPaused#256;
	havoc payedOut_unchk8#528;
	havoc winner_unchk8#530;
	havoc winAmount_unchk8#532;
	havoc payedOut_unchk44#706;
	havoc winner_unchk44#708;
	havoc winAmount_unchk44#710;
	havoc payedOut_unchk33#787;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return2:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 26, 3} {:message "CareerOnToken::unhandledsend_unchk26"} unhandledsend_unchk26#96(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#86: address_t)
{
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#5 := 5000000000000000000;
	assume {:sourceloc "buggy_3.sol", 27, 5} {:message ""} true;
	call __send_ret#6 := __send(callee#86, __this, 0, call_arg#5);
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_3.sol", 29, 3} {:message "totalSupply"} totalSupply#98: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_3.sol", 30, 3} {:message "payedOut_unchk20"} payedOut_unchk20#101: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_3.sol", 31, 1} {:message "winner_unchk20"} winner_unchk20#103: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_3.sol", 32, 1} {:message "winAmount_unchk20"} winAmount_unchk20#105: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_3.sol", 34, 1} {:message "CareerOnToken::sendToWinner_unchk20"} sendToWinner_unchk20#124(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#101[__this]);
	assume {:sourceloc "buggy_3.sol", 36, 9} {:message ""} true;
	call __send_ret#7 := __send(winner_unchk20#103[__this], __this, 0, winAmount_unchk20#105[__this]);
	payedOut_unchk20#101 := payedOut_unchk20#101[__this := true];
	$return4:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_3.sol", 39, 3} {:message "name"} name#126: [address_t]int_arr_type;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_3.sol", 40, 3} {:message "payedOut_unchk32"} payedOut_unchk32#129: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_3.sol", 41, 1} {:message "winner_unchk32"} winner_unchk32#131: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_3.sol", 42, 1} {:message "winAmount_unchk32"} winAmount_unchk32#133: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_3.sol", 44, 1} {:message "CareerOnToken::sendToWinner_unchk32"} sendToWinner_unchk32#152(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#129[__this]);
	assume {:sourceloc "buggy_3.sol", 46, 9} {:message ""} true;
	call __send_ret#8 := __send(winner_unchk32#131[__this], __this, 0, winAmount_unchk32#133[__this]);
	payedOut_unchk32#129 := payedOut_unchk32#129[__this := true];
	$return5:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_3.sol", 49, 3} {:message "decimals"} decimals#154: [address_t]int;
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 50, 3} {:message "CareerOnToken::unhandledsend_unchk38"} unhandledsend_unchk38#166(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#156: address_t)
{
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#9 := 5000000000000000000;
	assume {:sourceloc "buggy_3.sol", 51, 5} {:message ""} true;
	call __send_ret#10 := __send(callee#156, __this, 0, call_arg#9);
	$return6:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_3.sol", 53, 3} {:message "symbol"} symbol#168: [address_t]int_arr_type;
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_3.sol", 54, 3} {:message "CareerOnToken::cash_unchk46"} cash_unchk46#192(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#170: int, subpotIndex#172: int, winner_unchk46#174: address_t)
{
	var {:sourceloc "buggy_3.sol", 55, 9} {:message "subpot_unchk46"} subpot_unchk46#178: int;
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#178 := 3000000000000000000;
	call_arg#11 := subpot_unchk46#178;
	assume {:sourceloc "buggy_3.sol", 56, 9} {:message ""} true;
	call __send_ret#12 := __send(winner_unchk46#174, __this, 0, call_arg#11);
	subpot_unchk46#178 := 0;
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_3.sol", 59, 3} {:message "owner"} owner#194: [address_t]address_t;
// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_3.sol", 61, 3} {:message "CareerOnToken::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#209(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 62, 4} {:message "addr_unchk4"} addr_unchk4#198: address_t;
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#198 := 0;
	call_arg#13 := 42000000000000000000;
	assume {:sourceloc "buggy_3.sol", 63, 10} {:message ""} true;
	call __send_ret#14 := __send(addr_unchk4#198, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	
	}
	else {
	
	}

	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 70, 3} {:message "balances"} balances#213: [address_t][address_t]int;
// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_3.sol", 71, 3} {:message "CareerOnToken::bug_unchk7"} bug_unchk7#234(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 72, 1} {:message "addr_unchk7"} addr_unchk7#217: address_t;
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#217 := 0;
	call_arg#15 := 10000000000000000000;
	assume {:sourceloc "buggy_3.sol", 73, 6} {:message ""} true;
	call __send_ret#16 := __send(addr_unchk7#217, __this, 0, call_arg#15);
	if ((!(__send_ret#16) || (1 == 1))) {
	assume false;
	}

	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_3.sol", 76, 3} {:message "allowed"} allowed#240: [address_t][address_t][address_t]int;
// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 79, 3} {:message "CareerOnToken::my_func_unchk23"} my_func_unchk23#253(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#242: address_t)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_3.sol", 80, 9} {:message ""} true;
	call __send_ret#17 := __send(dst#242, __this, 0, __msg_value);
	$return10:
	// Function body ends here
}

// 
// State variable: isTransPaused: bool
var {:sourceloc "buggy_3.sol", 82, 3} {:message "isTransPaused"} isTransPaused#256: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 84, 5} {:message "CareerOnToken::[constructor]"} __constructor#828(__this: address_t, __msg_sender: address_t, __msg_value: int, _initialAmount#258: int, _decimalUnits#260: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk45#33 := payedOut_unchk45#33[__this := false];
	totalSupply#98 := totalSupply#98[__this := 0];
	payedOut_unchk20#101 := payedOut_unchk20#101[__this := false];
	winner_unchk20#103 := winner_unchk20#103[__this := 0];
	winAmount_unchk20#105 := winAmount_unchk20#105[__this := 0];
	name#126 := name#126[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk32#129 := payedOut_unchk32#129[__this := false];
	winner_unchk32#131 := winner_unchk32#131[__this := 0];
	winAmount_unchk32#133 := winAmount_unchk32#133[__this := 0];
	decimals#154 := decimals#154[__this := 0];
	symbol#168 := symbol#168[__this := int_arr#constr(default_int_int(), 0)];
	owner#194 := owner#194[__this := 0];
	balances#213 := balances#213[__this := default_address_t_int()];
	allowed#240 := allowed#240[__this := default_address_t__k_address_t_v_int()];
	isTransPaused#256 := isTransPaused#256[__this := false];
	payedOut_unchk8#528 := payedOut_unchk8#528[__this := false];
	winner_unchk8#530 := winner_unchk8#530[__this := 0];
	winAmount_unchk8#532 := winAmount_unchk8#532[__this := 0];
	payedOut_unchk44#706 := payedOut_unchk44#706[__this := false];
	winner_unchk44#708 := winner_unchk44#708[__this := 0];
	winAmount_unchk44#710 := winAmount_unchk44#710[__this := 0];
	payedOut_unchk33#787 := payedOut_unchk33#787[__this := false];
	// Function body starts here
	owner#194 := owner#194[__this := __msg_sender];
	if ((_initialAmount#258 <= 0)) {
	totalSupply#98 := totalSupply#98[__this := 100000000000000000];
	balances#213 := balances#213[__this := balances#213[__this][owner#194[__this] := totalSupply#98[__this]]];
	}
	else {
	totalSupply#98 := totalSupply#98[__this := _initialAmount#258];
	balances#213 := balances#213[__this := balances#213[__this][owner#194[__this] := _initialAmount#258]];
	}

	if ((_decimalUnits#260 <= 0)) {
	decimals#154 := decimals#154[__this := 2];
	}
	else {
	decimals#154 := decimals#154[__this := _decimalUnits#260];
	}

	name#126 := name#126[__this := int_arr#constr(default_int_int()[0 := 67][1 := 97][2 := 114][3 := 101][4 := 101][5 := 114][6 := 79][7 := 110][8 := 32][9 := 67][10 := 104][11 := 97][12 := 105][13 := 110][14 := 32][15 := 84][16 := 111][17 := 107][18 := 101][19 := 110], 20)];
	symbol#168 := symbol#168[__this := int_arr#constr(default_int_int()[0 := 67][1 := 79][2 := 84], 3)];
	$return11:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 104, 1} {:message "CareerOnToken::unhandledsend_unchk14"} unhandledsend_unchk14#329(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#319: address_t)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := 5000000000000000000;
	assume {:sourceloc "buggy_3.sol", 105, 5} {:message ""} true;
	call __send_ret#19 := __send(callee#319, __this, 0, call_arg#18);
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 109, 5} {:message "CareerOnToken::transfer"} transfer#406(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#331: address_t, _value#333: int)
	returns (success#336: bool)
{
	var call_arg#20: address_t;
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 113, 9} {:message "Assertion might not hold."} ((((_to#331 != __this) && !(isTransPaused#256[__this])) && (balances#213[__this][__msg_sender] >= _value#333)) && ((balances#213[__this][_to#331] + _value#333) > balances#213[__this][_to#331]));
	balances#213 := balances#213[__this := balances#213[__this][__msg_sender := (balances#213[__this][__msg_sender] - _value#333)]];
	balances#213 := balances#213[__this := balances#213[__this][_to#331 := (balances#213[__this][_to#331] + _value#333)]];
	if ((__msg_sender == owner#194[__this])) {
	call_arg#20 := __this;
	assume {:sourceloc "buggy_3.sol", 122, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, call_arg#20, _to#331, _value#333);
	}
	else {
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 124, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, call_arg#21, _to#331, _value#333);
	}

	success#336 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_3.sol", 128, 1} {:message "CareerOnToken::bug_unchk30"} bug_unchk30#431(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 129, 1} {:message "receivers_unchk30"} receivers_unchk30#410: int;
	var {:sourceloc "buggy_3.sol", 130, 1} {:message "addr_unchk30"} addr_unchk30#413: address_t;
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#410 := 0;
	addr_unchk30#413 := 0;
	call_arg#22 := 42000000000000000000;
	assume {:sourceloc "buggy_3.sol", 131, 6} {:message ""} true;
	call __send_ret#23 := __send(addr_unchk30#413, __this, 0, call_arg#22);
	if (!(__send_ret#23)) {
	receivers_unchk30#410 := (receivers_unchk30#410 + 1);
	}
	else {
	assume false;
	}

	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 138, 5} {:message "CareerOnToken::transferFrom"} transferFrom#525(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#433: address_t, _to#435: address_t, _value#437: int)
	returns (success#440: bool)
{
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 143, 9} {:message "Assertion might not hold."} (((((_to#435 != __this) && !(isTransPaused#256[__this])) && (balances#213[__this][__msg_sender] >= _value#437)) && ((balances#213[__this][_to#435] + _value#437) > balances#213[__this][_to#435])) && (allowed#240[__this][_from#433][__msg_sender] >= _value#437));
	balances#213 := balances#213[__this := balances#213[__this][_to#435 := (balances#213[__this][_to#435] + _value#437)]];
	balances#213 := balances#213[__this := balances#213[__this][_from#433 := (balances#213[__this][_from#433] - _value#437)]];
	allowed#240 := allowed#240[__this := allowed#240[__this][_from#433 := allowed#240[__this][_from#433][__msg_sender := (allowed#240[__this][_from#433][__msg_sender] - _value#437)]]];
	if ((_from#433 == owner#194[__this])) {
	call_arg#24 := __this;
	assume {:sourceloc "buggy_3.sol", 154, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, call_arg#24, _to#435, _value#437);
	}
	else {
	assume {:sourceloc "buggy_3.sol", 156, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, _from#433, _to#435, _value#437);
	}

	success#440 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_3.sol", 160, 1} {:message "payedOut_unchk8"} payedOut_unchk8#528: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_3.sol", 161, 1} {:message "winner_unchk8"} winner_unchk8#530: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_3.sol", 162, 1} {:message "winAmount_unchk8"} winAmount_unchk8#532: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_3.sol", 164, 1} {:message "CareerOnToken::sendToWinner_unchk8"} sendToWinner_unchk8#551(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#528[__this]);
	assume {:sourceloc "buggy_3.sol", 166, 9} {:message ""} true;
	call __send_ret#25 := __send(winner_unchk8#530[__this], __this, 0, winAmount_unchk8#532[__this]);
	payedOut_unchk8#528 := payedOut_unchk8#528[__this := true];
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 170, 5} {:message "CareerOnToken::approve"} approve#590(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#553: address_t, _value#555: int)
	returns (success#558: bool)
{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 172, 9} {:message "Assertion might not hold."} ((__msg_sender != _spender#553) && (_value#555 > 0));
	allowed#240 := allowed#240[__this := allowed#240[__this][__msg_sender := allowed#240[__this][__msg_sender][_spender#553 := _value#555]]];
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 174, 14} {:message ""} true;
	call Approval#62(__this, __msg_sender, __msg_value, call_arg#26, _spender#553, _value#555);
	success#558 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 177, 1} {:message "CareerOnToken::bug_unchk39"} bug_unchk39#602(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#592: address_t)
{
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#27 := 4000000000000000000;
	assume {:sourceloc "buggy_3.sol", 178, 8} {:message ""} true;
	call __send_ret#28 := __send(addr#592, __this, 0, call_arg#27);
	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 180, 5} {:message "CareerOnToken::allowance"} allowance#618(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#604: address_t, _spender#606: address_t)
	returns (remaining#609: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#609 := allowed#240[__this][_owner#604][_spender#606];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 186, 1} {:message "CareerOnToken::my_func_uncheck36"} my_func_uncheck36#633(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#620: address_t)
{
	var __call_ret#29: bool;
	var __call_ret#30: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_3.sol", 187, 5} {:message ""} true;
	call __call_ret#29, __call_ret#30 := __call(dst#620, __this, __msg_value);
	if (__call_ret#29) {
	havoc payedOut_unchk45#33;
	havoc totalSupply#98;
	havoc payedOut_unchk20#101;
	havoc winner_unchk20#103;
	havoc winAmount_unchk20#105;
	havoc name#126;
	havoc payedOut_unchk32#129;
	havoc winner_unchk32#131;
	havoc winAmount_unchk32#133;
	havoc decimals#154;
	havoc symbol#168;
	havoc owner#194;
	havoc balances#213;
	havoc allowed#240;
	havoc isTransPaused#256;
	havoc payedOut_unchk8#528;
	havoc winner_unchk8#530;
	havoc winAmount_unchk8#532;
	havoc payedOut_unchk44#706;
	havoc winner_unchk44#708;
	havoc winAmount_unchk44#710;
	havoc payedOut_unchk33#787;
	havoc __balance;
	}

	if (!(__call_ret#29)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return20:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 190, 5} {:message "CareerOnToken::balanceOf"} balanceOf#645(__this: address_t, __msg_sender: address_t, __msg_value: int, accountAddr#635: address_t)
	returns (#638: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#638 := balances#213[__this][accountAddr#635];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 193, 1} {:message "CareerOnToken::my_func_unchk35"} my_func_unchk35#658(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#647: address_t)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_3.sol", 194, 9} {:message ""} true;
	call __send_ret#31 := __send(dst#647, __this, 0, __msg_value);
	$return22:
	// Function body ends here
}

// 
// Function: changeOwner : function (address)
procedure {:sourceloc "buggy_3.sol", 199, 2} {:message "CareerOnToken::changeOwner"} changeOwner#703(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#660: address_t)
{
	var call_arg#32: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 200, 9} {:message "Assertion might not hold."} ((__msg_sender == owner#194[__this]) && (__msg_sender != newOwner#660));
	balances#213 := balances#213[__this := balances#213[__this][newOwner#660 := balances#213[__this][owner#194[__this]]]];
	balances#213 := balances#213[__this := balances#213[__this][owner#194[__this] := 0]];
	owner#194 := owner#194[__this := newOwner#660];
	call_arg#32 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 204, 14} {:message ""} true;
	call OwnerChang#84(__this, __msg_sender, __msg_value, call_arg#32, newOwner#660, balances#213[__this][owner#194[__this]]);
	$return23:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_3.sol", 206, 1} {:message "payedOut_unchk44"} payedOut_unchk44#706: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_3.sol", 207, 1} {:message "winner_unchk44"} winner_unchk44#708: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_3.sol", 208, 1} {:message "winAmount_unchk44"} winAmount_unchk44#710: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_3.sol", 210, 1} {:message "CareerOnToken::sendToWinner_unchk44"} sendToWinner_unchk44#729(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#706[__this]);
	assume {:sourceloc "buggy_3.sol", 212, 9} {:message ""} true;
	call __send_ret#33 := __send(winner_unchk44#708[__this], __this, 0, winAmount_unchk44#710[__this]);
	payedOut_unchk44#706 := payedOut_unchk44#706[__this := true];
	$return24:
	// Function body ends here
}

// 
// Function: setPauseStatus : function (bool)
procedure {:sourceloc "buggy_3.sol", 217, 5} {:message "CareerOnToken::setPauseStatus"} setPauseStatus#746(__this: address_t, __msg_sender: address_t, __msg_value: int, isPaused#731: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 218, 9} {:message "Assertion might not hold."} (__msg_sender == owner#194[__this]);
	isTransPaused#256 := isTransPaused#256[__this := isPaused#731];
	$return25:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_3.sol", 221, 1} {:message "CareerOnToken::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#761(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 222, 4} {:message "addr_unchk40"} addr_unchk40#750: address_t;
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#750 := 0;
	call_arg#34 := 2000000000000000000;
	assume {:sourceloc "buggy_3.sol", 223, 10} {:message ""} true;
	call __send_ret#35 := __send(addr_unchk40#750, __this, 0, call_arg#34);
	if (!(__send_ret#35)) {
	
	}
	else {
	
	}

	$return26:
	// Function body ends here
}

// 
// Function: changeContractName : function (string memory,string memory)
procedure {:sourceloc "buggy_3.sol", 232, 5} {:message "CareerOnToken::changeContractName"} changeContractName#784(__this: address_t, __msg_sender: address_t, __msg_value: int, _newName#763: int_arr_ptr, _newSymbol#765: int_arr_ptr)
{
	// TCC assumptions
	assume (_newName#763 < __alloc_counter);
	assume (_newSymbol#765 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 233, 9} {:message "Assertion might not hold."} (__msg_sender == owner#194[__this]);
	name#126 := name#126[__this := mem_arr_int[_newName#763]];
	symbol#168 := symbol#168[__this := mem_arr_int[_newSymbol#765]];
	$return27:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_3.sol", 237, 1} {:message "payedOut_unchk33"} payedOut_unchk33#787: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_3.sol", 239, 1} {:message "CareerOnToken::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#808(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#787[__this];
	assume {:sourceloc "buggy_3.sol", 241, 5} {:message ""} true;
	call __send_ret#36 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return28:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 245, 5} {:message "CareerOnToken::[fallback]"} #815(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return29:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_3.sol", 248, 1} {:message "CareerOnToken::bug_unchk27"} bug_unchk27#827(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#817: address_t)
{
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#37 := 42000000000000000000;
	assume {:sourceloc "buggy_3.sol", 249, 8} {:message ""} true;
	call __send_ret#38 := __send(addr#817, __this, 0, call_arg#37);
	$return30:
	// Function body ends here
}

