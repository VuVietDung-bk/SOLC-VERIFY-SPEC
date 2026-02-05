// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_2.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: CareerOnToken -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_2.sol", 13, 3} {:message "[event] CareerOnToken::Transfer"} Transfer#30(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#24: address_t, _to#26: address_t, _value#28: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_2.sol", 20, 3} {:message "[event] CareerOnToken::Approval"} Approval#62(__this: address_t, __msg_sender: address_t, __msg_value: int, a_owner#56: address_t, _spender#58: address_t, _value#60: int)
{
	
}

// 
// Event: OwnerChang
procedure {:inline 1} {:sourceloc "buggy_2.sol", 24, 3} {:message "[event] CareerOnToken::OwnerChang"} OwnerChang#84(__this: address_t, __msg_sender: address_t, __msg_value: int, _old#78: address_t, _new#80: address_t, _coin_change#82: int)
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
procedure {:sourceloc "buggy_2.sol", 8, 3} {:message "CareerOnToken::bug_unchk31"} bug_unchk31#22(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 9, 1} {:message "addr_unchk31"} addr_unchk31#5: address_t;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#5 := 0;
	call_arg#0 := 10000000000000000000;
	assume {:sourceloc "buggy_2.sol", 10, 6} {:message ""} true;
	call __send_ret#1 := __send(addr_unchk31#5, __this, 0, call_arg#0);
	if ((!(__send_ret#1) || (1 == 1))) {
	assume false;
	}

	$return0:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_2.sol", 14, 3} {:message "payedOut_unchk45"} payedOut_unchk45#33: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_2.sol", 16, 1} {:message "CareerOnToken::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#54(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#33[__this];
	assume {:sourceloc "buggy_2.sol", 18, 5} {:message ""} true;
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
procedure {:sourceloc "buggy_2.sol", 21, 5} {:message "CareerOnToken::callnotchecked_unchk13"} callnotchecked_unchk13#76(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#64: address_t)
{
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_2.sol", 22, 9} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(callee#64, __this, 1000000000000000000);
	if (__call_ret#3) {
	havoc payedOut_unchk45#33;
	havoc payedOut_unchk20#87;
	havoc winner_unchk20#89;
	havoc winAmount_unchk20#91;
	havoc totalSupply#112;
	havoc payedOut_unchk32#115;
	havoc winner_unchk32#117;
	havoc winAmount_unchk32#119;
	havoc name#140;
	havoc decimals#154;
	havoc symbol#180;
	havoc owner#197;
	havoc balances#222;
	havoc allowed#241;
	havoc isTransPaused#256;
	havoc payedOut_unchk8#422;
	havoc winner_unchk8#424;
	havoc winAmount_unchk8#426;
	havoc payedOut_unchk44#682;
	havoc winner_unchk44#684;
	havoc winAmount_unchk44#686;
	havoc payedOut_unchk33#763;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_2.sol", 26, 3} {:message "payedOut_unchk20"} payedOut_unchk20#87: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_2.sol", 27, 1} {:message "winner_unchk20"} winner_unchk20#89: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_2.sol", 28, 1} {:message "winAmount_unchk20"} winAmount_unchk20#91: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_2.sol", 30, 1} {:message "CareerOnToken::sendToWinner_unchk20"} sendToWinner_unchk20#110(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#87[__this]);
	assume {:sourceloc "buggy_2.sol", 32, 9} {:message ""} true;
	call __send_ret#5 := __send(winner_unchk20#89[__this], __this, 0, winAmount_unchk20#91[__this]);
	payedOut_unchk20#87 := payedOut_unchk20#87[__this := true];
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_2.sol", 35, 3} {:message "totalSupply"} totalSupply#112: [address_t]int;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_2.sol", 36, 3} {:message "payedOut_unchk32"} payedOut_unchk32#115: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_2.sol", 37, 1} {:message "winner_unchk32"} winner_unchk32#117: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_2.sol", 38, 1} {:message "winAmount_unchk32"} winAmount_unchk32#119: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_2.sol", 40, 1} {:message "CareerOnToken::sendToWinner_unchk32"} sendToWinner_unchk32#138(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#115[__this]);
	assume {:sourceloc "buggy_2.sol", 42, 9} {:message ""} true;
	call __send_ret#6 := __send(winner_unchk32#117[__this], __this, 0, winAmount_unchk32#119[__this]);
	payedOut_unchk32#115 := payedOut_unchk32#115[__this := true];
	$return4:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_2.sol", 45, 3} {:message "name"} name#140: [address_t]int_arr_type;
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_2.sol", 46, 3} {:message "CareerOnToken::unhandledsend_unchk38"} unhandledsend_unchk38#152(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#142: address_t)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := 5000000000000000000;
	assume {:sourceloc "buggy_2.sol", 47, 5} {:message ""} true;
	call __send_ret#8 := __send(callee#142, __this, 0, call_arg#7);
	$return5:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_2.sol", 49, 3} {:message "decimals"} decimals#154: [address_t]int;
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_2.sol", 50, 3} {:message "CareerOnToken::cash_unchk46"} cash_unchk46#178(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#156: int, subpotIndex#158: int, winner_unchk46#160: address_t)
{
	var {:sourceloc "buggy_2.sol", 51, 9} {:message "subpot_unchk46"} subpot_unchk46#164: int;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#164 := 3000000000000000000;
	call_arg#9 := subpot_unchk46#164;
	assume {:sourceloc "buggy_2.sol", 52, 9} {:message ""} true;
	call __send_ret#10 := __send(winner_unchk46#160, __this, 0, call_arg#9);
	subpot_unchk46#164 := 0;
	$return6:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_2.sol", 55, 3} {:message "symbol"} symbol#180: [address_t]int_arr_type;
// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_2.sol", 56, 3} {:message "CareerOnToken::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 57, 4} {:message "addr_unchk4"} addr_unchk4#184: address_t;
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#184 := 0;
	call_arg#11 := 42000000000000000000;
	assume {:sourceloc "buggy_2.sol", 58, 10} {:message ""} true;
	call __send_ret#12 := __send(addr_unchk4#184, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	
	}
	else {
	
	}

	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_2.sol", 65, 3} {:message "owner"} owner#197: [address_t]address_t;
// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_2.sol", 66, 3} {:message "CareerOnToken::bug_unchk7"} bug_unchk7#218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 67, 1} {:message "addr_unchk7"} addr_unchk7#201: address_t;
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#201 := 0;
	call_arg#13 := 10000000000000000000;
	assume {:sourceloc "buggy_2.sol", 68, 6} {:message ""} true;
	call __send_ret#14 := __send(addr_unchk7#201, __this, 0, call_arg#13);
	if ((!(__send_ret#14) || (1 == 1))) {
	assume false;
	}

	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 71, 3} {:message "balances"} balances#222: [address_t][address_t]int;
// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_2.sol", 72, 3} {:message "CareerOnToken::my_func_unchk23"} my_func_unchk23#235(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#224: address_t)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_2.sol", 73, 9} {:message ""} true;
	call __send_ret#15 := __send(dst#224, __this, 0, __msg_value);
	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_2.sol", 75, 3} {:message "allowed"} allowed#241: [address_t][address_t][address_t]int;
// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_2.sol", 78, 3} {:message "CareerOnToken::unhandledsend_unchk14"} unhandledsend_unchk14#253(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#243: address_t)
{
	var call_arg#16: int;
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#16 := 5000000000000000000;
	assume {:sourceloc "buggy_2.sol", 79, 5} {:message ""} true;
	call __send_ret#17 := __send(callee#243, __this, 0, call_arg#16);
	$return10:
	// Function body ends here
}

// 
// State variable: isTransPaused: bool
var {:sourceloc "buggy_2.sol", 81, 3} {:message "isTransPaused"} isTransPaused#256: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_2.sol", 83, 5} {:message "CareerOnToken::[constructor]"} __constructor#804(__this: address_t, __msg_sender: address_t, __msg_value: int, _initialAmount#258: int, _decimalUnits#260: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk45#33 := payedOut_unchk45#33[__this := false];
	payedOut_unchk20#87 := payedOut_unchk20#87[__this := false];
	winner_unchk20#89 := winner_unchk20#89[__this := 0];
	winAmount_unchk20#91 := winAmount_unchk20#91[__this := 0];
	totalSupply#112 := totalSupply#112[__this := 0];
	payedOut_unchk32#115 := payedOut_unchk32#115[__this := false];
	winner_unchk32#117 := winner_unchk32#117[__this := 0];
	winAmount_unchk32#119 := winAmount_unchk32#119[__this := 0];
	name#140 := name#140[__this := int_arr#constr(default_int_int(), 0)];
	decimals#154 := decimals#154[__this := 0];
	symbol#180 := symbol#180[__this := int_arr#constr(default_int_int(), 0)];
	owner#197 := owner#197[__this := 0];
	balances#222 := balances#222[__this := default_address_t_int()];
	allowed#241 := allowed#241[__this := default_address_t__k_address_t_v_int()];
	isTransPaused#256 := isTransPaused#256[__this := false];
	payedOut_unchk8#422 := payedOut_unchk8#422[__this := false];
	winner_unchk8#424 := winner_unchk8#424[__this := 0];
	winAmount_unchk8#426 := winAmount_unchk8#426[__this := 0];
	payedOut_unchk44#682 := payedOut_unchk44#682[__this := false];
	winner_unchk44#684 := winner_unchk44#684[__this := 0];
	winAmount_unchk44#686 := winAmount_unchk44#686[__this := 0];
	payedOut_unchk33#763 := payedOut_unchk33#763[__this := false];
	// Function body starts here
	owner#197 := owner#197[__this := __msg_sender];
	if ((_initialAmount#258 <= 0)) {
	totalSupply#112 := totalSupply#112[__this := 100000000000000000];
	balances#222 := balances#222[__this := balances#222[__this][owner#197[__this] := totalSupply#112[__this]]];
	}
	else {
	totalSupply#112 := totalSupply#112[__this := _initialAmount#258];
	balances#222 := balances#222[__this := balances#222[__this][owner#197[__this] := _initialAmount#258]];
	}

	if ((_decimalUnits#260 <= 0)) {
	decimals#154 := decimals#154[__this := 2];
	}
	else {
	decimals#154 := decimals#154[__this := _decimalUnits#260];
	}

	name#140 := name#140[__this := int_arr#constr(default_int_int()[0 := 67][1 := 97][2 := 114][3 := 101][4 := 101][5 := 114][6 := 79][7 := 110][8 := 32][9 := 67][10 := 104][11 := 97][12 := 105][13 := 110][14 := 32][15 := 84][16 := 111][17 := 107][18 := 101][19 := 110], 20)];
	symbol#180 := symbol#180[__this := int_arr#constr(default_int_int()[0 := 67][1 := 79][2 := 84], 3)];
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_2.sol", 103, 1} {:message "CareerOnToken::bug_unchk30"} bug_unchk30#342(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 104, 1} {:message "receivers_unchk30"} receivers_unchk30#321: int;
	var {:sourceloc "buggy_2.sol", 105, 1} {:message "addr_unchk30"} addr_unchk30#324: address_t;
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#321 := 0;
	addr_unchk30#324 := 0;
	call_arg#18 := 42000000000000000000;
	assume {:sourceloc "buggy_2.sol", 106, 6} {:message ""} true;
	call __send_ret#19 := __send(addr_unchk30#324, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	receivers_unchk30#321 := (receivers_unchk30#321 + 1);
	}
	else {
	assume false;
	}

	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 113, 5} {:message "CareerOnToken::transfer"} transfer#419(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#344: address_t, _value#346: int)
	returns (success#349: bool)
{
	var call_arg#20: address_t;
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 117, 9} {:message "Assertion might not hold."} ((((_to#344 != __this) && !(isTransPaused#256[__this])) && (balances#222[__this][__msg_sender] >= _value#346)) && ((balances#222[__this][_to#344] + _value#346) > balances#222[__this][_to#344]));
	balances#222 := balances#222[__this := balances#222[__this][__msg_sender := (balances#222[__this][__msg_sender] - _value#346)]];
	balances#222 := balances#222[__this := balances#222[__this][_to#344 := (balances#222[__this][_to#344] + _value#346)]];
	if ((__msg_sender == owner#197[__this])) {
	call_arg#20 := __this;
	assume {:sourceloc "buggy_2.sol", 126, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, call_arg#20, _to#344, _value#346);
	}
	else {
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 128, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, call_arg#21, _to#344, _value#346);
	}

	success#349 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_2.sol", 132, 1} {:message "payedOut_unchk8"} payedOut_unchk8#422: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_2.sol", 133, 1} {:message "winner_unchk8"} winner_unchk8#424: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_2.sol", 134, 1} {:message "winAmount_unchk8"} winAmount_unchk8#426: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_2.sol", 136, 1} {:message "CareerOnToken::sendToWinner_unchk8"} sendToWinner_unchk8#445(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#422[__this]);
	assume {:sourceloc "buggy_2.sol", 138, 9} {:message ""} true;
	call __send_ret#22 := __send(winner_unchk8#424[__this], __this, 0, winAmount_unchk8#426[__this]);
	payedOut_unchk8#422 := payedOut_unchk8#422[__this := true];
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 143, 5} {:message "CareerOnToken::transferFrom"} transferFrom#539(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#447: address_t, _to#449: address_t, _value#451: int)
	returns (success#454: bool)
{
	var call_arg#23: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 148, 9} {:message "Assertion might not hold."} (((((_to#449 != __this) && !(isTransPaused#256[__this])) && (balances#222[__this][__msg_sender] >= _value#451)) && ((balances#222[__this][_to#449] + _value#451) > balances#222[__this][_to#449])) && (allowed#241[__this][_from#447][__msg_sender] >= _value#451));
	balances#222 := balances#222[__this := balances#222[__this][_to#449 := (balances#222[__this][_to#449] + _value#451)]];
	balances#222 := balances#222[__this := balances#222[__this][_from#447 := (balances#222[__this][_from#447] - _value#451)]];
	allowed#241 := allowed#241[__this := allowed#241[__this][_from#447 := allowed#241[__this][_from#447][__msg_sender := (allowed#241[__this][_from#447][__msg_sender] - _value#451)]]];
	if ((_from#447 == owner#197[__this])) {
	call_arg#23 := __this;
	assume {:sourceloc "buggy_2.sol", 159, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, call_arg#23, _to#449, _value#451);
	}
	else {
	assume {:sourceloc "buggy_2.sol", 161, 9} {:message ""} true;
	call Transfer#30(__this, __msg_sender, __msg_value, _from#447, _to#449, _value#451);
	}

	success#454 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_2.sol", 165, 1} {:message "CareerOnToken::bug_unchk39"} bug_unchk39#551(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#541: address_t)
{
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#24 := 4000000000000000000;
	assume {:sourceloc "buggy_2.sol", 166, 8} {:message ""} true;
	call __send_ret#25 := __send(addr#541, __this, 0, call_arg#24);
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 168, 5} {:message "CareerOnToken::approve"} approve#590(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#553: address_t, _value#555: int)
	returns (success#558: bool)
{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 170, 9} {:message "Assertion might not hold."} ((__msg_sender != _spender#553) && (_value#555 > 0));
	allowed#241 := allowed#241[__this := allowed#241[__this][__msg_sender := allowed#241[__this][__msg_sender][_spender#553 := _value#555]]];
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 172, 14} {:message ""} true;
	call Approval#62(__this, __msg_sender, __msg_value, call_arg#26, _spender#553, _value#555);
	success#558 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_2.sol", 175, 1} {:message "CareerOnToken::my_func_uncheck36"} my_func_uncheck36#605(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#592: address_t)
{
	var __call_ret#27: bool;
	var __call_ret#28: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_2.sol", 176, 5} {:message ""} true;
	call __call_ret#27, __call_ret#28 := __call(dst#592, __this, __msg_value);
	if (__call_ret#27) {
	havoc payedOut_unchk45#33;
	havoc payedOut_unchk20#87;
	havoc winner_unchk20#89;
	havoc winAmount_unchk20#91;
	havoc totalSupply#112;
	havoc payedOut_unchk32#115;
	havoc winner_unchk32#117;
	havoc winAmount_unchk32#119;
	havoc name#140;
	havoc decimals#154;
	havoc symbol#180;
	havoc owner#197;
	havoc balances#222;
	havoc allowed#241;
	havoc isTransPaused#256;
	havoc payedOut_unchk8#422;
	havoc winner_unchk8#424;
	havoc winAmount_unchk8#426;
	havoc payedOut_unchk44#682;
	havoc winner_unchk44#684;
	havoc winAmount_unchk44#686;
	havoc payedOut_unchk33#763;
	havoc __balance;
	}

	if (!(__call_ret#27)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_2.sol", 179, 5} {:message "CareerOnToken::allowance"} allowance#621(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#607: address_t, _spender#609: address_t)
	returns (remaining#612: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#612 := allowed#241[__this][_owner#607][_spender#609];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_2.sol", 185, 1} {:message "CareerOnToken::my_func_unchk35"} my_func_unchk35#634(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#623: address_t)
{
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_2.sol", 186, 9} {:message ""} true;
	call __send_ret#29 := __send(dst#623, __this, 0, __msg_value);
	$return20:
	// Function body ends here
}

// 
// Function: changeOwner : function (address)
procedure {:sourceloc "buggy_2.sol", 191, 2} {:message "CareerOnToken::changeOwner"} changeOwner#679(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#636: address_t)
{
	var call_arg#30: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 192, 9} {:message "Assertion might not hold."} ((__msg_sender == owner#197[__this]) && (__msg_sender != newOwner#636));
	balances#222 := balances#222[__this := balances#222[__this][newOwner#636 := balances#222[__this][owner#197[__this]]]];
	balances#222 := balances#222[__this := balances#222[__this][owner#197[__this] := 0]];
	owner#197 := owner#197[__this := newOwner#636];
	call_arg#30 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 196, 14} {:message ""} true;
	call OwnerChang#84(__this, __msg_sender, __msg_value, call_arg#30, newOwner#636, balances#222[__this][owner#197[__this]]);
	$return21:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_2.sol", 198, 1} {:message "payedOut_unchk44"} payedOut_unchk44#682: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_2.sol", 199, 1} {:message "winner_unchk44"} winner_unchk44#684: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_2.sol", 200, 1} {:message "winAmount_unchk44"} winAmount_unchk44#686: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_2.sol", 202, 1} {:message "CareerOnToken::sendToWinner_unchk44"} sendToWinner_unchk44#705(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#682[__this]);
	assume {:sourceloc "buggy_2.sol", 204, 9} {:message ""} true;
	call __send_ret#31 := __send(winner_unchk44#684[__this], __this, 0, winAmount_unchk44#686[__this]);
	payedOut_unchk44#682 := payedOut_unchk44#682[__this := true];
	$return22:
	// Function body ends here
}

// 
// Function: setPauseStatus : function (bool)
procedure {:sourceloc "buggy_2.sol", 209, 5} {:message "CareerOnToken::setPauseStatus"} setPauseStatus#722(__this: address_t, __msg_sender: address_t, __msg_value: int, isPaused#707: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 210, 9} {:message "Assertion might not hold."} (__msg_sender == owner#197[__this]);
	isTransPaused#256 := isTransPaused#256[__this := isPaused#707];
	$return23:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_2.sol", 213, 1} {:message "CareerOnToken::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#737(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 214, 4} {:message "addr_unchk40"} addr_unchk40#726: address_t;
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#726 := 0;
	call_arg#32 := 2000000000000000000;
	assume {:sourceloc "buggy_2.sol", 215, 10} {:message ""} true;
	call __send_ret#33 := __send(addr_unchk40#726, __this, 0, call_arg#32);
	if (!(__send_ret#33)) {
	
	}
	else {
	
	}

	$return24:
	// Function body ends here
}

// 
// Function: changeContractName : function (string memory,string memory)
procedure {:sourceloc "buggy_2.sol", 224, 5} {:message "CareerOnToken::changeContractName"} changeContractName#760(__this: address_t, __msg_sender: address_t, __msg_value: int, _newName#739: int_arr_ptr, _newSymbol#741: int_arr_ptr)
{
	// TCC assumptions
	assume (_newName#739 < __alloc_counter);
	assume (_newSymbol#741 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 225, 9} {:message "Assertion might not hold."} (__msg_sender == owner#197[__this]);
	name#140 := name#140[__this := mem_arr_int[_newName#739]];
	symbol#180 := symbol#180[__this := mem_arr_int[_newSymbol#741]];
	$return25:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_2.sol", 229, 1} {:message "payedOut_unchk33"} payedOut_unchk33#763: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_2.sol", 231, 1} {:message "CareerOnToken::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#784(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#763[__this];
	assume {:sourceloc "buggy_2.sol", 233, 5} {:message ""} true;
	call __send_ret#34 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return26:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_2.sol", 237, 5} {:message "CareerOnToken::[fallback]"} #791(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_2.sol", 240, 1} {:message "CareerOnToken::bug_unchk27"} bug_unchk27#803(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#793: address_t)
{
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#35 := 42000000000000000000;
	assume {:sourceloc "buggy_2.sol", 241, 8} {:message ""} true;
	call __send_ret#36 := __send(addr#793, __this, 0, call_arg#35);
	$return28:
	// Function body ends here
}

