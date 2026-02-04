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
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_14.sol", 72, 3} {:message "ERC20::bug_tmstmp20"} bug_tmstmp20#252(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 73, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#209: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#209 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#209);
	pastBlockTime_tmstmp20#209 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_14.sol", 78, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return5:
	// Function body ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_14.sol", 82, 3} {:message "ERC20::bug_tmstmp32"} bug_tmstmp32#302(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 83, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#259: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#259 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#259);
	pastBlockTime_tmstmp32#259 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_14.sol", 88, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_14.sol", 91, 3} {:message "_totalSupply"} _totalSupply#304: [address_t]int;
// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_14.sol", 92, 5} {:message "_name"} _name#306: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 93, 5} {:message "_symbol"} _symbol#308: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_14.sol", 95, 3} {:message "winner_tmstmp38"} winner_tmstmp38#310: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 96, 1} {:message "ERC20::play_tmstmp38"} play_tmstmp38#332(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#312: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#312 + 432000) == __block_timestamp)) {
	winner_tmstmp38#310 := winner_tmstmp38#310[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 99, 3} {:message "_balances"} _balances#336: [address_t][address_t]int;
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_14.sol", 100, 3} {:message "ERC20::bug_tmstmp4"} bug_tmstmp4#383(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 101, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#340: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#340 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#340);
	pastBlockTime_tmstmp4#340 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_14.sol", 106, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return8:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_14.sol", 109, 3} {:message "_allowed"} _allowed#389: [address_t][address_t][address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 112, 5} {:message "ERC20::totalSupply"} totalSupply#398(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#393: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#393 := _totalSupply#304[__this];
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_14.sol", 115, 1} {:message "winner_tmstmp14"} winner_tmstmp14#400: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 116, 1} {:message "ERC20::play_tmstmp14"} play_tmstmp14#422(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#402: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#402 + 432000) == __block_timestamp)) {
	winner_tmstmp14#400 := winner_tmstmp14#400[__this := __msg_sender];
	}

	$return10:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 120, 5} {:message "ERC20::balanceOf"} balanceOf#435(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#424: address_t)
	returns (#428: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#428 := _balances#336[__this][owner#424];
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_14.sol", 123, 1} {:message "winner_tmstmp30"} winner_tmstmp30#437: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 124, 1} {:message "ERC20::play_tmstmp30"} play_tmstmp30#459(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#439: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#439 + 432000) == __block_timestamp)) {
	winner_tmstmp30#437 := winner_tmstmp30#437[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 128, 5} {:message "ERC20::transfer"} transfer#479(__this: address_t, __msg_sender: address_t, __msg_value: int, to#461: address_t, value#463: int)
	returns (#467: bool)
{
	var call_arg#0: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 129, 9} {:message ""} true;
	call _transfer#863(__this, __msg_sender, __msg_value, call_arg#0, to#461, value#463);
	#467 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_14.sol", 132, 1} {:message "ERC20::bug_tmstmp8"} bug_tmstmp8#526(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 133, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#483: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#483 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#483);
	pastBlockTime_tmstmp8#483 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_14.sol", 138, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 142, 5} {:message "ERC20::transferFrom"} transferFrom#562(__this: address_t, __msg_sender: address_t, __msg_value: int, from#528: address_t, to#530: address_t, value#532: int)
	returns (#536: bool)
{
	var call_arg#1: address_t;
	var sub#82_ret#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 143, 10} {:message ""} true;
	call _transfer#863(__this, __msg_sender, __msg_value, from#528, to#530, value#532);
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 144, 37} {:message ""} true;
	call sub#82_ret#2 := sub#82(__this, __msg_sender, __msg_value, _allowed#389[__this][from#528][__msg_sender], value#532);
	assume {:sourceloc "buggy_14.sol", 144, 10} {:message ""} true;
	call _approve#933(__this, __msg_sender, __msg_value, from#528, call_arg#1, sub#82_ret#2);
	#536 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_14.sol", 147, 1} {:message "winner_tmstmp39"} winner_tmstmp39#564: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 148, 1} {:message "ERC20::play_tmstmp39"} play_tmstmp39#590(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#566: int)
{
	var {:sourceloc "buggy_14.sol", 149, 2} {:message "_vtime"} _vtime#570: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#570 := __block_timestamp;
	if (((startTime#566 + 432000) == _vtime#570)) {
	winner_tmstmp39#564 := winner_tmstmp39#564[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 153, 5} {:message "ERC20::approve"} approve#610(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#592: address_t, value#594: int)
	returns (#598: bool)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#3 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 154, 9} {:message ""} true;
	call _approve#933(__this, __msg_sender, __msg_value, call_arg#3, spender#592, value#594);
	#598 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_14.sol", 157, 1} {:message "ERC20::bug_tmstmp36"} bug_tmstmp36#657(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 158, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#614: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#614 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#614);
	pastBlockTime_tmstmp36#614 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_14.sol", 163, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 167, 5} {:message "ERC20::allowance"} allowance#674(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#659: address_t, spender#661: address_t)
	returns (#665: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#665 := _allowed#389[__this][owner#659][spender#661];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_14.sol", 170, 1} {:message "winner_tmstmp35"} winner_tmstmp35#676: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 171, 1} {:message "ERC20::play_tmstmp35"} play_tmstmp35#702(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#678: int)
{
	var {:sourceloc "buggy_14.sol", 172, 2} {:message "_vtime"} _vtime#682: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#682 := __block_timestamp;
	if (((startTime#678 + 432000) == _vtime#682)) {
	winner_tmstmp35#676 := winner_tmstmp35#676[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_14.sol", 176, 5} {:message "ERC20::burn"} burn#714(__this: address_t, __msg_sender: address_t, __msg_value: int, value#704: int)
{
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 177, 9} {:message ""} true;
	call _burn#1005(__this, __msg_sender, __msg_value, call_arg#4, value#704);
	$return21:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_14.sol", 179, 1} {:message "ERC20::bug_tmstmp40"} bug_tmstmp40#761(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 180, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#718: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#718 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#718);
	pastBlockTime_tmstmp40#718 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_14.sol", 185, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return22:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 189, 5} {:message "ERC20::_mint"} _mint#805(__this: address_t, __msg_sender: address_t, __msg_value: int, account#763: address_t, value#765: int)
{
	var add#106_ret#5: int;
	var add#106_ret#6: int;
	var call_arg#7: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#763 != 0);
	assume {:sourceloc "buggy_14.sol", 191, 24} {:message ""} true;
	call add#106_ret#5 := add#106(__this, __msg_sender, __msg_value, _totalSupply#304[__this], value#765);
	_totalSupply#304 := _totalSupply#304[__this := add#106_ret#5];
	assume {:sourceloc "buggy_14.sol", 192, 30} {:message ""} true;
	call add#106_ret#6 := add#106(__this, __msg_sender, __msg_value, _balances#336[__this][account#763], value#765);
	_balances#336 := _balances#336[__this := _balances#336[__this][account#763 := add#106_ret#6]];
	call_arg#7 := 0;
	assume {:sourceloc "buggy_14.sol", 193, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, call_arg#7, account#763, value#765);
	$return23:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_14.sol", 195, 1} {:message "ERC20::bug_tmstmp33"} bug_tmstmp33#816(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#808: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#808 := (__block_timestamp >= 1546300800);
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 199, 5} {:message "ERC20::_transfer"} _transfer#863(__this: address_t, __msg_sender: address_t, __msg_value: int, from#818: address_t, to#820: address_t, value#822: int)
{
	var sub#82_ret#8: int;
	var add#106_ret#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#820 != 0);
	assume {:sourceloc "buggy_14.sol", 202, 27} {:message ""} true;
	call sub#82_ret#8 := sub#82(__this, __msg_sender, __msg_value, _balances#336[__this][from#818], value#822);
	_balances#336 := _balances#336[__this := _balances#336[__this][from#818 := sub#82_ret#8]];
	assume {:sourceloc "buggy_14.sol", 203, 25} {:message ""} true;
	call add#106_ret#9 := add#106(__this, __msg_sender, __msg_value, _balances#336[__this][to#820], value#822);
	_balances#336 := _balances#336[__this := _balances#336[__this][to#820 := add#106_ret#9]];
	assume {:sourceloc "buggy_14.sol", 204, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, from#818, to#820, value#822);
	$return25:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_14.sol", 207, 1} {:message "winner_tmstmp27"} winner_tmstmp27#865: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 208, 1} {:message "ERC20::play_tmstmp27"} play_tmstmp27#891(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#867: int)
{
	var {:sourceloc "buggy_14.sol", 209, 2} {:message "_vtime"} _vtime#871: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#871 := __block_timestamp;
	if (((startTime#867 + 432000) == _vtime#871)) {
	winner_tmstmp27#865 := winner_tmstmp27#865[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 213, 5} {:message "ERC20::_approve"} _approve#933(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#893: address_t, spender#895: address_t, value#897: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#895 != 0);
	assume (owner#893 != 0);
	_allowed#389 := _allowed#389[__this := _allowed#389[__this][owner#893 := _allowed#389[__this][owner#893][spender#895 := value#897]]];
	assume {:sourceloc "buggy_14.sol", 218, 14} {:message ""} true;
	call Approval#193(__this, __msg_sender, __msg_value, owner#893, spender#895, value#897);
	$return27:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_14.sol", 220, 1} {:message "winner_tmstmp31"} winner_tmstmp31#935: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 221, 1} {:message "ERC20::play_tmstmp31"} play_tmstmp31#961(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#937: int)
{
	var {:sourceloc "buggy_14.sol", 222, 2} {:message "_vtime"} _vtime#941: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#941 := __block_timestamp;
	if (((startTime#937 + 432000) == _vtime#941)) {
	winner_tmstmp31#935 := winner_tmstmp31#935[__this := __msg_sender];
	}

	$return28:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 226, 5} {:message "ERC20::_burn"} _burn#1005(__this: address_t, __msg_sender: address_t, __msg_value: int, account#963: address_t, value#965: int)
{
	var sub#82_ret#10: int;
	var sub#82_ret#11: int;
	var call_arg#12: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#963 != 0);
	assume {:sourceloc "buggy_14.sol", 229, 24} {:message ""} true;
	call sub#82_ret#10 := sub#82(__this, __msg_sender, __msg_value, _totalSupply#304[__this], value#965);
	_totalSupply#304 := _totalSupply#304[__this := sub#82_ret#10];
	assume {:sourceloc "buggy_14.sol", 230, 30} {:message ""} true;
	call sub#82_ret#11 := sub#82(__this, __msg_sender, __msg_value, _balances#336[__this][account#963], value#965);
	_balances#336 := _balances#336[__this := _balances#336[__this][account#963 := sub#82_ret#11]];
	call_arg#12 := 0;
	assume {:sourceloc "buggy_14.sol", 231, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, account#963, call_arg#12, value#965);
	$return29:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_14.sol", 233, 1} {:message "ERC20::bug_tmstmp13"} bug_tmstmp13#1016(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1008: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1008 := (__block_timestamp >= 1546300800);
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_14.sol", 69, 1} {:message "ERC20::[implicit_constructor]"} __constructor#1017(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	_totalSupply#304 := _totalSupply#304[__this := 0];
	_name#306 := _name#306[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#308 := _symbol#308[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp38#310 := winner_tmstmp38#310[__this := 0];
	_balances#336 := _balances#336[__this := default_address_t_int()];
	_allowed#389 := _allowed#389[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp14#400 := winner_tmstmp14#400[__this := 0];
	winner_tmstmp30#437 := winner_tmstmp30#437[__this := 0];
	winner_tmstmp39#564 := winner_tmstmp39#564[__this := 0];
	winner_tmstmp35#676 := winner_tmstmp35#676[__this := 0];
	winner_tmstmp27#865 := winner_tmstmp27#865[__this := 0];
	winner_tmstmp31#935 := winner_tmstmp31#935[__this := 0];
}

// 
// ------- Contract: ERC20Detailed -------
// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_14.sol", 239, 5} {:message "_name"} _name#1019: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 240, 5} {:message "_symbol"} _symbol#1021: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_14.sol", 241, 3} {:message "winner_tmstmp7"} winner_tmstmp7#1023: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 242, 1} {:message "ERC20Detailed::play_tmstmp7"} play_tmstmp7#1049(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1025: int)
{
	var {:sourceloc "buggy_14.sol", 243, 2} {:message "_vtime"} _vtime#1029: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1029 := __block_timestamp;
	if (((startTime#1025 + 432000) == _vtime#1029)) {
	winner_tmstmp7#1023 := winner_tmstmp7#1023[__this := __msg_sender];
	}

	$return31:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_14.sol", 246, 3} {:message "_decimals"} _decimals#1051: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 248, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1117(__this: address_t, __msg_sender: address_t, __msg_value: int, name_#1053: int_arr_ptr, symbol_#1055: int_arr_ptr, decimals_#1057: int)
{
	// TCC assumptions
	assume (name_#1053 < __alloc_counter);
	assume (symbol_#1055 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#1019 := _name#1019[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1021 := _symbol#1021[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp7#1023 := winner_tmstmp7#1023[__this := 0];
	_decimals#1051 := _decimals#1051[__this := 0];
	bugv_tmstmp5#1077 := bugv_tmstmp5#1077[__this := __block_timestamp];
	bugv_tmstmp1#1090 := bugv_tmstmp1#1090[__this := __block_timestamp];
	bugv_tmstmp2#1103 := bugv_tmstmp2#1103[__this := __block_timestamp];
	bugv_tmstmp3#1116 := bugv_tmstmp3#1116[__this := __block_timestamp];
	// Function body starts here
	_name#1019 := _name#1019[__this := mem_arr_int[name_#1053]];
	_symbol#1021 := _symbol#1021[__this := mem_arr_int[symbol_#1055]];
	_decimals#1051 := _decimals#1051[__this := decimals_#1057];
	$return32:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_14.sol", 253, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1077: [address_t]int;
// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 258, 5} {:message "ERC20Detailed::name"} name#1086(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1081: int_arr_ptr)
{
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1081 := new_array#13;
	mem_arr_int := mem_arr_int[#1081 := _name#1019[__this]];
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_14.sol", 261, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1090: [address_t]int;
// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 266, 5} {:message "ERC20Detailed::symbol"} symbol#1099(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1094: int_arr_ptr)
{
	var new_array#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1094 := new_array#14;
	mem_arr_int := mem_arr_int[#1094 := _symbol#1021[__this]];
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_14.sol", 269, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1103: [address_t]int;
// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_14.sol", 274, 5} {:message "ERC20Detailed::decimals"} decimals#1112(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1107: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1107 := _decimals#1051[__this];
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_14.sol", 277, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#1116: [address_t]int;
// 
// ------- Contract: SaveWon -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_14.sol", 281, 3} {:message "winner_tmstmp23"} winner_tmstmp23#1123: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 282, 1} {:message "SaveWon::play_tmstmp23"} play_tmstmp23#1149(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1125: int)
{
	var {:sourceloc "buggy_14.sol", 283, 2} {:message "_vtime"} _vtime#1129: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1129 := __block_timestamp;
	if (((startTime#1125 + 432000) == _vtime#1129)) {
	winner_tmstmp23#1123 := winner_tmstmp23#1123[__this := __msg_sender];
	}

	$return36:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 291, 5} {:message "SaveWon::[constructor]"} __constructor#1185(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1163: int_arr_ptr, _symbol#1165: int_arr_ptr)
{
	var name_#1053#15: int_arr_ptr;
	var symbol_#1055#15: int_arr_ptr;
	var decimals_#1057#15: int;
	var call_arg#17: address_t;
	// TCC assumptions
	assume (_name#1163 < __alloc_counter);
	assume (_symbol#1165 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp23#1123 := winner_tmstmp23#1123[__this := 0];
	bugv_tmstmp4#1184 := bugv_tmstmp4#1184[__this := __block_timestamp];
	_name#1019 := _name#1019[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1021 := _symbol#1021[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp7#1023 := winner_tmstmp7#1023[__this := 0];
	_decimals#1051 := _decimals#1051[__this := 0];
	bugv_tmstmp5#1077 := bugv_tmstmp5#1077[__this := __block_timestamp];
	bugv_tmstmp1#1090 := bugv_tmstmp1#1090[__this := __block_timestamp];
	bugv_tmstmp2#1103 := bugv_tmstmp2#1103[__this := __block_timestamp];
	bugv_tmstmp3#1116 := bugv_tmstmp3#1116[__this := __block_timestamp];
	_totalSupply#304 := _totalSupply#304[__this := 0];
	_name#306 := _name#306[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#308 := _symbol#308[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp38#310 := winner_tmstmp38#310[__this := 0];
	_balances#336 := _balances#336[__this := default_address_t_int()];
	_allowed#389 := _allowed#389[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp14#400 := winner_tmstmp14#400[__this := 0];
	winner_tmstmp30#437 := winner_tmstmp30#437[__this := 0];
	winner_tmstmp39#564 := winner_tmstmp39#564[__this := 0];
	winner_tmstmp35#676 := winner_tmstmp35#676[__this := 0];
	winner_tmstmp27#865 := winner_tmstmp27#865[__this := 0];
	winner_tmstmp31#935 := winner_tmstmp31#935[__this := 0];
	// Arguments for ERC20Detailed
	name_#1053#15 := _name#1163;
	symbol_#1055#15 := _symbol#1165;
	decimals_#1057#15 := 18;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#1019 := _name#1019[__this := mem_arr_int[name_#1053#15]];
	_symbol#1021 := _symbol#1021[__this := mem_arr_int[symbol_#1055#15]];
	_decimals#1051 := _decimals#1051[__this := decimals_#1057#15];
	$return37:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 292, 9} {:message ""} true;
	call _mint#805(__this, __msg_sender, __msg_value, call_arg#17, (50000000000 * 1000000000000000000));
	$return38:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_14.sol", 294, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#1184: [address_t]int;
