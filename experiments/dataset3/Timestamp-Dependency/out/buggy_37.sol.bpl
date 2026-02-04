// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_37.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: safeAdd : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 26, 5} {:message "SafeMath::safeAdd"} safeAdd#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
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
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 30, 1} {:message "SafeMath::bug_tmstmp37"} bug_tmstmp37#34(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#26: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#26 := (__block_timestamp >= 1546300800);
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: safeSub : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 33, 5} {:message "SafeMath::safeSub"} safeSub#56(__this: address_t, __msg_sender: address_t, __msg_value: int, a#36: int, b#38: int)
	returns (c#41: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#38 <= a#36);
	c#41 := (a#36 - b#38);
	$return2:
	// Function body ends here
}

// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_37.sol", 37, 1} {:message "winner_tmstmp3"} winner_tmstmp3#58: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 38, 1} {:message "SafeMath::play_tmstmp3"} play_tmstmp3#84(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#60: int)
{
	var {:sourceloc "buggy_37.sol", 39, 2} {:message "_vtime"} _vtime#64: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#64 := __block_timestamp;
	if (((startTime#60 + 432000) == _vtime#64)) {
	winner_tmstmp3#58 := winner_tmstmp3#58[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// Function: safeMul : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 42, 5} {:message "SafeMath::safeMul"} safeMul#112(__this: address_t, __msg_sender: address_t, __msg_value: int, a#86: int, b#88: int)
	returns (c#91: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#91 := (a#86 * b#88);
	assume ((a#86 == 0) || ((c#91 div a#86) == b#88));
	$return4:
	// Function body ends here
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 46, 1} {:message "SafeMath::bug_tmstmp9"} bug_tmstmp9#123(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#115: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#115 := (__block_timestamp >= 1546300800);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: safeDiv : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 49, 5} {:message "SafeMath::safeDiv"} safeDiv#145(__this: address_t, __msg_sender: address_t, __msg_value: int, a#125: int, b#127: int)
	returns (c#130: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#127 > 0);
	c#130 := (a#125 div b#127);
	$return6:
	// Function body ends here
}

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 53, 1} {:message "SafeMath::bug_tmstmp25"} bug_tmstmp25#156(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#148: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#148 := (__block_timestamp >= 1546300800);
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 25, 1} {:message "SafeMath::[implicit_constructor]"} __constructor#157(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp3#58 := winner_tmstmp3#58[__this := 0];
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_37.sol", 112, 5} {:message "[event] ERC20Interface::Transfer"} Transfer#436(__this: address_t, __msg_sender: address_t, __msg_value: int, from#430: address_t, to#432: address_t, tokens#434: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_37.sol", 114, 3} {:message "[event] ERC20Interface::Approval"} Approval#448(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#442: address_t, spender#444: address_t, tokens#446: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_37.sol", 64, 5} {:message "ERC20Interface::totalSupply"} totalSupply#162(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#160: int);
	modifies winner_tmstmp19#164, winner_tmstmp26#199, winner_tmstmp38#344, bugv_tmstmp2#428, bugv_tmstmp3#440;

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_37.sol", 65, 1} {:message "winner_tmstmp19"} winner_tmstmp19#164: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 66, 1} {:message "ERC20Interface::play_tmstmp19"} play_tmstmp19#190(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#166: int)
{
	var {:sourceloc "buggy_37.sol", 67, 2} {:message "_vtime"} _vtime#170: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#170 := __block_timestamp;
	if (((startTime#166 + 432000) == _vtime#170)) {
	winner_tmstmp19#164 := winner_tmstmp19#164[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// Function: balanceOf
procedure {:sourceloc "buggy_37.sol", 70, 5} {:message "ERC20Interface::balanceOf"} balanceOf#197(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#192: address_t)
	returns (balance#195: int);
	modifies winner_tmstmp19#164, winner_tmstmp26#199, winner_tmstmp38#344, bugv_tmstmp2#428, bugv_tmstmp3#440;

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_37.sol", 71, 1} {:message "winner_tmstmp26"} winner_tmstmp26#199: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 72, 1} {:message "ERC20Interface::play_tmstmp26"} play_tmstmp26#221(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#201: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#201 + 432000) == __block_timestamp)) {
	winner_tmstmp26#199 := winner_tmstmp26#199[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// Function: allowance
procedure {:sourceloc "buggy_37.sol", 75, 5} {:message "ERC20Interface::allowance"} allowance#230(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#223: address_t, spender#225: address_t)
	returns (remaining#228: int);
	modifies winner_tmstmp19#164, winner_tmstmp26#199, winner_tmstmp38#344, bugv_tmstmp2#428, bugv_tmstmp3#440;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_37.sol", 76, 1} {:message "ERC20Interface::bug_tmstmp20"} bug_tmstmp20#277(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 77, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#234: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#234 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#234);
	pastBlockTime_tmstmp20#234 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_37.sol", 82, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return10:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_37.sol", 85, 5} {:message "ERC20Interface::transfer"} transfer#286(__this: address_t, __msg_sender: address_t, __msg_value: int, to#279: address_t, tokens#281: int)
	returns (success#284: bool);
	modifies winner_tmstmp19#164, winner_tmstmp26#199, winner_tmstmp38#344, bugv_tmstmp2#428, bugv_tmstmp3#440;

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_37.sol", 86, 1} {:message "ERC20Interface::bug_tmstmp32"} bug_tmstmp32#333(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 87, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#290: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#290 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#290);
	pastBlockTime_tmstmp32#290 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_37.sol", 92, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// Function: approve
procedure {:sourceloc "buggy_37.sol", 95, 5} {:message "ERC20Interface::approve"} approve#342(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#335: address_t, tokens#337: int)
	returns (success#340: bool);
	modifies winner_tmstmp19#164, winner_tmstmp26#199, winner_tmstmp38#344, bugv_tmstmp2#428, bugv_tmstmp3#440;

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_37.sol", 96, 1} {:message "winner_tmstmp38"} winner_tmstmp38#344: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 97, 1} {:message "ERC20Interface::play_tmstmp38"} play_tmstmp38#366(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#346: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#346 + 432000) == __block_timestamp)) {
	winner_tmstmp38#344 := winner_tmstmp38#344[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_37.sol", 100, 5} {:message "ERC20Interface::transferFrom"} transferFrom#377(__this: address_t, __msg_sender: address_t, __msg_value: int, from#368: address_t, to#370: address_t, tokens#372: int)
	returns (success#375: bool);
	modifies winner_tmstmp19#164, winner_tmstmp26#199, winner_tmstmp38#344, bugv_tmstmp2#428, bugv_tmstmp3#440;

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_37.sol", 101, 1} {:message "ERC20Interface::bug_tmstmp4"} bug_tmstmp4#424(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 102, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#381: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#381 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#381);
	pastBlockTime_tmstmp4#381 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_37.sol", 107, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return13:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_37.sol", 111, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#428: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_37.sol", 113, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#440: [address_t]int;
// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 63, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#449(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp19#164 := winner_tmstmp19#164[__this := 0];
	winner_tmstmp26#199 := winner_tmstmp26#199[__this := 0];
	winner_tmstmp38#344 := winner_tmstmp38#344[__this := 0];
	bugv_tmstmp2#428 := bugv_tmstmp2#428[__this := __block_timestamp];
	bugv_tmstmp3#440 := bugv_tmstmp3#440[__this := __block_timestamp];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_37.sol", 124, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#460(__this: address_t, __msg_sender: address_t, __msg_value: int, from#451: address_t, tokens#453: int, token#455: address_t, data#457: int_arr_ptr);
	modifies winner_tmstmp7#462;

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_37.sol", 125, 1} {:message "winner_tmstmp7"} winner_tmstmp7#462: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 126, 1} {:message "ApproveAndCallFallBack::play_tmstmp7"} play_tmstmp7#488(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#464: int)
{
	var {:sourceloc "buggy_37.sol", 127, 2} {:message "_vtime"} _vtime#468: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#468 := __block_timestamp;
	if (((startTime#464 + 432000) == _vtime#468)) {
	winner_tmstmp7#462 := winner_tmstmp7#462[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 123, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#489(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp7#462 := winner_tmstmp7#462[__this := 0];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_37.sol", 148, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#538(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#534: address_t, _to#536: address_t)
{
	
}

// 
// Function: bug_tmstmp21 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 137, 3} {:message "Owned::bug_tmstmp21"} bug_tmstmp21#500(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#492: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#492 := (__block_timestamp >= 1546300800);
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_37.sol", 140, 3} {:message "owner"} owner#502: [address_t]address_t;
// 
// State variable: winner_tmstmp10: address
var {:sourceloc "buggy_37.sol", 141, 3} {:message "winner_tmstmp10"} winner_tmstmp10#504: [address_t]address_t;
// 
// Function: play_tmstmp10 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 142, 1} {:message "Owned::play_tmstmp10"} play_tmstmp10#526(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#506: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#506 + 432000) == __block_timestamp)) {
	winner_tmstmp10#504 := winner_tmstmp10#504[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_37.sol", 145, 3} {:message "newOwner"} newOwner#528: [address_t]address_t;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_37.sol", 147, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#532: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 150, 5} {:message "Owned::[constructor]"} __constructor#678(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#502 := owner#502[__this := 0];
	winner_tmstmp10#504 := winner_tmstmp10#504[__this := 0];
	newOwner#528 := newOwner#528[__this := 0];
	bugv_tmstmp4#532 := bugv_tmstmp4#532[__this := __block_timestamp];
	winner_tmstmp23#549 := winner_tmstmp23#549[__this := 0];
	bugv_tmstmp1#590 := bugv_tmstmp1#590[__this := __block_timestamp];
	winner_tmstmp14#604 := winner_tmstmp14#604[__this := 0];
	winner_tmstmp30#655 := winner_tmstmp30#655[__this := 0];
	// Function body starts here
	owner#502 := owner#502[__this := __msg_sender];
	$return17:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_37.sol", 153, 1} {:message "winner_tmstmp23"} winner_tmstmp23#549: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 154, 1} {:message "Owned::play_tmstmp23"} play_tmstmp23#575(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#551: int)
{
	var {:sourceloc "buggy_37.sol", 155, 2} {:message "_vtime"} _vtime#555: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#555 := __block_timestamp;
	if (((startTime#551 + 432000) == _vtime#555)) {
	winner_tmstmp23#549 := winner_tmstmp23#549[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_37.sol", 163, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#590: [address_t]int;
// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_37.sol", 165, 5} {:message "Owned::transferOwnership"} transferOwnership#602(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#592: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#502[__this]);
	// Function body starts here
	newOwner#528 := newOwner#528[__this := _newOwner#592];
	$return20:
	// Function body ends here
	$return19:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_37.sol", 168, 1} {:message "winner_tmstmp14"} winner_tmstmp14#604: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 169, 1} {:message "Owned::play_tmstmp14"} play_tmstmp14#626(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#606: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#606 + 432000) == __block_timestamp)) {
	winner_tmstmp14#604 := winner_tmstmp14#604[__this := __msg_sender];
	}

	$return21:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_37.sol", 172, 5} {:message "Owned::acceptOwnership"} acceptOwnership#653(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#528[__this]);
	assume {:sourceloc "buggy_37.sol", 174, 14} {:message ""} true;
	call OwnershipTransferred#538(__this, __msg_sender, __msg_value, owner#502[__this], newOwner#528[__this]);
	owner#502 := owner#502[__this := newOwner#528[__this]];
	newOwner#528 := newOwner#528[__this := 0];
	$return22:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_37.sol", 178, 1} {:message "winner_tmstmp30"} winner_tmstmp30#655: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 179, 1} {:message "Owned::play_tmstmp30"} play_tmstmp30#677(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#657: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#657 + 432000) == __block_timestamp)) {
	winner_tmstmp30#655 := winner_tmstmp30#655[__this := __msg_sender];
	}

	$return23:
	// Function body ends here
}

// 
// ------- Contract: AugustCoin -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Inherits from: SafeMath
// 
// State variable: winner_tmstmp22: address
var {:sourceloc "buggy_37.sol", 190, 3} {:message "winner_tmstmp22"} winner_tmstmp22#686: [address_t]address_t;
// 
// Function: play_tmstmp22 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 191, 1} {:message "AugustCoin::play_tmstmp22"} play_tmstmp22#708(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#688: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#688 + 432000) == __block_timestamp)) {
	winner_tmstmp22#686 := winner_tmstmp22#686[__this := __msg_sender];
	}

	$return24:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_37.sol", 194, 3} {:message "symbol"} symbol#710: [address_t]int_arr_type;
// 
// Function: bug_tmstmp12 : function ()
procedure {:sourceloc "buggy_37.sol", 195, 3} {:message "AugustCoin::bug_tmstmp12"} bug_tmstmp12#757(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 196, 2} {:message "pastBlockTime_tmstmp12"} pastBlockTime_tmstmp12#714: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp12#714 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp12#714);
	pastBlockTime_tmstmp12#714 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_37.sol", 201, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return25:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_37.sol", 204, 3} {:message "name"} name#759: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_37.sol", 205, 3} {:message "winner_tmstmp11"} winner_tmstmp11#761: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 206, 1} {:message "AugustCoin::play_tmstmp11"} play_tmstmp11#787(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#763: int)
{
	var {:sourceloc "buggy_37.sol", 207, 2} {:message "_vtime"} _vtime#767: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#767 := __block_timestamp;
	if (((startTime#763 + 432000) == _vtime#767)) {
	winner_tmstmp11#761 := winner_tmstmp11#761[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_37.sol", 210, 3} {:message "decimals"} decimals#789: [address_t]int;
// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 211, 3} {:message "AugustCoin::bug_tmstmp1"} bug_tmstmp1#800(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#792: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#792 := (__block_timestamp >= 1546300800);
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_37.sol", 214, 3} {:message "_totalSupply"} _totalSupply#802: [address_t]int;
// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_37.sol", 216, 3} {:message "winner_tmstmp2"} winner_tmstmp2#804: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 217, 1} {:message "AugustCoin::play_tmstmp2"} play_tmstmp2#826(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#806: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#806 + 432000) == __block_timestamp)) {
	winner_tmstmp2#804 := winner_tmstmp2#804[__this := __msg_sender];
	}

	$return28:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 220, 3} {:message "balances"} balances#830: [address_t][address_t]int;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 221, 3} {:message "AugustCoin::bug_tmstmp17"} bug_tmstmp17#841(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#833: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#833 := (__block_timestamp >= 1546300800);
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_37.sol", 224, 3} {:message "allowed"} allowed#847: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 230, 5} {:message "AugustCoin::[constructor]"} __constructor#1412(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: address_t;
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp22#686 := winner_tmstmp22#686[__this := 0];
	symbol#710 := symbol#710[__this := int_arr#constr(default_int_int(), 0)];
	name#759 := name#759[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp11#761 := winner_tmstmp11#761[__this := 0];
	decimals#789 := decimals#789[__this := 0];
	_totalSupply#802 := _totalSupply#802[__this := 0];
	winner_tmstmp2#804 := winner_tmstmp2#804[__this := 0];
	balances#830 := balances#830[__this := default_address_t_int()];
	allowed#847 := allowed#847[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp39#947 := winner_tmstmp39#947[__this := 0];
	winner_tmstmp35#1079 := winner_tmstmp35#1079[__this := 0];
	winner_tmstmp27#1271 := winner_tmstmp27#1271[__this := 0];
	winner_tmstmp31#1343 := winner_tmstmp31#1343[__this := 0];
	bugv_tmstmp5#1411 := bugv_tmstmp5#1411[__this := __block_timestamp];
	winner_tmstmp3#58 := winner_tmstmp3#58[__this := 0];
	owner#502 := owner#502[__this := 0];
	winner_tmstmp10#504 := winner_tmstmp10#504[__this := 0];
	newOwner#528 := newOwner#528[__this := 0];
	bugv_tmstmp4#532 := bugv_tmstmp4#532[__this := __block_timestamp];
	winner_tmstmp23#549 := winner_tmstmp23#549[__this := 0];
	bugv_tmstmp1#590 := bugv_tmstmp1#590[__this := __block_timestamp];
	winner_tmstmp14#604 := winner_tmstmp14#604[__this := 0];
	winner_tmstmp30#655 := winner_tmstmp30#655[__this := 0];
	winner_tmstmp19#164 := winner_tmstmp19#164[__this := 0];
	winner_tmstmp26#199 := winner_tmstmp26#199[__this := 0];
	winner_tmstmp38#344 := winner_tmstmp38#344[__this := 0];
	bugv_tmstmp2#428 := bugv_tmstmp2#428[__this := __block_timestamp];
	bugv_tmstmp3#440 := bugv_tmstmp3#440[__this := __block_timestamp];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#502 := owner#502[__this := __msg_sender];
	$return30:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#710 := symbol#710[__this := int_arr#constr(default_int_int()[0 := 65][1 := 85][2 := 67], 3)];
	name#759 := name#759[__this := int_arr#constr(default_int_int()[0 := 65][1 := 117][2 := 103][3 := 117][4 := 115][5 := 116][6 := 67][7 := 111][8 := 105][9 := 110], 10)];
	decimals#789 := decimals#789[__this := 18];
	_totalSupply#802 := _totalSupply#802[__this := 100000000000000000000000000];
	balances#830 := balances#830[__this := balances#830[__this][address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD := _totalSupply#802[__this]]];
	call_arg#3 := 0;
	call_arg#4 := address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD;
	assume {:sourceloc "buggy_37.sol", 236, 14} {:message ""} true;
	call Transfer#436(__this, __msg_sender, __msg_value, call_arg#3, call_arg#4, _totalSupply#802[__this]);
	$return31:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_37.sol", 238, 1} {:message "AugustCoin::bug_tmstmp8"} bug_tmstmp8#929(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 239, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#886: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#886 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#886);
	pastBlockTime_tmstmp8#886 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_37.sol", 244, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return32:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 252, 5} {:message "AugustCoin::totalSupply"} totalSupply#945(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#933: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#933 := (_totalSupply#802[__this] - balances#830[__this][0]);
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_37.sol", 255, 1} {:message "winner_tmstmp39"} winner_tmstmp39#947: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 256, 1} {:message "AugustCoin::play_tmstmp39"} play_tmstmp39#973(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#949: int)
{
	var {:sourceloc "buggy_37.sol", 257, 2} {:message "_vtime"} _vtime#953: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#953 := __block_timestamp;
	if (((startTime#949 + 432000) == _vtime#953)) {
	winner_tmstmp39#947 := winner_tmstmp39#947[__this := __msg_sender];
	}

	$return34:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 265, 5} {:message "AugustCoin::balanceOf"} balanceOf#986(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#975: address_t)
	returns (balance#979: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#979 := balances#830[__this][tokenOwner#975];
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_37.sol", 268, 1} {:message "AugustCoin::bug_tmstmp36"} bug_tmstmp36#1033(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 269, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#990: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#990 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#990);
	pastBlockTime_tmstmp36#990 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_37.sol", 274, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return36:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 284, 5} {:message "AugustCoin::transfer"} transfer#1077(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1035: address_t, tokens#1037: int)
	returns (success#1041: bool)
{
	var safeSub#56_ret#5: int;
	var safeAdd#23_ret#6: int;
	var call_arg#7: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 285, 32} {:message ""} true;
	call safeSub#56_ret#5 := safeSub#56(__this, __msg_sender, __msg_value, balances#830[__this][__msg_sender], tokens#1037);
	balances#830 := balances#830[__this := balances#830[__this][__msg_sender := safeSub#56_ret#5]];
	assume {:sourceloc "buggy_37.sol", 286, 24} {:message ""} true;
	call safeAdd#23_ret#6 := safeAdd#23(__this, __msg_sender, __msg_value, balances#830[__this][to#1035], tokens#1037);
	balances#830 := balances#830[__this := balances#830[__this][to#1035 := safeAdd#23_ret#6]];
	call_arg#7 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 287, 14} {:message ""} true;
	call Transfer#436(__this, __msg_sender, __msg_value, call_arg#7, to#1035, tokens#1037);
	success#1041 := true;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_37.sol", 290, 1} {:message "winner_tmstmp35"} winner_tmstmp35#1079: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 291, 1} {:message "AugustCoin::play_tmstmp35"} play_tmstmp35#1105(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1081: int)
{
	var {:sourceloc "buggy_37.sol", 292, 2} {:message "_vtime"} _vtime#1085: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1085 := __block_timestamp;
	if (((startTime#1081 + 432000) == _vtime#1085)) {
	winner_tmstmp35#1079 := winner_tmstmp35#1079[__this := __msg_sender];
	}

	$return38:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 305, 5} {:message "AugustCoin::approve"} approve#1134(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1107: address_t, tokens#1109: int)
	returns (success#1113: bool)
{
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#847 := allowed#847[__this := allowed#847[__this][__msg_sender := allowed#847[__this][__msg_sender][spender#1107 := tokens#1109]]];
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 307, 14} {:message ""} true;
	call Approval#448(__this, __msg_sender, __msg_value, call_arg#8, spender#1107, tokens#1109);
	success#1113 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_37.sol", 310, 1} {:message "AugustCoin::bug_tmstmp40"} bug_tmstmp40#1181(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 311, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1138: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1138 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1138);
	pastBlockTime_tmstmp40#1138 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_37.sol", 316, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return40:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 330, 5} {:message "AugustCoin::transferFrom"} transferFrom#1241(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1183: address_t, to#1185: address_t, tokens#1187: int)
	returns (success#1191: bool)
{
	var safeSub#56_ret#9: int;
	var safeSub#56_ret#10: int;
	var safeAdd#23_ret#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 331, 26} {:message ""} true;
	call safeSub#56_ret#9 := safeSub#56(__this, __msg_sender, __msg_value, balances#830[__this][from#1183], tokens#1187);
	balances#830 := balances#830[__this := balances#830[__this][from#1183 := safeSub#56_ret#9]];
	assume {:sourceloc "buggy_37.sol", 332, 37} {:message ""} true;
	call safeSub#56_ret#10 := safeSub#56(__this, __msg_sender, __msg_value, allowed#847[__this][from#1183][__msg_sender], tokens#1187);
	allowed#847 := allowed#847[__this := allowed#847[__this][from#1183 := allowed#847[__this][from#1183][__msg_sender := safeSub#56_ret#10]]];
	assume {:sourceloc "buggy_37.sol", 333, 24} {:message ""} true;
	call safeAdd#23_ret#11 := safeAdd#23(__this, __msg_sender, __msg_value, balances#830[__this][to#1185], tokens#1187);
	balances#830 := balances#830[__this := balances#830[__this][to#1185 := safeAdd#23_ret#11]];
	assume {:sourceloc "buggy_37.sol", 334, 14} {:message ""} true;
	call Transfer#436(__this, __msg_sender, __msg_value, from#1183, to#1185, tokens#1187);
	success#1191 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 337, 1} {:message "AugustCoin::bug_tmstmp33"} bug_tmstmp33#1252(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1244: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1244 := (__block_timestamp >= 1546300800);
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 346, 5} {:message "AugustCoin::allowance"} allowance#1269(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1254: address_t, spender#1256: address_t)
	returns (remaining#1260: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1260 := allowed#847[__this][tokenOwner#1254][spender#1256];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_37.sol", 349, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1271: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 350, 1} {:message "AugustCoin::play_tmstmp27"} play_tmstmp27#1297(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1273: int)
{
	var {:sourceloc "buggy_37.sol", 351, 2} {:message "_vtime"} _vtime#1277: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1277 := __block_timestamp;
	if (((startTime#1273 + 432000) == _vtime#1277)) {
	winner_tmstmp27#1271 := winner_tmstmp27#1271[__this := __msg_sender];
	}

	$return44:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_37.sol", 361, 5} {:message "AugustCoin::approveAndCall"} approveAndCall#1341(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1299: address_t, tokens#1301: int, data#1303: int_arr_ptr)
	returns (success#1306: bool)
{
	var call_arg#12: address_t;
	var call_arg#13: address_t;
	var call_arg#14: address_t;
	// TCC assumptions
	assume (data#1303 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#847 := allowed#847[__this := allowed#847[__this][__msg_sender := allowed#847[__this][__msg_sender][spender#1299 := tokens#1301]]];
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 363, 14} {:message ""} true;
	call Approval#448(__this, __msg_sender, __msg_value, call_arg#12, spender#1299, tokens#1301);
	call_arg#13 := __msg_sender;
	call_arg#14 := __this;
	assume {:sourceloc "buggy_37.sol", 364, 9} {:message ""} true;
	call receiveApproval#460(spender#1299, __this, 0, call_arg#13, tokens#1301, call_arg#14, data#1303);
	success#1306 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_37.sol", 367, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1343: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 368, 1} {:message "AugustCoin::play_tmstmp31"} play_tmstmp31#1369(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1345: int)
{
	var {:sourceloc "buggy_37.sol", 369, 2} {:message "_vtime"} _vtime#1349: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1349 := __block_timestamp;
	if (((startTime#1345 + 432000) == _vtime#1349)) {
	winner_tmstmp31#1343 := winner_tmstmp31#1343[__this := __msg_sender];
	}

	$return46:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 377, 5} {:message "AugustCoin::[receive]"} #1376(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return47:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_37.sol", 380, 1} {:message "AugustCoin::bug_tmstmp13"} bug_tmstmp13#1387(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1379: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1379 := (__block_timestamp >= 1546300800);
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 388, 5} {:message "AugustCoin::transferAnyERC20Token"} transferAnyERC20Token#1407(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1389: address_t, tokens#1391: int)
	returns (success#1396: bool)
{
	var transfer#286_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#502[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 389, 16} {:message ""} true;
	call transfer#286_ret#17 := transfer#286(tokenAddress#1389, __this, 0, owner#502[__this], tokens#1391);
	success#1396 := transfer#286_ret#17;
	goto $return50;
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_37.sol", 391, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1411: [address_t]int;
