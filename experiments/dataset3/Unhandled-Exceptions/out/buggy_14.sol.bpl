// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_14.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 9, 5} {:message "SafeMath::mul"} mul#34(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_14.sol", 15, 9} {:message "c"} c#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#3 == 0)) {
	#8 := 0;
	goto $return0;
	}

	c#18 := (a#3 * b#5);
	assume ((c#18 div a#3) == b#5);
	#8 := c#18;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 21, 5} {:message "SafeMath::div"} div#58(__this: address_t, __msg_sender: address_t, __msg_value: int, a#36: int, b#38: int)
	returns (#41: int)
{
	var {:sourceloc "buggy_14.sol", 24, 9} {:message "c"} c#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#38 > 0);
	c#50 := (a#36 div b#38);
	#41 := c#50;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 29, 5} {:message "SafeMath::sub"} sub#82(__this: address_t, __msg_sender: address_t, __msg_value: int, a#60: int, b#62: int)
	returns (#65: int)
{
	var {:sourceloc "buggy_14.sol", 31, 9} {:message "c"} c#74: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#62 <= a#60);
	c#74 := (a#60 - b#62);
	#65 := c#74;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 36, 5} {:message "SafeMath::add"} add#106(__this: address_t, __msg_sender: address_t, __msg_value: int, a#84: int, b#86: int)
	returns (#89: int)
{
	var {:sourceloc "buggy_14.sol", 37, 9} {:message "c"} c#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#92 := (a#84 + b#86);
	assume (c#92 >= a#84);
	#89 := c#92;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 43, 5} {:message "SafeMath::mod"} mod#126(__this: address_t, __msg_sender: address_t, __msg_value: int, a#108: int, b#110: int)
	returns (#113: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#110 != 0);
	#113 := (a#108 mod b#110);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_14.sol", 7, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#127(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_14.sol", 63, 5} {:message "[event] IERC20::Transfer"} Transfer#185(__this: address_t, __msg_sender: address_t, __msg_value: int, from#179: address_t, to#181: address_t, value#183: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_14.sol", 64, 5} {:message "[event] IERC20::Approval"} Approval#193(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#187: address_t, spender#189: address_t, value#191: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_14.sol", 65, 5} {:message "[event] IERC20::Burn"} Burn#199(__this: address_t, __msg_sender: address_t, __msg_value: int, from#195: address_t, value#197: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_14.sol", 50, 5} {:message "IERC20::totalSupply"} totalSupply#132(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#130: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_14.sol", 52, 5} {:message "IERC20::balanceOf"} balanceOf#139(__this: address_t, __msg_sender: address_t, __msg_value: int, who#134: address_t)
	returns (#137: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_14.sol", 54, 5} {:message "IERC20::transfer"} transfer#148(__this: address_t, __msg_sender: address_t, __msg_value: int, to#141: address_t, value#143: int)
	returns (#146: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_14.sol", 56, 5} {:message "IERC20::transferFrom"} transferFrom#159(__this: address_t, __msg_sender: address_t, __msg_value: int, from#150: address_t, to#152: address_t, value#154: int)
	returns (#157: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_14.sol", 58, 5} {:message "IERC20::approve"} approve#168(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#161: address_t, value#163: int)
	returns (#166: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_14.sol", 60, 5} {:message "IERC20::allowance"} allowance#177(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#170: address_t, spender#172: address_t)
	returns (#175: int);

// 
// Default constructor
procedure {:sourceloc "buggy_14.sol", 49, 1} {:message "IERC20::[implicit_constructor]"} __constructor#200(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Using library SafeMath for uint256
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
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_14.sol", 72, 3} {:message "ERC20::bug_unchk19"} bug_unchk19#226(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 73, 1} {:message "addr_unchk19"} addr_unchk19#209: address_t;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#209 := 0;
	call_arg#0 := 10000000000000000000;
	assume {:sourceloc "buggy_14.sol", 74, 6} {:message ""} true;
	call __send_ret#1 := __send(addr_unchk19#209, __this, 0, call_arg#0);
	if ((!(__send_ret#1) || (1 == 1))) {
	assume false;
	}

	$return5:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_14.sol", 78, 3} {:message "ERC20::unhandledsend_unchk26"} unhandledsend_unchk26#241(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#231: address_t)
{
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#2 := 5000000000000000000;
	assume {:sourceloc "buggy_14.sol", 79, 5} {:message ""} true;
	call __send_ret#3 := __send(callee#231, __this, 0, call_arg#2);
	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_14.sol", 81, 3} {:message "_totalSupply"} _totalSupply#243: [address_t]int;
// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_14.sol", 82, 5} {:message "_name"} _name#245: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 83, 5} {:message "_symbol"} _symbol#247: [address_t]int_arr_type;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_14.sol", 85, 3} {:message "payedOut_unchk20"} payedOut_unchk20#250: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_14.sol", 86, 1} {:message "winner_unchk20"} winner_unchk20#252: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_14.sol", 87, 1} {:message "winAmount_unchk20"} winAmount_unchk20#254: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_14.sol", 89, 1} {:message "ERC20::sendToWinner_unchk20"} sendToWinner_unchk20#273(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#250[__this]);
	assume {:sourceloc "buggy_14.sol", 91, 9} {:message ""} true;
	call __send_ret#4 := __send(winner_unchk20#252[__this], __this, 0, winAmount_unchk20#254[__this]);
	payedOut_unchk20#250 := payedOut_unchk20#250[__this := true];
	$return7:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 94, 3} {:message "_balances"} _balances#277: [address_t][address_t]int;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_14.sol", 95, 3} {:message "payedOut_unchk32"} payedOut_unchk32#280: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_14.sol", 96, 1} {:message "winner_unchk32"} winner_unchk32#282: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_14.sol", 97, 1} {:message "winAmount_unchk32"} winAmount_unchk32#284: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_14.sol", 99, 1} {:message "ERC20::sendToWinner_unchk32"} sendToWinner_unchk32#303(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#280[__this]);
	assume {:sourceloc "buggy_14.sol", 101, 9} {:message ""} true;
	call __send_ret#5 := __send(winner_unchk32#282[__this], __this, 0, winAmount_unchk32#284[__this]);
	payedOut_unchk32#280 := payedOut_unchk32#280[__this := true];
	$return8:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_14.sol", 104, 3} {:message "_allowed"} _allowed#309: [address_t][address_t][address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 107, 5} {:message "ERC20::totalSupply"} totalSupply#318(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#313: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#313 := _totalSupply#243[__this];
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_14.sol", 110, 1} {:message "ERC20::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#333(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 111, 4} {:message "addr_unchk4"} addr_unchk4#322: address_t;
	var call_arg#6: int;
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#322 := 0;
	call_arg#6 := 42000000000000000000;
	assume {:sourceloc "buggy_14.sol", 112, 10} {:message ""} true;
	call __send_ret#7 := __send(addr_unchk4#322, __this, 0, call_arg#6);
	if (!(__send_ret#7)) {
	
	}
	else {
	
	}

	$return10:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 120, 5} {:message "ERC20::balanceOf"} balanceOf#346(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#335: address_t)
	returns (#339: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#339 := _balances#277[__this][owner#335];
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_14.sol", 123, 1} {:message "ERC20::bug_unchk7"} bug_unchk7#367(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 124, 1} {:message "addr_unchk7"} addr_unchk7#350: address_t;
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#350 := 0;
	call_arg#8 := 10000000000000000000;
	assume {:sourceloc "buggy_14.sol", 125, 6} {:message ""} true;
	call __send_ret#9 := __send(addr_unchk7#350, __this, 0, call_arg#8);
	if ((!(__send_ret#9) || (1 == 1))) {
	assume false;
	}

	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 129, 5} {:message "ERC20::transfer"} transfer#387(__this: address_t, __msg_sender: address_t, __msg_value: int, to#369: address_t, value#371: int)
	returns (#375: bool)
{
	var call_arg#10: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#10 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 130, 9} {:message ""} true;
	call _transfer#666(__this, __msg_sender, __msg_value, call_arg#10, to#369, value#371);
	#375 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_14.sol", 133, 1} {:message "ERC20::my_func_unchk23"} my_func_unchk23#400(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#389: address_t)
{
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 134, 9} {:message ""} true;
	call __send_ret#11 := __send(dst#389, __this, 0, __msg_value);
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 137, 5} {:message "ERC20::transferFrom"} transferFrom#436(__this: address_t, __msg_sender: address_t, __msg_value: int, from#402: address_t, to#404: address_t, value#406: int)
	returns (#410: bool)
{
	var call_arg#12: address_t;
	var sub#82_ret#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 138, 10} {:message ""} true;
	call _transfer#666(__this, __msg_sender, __msg_value, from#402, to#404, value#406);
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 139, 37} {:message ""} true;
	call sub#82_ret#13 := sub#82(__this, __msg_sender, __msg_value, _allowed#309[__this][from#402][__msg_sender], value#406);
	assume {:sourceloc "buggy_14.sol", 139, 10} {:message ""} true;
	call _approve#721(__this, __msg_sender, __msg_value, from#402, call_arg#12, sub#82_ret#13);
	#410 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_14.sol", 142, 1} {:message "ERC20::unhandledsend_unchk14"} unhandledsend_unchk14#448(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#438: address_t)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := 5000000000000000000;
	assume {:sourceloc "buggy_14.sol", 143, 5} {:message ""} true;
	call __send_ret#15 := __send(callee#438, __this, 0, call_arg#14);
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 146, 5} {:message "ERC20::approve"} approve#468(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#450: address_t, value#452: int)
	returns (#456: bool)
{
	var call_arg#16: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 147, 9} {:message ""} true;
	call _approve#721(__this, __msg_sender, __msg_value, call_arg#16, spender#450, value#452);
	#456 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_14.sol", 150, 1} {:message "ERC20::bug_unchk30"} bug_unchk30#493(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 151, 1} {:message "receivers_unchk30"} receivers_unchk30#472: int;
	var {:sourceloc "buggy_14.sol", 152, 1} {:message "addr_unchk30"} addr_unchk30#475: address_t;
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#472 := 0;
	addr_unchk30#475 := 0;
	call_arg#17 := 42000000000000000000;
	assume {:sourceloc "buggy_14.sol", 153, 6} {:message ""} true;
	call __send_ret#18 := __send(addr_unchk30#475, __this, 0, call_arg#17);
	if (!(__send_ret#18)) {
	receivers_unchk30#472 := (receivers_unchk30#472 + 1);
	}
	else {
	assume false;
	}

	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 159, 5} {:message "ERC20::allowance"} allowance#510(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#495: address_t, spender#497: address_t)
	returns (#501: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#501 := _allowed#309[__this][owner#495][spender#497];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_14.sol", 162, 1} {:message "payedOut_unchk8"} payedOut_unchk8#513: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_14.sol", 163, 1} {:message "winner_unchk8"} winner_unchk8#515: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_14.sol", 164, 1} {:message "winAmount_unchk8"} winAmount_unchk8#517: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_14.sol", 166, 1} {:message "ERC20::sendToWinner_unchk8"} sendToWinner_unchk8#536(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#513[__this]);
	assume {:sourceloc "buggy_14.sol", 168, 9} {:message ""} true;
	call __send_ret#19 := __send(winner_unchk8#515[__this], __this, 0, winAmount_unchk8#517[__this]);
	payedOut_unchk8#513 := payedOut_unchk8#513[__this := true];
	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_14.sol", 172, 5} {:message "ERC20::burn"} burn#548(__this: address_t, __msg_sender: address_t, __msg_value: int, value#538: int)
{
	var call_arg#20: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#20 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 173, 9} {:message ""} true;
	call _burn#791(__this, __msg_sender, __msg_value, call_arg#20, value#538);
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_14.sol", 175, 1} {:message "ERC20::bug_unchk39"} bug_unchk39#560(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#550: address_t)
{
	var call_arg#21: int;
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#21 := 4000000000000000000;
	assume {:sourceloc "buggy_14.sol", 176, 8} {:message ""} true;
	call __send_ret#22 := __send(addr#550, __this, 0, call_arg#21);
	$return22:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 178, 5} {:message "ERC20::_mint"} _mint#604(__this: address_t, __msg_sender: address_t, __msg_value: int, account#562: address_t, value#564: int)
{
	var add#106_ret#23: int;
	var add#106_ret#24: int;
	var call_arg#25: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#562 != 0);
	assume {:sourceloc "buggy_14.sol", 180, 24} {:message ""} true;
	call add#106_ret#23 := add#106(__this, __msg_sender, __msg_value, _totalSupply#243[__this], value#564);
	_totalSupply#243 := _totalSupply#243[__this := add#106_ret#23];
	assume {:sourceloc "buggy_14.sol", 181, 30} {:message ""} true;
	call add#106_ret#24 := add#106(__this, __msg_sender, __msg_value, _balances#277[__this][account#562], value#564);
	_balances#277 := _balances#277[__this := _balances#277[__this][account#562 := add#106_ret#24]];
	call_arg#25 := 0;
	assume {:sourceloc "buggy_14.sol", 182, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, call_arg#25, account#562, value#564);
	$return23:
	// Function body ends here
}

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
procedure {:sourceloc "buggy_14.sol", 184, 1} {:message "ERC20::my_func_uncheck36"} my_func_uncheck36#619(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#606: address_t)
{
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_14.sol", 185, 5} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(dst#606, __this, __msg_value);
	if (__call_ret#26) {
	havoc _totalSupply#243;
	havoc _name#245;
	havoc _symbol#247;
	havoc payedOut_unchk20#250;
	havoc winner_unchk20#252;
	havoc winAmount_unchk20#254;
	havoc _balances#277;
	havoc payedOut_unchk32#280;
	havoc winner_unchk32#282;
	havoc winAmount_unchk32#284;
	havoc _allowed#309;
	havoc payedOut_unchk8#513;
	havoc winner_unchk8#515;
	havoc winAmount_unchk8#517;
	havoc payedOut_unchk44#724;
	havoc winner_unchk44#726;
	havoc winAmount_unchk44#728;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return24:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 188, 5} {:message "ERC20::_transfer"} _transfer#666(__this: address_t, __msg_sender: address_t, __msg_value: int, from#621: address_t, to#623: address_t, value#625: int)
{
	var sub#82_ret#28: int;
	var add#106_ret#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#623 != 0);
	assume {:sourceloc "buggy_14.sol", 191, 27} {:message ""} true;
	call sub#82_ret#28 := sub#82(__this, __msg_sender, __msg_value, _balances#277[__this][from#621], value#625);
	_balances#277 := _balances#277[__this := _balances#277[__this][from#621 := sub#82_ret#28]];
	assume {:sourceloc "buggy_14.sol", 192, 25} {:message ""} true;
	call add#106_ret#29 := add#106(__this, __msg_sender, __msg_value, _balances#277[__this][to#623], value#625);
	_balances#277 := _balances#277[__this := _balances#277[__this][to#623 := add#106_ret#29]];
	assume {:sourceloc "buggy_14.sol", 193, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, from#621, to#623, value#625);
	$return25:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_14.sol", 196, 1} {:message "ERC20::my_func_unchk35"} my_func_unchk35#679(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#668: address_t)
{
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 197, 9} {:message ""} true;
	call __send_ret#30 := __send(dst#668, __this, 0, __msg_value);
	$return26:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 200, 5} {:message "ERC20::_approve"} _approve#721(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#681: address_t, spender#683: address_t, value#685: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#683 != 0);
	assume (owner#681 != 0);
	_allowed#309 := _allowed#309[__this := _allowed#309[__this][owner#681 := _allowed#309[__this][owner#681][spender#683 := value#685]]];
	assume {:sourceloc "buggy_14.sol", 205, 14} {:message ""} true;
	call Approval#193(__this, __msg_sender, __msg_value, owner#681, spender#683, value#685);
	$return27:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_14.sol", 207, 1} {:message "payedOut_unchk44"} payedOut_unchk44#724: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_14.sol", 208, 1} {:message "winner_unchk44"} winner_unchk44#726: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_14.sol", 209, 1} {:message "winAmount_unchk44"} winAmount_unchk44#728: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_14.sol", 211, 1} {:message "ERC20::sendToWinner_unchk44"} sendToWinner_unchk44#747(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#724[__this]);
	assume {:sourceloc "buggy_14.sol", 213, 9} {:message ""} true;
	call __send_ret#31 := __send(winner_unchk44#726[__this], __this, 0, winAmount_unchk44#728[__this]);
	payedOut_unchk44#724 := payedOut_unchk44#724[__this := true];
	$return28:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 217, 5} {:message "ERC20::_burn"} _burn#791(__this: address_t, __msg_sender: address_t, __msg_value: int, account#749: address_t, value#751: int)
{
	var sub#82_ret#32: int;
	var sub#82_ret#33: int;
	var call_arg#34: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#749 != 0);
	assume {:sourceloc "buggy_14.sol", 220, 24} {:message ""} true;
	call sub#82_ret#32 := sub#82(__this, __msg_sender, __msg_value, _totalSupply#243[__this], value#751);
	_totalSupply#243 := _totalSupply#243[__this := sub#82_ret#32];
	assume {:sourceloc "buggy_14.sol", 221, 30} {:message ""} true;
	call sub#82_ret#33 := sub#82(__this, __msg_sender, __msg_value, _balances#277[__this][account#749], value#751);
	_balances#277 := _balances#277[__this := _balances#277[__this][account#749 := sub#82_ret#33]];
	call_arg#34 := 0;
	assume {:sourceloc "buggy_14.sol", 222, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, account#749, call_arg#34, value#751);
	$return29:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_14.sol", 224, 1} {:message "ERC20::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#806(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 225, 4} {:message "addr_unchk40"} addr_unchk40#795: address_t;
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#795 := 0;
	call_arg#35 := 2000000000000000000;
	assume {:sourceloc "buggy_14.sol", 226, 10} {:message ""} true;
	call __send_ret#36 := __send(addr_unchk40#795, __this, 0, call_arg#35);
	if (!(__send_ret#36)) {
	
	}
	else {
	
	}

	$return30:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_14.sol", 69, 1} {:message "ERC20::[implicit_constructor]"} __constructor#807(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_totalSupply#243 := _totalSupply#243[__this := 0];
	_name#245 := _name#245[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#247 := _symbol#247[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk20#250 := payedOut_unchk20#250[__this := false];
	winner_unchk20#252 := winner_unchk20#252[__this := 0];
	winAmount_unchk20#254 := winAmount_unchk20#254[__this := 0];
	_balances#277 := _balances#277[__this := default_address_t_int()];
	payedOut_unchk32#280 := payedOut_unchk32#280[__this := false];
	winner_unchk32#282 := winner_unchk32#282[__this := 0];
	winAmount_unchk32#284 := winAmount_unchk32#284[__this := 0];
	_allowed#309 := _allowed#309[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk8#513 := payedOut_unchk8#513[__this := false];
	winner_unchk8#515 := winner_unchk8#515[__this := 0];
	winAmount_unchk8#517 := winAmount_unchk8#517[__this := 0];
	payedOut_unchk44#724 := payedOut_unchk44#724[__this := false];
	winner_unchk44#726 := winner_unchk44#726[__this := 0];
	winAmount_unchk44#728 := winAmount_unchk44#728[__this := 0];
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_14.sol", 236, 5} {:message "_name"} _name#811: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 237, 5} {:message "_symbol"} _symbol#813: [address_t]int_arr_type;
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_14.sol", 238, 3} {:message "ERC20Detailed::unhandledsend_unchk38"} unhandledsend_unchk38#825(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#815: address_t)
{
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#37 := 5000000000000000000;
	assume {:sourceloc "buggy_14.sol", 239, 5} {:message ""} true;
	call __send_ret#38 := __send(callee#815, __this, 0, call_arg#37);
	$return31:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_14.sol", 241, 3} {:message "_decimals"} _decimals#827: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 243, 5} {:message "ERC20Detailed::[constructor]"} __constructor#958(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenName#829: int_arr_ptr, tokenSymbol#831: int_arr_ptr, tokenDecimals#833: int)
{
	// TCC assumptions
	assume (tokenName#829 < __alloc_counter);
	assume (tokenSymbol#831 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#811 := _name#811[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#813 := _symbol#813[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#827 := _decimals#827[__this := 0];
	payedOut_unchk33#852 := payedOut_unchk33#852[__this := false];
	payedOut_unchk45#936 := payedOut_unchk45#936[__this := false];
	// Function body starts here
	_name#811 := _name#811[__this := mem_arr_int[tokenName#829]];
	_symbol#813 := _symbol#813[__this := mem_arr_int[tokenSymbol#831]];
	_decimals#827 := _decimals#827[__this := tokenDecimals#833];
	$return32:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_14.sol", 248, 1} {:message "payedOut_unchk33"} payedOut_unchk33#852: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_14.sol", 250, 1} {:message "ERC20Detailed::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#873(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#852[__this];
	assume {:sourceloc "buggy_14.sol", 252, 5} {:message ""} true;
	call __send_ret#39 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return33:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 258, 5} {:message "ERC20Detailed::name"} name#882(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#877: int_arr_ptr)
{
	var new_array#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#877 := new_array#40;
	mem_arr_int := mem_arr_int[#877 := _name#811[__this]];
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_14.sol", 261, 1} {:message "ERC20Detailed::bug_unchk27"} bug_unchk27#894(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#884: address_t)
{
	var call_arg#41: int;
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#41 := 42000000000000000000;
	assume {:sourceloc "buggy_14.sol", 262, 8} {:message ""} true;
	call __send_ret#42 := __send(addr#884, __this, 0, call_arg#41);
	$return35:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 267, 5} {:message "ERC20Detailed::symbol"} symbol#903(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#898: int_arr_ptr)
{
	var new_array#43: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#898 := new_array#43;
	mem_arr_int := mem_arr_int[#898 := _symbol#813[__this]];
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_14.sol", 270, 1} {:message "ERC20Detailed::bug_unchk31"} bug_unchk31#924(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 271, 1} {:message "addr_unchk31"} addr_unchk31#907: address_t;
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#907 := 0;
	call_arg#44 := 10000000000000000000;
	assume {:sourceloc "buggy_14.sol", 272, 6} {:message ""} true;
	call __send_ret#45 := __send(addr_unchk31#907, __this, 0, call_arg#44);
	if ((!(__send_ret#45) || (1 == 1))) {
	assume false;
	}

	$return37:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_14.sol", 279, 5} {:message "ERC20Detailed::decimals"} decimals#933(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#928: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#928 := _decimals#827[__this];
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_14.sol", 282, 1} {:message "payedOut_unchk45"} payedOut_unchk45#936: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_14.sol", 284, 1} {:message "ERC20Detailed::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#957(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#936[__this];
	assume {:sourceloc "buggy_14.sol", 286, 5} {:message ""} true;
	call __send_ret#46 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return39:
	// Function body ends here
}

// 
// ------- Contract: SaveWon -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_14.sol", 291, 3} {:message "SaveWon::cash_unchk46"} cash_unchk46#986(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#964: int, subpotIndex#966: int, winner_unchk46#968: address_t)
{
	var {:sourceloc "buggy_14.sol", 292, 9} {:message "subpot_unchk46"} subpot_unchk46#972: int;
	var call_arg#47: int;
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#972 := 3000000000000000000;
	call_arg#47 := subpot_unchk46#972;
	assume {:sourceloc "buggy_14.sol", 293, 9} {:message ""} true;
	call __send_ret#48 := __send(winner_unchk46#968, __this, 0, call_arg#47);
	subpot_unchk46#972 := 0;
	$return40:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 301, 5} {:message "SaveWon::[constructor]"} __constructor#1032(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1000: int_arr_ptr, _symbol#1002: int_arr_ptr)
{
	var tokenName#829#49: int_arr_ptr;
	var tokenSymbol#831#49: int_arr_ptr;
	var tokenDecimals#833#49: int;
	var call_arg#51: address_t;
	// TCC assumptions
	assume (_name#1000 < __alloc_counter);
	assume (_symbol#1002 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#811 := _name#811[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#813 := _symbol#813[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#827 := _decimals#827[__this := 0];
	payedOut_unchk33#852 := payedOut_unchk33#852[__this := false];
	payedOut_unchk45#936 := payedOut_unchk45#936[__this := false];
	_totalSupply#243 := _totalSupply#243[__this := 0];
	_name#245 := _name#245[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#247 := _symbol#247[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk20#250 := payedOut_unchk20#250[__this := false];
	winner_unchk20#252 := winner_unchk20#252[__this := 0];
	winAmount_unchk20#254 := winAmount_unchk20#254[__this := 0];
	_balances#277 := _balances#277[__this := default_address_t_int()];
	payedOut_unchk32#280 := payedOut_unchk32#280[__this := false];
	winner_unchk32#282 := winner_unchk32#282[__this := 0];
	winAmount_unchk32#284 := winAmount_unchk32#284[__this := 0];
	_allowed#309 := _allowed#309[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk8#513 := payedOut_unchk8#513[__this := false];
	winner_unchk8#515 := winner_unchk8#515[__this := 0];
	winAmount_unchk8#517 := winAmount_unchk8#517[__this := 0];
	payedOut_unchk44#724 := payedOut_unchk44#724[__this := false];
	winner_unchk44#726 := winner_unchk44#726[__this := 0];
	winAmount_unchk44#728 := winAmount_unchk44#728[__this := 0];
	// Arguments for ERC20Detailed
	tokenName#829#49 := _name#1000;
	tokenSymbol#831#49 := _symbol#1002;
	tokenDecimals#833#49 := 18;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#811 := _name#811[__this := mem_arr_int[tokenName#829#49]];
	_symbol#813 := _symbol#813[__this := mem_arr_int[tokenSymbol#831#49]];
	_decimals#827 := _decimals#827[__this := tokenDecimals#833#49];
	$return41:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#51 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 302, 9} {:message ""} true;
	call _mint#604(__this, __msg_sender, __msg_value, call_arg#51, (50000000000 * 1000000000000000000));
	$return42:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_14.sol", 304, 1} {:message "SaveWon::callnotchecked_unchk13"} callnotchecked_unchk13#1031(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1019: address_t)
{
	var __call_ret#52: bool;
	var __call_ret#53: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_14.sol", 305, 5} {:message ""} true;
	call __call_ret#52, __call_ret#53 := __call(callee#1019, __this, 1000000000000000000);
	if (__call_ret#52) {
	havoc _name#811;
	havoc _symbol#813;
	havoc _decimals#827;
	havoc payedOut_unchk33#852;
	havoc payedOut_unchk45#936;
	havoc _totalSupply#243;
	havoc _name#245;
	havoc _symbol#247;
	havoc payedOut_unchk20#250;
	havoc winner_unchk20#252;
	havoc winAmount_unchk20#254;
	havoc _balances#277;
	havoc payedOut_unchk32#280;
	havoc winner_unchk32#282;
	havoc winAmount_unchk32#284;
	havoc _allowed#309;
	havoc payedOut_unchk8#513;
	havoc winner_unchk8#515;
	havoc winAmount_unchk8#517;
	havoc payedOut_unchk44#724;
	havoc winner_unchk44#726;
	havoc winAmount_unchk44#728;
	havoc __balance;
	}

	if (!(__call_ret#52)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return43:
	// Function body ends here
}

