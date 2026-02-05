// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_48.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 19, 5} {:message "SafeMath::add"} add#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
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
procedure {:inline 1} {:sourceloc "buggy_48.sol", 23, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#25: int, b#27: int)
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
procedure {:inline 1} {:sourceloc "buggy_48.sol", 27, 5} {:message "SafeMath::mul"} mul#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#47: int, b#49: int)
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
procedure {:inline 1} {:sourceloc "buggy_48.sol", 31, 5} {:message "SafeMath::div"} div#95(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
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
procedure {:sourceloc "buggy_48.sol", 18, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_48.sol", 50, 5} {:message "[event] ERC20Interface::Transfer"} Transfer#154(__this: address_t, __msg_sender: address_t, __msg_value: int, from#148: address_t, to#150: address_t, tokens#152: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_48.sol", 51, 5} {:message "[event] ERC20Interface::Approval"} Approval#162(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#156: address_t, spender#158: address_t, tokens#160: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 43, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 44, 5} {:message "ERC20Interface::balanceOf"} balanceOf#108(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#103: address_t)
	returns (balance#106: int);

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 45, 5} {:message "ERC20Interface::allowance"} allowance#117(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#110: address_t, spender#112: address_t)
	returns (remaining#115: int);

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 46, 5} {:message "ERC20Interface::transfer"} transfer#126(__this: address_t, __msg_sender: address_t, __msg_value: int, to#119: address_t, tokens#121: int)
	returns (success#124: bool);

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 47, 5} {:message "ERC20Interface::approve"} approve#135(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#128: address_t, tokens#130: int)
	returns (success#133: bool);

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 48, 5} {:message "ERC20Interface::transferFrom"} transferFrom#146(__this: address_t, __msg_sender: address_t, __msg_value: int, from#137: address_t, to#139: address_t, tokens#141: int)
	returns (success#144: bool);

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_48.sol", 53, 5} {:message "ERC20Interface::bug_unchk_send21"} bug_unchk_send21#175(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 53, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return4:
	// Function body ends here
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_48.sol", 54, 5} {:message "ERC20Interface::bug_unchk_send10"} bug_unchk_send10#188(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 54, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return5:
	// Function body ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_48.sol", 55, 5} {:message "ERC20Interface::bug_unchk_send22"} bug_unchk_send22#201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 55, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return6:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_48.sol", 56, 5} {:message "ERC20Interface::bug_unchk_send12"} bug_unchk_send12#214(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 56, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return7:
	// Function body ends here
}

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_48.sol", 57, 5} {:message "ERC20Interface::bug_unchk_send11"} bug_unchk_send11#227(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 57, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_48.sol", 58, 5} {:message "ERC20Interface::bug_unchk_send1"} bug_unchk_send1#240(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 58, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_48.sol", 59, 5} {:message "ERC20Interface::bug_unchk_send27"} bug_unchk_send27#253(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 59, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_48.sol", 60, 5} {:message "ERC20Interface::bug_unchk_send31"} bug_unchk_send31#266(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 60, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 42, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#267(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
procedure {:sourceloc "buggy_48.sol", 70, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#278(__this: address_t, __msg_sender: address_t, __msg_value: int, from#269: address_t, tokens#271: int, token#273: address_t, data#275: int_arr_ptr);

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_48.sol", 71, 5} {:message "ApproveAndCallFallBack::bug_unchk_send2"} bug_unchk_send2#291(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 71, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 69, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#292(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_48.sol", 82, 5} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#302(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#298: address_t, _to#300: address_t)
{
	
}

// 
// State variable: owner: address
var {:sourceloc "buggy_48.sol", 79, 5} {:message "owner"} owner#294: [address_t]address_t;
// 
// State variable: newOwner: address
var {:sourceloc "buggy_48.sol", 80, 5} {:message "newOwner"} newOwner#296: [address_t]address_t;
// 
// Function: bug_unchk_send18 : function ()
procedure {:sourceloc "buggy_48.sol", 84, 5} {:message "Owned::bug_unchk_send18"} bug_unchk_send18#315(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 84, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_48.sol", 85, 5} {:message "Owned::bug_unchk_send29"} bug_unchk_send29#328(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 85, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_48.sol", 86, 5} {:message "Owned::bug_unchk_send13"} bug_unchk_send13#341(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 86, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_48.sol", 87, 5} {:message "Owned::bug_unchk_send17"} bug_unchk_send17#354(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 87, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_48.sol", 88, 5} {:message "Owned::bug_unchk_send3"} bug_unchk_send3#367(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 88, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_48.sol", 89, 5} {:message "Owned::bug_unchk_send9"} bug_unchk_send9#380(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 89, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return18:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 91, 5} {:message "Owned::[constructor]"} __constructor#440(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#294 := owner#294[__this := 0];
	newOwner#296 := newOwner#296[__this := 0];
	// Function body starts here
	owner#294 := owner#294[__this := __msg_sender];
	$return19:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_48.sol", 100, 5} {:message "Owned::transferOwnership"} transferOwnership#412(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#402: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#294[__this]);
	// Function body starts here
	newOwner#296 := newOwner#296[__this := _newOwner#402];
	$return21:
	// Function body ends here
	$return20:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_48.sol", 104, 5} {:message "Owned::acceptOwnership"} acceptOwnership#439(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#296[__this]);
	assume {:sourceloc "buggy_48.sol", 106, 14} {:message ""} true;
	call OwnershipTransferred#302(__this, __msg_sender, __msg_value, owner#294[__this], newOwner#296[__this]);
	owner#294 := owner#294[__this := newOwner#296[__this]];
	newOwner#296 := newOwner#296[__this := 0];
	$return22:
	// Function body ends here
}

// 
// ------- Contract: QurasToken -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_48.sol", 120, 5} {:message "symbol"} symbol#449: [address_t]int_arr_type;
// 
// State variable: name: string storage ref
var {:sourceloc "buggy_48.sol", 121, 5} {:message "name"} name#451: [address_t]int_arr_type;
// 
// State variable: decimals: uint8
var {:sourceloc "buggy_48.sol", 122, 5} {:message "decimals"} decimals#453: [address_t]int;
// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_48.sol", 123, 5} {:message "_totalSupply"} _totalSupply#455: [address_t]int;
// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 124, 5} {:message "balances"} balances#459: [address_t][address_t]int;
// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_48.sol", 125, 5} {:message "allowed"} allowed#465: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_48.sol", 127, 5} {:message "QurasToken::bug_unchk_send6"} bug_unchk_send6#478(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 127, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_48.sol", 128, 5} {:message "QurasToken::bug_unchk_send16"} bug_unchk_send16#491(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 128, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_48.sol", 129, 5} {:message "QurasToken::bug_unchk_send24"} bug_unchk_send24#504(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 129, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_48.sol", 130, 5} {:message "QurasToken::bug_unchk_send5"} bug_unchk_send5#517(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 130, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_48.sol", 131, 5} {:message "QurasToken::bug_unchk_send15"} bug_unchk_send15#530(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 131, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_48.sol", 132, 5} {:message "QurasToken::bug_unchk_send28"} bug_unchk_send28#543(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 132, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_48.sol", 133, 5} {:message "QurasToken::bug_unchk_send25"} bug_unchk_send25#556(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 133, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return29:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_48.sol", 134, 5} {:message "QurasToken::bug_unchk_send19"} bug_unchk_send19#569(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 134, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_48.sol", 135, 5} {:message "QurasToken::bug_unchk_send26"} bug_unchk_send26#582(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 135, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return31:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_48.sol", 136, 5} {:message "QurasToken::bug_unchk_send20"} bug_unchk_send20#595(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 136, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_48.sol", 137, 5} {:message "QurasToken::bug_unchk_send32"} bug_unchk_send32#608(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 137, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return33:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_48.sol", 138, 5} {:message "QurasToken::bug_unchk_send4"} bug_unchk_send4#621(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 138, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_48.sol", 139, 5} {:message "QurasToken::bug_unchk_send7"} bug_unchk_send7#634(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#29 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 139, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#29);
	$return35:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_48.sol", 140, 5} {:message "QurasToken::bug_unchk_send23"} bug_unchk_send23#647(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 140, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#30);
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_48.sol", 141, 5} {:message "QurasToken::bug_unchk_send14"} bug_unchk_send14#660(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#31 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 141, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#31);
	$return37:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_48.sol", 142, 5} {:message "QurasToken::bug_unchk_send30"} bug_unchk_send30#673(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#32 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 142, 50} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#32);
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_48.sol", 143, 5} {:message "QurasToken::bug_unchk_send8"} bug_unchk_send8#686(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#33 := 1000000000000000000;
	assume {:sourceloc "buggy_48.sol", 143, 49} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#33);
	$return39:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 145, 5} {:message "QurasToken::[constructor]"} __constructor#1067(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#35: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	symbol#449 := symbol#449[__this := int_arr#constr(default_int_int(), 0)];
	name#451 := name#451[__this := int_arr#constr(default_int_int(), 0)];
	decimals#453 := decimals#453[__this := 0];
	_totalSupply#455 := _totalSupply#455[__this := 0];
	balances#459 := balances#459[__this := default_address_t_int()];
	allowed#465 := allowed#465[__this := default_address_t__k_address_t_v_int()];
	owner#294 := owner#294[__this := 0];
	newOwner#296 := newOwner#296[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#294 := owner#294[__this := __msg_sender];
	$return40:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#449 := symbol#449[__this := int_arr#constr(default_int_int()[0 := 88][1 := 81][2 := 67], 3)];
	name#451 := name#451[__this := int_arr#constr(default_int_int()[0 := 81][1 := 117][2 := 114][3 := 97][4 := 115][5 := 32][6 := 84][7 := 111][8 := 107][9 := 101][10 := 110], 11)];
	decimals#453 := decimals#453[__this := 8];
	_totalSupply#455 := _totalSupply#455[__this := 88888888800000000];
	balances#459 := balances#459[__this := balances#459[__this][owner#294[__this] := _totalSupply#455[__this]]];
	call_arg#35 := 0;
	assume {:sourceloc "buggy_48.sol", 151, 14} {:message ""} true;
	call Transfer#154(__this, __msg_sender, __msg_value, call_arg#35, owner#294[__this], _totalSupply#455[__this]);
	$return41:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 157, 5} {:message "QurasToken::totalSupply"} totalSupply#738(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#725: int)
{
	var sub#45_ret#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 158, 16} {:message ""} true;
	call sub#45_ret#36 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#455[__this], balances#459[__this][0]);
	#725 := sub#45_ret#36;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 164, 5} {:message "QurasToken::balanceOf"} balanceOf#751(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#740: address_t)
	returns (balance#744: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#744 := balances#459[__this][tokenOwner#740];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 173, 5} {:message "QurasToken::transfer"} transfer#795(__this: address_t, __msg_sender: address_t, __msg_value: int, to#753: address_t, tokens#755: int)
	returns (success#759: bool)
{
	var sub#45_ret#37: int;
	var add#23_ret#38: int;
	var call_arg#39: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 174, 32} {:message ""} true;
	call sub#45_ret#37 := sub#45(__this, __msg_sender, __msg_value, balances#459[__this][__msg_sender], tokens#755);
	balances#459 := balances#459[__this := balances#459[__this][__msg_sender := sub#45_ret#37]];
	assume {:sourceloc "buggy_48.sol", 175, 24} {:message ""} true;
	call add#23_ret#38 := add#23(__this, __msg_sender, __msg_value, balances#459[__this][to#753], tokens#755);
	balances#459 := balances#459[__this := balances#459[__this][to#753 := add#23_ret#38]];
	call_arg#39 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 176, 14} {:message ""} true;
	call Transfer#154(__this, __msg_sender, __msg_value, call_arg#39, to#753, tokens#755);
	success#759 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: increaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 180, 5} {:message "QurasToken::increaseApproval"} increaseApproval#836(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#797: address_t, _addedValue#799: int)
	returns (#802: bool)
{
	var add#23_ret#40: int;
	var call_arg#41: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 181, 41} {:message ""} true;
	call add#23_ret#40 := add#23(__this, __msg_sender, __msg_value, allowed#465[__this][__msg_sender][_spender#797], _addedValue#799);
	allowed#465 := allowed#465[__this := allowed#465[__this][__msg_sender := allowed#465[__this][__msg_sender][_spender#797 := add#23_ret#40]]];
	call_arg#41 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 182, 14} {:message ""} true;
	call Approval#162(__this, __msg_sender, __msg_value, call_arg#41, _spender#797, allowed#465[__this][__msg_sender][_spender#797]);
	#802 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: decreaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 186, 5} {:message "QurasToken::decreaseApproval"} decreaseApproval#896(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#838: address_t, _subtractedValue#840: int)
	returns (#843: bool)
{
	var {:sourceloc "buggy_48.sol", 187, 9} {:message "oldValue"} oldValue#846: int;
	var sub#45_ret#42: int;
	var call_arg#43: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	oldValue#846 := allowed#465[__this][__msg_sender][_spender#838];
	if ((_subtractedValue#840 > oldValue#846)) {
	allowed#465 := allowed#465[__this := allowed#465[__this][__msg_sender := allowed#465[__this][__msg_sender][_spender#838 := 0]]];
	}
	else {
	assume {:sourceloc "buggy_48.sol", 191, 45} {:message ""} true;
	call sub#45_ret#42 := sub#45(__this, __msg_sender, __msg_value, oldValue#846, _subtractedValue#840);
	allowed#465 := allowed#465[__this := allowed#465[__this][__msg_sender := allowed#465[__this][__msg_sender][_spender#838 := sub#45_ret#42]]];
	}

	call_arg#43 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 193, 14} {:message ""} true;
	call Approval#162(__this, __msg_sender, __msg_value, call_arg#43, _spender#838, allowed#465[__this][__msg_sender][_spender#838]);
	#843 := true;
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 205, 5} {:message "QurasToken::approve"} approve#925(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#898: address_t, tokens#900: int)
	returns (success#904: bool)
{
	var call_arg#44: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#465 := allowed#465[__this := allowed#465[__this][__msg_sender := allowed#465[__this][__msg_sender][spender#898 := tokens#900]]];
	call_arg#44 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 207, 14} {:message ""} true;
	call Approval#162(__this, __msg_sender, __msg_value, call_arg#44, spender#898, tokens#900);
	success#904 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 220, 5} {:message "QurasToken::transferFrom"} transferFrom#985(__this: address_t, __msg_sender: address_t, __msg_value: int, from#927: address_t, to#929: address_t, tokens#931: int)
	returns (success#935: bool)
{
	var sub#45_ret#45: int;
	var sub#45_ret#46: int;
	var add#23_ret#47: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 221, 26} {:message ""} true;
	call sub#45_ret#45 := sub#45(__this, __msg_sender, __msg_value, balances#459[__this][from#927], tokens#931);
	balances#459 := balances#459[__this := balances#459[__this][from#927 := sub#45_ret#45]];
	assume {:sourceloc "buggy_48.sol", 222, 37} {:message ""} true;
	call sub#45_ret#46 := sub#45(__this, __msg_sender, __msg_value, allowed#465[__this][from#927][__msg_sender], tokens#931);
	allowed#465 := allowed#465[__this := allowed#465[__this][from#927 := allowed#465[__this][from#927][__msg_sender := sub#45_ret#46]]];
	assume {:sourceloc "buggy_48.sol", 223, 24} {:message ""} true;
	call add#23_ret#47 := add#23(__this, __msg_sender, __msg_value, balances#459[__this][to#929], tokens#931);
	balances#459 := balances#459[__this := balances#459[__this][to#929 := add#23_ret#47]];
	assume {:sourceloc "buggy_48.sol", 224, 14} {:message ""} true;
	call Transfer#154(__this, __msg_sender, __msg_value, from#927, to#929, tokens#931);
	success#935 := true;
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 232, 5} {:message "QurasToken::allowance"} allowance#1002(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#987: address_t, spender#989: address_t)
	returns (remaining#993: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#993 := allowed#465[__this][tokenOwner#987][spender#989];
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_48.sol", 241, 5} {:message "QurasToken::approveAndCall"} approveAndCall#1046(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1004: address_t, tokens#1006: int, data#1008: int_arr_ptr)
	returns (success#1011: bool)
{
	var call_arg#48: address_t;
	var call_arg#49: address_t;
	// TCC assumptions
	assume (data#1008 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#465 := allowed#465[__this := allowed#465[__this][__msg_sender := allowed#465[__this][__msg_sender][spender#1004 := tokens#1006]]];
	call_arg#48 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 243, 14} {:message ""} true;
	call Approval#162(__this, __msg_sender, __msg_value, call_arg#48, spender#1004, tokens#1006);
	call_arg#49 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 244, 9} {:message ""} true;
	call receiveApproval#278(spender#1004, __this, 0, call_arg#49, tokens#1006, __this, data#1008);
	success#1011 := true;
	goto $return50;
	$return50:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 251, 5} {:message "QurasToken::transferAnyERC20Token"} transferAnyERC20Token#1066(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1048: address_t, tokens#1050: int)
	returns (success#1055: bool)
{
	var transfer#126_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#294[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 252, 16} {:message ""} true;
	call transfer#126_ret#52 := transfer#126(tokenAddress#1048, __this, 0, owner#294[__this], tokens#1050);
	success#1055 := transfer#126_ret#52;
	goto $return52;
	$return52:
	// Function body ends here
	$return51:
	// Inlined modifier onlyOwner ends here
}

