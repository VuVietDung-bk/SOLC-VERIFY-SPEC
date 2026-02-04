// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_28.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_28.sol", 15, 3} {:message "[event] IERC20::Transfer"} Transfer#59(__this: address_t, __msg_sender: address_t, __msg_value: int, from#53: address_t, to#55: address_t, value#57: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_28.sol", 16, 3} {:message "[event] IERC20::Approval"} Approval#67(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#61: address_t, spender#63: address_t, value#65: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_28.sol", 8, 3} {:message "IERC20::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_28.sol", 9, 3} {:message "IERC20::balanceOf"} balanceOf#13(__this: address_t, __msg_sender: address_t, __msg_value: int, who#8: address_t)
	returns (#11: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_28.sol", 10, 3} {:message "IERC20::allowance"} allowance#22(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#15: address_t, spender#17: address_t)
	returns (#20: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_28.sol", 11, 3} {:message "IERC20::transfer"} transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_28.sol", 12, 3} {:message "IERC20::approve"} approve#40(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#33: address_t, value#35: int)
	returns (#38: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_28.sol", 13, 3} {:message "IERC20::transferFrom"} transferFrom#51(__this: address_t, __msg_sender: address_t, __msg_value: int, from#42: address_t, to#44: address_t, value#46: int)
	returns (#49: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_28.sol", 7, 1} {:message "IERC20::[implicit_constructor]"} __constructor#68(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 20, 3} {:message "SafeMath::mul"} mul#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#70: int, b#72: int)
	returns (#75: int)
{
	var {:sourceloc "buggy_28.sol", 24, 5} {:message "c"} c#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#70 == 0)) {
	#75 := 0;
	goto $return0;
	}

	c#85 := (a#70 * b#72);
	assert {:sourceloc "buggy_28.sol", 25, 5} {:message "Assertion might not hold."} ((c#85 div a#70) == b#72);
	#75 := c#85;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 29, 3} {:message "SafeMath::div"} div#119(__this: address_t, __msg_sender: address_t, __msg_value: int, a#103: int, b#105: int)
	returns (#108: int)
{
	var {:sourceloc "buggy_28.sol", 30, 5} {:message "c"} c#111: int;
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
procedure {:inline 1} {:sourceloc "buggy_28.sol", 34, 3} {:message "SafeMath::sub"} sub#139(__this: address_t, __msg_sender: address_t, __msg_value: int, a#121: int, b#123: int)
	returns (#126: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_28.sol", 35, 5} {:message "Assertion might not hold."} (b#123 <= a#121);
	#126 := (a#121 - b#123);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 39, 3} {:message "SafeMath::add"} add#163(__this: address_t, __msg_sender: address_t, __msg_value: int, a#141: int, b#143: int)
	returns (#146: int)
{
	var {:sourceloc "buggy_28.sol", 40, 5} {:message "c"} c#149: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#149 := (a#141 + b#143);
	assert {:sourceloc "buggy_28.sol", 41, 5} {:message "Assertion might not hold."} (c#149 >= a#141);
	#146 := c#149;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 45, 3} {:message "SafeMath::ceil"} ceil#195(__this: address_t, __msg_sender: address_t, __msg_value: int, a#165: int, m#167: int)
	returns (#170: int)
{
	var {:sourceloc "buggy_28.sol", 46, 5} {:message "c"} c#173: int;
	var add#163_ret#0: int;
	var {:sourceloc "buggy_28.sol", 47, 5} {:message "d"} d#180: int;
	var call_arg#1: int;
	var sub#139_ret#2: int;
	var div#119_ret#3: int;
	var mul#101_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 46, 17} {:message ""} true;
	call add#163_ret#0 := add#163(__this, __msg_sender, __msg_value, a#165, m#167);
	c#173 := add#163_ret#0;
	call_arg#1 := 1;
	assume {:sourceloc "buggy_28.sol", 47, 17} {:message ""} true;
	call sub#139_ret#2 := sub#139(__this, __msg_sender, __msg_value, c#173, call_arg#1);
	d#180 := sub#139_ret#2;
	assume {:sourceloc "buggy_28.sol", 48, 16} {:message ""} true;
	call div#119_ret#3 := div#119(__this, __msg_sender, __msg_value, d#180, m#167);
	assume {:sourceloc "buggy_28.sol", 48, 12} {:message ""} true;
	call mul#101_ret#4 := mul#101(__this, __msg_sender, __msg_value, div#119_ret#3, m#167);
	#170 := mul#101_ret#4;
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_28.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Detailed -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_28.sol", 80, 3} {:message "[event] ERC20Detailed::Transfer"} Transfer#313(__this: address_t, __msg_sender: address_t, __msg_value: int, from#307: address_t, to#309: address_t, value#311: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_28.sol", 81, 3} {:message "[event] ERC20Detailed::Approval"} Approval#321(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#315: address_t, spender#317: address_t, value#319: int)
{
	
}

// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 54, 1} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#200: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_28.sol", 55, 1} {:message "ERC20Detailed::claimReward_re_ent11"} claimReward_re_ent11#236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 58, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#213: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#200[__this][__msg_sender] > 0);
	transferValue_re_ent11#213 := redeemableEther_re_ent11#200[__this][__msg_sender];
	assume {:sourceloc "buggy_28.sol", 59, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#213);
	redeemableEther_re_ent11#200 := redeemableEther_re_ent11#200[__this := redeemableEther_re_ent11#200[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_28.sol", 62, 3} {:message "_name"} _name#238: [address_t]int_arr_type;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 63, 1} {:message "balances_re_ent1"} balances_re_ent1#242: [address_t][address_t]int;
type int_arr_ptr = int;
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
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_28.sol", 64, 5} {:message "ERC20Detailed::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#271(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 65, 9} {:message "success"} success#246: bool;
	var __call_ret#5: bool;
	var __call_ret#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#242[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#242[__this][__msg_sender])];
	assume {:sourceloc "buggy_28.sol", 65, 25} {:message ""} true;
	call __call_ret#5, __call_ret#6 := __call(__msg_sender, __this, balances_re_ent1#242[__this][__msg_sender]);
	if (__call_ret#5) {
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#5)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#242[__this][__msg_sender])];
	}

	success#246 := __call_ret#5;
	if (success#246) {
	balances_re_ent1#242 := balances_re_ent1#242[__this := balances_re_ent1#242[__this][__msg_sender := 0]];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_28.sol", 69, 3} {:message "_symbol"} _symbol#273: [address_t]int_arr_type;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_28.sol", 70, 1} {:message "not_called_re_ent41"} not_called_re_ent41#276: [address_t]bool;
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
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_28.sol", 71, 1} {:message "ERC20Detailed::bug_re_ent41"} bug_re_ent41#303(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#276[__this];
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_28.sol", 73, 12} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, call_arg#7);
	if (!(__send_ret#8)) {
	assume false;
	}

	not_called_re_ent41#276 := not_called_re_ent41#276[__this := false];
	$return7:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_28.sol", 78, 3} {:message "_decimals"} _decimals#305: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_28.sol", 83, 3} {:message "ERC20Detailed::[constructor]"} __constructor#509(__this: address_t, __msg_sender: address_t, __msg_value: int, name#323: int_arr_ptr, symbol#325: int_arr_ptr, decimals#327: int)
{
	// TCC assumptions
	assume (name#323 < __alloc_counter);
	assume (symbol#325 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent11#200 := redeemableEther_re_ent11#200[__this := default_address_t_int()];
	_name#238 := _name#238[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#242 := balances_re_ent1#242[__this := default_address_t_int()];
	_symbol#273 := _symbol#273[__this := int_arr#constr(default_int_int(), 0)];
	not_called_re_ent41#276 := not_called_re_ent41#276[__this := true];
	_decimals#305 := _decimals#305[__this := 0];
	userBalance_re_ent19#347 := userBalance_re_ent19#347[__this := default_address_t_int()];
	userBalance_re_ent26#388 := userBalance_re_ent26#388[__this := default_address_t_int()];
	not_called_re_ent20#433 := not_called_re_ent20#433[__this := true];
	redeemableEther_re_ent32#472 := redeemableEther_re_ent32#472[__this := default_address_t_int()];
	// Function body starts here
	_name#238 := _name#238[__this := mem_arr_int[name#323]];
	_symbol#273 := _symbol#273[__this := mem_arr_int[symbol#325]];
	_decimals#305 := _decimals#305[__this := decimals#327];
	$return8:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 88, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#347: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_28.sol", 89, 1} {:message "ERC20Detailed::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#376(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 92, 12} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, userBalance_re_ent19#347[__this][__msg_sender]);
	if (!(__send_ret#9)) {
	assume false;
	}

	userBalance_re_ent19#347 := userBalance_re_ent19#347[__this := userBalance_re_ent19#347[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_28.sol", 98, 3} {:message "ERC20Detailed::name"} name#384(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#379: int_arr_ptr)
{
	var new_array#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#10 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#379 := new_array#10;
	mem_arr_int := mem_arr_int[#379 := _name#238[__this]];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 101, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#388: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_28.sol", 102, 1} {:message "ERC20Detailed::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#422(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 105, 3} {:message "success"} success#392: bool;
	var __call_ret#11: bool;
	var __call_ret#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#388[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#388[__this][__msg_sender])];
	assume {:sourceloc "buggy_28.sol", 105, 19} {:message ""} true;
	call __call_ret#11, __call_ret#12 := __call(__msg_sender, __this, userBalance_re_ent26#388[__this][__msg_sender]);
	if (__call_ret#11) {
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#11)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#388[__this][__msg_sender])];
	}

	success#392 := __call_ret#11;
	if (!(success#392)) {
	assume false;
	}

	userBalance_re_ent26#388 := userBalance_re_ent26#388[__this := userBalance_re_ent26#388[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_28.sol", 112, 3} {:message "ERC20Detailed::symbol"} symbol#430(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#425: int_arr_ptr)
{
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#425 := new_array#13;
	mem_arr_int := mem_arr_int[#425 := _symbol#273[__this]];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_28.sol", 115, 1} {:message "not_called_re_ent20"} not_called_re_ent20#433: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_28.sol", 116, 1} {:message "ERC20Detailed::bug_re_ent20"} bug_re_ent20#460(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#433[__this];
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_28.sol", 118, 12} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, call_arg#14);
	if (!(__send_ret#15)) {
	assume false;
	}

	not_called_re_ent20#433 := not_called_re_ent20#433[__this := false];
	$return13:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_28.sol", 124, 3} {:message "ERC20Detailed::decimals"} decimals#468(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#463: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#463 := _decimals#305[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 127, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#472: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_28.sol", 128, 1} {:message "ERC20Detailed::claimReward_re_ent32"} claimReward_re_ent32#508(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 131, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#485: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#472[__this][__msg_sender] > 0);
	transferValue_re_ent32#485 := redeemableEther_re_ent32#472[__this][__msg_sender];
	assume {:sourceloc "buggy_28.sol", 132, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#485);
	redeemableEther_re_ent32#472 := redeemableEther_re_ent32#472[__this := redeemableEther_re_ent32#472[__this][__msg_sender := 0]];
	$return15:
	// Function body ends here
}

// 
// ------- Contract: HYDROGEN -------
// Inherits from: ERC20Detailed
// Using library SafeMath for uint256
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_28.sol", 140, 1} {:message "counter_re_ent42"} counter_re_ent42#517: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_28.sol", 141, 1} {:message "HYDROGEN::callme_re_ent42"} callme_re_ent42#546(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#517[__this] <= 5);
	call_arg#16 := 10000000000000000000;
	assume {:sourceloc "buggy_28.sol", 143, 9} {:message ""} true;
	call __send_ret#17 := __send(__msg_sender, __this, 0, call_arg#16);
	if (!(__send_ret#17)) {
	assume false;
	}

	counter_re_ent42#517 := counter_re_ent42#517[__this := (counter_re_ent42#517[__this] + 1)];
	$return16:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 148, 3} {:message "_balances"} _balances#550: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_28.sol", 149, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#552: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_28.sol", 150, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#554: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_28.sol", 151, 4} {:message "HYDROGEN::buyTicket_re_ent2"} buyTicket_re_ent2#584(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 152, 12} {:message ""} true;
	call __send_ret#18 := __send(lastPlayer_re_ent2#552[__this], __this, 0, jackpot_re_ent2#554[__this]);
	if (!(__send_ret#18)) {
	assume false;
	}

	lastPlayer_re_ent2#552 := lastPlayer_re_ent2#552[__this := __msg_sender];
	jackpot_re_ent2#554 := jackpot_re_ent2#554[__this := __balance[__this]];
	$return17:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_28.sol", 157, 3} {:message "_allowed"} _allowed#590: [address_t][address_t][address_t]int;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 159, 1} {:message "balances_re_ent17"} balances_re_ent17#594: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 160, 1} {:message "HYDROGEN::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#633(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#596: int)
{
	var {:sourceloc "buggy_28.sol", 163, 3} {:message "success"} success#609: bool;
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#594[__this][__msg_sender] >= _weiToWithdraw#596);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#596);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#596)];
	assume {:sourceloc "buggy_28.sol", 163, 18} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(__msg_sender, __this, _weiToWithdraw#596);
	if (__call_ret#19) {
	havoc counter_re_ent42#517;
	havoc _balances#550;
	havoc lastPlayer_re_ent2#552;
	havoc jackpot_re_ent2#554;
	havoc _allowed#590;
	havoc balances_re_ent17#594;
	havoc lastPlayer_re_ent37#638;
	havoc jackpot_re_ent37#640;
	havoc balances_re_ent3#677;
	havoc lastPlayer_re_ent9#721;
	havoc jackpot_re_ent9#723;
	havoc _totalSupply#761;
	havoc redeemableEther_re_ent25#765;
	havoc basePercent#804;
	havoc balances_re_ent38#829;
	havoc redeemableEther_re_ent4#874;
	havoc counter_re_ent7#925;
	havoc lastPlayer_re_ent23#972;
	havoc jackpot_re_ent23#974;
	havoc counter_re_ent14#1034;
	havoc lastPlayer_re_ent30#1156;
	havoc jackpot_re_ent30#1158;
	havoc balances_re_ent8#1224;
	havoc redeemableEther_re_ent39#1294;
	havoc balances_re_ent36#1450;
	havoc counter_re_ent35#1527;
	havoc userBalance_re_ent40#1611;
	havoc userBalance_re_ent33#1683;
	havoc not_called_re_ent27#1732;
	havoc balances_re_ent31#1812;
	havoc not_called_re_ent13#1889;
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#596)];
	}

	success#609 := __call_ret#19;
	assume success#609;
	balances_re_ent17#594 := balances_re_ent17#594[__this := balances_re_ent17#594[__this][__msg_sender := (balances_re_ent17#594[__this][__msg_sender] - _weiToWithdraw#596)]];
	$return18:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_28.sol", 168, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#638: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_28.sol", 169, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#640: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_28.sol", 170, 4} {:message "HYDROGEN::buyTicket_re_ent37"} buyTicket_re_ent37#670(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 171, 12} {:message ""} true;
	call __send_ret#21 := __send(lastPlayer_re_ent37#638[__this], __this, 0, jackpot_re_ent37#640[__this]);
	if (!(__send_ret#21)) {
	assume false;
	}

	lastPlayer_re_ent37#638 := lastPlayer_re_ent37#638[__this := __msg_sender];
	jackpot_re_ent37#640 := jackpot_re_ent37#640[__this := __balance[__this]];
	$return19:
	// Function body ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 177, 1} {:message "balances_re_ent3"} balances_re_ent3#677: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 178, 1} {:message "HYDROGEN::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#716(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#679: int)
{
	var {:sourceloc "buggy_28.sol", 181, 3} {:message "success"} success#692: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#677[__this][__msg_sender] >= _weiToWithdraw#679);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#679);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#679)];
	assume {:sourceloc "buggy_28.sol", 181, 19} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, _weiToWithdraw#679);
	if (__call_ret#22) {
	havoc counter_re_ent42#517;
	havoc _balances#550;
	havoc lastPlayer_re_ent2#552;
	havoc jackpot_re_ent2#554;
	havoc _allowed#590;
	havoc balances_re_ent17#594;
	havoc lastPlayer_re_ent37#638;
	havoc jackpot_re_ent37#640;
	havoc balances_re_ent3#677;
	havoc lastPlayer_re_ent9#721;
	havoc jackpot_re_ent9#723;
	havoc _totalSupply#761;
	havoc redeemableEther_re_ent25#765;
	havoc basePercent#804;
	havoc balances_re_ent38#829;
	havoc redeemableEther_re_ent4#874;
	havoc counter_re_ent7#925;
	havoc lastPlayer_re_ent23#972;
	havoc jackpot_re_ent23#974;
	havoc counter_re_ent14#1034;
	havoc lastPlayer_re_ent30#1156;
	havoc jackpot_re_ent30#1158;
	havoc balances_re_ent8#1224;
	havoc redeemableEther_re_ent39#1294;
	havoc balances_re_ent36#1450;
	havoc counter_re_ent35#1527;
	havoc userBalance_re_ent40#1611;
	havoc userBalance_re_ent33#1683;
	havoc not_called_re_ent27#1732;
	havoc balances_re_ent31#1812;
	havoc not_called_re_ent13#1889;
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#679)];
	}

	success#692 := __call_ret#22;
	assume success#692;
	balances_re_ent3#677 := balances_re_ent3#677[__this := balances_re_ent3#677[__this][__msg_sender := (balances_re_ent3#677[__this][__msg_sender] - _weiToWithdraw#679)]];
	$return20:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_28.sol", 186, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#721: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_28.sol", 187, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#723: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_28.sol", 188, 4} {:message "HYDROGEN::buyTicket_re_ent9"} buyTicket_re_ent9#758(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 189, 8} {:message "success"} success#727: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#723[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#723[__this])];
	assume {:sourceloc "buggy_28.sol", 189, 25} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(lastPlayer_re_ent9#721[__this], __this, jackpot_re_ent9#723[__this]);
	if (__call_ret#24) {
	havoc counter_re_ent42#517;
	havoc _balances#550;
	havoc lastPlayer_re_ent2#552;
	havoc jackpot_re_ent2#554;
	havoc _allowed#590;
	havoc balances_re_ent17#594;
	havoc lastPlayer_re_ent37#638;
	havoc jackpot_re_ent37#640;
	havoc balances_re_ent3#677;
	havoc lastPlayer_re_ent9#721;
	havoc jackpot_re_ent9#723;
	havoc _totalSupply#761;
	havoc redeemableEther_re_ent25#765;
	havoc basePercent#804;
	havoc balances_re_ent38#829;
	havoc redeemableEther_re_ent4#874;
	havoc counter_re_ent7#925;
	havoc lastPlayer_re_ent23#972;
	havoc jackpot_re_ent23#974;
	havoc counter_re_ent14#1034;
	havoc lastPlayer_re_ent30#1156;
	havoc jackpot_re_ent30#1158;
	havoc balances_re_ent8#1224;
	havoc redeemableEther_re_ent39#1294;
	havoc balances_re_ent36#1450;
	havoc counter_re_ent35#1527;
	havoc userBalance_re_ent40#1611;
	havoc userBalance_re_ent33#1683;
	havoc not_called_re_ent27#1732;
	havoc balances_re_ent31#1812;
	havoc not_called_re_ent13#1889;
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#723[__this])];
	}

	success#727 := __call_ret#24;
	if (!(success#727)) {
	assume false;
	}

	lastPlayer_re_ent9#721 := lastPlayer_re_ent9#721[__this := __msg_sender];
	jackpot_re_ent9#723 := jackpot_re_ent9#723[__this := __balance[__this]];
	$return21:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_28.sol", 195, 3} {:message "_totalSupply"} _totalSupply#761: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 196, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#765: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_28.sol", 197, 1} {:message "HYDROGEN::claimReward_re_ent25"} claimReward_re_ent25#801(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 200, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#778: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#765[__this][__msg_sender] > 0);
	transferValue_re_ent25#778 := redeemableEther_re_ent25#765[__this][__msg_sender];
	assume {:sourceloc "buggy_28.sol", 201, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#778);
	redeemableEther_re_ent25#765 := redeemableEther_re_ent25#765[__this := redeemableEther_re_ent25#765[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_28.sol", 204, 3} {:message "basePercent"} basePercent#804: [address_t]int;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_28.sol", 206, 3} {:message "HYDROGEN::[constructor]"} __constructor#1922(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#806: int_arr_ptr, _symbol#808: int_arr_ptr, _decimals#810: int)
{
	var name#323#26: int_arr_ptr;
	var symbol#325#26: int_arr_ptr;
	var decimals#327#26: int;
	var call_arg#28: address_t;
	// TCC assumptions
	assume (_name#806 < __alloc_counter);
	assume (_symbol#808 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	counter_re_ent42#517 := counter_re_ent42#517[__this := 0];
	_balances#550 := _balances#550[__this := default_address_t_int()];
	lastPlayer_re_ent2#552 := lastPlayer_re_ent2#552[__this := 0];
	jackpot_re_ent2#554 := jackpot_re_ent2#554[__this := 0];
	_allowed#590 := _allowed#590[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent17#594 := balances_re_ent17#594[__this := default_address_t_int()];
	lastPlayer_re_ent37#638 := lastPlayer_re_ent37#638[__this := 0];
	jackpot_re_ent37#640 := jackpot_re_ent37#640[__this := 0];
	balances_re_ent3#677 := balances_re_ent3#677[__this := default_address_t_int()];
	lastPlayer_re_ent9#721 := lastPlayer_re_ent9#721[__this := 0];
	jackpot_re_ent9#723 := jackpot_re_ent9#723[__this := 0];
	_totalSupply#761 := _totalSupply#761[__this := 8000000000];
	redeemableEther_re_ent25#765 := redeemableEther_re_ent25#765[__this := default_address_t_int()];
	basePercent#804 := basePercent#804[__this := 100];
	balances_re_ent38#829 := balances_re_ent38#829[__this := default_address_t_int()];
	redeemableEther_re_ent4#874 := redeemableEther_re_ent4#874[__this := default_address_t_int()];
	counter_re_ent7#925 := counter_re_ent7#925[__this := 0];
	lastPlayer_re_ent23#972 := lastPlayer_re_ent23#972[__this := 0];
	jackpot_re_ent23#974 := jackpot_re_ent23#974[__this := 0];
	counter_re_ent14#1034 := counter_re_ent14#1034[__this := 0];
	lastPlayer_re_ent30#1156 := lastPlayer_re_ent30#1156[__this := 0];
	jackpot_re_ent30#1158 := jackpot_re_ent30#1158[__this := 0];
	balances_re_ent8#1224 := balances_re_ent8#1224[__this := default_address_t_int()];
	redeemableEther_re_ent39#1294 := redeemableEther_re_ent39#1294[__this := default_address_t_int()];
	balances_re_ent36#1450 := balances_re_ent36#1450[__this := default_address_t_int()];
	counter_re_ent35#1527 := counter_re_ent35#1527[__this := 0];
	userBalance_re_ent40#1611 := userBalance_re_ent40#1611[__this := default_address_t_int()];
	userBalance_re_ent33#1683 := userBalance_re_ent33#1683[__this := default_address_t_int()];
	not_called_re_ent27#1732 := not_called_re_ent27#1732[__this := true];
	balances_re_ent31#1812 := balances_re_ent31#1812[__this := default_address_t_int()];
	not_called_re_ent13#1889 := not_called_re_ent13#1889[__this := true];
	redeemableEther_re_ent11#200 := redeemableEther_re_ent11#200[__this := default_address_t_int()];
	_name#238 := _name#238[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#242 := balances_re_ent1#242[__this := default_address_t_int()];
	_symbol#273 := _symbol#273[__this := int_arr#constr(default_int_int(), 0)];
	not_called_re_ent41#276 := not_called_re_ent41#276[__this := true];
	_decimals#305 := _decimals#305[__this := 0];
	userBalance_re_ent19#347 := userBalance_re_ent19#347[__this := default_address_t_int()];
	userBalance_re_ent26#388 := userBalance_re_ent26#388[__this := default_address_t_int()];
	not_called_re_ent20#433 := not_called_re_ent20#433[__this := true];
	redeemableEther_re_ent32#472 := redeemableEther_re_ent32#472[__this := default_address_t_int()];
	// Arguments for ERC20Detailed
	name#323#26 := _name#806;
	symbol#325#26 := _symbol#808;
	decimals#327#26 := _decimals#810;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#238 := _name#238[__this := mem_arr_int[name#323#26]];
	_symbol#273 := _symbol#273[__this := mem_arr_int[symbol#325#26]];
	_decimals#305 := _decimals#305[__this := decimals#327#26];
	$return23:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 207, 5} {:message ""} true;
	call _mint#1679(__this, __msg_sender, __msg_value, call_arg#28, _totalSupply#761[__this]);
	$return24:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 209, 1} {:message "balances_re_ent38"} balances_re_ent38#829: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 210, 1} {:message "HYDROGEN::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#862(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#831: int)
{
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#829[__this][__msg_sender] >= _weiToWithdraw#831);
	assume {:sourceloc "buggy_28.sol", 213, 11} {:message ""} true;
	call __send_ret#29 := __send(__msg_sender, __this, 0, _weiToWithdraw#831);
	assume __send_ret#29;
	balances_re_ent38#829 := balances_re_ent38#829[__this := balances_re_ent38#829[__this][__msg_sender := (balances_re_ent38#829[__this][__msg_sender] - _weiToWithdraw#831)]];
	$return25:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 217, 3} {:message "HYDROGEN::totalSupply"} totalSupply#870(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#865: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#865 := _totalSupply#761[__this];
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 220, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#874: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_28.sol", 221, 1} {:message "HYDROGEN::claimReward_re_ent4"} claimReward_re_ent4#910(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 224, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#887: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#874[__this][__msg_sender] > 0);
	transferValue_re_ent4#887 := redeemableEther_re_ent4#874[__this][__msg_sender];
	assume {:sourceloc "buggy_28.sol", 225, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#887);
	redeemableEther_re_ent4#874 := redeemableEther_re_ent4#874[__this := redeemableEther_re_ent4#874[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 229, 3} {:message "HYDROGEN::balanceOf"} balanceOf#922(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#912: address_t)
	returns (#915: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#915 := _balances#550[__this][owner#912];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_28.sol", 232, 1} {:message "counter_re_ent7"} counter_re_ent7#925: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_28.sol", 233, 1} {:message "HYDROGEN::callme_re_ent7"} callme_re_ent7#954(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#925[__this] <= 5);
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_28.sol", 235, 9} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	counter_re_ent7#925 := counter_re_ent7#925[__this := (counter_re_ent7#925[__this] + 1)];
	$return29:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 241, 3} {:message "HYDROGEN::allowance"} allowance#970(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#956: address_t, spender#958: address_t)
	returns (#961: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#961 := _allowed#590[__this][owner#956][spender#958];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_28.sol", 244, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#972: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_28.sol", 245, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#974: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_28.sol", 246, 4} {:message "HYDROGEN::buyTicket_re_ent23"} buyTicket_re_ent23#1004(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 247, 12} {:message ""} true;
	call __send_ret#32 := __send(lastPlayer_re_ent23#972[__this], __this, 0, jackpot_re_ent23#974[__this]);
	if (!(__send_ret#32)) {
	assume false;
	}

	lastPlayer_re_ent23#972 := lastPlayer_re_ent23#972[__this := __msg_sender];
	jackpot_re_ent23#974 := jackpot_re_ent23#974[__this := __balance[__this]];
	$return31:
	// Function body ends here
}

// 
// Function: findtwoPercent : function (uint256) view returns (uint256)
procedure {:sourceloc "buggy_28.sol", 253, 3} {:message "HYDROGEN::findtwoPercent"} findtwoPercent#1031(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1006: int)
	returns (#1009: int)
{
	var {:sourceloc "buggy_28.sol", 254, 5} {:message "roundValue"} roundValue#1012: int;
	var ceil#195_ret#33: int;
	var {:sourceloc "buggy_28.sol", 255, 5} {:message "twoPercent"} twoPercent#1019: int;
	var mul#101_ret#34: int;
	var call_arg#35: int;
	var div#119_ret#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 254, 26} {:message ""} true;
	call ceil#195_ret#33 := ceil#195(__this, __msg_sender, __msg_value, value#1006, basePercent#804[__this]);
	roundValue#1012 := ceil#195_ret#33;
	assume {:sourceloc "buggy_28.sol", 255, 26} {:message ""} true;
	call mul#101_ret#34 := mul#101(__this, __msg_sender, __msg_value, roundValue#1012, basePercent#804[__this]);
	call_arg#35 := 5000;
	assume {:sourceloc "buggy_28.sol", 255, 26} {:message ""} true;
	call div#119_ret#36 := div#119(__this, __msg_sender, __msg_value, mul#101_ret#34, call_arg#35);
	twoPercent#1019 := div#119_ret#36;
	#1009 := twoPercent#1019;
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_28.sol", 258, 1} {:message "counter_re_ent14"} counter_re_ent14#1034: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_28.sol", 259, 1} {:message "HYDROGEN::callme_re_ent14"} callme_re_ent14#1063(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1034[__this] <= 5);
	call_arg#37 := 10000000000000000000;
	assume {:sourceloc "buggy_28.sol", 261, 9} {:message ""} true;
	call __send_ret#38 := __send(__msg_sender, __this, 0, call_arg#37);
	if (!(__send_ret#38)) {
	assume false;
	}

	counter_re_ent14#1034 := counter_re_ent14#1034[__this := (counter_re_ent14#1034[__this] + 1)];
	$return33:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 267, 3} {:message "HYDROGEN::transfer"} transfer#1154(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1065: address_t, value#1067: int)
	returns (#1070: bool)
{
	var {:sourceloc "buggy_28.sol", 271, 5} {:message "tokensToBurn"} tokensToBurn#1091: int;
	var findtwoPercent#1031_ret#39: int;
	var {:sourceloc "buggy_28.sol", 272, 5} {:message "tokensToTransfer"} tokensToTransfer#1097: int;
	var sub#139_ret#40: int;
	var sub#139_ret#41: int;
	var add#163_ret#42: int;
	var sub#139_ret#43: int;
	var call_arg#44: address_t;
	var call_arg#45: address_t;
	var call_arg#46: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1067 <= _balances#550[__this][__msg_sender]);
	assume (to#1065 != 0);
	assume {:sourceloc "buggy_28.sol", 271, 28} {:message ""} true;
	call findtwoPercent#1031_ret#39 := findtwoPercent#1031(__this, __msg_sender, __msg_value, value#1067);
	tokensToBurn#1091 := findtwoPercent#1031_ret#39;
	assume {:sourceloc "buggy_28.sol", 272, 32} {:message ""} true;
	call sub#139_ret#40 := sub#139(__this, __msg_sender, __msg_value, value#1067, tokensToBurn#1091);
	tokensToTransfer#1097 := sub#139_ret#40;
	assume {:sourceloc "buggy_28.sol", 274, 29} {:message ""} true;
	call sub#139_ret#41 := sub#139(__this, __msg_sender, __msg_value, _balances#550[__this][__msg_sender], value#1067);
	_balances#550 := _balances#550[__this := _balances#550[__this][__msg_sender := sub#139_ret#41]];
	assume {:sourceloc "buggy_28.sol", 275, 21} {:message ""} true;
	call add#163_ret#42 := add#163(__this, __msg_sender, __msg_value, _balances#550[__this][to#1065], tokensToTransfer#1097);
	_balances#550 := _balances#550[__this := _balances#550[__this][to#1065 := add#163_ret#42]];
	assume {:sourceloc "buggy_28.sol", 277, 20} {:message ""} true;
	call sub#139_ret#43 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#761[__this], tokensToBurn#1091);
	_totalSupply#761 := _totalSupply#761[__this := sub#139_ret#43];
	call_arg#44 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 279, 10} {:message ""} true;
	call Transfer#313(__this, __msg_sender, __msg_value, call_arg#44, to#1065, tokensToTransfer#1097);
	call_arg#45 := __msg_sender;
	call_arg#46 := 0;
	assume {:sourceloc "buggy_28.sol", 280, 10} {:message ""} true;
	call Transfer#313(__this, __msg_sender, __msg_value, call_arg#45, call_arg#46, tokensToBurn#1091);
	#1070 := true;
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_28.sol", 283, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1156: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_28.sol", 284, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1158: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_28.sol", 285, 4} {:message "HYDROGEN::buyTicket_re_ent30"} buyTicket_re_ent30#1188(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 286, 12} {:message ""} true;
	call __send_ret#47 := __send(lastPlayer_re_ent30#1156[__this], __this, 0, jackpot_re_ent30#1158[__this]);
	if (!(__send_ret#47)) {
	assume false;
	}

	lastPlayer_re_ent30#1156 := lastPlayer_re_ent30#1156[__this := __msg_sender];
	jackpot_re_ent30#1158 := jackpot_re_ent30#1158[__this := __balance[__this]];
	$return35:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_28.sol", 292, 3} {:message "HYDROGEN::multiTransfer"} multiTransfer#1220(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1191: address_t_arr_ptr, amounts#1194: int_arr_ptr)
{
	var {:sourceloc "buggy_28.sol", 293, 10} {:message "i"} i#1198: int;
	var transfer#1154_ret#50: bool;
	var tmp#51: int;
	// TCC assumptions
	assume (receivers#1191 < __alloc_counter);
	assume (amounts#1194 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1198 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1191])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1191]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1198 < length#address_t_arr#constr(mem_arr_address_t[receivers#1191]))) {
	// Body
	assume {:sourceloc "buggy_28.sol", 294, 7} {:message ""} true;
	call transfer#1154_ret#50 := transfer#1154(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1191])[i#1198], arr#int_arr#constr(mem_arr_int[amounts#1194])[i#1198]);
	$continue48:
	// Loop expression
	tmp#51 := i#1198;
	i#1198 := (i#1198 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1191])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1191]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break49:
	$return36:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 297, 1} {:message "balances_re_ent8"} balances_re_ent8#1224: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_28.sol", 298, 5} {:message "HYDROGEN::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1253(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 299, 9} {:message "success"} success#1228: bool;
	var __call_ret#52: bool;
	var __call_ret#53: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1224[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1224[__this][__msg_sender])];
	assume {:sourceloc "buggy_28.sol", 299, 26} {:message ""} true;
	call __call_ret#52, __call_ret#53 := __call(__msg_sender, __this, balances_re_ent8#1224[__this][__msg_sender]);
	if (__call_ret#52) {
	havoc counter_re_ent42#517;
	havoc _balances#550;
	havoc lastPlayer_re_ent2#552;
	havoc jackpot_re_ent2#554;
	havoc _allowed#590;
	havoc balances_re_ent17#594;
	havoc lastPlayer_re_ent37#638;
	havoc jackpot_re_ent37#640;
	havoc balances_re_ent3#677;
	havoc lastPlayer_re_ent9#721;
	havoc jackpot_re_ent9#723;
	havoc _totalSupply#761;
	havoc redeemableEther_re_ent25#765;
	havoc basePercent#804;
	havoc balances_re_ent38#829;
	havoc redeemableEther_re_ent4#874;
	havoc counter_re_ent7#925;
	havoc lastPlayer_re_ent23#972;
	havoc jackpot_re_ent23#974;
	havoc counter_re_ent14#1034;
	havoc lastPlayer_re_ent30#1156;
	havoc jackpot_re_ent30#1158;
	havoc balances_re_ent8#1224;
	havoc redeemableEther_re_ent39#1294;
	havoc balances_re_ent36#1450;
	havoc counter_re_ent35#1527;
	havoc userBalance_re_ent40#1611;
	havoc userBalance_re_ent33#1683;
	havoc not_called_re_ent27#1732;
	havoc balances_re_ent31#1812;
	havoc not_called_re_ent13#1889;
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#52)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1224[__this][__msg_sender])];
	}

	success#1228 := __call_ret#52;
	if (success#1228) {
	balances_re_ent8#1224 := balances_re_ent8#1224[__this := balances_re_ent8#1224[__this][__msg_sender := 0]];
	}

	$return37:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 304, 3} {:message "HYDROGEN::approve"} approve#1290(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1255: address_t, value#1257: int)
	returns (#1260: bool)
{
	var call_arg#54: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1255 != 0);
	_allowed#590 := _allowed#590[__this := _allowed#590[__this][__msg_sender := _allowed#590[__this][__msg_sender][spender#1255 := value#1257]]];
	call_arg#54 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 307, 10} {:message ""} true;
	call Approval#321(__this, __msg_sender, __msg_value, call_arg#54, spender#1255, value#1257);
	#1260 := true;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 310, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1294: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_28.sol", 311, 1} {:message "HYDROGEN::claimReward_re_ent39"} claimReward_re_ent39#1330(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 314, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1307: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1294[__this][__msg_sender] > 0);
	transferValue_re_ent39#1307 := redeemableEther_re_ent39#1294[__this][__msg_sender];
	assume {:sourceloc "buggy_28.sol", 315, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1307);
	redeemableEther_re_ent39#1294 := redeemableEther_re_ent39#1294[__this := redeemableEther_re_ent39#1294[__this][__msg_sender := 0]];
	$return39:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 319, 3} {:message "HYDROGEN::transferFrom"} transferFrom#1446(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1332: address_t, to#1334: address_t, value#1336: int)
	returns (#1339: bool)
{
	var sub#139_ret#55: int;
	var {:sourceloc "buggy_28.sol", 326, 5} {:message "tokensToBurn"} tokensToBurn#1381: int;
	var findtwoPercent#1031_ret#56: int;
	var {:sourceloc "buggy_28.sol", 327, 5} {:message "tokensToTransfer"} tokensToTransfer#1387: int;
	var sub#139_ret#57: int;
	var add#163_ret#58: int;
	var sub#139_ret#59: int;
	var sub#139_ret#60: int;
	var call_arg#61: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#1336 <= _balances#550[__this][from#1332]);
	assume (value#1336 <= _allowed#590[__this][from#1332][__msg_sender]);
	assume (to#1334 != 0);
	assume {:sourceloc "buggy_28.sol", 324, 23} {:message ""} true;
	call sub#139_ret#55 := sub#139(__this, __msg_sender, __msg_value, _balances#550[__this][from#1332], value#1336);
	_balances#550 := _balances#550[__this := _balances#550[__this][from#1332 := sub#139_ret#55]];
	assume {:sourceloc "buggy_28.sol", 326, 28} {:message ""} true;
	call findtwoPercent#1031_ret#56 := findtwoPercent#1031(__this, __msg_sender, __msg_value, value#1336);
	tokensToBurn#1381 := findtwoPercent#1031_ret#56;
	assume {:sourceloc "buggy_28.sol", 327, 32} {:message ""} true;
	call sub#139_ret#57 := sub#139(__this, __msg_sender, __msg_value, value#1336, tokensToBurn#1381);
	tokensToTransfer#1387 := sub#139_ret#57;
	assume {:sourceloc "buggy_28.sol", 329, 21} {:message ""} true;
	call add#163_ret#58 := add#163(__this, __msg_sender, __msg_value, _balances#550[__this][to#1334], tokensToTransfer#1387);
	_balances#550 := _balances#550[__this := _balances#550[__this][to#1334 := add#163_ret#58]];
	assume {:sourceloc "buggy_28.sol", 330, 20} {:message ""} true;
	call sub#139_ret#59 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#761[__this], tokensToBurn#1381);
	_totalSupply#761 := _totalSupply#761[__this := sub#139_ret#59];
	assume {:sourceloc "buggy_28.sol", 332, 34} {:message ""} true;
	call sub#139_ret#60 := sub#139(__this, __msg_sender, __msg_value, _allowed#590[__this][from#1332][__msg_sender], value#1336);
	_allowed#590 := _allowed#590[__this := _allowed#590[__this][from#1332 := _allowed#590[__this][from#1332][__msg_sender := sub#139_ret#60]]];
	assume {:sourceloc "buggy_28.sol", 334, 10} {:message ""} true;
	call Transfer#313(__this, __msg_sender, __msg_value, from#1332, to#1334, tokensToTransfer#1387);
	call_arg#61 := 0;
	assume {:sourceloc "buggy_28.sol", 335, 10} {:message ""} true;
	call Transfer#313(__this, __msg_sender, __msg_value, from#1332, call_arg#61, tokensToBurn#1381);
	#1339 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 339, 1} {:message "balances_re_ent36"} balances_re_ent36#1450: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_28.sol", 340, 5} {:message "HYDROGEN::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1473(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#62: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_28.sol", 341, 12} {:message ""} true;
	call __send_ret#62 := __send(__msg_sender, __this, 0, balances_re_ent36#1450[__this][__msg_sender]);
	if (__send_ret#62) {
	balances_re_ent36#1450 := balances_re_ent36#1450[__this := balances_re_ent36#1450[__this][__msg_sender := 0]];
	}

	$return41:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 345, 3} {:message "HYDROGEN::increaseAllowance"} increaseAllowance#1524(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1475: address_t, addedValue#1477: int)
	returns (#1480: bool)
{
	var add#163_ret#63: int;
	var call_arg#64: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1475 != 0);
	assume {:sourceloc "buggy_28.sol", 347, 38} {:message ""} true;
	call add#163_ret#63 := add#163(__this, __msg_sender, __msg_value, _allowed#590[__this][__msg_sender][spender#1475], addedValue#1477);
	_allowed#590 := _allowed#590[__this := _allowed#590[__this][__msg_sender := _allowed#590[__this][__msg_sender][spender#1475 := add#163_ret#63]]];
	call_arg#64 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 348, 10} {:message ""} true;
	call Approval#321(__this, __msg_sender, __msg_value, call_arg#64, spender#1475, _allowed#590[__this][__msg_sender][spender#1475]);
	#1480 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_28.sol", 351, 1} {:message "counter_re_ent35"} counter_re_ent35#1527: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_28.sol", 352, 1} {:message "HYDROGEN::callme_re_ent35"} callme_re_ent35#1556(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#65: int;
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1527[__this] <= 5);
	call_arg#65 := 10000000000000000000;
	assume {:sourceloc "buggy_28.sol", 354, 9} {:message ""} true;
	call __send_ret#66 := __send(__msg_sender, __this, 0, call_arg#65);
	if (!(__send_ret#66)) {
	assume false;
	}

	counter_re_ent35#1527 := counter_re_ent35#1527[__this := (counter_re_ent35#1527[__this] + 1)];
	$return43:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_28.sol", 360, 3} {:message "HYDROGEN::decreaseAllowance"} decreaseAllowance#1607(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1558: address_t, subtractedValue#1560: int)
	returns (#1563: bool)
{
	var sub#139_ret#67: int;
	var call_arg#68: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1558 != 0);
	assume {:sourceloc "buggy_28.sol", 362, 38} {:message ""} true;
	call sub#139_ret#67 := sub#139(__this, __msg_sender, __msg_value, _allowed#590[__this][__msg_sender][spender#1558], subtractedValue#1560);
	_allowed#590 := _allowed#590[__this := _allowed#590[__this][__msg_sender := _allowed#590[__this][__msg_sender][spender#1558 := sub#139_ret#67]]];
	call_arg#68 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 363, 10} {:message ""} true;
	call Approval#321(__this, __msg_sender, __msg_value, call_arg#68, spender#1558, _allowed#590[__this][__msg_sender][spender#1558]);
	#1563 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 366, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1611: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_28.sol", 367, 1} {:message "HYDROGEN::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1645(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 370, 3} {:message "success"} success#1615: bool;
	var __call_ret#69: bool;
	var __call_ret#70: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1611[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1611[__this][__msg_sender])];
	assume {:sourceloc "buggy_28.sol", 370, 18} {:message ""} true;
	call __call_ret#69, __call_ret#70 := __call(__msg_sender, __this, userBalance_re_ent40#1611[__this][__msg_sender]);
	if (__call_ret#69) {
	havoc counter_re_ent42#517;
	havoc _balances#550;
	havoc lastPlayer_re_ent2#552;
	havoc jackpot_re_ent2#554;
	havoc _allowed#590;
	havoc balances_re_ent17#594;
	havoc lastPlayer_re_ent37#638;
	havoc jackpot_re_ent37#640;
	havoc balances_re_ent3#677;
	havoc lastPlayer_re_ent9#721;
	havoc jackpot_re_ent9#723;
	havoc _totalSupply#761;
	havoc redeemableEther_re_ent25#765;
	havoc basePercent#804;
	havoc balances_re_ent38#829;
	havoc redeemableEther_re_ent4#874;
	havoc counter_re_ent7#925;
	havoc lastPlayer_re_ent23#972;
	havoc jackpot_re_ent23#974;
	havoc counter_re_ent14#1034;
	havoc lastPlayer_re_ent30#1156;
	havoc jackpot_re_ent30#1158;
	havoc balances_re_ent8#1224;
	havoc redeemableEther_re_ent39#1294;
	havoc balances_re_ent36#1450;
	havoc counter_re_ent35#1527;
	havoc userBalance_re_ent40#1611;
	havoc userBalance_re_ent33#1683;
	havoc not_called_re_ent27#1732;
	havoc balances_re_ent31#1812;
	havoc not_called_re_ent13#1889;
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#69)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1611[__this][__msg_sender])];
	}

	success#1615 := __call_ret#69;
	if (!(success#1615)) {
	assume false;
	}

	userBalance_re_ent40#1611 := userBalance_re_ent40#1611[__this := userBalance_re_ent40#1611[__this][__msg_sender := 0]];
	$return45:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 377, 3} {:message "HYDROGEN::_mint"} _mint#1679(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1647: address_t, amount#1649: int)
{
	var add#163_ret#71: int;
	var call_arg#72: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1649 != 0);
	assume {:sourceloc "buggy_28.sol", 379, 26} {:message ""} true;
	call add#163_ret#71 := add#163(__this, __msg_sender, __msg_value, _balances#550[__this][account#1647], amount#1649);
	_balances#550 := _balances#550[__this := _balances#550[__this][account#1647 := add#163_ret#71]];
	call_arg#72 := 0;
	assume {:sourceloc "buggy_28.sol", 380, 10} {:message ""} true;
	call Transfer#313(__this, __msg_sender, __msg_value, call_arg#72, account#1647, amount#1649);
	$return46:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 382, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1683: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_28.sol", 383, 1} {:message "HYDROGEN::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1717(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 386, 3} {:message "success"} success#1687: bool;
	var __call_ret#73: bool;
	var __call_ret#74: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1683[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1683[__this][__msg_sender])];
	assume {:sourceloc "buggy_28.sol", 386, 19} {:message ""} true;
	call __call_ret#73, __call_ret#74 := __call(__msg_sender, __this, userBalance_re_ent33#1683[__this][__msg_sender]);
	if (__call_ret#73) {
	havoc counter_re_ent42#517;
	havoc _balances#550;
	havoc lastPlayer_re_ent2#552;
	havoc jackpot_re_ent2#554;
	havoc _allowed#590;
	havoc balances_re_ent17#594;
	havoc lastPlayer_re_ent37#638;
	havoc jackpot_re_ent37#640;
	havoc balances_re_ent3#677;
	havoc lastPlayer_re_ent9#721;
	havoc jackpot_re_ent9#723;
	havoc _totalSupply#761;
	havoc redeemableEther_re_ent25#765;
	havoc basePercent#804;
	havoc balances_re_ent38#829;
	havoc redeemableEther_re_ent4#874;
	havoc counter_re_ent7#925;
	havoc lastPlayer_re_ent23#972;
	havoc jackpot_re_ent23#974;
	havoc counter_re_ent14#1034;
	havoc lastPlayer_re_ent30#1156;
	havoc jackpot_re_ent30#1158;
	havoc balances_re_ent8#1224;
	havoc redeemableEther_re_ent39#1294;
	havoc balances_re_ent36#1450;
	havoc counter_re_ent35#1527;
	havoc userBalance_re_ent40#1611;
	havoc userBalance_re_ent33#1683;
	havoc not_called_re_ent27#1732;
	havoc balances_re_ent31#1812;
	havoc not_called_re_ent13#1889;
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#73)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1683[__this][__msg_sender])];
	}

	success#1687 := __call_ret#73;
	if (!(success#1687)) {
	assume false;
	}

	userBalance_re_ent33#1683 := userBalance_re_ent33#1683[__this := userBalance_re_ent33#1683[__this][__msg_sender := 0]];
	$return47:
	// Function body ends here
}

// 
// Function: burn
procedure {:sourceloc "buggy_28.sol", 393, 3} {:message "HYDROGEN::burn"} burn#1729(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1719: int)
{
	var call_arg#75: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#75 := __msg_sender;
	assume {:sourceloc "buggy_28.sol", 394, 5} {:message ""} true;
	call _burn#1808(__this, __msg_sender, __msg_value, call_arg#75, amount#1719);
	$return48:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_28.sol", 396, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1732: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_28.sol", 397, 1} {:message "HYDROGEN::bug_re_ent27"} bug_re_ent27#1759(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#76: int;
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1732[__this];
	call_arg#76 := 1000000000000000000;
	assume {:sourceloc "buggy_28.sol", 399, 12} {:message ""} true;
	call __send_ret#77 := __send(__msg_sender, __this, 0, call_arg#76);
	if (!(__send_ret#77)) {
	assume false;
	}

	not_called_re_ent27#1732 := not_called_re_ent27#1732[__this := false];
	$return49:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_28.sol", 405, 3} {:message "HYDROGEN::_burn"} _burn#1808(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1761: address_t, amount#1763: int)
{
	var sub#139_ret#78: int;
	var sub#139_ret#79: int;
	var call_arg#80: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1763 != 0);
	assume (amount#1763 <= _balances#550[__this][account#1761]);
	assume {:sourceloc "buggy_28.sol", 408, 20} {:message ""} true;
	call sub#139_ret#78 := sub#139(__this, __msg_sender, __msg_value, _totalSupply#761[__this], amount#1763);
	_totalSupply#761 := _totalSupply#761[__this := sub#139_ret#78];
	assume {:sourceloc "buggy_28.sol", 409, 26} {:message ""} true;
	call sub#139_ret#79 := sub#139(__this, __msg_sender, __msg_value, _balances#550[__this][account#1761], amount#1763);
	_balances#550 := _balances#550[__this := _balances#550[__this][account#1761 := sub#139_ret#79]];
	call_arg#80 := 0;
	assume {:sourceloc "buggy_28.sol", 410, 10} {:message ""} true;
	call Transfer#313(__this, __msg_sender, __msg_value, account#1761, call_arg#80, amount#1763);
	$return50:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_28.sol", 412, 1} {:message "balances_re_ent31"} balances_re_ent31#1812: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_28.sol", 413, 1} {:message "HYDROGEN::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1845(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1814: int)
{
	var __send_ret#81: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1812[__this][__msg_sender] >= _weiToWithdraw#1814);
	assume {:sourceloc "buggy_28.sol", 416, 11} {:message ""} true;
	call __send_ret#81 := __send(__msg_sender, __this, 0, _weiToWithdraw#1814);
	assume __send_ret#81;
	balances_re_ent31#1812 := balances_re_ent31#1812[__this := balances_re_ent31#1812[__this][__msg_sender := (balances_re_ent31#1812[__this][__msg_sender] - _weiToWithdraw#1814)]];
	$return51:
	// Function body ends here
}

// 
// Function: burnFrom
procedure {:sourceloc "buggy_28.sol", 420, 3} {:message "HYDROGEN::burnFrom"} burnFrom#1886(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1847: address_t, amount#1849: int)
{
	var sub#139_ret#82: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#1849 <= _allowed#590[__this][account#1847][__msg_sender]);
	assume {:sourceloc "buggy_28.sol", 422, 37} {:message ""} true;
	call sub#139_ret#82 := sub#139(__this, __msg_sender, __msg_value, _allowed#590[__this][account#1847][__msg_sender], amount#1849);
	_allowed#590 := _allowed#590[__this := _allowed#590[__this][account#1847 := _allowed#590[__this][account#1847][__msg_sender := sub#139_ret#82]]];
	assume {:sourceloc "buggy_28.sol", 423, 5} {:message ""} true;
	call _burn#1808(__this, __msg_sender, __msg_value, account#1847, amount#1849);
	$return52:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_28.sol", 425, 1} {:message "not_called_re_ent13"} not_called_re_ent13#1889: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_28.sol", 426, 1} {:message "HYDROGEN::bug_re_ent13"} bug_re_ent13#1921(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_28.sol", 428, 3} {:message "success"} success#1897: bool;
	var __call_ret#83: bool;
	var __call_ret#84: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1889[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_28.sol", 428, 18} {:message ""} true;
	call __call_ret#83, __call_ret#84 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#83) {
	havoc counter_re_ent42#517;
	havoc _balances#550;
	havoc lastPlayer_re_ent2#552;
	havoc jackpot_re_ent2#554;
	havoc _allowed#590;
	havoc balances_re_ent17#594;
	havoc lastPlayer_re_ent37#638;
	havoc jackpot_re_ent37#640;
	havoc balances_re_ent3#677;
	havoc lastPlayer_re_ent9#721;
	havoc jackpot_re_ent9#723;
	havoc _totalSupply#761;
	havoc redeemableEther_re_ent25#765;
	havoc basePercent#804;
	havoc balances_re_ent38#829;
	havoc redeemableEther_re_ent4#874;
	havoc counter_re_ent7#925;
	havoc lastPlayer_re_ent23#972;
	havoc jackpot_re_ent23#974;
	havoc counter_re_ent14#1034;
	havoc lastPlayer_re_ent30#1156;
	havoc jackpot_re_ent30#1158;
	havoc balances_re_ent8#1224;
	havoc redeemableEther_re_ent39#1294;
	havoc balances_re_ent36#1450;
	havoc counter_re_ent35#1527;
	havoc userBalance_re_ent40#1611;
	havoc userBalance_re_ent33#1683;
	havoc not_called_re_ent27#1732;
	havoc balances_re_ent31#1812;
	havoc not_called_re_ent13#1889;
	havoc redeemableEther_re_ent11#200;
	havoc _name#238;
	havoc balances_re_ent1#242;
	havoc _symbol#273;
	havoc not_called_re_ent41#276;
	havoc _decimals#305;
	havoc userBalance_re_ent19#347;
	havoc userBalance_re_ent26#388;
	havoc not_called_re_ent20#433;
	havoc redeemableEther_re_ent32#472;
	havoc __balance;
	}

	if (!(__call_ret#83)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1897 := __call_ret#83;
	if (!(success#1897)) {
	assume false;
	}

	not_called_re_ent13#1889 := not_called_re_ent13#1889[__this := false];
	$return53:
	// Function body ends here
}

