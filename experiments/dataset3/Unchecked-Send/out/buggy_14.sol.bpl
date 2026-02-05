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
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_14.sol", 72, 3} {:message "ERC20::bug_unchk_send22"} bug_unchk_send22#218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 73, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return5:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_14.sol", 74, 3} {:message "ERC20::bug_unchk_send12"} bug_unchk_send12#231(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 75, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_14.sol", 76, 3} {:message "_totalSupply"} _totalSupply#233: [address_t]int;
// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_14.sol", 77, 5} {:message "_name"} _name#235: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 78, 5} {:message "_symbol"} _symbol#237: [address_t]int_arr_type;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_14.sol", 80, 3} {:message "ERC20::bug_unchk_send11"} bug_unchk_send11#250(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 81, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return7:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 82, 3} {:message "_balances"} _balances#254: [address_t][address_t]int;
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_14.sol", 83, 3} {:message "ERC20::bug_unchk_send1"} bug_unchk_send1#267(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 84, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return8:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_14.sol", 85, 3} {:message "_allowed"} _allowed#273: [address_t][address_t][address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 88, 5} {:message "ERC20::totalSupply"} totalSupply#282(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#277: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#277 := _totalSupply#233[__this];
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_14.sol", 91, 1} {:message "ERC20::bug_unchk_send3"} bug_unchk_send3#295(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 92, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return10:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 94, 5} {:message "ERC20::balanceOf"} balanceOf#308(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#297: address_t)
	returns (#301: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#301 := _balances#254[__this][owner#297];
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_14.sol", 97, 1} {:message "ERC20::bug_unchk_send9"} bug_unchk_send9#321(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 98, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 100, 5} {:message "ERC20::transfer"} transfer#341(__this: address_t, __msg_sender: address_t, __msg_value: int, to#323: address_t, value#325: int)
	returns (#329: bool)
{
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#6 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 101, 9} {:message ""} true;
	call _transfer#595(__this, __msg_sender, __msg_value, call_arg#6, to#323, value#325);
	#329 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_14.sol", 104, 1} {:message "ERC20::bug_unchk_send25"} bug_unchk_send25#354(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 105, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 107, 9} {:message "ERC20::transferFrom"} transferFrom#390(__this: address_t, __msg_sender: address_t, __msg_value: int, from#356: address_t, to#358: address_t, value#360: int)
	returns (#364: bool)
{
	var call_arg#8: address_t;
	var sub#82_ret#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 108, 10} {:message ""} true;
	call _transfer#595(__this, __msg_sender, __msg_value, from#356, to#358, value#360);
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 109, 37} {:message ""} true;
	call sub#82_ret#9 := sub#82(__this, __msg_sender, __msg_value, _allowed#273[__this][from#356][__msg_sender], value#360);
	assume {:sourceloc "buggy_14.sol", 109, 10} {:message ""} true;
	call _approve#650(__this, __msg_sender, __msg_value, from#356, call_arg#8, sub#82_ret#9);
	#364 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_14.sol", 112, 1} {:message "ERC20::bug_unchk_send19"} bug_unchk_send19#403(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 113, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 115, 5} {:message "ERC20::approve"} approve#423(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#405: address_t, value#407: int)
	returns (#411: bool)
{
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 116, 9} {:message ""} true;
	call _approve#650(__this, __msg_sender, __msg_value, call_arg#11, spender#405, value#407);
	#411 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_14.sol", 119, 1} {:message "ERC20::bug_unchk_send26"} bug_unchk_send26#436(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 120, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 122, 5} {:message "ERC20::allowance"} allowance#453(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#438: address_t, spender#440: address_t)
	returns (#444: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#444 := _allowed#273[__this][owner#438][spender#440];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_14.sol", 125, 1} {:message "ERC20::bug_unchk_send20"} bug_unchk_send20#466(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 126, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_14.sol", 128, 5} {:message "ERC20::burn"} burn#478(__this: address_t, __msg_sender: address_t, __msg_value: int, value#468: int)
{
	var call_arg#14: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 129, 9} {:message ""} true;
	call _burn#707(__this, __msg_sender, __msg_value, call_arg#14, value#468);
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_14.sol", 131, 1} {:message "ERC20::bug_unchk_send32"} bug_unchk_send32#491(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 132, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return22:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 134, 5} {:message "ERC20::_mint"} _mint#535(__this: address_t, __msg_sender: address_t, __msg_value: int, account#493: address_t, value#495: int)
{
	var add#106_ret#16: int;
	var add#106_ret#17: int;
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#493 != 0);
	assume {:sourceloc "buggy_14.sol", 136, 24} {:message ""} true;
	call add#106_ret#16 := add#106(__this, __msg_sender, __msg_value, _totalSupply#233[__this], value#495);
	_totalSupply#233 := _totalSupply#233[__this := add#106_ret#16];
	assume {:sourceloc "buggy_14.sol", 137, 30} {:message ""} true;
	call add#106_ret#17 := add#106(__this, __msg_sender, __msg_value, _balances#254[__this][account#493], value#495);
	_balances#254 := _balances#254[__this := _balances#254[__this][account#493 := add#106_ret#17]];
	call_arg#18 := 0;
	assume {:sourceloc "buggy_14.sol", 138, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, call_arg#18, account#493, value#495);
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_14.sol", 140, 1} {:message "ERC20::bug_unchk_send4"} bug_unchk_send4#548(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 141, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return24:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 143, 5} {:message "ERC20::_transfer"} _transfer#595(__this: address_t, __msg_sender: address_t, __msg_value: int, from#550: address_t, to#552: address_t, value#554: int)
{
	var sub#82_ret#20: int;
	var add#106_ret#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#552 != 0);
	assume {:sourceloc "buggy_14.sol", 146, 27} {:message ""} true;
	call sub#82_ret#20 := sub#82(__this, __msg_sender, __msg_value, _balances#254[__this][from#550], value#554);
	_balances#254 := _balances#254[__this := _balances#254[__this][from#550 := sub#82_ret#20]];
	assume {:sourceloc "buggy_14.sol", 147, 25} {:message ""} true;
	call add#106_ret#21 := add#106(__this, __msg_sender, __msg_value, _balances#254[__this][to#552], value#554);
	_balances#254 := _balances#254[__this := _balances#254[__this][to#552 := add#106_ret#21]];
	assume {:sourceloc "buggy_14.sol", 148, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, from#550, to#552, value#554);
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_14.sol", 151, 1} {:message "ERC20::bug_unchk_send7"} bug_unchk_send7#608(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 152, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return26:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 154, 5} {:message "ERC20::_approve"} _approve#650(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#610: address_t, spender#612: address_t, value#614: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#612 != 0);
	assume (owner#610 != 0);
	_allowed#273 := _allowed#273[__this := _allowed#273[__this][owner#610 := _allowed#273[__this][owner#610][spender#612 := value#614]]];
	assume {:sourceloc "buggy_14.sol", 159, 14} {:message ""} true;
	call Approval#193(__this, __msg_sender, __msg_value, owner#610, spender#612, value#614);
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_14.sol", 161, 1} {:message "ERC20::bug_unchk_send23"} bug_unchk_send23#663(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 162, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return28:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 164, 5} {:message "ERC20::_burn"} _burn#707(__this: address_t, __msg_sender: address_t, __msg_value: int, account#665: address_t, value#667: int)
{
	var sub#82_ret#24: int;
	var sub#82_ret#25: int;
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#665 != 0);
	assume {:sourceloc "buggy_14.sol", 167, 24} {:message ""} true;
	call sub#82_ret#24 := sub#82(__this, __msg_sender, __msg_value, _totalSupply#233[__this], value#667);
	_totalSupply#233 := _totalSupply#233[__this := sub#82_ret#24];
	assume {:sourceloc "buggy_14.sol", 168, 30} {:message ""} true;
	call sub#82_ret#25 := sub#82(__this, __msg_sender, __msg_value, _balances#254[__this][account#665], value#667);
	_balances#254 := _balances#254[__this := _balances#254[__this][account#665 := sub#82_ret#25]];
	call_arg#26 := 0;
	assume {:sourceloc "buggy_14.sol", 169, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, account#665, call_arg#26, value#667);
	$return29:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_14.sol", 171, 1} {:message "ERC20::bug_unchk_send14"} bug_unchk_send14#720(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 172, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return30:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_14.sol", 69, 1} {:message "ERC20::[implicit_constructor]"} __constructor#721(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_totalSupply#233 := _totalSupply#233[__this := 0];
	_name#235 := _name#235[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#237 := _symbol#237[__this := int_arr#constr(default_int_int(), 0)];
	_balances#254 := _balances#254[__this := default_address_t_int()];
	_allowed#273 := _allowed#273[__this := default_address_t__k_address_t_v_int()];
}

// 
// ------- Contract: ERC20Detailed -------
// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_14.sol", 176, 5} {:message "_name"} _name#723: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 177, 5} {:message "_symbol"} _symbol#725: [address_t]int_arr_type;
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_14.sol", 178, 3} {:message "ERC20Detailed::bug_unchk_send2"} bug_unchk_send2#738(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 179, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return31:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_14.sol", 180, 3} {:message "_decimals"} _decimals#740: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 182, 5} {:message "ERC20Detailed::[constructor]"} __constructor#842(__this: address_t, __msg_sender: address_t, __msg_value: int, name#742: int_arr_ptr, symbol#744: int_arr_ptr, decimals#746: int)
{
	// TCC assumptions
	assume (name#742 < __alloc_counter);
	assume (symbol#744 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#723 := _name#723[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#725 := _symbol#725[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#740 := _decimals#740[__this := 0];
	// Function body starts here
	_name#723 := _name#723[__this := mem_arr_int[name#742]];
	_symbol#725 := _symbol#725[__this := mem_arr_int[symbol#744]];
	_decimals#740 := _decimals#740[__this := decimals#746];
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_14.sol", 187, 1} {:message "ERC20Detailed::bug_unchk_send30"} bug_unchk_send30#775(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#29 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 188, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#29);
	$return33:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 193, 5} {:message "ERC20Detailed::name"} name#784(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#779: int_arr_ptr)
{
	var new_array#30: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#30 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#779 := new_array#30;
	mem_arr_int := mem_arr_int[#779 := _name#723[__this]];
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_14.sol", 196, 1} {:message "ERC20Detailed::bug_unchk_send8"} bug_unchk_send8#797(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#31 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 197, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#31);
	$return35:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 202, 5} {:message "ERC20Detailed::symbol"} symbol#806(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#801: int_arr_ptr)
{
	var new_array#32: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#32 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#801 := new_array#32;
	mem_arr_int := mem_arr_int[#801 := _symbol#725[__this]];
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_14.sol", 205, 1} {:message "ERC20Detailed::bug_unchk_send27"} bug_unchk_send27#819(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#33 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 206, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#33);
	$return37:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_14.sol", 211, 5} {:message "ERC20Detailed::decimals"} decimals#828(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#823: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#823 := _decimals#740[__this];
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_14.sol", 214, 1} {:message "ERC20Detailed::bug_unchk_send31"} bug_unchk_send31#841(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#34 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 215, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#34);
	$return39:
	// Function body ends here
}

// 
// ------- Contract: SaveWon -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_14.sol", 219, 3} {:message "SaveWon::bug_unchk_send17"} bug_unchk_send17#859(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#35 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 220, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#35);
	$return40:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 227, 5} {:message "SaveWon::[constructor]"} __constructor#907(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#876: int_arr_ptr, _symbol#878: int_arr_ptr)
{
	var name#742#36: int_arr_ptr;
	var symbol#744#36: int_arr_ptr;
	var decimals#746#36: int;
	var call_arg#38: address_t;
	// TCC assumptions
	assume (_name#876 < __alloc_counter);
	assume (_symbol#878 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#723 := _name#723[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#725 := _symbol#725[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#740 := _decimals#740[__this := 0];
	_totalSupply#233 := _totalSupply#233[__this := 0];
	_name#235 := _name#235[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#237 := _symbol#237[__this := int_arr#constr(default_int_int(), 0)];
	_balances#254 := _balances#254[__this := default_address_t_int()];
	_allowed#273 := _allowed#273[__this := default_address_t__k_address_t_v_int()];
	// Arguments for ERC20Detailed
	name#742#36 := _name#876;
	symbol#744#36 := _symbol#878;
	decimals#746#36 := 18;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#723 := _name#723[__this := mem_arr_int[name#742#36]];
	_symbol#725 := _symbol#725[__this := mem_arr_int[symbol#744#36]];
	_decimals#740 := _decimals#740[__this := decimals#746#36];
	$return41:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 228, 9} {:message ""} true;
	call _mint#535(__this, __msg_sender, __msg_value, call_arg#38, (50000000000 * 1000000000000000000));
	$return42:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_14.sol", 230, 1} {:message "SaveWon::bug_unchk_send13"} bug_unchk_send13#906(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 231, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return43:
	// Function body ends here
}

