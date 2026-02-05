// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_32.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_32.sol", 24, 5} {:message "SafeMath::sub"} sub#28(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	var {:sourceloc "buggy_32.sol", 26, 9} {:message "c"} c#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#7 <= a#5);
	c#20 := (a#5 - b#7);
	#10 := c#20;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_32.sol", 34, 5} {:message "SafeMath::add"} add#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#31: int, b#33: int)
	returns (#36: int)
{
	var {:sourceloc "buggy_32.sol", 35, 9} {:message "c"} c#39: int;
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#39 := (a#31 + b#33);
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#39 >= a#31);
	#36 := c#39;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_32.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#55(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20TokenInterface -------
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 48, 9} {:message "ERC20TokenInterface::balanceOf"} balanceOf#63(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#58: address_t)
	returns (value#61: int);

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_32.sol", 49, 1} {:message "ERC20TokenInterface::bug_unchk_send25"} bug_unchk_send25#76(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 50, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return2:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 51, 9} {:message "ERC20TokenInterface::transfer"} transfer#85(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#78: address_t, _value#80: int)
	returns (success#83: bool);

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_32.sol", 52, 1} {:message "ERC20TokenInterface::bug_unchk_send19"} bug_unchk_send19#98(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 53, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return3:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 54, 9} {:message "ERC20TokenInterface::transferFrom"} transferFrom#109(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#100: address_t, _to#102: address_t, _value#104: int)
	returns (success#107: bool);

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_32.sol", 55, 1} {:message "ERC20TokenInterface::bug_unchk_send26"} bug_unchk_send26#122(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 56, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return4:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 57, 9} {:message "ERC20TokenInterface::approve"} approve#131(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#124: address_t, _value#126: int)
	returns (success#129: bool);

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_32.sol", 58, 1} {:message "ERC20TokenInterface::bug_unchk_send20"} bug_unchk_send20#144(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 59, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 60, 9} {:message "ERC20TokenInterface::allowance"} allowance#153(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#146: address_t, _spender#148: address_t)
	returns (remaining#151: int);

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_32.sol", 61, 1} {:message "ERC20TokenInterface::bug_unchk_send32"} bug_unchk_send32#166(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 62, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_32.sol", 46, 1} {:message "ERC20TokenInterface::[implicit_constructor]"} __constructor#167(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Token -------
// Inherits from: ERC20TokenInterface
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_32.sol", 151, 3} {:message "[event] ERC20Token::Transfer"} Transfer#479(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#473: address_t, _to#475: address_t, _value#477: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_32.sol", 154, 3} {:message "[event] ERC20Token::Approval"} Approval#500(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#494: address_t, _spender#496: address_t, _value#498: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_32.sol", 72, 3} {:message "ERC20Token::bug_unchk_send12"} bug_unchk_send12#186(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 73, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return7:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_32.sol", 74, 3} {:message "totalSupply"} totalSupply#188: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_32.sol", 75, 3} {:message "ERC20Token::bug_unchk_send11"} bug_unchk_send11#201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 76, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 77, 3} {:message "balances"} balances#205: [address_t][address_t]int;
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_32.sol", 78, 3} {:message "ERC20Token::bug_unchk_send1"} bug_unchk_send1#218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 79, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_32.sol", 80, 3} {:message "allowed"} allowed#224: [address_t][address_t][address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 86, 5} {:message "ERC20Token::balanceOf"} balanceOf#238(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#227: address_t)
	returns (value#231: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	value#231 := balances#205[__this][_owner#227];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_32.sol", 89, 1} {:message "ERC20Token::bug_unchk_send4"} bug_unchk_send4#251(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 90, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 97, 5} {:message "ERC20Token::transfer"} transfer#296(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#254: address_t, _value#256: int)
	returns (success#260: bool)
{
	var sub#28_ret#13: int;
	var add#54_ret#14: int;
	var call_arg#15: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 98, 32} {:message ""} true;
	call sub#28_ret#13 := sub#28(__this, __msg_sender, __msg_value, balances#205[__this][__msg_sender], _value#256);
	balances#205 := balances#205[__this := balances#205[__this][__msg_sender := sub#28_ret#13]];
	assume {:sourceloc "buggy_32.sol", 99, 25} {:message ""} true;
	call add#54_ret#14 := add#54(__this, __msg_sender, __msg_value, balances#205[__this][_to#254], _value#256);
	balances#205 := balances#205[__this := balances#205[__this][_to#254 := add#54_ret#14]];
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 100, 14} {:message ""} true;
	call Transfer#479(__this, __msg_sender, __msg_value, call_arg#15, _to#254, _value#256);
	success#260 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_32.sol", 103, 1} {:message "ERC20Token::bug_unchk_send7"} bug_unchk_send7#309(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 104, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return13:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 112, 5} {:message "ERC20Token::transferFrom"} transferFrom#370(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#312: address_t, _to#314: address_t, _value#316: int)
	returns (success#320: bool)
{
	var sub#28_ret#17: int;
	var sub#28_ret#18: int;
	var add#54_ret#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 113, 38} {:message ""} true;
	call sub#28_ret#17 := sub#28(__this, __msg_sender, __msg_value, allowed#224[__this][_from#312][__msg_sender], _value#316);
	allowed#224 := allowed#224[__this := allowed#224[__this][_from#312 := allowed#224[__this][_from#312][__msg_sender := sub#28_ret#17]]];
	assume {:sourceloc "buggy_32.sol", 114, 27} {:message ""} true;
	call sub#28_ret#18 := sub#28(__this, __msg_sender, __msg_value, balances#205[__this][_from#312], _value#316);
	balances#205 := balances#205[__this := balances#205[__this][_from#312 := sub#28_ret#18]];
	assume {:sourceloc "buggy_32.sol", 115, 25} {:message ""} true;
	call add#54_ret#19 := add#54(__this, __msg_sender, __msg_value, balances#205[__this][_to#314], _value#316);
	balances#205 := balances#205[__this := balances#205[__this][_to#314 := add#54_ret#19]];
	assume {:sourceloc "buggy_32.sol", 116, 14} {:message ""} true;
	call Transfer#479(__this, __msg_sender, __msg_value, _from#312, _to#314, _value#316);
	success#320 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_32.sol", 119, 1} {:message "ERC20Token::bug_unchk_send23"} bug_unchk_send23#383(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 120, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 127, 5} {:message "ERC20Token::approve"} approve#413(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#386: address_t, _value#388: int)
	returns (success#392: bool)
{
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#224 := allowed#224[__this := allowed#224[__this][__msg_sender := allowed#224[__this][__msg_sender][_spender#386 := _value#388]]];
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 129, 14} {:message ""} true;
	call Approval#500(__this, __msg_sender, __msg_value, call_arg#21, _spender#386, _value#388);
	success#392 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_32.sol", 132, 1} {:message "ERC20Token::bug_unchk_send14"} bug_unchk_send14#426(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 133, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return17:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 140, 5} {:message "ERC20Token::allowance"} allowance#444(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#429: address_t, _spender#431: address_t)
	returns (remaining#435: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#435 := allowed#224[__this][_owner#429][_spender#431];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_32.sol", 143, 1} {:message "ERC20Token::bug_unchk_send30"} bug_unchk_send30#457(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 144, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_32.sol", 149, 3} {:message "ERC20Token::bug_unchk_send31"} bug_unchk_send31#471(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 150, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_32.sol", 152, 3} {:message "ERC20Token::bug_unchk_send13"} bug_unchk_send13#492(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 153, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return21:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_32.sol", 70, 1} {:message "ERC20Token::[implicit_constructor]"} __constructor#501(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	totalSupply#188 := totalSupply#188[__this := 0];
	balances#205 := balances#205[__this := default_address_t_int()];
	allowed#224 := allowed#224[__this := default_address_t__k_address_t_v_int()];
}

// 
// ------- Contract: AsseteGram -------
// Inherits from: ERC20Token
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_32.sol", 162, 3} {:message "AsseteGram::bug_unchk_send2"} bug_unchk_send2#517(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 163, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return22:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_32.sol", 164, 3} {:message "name"} name#520: [address_t]int_arr_type;
// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_32.sol", 165, 3} {:message "AsseteGram::bug_unchk_send17"} bug_unchk_send17#533(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 166, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return23:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_32.sol", 167, 3} {:message "decimals"} decimals#536: [address_t]int;
// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_32.sol", 168, 3} {:message "AsseteGram::bug_unchk_send3"} bug_unchk_send3#549(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 169, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return24:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_32.sol", 170, 3} {:message "symbol"} symbol#552: [address_t]int_arr_type;
// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_32.sol", 171, 3} {:message "AsseteGram::bug_unchk_send9"} bug_unchk_send9#565(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#29 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 172, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#29);
	$return25:
	// Function body ends here
}

// 
// State variable: version: string storage ref
var {:sourceloc "buggy_32.sol", 173, 3} {:message "version"} version#568: [address_t]int_arr_type;
const unique address_0xac775cD446889ac167da466692449ece5439fc12: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 175, 5} {:message "AsseteGram::[constructor]"} __constructor#634(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 176, 9} {:message "initialOwner"} initialOwner#572: address_t;
	var call_arg#30: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#520 := name#520[__this := int_arr#constr(default_int_int()[0 := 69][1 := 108][2 := 101][3 := 99][4 := 116][5 := 114][6 := 111][7 := 110][8 := 105][9 := 99][10 := 32][11 := 71][12 := 114][13 := 97][14 := 109], 15)];
	decimals#536 := decimals#536[__this := 3];
	symbol#552 := symbol#552[__this := int_arr#constr(default_int_int()[0 := 101][1 := 71][2 := 114][3 := 97][4 := 109], 5)];
	version#568 := version#568[__this := int_arr#constr(default_int_int()[0 := 50], 1)];
	totalSupply#188 := totalSupply#188[__this := 0];
	balances#205 := balances#205[__this := default_address_t_int()];
	allowed#224 := allowed#224[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	initialOwner#572 := address_0xac775cD446889ac167da466692449ece5439fc12;
	totalSupply#188 := totalSupply#188[__this := 180000000000];
	balances#205 := balances#205[__this := balances#205[__this][initialOwner#572 := totalSupply#188[__this]]];
	call_arg#30 := 0;
	assume {:sourceloc "buggy_32.sol", 179, 14} {:message ""} true;
	call Transfer#479(__this, __msg_sender, __msg_value, call_arg#30, initialOwner#572, balances#205[__this][initialOwner#572]);
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_32.sol", 181, 1} {:message "AsseteGram::bug_unchk_send8"} bug_unchk_send8#612(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#31 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 182, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#31);
	$return27:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 187, 5} {:message "AsseteGram::[fallback]"} #620(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume false;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_32.sol", 190, 3} {:message "AsseteGram::bug_unchk_send27"} bug_unchk_send27#633(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#32 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 191, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#32);
	$return29:
	// Function body ends here
}

