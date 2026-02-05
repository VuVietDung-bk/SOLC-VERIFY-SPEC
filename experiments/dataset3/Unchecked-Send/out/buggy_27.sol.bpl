// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_27.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_27.sol", 15, 3} {:message "[event] IERC20::Transfer"} Transfer#59(__this: address_t, __msg_sender: address_t, __msg_value: int, from#53: address_t, to#55: address_t, value#57: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_27.sol", 16, 3} {:message "[event] IERC20::Approval"} Approval#67(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#61: address_t, spender#63: address_t, value#65: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_27.sol", 8, 3} {:message "IERC20::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_27.sol", 9, 3} {:message "IERC20::balanceOf"} balanceOf#13(__this: address_t, __msg_sender: address_t, __msg_value: int, who#8: address_t)
	returns (#11: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_27.sol", 10, 3} {:message "IERC20::allowance"} allowance#22(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#15: address_t, spender#17: address_t)
	returns (#20: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_27.sol", 11, 3} {:message "IERC20::transfer"} transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_27.sol", 12, 3} {:message "IERC20::approve"} approve#40(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#33: address_t, value#35: int)
	returns (#38: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_27.sol", 13, 3} {:message "IERC20::transferFrom"} transferFrom#51(__this: address_t, __msg_sender: address_t, __msg_value: int, from#42: address_t, to#44: address_t, value#46: int)
	returns (#49: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_27.sol", 7, 1} {:message "IERC20::[implicit_constructor]"} __constructor#68(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 20, 3} {:message "SafeMath::mul"} mul#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#70: int, b#72: int)
	returns (#75: int)
{
	var {:sourceloc "buggy_27.sol", 24, 5} {:message "c"} c#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#70 == 0)) {
	#75 := 0;
	goto $return0;
	}

	c#85 := (a#70 * b#72);
	assert {:sourceloc "buggy_27.sol", 25, 5} {:message "Assertion might not hold."} ((c#85 div a#70) == b#72);
	#75 := c#85;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 29, 3} {:message "SafeMath::div"} div#119(__this: address_t, __msg_sender: address_t, __msg_value: int, a#103: int, b#105: int)
	returns (#108: int)
{
	var {:sourceloc "buggy_27.sol", 30, 5} {:message "c"} c#111: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#111 := (a#103 div b#105);
	#108 := c#111;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 34, 3} {:message "SafeMath::sub"} sub#139(__this: address_t, __msg_sender: address_t, __msg_value: int, a#121: int, b#123: int)
	returns (#126: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_27.sol", 35, 5} {:message "Assertion might not hold."} (b#123 <= a#121);
	#126 := (a#121 - b#123);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 39, 3} {:message "SafeMath::add"} add#163(__this: address_t, __msg_sender: address_t, __msg_value: int, a#141: int, b#143: int)
	returns (#146: int)
{
	var {:sourceloc "buggy_27.sol", 40, 5} {:message "c"} c#149: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#149 := (a#141 + b#143);
	assert {:sourceloc "buggy_27.sol", 41, 5} {:message "Assertion might not hold."} (c#149 >= a#141);
	#146 := c#149;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 45, 3} {:message "SafeMath::ceil"} ceil#195(__this: address_t, __msg_sender: address_t, __msg_value: int, a#165: int, m#167: int)
	returns (#170: int)
{
	var {:sourceloc "buggy_27.sol", 46, 5} {:message "c"} c#173: int;
	var add#163_ret#0: int;
	var {:sourceloc "buggy_27.sol", 47, 5} {:message "d"} d#180: int;
	var call_arg#1: int;
	var sub#139_ret#2: int;
	var div#119_ret#3: int;
	var mul#101_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 46, 17} {:message ""} true;
	call add#163_ret#0 := add#163(__this, __msg_sender, __msg_value, a#165, m#167);
	c#173 := add#163_ret#0;
	call_arg#1 := 1;
	assume {:sourceloc "buggy_27.sol", 47, 17} {:message ""} true;
	call sub#139_ret#2 := sub#139(__this, __msg_sender, __msg_value, c#173, call_arg#1);
	d#180 := sub#139_ret#2;
	assume {:sourceloc "buggy_27.sol", 48, 16} {:message ""} true;
	call div#119_ret#3 := div#119(__this, __msg_sender, __msg_value, d#180, m#167);
	assume {:sourceloc "buggy_27.sol", 48, 12} {:message ""} true;
	call mul#101_ret#4 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#3, m#167);
	#170 := mul#101_ret#4;
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_27.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_27.sol", 56, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#217(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#213: address_t, newOwner#215: address_t)
{
	
}

// 
// State variable: owner: address
var {:sourceloc "buggy_27.sol", 53, 5} {:message "owner"} owner#198: [address_t]address_t;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_27.sol", 54, 3} {:message "Ownable::bug_unchk_send30"} bug_unchk_send30#211(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 55, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 59, 3} {:message "Ownable::[constructor]"} __constructor#290(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#198 := owner#198[__this := 0];
	// Function body starts here
	owner#198 := owner#198[__this := __msg_sender];
	$return6:
	// Function body ends here
}

// 
// Function: bug_unchk_send18 : function ()
procedure {:sourceloc "buggy_27.sol", 62, 1} {:message "Ownable::bug_unchk_send18"} bug_unchk_send18#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 63, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return7:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_27.sol", 72, 5} {:message "Ownable::transferOwnership"} transferOwnership#276(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#252: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume (newOwner#252 != 0);
	assume {:sourceloc "buggy_27.sol", 74, 12} {:message ""} true;
	call OwnershipTransferred#217(__this, __msg_sender, __msg_value, owner#198[__this], newOwner#252);
	owner#198 := owner#198[__this := newOwner#252];
	$return9:
	// Function body ends here
	$return8:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_27.sol", 77, 1} {:message "Ownable::bug_unchk_send29"} bug_unchk_send29#289(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 78, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return10:
	// Function body ends here
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_27.sol", 85, 3} {:message "_name"} _name#294: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_27.sol", 86, 3} {:message "_symbol"} _symbol#296: [address_t]int_arr_type;
// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_27.sol", 87, 3} {:message "_decimals"} _decimals#298: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 89, 3} {:message "ERC20Detailed::[constructor]"} __constructor#397(__this: address_t, __msg_sender: address_t, __msg_value: int, name#300: int_arr_ptr, symbol#302: int_arr_ptr, decimals#304: int)
{
	// TCC assumptions
	assume (name#300 < __alloc_counter);
	assume (symbol#302 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#294 := _name#294[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#296 := _symbol#296[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#298 := _decimals#298[__this := 0];
	// Function body starts here
	_name#294 := _name#294[__this := mem_arr_int[name#300]];
	_symbol#296 := _symbol#296[__this := mem_arr_int[symbol#302]];
	_decimals#298 := _decimals#298[__this := decimals#304];
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_27.sol", 94, 1} {:message "ERC20Detailed::bug_unchk_send6"} bug_unchk_send6#333(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 95, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return12:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 97, 3} {:message "ERC20Detailed::name"} name#341(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#336: int_arr_ptr)
{
	var new_array#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#336 := new_array#11;
	mem_arr_int := mem_arr_int[#336 := _name#294[__this]];
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_27.sol", 100, 1} {:message "ERC20Detailed::bug_unchk_send16"} bug_unchk_send16#354(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 101, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return14:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 103, 3} {:message "ERC20Detailed::symbol"} symbol#362(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#357: int_arr_ptr)
{
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#357 := new_array#13;
	mem_arr_int := mem_arr_int[#357 := _symbol#296[__this]];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_27.sol", 106, 1} {:message "ERC20Detailed::bug_unchk_send24"} bug_unchk_send24#375(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 107, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return16:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_27.sol", 109, 3} {:message "ERC20Detailed::decimals"} decimals#383(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#378: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#378 := _decimals#298[__this];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_27.sol", 112, 1} {:message "ERC20Detailed::bug_unchk_send5"} bug_unchk_send5#396(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 113, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return18:
	// Function body ends here
}

// 
// ------- Contract: DanPanCoin -------
// Inherits from: ERC20Detailed
// Inherits from: Ownable
// 
// Event: DanPanPercentChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 131, 3} {:message "[event] DanPanCoin::DanPanPercentChanged"} DanPanPercentChanged#455(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPanPercent#451: int, newDanPanPercent#453: int)
{
	
}

// 
// Event: DanPanAddressChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 134, 3} {:message "[event] DanPanCoin::DanPanAddressChanged"} DanPanAddressChanged#474(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPan#470: address_t, newDanPan#472: address_t)
{
	
}

// 
// Event: WhitelistFrom
procedure {:inline 1} {:sourceloc "buggy_27.sol", 137, 3} {:message "[event] DanPanCoin::WhitelistFrom"} WhitelistFrom#493(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#489: address_t, _whitelisted#491: bool)
{
	
}

// 
// Event: WhitelistTo
procedure {:inline 1} {:sourceloc "buggy_27.sol", 140, 3} {:message "[event] DanPanCoin::WhitelistTo"} WhitelistTo#512(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#508: address_t, _whitelisted#510: bool)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 119, 3} {:message "_balances"} _balances#408: [address_t][address_t]int;
// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_27.sol", 120, 3} {:message "_allowed"} _allowed#414: [address_t][address_t][address_t]int;
// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_27.sol", 125, 3} {:message "_totalSupply"} _totalSupply#426: [address_t]int;
// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_27.sol", 126, 3} {:message "basePercent"} basePercent#429: [address_t]int;
// 
// State variable: dpPercent: uint256
var {:sourceloc "buggy_27.sol", 127, 3} {:message "dpPercent"} dpPercent#432: [address_t]int;
// 
// State variable: DanPanAddress: address
var {:sourceloc "buggy_27.sol", 128, 3} {:message "DanPanAddress"} DanPanAddress#436: [address_t]address_t;
// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_27.sol", 129, 1} {:message "DanPanCoin::bug_unchk_send8"} bug_unchk_send8#449(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 130, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_27.sol", 132, 1} {:message "DanPanCoin::bug_unchk_send27"} bug_unchk_send27#468(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 133, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_27.sol", 135, 1} {:message "DanPanCoin::bug_unchk_send31"} bug_unchk_send31#487(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 136, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_27.sol", 138, 1} {:message "DanPanCoin::bug_unchk_send13"} bug_unchk_send13#506(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 139, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return22:
	// Function body ends here
}

// 
// State variable: whitelistFrom: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 143, 5} {:message "whitelistFrom"} whitelistFrom#516: [address_t][address_t]bool;
// 
// State variable: whitelistTo: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 144, 5} {:message "whitelistTo"} whitelistTo#520: [address_t][address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 146, 3} {:message "DanPanCoin::[constructor]"} __constructor#1674(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#522: int_arr_ptr, _symbol#524: int_arr_ptr, _decimals#526: int)
{
	var name#300#21: int_arr_ptr;
	var symbol#302#21: int_arr_ptr;
	var decimals#304#21: int;
	var call_arg#23: address_t;
	// TCC assumptions
	assume (_name#522 < __alloc_counter);
	assume (_symbol#524 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#408 := _balances#408[__this := default_address_t_int()];
	_allowed#414 := _allowed#414[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#426 := _totalSupply#426[__this := 10000000000];
	basePercent#429 := basePercent#429[__this := 100];
	dpPercent#432 := dpPercent#432[__this := 5];
	DanPanAddress#436 := DanPanAddress#436[__this := __msg_sender];
	whitelistFrom#516 := whitelistFrom#516[__this := default_address_t_bool()];
	whitelistTo#520 := whitelistTo#520[__this := default_address_t_bool()];
	owner#198 := owner#198[__this := 0];
	_name#294 := _name#294[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#296 := _symbol#296[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#298 := _decimals#298[__this := 0];
	// Arguments for Ownable
	// Arguments for ERC20Detailed
	name#300#21 := _name#522;
	symbol#302#21 := _symbol#524;
	decimals#304#21 := _decimals#526;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#294 := _name#294[__this := mem_arr_int[name#300#21]];
	_symbol#296 := _symbol#296[__this := mem_arr_int[symbol#302#21]];
	_decimals#298 := _decimals#298[__this := decimals#304#21];
	$return23:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#198 := owner#198[__this := __msg_sender];
	$return24:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 147, 5} {:message ""} true;
	call _mint#1351(__this, __msg_sender, __msg_value, call_arg#23, _totalSupply#426[__this]);
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_27.sol", 149, 1} {:message "DanPanCoin::bug_unchk_send15"} bug_unchk_send15#554(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 150, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return26:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 152, 3} {:message "DanPanCoin::totalSupply"} totalSupply#563(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#558: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#558 := _totalSupply#426[__this];
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_27.sol", 155, 1} {:message "DanPanCoin::bug_unchk_send28"} bug_unchk_send28#576(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 156, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return28:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 158, 3} {:message "DanPanCoin::balanceOf"} balanceOf#589(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#578: address_t)
	returns (#582: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#582 := _balances#408[__this][owner#578];
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_27.sol", 161, 1} {:message "DanPanCoin::bug_unchk_send21"} bug_unchk_send21#602(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 162, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return30:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 164, 3} {:message "DanPanCoin::allowance"} allowance#619(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#604: address_t, spender#606: address_t)
	returns (#610: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#610 := _allowed#414[__this][owner#604][spender#606];
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_27.sol", 167, 1} {:message "DanPanCoin::bug_unchk_send10"} bug_unchk_send10#632(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 168, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return32:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 170, 3} {:message "DanPanCoin::findOnePercent"} findOnePercent#659(__this: address_t, __msg_sender: address_t, __msg_value: int, value#634: int)
	returns (#637: int)
{
	var {:sourceloc "buggy_27.sol", 171, 5} {:message "roundValue"} roundValue#640: int;
	var ceil#195_ret#28: int;
	var {:sourceloc "buggy_27.sol", 172, 5} {:message "onePercent"} onePercent#647: int;
	var mul#101_ret#29: int;
	var call_arg#30: int;
	var div#119_ret#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 171, 26} {:message ""} true;
	call ceil#195_ret#28 := ceil#195(__this, __msg_sender, __msg_value, value#634, basePercent#429[__this]);
	roundValue#640 := ceil#195_ret#28;
	assume {:sourceloc "buggy_27.sol", 172, 26} {:message ""} true;
	call mul#101_ret#29 := mul#101(__this, __msg_sender, __msg_value, roundValue#640, basePercent#429[__this]);
	call_arg#30 := 10000;
	assume {:sourceloc "buggy_27.sol", 172, 26} {:message ""} true;
	call div#119_ret#31 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#29, call_arg#30);
	onePercent#647 := div#119_ret#31;
	#637 := onePercent#647;
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_27.sol", 175, 1} {:message "DanPanCoin::bug_unchk_send22"} bug_unchk_send22#672(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#32 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 176, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#32);
	$return34:
	// Function body ends here
}

// 
// Function: findDPPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 177, 3} {:message "DanPanCoin::findDPPercent"} findDPPercent#702(__this: address_t, __msg_sender: address_t, __msg_value: int, value#674: int)
	returns (#677: int)
{
	var {:sourceloc "buggy_27.sol", 178, 5} {:message "roundValue"} roundValue#680: int;
	var ceil#195_ret#33: int;
	var {:sourceloc "buggy_27.sol", 179, 5} {:message "DPPercent"} DPPercent#687: int;
	var mul#101_ret#34: int;
	var call_arg#35: int;
	var div#119_ret#36: int;
	var mul#101_ret#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 178, 26} {:message ""} true;
	call ceil#195_ret#33 := ceil#195(__this, __msg_sender, __msg_value, value#674, basePercent#429[__this]);
	roundValue#680 := ceil#195_ret#33;
	assume {:sourceloc "buggy_27.sol", 179, 25} {:message ""} true;
	call mul#101_ret#34 := mul#101(__this, __msg_sender, __msg_value, roundValue#680, basePercent#429[__this]);
	call_arg#35 := 10000;
	assume {:sourceloc "buggy_27.sol", 179, 25} {:message ""} true;
	call div#119_ret#36 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#34, call_arg#35);
	assume {:sourceloc "buggy_27.sol", 179, 25} {:message ""} true;
	call mul#101_ret#37 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#36, dpPercent#432[__this]);
	DPPercent#687 := mul#101_ret#37;
	#677 := DPPercent#687;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_27.sol", 182, 1} {:message "DanPanCoin::bug_unchk_send12"} bug_unchk_send12#715(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 183, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#38);
	$return36:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 185, 3} {:message "DanPanCoin::transfer"} transfer#880(__this: address_t, __msg_sender: address_t, __msg_value: int, to#717: address_t, value#719: int)
	returns (#723: bool)
{
	var call_arg#39: address_t;
	var call_arg#40: int;
	var {:sourceloc "buggy_27.sol", 200, 9} {:message "tokensToTransfer"} tokensToTransfer#758: int;
	var {:sourceloc "buggy_27.sol", 201, 9} {:message "tokensToBurn"} tokensToBurn#762: int;
	var {:sourceloc "buggy_27.sol", 202, 9} {:message "tokensToDanPan"} tokensToDanPan#766: int;
	var sub#139_ret#41: int;
	var call_arg#42: address_t;
	var _isWhitelisted#1592_ret#43: bool;
	var findOnePercent#659_ret#44: int;
	var findDPPercent#702_ret#45: int;
	var sub#139_ret#46: int;
	var sub#139_ret#47: int;
	var sub#139_ret#48: int;
	var call_arg#49: address_t;
	var call_arg#50: address_t;
	var add#163_ret#51: int;
	var call_arg#52: address_t;
	var add#163_ret#53: int;
	var add#163_ret#54: int;
	var add#163_ret#55: int;
	var call_arg#56: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#719 <= _balances#408[__this][__msg_sender]);
	assume (to#717 != 0);
	if ((value#719 == 0)) {
	call_arg#39 := __msg_sender;
	call_arg#40 := 0;
	assume {:sourceloc "buggy_27.sol", 192, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#39, to#717, call_arg#40);
	#723 := true;
	goto $return37;
	}

	tokensToTransfer#758 := value#719;
	tokensToBurn#762 := 0;
	tokensToDanPan#766 := 0;
	assume {:sourceloc "buggy_27.sol", 206, 33} {:message ""} true;
	call sub#139_ret#41 := sub#139(__this, __msg_sender, __msg_value, _balances#408[__this][__msg_sender], value#719);
	_balances#408 := _balances#408[__this := _balances#408[__this][__msg_sender := sub#139_ret#41]];
	call_arg#42 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 210, 14} {:message ""} true;
	call _isWhitelisted#1592_ret#43 := _isWhitelisted#1592(__this, __msg_sender, __msg_value, call_arg#42, to#717);
	if (!(_isWhitelisted#1592_ret#43)) {
	assume {:sourceloc "buggy_27.sol", 212, 30} {:message ""} true;
	call findOnePercent#659_ret#44 := findOnePercent#659(__this, __msg_sender, __msg_value, value#719);
	tokensToBurn#762 := findOnePercent#659_ret#44;
	assume {:sourceloc "buggy_27.sol", 213, 32} {:message ""} true;
	call findDPPercent#702_ret#45 := findDPPercent#702(__this, __msg_sender, __msg_value, value#719);
	tokensToDanPan#766 := findDPPercent#702_ret#45;
	assume {:sourceloc "buggy_27.sol", 216, 33} {:message ""} true;
	call sub#139_ret#46 := sub#139(__this, __msg_sender, __msg_value, value#719, tokensToBurn#762);
	assume {:sourceloc "buggy_27.sol", 216, 33} {:message ""} true;
	call sub#139_ret#47 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#46, tokensToDanPan#766);
	tokensToTransfer#758 := sub#139_ret#47;
	assume {:sourceloc "buggy_27.sol", 219, 28} {:message ""} true;
	call sub#139_ret#48 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#426[__this], tokensToBurn#762);
	_totalSupply#426 := _totalSupply#426[__this := sub#139_ret#48];
	call_arg#49 := __msg_sender;
	call_arg#50 := 0;
	assume {:sourceloc "buggy_27.sol", 220, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#49, call_arg#50, tokensToBurn#762);
	assume {:sourceloc "buggy_27.sol", 224, 40} {:message ""} true;
	call add#163_ret#51 := add#163(__this, __msg_sender, __msg_value, _balances#408[__this][DanPanAddress#436[__this]], tokensToDanPan#766);
	_balances#408 := _balances#408[__this := _balances#408[__this][DanPanAddress#436[__this] := add#163_ret#51]];
	call_arg#52 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 225, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#52, DanPanAddress#436[__this], tokensToDanPan#766);
	}

	assume {:sourceloc "buggy_27.sol", 231, 16} {:message ""} true;
	call add#163_ret#53 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#762, tokensToTransfer#758);
	assume {:sourceloc "buggy_27.sol", 231, 16} {:message ""} true;
	call add#163_ret#54 := add#163(__this, __msg_sender, __msg_value, add#163_ret#53, tokensToDanPan#766);
	assert {:sourceloc "buggy_27.sol", 231, 9} {:message "Assertion might not hold."} (add#163_ret#54 == value#719);
	assume {:sourceloc "buggy_27.sol", 234, 25} {:message ""} true;
	call add#163_ret#55 := add#163(__this, __msg_sender, __msg_value, _balances#408[__this][to#717], tokensToTransfer#758);
	_balances#408 := _balances#408[__this := _balances#408[__this][to#717 := add#163_ret#55]];
	call_arg#56 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 235, 14} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#56, to#717, tokensToTransfer#758);
	#723 := true;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_27.sol", 241, 1} {:message "DanPanCoin::bug_unchk_send11"} bug_unchk_send11#893(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#57: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#57 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 242, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#57);
	$return38:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_27.sol", 244, 3} {:message "DanPanCoin::multiTransfer"} multiTransfer#925(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#896: address_t_arr_ptr, amounts#899: int_arr_ptr)
{
	var {:sourceloc "buggy_27.sol", 245, 10} {:message "i"} i#903: int;
	var transfer#880_ret#60: bool;
	var tmp#61: int;
	// TCC assumptions
	assume (receivers#896 < __alloc_counter);
	assume (amounts#899 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#903 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#896])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#896]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#903 < length#address_t_arr#constr(mem_arr_address_t[receivers#896]))) {
	// Body
	assume {:sourceloc "buggy_27.sol", 246, 7} {:message ""} true;
	call transfer#880_ret#60 := transfer#880(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#896])[i#903], arr#int_arr#constr(mem_arr_int[amounts#899])[i#903]);
	$continue58:
	// Loop expression
	tmp#61 := i#903;
	i#903 := (i#903 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#896])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#896]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break59:
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_27.sol", 249, 1} {:message "DanPanCoin::bug_unchk_send1"} bug_unchk_send1#938(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#62: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#62 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 250, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#62);
	$return40:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 252, 3} {:message "DanPanCoin::approve"} approve#976(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#940: address_t, value#942: int)
	returns (#946: bool)
{
	var call_arg#63: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#940 != 0);
	_allowed#414 := _allowed#414[__this := _allowed#414[__this][__msg_sender := _allowed#414[__this][__msg_sender][spender#940 := value#942]]];
	call_arg#63 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 255, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#63, spender#940, value#942);
	#946 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_27.sol", 258, 1} {:message "DanPanCoin::bug_unchk_send2"} bug_unchk_send2#989(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#64: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#64 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 259, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#64);
	$return42:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 261, 2} {:message "DanPanCoin::transferFrom"} transferFrom#1176(__this: address_t, __msg_sender: address_t, __msg_value: int, from#991: address_t, to#993: address_t, value#995: int)
	returns (#999: bool)
{
	var call_arg#65: int;
	var {:sourceloc "buggy_27.sol", 275, 9} {:message "tokensToTransfer"} tokensToTransfer#1043: int;
	var {:sourceloc "buggy_27.sol", 276, 9} {:message "tokensToBurn"} tokensToBurn#1047: int;
	var {:sourceloc "buggy_27.sol", 277, 9} {:message "tokensToDanPan"} tokensToDanPan#1051: int;
	var sub#139_ret#66: int;
	var _isWhitelisted#1592_ret#67: bool;
	var findOnePercent#659_ret#68: int;
	var findDPPercent#702_ret#69: int;
	var sub#139_ret#70: int;
	var sub#139_ret#71: int;
	var sub#139_ret#72: int;
	var call_arg#73: address_t;
	var add#163_ret#74: int;
	var add#163_ret#75: int;
	var add#163_ret#76: int;
	var add#163_ret#77: int;
	var sub#139_ret#78: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#995 <= _balances#408[__this][from#991]);
	assume (value#995 <= _allowed#414[__this][from#991][__msg_sender]);
	assume (to#993 != 0);
	if ((value#995 == 0)) {
	call_arg#65 := 0;
	assume {:sourceloc "buggy_27.sol", 269, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#991, to#993, call_arg#65);
	#999 := true;
	goto $return43;
	}

	tokensToTransfer#1043 := value#995;
	tokensToBurn#1047 := 0;
	tokensToDanPan#1051 := 0;
	assume {:sourceloc "buggy_27.sol", 280, 27} {:message ""} true;
	call sub#139_ret#66 := sub#139(__this, __msg_sender, __msg_value, _balances#408[__this][from#991], value#995);
	_balances#408 := _balances#408[__this := _balances#408[__this][from#991 := sub#139_ret#66]];
	assume {:sourceloc "buggy_27.sol", 284, 14} {:message ""} true;
	call _isWhitelisted#1592_ret#67 := _isWhitelisted#1592(__this, __msg_sender, __msg_value, from#991, to#993);
	if (!(_isWhitelisted#1592_ret#67)) {
	assume {:sourceloc "buggy_27.sol", 286, 30} {:message ""} true;
	call findOnePercent#659_ret#68 := findOnePercent#659(__this, __msg_sender, __msg_value, value#995);
	tokensToBurn#1047 := findOnePercent#659_ret#68;
	assume {:sourceloc "buggy_27.sol", 287, 32} {:message ""} true;
	call findDPPercent#702_ret#69 := findDPPercent#702(__this, __msg_sender, __msg_value, value#995);
	tokensToDanPan#1051 := findDPPercent#702_ret#69;
	assume {:sourceloc "buggy_27.sol", 290, 33} {:message ""} true;
	call sub#139_ret#70 := sub#139(__this, __msg_sender, __msg_value, value#995, tokensToBurn#1047);
	assume {:sourceloc "buggy_27.sol", 290, 33} {:message ""} true;
	call sub#139_ret#71 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#70, tokensToDanPan#1051);
	tokensToTransfer#1043 := sub#139_ret#71;
	assume {:sourceloc "buggy_27.sol", 293, 28} {:message ""} true;
	call sub#139_ret#72 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#426[__this], tokensToBurn#1047);
	_totalSupply#426 := _totalSupply#426[__this := sub#139_ret#72];
	call_arg#73 := 0;
	assume {:sourceloc "buggy_27.sol", 294, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#991, call_arg#73, tokensToBurn#1047);
	assume {:sourceloc "buggy_27.sol", 298, 40} {:message ""} true;
	call add#163_ret#74 := add#163(__this, __msg_sender, __msg_value, _balances#408[__this][DanPanAddress#436[__this]], tokensToDanPan#1051);
	_balances#408 := _balances#408[__this := _balances#408[__this][DanPanAddress#436[__this] := add#163_ret#74]];
	assume {:sourceloc "buggy_27.sol", 299, 17} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#991, DanPanAddress#436[__this], tokensToDanPan#1051);
	}

	assume {:sourceloc "buggy_27.sol", 305, 16} {:message ""} true;
	call add#163_ret#75 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#1047, tokensToTransfer#1043);
	assume {:sourceloc "buggy_27.sol", 305, 16} {:message ""} true;
	call add#163_ret#76 := add#163(__this, __msg_sender, __msg_value, add#163_ret#75, tokensToDanPan#1051);
	assert {:sourceloc "buggy_27.sol", 305, 9} {:message "Assertion might not hold."} (add#163_ret#76 == value#995);
	assume {:sourceloc "buggy_27.sol", 308, 25} {:message ""} true;
	call add#163_ret#77 := add#163(__this, __msg_sender, __msg_value, _balances#408[__this][to#993], tokensToTransfer#1043);
	_balances#408 := _balances#408[__this := _balances#408[__this][to#993 := add#163_ret#77]];
	assume {:sourceloc "buggy_27.sol", 309, 31} {:message ""} true;
	call sub#139_ret#78 := sub#139(__this, __msg_sender, __msg_value, _allowed#414[__this][from#991][__msg_sender], value#995);
	_allowed#414 := _allowed#414[__this := _allowed#414[__this][from#991 := _allowed#414[__this][from#991][__msg_sender := sub#139_ret#78]]];
	assume {:sourceloc "buggy_27.sol", 310, 14} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#991, to#993, tokensToTransfer#1043);
	#999 := true;
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_27.sol", 316, 1} {:message "DanPanCoin::bug_unchk_send17"} bug_unchk_send17#1189(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#79: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#79 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 317, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#79);
	$return44:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 319, 3} {:message "DanPanCoin::increaseAllowance"} increaseAllowance#1240(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1191: address_t, addedValue#1193: int)
	returns (#1196: bool)
{
	var add#163_ret#80: int;
	var call_arg#81: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1191 != 0);
	assume {:sourceloc "buggy_27.sol", 321, 38} {:message ""} true;
	call add#163_ret#80 := add#163(__this, __msg_sender, __msg_value, _allowed#414[__this][__msg_sender][spender#1191], addedValue#1193);
	_allowed#414 := _allowed#414[__this := _allowed#414[__this][__msg_sender := _allowed#414[__this][__msg_sender][spender#1191 := add#163_ret#80]]];
	call_arg#81 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 322, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#81, spender#1191, _allowed#414[__this][__msg_sender][spender#1191]);
	#1196 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_27.sol", 325, 1} {:message "DanPanCoin::bug_unchk_send3"} bug_unchk_send3#1253(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#82: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#82 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 326, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#82);
	$return46:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 328, 3} {:message "DanPanCoin::decreaseAllowance"} decreaseAllowance#1304(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1255: address_t, subtractedValue#1257: int)
	returns (#1260: bool)
{
	var sub#139_ret#83: int;
	var call_arg#84: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1255 != 0);
	assume {:sourceloc "buggy_27.sol", 330, 38} {:message ""} true;
	call sub#139_ret#83 := sub#139(__this, __msg_sender, __msg_value, _allowed#414[__this][__msg_sender][spender#1255], subtractedValue#1257);
	_allowed#414 := _allowed#414[__this := _allowed#414[__this][__msg_sender := _allowed#414[__this][__msg_sender][spender#1255 := sub#139_ret#83]]];
	call_arg#84 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 331, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#84, spender#1255, _allowed#414[__this][__msg_sender][spender#1255]);
	#1260 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_27.sol", 334, 1} {:message "DanPanCoin::bug_unchk_send9"} bug_unchk_send9#1317(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#85 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 335, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#85);
	$return48:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 337, 3} {:message "DanPanCoin::_mint"} _mint#1351(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1319: address_t, amount#1321: int)
{
	var add#163_ret#86: int;
	var call_arg#87: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1321 != 0);
	assume {:sourceloc "buggy_27.sol", 339, 26} {:message ""} true;
	call add#163_ret#86 := add#163(__this, __msg_sender, __msg_value, _balances#408[__this][account#1319], amount#1321);
	_balances#408 := _balances#408[__this := _balances#408[__this][account#1319 := add#163_ret#86]];
	call_arg#87 := 0;
	assume {:sourceloc "buggy_27.sol", 340, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#87, account#1319, amount#1321);
	$return49:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_27.sol", 342, 1} {:message "DanPanCoin::bug_unchk_send25"} bug_unchk_send25#1364(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#88: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#88 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 343, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#88);
	$return50:
	// Function body ends here
}

// 
// Function: burn
procedure {:sourceloc "buggy_27.sol", 345, 3} {:message "DanPanCoin::burn"} burn#1376(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1366: int)
{
	var call_arg#89: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#89 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 346, 5} {:message ""} true;
	call _burn#1438(__this, __msg_sender, __msg_value, call_arg#89, amount#1366);
	$return51:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_27.sol", 348, 1} {:message "DanPanCoin::bug_unchk_send19"} bug_unchk_send19#1389(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#90: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#90 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 349, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#90);
	$return52:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 351, 3} {:message "DanPanCoin::_burn"} _burn#1438(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1391: address_t, amount#1393: int)
{
	var sub#139_ret#91: int;
	var sub#139_ret#92: int;
	var call_arg#93: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1393 != 0);
	assume (amount#1393 <= _balances#408[__this][account#1391]);
	assume {:sourceloc "buggy_27.sol", 354, 20} {:message ""} true;
	call sub#139_ret#91 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#426[__this], amount#1393);
	_totalSupply#426 := _totalSupply#426[__this := sub#139_ret#91];
	assume {:sourceloc "buggy_27.sol", 355, 26} {:message ""} true;
	call sub#139_ret#92 := sub#139(__this, __msg_sender, __msg_value, _balances#408[__this][account#1391], amount#1393);
	_balances#408 := _balances#408[__this := _balances#408[__this][account#1391 := sub#139_ret#92]];
	call_arg#93 := 0;
	assume {:sourceloc "buggy_27.sol", 356, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, account#1391, call_arg#93, amount#1393);
	$return53:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_27.sol", 358, 1} {:message "DanPanCoin::bug_unchk_send26"} bug_unchk_send26#1451(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#94: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#94 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 359, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#94);
	$return54:
	// Function body ends here
}

// 
// Function: burnFrom
procedure {:sourceloc "buggy_27.sol", 361, 3} {:message "DanPanCoin::burnFrom"} burnFrom#1492(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1453: address_t, amount#1455: int)
{
	var sub#139_ret#95: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1455 <= _allowed#414[__this][account#1453][__msg_sender]);
	assume {:sourceloc "buggy_27.sol", 363, 37} {:message ""} true;
	call sub#139_ret#95 := sub#139(__this, __msg_sender, __msg_value, _allowed#414[__this][account#1453][__msg_sender], amount#1455);
	_allowed#414 := _allowed#414[__this := _allowed#414[__this][account#1453 := _allowed#414[__this][account#1453][__msg_sender := sub#139_ret#95]]];
	assume {:sourceloc "buggy_27.sol", 364, 5} {:message ""} true;
	call _burn#1438(__this, __msg_sender, __msg_value, account#1453, amount#1455);
	$return55:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_27.sol", 366, 1} {:message "DanPanCoin::bug_unchk_send20"} bug_unchk_send20#1505(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#96: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#96 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 367, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#96);
	$return56:
	// Function body ends here
}

// 
// Function: NewDanPanAddress
procedure {:sourceloc "buggy_27.sol", 369, 3} {:message "DanPanCoin::NewDanPanAddress"} NewDanPanAddress#1531(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanaddress#1507: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume (newDanPanaddress#1507 != 0);
	assume {:sourceloc "buggy_27.sol", 371, 12} {:message ""} true;
	call DanPanAddressChanged#474(__this, __msg_sender, __msg_value, DanPanAddress#436[__this], newDanPanaddress#1507);
	DanPanAddress#436 := DanPanAddress#436[__this := newDanPanaddress#1507];
	$return58:
	// Function body ends here
	$return57:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_27.sol", 374, 1} {:message "DanPanCoin::bug_unchk_send32"} bug_unchk_send32#1544(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#99: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#99 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 375, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#99);
	$return59:
	// Function body ends here
}

// 
// Function: NewDanPanPercent
procedure {:sourceloc "buggy_27.sol", 377, 3} {:message "DanPanCoin::NewDanPanPercent"} NewDanPanPercent#1561(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanpercent#1546: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 378, 12} {:message ""} true;
	call DanPanPercentChanged#455(__this, __msg_sender, __msg_value, dpPercent#432[__this], newDanPanpercent#1546);
	dpPercent#432 := dpPercent#432[__this := newDanPanpercent#1546];
	$return61:
	// Function body ends here
	$return60:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_27.sol", 381, 1} {:message "DanPanCoin::bug_unchk_send4"} bug_unchk_send4#1574(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#102: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#102 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 382, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#102);
	$return62:
	// Function body ends here
}

// 
// Function: _isWhitelisted : function (address,address) view returns (bool)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 384, 3} {:message "DanPanCoin::_isWhitelisted"} _isWhitelisted#1592(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1576: address_t, _to#1578: address_t)
	returns (#1581: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1581 := (whitelistFrom#516[__this][_from#1576] || whitelistTo#520[__this][_to#1578]);
	goto $return63;
	$return63:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_27.sol", 388, 1} {:message "DanPanCoin::bug_unchk_send7"} bug_unchk_send7#1605(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#103: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#103 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 389, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#103);
	$return64:
	// Function body ends here
}

// 
// Function: setWhitelistedTo
procedure {:sourceloc "buggy_27.sol", 391, 5} {:message "DanPanCoin::setWhitelistedTo"} setWhitelistedTo#1626(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#1607: address_t, _whitelisted#1609: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 392, 14} {:message ""} true;
	call WhitelistTo#512(__this, __msg_sender, __msg_value, _addr#1607, _whitelisted#1609);
	whitelistTo#520 := whitelistTo#520[__this := whitelistTo#520[__this][_addr#1607 := _whitelisted#1609]];
	$return66:
	// Function body ends here
	$return65:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_27.sol", 395, 1} {:message "DanPanCoin::bug_unchk_send23"} bug_unchk_send23#1639(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#106: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#106 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 396, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#106);
	$return67:
	// Function body ends here
}

// 
// Function: setWhitelistedFrom
procedure {:sourceloc "buggy_27.sol", 398, 5} {:message "DanPanCoin::setWhitelistedFrom"} setWhitelistedFrom#1660(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#1641: address_t, _whitelisted#1643: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 399, 14} {:message ""} true;
	call WhitelistFrom#493(__this, __msg_sender, __msg_value, _addr#1641, _whitelisted#1643);
	whitelistFrom#516 := whitelistFrom#516[__this := whitelistFrom#516[__this][_addr#1641 := _whitelisted#1643]];
	$return69:
	// Function body ends here
	$return68:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_27.sol", 402, 1} {:message "DanPanCoin::bug_unchk_send14"} bug_unchk_send14#1673(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#109: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#109 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 403, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#109);
	$return70:
	// Function body ends here
}

