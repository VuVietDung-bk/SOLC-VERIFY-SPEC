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
procedure {:inline 1} {:sourceloc "buggy_27.sol", 55, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#208(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#204: address_t, newOwner#206: address_t)
{
	
}

// 
// State variable: owner: address
var {:sourceloc "buggy_27.sol", 53, 5} {:message "owner"} owner#198: [address_t]address_t;
// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_27.sol", 54, 3} {:message "bugv_tmstmp5"} bugv_tmstmp5#202: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 58, 3} {:message "Ownable::[constructor]"} __constructor#294(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#198 := owner#198[__this := 0];
	bugv_tmstmp5#202 := bugv_tmstmp5#202[__this := __block_timestamp];
	winner_tmstmp11#219 := winner_tmstmp11#219[__this := 0];
	// Function body starts here
	owner#198 := owner#198[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_27.sol", 61, 1} {:message "winner_tmstmp11"} winner_tmstmp11#219: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 62, 1} {:message "Ownable::play_tmstmp11"} play_tmstmp11#245(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#221: int)
{
	var {:sourceloc "buggy_27.sol", 63, 2} {:message "_vtime"} _vtime#225: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#225 := __block_timestamp;
	if (((startTime#221 + 432000) == _vtime#225)) {
	winner_tmstmp11#219 := winner_tmstmp11#219[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_27.sol", 74, 5} {:message "Ownable::transferOwnership"} transferOwnership#282(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#258: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume (newOwner#258 != 0);
	assume {:sourceloc "buggy_27.sol", 76, 12} {:message ""} true;
	call OwnershipTransferred#208(__this, __msg_sender, __msg_value, owner#198[__this], newOwner#258);
	owner#198 := owner#198[__this := newOwner#258];
	$return8:
	// Function body ends here
	$return7:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 79, 1} {:message "Ownable::bug_tmstmp1"} bug_tmstmp1#293(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#285: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#285 := (__block_timestamp >= 1546300800);
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_27.sol", 88, 3} {:message "_name"} _name#298: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp18: address
var {:sourceloc "buggy_27.sol", 89, 1} {:message "winner_tmstmp18"} winner_tmstmp18#300: [address_t]address_t;
// 
// Function: play_tmstmp18 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 90, 1} {:message "ERC20Detailed::play_tmstmp18"} play_tmstmp18#322(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#302: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#302 + 432000) == __block_timestamp)) {
	winner_tmstmp18#300 := winner_tmstmp18#300[__this := __msg_sender];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_27.sol", 93, 3} {:message "_symbol"} _symbol#324: [address_t]int_arr_type;
// 
// Function: bug_tmstmp29 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 94, 1} {:message "ERC20Detailed::bug_tmstmp29"} bug_tmstmp29#335(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#327: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#327 := (__block_timestamp >= 1546300800);
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_27.sol", 97, 3} {:message "_decimals"} _decimals#337: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 99, 3} {:message "ERC20Detailed::[constructor]"} __constructor#458(__this: address_t, __msg_sender: address_t, __msg_value: int, name#339: int_arr_ptr, symbol#341: int_arr_ptr, decimals#343: int)
{
	// TCC assumptions
	assume (name#339 < __alloc_counter);
	assume (symbol#341 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#298 := _name#298[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp18#300 := winner_tmstmp18#300[__this := 0];
	_symbol#324 := _symbol#324[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#337 := _decimals#337[__this := 0];
	winner_tmstmp2#361 := winner_tmstmp2#361[__this := 0];
	winner_tmstmp3#431 := winner_tmstmp3#431[__this := 0];
	// Function body starts here
	_name#298 := _name#298[__this := mem_arr_int[name#339]];
	_symbol#324 := _symbol#324[__this := mem_arr_int[symbol#341]];
	_decimals#337 := _decimals#337[__this := decimals#343];
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_27.sol", 104, 1} {:message "winner_tmstmp2"} winner_tmstmp2#361: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 105, 1} {:message "ERC20Detailed::play_tmstmp2"} play_tmstmp2#383(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#363: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#363 + 432000) == __block_timestamp)) {
	winner_tmstmp2#361 := winner_tmstmp2#361[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 109, 3} {:message "ERC20Detailed::name"} name#391(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#386: int_arr_ptr)
{
	var new_array#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#386 := new_array#7;
	mem_arr_int := mem_arr_int[#386 := _name#298[__this]];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 112, 1} {:message "ERC20Detailed::bug_tmstmp17"} bug_tmstmp17#402(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#394: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#394 := (__block_timestamp >= 1546300800);
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 116, 3} {:message "ERC20Detailed::symbol"} symbol#410(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#405: int_arr_ptr)
{
	var new_array#8: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#8 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#405 := new_array#8;
	mem_arr_int := mem_arr_int[#405 := _symbol#324[__this]];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 119, 1} {:message "ERC20Detailed::bug_tmstmp37"} bug_tmstmp37#421(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#413: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#413 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_27.sol", 123, 3} {:message "ERC20Detailed::decimals"} decimals#429(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#424: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#424 := _decimals#337[__this];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_27.sol", 126, 1} {:message "winner_tmstmp3"} winner_tmstmp3#431: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 127, 1} {:message "ERC20Detailed::play_tmstmp3"} play_tmstmp3#457(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#433: int)
{
	var {:sourceloc "buggy_27.sol", 128, 2} {:message "_vtime"} _vtime#437: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#437 := __block_timestamp;
	if (((startTime#433 + 432000) == _vtime#437)) {
	winner_tmstmp3#431 := winner_tmstmp3#431[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// ------- Contract: DanPanCoin -------
// Inherits from: ERC20Detailed
// Inherits from: Ownable
// 
// Event: DanPanPercentChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 197, 3} {:message "[event] DanPanCoin::DanPanPercentChanged"} DanPanPercentChanged#770(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPanPercent#766: int, newDanPanPercent#768: int)
{
	
}

// 
// Event: DanPanAddressChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 199, 3} {:message "[event] DanPanCoin::DanPanAddressChanged"} DanPanAddressChanged#780(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPan#776: address_t, newDanPan#778: address_t)
{
	
}

// 
// Event: WhitelistFrom
procedure {:inline 1} {:sourceloc "buggy_27.sol", 201, 3} {:message "[event] DanPanCoin::WhitelistFrom"} WhitelistFrom#790(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#786: address_t, _whitelisted#788: bool)
{
	
}

// 
// Event: WhitelistTo
procedure {:inline 1} {:sourceloc "buggy_27.sol", 203, 3} {:message "[event] DanPanCoin::WhitelistTo"} WhitelistTo#800(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#796: address_t, _whitelisted#798: bool)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: winner_tmstmp6: address
var {:sourceloc "buggy_27.sol", 136, 1} {:message "winner_tmstmp6"} winner_tmstmp6#467: [address_t]address_t;
// 
// Function: play_tmstmp6 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 137, 1} {:message "DanPanCoin::play_tmstmp6"} play_tmstmp6#489(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#469: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#469 + 432000) == __block_timestamp)) {
	winner_tmstmp6#467 := winner_tmstmp6#467[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 140, 3} {:message "_balances"} _balances#493: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp16 : function ()
procedure {:sourceloc "buggy_27.sol", 141, 1} {:message "DanPanCoin::bug_tmstmp16"} bug_tmstmp16#540(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 142, 2} {:message "pastBlockTime_tmstmp16"} pastBlockTime_tmstmp16#497: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp16#497 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp16#497);
	pastBlockTime_tmstmp16#497 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 147, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return21:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_27.sol", 150, 3} {:message "_allowed"} _allowed#546: [address_t][address_t][address_t]int;
// 
// Function: bug_tmstmp24 : function ()
procedure {:sourceloc "buggy_27.sol", 152, 1} {:message "DanPanCoin::bug_tmstmp24"} bug_tmstmp24#593(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 153, 2} {:message "pastBlockTime_tmstmp24"} pastBlockTime_tmstmp24#550: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp24#550 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp24#550);
	pastBlockTime_tmstmp24#550 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 158, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return22:
	// Function body ends here
}

// 
// Function: bug_tmstmp5 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 162, 1} {:message "DanPanCoin::bug_tmstmp5"} bug_tmstmp5#607(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#599: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#599 := (__block_timestamp >= 1546300800);
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: winner_tmstmp15: address
var {:sourceloc "buggy_27.sol", 166, 1} {:message "winner_tmstmp15"} winner_tmstmp15#612: [address_t]address_t;
// 
// Function: play_tmstmp15 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 167, 1} {:message "DanPanCoin::play_tmstmp15"} play_tmstmp15#638(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#614: int)
{
	var {:sourceloc "buggy_27.sol", 168, 2} {:message "_vtime"} _vtime#618: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#618 := __block_timestamp;
	if (((startTime#614 + 432000) == _vtime#618)) {
	winner_tmstmp15#612 := winner_tmstmp15#612[__this := __msg_sender];
	}

	$return24:
	// Function body ends here
}

// 
// Function: bug_tmstmp28 : function ()
procedure {:sourceloc "buggy_27.sol", 172, 1} {:message "DanPanCoin::bug_tmstmp28"} bug_tmstmp28#688(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 173, 2} {:message "pastBlockTime_tmstmp28"} pastBlockTime_tmstmp28#645: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp28#645 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp28#645);
	pastBlockTime_tmstmp28#645 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 178, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return25:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_27.sol", 181, 3} {:message "_totalSupply"} _totalSupply#691: [address_t]int;
// 
// State variable: winner_tmstmp34: address
var {:sourceloc "buggy_27.sol", 182, 1} {:message "winner_tmstmp34"} winner_tmstmp34#693: [address_t]address_t;
// 
// Function: play_tmstmp34 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 183, 1} {:message "DanPanCoin::play_tmstmp34"} play_tmstmp34#715(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#695: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#695 + 432000) == __block_timestamp)) {
	winner_tmstmp34#693 := winner_tmstmp34#693[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_27.sol", 186, 3} {:message "basePercent"} basePercent#718: [address_t]int;
// 
// Function: bug_tmstmp21 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 187, 1} {:message "DanPanCoin::bug_tmstmp21"} bug_tmstmp21#729(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#721: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#721 := (__block_timestamp >= 1546300800);
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// State variable: dpPercent: uint256
var {:sourceloc "buggy_27.sol", 190, 3} {:message "dpPercent"} dpPercent#732: [address_t]int;
// 
// State variable: winner_tmstmp10: address
var {:sourceloc "buggy_27.sol", 191, 1} {:message "winner_tmstmp10"} winner_tmstmp10#734: [address_t]address_t;
// 
// Function: play_tmstmp10 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 192, 1} {:message "DanPanCoin::play_tmstmp10"} play_tmstmp10#756(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#736: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#736 + 432000) == __block_timestamp)) {
	winner_tmstmp10#734 := winner_tmstmp10#734[__this := __msg_sender];
	}

	$return28:
	// Function body ends here
}

// 
// State variable: DanPanAddress: address
var {:sourceloc "buggy_27.sol", 195, 3} {:message "DanPanAddress"} DanPanAddress#760: [address_t]address_t;
// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_27.sol", 196, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#764: [address_t]int;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_27.sol", 198, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#774: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_27.sol", 200, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#784: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_27.sol", 202, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#794: [address_t]int;
// 
// State variable: winner_tmstmp22: address
var {:sourceloc "buggy_27.sol", 206, 3} {:message "winner_tmstmp22"} winner_tmstmp22#802: [address_t]address_t;
// 
// Function: play_tmstmp22 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 207, 1} {:message "DanPanCoin::play_tmstmp22"} play_tmstmp22#824(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#804: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#804 + 432000) == __block_timestamp)) {
	winner_tmstmp22#802 := winner_tmstmp22#802[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// State variable: whitelistFrom: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 210, 3} {:message "whitelistFrom"} whitelistFrom#828: [address_t][address_t]bool;
// 
// Function: bug_tmstmp12 : function ()
procedure {:sourceloc "buggy_27.sol", 211, 3} {:message "DanPanCoin::bug_tmstmp12"} bug_tmstmp12#875(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 212, 2} {:message "pastBlockTime_tmstmp12"} pastBlockTime_tmstmp12#832: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp12#832 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp12#832);
	pastBlockTime_tmstmp12#832 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 217, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return30:
	// Function body ends here
}

// 
// State variable: whitelistTo: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 220, 3} {:message "whitelistTo"} whitelistTo#879: [address_t][address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 222, 3} {:message "DanPanCoin::[constructor]"} __constructor#2378(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#881: int_arr_ptr, _symbol#883: int_arr_ptr, _decimals#885: int)
{
	var name#339#10: int_arr_ptr;
	var symbol#341#10: int_arr_ptr;
	var decimals#343#10: int;
	var call_arg#12: address_t;
	// TCC assumptions
	assume (_name#881 < __alloc_counter);
	assume (_symbol#883 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp6#467 := winner_tmstmp6#467[__this := 0];
	_balances#493 := _balances#493[__this := default_address_t_int()];
	_allowed#546 := _allowed#546[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp15#612 := winner_tmstmp15#612[__this := 0];
	_totalSupply#691 := _totalSupply#691[__this := 10000000000];
	winner_tmstmp34#693 := winner_tmstmp34#693[__this := 0];
	basePercent#718 := basePercent#718[__this := 100];
	dpPercent#732 := dpPercent#732[__this := 5];
	winner_tmstmp10#734 := winner_tmstmp10#734[__this := 0];
	DanPanAddress#760 := DanPanAddress#760[__this := __msg_sender];
	bugv_tmstmp1#764 := bugv_tmstmp1#764[__this := __block_timestamp];
	bugv_tmstmp2#774 := bugv_tmstmp2#774[__this := __block_timestamp];
	bugv_tmstmp3#784 := bugv_tmstmp3#784[__this := __block_timestamp];
	bugv_tmstmp4#794 := bugv_tmstmp4#794[__this := __block_timestamp];
	winner_tmstmp22#802 := winner_tmstmp22#802[__this := 0];
	whitelistFrom#828 := whitelistFrom#828[__this := default_address_t_bool()];
	whitelistTo#879 := whitelistTo#879[__this := default_address_t_bool()];
	winner_tmstmp19#946 := winner_tmstmp19#946[__this := 0];
	winner_tmstmp26#991 := winner_tmstmp26#991[__this := 0];
	winner_tmstmp38#1331 := winner_tmstmp38#1331[__this := 0];
	winner_tmstmp7#1472 := winner_tmstmp7#1472[__this := 0];
	winner_tmstmp23#1687 := winner_tmstmp23#1687[__this := 0];
	winner_tmstmp14#1766 := winner_tmstmp14#1766[__this := 0];
	winner_tmstmp30#1841 := winner_tmstmp30#1841[__this := 0];
	winner_tmstmp39#1958 := winner_tmstmp39#1958[__this := 0];
	winner_tmstmp35#2123 := winner_tmstmp35#2123[__this := 0];
	winner_tmstmp27#2270 := winner_tmstmp27#2270[__this := 0];
	winner_tmstmp31#2319 := winner_tmstmp31#2319[__this := 0];
	owner#198 := owner#198[__this := 0];
	bugv_tmstmp5#202 := bugv_tmstmp5#202[__this := __block_timestamp];
	winner_tmstmp11#219 := winner_tmstmp11#219[__this := 0];
	_name#298 := _name#298[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp18#300 := winner_tmstmp18#300[__this := 0];
	_symbol#324 := _symbol#324[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#337 := _decimals#337[__this := 0];
	winner_tmstmp2#361 := winner_tmstmp2#361[__this := 0];
	winner_tmstmp3#431 := winner_tmstmp3#431[__this := 0];
	// Arguments for Ownable
	// Arguments for ERC20Detailed
	name#339#10 := _name#881;
	symbol#341#10 := _symbol#883;
	decimals#343#10 := _decimals#885;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#298 := _name#298[__this := mem_arr_int[name#339#10]];
	_symbol#324 := _symbol#324[__this := mem_arr_int[symbol#341#10]];
	_decimals#337 := _decimals#337[__this := decimals#343#10];
	$return31:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#198 := owner#198[__this := __msg_sender];
	$return32:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 223, 5} {:message ""} true;
	call _mint#1897(__this, __msg_sender, __msg_value, call_arg#12, _totalSupply#691[__this]);
	$return33:
	// Function body ends here
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 225, 1} {:message "DanPanCoin::bug_tmstmp9"} bug_tmstmp9#911(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#903: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#903 := (__block_timestamp >= 1546300800);
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 229, 3} {:message "DanPanCoin::totalSupply"} totalSupply#920(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#915: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#915 := _totalSupply#691[__this];
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 232, 1} {:message "DanPanCoin::bug_tmstmp25"} bug_tmstmp25#931(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#923: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#923 := (__block_timestamp >= 1546300800);
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 236, 3} {:message "DanPanCoin::balanceOf"} balanceOf#944(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#933: address_t)
	returns (#937: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#937 := _balances#493[__this][owner#933];
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_27.sol", 239, 1} {:message "winner_tmstmp19"} winner_tmstmp19#946: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 240, 1} {:message "DanPanCoin::play_tmstmp19"} play_tmstmp19#972(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#948: int)
{
	var {:sourceloc "buggy_27.sol", 241, 2} {:message "_vtime"} _vtime#952: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#952 := __block_timestamp;
	if (((startTime#948 + 432000) == _vtime#952)) {
	winner_tmstmp19#946 := winner_tmstmp19#946[__this := __msg_sender];
	}

	$return38:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 245, 3} {:message "DanPanCoin::allowance"} allowance#989(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#974: address_t, spender#976: address_t)
	returns (#980: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#980 := _allowed#546[__this][owner#974][spender#976];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_27.sol", 248, 1} {:message "winner_tmstmp26"} winner_tmstmp26#991: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 249, 1} {:message "DanPanCoin::play_tmstmp26"} play_tmstmp26#1013(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#993: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#993 + 432000) == __block_timestamp)) {
	winner_tmstmp26#991 := winner_tmstmp26#991[__this := __msg_sender];
	}

	$return40:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 253, 3} {:message "DanPanCoin::findOnePercent"} findOnePercent#1040(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1015: int)
	returns (#1018: int)
{
	var {:sourceloc "buggy_27.sol", 254, 5} {:message "roundValue"} roundValue#1021: int;
	var ceil#195_ret#13: int;
	var {:sourceloc "buggy_27.sol", 255, 5} {:message "onePercent"} onePercent#1028: int;
	var mul#101_ret#14: int;
	var call_arg#15: int;
	var div#119_ret#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 254, 26} {:message ""} true;
	call ceil#195_ret#13 := ceil#195(__this, __msg_sender, __msg_value, value#1015, basePercent#718[__this]);
	roundValue#1021 := ceil#195_ret#13;
	assume {:sourceloc "buggy_27.sol", 255, 26} {:message ""} true;
	call mul#101_ret#14 := mul#101(__this, __msg_sender, __msg_value, roundValue#1021, basePercent#718[__this]);
	call_arg#15 := 10000;
	assume {:sourceloc "buggy_27.sol", 255, 26} {:message ""} true;
	call div#119_ret#16 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#14, call_arg#15);
	onePercent#1028 := div#119_ret#16;
	#1018 := onePercent#1028;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_27.sol", 258, 1} {:message "DanPanCoin::bug_tmstmp20"} bug_tmstmp20#1087(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 259, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#1044: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#1044 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#1044);
	pastBlockTime_tmstmp20#1044 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 264, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return42:
	// Function body ends here
}

// 
// Function: findDPPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 267, 3} {:message "DanPanCoin::findDPPercent"} findDPPercent#1117(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1089: int)
	returns (#1092: int)
{
	var {:sourceloc "buggy_27.sol", 268, 5} {:message "roundValue"} roundValue#1095: int;
	var ceil#195_ret#17: int;
	var {:sourceloc "buggy_27.sol", 269, 5} {:message "DPPercent"} DPPercent#1102: int;
	var mul#101_ret#18: int;
	var call_arg#19: int;
	var div#119_ret#20: int;
	var mul#101_ret#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 268, 26} {:message ""} true;
	call ceil#195_ret#17 := ceil#195(__this, __msg_sender, __msg_value, value#1089, basePercent#718[__this]);
	roundValue#1095 := ceil#195_ret#17;
	assume {:sourceloc "buggy_27.sol", 269, 25} {:message ""} true;
	call mul#101_ret#18 := mul#101(__this, __msg_sender, __msg_value, roundValue#1095, basePercent#718[__this]);
	call_arg#19 := 10000;
	assume {:sourceloc "buggy_27.sol", 269, 25} {:message ""} true;
	call div#119_ret#20 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#18, call_arg#19);
	assume {:sourceloc "buggy_27.sol", 269, 25} {:message ""} true;
	call mul#101_ret#21 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#20, dpPercent#732[__this]);
	DPPercent#1102 := mul#101_ret#21;
	#1092 := DPPercent#1102;
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_27.sol", 272, 1} {:message "DanPanCoin::bug_tmstmp32"} bug_tmstmp32#1164(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 273, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#1121: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#1121 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#1121);
	pastBlockTime_tmstmp32#1121 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 278, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return44:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 282, 3} {:message "DanPanCoin::transfer"} transfer#1329(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1166: address_t, value#1168: int)
	returns (#1172: bool)
{
	var call_arg#22: address_t;
	var call_arg#23: int;
	var {:sourceloc "buggy_27.sol", 297, 9} {:message "tokensToTransfer"} tokensToTransfer#1207: int;
	var {:sourceloc "buggy_27.sol", 298, 9} {:message "tokensToBurn"} tokensToBurn#1211: int;
	var {:sourceloc "buggy_27.sol", 299, 9} {:message "tokensToDanPan"} tokensToDanPan#1215: int;
	var sub#139_ret#24: int;
	var call_arg#25: address_t;
	var _isWhitelisted#2268_ret#26: bool;
	var findOnePercent#1040_ret#27: int;
	var findDPPercent#1117_ret#28: int;
	var sub#139_ret#29: int;
	var sub#139_ret#30: int;
	var sub#139_ret#31: int;
	var call_arg#32: address_t;
	var call_arg#33: address_t;
	var add#163_ret#34: int;
	var call_arg#35: address_t;
	var add#163_ret#36: int;
	var add#163_ret#37: int;
	var add#163_ret#38: int;
	var call_arg#39: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1168 <= _balances#493[__this][__msg_sender]);
	assume (to#1166 != 0);
	if ((value#1168 == 0)) {
	call_arg#22 := __msg_sender;
	call_arg#23 := 0;
	assume {:sourceloc "buggy_27.sol", 289, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#22, to#1166, call_arg#23);
	#1172 := true;
	goto $return45;
	}

	tokensToTransfer#1207 := value#1168;
	tokensToBurn#1211 := 0;
	tokensToDanPan#1215 := 0;
	assume {:sourceloc "buggy_27.sol", 303, 33} {:message ""} true;
	call sub#139_ret#24 := sub#139(__this, __msg_sender, __msg_value, _balances#493[__this][__msg_sender], value#1168);
	_balances#493 := _balances#493[__this := _balances#493[__this][__msg_sender := sub#139_ret#24]];
	call_arg#25 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 307, 14} {:message ""} true;
	call _isWhitelisted#2268_ret#26 := _isWhitelisted#2268(__this, __msg_sender, __msg_value, call_arg#25, to#1166);
	if (!(_isWhitelisted#2268_ret#26)) {
	assume {:sourceloc "buggy_27.sol", 309, 30} {:message ""} true;
	call findOnePercent#1040_ret#27 := findOnePercent#1040(__this, __msg_sender, __msg_value, value#1168);
	tokensToBurn#1211 := findOnePercent#1040_ret#27;
	assume {:sourceloc "buggy_27.sol", 310, 32} {:message ""} true;
	call findDPPercent#1117_ret#28 := findDPPercent#1117(__this, __msg_sender, __msg_value, value#1168);
	tokensToDanPan#1215 := findDPPercent#1117_ret#28;
	assume {:sourceloc "buggy_27.sol", 313, 33} {:message ""} true;
	call sub#139_ret#29 := sub#139(__this, __msg_sender, __msg_value, value#1168, tokensToBurn#1211);
	assume {:sourceloc "buggy_27.sol", 313, 33} {:message ""} true;
	call sub#139_ret#30 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#29, tokensToDanPan#1215);
	tokensToTransfer#1207 := sub#139_ret#30;
	assume {:sourceloc "buggy_27.sol", 316, 28} {:message ""} true;
	call sub#139_ret#31 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#691[__this], tokensToBurn#1211);
	_totalSupply#691 := _totalSupply#691[__this := sub#139_ret#31];
	call_arg#32 := __msg_sender;
	call_arg#33 := 0;
	assume {:sourceloc "buggy_27.sol", 317, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#32, call_arg#33, tokensToBurn#1211);
	assume {:sourceloc "buggy_27.sol", 321, 40} {:message ""} true;
	call add#163_ret#34 := add#163(__this, __msg_sender, __msg_value, _balances#493[__this][DanPanAddress#760[__this]], tokensToDanPan#1215);
	_balances#493 := _balances#493[__this := _balances#493[__this][DanPanAddress#760[__this] := add#163_ret#34]];
	call_arg#35 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 322, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#35, DanPanAddress#760[__this], tokensToDanPan#1215);
	}

	assume {:sourceloc "buggy_27.sol", 328, 16} {:message ""} true;
	call add#163_ret#36 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#1211, tokensToTransfer#1207);
	assume {:sourceloc "buggy_27.sol", 328, 16} {:message ""} true;
	call add#163_ret#37 := add#163(__this, __msg_sender, __msg_value, add#163_ret#36, tokensToDanPan#1215);
	assert {:sourceloc "buggy_27.sol", 328, 9} {:message "Assertion might not hold."} (add#163_ret#37 == value#1168);
	assume {:sourceloc "buggy_27.sol", 331, 25} {:message ""} true;
	call add#163_ret#38 := add#163(__this, __msg_sender, __msg_value, _balances#493[__this][to#1166], tokensToTransfer#1207);
	_balances#493 := _balances#493[__this := _balances#493[__this][to#1166 := add#163_ret#38]];
	call_arg#39 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 332, 14} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#39, to#1166, tokensToTransfer#1207);
	#1172 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_27.sol", 338, 1} {:message "winner_tmstmp38"} winner_tmstmp38#1331: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 339, 1} {:message "DanPanCoin::play_tmstmp38"} play_tmstmp38#1353(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1333: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1333 + 432000) == __block_timestamp)) {
	winner_tmstmp38#1331 := winner_tmstmp38#1331[__this := __msg_sender];
	}

	$return46:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_27.sol", 343, 3} {:message "DanPanCoin::multiTransfer"} multiTransfer#1385(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1356: address_t_arr_ptr, amounts#1359: int_arr_ptr)
{
	var {:sourceloc "buggy_27.sol", 344, 10} {:message "i"} i#1363: int;
	var transfer#1329_ret#42: bool;
	var tmp#43: int;
	// TCC assumptions
	assume (receivers#1356 < __alloc_counter);
	assume (amounts#1359 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1363 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1356])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1356]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1363 < length#address_t_arr#constr(mem_arr_address_t[receivers#1356]))) {
	// Body
	assume {:sourceloc "buggy_27.sol", 345, 7} {:message ""} true;
	call transfer#1329_ret#42 := transfer#1329(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1356])[i#1363], arr#int_arr#constr(mem_arr_int[amounts#1359])[i#1363]);
	$continue40:
	// Loop expression
	tmp#43 := i#1363;
	i#1363 := (i#1363 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1356])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1356]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break41:
	$return47:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_27.sol", 348, 1} {:message "DanPanCoin::bug_tmstmp4"} bug_tmstmp4#1432(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 349, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#1389: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#1389 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#1389);
	pastBlockTime_tmstmp4#1389 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 354, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return48:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 358, 3} {:message "DanPanCoin::approve"} approve#1470(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1434: address_t, value#1436: int)
	returns (#1440: bool)
{
	var call_arg#44: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1434 != 0);
	_allowed#546 := _allowed#546[__this := _allowed#546[__this][__msg_sender := _allowed#546[__this][__msg_sender][spender#1434 := value#1436]]];
	call_arg#44 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 361, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#44, spender#1434, value#1436);
	#1440 := true;
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_27.sol", 364, 1} {:message "winner_tmstmp7"} winner_tmstmp7#1472: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 365, 1} {:message "DanPanCoin::play_tmstmp7"} play_tmstmp7#1498(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1474: int)
{
	var {:sourceloc "buggy_27.sol", 366, 2} {:message "_vtime"} _vtime#1478: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1478 := __block_timestamp;
	if (((startTime#1474 + 432000) == _vtime#1478)) {
	winner_tmstmp7#1472 := winner_tmstmp7#1472[__this := __msg_sender];
	}

	$return50:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 370, 2} {:message "DanPanCoin::transferFrom"} transferFrom#1685(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1500: address_t, to#1502: address_t, value#1504: int)
	returns (#1508: bool)
{
	var call_arg#45: int;
	var {:sourceloc "buggy_27.sol", 384, 9} {:message "tokensToTransfer"} tokensToTransfer#1552: int;
	var {:sourceloc "buggy_27.sol", 385, 9} {:message "tokensToBurn"} tokensToBurn#1556: int;
	var {:sourceloc "buggy_27.sol", 386, 9} {:message "tokensToDanPan"} tokensToDanPan#1560: int;
	var sub#139_ret#46: int;
	var _isWhitelisted#2268_ret#47: bool;
	var findOnePercent#1040_ret#48: int;
	var findDPPercent#1117_ret#49: int;
	var sub#139_ret#50: int;
	var sub#139_ret#51: int;
	var sub#139_ret#52: int;
	var call_arg#53: address_t;
	var add#163_ret#54: int;
	var add#163_ret#55: int;
	var add#163_ret#56: int;
	var add#163_ret#57: int;
	var sub#139_ret#58: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1504 <= _balances#493[__this][from#1500]);
	assume (value#1504 <= _allowed#546[__this][from#1500][__msg_sender]);
	assume (to#1502 != 0);
	if ((value#1504 == 0)) {
	call_arg#45 := 0;
	assume {:sourceloc "buggy_27.sol", 378, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1500, to#1502, call_arg#45);
	#1508 := true;
	goto $return51;
	}

	tokensToTransfer#1552 := value#1504;
	tokensToBurn#1556 := 0;
	tokensToDanPan#1560 := 0;
	assume {:sourceloc "buggy_27.sol", 389, 27} {:message ""} true;
	call sub#139_ret#46 := sub#139(__this, __msg_sender, __msg_value, _balances#493[__this][from#1500], value#1504);
	_balances#493 := _balances#493[__this := _balances#493[__this][from#1500 := sub#139_ret#46]];
	assume {:sourceloc "buggy_27.sol", 393, 14} {:message ""} true;
	call _isWhitelisted#2268_ret#47 := _isWhitelisted#2268(__this, __msg_sender, __msg_value, from#1500, to#1502);
	if (!(_isWhitelisted#2268_ret#47)) {
	assume {:sourceloc "buggy_27.sol", 395, 30} {:message ""} true;
	call findOnePercent#1040_ret#48 := findOnePercent#1040(__this, __msg_sender, __msg_value, value#1504);
	tokensToBurn#1556 := findOnePercent#1040_ret#48;
	assume {:sourceloc "buggy_27.sol", 396, 32} {:message ""} true;
	call findDPPercent#1117_ret#49 := findDPPercent#1117(__this, __msg_sender, __msg_value, value#1504);
	tokensToDanPan#1560 := findDPPercent#1117_ret#49;
	assume {:sourceloc "buggy_27.sol", 399, 33} {:message ""} true;
	call sub#139_ret#50 := sub#139(__this, __msg_sender, __msg_value, value#1504, tokensToBurn#1556);
	assume {:sourceloc "buggy_27.sol", 399, 33} {:message ""} true;
	call sub#139_ret#51 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#50, tokensToDanPan#1560);
	tokensToTransfer#1552 := sub#139_ret#51;
	assume {:sourceloc "buggy_27.sol", 402, 28} {:message ""} true;
	call sub#139_ret#52 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#691[__this], tokensToBurn#1556);
	_totalSupply#691 := _totalSupply#691[__this := sub#139_ret#52];
	call_arg#53 := 0;
	assume {:sourceloc "buggy_27.sol", 403, 18} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1500, call_arg#53, tokensToBurn#1556);
	assume {:sourceloc "buggy_27.sol", 407, 40} {:message ""} true;
	call add#163_ret#54 := add#163(__this, __msg_sender, __msg_value, _balances#493[__this][DanPanAddress#760[__this]], tokensToDanPan#1560);
	_balances#493 := _balances#493[__this := _balances#493[__this][DanPanAddress#760[__this] := add#163_ret#54]];
	assume {:sourceloc "buggy_27.sol", 408, 17} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1500, DanPanAddress#760[__this], tokensToDanPan#1560);
	}

	assume {:sourceloc "buggy_27.sol", 414, 16} {:message ""} true;
	call add#163_ret#55 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#1556, tokensToTransfer#1552);
	assume {:sourceloc "buggy_27.sol", 414, 16} {:message ""} true;
	call add#163_ret#56 := add#163(__this, __msg_sender, __msg_value, add#163_ret#55, tokensToDanPan#1560);
	assert {:sourceloc "buggy_27.sol", 414, 9} {:message "Assertion might not hold."} (add#163_ret#56 == value#1504);
	assume {:sourceloc "buggy_27.sol", 417, 25} {:message ""} true;
	call add#163_ret#57 := add#163(__this, __msg_sender, __msg_value, _balances#493[__this][to#1502], tokensToTransfer#1552);
	_balances#493 := _balances#493[__this := _balances#493[__this][to#1502 := add#163_ret#57]];
	assume {:sourceloc "buggy_27.sol", 418, 31} {:message ""} true;
	call sub#139_ret#58 := sub#139(__this, __msg_sender, __msg_value, _allowed#546[__this][from#1500][__msg_sender], value#1504);
	_allowed#546 := _allowed#546[__this := _allowed#546[__this][from#1500 := _allowed#546[__this][from#1500][__msg_sender := sub#139_ret#58]]];
	assume {:sourceloc "buggy_27.sol", 419, 14} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, from#1500, to#1502, tokensToTransfer#1552);
	#1508 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_27.sol", 425, 1} {:message "winner_tmstmp23"} winner_tmstmp23#1687: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 426, 1} {:message "DanPanCoin::play_tmstmp23"} play_tmstmp23#1713(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1689: int)
{
	var {:sourceloc "buggy_27.sol", 427, 2} {:message "_vtime"} _vtime#1693: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1693 := __block_timestamp;
	if (((startTime#1689 + 432000) == _vtime#1693)) {
	winner_tmstmp23#1687 := winner_tmstmp23#1687[__this := __msg_sender];
	}

	$return52:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 431, 3} {:message "DanPanCoin::increaseAllowance"} increaseAllowance#1764(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1715: address_t, addedValue#1717: int)
	returns (#1720: bool)
{
	var add#163_ret#59: int;
	var call_arg#60: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1715 != 0);
	assume {:sourceloc "buggy_27.sol", 433, 38} {:message ""} true;
	call add#163_ret#59 := add#163(__this, __msg_sender, __msg_value, _allowed#546[__this][__msg_sender][spender#1715], addedValue#1717);
	_allowed#546 := _allowed#546[__this := _allowed#546[__this][__msg_sender := _allowed#546[__this][__msg_sender][spender#1715 := add#163_ret#59]]];
	call_arg#60 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 434, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#60, spender#1715, _allowed#546[__this][__msg_sender][spender#1715]);
	#1720 := true;
	goto $return53;
	$return53:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_27.sol", 437, 1} {:message "winner_tmstmp14"} winner_tmstmp14#1766: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 438, 1} {:message "DanPanCoin::play_tmstmp14"} play_tmstmp14#1788(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1768: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1768 + 432000) == __block_timestamp)) {
	winner_tmstmp14#1766 := winner_tmstmp14#1766[__this := __msg_sender];
	}

	$return54:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 442, 3} {:message "DanPanCoin::decreaseAllowance"} decreaseAllowance#1839(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1790: address_t, subtractedValue#1792: int)
	returns (#1795: bool)
{
	var sub#139_ret#61: int;
	var call_arg#62: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1790 != 0);
	assume {:sourceloc "buggy_27.sol", 444, 38} {:message ""} true;
	call sub#139_ret#61 := sub#139(__this, __msg_sender, __msg_value, _allowed#546[__this][__msg_sender][spender#1790], subtractedValue#1792);
	_allowed#546 := _allowed#546[__this := _allowed#546[__this][__msg_sender := _allowed#546[__this][__msg_sender][spender#1790 := sub#139_ret#61]]];
	call_arg#62 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 445, 10} {:message ""} true;
	call Approval#67(__this, __msg_sender, __msg_value, call_arg#62, spender#1790, _allowed#546[__this][__msg_sender][spender#1790]);
	#1795 := true;
	goto $return55;
	$return55:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_27.sol", 448, 1} {:message "winner_tmstmp30"} winner_tmstmp30#1841: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 449, 1} {:message "DanPanCoin::play_tmstmp30"} play_tmstmp30#1863(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1843: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1843 + 432000) == __block_timestamp)) {
	winner_tmstmp30#1841 := winner_tmstmp30#1841[__this := __msg_sender];
	}

	$return56:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 453, 3} {:message "DanPanCoin::_mint"} _mint#1897(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1865: address_t, amount#1867: int)
{
	var add#163_ret#63: int;
	var call_arg#64: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1867 != 0);
	assume {:sourceloc "buggy_27.sol", 455, 26} {:message ""} true;
	call add#163_ret#63 := add#163(__this, __msg_sender, __msg_value, _balances#493[__this][account#1865], amount#1867);
	_balances#493 := _balances#493[__this := _balances#493[__this][account#1865 := add#163_ret#63]];
	call_arg#64 := 0;
	assume {:sourceloc "buggy_27.sol", 456, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, call_arg#64, account#1865, amount#1867);
	$return57:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_27.sol", 458, 1} {:message "DanPanCoin::bug_tmstmp8"} bug_tmstmp8#1944(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 459, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#1901: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#1901 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#1901);
	pastBlockTime_tmstmp8#1901 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 464, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return58:
	// Function body ends here
}

// 
// Function: burn
procedure {:sourceloc "buggy_27.sol", 468, 3} {:message "DanPanCoin::burn"} burn#1956(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1946: int)
{
	var call_arg#65: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#65 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 469, 5} {:message ""} true;
	call _burn#2033(__this, __msg_sender, __msg_value, call_arg#65, amount#1946);
	$return59:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_27.sol", 471, 1} {:message "winner_tmstmp39"} winner_tmstmp39#1958: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 472, 1} {:message "DanPanCoin::play_tmstmp39"} play_tmstmp39#1984(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1960: int)
{
	var {:sourceloc "buggy_27.sol", 473, 2} {:message "_vtime"} _vtime#1964: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1964 := __block_timestamp;
	if (((startTime#1960 + 432000) == _vtime#1964)) {
	winner_tmstmp39#1958 := winner_tmstmp39#1958[__this := __msg_sender];
	}

	$return60:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 477, 3} {:message "DanPanCoin::_burn"} _burn#2033(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1986: address_t, amount#1988: int)
{
	var sub#139_ret#66: int;
	var sub#139_ret#67: int;
	var call_arg#68: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1988 != 0);
	assume (amount#1988 <= _balances#493[__this][account#1986]);
	assume {:sourceloc "buggy_27.sol", 480, 20} {:message ""} true;
	call sub#139_ret#66 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#691[__this], amount#1988);
	_totalSupply#691 := _totalSupply#691[__this := sub#139_ret#66];
	assume {:sourceloc "buggy_27.sol", 481, 26} {:message ""} true;
	call sub#139_ret#67 := sub#139(__this, __msg_sender, __msg_value, _balances#493[__this][account#1986], amount#1988);
	_balances#493 := _balances#493[__this := _balances#493[__this][account#1986 := sub#139_ret#67]];
	call_arg#68 := 0;
	assume {:sourceloc "buggy_27.sol", 482, 10} {:message ""} true;
	call Transfer#59(__this, __msg_sender, __msg_value, account#1986, call_arg#68, amount#1988);
	$return61:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_27.sol", 484, 1} {:message "DanPanCoin::bug_tmstmp36"} bug_tmstmp36#2080(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 485, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#2037: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#2037 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#2037);
	pastBlockTime_tmstmp36#2037 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 490, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return62:
	// Function body ends here
}

// 
// Function: burnFrom
procedure {:sourceloc "buggy_27.sol", 494, 3} {:message "DanPanCoin::burnFrom"} burnFrom#2121(__this: address_t, __msg_sender: address_t, __msg_value: int, account#2082: address_t, amount#2084: int)
{
	var sub#139_ret#69: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#2084 <= _allowed#546[__this][account#2082][__msg_sender]);
	assume {:sourceloc "buggy_27.sol", 496, 37} {:message ""} true;
	call sub#139_ret#69 := sub#139(__this, __msg_sender, __msg_value, _allowed#546[__this][account#2082][__msg_sender], amount#2084);
	_allowed#546 := _allowed#546[__this := _allowed#546[__this][account#2082 := _allowed#546[__this][account#2082][__msg_sender := sub#139_ret#69]]];
	assume {:sourceloc "buggy_27.sol", 497, 5} {:message ""} true;
	call _burn#2033(__this, __msg_sender, __msg_value, account#2082, amount#2084);
	$return63:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_27.sol", 499, 1} {:message "winner_tmstmp35"} winner_tmstmp35#2123: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 500, 1} {:message "DanPanCoin::play_tmstmp35"} play_tmstmp35#2149(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2125: int)
{
	var {:sourceloc "buggy_27.sol", 501, 2} {:message "_vtime"} _vtime#2129: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#2129 := __block_timestamp;
	if (((startTime#2125 + 432000) == _vtime#2129)) {
	winner_tmstmp35#2123 := winner_tmstmp35#2123[__this := __msg_sender];
	}

	$return64:
	// Function body ends here
}

// 
// Function: NewDanPanAddress
procedure {:sourceloc "buggy_27.sol", 505, 3} {:message "DanPanCoin::NewDanPanAddress"} NewDanPanAddress#2175(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanaddress#2151: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume (newDanPanaddress#2151 != 0);
	assume {:sourceloc "buggy_27.sol", 507, 12} {:message ""} true;
	call DanPanAddressChanged#780(__this, __msg_sender, __msg_value, DanPanAddress#760[__this], newDanPanaddress#2151);
	DanPanAddress#760 := DanPanAddress#760[__this := newDanPanaddress#2151];
	$return66:
	// Function body ends here
	$return65:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_27.sol", 510, 1} {:message "DanPanCoin::bug_tmstmp40"} bug_tmstmp40#2222(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 511, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#2179: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#2179 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#2179);
	pastBlockTime_tmstmp40#2179 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_27.sol", 516, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return67:
	// Function body ends here
}

// 
// Function: NewDanPanPercent
procedure {:sourceloc "buggy_27.sol", 520, 3} {:message "DanPanCoin::NewDanPanPercent"} NewDanPanPercent#2239(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanpercent#2224: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 521, 12} {:message ""} true;
	call DanPanPercentChanged#770(__this, __msg_sender, __msg_value, dpPercent#732[__this], newDanPanpercent#2224);
	dpPercent#732 := dpPercent#732[__this := newDanPanpercent#2224];
	$return69:
	// Function body ends here
	$return68:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 524, 1} {:message "DanPanCoin::bug_tmstmp33"} bug_tmstmp33#2250(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#2242: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#2242 := (__block_timestamp >= 1546300800);
	goto $return70;
	$return70:
	// Function body ends here
}

// 
// Function: _isWhitelisted : function (address,address) view returns (bool)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 528, 3} {:message "DanPanCoin::_isWhitelisted"} _isWhitelisted#2268(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#2252: address_t, _to#2254: address_t)
	returns (#2257: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#2257 := (whitelistFrom#828[__this][_from#2252] || whitelistTo#879[__this][_to#2254]);
	goto $return71;
	$return71:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_27.sol", 532, 1} {:message "winner_tmstmp27"} winner_tmstmp27#2270: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 533, 1} {:message "DanPanCoin::play_tmstmp27"} play_tmstmp27#2296(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2272: int)
{
	var {:sourceloc "buggy_27.sol", 534, 2} {:message "_vtime"} _vtime#2276: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#2276 := __block_timestamp;
	if (((startTime#2272 + 432000) == _vtime#2276)) {
	winner_tmstmp27#2270 := winner_tmstmp27#2270[__this := __msg_sender];
	}

	$return72:
	// Function body ends here
}

// 
// Function: setWhitelistedTo
procedure {:sourceloc "buggy_27.sol", 538, 5} {:message "DanPanCoin::setWhitelistedTo"} setWhitelistedTo#2317(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#2298: address_t, _whitelisted#2300: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 539, 14} {:message ""} true;
	call WhitelistTo#800(__this, __msg_sender, __msg_value, _addr#2298, _whitelisted#2300);
	whitelistTo#879 := whitelistTo#879[__this := whitelistTo#879[__this][_addr#2298 := _whitelisted#2300]];
	$return74:
	// Function body ends here
	$return73:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_27.sol", 542, 1} {:message "winner_tmstmp31"} winner_tmstmp31#2319: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 543, 1} {:message "DanPanCoin::play_tmstmp31"} play_tmstmp31#2345(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2321: int)
{
	var {:sourceloc "buggy_27.sol", 544, 2} {:message "_vtime"} _vtime#2325: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#2325 := __block_timestamp;
	if (((startTime#2321 + 432000) == _vtime#2325)) {
	winner_tmstmp31#2319 := winner_tmstmp31#2319[__this := __msg_sender];
	}

	$return75:
	// Function body ends here
}

// 
// Function: setWhitelistedFrom
procedure {:sourceloc "buggy_27.sol", 548, 5} {:message "DanPanCoin::setWhitelistedFrom"} setWhitelistedFrom#2366(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#2347: address_t, _whitelisted#2349: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 549, 14} {:message ""} true;
	call WhitelistFrom#790(__this, __msg_sender, __msg_value, _addr#2347, _whitelisted#2349);
	whitelistFrom#828 := whitelistFrom#828[__this := whitelistFrom#828[__this][_addr#2347 := _whitelisted#2349]];
	$return77:
	// Function body ends here
	$return76:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_27.sol", 552, 1} {:message "DanPanCoin::bug_tmstmp13"} bug_tmstmp13#2377(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#2369: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#2369 := (__block_timestamp >= 1546300800);
	goto $return78;
	$return78:
	// Function body ends here
}

