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
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_26.sol", 63, 3} {:message "UBBCToken::bug_unchk_send10"} bug_unchk_send10#217(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 64, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 65, 3} {:message "_balances"} _balances#221: [address_t][address_t]int;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_26.sol", 66, 3} {:message "UBBCToken::bug_unchk_send22"} bug_unchk_send22#234(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 67, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_26.sol", 68, 3} {:message "_allowances"} _allowances#240: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_26.sol", 69, 3} {:message "UBBCToken::bug_unchk_send12"} bug_unchk_send12#253(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 70, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_26.sol", 71, 3} {:message "_totalSupply"} _totalSupply#255: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_26.sol", 72, 3} {:message "UBBCToken::bug_unchk_send11"} bug_unchk_send11#268(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 73, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return8:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_26.sol", 74, 3} {:message "_name"} _name#270: [address_t]int_arr_type;
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_26.sol", 75, 3} {:message "UBBCToken::bug_unchk_send1"} bug_unchk_send1#283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 76, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return9:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_26.sol", 77, 3} {:message "_symbol"} _symbol#285: [address_t]int_arr_type;
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_26.sol", 78, 3} {:message "UBBCToken::bug_unchk_send2"} bug_unchk_send2#298(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 79, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return10:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_26.sol", 80, 3} {:message "_decimals"} _decimals#300: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 81, 5} {:message "UBBCToken::[constructor]"} __constructor#850(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#221 := _balances#221[__this := default_address_t_int()];
	_allowances#240 := _allowances#240[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#255 := _totalSupply#255[__this := 0];
	_name#270 := _name#270[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#285 := _symbol#285[__this := int_arr#constr(default_int_int(), 0)];
	_decimals#300 := _decimals#300[__this := 0];
	// Function body starts here
	_name#270 := _name#270[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67][4 := 32][5 := 84][6 := 111][7 := 107][8 := 101][9 := 110], 10)];
	_symbol#285 := _symbol#285[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67], 4)];
	_decimals#300 := _decimals#300[__this := 18];
	_totalSupply#255 := _totalSupply#255[__this := 260000000000000000000000000];
	_balances#221 := _balances#221[__this := _balances#221[__this][address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3 := _totalSupply#255[__this]]];
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_26.sol", 88, 1} {:message "UBBCToken::bug_unchk_send17"} bug_unchk_send17#339(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 89, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_26.sol", 90, 3} {:message "UBBCToken::bug_unchk_send31"} bug_unchk_send31#352(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 91, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_26.sol", 94, 5} {:message "UBBCToken::bug_unchk_send13"} bug_unchk_send13#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 95, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return14:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 98, 9} {:message "UBBCToken::name"} name#373(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#368: int_arr_ptr)
{
	var new_array#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#19 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#368 := new_array#19;
	mem_arr_int := mem_arr_int[#368 := _name#270[__this]];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_26.sol", 101, 1} {:message "UBBCToken::bug_unchk_send3"} bug_unchk_send3#386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 102, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return16:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 104, 5} {:message "UBBCToken::symbol"} symbol#394(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#389: int_arr_ptr)
{
	var new_array#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#21 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#389 := new_array#21;
	mem_arr_int := mem_arr_int[#389 := _symbol#285[__this]];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_26.sol", 107, 1} {:message "UBBCToken::bug_unchk_send9"} bug_unchk_send9#407(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 108, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return18:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_26.sol", 109, 5} {:message "UBBCToken::decimals"} decimals#415(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#410: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#410 := _decimals#300[__this];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_26.sol", 112, 1} {:message "UBBCToken::bug_unchk_send25"} bug_unchk_send25#428(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 113, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return20:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 115, 5} {:message "UBBCToken::totalSupply"} totalSupply#437(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#432: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#432 := _totalSupply#255[__this];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_26.sol", 118, 1} {:message "UBBCToken::bug_unchk_send19"} bug_unchk_send19#450(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 119, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return22:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 121, 5} {:message "UBBCToken::balanceOf"} balanceOf#463(__this: address_t, __msg_sender: address_t, __msg_value: int, account#452: address_t)
	returns (#456: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#456 := _balances#221[__this][account#452];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_26.sol", 124, 1} {:message "UBBCToken::bug_unchk_send26"} bug_unchk_send26#476(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 125, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return24:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 127, 5} {:message "UBBCToken::transfer"} transfer#496(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#478: address_t, amount#480: int)
	returns (#484: bool)
{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 128, 10} {:message ""} true;
	call _transfer#759(__this, __msg_sender, __msg_value, call_arg#26, recipient#478, amount#480);
	#484 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_26.sol", 131, 1} {:message "UBBCToken::bug_unchk_send20"} bug_unchk_send20#509(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 132, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return26:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 134, 5} {:message "UBBCToken::allowance"} allowance#526(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#511: address_t, spender#513: address_t)
	returns (#517: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#517 := _allowances#240[__this][owner#511][spender#513];
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_26.sol", 137, 1} {:message "UBBCToken::bug_unchk_send32"} bug_unchk_send32#539(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 138, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return28:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 140, 5} {:message "UBBCToken::approve"} approve#559(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#541: address_t, value#543: int)
	returns (#547: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 141, 9} {:message ""} true;
	call _approve#816(__this, __msg_sender, __msg_value, call_arg#29, spender#541, value#543);
	#547 := true;
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_26.sol", 144, 1} {:message "UBBCToken::bug_unchk_send4"} bug_unchk_send4#572(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 145, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#30);
	$return30:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 147, 5} {:message "UBBCToken::transferFrom"} transferFrom#608(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#574: address_t, recipient#576: address_t, amount#578: int)
	returns (#582: bool)
{
	var call_arg#31: address_t;
	var sub#51_ret#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 148, 9} {:message ""} true;
	call _transfer#759(__this, __msg_sender, __msg_value, sender#574, recipient#576, amount#578);
	call_arg#31 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 149, 38} {:message ""} true;
	call sub#51_ret#32 := sub#51(__this, __msg_sender, __msg_value, _allowances#240[__this][sender#574][__msg_sender], amount#578);
	assume {:sourceloc "buggy_26.sol", 149, 9} {:message ""} true;
	call _approve#816(__this, __msg_sender, __msg_value, sender#574, call_arg#31, sub#51_ret#32);
	#582 := true;
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_26.sol", 152, 1} {:message "UBBCToken::bug_unchk_send7"} bug_unchk_send7#621(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#33 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 153, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#33);
	$return32:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 155, 5} {:message "UBBCToken::increaseAllowance"} increaseAllowance#648(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#623: address_t, addedValue#625: int)
	returns (#628: bool)
{
	var call_arg#34: address_t;
	var add#26_ret#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#34 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 156, 39} {:message ""} true;
	call add#26_ret#35 := add#26(__this, __msg_sender, __msg_value, _allowances#240[__this][__msg_sender][spender#623], addedValue#625);
	assume {:sourceloc "buggy_26.sol", 156, 9} {:message ""} true;
	call _approve#816(__this, __msg_sender, __msg_value, call_arg#34, spender#623, add#26_ret#35);
	#628 := true;
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_26.sol", 159, 1} {:message "UBBCToken::bug_unchk_send23"} bug_unchk_send23#661(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#36 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 160, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#36);
	$return34:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 162, 5} {:message "UBBCToken::decreaseAllowance"} decreaseAllowance#688(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#663: address_t, subtractedValue#665: int)
	returns (#668: bool)
{
	var call_arg#37: address_t;
	var sub#51_ret#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#37 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 163, 39} {:message ""} true;
	call sub#51_ret#38 := sub#51(__this, __msg_sender, __msg_value, _allowances#240[__this][__msg_sender][spender#663], subtractedValue#665);
	assume {:sourceloc "buggy_26.sol", 163, 9} {:message ""} true;
	call _approve#816(__this, __msg_sender, __msg_value, call_arg#37, spender#663, sub#51_ret#38);
	#668 := true;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_26.sol", 166, 1} {:message "UBBCToken::bug_unchk_send14"} bug_unchk_send14#701(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 167, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return36:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 169, 5} {:message "UBBCToken::_transfer"} _transfer#759(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#703: address_t, recipient#705: address_t, amount#707: int)
{
	var call_arg#40: int_arr_ptr;
	var new_array#41: int_arr_ptr;
	var call_arg#42: int_arr_ptr;
	var new_array#43: int_arr_ptr;
	var sub#51_ret#44: int;
	var add#26_ret#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#41 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#40 := new_array#41;
	mem_arr_int := mem_arr_int[call_arg#40 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#703 != 0);
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#42 := new_array#43;
	mem_arr_int := mem_arr_int[call_arg#42 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#705 != 0);
	assume {:sourceloc "buggy_26.sol", 173, 29} {:message ""} true;
	call sub#51_ret#44 := sub#51(__this, __msg_sender, __msg_value, _balances#221[__this][sender#703], amount#707);
	_balances#221 := _balances#221[__this := _balances#221[__this][sender#703 := sub#51_ret#44]];
	assume {:sourceloc "buggy_26.sol", 174, 32} {:message ""} true;
	call add#26_ret#45 := add#26(__this, __msg_sender, __msg_value, _balances#221[__this][recipient#705], amount#707);
	_balances#221 := _balances#221[__this := _balances#221[__this][recipient#705 := add#26_ret#45]];
	assume {:sourceloc "buggy_26.sol", 175, 14} {:message ""} true;
	call Transfer#190(__this, __msg_sender, __msg_value, sender#703, recipient#705, amount#707);
	$return37:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_26.sol", 177, 1} {:message "UBBCToken::bug_unchk_send30"} bug_unchk_send30#772(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 178, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#46);
	$return38:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 180, 5} {:message "UBBCToken::_approve"} _approve#816(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#774: address_t, spender#776: address_t, value#778: int)
{
	var call_arg#47: int_arr_ptr;
	var new_array#48: int_arr_ptr;
	var call_arg#49: int_arr_ptr;
	var new_array#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#48 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#47 := new_array#48;
	mem_arr_int := mem_arr_int[call_arg#47 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#774 != 0);
	new_array#50 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#49 := new_array#50;
	mem_arr_int := mem_arr_int[call_arg#49 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#776 != 0);
	_allowances#240 := _allowances#240[__this := _allowances#240[__this][owner#774 := _allowances#240[__this][owner#774][spender#776 := value#778]]];
	assume {:sourceloc "buggy_26.sol", 184, 14} {:message ""} true;
	call Approval#198(__this, __msg_sender, __msg_value, owner#774, spender#776, value#778);
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_26.sol", 186, 1} {:message "UBBCToken::bug_unchk_send8"} bug_unchk_send8#829(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#51 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 187, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#51);
	$return40:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 188, 5} {:message "UBBCToken::[fallback]"} #836(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_26.sol", 191, 1} {:message "UBBCToken::bug_unchk_send27"} bug_unchk_send27#849(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#52: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#52 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 192, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#52);
	$return42:
	// Function body ends here
}

