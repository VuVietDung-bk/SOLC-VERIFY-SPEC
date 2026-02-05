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

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_37.sol", 30, 1} {:message "SafeMath::bug_unchk_send5"} bug_unchk_send5#36(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 31, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return1:
	// Function body ends here
}

// 
// Function: safeSub : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 32, 5} {:message "SafeMath::safeSub"} safeSub#58(__this: address_t, __msg_sender: address_t, __msg_value: int, a#38: int, b#40: int)
	returns (c#43: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#40 <= a#38);
	c#43 := (a#38 - b#40);
	$return2:
	// Function body ends here
}

// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_37.sol", 36, 1} {:message "SafeMath::bug_unchk_send15"} bug_unchk_send15#71(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 37, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return3:
	// Function body ends here
}

// 
// Function: safeMul : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 38, 5} {:message "SafeMath::safeMul"} safeMul#99(__this: address_t, __msg_sender: address_t, __msg_value: int, a#73: int, b#75: int)
	returns (c#78: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#78 := (a#73 * b#75);
	assume ((a#73 == 0) || ((c#78 div a#73) == b#75));
	$return4:
	// Function body ends here
}

// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_37.sol", 42, 1} {:message "SafeMath::bug_unchk_send28"} bug_unchk_send28#112(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 43, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return5:
	// Function body ends here
}

// 
// Function: safeDiv : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 44, 5} {:message "SafeMath::safeDiv"} safeDiv#134(__this: address_t, __msg_sender: address_t, __msg_value: int, a#114: int, b#116: int)
	returns (c#119: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#116 > 0);
	c#119 := (a#114 div b#116);
	$return6:
	// Function body ends here
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_37.sol", 48, 1} {:message "SafeMath::bug_unchk_send21"} bug_unchk_send21#147(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 49, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return7:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 25, 1} {:message "SafeMath::[implicit_constructor]"} __constructor#148(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_37.sol", 79, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#297(__this: address_t, __msg_sender: address_t, __msg_value: int, from#291: address_t, to#293: address_t, tokens#295: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_37.sol", 82, 3} {:message "[event] ERC20Interface::Approval"} Approval#318(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#312: address_t, spender#314: address_t, tokens#316: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 58, 9} {:message "ERC20Interface::totalSupply"} totalSupply#153(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#151: int);

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_37.sol", 59, 1} {:message "ERC20Interface::bug_unchk_send10"} bug_unchk_send10#166(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 60, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return8:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 61, 9} {:message "ERC20Interface::balanceOf"} balanceOf#173(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#168: address_t)
	returns (balance#171: int);

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_37.sol", 62, 1} {:message "ERC20Interface::bug_unchk_send22"} bug_unchk_send22#186(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 63, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return9:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 64, 9} {:message "ERC20Interface::allowance"} allowance#195(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#188: address_t, spender#190: address_t)
	returns (remaining#193: int);

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_37.sol", 65, 1} {:message "ERC20Interface::bug_unchk_send12"} bug_unchk_send12#208(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 66, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return10:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 67, 9} {:message "ERC20Interface::transfer"} transfer#217(__this: address_t, __msg_sender: address_t, __msg_value: int, to#210: address_t, tokens#212: int)
	returns (success#215: bool);

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_37.sol", 68, 1} {:message "ERC20Interface::bug_unchk_send11"} bug_unchk_send11#230(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 69, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return11:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 70, 9} {:message "ERC20Interface::approve"} approve#239(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#232: address_t, tokens#234: int)
	returns (success#237: bool);

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_37.sol", 71, 1} {:message "ERC20Interface::bug_unchk_send1"} bug_unchk_send1#252(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 72, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return12:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 73, 9} {:message "ERC20Interface::transferFrom"} transferFrom#263(__this: address_t, __msg_sender: address_t, __msg_value: int, from#254: address_t, to#256: address_t, tokens#258: int)
	returns (success#261: bool);

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_37.sol", 74, 1} {:message "ERC20Interface::bug_unchk_send2"} bug_unchk_send2#276(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 75, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_37.sol", 77, 3} {:message "ERC20Interface::bug_unchk_send27"} bug_unchk_send27#289(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 78, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_37.sol", 80, 3} {:message "ERC20Interface::bug_unchk_send31"} bug_unchk_send31#310(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 81, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return15:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 57, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#319(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ApproveAndCallFallBack -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_37.sol", 92, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#330(__this: address_t, __msg_sender: address_t, __msg_value: int, from#321: address_t, tokens#323: int, token#325: address_t, data#327: int_arr_ptr);

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_37.sol", 93, 1} {:message "ApproveAndCallFallBack::bug_unchk_send17"} bug_unchk_send17#343(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 94, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return16:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 91, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#344(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_37.sol", 107, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#367(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#363: address_t, _to#365: address_t)
{
	
}

// 
// State variable: owner: address
var {:sourceloc "buggy_37.sol", 102, 5} {:message "owner"} owner#346: [address_t]address_t;
// 
// State variable: newOwner: address
var {:sourceloc "buggy_37.sol", 103, 5} {:message "newOwner"} newOwner#348: [address_t]address_t;
// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_37.sol", 105, 3} {:message "Owned::bug_unchk_send13"} bug_unchk_send13#361(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 106, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return17:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 109, 5} {:message "Owned::[constructor]"} __constructor#466(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#346 := owner#346[__this := 0];
	newOwner#348 := newOwner#348[__this := 0];
	// Function body starts here
	owner#346 := owner#346[__this := __msg_sender];
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_37.sol", 112, 1} {:message "Owned::bug_unchk_send3"} bug_unchk_send3#389(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 113, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return19:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_37.sol", 120, 5} {:message "Owned::transferOwnership"} transferOwnership#412(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#402: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#346[__this]);
	// Function body starts here
	newOwner#348 := newOwner#348[__this := _newOwner#402];
	$return21:
	// Function body ends here
	$return20:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_37.sol", 123, 1} {:message "Owned::bug_unchk_send9"} bug_unchk_send9#425(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 124, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return22:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_37.sol", 125, 5} {:message "Owned::acceptOwnership"} acceptOwnership#452(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#348[__this]);
	assume {:sourceloc "buggy_37.sol", 127, 14} {:message ""} true;
	call OwnershipTransferred#367(__this, __msg_sender, __msg_value, owner#346[__this], newOwner#348[__this]);
	owner#346 := owner#346[__this := newOwner#348[__this]];
	newOwner#348 := newOwner#348[__this := 0];
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_37.sol", 131, 1} {:message "Owned::bug_unchk_send25"} bug_unchk_send25#465(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 132, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return24:
	// Function body ends here
}

// 
// ------- Contract: AugustCoin -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Inherits from: SafeMath
// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_37.sol", 141, 5} {:message "symbol"} symbol#474: [address_t]int_arr_type;
// 
// Function: bug_unchk_send18 : function ()
procedure {:sourceloc "buggy_37.sol", 142, 3} {:message "AugustCoin::bug_unchk_send18"} bug_unchk_send18#487(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 143, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return25:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_37.sol", 144, 3} {:message "name"} name#489: [address_t]int_arr_type;
// 
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_37.sol", 145, 3} {:message "AugustCoin::bug_unchk_send29"} bug_unchk_send29#502(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 146, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return26:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_37.sol", 147, 3} {:message "decimals"} decimals#504: [address_t]int;
// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_37.sol", 148, 3} {:message "AugustCoin::bug_unchk_send6"} bug_unchk_send6#517(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 149, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return27:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_37.sol", 150, 3} {:message "_totalSupply"} _totalSupply#519: [address_t]int;
// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_37.sol", 152, 3} {:message "AugustCoin::bug_unchk_send16"} bug_unchk_send16#532(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 153, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return28:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 154, 3} {:message "balances"} balances#536: [address_t][address_t]int;
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_37.sol", 155, 3} {:message "AugustCoin::bug_unchk_send24"} bug_unchk_send24#549(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 156, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return29:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_37.sol", 157, 3} {:message "allowed"} allowed#555: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 163, 5} {:message "AugustCoin::[constructor]"} __constructor#971(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: address_t;
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	symbol#474 := symbol#474[__this := int_arr#constr(default_int_int(), 0)];
	name#489 := name#489[__this := int_arr#constr(default_int_int(), 0)];
	decimals#504 := decimals#504[__this := 0];
	_totalSupply#519 := _totalSupply#519[__this := 0];
	balances#536 := balances#536[__this := default_address_t_int()];
	allowed#555 := allowed#555[__this := default_address_t__k_address_t_v_int()];
	owner#346 := owner#346[__this := 0];
	newOwner#348 := newOwner#348[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#346 := owner#346[__this := __msg_sender];
	$return30:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#474 := symbol#474[__this := int_arr#constr(default_int_int()[0 := 65][1 := 85][2 := 67], 3)];
	name#489 := name#489[__this := int_arr#constr(default_int_int()[0 := 65][1 := 117][2 := 103][3 := 117][4 := 115][5 := 116][6 := 67][7 := 111][8 := 105][9 := 110], 10)];
	decimals#504 := decimals#504[__this := 18];
	_totalSupply#519 := _totalSupply#519[__this := 100000000000000000000000000];
	balances#536 := balances#536[__this := balances#536[__this][address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD := _totalSupply#519[__this]]];
	call_arg#25 := 0;
	call_arg#26 := address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD;
	assume {:sourceloc "buggy_37.sol", 169, 14} {:message ""} true;
	call Transfer#297(__this, __msg_sender, __msg_value, call_arg#25, call_arg#26, _totalSupply#519[__this]);
	$return31:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_37.sol", 171, 1} {:message "AugustCoin::bug_unchk_send19"} bug_unchk_send19#603(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 172, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return32:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 178, 5} {:message "AugustCoin::totalSupply"} totalSupply#619(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#607: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#607 := (_totalSupply#519[__this] - balances#536[__this][0]);
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_37.sol", 181, 1} {:message "AugustCoin::bug_unchk_send26"} bug_unchk_send26#632(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 182, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return34:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 188, 5} {:message "AugustCoin::balanceOf"} balanceOf#645(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#634: address_t)
	returns (balance#638: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#638 := balances#536[__this][tokenOwner#634];
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_37.sol", 191, 1} {:message "AugustCoin::bug_unchk_send20"} bug_unchk_send20#658(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#29 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 192, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#29);
	$return36:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 200, 5} {:message "AugustCoin::transfer"} transfer#702(__this: address_t, __msg_sender: address_t, __msg_value: int, to#660: address_t, tokens#662: int)
	returns (success#666: bool)
{
	var safeSub#58_ret#30: int;
	var safeAdd#23_ret#31: int;
	var call_arg#32: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 201, 32} {:message ""} true;
	call safeSub#58_ret#30 := safeSub#58(__this, __msg_sender, __msg_value, balances#536[__this][__msg_sender], tokens#662);
	balances#536 := balances#536[__this := balances#536[__this][__msg_sender := safeSub#58_ret#30]];
	assume {:sourceloc "buggy_37.sol", 202, 24} {:message ""} true;
	call safeAdd#23_ret#31 := safeAdd#23(__this, __msg_sender, __msg_value, balances#536[__this][to#660], tokens#662);
	balances#536 := balances#536[__this := balances#536[__this][to#660 := safeAdd#23_ret#31]];
	call_arg#32 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 203, 14} {:message ""} true;
	call Transfer#297(__this, __msg_sender, __msg_value, call_arg#32, to#660, tokens#662);
	success#666 := true;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_37.sol", 206, 1} {:message "AugustCoin::bug_unchk_send32"} bug_unchk_send32#715(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#33 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 207, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#33);
	$return38:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 218, 5} {:message "AugustCoin::approve"} approve#744(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#717: address_t, tokens#719: int)
	returns (success#723: bool)
{
	var call_arg#34: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#555 := allowed#555[__this := allowed#555[__this][__msg_sender := allowed#555[__this][__msg_sender][spender#717 := tokens#719]]];
	call_arg#34 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 220, 14} {:message ""} true;
	call Approval#318(__this, __msg_sender, __msg_value, call_arg#34, spender#717, tokens#719);
	success#723 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_37.sol", 223, 1} {:message "AugustCoin::bug_unchk_send4"} bug_unchk_send4#757(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#35 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 224, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#35);
	$return40:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 236, 5} {:message "AugustCoin::transferFrom"} transferFrom#817(__this: address_t, __msg_sender: address_t, __msg_value: int, from#759: address_t, to#761: address_t, tokens#763: int)
	returns (success#767: bool)
{
	var safeSub#58_ret#36: int;
	var safeSub#58_ret#37: int;
	var safeAdd#23_ret#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 237, 26} {:message ""} true;
	call safeSub#58_ret#36 := safeSub#58(__this, __msg_sender, __msg_value, balances#536[__this][from#759], tokens#763);
	balances#536 := balances#536[__this := balances#536[__this][from#759 := safeSub#58_ret#36]];
	assume {:sourceloc "buggy_37.sol", 238, 37} {:message ""} true;
	call safeSub#58_ret#37 := safeSub#58(__this, __msg_sender, __msg_value, allowed#555[__this][from#759][__msg_sender], tokens#763);
	allowed#555 := allowed#555[__this := allowed#555[__this][from#759 := allowed#555[__this][from#759][__msg_sender := safeSub#58_ret#37]]];
	assume {:sourceloc "buggy_37.sol", 239, 24} {:message ""} true;
	call safeAdd#23_ret#38 := safeAdd#23(__this, __msg_sender, __msg_value, balances#536[__this][to#761], tokens#763);
	balances#536 := balances#536[__this := balances#536[__this][to#761 := safeAdd#23_ret#38]];
	assume {:sourceloc "buggy_37.sol", 240, 14} {:message ""} true;
	call Transfer#297(__this, __msg_sender, __msg_value, from#759, to#761, tokens#763);
	success#767 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_37.sol", 243, 1} {:message "AugustCoin::bug_unchk_send7"} bug_unchk_send7#830(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 244, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return42:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 251, 5} {:message "AugustCoin::allowance"} allowance#847(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#832: address_t, spender#834: address_t)
	returns (remaining#838: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#838 := allowed#555[__this][tokenOwner#832][spender#834];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_37.sol", 254, 1} {:message "AugustCoin::bug_unchk_send23"} bug_unchk_send23#860(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#40 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 255, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#40);
	$return44:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_37.sol", 263, 5} {:message "AugustCoin::approveAndCall"} approveAndCall#904(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#862: address_t, tokens#864: int, data#866: int_arr_ptr)
	returns (success#869: bool)
{
	var call_arg#41: address_t;
	var call_arg#42: address_t;
	var call_arg#43: address_t;
	// TCC assumptions
	assume (data#866 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#555 := allowed#555[__this := allowed#555[__this][__msg_sender := allowed#555[__this][__msg_sender][spender#862 := tokens#864]]];
	call_arg#41 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 265, 14} {:message ""} true;
	call Approval#318(__this, __msg_sender, __msg_value, call_arg#41, spender#862, tokens#864);
	call_arg#42 := __msg_sender;
	call_arg#43 := __this;
	assume {:sourceloc "buggy_37.sol", 266, 9} {:message ""} true;
	call receiveApproval#330(spender#862, __this, 0, call_arg#42, tokens#864, call_arg#43, data#866);
	success#869 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_37.sol", 269, 1} {:message "AugustCoin::bug_unchk_send14"} bug_unchk_send14#917(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 270, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#44);
	$return46:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 276, 5} {:message "AugustCoin::[fallback]"} #924(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_37.sol", 279, 1} {:message "AugustCoin::bug_unchk_send30"} bug_unchk_send30#937(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#45 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 280, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#45);
	$return48:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 286, 5} {:message "AugustCoin::transferAnyERC20Token"} transferAnyERC20Token#957(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#939: address_t, tokens#941: int)
	returns (success#946: bool)
{
	var transfer#217_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#346[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 287, 16} {:message ""} true;
	call transfer#217_ret#48 := transfer#217(tokenAddress#939, __this, 0, owner#346[__this], tokens#941);
	success#946 := transfer#217_ret#48;
	goto $return50;
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_37.sol", 289, 1} {:message "AugustCoin::bug_unchk_send8"} bug_unchk_send8#970(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#49: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#49 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 290, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#49);
	$return51:
	// Function body ends here
}

