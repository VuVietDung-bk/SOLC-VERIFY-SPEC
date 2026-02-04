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
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_23.sol", 120, 3} {:message "ERC20::bug_tmstmp9"} bug_tmstmp9#220(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#212: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#212 := (__block_timestamp >= 1546300800);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 123, 3} {:message "_balances"} _balances#224: [address_t][address_t]int;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_23.sol", 125, 3} {:message "ERC20::bug_tmstmp25"} bug_tmstmp25#235(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#227: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#227 := (__block_timestamp >= 1546300800);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_23.sol", 128, 3} {:message "_allowed"} _allowed#241: [address_t][address_t][address_t]int;
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_23.sol", 130, 3} {:message "winner_tmstmp19"} winner_tmstmp19#243: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 131, 1} {:message "ERC20::play_tmstmp19"} play_tmstmp19#269(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#245: int)
{
	var {:sourceloc "buggy_23.sol", 132, 2} {:message "_vtime"} _vtime#249: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#249 := __block_timestamp;
	if (((startTime#245 + 432000) == _vtime#249)) {
	winner_tmstmp19#243 := winner_tmstmp19#243[__this := __msg_sender];
	}

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
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_23.sol", 143, 1} {:message "winner_tmstmp38"} winner_tmstmp38#283: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 144, 1} {:message "ERC20::play_tmstmp38"} play_tmstmp38#305(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#285: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#285 + 432000) == __block_timestamp)) {
	winner_tmstmp38#283 := winner_tmstmp38#283[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 153, 5} {:message "ERC20::balanceOf"} balanceOf#319(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#308: address_t)
	returns (#312: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#312 := _balances#224[__this][owner#308];
	goto $return10;
	$return10:
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
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_23.sol", 156, 1} {:message "ERC20::bug_tmstmp4"} bug_tmstmp4#366(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 157, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#323: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#323 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#323);
	pastBlockTime_tmstmp4#323 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_23.sol", 162, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 172, 5} {:message "ERC20::allowance"} allowance#384(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#369: address_t, spender#371: address_t)
	returns (#375: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#375 := _allowed#241[__this][owner#369][spender#371];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_23.sol", 175, 1} {:message "winner_tmstmp7"} winner_tmstmp7#386: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 176, 1} {:message "ERC20::play_tmstmp7"} play_tmstmp7#412(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#388: int)
{
	var {:sourceloc "buggy_23.sol", 177, 2} {:message "_vtime"} _vtime#392: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#392 := __block_timestamp;
	if (((startTime#388 + 432000) == _vtime#392)) {
	winner_tmstmp7#386 := winner_tmstmp7#386[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 186, 5} {:message "ERC20::transfer"} transfer#433(__this: address_t, __msg_sender: address_t, __msg_value: int, to#415: address_t, value#417: int)
	returns (#421: bool)
{
	var call_arg#0: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 187, 9} {:message ""} true;
	call _transfer#746(__this, __msg_sender, __msg_value, call_arg#0, to#415, value#417);
	#421 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_23.sol", 190, 1} {:message "winner_tmstmp23"} winner_tmstmp23#435: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 191, 1} {:message "ERC20::play_tmstmp23"} play_tmstmp23#461(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#437: int)
{
	var {:sourceloc "buggy_23.sol", 192, 2} {:message "_vtime"} _vtime#441: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#441 := __block_timestamp;
	if (((startTime#437 + 432000) == _vtime#441)) {
	winner_tmstmp23#435 := winner_tmstmp23#435[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 205, 5} {:message "ERC20::approve"} approve#482(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#464: address_t, value#466: int)
	returns (#470: bool)
{
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 206, 9} {:message ""} true;
	call _approve#1001(__this, __msg_sender, __msg_value, call_arg#1, spender#464, value#466);
	#470 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_23.sol", 209, 1} {:message "winner_tmstmp14"} winner_tmstmp14#484: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 210, 1} {:message "ERC20::play_tmstmp14"} play_tmstmp14#506(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#486: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#486 + 432000) == __block_timestamp)) {
	winner_tmstmp14#484 := winner_tmstmp14#484[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 222, 5} {:message "ERC20::transferFrom"} transferFrom#543(__this: address_t, __msg_sender: address_t, __msg_value: int, from#509: address_t, to#511: address_t, value#513: int)
	returns (#517: bool)
{
	var call_arg#2: address_t;
	var sub#155_ret#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 223, 9} {:message ""} true;
	call _transfer#746(__this, __msg_sender, __msg_value, from#509, to#511, value#513);
	call_arg#2 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 224, 36} {:message ""} true;
	call sub#155_ret#3 := sub#155(__this, __msg_sender, __msg_value, _allowed#241[__this][from#509][__msg_sender], value#513);
	assume {:sourceloc "buggy_23.sol", 224, 9} {:message ""} true;
	call _approve#1001(__this, __msg_sender, __msg_value, from#509, call_arg#2, sub#155_ret#3);
	#517 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_23.sol", 227, 1} {:message "winner_tmstmp30"} winner_tmstmp30#545: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 228, 1} {:message "ERC20::play_tmstmp30"} play_tmstmp30#567(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#547: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#547 + 432000) == __block_timestamp)) {
	winner_tmstmp30#545 := winner_tmstmp30#545[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 242, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#595(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#570: address_t, addedValue#572: int)
	returns (#575: bool)
{
	var call_arg#4: address_t;
	var add#180_ret#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 243, 39} {:message ""} true;
	call add#180_ret#5 := add#180(__this, __msg_sender, __msg_value, _allowed#241[__this][__msg_sender][spender#570], addedValue#572);
	assume {:sourceloc "buggy_23.sol", 243, 9} {:message ""} true;
	call _approve#1001(__this, __msg_sender, __msg_value, call_arg#4, spender#570, add#180_ret#5);
	#575 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_23.sol", 246, 1} {:message "ERC20::bug_tmstmp8"} bug_tmstmp8#642(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 247, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#599: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#599 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#599);
	pastBlockTime_tmstmp8#599 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_23.sol", 252, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 266, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#670(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#645: address_t, subtractedValue#647: int)
	returns (#650: bool)
{
	var call_arg#6: address_t;
	var sub#155_ret#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#6 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 267, 39} {:message ""} true;
	call sub#155_ret#7 := sub#155(__this, __msg_sender, __msg_value, _allowed#241[__this][__msg_sender][spender#645], subtractedValue#647);
	assume {:sourceloc "buggy_23.sol", 267, 9} {:message ""} true;
	call _approve#1001(__this, __msg_sender, __msg_value, call_arg#6, spender#645, sub#155_ret#7);
	#650 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_23.sol", 270, 1} {:message "winner_tmstmp39"} winner_tmstmp39#672: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 271, 1} {:message "ERC20::play_tmstmp39"} play_tmstmp39#698(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#674: int)
{
	var {:sourceloc "buggy_23.sol", 272, 2} {:message "_vtime"} _vtime#678: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#678 := __block_timestamp;
	if (((startTime#674 + 432000) == _vtime#678)) {
	winner_tmstmp39#672 := winner_tmstmp39#672[__this := __msg_sender];
	}

	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 282, 5} {:message "ERC20::_transfer"} _transfer#746(__this: address_t, __msg_sender: address_t, __msg_value: int, from#701: address_t, to#703: address_t, value#705: int)
{
	var sub#155_ret#8: int;
	var add#180_ret#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#703 != 0);
	assume {:sourceloc "buggy_23.sol", 285, 27} {:message ""} true;
	call sub#155_ret#8 := sub#155(__this, __msg_sender, __msg_value, _balances#224[__this][from#701], value#705);
	_balances#224 := _balances#224[__this := _balances#224[__this][from#701 := sub#155_ret#8]];
	assume {:sourceloc "buggy_23.sol", 286, 25} {:message ""} true;
	call add#180_ret#9 := add#180(__this, __msg_sender, __msg_value, _balances#224[__this][to#703], value#705);
	_balances#224 := _balances#224[__this := _balances#224[__this][to#703 := add#180_ret#9]];
	assume {:sourceloc "buggy_23.sol", 287, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, from#701, to#703, value#705);
	$return24:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_23.sol", 289, 1} {:message "ERC20::bug_tmstmp36"} bug_tmstmp36#793(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 290, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#750: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#750 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#750);
	pastBlockTime_tmstmp36#750 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_23.sol", 295, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 306, 5} {:message "ERC20::_mint"} _mint#838(__this: address_t, __msg_sender: address_t, __msg_value: int, account#796: address_t, value#798: int)
{
	var add#180_ret#10: int;
	var add#180_ret#11: int;
	var call_arg#12: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#796 != 0);
	assume {:sourceloc "buggy_23.sol", 309, 24} {:message ""} true;
	call add#180_ret#10 := add#180(__this, __msg_sender, __msg_value, _totalSupply#271[__this], value#798);
	_totalSupply#271 := _totalSupply#271[__this := add#180_ret#10];
	assume {:sourceloc "buggy_23.sol", 310, 30} {:message ""} true;
	call add#180_ret#11 := add#180(__this, __msg_sender, __msg_value, _balances#224[__this][account#796], value#798);
	_balances#224 := _balances#224[__this := _balances#224[__this][account#796 := add#180_ret#11]];
	call_arg#12 := 0;
	assume {:sourceloc "buggy_23.sol", 311, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, call_arg#12, account#796, value#798);
	$return26:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_23.sol", 313, 1} {:message "winner_tmstmp35"} winner_tmstmp35#840: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 314, 1} {:message "ERC20::play_tmstmp35"} play_tmstmp35#866(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#842: int)
{
	var {:sourceloc "buggy_23.sol", 315, 2} {:message "_vtime"} _vtime#846: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#846 := __block_timestamp;
	if (((startTime#842 + 432000) == _vtime#846)) {
	winner_tmstmp35#840 := winner_tmstmp35#840[__this := __msg_sender];
	}

	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 325, 5} {:message "ERC20::_burn"} _burn#911(__this: address_t, __msg_sender: address_t, __msg_value: int, account#869: address_t, value#871: int)
{
	var sub#155_ret#13: int;
	var sub#155_ret#14: int;
	var call_arg#15: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#869 != 0);
	assume {:sourceloc "buggy_23.sol", 328, 24} {:message ""} true;
	call sub#155_ret#13 := sub#155(__this, __msg_sender, __msg_value, _totalSupply#271[__this], value#871);
	_totalSupply#271 := _totalSupply#271[__this := sub#155_ret#13];
	assume {:sourceloc "buggy_23.sol", 329, 30} {:message ""} true;
	call sub#155_ret#14 := sub#155(__this, __msg_sender, __msg_value, _balances#224[__this][account#869], value#871);
	_balances#224 := _balances#224[__this := _balances#224[__this][account#869 := sub#155_ret#14]];
	call_arg#15 := 0;
	assume {:sourceloc "buggy_23.sol", 330, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, account#869, call_arg#15, value#871);
	$return28:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_23.sol", 332, 1} {:message "ERC20::bug_tmstmp40"} bug_tmstmp40#958(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 333, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#915: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#915 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#915);
	pastBlockTime_tmstmp40#915 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_23.sol", 338, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 348, 5} {:message "ERC20::_approve"} _approve#1001(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#961: address_t, spender#963: address_t, value#965: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#963 != 0);
	assume (owner#961 != 0);
	_allowed#241 := _allowed#241[__this := _allowed#241[__this][owner#961 := _allowed#241[__this][owner#961][spender#963 := value#965]]];
	assume {:sourceloc "buggy_23.sol", 353, 14} {:message ""} true;
	call Approval#68(__this, __msg_sender, __msg_value, owner#961, spender#963, value#965);
	$return30:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_23.sol", 355, 1} {:message "ERC20::bug_tmstmp33"} bug_tmstmp33#1012(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1004: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1004 := (__block_timestamp >= 1546300800);
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 367, 5} {:message "ERC20::_burnFrom"} _burnFrom#1041(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1015: address_t, value#1017: int)
{
	var call_arg#16: address_t;
	var sub#155_ret#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 368, 9} {:message ""} true;
	call _burn#911(__this, __msg_sender, __msg_value, account#1015, value#1017);
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 369, 39} {:message ""} true;
	call sub#155_ret#17 := sub#155(__this, __msg_sender, __msg_value, _allowed#241[__this][account#1015][__msg_sender], value#1017);
	assume {:sourceloc "buggy_23.sol", 369, 9} {:message ""} true;
	call _approve#1001(__this, __msg_sender, __msg_value, account#1015, call_arg#16, sub#155_ret#17);
	$return32:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_23.sol", 371, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1043: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 372, 1} {:message "ERC20::play_tmstmp27"} play_tmstmp27#1069(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1045: int)
{
	var {:sourceloc "buggy_23.sol", 373, 2} {:message "_vtime"} _vtime#1049: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1049 := __block_timestamp;
	if (((startTime#1045 + 432000) == _vtime#1049)) {
	winner_tmstmp27#1043 := winner_tmstmp27#1043[__this := __msg_sender];
	}

	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_23.sol", 117, 1} {:message "ERC20::[implicit_constructor]"} __constructor#1070(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_balances#224 := _balances#224[__this := default_address_t_int()];
	_allowed#241 := _allowed#241[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp19#243 := winner_tmstmp19#243[__this := 0];
	_totalSupply#271 := _totalSupply#271[__this := 0];
	winner_tmstmp38#283 := winner_tmstmp38#283[__this := 0];
	winner_tmstmp7#386 := winner_tmstmp7#386[__this := 0];
	winner_tmstmp23#435 := winner_tmstmp23#435[__this := 0];
	winner_tmstmp14#484 := winner_tmstmp14#484[__this := 0];
	winner_tmstmp30#545 := winner_tmstmp30#545[__this := 0];
	winner_tmstmp39#672 := winner_tmstmp39#672[__this := 0];
	winner_tmstmp35#840 := winner_tmstmp35#840[__this := 0];
	winner_tmstmp27#1043 := winner_tmstmp27#1043[__this := 0];
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Burnable -------
// Inherits from: ERC20
// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_23.sol", 392, 5} {:message "ERC20Burnable::burn"} burn#1087(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1077: int)
{
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 393, 9} {:message ""} true;
	call _burn#911(__this, __msg_sender, __msg_value, call_arg#18, value#1077);
	$return34:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_23.sol", 395, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1089: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 396, 1} {:message "ERC20Burnable::play_tmstmp31"} play_tmstmp31#1115(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1091: int)
{
	var {:sourceloc "buggy_23.sol", 397, 2} {:message "_vtime"} _vtime#1095: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1095 := __block_timestamp;
	if (((startTime#1091 + 432000) == _vtime#1095)) {
	winner_tmstmp31#1089 := winner_tmstmp31#1089[__this := __msg_sender];
	}

	$return35:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256)
procedure {:sourceloc "buggy_23.sol", 406, 5} {:message "ERC20Burnable::burnFrom"} burnFrom#1129(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1118: address_t, value#1120: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 407, 9} {:message ""} true;
	call _burnFrom#1041(__this, __msg_sender, __msg_value, from#1118, value#1120);
	$return36:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_23.sol", 409, 1} {:message "ERC20Burnable::bug_tmstmp13"} bug_tmstmp13#1140(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1132: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1132 := (__block_timestamp >= 1546300800);
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 387, 1} {:message "ERC20Burnable::[implicit_constructor]"} __constructor#1141(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp31#1089 := winner_tmstmp31#1089[__this := 0];
	_balances#224 := _balances#224[__this := default_address_t_int()];
	_allowed#241 := _allowed#241[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp19#243 := winner_tmstmp19#243[__this := 0];
	_totalSupply#271 := _totalSupply#271[__this := 0];
	winner_tmstmp38#283 := winner_tmstmp38#283[__this := 0];
	winner_tmstmp7#386 := winner_tmstmp7#386[__this := 0];
	winner_tmstmp23#435 := winner_tmstmp23#435[__this := 0];
	winner_tmstmp14#484 := winner_tmstmp14#484[__this := 0];
	winner_tmstmp30#545 := winner_tmstmp30#545[__this := 0];
	winner_tmstmp39#672 := winner_tmstmp39#672[__this := 0];
	winner_tmstmp35#840 := winner_tmstmp35#840[__this := 0];
	winner_tmstmp27#1043 := winner_tmstmp27#1043[__this := 0];
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_23.sol", 426, 3} {:message "winner_tmstmp26"} winner_tmstmp26#1147: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 427, 1} {:message "ERC20Detailed::play_tmstmp26"} play_tmstmp26#1169(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1149: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1149 + 432000) == __block_timestamp)) {
	winner_tmstmp26#1147 := winner_tmstmp26#1147[__this := __msg_sender];
	}

	$return38:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_23.sol", 430, 3} {:message "_name"} _name#1171: [address_t]int_arr_type;
// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_23.sol", 431, 3} {:message "ERC20Detailed::bug_tmstmp20"} bug_tmstmp20#1218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 432, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#1175: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#1175 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#1175);
	pastBlockTime_tmstmp20#1175 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_23.sol", 437, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return39:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_23.sol", 440, 3} {:message "_symbol"} _symbol#1220: [address_t]int_arr_type;
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_23.sol", 441, 3} {:message "ERC20Detailed::bug_tmstmp32"} bug_tmstmp32#1267(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 442, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#1224: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#1224 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#1224);
	pastBlockTime_tmstmp32#1224 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_23.sol", 447, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return40:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_23.sol", 450, 3} {:message "_decimals"} _decimals#1269: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_23.sol", 452, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1335(__this: address_t, __msg_sender: address_t, __msg_value: int, name#1271: int_arr_ptr, symbol#1273: int_arr_ptr, decimals#1275: int)
{
	// TCC assumptions
	assume (name#1271 < __alloc_counter);
	assume (symbol#1273 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp26#1147 := winner_tmstmp26#1147[__this := 0];
	_name#1171 := _name#1171[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1220 := _symbol#1220[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#1269 := _decimals#1269[__this := 0];
	bugv_tmstmp5#1295 := bugv_tmstmp5#1295[__this := __block_timestamp];
	bugv_tmstmp1#1308 := bugv_tmstmp1#1308[__this := __block_timestamp];
	bugv_tmstmp2#1321 := bugv_tmstmp2#1321[__this := __block_timestamp];
	bugv_tmstmp3#1334 := bugv_tmstmp3#1334[__this := __block_timestamp];
	// Function body starts here
	_name#1171 := _name#1171[__this := mem_arr_int[name#1271]];
	_symbol#1220 := _symbol#1220[__this := mem_arr_int[symbol#1273]];
	_decimals#1269 := _decimals#1269[__this := decimals#1275];
	$return41:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_23.sol", 457, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1295: [address_t]int;
// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 462, 5} {:message "ERC20Detailed::name"} name#1304(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1299: int_arr_ptr)
{
	var new_array#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#19 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1299 := new_array#19;
	mem_arr_int := mem_arr_int[#1299 := _name#1171[__this]];
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_23.sol", 465, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1308: [address_t]int;
// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 470, 5} {:message "ERC20Detailed::symbol"} symbol#1317(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1312: int_arr_ptr)
{
	var new_array#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#20 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1312 := new_array#20;
	mem_arr_int := mem_arr_int[#1312 := _symbol#1220[__this]];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_23.sol", 473, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1321: [address_t]int;
// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_23.sol", 478, 5} {:message "ERC20Detailed::decimals"} decimals#1330(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1325: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1325 := _decimals#1269[__this];
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_23.sol", 481, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#1334: [address_t]int;
// Pragma: solidity>=0.7.0
// 
// ------- Contract: AGR -------
// Inherits from: ERC20Burnable
// Inherits from: ERC20Detailed
// 
// Function: 
procedure {:sourceloc "buggy_23.sol", 492, 5} {:message "AGR::[constructor]"} __constructor#1368(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1342: int_arr_ptr, _symbol#1344: int_arr_ptr, _decimals#1346: int)
{
	var name#1271#21: int_arr_ptr;
	var symbol#1273#21: int_arr_ptr;
	var decimals#1275#21: int;
	var call_arg#23: address_t;
	var call_arg#24: int;
	// TCC assumptions
	assume (_name#1342 < __alloc_counter);
	assume (_symbol#1344 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	bugv_tmstmp4#1367 := bugv_tmstmp4#1367[__this := __block_timestamp];
	winner_tmstmp26#1147 := winner_tmstmp26#1147[__this := 0];
	_name#1171 := _name#1171[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1220 := _symbol#1220[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#1269 := _decimals#1269[__this := 0];
	bugv_tmstmp5#1295 := bugv_tmstmp5#1295[__this := __block_timestamp];
	bugv_tmstmp1#1308 := bugv_tmstmp1#1308[__this := __block_timestamp];
	bugv_tmstmp2#1321 := bugv_tmstmp2#1321[__this := __block_timestamp];
	bugv_tmstmp3#1334 := bugv_tmstmp3#1334[__this := __block_timestamp];
	winner_tmstmp31#1089 := winner_tmstmp31#1089[__this := 0];
	_balances#224 := _balances#224[__this := default_address_t_int()];
	_allowed#241 := _allowed#241[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp19#243 := winner_tmstmp19#243[__this := 0];
	_totalSupply#271 := _totalSupply#271[__this := 0];
	winner_tmstmp38#283 := winner_tmstmp38#283[__this := 0];
	winner_tmstmp7#386 := winner_tmstmp7#386[__this := 0];
	winner_tmstmp23#435 := winner_tmstmp23#435[__this := 0];
	winner_tmstmp14#484 := winner_tmstmp14#484[__this := 0];
	winner_tmstmp30#545 := winner_tmstmp30#545[__this := 0];
	winner_tmstmp39#672 := winner_tmstmp39#672[__this := 0];
	winner_tmstmp35#840 := winner_tmstmp35#840[__this := 0];
	winner_tmstmp27#1043 := winner_tmstmp27#1043[__this := 0];
	// Arguments for ERC20Detailed
	name#1271#21 := _name#1342;
	symbol#1273#21 := _symbol#1344;
	decimals#1275#21 := _decimals#1346;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#1171 := _name#1171[__this := mem_arr_int[name#1271#21]];
	_symbol#1220 := _symbol#1220[__this := mem_arr_int[symbol#1273#21]];
	_decimals#1269 := _decimals#1269[__this := decimals#1275#21];
	$return45:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#23 := __msg_sender;
	call_arg#24 := 30000000000000;
	assume {:sourceloc "buggy_23.sol", 493, 9} {:message ""} true;
	call _mint#838(__this, __msg_sender, __msg_value, call_arg#23, call_arg#24);
	$return46:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_23.sol", 495, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#1367: [address_t]int;
