// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_5.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_5.sol", 24, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#58(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#54: address_t, newOwner#56: address_t)
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
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_5.sol", 8, 1} {:message "Ownable::bug_unchk42"} bug_unchk42#26(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 9, 1} {:message "receivers_unchk42"} receivers_unchk42#5: int;
	var {:sourceloc "buggy_5.sol", 10, 1} {:message "addr_unchk42"} addr_unchk42#8: address_t;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#5 := 0;
	addr_unchk42#8 := 0;
	call_arg#0 := 42000000000000000000;
	assume {:sourceloc "buggy_5.sol", 11, 6} {:message ""} true;
	call __send_ret#1 := __send(addr_unchk42#8, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	receivers_unchk42#5 := (receivers_unchk42#5 + 1);
	}
	else {
	assume false;
	}

	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_5.sol", 16, 3} {:message "owner"} owner#28: [address_t]address_t;
// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_5.sol", 18, 1} {:message "payedOut_unchk33"} payedOut_unchk33#31: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_5.sol", 20, 1} {:message "Ownable::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#52(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#31[__this];
	assume {:sourceloc "buggy_5.sol", 22, 3} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return1:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_5.sol", 31, 3} {:message "Ownable::[constructor]"} __constructor#146(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#28 := owner#28[__this := 0];
	payedOut_unchk33#31 := payedOut_unchk33#31[__this := false];
	payedOut_unchk20#122 := payedOut_unchk20#122[__this := false];
	winner_unchk20#124 := winner_unchk20#124[__this := 0];
	winAmount_unchk20#126 := winAmount_unchk20#126[__this := 0];
	// Function body starts here
	owner#28 := owner#28[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 34, 1} {:message "Ownable::unhandledsend_unchk26"} unhandledsend_unchk26#80(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#70: address_t)
{
	var call_arg#3: int;
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#3 := 5000000000000000000;
	assume {:sourceloc "buggy_5.sol", 35, 5} {:message ""} true;
	call __send_ret#4 := __send(callee#70, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_5.sol", 50, 3} {:message "Ownable::transferOwnership"} transferOwnership#119(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#95: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#28[__this]);
	// Function body starts here
	assume (newOwner#95 != 0);
	assume {:sourceloc "buggy_5.sol", 52, 10} {:message ""} true;
	call OwnershipTransferred#58(__this, __msg_sender, __msg_value, owner#28[__this], newOwner#95);
	owner#28 := owner#28[__this := newOwner#95];
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_5.sol", 55, 1} {:message "payedOut_unchk20"} payedOut_unchk20#122: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_5.sol", 56, 1} {:message "winner_unchk20"} winner_unchk20#124: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_5.sol", 57, 1} {:message "winAmount_unchk20"} winAmount_unchk20#126: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_5.sol", 59, 1} {:message "Ownable::sendToWinner_unchk20"} sendToWinner_unchk20#145(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#122[__this]);
	assume {:sourceloc "buggy_5.sol", 61, 9} {:message ""} true;
	call __send_ret#7 := __send(winner_unchk20#124[__this], __this, 0, winAmount_unchk20#126[__this]);
	payedOut_unchk20#122 := payedOut_unchk20#122[__this := true];
	$return6:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_5.sol", 101, 3} {:message "[event] TokenERC20::Transfer"} Transfer#276(__this: address_t, __msg_sender: address_t, __msg_value: int, from#270: address_t, to#272: address_t, value#274: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_5.sol", 109, 3} {:message "[event] TokenERC20::Approval"} Approval#305(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#299: address_t, _spender#301: address_t, _value#303: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_5.sol", 118, 3} {:message "[event] TokenERC20::Burn"} Burn#335(__this: address_t, __msg_sender: address_t, __msg_value: int, from#331: address_t, value#333: int)
{
	
}

// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 69, 3} {:message "TokenERC20::unhandledsend_unchk2"} unhandledsend_unchk2#158(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#148: address_t)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#8 := 5000000000000000000;
	assume {:sourceloc "buggy_5.sol", 70, 5} {:message ""} true;
	call __send_ret#9 := __send(callee#148, __this, 0, call_arg#8);
	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_5.sol", 72, 3} {:message "name"} name#160: [address_t]int_arr_type;
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_5.sol", 73, 3} {:message "TokenERC20::bug_unchk43"} bug_unchk43#181(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 74, 1} {:message "addr_unchk43"} addr_unchk43#164: address_t;
	var call_arg#10: int;
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#164 := 0;
	call_arg#10 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 75, 6} {:message ""} true;
	call __send_ret#11 := __send(addr_unchk43#164, __this, 0, call_arg#10);
	if ((!(__send_ret#11) || (1 == 1))) {
	assume false;
	}

	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_5.sol", 78, 3} {:message "symbol"} symbol#183: [address_t]int_arr_type;
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
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 79, 3} {:message "TokenERC20::my_func_uncheck48"} my_func_uncheck48#198(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#185: address_t)
{
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_5.sol", 80, 7} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(dst#185, __this, __msg_value);
	if (__call_ret#12) {
	havoc name#160;
	havoc symbol#183;
	havoc decimals#201;
	havoc totalSupply#220;
	havoc balanceOf#238;
	havoc allowance#256;
	havoc payedOut_unchk45#308;
	havoc payedOut_unchk32#370;
	havoc winner_unchk32#372;
	havoc winAmount_unchk32#374;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_5.sol", 82, 3} {:message "decimals"} decimals#201: [address_t]int;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_5.sol", 84, 3} {:message "TokenERC20::withdrawBal_unchk17"} withdrawBal_unchk17#218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 85, 2} {:message "Balances_unchk17"} Balances_unchk17#205: int;
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#205 := 0;
	call_arg#14 := Balances_unchk17#205;
	assume {:sourceloc "buggy_5.sol", 86, 5} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, call_arg#14);
	$return10:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_5.sol", 87, 3} {:message "totalSupply"} totalSupply#220: [address_t]int;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 90, 3} {:message "TokenERC20::callnotchecked_unchk37"} callnotchecked_unchk37#234(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#222: address_t)
{
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_5.sol", 91, 5} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(callee#222, __this, 1000000000000000000);
	if (__call_ret#16) {
	havoc name#160;
	havoc symbol#183;
	havoc decimals#201;
	havoc totalSupply#220;
	havoc balanceOf#238;
	havoc allowance#256;
	havoc payedOut_unchk45#308;
	havoc payedOut_unchk32#370;
	havoc winner_unchk32#372;
	havoc winAmount_unchk32#374;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return11:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 93, 3} {:message "balanceOf"} balanceOf#238: [address_t][address_t]int;
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 94, 3} {:message "TokenERC20::bug_unchk3"} bug_unchk3#250(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#240: address_t)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := 42000000000000000000;
	assume {:sourceloc "buggy_5.sol", 95, 8} {:message ""} true;
	call __send_ret#19 := __send(addr#240, __this, 0, call_arg#18);
	$return12:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_5.sol", 96, 3} {:message "allowance"} allowance#256: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 99, 3} {:message "TokenERC20::bug_unchk27"} bug_unchk27#268(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#258: address_t)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#20 := 42000000000000000000;
	assume {:sourceloc "buggy_5.sol", 100, 8} {:message ""} true;
	call __send_ret#21 := __send(addr#258, __this, 0, call_arg#20);
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_5.sol", 104, 3} {:message "TokenERC20::bug_unchk31"} bug_unchk31#297(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 105, 1} {:message "addr_unchk31"} addr_unchk31#280: address_t;
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#280 := 0;
	call_arg#22 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 106, 6} {:message ""} true;
	call __send_ret#23 := __send(addr_unchk31#280, __this, 0, call_arg#22);
	if ((!(__send_ret#23) || (1 == 1))) {
	assume false;
	}

	$return14:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_5.sol", 112, 3} {:message "payedOut_unchk45"} payedOut_unchk45#308: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_5.sol", 114, 1} {:message "TokenERC20::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#329(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#308[__this];
	assume {:sourceloc "buggy_5.sol", 116, 3} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return15:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_5.sol", 125, 5} {:message "TokenERC20::[constructor]"} __constructor#754(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#338: int, tokenName#340: int_arr_ptr, tokenSymbol#342: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#340 < __alloc_counter);
	assume (tokenSymbol#342 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#160 := name#160[__this := int_arr#constr(default_int_int(), 0)];
	symbol#183 := symbol#183[__this := int_arr#constr(default_int_int(), 0)];
	decimals#201 := decimals#201[__this := 18];
	totalSupply#220 := totalSupply#220[__this := 0];
	balanceOf#238 := balanceOf#238[__this := default_address_t_int()];
	allowance#256 := allowance#256[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#308 := payedOut_unchk45#308[__this := false];
	payedOut_unchk32#370 := payedOut_unchk32#370[__this := false];
	winner_unchk32#372 := winner_unchk32#372[__this := 0];
	winAmount_unchk32#374 := winAmount_unchk32#374[__this := 0];
	// Function body starts here
	totalSupply#220 := totalSupply#220[__this := (initialSupply#338 * 1000000000000000000)];
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][__msg_sender := totalSupply#220[__this]]];
	name#160 := name#160[__this := mem_arr_int[tokenName#340]];
	symbol#183 := symbol#183[__this := mem_arr_int[tokenSymbol#342]];
	$return16:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_5.sol", 135, 1} {:message "payedOut_unchk32"} payedOut_unchk32#370: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_5.sol", 136, 1} {:message "winner_unchk32"} winner_unchk32#372: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_5.sol", 137, 1} {:message "winAmount_unchk32"} winAmount_unchk32#374: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_5.sol", 139, 1} {:message "TokenERC20::sendToWinner_unchk32"} sendToWinner_unchk32#393(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#370[__this]);
	assume {:sourceloc "buggy_5.sol", 141, 9} {:message ""} true;
	call __send_ret#25 := __send(winner_unchk32#372[__this], __this, 0, winAmount_unchk32#374[__this]);
	payedOut_unchk32#370 := payedOut_unchk32#370[__this := true];
	$return17:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_5.sol", 148, 5} {:message "TokenERC20::_transfer"} _transfer#473(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#396: address_t, _to#398: address_t, _value#400: int)
{
	var {:sourceloc "buggy_5.sol", 156, 9} {:message "previousBalances"} previousBalances#433: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#398 != 0);
	assume (balanceOf#238[__this][_from#396] >= _value#400);
	assume ((balanceOf#238[__this][_to#398] + _value#400) > balanceOf#238[__this][_to#398]);
	previousBalances#433 := (balanceOf#238[__this][_from#396] + balanceOf#238[__this][_to#398]);
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][_from#396 := (balanceOf#238[__this][_from#396] - _value#400)]];
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][_to#398 := (balanceOf#238[__this][_to#398] + _value#400)]];
	assume {:sourceloc "buggy_5.sol", 161, 14} {:message ""} true;
	call Transfer#276(__this, __msg_sender, __msg_value, _from#396, _to#398, _value#400);
	assert {:sourceloc "buggy_5.sol", 163, 9} {:message "Assertion might not hold."} ((balanceOf#238[__this][_from#396] + balanceOf#238[__this][_to#398]) == previousBalances#433);
	$return18:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 165, 1} {:message "TokenERC20::unhandledsend_unchk38"} unhandledsend_unchk38#485(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#475: address_t)
{
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#26 := 5000000000000000000;
	assume {:sourceloc "buggy_5.sol", 166, 5} {:message ""} true;
	call __send_ret#27 := __send(callee#475, __this, 0, call_arg#26);
	$return19:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 177, 5} {:message "TokenERC20::transfer"} transfer#505(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#488: address_t, _value#490: int)
	returns (success#493: bool)
{
	var call_arg#28: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#28 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 178, 9} {:message ""} true;
	call _transfer#473(__this, __msg_sender, __msg_value, call_arg#28, _to#488, _value#490);
	success#493 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_5.sol", 181, 1} {:message "TokenERC20::cash_unchk46"} cash_unchk46#529(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#507: int, subpotIndex#509: int, winner_unchk46#511: address_t)
{
	var {:sourceloc "buggy_5.sol", 182, 9} {:message "subpot_unchk46"} subpot_unchk46#515: int;
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#515 := 3000000000000000000;
	call_arg#29 := subpot_unchk46#515;
	assume {:sourceloc "buggy_5.sol", 183, 9} {:message ""} true;
	call __send_ret#30 := __send(winner_unchk46#511, __this, 0, call_arg#29);
	subpot_unchk46#515 := 0;
	$return21:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 196, 5} {:message "TokenERC20::transferFrom"} transferFrom#570(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#532: address_t, _to#534: address_t, _value#536: int)
	returns (success#539: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#536 <= allowance#256[__this][_from#532][__msg_sender]);
	allowance#256 := allowance#256[__this := allowance#256[__this][_from#532 := allowance#256[__this][_from#532][__msg_sender := (allowance#256[__this][_from#532][__msg_sender] - _value#536)]]];
	assume {:sourceloc "buggy_5.sol", 199, 9} {:message ""} true;
	call _transfer#473(__this, __msg_sender, __msg_value, _from#532, _to#534, _value#536);
	success#539 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_5.sol", 202, 1} {:message "TokenERC20::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#585(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 203, 4} {:message "addr_unchk4"} addr_unchk4#574: address_t;
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#574 := 0;
	call_arg#31 := 42000000000000000000;
	assume {:sourceloc "buggy_5.sol", 204, 10} {:message ""} true;
	call __send_ret#32 := __send(addr_unchk4#574, __this, 0, call_arg#31);
	if (!(__send_ret#32)) {
	
	}
	else {
	
	}

	$return23:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 220, 5} {:message "TokenERC20::approve"} approve#614(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#588: address_t, _value#590: int)
	returns (success#593: bool)
{
	var call_arg#33: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#256 := allowance#256[__this := allowance#256[__this][__msg_sender := allowance#256[__this][__msg_sender][_spender#588 := _value#590]]];
	call_arg#33 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 223, 14} {:message ""} true;
	call Approval#305(__this, __msg_sender, __msg_value, call_arg#33, _spender#588, _value#590);
	success#593 := true;
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_5.sol", 226, 1} {:message "TokenERC20::bug_unchk7"} bug_unchk7#635(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 227, 1} {:message "addr_unchk7"} addr_unchk7#618: address_t;
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#618 := 0;
	call_arg#34 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 228, 6} {:message ""} true;
	call __send_ret#35 := __send(addr_unchk7#618, __this, 0, call_arg#34);
	if ((!(__send_ret#35) || (1 == 1))) {
	assume false;
	}

	$return25:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 243, 5} {:message "TokenERC20::burn"} burn#672(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#638: int)
	returns (success#641: bool)
{
	var call_arg#36: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#238[__this][__msg_sender] >= _value#638);
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][__msg_sender := (balanceOf#238[__this][__msg_sender] - _value#638)]];
	totalSupply#220 := totalSupply#220[__this := (totalSupply#220[__this] - _value#638)];
	call_arg#36 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 247, 14} {:message ""} true;
	call Burn#335(__this, __msg_sender, __msg_value, call_arg#36, _value#638);
	success#641 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 250, 1} {:message "TokenERC20::my_func_unchk23"} my_func_unchk23#685(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#674: address_t)
{
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 251, 9} {:message ""} true;
	call __send_ret#37 := __send(dst#674, __this, 0, __msg_value);
	$return27:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 262, 5} {:message "TokenERC20::burnFrom"} burnFrom#741(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#688: address_t, _value#690: int)
	returns (success#693: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#238[__this][_from#688] >= _value#690);
	assume (_value#690 <= allowance#256[__this][_from#688][__msg_sender]);
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][_from#688 := (balanceOf#238[__this][_from#688] - _value#690)]];
	allowance#256 := allowance#256[__this := allowance#256[__this][_from#688 := allowance#256[__this][_from#688][__msg_sender := (allowance#256[__this][_from#688][__msg_sender] - _value#690)]]];
	totalSupply#220 := totalSupply#220[__this := (totalSupply#220[__this] - _value#690)];
	assume {:sourceloc "buggy_5.sol", 268, 14} {:message ""} true;
	call Burn#335(__this, __msg_sender, __msg_value, _from#688, _value#690);
	success#693 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 271, 1} {:message "TokenERC20::unhandledsend_unchk14"} unhandledsend_unchk14#753(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#743: address_t)
{
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#38 := 5000000000000000000;
	assume {:sourceloc "buggy_5.sol", 272, 5} {:message ""} true;
	call __send_ret#39 := __send(callee#743, __this, 0, call_arg#38);
	$return29:
	// Function body ends here
}

// 
// ------- Contract: TTC -------
// Inherits from: Ownable
// Inherits from: TokenERC20
// 
// Event: FrozenFunds
procedure {:inline 1} {:sourceloc "buggy_5.sol", 305, 3} {:message "[event] TTC::FrozenFunds"} FrozenFunds#845(__this: address_t, __msg_sender: address_t, __msg_value: int, target#841: address_t, frozen#843: bool)
{
	
}

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_5.sol", 282, 3} {:message "payedOut_unchk9"} payedOut_unchk9#761: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_5.sol", 284, 1} {:message "TTC::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#782(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#761[__this];
	assume {:sourceloc "buggy_5.sol", 286, 3} {:message ""} true;
	call __send_ret#40 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return30:
	// Function body ends here
}

// 
// State variable: sellPrice: uint256
var {:sourceloc "buggy_5.sol", 288, 3} {:message "sellPrice"} sellPrice#784: [address_t]int;
// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 289, 3} {:message "TTC::callnotchecked_unchk25"} callnotchecked_unchk25#798(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#786: address_t)
{
	var __call_ret#41: bool;
	var __call_ret#42: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_5.sol", 290, 5} {:message ""} true;
	call __call_ret#41, __call_ret#42 := __call(callee#786, __this, 1000000000000000000);
	if (__call_ret#41) {
	havoc payedOut_unchk9#761;
	havoc sellPrice#784;
	havoc buyPrice#800;
	havoc frozenAccount#825;
	havoc payedOut_unchk8#960;
	havoc winner_unchk8#962;
	havoc winAmount_unchk8#964;
	havoc payedOut_unchk44#1131;
	havoc winner_unchk44#1133;
	havoc winAmount_unchk44#1135;
	havoc name#160;
	havoc symbol#183;
	havoc decimals#201;
	havoc totalSupply#220;
	havoc balanceOf#238;
	havoc allowance#256;
	havoc payedOut_unchk45#308;
	havoc payedOut_unchk32#370;
	havoc winner_unchk32#372;
	havoc winAmount_unchk32#374;
	havoc owner#28;
	havoc payedOut_unchk33#31;
	havoc payedOut_unchk20#122;
	havoc winner_unchk20#124;
	havoc winAmount_unchk20#126;
	havoc __balance;
	}

	if (!(__call_ret#41)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return31:
	// Function body ends here
}

// 
// State variable: buyPrice: uint256
var {:sourceloc "buggy_5.sol", 292, 3} {:message "buyPrice"} buyPrice#800: [address_t]int;
// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_5.sol", 294, 3} {:message "TTC::bug_unchk19"} bug_unchk19#821(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 295, 1} {:message "addr_unchk19"} addr_unchk19#804: address_t;
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#804 := 0;
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 296, 6} {:message ""} true;
	call __send_ret#44 := __send(addr_unchk19#804, __this, 0, call_arg#43);
	if ((!(__send_ret#44) || (1 == 1))) {
	assume false;
	}

	$return32:
	// Function body ends here
}

// 
// State variable: frozenAccount: mapping(address => bool)
var {:sourceloc "buggy_5.sol", 299, 3} {:message "frozenAccount"} frozenAccount#825: [address_t][address_t]bool;
// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_5.sol", 302, 3} {:message "TTC::callnotchecked_unchk13"} callnotchecked_unchk13#839(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#827: address_t)
{
	var __call_ret#45: bool;
	var __call_ret#46: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_5.sol", 303, 5} {:message ""} true;
	call __call_ret#45, __call_ret#46 := __call(callee#827, __this, 1000000000000000000);
	if (__call_ret#45) {
	havoc payedOut_unchk9#761;
	havoc sellPrice#784;
	havoc buyPrice#800;
	havoc frozenAccount#825;
	havoc payedOut_unchk8#960;
	havoc winner_unchk8#962;
	havoc winAmount_unchk8#964;
	havoc payedOut_unchk44#1131;
	havoc winner_unchk44#1133;
	havoc winAmount_unchk44#1135;
	havoc name#160;
	havoc symbol#183;
	havoc decimals#201;
	havoc totalSupply#220;
	havoc balanceOf#238;
	havoc allowance#256;
	havoc payedOut_unchk45#308;
	havoc payedOut_unchk32#370;
	havoc winner_unchk32#372;
	havoc winAmount_unchk32#374;
	havoc owner#28;
	havoc payedOut_unchk33#31;
	havoc payedOut_unchk20#122;
	havoc winner_unchk20#124;
	havoc winAmount_unchk20#126;
	havoc __balance;
	}

	if (!(__call_ret#45)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return33:
	// Function body ends here
}

function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_5.sol", 308, 5} {:message "TTC::[constructor]"} __constructor#1214(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#847: int, tokenName#849: int_arr_ptr, tokenSymbol#851: int_arr_ptr)
{
	var initialSupply#338#47: int;
	var tokenName#340#47: int_arr_ptr;
	var tokenSymbol#342#47: int_arr_ptr;
	// TCC assumptions
	assume (tokenName#849 < __alloc_counter);
	assume (tokenSymbol#851 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk9#761 := payedOut_unchk9#761[__this := false];
	sellPrice#784 := sellPrice#784[__this := 0];
	buyPrice#800 := buyPrice#800[__this := 0];
	frozenAccount#825 := frozenAccount#825[__this := default_address_t_bool()];
	payedOut_unchk8#960 := payedOut_unchk8#960[__this := false];
	winner_unchk8#962 := winner_unchk8#962[__this := 0];
	winAmount_unchk8#964 := winAmount_unchk8#964[__this := 0];
	payedOut_unchk44#1131 := payedOut_unchk44#1131[__this := false];
	winner_unchk44#1133 := winner_unchk44#1133[__this := 0];
	winAmount_unchk44#1135 := winAmount_unchk44#1135[__this := 0];
	name#160 := name#160[__this := int_arr#constr(default_int_int(), 0)];
	symbol#183 := symbol#183[__this := int_arr#constr(default_int_int(), 0)];
	decimals#201 := decimals#201[__this := 18];
	totalSupply#220 := totalSupply#220[__this := 0];
	balanceOf#238 := balanceOf#238[__this := default_address_t_int()];
	allowance#256 := allowance#256[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk45#308 := payedOut_unchk45#308[__this := false];
	payedOut_unchk32#370 := payedOut_unchk32#370[__this := false];
	winner_unchk32#372 := winner_unchk32#372[__this := 0];
	winAmount_unchk32#374 := winAmount_unchk32#374[__this := 0];
	owner#28 := owner#28[__this := 0];
	payedOut_unchk33#31 := payedOut_unchk33#31[__this := false];
	payedOut_unchk20#122 := payedOut_unchk20#122[__this := false];
	winner_unchk20#124 := winner_unchk20#124[__this := 0];
	winAmount_unchk20#126 := winAmount_unchk20#126[__this := 0];
	// Arguments for TokenERC20
	initialSupply#338#47 := initialSupply#847;
	tokenName#340#47 := tokenName#849;
	tokenSymbol#342#47 := tokenSymbol#851;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#28 := owner#28[__this := __msg_sender];
	$return34:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	totalSupply#220 := totalSupply#220[__this := (initialSupply#338#47 * 1000000000000000000)];
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][__msg_sender := totalSupply#220[__this]]];
	name#160 := name#160[__this := mem_arr_int[tokenName#340#47]];
	symbol#183 := symbol#183[__this := mem_arr_int[tokenSymbol#342#47]];
	$return35:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_5.sol", 313, 1} {:message "TTC::bug_unchk30"} bug_unchk30#885(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 314, 1} {:message "receivers_unchk30"} receivers_unchk30#864: int;
	var {:sourceloc "buggy_5.sol", 315, 1} {:message "addr_unchk30"} addr_unchk30#867: address_t;
	var call_arg#50: int;
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#864 := 0;
	addr_unchk30#867 := 0;
	call_arg#50 := 42000000000000000000;
	assume {:sourceloc "buggy_5.sol", 316, 6} {:message ""} true;
	call __send_ret#51 := __send(addr_unchk30#867, __this, 0, call_arg#50);
	if (!(__send_ret#51)) {
	receivers_unchk30#864 := (receivers_unchk30#864 + 1);
	}
	else {
	assume false;
	}

	$return37:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_5.sol", 323, 5} {:message "TTC::_transfer"} _transfer#957(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#887: address_t, _to#889: address_t, _value#891: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#889 != 0);
	assume (balanceOf#238[__this][_from#887] >= _value#891);
	assume ((balanceOf#238[__this][_to#889] + _value#891) >= balanceOf#238[__this][_to#889]);
	assume !(frozenAccount#825[__this][_from#887]);
	assume !(frozenAccount#825[__this][_to#889]);
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][_from#887 := (balanceOf#238[__this][_from#887] - _value#891)]];
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][_to#889 := (balanceOf#238[__this][_to#889] + _value#891)]];
	assume {:sourceloc "buggy_5.sol", 331, 14} {:message ""} true;
	call Transfer#276(__this, __msg_sender, __msg_value, _from#887, _to#889, _value#891);
	$return38:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_5.sol", 333, 1} {:message "payedOut_unchk8"} payedOut_unchk8#960: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_5.sol", 334, 1} {:message "winner_unchk8"} winner_unchk8#962: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_5.sol", 335, 1} {:message "winAmount_unchk8"} winAmount_unchk8#964: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_5.sol", 337, 1} {:message "TTC::sendToWinner_unchk8"} sendToWinner_unchk8#983(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#960[__this]);
	assume {:sourceloc "buggy_5.sol", 339, 9} {:message ""} true;
	call __send_ret#52 := __send(winner_unchk8#962[__this], __this, 0, winAmount_unchk8#964[__this]);
	payedOut_unchk8#960 := payedOut_unchk8#960[__this := true];
	$return39:
	// Function body ends here
}

// 
// Function: mintToken : function (address,uint256)
procedure {:sourceloc "buggy_5.sol", 346, 5} {:message "TTC::mintToken"} mintToken#1025(__this: address_t, __msg_sender: address_t, __msg_value: int, target#986: address_t, mintedAmount#988: int)
{
	var call_arg#55: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#28[__this]);
	// Function body starts here
	balanceOf#238 := balanceOf#238[__this := balanceOf#238[__this][target#986 := (balanceOf#238[__this][target#986] + mintedAmount#988)]];
	totalSupply#220 := totalSupply#220[__this := (totalSupply#220[__this] + mintedAmount#988)];
	call_arg#55 := 0;
	assume {:sourceloc "buggy_5.sol", 349, 14} {:message ""} true;
	call Transfer#276(__this, __msg_sender, __msg_value, call_arg#55, __this, mintedAmount#988);
	assume {:sourceloc "buggy_5.sol", 350, 14} {:message ""} true;
	call Transfer#276(__this, __msg_sender, __msg_value, __this, target#986, mintedAmount#988);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 352, 1} {:message "TTC::bug_unchk39"} bug_unchk39#1037(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1027: address_t)
{
	var call_arg#56: int;
	var __send_ret#57: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#56 := 4000000000000000000;
	assume {:sourceloc "buggy_5.sol", 353, 8} {:message ""} true;
	call __send_ret#57 := __send(addr#1027, __this, 0, call_arg#56);
	$return42:
	// Function body ends here
}

// 
// Function: freezeAccount : function (address,bool)
procedure {:sourceloc "buggy_5.sol", 358, 5} {:message "TTC::freezeAccount"} freezeAccount#1059(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1040: address_t, freeze#1042: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#28[__this]);
	// Function body starts here
	frozenAccount#825 := frozenAccount#825[__this := frozenAccount#825[__this][target#1040 := freeze#1042]];
	assume {:sourceloc "buggy_5.sol", 360, 14} {:message ""} true;
	call FrozenFunds#845(__this, __msg_sender, __msg_value, target#1040, freeze#1042);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 362, 1} {:message "TTC::my_func_uncheck36"} my_func_uncheck36#1074(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1061: address_t)
{
	var __call_ret#60: bool;
	var __call_ret#61: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_5.sol", 363, 5} {:message ""} true;
	call __call_ret#60, __call_ret#61 := __call(dst#1061, __this, __msg_value);
	if (__call_ret#60) {
	havoc payedOut_unchk9#761;
	havoc sellPrice#784;
	havoc buyPrice#800;
	havoc frozenAccount#825;
	havoc payedOut_unchk8#960;
	havoc winner_unchk8#962;
	havoc winAmount_unchk8#964;
	havoc payedOut_unchk44#1131;
	havoc winner_unchk44#1133;
	havoc winAmount_unchk44#1135;
	havoc name#160;
	havoc symbol#183;
	havoc decimals#201;
	havoc totalSupply#220;
	havoc balanceOf#238;
	havoc allowance#256;
	havoc payedOut_unchk45#308;
	havoc payedOut_unchk32#370;
	havoc winner_unchk32#372;
	havoc winAmount_unchk32#374;
	havoc owner#28;
	havoc payedOut_unchk33#31;
	havoc payedOut_unchk20#122;
	havoc winner_unchk20#124;
	havoc winAmount_unchk20#126;
	havoc __balance;
	}

	if (!(__call_ret#60)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return45:
	// Function body ends here
}

// 
// Function: setPrices : function (uint256,uint256)
procedure {:sourceloc "buggy_5.sol", 369, 5} {:message "TTC::setPrices"} setPrices#1093(__this: address_t, __msg_sender: address_t, __msg_value: int, newSellPrice#1077: int, newBuyPrice#1079: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#28[__this]);
	// Function body starts here
	sellPrice#784 := sellPrice#784[__this := newSellPrice#1077];
	buyPrice#800 := buyPrice#800[__this := newBuyPrice#1079];
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_5.sol", 373, 1} {:message "TTC::my_func_unchk35"} my_func_unchk35#1106(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1095: address_t)
{
	var __send_ret#64: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 374, 9} {:message ""} true;
	call __send_ret#64 := __send(dst#1095, __this, 0, __msg_value);
	$return48:
	// Function body ends here
}

// 
// Function: buy : function ()
procedure {:sourceloc "buggy_5.sol", 378, 5} {:message "TTC::buy"} buy#1128(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 379, 9} {:message "amount"} amount#1111: int;
	var call_arg#65: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	amount#1111 := (__msg_value div buyPrice#800[__this]);
	call_arg#65 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 380, 9} {:message ""} true;
	call _transfer#957(__this, __msg_sender, __msg_value, __this, call_arg#65, amount#1111);
	$return49:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_5.sol", 382, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1131: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_5.sol", 383, 1} {:message "winner_unchk44"} winner_unchk44#1133: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_5.sol", 384, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1135: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_5.sol", 386, 1} {:message "TTC::sendToWinner_unchk44"} sendToWinner_unchk44#1154(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1131[__this]);
	assume {:sourceloc "buggy_5.sol", 388, 9} {:message ""} true;
	call __send_ret#66 := __send(winner_unchk44#1133[__this], __this, 0, winAmount_unchk44#1135[__this]);
	payedOut_unchk44#1131 := payedOut_unchk44#1131[__this := true];
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
// Function: sell : function (uint256)
procedure {:sourceloc "buggy_5.sol", 394, 5} {:message "TTC::sell"} sell#1198(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1157: int)
{
	var {:sourceloc "buggy_5.sol", 395, 9} {:message "myAddress"} myAddress#1161: address_t;
	var call_arg#67: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	myAddress#1161 := __this;
	assume (__balance[myAddress#1161] >= (amount#1157 * sellPrice#784[__this]));
	call_arg#67 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 397, 9} {:message ""} true;
	call _transfer#957(__this, __msg_sender, __msg_value, call_arg#67, __this, amount#1157);
	assume {:sourceloc "buggy_5.sol", 398, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, (amount#1157 * sellPrice#784[__this]));
	$return51:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_5.sol", 400, 1} {:message "TTC::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1213(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 401, 4} {:message "addr_unchk40"} addr_unchk40#1202: address_t;
	var call_arg#68: int;
	var __send_ret#69: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1202 := 0;
	call_arg#68 := 2000000000000000000;
	assume {:sourceloc "buggy_5.sol", 402, 10} {:message ""} true;
	call __send_ret#69 := __send(addr_unchk40#1202, __this, 0, call_arg#68);
	if (!(__send_ret#69)) {
	
	}
	else {
	
	}

	$return52:
	// Function body ends here
}

