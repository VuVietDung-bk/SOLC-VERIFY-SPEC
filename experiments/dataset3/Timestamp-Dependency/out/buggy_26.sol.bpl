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
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_26.sol", 63, 3} {:message "winner_tmstmp26"} winner_tmstmp26#206: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 64, 1} {:message "UBBCToken::play_tmstmp26"} play_tmstmp26#228(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#208: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#208 + 432000) == __block_timestamp)) {
	winner_tmstmp26#206 := winner_tmstmp26#206[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 67, 3} {:message "_balances"} _balances#232: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_26.sol", 68, 3} {:message "UBBCToken::bug_tmstmp20"} bug_tmstmp20#279(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 69, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#236: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#236 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#236);
	pastBlockTime_tmstmp20#236 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_26.sol", 74, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_26.sol", 77, 3} {:message "_allowances"} _allowances#285: [address_t][address_t][address_t]int;
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_26.sol", 78, 3} {:message "UBBCToken::bug_tmstmp32"} bug_tmstmp32#332(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 79, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#289: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#289 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#289);
	pastBlockTime_tmstmp32#289 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_26.sol", 84, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_26.sol", 87, 3} {:message "_totalSupply"} _totalSupply#334: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_26.sol", 88, 3} {:message "winner_tmstmp38"} winner_tmstmp38#336: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 89, 1} {:message "UBBCToken::play_tmstmp38"} play_tmstmp38#358(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#338: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#338 + 432000) == __block_timestamp)) {
	winner_tmstmp38#336 := winner_tmstmp38#336[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_26.sol", 92, 3} {:message "_name"} _name#360: [address_t]int_arr_type;
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_26.sol", 93, 3} {:message "UBBCToken::bug_tmstmp4"} bug_tmstmp4#407(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 94, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#364: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#364 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#364);
	pastBlockTime_tmstmp4#364 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_26.sol", 99, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_26.sol", 102, 3} {:message "_symbol"} _symbol#409: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_26.sol", 103, 3} {:message "winner_tmstmp7"} winner_tmstmp7#411: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 104, 1} {:message "UBBCToken::play_tmstmp7"} play_tmstmp7#437(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#413: int)
{
	var {:sourceloc "buggy_26.sol", 105, 2} {:message "_vtime"} _vtime#417: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#417 := __block_timestamp;
	if (((startTime#413 + 432000) == _vtime#417)) {
	winner_tmstmp7#411 := winner_tmstmp7#411[__this := __msg_sender];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_26.sol", 108, 3} {:message "_decimals"} _decimals#439: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 109, 5} {:message "UBBCToken::[constructor]"} __constructor#1139(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp26#206 := winner_tmstmp26#206[__this := 0];
	_balances#232 := _balances#232[__this := default_address_t_int()];
	_allowances#285 := _allowances#285[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#334 := _totalSupply#334[__this := 0];
	winner_tmstmp38#336 := winner_tmstmp38#336[__this := 0];
	_name#360 := _name#360[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#409 := _symbol#409[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp7#411 := winner_tmstmp7#411[__this := 0];
	_decimals#439 := _decimals#439[__this := 0];
	winner_tmstmp23#467 := winner_tmstmp23#467[__this := 0];
	bugv_tmstmp3#497 := bugv_tmstmp3#497[__this := __block_timestamp];
	bugv_tmstmp4#501 := bugv_tmstmp4#501[__this := __block_timestamp];
	winner_tmstmp14#511 := winner_tmstmp14#511[__this := 0];
	winner_tmstmp30#543 := winner_tmstmp30#543[__this := 0];
	winner_tmstmp39#631 := winner_tmstmp39#631[__this := 0];
	winner_tmstmp35#739 := winner_tmstmp35#739[__this := 0];
	winner_tmstmp27#898 := winner_tmstmp27#898[__this := 0];
	winner_tmstmp31#953 := winner_tmstmp31#953[__this := 0];
	bugv_tmstmp5#1079 := bugv_tmstmp5#1079[__this := __block_timestamp];
	bugv_tmstmp1#1127 := bugv_tmstmp1#1127[__this := __block_timestamp];
	bugv_tmstmp2#1138 := bugv_tmstmp2#1138[__this := __block_timestamp];
	// Function body starts here
	_name#360 := _name#360[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67][4 := 32][5 := 84][6 := 111][7 := 107][8 := 101][9 := 110], 10)];
	_symbol#409 := _symbol#409[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67], 4)];
	_decimals#439 := _decimals#439[__this := 18];
	_totalSupply#334 := _totalSupply#334[__this := 260000000000000000000000000];
	_balances#232 := _balances#232[__this := _balances#232[__this][address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3 := _totalSupply#334[__this]]];
	$return11:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_26.sol", 116, 1} {:message "winner_tmstmp23"} winner_tmstmp23#467: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 117, 1} {:message "UBBCToken::play_tmstmp23"} play_tmstmp23#493(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#469: int)
{
	var {:sourceloc "buggy_26.sol", 118, 2} {:message "_vtime"} _vtime#473: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#473 := __block_timestamp;
	if (((startTime#469 + 432000) == _vtime#473)) {
	winner_tmstmp23#467 := winner_tmstmp23#467[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_26.sol", 121, 5} {:message "bugv_tmstmp3"} bugv_tmstmp3#497: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_26.sol", 123, 5} {:message "bugv_tmstmp4"} bugv_tmstmp4#501: [address_t]int;
// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 125, 5} {:message "UBBCToken::name"} name#509(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#504: int_arr_ptr)
{
	var new_array#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#10 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#504 := new_array#10;
	mem_arr_int := mem_arr_int[#504 := _name#360[__this]];
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_26.sol", 128, 1} {:message "winner_tmstmp14"} winner_tmstmp14#511: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 129, 1} {:message "UBBCToken::play_tmstmp14"} play_tmstmp14#533(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#513: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#513 + 432000) == __block_timestamp)) {
	winner_tmstmp14#511 := winner_tmstmp14#511[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 133, 5} {:message "UBBCToken::symbol"} symbol#541(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#536: int_arr_ptr)
{
	var new_array#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#536 := new_array#11;
	mem_arr_int := mem_arr_int[#536 := _symbol#409[__this]];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_26.sol", 136, 1} {:message "winner_tmstmp30"} winner_tmstmp30#543: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 137, 1} {:message "UBBCToken::play_tmstmp30"} play_tmstmp30#565(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#545: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#545 + 432000) == __block_timestamp)) {
	winner_tmstmp30#543 := winner_tmstmp30#543[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_26.sol", 140, 5} {:message "UBBCToken::decimals"} decimals#573(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#568: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#568 := _decimals#439[__this];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_26.sol", 143, 1} {:message "UBBCToken::bug_tmstmp8"} bug_tmstmp8#620(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 144, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#577: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#577 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#577);
	pastBlockTime_tmstmp8#577 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_26.sol", 149, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return18:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 153, 5} {:message "UBBCToken::totalSupply"} totalSupply#629(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#624: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#624 := _totalSupply#334[__this];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_26.sol", 156, 1} {:message "winner_tmstmp39"} winner_tmstmp39#631: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 157, 1} {:message "UBBCToken::play_tmstmp39"} play_tmstmp39#657(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#633: int)
{
	var {:sourceloc "buggy_26.sol", 158, 2} {:message "_vtime"} _vtime#637: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#637 := __block_timestamp;
	if (((startTime#633 + 432000) == _vtime#637)) {
	winner_tmstmp39#631 := winner_tmstmp39#631[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 162, 5} {:message "UBBCToken::balanceOf"} balanceOf#670(__this: address_t, __msg_sender: address_t, __msg_value: int, account#659: address_t)
	returns (#663: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#663 := _balances#232[__this][account#659];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_26.sol", 165, 1} {:message "UBBCToken::bug_tmstmp36"} bug_tmstmp36#717(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 166, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#674: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#674 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#674);
	pastBlockTime_tmstmp36#674 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_26.sol", 171, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return22:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 175, 6} {:message "UBBCToken::transfer"} transfer#737(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#719: address_t, amount#721: int)
	returns (#725: bool)
{
	var call_arg#12: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 176, 10} {:message ""} true;
	call _transfer#1075(__this, __msg_sender, __msg_value, call_arg#12, recipient#719, amount#721);
	#725 := true;
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_26.sol", 179, 1} {:message "winner_tmstmp35"} winner_tmstmp35#739: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 180, 1} {:message "UBBCToken::play_tmstmp35"} play_tmstmp35#765(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#741: int)
{
	var {:sourceloc "buggy_26.sol", 181, 2} {:message "_vtime"} _vtime#745: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#745 := __block_timestamp;
	if (((startTime#741 + 432000) == _vtime#745)) {
	winner_tmstmp35#739 := winner_tmstmp35#739[__this := __msg_sender];
	}

	$return24:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 185, 5} {:message "UBBCToken::allowance"} allowance#782(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#767: address_t, spender#769: address_t)
	returns (#773: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#773 := _allowances#285[__this][owner#767][spender#769];
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_26.sol", 188, 1} {:message "UBBCToken::bug_tmstmp40"} bug_tmstmp40#829(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 189, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#786: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#786 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#786);
	pastBlockTime_tmstmp40#786 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_26.sol", 194, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return26:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 198, 5} {:message "UBBCToken::approve"} approve#849(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#831: address_t, value#833: int)
	returns (#837: bool)
{
	var call_arg#13: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#13 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 199, 9} {:message ""} true;
	call _approve#1123(__this, __msg_sender, __msg_value, call_arg#13, spender#831, value#833);
	#837 := true;
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_26.sol", 202, 1} {:message "UBBCToken::bug_tmstmp33"} bug_tmstmp33#860(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#852: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#852 := (__block_timestamp >= 1546300800);
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 206, 5} {:message "UBBCToken::transferFrom"} transferFrom#896(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#862: address_t, recipient#864: address_t, amount#866: int)
	returns (#870: bool)
{
	var call_arg#14: address_t;
	var sub#51_ret#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 207, 9} {:message ""} true;
	call _transfer#1075(__this, __msg_sender, __msg_value, sender#862, recipient#864, amount#866);
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 208, 38} {:message ""} true;
	call sub#51_ret#15 := sub#51(__this, __msg_sender, __msg_value, _allowances#285[__this][sender#862][__msg_sender], amount#866);
	assume {:sourceloc "buggy_26.sol", 208, 9} {:message ""} true;
	call _approve#1123(__this, __msg_sender, __msg_value, sender#862, call_arg#14, sub#51_ret#15);
	#870 := true;
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_26.sol", 211, 1} {:message "winner_tmstmp27"} winner_tmstmp27#898: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 212, 1} {:message "UBBCToken::play_tmstmp27"} play_tmstmp27#924(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#900: int)
{
	var {:sourceloc "buggy_26.sol", 213, 2} {:message "_vtime"} _vtime#904: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#904 := __block_timestamp;
	if (((startTime#900 + 432000) == _vtime#904)) {
	winner_tmstmp27#898 := winner_tmstmp27#898[__this := __msg_sender];
	}

	$return30:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 217, 5} {:message "UBBCToken::increaseAllowance"} increaseAllowance#951(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#926: address_t, addedValue#928: int)
	returns (#931: bool)
{
	var call_arg#16: address_t;
	var add#26_ret#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 218, 39} {:message ""} true;
	call add#26_ret#17 := add#26(__this, __msg_sender, __msg_value, _allowances#285[__this][__msg_sender][spender#926], addedValue#928);
	assume {:sourceloc "buggy_26.sol", 218, 9} {:message ""} true;
	call _approve#1123(__this, __msg_sender, __msg_value, call_arg#16, spender#926, add#26_ret#17);
	#931 := true;
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_26.sol", 221, 1} {:message "winner_tmstmp31"} winner_tmstmp31#953: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 222, 1} {:message "UBBCToken::play_tmstmp31"} play_tmstmp31#979(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#955: int)
{
	var {:sourceloc "buggy_26.sol", 223, 2} {:message "_vtime"} _vtime#959: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#959 := __block_timestamp;
	if (((startTime#955 + 432000) == _vtime#959)) {
	winner_tmstmp31#953 := winner_tmstmp31#953[__this := __msg_sender];
	}

	$return32:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 227, 5} {:message "UBBCToken::decreaseAllowance"} decreaseAllowance#1006(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#981: address_t, subtractedValue#983: int)
	returns (#986: bool)
{
	var call_arg#18: address_t;
	var sub#51_ret#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 228, 39} {:message ""} true;
	call sub#51_ret#19 := sub#51(__this, __msg_sender, __msg_value, _allowances#285[__this][__msg_sender][spender#981], subtractedValue#983);
	assume {:sourceloc "buggy_26.sol", 228, 9} {:message ""} true;
	call _approve#1123(__this, __msg_sender, __msg_value, call_arg#18, spender#981, sub#51_ret#19);
	#986 := true;
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_26.sol", 231, 1} {:message "UBBCToken::bug_tmstmp13"} bug_tmstmp13#1017(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1009: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1009 := (__block_timestamp >= 1546300800);
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 235, 5} {:message "UBBCToken::_transfer"} _transfer#1075(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#1019: address_t, recipient#1021: address_t, amount#1023: int)
{
	var call_arg#20: int_arr_ptr;
	var new_array#21: int_arr_ptr;
	var call_arg#22: int_arr_ptr;
	var new_array#23: int_arr_ptr;
	var sub#51_ret#24: int;
	var add#26_ret#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#21 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#20 := new_array#21;
	mem_arr_int := mem_arr_int[call_arg#20 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#1019 != 0);
	new_array#23 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#22 := new_array#23;
	mem_arr_int := mem_arr_int[call_arg#22 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#1021 != 0);
	assume {:sourceloc "buggy_26.sol", 239, 29} {:message ""} true;
	call sub#51_ret#24 := sub#51(__this, __msg_sender, __msg_value, _balances#232[__this][sender#1019], amount#1023);
	_balances#232 := _balances#232[__this := _balances#232[__this][sender#1019 := sub#51_ret#24]];
	assume {:sourceloc "buggy_26.sol", 240, 32} {:message ""} true;
	call add#26_ret#25 := add#26(__this, __msg_sender, __msg_value, _balances#232[__this][recipient#1021], amount#1023);
	_balances#232 := _balances#232[__this := _balances#232[__this][recipient#1021 := add#26_ret#25]];
	assume {:sourceloc "buggy_26.sol", 241, 14} {:message ""} true;
	call Transfer#190(__this, __msg_sender, __msg_value, sender#1019, recipient#1021, amount#1023);
	$return35:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_26.sol", 243, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1079: [address_t]int;
// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 245, 5} {:message "UBBCToken::_approve"} _approve#1123(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1081: address_t, spender#1083: address_t, value#1085: int)
{
	var call_arg#26: int_arr_ptr;
	var new_array#27: int_arr_ptr;
	var call_arg#28: int_arr_ptr;
	var new_array#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#27 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#26 := new_array#27;
	mem_arr_int := mem_arr_int[call_arg#26 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#1081 != 0);
	new_array#29 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#28 := new_array#29;
	mem_arr_int := mem_arr_int[call_arg#28 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#1083 != 0);
	_allowances#285 := _allowances#285[__this := _allowances#285[__this][owner#1081 := _allowances#285[__this][owner#1081][spender#1083 := value#1085]]];
	assume {:sourceloc "buggy_26.sol", 249, 14} {:message ""} true;
	call Approval#198(__this, __msg_sender, __msg_value, owner#1081, spender#1083, value#1085);
	$return36:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_26.sol", 251, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1127: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 252, 5} {:message "UBBCToken::[receive]"} #1134(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return37:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_26.sol", 255, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1138: [address_t]int;
