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
procedure {:inline 1} {:sourceloc "buggy_27.sol", 64, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#242(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#238: address_t, newOwner#240: address_t)
{
	
}

// 
// State variable: owner: address
var {:sourceloc "buggy_27.sol", 53, 5} {:message "owner"} owner#198: [address_t]address_t;
// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 54, 3} {:message "userBalance_re_ent40"} userBalance_re_ent40#202: [address_t][address_t]int;
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
procedure {:inline 1} {:message "call"} __call(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (__result: bool, __calldata: int_arr_ptr)
{
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	__result := true;
	}
	else {
	__result := false;
	}

}

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_27.sol", 55, 1} {:message "Ownable::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 58, 3} {:message "success"} success#206: bool;
	var __call_ret#5: bool;
	var __call_ret#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#202[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#202[__this][__msg_sender])];
	assume {:sourceloc "buggy_27.sol", 58, 18} {:message ""} true;
	call __call_ret#5, __call_ret#6 := __call(__msg_sender, __this, userBalance_re_ent40#202[__this][__msg_sender]);
	if (__call_ret#5) {
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc __balance;
	}

	if (!(__call_ret#5)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#202[__this][__msg_sender])];
	}

	success#206 := __call_ret#5;
	if (!(success#206)) {
	assume false;
	}

	userBalance_re_ent40#202 := userBalance_re_ent40#202[__this := userBalance_re_ent40#202[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 67, 3} {:message "Ownable::[constructor]"} __constructor#359(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#198 := owner#198[__this := 0];
	userBalance_re_ent40#202 := userBalance_re_ent40#202[__this := default_address_t_int()];
	balances_re_ent10#255 := balances_re_ent10#255[__this := default_address_t_int()];
	balances_re_ent21#329 := balances_re_ent21#329[__this := default_address_t_int()];
	// Function body starts here
	owner#198 := owner#198[__this := __msg_sender];
	$return6:
	// Function body ends here
}

// 
// State variable: balances_re_ent10: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 70, 1} {:message "balances_re_ent10"} balances_re_ent10#255: [address_t][address_t]int;
procedure {:inline 1} {:message "send"} __send(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
	returns (__result: bool)
{
	assume (__balance[__msg_sender] >= amount);
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	__result := true;
	}
	else {
	__result := false;
	}

}

// 
// Function: withdrawFunds_re_ent10 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 71, 1} {:message "Ownable::withdrawFunds_re_ent10"} withdrawFunds_re_ent10#288(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#257: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent10#255[__this][__msg_sender] >= _weiToWithdraw#257);
	assume {:sourceloc "buggy_27.sol", 74, 11} {:message ""} true;
	call __send_ret#7 := __send(__msg_sender, __this, 0, _weiToWithdraw#257);
	assume __send_ret#7;
	balances_re_ent10#255 := balances_re_ent10#255[__this := balances_re_ent10#255[__this][__msg_sender := (balances_re_ent10#255[__this][__msg_sender] - _weiToWithdraw#257)]];
	$return7:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_27.sol", 85, 5} {:message "Ownable::transferOwnership"} transferOwnership#325(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#301: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume (newOwner#301 != 0);
	assume {:sourceloc "buggy_27.sol", 87, 12} {:message ""} true;
	call OwnershipTransferred#242(__this, __msg_sender, __msg_value, owner#198[__this], newOwner#301);
	owner#198 := owner#198[__this := newOwner#301];
	$return9:
	// Function body ends here
	$return8:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 90, 1} {:message "balances_re_ent21"} balances_re_ent21#329: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_27.sol", 91, 5} {:message "Ownable::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#358(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 92, 9} {:message "success"} success#333: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#329[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#329[__this][__msg_sender])];
	assume {:sourceloc "buggy_27.sol", 92, 25} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(__msg_sender, __this, balances_re_ent21#329[__this][__msg_sender]);
	if (__call_ret#10) {
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#329[__this][__msg_sender])];
	}

	success#333 := __call_ret#10;
	if (success#333) {
	balances_re_ent21#329 := balances_re_ent21#329[__this := balances_re_ent21#329[__this][__msg_sender := 0]];
	}

	$return10:
	// Function body ends here
}

// 
// ------- Contract: ERC20Detailed -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_27.sol", 106, 3} {:message "[event] ERC20Detailed::Transfer"} Transfer#373(__this: address_t, __msg_sender: address_t, __msg_value: int, from#367: address_t, to#369: address_t, value#371: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_27.sol", 107, 3} {:message "[event] ERC20Detailed::Approval"} Approval#381(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#375: address_t, spender#377: address_t, value#379: int)
{
	
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_27.sol", 102, 3} {:message "_name"} _name#361: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_27.sol", 103, 3} {:message "_symbol"} _symbol#363: [address_t]int_arr_type;
// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_27.sol", 104, 3} {:message "_decimals"} _decimals#365: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 109, 3} {:message "ERC20Detailed::[constructor]"} __constructor#564(__this: address_t, __msg_sender: address_t, __msg_value: int, name#383: int_arr_ptr, symbol#385: int_arr_ptr, decimals#387: int)
{
	// TCC assumptions
	assume (name#383 < __alloc_counter);
	assume (symbol#385 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#361 := _name#361[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#363 := _symbol#363[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#365 := _decimals#365[__this := 0];
	userBalance_re_ent12#407 := userBalance_re_ent12#407[__this := default_address_t_int()];
	redeemableEther_re_ent11#448 := redeemableEther_re_ent11#448[__this := default_address_t_int()];
	balances_re_ent1#496 := balances_re_ent1#496[__this := default_address_t_int()];
	not_called_re_ent41#536 := not_called_re_ent41#536[__this := true];
	// Function body starts here
	_name#361 := _name#361[__this := mem_arr_int[name#383]];
	_symbol#363 := _symbol#363[__this := mem_arr_int[symbol#385]];
	_decimals#365 := _decimals#365[__this := decimals#387];
	$return11:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 114, 1} {:message "userBalance_re_ent12"} userBalance_re_ent12#407: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_27.sol", 115, 1} {:message "ERC20Detailed::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#436(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 118, 12} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, userBalance_re_ent12#407[__this][__msg_sender]);
	if (!(__send_ret#12)) {
	assume false;
	}

	userBalance_re_ent12#407 := userBalance_re_ent12#407[__this := userBalance_re_ent12#407[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 124, 3} {:message "ERC20Detailed::name"} name#444(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#439: int_arr_ptr)
{
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#439 := new_array#13;
	mem_arr_int := mem_arr_int[#439 := _name#361[__this]];
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 127, 1} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#448: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_27.sol", 128, 1} {:message "ERC20Detailed::claimReward_re_ent11"} claimReward_re_ent11#484(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 131, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#461: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#448[__this][__msg_sender] > 0);
	transferValue_re_ent11#461 := redeemableEther_re_ent11#448[__this][__msg_sender];
	assume {:sourceloc "buggy_27.sol", 132, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#461);
	redeemableEther_re_ent11#448 := redeemableEther_re_ent11#448[__this := redeemableEther_re_ent11#448[__this][__msg_sender := 0]];
	$return14:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_27.sol", 136, 3} {:message "ERC20Detailed::symbol"} symbol#492(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#487: int_arr_ptr)
{
	var new_array#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#487 := new_array#14;
	mem_arr_int := mem_arr_int[#487 := _symbol#363[__this]];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 139, 1} {:message "balances_re_ent1"} balances_re_ent1#496: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_27.sol", 140, 5} {:message "ERC20Detailed::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#525(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 141, 9} {:message "success"} success#500: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#496[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#496[__this][__msg_sender])];
	assume {:sourceloc "buggy_27.sol", 141, 25} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, balances_re_ent1#496[__this][__msg_sender]);
	if (__call_ret#15) {
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#15)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#496[__this][__msg_sender])];
	}

	success#500 := __call_ret#15;
	if (success#500) {
	balances_re_ent1#496 := balances_re_ent1#496[__this := balances_re_ent1#496[__this][__msg_sender := 0]];
	}

	$return16:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_27.sol", 146, 3} {:message "ERC20Detailed::decimals"} decimals#533(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#528: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#528 := _decimals#365[__this];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_27.sol", 149, 1} {:message "not_called_re_ent41"} not_called_re_ent41#536: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_27.sol", 150, 1} {:message "ERC20Detailed::bug_re_ent41"} bug_re_ent41#563(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#536[__this];
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 152, 12} {:message ""} true;
	call __send_ret#18 := __send(__msg_sender, __this, 0, call_arg#17);
	if (!(__send_ret#18)) {
	assume false;
	}

	not_called_re_ent41#536 := not_called_re_ent41#536[__this := false];
	$return18:
	// Function body ends here
}

// 
// ------- Contract: DanPanCoin -------
// Inherits from: ERC20Detailed
// Inherits from: Ownable
// 
// Event: DanPanPercentChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 240, 3} {:message "[event] DanPanCoin::DanPanPercentChanged"} DanPanPercentChanged#907(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPanPercent#903: int, newDanPanPercent#905: int)
{
	
}

// 
// Event: DanPanAddressChanged
procedure {:inline 1} {:sourceloc "buggy_27.sol", 249, 3} {:message "[event] DanPanCoin::DanPanAddressChanged"} DanPanAddressChanged#943(__this: address_t, __msg_sender: address_t, __msg_value: int, previousDanPan#939: address_t, newDanPan#941: address_t)
{
	
}

// 
// Event: WhitelistFrom
procedure {:inline 1} {:sourceloc "buggy_27.sol", 257, 3} {:message "[event] DanPanCoin::WhitelistFrom"} WhitelistFrom#986(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#982: address_t, _whitelisted#984: bool)
{
	
}

// 
// Event: WhitelistTo
procedure {:inline 1} {:sourceloc "buggy_27.sol", 267, 3} {:message "[event] DanPanCoin::WhitelistTo"} WhitelistTo#1027(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#1023: address_t, _whitelisted#1025: bool)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 162, 3} {:message "_balances"} _balances#575: [address_t][address_t]int;
// 
// State variable: redeemableEther_re_ent18: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 163, 1} {:message "redeemableEther_re_ent18"} redeemableEther_re_ent18#579: [address_t][address_t]int;
// 
// Function: claimReward_re_ent18 : function ()
procedure {:sourceloc "buggy_27.sol", 164, 1} {:message "DanPanCoin::claimReward_re_ent18"} claimReward_re_ent18#615(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 167, 9} {:message "transferValue_re_ent18"} transferValue_re_ent18#592: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent18#579[__this][__msg_sender] > 0);
	transferValue_re_ent18#592 := redeemableEther_re_ent18#579[__this][__msg_sender];
	assume {:sourceloc "buggy_27.sol", 168, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent18#592);
	redeemableEther_re_ent18#579 := redeemableEther_re_ent18#579[__this := redeemableEther_re_ent18#579[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_27.sol", 171, 3} {:message "_allowed"} _allowed#621: [address_t][address_t][address_t]int;
// 
// State variable: balances_re_ent29: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 173, 1} {:message "balances_re_ent29"} balances_re_ent29#625: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent29 : function ()
procedure {:sourceloc "buggy_27.sol", 174, 5} {:message "DanPanCoin::withdraw_balances_re_ent29"} withdraw_balances_re_ent29#648(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 175, 12} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, balances_re_ent29#625[__this][__msg_sender]);
	if (__send_ret#19) {
	balances_re_ent29#625 := balances_re_ent29#625[__this := balances_re_ent29#625[__this][__msg_sender := 0]];
	}

	$return20:
	// Function body ends here
}

// 
// State variable: not_called_re_ent6: bool
var {:sourceloc "buggy_27.sol", 179, 1} {:message "not_called_re_ent6"} not_called_re_ent6#654: [address_t]bool;
// 
// Function: bug_re_ent6 : function ()
procedure {:sourceloc "buggy_27.sol", 180, 1} {:message "DanPanCoin::bug_re_ent6"} bug_re_ent6#681(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent6#654[__this];
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 182, 12} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	assume false;
	}

	not_called_re_ent6#654 := not_called_re_ent6#654[__this := false];
	$return21:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent16: address payable
var {:sourceloc "buggy_27.sol", 188, 1} {:message "lastPlayer_re_ent16"} lastPlayer_re_ent16#686: [address_t]address_t;
// 
// State variable: jackpot_re_ent16: uint256
var {:sourceloc "buggy_27.sol", 189, 7} {:message "jackpot_re_ent16"} jackpot_re_ent16#688: [address_t]int;
// 
// Function: buyTicket_re_ent16 : function ()
procedure {:sourceloc "buggy_27.sol", 190, 4} {:message "DanPanCoin::buyTicket_re_ent16"} buyTicket_re_ent16#718(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 191, 12} {:message ""} true;
	call __send_ret#22 := __send(lastPlayer_re_ent16#686[__this], __this, 0, jackpot_re_ent16#688[__this]);
	if (!(__send_ret#22)) {
	assume false;
	}

	lastPlayer_re_ent16#686 := lastPlayer_re_ent16#686[__this := __msg_sender];
	jackpot_re_ent16#688 := jackpot_re_ent16#688[__this := __balance[__this]];
	$return22:
	// Function body ends here
}

// 
// State variable: balances_re_ent24: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 197, 1} {:message "balances_re_ent24"} balances_re_ent24#725: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent24 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 198, 1} {:message "DanPanCoin::withdrawFunds_re_ent24"} withdrawFunds_re_ent24#758(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#727: int)
{
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent24#725[__this][__msg_sender] >= _weiToWithdraw#727);
	assume {:sourceloc "buggy_27.sol", 201, 11} {:message ""} true;
	call __send_ret#23 := __send(__msg_sender, __this, 0, _weiToWithdraw#727);
	assume __send_ret#23;
	balances_re_ent24#725 := balances_re_ent24#725[__this := balances_re_ent24#725[__this][__msg_sender := (balances_re_ent24#725[__this][__msg_sender] - _weiToWithdraw#727)]];
	$return23:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_27.sol", 204, 3} {:message "_totalSupply"} _totalSupply#761: [address_t]int;
// 
// State variable: userBalance_re_ent5: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 205, 1} {:message "userBalance_re_ent5"} userBalance_re_ent5#765: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent5 : function ()
procedure {:sourceloc "buggy_27.sol", 206, 1} {:message "DanPanCoin::withdrawBalance_re_ent5"} withdrawBalance_re_ent5#794(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 209, 12} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, userBalance_re_ent5#765[__this][__msg_sender]);
	if (!(__send_ret#24)) {
	assume false;
	}

	userBalance_re_ent5#765 := userBalance_re_ent5#765[__this := userBalance_re_ent5#765[__this][__msg_sender := 0]];
	$return24:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_27.sol", 214, 3} {:message "basePercent"} basePercent#797: [address_t]int;
// 
// State variable: balances_re_ent15: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 215, 1} {:message "balances_re_ent15"} balances_re_ent15#801: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent15 : function ()
procedure {:sourceloc "buggy_27.sol", 216, 5} {:message "DanPanCoin::withdraw_balances_re_ent15"} withdraw_balances_re_ent15#824(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 217, 12} {:message ""} true;
	call __send_ret#25 := __send(__msg_sender, __this, 0, balances_re_ent15#801[__this][__msg_sender]);
	if (__send_ret#25) {
	balances_re_ent15#801 := balances_re_ent15#801[__this := balances_re_ent15#801[__this][__msg_sender := 0]];
	}

	$return25:
	// Function body ends here
}

// 
// State variable: dpPercent: uint256
var {:sourceloc "buggy_27.sol", 220, 3} {:message "dpPercent"} dpPercent#827: [address_t]int;
// 
// State variable: counter_re_ent28: uint256
var {:sourceloc "buggy_27.sol", 221, 1} {:message "counter_re_ent28"} counter_re_ent28#830: [address_t]int;
// 
// Function: callme_re_ent28 : function ()
procedure {:sourceloc "buggy_27.sol", 222, 1} {:message "DanPanCoin::callme_re_ent28"} callme_re_ent28#859(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent28#830[__this] <= 5);
	call_arg#26 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 224, 9} {:message ""} true;
	call __send_ret#27 := __send(__msg_sender, __this, 0, call_arg#26);
	if (!(__send_ret#27)) {
	assume false;
	}

	counter_re_ent28#830 := counter_re_ent28#830[__this := (counter_re_ent28#830[__this] + 1)];
	$return26:
	// Function body ends here
}

// 
// State variable: DanPanAddress: address
var {:sourceloc "buggy_27.sol", 229, 3} {:message "DanPanAddress"} DanPanAddress#863: [address_t]address_t;
// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 230, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#867: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_27.sol", 231, 1} {:message "DanPanCoin::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#901(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 234, 3} {:message "success"} success#871: bool;
	var __call_ret#28: bool;
	var __call_ret#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#867[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#867[__this][__msg_sender])];
	assume {:sourceloc "buggy_27.sol", 234, 19} {:message ""} true;
	call __call_ret#28, __call_ret#29 := __call(__msg_sender, __this, userBalance_re_ent33#867[__this][__msg_sender]);
	if (__call_ret#28) {
	havoc _balances#575;
	havoc redeemableEther_re_ent18#579;
	havoc _allowed#621;
	havoc balances_re_ent29#625;
	havoc not_called_re_ent6#654;
	havoc lastPlayer_re_ent16#686;
	havoc jackpot_re_ent16#688;
	havoc balances_re_ent24#725;
	havoc _totalSupply#761;
	havoc userBalance_re_ent5#765;
	havoc basePercent#797;
	havoc balances_re_ent15#801;
	havoc dpPercent#827;
	havoc counter_re_ent28#830;
	havoc DanPanAddress#863;
	havoc userBalance_re_ent33#867;
	havoc not_called_re_ent27#910;
	havoc balances_re_ent31#947;
	havoc not_called_re_ent13#989;
	havoc not_called_re_ent34#1030;
	havoc whitelistFrom#1061;
	havoc counter_re_ent21#1064;
	havoc whitelistTo#1097;
	havoc counter_re_ent42#1121;
	havoc lastPlayer_re_ent2#1160;
	havoc jackpot_re_ent2#1162;
	havoc balances_re_ent17#1208;
	havoc lastPlayer_re_ent37#1265;
	havoc jackpot_re_ent37#1267;
	havoc balances_re_ent3#1328;
	havoc lastPlayer_re_ent9#1399;
	havoc jackpot_re_ent9#1401;
	havoc redeemableEther_re_ent25#1604;
	havoc userBalance_re_ent19#1676;
	havoc userBalance_re_ent26#1746;
	havoc not_called_re_ent20#1969;
	havoc redeemableEther_re_ent32#2051;
	havoc balances_re_ent38#2142;
	havoc redeemableEther_re_ent4#2213;
	havoc counter_re_ent7#2264;
	havoc lastPlayer_re_ent23#2344;
	havoc jackpot_re_ent23#2346;
	havoc counter_re_ent14#2420;
	havoc lastPlayer_re_ent30#2477;
	havoc jackpot_re_ent30#2479;
	havoc balances_re_ent8#2530;
	havoc redeemableEther_re_ent39#2581;
	havoc balances_re_ent36#2642;
	havoc counter_re_ent35#2689;
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#28)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#867[__this][__msg_sender])];
	}

	success#871 := __call_ret#28;
	if (!(success#871)) {
	assume false;
	}

	userBalance_re_ent33#867 := userBalance_re_ent33#867[__this := userBalance_re_ent33#867[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_27.sol", 241, 1} {:message "not_called_re_ent27"} not_called_re_ent27#910: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_27.sol", 242, 1} {:message "DanPanCoin::bug_re_ent27"} bug_re_ent27#937(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#910[__this];
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 244, 12} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	not_called_re_ent27#910 := not_called_re_ent27#910[__this := false];
	$return28:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 250, 1} {:message "balances_re_ent31"} balances_re_ent31#947: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 251, 1} {:message "DanPanCoin::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#980(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#949: int)
{
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#947[__this][__msg_sender] >= _weiToWithdraw#949);
	assume {:sourceloc "buggy_27.sol", 254, 11} {:message ""} true;
	call __send_ret#32 := __send(__msg_sender, __this, 0, _weiToWithdraw#949);
	assume __send_ret#32;
	balances_re_ent31#947 := balances_re_ent31#947[__this := balances_re_ent31#947[__this][__msg_sender := (balances_re_ent31#947[__this][__msg_sender] - _weiToWithdraw#949)]];
	$return29:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_27.sol", 258, 1} {:message "not_called_re_ent13"} not_called_re_ent13#989: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_27.sol", 259, 1} {:message "DanPanCoin::bug_re_ent13"} bug_re_ent13#1021(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 261, 3} {:message "success"} success#997: bool;
	var __call_ret#33: bool;
	var __call_ret#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#989[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_27.sol", 261, 18} {:message ""} true;
	call __call_ret#33, __call_ret#34 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#33) {
	havoc _balances#575;
	havoc redeemableEther_re_ent18#579;
	havoc _allowed#621;
	havoc balances_re_ent29#625;
	havoc not_called_re_ent6#654;
	havoc lastPlayer_re_ent16#686;
	havoc jackpot_re_ent16#688;
	havoc balances_re_ent24#725;
	havoc _totalSupply#761;
	havoc userBalance_re_ent5#765;
	havoc basePercent#797;
	havoc balances_re_ent15#801;
	havoc dpPercent#827;
	havoc counter_re_ent28#830;
	havoc DanPanAddress#863;
	havoc userBalance_re_ent33#867;
	havoc not_called_re_ent27#910;
	havoc balances_re_ent31#947;
	havoc not_called_re_ent13#989;
	havoc not_called_re_ent34#1030;
	havoc whitelistFrom#1061;
	havoc counter_re_ent21#1064;
	havoc whitelistTo#1097;
	havoc counter_re_ent42#1121;
	havoc lastPlayer_re_ent2#1160;
	havoc jackpot_re_ent2#1162;
	havoc balances_re_ent17#1208;
	havoc lastPlayer_re_ent37#1265;
	havoc jackpot_re_ent37#1267;
	havoc balances_re_ent3#1328;
	havoc lastPlayer_re_ent9#1399;
	havoc jackpot_re_ent9#1401;
	havoc redeemableEther_re_ent25#1604;
	havoc userBalance_re_ent19#1676;
	havoc userBalance_re_ent26#1746;
	havoc not_called_re_ent20#1969;
	havoc redeemableEther_re_ent32#2051;
	havoc balances_re_ent38#2142;
	havoc redeemableEther_re_ent4#2213;
	havoc counter_re_ent7#2264;
	havoc lastPlayer_re_ent23#2344;
	havoc jackpot_re_ent23#2346;
	havoc counter_re_ent14#2420;
	havoc lastPlayer_re_ent30#2477;
	havoc jackpot_re_ent30#2479;
	havoc balances_re_ent8#2530;
	havoc redeemableEther_re_ent39#2581;
	havoc balances_re_ent36#2642;
	havoc counter_re_ent35#2689;
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#33)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#997 := __call_ret#33;
	if (!(success#997)) {
	assume false;
	}

	not_called_re_ent13#989 := not_called_re_ent13#989[__this := false];
	$return30:
	// Function body ends here
}

// 
// State variable: not_called_re_ent34: bool
var {:sourceloc "buggy_27.sol", 270, 3} {:message "not_called_re_ent34"} not_called_re_ent34#1030: [address_t]bool;
// 
// Function: bug_re_ent34 : function ()
procedure {:sourceloc "buggy_27.sol", 271, 1} {:message "DanPanCoin::bug_re_ent34"} bug_re_ent34#1057(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent34#1030[__this];
	call_arg#35 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 273, 12} {:message ""} true;
	call __send_ret#36 := __send(__msg_sender, __this, 0, call_arg#35);
	if (!(__send_ret#36)) {
	assume false;
	}

	not_called_re_ent34#1030 := not_called_re_ent34#1030[__this := false];
	$return31:
	// Function body ends here
}

// 
// State variable: whitelistFrom: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 278, 3} {:message "whitelistFrom"} whitelistFrom#1061: [address_t][address_t]bool;
// 
// State variable: counter_re_ent21: uint256
var {:sourceloc "buggy_27.sol", 279, 3} {:message "counter_re_ent21"} counter_re_ent21#1064: [address_t]int;
// 
// Function: callme_re_ent21 : function ()
procedure {:sourceloc "buggy_27.sol", 280, 1} {:message "DanPanCoin::callme_re_ent21"} callme_re_ent21#1093(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent21#1064[__this] <= 5);
	call_arg#37 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 282, 9} {:message ""} true;
	call __send_ret#38 := __send(__msg_sender, __this, 0, call_arg#37);
	if (!(__send_ret#38)) {
	assume false;
	}

	counter_re_ent21#1064 := counter_re_ent21#1064[__this := (counter_re_ent21#1064[__this] + 1)];
	$return32:
	// Function body ends here
}

// 
// State variable: whitelistTo: mapping(address => bool)
var {:sourceloc "buggy_27.sol", 287, 3} {:message "whitelistTo"} whitelistTo#1097: [address_t][address_t]bool;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_27.sol", 289, 3} {:message "DanPanCoin::[constructor]"} __constructor#2719(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1099: int_arr_ptr, _symbol#1101: int_arr_ptr, _decimals#1103: int)
{
	var name#383#40: int_arr_ptr;
	var symbol#385#40: int_arr_ptr;
	var decimals#387#40: int;
	var call_arg#42: address_t;
	// TCC assumptions
	assume (_name#1099 < __alloc_counter);
	assume (_symbol#1101 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#575 := _balances#575[__this := default_address_t_int()];
	redeemableEther_re_ent18#579 := redeemableEther_re_ent18#579[__this := default_address_t_int()];
	_allowed#621 := _allowed#621[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent29#625 := balances_re_ent29#625[__this := default_address_t_int()];
	not_called_re_ent6#654 := not_called_re_ent6#654[__this := true];
	lastPlayer_re_ent16#686 := lastPlayer_re_ent16#686[__this := 0];
	jackpot_re_ent16#688 := jackpot_re_ent16#688[__this := 0];
	balances_re_ent24#725 := balances_re_ent24#725[__this := default_address_t_int()];
	_totalSupply#761 := _totalSupply#761[__this := 10000000000];
	userBalance_re_ent5#765 := userBalance_re_ent5#765[__this := default_address_t_int()];
	basePercent#797 := basePercent#797[__this := 100];
	balances_re_ent15#801 := balances_re_ent15#801[__this := default_address_t_int()];
	dpPercent#827 := dpPercent#827[__this := 5];
	counter_re_ent28#830 := counter_re_ent28#830[__this := 0];
	DanPanAddress#863 := DanPanAddress#863[__this := __msg_sender];
	userBalance_re_ent33#867 := userBalance_re_ent33#867[__this := default_address_t_int()];
	not_called_re_ent27#910 := not_called_re_ent27#910[__this := true];
	balances_re_ent31#947 := balances_re_ent31#947[__this := default_address_t_int()];
	not_called_re_ent13#989 := not_called_re_ent13#989[__this := true];
	not_called_re_ent34#1030 := not_called_re_ent34#1030[__this := true];
	whitelistFrom#1061 := whitelistFrom#1061[__this := default_address_t_bool()];
	counter_re_ent21#1064 := counter_re_ent21#1064[__this := 0];
	whitelistTo#1097 := whitelistTo#1097[__this := default_address_t_bool()];
	counter_re_ent42#1121 := counter_re_ent42#1121[__this := 0];
	lastPlayer_re_ent2#1160 := lastPlayer_re_ent2#1160[__this := 0];
	jackpot_re_ent2#1162 := jackpot_re_ent2#1162[__this := 0];
	balances_re_ent17#1208 := balances_re_ent17#1208[__this := default_address_t_int()];
	lastPlayer_re_ent37#1265 := lastPlayer_re_ent37#1265[__this := 0];
	jackpot_re_ent37#1267 := jackpot_re_ent37#1267[__this := 0];
	balances_re_ent3#1328 := balances_re_ent3#1328[__this := default_address_t_int()];
	lastPlayer_re_ent9#1399 := lastPlayer_re_ent9#1399[__this := 0];
	jackpot_re_ent9#1401 := jackpot_re_ent9#1401[__this := 0];
	redeemableEther_re_ent25#1604 := redeemableEther_re_ent25#1604[__this := default_address_t_int()];
	userBalance_re_ent19#1676 := userBalance_re_ent19#1676[__this := default_address_t_int()];
	userBalance_re_ent26#1746 := userBalance_re_ent26#1746[__this := default_address_t_int()];
	not_called_re_ent20#1969 := not_called_re_ent20#1969[__this := true];
	redeemableEther_re_ent32#2051 := redeemableEther_re_ent32#2051[__this := default_address_t_int()];
	balances_re_ent38#2142 := balances_re_ent38#2142[__this := default_address_t_int()];
	redeemableEther_re_ent4#2213 := redeemableEther_re_ent4#2213[__this := default_address_t_int()];
	counter_re_ent7#2264 := counter_re_ent7#2264[__this := 0];
	lastPlayer_re_ent23#2344 := lastPlayer_re_ent23#2344[__this := 0];
	jackpot_re_ent23#2346 := jackpot_re_ent23#2346[__this := 0];
	counter_re_ent14#2420 := counter_re_ent14#2420[__this := 0];
	lastPlayer_re_ent30#2477 := lastPlayer_re_ent30#2477[__this := 0];
	jackpot_re_ent30#2479 := jackpot_re_ent30#2479[__this := 0];
	balances_re_ent8#2530 := balances_re_ent8#2530[__this := default_address_t_int()];
	redeemableEther_re_ent39#2581 := redeemableEther_re_ent39#2581[__this := default_address_t_int()];
	balances_re_ent36#2642 := balances_re_ent36#2642[__this := default_address_t_int()];
	counter_re_ent35#2689 := counter_re_ent35#2689[__this := 0];
	owner#198 := owner#198[__this := 0];
	userBalance_re_ent40#202 := userBalance_re_ent40#202[__this := default_address_t_int()];
	balances_re_ent10#255 := balances_re_ent10#255[__this := default_address_t_int()];
	balances_re_ent21#329 := balances_re_ent21#329[__this := default_address_t_int()];
	_name#361 := _name#361[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#363 := _symbol#363[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#365 := _decimals#365[__this := 0];
	userBalance_re_ent12#407 := userBalance_re_ent12#407[__this := default_address_t_int()];
	redeemableEther_re_ent11#448 := redeemableEther_re_ent11#448[__this := default_address_t_int()];
	balances_re_ent1#496 := balances_re_ent1#496[__this := default_address_t_int()];
	not_called_re_ent41#536 := not_called_re_ent41#536[__this := true];
	// Arguments for Ownable
	// Arguments for ERC20Detailed
	name#383#40 := _name#1099;
	symbol#385#40 := _symbol#1101;
	decimals#387#40 := _decimals#1103;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#361 := _name#361[__this := mem_arr_int[name#383#40]];
	_symbol#363 := _symbol#363[__this := mem_arr_int[symbol#385#40]];
	_decimals#365 := _decimals#365[__this := decimals#387#40];
	$return33:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#198 := owner#198[__this := __msg_sender];
	$return34:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	call_arg#42 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 290, 5} {:message ""} true;
	call _mint#2209(__this, __msg_sender, __msg_value, call_arg#42, _totalSupply#761[__this]);
	$return35:
	// Function body ends here
}

// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_27.sol", 292, 1} {:message "counter_re_ent42"} counter_re_ent42#1121: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_27.sol", 293, 1} {:message "DanPanCoin::callme_re_ent42"} callme_re_ent42#1150(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#1121[__this] <= 5);
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 295, 9} {:message ""} true;
	call __send_ret#44 := __send(__msg_sender, __this, 0, call_arg#43);
	if (!(__send_ret#44)) {
	assume false;
	}

	counter_re_ent42#1121 := counter_re_ent42#1121[__this := (counter_re_ent42#1121[__this] + 1)];
	$return36:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 301, 3} {:message "DanPanCoin::totalSupply"} totalSupply#1158(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1153: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1153 := _totalSupply#761[__this];
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_27.sol", 304, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#1160: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_27.sol", 305, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#1162: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_27.sol", 306, 4} {:message "DanPanCoin::buyTicket_re_ent2"} buyTicket_re_ent2#1192(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 307, 12} {:message ""} true;
	call __send_ret#45 := __send(lastPlayer_re_ent2#1160[__this], __this, 0, jackpot_re_ent2#1162[__this]);
	if (!(__send_ret#45)) {
	assume false;
	}

	lastPlayer_re_ent2#1160 := lastPlayer_re_ent2#1160[__this := __msg_sender];
	jackpot_re_ent2#1162 := jackpot_re_ent2#1162[__this := __balance[__this]];
	$return38:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 313, 3} {:message "DanPanCoin::balanceOf"} balanceOf#1204(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1194: address_t)
	returns (#1197: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1197 := _balances#575[__this][owner#1194];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 316, 1} {:message "balances_re_ent17"} balances_re_ent17#1208: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 317, 1} {:message "DanPanCoin::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#1247(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1210: int)
{
	var {:sourceloc "buggy_27.sol", 320, 3} {:message "success"} success#1223: bool;
	var __call_ret#46: bool;
	var __call_ret#47: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#1208[__this][__msg_sender] >= _weiToWithdraw#1210);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1210);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1210)];
	assume {:sourceloc "buggy_27.sol", 320, 18} {:message ""} true;
	call __call_ret#46, __call_ret#47 := __call(__msg_sender, __this, _weiToWithdraw#1210);
	if (__call_ret#46) {
	havoc _balances#575;
	havoc redeemableEther_re_ent18#579;
	havoc _allowed#621;
	havoc balances_re_ent29#625;
	havoc not_called_re_ent6#654;
	havoc lastPlayer_re_ent16#686;
	havoc jackpot_re_ent16#688;
	havoc balances_re_ent24#725;
	havoc _totalSupply#761;
	havoc userBalance_re_ent5#765;
	havoc basePercent#797;
	havoc balances_re_ent15#801;
	havoc dpPercent#827;
	havoc counter_re_ent28#830;
	havoc DanPanAddress#863;
	havoc userBalance_re_ent33#867;
	havoc not_called_re_ent27#910;
	havoc balances_re_ent31#947;
	havoc not_called_re_ent13#989;
	havoc not_called_re_ent34#1030;
	havoc whitelistFrom#1061;
	havoc counter_re_ent21#1064;
	havoc whitelistTo#1097;
	havoc counter_re_ent42#1121;
	havoc lastPlayer_re_ent2#1160;
	havoc jackpot_re_ent2#1162;
	havoc balances_re_ent17#1208;
	havoc lastPlayer_re_ent37#1265;
	havoc jackpot_re_ent37#1267;
	havoc balances_re_ent3#1328;
	havoc lastPlayer_re_ent9#1399;
	havoc jackpot_re_ent9#1401;
	havoc redeemableEther_re_ent25#1604;
	havoc userBalance_re_ent19#1676;
	havoc userBalance_re_ent26#1746;
	havoc not_called_re_ent20#1969;
	havoc redeemableEther_re_ent32#2051;
	havoc balances_re_ent38#2142;
	havoc redeemableEther_re_ent4#2213;
	havoc counter_re_ent7#2264;
	havoc lastPlayer_re_ent23#2344;
	havoc jackpot_re_ent23#2346;
	havoc counter_re_ent14#2420;
	havoc lastPlayer_re_ent30#2477;
	havoc jackpot_re_ent30#2479;
	havoc balances_re_ent8#2530;
	havoc redeemableEther_re_ent39#2581;
	havoc balances_re_ent36#2642;
	havoc counter_re_ent35#2689;
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#46)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1210)];
	}

	success#1223 := __call_ret#46;
	assume success#1223;
	balances_re_ent17#1208 := balances_re_ent17#1208[__this := balances_re_ent17#1208[__this][__msg_sender := (balances_re_ent17#1208[__this][__msg_sender] - _weiToWithdraw#1210)]];
	$return40:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 325, 3} {:message "DanPanCoin::allowance"} allowance#1263(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1249: address_t, spender#1251: address_t)
	returns (#1254: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1254 := _allowed#621[__this][owner#1249][spender#1251];
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_27.sol", 328, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#1265: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_27.sol", 329, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#1267: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_27.sol", 330, 4} {:message "DanPanCoin::buyTicket_re_ent37"} buyTicket_re_ent37#1297(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 331, 12} {:message ""} true;
	call __send_ret#48 := __send(lastPlayer_re_ent37#1265[__this], __this, 0, jackpot_re_ent37#1267[__this]);
	if (!(__send_ret#48)) {
	assume false;
	}

	lastPlayer_re_ent37#1265 := lastPlayer_re_ent37#1265[__this := __msg_sender];
	jackpot_re_ent37#1267 := jackpot_re_ent37#1267[__this := __balance[__this]];
	$return42:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 337, 3} {:message "DanPanCoin::findOnePercent"} findOnePercent#1324(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1299: int)
	returns (#1302: int)
{
	var {:sourceloc "buggy_27.sol", 338, 5} {:message "roundValue"} roundValue#1305: int;
	var ceil#195_ret#49: int;
	var {:sourceloc "buggy_27.sol", 339, 5} {:message "onePercent"} onePercent#1312: int;
	var mul#101_ret#50: int;
	var call_arg#51: int;
	var div#119_ret#52: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 338, 26} {:message ""} true;
	call ceil#195_ret#49 := ceil#195(__this, __msg_sender, __msg_value, value#1299, basePercent#797[__this]);
	roundValue#1305 := ceil#195_ret#49;
	assume {:sourceloc "buggy_27.sol", 339, 26} {:message ""} true;
	call mul#101_ret#50 := mul#101(__this, __msg_sender, __msg_value, roundValue#1305, basePercent#797[__this]);
	call_arg#51 := 10000;
	assume {:sourceloc "buggy_27.sol", 339, 26} {:message ""} true;
	call div#119_ret#52 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#50, call_arg#51);
	onePercent#1312 := div#119_ret#52;
	#1302 := onePercent#1312;
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 342, 1} {:message "balances_re_ent3"} balances_re_ent3#1328: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 343, 1} {:message "DanPanCoin::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#1367(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1330: int)
{
	var {:sourceloc "buggy_27.sol", 346, 3} {:message "success"} success#1343: bool;
	var __call_ret#53: bool;
	var __call_ret#54: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#1328[__this][__msg_sender] >= _weiToWithdraw#1330);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1330);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1330)];
	assume {:sourceloc "buggy_27.sol", 346, 19} {:message ""} true;
	call __call_ret#53, __call_ret#54 := __call(__msg_sender, __this, _weiToWithdraw#1330);
	if (__call_ret#53) {
	havoc _balances#575;
	havoc redeemableEther_re_ent18#579;
	havoc _allowed#621;
	havoc balances_re_ent29#625;
	havoc not_called_re_ent6#654;
	havoc lastPlayer_re_ent16#686;
	havoc jackpot_re_ent16#688;
	havoc balances_re_ent24#725;
	havoc _totalSupply#761;
	havoc userBalance_re_ent5#765;
	havoc basePercent#797;
	havoc balances_re_ent15#801;
	havoc dpPercent#827;
	havoc counter_re_ent28#830;
	havoc DanPanAddress#863;
	havoc userBalance_re_ent33#867;
	havoc not_called_re_ent27#910;
	havoc balances_re_ent31#947;
	havoc not_called_re_ent13#989;
	havoc not_called_re_ent34#1030;
	havoc whitelistFrom#1061;
	havoc counter_re_ent21#1064;
	havoc whitelistTo#1097;
	havoc counter_re_ent42#1121;
	havoc lastPlayer_re_ent2#1160;
	havoc jackpot_re_ent2#1162;
	havoc balances_re_ent17#1208;
	havoc lastPlayer_re_ent37#1265;
	havoc jackpot_re_ent37#1267;
	havoc balances_re_ent3#1328;
	havoc lastPlayer_re_ent9#1399;
	havoc jackpot_re_ent9#1401;
	havoc redeemableEther_re_ent25#1604;
	havoc userBalance_re_ent19#1676;
	havoc userBalance_re_ent26#1746;
	havoc not_called_re_ent20#1969;
	havoc redeemableEther_re_ent32#2051;
	havoc balances_re_ent38#2142;
	havoc redeemableEther_re_ent4#2213;
	havoc counter_re_ent7#2264;
	havoc lastPlayer_re_ent23#2344;
	havoc jackpot_re_ent23#2346;
	havoc counter_re_ent14#2420;
	havoc lastPlayer_re_ent30#2477;
	havoc jackpot_re_ent30#2479;
	havoc balances_re_ent8#2530;
	havoc redeemableEther_re_ent39#2581;
	havoc balances_re_ent36#2642;
	havoc counter_re_ent35#2689;
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#53)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1330)];
	}

	success#1343 := __call_ret#53;
	assume success#1343;
	balances_re_ent3#1328 := balances_re_ent3#1328[__this := balances_re_ent3#1328[__this][__msg_sender := (balances_re_ent3#1328[__this][__msg_sender] - _weiToWithdraw#1330)]];
	$return44:
	// Function body ends here
}

// 
// Function: findDPPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_27.sol", 350, 3} {:message "DanPanCoin::findDPPercent"} findDPPercent#1397(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1369: int)
	returns (#1372: int)
{
	var {:sourceloc "buggy_27.sol", 351, 5} {:message "roundValue"} roundValue#1375: int;
	var ceil#195_ret#55: int;
	var {:sourceloc "buggy_27.sol", 352, 5} {:message "DPPercent"} DPPercent#1382: int;
	var mul#101_ret#56: int;
	var call_arg#57: int;
	var div#119_ret#58: int;
	var mul#101_ret#59: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 351, 26} {:message ""} true;
	call ceil#195_ret#55 := ceil#195(__this, __msg_sender, __msg_value, value#1369, basePercent#797[__this]);
	roundValue#1375 := ceil#195_ret#55;
	assume {:sourceloc "buggy_27.sol", 352, 25} {:message ""} true;
	call mul#101_ret#56 := mul#101(__this, __msg_sender, __msg_value, roundValue#1375, basePercent#797[__this]);
	call_arg#57 := 10000;
	assume {:sourceloc "buggy_27.sol", 352, 25} {:message ""} true;
	call div#119_ret#58 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#56, call_arg#57);
	assume {:sourceloc "buggy_27.sol", 352, 25} {:message ""} true;
	call mul#101_ret#59 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#58, dpPercent#827[__this]);
	DPPercent#1382 := mul#101_ret#59;
	#1372 := DPPercent#1382;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_27.sol", 355, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#1399: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_27.sol", 356, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#1401: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_27.sol", 357, 4} {:message "DanPanCoin::buyTicket_re_ent9"} buyTicket_re_ent9#1436(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 358, 8} {:message "success"} success#1405: bool;
	var __call_ret#60: bool;
	var __call_ret#61: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#1401[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#1401[__this])];
	assume {:sourceloc "buggy_27.sol", 358, 25} {:message ""} true;
	call __call_ret#60, __call_ret#61 := __call(lastPlayer_re_ent9#1399[__this], __this, jackpot_re_ent9#1401[__this]);
	if (__call_ret#60) {
	havoc _balances#575;
	havoc redeemableEther_re_ent18#579;
	havoc _allowed#621;
	havoc balances_re_ent29#625;
	havoc not_called_re_ent6#654;
	havoc lastPlayer_re_ent16#686;
	havoc jackpot_re_ent16#688;
	havoc balances_re_ent24#725;
	havoc _totalSupply#761;
	havoc userBalance_re_ent5#765;
	havoc basePercent#797;
	havoc balances_re_ent15#801;
	havoc dpPercent#827;
	havoc counter_re_ent28#830;
	havoc DanPanAddress#863;
	havoc userBalance_re_ent33#867;
	havoc not_called_re_ent27#910;
	havoc balances_re_ent31#947;
	havoc not_called_re_ent13#989;
	havoc not_called_re_ent34#1030;
	havoc whitelistFrom#1061;
	havoc counter_re_ent21#1064;
	havoc whitelistTo#1097;
	havoc counter_re_ent42#1121;
	havoc lastPlayer_re_ent2#1160;
	havoc jackpot_re_ent2#1162;
	havoc balances_re_ent17#1208;
	havoc lastPlayer_re_ent37#1265;
	havoc jackpot_re_ent37#1267;
	havoc balances_re_ent3#1328;
	havoc lastPlayer_re_ent9#1399;
	havoc jackpot_re_ent9#1401;
	havoc redeemableEther_re_ent25#1604;
	havoc userBalance_re_ent19#1676;
	havoc userBalance_re_ent26#1746;
	havoc not_called_re_ent20#1969;
	havoc redeemableEther_re_ent32#2051;
	havoc balances_re_ent38#2142;
	havoc redeemableEther_re_ent4#2213;
	havoc counter_re_ent7#2264;
	havoc lastPlayer_re_ent23#2344;
	havoc jackpot_re_ent23#2346;
	havoc counter_re_ent14#2420;
	havoc lastPlayer_re_ent30#2477;
	havoc jackpot_re_ent30#2479;
	havoc balances_re_ent8#2530;
	havoc redeemableEther_re_ent39#2581;
	havoc balances_re_ent36#2642;
	havoc counter_re_ent35#2689;
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#60)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#1401[__this])];
	}

	success#1405 := __call_ret#60;
	if (!(success#1405)) {
	assume false;
	}

	lastPlayer_re_ent9#1399 := lastPlayer_re_ent9#1399[__this := __msg_sender];
	jackpot_re_ent9#1401 := jackpot_re_ent9#1401[__this := __balance[__this]];
	$return46:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 365, 3} {:message "DanPanCoin::transfer"} transfer#1600(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1438: address_t, value#1440: int)
	returns (#1443: bool)
{
	var call_arg#62: address_t;
	var call_arg#63: int;
	var {:sourceloc "buggy_27.sol", 380, 9} {:message "tokensToTransfer"} tokensToTransfer#1478: int;
	var {:sourceloc "buggy_27.sol", 381, 9} {:message "tokensToBurn"} tokensToBurn#1482: int;
	var {:sourceloc "buggy_27.sol", 382, 9} {:message "tokensToDanPan"} tokensToDanPan#1486: int;
	var sub#139_ret#64: int;
	var call_arg#65: address_t;
	var _isWhitelisted#2577_ret#66: bool;
	var findOnePercent#1324_ret#67: int;
	var findDPPercent#1397_ret#68: int;
	var sub#139_ret#69: int;
	var sub#139_ret#70: int;
	var sub#139_ret#71: int;
	var call_arg#72: address_t;
	var call_arg#73: address_t;
	var add#163_ret#74: int;
	var call_arg#75: address_t;
	var add#163_ret#76: int;
	var add#163_ret#77: int;
	var add#163_ret#78: int;
	var call_arg#79: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1440 <= _balances#575[__this][__msg_sender]);
	assume (to#1438 != 0);
	if ((value#1440 == 0)) {
	call_arg#62 := __msg_sender;
	call_arg#63 := 0;
	assume {:sourceloc "buggy_27.sol", 372, 18} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, call_arg#62, to#1438, call_arg#63);
	#1443 := true;
	goto $return47;
	}

	tokensToTransfer#1478 := value#1440;
	tokensToBurn#1482 := 0;
	tokensToDanPan#1486 := 0;
	assume {:sourceloc "buggy_27.sol", 386, 33} {:message ""} true;
	call sub#139_ret#64 := sub#139(__this, __msg_sender, __msg_value, _balances#575[__this][__msg_sender], value#1440);
	_balances#575 := _balances#575[__this := _balances#575[__this][__msg_sender := sub#139_ret#64]];
	call_arg#65 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 390, 14} {:message ""} true;
	call _isWhitelisted#2577_ret#66 := _isWhitelisted#2577(__this, __msg_sender, __msg_value, call_arg#65, to#1438);
	if (!(_isWhitelisted#2577_ret#66)) {
	assume {:sourceloc "buggy_27.sol", 392, 30} {:message ""} true;
	call findOnePercent#1324_ret#67 := findOnePercent#1324(__this, __msg_sender, __msg_value, value#1440);
	tokensToBurn#1482 := findOnePercent#1324_ret#67;
	assume {:sourceloc "buggy_27.sol", 393, 32} {:message ""} true;
	call findDPPercent#1397_ret#68 := findDPPercent#1397(__this, __msg_sender, __msg_value, value#1440);
	tokensToDanPan#1486 := findDPPercent#1397_ret#68;
	assume {:sourceloc "buggy_27.sol", 396, 33} {:message ""} true;
	call sub#139_ret#69 := sub#139(__this, __msg_sender, __msg_value, value#1440, tokensToBurn#1482);
	assume {:sourceloc "buggy_27.sol", 396, 33} {:message ""} true;
	call sub#139_ret#70 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#69, tokensToDanPan#1486);
	tokensToTransfer#1478 := sub#139_ret#70;
	assume {:sourceloc "buggy_27.sol", 399, 28} {:message ""} true;
	call sub#139_ret#71 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#761[__this], tokensToBurn#1482);
	_totalSupply#761 := _totalSupply#761[__this := sub#139_ret#71];
	call_arg#72 := __msg_sender;
	call_arg#73 := 0;
	assume {:sourceloc "buggy_27.sol", 400, 18} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, call_arg#72, call_arg#73, tokensToBurn#1482);
	assume {:sourceloc "buggy_27.sol", 404, 40} {:message ""} true;
	call add#163_ret#74 := add#163(__this, __msg_sender, __msg_value, _balances#575[__this][DanPanAddress#863[__this]], tokensToDanPan#1486);
	_balances#575 := _balances#575[__this := _balances#575[__this][DanPanAddress#863[__this] := add#163_ret#74]];
	call_arg#75 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 405, 18} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, call_arg#75, DanPanAddress#863[__this], tokensToDanPan#1486);
	}

	assume {:sourceloc "buggy_27.sol", 411, 16} {:message ""} true;
	call add#163_ret#76 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#1482, tokensToTransfer#1478);
	assume {:sourceloc "buggy_27.sol", 411, 16} {:message ""} true;
	call add#163_ret#77 := add#163(__this, __msg_sender, __msg_value, add#163_ret#76, tokensToDanPan#1486);
	assert {:sourceloc "buggy_27.sol", 411, 9} {:message "Assertion might not hold."} (add#163_ret#77 == value#1440);
	assume {:sourceloc "buggy_27.sol", 414, 25} {:message ""} true;
	call add#163_ret#78 := add#163(__this, __msg_sender, __msg_value, _balances#575[__this][to#1438], tokensToTransfer#1478);
	_balances#575 := _balances#575[__this := _balances#575[__this][to#1438 := add#163_ret#78]];
	call_arg#79 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 415, 14} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, call_arg#79, to#1438, tokensToTransfer#1478);
	#1443 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 421, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#1604: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_27.sol", 422, 1} {:message "DanPanCoin::claimReward_re_ent25"} claimReward_re_ent25#1640(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 425, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#1617: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#1604[__this][__msg_sender] > 0);
	transferValue_re_ent25#1617 := redeemableEther_re_ent25#1604[__this][__msg_sender];
	assume {:sourceloc "buggy_27.sol", 426, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#1617);
	redeemableEther_re_ent25#1604 := redeemableEther_re_ent25#1604[__this := redeemableEther_re_ent25#1604[__this][__msg_sender := 0]];
	$return48:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_27.sol", 430, 3} {:message "DanPanCoin::multiTransfer"} multiTransfer#1672(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1643: address_t_arr_ptr, amounts#1646: int_arr_ptr)
{
	var {:sourceloc "buggy_27.sol", 431, 10} {:message "i"} i#1650: int;
	var transfer#1600_ret#82: bool;
	var tmp#83: int;
	// TCC assumptions
	assume (receivers#1643 < __alloc_counter);
	assume (amounts#1646 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1650 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1643])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1643]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1650 < length#address_t_arr#constr(mem_arr_address_t[receivers#1643]))) {
	// Body
	assume {:sourceloc "buggy_27.sol", 432, 7} {:message ""} true;
	call transfer#1600_ret#82 := transfer#1600(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1643])[i#1650], arr#int_arr#constr(mem_arr_int[amounts#1646])[i#1650]);
	$continue80:
	// Loop expression
	tmp#83 := i#1650;
	i#1650 := (i#1650 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1643])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1643]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break81:
	$return49:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 435, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#1676: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_27.sol", 436, 1} {:message "DanPanCoin::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#1705(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#84: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 439, 12} {:message ""} true;
	call __send_ret#84 := __send(__msg_sender, __this, 0, userBalance_re_ent19#1676[__this][__msg_sender]);
	if (!(__send_ret#84)) {
	assume false;
	}

	userBalance_re_ent19#1676 := userBalance_re_ent19#1676[__this := userBalance_re_ent19#1676[__this][__msg_sender := 0]];
	$return50:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 445, 3} {:message "DanPanCoin::approve"} approve#1742(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1707: address_t, value#1709: int)
	returns (#1712: bool)
{
	var call_arg#85: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1707 != 0);
	_allowed#621 := _allowed#621[__this := _allowed#621[__this][__msg_sender := _allowed#621[__this][__msg_sender][spender#1707 := value#1709]]];
	call_arg#85 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 448, 10} {:message ""} true;
	call Approval#381(__this, __msg_sender, __msg_value, call_arg#85, spender#1707, value#1709);
	#1712 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 451, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#1746: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_27.sol", 452, 1} {:message "DanPanCoin::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#1780(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 455, 3} {:message "success"} success#1750: bool;
	var __call_ret#86: bool;
	var __call_ret#87: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#1746[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#1746[__this][__msg_sender])];
	assume {:sourceloc "buggy_27.sol", 455, 19} {:message ""} true;
	call __call_ret#86, __call_ret#87 := __call(__msg_sender, __this, userBalance_re_ent26#1746[__this][__msg_sender]);
	if (__call_ret#86) {
	havoc _balances#575;
	havoc redeemableEther_re_ent18#579;
	havoc _allowed#621;
	havoc balances_re_ent29#625;
	havoc not_called_re_ent6#654;
	havoc lastPlayer_re_ent16#686;
	havoc jackpot_re_ent16#688;
	havoc balances_re_ent24#725;
	havoc _totalSupply#761;
	havoc userBalance_re_ent5#765;
	havoc basePercent#797;
	havoc balances_re_ent15#801;
	havoc dpPercent#827;
	havoc counter_re_ent28#830;
	havoc DanPanAddress#863;
	havoc userBalance_re_ent33#867;
	havoc not_called_re_ent27#910;
	havoc balances_re_ent31#947;
	havoc not_called_re_ent13#989;
	havoc not_called_re_ent34#1030;
	havoc whitelistFrom#1061;
	havoc counter_re_ent21#1064;
	havoc whitelistTo#1097;
	havoc counter_re_ent42#1121;
	havoc lastPlayer_re_ent2#1160;
	havoc jackpot_re_ent2#1162;
	havoc balances_re_ent17#1208;
	havoc lastPlayer_re_ent37#1265;
	havoc jackpot_re_ent37#1267;
	havoc balances_re_ent3#1328;
	havoc lastPlayer_re_ent9#1399;
	havoc jackpot_re_ent9#1401;
	havoc redeemableEther_re_ent25#1604;
	havoc userBalance_re_ent19#1676;
	havoc userBalance_re_ent26#1746;
	havoc not_called_re_ent20#1969;
	havoc redeemableEther_re_ent32#2051;
	havoc balances_re_ent38#2142;
	havoc redeemableEther_re_ent4#2213;
	havoc counter_re_ent7#2264;
	havoc lastPlayer_re_ent23#2344;
	havoc jackpot_re_ent23#2346;
	havoc counter_re_ent14#2420;
	havoc lastPlayer_re_ent30#2477;
	havoc jackpot_re_ent30#2479;
	havoc balances_re_ent8#2530;
	havoc redeemableEther_re_ent39#2581;
	havoc balances_re_ent36#2642;
	havoc counter_re_ent35#2689;
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#86)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#1746[__this][__msg_sender])];
	}

	success#1750 := __call_ret#86;
	if (!(success#1750)) {
	assume false;
	}

	userBalance_re_ent26#1746 := userBalance_re_ent26#1746[__this := userBalance_re_ent26#1746[__this][__msg_sender := 0]];
	$return52:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 462, 2} {:message "DanPanCoin::transferFrom"} transferFrom#1966(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1782: address_t, to#1784: address_t, value#1786: int)
	returns (#1789: bool)
{
	var call_arg#88: int;
	var {:sourceloc "buggy_27.sol", 476, 9} {:message "tokensToTransfer"} tokensToTransfer#1833: int;
	var {:sourceloc "buggy_27.sol", 477, 9} {:message "tokensToBurn"} tokensToBurn#1837: int;
	var {:sourceloc "buggy_27.sol", 478, 9} {:message "tokensToDanPan"} tokensToDanPan#1841: int;
	var sub#139_ret#89: int;
	var _isWhitelisted#2577_ret#90: bool;
	var findOnePercent#1324_ret#91: int;
	var findDPPercent#1397_ret#92: int;
	var sub#139_ret#93: int;
	var sub#139_ret#94: int;
	var sub#139_ret#95: int;
	var call_arg#96: address_t;
	var add#163_ret#97: int;
	var add#163_ret#98: int;
	var add#163_ret#99: int;
	var add#163_ret#100: int;
	var sub#139_ret#101: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1786 <= _balances#575[__this][from#1782]);
	assume (value#1786 <= _allowed#621[__this][from#1782][__msg_sender]);
	assume (to#1784 != 0);
	if ((value#1786 == 0)) {
	call_arg#88 := 0;
	assume {:sourceloc "buggy_27.sol", 470, 18} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, from#1782, to#1784, call_arg#88);
	#1789 := true;
	goto $return53;
	}

	tokensToTransfer#1833 := value#1786;
	tokensToBurn#1837 := 0;
	tokensToDanPan#1841 := 0;
	assume {:sourceloc "buggy_27.sol", 481, 27} {:message ""} true;
	call sub#139_ret#89 := sub#139(__this, __msg_sender, __msg_value, _balances#575[__this][from#1782], value#1786);
	_balances#575 := _balances#575[__this := _balances#575[__this][from#1782 := sub#139_ret#89]];
	assume {:sourceloc "buggy_27.sol", 485, 14} {:message ""} true;
	call _isWhitelisted#2577_ret#90 := _isWhitelisted#2577(__this, __msg_sender, __msg_value, from#1782, to#1784);
	if (!(_isWhitelisted#2577_ret#90)) {
	assume {:sourceloc "buggy_27.sol", 487, 30} {:message ""} true;
	call findOnePercent#1324_ret#91 := findOnePercent#1324(__this, __msg_sender, __msg_value, value#1786);
	tokensToBurn#1837 := findOnePercent#1324_ret#91;
	assume {:sourceloc "buggy_27.sol", 488, 32} {:message ""} true;
	call findDPPercent#1397_ret#92 := findDPPercent#1397(__this, __msg_sender, __msg_value, value#1786);
	tokensToDanPan#1841 := findDPPercent#1397_ret#92;
	assume {:sourceloc "buggy_27.sol", 491, 33} {:message ""} true;
	call sub#139_ret#93 := sub#139(__this, __msg_sender, __msg_value, value#1786, tokensToBurn#1837);
	assume {:sourceloc "buggy_27.sol", 491, 33} {:message ""} true;
	call sub#139_ret#94 := sub#139(__this, __msg_sender, __msg_value, sub#139_ret#93, tokensToDanPan#1841);
	tokensToTransfer#1833 := sub#139_ret#94;
	assume {:sourceloc "buggy_27.sol", 494, 28} {:message ""} true;
	call sub#139_ret#95 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#761[__this], tokensToBurn#1837);
	_totalSupply#761 := _totalSupply#761[__this := sub#139_ret#95];
	call_arg#96 := 0;
	assume {:sourceloc "buggy_27.sol", 495, 18} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, from#1782, call_arg#96, tokensToBurn#1837);
	assume {:sourceloc "buggy_27.sol", 499, 40} {:message ""} true;
	call add#163_ret#97 := add#163(__this, __msg_sender, __msg_value, _balances#575[__this][DanPanAddress#863[__this]], tokensToDanPan#1841);
	_balances#575 := _balances#575[__this := _balances#575[__this][DanPanAddress#863[__this] := add#163_ret#97]];
	assume {:sourceloc "buggy_27.sol", 500, 17} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, from#1782, DanPanAddress#863[__this], tokensToDanPan#1841);
	}

	assume {:sourceloc "buggy_27.sol", 506, 16} {:message ""} true;
	call add#163_ret#98 := add#163(__this, __msg_sender, __msg_value, tokensToBurn#1837, tokensToTransfer#1833);
	assume {:sourceloc "buggy_27.sol", 506, 16} {:message ""} true;
	call add#163_ret#99 := add#163(__this, __msg_sender, __msg_value, add#163_ret#98, tokensToDanPan#1841);
	assert {:sourceloc "buggy_27.sol", 506, 9} {:message "Assertion might not hold."} (add#163_ret#99 == value#1786);
	assume {:sourceloc "buggy_27.sol", 509, 25} {:message ""} true;
	call add#163_ret#100 := add#163(__this, __msg_sender, __msg_value, _balances#575[__this][to#1784], tokensToTransfer#1833);
	_balances#575 := _balances#575[__this := _balances#575[__this][to#1784 := add#163_ret#100]];
	assume {:sourceloc "buggy_27.sol", 510, 31} {:message ""} true;
	call sub#139_ret#101 := sub#139(__this, __msg_sender, __msg_value, _allowed#621[__this][from#1782][__msg_sender], value#1786);
	_allowed#621 := _allowed#621[__this := _allowed#621[__this][from#1782 := _allowed#621[__this][from#1782][__msg_sender := sub#139_ret#101]]];
	assume {:sourceloc "buggy_27.sol", 511, 14} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, from#1782, to#1784, tokensToTransfer#1833);
	#1789 := true;
	goto $return53;
	$return53:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_27.sol", 517, 1} {:message "not_called_re_ent20"} not_called_re_ent20#1969: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_27.sol", 518, 1} {:message "DanPanCoin::bug_re_ent20"} bug_re_ent20#1996(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#102: int;
	var __send_ret#103: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#1969[__this];
	call_arg#102 := 1000000000000000000;
	assume {:sourceloc "buggy_27.sol", 520, 12} {:message ""} true;
	call __send_ret#103 := __send(__msg_sender, __this, 0, call_arg#102);
	if (!(__send_ret#103)) {
	assume false;
	}

	not_called_re_ent20#1969 := not_called_re_ent20#1969[__this := false];
	$return54:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 526, 3} {:message "DanPanCoin::increaseAllowance"} increaseAllowance#2047(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1998: address_t, addedValue#2000: int)
	returns (#2003: bool)
{
	var add#163_ret#104: int;
	var call_arg#105: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1998 != 0);
	assume {:sourceloc "buggy_27.sol", 528, 38} {:message ""} true;
	call add#163_ret#104 := add#163(__this, __msg_sender, __msg_value, _allowed#621[__this][__msg_sender][spender#1998], addedValue#2000);
	_allowed#621 := _allowed#621[__this := _allowed#621[__this][__msg_sender := _allowed#621[__this][__msg_sender][spender#1998 := add#163_ret#104]]];
	call_arg#105 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 529, 10} {:message ""} true;
	call Approval#381(__this, __msg_sender, __msg_value, call_arg#105, spender#1998, _allowed#621[__this][__msg_sender][spender#1998]);
	#2003 := true;
	goto $return55;
	$return55:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 532, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#2051: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_27.sol", 533, 1} {:message "DanPanCoin::claimReward_re_ent32"} claimReward_re_ent32#2087(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 536, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#2064: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#2051[__this][__msg_sender] > 0);
	transferValue_re_ent32#2064 := redeemableEther_re_ent32#2051[__this][__msg_sender];
	assume {:sourceloc "buggy_27.sol", 537, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#2064);
	redeemableEther_re_ent32#2051 := redeemableEther_re_ent32#2051[__this := redeemableEther_re_ent32#2051[__this][__msg_sender := 0]];
	$return56:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_27.sol", 541, 3} {:message "DanPanCoin::decreaseAllowance"} decreaseAllowance#2138(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#2089: address_t, subtractedValue#2091: int)
	returns (#2094: bool)
{
	var sub#139_ret#106: int;
	var call_arg#107: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#2089 != 0);
	assume {:sourceloc "buggy_27.sol", 543, 38} {:message ""} true;
	call sub#139_ret#106 := sub#139(__this, __msg_sender, __msg_value, _allowed#621[__this][__msg_sender][spender#2089], subtractedValue#2091);
	_allowed#621 := _allowed#621[__this := _allowed#621[__this][__msg_sender := _allowed#621[__this][__msg_sender][spender#2089 := sub#139_ret#106]]];
	call_arg#107 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 544, 10} {:message ""} true;
	call Approval#381(__this, __msg_sender, __msg_value, call_arg#107, spender#2089, _allowed#621[__this][__msg_sender][spender#2089]);
	#2094 := true;
	goto $return57;
	$return57:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 547, 1} {:message "balances_re_ent38"} balances_re_ent38#2142: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_27.sol", 548, 1} {:message "DanPanCoin::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#2175(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#2144: int)
{
	var __send_ret#108: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#2142[__this][__msg_sender] >= _weiToWithdraw#2144);
	assume {:sourceloc "buggy_27.sol", 551, 11} {:message ""} true;
	call __send_ret#108 := __send(__msg_sender, __this, 0, _weiToWithdraw#2144);
	assume __send_ret#108;
	balances_re_ent38#2142 := balances_re_ent38#2142[__this := balances_re_ent38#2142[__this][__msg_sender := (balances_re_ent38#2142[__this][__msg_sender] - _weiToWithdraw#2144)]];
	$return58:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 555, 3} {:message "DanPanCoin::_mint"} _mint#2209(__this: address_t, __msg_sender: address_t, __msg_value: int, account#2177: address_t, amount#2179: int)
{
	var add#163_ret#109: int;
	var call_arg#110: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#2179 != 0);
	assume {:sourceloc "buggy_27.sol", 557, 26} {:message ""} true;
	call add#163_ret#109 := add#163(__this, __msg_sender, __msg_value, _balances#575[__this][account#2177], amount#2179);
	_balances#575 := _balances#575[__this := _balances#575[__this][account#2177 := add#163_ret#109]];
	call_arg#110 := 0;
	assume {:sourceloc "buggy_27.sol", 558, 10} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, call_arg#110, account#2177, amount#2179);
	$return59:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 560, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#2213: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_27.sol", 561, 1} {:message "DanPanCoin::claimReward_re_ent4"} claimReward_re_ent4#2249(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 564, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#2226: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#2213[__this][__msg_sender] > 0);
	transferValue_re_ent4#2226 := redeemableEther_re_ent4#2213[__this][__msg_sender];
	assume {:sourceloc "buggy_27.sol", 565, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#2226);
	redeemableEther_re_ent4#2213 := redeemableEther_re_ent4#2213[__this := redeemableEther_re_ent4#2213[__this][__msg_sender := 0]];
	$return60:
	// Function body ends here
}

// 
// Function: burn
procedure {:sourceloc "buggy_27.sol", 569, 3} {:message "DanPanCoin::burn"} burn#2261(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#2251: int)
{
	var call_arg#111: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#111 := __msg_sender;
	assume {:sourceloc "buggy_27.sol", 570, 5} {:message ""} true;
	call _burn#2342(__this, __msg_sender, __msg_value, call_arg#111, amount#2251);
	$return61:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_27.sol", 572, 1} {:message "counter_re_ent7"} counter_re_ent7#2264: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_27.sol", 573, 1} {:message "DanPanCoin::callme_re_ent7"} callme_re_ent7#2293(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#112: int;
	var __send_ret#113: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#2264[__this] <= 5);
	call_arg#112 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 575, 9} {:message ""} true;
	call __send_ret#113 := __send(__msg_sender, __this, 0, call_arg#112);
	if (!(__send_ret#113)) {
	assume false;
	}

	counter_re_ent7#2264 := counter_re_ent7#2264[__this := (counter_re_ent7#2264[__this] + 1)];
	$return62:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 581, 3} {:message "DanPanCoin::_burn"} _burn#2342(__this: address_t, __msg_sender: address_t, __msg_value: int, account#2295: address_t, amount#2297: int)
{
	var sub#139_ret#114: int;
	var sub#139_ret#115: int;
	var call_arg#116: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#2297 != 0);
	assume (amount#2297 <= _balances#575[__this][account#2295]);
	assume {:sourceloc "buggy_27.sol", 584, 20} {:message ""} true;
	call sub#139_ret#114 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#761[__this], amount#2297);
	_totalSupply#761 := _totalSupply#761[__this := sub#139_ret#114];
	assume {:sourceloc "buggy_27.sol", 585, 26} {:message ""} true;
	call sub#139_ret#115 := sub#139(__this, __msg_sender, __msg_value, _balances#575[__this][account#2295], amount#2297);
	_balances#575 := _balances#575[__this := _balances#575[__this][account#2295 := sub#139_ret#115]];
	call_arg#116 := 0;
	assume {:sourceloc "buggy_27.sol", 586, 10} {:message ""} true;
	call Transfer#373(__this, __msg_sender, __msg_value, account#2295, call_arg#116, amount#2297);
	$return63:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_27.sol", 588, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#2344: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_27.sol", 589, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#2346: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_27.sol", 590, 4} {:message "DanPanCoin::buyTicket_re_ent23"} buyTicket_re_ent23#2376(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#117: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 591, 12} {:message ""} true;
	call __send_ret#117 := __send(lastPlayer_re_ent23#2344[__this], __this, 0, jackpot_re_ent23#2346[__this]);
	if (!(__send_ret#117)) {
	assume false;
	}

	lastPlayer_re_ent23#2344 := lastPlayer_re_ent23#2344[__this := __msg_sender];
	jackpot_re_ent23#2346 := jackpot_re_ent23#2346[__this := __balance[__this]];
	$return64:
	// Function body ends here
}

// 
// Function: burnFrom
procedure {:sourceloc "buggy_27.sol", 597, 3} {:message "DanPanCoin::burnFrom"} burnFrom#2417(__this: address_t, __msg_sender: address_t, __msg_value: int, account#2378: address_t, amount#2380: int)
{
	var sub#139_ret#118: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#2380 <= _allowed#621[__this][account#2378][__msg_sender]);
	assume {:sourceloc "buggy_27.sol", 599, 37} {:message ""} true;
	call sub#139_ret#118 := sub#139(__this, __msg_sender, __msg_value, _allowed#621[__this][account#2378][__msg_sender], amount#2380);
	_allowed#621 := _allowed#621[__this := _allowed#621[__this][account#2378 := _allowed#621[__this][account#2378][__msg_sender := sub#139_ret#118]]];
	assume {:sourceloc "buggy_27.sol", 600, 5} {:message ""} true;
	call _burn#2342(__this, __msg_sender, __msg_value, account#2378, amount#2380);
	$return65:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_27.sol", 602, 1} {:message "counter_re_ent14"} counter_re_ent14#2420: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_27.sol", 603, 1} {:message "DanPanCoin::callme_re_ent14"} callme_re_ent14#2449(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#119: int;
	var __send_ret#120: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#2420[__this] <= 5);
	call_arg#119 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 605, 9} {:message ""} true;
	call __send_ret#120 := __send(__msg_sender, __this, 0, call_arg#119);
	if (!(__send_ret#120)) {
	assume false;
	}

	counter_re_ent14#2420 := counter_re_ent14#2420[__this := (counter_re_ent14#2420[__this] + 1)];
	$return66:
	// Function body ends here
}

// 
// Function: NewDanPanAddress
procedure {:sourceloc "buggy_27.sol", 611, 3} {:message "DanPanCoin::NewDanPanAddress"} NewDanPanAddress#2475(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanaddress#2451: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume (newDanPanaddress#2451 != 0);
	assume {:sourceloc "buggy_27.sol", 613, 12} {:message ""} true;
	call DanPanAddressChanged#943(__this, __msg_sender, __msg_value, DanPanAddress#863[__this], newDanPanaddress#2451);
	DanPanAddress#863 := DanPanAddress#863[__this := newDanPanaddress#2451];
	$return68:
	// Function body ends here
	$return67:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_27.sol", 616, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#2477: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_27.sol", 617, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#2479: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_27.sol", 618, 4} {:message "DanPanCoin::buyTicket_re_ent30"} buyTicket_re_ent30#2509(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#123: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 619, 12} {:message ""} true;
	call __send_ret#123 := __send(lastPlayer_re_ent30#2477[__this], __this, 0, jackpot_re_ent30#2479[__this]);
	if (!(__send_ret#123)) {
	assume false;
	}

	lastPlayer_re_ent30#2477 := lastPlayer_re_ent30#2477[__this := __msg_sender];
	jackpot_re_ent30#2479 := jackpot_re_ent30#2479[__this := __balance[__this]];
	$return69:
	// Function body ends here
}

// 
// Function: NewDanPanPercent
procedure {:sourceloc "buggy_27.sol", 625, 3} {:message "DanPanCoin::NewDanPanPercent"} NewDanPanPercent#2526(__this: address_t, __msg_sender: address_t, __msg_value: int, newDanPanpercent#2511: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 626, 12} {:message ""} true;
	call DanPanPercentChanged#907(__this, __msg_sender, __msg_value, dpPercent#827[__this], newDanPanpercent#2511);
	dpPercent#827 := dpPercent#827[__this := newDanPanpercent#2511];
	$return71:
	// Function body ends here
	$return70:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 629, 1} {:message "balances_re_ent8"} balances_re_ent8#2530: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_27.sol", 630, 5} {:message "DanPanCoin::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#2559(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 631, 9} {:message "success"} success#2534: bool;
	var __call_ret#126: bool;
	var __call_ret#127: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#2530[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#2530[__this][__msg_sender])];
	assume {:sourceloc "buggy_27.sol", 631, 26} {:message ""} true;
	call __call_ret#126, __call_ret#127 := __call(__msg_sender, __this, balances_re_ent8#2530[__this][__msg_sender]);
	if (__call_ret#126) {
	havoc _balances#575;
	havoc redeemableEther_re_ent18#579;
	havoc _allowed#621;
	havoc balances_re_ent29#625;
	havoc not_called_re_ent6#654;
	havoc lastPlayer_re_ent16#686;
	havoc jackpot_re_ent16#688;
	havoc balances_re_ent24#725;
	havoc _totalSupply#761;
	havoc userBalance_re_ent5#765;
	havoc basePercent#797;
	havoc balances_re_ent15#801;
	havoc dpPercent#827;
	havoc counter_re_ent28#830;
	havoc DanPanAddress#863;
	havoc userBalance_re_ent33#867;
	havoc not_called_re_ent27#910;
	havoc balances_re_ent31#947;
	havoc not_called_re_ent13#989;
	havoc not_called_re_ent34#1030;
	havoc whitelistFrom#1061;
	havoc counter_re_ent21#1064;
	havoc whitelistTo#1097;
	havoc counter_re_ent42#1121;
	havoc lastPlayer_re_ent2#1160;
	havoc jackpot_re_ent2#1162;
	havoc balances_re_ent17#1208;
	havoc lastPlayer_re_ent37#1265;
	havoc jackpot_re_ent37#1267;
	havoc balances_re_ent3#1328;
	havoc lastPlayer_re_ent9#1399;
	havoc jackpot_re_ent9#1401;
	havoc redeemableEther_re_ent25#1604;
	havoc userBalance_re_ent19#1676;
	havoc userBalance_re_ent26#1746;
	havoc not_called_re_ent20#1969;
	havoc redeemableEther_re_ent32#2051;
	havoc balances_re_ent38#2142;
	havoc redeemableEther_re_ent4#2213;
	havoc counter_re_ent7#2264;
	havoc lastPlayer_re_ent23#2344;
	havoc jackpot_re_ent23#2346;
	havoc counter_re_ent14#2420;
	havoc lastPlayer_re_ent30#2477;
	havoc jackpot_re_ent30#2479;
	havoc balances_re_ent8#2530;
	havoc redeemableEther_re_ent39#2581;
	havoc balances_re_ent36#2642;
	havoc counter_re_ent35#2689;
	havoc owner#198;
	havoc userBalance_re_ent40#202;
	havoc balances_re_ent10#255;
	havoc balances_re_ent21#329;
	havoc _name#361;
	havoc _symbol#363;
	havoc _decimals#365;
	havoc userBalance_re_ent12#407;
	havoc redeemableEther_re_ent11#448;
	havoc balances_re_ent1#496;
	havoc not_called_re_ent41#536;
	havoc __balance;
	}

	if (!(__call_ret#126)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#2530[__this][__msg_sender])];
	}

	success#2534 := __call_ret#126;
	if (success#2534) {
	balances_re_ent8#2530 := balances_re_ent8#2530[__this := balances_re_ent8#2530[__this][__msg_sender := 0]];
	}

	$return72:
	// Function body ends here
}

// 
// Function: _isWhitelisted : function (address,address) view returns (bool)
procedure {:inline 1} {:sourceloc "buggy_27.sol", 636, 3} {:message "DanPanCoin::_isWhitelisted"} _isWhitelisted#2577(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#2561: address_t, _to#2563: address_t)
	returns (#2566: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#2566 := (whitelistFrom#1061[__this][_from#2561] || whitelistTo#1097[__this][_to#2563]);
	goto $return73;
	$return73:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 640, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#2581: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_27.sol", 641, 1} {:message "DanPanCoin::claimReward_re_ent39"} claimReward_re_ent39#2617(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_27.sol", 644, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#2594: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#2581[__this][__msg_sender] > 0);
	transferValue_re_ent39#2594 := redeemableEther_re_ent39#2581[__this][__msg_sender];
	assume {:sourceloc "buggy_27.sol", 645, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#2594);
	redeemableEther_re_ent39#2581 := redeemableEther_re_ent39#2581[__this := redeemableEther_re_ent39#2581[__this][__msg_sender := 0]];
	$return74:
	// Function body ends here
}

// 
// Function: setWhitelistedTo
procedure {:sourceloc "buggy_27.sol", 649, 5} {:message "DanPanCoin::setWhitelistedTo"} setWhitelistedTo#2638(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#2619: address_t, _whitelisted#2621: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 650, 14} {:message ""} true;
	call WhitelistTo#1027(__this, __msg_sender, __msg_value, _addr#2619, _whitelisted#2621);
	whitelistTo#1097 := whitelistTo#1097[__this := whitelistTo#1097[__this][_addr#2619 := _whitelisted#2621]];
	$return76:
	// Function body ends here
	$return75:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_27.sol", 653, 1} {:message "balances_re_ent36"} balances_re_ent36#2642: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_27.sol", 654, 5} {:message "DanPanCoin::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#2665(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#130: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 655, 12} {:message ""} true;
	call __send_ret#130 := __send(__msg_sender, __this, 0, balances_re_ent36#2642[__this][__msg_sender]);
	if (__send_ret#130) {
	balances_re_ent36#2642 := balances_re_ent36#2642[__this := balances_re_ent36#2642[__this][__msg_sender := 0]];
	}

	$return77:
	// Function body ends here
}

// 
// Function: setWhitelistedFrom
procedure {:sourceloc "buggy_27.sol", 659, 5} {:message "DanPanCoin::setWhitelistedFrom"} setWhitelistedFrom#2686(__this: address_t, __msg_sender: address_t, __msg_value: int, _addr#2667: address_t, _whitelisted#2669: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#198[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_27.sol", 660, 14} {:message ""} true;
	call WhitelistFrom#986(__this, __msg_sender, __msg_value, _addr#2667, _whitelisted#2669);
	whitelistFrom#1061 := whitelistFrom#1061[__this := whitelistFrom#1061[__this][_addr#2667 := _whitelisted#2669]];
	$return79:
	// Function body ends here
	$return78:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_27.sol", 663, 1} {:message "counter_re_ent35"} counter_re_ent35#2689: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_27.sol", 664, 1} {:message "DanPanCoin::callme_re_ent35"} callme_re_ent35#2718(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#133: int;
	var __send_ret#134: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#2689[__this] <= 5);
	call_arg#133 := 10000000000000000000;
	assume {:sourceloc "buggy_27.sol", 666, 9} {:message ""} true;
	call __send_ret#134 := __send(__msg_sender, __this, 0, call_arg#133);
	if (!(__send_ret#134)) {
	assume false;
	}

	counter_re_ent35#2689 := counter_re_ent35#2689[__this := (counter_re_ent35#2689[__this] + 1)];
	$return80:
	// Function body ends here
}

