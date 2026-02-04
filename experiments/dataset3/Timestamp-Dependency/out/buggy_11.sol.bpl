// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_11.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 9, 5} {:message "SafeMath::add"} add#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (c#8: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#8 := (a#3 + b#5);
	assume (c#8 >= a#3);
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 13, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#25: int, b#27: int)
	returns (c#30: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#27 <= a#25);
	c#30 := (a#25 - b#27);
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 17, 5} {:message "SafeMath::mul"} mul#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#47: int, b#49: int)
	returns (c#52: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#52 := (a#47 * b#49);
	assume ((a#47 == 0) || ((c#52 div a#47) == b#49));
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 21, 5} {:message "SafeMath::div"} div#95(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
	returns (c#80: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#77 > 0);
	c#80 := (a#75 div b#77);
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 8, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_11.sol", 76, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#375(__this: address_t, __msg_sender: address_t, __msg_value: int, from#369: address_t, to#371: address_t, tokens#373: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_11.sol", 78, 3} {:message "[event] ERC20Interface::Approval"} Approval#387(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#381: address_t, spender#383: address_t, tokens#385: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 28, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);
	modifies winner_tmstmp19#103, winner_tmstmp26#138, winner_tmstmp38#283, bugv_tmstmp2#367, bugv_tmstmp3#379;

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_11.sol", 29, 1} {:message "winner_tmstmp19"} winner_tmstmp19#103: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 30, 1} {:message "ERC20Interface::play_tmstmp19"} play_tmstmp19#129(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#105: int)
{
	var {:sourceloc "buggy_11.sol", 31, 2} {:message "_vtime"} _vtime#109: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#109 := __block_timestamp;
	if (((startTime#105 + 432000) == _vtime#109)) {
	winner_tmstmp19#103 := winner_tmstmp19#103[__this := __msg_sender];
	}

	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 34, 5} {:message "ERC20Interface::balanceOf"} balanceOf#136(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#131: address_t)
	returns (balance#134: int);
	modifies winner_tmstmp19#103, winner_tmstmp26#138, winner_tmstmp38#283, bugv_tmstmp2#367, bugv_tmstmp3#379;

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_11.sol", 35, 1} {:message "winner_tmstmp26"} winner_tmstmp26#138: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 36, 1} {:message "ERC20Interface::play_tmstmp26"} play_tmstmp26#160(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#140: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#140 + 432000) == __block_timestamp)) {
	winner_tmstmp26#138 := winner_tmstmp26#138[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 39, 5} {:message "ERC20Interface::allowance"} allowance#169(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#162: address_t, spender#164: address_t)
	returns (remaining#167: int);
	modifies winner_tmstmp19#103, winner_tmstmp26#138, winner_tmstmp38#283, bugv_tmstmp2#367, bugv_tmstmp3#379;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_11.sol", 40, 1} {:message "ERC20Interface::bug_tmstmp20"} bug_tmstmp20#216(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 41, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#173: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#173 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#173);
	pastBlockTime_tmstmp20#173 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_11.sol", 46, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 49, 5} {:message "ERC20Interface::transfer"} transfer#225(__this: address_t, __msg_sender: address_t, __msg_value: int, to#218: address_t, tokens#220: int)
	returns (success#223: bool);
	modifies winner_tmstmp19#103, winner_tmstmp26#138, winner_tmstmp38#283, bugv_tmstmp2#367, bugv_tmstmp3#379;

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_11.sol", 50, 1} {:message "ERC20Interface::bug_tmstmp32"} bug_tmstmp32#272(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 51, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#229: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#229 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#229);
	pastBlockTime_tmstmp32#229 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_11.sol", 56, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 59, 5} {:message "ERC20Interface::approve"} approve#281(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#274: address_t, tokens#276: int)
	returns (success#279: bool);
	modifies winner_tmstmp19#103, winner_tmstmp26#138, winner_tmstmp38#283, bugv_tmstmp2#367, bugv_tmstmp3#379;

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_11.sol", 60, 1} {:message "winner_tmstmp38"} winner_tmstmp38#283: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 61, 1} {:message "ERC20Interface::play_tmstmp38"} play_tmstmp38#305(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#285: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#285 + 432000) == __block_timestamp)) {
	winner_tmstmp38#283 := winner_tmstmp38#283[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 64, 5} {:message "ERC20Interface::transferFrom"} transferFrom#316(__this: address_t, __msg_sender: address_t, __msg_value: int, from#307: address_t, to#309: address_t, tokens#311: int)
	returns (success#314: bool);
	modifies winner_tmstmp19#103, winner_tmstmp26#138, winner_tmstmp38#283, bugv_tmstmp2#367, bugv_tmstmp3#379;

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_11.sol", 65, 1} {:message "ERC20Interface::bug_tmstmp4"} bug_tmstmp4#363(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 66, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#320: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#320 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#320);
	pastBlockTime_tmstmp4#320 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_11.sol", 71, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_11.sol", 75, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#367: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_11.sol", 77, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#379: [address_t]int;
// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 27, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#388(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp19#103 := winner_tmstmp19#103[__this := 0];
	winner_tmstmp26#138 := winner_tmstmp26#138[__this := 0];
	winner_tmstmp38#283 := winner_tmstmp38#283[__this := 0];
	bugv_tmstmp2#367 := bugv_tmstmp2#367[__this := __block_timestamp];
	bugv_tmstmp3#379 := bugv_tmstmp3#379[__this := __block_timestamp];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_11.sol", 83, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#399(__this: address_t, __msg_sender: address_t, __msg_value: int, from#390: address_t, tokens#392: int, token#394: address_t, data#396: int_arr_ptr);
	modifies winner_tmstmp7#401;

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_11.sol", 84, 1} {:message "winner_tmstmp7"} winner_tmstmp7#401: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 85, 1} {:message "ApproveAndCallFallBack::play_tmstmp7"} play_tmstmp7#427(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#403: int)
{
	var {:sourceloc "buggy_11.sol", 86, 2} {:message "_vtime"} _vtime#407: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#407 := __block_timestamp;
	if (((startTime#403 + 432000) == _vtime#407)) {
	winner_tmstmp7#401 := winner_tmstmp7#401[__this := __msg_sender];
	}

	$return10:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 82, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#428(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp7#401 := winner_tmstmp7#401[__this := 0];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_11.sol", 105, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#481(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#477: address_t, _to#479: address_t)
{
	
}

// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_11.sol", 93, 3} {:message "winner_tmstmp11"} winner_tmstmp11#430: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 94, 1} {:message "Owned::play_tmstmp11"} play_tmstmp11#456(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#432: int)
{
	var {:sourceloc "buggy_11.sol", 95, 2} {:message "_vtime"} _vtime#436: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#436 := __block_timestamp;
	if (((startTime#432 + 432000) == _vtime#436)) {
	winner_tmstmp11#430 := winner_tmstmp11#430[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_11.sol", 98, 3} {:message "owner"} owner#458: [address_t]address_t;
// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_11.sol", 99, 3} {:message "Owned::bug_tmstmp1"} bug_tmstmp1#469(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#461: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#461 := (__block_timestamp >= 1546300800);
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_11.sol", 102, 3} {:message "newOwner"} newOwner#471: [address_t]address_t;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_11.sol", 104, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#475: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 107, 5} {:message "Owned::[constructor]"} __constructor#621(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp11#430 := winner_tmstmp11#430[__this := 0];
	owner#458 := owner#458[__this := 0];
	newOwner#471 := newOwner#471[__this := 0];
	bugv_tmstmp4#475 := bugv_tmstmp4#475[__this := __block_timestamp];
	winner_tmstmp23#492 := winner_tmstmp23#492[__this := 0];
	bugv_tmstmp1#533 := bugv_tmstmp1#533[__this := __block_timestamp];
	winner_tmstmp14#547 := winner_tmstmp14#547[__this := 0];
	winner_tmstmp30#598 := winner_tmstmp30#598[__this := 0];
	// Function body starts here
	owner#458 := owner#458[__this := __msg_sender];
	$return13:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_11.sol", 110, 1} {:message "winner_tmstmp23"} winner_tmstmp23#492: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 111, 1} {:message "Owned::play_tmstmp23"} play_tmstmp23#518(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#494: int)
{
	var {:sourceloc "buggy_11.sol", 112, 2} {:message "_vtime"} _vtime#498: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#498 := __block_timestamp;
	if (((startTime#494 + 432000) == _vtime#498)) {
	winner_tmstmp23#492 := winner_tmstmp23#492[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_11.sol", 120, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#533: [address_t]int;
// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_11.sol", 122, 5} {:message "Owned::transferOwnership"} transferOwnership#545(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#535: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#458[__this]);
	// Function body starts here
	newOwner#471 := newOwner#471[__this := _newOwner#535];
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_11.sol", 125, 1} {:message "winner_tmstmp14"} winner_tmstmp14#547: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 126, 1} {:message "Owned::play_tmstmp14"} play_tmstmp14#569(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#549: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#549 + 432000) == __block_timestamp)) {
	winner_tmstmp14#547 := winner_tmstmp14#547[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_11.sol", 129, 5} {:message "Owned::acceptOwnership"} acceptOwnership#596(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#471[__this]);
	assume {:sourceloc "buggy_11.sol", 131, 14} {:message ""} true;
	call OwnershipTransferred#481(__this, __msg_sender, __msg_value, owner#458[__this], newOwner#471[__this]);
	owner#458 := owner#458[__this := newOwner#471[__this]];
	newOwner#471 := newOwner#471[__this := 0];
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_11.sol", 135, 1} {:message "winner_tmstmp30"} winner_tmstmp30#598: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 136, 1} {:message "Owned::play_tmstmp30"} play_tmstmp30#620(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#600: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#600 + 432000) == __block_timestamp)) {
	winner_tmstmp30#598 := winner_tmstmp30#598[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// ------- Contract: ForTheBlockchain -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_11.sol", 145, 3} {:message "winner_tmstmp2"} winner_tmstmp2#630: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 146, 1} {:message "ForTheBlockchain::play_tmstmp2"} play_tmstmp2#652(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#632: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#632 + 432000) == __block_timestamp)) {
	winner_tmstmp2#630 := winner_tmstmp2#630[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_11.sol", 149, 3} {:message "symbol"} symbol#654: [address_t]int_arr_type;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_11.sol", 150, 3} {:message "ForTheBlockchain::bug_tmstmp17"} bug_tmstmp17#665(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#657: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#657 := (__block_timestamp >= 1546300800);
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_11.sol", 153, 3} {:message "decimals"} decimals#667: [address_t]int;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_11.sol", 154, 3} {:message "ForTheBlockchain::bug_tmstmp37"} bug_tmstmp37#678(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#670: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#670 := (__block_timestamp >= 1546300800);
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_11.sol", 157, 3} {:message "name"} name#680: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_11.sol", 158, 3} {:message "winner_tmstmp3"} winner_tmstmp3#682: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 159, 1} {:message "ForTheBlockchain::play_tmstmp3"} play_tmstmp3#708(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#684: int)
{
	var {:sourceloc "buggy_11.sol", 160, 2} {:message "_vtime"} _vtime#688: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#688 := __block_timestamp;
	if (((startTime#684 + 432000) == _vtime#688)) {
	winner_tmstmp3#682 := winner_tmstmp3#682[__this := __msg_sender];
	}

	$return23:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_11.sol", 163, 3} {:message "_totalSupply"} _totalSupply#710: [address_t]int;
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_11.sol", 166, 3} {:message "ForTheBlockchain::bug_tmstmp9"} bug_tmstmp9#721(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#713: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#713 := (__block_timestamp >= 1546300800);
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 169, 3} {:message "balances"} balances#725: [address_t][address_t]int;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_11.sol", 170, 3} {:message "ForTheBlockchain::bug_tmstmp25"} bug_tmstmp25#736(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#728: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#728 := (__block_timestamp >= 1546300800);
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_11.sol", 173, 3} {:message "allowed"} allowed#742: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 179, 5} {:message "ForTheBlockchain::[constructor]"} __constructor#1317(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp2#630 := winner_tmstmp2#630[__this := 0];
	symbol#654 := symbol#654[__this := int_arr#constr(default_int_int(), 0)];
	decimals#667 := decimals#667[__this := 0];
	name#680 := name#680[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp3#682 := winner_tmstmp3#682[__this := 0];
	_totalSupply#710 := _totalSupply#710[__this := 0];
	balances#725 := balances#725[__this := default_address_t_int()];
	allowed#742 := allowed#742[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp39#845 := winner_tmstmp39#845[__this := 0];
	winner_tmstmp35#977 := winner_tmstmp35#977[__this := 0];
	winner_tmstmp27#1169 := winner_tmstmp27#1169[__this := 0];
	winner_tmstmp31#1241 := winner_tmstmp31#1241[__this := 0];
	bugv_tmstmp5#1316 := bugv_tmstmp5#1316[__this := __block_timestamp];
	winner_tmstmp11#430 := winner_tmstmp11#430[__this := 0];
	owner#458 := owner#458[__this := 0];
	newOwner#471 := newOwner#471[__this := 0];
	bugv_tmstmp4#475 := bugv_tmstmp4#475[__this := __block_timestamp];
	winner_tmstmp23#492 := winner_tmstmp23#492[__this := 0];
	bugv_tmstmp1#533 := bugv_tmstmp1#533[__this := __block_timestamp];
	winner_tmstmp14#547 := winner_tmstmp14#547[__this := 0];
	winner_tmstmp30#598 := winner_tmstmp30#598[__this := 0];
	winner_tmstmp19#103 := winner_tmstmp19#103[__this := 0];
	winner_tmstmp26#138 := winner_tmstmp26#138[__this := 0];
	winner_tmstmp38#283 := winner_tmstmp38#283[__this := 0];
	bugv_tmstmp2#367 := bugv_tmstmp2#367[__this := __block_timestamp];
	bugv_tmstmp3#379 := bugv_tmstmp3#379[__this := __block_timestamp];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#458 := owner#458[__this := __msg_sender];
	$return26:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#654 := symbol#654[__this := int_arr#constr(default_int_int()[0 := 70][1 := 84][2 := 66], 3)];
	name#680 := name#680[__this := int_arr#constr(default_int_int()[0 := 70][1 := 111][2 := 114][3 := 84][4 := 104][5 := 101][6 := 66][7 := 108][8 := 111][9 := 99][10 := 107][11 := 99][12 := 104][13 := 97][14 := 105][15 := 110], 16)];
	decimals#667 := decimals#667[__this := 8];
	_totalSupply#710 := _totalSupply#710[__this := 10000000000000000];
	balances#725 := balances#725[__this := balances#725[__this][owner#458[__this] := _totalSupply#710[__this]]];
	call_arg#3 := 0;
	assume {:sourceloc "buggy_11.sol", 185, 14} {:message ""} true;
	call Transfer#375(__this, __msg_sender, __msg_value, call_arg#3, owner#458[__this], _totalSupply#710[__this]);
	$return27:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_11.sol", 188, 1} {:message "ForTheBlockchain::bug_tmstmp8"} bug_tmstmp8#826(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 189, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#783: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#783 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#783);
	pastBlockTime_tmstmp8#783 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_11.sol", 194, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return28:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 202, 5} {:message "ForTheBlockchain::totalSupply"} totalSupply#843(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#830: int)
{
	var sub#45_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 203, 16} {:message ""} true;
	call sub#45_ret#4 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#710[__this], balances#725[__this][0]);
	#830 := sub#45_ret#4;
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_11.sol", 205, 1} {:message "winner_tmstmp39"} winner_tmstmp39#845: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 206, 1} {:message "ForTheBlockchain::play_tmstmp39"} play_tmstmp39#871(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#847: int)
{
	var {:sourceloc "buggy_11.sol", 207, 2} {:message "_vtime"} _vtime#851: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#851 := __block_timestamp;
	if (((startTime#847 + 432000) == _vtime#851)) {
	winner_tmstmp39#845 := winner_tmstmp39#845[__this := __msg_sender];
	}

	$return30:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 215, 5} {:message "ForTheBlockchain::balanceOf"} balanceOf#884(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#873: address_t)
	returns (balance#877: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#877 := balances#725[__this][tokenOwner#873];
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_11.sol", 218, 1} {:message "ForTheBlockchain::bug_tmstmp36"} bug_tmstmp36#931(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 219, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#888: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#888 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#888);
	pastBlockTime_tmstmp36#888 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_11.sol", 224, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return32:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 234, 5} {:message "ForTheBlockchain::transfer"} transfer#975(__this: address_t, __msg_sender: address_t, __msg_value: int, to#933: address_t, tokens#935: int)
	returns (success#939: bool)
{
	var sub#45_ret#5: int;
	var add#23_ret#6: int;
	var call_arg#7: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 235, 32} {:message ""} true;
	call sub#45_ret#5 := sub#45(__this, __msg_sender, __msg_value, balances#725[__this][__msg_sender], tokens#935);
	balances#725 := balances#725[__this := balances#725[__this][__msg_sender := sub#45_ret#5]];
	assume {:sourceloc "buggy_11.sol", 236, 24} {:message ""} true;
	call add#23_ret#6 := add#23(__this, __msg_sender, __msg_value, balances#725[__this][to#933], tokens#935);
	balances#725 := balances#725[__this := balances#725[__this][to#933 := add#23_ret#6]];
	call_arg#7 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 237, 14} {:message ""} true;
	call Transfer#375(__this, __msg_sender, __msg_value, call_arg#7, to#933, tokens#935);
	success#939 := true;
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_11.sol", 240, 1} {:message "winner_tmstmp35"} winner_tmstmp35#977: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 241, 1} {:message "ForTheBlockchain::play_tmstmp35"} play_tmstmp35#1003(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#979: int)
{
	var {:sourceloc "buggy_11.sol", 242, 2} {:message "_vtime"} _vtime#983: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#983 := __block_timestamp;
	if (((startTime#979 + 432000) == _vtime#983)) {
	winner_tmstmp35#977 := winner_tmstmp35#977[__this := __msg_sender];
	}

	$return34:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 255, 5} {:message "ForTheBlockchain::approve"} approve#1032(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1005: address_t, tokens#1007: int)
	returns (success#1011: bool)
{
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#742 := allowed#742[__this := allowed#742[__this][__msg_sender := allowed#742[__this][__msg_sender][spender#1005 := tokens#1007]]];
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 257, 14} {:message ""} true;
	call Approval#387(__this, __msg_sender, __msg_value, call_arg#8, spender#1005, tokens#1007);
	success#1011 := true;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_11.sol", 260, 1} {:message "ForTheBlockchain::bug_tmstmp40"} bug_tmstmp40#1079(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 261, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1036: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1036 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1036);
	pastBlockTime_tmstmp40#1036 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_11.sol", 266, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return36:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 280, 5} {:message "ForTheBlockchain::transferFrom"} transferFrom#1139(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1081: address_t, to#1083: address_t, tokens#1085: int)
	returns (success#1089: bool)
{
	var sub#45_ret#9: int;
	var sub#45_ret#10: int;
	var add#23_ret#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 281, 26} {:message ""} true;
	call sub#45_ret#9 := sub#45(__this, __msg_sender, __msg_value, balances#725[__this][from#1081], tokens#1085);
	balances#725 := balances#725[__this := balances#725[__this][from#1081 := sub#45_ret#9]];
	assume {:sourceloc "buggy_11.sol", 282, 37} {:message ""} true;
	call sub#45_ret#10 := sub#45(__this, __msg_sender, __msg_value, allowed#742[__this][from#1081][__msg_sender], tokens#1085);
	allowed#742 := allowed#742[__this := allowed#742[__this][from#1081 := allowed#742[__this][from#1081][__msg_sender := sub#45_ret#10]]];
	assume {:sourceloc "buggy_11.sol", 283, 24} {:message ""} true;
	call add#23_ret#11 := add#23(__this, __msg_sender, __msg_value, balances#725[__this][to#1083], tokens#1085);
	balances#725 := balances#725[__this := balances#725[__this][to#1083 := add#23_ret#11]];
	assume {:sourceloc "buggy_11.sol", 284, 14} {:message ""} true;
	call Transfer#375(__this, __msg_sender, __msg_value, from#1081, to#1083, tokens#1085);
	success#1089 := true;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_11.sol", 287, 1} {:message "ForTheBlockchain::bug_tmstmp33"} bug_tmstmp33#1150(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1142: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1142 := (__block_timestamp >= 1546300800);
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 296, 5} {:message "ForTheBlockchain::allowance"} allowance#1167(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1152: address_t, spender#1154: address_t)
	returns (remaining#1158: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1158 := allowed#742[__this][tokenOwner#1152][spender#1154];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_11.sol", 299, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1169: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 300, 1} {:message "ForTheBlockchain::play_tmstmp27"} play_tmstmp27#1195(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1171: int)
{
	var {:sourceloc "buggy_11.sol", 301, 2} {:message "_vtime"} _vtime#1175: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1175 := __block_timestamp;
	if (((startTime#1171 + 432000) == _vtime#1175)) {
	winner_tmstmp27#1169 := winner_tmstmp27#1169[__this := __msg_sender];
	}

	$return40:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_11.sol", 311, 5} {:message "ForTheBlockchain::approveAndCall"} approveAndCall#1239(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1197: address_t, tokens#1199: int, data#1201: int_arr_ptr)
	returns (success#1204: bool)
{
	var call_arg#12: address_t;
	var call_arg#13: address_t;
	var call_arg#14: address_t;
	// TCC assumptions
	assume (data#1201 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#742 := allowed#742[__this := allowed#742[__this][__msg_sender := allowed#742[__this][__msg_sender][spender#1197 := tokens#1199]]];
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 313, 14} {:message ""} true;
	call Approval#387(__this, __msg_sender, __msg_value, call_arg#12, spender#1197, tokens#1199);
	call_arg#13 := __msg_sender;
	call_arg#14 := __this;
	assume {:sourceloc "buggy_11.sol", 314, 9} {:message ""} true;
	call receiveApproval#399(spender#1197, __this, 0, call_arg#13, tokens#1199, call_arg#14, data#1201);
	success#1204 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_11.sol", 317, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1241: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 318, 1} {:message "ForTheBlockchain::play_tmstmp31"} play_tmstmp31#1267(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1243: int)
{
	var {:sourceloc "buggy_11.sol", 319, 2} {:message "_vtime"} _vtime#1247: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1247 := __block_timestamp;
	if (((startTime#1243 + 432000) == _vtime#1247)) {
	winner_tmstmp31#1241 := winner_tmstmp31#1241[__this := __msg_sender];
	}

	$return42:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 327, 5} {:message "ForTheBlockchain::[receive]"} #1274(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return43:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 331, 5} {:message "ForTheBlockchain::[fallback]"} #1281(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return44:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_11.sol", 334, 1} {:message "ForTheBlockchain::bug_tmstmp13"} bug_tmstmp13#1292(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1284: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1284 := (__block_timestamp >= 1546300800);
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 342, 5} {:message "ForTheBlockchain::transferAnyERC20Token"} transferAnyERC20Token#1312(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1294: address_t, tokens#1296: int)
	returns (success#1301: bool)
{
	var transfer#225_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#458[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 343, 16} {:message ""} true;
	call transfer#225_ret#17 := transfer#225(tokenAddress#1294, __this, 0, owner#458[__this], tokens#1296);
	success#1301 := transfer#225_ret#17;
	goto $return47;
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_11.sol", 345, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1316: [address_t]int;
