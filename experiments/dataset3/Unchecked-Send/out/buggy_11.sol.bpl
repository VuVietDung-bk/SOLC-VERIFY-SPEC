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
procedure {:inline 1} {:sourceloc "buggy_11.sol", 49, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#245(__this: address_t, __msg_sender: address_t, __msg_value: int, from#239: address_t, to#241: address_t, tokens#243: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_11.sol", 52, 3} {:message "[event] ERC20Interface::Approval"} Approval#266(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#260: address_t, spender#262: address_t, tokens#264: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_11.sol", 28, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_11.sol", 29, 1} {:message "ERC20Interface::bug_unchk_send10"} bug_unchk_send10#114(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 30, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return4:
	// Function body ends here
}

// 
// Function: balanceOf
procedure {:sourceloc "buggy_11.sol", 31, 5} {:message "ERC20Interface::balanceOf"} balanceOf#121(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#116: address_t)
	returns (balance#119: int);

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_11.sol", 32, 1} {:message "ERC20Interface::bug_unchk_send22"} bug_unchk_send22#134(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 33, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return5:
	// Function body ends here
}

// 
// Function: allowance
procedure {:sourceloc "buggy_11.sol", 34, 5} {:message "ERC20Interface::allowance"} allowance#143(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#136: address_t, spender#138: address_t)
	returns (remaining#141: int);

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_11.sol", 35, 1} {:message "ERC20Interface::bug_unchk_send12"} bug_unchk_send12#156(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 36, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return6:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_11.sol", 37, 5} {:message "ERC20Interface::transfer"} transfer#165(__this: address_t, __msg_sender: address_t, __msg_value: int, to#158: address_t, tokens#160: int)
	returns (success#163: bool);

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_11.sol", 38, 1} {:message "ERC20Interface::bug_unchk_send11"} bug_unchk_send11#178(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 39, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return7:
	// Function body ends here
}

// 
// Function: approve
procedure {:sourceloc "buggy_11.sol", 40, 5} {:message "ERC20Interface::approve"} approve#187(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#180: address_t, tokens#182: int)
	returns (success#185: bool);

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_11.sol", 41, 1} {:message "ERC20Interface::bug_unchk_send1"} bug_unchk_send1#200(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 42, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_11.sol", 43, 5} {:message "ERC20Interface::transferFrom"} transferFrom#211(__this: address_t, __msg_sender: address_t, __msg_value: int, from#202: address_t, to#204: address_t, tokens#206: int)
	returns (success#209: bool);

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_11.sol", 44, 1} {:message "ERC20Interface::bug_unchk_send2"} bug_unchk_send2#224(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 45, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_11.sol", 47, 3} {:message "ERC20Interface::bug_unchk_send27"} bug_unchk_send27#237(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 48, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_11.sol", 50, 3} {:message "ERC20Interface::bug_unchk_send31"} bug_unchk_send31#258(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 51, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 27, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#267(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
// Function: receiveApproval
procedure {:sourceloc "buggy_11.sol", 57, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#278(__this: address_t, __msg_sender: address_t, __msg_value: int, from#269: address_t, tokens#271: int, token#273: address_t, data#275: int_arr_ptr);

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_11.sol", 58, 1} {:message "ApproveAndCallFallBack::bug_unchk_send17"} bug_unchk_send17#291(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 59, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 56, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#292(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_11.sol", 73, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#341(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#337: address_t, _to#339: address_t)
{
	
}

// 
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_11.sol", 64, 3} {:message "Owned::bug_unchk_send29"} bug_unchk_send29#305(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 65, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return13:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_11.sol", 66, 3} {:message "owner"} owner#307: [address_t]address_t;
// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_11.sol", 67, 3} {:message "Owned::bug_unchk_send6"} bug_unchk_send6#320(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 68, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return14:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_11.sol", 69, 3} {:message "newOwner"} newOwner#322: [address_t]address_t;
// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_11.sol", 71, 3} {:message "Owned::bug_unchk_send13"} bug_unchk_send13#335(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 72, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return15:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 75, 5} {:message "Owned::[constructor]"} __constructor#440(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#307 := owner#307[__this := 0];
	newOwner#322 := newOwner#322[__this := 0];
	// Function body starts here
	owner#307 := owner#307[__this := __msg_sender];
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_11.sol", 78, 1} {:message "Owned::bug_unchk_send3"} bug_unchk_send3#363(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 79, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return17:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_11.sol", 86, 5} {:message "Owned::transferOwnership"} transferOwnership#386(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#376: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#307[__this]);
	// Function body starts here
	newOwner#322 := newOwner#322[__this := _newOwner#376];
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_11.sol", 89, 1} {:message "Owned::bug_unchk_send9"} bug_unchk_send9#399(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 90, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return20:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_11.sol", 91, 5} {:message "Owned::acceptOwnership"} acceptOwnership#426(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#322[__this]);
	assume {:sourceloc "buggy_11.sol", 93, 14} {:message ""} true;
	call OwnershipTransferred#341(__this, __msg_sender, __msg_value, owner#307[__this], newOwner#322[__this]);
	owner#307 := owner#307[__this := newOwner#322[__this]];
	newOwner#322 := newOwner#322[__this := 0];
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_11.sol", 97, 1} {:message "Owned::bug_unchk_send25"} bug_unchk_send25#439(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 98, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return22:
	// Function body ends here
}

// 
// ------- Contract: ForTheBlockchain -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_11.sol", 105, 1} {:message "ForTheBlockchain::bug_unchk_send16"} bug_unchk_send16#460(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 106, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return23:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_11.sol", 107, 3} {:message "symbol"} symbol#462: [address_t]int_arr_type;
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_11.sol", 108, 1} {:message "ForTheBlockchain::bug_unchk_send24"} bug_unchk_send24#475(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 109, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return24:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_11.sol", 110, 3} {:message "decimals"} decimals#477: [address_t]int;
// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_11.sol", 111, 1} {:message "ForTheBlockchain::bug_unchk_send5"} bug_unchk_send5#490(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 112, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return25:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_11.sol", 113, 3} {:message "name"} name#492: [address_t]int_arr_type;
// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_11.sol", 114, 1} {:message "ForTheBlockchain::bug_unchk_send15"} bug_unchk_send15#505(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 115, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return26:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_11.sol", 116, 3} {:message "_totalSupply"} _totalSupply#507: [address_t]int;
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_11.sol", 119, 1} {:message "ForTheBlockchain::bug_unchk_send28"} bug_unchk_send28#520(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 120, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return27:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 121, 3} {:message "balances"} balances#524: [address_t][address_t]int;
// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_11.sol", 122, 1} {:message "ForTheBlockchain::bug_unchk_send21"} bug_unchk_send21#537(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 123, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return28:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_11.sol", 124, 3} {:message "allowed"} allowed#543: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 130, 5} {:message "ForTheBlockchain::[constructor]"} __constructor#962(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	symbol#462 := symbol#462[__this := int_arr#constr(default_int_int(), 0)];
	decimals#477 := decimals#477[__this := 0];
	name#492 := name#492[__this := int_arr#constr(default_int_int(), 0)];
	_totalSupply#507 := _totalSupply#507[__this := 0];
	balances#524 := balances#524[__this := default_address_t_int()];
	allowed#543 := allowed#543[__this := default_address_t__k_address_t_v_int()];
	owner#307 := owner#307[__this := 0];
	newOwner#322 := newOwner#322[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#307 := owner#307[__this := __msg_sender];
	$return29:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#462 := symbol#462[__this := int_arr#constr(default_int_int()[0 := 70][1 := 84][2 := 66], 3)];
	name#492 := name#492[__this := int_arr#constr(default_int_int()[0 := 70][1 := 111][2 := 114][3 := 84][4 := 104][5 := 101][6 := 66][7 := 108][8 := 111][9 := 99][10 := 107][11 := 99][12 := 104][13 := 97][14 := 105][15 := 110], 16)];
	decimals#477 := decimals#477[__this := 8];
	_totalSupply#507 := _totalSupply#507[__this := 10000000000000000];
	balances#524 := balances#524[__this := balances#524[__this][owner#307[__this] := _totalSupply#507[__this]]];
	call_arg#24 := 0;
	assume {:sourceloc "buggy_11.sol", 136, 14} {:message ""} true;
	call Transfer#245(__this, __msg_sender, __msg_value, call_arg#24, owner#307[__this], _totalSupply#507[__this]);
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_11.sol", 139, 1} {:message "ForTheBlockchain::bug_unchk_send19"} bug_unchk_send19#593(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 140, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return31:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 146, 5} {:message "ForTheBlockchain::totalSupply"} totalSupply#610(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#597: int)
{
	var sub#45_ret#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 147, 16} {:message ""} true;
	call sub#45_ret#26 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#507[__this], balances#524[__this][0]);
	#597 := sub#45_ret#26;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_11.sol", 149, 1} {:message "ForTheBlockchain::bug_unchk_send26"} bug_unchk_send26#623(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 150, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return33:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 156, 5} {:message "ForTheBlockchain::balanceOf"} balanceOf#636(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#625: address_t)
	returns (balance#629: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#629 := balances#524[__this][tokenOwner#625];
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_11.sol", 159, 1} {:message "ForTheBlockchain::bug_unchk_send20"} bug_unchk_send20#649(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 160, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return35:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 168, 5} {:message "ForTheBlockchain::transfer"} transfer#693(__this: address_t, __msg_sender: address_t, __msg_value: int, to#651: address_t, tokens#653: int)
	returns (success#657: bool)
{
	var sub#45_ret#29: int;
	var add#23_ret#30: int;
	var call_arg#31: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 169, 32} {:message ""} true;
	call sub#45_ret#29 := sub#45(__this, __msg_sender, __msg_value, balances#524[__this][__msg_sender], tokens#653);
	balances#524 := balances#524[__this := balances#524[__this][__msg_sender := sub#45_ret#29]];
	assume {:sourceloc "buggy_11.sol", 170, 24} {:message ""} true;
	call add#23_ret#30 := add#23(__this, __msg_sender, __msg_value, balances#524[__this][to#651], tokens#653);
	balances#524 := balances#524[__this := balances#524[__this][to#651 := add#23_ret#30]];
	call_arg#31 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 171, 14} {:message ""} true;
	call Transfer#245(__this, __msg_sender, __msg_value, call_arg#31, to#651, tokens#653);
	success#657 := true;
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_11.sol", 174, 1} {:message "ForTheBlockchain::bug_unchk_send32"} bug_unchk_send32#706(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#32 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 175, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#32);
	$return37:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 186, 5} {:message "ForTheBlockchain::approve"} approve#735(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#708: address_t, tokens#710: int)
	returns (success#714: bool)
{
	var call_arg#33: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#543 := allowed#543[__this := allowed#543[__this][__msg_sender := allowed#543[__this][__msg_sender][spender#708 := tokens#710]]];
	call_arg#33 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 188, 14} {:message ""} true;
	call Approval#266(__this, __msg_sender, __msg_value, call_arg#33, spender#708, tokens#710);
	success#714 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_11.sol", 191, 1} {:message "ForTheBlockchain::bug_unchk_send4"} bug_unchk_send4#748(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#34 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 192, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#34);
	$return39:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 204, 5} {:message "ForTheBlockchain::transferFrom"} transferFrom#808(__this: address_t, __msg_sender: address_t, __msg_value: int, from#750: address_t, to#752: address_t, tokens#754: int)
	returns (success#758: bool)
{
	var sub#45_ret#35: int;
	var sub#45_ret#36: int;
	var add#23_ret#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 205, 26} {:message ""} true;
	call sub#45_ret#35 := sub#45(__this, __msg_sender, __msg_value, balances#524[__this][from#750], tokens#754);
	balances#524 := balances#524[__this := balances#524[__this][from#750 := sub#45_ret#35]];
	assume {:sourceloc "buggy_11.sol", 206, 37} {:message ""} true;
	call sub#45_ret#36 := sub#45(__this, __msg_sender, __msg_value, allowed#543[__this][from#750][__msg_sender], tokens#754);
	allowed#543 := allowed#543[__this := allowed#543[__this][from#750 := allowed#543[__this][from#750][__msg_sender := sub#45_ret#36]]];
	assume {:sourceloc "buggy_11.sol", 207, 24} {:message ""} true;
	call add#23_ret#37 := add#23(__this, __msg_sender, __msg_value, balances#524[__this][to#752], tokens#754);
	balances#524 := balances#524[__this := balances#524[__this][to#752 := add#23_ret#37]];
	assume {:sourceloc "buggy_11.sol", 208, 14} {:message ""} true;
	call Transfer#245(__this, __msg_sender, __msg_value, from#750, to#752, tokens#754);
	success#758 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_11.sol", 211, 1} {:message "ForTheBlockchain::bug_unchk_send7"} bug_unchk_send7#821(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 212, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#38);
	$return41:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 219, 5} {:message "ForTheBlockchain::allowance"} allowance#838(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#823: address_t, spender#825: address_t)
	returns (remaining#829: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#829 := allowed#543[__this][tokenOwner#823][spender#825];
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_11.sol", 222, 1} {:message "ForTheBlockchain::bug_unchk_send23"} bug_unchk_send23#851(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 223, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return43:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_11.sol", 231, 5} {:message "ForTheBlockchain::approveAndCall"} approveAndCall#895(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#853: address_t, tokens#855: int, data#857: int_arr_ptr)
	returns (success#860: bool)
{
	var call_arg#40: address_t;
	var call_arg#41: address_t;
	var call_arg#42: address_t;
	// TCC assumptions
	assume (data#857 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#543 := allowed#543[__this := allowed#543[__this][__msg_sender := allowed#543[__this][__msg_sender][spender#853 := tokens#855]]];
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 233, 14} {:message ""} true;
	call Approval#266(__this, __msg_sender, __msg_value, call_arg#40, spender#853, tokens#855);
	call_arg#41 := __msg_sender;
	call_arg#42 := __this;
	assume {:sourceloc "buggy_11.sol", 234, 9} {:message ""} true;
	call receiveApproval#278(spender#853, __this, 0, call_arg#41, tokens#855, call_arg#42, data#857);
	success#860 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_11.sol", 237, 1} {:message "ForTheBlockchain::bug_unchk_send14"} bug_unchk_send14#908(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#43 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 238, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#43);
	$return45:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 244, 5} {:message "ForTheBlockchain::[receive]"} #915(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return46:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_11.sol", 247, 1} {:message "ForTheBlockchain::bug_unchk_send30"} bug_unchk_send30#928(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 248, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#44);
	$return47:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 254, 5} {:message "ForTheBlockchain::transferAnyERC20Token"} transferAnyERC20Token#948(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#930: address_t, tokens#932: int)
	returns (success#937: bool)
{
	var transfer#165_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#307[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 255, 16} {:message ""} true;
	call transfer#165_ret#47 := transfer#165(tokenAddress#930, __this, 0, owner#307[__this], tokens#932);
	success#937 := transfer#165_ret#47;
	goto $return49;
	$return49:
	// Function body ends here
	$return48:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_11.sol", 257, 1} {:message "ForTheBlockchain::bug_unchk_send8"} bug_unchk_send8#961(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#48: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#48 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 258, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#48);
	$return50:
	// Function body ends here
}

