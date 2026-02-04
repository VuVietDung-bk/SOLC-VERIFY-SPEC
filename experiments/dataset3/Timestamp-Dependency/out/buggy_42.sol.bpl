// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_42.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_42.sol", 18, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#37(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#33: address_t, _to#35: address_t)
{
	
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_42.sol", 8, 3} {:message "Owned::bug_tmstmp9"} bug_tmstmp9#12(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#4 := (__block_timestamp >= 1546300800);
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_42.sol", 11, 3} {:message "owner"} owner#14: [address_t]address_t;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_42.sol", 12, 3} {:message "Owned::bug_tmstmp25"} bug_tmstmp25#25(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#17: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#17 := (__block_timestamp >= 1546300800);
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_42.sol", 15, 3} {:message "newOwner"} newOwner#27: [address_t]address_t;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_42.sol", 17, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#31: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_42.sol", 20, 5} {:message "Owned::[constructor]"} __constructor#134(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#14 := owner#14[__this := 0];
	newOwner#27 := newOwner#27[__this := 0];
	bugv_tmstmp2#31 := bugv_tmstmp2#31[__this := __block_timestamp];
	winner_tmstmp23#48 := winner_tmstmp23#48[__this := 0];
	bugv_tmstmp1#97 := bugv_tmstmp1#97[__this := __block_timestamp];
	winner_tmstmp14#111 := winner_tmstmp14#111[__this := 0];
	// Function body starts here
	owner#14 := owner#14[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_42.sol", 23, 1} {:message "winner_tmstmp23"} winner_tmstmp23#48: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 24, 1} {:message "Owned::play_tmstmp23"} play_tmstmp23#74(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#50: int)
{
	var {:sourceloc "buggy_42.sol", 25, 2} {:message "_vtime"} _vtime#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#54 := __block_timestamp;
	if (((startTime#50 + 432000) == _vtime#54)) {
	winner_tmstmp23#48 := winner_tmstmp23#48[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_42.sol", 33, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#97: [address_t]int;
// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_42.sol", 35, 5} {:message "Owned::transferOwnership"} transferOwnership#109(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#99: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#14[__this]) || (__msg_sender == __this));
	// Function body starts here
	newOwner#27 := newOwner#27[__this := _newOwner#99];
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_42.sol", 38, 1} {:message "winner_tmstmp14"} winner_tmstmp14#111: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 39, 1} {:message "Owned::play_tmstmp14"} play_tmstmp14#133(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#113: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#113 + 432000) == __block_timestamp)) {
	winner_tmstmp14#111 := winner_tmstmp14#111[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 45, 3} {:message "SafeMath::mul"} mul#167(__this: address_t, __msg_sender: address_t, __msg_value: int, a#136: int, b#138: int)
	returns (#141: int)
{
	var {:sourceloc "buggy_42.sol", 49, 5} {:message "c"} c#151: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#136 == 0)) {
	#141 := 0;
	goto $return7;
	}

	c#151 := (a#136 * b#138);
	assert {:sourceloc "buggy_42.sol", 50, 5} {:message "Assertion might not hold."} ((c#151 div a#136) == b#138);
	#141 := c#151;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 54, 3} {:message "SafeMath::div"} div#185(__this: address_t, __msg_sender: address_t, __msg_value: int, a#169: int, b#171: int)
	returns (#174: int)
{
	var {:sourceloc "buggy_42.sol", 55, 5} {:message "c"} c#177: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#177 := (a#169 div b#171);
	#174 := c#177;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 59, 3} {:message "SafeMath::sub"} sub#205(__this: address_t, __msg_sender: address_t, __msg_value: int, a#187: int, b#189: int)
	returns (#192: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_42.sol", 60, 5} {:message "Assertion might not hold."} (b#189 <= a#187);
	#192 := (a#187 - b#189);
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 64, 3} {:message "SafeMath::add"} add#229(__this: address_t, __msg_sender: address_t, __msg_value: int, a#207: int, b#209: int)
	returns (#212: int)
{
	var {:sourceloc "buggy_42.sol", 65, 5} {:message "c"} c#215: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#215 := (a#207 + b#209);
	assert {:sourceloc "buggy_42.sol", 66, 5} {:message "Assertion might not hold."} (c#215 >= a#207);
	#212 := c#215;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 70, 3} {:message "SafeMath::ceil"} ceil#261(__this: address_t, __msg_sender: address_t, __msg_value: int, a#231: int, m#233: int)
	returns (#236: int)
{
	var {:sourceloc "buggy_42.sol", 71, 5} {:message "c"} c#239: int;
	var add#229_ret#2: int;
	var {:sourceloc "buggy_42.sol", 72, 5} {:message "d"} d#246: int;
	var call_arg#3: int;
	var sub#205_ret#4: int;
	var div#185_ret#5: int;
	var mul#167_ret#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 71, 17} {:message ""} true;
	call add#229_ret#2 := add#229(__this, __msg_sender, __msg_value, a#231, m#233);
	c#239 := add#229_ret#2;
	call_arg#3 := 1;
	assume {:sourceloc "buggy_42.sol", 72, 17} {:message ""} true;
	call sub#205_ret#4 := sub#205(__this, __msg_sender, __msg_value, c#239, call_arg#3);
	d#246 := sub#205_ret#4;
	assume {:sourceloc "buggy_42.sol", 73, 16} {:message ""} true;
	call div#185_ret#5 := div#185(__this, __msg_sender, __msg_value, d#246, m#233);
	assume {:sourceloc "buggy_42.sol", 73, 12} {:message ""} true;
	call mul#167_ret#6 := mul#167(__this, __msg_sender, __msg_value, div#185_ret#5, m#233);
	#236 := mul#167_ret#6;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_42.sol", 44, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#262(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Token -------
// 
// Function: balanceOf
procedure {:sourceloc "buggy_42.sol", 78, 3} {:message "Token::balanceOf"} balanceOf#269(__this: address_t, __msg_sender: address_t, __msg_value: int, who#264: address_t)
	returns (#267: int);
	modifies winner_tmstmp30#271, winner_tmstmp39#362;

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_42.sol", 79, 1} {:message "winner_tmstmp30"} winner_tmstmp30#271: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 80, 1} {:message "Token::play_tmstmp30"} play_tmstmp30#293(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#273: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#273 + 432000) == __block_timestamp)) {
	winner_tmstmp30#271 := winner_tmstmp30#271[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_42.sol", 83, 5} {:message "Token::transferFrom"} transferFrom#304(__this: address_t, __msg_sender: address_t, __msg_value: int, from#295: address_t, to#297: address_t, value#299: int)
	returns (#302: bool);
	modifies winner_tmstmp30#271, winner_tmstmp39#362;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_42.sol", 84, 1} {:message "Token::bug_tmstmp8"} bug_tmstmp8#351(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 85, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#308: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#308 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#308);
	pastBlockTime_tmstmp8#308 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_42.sol", 90, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return13:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_42.sol", 93, 5} {:message "Token::transfer"} transfer#360(__this: address_t, __msg_sender: address_t, __msg_value: int, to#353: address_t, value#355: int)
	returns (#358: bool);
	modifies winner_tmstmp30#271, winner_tmstmp39#362;

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_42.sol", 94, 1} {:message "winner_tmstmp39"} winner_tmstmp39#362: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 95, 1} {:message "Token::play_tmstmp39"} play_tmstmp39#388(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#364: int)
{
	var {:sourceloc "buggy_42.sol", 96, 2} {:message "_vtime"} _vtime#368: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#368 := __block_timestamp;
	if (((startTime#364 + 432000) == _vtime#368)) {
	winner_tmstmp39#362 := winner_tmstmp39#362[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_42.sol", 77, 1} {:message "Token::[implicit_constructor]"} __constructor#389(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp30#271 := winner_tmstmp30#271[__this := 0];
	winner_tmstmp39#362 := winner_tmstmp39#362[__this := 0];
}

// 
// ------- Contract: Staking -------
// Inherits from: Owned
// 
// Event: stakingstarted
procedure {:inline 1} {:sourceloc "buggy_42.sol", 150, 3} {:message "[event] Staking::stakingstarted"} stakingstarted#638(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#632: address_t, tokens#634: int, time#636: int)
{
	
}

// 
// Event: tokensRedeemed
procedure {:inline 1} {:sourceloc "buggy_42.sol", 152, 3} {:message "[event] Staking::tokensRedeemed"} tokensRedeemed#650(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#644: address_t, stakedTokens#646: int, reward#648: int)
{
	
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_42.sol", 102, 3} {:message "winner_tmstmp19"} winner_tmstmp19#393: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 103, 1} {:message "Staking::play_tmstmp19"} play_tmstmp19#419(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#395: int)
{
	var {:sourceloc "buggy_42.sol", 104, 2} {:message "_vtime"} _vtime#399: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#399 := __block_timestamp;
	if (((startTime#395 + 432000) == _vtime#399)) {
	winner_tmstmp19#393 := winner_tmstmp19#393[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// State variable: token: contract Token
var {:sourceloc "buggy_42.sol", 107, 3} {:message "token"} token#421: [address_t]address_t;
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_42.sol", 108, 3} {:message "winner_tmstmp26"} winner_tmstmp26#423: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 109, 1} {:message "Staking::play_tmstmp26"} play_tmstmp26#445(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#425: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#425 + 432000) == __block_timestamp)) {
	winner_tmstmp26#423 := winner_tmstmp26#423[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: lock: bool
var {:sourceloc "buggy_42.sol", 112, 3} {:message "lock"} lock#447: [address_t]bool;
// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_42.sol", 113, 3} {:message "Staking::bug_tmstmp20"} bug_tmstmp20#494(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 114, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#451: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#451 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#451);
	pastBlockTime_tmstmp20#451 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_42.sol", 119, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return17:
	// Function body ends here
}

// 
// State variable: stakeTokens: uint256
var {:sourceloc "buggy_42.sol", 122, 3} {:message "stakeTokens"} stakeTokens#496: [address_t]int;
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_42.sol", 123, 3} {:message "Staking::bug_tmstmp32"} bug_tmstmp32#543(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 124, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#500: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#500 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#500);
	pastBlockTime_tmstmp32#500 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_42.sol", 129, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return18:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_42.sol", 132, 3} {:message "basePercent"} basePercent#546: [address_t]int;
// Using library SafeMath for uint256
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_42.sol", 134, 3} {:message "winner_tmstmp38"} winner_tmstmp38#551: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 135, 1} {:message "Staking::play_tmstmp38"} play_tmstmp38#573(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#553: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#553 + 432000) == __block_timestamp)) {
	winner_tmstmp38#551 := winner_tmstmp38#551[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// State variable: stakeTime: uint256
var {:sourceloc "buggy_42.sol", 138, 3} {:message "stakeTime"} stakeTime#576: [address_t]int;
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_42.sol", 139, 3} {:message "Staking::bug_tmstmp4"} bug_tmstmp4#623(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 140, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#580: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#580 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#580);
	pastBlockTime_tmstmp4#580 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_42.sol", 145, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return20:
	// Function body ends here
}

// 
// State variable: stakePercentage: uint256
var {:sourceloc "buggy_42.sol", 148, 3} {:message "stakePercentage"} stakePercentage#626: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_42.sol", 149, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#630: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_42.sol", 151, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#642: [address_t]int;
// 
// ------- Struct stake -------
// Storage
type {:datatype} struct_storage_stake#657;
function {:constructor} stake#657#constr(time#652: int, redeem#654: bool, tokens#656: int) returns (struct_storage_stake#657);
// Memory
type address_struct_memory_stake#657 = int;
// Member time
var {:sourceloc "buggy_42.sol", 155, 9} {:message "time"} time#652: [address_struct_memory_stake#657]int;
// Member redeem
var {:sourceloc "buggy_42.sol", 156, 9} {:message "redeem"} redeem#654: [address_struct_memory_stake#657]bool;
// Member tokens
var {:sourceloc "buggy_42.sol", 157, 9} {:message "tokens"} tokens#656: [address_struct_memory_stake#657]int;
// 
// ------- End of struct stake -------
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_42.sol", 159, 3} {:message "winner_tmstmp7"} winner_tmstmp7#659: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 160, 1} {:message "Staking::play_tmstmp7"} play_tmstmp7#685(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#661: int)
{
	var {:sourceloc "buggy_42.sol", 161, 2} {:message "_vtime"} _vtime#665: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#665 := __block_timestamp;
	if (((startTime#661 + 432000) == _vtime#665)) {
	winner_tmstmp7#659 := winner_tmstmp7#659[__this := __msg_sender];
	}

	$return21:
	// Function body ends here
}

// 
// State variable: staker: mapping(address => struct Staking.stake storage ref)
var {:sourceloc "buggy_42.sol", 164, 3} {:message "staker"} staker#689: [address_t][address_t]struct_storage_stake#657;
function {:builtin "((as const (Array Int |T@struct_storage_stake#657|)) (|stake#657#constr| 0 false 0))"} default_address_t_struct_storage_stake#657() returns ([address_t]struct_storage_stake#657);
// 
// Function: 
procedure {:sourceloc "buggy_42.sol", 166, 5} {:message "Staking::[constructor]"} __constructor#1176(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenContractAddress#691: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp19#393 := winner_tmstmp19#393[__this := 0];
	token#421 := token#421[__this := 0];
	winner_tmstmp26#423 := winner_tmstmp26#423[__this := 0];
	lock#447 := lock#447[__this := false];
	stakeTokens#496 := stakeTokens#496[__this := 0];
	basePercent#546 := basePercent#546[__this := 200];
	winner_tmstmp38#551 := winner_tmstmp38#551[__this := 0];
	stakeTime#576 := stakeTime#576[__this := 1814400];
	stakePercentage#626 := stakePercentage#626[__this := 30];
	bugv_tmstmp3#630 := bugv_tmstmp3#630[__this := __block_timestamp];
	bugv_tmstmp4#642 := bugv_tmstmp4#642[__this := __block_timestamp];
	winner_tmstmp7#659 := winner_tmstmp7#659[__this := 0];
	staker#689 := staker#689[__this := default_address_t_struct_storage_stake#657()];
	winner_tmstmp35#839 := winner_tmstmp35#839[__this := 0];
	winner_tmstmp27#1057 := winner_tmstmp27#1057[__this := 0];
	winner_tmstmp31#1097 := winner_tmstmp31#1097[__this := 0];
	bugv_tmstmp5#1175 := bugv_tmstmp5#1175[__this := __block_timestamp];
	owner#14 := owner#14[__this := 0];
	newOwner#27 := newOwner#27[__this := 0];
	bugv_tmstmp2#31 := bugv_tmstmp2#31[__this := __block_timestamp];
	winner_tmstmp23#48 := winner_tmstmp23#48[__this := 0];
	bugv_tmstmp1#97 := bugv_tmstmp1#97[__this := __block_timestamp];
	winner_tmstmp14#111 := winner_tmstmp14#111[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#14 := owner#14[__this := __msg_sender];
	$return22:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	token#421 := token#421[__this := tokenContractAddress#691];
	owner#14 := owner#14[__this := __msg_sender];
	stakeTokens#496 := stakeTokens#496[__this := (500 * 10000000000)];
	$return23:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_42.sol", 171, 1} {:message "Staking::bug_tmstmp36"} bug_tmstmp36#764(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 172, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#721: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#721 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#721);
	pastBlockTime_tmstmp36#721 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_42.sol", 177, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return24:
	// Function body ends here
}

// 
// Function: startStaking : function ()
procedure {:sourceloc "buggy_42.sol", 181, 5} {:message "Staking::startStaking"} startStaking#837(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var findOnePercent#1171_ret#8: int;
	var call_arg#9: address_t;
	var balanceOf#269_ret#10: int;
	var call_arg#11: address_t;
	var findOnePercent#1171_ret#12: int;
	var transferFrom#304_ret#13: bool;
	var call_arg#14: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 182, 62} {:message ""} true;
	call findOnePercent#1171_ret#8 := findOnePercent#1171(__this, __msg_sender, __msg_value, stakeTokens#496[__this]);
	call_arg#9 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 182, 17} {:message ""} true;
	call balanceOf#269_ret#10 := balanceOf#269(token#421[__this], __this, 0, call_arg#9);
	assume (balanceOf#269_ret#10 >= (stakeTokens#496[__this] + findOnePercent#1171_ret#8));
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 183, 78} {:message ""} true;
	call findOnePercent#1171_ret#12 := findOnePercent#1171(__this, __msg_sender, __msg_value, stakeTokens#496[__this]);
	assume {:sourceloc "buggy_42.sol", 183, 17} {:message ""} true;
	call transferFrom#304_ret#13 := transferFrom#304(token#421[__this], __this, 0, call_arg#11, __this, (stakeTokens#496[__this] + findOnePercent#1171_ret#12));
	assume transferFrom#304_ret#13;
	staker#689 := staker#689[__this := staker#689[__this][__msg_sender := stake#657#constr(__block_timestamp, redeem#654#stake#657#constr(staker#689[__this][__msg_sender]), tokens#656#stake#657#constr(staker#689[__this][__msg_sender]))]];
	staker#689 := staker#689[__this := staker#689[__this][__msg_sender := stake#657#constr(time#652#stake#657#constr(staker#689[__this][__msg_sender]), redeem#654#stake#657#constr(staker#689[__this][__msg_sender]), (tokens#656#stake#657#constr(staker#689[__this][__msg_sender]) + stakeTokens#496[__this]))]];
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 186, 14} {:message ""} true;
	call stakingstarted#638(__this, __msg_sender, __msg_value, call_arg#14, tokens#656#stake#657#constr(staker#689[__this][__msg_sender]), time#652#stake#657#constr(staker#689[__this][__msg_sender]));
	$return25:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_42.sol", 188, 1} {:message "winner_tmstmp35"} winner_tmstmp35#839: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 189, 1} {:message "Staking::play_tmstmp35"} play_tmstmp35#865(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#841: int)
{
	var {:sourceloc "buggy_42.sol", 190, 2} {:message "_vtime"} _vtime#845: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#845 := __block_timestamp;
	if (((startTime#841 + 432000) == _vtime#845)) {
	winner_tmstmp35#839 := winner_tmstmp35#839[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// Function: redeem : function ()
procedure {:sourceloc "buggy_42.sol", 194, 5} {:message "Staking::redeem"} redeem#966(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: address_t;
	var transfer#360_ret#16: bool;
	var call_arg#17: address_t;
	var transferFrom#304_ret#18: bool;
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(lock#447[__this]);
	assume !(redeem#654#stake#657#constr(staker#689[__this][__msg_sender]));
	assume ((time#652#stake#657#constr(staker#689[__this][__msg_sender]) + stakeTime#576[__this]) <= __block_timestamp);
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 198, 17} {:message ""} true;
	call transfer#360_ret#16 := transfer#360(token#421[__this], __this, 0, call_arg#15, tokens#656#stake#657#constr(staker#689[__this][__msg_sender]));
	assume transfer#360_ret#16;
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 199, 17} {:message ""} true;
	call transferFrom#304_ret#18 := transferFrom#304(token#421[__this], __this, 0, owner#14[__this], call_arg#17, (((tokens#656#stake#657#constr(staker#689[__this][__msg_sender]) * stakePercentage#626[__this]) * 100) div 10000));
	assume transferFrom#304_ret#18;
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 200, 14} {:message ""} true;
	call tokensRedeemed#650(__this, __msg_sender, __msg_value, call_arg#19, tokens#656#stake#657#constr(staker#689[__this][__msg_sender]), (((tokens#656#stake#657#constr(staker#689[__this][__msg_sender]) * stakePercentage#626[__this]) * 100) div 10000));
	staker#689 := staker#689[__this := staker#689[__this][__msg_sender := stake#657#constr(time#652#stake#657#constr(staker#689[__this][__msg_sender]), true, tokens#656#stake#657#constr(staker#689[__this][__msg_sender]))]];
	staker#689 := staker#689[__this := staker#689[__this][__msg_sender := stake#657#constr(time#652#stake#657#constr(staker#689[__this][__msg_sender]), redeem#654#stake#657#constr(staker#689[__this][__msg_sender]), 0)]];
	$return27:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_42.sol", 204, 1} {:message "Staking::bug_tmstmp40"} bug_tmstmp40#1013(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 205, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#970: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#970 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#970);
	pastBlockTime_tmstmp40#970 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_42.sol", 210, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return28:
	// Function body ends here
}

// 
// Function: changeStakeTokens : function (uint256)
procedure {:sourceloc "buggy_42.sol", 214, 5} {:message "Staking::changeStakeTokens"} changeStakeTokens#1032(__this: address_t, __msg_sender: address_t, __msg_value: int, _NewTokensThreshold#1015: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#14[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTokens#496 := stakeTokens#496[__this := (_NewTokensThreshold#1015 * 10000000000)];
	$return30:
	// Function body ends here
	$return29:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_42.sol", 217, 1} {:message "Staking::bug_tmstmp33"} bug_tmstmp33#1043(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1035: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1035 := (__block_timestamp >= 1546300800);
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// Function: changeStakeTime : function (uint256)
procedure {:sourceloc "buggy_42.sol", 221, 5} {:message "Staking::changeStakeTime"} changeStakeTime#1055(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakeTime#1045: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#14[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTime#576 := stakeTime#576[__this := _newStakeTime#1045];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_42.sol", 224, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1057: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 225, 1} {:message "Staking::play_tmstmp27"} play_tmstmp27#1083(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1059: int)
{
	var {:sourceloc "buggy_42.sol", 226, 2} {:message "_vtime"} _vtime#1063: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1063 := __block_timestamp;
	if (((startTime#1059 + 432000) == _vtime#1063)) {
	winner_tmstmp27#1057 := winner_tmstmp27#1057[__this := __msg_sender];
	}

	$return34:
	// Function body ends here
}

// 
// Function: changeStakingPercentage : function (uint256)
procedure {:sourceloc "buggy_42.sol", 230, 5} {:message "Staking::changeStakingPercentage"} changeStakingPercentage#1095(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakePercentage#1085: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#14[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakePercentage#626 := stakePercentage#626[__this := _newStakePercentage#1085];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_42.sol", 234, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1097: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 235, 1} {:message "Staking::play_tmstmp31"} play_tmstmp31#1123(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1099: int)
{
	var {:sourceloc "buggy_42.sol", 236, 2} {:message "_vtime"} _vtime#1103: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1103 := __block_timestamp;
	if (((startTime#1099 + 432000) == _vtime#1103)) {
	winner_tmstmp31#1097 := winner_tmstmp31#1097[__this := __msg_sender];
	}

	$return37:
	// Function body ends here
}

// 
// Function: lockWithdrawals : function ()
procedure {:sourceloc "buggy_42.sol", 240, 5} {:message "Staking::lockWithdrawals"} lockWithdrawals#1133(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#14[__this]) || (__msg_sender == __this));
	// Function body starts here
	lock#447 := lock#447[__this := true];
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_42.sol", 243, 1} {:message "Staking::bug_tmstmp13"} bug_tmstmp13#1144(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1136: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1136 := (__block_timestamp >= 1546300800);
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 247, 5} {:message "Staking::findOnePercent"} findOnePercent#1171(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1146: int)
	returns (#1149: int)
{
	var {:sourceloc "buggy_42.sol", 248, 9} {:message "roundValue"} roundValue#1152: int;
	var ceil#261_ret#28: int;
	var {:sourceloc "buggy_42.sol", 249, 9} {:message "onePercent"} onePercent#1159: int;
	var mul#167_ret#29: int;
	var call_arg#30: int;
	var div#185_ret#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 248, 30} {:message ""} true;
	call ceil#261_ret#28 := ceil#261(__this, __msg_sender, __msg_value, value#1146, basePercent#546[__this]);
	roundValue#1152 := ceil#261_ret#28;
	assume {:sourceloc "buggy_42.sol", 249, 30} {:message ""} true;
	call mul#167_ret#29 := mul#167(__this, __msg_sender, __msg_value, roundValue#1152, basePercent#546[__this]);
	call_arg#30 := 10000;
	assume {:sourceloc "buggy_42.sol", 249, 30} {:message ""} true;
	call div#185_ret#31 := div#185(__this, __msg_sender, __msg_value, mul#167_ret#29, call_arg#30);
	onePercent#1159 := div#185_ret#31;
	#1149 := onePercent#1159;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_42.sol", 252, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1175: [address_t]int;
