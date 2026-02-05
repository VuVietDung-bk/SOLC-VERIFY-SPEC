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
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_23.sol", 120, 3} {:message "ERC20::bug_unchk_send15"} bug_unchk_send15#222(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 121, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 122, 3} {:message "_balances"} _balances#226: [address_t][address_t]int;
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_23.sol", 124, 3} {:message "ERC20::bug_unchk_send28"} bug_unchk_send28#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 125, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return6:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_23.sol", 126, 3} {:message "_allowed"} _allowed#245: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_23.sol", 128, 3} {:message "ERC20::bug_unchk_send21"} bug_unchk_send21#258(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 129, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_23.sol", 130, 3} {:message "_totalSupply"} _totalSupply#260: [address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 135, 5} {:message "ERC20::totalSupply"} totalSupply#270(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#265: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#265 := _totalSupply#260[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_23.sol", 138, 1} {:message "ERC20::bug_unchk_send11"} bug_unchk_send11#283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 139, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 146, 5} {:message "ERC20::balanceOf"} balanceOf#297(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#286: address_t)
	returns (#290: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#290 := _balances#226[__this][owner#286];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_23.sol", 149, 1} {:message "ERC20::bug_unchk_send1"} bug_unchk_send1#310(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 150, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return11:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 158, 5} {:message "ERC20::allowance"} allowance#328(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#313: address_t, spender#315: address_t)
	returns (#319: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#319 := _allowed#245[__this][owner#313][spender#315];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_23.sol", 161, 1} {:message "ERC20::bug_unchk_send2"} bug_unchk_send2#341(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 162, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return13:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 169, 5} {:message "ERC20::transfer"} transfer#362(__this: address_t, __msg_sender: address_t, __msg_value: int, to#344: address_t, value#346: int)
	returns (#350: bool)
{
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#6 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 170, 9} {:message ""} true;
	call _transfer#589(__this, __msg_sender, __msg_value, call_arg#6, to#344, value#346);
	#350 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_23.sol", 173, 1} {:message "ERC20::bug_unchk_send17"} bug_unchk_send17#375(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 174, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 185, 5} {:message "ERC20::approve"} approve#396(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#378: address_t, value#380: int)
	returns (#384: bool)
{
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 186, 9} {:message ""} true;
	call _approve#761(__this, __msg_sender, __msg_value, call_arg#8, spender#378, value#380);
	#384 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_23.sol", 189, 1} {:message "ERC20::bug_unchk_send3"} bug_unchk_send3#409(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 190, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 200, 5} {:message "ERC20::transferFrom"} transferFrom#446(__this: address_t, __msg_sender: address_t, __msg_value: int, from#412: address_t, to#414: address_t, value#416: int)
	returns (#420: bool)
{
	var call_arg#10: address_t;
	var sub#155_ret#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 201, 9} {:message ""} true;
	call _transfer#589(__this, __msg_sender, __msg_value, from#412, to#414, value#416);
	call_arg#10 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 202, 36} {:message ""} true;
	call sub#155_ret#11 := sub#155(__this, __msg_sender, __msg_value, _allowed#245[__this][from#412][__msg_sender], value#416);
	assume {:sourceloc "buggy_23.sol", 202, 9} {:message ""} true;
	call _approve#761(__this, __msg_sender, __msg_value, from#412, call_arg#10, sub#155_ret#11);
	#420 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_23.sol", 205, 1} {:message "ERC20::bug_unchk_send9"} bug_unchk_send9#459(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 206, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 218, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#487(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#462: address_t, addedValue#464: int)
	returns (#467: bool)
{
	var call_arg#13: address_t;
	var add#180_ret#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#13 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 219, 39} {:message ""} true;
	call add#180_ret#14 := add#180(__this, __msg_sender, __msg_value, _allowed#245[__this][__msg_sender][spender#462], addedValue#464);
	assume {:sourceloc "buggy_23.sol", 219, 9} {:message ""} true;
	call _approve#761(__this, __msg_sender, __msg_value, call_arg#13, spender#462, add#180_ret#14);
	#467 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_23.sol", 222, 1} {:message "ERC20::bug_unchk_send25"} bug_unchk_send25#500(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 223, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 235, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#528(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#503: address_t, subtractedValue#505: int)
	returns (#508: bool)
{
	var call_arg#16: address_t;
	var sub#155_ret#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 236, 39} {:message ""} true;
	call sub#155_ret#17 := sub#155(__this, __msg_sender, __msg_value, _allowed#245[__this][__msg_sender][spender#503], subtractedValue#505);
	assume {:sourceloc "buggy_23.sol", 236, 9} {:message ""} true;
	call _approve#761(__this, __msg_sender, __msg_value, call_arg#16, spender#503, sub#155_ret#17);
	#508 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_23.sol", 239, 1} {:message "ERC20::bug_unchk_send19"} bug_unchk_send19#541(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 240, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 248, 5} {:message "ERC20::_transfer"} _transfer#589(__this: address_t, __msg_sender: address_t, __msg_value: int, from#544: address_t, to#546: address_t, value#548: int)
{
	var sub#155_ret#19: int;
	var add#180_ret#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#546 != 0);
	assume {:sourceloc "buggy_23.sol", 251, 27} {:message ""} true;
	call sub#155_ret#19 := sub#155(__this, __msg_sender, __msg_value, _balances#226[__this][from#544], value#548);
	_balances#226 := _balances#226[__this := _balances#226[__this][from#544 := sub#155_ret#19]];
	assume {:sourceloc "buggy_23.sol", 252, 25} {:message ""} true;
	call add#180_ret#20 := add#180(__this, __msg_sender, __msg_value, _balances#226[__this][to#546], value#548);
	_balances#226 := _balances#226[__this := _balances#226[__this][to#546 := add#180_ret#20]];
	assume {:sourceloc "buggy_23.sol", 253, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, from#544, to#546, value#548);
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_23.sol", 255, 1} {:message "ERC20::bug_unchk_send26"} bug_unchk_send26#602(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 256, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 265, 5} {:message "ERC20::_mint"} _mint#647(__this: address_t, __msg_sender: address_t, __msg_value: int, account#605: address_t, value#607: int)
{
	var add#180_ret#22: int;
	var add#180_ret#23: int;
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#605 != 0);
	assume {:sourceloc "buggy_23.sol", 268, 24} {:message ""} true;
	call add#180_ret#22 := add#180(__this, __msg_sender, __msg_value, _totalSupply#260[__this], value#607);
	_totalSupply#260 := _totalSupply#260[__this := add#180_ret#22];
	assume {:sourceloc "buggy_23.sol", 269, 30} {:message ""} true;
	call add#180_ret#23 := add#180(__this, __msg_sender, __msg_value, _balances#226[__this][account#605], value#607);
	_balances#226 := _balances#226[__this := _balances#226[__this][account#605 := add#180_ret#23]];
	call_arg#24 := 0;
	assume {:sourceloc "buggy_23.sol", 270, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, call_arg#24, account#605, value#607);
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_23.sol", 272, 1} {:message "ERC20::bug_unchk_send20"} bug_unchk_send20#660(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 273, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 281, 5} {:message "ERC20::_burn"} _burn#705(__this: address_t, __msg_sender: address_t, __msg_value: int, account#663: address_t, value#665: int)
{
	var sub#155_ret#26: int;
	var sub#155_ret#27: int;
	var call_arg#28: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#663 != 0);
	assume {:sourceloc "buggy_23.sol", 284, 24} {:message ""} true;
	call sub#155_ret#26 := sub#155(__this, __msg_sender, __msg_value, _totalSupply#260[__this], value#665);
	_totalSupply#260 := _totalSupply#260[__this := sub#155_ret#26];
	assume {:sourceloc "buggy_23.sol", 285, 30} {:message ""} true;
	call sub#155_ret#27 := sub#155(__this, __msg_sender, __msg_value, _balances#226[__this][account#663], value#665);
	_balances#226 := _balances#226[__this := _balances#226[__this][account#663 := sub#155_ret#27]];
	call_arg#28 := 0;
	assume {:sourceloc "buggy_23.sol", 286, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, account#663, call_arg#28, value#665);
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_23.sol", 288, 1} {:message "ERC20::bug_unchk_send32"} bug_unchk_send32#718(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#29 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 289, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#29);
	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 297, 5} {:message "ERC20::_approve"} _approve#761(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#721: address_t, spender#723: address_t, value#725: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#723 != 0);
	assume (owner#721 != 0);
	_allowed#245 := _allowed#245[__this := _allowed#245[__this][owner#721 := _allowed#245[__this][owner#721][spender#723 := value#725]]];
	assume {:sourceloc "buggy_23.sol", 302, 14} {:message ""} true;
	call Approval#68(__this, __msg_sender, __msg_value, owner#721, spender#723, value#725);
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_23.sol", 304, 1} {:message "ERC20::bug_unchk_send4"} bug_unchk_send4#774(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 305, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#30);
	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 315, 5} {:message "ERC20::_burnFrom"} _burnFrom#803(__this: address_t, __msg_sender: address_t, __msg_value: int, account#777: address_t, value#779: int)
{
	var call_arg#31: address_t;
	var sub#155_ret#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 316, 9} {:message ""} true;
	call _burn#705(__this, __msg_sender, __msg_value, account#777, value#779);
	call_arg#31 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 317, 39} {:message ""} true;
	call sub#155_ret#32 := sub#155(__this, __msg_sender, __msg_value, _allowed#245[__this][account#777][__msg_sender], value#779);
	assume {:sourceloc "buggy_23.sol", 317, 9} {:message ""} true;
	call _approve#761(__this, __msg_sender, __msg_value, account#777, call_arg#31, sub#155_ret#32);
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_23.sol", 319, 1} {:message "ERC20::bug_unchk_send7"} bug_unchk_send7#816(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#33 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 320, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#33);
	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_23.sol", 117, 1} {:message "ERC20::[implicit_constructor]"} __constructor#817(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_balances#226 := _balances#226[__this := default_address_t_int()];
	_allowed#245 := _allowed#245[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#260 := _totalSupply#260[__this := 0];
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Burnable -------
// Inherits from: ERC20
// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_23.sol", 337, 5} {:message "ERC20Burnable::burn"} burn#834(__this: address_t, __msg_sender: address_t, __msg_value: int, value#824: int)
{
	var call_arg#34: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#34 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 338, 9} {:message ""} true;
	call _burn#705(__this, __msg_sender, __msg_value, call_arg#34, value#824);
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_23.sol", 340, 1} {:message "ERC20Burnable::bug_unchk_send23"} bug_unchk_send23#847(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#35 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 341, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#35);
	$return35:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256)
procedure {:sourceloc "buggy_23.sol", 348, 5} {:message "ERC20Burnable::burnFrom"} burnFrom#861(__this: address_t, __msg_sender: address_t, __msg_value: int, from#850: address_t, value#852: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 349, 9} {:message ""} true;
	call _burnFrom#803(__this, __msg_sender, __msg_value, from#850, value#852);
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_23.sol", 351, 1} {:message "ERC20Burnable::bug_unchk_send14"} bug_unchk_send14#874(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#36 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 352, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#36);
	$return37:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 332, 1} {:message "ERC20Burnable::[implicit_constructor]"} __constructor#875(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_balances#226 := _balances#226[__this := default_address_t_int()];
	_allowed#245 := _allowed#245[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#260 := _totalSupply#260[__this := 0];
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_23.sol", 367, 3} {:message "ERC20Detailed::bug_unchk_send10"} bug_unchk_send10#892(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#37 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 368, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#37);
	$return38:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_23.sol", 369, 3} {:message "_name"} _name#894: [address_t]int_arr_type;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_23.sol", 370, 3} {:message "ERC20Detailed::bug_unchk_send22"} bug_unchk_send22#907(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 371, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#38);
	$return39:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_23.sol", 372, 3} {:message "_symbol"} _symbol#909: [address_t]int_arr_type;
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_23.sol", 373, 3} {:message "ERC20Detailed::bug_unchk_send12"} bug_unchk_send12#922(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 374, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return40:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_23.sol", 375, 3} {:message "_decimals"} _decimals#924: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_23.sol", 377, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1026(__this: address_t, __msg_sender: address_t, __msg_value: int, name#926: int_arr_ptr, symbol#928: int_arr_ptr, decimals#930: int)
{
	// TCC assumptions
	assume (name#926 < __alloc_counter);
	assume (symbol#928 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#894 := _name#894[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#909 := _symbol#909[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#924 := _decimals#924[__this := 0];
	// Function body starts here
	_name#894 := _name#894[__this := mem_arr_int[name#926]];
	_symbol#909 := _symbol#909[__this := mem_arr_int[symbol#928]];
	_decimals#924 := _decimals#924[__this := decimals#930];
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_23.sol", 382, 1} {:message "ERC20Detailed::bug_unchk_send30"} bug_unchk_send30#959(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#40 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 383, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#40);
	$return42:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 388, 5} {:message "ERC20Detailed::name"} name#968(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#963: int_arr_ptr)
{
	var new_array#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#41 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#963 := new_array#41;
	mem_arr_int := mem_arr_int[#963 := _name#894[__this]];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_23.sol", 391, 1} {:message "ERC20Detailed::bug_unchk_send8"} bug_unchk_send8#981(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 392, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#42);
	$return44:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 397, 5} {:message "ERC20Detailed::symbol"} symbol#990(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#985: int_arr_ptr)
{
	var new_array#43: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#985 := new_array#43;
	mem_arr_int := mem_arr_int[#985 := _symbol#909[__this]];
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_23.sol", 400, 1} {:message "ERC20Detailed::bug_unchk_send27"} bug_unchk_send27#1003(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 401, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#44);
	$return46:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_23.sol", 406, 5} {:message "ERC20Detailed::decimals"} decimals#1012(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1007: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1007 := _decimals#924[__this];
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_23.sol", 409, 1} {:message "ERC20Detailed::bug_unchk_send31"} bug_unchk_send31#1025(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#45 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 410, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#45);
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
procedure {:sourceloc "buggy_23.sol", 421, 3} {:message "AGR::[constructor]"} __constructor#1070(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1035: int_arr_ptr, _symbol#1037: int_arr_ptr, _decimals#1039: int)
{
	var name#926#46: int_arr_ptr;
	var symbol#928#46: int_arr_ptr;
	var decimals#930#46: int;
	var call_arg#48: address_t;
	var call_arg#49: int;
	// TCC assumptions
	assume (_name#1035 < __alloc_counter);
	assume (_symbol#1037 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#894 := _name#894[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#909 := _symbol#909[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#924 := _decimals#924[__this := 0];
	_balances#226 := _balances#226[__this := default_address_t_int()];
	_allowed#245 := _allowed#245[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#260 := _totalSupply#260[__this := 0];
	// Arguments for ERC20Detailed
	name#926#46 := _name#1035;
	symbol#928#46 := _symbol#1037;
	decimals#930#46 := _decimals#1039;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#894 := _name#894[__this := mem_arr_int[name#926#46]];
	_symbol#909 := _symbol#909[__this := mem_arr_int[symbol#928#46]];
	_decimals#924 := _decimals#924[__this := decimals#930#46];
	$return49:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#48 := __msg_sender;
	call_arg#49 := 30000000000000;
	assume {:sourceloc "buggy_23.sol", 422, 9} {:message ""} true;
	call _mint#647(__this, __msg_sender, __msg_value, call_arg#48, call_arg#49);
	$return50:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_23.sol", 424, 1} {:message "AGR::bug_unchk_send13"} bug_unchk_send13#1069(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#50 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 425, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#50);
	$return51:
	// Function body ends here
}

