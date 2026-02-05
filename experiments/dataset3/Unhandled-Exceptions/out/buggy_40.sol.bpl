// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_40.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 30, 5} {:message "SafeMath::add"} add#28(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var {:sourceloc "buggy_40.sol", 31, 9} {:message "c"} c#13: int;
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#13 := (a#5 + b#7);
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#13 >= a#5);
	#10 := c#13;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 46, 5} {:message "SafeMath::sub"} sub#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#31: int, b#33: int)
	returns (#36: int)
{
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var {:sourceloc "buggy_40.sol", 48, 9} {:message "c"} c#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#33 <= a#31);
	c#46 := (a#31 - b#33);
	#36 := c#46;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 62, 5} {:message "SafeMath::mul"} mul#89(__this: address_t, __msg_sender: address_t, __msg_value: int, a#57: int, b#59: int)
	returns (#62: int)
{
	var {:sourceloc "buggy_40.sol", 70, 9} {:message "c"} c#72: int;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#57 == 0)) {
	#62 := 0;
	goto $return2;
	}

	c#72 := (a#57 * b#59);
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#72 div a#57) == b#59);
	#62 := c#72;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 87, 5} {:message "SafeMath::div"} div#115(__this: address_t, __msg_sender: address_t, __msg_value: int, a#92: int, b#94: int)
	returns (#97: int)
{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	var {:sourceloc "buggy_40.sol", 90, 9} {:message "c"} c#107: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#94 > 0);
	c#107 := (a#92 div b#94);
	#97 := c#107;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 107, 5} {:message "SafeMath::mod"} mod#137(__this: address_t, __msg_sender: address_t, __msg_value: int, a#118: int, b#120: int)
	returns (#123: int)
{
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume (b#120 != 0);
	#123 := (a#118 mod b#120);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_40.sol", 20, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#138(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_40.sol", 180, 5} {:message "[event] IERC20::Transfer"} Transfer#204(__this: address_t, __msg_sender: address_t, __msg_value: int, from#198: address_t, to#200: address_t, value#202: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_40.sol", 186, 5} {:message "[event] IERC20::Approval"} Approval#213(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#207: address_t, spender#209: address_t, value#211: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_40.sol", 122, 5} {:message "IERC20::totalSupply"} totalSupply#145(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#143: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_40.sol", 127, 5} {:message "IERC20::balanceOf"} balanceOf#153(__this: address_t, __msg_sender: address_t, __msg_value: int, account#148: address_t)
	returns (#151: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_40.sol", 136, 5} {:message "IERC20::transfer"} transfer#163(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#156: address_t, amount#158: int)
	returns (#161: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_40.sol", 145, 5} {:message "IERC20::allowance"} allowance#173(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#166: address_t, spender#168: address_t)
	returns (#171: int);

// 
// Function: approve
procedure {:sourceloc "buggy_40.sol", 161, 5} {:message "IERC20::approve"} approve#183(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#176: address_t, amount#178: int)
	returns (#181: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_40.sol", 172, 5} {:message "IERC20::transferFrom"} transferFrom#195(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#186: address_t, recipient#188: address_t, amount#190: int)
	returns (#193: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_40.sol", 118, 1} {:message "IERC20::[implicit_constructor]"} __constructor#214(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Using library SafeMath for uint256
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_40.sol", 216, 3} {:message "payedOut_unchk9"} payedOut_unchk9#223: [address_t]bool;
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
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_40.sol", 218, 1} {:message "ERC20::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#244(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#223[__this];
	assume {:sourceloc "buggy_40.sol", 220, 5} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 222, 3} {:message "_balances"} _balances#248: [address_t][address_t]int;
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

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 224, 3} {:message "ERC20::callnotchecked_unchk25"} callnotchecked_unchk25#262(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#250: address_t)
{
	var __call_ret#11: bool;
	var __call_ret#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_40.sol", 225, 9} {:message ""} true;
	call __call_ret#11, __call_ret#12 := __call(callee#250, __this, 1000000000000000000);
	if (__call_ret#11) {
	havoc payedOut_unchk9#223;
	havoc _balances#248;
	havoc _allowances#268;
	havoc _totalSupply#291;
	havoc payedOut_unchk8#593;
	havoc winner_unchk8#595;
	havoc winAmount_unchk8#597;
	havoc payedOut_unchk44#855;
	havoc winner_unchk44#857;
	havoc winAmount_unchk44#859;
	havoc __balance;
	}

	if (!(__call_ret#11)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_40.sol", 227, 3} {:message "_allowances"} _allowances#268: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_40.sol", 229, 3} {:message "ERC20::bug_unchk19"} bug_unchk19#289(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 230, 1} {:message "addr_unchk19"} addr_unchk19#272: address_t;
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#272 := 0;
	call_arg#13 := 10000000000000000000;
	assume {:sourceloc "buggy_40.sol", 231, 6} {:message ""} true;
	call __send_ret#14 := __send(addr_unchk19#272, __this, 0, call_arg#13);
	if ((!(__send_ret#14) || (1 == 1))) {
	assume false;
	}

	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_40.sol", 234, 3} {:message "_totalSupply"} _totalSupply#291: [address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 239, 5} {:message "ERC20::totalSupply"} totalSupply#301(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#296: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#296 := _totalSupply#291[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 242, 1} {:message "ERC20::unhandledsend_unchk38"} unhandledsend_unchk38#313(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#303: address_t)
{
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#15 := 5000000000000000000;
	assume {:sourceloc "buggy_40.sol", 243, 5} {:message ""} true;
	call __send_ret#16 := __send(callee#303, __this, 0, call_arg#15);
	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 249, 5} {:message "ERC20::balanceOf"} balanceOf#327(__this: address_t, __msg_sender: address_t, __msg_value: int, account#316: address_t)
	returns (#320: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#320 := _balances#248[__this][account#316];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_40.sol", 252, 1} {:message "ERC20::cash_unchk46"} cash_unchk46#351(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#329: int, subpotIndex#331: int, winner_unchk46#333: address_t)
{
	var {:sourceloc "buggy_40.sol", 253, 9} {:message "subpot_unchk46"} subpot_unchk46#337: int;
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#337 := 3000000000000000000;
	call_arg#17 := subpot_unchk46#337;
	assume {:sourceloc "buggy_40.sol", 254, 9} {:message ""} true;
	call __send_ret#18 := __send(winner_unchk46#333, __this, 0, call_arg#17);
	subpot_unchk46#337 := 0;
	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 266, 5} {:message "ERC20::transfer"} transfer#372(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#354: address_t, amount#356: int)
	returns (#360: bool)
{
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 267, 9} {:message ""} true;
	call _transfer#675(__this, __msg_sender, __msg_value, call_arg#19, recipient#354, amount#356);
	#360 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_40.sol", 270, 1} {:message "ERC20::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#387(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 271, 4} {:message "addr_unchk4"} addr_unchk4#376: address_t;
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#376 := 0;
	call_arg#20 := 42000000000000000000;
	assume {:sourceloc "buggy_40.sol", 272, 10} {:message ""} true;
	call __send_ret#21 := __send(addr_unchk4#376, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	
	}
	else {
	
	}

	$return13:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 283, 5} {:message "ERC20::allowance"} allowance#405(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#390: address_t, spender#392: address_t)
	returns (#396: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#396 := _allowances#268[__this][owner#390][spender#392];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_40.sol", 286, 1} {:message "ERC20::bug_unchk7"} bug_unchk7#426(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 287, 1} {:message "addr_unchk7"} addr_unchk7#409: address_t;
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#409 := 0;
	call_arg#22 := 10000000000000000000;
	assume {:sourceloc "buggy_40.sol", 288, 6} {:message ""} true;
	call __send_ret#23 := __send(addr_unchk7#409, __this, 0, call_arg#22);
	if ((!(__send_ret#23) || (1 == 1))) {
	assume false;
	}

	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 299, 5} {:message "ERC20::approve"} approve#447(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#429: address_t, value#431: int)
	returns (#435: bool)
{
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#24 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 300, 9} {:message ""} true;
	call _approve#852(__this, __msg_sender, __msg_value, call_arg#24, spender#429, value#431);
	#435 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 303, 1} {:message "ERC20::my_func_unchk23"} my_func_unchk23#460(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#449: address_t)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 304, 9} {:message ""} true;
	call __send_ret#25 := __send(dst#449, __this, 0, __msg_value);
	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 319, 5} {:message "ERC20::transferFrom"} transferFrom#497(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#463: address_t, recipient#465: address_t, amount#467: int)
	returns (#471: bool)
{
	var call_arg#26: address_t;
	var sub#54_ret#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 320, 9} {:message ""} true;
	call _transfer#675(__this, __msg_sender, __msg_value, sender#463, recipient#465, amount#467);
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 321, 38} {:message ""} true;
	call sub#54_ret#27 := sub#54(__this, __msg_sender, __msg_value, _allowances#268[__this][sender#463][__msg_sender], amount#467);
	assume {:sourceloc "buggy_40.sol", 321, 9} {:message ""} true;
	call _approve#852(__this, __msg_sender, __msg_value, sender#463, call_arg#26, sub#54_ret#27);
	#471 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 324, 1} {:message "ERC20::unhandledsend_unchk14"} unhandledsend_unchk14#509(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#499: address_t)
{
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#28 := 5000000000000000000;
	assume {:sourceloc "buggy_40.sol", 325, 5} {:message ""} true;
	call __send_ret#29 := __send(callee#499, __this, 0, call_arg#28);
	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 340, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#537(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#512: address_t, addedValue#514: int)
	returns (#517: bool)
{
	var call_arg#30: address_t;
	var add#28_ret#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#30 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 341, 39} {:message ""} true;
	call add#28_ret#31 := add#28(__this, __msg_sender, __msg_value, _allowances#268[__this][__msg_sender][spender#512], addedValue#514);
	assume {:sourceloc "buggy_40.sol", 341, 9} {:message ""} true;
	call _approve#852(__this, __msg_sender, __msg_value, call_arg#30, spender#512, add#28_ret#31);
	#517 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_40.sol", 344, 1} {:message "ERC20::bug_unchk30"} bug_unchk30#562(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 345, 1} {:message "receivers_unchk30"} receivers_unchk30#541: int;
	var {:sourceloc "buggy_40.sol", 346, 1} {:message "addr_unchk30"} addr_unchk30#544: address_t;
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#541 := 0;
	addr_unchk30#544 := 0;
	call_arg#32 := 42000000000000000000;
	assume {:sourceloc "buggy_40.sol", 347, 6} {:message ""} true;
	call __send_ret#33 := __send(addr_unchk30#544, __this, 0, call_arg#32);
	if (!(__send_ret#33)) {
	receivers_unchk30#541 := (receivers_unchk30#541 + 1);
	}
	else {
	assume false;
	}

	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 367, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#590(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#565: address_t, subtractedValue#567: int)
	returns (#570: bool)
{
	var call_arg#34: address_t;
	var sub#54_ret#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#34 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 368, 39} {:message ""} true;
	call sub#54_ret#35 := sub#54(__this, __msg_sender, __msg_value, _allowances#268[__this][__msg_sender][spender#565], subtractedValue#567);
	assume {:sourceloc "buggy_40.sol", 368, 9} {:message ""} true;
	call _approve#852(__this, __msg_sender, __msg_value, call_arg#34, spender#565, sub#54_ret#35);
	#570 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_40.sol", 371, 1} {:message "payedOut_unchk8"} payedOut_unchk8#593: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_40.sol", 372, 1} {:message "winner_unchk8"} winner_unchk8#595: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_40.sol", 373, 1} {:message "winAmount_unchk8"} winAmount_unchk8#597: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_40.sol", 375, 1} {:message "ERC20::sendToWinner_unchk8"} sendToWinner_unchk8#616(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#593[__this]);
	assume {:sourceloc "buggy_40.sol", 377, 9} {:message ""} true;
	call __send_ret#36 := __send(winner_unchk8#595[__this], __this, 0, winAmount_unchk8#597[__this]);
	payedOut_unchk8#593 := payedOut_unchk8#593[__this := true];
	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 395, 5} {:message "ERC20::_transfer"} _transfer#675(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#619: address_t, recipient#621: address_t, amount#623: int)
{
	var call_arg#37: int_arr_ptr;
	var new_array#38: int_arr_ptr;
	var call_arg#39: int_arr_ptr;
	var new_array#40: int_arr_ptr;
	var sub#54_ret#41: int;
	var add#28_ret#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#38 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#37 := new_array#38;
	mem_arr_int := mem_arr_int[call_arg#37 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#619 != 0);
	new_array#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#39 := new_array#40;
	mem_arr_int := mem_arr_int[call_arg#39 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#621 != 0);
	assume {:sourceloc "buggy_40.sol", 399, 29} {:message ""} true;
	call sub#54_ret#41 := sub#54(__this, __msg_sender, __msg_value, _balances#248[__this][sender#619], amount#623);
	_balances#248 := _balances#248[__this := _balances#248[__this][sender#619 := sub#54_ret#41]];
	assume {:sourceloc "buggy_40.sol", 400, 32} {:message ""} true;
	call add#28_ret#42 := add#28(__this, __msg_sender, __msg_value, _balances#248[__this][recipient#621], amount#623);
	_balances#248 := _balances#248[__this := _balances#248[__this][recipient#621 := add#28_ret#42]];
	assume {:sourceloc "buggy_40.sol", 401, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, sender#619, recipient#621, amount#623);
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 403, 1} {:message "ERC20::bug_unchk39"} bug_unchk39#687(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#677: address_t)
{
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#43 := 4000000000000000000;
	assume {:sourceloc "buggy_40.sol", 404, 8} {:message ""} true;
	call __send_ret#44 := __send(addr#677, __this, 0, call_arg#43);
	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 415, 5} {:message "ERC20::_mint"} _mint#733(__this: address_t, __msg_sender: address_t, __msg_value: int, account#690: address_t, amount#692: int)
{
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	var add#28_ret#47: int;
	var add#28_ret#48: int;
	var call_arg#49: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#690 != 0);
	assume {:sourceloc "buggy_40.sol", 418, 24} {:message ""} true;
	call add#28_ret#47 := add#28(__this, __msg_sender, __msg_value, _totalSupply#291[__this], amount#692);
	_totalSupply#291 := _totalSupply#291[__this := add#28_ret#47];
	assume {:sourceloc "buggy_40.sol", 419, 30} {:message ""} true;
	call add#28_ret#48 := add#28(__this, __msg_sender, __msg_value, _balances#248[__this][account#690], amount#692);
	_balances#248 := _balances#248[__this := _balances#248[__this][account#690 := add#28_ret#48]];
	call_arg#49 := 0;
	assume {:sourceloc "buggy_40.sol", 420, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, call_arg#49, account#690, amount#692);
	$return26:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 422, 1} {:message "ERC20::my_func_uncheck36"} my_func_uncheck36#748(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#735: address_t)
{
	var __call_ret#50: bool;
	var __call_ret#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_40.sol", 423, 5} {:message ""} true;
	call __call_ret#50, __call_ret#51 := __call(dst#735, __this, __msg_value);
	if (__call_ret#50) {
	havoc payedOut_unchk9#223;
	havoc _balances#248;
	havoc _allowances#268;
	havoc _totalSupply#291;
	havoc payedOut_unchk8#593;
	havoc winner_unchk8#595;
	havoc winAmount_unchk8#597;
	havoc payedOut_unchk44#855;
	havoc winner_unchk44#857;
	havoc winAmount_unchk44#859;
	havoc __balance;
	}

	if (!(__call_ret#50)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 437, 5} {:message "ERC20::_burn"} _burn#794(__this: address_t, __msg_sender: address_t, __msg_value: int, account#751: address_t, value#753: int)
{
	var call_arg#52: int_arr_ptr;
	var new_array#53: int_arr_ptr;
	var sub#54_ret#54: int;
	var sub#54_ret#55: int;
	var call_arg#56: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#53 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#52 := new_array#53;
	mem_arr_int := mem_arr_int[call_arg#52 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#751 != 0);
	assume {:sourceloc "buggy_40.sol", 440, 24} {:message ""} true;
	call sub#54_ret#54 := sub#54(__this, __msg_sender, __msg_value, _totalSupply#291[__this], value#753);
	_totalSupply#291 := _totalSupply#291[__this := sub#54_ret#54];
	assume {:sourceloc "buggy_40.sol", 441, 30} {:message ""} true;
	call sub#54_ret#55 := sub#54(__this, __msg_sender, __msg_value, _balances#248[__this][account#751], value#753);
	_balances#248 := _balances#248[__this := _balances#248[__this][account#751 := sub#54_ret#55]];
	call_arg#56 := 0;
	assume {:sourceloc "buggy_40.sol", 442, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, account#751, call_arg#56, value#753);
	$return28:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 444, 1} {:message "ERC20::my_func_unchk35"} my_func_unchk35#807(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#796: address_t)
{
	var __send_ret#57: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 445, 9} {:message ""} true;
	call __send_ret#57 := __send(dst#796, __this, 0, __msg_value);
	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 461, 5} {:message "ERC20::_approve"} _approve#852(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#810: address_t, spender#812: address_t, value#814: int)
{
	var call_arg#58: int_arr_ptr;
	var new_array#59: int_arr_ptr;
	var call_arg#60: int_arr_ptr;
	var new_array#61: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#59 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#58 := new_array#59;
	mem_arr_int := mem_arr_int[call_arg#58 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#810 != 0);
	new_array#61 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#60 := new_array#61;
	mem_arr_int := mem_arr_int[call_arg#60 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#812 != 0);
	_allowances#268 := _allowances#268[__this := _allowances#268[__this][owner#810 := _allowances#268[__this][owner#810][spender#812 := value#814]]];
	assume {:sourceloc "buggy_40.sol", 466, 14} {:message ""} true;
	call Approval#213(__this, __msg_sender, __msg_value, owner#810, spender#812, value#814);
	$return30:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_40.sol", 468, 1} {:message "payedOut_unchk44"} payedOut_unchk44#855: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_40.sol", 469, 1} {:message "winner_unchk44"} winner_unchk44#857: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_40.sol", 470, 1} {:message "winAmount_unchk44"} winAmount_unchk44#859: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_40.sol", 472, 1} {:message "ERC20::sendToWinner_unchk44"} sendToWinner_unchk44#878(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#62: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#855[__this]);
	assume {:sourceloc "buggy_40.sol", 474, 9} {:message ""} true;
	call __send_ret#62 := __send(winner_unchk44#857[__this], __this, 0, winAmount_unchk44#859[__this]);
	payedOut_unchk44#855 := payedOut_unchk44#855[__this := true];
	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 484, 5} {:message "ERC20::_burnFrom"} _burnFrom#907(__this: address_t, __msg_sender: address_t, __msg_value: int, account#881: address_t, amount#883: int)
{
	var call_arg#63: address_t;
	var sub#54_ret#64: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 485, 9} {:message ""} true;
	call _burn#794(__this, __msg_sender, __msg_value, account#881, amount#883);
	call_arg#63 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 486, 39} {:message ""} true;
	call sub#54_ret#64 := sub#54(__this, __msg_sender, __msg_value, _allowances#268[__this][account#881][__msg_sender], amount#883);
	assume {:sourceloc "buggy_40.sol", 486, 9} {:message ""} true;
	call _approve#852(__this, __msg_sender, __msg_value, account#881, call_arg#63, sub#54_ret#64);
	$return32:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_40.sol", 488, 1} {:message "ERC20::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#922(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 489, 4} {:message "addr_unchk40"} addr_unchk40#911: address_t;
	var call_arg#65: int;
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#911 := 0;
	call_arg#65 := 2000000000000000000;
	assume {:sourceloc "buggy_40.sol", 490, 10} {:message ""} true;
	call __send_ret#66 := __send(addr_unchk40#911, __this, 0, call_arg#65);
	if (!(__send_ret#66)) {
	
	}
	else {
	
	}

	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_40.sol", 213, 1} {:message "ERC20::[implicit_constructor]"} __constructor#923(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk9#223 := payedOut_unchk9#223[__this := false];
	_balances#248 := _balances#248[__this := default_address_t_int()];
	_allowances#268 := _allowances#268[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#291 := _totalSupply#291[__this := 0];
	payedOut_unchk8#593 := payedOut_unchk8#593[__this := false];
	winner_unchk8#595 := winner_unchk8#595[__this := 0];
	winAmount_unchk8#597 := winAmount_unchk8#597[__this := 0];
	payedOut_unchk44#855 := payedOut_unchk44#855[__this := false];
	winner_unchk44#857 := winner_unchk44#857[__this := 0];
	winAmount_unchk44#859 := winAmount_unchk44#859[__this := 0];
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 503, 3} {:message "ERC20Detailed::unhandledsend_unchk26"} unhandledsend_unchk26#938(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#928: address_t)
{
	var call_arg#67: int;
	var __send_ret#68: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#67 := 5000000000000000000;
	assume {:sourceloc "buggy_40.sol", 504, 5} {:message ""} true;
	call __send_ret#68 := __send(callee#928, __this, 0, call_arg#67);
	$return34:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_40.sol", 506, 3} {:message "_name"} _name#940: [address_t]int_arr_type;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_40.sol", 507, 3} {:message "payedOut_unchk20"} payedOut_unchk20#943: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_40.sol", 508, 1} {:message "winner_unchk20"} winner_unchk20#945: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_40.sol", 509, 1} {:message "winAmount_unchk20"} winAmount_unchk20#947: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_40.sol", 511, 1} {:message "ERC20Detailed::sendToWinner_unchk20"} sendToWinner_unchk20#966(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#69: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#943[__this]);
	assume {:sourceloc "buggy_40.sol", 513, 9} {:message ""} true;
	call __send_ret#69 := __send(winner_unchk20#945[__this], __this, 0, winAmount_unchk20#947[__this]);
	payedOut_unchk20#943 := payedOut_unchk20#943[__this := true];
	$return35:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_40.sol", 516, 3} {:message "_symbol"} _symbol#968: [address_t]int_arr_type;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_40.sol", 517, 3} {:message "payedOut_unchk32"} payedOut_unchk32#971: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_40.sol", 518, 1} {:message "winner_unchk32"} winner_unchk32#973: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_40.sol", 519, 1} {:message "winAmount_unchk32"} winAmount_unchk32#975: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_40.sol", 521, 1} {:message "ERC20Detailed::sendToWinner_unchk32"} sendToWinner_unchk32#994(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#70: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#971[__this]);
	assume {:sourceloc "buggy_40.sol", 523, 9} {:message ""} true;
	call __send_ret#70 := __send(winner_unchk32#973[__this], __this, 0, winAmount_unchk32#975[__this]);
	payedOut_unchk32#971 := payedOut_unchk32#971[__this := true];
	$return36:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_40.sol", 526, 3} {:message "_decimals"} _decimals#996: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 533, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1128(__this: address_t, __msg_sender: address_t, __msg_value: int, name#999: int_arr_ptr, symbol#1001: int_arr_ptr, decimals#1003: int)
{
	// TCC assumptions
	assume (name#999 < __alloc_counter);
	assume (symbol#1001 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#940 := _name#940[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk20#943 := payedOut_unchk20#943[__this := false];
	winner_unchk20#945 := winner_unchk20#945[__this := 0];
	winAmount_unchk20#947 := winAmount_unchk20#947[__this := 0];
	_symbol#968 := _symbol#968[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk32#971 := payedOut_unchk32#971[__this := false];
	winner_unchk32#973 := winner_unchk32#973[__this := 0];
	winAmount_unchk32#975 := winAmount_unchk32#975[__this := 0];
	_decimals#996 := _decimals#996[__this := 0];
	payedOut_unchk33#1022 := payedOut_unchk33#1022[__this := false];
	payedOut_unchk45#1106 := payedOut_unchk45#1106[__this := false];
	// Function body starts here
	_name#940 := _name#940[__this := mem_arr_int[name#999]];
	_symbol#968 := _symbol#968[__this := mem_arr_int[symbol#1001]];
	_decimals#996 := _decimals#996[__this := decimals#1003];
	$return37:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_40.sol", 538, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1022: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_40.sol", 540, 1} {:message "ERC20Detailed::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1043(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#71: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1022[__this];
	assume {:sourceloc "buggy_40.sol", 542, 5} {:message ""} true;
	call __send_ret#71 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return38:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 548, 5} {:message "ERC20Detailed::name"} name#1052(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1047: int_arr_ptr)
{
	var new_array#72: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#72 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1047 := new_array#72;
	mem_arr_int := mem_arr_int[#1047 := _name#940[__this]];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_40.sol", 551, 1} {:message "ERC20Detailed::bug_unchk27"} bug_unchk27#1064(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1054: address_t)
{
	var call_arg#73: int;
	var __send_ret#74: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#73 := 42000000000000000000;
	assume {:sourceloc "buggy_40.sol", 552, 8} {:message ""} true;
	call __send_ret#74 := __send(addr#1054, __this, 0, call_arg#73);
	$return40:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 558, 5} {:message "ERC20Detailed::symbol"} symbol#1073(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1068: int_arr_ptr)
{
	var new_array#75: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#75 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1068 := new_array#75;
	mem_arr_int := mem_arr_int[#1068 := _symbol#968[__this]];
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_40.sol", 561, 1} {:message "ERC20Detailed::bug_unchk31"} bug_unchk31#1094(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 562, 1} {:message "addr_unchk31"} addr_unchk31#1077: address_t;
	var call_arg#76: int;
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#1077 := 0;
	call_arg#76 := 10000000000000000000;
	assume {:sourceloc "buggy_40.sol", 563, 6} {:message ""} true;
	call __send_ret#77 := __send(addr_unchk31#1077, __this, 0, call_arg#76);
	if ((!(__send_ret#77) || (1 == 1))) {
	assume false;
	}

	$return42:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_40.sol", 579, 5} {:message "ERC20Detailed::decimals"} decimals#1103(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1098: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1098 := _decimals#996[__this];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_40.sol", 582, 1} {:message "payedOut_unchk45"} payedOut_unchk45#1106: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_40.sol", 584, 1} {:message "ERC20Detailed::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#1127(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#78: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#1106[__this];
	assume {:sourceloc "buggy_40.sol", 586, 9} {:message ""} true;
	call __send_ret#78 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return44:
	// Function body ends here
}

// 
// ------- Contract: SimpleSwapCoin -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 591, 5} {:message "SimpleSwapCoin::[constructor]"} __constructor#1172(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1134: int_arr_ptr, _symbol#1136: int_arr_ptr, _decimals#1138: int)
{
	var name#999#79: int_arr_ptr;
	var symbol#1001#79: int_arr_ptr;
	var decimals#1003#79: int;
	var call_arg#81: address_t;
	var call_arg#82: int;
	// TCC assumptions
	assume (_name#1134 < __alloc_counter);
	assume (_symbol#1136 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#940 := _name#940[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk20#943 := payedOut_unchk20#943[__this := false];
	winner_unchk20#945 := winner_unchk20#945[__this := 0];
	winAmount_unchk20#947 := winAmount_unchk20#947[__this := 0];
	_symbol#968 := _symbol#968[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk32#971 := payedOut_unchk32#971[__this := false];
	winner_unchk32#973 := winner_unchk32#973[__this := 0];
	winAmount_unchk32#975 := winAmount_unchk32#975[__this := 0];
	_decimals#996 := _decimals#996[__this := 0];
	payedOut_unchk33#1022 := payedOut_unchk33#1022[__this := false];
	payedOut_unchk45#1106 := payedOut_unchk45#1106[__this := false];
	payedOut_unchk9#223 := payedOut_unchk9#223[__this := false];
	_balances#248 := _balances#248[__this := default_address_t_int()];
	_allowances#268 := _allowances#268[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#291 := _totalSupply#291[__this := 0];
	payedOut_unchk8#593 := payedOut_unchk8#593[__this := false];
	winner_unchk8#595 := winner_unchk8#595[__this := 0];
	winAmount_unchk8#597 := winAmount_unchk8#597[__this := 0];
	payedOut_unchk44#855 := payedOut_unchk44#855[__this := false];
	winner_unchk44#857 := winner_unchk44#857[__this := 0];
	winAmount_unchk44#859 := winAmount_unchk44#859[__this := 0];
	// Arguments for ERC20Detailed
	name#999#79 := _name#1134;
	symbol#1001#79 := _symbol#1136;
	decimals#1003#79 := _decimals#1138;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#940 := _name#940[__this := mem_arr_int[name#999#79]];
	_symbol#968 := _symbol#968[__this := mem_arr_int[symbol#1001#79]];
	_decimals#996 := _decimals#996[__this := decimals#1003#79];
	$return45:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#81 := __msg_sender;
	call_arg#82 := 10000000000000000;
	assume {:sourceloc "buggy_40.sol", 592, 9} {:message ""} true;
	call _mint#733(__this, __msg_sender, __msg_value, call_arg#81, call_arg#82);
	$return46:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_40.sol", 594, 1} {:message "SimpleSwapCoin::callnotchecked_unchk13"} callnotchecked_unchk13#1171(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1157: address_t)
{
	var __call_ret#83: bool;
	var __call_ret#84: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_40.sol", 595, 5} {:message ""} true;
	call __call_ret#83, __call_ret#84 := __call(callee#1157, __this, 1000000000000000000);
	if (__call_ret#83) {
	havoc _name#940;
	havoc payedOut_unchk20#943;
	havoc winner_unchk20#945;
	havoc winAmount_unchk20#947;
	havoc _symbol#968;
	havoc payedOut_unchk32#971;
	havoc winner_unchk32#973;
	havoc winAmount_unchk32#975;
	havoc _decimals#996;
	havoc payedOut_unchk33#1022;
	havoc payedOut_unchk45#1106;
	havoc payedOut_unchk9#223;
	havoc _balances#248;
	havoc _allowances#268;
	havoc _totalSupply#291;
	havoc payedOut_unchk8#593;
	havoc winner_unchk8#595;
	havoc winAmount_unchk8#597;
	havoc payedOut_unchk44#855;
	havoc winner_unchk44#857;
	havoc winAmount_unchk44#859;
	havoc __balance;
	}

	if (!(__call_ret#83)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return47:
	// Function body ends here
}

