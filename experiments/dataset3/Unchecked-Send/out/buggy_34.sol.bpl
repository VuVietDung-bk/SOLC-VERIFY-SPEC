// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_34.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_34.sol", 13, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#22(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#18: address_t, _to#20: address_t)
{
	
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_34.sol", 9, 4} {:message "owner"} owner#3: [address_t]address_t;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_34.sol", 11, 2} {:message "Ownable::bug_unchk_send27"} bug_unchk_send27#16(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 12, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 15, 4} {:message "Ownable::[constructor]"} __constructor#84(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#3 := owner#3[__this := 0];
	// Function body starts here
	owner#3 := owner#3[__this := __msg_sender];
	$return1:
	// Function body ends here
}

// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_34.sol", 18, 1} {:message "Ownable::bug_unchk_send28"} bug_unchk_send28#47(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 19, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return2:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_34.sol", 26, 4} {:message "Ownable::transferOwnership"} transferOwnership#70(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#60: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#3[__this]);
	// Function body starts here
	owner#3 := owner#3[__this := _newOwner#60];
	$return4:
	// Function body ends here
	$return3:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_34.sol", 29, 1} {:message "Ownable::bug_unchk_send21"} bug_unchk_send21#83(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 30, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return5:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 44, 5} {:message "SafeMath::add"} add#110(__this: address_t, __msg_sender: address_t, __msg_value: int, a#87: int, b#89: int)
	returns (#92: int)
{
	var {:sourceloc "buggy_34.sol", 45, 9} {:message "c"} c#95: int;
	var call_arg#5: int_arr_ptr;
	var new_array#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#95 := (a#87 + b#89);
	new_array#6 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#5 := new_array#6;
	mem_arr_int := mem_arr_int[call_arg#5 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#95 >= a#87);
	#92 := c#95;
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 60, 5} {:message "SafeMath::sub"} sub#136(__this: address_t, __msg_sender: address_t, __msg_value: int, a#113: int, b#115: int)
	returns (#118: int)
{
	var call_arg#7: int_arr_ptr;
	var new_array#8: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 62, 9} {:message "c"} c#128: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#8 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#7 := new_array#8;
	mem_arr_int := mem_arr_int[call_arg#7 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#115 <= a#113);
	c#128 := (a#113 - b#115);
	#118 := c#128;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 76, 5} {:message "SafeMath::mul"} mul#171(__this: address_t, __msg_sender: address_t, __msg_value: int, a#139: int, b#141: int)
	returns (#144: int)
{
	var {:sourceloc "buggy_34.sol", 84, 9} {:message "c"} c#154: int;
	var call_arg#9: int_arr_ptr;
	var new_array#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#139 == 0)) {
	#144 := 0;
	goto $return8;
	}

	c#154 := (a#139 * b#141);
	new_array#10 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#9 := new_array#10;
	mem_arr_int := mem_arr_int[call_arg#9 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#154 div a#139) == b#141);
	#144 := c#154;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 101, 5} {:message "SafeMath::div"} div#197(__this: address_t, __msg_sender: address_t, __msg_value: int, a#174: int, b#176: int)
	returns (#179: int)
{
	var call_arg#11: int_arr_ptr;
	var new_array#12: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 104, 9} {:message "c"} c#189: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#12 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#11 := new_array#12;
	mem_arr_int := mem_arr_int[call_arg#11 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#176 > 0);
	c#189 := (a#174 div b#176);
	#179 := c#189;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 121, 5} {:message "SafeMath::mod"} mod#219(__this: address_t, __msg_sender: address_t, __msg_value: int, a#200: int, b#202: int)
	returns (#205: int)
{
	var call_arg#13: int_arr_ptr;
	var new_array#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#13 := new_array#14;
	mem_arr_int := mem_arr_int[call_arg#13 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume (b#202 != 0);
	#205 := (a#200 mod b#202);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_34.sol", 34, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#220(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: LollypopToken -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_34.sol", 272, 3} {:message "[event] LollypopToken::Transfer"} Transfer#726(__this: address_t, __msg_sender: address_t, __msg_value: int, from#720: address_t, to#722: address_t, value#724: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_34.sol", 280, 3} {:message "[event] LollypopToken::Approval"} Approval#748(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#742: address_t, spender#744: address_t, value#746: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: _balances: mapping(address => struct LollypopToken.transferMapping storage ref)
type {:datatype} struct_storage_transferMapping#353;
var {:sourceloc "buggy_34.sol", 130, 5} {:message "_balances"} _balances#229: [address_t][address_t]struct_storage_transferMapping#353;
// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_34.sol", 132, 5} {:message "_allowances"} _allowances#235: [address_t][address_t][address_t]int;
// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_34.sol", 134, 5} {:message "_totalSupply"} _totalSupply#237: [address_t]int;
// 
// Function: bug_unchk_send18 : function ()
procedure {:sourceloc "buggy_34.sol", 135, 3} {:message "LollypopToken::bug_unchk_send18"} bug_unchk_send18#250(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 136, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return11:
	// Function body ends here
}

// 
// State variable: _maxTotalSupply: uint256
var {:sourceloc "buggy_34.sol", 137, 3} {:message "_maxTotalSupply"} _maxTotalSupply#252: [address_t]int;
// 
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_34.sol", 140, 3} {:message "LollypopToken::bug_unchk_send29"} bug_unchk_send29#265(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 141, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return12:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_34.sol", 142, 3} {:message "_name"} _name#268: [address_t]int_arr_type;
// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_34.sol", 143, 3} {:message "LollypopToken::bug_unchk_send6"} bug_unchk_send6#281(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 144, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return13:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_34.sol", 145, 3} {:message "_symbol"} _symbol#284: [address_t]int_arr_type;
// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_34.sol", 146, 3} {:message "LollypopToken::bug_unchk_send16"} bug_unchk_send16#297(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 147, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return14:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_34.sol", 148, 3} {:message "_decimals"} _decimals#300: [address_t]int;
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_34.sol", 150, 3} {:message "LollypopToken::bug_unchk_send24"} bug_unchk_send24#313(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 151, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return15:
	// Function body ends here
}

// 
// State variable: maxAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 152, 3} {:message "maxAgeOfToken"} maxAgeOfToken#316: [address_t]int;
// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_34.sol", 153, 3} {:message "LollypopToken::bug_unchk_send5"} bug_unchk_send5#329(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 154, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return16:
	// Function body ends here
}

// 
// State variable: minAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 155, 3} {:message "minAgeOfToken"} minAgeOfToken#332: [address_t]int;
// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_34.sol", 156, 3} {:message "LollypopToken::bug_unchk_send15"} bug_unchk_send15#345(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 157, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return17:
	// Function body ends here
}

// 
// State variable: perDayBonus: uint256
var {:sourceloc "buggy_34.sol", 158, 3} {:message "perDayBonus"} perDayBonus#348: [address_t]int;
// 
// ------- Struct transferMapping -------
// Storage
function {:constructor} transferMapping#353#constr(amount#350: int, time#352: int) returns (struct_storage_transferMapping#353);
// Memory
type address_struct_memory_transferMapping#353 = int;
// Member amount
var {:sourceloc "buggy_34.sol", 161, 9} {:message "amount"} amount#350: [address_struct_memory_transferMapping#353]int;
// Member time
var {:sourceloc "buggy_34.sol", 162, 9} {:message "time"} time#352: [address_struct_memory_transferMapping#353]int;
// 
// ------- End of struct transferMapping -------
function {:builtin "((as const (Array Int |T@struct_storage_transferMapping#353|)) (|transferMapping#353#constr| 0 0))"} default_address_t_struct_storage_transferMapping#353() returns ([address_t]struct_storage_transferMapping#353);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 166, 5} {:message "LollypopToken::[constructor]"} __constructor#1326(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#229 := _balances#229[__this := default_address_t_struct_storage_transferMapping#353()];
	_allowances#235 := _allowances#235[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#237 := _totalSupply#237[__this := 0];
	_maxTotalSupply#252 := _maxTotalSupply#252[__this := 0];
	_name#268 := _name#268[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121][5 := 112][6 := 111][7 := 112], 8)];
	_symbol#284 := _symbol#284[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121], 5)];
	_decimals#300 := _decimals#300[__this := 18];
	maxAgeOfToken#316 := maxAgeOfToken#316[__this := 31536000];
	minAgeOfToken#332 := minAgeOfToken#332[__this := 86400];
	perDayBonus#348 := perDayBonus#348[__this := 100];
	owner#3 := owner#3[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#3 := owner#3[__this := __msg_sender];
	$return18:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	_maxTotalSupply#252 := _maxTotalSupply#252[__this := 1000000000000000000000000000];
	_totalSupply#237 := _totalSupply#237[__this := 2000000000000000000000000];
	_balances#229 := _balances#229[__this := _balances#229[__this][__msg_sender := transferMapping#353#constr(_totalSupply#237[__this], time#352#transferMapping#353#constr(_balances#229[__this][__msg_sender]))]];
	_balances#229 := _balances#229[__this := _balances#229[__this][__msg_sender := transferMapping#353#constr(amount#350#transferMapping#353#constr(_balances#229[__this][__msg_sender]), __block_timestamp)]];
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_34.sol", 174, 1} {:message "LollypopToken::bug_unchk_send10"} bug_unchk_send10#403(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 175, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return20:
	// Function body ends here
}

// 
// Function: calculateBonus : function (uint256,uint256) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 177, 5} {:message "LollypopToken::calculateBonus"} calculateBonus#441(__this: address_t, __msg_sender: address_t, __msg_value: int, timeElasped#405: int, amount#407: int)
	returns (#410: int)
{
	var {:sourceloc "buggy_34.sol", 178, 9} {:message "totalDays"} totalDays#413: int;
	var div#197_ret#24: int;
	var {:sourceloc "buggy_34.sol", 182, 9} {:message "totalBonus"} totalBonus#429: int;
	var div#197_ret#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 178, 29} {:message ""} true;
	call div#197_ret#24 := div#197(__this, __msg_sender, __msg_value, timeElasped#405, minAgeOfToken#332[__this]);
	totalDays#413 := div#197_ret#24;
	if ((totalDays#413 > maxAgeOfToken#316[__this])) {
	totalDays#413 := maxAgeOfToken#316[__this];
	}

	assume {:sourceloc "buggy_34.sol", 182, 30} {:message ""} true;
	call div#197_ret#25 := div#197(__this, __msg_sender, __msg_value, (totalDays#413 * amount#407), perDayBonus#348[__this]);
	totalBonus#429 := div#197_ret#25;
	#410 := totalBonus#429;
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_34.sol", 186, 1} {:message "LollypopToken::bug_unchk_send22"} bug_unchk_send22#454(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 187, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return22:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 190, 5} {:message "LollypopToken::_transfer"} _transfer#606(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#456: address_t, recipient#458: address_t, amount#460: int)
{
	var call_arg#27: int_arr_ptr;
	var new_array#28: int_arr_ptr;
	var call_arg#29: int_arr_ptr;
	var new_array#30: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 194, 9} {:message "senderTimeElasped"} senderTimeElasped#484: int;
	var {:sourceloc "buggy_34.sol", 195, 9} {:message "recipientTimeElasped"} recipientTimeElasped#495: int;
	var {:sourceloc "buggy_34.sol", 198, 13} {:message "bonus"} bonus#514: int;
	var balanceOf#845_ret#31: int;
	var calculateBonus#441_ret#32: int;
	var {:sourceloc "buggy_34.sol", 203, 14} {:message "bonus"} bonus#542: int;
	var balanceOf#845_ret#33: int;
	var calculateBonus#441_ret#34: int;
	var sub#136_ret#35: int;
	var add#110_ret#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#28 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#27 := new_array#28;
	mem_arr_int := mem_arr_int[call_arg#27 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#456 != 0);
	new_array#30 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#29 := new_array#30;
	mem_arr_int := mem_arr_int[call_arg#29 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#458 != 0);
	senderTimeElasped#484 := (__block_timestamp - time#352#transferMapping#353#constr(_balances#229[__this][sender#456]));
	recipientTimeElasped#495 := (__block_timestamp - time#352#transferMapping#353#constr(_balances#229[__this][recipient#458]));
	if (((senderTimeElasped#484 >= minAgeOfToken#332[__this]) && (_totalSupply#237[__this] < _maxTotalSupply#252[__this]))) {
	assume {:sourceloc "buggy_34.sol", 198, 64} {:message ""} true;
	call balanceOf#845_ret#31 := balanceOf#845(__this, __msg_sender, __msg_value, sender#456);
	assume {:sourceloc "buggy_34.sol", 198, 29} {:message ""} true;
	call calculateBonus#441_ret#32 := calculateBonus#441(__this, __msg_sender, __msg_value, senderTimeElasped#484, balanceOf#845_ret#31);
	bonus#514 := calculateBonus#441_ret#32;
	assume {:sourceloc "buggy_34.sol", 199, 13} {:message ""} true;
	call mint#796(__this, __msg_sender, __msg_value, sender#456, bonus#514);
	}

	if ((((recipientTimeElasped#495 >= minAgeOfToken#332[__this]) && (_totalSupply#237[__this] < _maxTotalSupply#252[__this])) && (sender#456 != recipient#458))) {
	assume {:sourceloc "buggy_34.sol", 203, 68} {:message ""} true;
	call balanceOf#845_ret#33 := balanceOf#845(__this, __msg_sender, __msg_value, recipient#458);
	assume {:sourceloc "buggy_34.sol", 203, 30} {:message ""} true;
	call calculateBonus#441_ret#34 := calculateBonus#441(__this, __msg_sender, __msg_value, recipientTimeElasped#495, balanceOf#845_ret#33);
	bonus#542 := calculateBonus#441_ret#34;
	assume {:sourceloc "buggy_34.sol", 204, 14} {:message ""} true;
	call mint#796(__this, __msg_sender, __msg_value, recipient#458, bonus#542);
	}

	assume {:sourceloc "buggy_34.sol", 208, 36} {:message ""} true;
	call sub#136_ret#35 := sub#136(__this, __msg_sender, __msg_value, amount#350#transferMapping#353#constr(_balances#229[__this][sender#456]), amount#460);
	_balances#229 := _balances#229[__this := _balances#229[__this][sender#456 := transferMapping#353#constr(sub#136_ret#35, time#352#transferMapping#353#constr(_balances#229[__this][sender#456]))]];
	assume {:sourceloc "buggy_34.sol", 209, 39} {:message ""} true;
	call add#110_ret#36 := add#110(__this, __msg_sender, __msg_value, amount#350#transferMapping#353#constr(_balances#229[__this][recipient#458]), amount#460);
	_balances#229 := _balances#229[__this := _balances#229[__this][recipient#458 := transferMapping#353#constr(add#110_ret#36, time#352#transferMapping#353#constr(_balances#229[__this][recipient#458]))]];
	_balances#229 := _balances#229[__this := _balances#229[__this][sender#456 := transferMapping#353#constr(amount#350#transferMapping#353#constr(_balances#229[__this][sender#456]), __block_timestamp)]];
	_balances#229 := _balances#229[__this := _balances#229[__this][recipient#458 := transferMapping#353#constr(amount#350#transferMapping#353#constr(_balances#229[__this][recipient#458]), __block_timestamp)]];
	assume {:sourceloc "buggy_34.sol", 214, 14} {:message ""} true;
	call Transfer#726(__this, __msg_sender, __msg_value, sender#456, recipient#458, amount#460);
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_34.sol", 218, 1} {:message "LollypopToken::bug_unchk_send12"} bug_unchk_send12#619(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#37 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 219, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#37);
	$return24:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 225, 5} {:message "LollypopToken::name"} name#628(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#623: int_arr_ptr)
{
	var new_array#38: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#38 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#623 := new_array#38;
	mem_arr_int := mem_arr_int[#623 := _name#268[__this]];
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_34.sol", 228, 1} {:message "LollypopToken::bug_unchk_send11"} bug_unchk_send11#641(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 229, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return26:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 235, 5} {:message "LollypopToken::symbol"} symbol#650(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#645: int_arr_ptr)
{
	var new_array#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#645 := new_array#40;
	mem_arr_int := mem_arr_int[#645 := _symbol#284[__this]];
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_34.sol", 238, 1} {:message "LollypopToken::bug_unchk_send1"} bug_unchk_send1#663(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 239, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#41);
	$return28:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_34.sol", 253, 5} {:message "LollypopToken::decimals"} decimals#672(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#667: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#667 := _decimals#300[__this];
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_34.sol", 256, 1} {:message "LollypopToken::bug_unchk_send2"} bug_unchk_send2#685(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 257, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#42);
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_34.sol", 270, 3} {:message "LollypopToken::bug_unchk_send31"} bug_unchk_send31#718(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#43 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 271, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#43);
	$return31:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_34.sol", 278, 3} {:message "LollypopToken::bug_unchk_send13"} bug_unchk_send13#740(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 279, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#44);
	$return32:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 294, 5} {:message "LollypopToken::mint"} mint#796(__this: address_t, __msg_sender: address_t, __msg_value: int, account#751: address_t, amount#753: int)
{
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	var add#110_ret#47: int;
	var add#110_ret#48: int;
	var call_arg#49: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#751 != 0);
	assume {:sourceloc "buggy_34.sol", 297, 24} {:message ""} true;
	call add#110_ret#47 := add#110(__this, __msg_sender, __msg_value, _totalSupply#237[__this], amount#753);
	_totalSupply#237 := _totalSupply#237[__this := add#110_ret#47];
	assume {:sourceloc "buggy_34.sol", 298, 37} {:message ""} true;
	call add#110_ret#48 := add#110(__this, __msg_sender, __msg_value, amount#350#transferMapping#353#constr(_balances#229[__this][account#751]), amount#753);
	_balances#229 := _balances#229[__this := _balances#229[__this][account#751 := transferMapping#353#constr(add#110_ret#48, time#352#transferMapping#353#constr(_balances#229[__this][account#751]))]];
	call_arg#49 := 0;
	assume {:sourceloc "buggy_34.sol", 299, 14} {:message ""} true;
	call Transfer#726(__this, __msg_sender, __msg_value, call_arg#49, account#751, amount#753);
	$return33:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_34.sol", 301, 1} {:message "LollypopToken::bug_unchk_send17"} bug_unchk_send17#809(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#50 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 302, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#50);
	$return34:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 309, 5} {:message "LollypopToken::totalSupply"} totalSupply#818(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#813: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#813 := _totalSupply#237[__this];
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_34.sol", 312, 1} {:message "LollypopToken::bug_unchk_send3"} bug_unchk_send3#831(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#51 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 313, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#51);
	$return36:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 318, 5} {:message "LollypopToken::balanceOf"} balanceOf#845(__this: address_t, __msg_sender: address_t, __msg_value: int, account#834: address_t)
	returns (#837: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#837 := amount#350#transferMapping#353#constr(_balances#229[__this][account#834]);
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_34.sol", 321, 1} {:message "LollypopToken::bug_unchk_send9"} bug_unchk_send9#858(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#52: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#52 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 322, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#52);
	$return38:
	// Function body ends here
}

// 
// Function: timeOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 325, 2} {:message "LollypopToken::timeOf"} timeOf#871(__this: address_t, __msg_sender: address_t, __msg_value: int, account#860: address_t)
	returns (#863: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#863 := time#352#transferMapping#353#constr(_balances#229[__this][account#860]);
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_34.sol", 328, 1} {:message "LollypopToken::bug_unchk_send25"} bug_unchk_send25#884(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#53: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#53 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 329, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#53);
	$return40:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 339, 5} {:message "LollypopToken::transfer"} transfer#904(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#887: address_t, amount#889: int)
	returns (#892: bool)
{
	var call_arg#54: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#54 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 340, 9} {:message ""} true;
	call _transfer#606(__this, __msg_sender, __msg_value, call_arg#54, recipient#887, amount#889);
	#892 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_34.sol", 343, 1} {:message "LollypopToken::bug_unchk_send19"} bug_unchk_send19#917(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#55: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#55 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 344, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#55);
	$return42:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_34.sol", 346, 3} {:message "LollypopToken::multiTransfer"} multiTransfer#957(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#920: address_t_arr_ptr, amounts#923: int_arr_ptr)
{
	var {:sourceloc "buggy_34.sol", 348, 10} {:message "i"} i#935: int;
	var transfer#904_ret#58: bool;
	var tmp#59: int;
	// TCC assumptions
	assume (receivers#920 < __alloc_counter);
	assume (amounts#923 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#920])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#920]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[amounts#923])) && (length#int_arr#constr(mem_arr_int[amounts#923]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[receivers#920]) == length#int_arr#constr(mem_arr_int[amounts#923]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#935 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#920])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#920]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#935 < length#address_t_arr#constr(mem_arr_address_t[receivers#920]))) {
	// Body
	assume {:sourceloc "buggy_34.sol", 349, 7} {:message ""} true;
	call transfer#904_ret#58 := transfer#904(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#920])[i#935], arr#int_arr#constr(mem_arr_int[amounts#923])[i#935]);
	$continue56:
	// Loop expression
	tmp#59 := i#935;
	i#935 := (i#935 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#920])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#920]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break57:
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_34.sol", 352, 1} {:message "LollypopToken::bug_unchk_send26"} bug_unchk_send26#970(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#60: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#60 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 353, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#60);
	$return44:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 359, 5} {:message "LollypopToken::allowance"} allowance#987(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#973: address_t, spender#975: address_t)
	returns (#978: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#978 := _allowances#235[__this][owner#973][spender#975];
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_34.sol", 362, 1} {:message "LollypopToken::bug_unchk_send20"} bug_unchk_send20#1000(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#61: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#61 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 363, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#61);
	$return46:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 372, 5} {:message "LollypopToken::approve"} approve#1020(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1003: address_t, value#1005: int)
	returns (#1008: bool)
{
	var call_arg#62: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#62 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 373, 9} {:message ""} true;
	call _approve#1270(__this, __msg_sender, __msg_value, call_arg#62, spender#1003, value#1005);
	#1008 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_34.sol", 376, 1} {:message "LollypopToken::bug_unchk_send32"} bug_unchk_send32#1033(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#63: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#63 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 377, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#63);
	$return48:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 391, 5} {:message "LollypopToken::transferFrom"} transferFrom#1069(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#1036: address_t, recipient#1038: address_t, amount#1040: int)
	returns (#1043: bool)
{
	var call_arg#64: address_t;
	var sub#136_ret#65: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 392, 9} {:message ""} true;
	call _transfer#606(__this, __msg_sender, __msg_value, sender#1036, recipient#1038, amount#1040);
	call_arg#64 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 393, 38} {:message ""} true;
	call sub#136_ret#65 := sub#136(__this, __msg_sender, __msg_value, _allowances#235[__this][sender#1036][__msg_sender], amount#1040);
	assume {:sourceloc "buggy_34.sol", 393, 9} {:message ""} true;
	call _approve#1270(__this, __msg_sender, __msg_value, sender#1036, call_arg#64, sub#136_ret#65);
	#1043 := true;
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_34.sol", 396, 1} {:message "LollypopToken::bug_unchk_send4"} bug_unchk_send4#1082(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#66: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#66 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 397, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#66);
	$return50:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 411, 5} {:message "LollypopToken::increaseAllowance"} increaseAllowance#1110(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1085: address_t, addedValue#1087: int)
	returns (#1090: bool)
{
	var call_arg#67: address_t;
	var add#110_ret#68: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#67 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 412, 39} {:message ""} true;
	call add#110_ret#68 := add#110(__this, __msg_sender, __msg_value, _allowances#235[__this][__msg_sender][spender#1085], addedValue#1087);
	assume {:sourceloc "buggy_34.sol", 412, 9} {:message ""} true;
	call _approve#1270(__this, __msg_sender, __msg_value, call_arg#67, spender#1085, add#110_ret#68);
	#1090 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_34.sol", 415, 1} {:message "LollypopToken::bug_unchk_send7"} bug_unchk_send7#1123(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#69: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#69 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 416, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#69);
	$return52:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 432, 5} {:message "LollypopToken::decreaseAllowance"} decreaseAllowance#1151(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1126: address_t, subtractedValue#1128: int)
	returns (#1131: bool)
{
	var call_arg#70: address_t;
	var sub#136_ret#71: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#70 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 433, 39} {:message ""} true;
	call sub#136_ret#71 := sub#136(__this, __msg_sender, __msg_value, _allowances#235[__this][__msg_sender][spender#1126], subtractedValue#1128);
	assume {:sourceloc "buggy_34.sol", 433, 9} {:message ""} true;
	call _approve#1270(__this, __msg_sender, __msg_value, call_arg#70, spender#1126, sub#136_ret#71);
	#1131 := true;
	goto $return53;
	$return53:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_34.sol", 436, 1} {:message "LollypopToken::bug_unchk_send23"} bug_unchk_send23#1164(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#72: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#72 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 437, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#72);
	$return54:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 468, 5} {:message "LollypopToken::_burn"} _burn#1212(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1167: address_t, value#1169: int)
{
	var call_arg#73: int_arr_ptr;
	var new_array#74: int_arr_ptr;
	var sub#136_ret#75: int;
	var sub#136_ret#76: int;
	var call_arg#77: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#74 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#73 := new_array#74;
	mem_arr_int := mem_arr_int[call_arg#73 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#1167 != 0);
	assume {:sourceloc "buggy_34.sol", 471, 24} {:message ""} true;
	call sub#136_ret#75 := sub#136(__this, __msg_sender, __msg_value, _totalSupply#237[__this], value#1169);
	_totalSupply#237 := _totalSupply#237[__this := sub#136_ret#75];
	assume {:sourceloc "buggy_34.sol", 472, 37} {:message ""} true;
	call sub#136_ret#76 := sub#136(__this, __msg_sender, __msg_value, amount#350#transferMapping#353#constr(_balances#229[__this][account#1167]), value#1169);
	_balances#229 := _balances#229[__this := _balances#229[__this][account#1167 := transferMapping#353#constr(sub#136_ret#76, time#352#transferMapping#353#constr(_balances#229[__this][account#1167]))]];
	call_arg#77 := 0;
	assume {:sourceloc "buggy_34.sol", 473, 14} {:message ""} true;
	call Transfer#726(__this, __msg_sender, __msg_value, account#1167, call_arg#77, value#1169);
	$return55:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_34.sol", 475, 1} {:message "LollypopToken::bug_unchk_send14"} bug_unchk_send14#1225(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#78: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#78 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 476, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#78);
	$return56:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 491, 5} {:message "LollypopToken::_approve"} _approve#1270(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1228: address_t, spender#1230: address_t, value#1232: int)
{
	var call_arg#79: int_arr_ptr;
	var new_array#80: int_arr_ptr;
	var call_arg#81: int_arr_ptr;
	var new_array#82: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#80 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#79 := new_array#80;
	mem_arr_int := mem_arr_int[call_arg#79 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#1228 != 0);
	new_array#82 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#81 := new_array#82;
	mem_arr_int := mem_arr_int[call_arg#81 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#1230 != 0);
	_allowances#235 := _allowances#235[__this := _allowances#235[__this][owner#1228 := _allowances#235[__this][owner#1228][spender#1230 := value#1232]]];
	assume {:sourceloc "buggy_34.sol", 496, 14} {:message ""} true;
	call Approval#748(__this, __msg_sender, __msg_value, owner#1228, spender#1230, value#1232);
	$return57:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_34.sol", 498, 1} {:message "LollypopToken::bug_unchk_send30"} bug_unchk_send30#1283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#83: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#83 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 499, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#83);
	$return58:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 507, 5} {:message "LollypopToken::_burnFrom"} _burnFrom#1312(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1286: address_t, amount#1288: int)
{
	var call_arg#84: address_t;
	var sub#136_ret#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 508, 9} {:message ""} true;
	call _burn#1212(__this, __msg_sender, __msg_value, account#1286, amount#1288);
	call_arg#84 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 509, 39} {:message ""} true;
	call sub#136_ret#85 := sub#136(__this, __msg_sender, __msg_value, _allowances#235[__this][account#1286][__msg_sender], amount#1288);
	assume {:sourceloc "buggy_34.sol", 509, 9} {:message ""} true;
	call _approve#1270(__this, __msg_sender, __msg_value, account#1286, call_arg#84, sub#136_ret#85);
	$return59:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_34.sol", 511, 1} {:message "LollypopToken::bug_unchk_send8"} bug_unchk_send8#1325(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#86: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#86 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 512, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#86);
	$return60:
	// Function body ends here
}

