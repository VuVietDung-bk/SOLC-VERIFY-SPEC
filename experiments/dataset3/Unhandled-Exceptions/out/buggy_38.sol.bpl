// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_38.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_38.sol", 15, 3} {:message "[event] IERC20::Transfer"} Transfer#59(__this: address_t, __msg_sender: address_t, __msg_value: int, from#53: address_t, to#55: address_t, value#57: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_38.sol", 16, 3} {:message "[event] IERC20::Approval"} Approval#67(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#61: address_t, spender#63: address_t, value#65: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_38.sol", 8, 3} {:message "IERC20::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_38.sol", 9, 3} {:message "IERC20::balanceOf"} balanceOf#13(__this: address_t, __msg_sender: address_t, __msg_value: int, who#8: address_t)
	returns (#11: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_38.sol", 10, 3} {:message "IERC20::allowance"} allowance#22(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#15: address_t, spender#17: address_t)
	returns (#20: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_38.sol", 11, 3} {:message "IERC20::transfer"} transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_38.sol", 12, 3} {:message "IERC20::approve"} approve#40(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#33: address_t, value#35: int)
	returns (#38: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_38.sol", 13, 3} {:message "IERC20::transferFrom"} transferFrom#51(__this: address_t, __msg_sender: address_t, __msg_value: int, from#42: address_t, to#44: address_t, value#46: int)
	returns (#49: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_38.sol", 7, 1} {:message "IERC20::[implicit_constructor]"} __constructor#68(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 20, 3} {:message "SafeMath::mul"} mul#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#70: int, b#72: int)
	returns (#75: int)
{
	var {:sourceloc "buggy_38.sol", 24, 5} {:message "c"} c#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#70 == 0)) {
	#75 := 0;
	goto $return0;
	}

	c#85 := (a#70 * b#72);
	assert {:sourceloc "buggy_38.sol", 25, 5} {:message "Assertion might not hold."} ((c#85 div a#70) == b#72);
	#75 := c#85;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 29, 3} {:message "SafeMath::div"} div#119(__this: address_t, __msg_sender: address_t, __msg_value: int, a#103: int, b#105: int)
	returns (#108: int)
{
	var {:sourceloc "buggy_38.sol", 30, 5} {:message "c"} c#111: int;
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
procedure {:inline 1} {:sourceloc "buggy_38.sol", 34, 3} {:message "SafeMath::sub"} sub#139(__this: address_t, __msg_sender: address_t, __msg_value: int, a#121: int, b#123: int)
	returns (#126: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_38.sol", 35, 5} {:message "Assertion might not hold."} (b#123 <= a#121);
	#126 := (a#121 - b#123);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 39, 3} {:message "SafeMath::add"} add#163(__this: address_t, __msg_sender: address_t, __msg_value: int, a#141: int, b#143: int)
	returns (#146: int)
{
	var {:sourceloc "buggy_38.sol", 40, 5} {:message "c"} c#149: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#149 := (a#141 + b#143);
	assert {:sourceloc "buggy_38.sol", 41, 5} {:message "Assertion might not hold."} (c#149 >= a#141);
	#146 := c#149;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 45, 3} {:message "SafeMath::ceil"} ceil#195(__this: address_t, __msg_sender: address_t, __msg_value: int, a#165: int, m#167: int)
	returns (#170: int)
{
	var {:sourceloc "buggy_38.sol", 46, 5} {:message "c"} c#173: int;
	var add#163_ret#0: int;
	var {:sourceloc "buggy_38.sol", 47, 5} {:message "d"} d#180: int;
	var call_arg#1: int;
	var sub#139_ret#2: int;
	var div#119_ret#3: int;
	var mul#101_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_38.sol", 46, 17} {:message ""} true;
	call add#163_ret#0 := add#163(__this, __msg_sender, __msg_value, a#165, m#167);
	c#173 := add#163_ret#0;
	call_arg#1 := 1;
	assume {:sourceloc "buggy_38.sol", 47, 17} {:message ""} true;
	call sub#139_ret#2 := sub#139(__this, __msg_sender, __msg_value, c#173, call_arg#1);
	d#180 := sub#139_ret#2;
	assume {:sourceloc "buggy_38.sol", 48, 16} {:message ""} true;
	call div#119_ret#3 := div#119(__this, __msg_sender, __msg_value, d#180, m#167);
	assume {:sourceloc "buggy_38.sol", 48, 12} {:message ""} true;
	call mul#101_ret#4 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#3, m#167);
	#170 := mul#101_ret#4;
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_38.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Detailed -------
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
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_38.sol", 54, 1} {:message "ERC20Detailed::bug_unchk43"} bug_unchk43#219(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 55, 1} {:message "addr_unchk43"} addr_unchk43#202: address_t;
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#202 := 0;
	call_arg#5 := 10000000000000000000;
	assume {:sourceloc "buggy_38.sol", 56, 6} {:message ""} true;
	call __send_ret#6 := __send(addr_unchk43#202, __this, 0, call_arg#5);
	if ((!(__send_ret#6) || (1 == 1))) {
	assume false;
	}

	$return5:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_38.sol", 59, 3} {:message "_name"} _name#221: [address_t]int_arr_type;
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
procedure {:sourceloc "buggy_38.sol", 60, 1} {:message "ERC20Detailed::my_func_uncheck48"} my_func_uncheck48#236(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#223: address_t)
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
	assume {:sourceloc "buggy_38.sol", 61, 9} {:message ""} true;
	call __call_ret#7, __call_ret#8 := __call(dst#223, __this, __msg_value);
	if (__call_ret#7) {
	havoc _name#221;
	havoc _symbol#238;
	havoc _decimals#257;
	havoc payedOut_unchk32#282;
	havoc winner_unchk32#284;
	havoc winAmount_unchk32#286;
	havoc __balance;
	}

	if (!(__call_ret#7)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_38.sol", 63, 3} {:message "_symbol"} _symbol#238: [address_t]int_arr_type;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_38.sol", 64, 1} {:message "ERC20Detailed::withdrawBal_unchk17"} withdrawBal_unchk17#255(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 65, 2} {:message "Balances_unchk17"} Balances_unchk17#242: int;
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#242 := 0;
	call_arg#9 := Balances_unchk17#242;
	assume {:sourceloc "buggy_38.sol", 66, 2} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, call_arg#9);
	$return7:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_38.sol", 67, 3} {:message "_decimals"} _decimals#257: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_38.sol", 69, 3} {:message "ERC20Detailed::[constructor]"} __constructor#381(__this: address_t, __msg_sender: address_t, __msg_value: int, name#259: int_arr_ptr, symbol#261: int_arr_ptr, decimals#263: int)
{
	// TCC assumptions
	assume (name#259 < __alloc_counter);
	assume (symbol#261 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#221 := _name#221[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#238 := _symbol#238[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#257 := _decimals#257[__this := 0];
	payedOut_unchk32#282 := payedOut_unchk32#282[__this := false];
	winner_unchk32#284 := winner_unchk32#284[__this := 0];
	winAmount_unchk32#286 := winAmount_unchk32#286[__this := 0];
	// Function body starts here
	_name#221 := _name#221[__this := mem_arr_int[name#259]];
	_symbol#238 := _symbol#238[__this := mem_arr_int[symbol#261]];
	_decimals#257 := _decimals#257[__this := decimals#263];
	$return8:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_38.sol", 74, 1} {:message "payedOut_unchk32"} payedOut_unchk32#282: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_38.sol", 75, 1} {:message "winner_unchk32"} winner_unchk32#284: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_38.sol", 76, 1} {:message "winAmount_unchk32"} winAmount_unchk32#286: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_38.sol", 78, 1} {:message "ERC20Detailed::sendToWinner_unchk32"} sendToWinner_unchk32#305(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#282[__this]);
	assume {:sourceloc "buggy_38.sol", 80, 9} {:message ""} true;
	call __send_ret#11 := __send(winner_unchk32#284[__this], __this, 0, winAmount_unchk32#286[__this]);
	payedOut_unchk32#282 := payedOut_unchk32#282[__this := true];
	$return9:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_38.sol", 84, 3} {:message "ERC20Detailed::name"} name#313(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#308: int_arr_ptr)
{
	var new_array#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#12 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#308 := new_array#12;
	mem_arr_int := mem_arr_int[#308 := _name#221[__this]];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 87, 1} {:message "ERC20Detailed::unhandledsend_unchk38"} unhandledsend_unchk38#325(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#315: address_t)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#13 := 5000000000000000000;
	assume {:sourceloc "buggy_38.sol", 88, 5} {:message ""} true;
	call __send_ret#14 := __send(callee#315, __this, 0, call_arg#13);
	$return11:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_38.sol", 91, 3} {:message "ERC20Detailed::symbol"} symbol#333(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#328: int_arr_ptr)
{
	var new_array#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#15 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#328 := new_array#15;
	mem_arr_int := mem_arr_int[#328 := _symbol#238[__this]];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_38.sol", 94, 1} {:message "ERC20Detailed::cash_unchk46"} cash_unchk46#357(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#335: int, subpotIndex#337: int, winner_unchk46#339: address_t)
{
	var {:sourceloc "buggy_38.sol", 95, 9} {:message "subpot_unchk46"} subpot_unchk46#343: int;
	var call_arg#16: int;
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#343 := 3000000000000000000;
	call_arg#16 := subpot_unchk46#343;
	assume {:sourceloc "buggy_38.sol", 96, 9} {:message ""} true;
	call __send_ret#17 := __send(winner_unchk46#339, __this, 0, call_arg#16);
	subpot_unchk46#343 := 0;
	$return13:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_38.sol", 100, 3} {:message "ERC20Detailed::decimals"} decimals#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#360: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#360 := _decimals#257[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_38.sol", 103, 1} {:message "ERC20Detailed::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#380(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 104, 4} {:message "addr_unchk4"} addr_unchk4#369: address_t;
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#369 := 0;
	call_arg#18 := 42000000000000000000;
	assume {:sourceloc "buggy_38.sol", 105, 10} {:message ""} true;
	call __send_ret#19 := __send(addr_unchk4#369, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	
	}
	else {
	
	}

	$return15:
	// Function body ends here
}

// 
// ------- Contract: BIGBOMBv2 -------
// Inherits from: ERC20Detailed
// Using library SafeMath for uint256
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 117, 1} {:message "BIGBOMBv2::callnotchecked_unchk37"} callnotchecked_unchk37#400(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#388: address_t)
{
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_38.sol", 118, 3} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(callee#388, __this, 1000000000000000000);
	if (__call_ret#20) {
	havoc _balances#404;
	havoc _allowed#422;
	havoc payedOut_unchk9#425;
	havoc _totalSupply#505;
	havoc payedOut_unchk20#508;
	havoc winner_unchk20#510;
	havoc winAmount_unchk20#512;
	havoc basePercent#534;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc payedOut_unchk44#1040;
	havoc winner_unchk44#1042;
	havoc winAmount_unchk44#1044;
	havoc payedOut_unchk33#1183;
	havoc payedOut_unchk45#1335;
	havoc _name#221;
	havoc _symbol#238;
	havoc _decimals#257;
	havoc payedOut_unchk32#282;
	havoc winner_unchk32#284;
	havoc winAmount_unchk32#286;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_38.sol", 120, 3} {:message "_balances"} _balances#404: [address_t][address_t]int;
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 121, 1} {:message "BIGBOMBv2::bug_unchk3"} bug_unchk3#416(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#406: address_t)
{
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#22 := 42000000000000000000;
	assume {:sourceloc "buggy_38.sol", 122, 8} {:message ""} true;
	call __send_ret#23 := __send(addr#406, __this, 0, call_arg#22);
	$return17:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_38.sol", 123, 3} {:message "_allowed"} _allowed#422: [address_t][address_t][address_t]int;
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_38.sol", 125, 1} {:message "payedOut_unchk9"} payedOut_unchk9#425: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_38.sol", 127, 1} {:message "BIGBOMBv2::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#446(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#425[__this];
	assume {:sourceloc "buggy_38.sol", 129, 3} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return18:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 132, 1} {:message "BIGBOMBv2::callnotchecked_unchk25"} callnotchecked_unchk25#463(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#451: address_t)
{
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_38.sol", 133, 3} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(callee#451, __this, 1000000000000000000);
	if (__call_ret#25) {
	havoc _balances#404;
	havoc _allowed#422;
	havoc payedOut_unchk9#425;
	havoc _totalSupply#505;
	havoc payedOut_unchk20#508;
	havoc winner_unchk20#510;
	havoc winAmount_unchk20#512;
	havoc basePercent#534;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc payedOut_unchk44#1040;
	havoc winner_unchk44#1042;
	havoc winAmount_unchk44#1044;
	havoc payedOut_unchk33#1183;
	havoc payedOut_unchk45#1335;
	havoc _name#221;
	havoc _symbol#238;
	havoc _decimals#257;
	havoc payedOut_unchk32#282;
	havoc winner_unchk32#284;
	havoc winAmount_unchk32#286;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_38.sol", 136, 1} {:message "BIGBOMBv2::bug_unchk19"} bug_unchk19#487(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 137, 1} {:message "addr_unchk19"} addr_unchk19#470: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#470 := 0;
	call_arg#27 := 10000000000000000000;
	assume {:sourceloc "buggy_38.sol", 138, 6} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk19#470, __this, 0, call_arg#27);
	if ((!(__send_ret#28) || (1 == 1))) {
	assume false;
	}

	$return20:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 142, 1} {:message "BIGBOMBv2::unhandledsend_unchk26"} unhandledsend_unchk26#502(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#492: address_t)
{
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := 5000000000000000000;
	assume {:sourceloc "buggy_38.sol", 143, 5} {:message ""} true;
	call __send_ret#30 := __send(callee#492, __this, 0, call_arg#29);
	$return21:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_38.sol", 145, 3} {:message "_totalSupply"} _totalSupply#505: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_38.sol", 146, 1} {:message "payedOut_unchk20"} payedOut_unchk20#508: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_38.sol", 147, 1} {:message "winner_unchk20"} winner_unchk20#510: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_38.sol", 148, 1} {:message "winAmount_unchk20"} winAmount_unchk20#512: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_38.sol", 150, 1} {:message "BIGBOMBv2::sendToWinner_unchk20"} sendToWinner_unchk20#531(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#508[__this]);
	assume {:sourceloc "buggy_38.sol", 152, 9} {:message ""} true;
	call __send_ret#31 := __send(winner_unchk20#510[__this], __this, 0, winAmount_unchk20#512[__this]);
	payedOut_unchk20#508 := payedOut_unchk20#508[__this := true];
	$return22:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_38.sol", 155, 3} {:message "basePercent"} basePercent#534: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_38.sol", 157, 3} {:message "BIGBOMBv2::[constructor]"} __constructor#1414(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#536: int_arr_ptr, _symbol#538: int_arr_ptr, _decimals#540: int)
{
	var name#259#32: int_arr_ptr;
	var symbol#261#32: int_arr_ptr;
	var decimals#263#32: int;
	var call_arg#34: address_t;
	// TCC assumptions
	assume (_name#536 < __alloc_counter);
	assume (_symbol#538 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#404 := _balances#404[__this := default_address_t_int()];
	_allowed#422 := _allowed#422[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk9#425 := payedOut_unchk9#425[__this := false];
	_totalSupply#505 := _totalSupply#505[__this := 800000000000000000000000];
	payedOut_unchk20#508 := payedOut_unchk20#508[__this := false];
	winner_unchk20#510 := winner_unchk20#510[__this := 0];
	winAmount_unchk20#512 := winAmount_unchk20#512[__this := 0];
	basePercent#534 := basePercent#534[__this := 100];
	payedOut_unchk8#695 := payedOut_unchk8#695[__this := false];
	winner_unchk8#697 := winner_unchk8#697[__this := 0];
	winAmount_unchk8#699 := winAmount_unchk8#699[__this := 0];
	payedOut_unchk44#1040 := payedOut_unchk44#1040[__this := false];
	winner_unchk44#1042 := winner_unchk44#1042[__this := 0];
	winAmount_unchk44#1044 := winAmount_unchk44#1044[__this := 0];
	payedOut_unchk33#1183 := payedOut_unchk33#1183[__this := false];
	payedOut_unchk45#1335 := payedOut_unchk45#1335[__this := false];
	_name#221 := _name#221[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#238 := _symbol#238[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#257 := _decimals#257[__this := 0];
	payedOut_unchk32#282 := payedOut_unchk32#282[__this := false];
	winner_unchk32#284 := winner_unchk32#284[__this := 0];
	winAmount_unchk32#286 := winAmount_unchk32#286[__this := 0];
	// Arguments for ERC20Detailed
	name#259#32 := _name#536;
	symbol#261#32 := _symbol#538;
	decimals#263#32 := _decimals#540;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#221 := _name#221[__this := mem_arr_int[name#259#32]];
	_symbol#238 := _symbol#238[__this := mem_arr_int[symbol#261#32]];
	_decimals#257 := _decimals#257[__this := decimals#263#32];
	$return23:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#34 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 158, 5} {:message ""} true;
	call _mint#1238(__this, __msg_sender, __msg_value, call_arg#34, _totalSupply#505[__this]);
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_38.sol", 160, 1} {:message "BIGBOMBv2::bug_unchk7"} bug_unchk7#576(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 161, 1} {:message "addr_unchk7"} addr_unchk7#559: address_t;
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#559 := 0;
	call_arg#35 := 10000000000000000000;
	assume {:sourceloc "buggy_38.sol", 162, 6} {:message ""} true;
	call __send_ret#36 := __send(addr_unchk7#559, __this, 0, call_arg#35);
	if ((!(__send_ret#36) || (1 == 1))) {
	assume false;
	}

	$return25:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 166, 3} {:message "BIGBOMBv2::totalSupply"} totalSupply#585(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#580: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#580 := _totalSupply#505[__this];
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 169, 1} {:message "BIGBOMBv2::my_func_unchk23"} my_func_unchk23#598(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#587: address_t)
{
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_38.sol", 170, 9} {:message ""} true;
	call __send_ret#37 := __send(dst#587, __this, 0, __msg_value);
	$return27:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 173, 3} {:message "BIGBOMBv2::balanceOf"} balanceOf#611(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#600: address_t)
	returns (#604: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#604 := _balances#404[__this][owner#600];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 176, 1} {:message "BIGBOMBv2::unhandledsend_unchk14"} unhandledsend_unchk14#623(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#613: address_t)
{
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#38 := 5000000000000000000;
	assume {:sourceloc "buggy_38.sol", 177, 5} {:message ""} true;
	call __send_ret#39 := __send(callee#613, __this, 0, call_arg#38);
	$return29:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 180, 3} {:message "BIGBOMBv2::allowance"} allowance#640(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#625: address_t, spender#627: address_t)
	returns (#631: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#631 := _allowed#422[__this][owner#625][spender#627];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_38.sol", 183, 1} {:message "BIGBOMBv2::bug_unchk30"} bug_unchk30#665(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 184, 1} {:message "receivers_unchk30"} receivers_unchk30#644: int;
	var {:sourceloc "buggy_38.sol", 185, 1} {:message "addr_unchk30"} addr_unchk30#647: address_t;
	var call_arg#40: int;
	var __send_ret#41: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#644 := 0;
	addr_unchk30#647 := 0;
	call_arg#40 := 42000000000000000000;
	assume {:sourceloc "buggy_38.sol", 186, 6} {:message ""} true;
	call __send_ret#41 := __send(addr_unchk30#647, __this, 0, call_arg#40);
	if (!(__send_ret#41)) {
	receivers_unchk30#644 := (receivers_unchk30#644 + 1);
	}
	else {
	assume false;
	}

	$return31:
	// Function body ends here
}

// 
// Function: findfourPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_38.sol", 192, 3} {:message "BIGBOMBv2::findfourPercent"} findfourPercent#692(__this: address_t, __msg_sender: address_t, __msg_value: int, value#667: int)
	returns (#670: int)
{
	var {:sourceloc "buggy_38.sol", 193, 5} {:message "roundValue"} roundValue#673: int;
	var ceil#195_ret#42: int;
	var {:sourceloc "buggy_38.sol", 194, 5} {:message "fourPercent"} fourPercent#680: int;
	var mul#101_ret#43: int;
	var call_arg#44: int;
	var div#119_ret#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_38.sol", 193, 26} {:message ""} true;
	call ceil#195_ret#42 := ceil#195(__this, __msg_sender, __msg_value, value#667, basePercent#534[__this]);
	roundValue#673 := ceil#195_ret#42;
	assume {:sourceloc "buggy_38.sol", 194, 27} {:message ""} true;
	call mul#101_ret#43 := mul#101(__this, __msg_sender, __msg_value, roundValue#673, basePercent#534[__this]);
	call_arg#44 := 2500;
	assume {:sourceloc "buggy_38.sol", 194, 27} {:message ""} true;
	call div#119_ret#45 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#43, call_arg#44);
	fourPercent#680 := div#119_ret#45;
	#670 := fourPercent#680;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_38.sol", 197, 1} {:message "payedOut_unchk8"} payedOut_unchk8#695: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_38.sol", 198, 1} {:message "winner_unchk8"} winner_unchk8#697: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_38.sol", 199, 1} {:message "winAmount_unchk8"} winAmount_unchk8#699: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_38.sol", 201, 1} {:message "BIGBOMBv2::sendToWinner_unchk8"} sendToWinner_unchk8#718(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#695[__this]);
	assume {:sourceloc "buggy_38.sol", 203, 9} {:message ""} true;
	call __send_ret#46 := __send(winner_unchk8#697[__this], __this, 0, winAmount_unchk8#699[__this]);
	payedOut_unchk8#695 := payedOut_unchk8#695[__this := true];
	$return33:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 207, 3} {:message "BIGBOMBv2::transfer"} transfer#810(__this: address_t, __msg_sender: address_t, __msg_value: int, to#720: address_t, value#722: int)
	returns (#726: bool)
{
	var {:sourceloc "buggy_38.sol", 211, 5} {:message "tokensToBurn"} tokensToBurn#747: int;
	var findfourPercent#692_ret#47: int;
	var {:sourceloc "buggy_38.sol", 212, 5} {:message "tokensToTransfer"} tokensToTransfer#753: int;
	var sub#139_ret#48: int;
	var sub#139_ret#49: int;
	var add#163_ret#50: int;
	var sub#139_ret#51: int;
	var call_arg#52: address_t;
	var call_arg#53: address_t;
	var call_arg#54: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#722 <= _balances#404[__this][__msg_sender]);
	assume (to#720 != 0);
	assume {:sourceloc "buggy_38.sol", 211, 28} {:message ""} true;
	call findfourPercent#692_ret#47 := findfourPercent#692(__this, __msg_sender, __msg_value, value#722);
	tokensToBurn#747 := findfourPercent#692_ret#47;
	assume {:sourceloc "buggy_38.sol", 212, 32} {:message ""} true;
	call sub#139_ret#48 := sub#139(__this, __msg_sender, __msg_value, value#722, tokensToBurn#747);
	tokensToTransfer#753 := sub#139_ret#48;
	assume {:sourceloc "buggy_38.sol", 214, 29} {:message ""} true;
	call sub#139_ret#49 := sub#139(__this, __msg_sender, __msg_value, _balances#404[__this][__msg_sender], value#722);
	_balances#404 := _balances#404[__this := _balances#404[__this][__msg_sender := sub#139_ret#49]];
	assume {:sourceloc "buggy_38.sol", 215, 21} {:message ""} true;
	call add#163_ret#50 := add#163(__this, __msg_sender, __msg_value, _balances#404[__this][to#720], tokensToTransfer#753);
	_balances#404 := _balances#404[__this := _balances#404[__this][to#720 := add#163_ret#50]];
	assume {:sourceloc "buggy_38.sol", 217, 20} {:message ""} true;
	call sub#139_ret#51 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#505[__this], tokensToBurn#747);
	_totalSupply#505 := _totalSupply#505[__this := sub#139_ret#51];
	call_arg#52 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 219, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#52, to#720, tokensToTransfer#753);
	call_arg#53 := __msg_sender;
	call_arg#54 := 0;
	assume {:sourceloc "buggy_38.sol", 220, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#53, call_arg#54, tokensToBurn#747);
	#726 := true;
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 223, 1} {:message "BIGBOMBv2::bug_unchk39"} bug_unchk39#822(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#812: address_t)
{
	var call_arg#55: int;
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#55 := 4000000000000000000;
	assume {:sourceloc "buggy_38.sol", 224, 8} {:message ""} true;
	call __send_ret#56 := __send(addr#812, __this, 0, call_arg#55);
	$return35:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_38.sol", 226, 3} {:message "BIGBOMBv2::multiTransfer"} multiTransfer#854(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#825: address_t_arr_ptr, amounts#828: int_arr_ptr)
{
	var {:sourceloc "buggy_38.sol", 227, 10} {:message "i"} i#832: int;
	var transfer#810_ret#59: bool;
	var tmp#60: int;
	// TCC assumptions
	assume (receivers#825 < __alloc_counter);
	assume (amounts#828 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#832 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#825])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#825]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#832 < length#address_t_arr#constr(mem_arr_address_t[receivers#825]))) {
	// Body
	assume {:sourceloc "buggy_38.sol", 228, 7} {:message ""} true;
	call transfer#810_ret#59 := transfer#810(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#825])[i#832], arr#int_arr#constr(mem_arr_int[amounts#828])[i#832]);
	$continue57:
	// Loop expression
	tmp#60 := i#832;
	i#832 := (i#832 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#825])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#825]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break58:
	$return36:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 231, 1} {:message "BIGBOMBv2::my_func_uncheck36"} my_func_uncheck36#869(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#856: address_t)
{
	var __call_ret#61: bool;
	var __call_ret#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_38.sol", 232, 3} {:message ""} true;
	call __call_ret#61, __call_ret#62 := __call(dst#856, __this, __msg_value);
	if (__call_ret#61) {
	havoc _balances#404;
	havoc _allowed#422;
	havoc payedOut_unchk9#425;
	havoc _totalSupply#505;
	havoc payedOut_unchk20#508;
	havoc winner_unchk20#510;
	havoc winAmount_unchk20#512;
	havoc basePercent#534;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc payedOut_unchk44#1040;
	havoc winner_unchk44#1042;
	havoc winAmount_unchk44#1044;
	havoc payedOut_unchk33#1183;
	havoc payedOut_unchk45#1335;
	havoc _name#221;
	havoc _symbol#238;
	havoc _decimals#257;
	havoc payedOut_unchk32#282;
	havoc winner_unchk32#284;
	havoc winAmount_unchk32#286;
	havoc __balance;
	}

	if (!(__call_ret#61)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return37:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 235, 3} {:message "BIGBOMBv2::approve"} approve#907(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#871: address_t, value#873: int)
	returns (#877: bool)
{
	var call_arg#63: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#871 != 0);
	_allowed#422 := _allowed#422[__this := _allowed#422[__this][__msg_sender := _allowed#422[__this][__msg_sender][spender#871 := value#873]]];
	call_arg#63 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 238, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#63, spender#871, value#873);
	#877 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 241, 1} {:message "BIGBOMBv2::my_func_unchk35"} my_func_unchk35#920(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#909: address_t)
{
	var __send_ret#64: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_38.sol", 242, 9} {:message ""} true;
	call __send_ret#64 := __send(dst#909, __this, 0, __msg_value);
	$return39:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 245, 3} {:message "BIGBOMBv2::transferFrom"} transferFrom#1037(__this: address_t, __msg_sender: address_t, __msg_value: int, from#922: address_t, to#924: address_t, value#926: int)
	returns (#930: bool)
{
	var sub#139_ret#65: int;
	var {:sourceloc "buggy_38.sol", 252, 5} {:message "tokensToBurn"} tokensToBurn#972: int;
	var findfourPercent#692_ret#66: int;
	var {:sourceloc "buggy_38.sol", 253, 5} {:message "tokensToTransfer"} tokensToTransfer#978: int;
	var sub#139_ret#67: int;
	var add#163_ret#68: int;
	var sub#139_ret#69: int;
	var sub#139_ret#70: int;
	var call_arg#71: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#926 <= _balances#404[__this][from#922]);
	assume (value#926 <= _allowed#422[__this][from#922][__msg_sender]);
	assume (to#924 != 0);
	assume {:sourceloc "buggy_38.sol", 250, 23} {:message ""} true;
	call sub#139_ret#65 := sub#139(__this, __msg_sender, __msg_value, _balances#404[__this][from#922], value#926);
	_balances#404 := _balances#404[__this := _balances#404[__this][from#922 := sub#139_ret#65]];
	assume {:sourceloc "buggy_38.sol", 252, 28} {:message ""} true;
	call findfourPercent#692_ret#66 := findfourPercent#692(__this, __msg_sender, __msg_value, value#926);
	tokensToBurn#972 := findfourPercent#692_ret#66;
	assume {:sourceloc "buggy_38.sol", 253, 32} {:message ""} true;
	call sub#139_ret#67 := sub#139(__this, __msg_sender, __msg_value, value#926, tokensToBurn#972);
	tokensToTransfer#978 := sub#139_ret#67;
	assume {:sourceloc "buggy_38.sol", 255, 21} {:message ""} true;
	call add#163_ret#68 := add#163(__this, __msg_sender, __msg_value, _balances#404[__this][to#924], tokensToTransfer#978);
	_balances#404 := _balances#404[__this := _balances#404[__this][to#924 := add#163_ret#68]];
	assume {:sourceloc "buggy_38.sol", 256, 20} {:message ""} true;
	call sub#139_ret#69 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#505[__this], tokensToBurn#972);
	_totalSupply#505 := _totalSupply#505[__this := sub#139_ret#69];
	assume {:sourceloc "buggy_38.sol", 258, 34} {:message ""} true;
	call sub#139_ret#70 := sub#139(__this, __msg_sender, __msg_value, _allowed#422[__this][from#922][__msg_sender], value#926);
	_allowed#422 := _allowed#422[__this := _allowed#422[__this][from#922 := _allowed#422[__this][from#922][__msg_sender := sub#139_ret#70]]];
	assume {:sourceloc "buggy_38.sol", 260, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#922, to#924, tokensToTransfer#978);
	call_arg#71 := 0;
	assume {:sourceloc "buggy_38.sol", 261, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#922, call_arg#71, tokensToBurn#972);
	#930 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_38.sol", 265, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1040: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_38.sol", 266, 1} {:message "winner_unchk44"} winner_unchk44#1042: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_38.sol", 267, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1044: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_38.sol", 269, 1} {:message "BIGBOMBv2::sendToWinner_unchk44"} sendToWinner_unchk44#1063(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#72: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1040[__this]);
	assume {:sourceloc "buggy_38.sol", 271, 9} {:message ""} true;
	call __send_ret#72 := __send(winner_unchk44#1042[__this], __this, 0, winAmount_unchk44#1044[__this]);
	payedOut_unchk44#1040 := payedOut_unchk44#1040[__this := true];
	$return41:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 275, 3} {:message "BIGBOMBv2::increaseAllowance"} increaseAllowance#1114(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1065: address_t, addedValue#1067: int)
	returns (#1070: bool)
{
	var add#163_ret#73: int;
	var call_arg#74: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1065 != 0);
	assume {:sourceloc "buggy_38.sol", 277, 38} {:message ""} true;
	call add#163_ret#73 := add#163(__this, __msg_sender, __msg_value, _allowed#422[__this][__msg_sender][spender#1065], addedValue#1067);
	_allowed#422 := _allowed#422[__this := _allowed#422[__this][__msg_sender := _allowed#422[__this][__msg_sender][spender#1065 := add#163_ret#73]]];
	call_arg#74 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 278, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#74, spender#1065, _allowed#422[__this][__msg_sender][spender#1065]);
	#1070 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_38.sol", 281, 1} {:message "BIGBOMBv2::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1129(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 282, 4} {:message "addr_unchk40"} addr_unchk40#1118: address_t;
	var call_arg#75: int;
	var __send_ret#76: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1118 := 0;
	call_arg#75 := 2000000000000000000;
	assume {:sourceloc "buggy_38.sol", 283, 10} {:message ""} true;
	call __send_ret#76 := __send(addr_unchk40#1118, __this, 0, call_arg#75);
	if (!(__send_ret#76)) {
	
	}
	else {
	
	}

	$return43:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_38.sol", 291, 3} {:message "BIGBOMBv2::decreaseAllowance"} decreaseAllowance#1180(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1131: address_t, subtractedValue#1133: int)
	returns (#1136: bool)
{
	var sub#139_ret#77: int;
	var call_arg#78: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1131 != 0);
	assume {:sourceloc "buggy_38.sol", 293, 38} {:message ""} true;
	call sub#139_ret#77 := sub#139(__this, __msg_sender, __msg_value, _allowed#422[__this][__msg_sender][spender#1131], subtractedValue#1133);
	_allowed#422 := _allowed#422[__this := _allowed#422[__this][__msg_sender := _allowed#422[__this][__msg_sender][spender#1131 := sub#139_ret#77]]];
	call_arg#78 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 294, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#78, spender#1131, _allowed#422[__this][__msg_sender][spender#1131]);
	#1136 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_38.sol", 297, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1183: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_38.sol", 299, 1} {:message "BIGBOMBv2::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1204(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#79: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1183[__this];
	assume {:sourceloc "buggy_38.sol", 301, 3} {:message ""} true;
	call __send_ret#79 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return45:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 304, 3} {:message "BIGBOMBv2::_mint"} _mint#1238(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1206: address_t, amount#1208: int)
{
	var add#163_ret#80: int;
	var call_arg#81: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1208 != 0);
	assume {:sourceloc "buggy_38.sol", 306, 26} {:message ""} true;
	call add#163_ret#80 := add#163(__this, __msg_sender, __msg_value, _balances#404[__this][account#1206], amount#1208);
	_balances#404 := _balances#404[__this := _balances#404[__this][account#1206 := add#163_ret#80]];
	call_arg#81 := 0;
	assume {:sourceloc "buggy_38.sol", 307, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#81, account#1206, amount#1208);
	$return46:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_38.sol", 309, 1} {:message "BIGBOMBv2::bug_unchk27"} bug_unchk27#1250(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1240: address_t)
{
	var call_arg#82: int;
	var __send_ret#83: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#82 := 42000000000000000000;
	assume {:sourceloc "buggy_38.sol", 310, 8} {:message ""} true;
	call __send_ret#83 := __send(addr#1240, __this, 0, call_arg#82);
	$return47:
	// Function body ends here
}

// 
// Function: burn
procedure {:sourceloc "buggy_38.sol", 312, 3} {:message "BIGBOMBv2::burn"} burn#1262(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1252: int)
{
	var call_arg#84: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#84 := __msg_sender;
	assume {:sourceloc "buggy_38.sol", 313, 5} {:message ""} true;
	call _burn#1332(__this, __msg_sender, __msg_value, call_arg#84, amount#1252);
	$return48:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_38.sol", 315, 1} {:message "BIGBOMBv2::bug_unchk31"} bug_unchk31#1283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_38.sol", 316, 1} {:message "addr_unchk31"} addr_unchk31#1266: address_t;
	var call_arg#85: int;
	var __send_ret#86: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#1266 := 0;
	call_arg#85 := 10000000000000000000;
	assume {:sourceloc "buggy_38.sol", 317, 6} {:message ""} true;
	call __send_ret#86 := __send(addr_unchk31#1266, __this, 0, call_arg#85);
	if ((!(__send_ret#86) || (1 == 1))) {
	assume false;
	}

	$return49:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_38.sol", 321, 3} {:message "BIGBOMBv2::_burn"} _burn#1332(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1285: address_t, amount#1287: int)
{
	var sub#139_ret#87: int;
	var sub#139_ret#88: int;
	var call_arg#89: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1287 != 0);
	assume (amount#1287 <= _balances#404[__this][account#1285]);
	assume {:sourceloc "buggy_38.sol", 324, 20} {:message ""} true;
	call sub#139_ret#87 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#505[__this], amount#1287);
	_totalSupply#505 := _totalSupply#505[__this := sub#139_ret#87];
	assume {:sourceloc "buggy_38.sol", 325, 26} {:message ""} true;
	call sub#139_ret#88 := sub#139(__this, __msg_sender, __msg_value, _balances#404[__this][account#1285], amount#1287);
	_balances#404 := _balances#404[__this := _balances#404[__this][account#1285 := sub#139_ret#88]];
	call_arg#89 := 0;
	assume {:sourceloc "buggy_38.sol", 326, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, account#1285, call_arg#89, amount#1287);
	$return50:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_38.sol", 328, 1} {:message "payedOut_unchk45"} payedOut_unchk45#1335: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_38.sol", 330, 1} {:message "BIGBOMBv2::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#1356(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#90: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#1335[__this];
	assume {:sourceloc "buggy_38.sol", 332, 3} {:message ""} true;
	call __send_ret#90 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return51:
	// Function body ends here
}

// 
// Function: burnFrom
procedure {:sourceloc "buggy_38.sol", 335, 3} {:message "BIGBOMBv2::burnFrom"} burnFrom#1397(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1358: address_t, amount#1360: int)
{
	var sub#139_ret#91: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1360 <= _allowed#422[__this][account#1358][__msg_sender]);
	assume {:sourceloc "buggy_38.sol", 337, 37} {:message ""} true;
	call sub#139_ret#91 := sub#139(__this, __msg_sender, __msg_value, _allowed#422[__this][account#1358][__msg_sender], amount#1360);
	_allowed#422 := _allowed#422[__this := _allowed#422[__this][account#1358 := _allowed#422[__this][account#1358][__msg_sender := sub#139_ret#91]]];
	assume {:sourceloc "buggy_38.sol", 338, 5} {:message ""} true;
	call _burn#1332(__this, __msg_sender, __msg_value, account#1358, amount#1360);
	$return52:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_38.sol", 340, 1} {:message "BIGBOMBv2::callnotchecked_unchk13"} callnotchecked_unchk13#1413(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1399: address_t)
{
	var __call_ret#92: bool;
	var __call_ret#93: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_38.sol", 341, 5} {:message ""} true;
	call __call_ret#92, __call_ret#93 := __call(callee#1399, __this, 1000000000000000000);
	if (__call_ret#92) {
	havoc _balances#404;
	havoc _allowed#422;
	havoc payedOut_unchk9#425;
	havoc _totalSupply#505;
	havoc payedOut_unchk20#508;
	havoc winner_unchk20#510;
	havoc winAmount_unchk20#512;
	havoc basePercent#534;
	havoc payedOut_unchk8#695;
	havoc winner_unchk8#697;
	havoc winAmount_unchk8#699;
	havoc payedOut_unchk44#1040;
	havoc winner_unchk44#1042;
	havoc winAmount_unchk44#1044;
	havoc payedOut_unchk33#1183;
	havoc payedOut_unchk45#1335;
	havoc _name#221;
	havoc _symbol#238;
	havoc _decimals#257;
	havoc payedOut_unchk32#282;
	havoc winner_unchk32#284;
	havoc winAmount_unchk32#286;
	havoc __balance;
	}

	if (!(__call_ret#92)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return53:
	// Function body ends here
}

