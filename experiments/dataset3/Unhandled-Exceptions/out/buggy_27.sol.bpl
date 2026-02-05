// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_27.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_27.sol", 15, 3} {:message "[event] IERC20::Transfer"} Transfer#59(__this: address_t, __msg_sender: address_t, __msg_value: int, from#53: address_t, to#55: address_t, value#57: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_27.sol", 16, 3} {:message "[event] IERC20::Approval"} Approval#67(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#61: address_t, spender#63: address_t, value#65: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_27.sol", 8, 3} {:message "IERC20::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_27.sol", 9, 3} {:message "IERC20::balanceOf"} balanceOf#13(__this: address_t, __msg_sender: address_t, __msg_value: int, who#8: address_t)
	returns (#11: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_27.sol", 10, 3} {:message "IERC20::allowance"} allowance#22(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#15: address_t, spender#17: address_t)
	returns (#20: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_27.sol", 11, 3} {:message "IERC20::transfer"} transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_27.sol", 12, 3} {:message "IERC20::approve"} approve#40(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#33: address_t, value#35: int)
	returns (#38: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_27.sol", 13, 3} {:message "IERC20::transferFrom"} transferFrom#51(__this: address_t, __msg_sender: address_t, __msg_value: int, from#42: address_t, to#44: address_t, value#46: int)
	returns (#49: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_27.sol", 7, 1} {:message "IERC20::[implicit_constructor]"} __constructor#68(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 20, 3} {:message "SafeMath::mul"} mul#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#70: int, b#72: int)
	returns (#75: int)
{
	var {:sourceloc "buggy_27.sol", 24, 5} {:message "c"} c#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#70 == 0)) {
	#75 := 0;
	goto $return0;
	}

	c#85 := (a#70 * b#72);
	assert {:sourceloc "buggy_27.sol", 25, 5} {:message "Assertion might not hold."} ((c#85 div a#70) == b#72);
	#75 := c#85;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 29, 3} {:message "SafeMath::div"} div#119(__this: address_t, __msg_sender: address_t, __msg_value: int, a#103: int, b#105: int)
	returns (#108: int)
{
	var {:sourceloc "buggy_27.sol", 30, 5} {:message "c"} c#111: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#111 := (a#103 div b#105);
	#108 := c#111;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 34, 3} {:message "SafeMath::sub"} sub#139(__this: address_t, __msg_sender: address_t, __msg_value: int, a#121: int, b#123: int)
	returns (#126: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_27.sol", 35, 5} {:message "Assertion might not hold."} (b#123 <= a#121);
	#126 := (a#121 - b#123);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 39, 3} {:message "SafeMath::add"} add#163(__this: address_t, __msg_sender: address_t, __msg_value: int, a#141: int, b#143: int)
	returns (#146: int)
{
	var {:sourceloc "buggy_27.sol", 40, 5} {:message "c"} c#149: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#149 := (a#141 + b#143);
	assert {:sourceloc "buggy_27.sol", 41, 5} {:message "Assertion might not hold."} (c#149 >= a#141);
	#146 := c#149;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 45, 3} {:message "SafeMath::ceil"} ceil#195(__this: address_t, __msg_sender: address_t, __msg_value: int, a#165: int, m#167: int)
	returns (#170: int)
{
	var {:sourceloc "buggy_27.sol", 46, 5} {:message "c"} c#173: int;
	var add#163_ret#0: int;
	var {:sourceloc "buggy_27.sol", 47, 5} {:message "d"} d#180: int;
	var call_arg#1: int;
	var sub#139_ret#2: int;
	var div#119_ret#3: int;
	var mul#101_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 46, 17} {:message ""} true;
	call add#163_ret#0 := add#163(__this, __msg_sender, __msg_value, a#165, m#167);
	c#173 := add#163_ret#0;
	call_arg#1 := 1;
	assume {:sourceloc "buggy_27.sol", 47, 17} {:message ""} true;
	call sub#139_ret#2 := sub#139(__this, __msg_sender, __msg_value, c#173, call_arg#1);
	d#180 := sub#139_ret#2;
	assume {:sourceloc "buggy_27.sol", 48, 16} {:message ""} true;
	call div#119_ret#3 := div#119(__this, __msg_sender, __msg_value, d#180, m#167);
	assume {:sourceloc "buggy_27.sol", 48, 12} {:message ""} true;
	call mul#101_ret#4 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#3, m#167);
	#170 := mul#101_ret#4;
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_27.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_27.sol", 63, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#245(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#241: address_t, newOwner#243: address_t)
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
// Function: withdrawBal_unchk29 : function ()
procedure {:sourceloc "buggy_27.sol", 53, 3} {:message "Ownable::withdrawBal_unchk29"} withdrawBal_unchk29#213(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 54, 2} {:message "Balances_unchk29"} Balances_unchk29#200: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk29#200 := 0;
	assume {:sourceloc "buggy_27.sol", 55, 3} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, Balances_unchk29#200);
	$return5:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_27.sol", 56, 3} {:message "owner"} owner#215: [address_t]address_t;
// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_27.sol", 57, 3} {:message "payedOut_unchk33"} payedOut_unchk33#218: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_27.sol", 59, 1} {:message "Ownable::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#218[__this];
	assume {:sourceloc "buggy_27.sol", 61, 3} {:message ""} true;
	call __send_ret#6 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return6:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 66, 4} {:message "Ownable::[constructor]"} __constructor#334(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#215 := owner#215[__this := 0];
	payedOut_unchk33#218 := payedOut_unchk33#218[__this := false];
	// Function body starts here
	owner#215 := owner#215[__this := __msg_sender];
	$return7:
	// Function body ends here
}

// 
// Function: withdrawBal_unchk41 : function ()
procedure {:sourceloc "buggy_27.sol", 69, 1} {:message "Ownable::withdrawBal_unchk41"} withdrawBal_unchk41#271(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 70, 2} {:message "Balances_unchk41"} Balances_unchk41#258: int;
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk41#258 := 0;
	call_arg#7 := Balances_unchk41#258;
	assume {:sourceloc "buggy_27.sol", 71, 3} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, call_arg#7);
	$return8:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_27.sol", 80, 5} {:message "Ownable::transferOwnership"} transferOwnership#308(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#284: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#215[__this]);
	// Function body starts here
	assume (newOwner#284 != 0);
	assume {:sourceloc "buggy_27.sol", 82, 12} {:message ""} true;
	call OwnershipTransferred#245(__this, __msg_sender, __msg_value, owner#215[__this], newOwner#284);
	owner#215 := owner#215[__this := newOwner#284];
	$return10:
	// Function body ends here
	$return9:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_27.sol", 85, 1} {:message "Ownable::bug_unchk42"} bug_unchk42#333(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 86, 1} {:message "receivers_unchk42"} receivers_unchk42#312: int;
	var {:sourceloc "buggy_27.sol", 87, 1} {:message "addr_unchk42"} addr_unchk42#315: address_t;
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#312 := 0;
	addr_unchk42#315 := 0;
	call_arg#11 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 88, 6} {:message ""} true;
	call __send_ret#12 := __send(addr_unchk42#315, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	receivers_unchk42#312 := (receivers_unchk42#312 + 1);
	}
	else {
	assume false;
	}

	$return11:
	// Function body ends here
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// Function: bug_unchk6 : function ()
procedure {:sourceloc "buggy_27.sol", 99, 1} {:message "ERC20Detailed::bug_unchk6"} bug_unchk6#361(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 100, 1} {:message "receivers_unchk6"} receivers_unchk6#340: int;
	var {:sourceloc "buggy_27.sol", 101, 1} {:message "addr_unchk6"} addr_unchk6#343: address_t;
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk6#340 := 0;
	addr_unchk6#343 := 0;
	call_arg#13 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 102, 6} {:message ""} true;
	call __send_ret#14 := __send(addr_unchk6#343, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	receivers_unchk6#340 := (receivers_unchk6#340 + 1);
	}
	else {
	assume false;
	}

	$return12:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_27.sol", 107, 3} {:message "_name"} _name#363: [address_t]int_arr_type;
// 
// Function: UncheckedExternalCall_unchk16 : function ()
procedure {:sourceloc "buggy_27.sol", 108, 1} {:message "ERC20Detailed::UncheckedExternalCall_unchk16"} UncheckedExternalCall_unchk16#378(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 109, 4} {:message "addr_unchk16"} addr_unchk16#367: address_t;
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk16#367 := 0;
	call_arg#15 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 110, 10} {:message ""} true;
	call __send_ret#16 := __send(addr_unchk16#367, __this, 0, call_arg#15);
	if (!(__send_ret#16)) {
	
	}
	else {
	
	}

	$return13:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_27.sol", 117, 3} {:message "_symbol"} _symbol#380: [address_t]int_arr_type;
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
// Function: my_func_uncheck24 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 118, 1} {:message "ERC20Detailed::my_func_uncheck24"} my_func_uncheck24#395(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#382: address_t)
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
	assume {:sourceloc "buggy_27.sol", 119, 3} {:message ""} true;
	call __call_ret#17, __call_ret#18 := __call(dst#382, __this, __msg_value);
	if (__call_ret#17) {
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#17)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_27.sol", 121, 3} {:message "_decimals"} _decimals#397: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 123, 3} {:message "ERC20Detailed::[constructor]"} __constructor#509(__this: address_t, __msg_sender: address_t, __msg_value: int, name#399: int_arr_ptr, symbol#401: int_arr_ptr, decimals#403: int)
{
	// TCC assumptions
	assume (name#399 < __alloc_counter);
	assume (symbol#401 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#363 := _name#363[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#380 := _symbol#380[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#397 := _decimals#397[__this := 0];
	// Function body starts here
	_name#363 := _name#363[__this := mem_arr_int[name#399]];
	_symbol#380 := _symbol#380[__this := mem_arr_int[symbol#401]];
	_decimals#397 := _decimals#397[__this := decimals#403];
	$return15:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 128, 1} {:message "ERC20Detailed::unhandledsend_unchk2"} unhandledsend_unchk2#431(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#421: address_t)
{
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#19 := 5000000000000000000;
	assume {:sourceloc "buggy_27.sol", 129, 5} {:message ""} true;
	call __send_ret#20 := __send(callee#421, __this, 0, call_arg#19);
	$return16:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 132, 3} {:message "ERC20Detailed::name"} name#439(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#434: int_arr_ptr)
{
	var new_array#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#21 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#434 := new_array#21;
	mem_arr_int := mem_arr_int[#434 := _name#363[__this]];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_27.sol", 135, 1} {:message "ERC20Detailed::bug_unchk43"} bug_unchk43#460(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 136, 1} {:message "addr_unchk43"} addr_unchk43#443: address_t;
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#443 := 0;
	call_arg#22 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 137, 6} {:message ""} true;
	call __send_ret#23 := __send(addr_unchk43#443, __this, 0, call_arg#22);
	if ((!(__send_ret#23) || (1 == 1))) {
	assume false;
	}

	$return18:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 141, 3} {:message "ERC20Detailed::symbol"} symbol#468(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#463: int_arr_ptr)
{
	var new_array#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#24 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#463 := new_array#24;
	mem_arr_int := mem_arr_int[#463 := _symbol#380[__this]];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 144, 1} {:message "ERC20Detailed::my_func_uncheck48"} my_func_uncheck48#483(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#470: address_t)
{
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_27.sol", 145, 3} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(dst#470, __this, __msg_value);
	if (__call_ret#25) {
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return20:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_27.sol", 148, 3} {:message "ERC20Detailed::decimals"} decimals#491(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#486: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#486 := _decimals#397[__this];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_27.sol", 151, 1} {:message "ERC20Detailed::withdrawBal_unchk17"} withdrawBal_unchk17#508(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 152, 2} {:message "Balances_unchk17"} Balances_unchk17#495: int;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#495 := 0;
	call_arg#27 := Balances_unchk17#495;
	assume {:sourceloc "buggy_27.sol", 153, 3} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, call_arg#27);
	$return22:
	// Function body ends here
}

// 
// ------- Contract: DanPanCoin -------
// Inherits from: ERC20Detailed
// Inherits from: Ownable
// 
// Event: DanPanPercentChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 212, 3} {:message "[event] DanPanCoin::DanPanPercentChanged"} DanPanPercentChanged#734(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPanPercent#730: int, newDanPanPercent#732: int)
{
	
}

// 
// Event: DanPanAddressChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 218, 3} {:message "[event] DanPanCoin::DanPanAddressChanged"} DanPanAddressChanged#761(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPan#757: address_t, newDanPan#759: address_t)
{
	
}

// 
// Event: WhitelistFrom
procedure {:inline 1} {:sourceloc "buggy_27.sol", 225, 3} {:message "[event] DanPanCoin::WhitelistFrom"} WhitelistFrom#791(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#787: address_t, _whitelisted#789: bool)
{
	
}

// 
// Event: WhitelistTo
procedure {:inline 1} {:sourceloc "buggy_27.sol", 229, 3} {:message "[event] DanPanCoin::WhitelistTo"} WhitelistTo#813(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#809: address_t, _whitelisted#811: bool)
{
	
}

// Using library SafeMath for uint256
// 
// Function: withdrawBal_unchk5 : function ()
procedure {:sourceloc "buggy_27.sol", 159, 1} {:message "DanPanCoin::withdrawBal_unchk5"} withdrawBal_unchk5#533(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 160, 2} {:message "Balances_unchk5"} Balances_unchk5#520: int;
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk5#520 := 0;
	call_arg#29 := Balances_unchk5#520;
	assume {:sourceloc "buggy_27.sol", 161, 3} {:message ""} true;
	call __send_ret#30 := __send(__msg_sender, __this, 0, call_arg#29);
	$return23:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 162, 3} {:message "_balances"} _balances#537: [address_t][address_t]int;
// 
// Function: bug_unchk15 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 163, 1} {:message "DanPanCoin::bug_unchk15"} bug_unchk15#549(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#539: address_t)
{
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#31 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 164, 8} {:message ""} true;
	call __send_ret#32 := __send(addr#539, __this, 0, call_arg#31);
	$return24:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_27.sol", 165, 3} {:message "_allowed"} _allowed#555: [address_t][address_t][address_t]int;
// 
// Function: UncheckedExternalCall_unchk28 : function ()
procedure {:sourceloc "buggy_27.sol", 167, 1} {:message "DanPanCoin::UncheckedExternalCall_unchk28"} UncheckedExternalCall_unchk28#570(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 168, 4} {:message "addr_unchk28"} addr_unchk28#559: address_t;
	var call_arg#33: int;
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk28#559 := 0;
	call_arg#33 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 169, 10} {:message ""} true;
	call __send_ret#34 := __send(addr_unchk28#559, __this, 0, call_arg#33);
	if (!(__send_ret#34)) {
	
	}
	else {
	
	}

	$return25:
	// Function body ends here
}

// 
// Function: cash_unchk34 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_27.sol", 177, 1} {:message "DanPanCoin::cash_unchk34"} cash_unchk34#597(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#575: int, subpotIndex#577: int, winner_unchk34#579: address_t)
{
	var {:sourceloc "buggy_27.sol", 178, 9} {:message "subpot_unchk34"} subpot_unchk34#583: int;
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk34#583 := 10000000000000000000;
	call_arg#35 := subpot_unchk34#583;
	assume {:sourceloc "buggy_27.sol", 179, 9} {:message ""} true;
	call __send_ret#36 := __send(winner_unchk34#579, __this, 0, call_arg#35);
	subpot_unchk34#583 := 0;
	$return26:
	// Function body ends here
}

// 
// State variable: payedOut_unchk21: bool
var {:sourceloc "buggy_27.sol", 183, 1} {:message "payedOut_unchk21"} payedOut_unchk21#603: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk21 : function ()
procedure {:sourceloc "buggy_27.sol", 185, 1} {:message "DanPanCoin::withdrawLeftOver_unchk21"} withdrawLeftOver_unchk21#624(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk21#603[__this];
	assume {:sourceloc "buggy_27.sol", 187, 11} {:message ""} true;
	call __send_ret#37 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return27:
	// Function body ends here
}

// 
// Function: cash_unchk10 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_27.sol", 190, 1} {:message "DanPanCoin::cash_unchk10"} cash_unchk10#651(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#629: int, subpotIndex#631: int, winner_unchk10#633: address_t)
{
	var {:sourceloc "buggy_27.sol", 191, 9} {:message "subpot_unchk10"} subpot_unchk10#637: int;
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk10#637 := 10000000000000000000;
	call_arg#38 := subpot_unchk10#637;
	assume {:sourceloc "buggy_27.sol", 192, 9} {:message ""} true;
	call __send_ret#39 := __send(winner_unchk10#633, __this, 0, call_arg#38);
	subpot_unchk10#637 := 0;
	$return28:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_27.sol", 195, 3} {:message "_totalSupply"} _totalSupply#654: [address_t]int;
// 
// Function: my_func_unchk47 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 196, 1} {:message "DanPanCoin::my_func_unchk47"} my_func_unchk47#667(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#656: address_t)
{
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 197, 9} {:message ""} true;
	call __send_ret#40 := __send(dst#656, __this, 0, __msg_value);
	$return29:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_27.sol", 199, 3} {:message "basePercent"} basePercent#670: [address_t]int;
// 
// Function: cash_unchk22 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_27.sol", 200, 1} {:message "DanPanCoin::cash_unchk22"} cash_unchk22#694(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#672: int, subpotIndex#674: int, winner_unchk22#676: address_t)
{
	var {:sourceloc "buggy_27.sol", 201, 9} {:message "subpot_unchk22"} subpot_unchk22#680: int;
	var call_arg#41: int;
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk22#680 := 10000000000000000000;
	call_arg#41 := subpot_unchk22#680;
	assume {:sourceloc "buggy_27.sol", 202, 9} {:message ""} true;
	call __send_ret#42 := __send(winner_unchk22#676, __this, 0, call_arg#41);
	subpot_unchk22#680 := 0;
	$return30:
	// Function body ends here
}

// 
// State variable: dpPercent: uint256
var {:sourceloc "buggy_27.sol", 205, 3} {:message "dpPercent"} dpPercent#697: [address_t]int;
// 
// Function: my_func_uncheck12 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 206, 1} {:message "DanPanCoin::my_func_uncheck12"} my_func_uncheck12#712(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#699: address_t)
{
	var __call_ret#43: bool;
	var __call_ret#44: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_27.sol", 207, 3} {:message ""} true;
	call __call_ret#43, __call_ret#44 := __call(dst#699, __this, __msg_value);
	if (__call_ret#43) {
	havoc _balances#537;
	havoc _allowed#555;
	havoc payedOut_unchk21#603;
	havoc _totalSupply#654;
	havoc basePercent#670;
	havoc dpPercent#697;
	havoc DanPanAddress#716;
	havoc payedOut_unchk45#764;
	havoc whitelistFrom#830;
	havoc whitelistTo#848;
	havoc payedOut_unchk9#920;
	havoc payedOut_unchk20#1230;
	havoc winner_unchk20#1232;
	havoc winAmount_unchk20#1234;
	havoc payedOut_unchk32#1288;
	havoc winner_unchk32#1290;
	havoc winAmount_unchk32#1292;
	havoc payedOut_unchk8#1899;
	havoc winner_unchk8#1901;
	havoc winAmount_unchk8#1903;
	havoc payedOut_unchk44#2047;
	havoc winner_unchk44#2049;
	havoc winAmount_unchk44#2051;
	havoc owner#215;
	havoc payedOut_unchk33#218;
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#43)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return31:
	// Function body ends here
}

// 
// State variable: DanPanAddress: address
var {:sourceloc "buggy_27.sol", 209, 3} {:message "DanPanAddress"} DanPanAddress#716: [address_t]address_t;
// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 210, 1} {:message "DanPanCoin::bug_unchk27"} bug_unchk27#728(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#718: address_t)
{
	var call_arg#45: int;
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#45 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 211, 8} {:message ""} true;
	call __send_ret#46 := __send(addr#718, __this, 0, call_arg#45);
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_27.sol", 213, 1} {:message "DanPanCoin::bug_unchk31"} bug_unchk31#755(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 214, 1} {:message "addr_unchk31"} addr_unchk31#738: address_t;
	var call_arg#47: int;
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#738 := 0;
	call_arg#47 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 215, 6} {:message ""} true;
	call __send_ret#48 := __send(addr_unchk31#738, __this, 0, call_arg#47);
	if ((!(__send_ret#48) || (1 == 1))) {
	assume false;
	}

	$return33:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_27.sol", 219, 1} {:message "payedOut_unchk45"} payedOut_unchk45#764: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_27.sol", 221, 1} {:message "DanPanCoin::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#785(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#49: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#764[__this];
	assume {:sourceloc "buggy_27.sol", 223, 3} {:message ""} true;
	call __send_ret#49 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return34:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_27.sol", 226, 1} {:message "DanPanCoin::callnotchecked_unchk13"} callnotchecked_unchk13#807(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#793: address_t)
{
	var __call_ret#50: bool;
	var __call_ret#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_27.sol", 227, 3} {:message ""} true;
	call __call_ret#50, __call_ret#51 := __call(callee#793, __this, 1000000000000000000);
	if (__call_ret#50) {
	havoc _balances#537;
	havoc _allowed#555;
	havoc payedOut_unchk21#603;
	havoc _totalSupply#654;
	havoc basePercent#670;
	havoc dpPercent#697;
	havoc DanPanAddress#716;
	havoc payedOut_unchk45#764;
	havoc whitelistFrom#830;
	havoc whitelistTo#848;
	havoc payedOut_unchk9#920;
	havoc payedOut_unchk20#1230;
	havoc winner_unchk20#1232;
	havoc winAmount_unchk20#1234;
	havoc payedOut_unchk32#1288;
	havoc winner_unchk32#1290;
	havoc winAmount_unchk32#1292;
	havoc payedOut_unchk8#1899;
	havoc winner_unchk8#1901;
	havoc winAmount_unchk8#1903;
	havoc payedOut_unchk44#2047;
	havoc winner_unchk44#2049;
	havoc winAmount_unchk44#2051;
	havoc owner#215;
	havoc payedOut_unchk33#218;
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#50)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return35:
	// Function body ends here
}

// 
// Function: my_func_unchk11 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 232, 3} {:message "DanPanCoin::my_func_unchk11"} my_func_unchk11#826(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#815: address_t)
{
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 233, 9} {:message ""} true;
	call __send_ret#52 := __send(dst#815, __this, 0, __msg_value);
	$return36:
	// Function body ends here
}

// 
// State variable: whitelistFrom: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 235, 3} {:message "whitelistFrom"} whitelistFrom#830: [address_t][address_t]bool;
// 
// Function: callnotchecked_unchk1 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 236, 3} {:message "DanPanCoin::callnotchecked_unchk1"} callnotchecked_unchk1#844(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#832: address_t)
{
	var __call_ret#53: bool;
	var __call_ret#54: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 2000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 2000000000000000000)];
	assume {:sourceloc "buggy_27.sol", 237, 5} {:message ""} true;
	call __call_ret#53, __call_ret#54 := __call(callee#832, __this, 2000000000000000000);
	if (__call_ret#53) {
	havoc _balances#537;
	havoc _allowed#555;
	havoc payedOut_unchk21#603;
	havoc _totalSupply#654;
	havoc basePercent#670;
	havoc dpPercent#697;
	havoc DanPanAddress#716;
	havoc payedOut_unchk45#764;
	havoc whitelistFrom#830;
	havoc whitelistTo#848;
	havoc payedOut_unchk9#920;
	havoc payedOut_unchk20#1230;
	havoc winner_unchk20#1232;
	havoc winAmount_unchk20#1234;
	havoc payedOut_unchk32#1288;
	havoc winner_unchk32#1290;
	havoc winAmount_unchk32#1292;
	havoc payedOut_unchk8#1899;
	havoc winner_unchk8#1901;
	havoc winAmount_unchk8#1903;
	havoc payedOut_unchk44#2047;
	havoc winner_unchk44#2049;
	havoc winAmount_unchk44#2051;
	havoc owner#215;
	havoc payedOut_unchk33#218;
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#53)) {
	__balance := __balance[__this := (__balance[__this] + 2000000000000000000)];
	}

	$return37:
	// Function body ends here
}

// 
// State variable: whitelistTo: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 239, 3} {:message "whitelistTo"} whitelistTo#848: [address_t][address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 241, 3} {:message "DanPanCoin::[constructor]"} __constructor#2107(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#850: int_arr_ptr, _symbol#852: int_arr_ptr, _decimals#854: int)
{
	var name#399#56: int_arr_ptr;
	var symbol#401#56: int_arr_ptr;
	var decimals#403#56: int;
	var call_arg#58: address_t;
	// TCC assumptions
	assume (_name#850 < __alloc_counter);
	assume (_symbol#852 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#537 := _balances#537[__this := default_address_t_int()];
	_allowed#555 := _allowed#555[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk21#603 := payedOut_unchk21#603[__this := false];
	_totalSupply#654 := _totalSupply#654[__this := 10000000000];
	basePercent#670 := basePercent#670[__this := 100];
	dpPercent#697 := dpPercent#697[__this := 5];
	DanPanAddress#716 := DanPanAddress#716[__this := __msg_sender];
	payedOut_unchk45#764 := payedOut_unchk45#764[__this := false];
	whitelistFrom#830 := whitelistFrom#830[__this := default_address_t_bool()];
	whitelistTo#848 := whitelistTo#848[__this := default_address_t_bool()];
	payedOut_unchk9#920 := payedOut_unchk9#920[__this := false];
	payedOut_unchk20#1230 := payedOut_unchk20#1230[__this := false];
	winner_unchk20#1232 := winner_unchk20#1232[__this := 0];
	winAmount_unchk20#1234 := winAmount_unchk20#1234[__this := 0];
	payedOut_unchk32#1288 := payedOut_unchk32#1288[__this := false];
	winner_unchk32#1290 := winner_unchk32#1290[__this := 0];
	winAmount_unchk32#1292 := winAmount_unchk32#1292[__this := 0];
	payedOut_unchk8#1899 := payedOut_unchk8#1899[__this := false];
	winner_unchk8#1901 := winner_unchk8#1901[__this := 0];
	winAmount_unchk8#1903 := winAmount_unchk8#1903[__this := 0];
	payedOut_unchk44#2047 := payedOut_unchk44#2047[__this := false];
	winner_unchk44#2049 := winner_unchk44#2049[__this := 0];
	winAmount_unchk44#2051 := winAmount_unchk44#2051[__this := 0];
	owner#215 := owner#215[__this := 0];
	payedOut_unchk33#218 := payedOut_unchk33#218[__this := false];
	_name#363 := _name#363[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#380 := _symbol#380[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#397 := _decimals#397[__this := 0];
	// Arguments for Ownable
	// Arguments for ERC20Detailed
	name#399#56 := _name#850;
	symbol#401#56 := _symbol#852;
	decimals#403#56 := _decimals#854;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#363 := _name#363[__this := mem_arr_int[name#399#56]];
	_symbol#380 := _symbol#380[__this := mem_arr_int[symbol#401#56]];
	_decimals#397 := _decimals#397[__this := decimals#403#56];
	$return38:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#215 := owner#215[__this := __msg_sender];
	$return39:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	call_arg#58 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 242, 5} {:message ""} true;
	call _mint#1744(__this, __msg_sender, __msg_value, call_arg#58, _totalSupply#654[__this]);
	$return40:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 244, 1} {:message "DanPanCoin::callnotchecked_unchk37"} callnotchecked_unchk37#883(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#871: address_t)
{
	var __call_ret#59: bool;
	var __call_ret#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_27.sol", 245, 3} {:message ""} true;
	call __call_ret#59, __call_ret#60 := __call(callee#871, __this, 1000000000000000000);
	if (__call_ret#59) {
	havoc _balances#537;
	havoc _allowed#555;
	havoc payedOut_unchk21#603;
	havoc _totalSupply#654;
	havoc basePercent#670;
	havoc dpPercent#697;
	havoc DanPanAddress#716;
	havoc payedOut_unchk45#764;
	havoc whitelistFrom#830;
	havoc whitelistTo#848;
	havoc payedOut_unchk9#920;
	havoc payedOut_unchk20#1230;
	havoc winner_unchk20#1232;
	havoc winAmount_unchk20#1234;
	havoc payedOut_unchk32#1288;
	havoc winner_unchk32#1290;
	havoc winAmount_unchk32#1292;
	havoc payedOut_unchk8#1899;
	havoc winner_unchk8#1901;
	havoc winAmount_unchk8#1903;
	havoc payedOut_unchk44#2047;
	havoc winner_unchk44#2049;
	havoc winAmount_unchk44#2051;
	havoc owner#215;
	havoc payedOut_unchk33#218;
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#59)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return41:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 248, 3} {:message "DanPanCoin::totalSupply"} totalSupply#892(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#887: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#887 := _totalSupply#654[__this];
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 251, 1} {:message "DanPanCoin::bug_unchk3"} bug_unchk3#904(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#894: address_t)
{
	var call_arg#61: int;
	var __send_ret#62: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#61 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 252, 8} {:message ""} true;
	call __send_ret#62 := __send(addr#894, __this, 0, call_arg#61);
	$return43:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 254, 3} {:message "DanPanCoin::balanceOf"} balanceOf#917(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#906: address_t)
	returns (#910: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#910 := _balances#537[__this][owner#906];
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_27.sol", 257, 1} {:message "payedOut_unchk9"} payedOut_unchk9#920: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_27.sol", 259, 1} {:message "DanPanCoin::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#941(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#63: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#920[__this];
	assume {:sourceloc "buggy_27.sol", 261, 3} {:message ""} true;
	call __send_ret#63 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return45:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 264, 3} {:message "DanPanCoin::allowance"} allowance#958(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#943: address_t, spender#945: address_t)
	returns (#949: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#949 := _allowed#555[__this][owner#943][spender#945];
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 267, 1} {:message "DanPanCoin::callnotchecked_unchk25"} callnotchecked_unchk25#972(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#960: address_t)
{
	var __call_ret#64: bool;
	var __call_ret#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_27.sol", 268, 3} {:message ""} true;
	call __call_ret#64, __call_ret#65 := __call(callee#960, __this, 1000000000000000000);
	if (__call_ret#64) {
	havoc _balances#537;
	havoc _allowed#555;
	havoc payedOut_unchk21#603;
	havoc _totalSupply#654;
	havoc basePercent#670;
	havoc dpPercent#697;
	havoc DanPanAddress#716;
	havoc payedOut_unchk45#764;
	havoc whitelistFrom#830;
	havoc whitelistTo#848;
	havoc payedOut_unchk9#920;
	havoc payedOut_unchk20#1230;
	havoc winner_unchk20#1232;
	havoc winAmount_unchk20#1234;
	havoc payedOut_unchk32#1288;
	havoc winner_unchk32#1290;
	havoc winAmount_unchk32#1292;
	havoc payedOut_unchk8#1899;
	havoc winner_unchk8#1901;
	havoc winAmount_unchk8#1903;
	havoc payedOut_unchk44#2047;
	havoc winner_unchk44#2049;
	havoc winAmount_unchk44#2051;
	havoc owner#215;
	havoc payedOut_unchk33#218;
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#64)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return47:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 271, 3} {:message "DanPanCoin::findOnePercent"} findOnePercent#999(__this: address_t, __msg_sender: address_t, __msg_value: int, value#974: int)
	returns (#977: int)
{
	var {:sourceloc "buggy_27.sol", 272, 5} {:message "roundValue"} roundValue#980: int;
	var ceil#195_ret#66: int;
	var {:sourceloc "buggy_27.sol", 273, 5} {:message "onePercent"} onePercent#987: int;
	var mul#101_ret#67: int;
	var call_arg#68: int;
	var div#119_ret#69: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 272, 26} {:message ""} true;
	call ceil#195_ret#66 := ceil#195(__this, __msg_sender, __msg_value, value#974, basePercent#670[__this]);
	roundValue#980 := ceil#195_ret#66;
	assume {:sourceloc "buggy_27.sol", 273, 26} {:message ""} true;
	call mul#101_ret#67 := mul#101(__this, __msg_sender, __msg_value, roundValue#980, basePercent#670[__this]);
	call_arg#68 := 10000;
	assume {:sourceloc "buggy_27.sol", 273, 26} {:message ""} true;
	call div#119_ret#69 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#67, call_arg#68);
	onePercent#987 := div#119_ret#69;
	#977 := onePercent#987;
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_27.sol", 276, 1} {:message "DanPanCoin::bug_unchk19"} bug_unchk19#1020(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 277, 1} {:message "addr_unchk19"} addr_unchk19#1003: address_t;
	var call_arg#70: int;
	var __send_ret#71: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#1003 := 0;
	call_arg#70 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 278, 6} {:message ""} true;
	call __send_ret#71 := __send(addr_unchk19#1003, __this, 0, call_arg#70);
	if ((!(__send_ret#71) || (1 == 1))) {
	assume false;
	}

	$return49:
	// Function body ends here
}

// 
// Function: findDPPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 281, 3} {:message "DanPanCoin::findDPPercent"} findDPPercent#1050(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1022: int)
	returns (#1025: int)
{
	var {:sourceloc "buggy_27.sol", 282, 5} {:message "roundValue"} roundValue#1028: int;
	var ceil#195_ret#72: int;
	var {:sourceloc "buggy_27.sol", 283, 5} {:message "DPPercent"} DPPercent#1035: int;
	var mul#101_ret#73: int;
	var call_arg#74: int;
	var div#119_ret#75: int;
	var mul#101_ret#76: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 282, 26} {:message ""} true;
	call ceil#195_ret#72 := ceil#195(__this, __msg_sender, __msg_value, value#1022, basePercent#670[__this]);
	roundValue#1028 := ceil#195_ret#72;
	assume {:sourceloc "buggy_27.sol", 283, 25} {:message ""} true;
	call mul#101_ret#73 := mul#101(__this, __msg_sender, __msg_value, roundValue#1028, basePercent#670[__this]);
	call_arg#74 := 10000;
	assume {:sourceloc "buggy_27.sol", 283, 25} {:message ""} true;
	call div#119_ret#75 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#73, call_arg#74);
	assume {:sourceloc "buggy_27.sol", 283, 25} {:message ""} true;
	call mul#101_ret#76 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#75, dpPercent#697[__this]);
	DPPercent#1035 := mul#101_ret#76;
	#1025 := DPPercent#1035;
	goto $return50;
	$return50:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 286, 1} {:message "DanPanCoin::unhandledsend_unchk26"} unhandledsend_unchk26#1062(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1052: address_t)
{
	var call_arg#77: int;
	var __send_ret#78: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#77 := 5000000000000000000;
	assume {:sourceloc "buggy_27.sol", 287, 5} {:message ""} true;
	call __send_ret#78 := __send(callee#1052, __this, 0, call_arg#77);
	$return51:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 290, 3} {:message "DanPanCoin::transfer"} transfer#1227(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1064: address_t, value#1066: int)
	returns (#1070: bool)
{
	var call_arg#79: address_t;
	var call_arg#80: int;
	var {:sourceloc "buggy_27.sol", 305, 9} {:message "tokensToTransfer"} tokensToTransfer#1105: int;
	var {:sourceloc "buggy_27.sol", 306, 9} {:message "tokensToBurn"} tokensToBurn#1109: int;
	var {:sourceloc "buggy_27.sol", 307, 9} {:message "tokensToDanPan"} tokensToDanPan#1113: int;
	var sub#139_ret#81: int;
	var call_arg#82: address_t;
	var _isWhitelisted#2010_ret#83: bool;
	var findOnePercent#999_ret#84: int;
	var findDPPercent#1050_ret#85: int;
	var sub#139_ret#86: int;
	var sub#139_ret#87: int;
	var sub#139_ret#88: int;
	var call_arg#89: address_t;
	var call_arg#90: address_t;
	var add#163_ret#91: int;
	var call_arg#92: address_t;
	var add#163_ret#93: int;
	var add#163_ret#94: int;
	var add#163_ret#95: int;
	var call_arg#96: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1066 <= _balances#537[__this][__msg_sender]);
	assume (to#1064 != 0);
	if ((value#1066 == 0)) {
	call_arg#79 := __msg_sender;
	call_arg#80 := 0;
	assume {:sourceloc "buggy_27.sol", 297, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#79, to#1064, call_arg#80);
	#1070 := true;
	goto $return52;
	}

	tokensToTransfer#1105 := value#1066;
	tokensToBurn#1109 := 0;
	tokensToDanPan#1113 := 0;
	assume {:sourceloc "buggy_27.sol", 311, 33} {:message ""} true;
	call sub#139_ret#81 := sub#139(__this, __msg_sender, __msg_value, _balances#537[__this][__msg_sender], value#1066);
	_balances#537 := _balances#537[__this := _balances#537[__this][__msg_sender := sub#139_ret#81]];
	call_arg#82 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 315, 14} {:message ""} true;
	call _isWhitelisted#2010_ret#83 := _isWhitelisted#2010(__this, __msg_sender, __msg_value, call_arg#82, to#1064);
	if (!(_isWhitelisted#2010_ret#83)) {
	assume {:sourceloc "buggy_27.sol", 317, 30} {:message ""} true;
	call findOnePercent#999_ret#84 := findOnePercent#999(__this, __msg_sender, __msg_value, value#1066);
	tokensToBurn#1109 := findOnePercent#999_ret#84;
	assume {:sourceloc "buggy_27.sol", 318, 32} {:message ""} true;
	call findDPPercent#1050_ret#85 := findDPPercent#1050(__this, __msg_sender, __msg_value, value#1066);
	tokensToDanPan#1113 := findDPPercent#1050_ret#85;
	assume {:sourceloc "buggy_27.sol", 321, 33} {:message ""} true;
	call sub#139_ret#86 := sub#139(__this, __msg_sender, __msg_value, value#1066, tokensToBurn#1109);
	assume {:sourceloc "buggy_27.sol", 321, 33} {:message ""} true;
	call sub#139_ret#87 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#86, tokensToDanPan#1113);
	tokensToTransfer#1105 := sub#139_ret#87;
	assume {:sourceloc "buggy_27.sol", 324, 28} {:message ""} true;
	call sub#139_ret#88 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#654[__this], tokensToBurn#1109);
	_totalSupply#654 := _totalSupply#654[__this := sub#139_ret#88];
	call_arg#89 := __msg_sender;
	call_arg#90 := 0;
	assume {:sourceloc "buggy_27.sol", 325, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#89, call_arg#90, tokensToBurn#1109);
	assume {:sourceloc "buggy_27.sol", 329, 40} {:message ""} true;
	call add#163_ret#91 := add#163(__this, __msg_sender, __msg_value, _balances#537[__this][DanPanAddress#716[__this]], tokensToDanPan#1113);
	_balances#537 := _balances#537[__this := _balances#537[__this][DanPanAddress#716[__this] := add#163_ret#91]];
	call_arg#92 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 330, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#92, DanPanAddress#716[__this], tokensToDanPan#1113);
	}

	assume {:sourceloc "buggy_27.sol", 336, 16} {:message ""} true;
	call add#163_ret#93 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#1109, tokensToTransfer#1105);
	assume {:sourceloc "buggy_27.sol", 336, 16} {:message ""} true;
	call add#163_ret#94 := add#163(__this, __msg_sender, __msg_value, add#163_ret#93, tokensToDanPan#1113);
	assert {:sourceloc "buggy_27.sol", 336, 9} {:message "Assertion might not hold."} (add#163_ret#94 == value#1066);
	assume {:sourceloc "buggy_27.sol", 339, 25} {:message ""} true;
	call add#163_ret#95 := add#163(__this, __msg_sender, __msg_value, _balances#537[__this][to#1064], tokensToTransfer#1105);
	_balances#537 := _balances#537[__this := _balances#537[__this][to#1064 := add#163_ret#95]];
	call_arg#96 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 340, 14} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#96, to#1064, tokensToTransfer#1105);
	#1070 := true;
	goto $return52;
	$return52:
	// Function body ends here
}

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_27.sol", 346, 1} {:message "payedOut_unchk20"} payedOut_unchk20#1230: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_27.sol", 347, 1} {:message "winner_unchk20"} winner_unchk20#1232: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_27.sol", 348, 1} {:message "winAmount_unchk20"} winAmount_unchk20#1234: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_27.sol", 350, 1} {:message "DanPanCoin::sendToWinner_unchk20"} sendToWinner_unchk20#1253(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#97: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#1230[__this]);
	assume {:sourceloc "buggy_27.sol", 352, 9} {:message ""} true;
	call __send_ret#97 := __send(winner_unchk20#1232[__this], __this, 0, winAmount_unchk20#1234[__this]);
	payedOut_unchk20#1230 := payedOut_unchk20#1230[__this := true];
	$return53:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_27.sol", 356, 3} {:message "DanPanCoin::multiTransfer"} multiTransfer#1285(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1256: address_t_arr_ptr, amounts#1259: int_arr_ptr)
{
	var {:sourceloc "buggy_27.sol", 357, 10} {:message "i"} i#1263: int;
	var transfer#1227_ret#100: bool;
	var tmp#101: int;
	// TCC assumptions
	assume (receivers#1256 < __alloc_counter);
	assume (amounts#1259 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1263 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1256])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1256]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1263 < length#address_t_arr#constr(mem_arr_address_t[receivers#1256]))) {
	// Body
	assume {:sourceloc "buggy_27.sol", 358, 7} {:message ""} true;
	call transfer#1227_ret#100 := transfer#1227(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1256])[i#1263], arr#int_arr#constr(mem_arr_int[amounts#1259])[i#1263]);
	$continue98:
	// Loop expression
	tmp#101 := i#1263;
	i#1263 := (i#1263 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1256])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1256]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break99:
	$return54:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_27.sol", 361, 1} {:message "payedOut_unchk32"} payedOut_unchk32#1288: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_27.sol", 362, 1} {:message "winner_unchk32"} winner_unchk32#1290: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_27.sol", 363, 1} {:message "winAmount_unchk32"} winAmount_unchk32#1292: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_27.sol", 365, 1} {:message "DanPanCoin::sendToWinner_unchk32"} sendToWinner_unchk32#1311(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#102: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#1288[__this]);
	assume {:sourceloc "buggy_27.sol", 367, 9} {:message ""} true;
	call __send_ret#102 := __send(winner_unchk32#1290[__this], __this, 0, winAmount_unchk32#1292[__this]);
	payedOut_unchk32#1288 := payedOut_unchk32#1288[__this := true];
	$return55:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 371, 3} {:message "DanPanCoin::approve"} approve#1349(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1313: address_t, value#1315: int)
	returns (#1319: bool)
{
	var call_arg#103: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1313 != 0);
	_allowed#555 := _allowed#555[__this := _allowed#555[__this][__msg_sender := _allowed#555[__this][__msg_sender][spender#1313 := value#1315]]];
	call_arg#103 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 374, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#103, spender#1313, value#1315);
	#1319 := true;
	goto $return56;
	$return56:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 377, 1} {:message "DanPanCoin::unhandledsend_unchk38"} unhandledsend_unchk38#1361(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1351: address_t)
{
	var call_arg#104: int;
	var __send_ret#105: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#104 := 5000000000000000000;
	assume {:sourceloc "buggy_27.sol", 378, 5} {:message ""} true;
	call __send_ret#105 := __send(callee#1351, __this, 0, call_arg#104);
	$return57:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 381, 2} {:message "DanPanCoin::transferFrom"} transferFrom#1548(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1363: address_t, to#1365: address_t, value#1367: int)
	returns (#1371: bool)
{
	var call_arg#106: int;
	var {:sourceloc "buggy_27.sol", 395, 9} {:message "tokensToTransfer"} tokensToTransfer#1415: int;
	var {:sourceloc "buggy_27.sol", 396, 9} {:message "tokensToBurn"} tokensToBurn#1419: int;
	var {:sourceloc "buggy_27.sol", 397, 9} {:message "tokensToDanPan"} tokensToDanPan#1423: int;
	var sub#139_ret#107: int;
	var _isWhitelisted#2010_ret#108: bool;
	var findOnePercent#999_ret#109: int;
	var findDPPercent#1050_ret#110: int;
	var sub#139_ret#111: int;
	var sub#139_ret#112: int;
	var sub#139_ret#113: int;
	var call_arg#114: address_t;
	var add#163_ret#115: int;
	var add#163_ret#116: int;
	var add#163_ret#117: int;
	var add#163_ret#118: int;
	var sub#139_ret#119: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1367 <= _balances#537[__this][from#1363]);
	assume (value#1367 <= _allowed#555[__this][from#1363][__msg_sender]);
	assume (to#1365 != 0);
	if ((value#1367 == 0)) {
	call_arg#106 := 0;
	assume {:sourceloc "buggy_27.sol", 389, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1363, to#1365, call_arg#106);
	#1371 := true;
	goto $return58;
	}

	tokensToTransfer#1415 := value#1367;
	tokensToBurn#1419 := 0;
	tokensToDanPan#1423 := 0;
	assume {:sourceloc "buggy_27.sol", 400, 27} {:message ""} true;
	call sub#139_ret#107 := sub#139(__this, __msg_sender, __msg_value, _balances#537[__this][from#1363], value#1367);
	_balances#537 := _balances#537[__this := _balances#537[__this][from#1363 := sub#139_ret#107]];
	assume {:sourceloc "buggy_27.sol", 404, 14} {:message ""} true;
	call _isWhitelisted#2010_ret#108 := _isWhitelisted#2010(__this, __msg_sender, __msg_value, from#1363, to#1365);
	if (!(_isWhitelisted#2010_ret#108)) {
	assume {:sourceloc "buggy_27.sol", 406, 30} {:message ""} true;
	call findOnePercent#999_ret#109 := findOnePercent#999(__this, __msg_sender, __msg_value, value#1367);
	tokensToBurn#1419 := findOnePercent#999_ret#109;
	assume {:sourceloc "buggy_27.sol", 407, 32} {:message ""} true;
	call findDPPercent#1050_ret#110 := findDPPercent#1050(__this, __msg_sender, __msg_value, value#1367);
	tokensToDanPan#1423 := findDPPercent#1050_ret#110;
	assume {:sourceloc "buggy_27.sol", 410, 33} {:message ""} true;
	call sub#139_ret#111 := sub#139(__this, __msg_sender, __msg_value, value#1367, tokensToBurn#1419);
	assume {:sourceloc "buggy_27.sol", 410, 33} {:message ""} true;
	call sub#139_ret#112 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#111, tokensToDanPan#1423);
	tokensToTransfer#1415 := sub#139_ret#112;
	assume {:sourceloc "buggy_27.sol", 413, 28} {:message ""} true;
	call sub#139_ret#113 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#654[__this], tokensToBurn#1419);
	_totalSupply#654 := _totalSupply#654[__this := sub#139_ret#113];
	call_arg#114 := 0;
	assume {:sourceloc "buggy_27.sol", 414, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1363, call_arg#114, tokensToBurn#1419);
	assume {:sourceloc "buggy_27.sol", 418, 40} {:message ""} true;
	call add#163_ret#115 := add#163(__this, __msg_sender, __msg_value, _balances#537[__this][DanPanAddress#716[__this]], tokensToDanPan#1423);
	_balances#537 := _balances#537[__this := _balances#537[__this][DanPanAddress#716[__this] := add#163_ret#115]];
	assume {:sourceloc "buggy_27.sol", 419, 17} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1363, DanPanAddress#716[__this], tokensToDanPan#1423);
	}

	assume {:sourceloc "buggy_27.sol", 425, 16} {:message ""} true;
	call add#163_ret#116 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#1419, tokensToTransfer#1415);
	assume {:sourceloc "buggy_27.sol", 425, 16} {:message ""} true;
	call add#163_ret#117 := add#163(__this, __msg_sender, __msg_value, add#163_ret#116, tokensToDanPan#1423);
	assert {:sourceloc "buggy_27.sol", 425, 9} {:message "Assertion might not hold."} (add#163_ret#117 == value#1367);
	assume {:sourceloc "buggy_27.sol", 428, 25} {:message ""} true;
	call add#163_ret#118 := add#163(__this, __msg_sender, __msg_value, _balances#537[__this][to#1365], tokensToTransfer#1415);
	_balances#537 := _balances#537[__this := _balances#537[__this][to#1365 := add#163_ret#118]];
	assume {:sourceloc "buggy_27.sol", 429, 31} {:message ""} true;
	call sub#139_ret#119 := sub#139(__this, __msg_sender, __msg_value, _allowed#555[__this][from#1363][__msg_sender], value#1367);
	_allowed#555 := _allowed#555[__this := _allowed#555[__this][from#1363 := _allowed#555[__this][from#1363][__msg_sender := sub#139_ret#119]]];
	assume {:sourceloc "buggy_27.sol", 430, 14} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1363, to#1365, tokensToTransfer#1415);
	#1371 := true;
	goto $return58;
	$return58:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_27.sol", 436, 1} {:message "DanPanCoin::cash_unchk46"} cash_unchk46#1572(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#1550: int, subpotIndex#1552: int, winner_unchk46#1554: address_t)
{
	var {:sourceloc "buggy_27.sol", 437, 9} {:message "subpot_unchk46"} subpot_unchk46#1558: int;
	var call_arg#120: int;
	var __send_ret#121: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#1558 := 3000000000000000000;
	call_arg#120 := subpot_unchk46#1558;
	assume {:sourceloc "buggy_27.sol", 438, 9} {:message ""} true;
	call __send_ret#121 := __send(winner_unchk46#1554, __this, 0, call_arg#120);
	subpot_unchk46#1558 := 0;
	$return59:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 442, 3} {:message "DanPanCoin::increaseAllowance"} increaseAllowance#1623(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1574: address_t, addedValue#1576: int)
	returns (#1579: bool)
{
	var add#163_ret#122: int;
	var call_arg#123: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1574 != 0);
	assume {:sourceloc "buggy_27.sol", 444, 38} {:message ""} true;
	call add#163_ret#122 := add#163(__this, __msg_sender, __msg_value, _allowed#555[__this][__msg_sender][spender#1574], addedValue#1576);
	_allowed#555 := _allowed#555[__this := _allowed#555[__this][__msg_sender := _allowed#555[__this][__msg_sender][spender#1574 := add#163_ret#122]]];
	call_arg#123 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 445, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#123, spender#1574, _allowed#555[__this][__msg_sender][spender#1574]);
	#1579 := true;
	goto $return60;
	$return60:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_27.sol", 448, 1} {:message "DanPanCoin::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#1638(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 449, 4} {:message "addr_unchk4"} addr_unchk4#1627: address_t;
	var call_arg#124: int;
	var __send_ret#125: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#1627 := 0;
	call_arg#124 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 450, 10} {:message ""} true;
	call __send_ret#125 := __send(addr_unchk4#1627, __this, 0, call_arg#124);
	if (!(__send_ret#125)) {
	
	}
	else {
	
	}

	$return61:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 458, 3} {:message "DanPanCoin::decreaseAllowance"} decreaseAllowance#1689(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1640: address_t, subtractedValue#1642: int)
	returns (#1645: bool)
{
	var sub#139_ret#126: int;
	var call_arg#127: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1640 != 0);
	assume {:sourceloc "buggy_27.sol", 460, 38} {:message ""} true;
	call sub#139_ret#126 := sub#139(__this, __msg_sender, __msg_value, _allowed#555[__this][__msg_sender][spender#1640], subtractedValue#1642);
	_allowed#555 := _allowed#555[__this := _allowed#555[__this][__msg_sender := _allowed#555[__this][__msg_sender][spender#1640 := sub#139_ret#126]]];
	call_arg#127 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 461, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#127, spender#1640, _allowed#555[__this][__msg_sender][spender#1640]);
	#1645 := true;
	goto $return62;
	$return62:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_27.sol", 464, 1} {:message "DanPanCoin::bug_unchk7"} bug_unchk7#1710(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 465, 1} {:message "addr_unchk7"} addr_unchk7#1693: address_t;
	var call_arg#128: int;
	var __send_ret#129: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#1693 := 0;
	call_arg#128 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 466, 6} {:message ""} true;
	call __send_ret#129 := __send(addr_unchk7#1693, __this, 0, call_arg#128);
	if ((!(__send_ret#129) || (1 == 1))) {
	assume false;
	}

	$return63:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 470, 3} {:message "DanPanCoin::_mint"} _mint#1744(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1712: address_t, amount#1714: int)
{
	var add#163_ret#130: int;
	var call_arg#131: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1714 != 0);
	assume {:sourceloc "buggy_27.sol", 472, 26} {:message ""} true;
	call add#163_ret#130 := add#163(__this, __msg_sender, __msg_value, _balances#537[__this][account#1712], amount#1714);
	_balances#537 := _balances#537[__this := _balances#537[__this][account#1712 := add#163_ret#130]];
	call_arg#131 := 0;
	assume {:sourceloc "buggy_27.sol", 473, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#131, account#1712, amount#1714);
	$return64:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 475, 1} {:message "DanPanCoin::my_func_unchk23"} my_func_unchk23#1757(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1746: address_t)
{
	var __send_ret#132: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 476, 9} {:message ""} true;
	call __send_ret#132 := __send(dst#1746, __this, 0, __msg_value);
	$return65:
	// Function body ends here
}

// 
// Function: burn
procedure {:sourceloc "buggy_27.sol", 479, 3} {:message "DanPanCoin::burn"} burn#1769(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1759: int)
{
	var call_arg#133: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#133 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 480, 5} {:message ""} true;
	call _burn#1830(__this, __msg_sender, __msg_value, call_arg#133, amount#1759);
	$return66:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 482, 1} {:message "DanPanCoin::unhandledsend_unchk14"} unhandledsend_unchk14#1781(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1771: address_t)
{
	var call_arg#134: int;
	var __send_ret#135: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#134 := 5000000000000000000;
	assume {:sourceloc "buggy_27.sol", 483, 5} {:message ""} true;
	call __send_ret#135 := __send(callee#1771, __this, 0, call_arg#134);
	$return67:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 486, 3} {:message "DanPanCoin::_burn"} _burn#1830(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1783: address_t, amount#1785: int)
{
	var sub#139_ret#136: int;
	var sub#139_ret#137: int;
	var call_arg#138: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1785 != 0);
	assume (amount#1785 <= _balances#537[__this][account#1783]);
	assume {:sourceloc "buggy_27.sol", 489, 20} {:message ""} true;
	call sub#139_ret#136 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#654[__this], amount#1785);
	_totalSupply#654 := _totalSupply#654[__this := sub#139_ret#136];
	assume {:sourceloc "buggy_27.sol", 490, 26} {:message ""} true;
	call sub#139_ret#137 := sub#139(__this, __msg_sender, __msg_value, _balances#537[__this][account#1783], amount#1785);
	_balances#537 := _balances#537[__this := _balances#537[__this][account#1783 := sub#139_ret#137]];
	call_arg#138 := 0;
	assume {:sourceloc "buggy_27.sol", 491, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, account#1783, call_arg#138, amount#1785);
	$return68:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_27.sol", 493, 1} {:message "DanPanCoin::bug_unchk30"} bug_unchk30#1855(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 494, 1} {:message "receivers_unchk30"} receivers_unchk30#1834: int;
	var {:sourceloc "buggy_27.sol", 495, 1} {:message "addr_unchk30"} addr_unchk30#1837: address_t;
	var call_arg#139: int;
	var __send_ret#140: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#1834 := 0;
	addr_unchk30#1837 := 0;
	call_arg#139 := 42000000000000000000;
	assume {:sourceloc "buggy_27.sol", 496, 6} {:message ""} true;
	call __send_ret#140 := __send(addr_unchk30#1837, __this, 0, call_arg#139);
	if (!(__send_ret#140)) {
	receivers_unchk30#1834 := (receivers_unchk30#1834 + 1);
	}
	else {
	assume false;
	}

	$return69:
	// Function body ends here
}

// 
// Function: burnFrom
procedure {:sourceloc "buggy_27.sol", 502, 3} {:message "DanPanCoin::burnFrom"} burnFrom#1896(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1857: address_t, amount#1859: int)
{
	var sub#139_ret#141: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1859 <= _allowed#555[__this][account#1857][__msg_sender]);
	assume {:sourceloc "buggy_27.sol", 504, 37} {:message ""} true;
	call sub#139_ret#141 := sub#139(__this, __msg_sender, __msg_value, _allowed#555[__this][account#1857][__msg_sender], amount#1859);
	_allowed#555 := _allowed#555[__this := _allowed#555[__this][account#1857 := _allowed#555[__this][account#1857][__msg_sender := sub#139_ret#141]]];
	assume {:sourceloc "buggy_27.sol", 505, 5} {:message ""} true;
	call _burn#1830(__this, __msg_sender, __msg_value, account#1857, amount#1859);
	$return70:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_27.sol", 507, 1} {:message "payedOut_unchk8"} payedOut_unchk8#1899: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_27.sol", 508, 1} {:message "winner_unchk8"} winner_unchk8#1901: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_27.sol", 509, 1} {:message "winAmount_unchk8"} winAmount_unchk8#1903: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_27.sol", 511, 1} {:message "DanPanCoin::sendToWinner_unchk8"} sendToWinner_unchk8#1922(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#142: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#1899[__this]);
	assume {:sourceloc "buggy_27.sol", 513, 9} {:message ""} true;
	call __send_ret#142 := __send(winner_unchk8#1901[__this], __this, 0, winAmount_unchk8#1903[__this]);
	payedOut_unchk8#1899 := payedOut_unchk8#1899[__this := true];
	$return71:
	// Function body ends here
}

// 
// Function: NewDanPanAddress
procedure {:sourceloc "buggy_27.sol", 517, 3} {:message "DanPanCoin::NewDanPanAddress"} NewDanPanAddress#1948(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanaddress#1924: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#215[__this]);
	// Function body starts here
	assume (newDanPanaddress#1924 != 0);
	assume {:sourceloc "buggy_27.sol", 519, 12} {:message ""} true;
	call DanPanAddressChanged#761(__this, __msg_sender, __msg_value, DanPanAddress#716[__this], newDanPanaddress#1924);
	DanPanAddress#716 := DanPanAddress#716[__this := newDanPanaddress#1924];
	$return73:
	// Function body ends here
	$return72:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 522, 1} {:message "DanPanCoin::bug_unchk39"} bug_unchk39#1960(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1950: address_t)
{
	var call_arg#145: int;
	var __send_ret#146: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#145 := 4000000000000000000;
	assume {:sourceloc "buggy_27.sol", 523, 8} {:message ""} true;
	call __send_ret#146 := __send(addr#1950, __this, 0, call_arg#145);
	$return74:
	// Function body ends here
}

// 
// Function: NewDanPanPercent
procedure {:sourceloc "buggy_27.sol", 525, 3} {:message "DanPanCoin::NewDanPanPercent"} NewDanPanPercent#1977(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanpercent#1962: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#215[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 526, 12} {:message ""} true;
	call DanPanPercentChanged#734(__this, __msg_sender, __msg_value, dpPercent#697[__this], newDanPanpercent#1962);
	dpPercent#697 := dpPercent#697[__this := newDanPanpercent#1962];
	$return76:
	// Function body ends here
	$return75:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 529, 1} {:message "DanPanCoin::my_func_uncheck36"} my_func_uncheck36#1992(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1979: address_t)
{
	var __call_ret#149: bool;
	var __call_ret#150: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_27.sol", 530, 3} {:message ""} true;
	call __call_ret#149, __call_ret#150 := __call(dst#1979, __this, __msg_value);
	if (__call_ret#149) {
	havoc _balances#537;
	havoc _allowed#555;
	havoc payedOut_unchk21#603;
	havoc _totalSupply#654;
	havoc basePercent#670;
	havoc dpPercent#697;
	havoc DanPanAddress#716;
	havoc payedOut_unchk45#764;
	havoc whitelistFrom#830;
	havoc whitelistTo#848;
	havoc payedOut_unchk9#920;
	havoc payedOut_unchk20#1230;
	havoc winner_unchk20#1232;
	havoc winAmount_unchk20#1234;
	havoc payedOut_unchk32#1288;
	havoc winner_unchk32#1290;
	havoc winAmount_unchk32#1292;
	havoc payedOut_unchk8#1899;
	havoc winner_unchk8#1901;
	havoc winAmount_unchk8#1903;
	havoc payedOut_unchk44#2047;
	havoc winner_unchk44#2049;
	havoc winAmount_unchk44#2051;
	havoc owner#215;
	havoc payedOut_unchk33#218;
	havoc _name#363;
	havoc _symbol#380;
	havoc _decimals#397;
	havoc __balance;
	}

	if (!(__call_ret#149)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return77:
	// Function body ends here
}

// 
// Function: _isWhitelisted : function (address,address) view returns (bool)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 533, 3} {:message "DanPanCoin::_isWhitelisted"} _isWhitelisted#2010(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1994: address_t, _to#1996: address_t)
	returns (#1999: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1999 := (whitelistFrom#830[__this][_from#1994] || whitelistTo#848[__this][_to#1996]);
	goto $return78;
	$return78:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_27.sol", 537, 1} {:message "DanPanCoin::my_func_unchk35"} my_func_unchk35#2023(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#2012: address_t)
{
	var __send_ret#151: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 538, 9} {:message ""} true;
	call __send_ret#151 := __send(dst#2012, __this, 0, __msg_value);
	$return79:
	// Function body ends here
}

// 
// Function: setWhitelistedTo
procedure {:sourceloc "buggy_27.sol", 541, 5} {:message "DanPanCoin::setWhitelistedTo"} setWhitelistedTo#2044(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#2025: address_t, _whitelisted#2027: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#215[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 542, 14} {:message ""} true;
	call WhitelistTo#813(__this, __msg_sender, __msg_value, _addr#2025, _whitelisted#2027);
	whitelistTo#848 := whitelistTo#848[__this := whitelistTo#848[__this][_addr#2025 := _whitelisted#2027]];
	$return81:
	// Function body ends here
	$return80:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_27.sol", 545, 1} {:message "payedOut_unchk44"} payedOut_unchk44#2047: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_27.sol", 546, 1} {:message "winner_unchk44"} winner_unchk44#2049: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_27.sol", 547, 1} {:message "winAmount_unchk44"} winAmount_unchk44#2051: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_27.sol", 549, 1} {:message "DanPanCoin::sendToWinner_unchk44"} sendToWinner_unchk44#2070(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#154: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#2047[__this]);
	assume {:sourceloc "buggy_27.sol", 551, 9} {:message ""} true;
	call __send_ret#154 := __send(winner_unchk44#2049[__this], __this, 0, winAmount_unchk44#2051[__this]);
	payedOut_unchk44#2047 := payedOut_unchk44#2047[__this := true];
	$return82:
	// Function body ends here
}

// 
// Function: setWhitelistedFrom
procedure {:sourceloc "buggy_27.sol", 555, 5} {:message "DanPanCoin::setWhitelistedFrom"} setWhitelistedFrom#2091(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#2072: address_t, _whitelisted#2074: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#215[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 556, 14} {:message ""} true;
	call WhitelistFrom#791(__this, __msg_sender, __msg_value, _addr#2072, _whitelisted#2074);
	whitelistFrom#830 := whitelistFrom#830[__this := whitelistFrom#830[__this][_addr#2072 := _whitelisted#2074]];
	$return84:
	// Function body ends here
	$return83:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_27.sol", 559, 1} {:message "DanPanCoin::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#2106(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 560, 4} {:message "addr_unchk40"} addr_unchk40#2095: address_t;
	var call_arg#157: int;
	var __send_ret#158: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#2095 := 0;
	call_arg#157 := 2000000000000000000;
	assume {:sourceloc "buggy_27.sol", 561, 10} {:message ""} true;
	call __send_ret#158 := __send(addr_unchk40#2095, __this, 0, call_arg#157);
	if (!(__send_ret#158)) {
	
	}
	else {
	
	}

	$return85:
	// Function body ends here
}

