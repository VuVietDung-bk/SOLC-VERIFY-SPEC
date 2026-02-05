// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_33.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_33.sol", 17, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#50(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#46: address_t, _to#48: address_t)
{
	
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_33.sol", 8, 3} {:message "Owned::bug_unchk_send28"} bug_unchk_send28#14(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 9, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_33.sol", 10, 3} {:message "owner"} owner#16: [address_t]address_t;
// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_33.sol", 11, 3} {:message "Owned::bug_unchk_send21"} bug_unchk_send21#29(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 12, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_33.sol", 13, 3} {:message "newOwner"} newOwner#31: [address_t]address_t;
// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_33.sol", 15, 3} {:message "Owned::bug_unchk_send27"} bug_unchk_send27#44(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 16, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_33.sol", 19, 5} {:message "Owned::[constructor]"} __constructor#117(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#16 := owner#16[__this := 0];
	newOwner#31 := newOwner#31[__this := 0];
	// Function body starts here
	owner#16 := owner#16[__this := __msg_sender];
	$return3:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_33.sol", 22, 1} {:message "Owned::bug_unchk_send3"} bug_unchk_send3#72(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 23, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return4:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_33.sol", 30, 5} {:message "Owned::transferOwnership"} transferOwnership#103(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#93: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#16[__this]) || (__msg_sender == __this));
	// Function body starts here
	newOwner#31 := newOwner#31[__this := _newOwner#93];
	$return6:
	// Function body ends here
	$return5:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_33.sol", 33, 1} {:message "Owned::bug_unchk_send9"} bug_unchk_send9#116(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 34, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return7:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 38, 3} {:message "SafeMath::mul"} mul#150(__this: address_t, __msg_sender: address_t, __msg_value: int, a#119: int, b#121: int)
	returns (#124: int)
{
	var {:sourceloc "buggy_33.sol", 42, 5} {:message "c"} c#134: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#119 == 0)) {
	#124 := 0;
	goto $return8;
	}

	c#134 := (a#119 * b#121);
	assert {:sourceloc "buggy_33.sol", 43, 5} {:message "Assertion might not hold."} ((c#134 div a#119) == b#121);
	#124 := c#134;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 47, 3} {:message "SafeMath::div"} div#168(__this: address_t, __msg_sender: address_t, __msg_value: int, a#152: int, b#154: int)
	returns (#157: int)
{
	var {:sourceloc "buggy_33.sol", 48, 5} {:message "c"} c#160: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#160 := (a#152 div b#154);
	#157 := c#160;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 52, 3} {:message "SafeMath::sub"} sub#188(__this: address_t, __msg_sender: address_t, __msg_value: int, a#170: int, b#172: int)
	returns (#175: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_33.sol", 53, 5} {:message "Assertion might not hold."} (b#172 <= a#170);
	#175 := (a#170 - b#172);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 57, 3} {:message "SafeMath::add"} add#212(__this: address_t, __msg_sender: address_t, __msg_value: int, a#190: int, b#192: int)
	returns (#195: int)
{
	var {:sourceloc "buggy_33.sol", 58, 5} {:message "c"} c#198: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#198 := (a#190 + b#192);
	assert {:sourceloc "buggy_33.sol", 59, 5} {:message "Assertion might not hold."} (c#198 >= a#190);
	#195 := c#198;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 63, 3} {:message "SafeMath::ceil"} ceil#244(__this: address_t, __msg_sender: address_t, __msg_value: int, a#214: int, m#216: int)
	returns (#219: int)
{
	var {:sourceloc "buggy_33.sol", 64, 5} {:message "c"} c#222: int;
	var add#212_ret#7: int;
	var {:sourceloc "buggy_33.sol", 65, 5} {:message "d"} d#229: int;
	var call_arg#8: int;
	var sub#188_ret#9: int;
	var div#168_ret#10: int;
	var mul#150_ret#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 64, 17} {:message ""} true;
	call add#212_ret#7 := add#212(__this, __msg_sender, __msg_value, a#214, m#216);
	c#222 := add#212_ret#7;
	call_arg#8 := 1;
	assume {:sourceloc "buggy_33.sol", 65, 17} {:message ""} true;
	call sub#188_ret#9 := sub#188(__this, __msg_sender, __msg_value, c#222, call_arg#8);
	d#229 := sub#188_ret#9;
	assume {:sourceloc "buggy_33.sol", 66, 16} {:message ""} true;
	call div#168_ret#10 := div#168(__this, __msg_sender, __msg_value, d#229, m#216);
	assume {:sourceloc "buggy_33.sol", 66, 12} {:message ""} true;
	call mul#150_ret#11 := mul#150(__this, __msg_sender, __msg_value, div#168_ret#10, m#216);
	#219 := mul#150_ret#11;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_33.sol", 37, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#245(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Token -------
// 
// Function: balanceOf
procedure {:sourceloc "buggy_33.sol", 71, 5} {:message "Token::balanceOf"} balanceOf#252(__this: address_t, __msg_sender: address_t, __msg_value: int, who#247: address_t)
	returns (#250: int);

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_33.sol", 72, 1} {:message "Token::bug_unchk_send25"} bug_unchk_send25#265(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 73, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return13:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_33.sol", 74, 5} {:message "Token::transferFrom"} transferFrom#276(__this: address_t, __msg_sender: address_t, __msg_value: int, from#267: address_t, to#269: address_t, value#271: int)
	returns (#274: bool);

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_33.sol", 75, 1} {:message "Token::bug_unchk_send19"} bug_unchk_send19#289(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 76, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return14:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_33.sol", 77, 5} {:message "Token::transfer"} transfer#298(__this: address_t, __msg_sender: address_t, __msg_value: int, to#291: address_t, value#293: int)
	returns (#296: bool);

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_33.sol", 78, 1} {:message "Token::bug_unchk_send26"} bug_unchk_send26#311(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 79, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return15:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_33.sol", 70, 1} {:message "Token::[implicit_constructor]"} __constructor#312(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Staking -------
// Inherits from: Owned
// 
// Event: stakingstarted
procedure {:inline 1} {:sourceloc "buggy_33.sol", 104, 3} {:message "[event] Staking::stakingstarted"} stakingstarted#431(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#425: address_t, tokens#427: int, time#429: int)
{
	
}

// 
// Event: tokensRedeemed
procedure {:inline 1} {:sourceloc "buggy_33.sol", 107, 3} {:message "[event] Staking::tokensRedeemed"} tokensRedeemed#452(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#446: address_t, stakedTokens#448: int, reward#450: int)
{
	
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_33.sol", 83, 3} {:message "Staking::bug_unchk_send10"} bug_unchk_send10#327(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 84, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return16:
	// Function body ends here
}

// 
// State variable: token: contract Token
var {:sourceloc "buggy_33.sol", 85, 3} {:message "token"} token#329: [address_t]address_t;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_33.sol", 86, 3} {:message "Staking::bug_unchk_send22"} bug_unchk_send22#342(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 87, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return17:
	// Function body ends here
}

// 
// State variable: lock: bool
var {:sourceloc "buggy_33.sol", 88, 3} {:message "lock"} lock#344: [address_t]bool;
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_33.sol", 89, 3} {:message "Staking::bug_unchk_send12"} bug_unchk_send12#357(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 90, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return18:
	// Function body ends here
}

// 
// State variable: minstakeTokens: uint256
var {:sourceloc "buggy_33.sol", 91, 3} {:message "minstakeTokens"} minstakeTokens#359: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_33.sol", 92, 3} {:message "Staking::bug_unchk_send11"} bug_unchk_send11#372(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 93, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return19:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_33.sol", 94, 3} {:message "basePercent"} basePercent#375: [address_t]int;
// Using library SafeMath for uint256
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_33.sol", 96, 3} {:message "Staking::bug_unchk_send1"} bug_unchk_send1#391(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 97, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return20:
	// Function body ends here
}

// 
// State variable: stakeTime: uint256
var {:sourceloc "buggy_33.sol", 98, 3} {:message "stakeTime"} stakeTime#394: [address_t]int;
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_33.sol", 99, 3} {:message "Staking::bug_unchk_send2"} bug_unchk_send2#407(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 100, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return21:
	// Function body ends here
}

// 
// State variable: stakePercentage: uint256
var {:sourceloc "buggy_33.sol", 101, 3} {:message "stakePercentage"} stakePercentage#410: [address_t]int;
// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_33.sol", 102, 3} {:message "Staking::bug_unchk_send31"} bug_unchk_send31#423(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 103, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_33.sol", 105, 3} {:message "Staking::bug_unchk_send13"} bug_unchk_send13#444(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 106, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return23:
	// Function body ends here
}

// 
// ------- Struct stake -------
// Storage
type {:datatype} struct_storage_stake#459;
function {:constructor} stake#459#constr(time#454: int, redeem#456: bool, tokens#458: int) returns (struct_storage_stake#459);
// Memory
type address_struct_memory_stake#459 = int;
// Member time
var {:sourceloc "buggy_33.sol", 110, 9} {:message "time"} time#454: [address_struct_memory_stake#459]int;
// Member redeem
var {:sourceloc "buggy_33.sol", 111, 9} {:message "redeem"} redeem#456: [address_struct_memory_stake#459]bool;
// Member tokens
var {:sourceloc "buggy_33.sol", 112, 9} {:message "tokens"} tokens#458: [address_struct_memory_stake#459]int;
// 
// ------- End of struct stake -------
// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_33.sol", 114, 3} {:message "Staking::bug_unchk_send17"} bug_unchk_send17#472(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 115, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return24:
	// Function body ends here
}

// 
// State variable: staker: mapping(address => struct Staking.stake storage ref)
var {:sourceloc "buggy_33.sol", 116, 3} {:message "staker"} staker#476: [address_t][address_t]struct_storage_stake#459;
function {:builtin "((as const (Array Int |T@struct_storage_stake#459|)) (|stake#459#constr| 0 false 0))"} default_address_t_struct_storage_stake#459() returns ([address_t]struct_storage_stake#459);
// 
// Function: 
procedure {:sourceloc "buggy_33.sol", 119, 5} {:message "Staking::[constructor]"} __constructor#871(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenContractAddress#478: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	token#329 := token#329[__this := 0];
	lock#344 := lock#344[__this := false];
	minstakeTokens#359 := minstakeTokens#359[__this := 0];
	basePercent#375 := basePercent#375[__this := 200];
	stakeTime#394 := stakeTime#394[__this := 1814400];
	stakePercentage#410 := stakePercentage#410[__this := 30];
	staker#476 := staker#476[__this := default_address_t_struct_storage_stake#459()];
	owner#16 := owner#16[__this := 0];
	newOwner#31 := newOwner#31[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#16 := owner#16[__this := __msg_sender];
	$return25:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	token#329 := token#329[__this := tokenContractAddress#478];
	owner#16 := owner#16[__this := __msg_sender];
	minstakeTokens#359 := minstakeTokens#359[__this := (500 * 10000000000)];
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_33.sol", 124, 1} {:message "Staking::bug_unchk_send20"} bug_unchk_send20#517(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 125, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return27:
	// Function body ends here
}

// 
// Function: startStaking : function (uint256)
procedure {:sourceloc "buggy_33.sol", 127, 5} {:message "Staking::startStaking"} startStaking#598(__this: address_t, __msg_sender: address_t, __msg_value: int, stakeTokens#519: int)
{
	var findOnePercent#857_ret#26: int;
	var call_arg#27: address_t;
	var balanceOf#252_ret#28: int;
	var call_arg#29: address_t;
	var findOnePercent#857_ret#30: int;
	var transferFrom#276_ret#31: bool;
	var call_arg#32: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (stakeTokens#519 >= minstakeTokens#359[__this]);
	assume {:sourceloc "buggy_33.sol", 129, 62} {:message ""} true;
	call findOnePercent#857_ret#26 := findOnePercent#857(__this, __msg_sender, __msg_value, stakeTokens#519);
	call_arg#27 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 129, 17} {:message ""} true;
	call balanceOf#252_ret#28 := balanceOf#252(token#329[__this], __this, 0, call_arg#27);
	assume (balanceOf#252_ret#28 >= (stakeTokens#519 + findOnePercent#857_ret#26));
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 130, 78} {:message ""} true;
	call findOnePercent#857_ret#30 := findOnePercent#857(__this, __msg_sender, __msg_value, stakeTokens#519);
	assume {:sourceloc "buggy_33.sol", 130, 17} {:message ""} true;
	call transferFrom#276_ret#31 := transferFrom#276(token#329[__this], __this, 0, call_arg#29, __this, (stakeTokens#519 + findOnePercent#857_ret#30));
	assume transferFrom#276_ret#31;
	staker#476 := staker#476[__this := staker#476[__this][__msg_sender := stake#459#constr(__block_timestamp, redeem#456#stake#459#constr(staker#476[__this][__msg_sender]), tokens#458#stake#459#constr(staker#476[__this][__msg_sender]))]];
	staker#476 := staker#476[__this := staker#476[__this][__msg_sender := stake#459#constr(time#454#stake#459#constr(staker#476[__this][__msg_sender]), redeem#456#stake#459#constr(staker#476[__this][__msg_sender]), (tokens#458#stake#459#constr(staker#476[__this][__msg_sender]) + stakeTokens#519))]];
	call_arg#32 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 133, 14} {:message ""} true;
	call stakingstarted#431(__this, __msg_sender, __msg_value, call_arg#32, tokens#458#stake#459#constr(staker#476[__this][__msg_sender]), time#454#stake#459#constr(staker#476[__this][__msg_sender]));
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_33.sol", 135, 1} {:message "Staking::bug_unchk_send32"} bug_unchk_send32#611(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#33 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 136, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#33);
	$return29:
	// Function body ends here
}

// 
// Function: redeem : function ()
procedure {:sourceloc "buggy_33.sol", 138, 5} {:message "Staking::redeem"} redeem#712(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: address_t;
	var transfer#298_ret#35: bool;
	var call_arg#36: address_t;
	var transferFrom#276_ret#37: bool;
	var call_arg#38: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(lock#344[__this]);
	assume !(redeem#456#stake#459#constr(staker#476[__this][__msg_sender]));
	assume ((time#454#stake#459#constr(staker#476[__this][__msg_sender]) + stakeTime#394[__this]) <= __block_timestamp);
	call_arg#34 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 142, 17} {:message ""} true;
	call transfer#298_ret#35 := transfer#298(token#329[__this], __this, 0, call_arg#34, tokens#458#stake#459#constr(staker#476[__this][__msg_sender]));
	assume transfer#298_ret#35;
	call_arg#36 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 143, 17} {:message ""} true;
	call transferFrom#276_ret#37 := transferFrom#276(token#329[__this], __this, 0, owner#16[__this], call_arg#36, (((tokens#458#stake#459#constr(staker#476[__this][__msg_sender]) * stakePercentage#410[__this]) * 100) div 10000));
	assume transferFrom#276_ret#37;
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 144, 14} {:message ""} true;
	call tokensRedeemed#452(__this, __msg_sender, __msg_value, call_arg#38, tokens#458#stake#459#constr(staker#476[__this][__msg_sender]), (((tokens#458#stake#459#constr(staker#476[__this][__msg_sender]) * stakePercentage#410[__this]) * 100) div 10000));
	staker#476 := staker#476[__this := staker#476[__this][__msg_sender := stake#459#constr(time#454#stake#459#constr(staker#476[__this][__msg_sender]), true, tokens#458#stake#459#constr(staker#476[__this][__msg_sender]))]];
	staker#476 := staker#476[__this := staker#476[__this][__msg_sender := stake#459#constr(time#454#stake#459#constr(staker#476[__this][__msg_sender]), redeem#456#stake#459#constr(staker#476[__this][__msg_sender]), 0)]];
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_33.sol", 148, 1} {:message "Staking::bug_unchk_send4"} bug_unchk_send4#725(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 149, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return31:
	// Function body ends here
}

// 
// Function: changeStakeTokens : function (uint256)
procedure {:sourceloc "buggy_33.sol", 151, 5} {:message "Staking::changeStakeTokens"} changeStakeTokens#744(__this: address_t, __msg_sender: address_t, __msg_value: int, _NewTokensThreshold#727: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#16[__this]) || (__msg_sender == __this));
	// Function body starts here
	minstakeTokens#359 := minstakeTokens#359[__this := (_NewTokensThreshold#727 * 10000000000)];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_33.sol", 154, 1} {:message "Staking::bug_unchk_send7"} bug_unchk_send7#757(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 155, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#42);
	$return34:
	// Function body ends here
}

// 
// Function: changeStakeTime : function (uint256)
procedure {:sourceloc "buggy_33.sol", 157, 5} {:message "Staking::changeStakeTime"} changeStakeTime#769(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakeTime#759: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#16[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTime#394 := stakeTime#394[__this := _newStakeTime#759];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_33.sol", 160, 1} {:message "Staking::bug_unchk_send23"} bug_unchk_send23#782(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#45 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 161, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#45);
	$return37:
	// Function body ends here
}

// 
// Function: changeStakingPercentage : function (uint256)
procedure {:sourceloc "buggy_33.sol", 163, 5} {:message "Staking::changeStakingPercentage"} changeStakingPercentage#794(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakePercentage#784: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#16[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakePercentage#410 := stakePercentage#410[__this := _newStakePercentage#784];
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_33.sol", 167, 1} {:message "Staking::bug_unchk_send14"} bug_unchk_send14#807(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#48: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#48 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 168, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#48);
	$return40:
	// Function body ends here
}

// 
// Function: lockWithdrawals : function ()
procedure {:sourceloc "buggy_33.sol", 170, 5} {:message "Staking::lockWithdrawals"} lockWithdrawals#817(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#16[__this]) || (__msg_sender == __this));
	// Function body starts here
	lock#344 := lock#344[__this := true];
	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_33.sol", 173, 1} {:message "Staking::bug_unchk_send30"} bug_unchk_send30#830(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#51 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 174, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#51);
	$return43:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 176, 5} {:message "Staking::findOnePercent"} findOnePercent#857(__this: address_t, __msg_sender: address_t, __msg_value: int, value#832: int)
	returns (#835: int)
{
	var {:sourceloc "buggy_33.sol", 177, 9} {:message "roundValue"} roundValue#838: int;
	var ceil#244_ret#52: int;
	var {:sourceloc "buggy_33.sol", 178, 9} {:message "onePercent"} onePercent#845: int;
	var mul#150_ret#53: int;
	var call_arg#54: int;
	var div#168_ret#55: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 177, 30} {:message ""} true;
	call ceil#244_ret#52 := ceil#244(__this, __msg_sender, __msg_value, value#832, basePercent#375[__this]);
	roundValue#838 := ceil#244_ret#52;
	assume {:sourceloc "buggy_33.sol", 178, 30} {:message ""} true;
	call mul#150_ret#53 := mul#150(__this, __msg_sender, __msg_value, roundValue#838, basePercent#375[__this]);
	call_arg#54 := 10000;
	assume {:sourceloc "buggy_33.sol", 178, 30} {:message ""} true;
	call div#168_ret#55 := div#168(__this, __msg_sender, __msg_value, mul#150_ret#53, call_arg#54);
	onePercent#845 := div#168_ret#55;
	#835 := onePercent#845;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_33.sol", 181, 1} {:message "Staking::bug_unchk_send8"} bug_unchk_send8#870(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#56: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#56 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 182, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#56);
	$return45:
	// Function body ends here
}

