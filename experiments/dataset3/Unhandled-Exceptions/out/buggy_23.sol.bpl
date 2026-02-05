// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_23.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_23.sol", 26, 5} {:message "[event] IERC20::Transfer"} Transfer#60(__this: address_t, __msg_sender: address_t, __msg_value: int, from#54: address_t, to#56: address_t, value#58: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_23.sol", 28, 5} {:message "[event] IERC20::Approval"} Approval#68(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#62: address_t, spender#64: address_t, value#66: int)
{
	
}

// 
// Function: transfer
procedure {:sourceloc "buggy_23.sol", 14, 5} {:message "IERC20::transfer"} transfer#11(__this: address_t, __msg_sender: address_t, __msg_value: int, to#4: address_t, value#6: int)
	returns (#9: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_23.sol", 16, 5} {:message "IERC20::approve"} approve#20(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#13: address_t, value#15: int)
	returns (#18: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_23.sol", 18, 5} {:message "IERC20::transferFrom"} transferFrom#31(__this: address_t, __msg_sender: address_t, __msg_value: int, from#22: address_t, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: totalSupply
procedure {:sourceloc "buggy_23.sol", 20, 5} {:message "IERC20::totalSupply"} totalSupply#36(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#34: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_23.sol", 22, 5} {:message "IERC20::balanceOf"} balanceOf#43(__this: address_t, __msg_sender: address_t, __msg_value: int, who#38: address_t)
	returns (#41: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_23.sol", 24, 5} {:message "IERC20::allowance"} allowance#52(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#45: address_t, spender#47: address_t)
	returns (#50: int);

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 13, 1} {:message "IERC20::[implicit_constructor]"} __constructor#69(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 43, 5} {:message "SafeMath::mul"} mul#105(__this: address_t, __msg_sender: address_t, __msg_value: int, a#74: int, b#76: int)
	returns (#79: int)
{
	var {:sourceloc "buggy_23.sol", 51, 9} {:message "c"} c#89: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#74 == 0)) {
	#79 := 0;
	goto $return0;
	}

	c#89 := (a#74 * b#76);
	assume ((c#89 div a#74) == b#76);
	#79 := c#89;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 60, 5} {:message "SafeMath::div"} div#130(__this: address_t, __msg_sender: address_t, __msg_value: int, a#108: int, b#110: int)
	returns (#113: int)
{
	var {:sourceloc "buggy_23.sol", 63, 9} {:message "c"} c#122: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#110 > 0);
	c#122 := (a#108 div b#110);
	#113 := c#122;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 72, 5} {:message "SafeMath::sub"} sub#155(__this: address_t, __msg_sender: address_t, __msg_value: int, a#133: int, b#135: int)
	returns (#138: int)
{
	var {:sourceloc "buggy_23.sol", 74, 9} {:message "c"} c#147: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#135 <= a#133);
	c#147 := (a#133 - b#135);
	#138 := c#147;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 82, 5} {:message "SafeMath::add"} add#180(__this: address_t, __msg_sender: address_t, __msg_value: int, a#158: int, b#160: int)
	returns (#163: int)
{
	var {:sourceloc "buggy_23.sol", 83, 9} {:message "c"} c#166: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#166 := (a#158 + b#160);
	assume (c#166 >= a#158);
	#163 := c#166;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 93, 5} {:message "SafeMath::mod"} mod#201(__this: address_t, __msg_sender: address_t, __msg_value: int, a#183: int, b#185: int)
	returns (#188: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#185 != 0);
	#188 := (a#183 mod b#185);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 39, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#202(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Using library SafeMath for uint256
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
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 120, 3} {:message "ERC20::callnotchecked_unchk37"} callnotchecked_unchk37#223(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#211: address_t)
{
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_23.sol", 121, 9} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(callee#211, __this, 1000000000000000000);
	if (__call_ret#0) {
	havoc _balances#227;
	havoc _allowed#245;
	havoc payedOut_unchk9#248;
	havoc _totalSupply#271;
	havoc payedOut_unchk20#284;
	havoc winner_unchk20#286;
	havoc winAmount_unchk20#288;
	havoc payedOut_unchk32#324;
	havoc winner_unchk32#326;
	havoc winAmount_unchk32#328;
	havoc payedOut_unchk8#718;
	havoc winner_unchk8#720;
	havoc winAmount_unchk8#722;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 123, 3} {:message "_balances"} _balances#227: [address_t][address_t]int;
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
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 125, 3} {:message "ERC20::bug_unchk3"} bug_unchk3#239(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#229: address_t)
{
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#2 := 42000000000000000000;
	assume {:sourceloc "buggy_23.sol", 126, 8} {:message ""} true;
	call __send_ret#3 := __send(addr#229, __this, 0, call_arg#2);
	$return6:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_23.sol", 127, 3} {:message "_allowed"} _allowed#245: [address_t][address_t][address_t]int;
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_23.sol", 129, 3} {:message "payedOut_unchk9"} payedOut_unchk9#248: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_23.sol", 131, 1} {:message "ERC20::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#269(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#248[__this];
	assume {:sourceloc "buggy_23.sol", 133, 5} {:message ""} true;
	call __send_ret#4 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_23.sol", 135, 3} {:message "_totalSupply"} _totalSupply#271: [address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 140, 5} {:message "ERC20::totalSupply"} totalSupply#281(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#276: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#276 := _totalSupply#271[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_23.sol", 143, 1} {:message "payedOut_unchk20"} payedOut_unchk20#284: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_23.sol", 144, 1} {:message "winner_unchk20"} winner_unchk20#286: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_23.sol", 145, 1} {:message "winAmount_unchk20"} winAmount_unchk20#288: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_23.sol", 147, 1} {:message "ERC20::sendToWinner_unchk20"} sendToWinner_unchk20#307(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#284[__this]);
	assume {:sourceloc "buggy_23.sol", 149, 9} {:message ""} true;
	call __send_ret#5 := __send(winner_unchk20#286[__this], __this, 0, winAmount_unchk20#288[__this]);
	payedOut_unchk20#284 := payedOut_unchk20#284[__this := true];
	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 158, 5} {:message "ERC20::balanceOf"} balanceOf#321(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#310: address_t)
	returns (#314: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#314 := _balances#227[__this][owner#310];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_23.sol", 161, 1} {:message "payedOut_unchk32"} payedOut_unchk32#324: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_23.sol", 162, 1} {:message "winner_unchk32"} winner_unchk32#326: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_23.sol", 163, 1} {:message "winAmount_unchk32"} winAmount_unchk32#328: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_23.sol", 165, 1} {:message "ERC20::sendToWinner_unchk32"} sendToWinner_unchk32#347(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#324[__this]);
	assume {:sourceloc "buggy_23.sol", 167, 9} {:message ""} true;
	call __send_ret#6 := __send(winner_unchk32#326[__this], __this, 0, winAmount_unchk32#328[__this]);
	payedOut_unchk32#324 := payedOut_unchk32#324[__this := true];
	$return11:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 177, 5} {:message "ERC20::allowance"} allowance#365(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#350: address_t, spender#352: address_t)
	returns (#356: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#356 := _allowed#245[__this][owner#350][spender#352];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 180, 1} {:message "ERC20::unhandledsend_unchk38"} unhandledsend_unchk38#377(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#367: address_t)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := 5000000000000000000;
	assume {:sourceloc "buggy_23.sol", 181, 5} {:message ""} true;
	call __send_ret#8 := __send(callee#367, __this, 0, call_arg#7);
	$return13:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 189, 5} {:message "ERC20::transfer"} transfer#398(__this: address_t, __msg_sender: address_t, __msg_value: int, to#380: address_t, value#382: int)
	returns (#386: bool)
{
	var call_arg#9: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#9 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 190, 9} {:message ""} true;
	call _transfer#645(__this, __msg_sender, __msg_value, call_arg#9, to#380, value#382);
	#386 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_23.sol", 193, 1} {:message "ERC20::cash_unchk46"} cash_unchk46#422(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#400: int, subpotIndex#402: int, winner_unchk46#404: address_t)
{
	var {:sourceloc "buggy_23.sol", 194, 9} {:message "subpot_unchk46"} subpot_unchk46#408: int;
	var call_arg#10: int;
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#408 := 3000000000000000000;
	call_arg#10 := subpot_unchk46#408;
	assume {:sourceloc "buggy_23.sol", 195, 9} {:message ""} true;
	call __send_ret#11 := __send(winner_unchk46#404, __this, 0, call_arg#10);
	subpot_unchk46#408 := 0;
	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 208, 5} {:message "ERC20::approve"} approve#443(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#425: address_t, value#427: int)
	returns (#431: bool)
{
	var call_arg#12: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 209, 9} {:message ""} true;
	call _approve#841(__this, __msg_sender, __msg_value, call_arg#12, spender#425, value#427);
	#431 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_23.sol", 212, 1} {:message "ERC20::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#458(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 213, 4} {:message "addr_unchk4"} addr_unchk4#447: address_t;
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#447 := 0;
	call_arg#13 := 42000000000000000000;
	assume {:sourceloc "buggy_23.sol", 214, 10} {:message ""} true;
	call __send_ret#14 := __send(addr_unchk4#447, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	
	}
	else {
	
	}

	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 230, 5} {:message "ERC20::transferFrom"} transferFrom#495(__this: address_t, __msg_sender: address_t, __msg_value: int, from#461: address_t, to#463: address_t, value#465: int)
	returns (#469: bool)
{
	var call_arg#15: address_t;
	var sub#155_ret#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 231, 9} {:message ""} true;
	call _transfer#645(__this, __msg_sender, __msg_value, from#461, to#463, value#465);
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 232, 36} {:message ""} true;
	call sub#155_ret#16 := sub#155(__this, __msg_sender, __msg_value, _allowed#245[__this][from#461][__msg_sender], value#465);
	assume {:sourceloc "buggy_23.sol", 232, 9} {:message ""} true;
	call _approve#841(__this, __msg_sender, __msg_value, from#461, call_arg#15, sub#155_ret#16);
	#469 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_23.sol", 235, 1} {:message "ERC20::bug_unchk7"} bug_unchk7#516(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 236, 1} {:message "addr_unchk7"} addr_unchk7#499: address_t;
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#499 := 0;
	call_arg#17 := 10000000000000000000;
	assume {:sourceloc "buggy_23.sol", 237, 6} {:message ""} true;
	call __send_ret#18 := __send(addr_unchk7#499, __this, 0, call_arg#17);
	if ((!(__send_ret#18) || (1 == 1))) {
	assume false;
	}

	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 251, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#544(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#519: address_t, addedValue#521: int)
	returns (#524: bool)
{
	var call_arg#19: address_t;
	var add#180_ret#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 252, 39} {:message ""} true;
	call add#180_ret#20 := add#180(__this, __msg_sender, __msg_value, _allowed#245[__this][__msg_sender][spender#519], addedValue#521);
	assume {:sourceloc "buggy_23.sol", 252, 9} {:message ""} true;
	call _approve#841(__this, __msg_sender, __msg_value, call_arg#19, spender#519, add#180_ret#20);
	#524 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 255, 1} {:message "ERC20::my_func_unchk23"} my_func_unchk23#557(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#546: address_t)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 256, 9} {:message ""} true;
	call __send_ret#21 := __send(dst#546, __this, 0, __msg_value);
	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 269, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#585(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#560: address_t, subtractedValue#562: int)
	returns (#565: bool)
{
	var call_arg#22: address_t;
	var sub#155_ret#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 270, 39} {:message ""} true;
	call sub#155_ret#23 := sub#155(__this, __msg_sender, __msg_value, _allowed#245[__this][__msg_sender][spender#560], subtractedValue#562);
	assume {:sourceloc "buggy_23.sol", 270, 9} {:message ""} true;
	call _approve#841(__this, __msg_sender, __msg_value, call_arg#22, spender#560, sub#155_ret#23);
	#565 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 273, 1} {:message "ERC20::unhandledsend_unchk14"} unhandledsend_unchk14#597(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#587: address_t)
{
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#24 := 5000000000000000000;
	assume {:sourceloc "buggy_23.sol", 274, 5} {:message ""} true;
	call __send_ret#25 := __send(callee#587, __this, 0, call_arg#24);
	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 283, 5} {:message "ERC20::_transfer"} _transfer#645(__this: address_t, __msg_sender: address_t, __msg_value: int, from#600: address_t, to#602: address_t, value#604: int)
{
	var sub#155_ret#26: int;
	var add#180_ret#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#602 != 0);
	assume {:sourceloc "buggy_23.sol", 286, 27} {:message ""} true;
	call sub#155_ret#26 := sub#155(__this, __msg_sender, __msg_value, _balances#227[__this][from#600], value#604);
	_balances#227 := _balances#227[__this := _balances#227[__this][from#600 := sub#155_ret#26]];
	assume {:sourceloc "buggy_23.sol", 287, 25} {:message ""} true;
	call add#180_ret#27 := add#180(__this, __msg_sender, __msg_value, _balances#227[__this][to#602], value#604);
	_balances#227 := _balances#227[__this := _balances#227[__this][to#602 := add#180_ret#27]];
	assume {:sourceloc "buggy_23.sol", 288, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, from#600, to#602, value#604);
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_23.sol", 290, 1} {:message "ERC20::bug_unchk30"} bug_unchk30#670(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 291, 1} {:message "receivers_unchk30"} receivers_unchk30#649: int;
	var {:sourceloc "buggy_23.sol", 292, 1} {:message "addr_unchk30"} addr_unchk30#652: address_t;
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#649 := 0;
	addr_unchk30#652 := 0;
	call_arg#28 := 42000000000000000000;
	assume {:sourceloc "buggy_23.sol", 293, 6} {:message ""} true;
	call __send_ret#29 := __send(addr_unchk30#652, __this, 0, call_arg#28);
	if (!(__send_ret#29)) {
	receivers_unchk30#649 := (receivers_unchk30#649 + 1);
	}
	else {
	assume false;
	}

	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 306, 5} {:message "ERC20::_mint"} _mint#715(__this: address_t, __msg_sender: address_t, __msg_value: int, account#673: address_t, value#675: int)
{
	var add#180_ret#30: int;
	var add#180_ret#31: int;
	var call_arg#32: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#673 != 0);
	assume {:sourceloc "buggy_23.sol", 309, 24} {:message ""} true;
	call add#180_ret#30 := add#180(__this, __msg_sender, __msg_value, _totalSupply#271[__this], value#675);
	_totalSupply#271 := _totalSupply#271[__this := add#180_ret#30];
	assume {:sourceloc "buggy_23.sol", 310, 30} {:message ""} true;
	call add#180_ret#31 := add#180(__this, __msg_sender, __msg_value, _balances#227[__this][account#673], value#675);
	_balances#227 := _balances#227[__this := _balances#227[__this][account#673 := add#180_ret#31]];
	call_arg#32 := 0;
	assume {:sourceloc "buggy_23.sol", 311, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, call_arg#32, account#673, value#675);
	$return26:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_23.sol", 313, 1} {:message "payedOut_unchk8"} payedOut_unchk8#718: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_23.sol", 314, 1} {:message "winner_unchk8"} winner_unchk8#720: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_23.sol", 315, 1} {:message "winAmount_unchk8"} winAmount_unchk8#722: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_23.sol", 317, 1} {:message "ERC20::sendToWinner_unchk8"} sendToWinner_unchk8#741(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#718[__this]);
	assume {:sourceloc "buggy_23.sol", 319, 9} {:message ""} true;
	call __send_ret#33 := __send(winner_unchk8#720[__this], __this, 0, winAmount_unchk8#722[__this]);
	payedOut_unchk8#718 := payedOut_unchk8#718[__this := true];
	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 329, 5} {:message "ERC20::_burn"} _burn#786(__this: address_t, __msg_sender: address_t, __msg_value: int, account#744: address_t, value#746: int)
{
	var sub#155_ret#34: int;
	var sub#155_ret#35: int;
	var call_arg#36: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#744 != 0);
	assume {:sourceloc "buggy_23.sol", 332, 24} {:message ""} true;
	call sub#155_ret#34 := sub#155(__this, __msg_sender, __msg_value, _totalSupply#271[__this], value#746);
	_totalSupply#271 := _totalSupply#271[__this := sub#155_ret#34];
	assume {:sourceloc "buggy_23.sol", 333, 30} {:message ""} true;
	call sub#155_ret#35 := sub#155(__this, __msg_sender, __msg_value, _balances#227[__this][account#744], value#746);
	_balances#227 := _balances#227[__this := _balances#227[__this][account#744 := sub#155_ret#35]];
	call_arg#36 := 0;
	assume {:sourceloc "buggy_23.sol", 334, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, account#744, call_arg#36, value#746);
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 336, 1} {:message "ERC20::bug_unchk39"} bug_unchk39#798(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#788: address_t)
{
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#37 := 4000000000000000000;
	assume {:sourceloc "buggy_23.sol", 337, 8} {:message ""} true;
	call __send_ret#38 := __send(addr#788, __this, 0, call_arg#37);
	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 345, 5} {:message "ERC20::_approve"} _approve#841(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#801: address_t, spender#803: address_t, value#805: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#803 != 0);
	assume (owner#801 != 0);
	_allowed#245 := _allowed#245[__this := _allowed#245[__this][owner#801 := _allowed#245[__this][owner#801][spender#803 := value#805]]];
	assume {:sourceloc "buggy_23.sol", 350, 14} {:message ""} true;
	call Approval#68(__this, __msg_sender, __msg_value, owner#801, spender#803, value#805);
	$return30:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 352, 1} {:message "ERC20::my_func_uncheck36"} my_func_uncheck36#856(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#843: address_t)
{
	var __call_ret#39: bool;
	var __call_ret#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_23.sol", 353, 5} {:message ""} true;
	call __call_ret#39, __call_ret#40 := __call(dst#843, __this, __msg_value);
	if (__call_ret#39) {
	havoc _balances#227;
	havoc _allowed#245;
	havoc payedOut_unchk9#248;
	havoc _totalSupply#271;
	havoc payedOut_unchk20#284;
	havoc winner_unchk20#286;
	havoc winAmount_unchk20#288;
	havoc payedOut_unchk32#324;
	havoc winner_unchk32#326;
	havoc winAmount_unchk32#328;
	havoc payedOut_unchk8#718;
	havoc winner_unchk8#720;
	havoc winAmount_unchk8#722;
	havoc __balance;
	}

	if (!(__call_ret#39)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 364, 5} {:message "ERC20::_burnFrom"} _burnFrom#885(__this: address_t, __msg_sender: address_t, __msg_value: int, account#859: address_t, value#861: int)
{
	var call_arg#41: address_t;
	var sub#155_ret#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 365, 9} {:message ""} true;
	call _burn#786(__this, __msg_sender, __msg_value, account#859, value#861);
	call_arg#41 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 366, 39} {:message ""} true;
	call sub#155_ret#42 := sub#155(__this, __msg_sender, __msg_value, _allowed#245[__this][account#859][__msg_sender], value#861);
	assume {:sourceloc "buggy_23.sol", 366, 9} {:message ""} true;
	call _approve#841(__this, __msg_sender, __msg_value, account#859, call_arg#41, sub#155_ret#42);
	$return32:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 368, 1} {:message "ERC20::my_func_unchk35"} my_func_unchk35#898(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#887: address_t)
{
	var __send_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 369, 9} {:message ""} true;
	call __send_ret#43 := __send(dst#887, __this, 0, __msg_value);
	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_23.sol", 117, 1} {:message "ERC20::[implicit_constructor]"} __constructor#899(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_balances#227 := _balances#227[__this := default_address_t_int()];
	_allowed#245 := _allowed#245[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk9#248 := payedOut_unchk9#248[__this := false];
	_totalSupply#271 := _totalSupply#271[__this := 0];
	payedOut_unchk20#284 := payedOut_unchk20#284[__this := false];
	winner_unchk20#286 := winner_unchk20#286[__this := 0];
	winAmount_unchk20#288 := winAmount_unchk20#288[__this := 0];
	payedOut_unchk32#324 := payedOut_unchk32#324[__this := false];
	winner_unchk32#326 := winner_unchk32#326[__this := 0];
	winAmount_unchk32#328 := winAmount_unchk32#328[__this := 0];
	payedOut_unchk8#718 := payedOut_unchk8#718[__this := false];
	winner_unchk8#720 := winner_unchk8#720[__this := 0];
	winAmount_unchk8#722 := winAmount_unchk8#722[__this := 0];
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Burnable -------
// Inherits from: ERC20
// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_23.sol", 387, 5} {:message "ERC20Burnable::burn"} burn#916(__this: address_t, __msg_sender: address_t, __msg_value: int, value#906: int)
{
	var call_arg#44: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#44 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 388, 9} {:message ""} true;
	call _burn#786(__this, __msg_sender, __msg_value, call_arg#44, value#906);
	$return34:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_23.sol", 390, 1} {:message "payedOut_unchk44"} payedOut_unchk44#919: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_23.sol", 391, 1} {:message "winner_unchk44"} winner_unchk44#921: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_23.sol", 392, 1} {:message "winAmount_unchk44"} winAmount_unchk44#923: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_23.sol", 394, 1} {:message "ERC20Burnable::sendToWinner_unchk44"} sendToWinner_unchk44#942(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#919[__this]);
	assume {:sourceloc "buggy_23.sol", 396, 9} {:message ""} true;
	call __send_ret#45 := __send(winner_unchk44#921[__this], __this, 0, winAmount_unchk44#923[__this]);
	payedOut_unchk44#919 := payedOut_unchk44#919[__this := true];
	$return35:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256)
procedure {:sourceloc "buggy_23.sol", 405, 5} {:message "ERC20Burnable::burnFrom"} burnFrom#956(__this: address_t, __msg_sender: address_t, __msg_value: int, from#945: address_t, value#947: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 406, 9} {:message ""} true;
	call _burnFrom#885(__this, __msg_sender, __msg_value, from#945, value#947);
	$return36:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_23.sol", 408, 1} {:message "ERC20Burnable::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#971(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 409, 4} {:message "addr_unchk40"} addr_unchk40#960: address_t;
	var call_arg#46: int;
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#960 := 0;
	call_arg#46 := 2000000000000000000;
	assume {:sourceloc "buggy_23.sol", 410, 10} {:message ""} true;
	call __send_ret#47 := __send(addr_unchk40#960, __this, 0, call_arg#46);
	if (!(__send_ret#47)) {
	
	}
	else {
	
	}

	$return37:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 382, 1} {:message "ERC20Burnable::[implicit_constructor]"} __constructor#972(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk44#919 := payedOut_unchk44#919[__this := false];
	winner_unchk44#921 := winner_unchk44#921[__this := 0];
	winAmount_unchk44#923 := winAmount_unchk44#923[__this := 0];
	_balances#227 := _balances#227[__this := default_address_t_int()];
	_allowed#245 := _allowed#245[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk9#248 := payedOut_unchk9#248[__this := false];
	_totalSupply#271 := _totalSupply#271[__this := 0];
	payedOut_unchk20#284 := payedOut_unchk20#284[__this := false];
	winner_unchk20#286 := winner_unchk20#286[__this := 0];
	winAmount_unchk20#288 := winAmount_unchk20#288[__this := 0];
	payedOut_unchk32#324 := payedOut_unchk32#324[__this := false];
	winner_unchk32#326 := winner_unchk32#326[__this := 0];
	winAmount_unchk32#328 := winAmount_unchk32#328[__this := 0];
	payedOut_unchk8#718 := payedOut_unchk8#718[__this := false];
	winner_unchk8#720 := winner_unchk8#720[__this := 0];
	winAmount_unchk8#722 := winAmount_unchk8#722[__this := 0];
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 431, 3} {:message "ERC20Detailed::callnotchecked_unchk25"} callnotchecked_unchk25#990(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#978: address_t)
{
	var __call_ret#48: bool;
	var __call_ret#49: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_23.sol", 432, 5} {:message ""} true;
	call __call_ret#48, __call_ret#49 := __call(callee#978, __this, 1000000000000000000);
	if (__call_ret#48) {
	havoc _name#992;
	havoc _symbol#1015;
	havoc _decimals#1029;
	havoc payedOut_unchk33#1054;
	havoc payedOut_unchk45#1138;
	havoc __balance;
	}

	if (!(__call_ret#48)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return38:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_23.sol", 434, 3} {:message "_name"} _name#992: [address_t]int_arr_type;
// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_23.sol", 435, 3} {:message "ERC20Detailed::bug_unchk19"} bug_unchk19#1013(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 436, 1} {:message "addr_unchk19"} addr_unchk19#996: address_t;
	var call_arg#50: int;
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#996 := 0;
	call_arg#50 := 10000000000000000000;
	assume {:sourceloc "buggy_23.sol", 437, 6} {:message ""} true;
	call __send_ret#51 := __send(addr_unchk19#996, __this, 0, call_arg#50);
	if ((!(__send_ret#51) || (1 == 1))) {
	assume false;
	}

	$return39:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_23.sol", 440, 3} {:message "_symbol"} _symbol#1015: [address_t]int_arr_type;
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 441, 3} {:message "ERC20Detailed::unhandledsend_unchk26"} unhandledsend_unchk26#1027(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1017: address_t)
{
	var call_arg#52: int;
	var __send_ret#53: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#52 := 5000000000000000000;
	assume {:sourceloc "buggy_23.sol", 442, 5} {:message ""} true;
	call __send_ret#53 := __send(callee#1017, __this, 0, call_arg#52);
	$return40:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_23.sol", 444, 3} {:message "_decimals"} _decimals#1029: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_23.sol", 446, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1160(__this: address_t, __msg_sender: address_t, __msg_value: int, name#1031: int_arr_ptr, symbol#1033: int_arr_ptr, decimals#1035: int)
{
	// TCC assumptions
	assume (name#1031 < __alloc_counter);
	assume (symbol#1033 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#992 := _name#992[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1015 := _symbol#1015[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#1029 := _decimals#1029[__this := 0];
	payedOut_unchk33#1054 := payedOut_unchk33#1054[__this := false];
	payedOut_unchk45#1138 := payedOut_unchk45#1138[__this := false];
	// Function body starts here
	_name#992 := _name#992[__this := mem_arr_int[name#1031]];
	_symbol#1015 := _symbol#1015[__this := mem_arr_int[symbol#1033]];
	_decimals#1029 := _decimals#1029[__this := decimals#1035];
	$return41:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_23.sol", 451, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1054: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_23.sol", 453, 1} {:message "ERC20Detailed::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1075(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#54: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1054[__this];
	assume {:sourceloc "buggy_23.sol", 455, 5} {:message ""} true;
	call __send_ret#54 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return42:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 461, 5} {:message "ERC20Detailed::name"} name#1084(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1079: int_arr_ptr)
{
	var new_array#55: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#55 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1079 := new_array#55;
	mem_arr_int := mem_arr_int[#1079 := _name#992[__this]];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_23.sol", 464, 1} {:message "ERC20Detailed::bug_unchk27"} bug_unchk27#1096(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1086: address_t)
{
	var call_arg#56: int;
	var __send_ret#57: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#56 := 42000000000000000000;
	assume {:sourceloc "buggy_23.sol", 465, 8} {:message ""} true;
	call __send_ret#57 := __send(addr#1086, __this, 0, call_arg#56);
	$return44:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 470, 5} {:message "ERC20Detailed::symbol"} symbol#1105(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1100: int_arr_ptr)
{
	var new_array#58: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#58 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1100 := new_array#58;
	mem_arr_int := mem_arr_int[#1100 := _symbol#1015[__this]];
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_23.sol", 473, 1} {:message "ERC20Detailed::bug_unchk31"} bug_unchk31#1126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 474, 1} {:message "addr_unchk31"} addr_unchk31#1109: address_t;
	var call_arg#59: int;
	var __send_ret#60: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#1109 := 0;
	call_arg#59 := 10000000000000000000;
	assume {:sourceloc "buggy_23.sol", 475, 6} {:message ""} true;
	call __send_ret#60 := __send(addr_unchk31#1109, __this, 0, call_arg#59);
	if ((!(__send_ret#60) || (1 == 1))) {
	assume false;
	}

	$return46:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_23.sol", 482, 5} {:message "ERC20Detailed::decimals"} decimals#1135(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1130: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1130 := _decimals#1029[__this];
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_23.sol", 485, 1} {:message "payedOut_unchk45"} payedOut_unchk45#1138: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_23.sol", 487, 1} {:message "ERC20Detailed::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#1159(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#61: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#1138[__this];
	assume {:sourceloc "buggy_23.sol", 489, 5} {:message ""} true;
	call __send_ret#61 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return48:
	// Function body ends here
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: AGR -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// Inherits from: ERC20Burnable
// 
// Function: 
procedure {:sourceloc "buggy_23.sol", 501, 3} {:message "AGR::[constructor]"} __constructor#1205(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1169: int_arr_ptr, _symbol#1171: int_arr_ptr, _decimals#1173: int)
{
	var name#1031#62: int_arr_ptr;
	var symbol#1033#62: int_arr_ptr;
	var decimals#1035#62: int;
	var call_arg#64: address_t;
	var call_arg#65: int;
	// TCC assumptions
	assume (_name#1169 < __alloc_counter);
	assume (_symbol#1171 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk44#919 := payedOut_unchk44#919[__this := false];
	winner_unchk44#921 := winner_unchk44#921[__this := 0];
	winAmount_unchk44#923 := winAmount_unchk44#923[__this := 0];
	_name#992 := _name#992[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1015 := _symbol#1015[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#1029 := _decimals#1029[__this := 0];
	payedOut_unchk33#1054 := payedOut_unchk33#1054[__this := false];
	payedOut_unchk45#1138 := payedOut_unchk45#1138[__this := false];
	_balances#227 := _balances#227[__this := default_address_t_int()];
	_allowed#245 := _allowed#245[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk9#248 := payedOut_unchk9#248[__this := false];
	_totalSupply#271 := _totalSupply#271[__this := 0];
	payedOut_unchk20#284 := payedOut_unchk20#284[__this := false];
	winner_unchk20#286 := winner_unchk20#286[__this := 0];
	winAmount_unchk20#288 := winAmount_unchk20#288[__this := 0];
	payedOut_unchk32#324 := payedOut_unchk32#324[__this := false];
	winner_unchk32#326 := winner_unchk32#326[__this := 0];
	winAmount_unchk32#328 := winAmount_unchk32#328[__this := 0];
	payedOut_unchk8#718 := payedOut_unchk8#718[__this := false];
	winner_unchk8#720 := winner_unchk8#720[__this := 0];
	winAmount_unchk8#722 := winAmount_unchk8#722[__this := 0];
	// Arguments for ERC20Detailed
	name#1031#62 := _name#1169;
	symbol#1033#62 := _symbol#1171;
	decimals#1035#62 := _decimals#1173;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#992 := _name#992[__this := mem_arr_int[name#1031#62]];
	_symbol#1015 := _symbol#1015[__this := mem_arr_int[symbol#1033#62]];
	_decimals#1029 := _decimals#1029[__this := decimals#1035#62];
	$return49:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#64 := __msg_sender;
	call_arg#65 := 30000000000000;
	assume {:sourceloc "buggy_23.sol", 502, 9} {:message ""} true;
	call _mint#715(__this, __msg_sender, __msg_value, call_arg#64, call_arg#65);
	$return50:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_23.sol", 504, 1} {:message "AGR::callnotchecked_unchk13"} callnotchecked_unchk13#1204(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1192: address_t)
{
	var __call_ret#66: bool;
	var __call_ret#67: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_23.sol", 505, 9} {:message ""} true;
	call __call_ret#66, __call_ret#67 := __call(callee#1192, __this, 1000000000000000000);
	if (__call_ret#66) {
	havoc payedOut_unchk44#919;
	havoc winner_unchk44#921;
	havoc winAmount_unchk44#923;
	havoc _name#992;
	havoc _symbol#1015;
	havoc _decimals#1029;
	havoc payedOut_unchk33#1054;
	havoc payedOut_unchk45#1138;
	havoc _balances#227;
	havoc _allowed#245;
	havoc payedOut_unchk9#248;
	havoc _totalSupply#271;
	havoc payedOut_unchk20#284;
	havoc winner_unchk20#286;
	havoc winAmount_unchk20#288;
	havoc payedOut_unchk32#324;
	havoc winner_unchk32#326;
	havoc winAmount_unchk32#328;
	havoc payedOut_unchk8#718;
	havoc winner_unchk8#720;
	havoc winAmount_unchk8#722;
	havoc __balance;
	}

	if (!(__call_ret#66)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return51:
	// Function body ends here
}

