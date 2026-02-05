// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_26.sol -------
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
procedure {:inline 1} {:sourceloc "buggy_26.sol", 9, 5} {:message "SafeMath::add"} add#26(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_26.sol", 10, 9} {:message "c"} c#11: int;
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#11 := (a#3 + b#5);
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#11 >= a#3);
	#8 := c#11;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 15, 5} {:message "SafeMath::sub"} sub#51(__this: address_t, __msg_sender: address_t, __msg_value: int, a#28: int, b#30: int)
	returns (#33: int)
{
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var {:sourceloc "buggy_26.sol", 17, 9} {:message "c"} c#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#30 <= a#28);
	c#43 := (a#28 - b#30);
	#33 := c#43;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 21, 5} {:message "SafeMath::mul"} mul#85(__this: address_t, __msg_sender: address_t, __msg_value: int, a#53: int, b#55: int)
	returns (#58: int)
{
	var {:sourceloc "buggy_26.sol", 29, 9} {:message "c"} c#68: int;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#53 == 0)) {
	#58 := 0;
	goto $return2;
	}

	c#68 := (a#53 * b#55);
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#68 div a#53) == b#55);
	#58 := c#68;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 35, 5} {:message "SafeMath::div"} div#110(__this: address_t, __msg_sender: address_t, __msg_value: int, a#87: int, b#89: int)
	returns (#92: int)
{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	var {:sourceloc "buggy_26.sol", 38, 9} {:message "c"} c#102: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#89 > 0);
	c#102 := (a#87 div b#89);
	#92 := c#102;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 44, 5} {:message "SafeMath::mod"} mod#131(__this: address_t, __msg_sender: address_t, __msg_value: int, a#112: int, b#114: int)
	returns (#117: int)
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
	assume (b#114 != 0);
	#117 := (a#112 mod b#114);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_26.sol", 7, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#132(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_26.sol", 57, 5} {:message "[event] IERC20::Transfer"} Transfer#190(__this: address_t, __msg_sender: address_t, __msg_value: int, from#184: address_t, to#186: address_t, value#188: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_26.sol", 58, 5} {:message "[event] IERC20::Approval"} Approval#198(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#192: address_t, spender#194: address_t, value#196: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_26.sol", 51, 5} {:message "IERC20::totalSupply"} totalSupply#137(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#135: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_26.sol", 52, 5} {:message "IERC20::balanceOf"} balanceOf#144(__this: address_t, __msg_sender: address_t, __msg_value: int, account#139: address_t)
	returns (#142: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_26.sol", 53, 5} {:message "IERC20::transfer"} transfer#153(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#146: address_t, amount#148: int)
	returns (#151: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_26.sol", 54, 5} {:message "IERC20::allowance"} allowance#162(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#155: address_t, spender#157: address_t)
	returns (#160: int);

// 
// Function: approve
procedure {:sourceloc "buggy_26.sol", 55, 5} {:message "IERC20::approve"} approve#171(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#164: address_t, amount#166: int)
	returns (#169: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_26.sol", 56, 5} {:message "IERC20::transferFrom"} transferFrom#182(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#173: address_t, recipient#175: address_t, amount#177: int)
	returns (#180: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_26.sol", 50, 1} {:message "IERC20::[implicit_constructor]"} __constructor#199(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: UBBCToken -------
// Inherits from: IERC20
// Using library SafeMath for uint256
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
procedure {:sourceloc "buggy_26.sol", 63, 3} {:message "UBBCToken::callnotchecked_unchk25"} callnotchecked_unchk25#218(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#206: address_t)
{
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_26.sol", 64, 5} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(callee#206, __this, 1000000000000000000);
	if (__call_ret#10) {
	havoc _balances#222;
	havoc _allowances#249;
	havoc _totalSupply#263;
	havoc payedOut_unchk20#266;
	havoc winner_unchk20#268;
	havoc winAmount_unchk20#270;
	havoc _name#291;
	havoc payedOut_unchk32#294;
	havoc winner_unchk32#296;
	havoc winAmount_unchk32#298;
	havoc _symbol#319;
	havoc _decimals#333;
	havoc payedOut_unchk45#386;
	havoc payedOut_unchk8#578;
	havoc winner_unchk8#580;
	havoc winAmount_unchk8#582;
	havoc payedOut_unchk44#744;
	havoc winner_unchk44#746;
	havoc winAmount_unchk44#748;
	havoc payedOut_unchk33#870;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 66, 3} {:message "_balances"} _balances#222: [address_t][address_t]int;
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
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_26.sol", 67, 3} {:message "UBBCToken::bug_unchk19"} bug_unchk19#243(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 68, 1} {:message "addr_unchk19"} addr_unchk19#226: address_t;
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#226 := 0;
	call_arg#12 := 10000000000000000000;
	assume {:sourceloc "buggy_26.sol", 69, 6} {:message ""} true;
	call __send_ret#13 := __send(addr_unchk19#226, __this, 0, call_arg#12);
	if ((!(__send_ret#13) || (1 == 1))) {
	assume false;
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_26.sol", 72, 3} {:message "_allowances"} _allowances#249: [address_t][address_t][address_t]int;
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 73, 3} {:message "UBBCToken::unhandledsend_unchk26"} unhandledsend_unchk26#261(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#251: address_t)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := 5000000000000000000;
	assume {:sourceloc "buggy_26.sol", 74, 5} {:message ""} true;
	call __send_ret#15 := __send(callee#251, __this, 0, call_arg#14);
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_26.sol", 76, 3} {:message "_totalSupply"} _totalSupply#263: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_26.sol", 77, 3} {:message "payedOut_unchk20"} payedOut_unchk20#266: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_26.sol", 78, 1} {:message "winner_unchk20"} winner_unchk20#268: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_26.sol", 79, 1} {:message "winAmount_unchk20"} winAmount_unchk20#270: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_26.sol", 81, 1} {:message "UBBCToken::sendToWinner_unchk20"} sendToWinner_unchk20#289(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#266[__this]);
	assume {:sourceloc "buggy_26.sol", 83, 9} {:message ""} true;
	call __send_ret#16 := __send(winner_unchk20#268[__this], __this, 0, winAmount_unchk20#270[__this]);
	payedOut_unchk20#266 := payedOut_unchk20#266[__this := true];
	$return8:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_26.sol", 86, 3} {:message "_name"} _name#291: [address_t]int_arr_type;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_26.sol", 87, 3} {:message "payedOut_unchk32"} payedOut_unchk32#294: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_26.sol", 88, 1} {:message "winner_unchk32"} winner_unchk32#296: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_26.sol", 89, 1} {:message "winAmount_unchk32"} winAmount_unchk32#298: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_26.sol", 91, 1} {:message "UBBCToken::sendToWinner_unchk32"} sendToWinner_unchk32#317(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#294[__this]);
	assume {:sourceloc "buggy_26.sol", 93, 9} {:message ""} true;
	call __send_ret#17 := __send(winner_unchk32#296[__this], __this, 0, winAmount_unchk32#298[__this]);
	payedOut_unchk32#294 := payedOut_unchk32#294[__this := true];
	$return9:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_26.sol", 96, 3} {:message "_symbol"} _symbol#319: [address_t]int_arr_type;
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 97, 3} {:message "UBBCToken::unhandledsend_unchk38"} unhandledsend_unchk38#331(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#321: address_t)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := 5000000000000000000;
	assume {:sourceloc "buggy_26.sol", 98, 5} {:message ""} true;
	call __send_ret#19 := __send(callee#321, __this, 0, call_arg#18);
	$return10:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_26.sol", 100, 3} {:message "_decimals"} _decimals#333: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 101, 5} {:message "UBBCToken::[constructor]"} __constructor#976(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#222 := _balances#222[__this := default_address_t_int()];
	_allowances#249 := _allowances#249[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#263 := _totalSupply#263[__this := 0];
	payedOut_unchk20#266 := payedOut_unchk20#266[__this := false];
	winner_unchk20#268 := winner_unchk20#268[__this := 0];
	winAmount_unchk20#270 := winAmount_unchk20#270[__this := 0];
	_name#291 := _name#291[__this := int_arr#constr(default_int_int(), 0)];
	payedOut_unchk32#294 := payedOut_unchk32#294[__this := false];
	winner_unchk32#296 := winner_unchk32#296[__this := 0];
	winAmount_unchk32#298 := winAmount_unchk32#298[__this := 0];
	_symbol#319 := _symbol#319[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#333 := _decimals#333[__this := 0];
	payedOut_unchk45#386 := payedOut_unchk45#386[__this := false];
	payedOut_unchk8#578 := payedOut_unchk8#578[__this := false];
	winner_unchk8#580 := winner_unchk8#580[__this := 0];
	winAmount_unchk8#582 := winAmount_unchk8#582[__this := 0];
	payedOut_unchk44#744 := payedOut_unchk44#744[__this := false];
	winner_unchk44#746 := winner_unchk44#746[__this := 0];
	winAmount_unchk44#748 := winAmount_unchk44#748[__this := 0];
	payedOut_unchk33#870 := payedOut_unchk33#870[__this := false];
	// Function body starts here
	_name#291 := _name#291[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67][4 := 32][5 := 84][6 := 111][7 := 107][8 := 101][9 := 110], 10)];
	_symbol#319 := _symbol#319[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67], 4)];
	_decimals#333 := _decimals#333[__this := 18];
	_totalSupply#263 := _totalSupply#263[__this := 260000000000000000000000000];
	_balances#222 := _balances#222[__this := _balances#222[__this][address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3 := _totalSupply#263[__this]]];
	$return11:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_26.sol", 108, 1} {:message "UBBCToken::cash_unchk46"} cash_unchk46#383(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#361: int, subpotIndex#363: int, winner_unchk46#365: address_t)
{
	var {:sourceloc "buggy_26.sol", 109, 9} {:message "subpot_unchk46"} subpot_unchk46#369: int;
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#369 := 3000000000000000000;
	call_arg#20 := subpot_unchk46#369;
	assume {:sourceloc "buggy_26.sol", 110, 9} {:message ""} true;
	call __send_ret#21 := __send(winner_unchk46#365, __this, 0, call_arg#20);
	subpot_unchk46#369 := 0;
	$return12:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_26.sol", 113, 3} {:message "payedOut_unchk45"} payedOut_unchk45#386: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_26.sol", 115, 1} {:message "UBBCToken::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#407(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#386[__this];
	assume {:sourceloc "buggy_26.sol", 117, 5} {:message ""} true;
	call __send_ret#22 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return13:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_26.sol", 119, 5} {:message "UBBCToken::callnotchecked_unchk13"} callnotchecked_unchk13#423(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#409: address_t)
{
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_26.sol", 120, 9} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(callee#409, __this, 1000000000000000000);
	if (__call_ret#23) {
	havoc _balances#222;
	havoc _allowances#249;
	havoc _totalSupply#263;
	havoc payedOut_unchk20#266;
	havoc winner_unchk20#268;
	havoc winAmount_unchk20#270;
	havoc _name#291;
	havoc payedOut_unchk32#294;
	havoc winner_unchk32#296;
	havoc winAmount_unchk32#298;
	havoc _symbol#319;
	havoc _decimals#333;
	havoc payedOut_unchk45#386;
	havoc payedOut_unchk8#578;
	havoc winner_unchk8#580;
	havoc winAmount_unchk8#582;
	havoc payedOut_unchk44#744;
	havoc winner_unchk44#746;
	havoc winAmount_unchk44#748;
	havoc payedOut_unchk33#870;
	havoc __balance;
	}

	if (!(__call_ret#23)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return14:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 123, 5} {:message "UBBCToken::name"} name#431(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#426: int_arr_ptr)
{
	var new_array#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#426 := new_array#25;
	mem_arr_int := mem_arr_int[#426 := _name#291[__this]];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_26.sol", 126, 1} {:message "UBBCToken::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#446(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 127, 4} {:message "addr_unchk4"} addr_unchk4#435: address_t;
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#435 := 0;
	call_arg#26 := 42000000000000000000;
	assume {:sourceloc "buggy_26.sol", 128, 10} {:message ""} true;
	call __send_ret#27 := __send(addr_unchk4#435, __this, 0, call_arg#26);
	if (!(__send_ret#27)) {
	
	}
	else {
	
	}

	$return16:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 136, 5} {:message "UBBCToken::symbol"} symbol#454(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#449: int_arr_ptr)
{
	var new_array#28: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#28 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#449 := new_array#28;
	mem_arr_int := mem_arr_int[#449 := _symbol#319[__this]];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_26.sol", 139, 1} {:message "UBBCToken::bug_unchk7"} bug_unchk7#475(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 140, 1} {:message "addr_unchk7"} addr_unchk7#458: address_t;
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#458 := 0;
	call_arg#29 := 10000000000000000000;
	assume {:sourceloc "buggy_26.sol", 141, 6} {:message ""} true;
	call __send_ret#30 := __send(addr_unchk7#458, __this, 0, call_arg#29);
	if ((!(__send_ret#30) || (1 == 1))) {
	assume false;
	}

	$return18:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_26.sol", 144, 5} {:message "UBBCToken::decimals"} decimals#483(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#478: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#478 := _decimals#333[__this];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 147, 1} {:message "UBBCToken::my_func_unchk23"} my_func_unchk23#496(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#485: address_t)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 148, 9} {:message ""} true;
	call __send_ret#31 := __send(dst#485, __this, 0, __msg_value);
	$return20:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 151, 5} {:message "UBBCToken::totalSupply"} totalSupply#505(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#500: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#500 := _totalSupply#263[__this];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 154, 1} {:message "UBBCToken::unhandledsend_unchk14"} unhandledsend_unchk14#517(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#507: address_t)
{
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#32 := 5000000000000000000;
	assume {:sourceloc "buggy_26.sol", 155, 5} {:message ""} true;
	call __send_ret#33 := __send(callee#507, __this, 0, call_arg#32);
	$return22:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 158, 5} {:message "UBBCToken::balanceOf"} balanceOf#530(__this: address_t, __msg_sender: address_t, __msg_value: int, account#519: address_t)
	returns (#523: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#523 := _balances#222[__this][account#519];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_26.sol", 161, 1} {:message "UBBCToken::bug_unchk30"} bug_unchk30#555(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 162, 1} {:message "receivers_unchk30"} receivers_unchk30#534: int;
	var {:sourceloc "buggy_26.sol", 163, 1} {:message "addr_unchk30"} addr_unchk30#537: address_t;
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#534 := 0;
	addr_unchk30#537 := 0;
	call_arg#34 := 42000000000000000000;
	assume {:sourceloc "buggy_26.sol", 164, 6} {:message ""} true;
	call __send_ret#35 := __send(addr_unchk30#537, __this, 0, call_arg#34);
	if (!(__send_ret#35)) {
	receivers_unchk30#534 := (receivers_unchk30#534 + 1);
	}
	else {
	assume false;
	}

	$return24:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 170, 6} {:message "UBBCToken::transfer"} transfer#575(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#557: address_t, amount#559: int)
	returns (#563: bool)
{
	var call_arg#36: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#36 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 171, 10} {:message ""} true;
	call _transfer#867(__this, __msg_sender, __msg_value, call_arg#36, recipient#557, amount#559);
	#563 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_26.sol", 174, 1} {:message "payedOut_unchk8"} payedOut_unchk8#578: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_26.sol", 175, 1} {:message "winner_unchk8"} winner_unchk8#580: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_26.sol", 176, 1} {:message "winAmount_unchk8"} winAmount_unchk8#582: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_26.sol", 178, 1} {:message "UBBCToken::sendToWinner_unchk8"} sendToWinner_unchk8#601(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#578[__this]);
	assume {:sourceloc "buggy_26.sol", 180, 9} {:message ""} true;
	call __send_ret#37 := __send(winner_unchk8#580[__this], __this, 0, winAmount_unchk8#582[__this]);
	payedOut_unchk8#578 := payedOut_unchk8#578[__this := true];
	$return26:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 184, 5} {:message "UBBCToken::allowance"} allowance#618(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#603: address_t, spender#605: address_t)
	returns (#609: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#609 := _allowances#249[__this][owner#603][spender#605];
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 187, 1} {:message "UBBCToken::bug_unchk39"} bug_unchk39#630(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#620: address_t)
{
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#38 := 4000000000000000000;
	assume {:sourceloc "buggy_26.sol", 188, 8} {:message ""} true;
	call __send_ret#39 := __send(addr#620, __this, 0, call_arg#38);
	$return28:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 190, 5} {:message "UBBCToken::approve"} approve#650(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#632: address_t, value#634: int)
	returns (#638: bool)
{
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 191, 9} {:message ""} true;
	call _approve#935(__this, __msg_sender, __msg_value, call_arg#40, spender#632, value#634);
	#638 := true;
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 194, 1} {:message "UBBCToken::my_func_uncheck36"} my_func_uncheck36#665(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#652: address_t)
{
	var __call_ret#41: bool;
	var __call_ret#42: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_26.sol", 195, 5} {:message ""} true;
	call __call_ret#41, __call_ret#42 := __call(dst#652, __this, __msg_value);
	if (__call_ret#41) {
	havoc _balances#222;
	havoc _allowances#249;
	havoc _totalSupply#263;
	havoc payedOut_unchk20#266;
	havoc winner_unchk20#268;
	havoc winAmount_unchk20#270;
	havoc _name#291;
	havoc payedOut_unchk32#294;
	havoc winner_unchk32#296;
	havoc winAmount_unchk32#298;
	havoc _symbol#319;
	havoc _decimals#333;
	havoc payedOut_unchk45#386;
	havoc payedOut_unchk8#578;
	havoc winner_unchk8#580;
	havoc winAmount_unchk8#582;
	havoc payedOut_unchk44#744;
	havoc winner_unchk44#746;
	havoc winAmount_unchk44#748;
	havoc payedOut_unchk33#870;
	havoc __balance;
	}

	if (!(__call_ret#41)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return30:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 198, 5} {:message "UBBCToken::transferFrom"} transferFrom#701(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#667: address_t, recipient#669: address_t, amount#671: int)
	returns (#675: bool)
{
	var call_arg#43: address_t;
	var sub#51_ret#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 199, 9} {:message ""} true;
	call _transfer#867(__this, __msg_sender, __msg_value, sender#667, recipient#669, amount#671);
	call_arg#43 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 200, 38} {:message ""} true;
	call sub#51_ret#44 := sub#51(__this, __msg_sender, __msg_value, _allowances#249[__this][sender#667][__msg_sender], amount#671);
	assume {:sourceloc "buggy_26.sol", 200, 9} {:message ""} true;
	call _approve#935(__this, __msg_sender, __msg_value, sender#667, call_arg#43, sub#51_ret#44);
	#675 := true;
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 203, 1} {:message "UBBCToken::my_func_unchk35"} my_func_unchk35#714(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#703: address_t)
{
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 204, 9} {:message ""} true;
	call __send_ret#45 := __send(dst#703, __this, 0, __msg_value);
	$return32:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 207, 5} {:message "UBBCToken::increaseAllowance"} increaseAllowance#741(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#716: address_t, addedValue#718: int)
	returns (#721: bool)
{
	var call_arg#46: address_t;
	var add#26_ret#47: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#46 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 208, 39} {:message ""} true;
	call add#26_ret#47 := add#26(__this, __msg_sender, __msg_value, _allowances#249[__this][__msg_sender][spender#716], addedValue#718);
	assume {:sourceloc "buggy_26.sol", 208, 9} {:message ""} true;
	call _approve#935(__this, __msg_sender, __msg_value, call_arg#46, spender#716, add#26_ret#47);
	#721 := true;
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_26.sol", 211, 1} {:message "payedOut_unchk44"} payedOut_unchk44#744: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_26.sol", 212, 1} {:message "winner_unchk44"} winner_unchk44#746: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_26.sol", 213, 1} {:message "winAmount_unchk44"} winAmount_unchk44#748: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_26.sol", 215, 1} {:message "UBBCToken::sendToWinner_unchk44"} sendToWinner_unchk44#767(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#744[__this]);
	assume {:sourceloc "buggy_26.sol", 217, 9} {:message ""} true;
	call __send_ret#48 := __send(winner_unchk44#746[__this], __this, 0, winAmount_unchk44#748[__this]);
	payedOut_unchk44#744 := payedOut_unchk44#744[__this := true];
	$return34:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 221, 5} {:message "UBBCToken::decreaseAllowance"} decreaseAllowance#794(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#769: address_t, subtractedValue#771: int)
	returns (#774: bool)
{
	var call_arg#49: address_t;
	var sub#51_ret#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#49 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 222, 39} {:message ""} true;
	call sub#51_ret#50 := sub#51(__this, __msg_sender, __msg_value, _allowances#249[__this][__msg_sender][spender#769], subtractedValue#771);
	assume {:sourceloc "buggy_26.sol", 222, 9} {:message ""} true;
	call _approve#935(__this, __msg_sender, __msg_value, call_arg#49, spender#769, sub#51_ret#50);
	#774 := true;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_26.sol", 225, 1} {:message "UBBCToken::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#809(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 226, 4} {:message "addr_unchk40"} addr_unchk40#798: address_t;
	var call_arg#51: int;
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#798 := 0;
	call_arg#51 := 2000000000000000000;
	assume {:sourceloc "buggy_26.sol", 227, 10} {:message ""} true;
	call __send_ret#52 := __send(addr_unchk40#798, __this, 0, call_arg#51);
	if (!(__send_ret#52)) {
	
	}
	else {
	
	}

	$return36:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 235, 5} {:message "UBBCToken::_transfer"} _transfer#867(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#811: address_t, recipient#813: address_t, amount#815: int)
{
	var call_arg#53: int_arr_ptr;
	var new_array#54: int_arr_ptr;
	var call_arg#55: int_arr_ptr;
	var new_array#56: int_arr_ptr;
	var sub#51_ret#57: int;
	var add#26_ret#58: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#54 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#53 := new_array#54;
	mem_arr_int := mem_arr_int[call_arg#53 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#811 != 0);
	new_array#56 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#55 := new_array#56;
	mem_arr_int := mem_arr_int[call_arg#55 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#813 != 0);
	assume {:sourceloc "buggy_26.sol", 239, 29} {:message ""} true;
	call sub#51_ret#57 := sub#51(__this, __msg_sender, __msg_value, _balances#222[__this][sender#811], amount#815);
	_balances#222 := _balances#222[__this := _balances#222[__this][sender#811 := sub#51_ret#57]];
	assume {:sourceloc "buggy_26.sol", 240, 32} {:message ""} true;
	call add#26_ret#58 := add#26(__this, __msg_sender, __msg_value, _balances#222[__this][recipient#813], amount#815);
	_balances#222 := _balances#222[__this := _balances#222[__this][recipient#813 := add#26_ret#58]];
	assume {:sourceloc "buggy_26.sol", 241, 14} {:message ""} true;
	call Transfer#190(__this, __msg_sender, __msg_value, sender#811, recipient#813, amount#815);
	$return37:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_26.sol", 243, 1} {:message "payedOut_unchk33"} payedOut_unchk33#870: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_26.sol", 245, 1} {:message "UBBCToken::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#891(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#59: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#870[__this];
	assume {:sourceloc "buggy_26.sol", 247, 5} {:message ""} true;
	call __send_ret#59 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return38:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 250, 5} {:message "UBBCToken::_approve"} _approve#935(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#893: address_t, spender#895: address_t, value#897: int)
{
	var call_arg#60: int_arr_ptr;
	var new_array#61: int_arr_ptr;
	var call_arg#62: int_arr_ptr;
	var new_array#63: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#61 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#60 := new_array#61;
	mem_arr_int := mem_arr_int[call_arg#60 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#893 != 0);
	new_array#63 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#62 := new_array#63;
	mem_arr_int := mem_arr_int[call_arg#62 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#895 != 0);
	_allowances#249 := _allowances#249[__this := _allowances#249[__this][owner#893 := _allowances#249[__this][owner#893][spender#895 := value#897]]];
	assume {:sourceloc "buggy_26.sol", 254, 14} {:message ""} true;
	call Approval#198(__this, __msg_sender, __msg_value, owner#893, spender#895, value#897);
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_26.sol", 256, 1} {:message "UBBCToken::bug_unchk27"} bug_unchk27#947(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#937: address_t)
{
	var call_arg#64: int;
	var __send_ret#65: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#64 := 42000000000000000000;
	assume {:sourceloc "buggy_26.sol", 257, 8} {:message ""} true;
	call __send_ret#65 := __send(addr#937, __this, 0, call_arg#64);
	$return40:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 258, 5} {:message "UBBCToken::[receive]"} #954(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_26.sol", 261, 1} {:message "UBBCToken::bug_unchk31"} bug_unchk31#975(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 262, 1} {:message "addr_unchk31"} addr_unchk31#958: address_t;
	var call_arg#66: int;
	var __send_ret#67: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#958 := 0;
	call_arg#66 := 10000000000000000000;
	assume {:sourceloc "buggy_26.sol", 263, 6} {:message ""} true;
	call __send_ret#67 := __send(addr_unchk31#958, __this, 0, call_arg#66);
	if ((!(__send_ret#67) || (1 == 1))) {
	assume false;
	}

	$return42:
	// Function body ends here
}

