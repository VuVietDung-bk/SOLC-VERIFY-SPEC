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
// Function: balanceOf
procedure {:sourceloc "buggy_32.sol", 48, 5} {:message "ERC20TokenInterface::balanceOf"} balanceOf#63(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#58: address_t)
	returns (value#61: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_32.sol", 49, 5} {:message "ERC20TokenInterface::transfer"} transfer#72(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#65: address_t, _value#67: int)
	returns (success#70: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_32.sol", 50, 5} {:message "ERC20TokenInterface::transferFrom"} transferFrom#83(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#74: address_t, _to#76: address_t, _value#78: int)
	returns (success#81: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_32.sol", 51, 5} {:message "ERC20TokenInterface::approve"} approve#92(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#85: address_t, _value#87: int)
	returns (success#90: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_32.sol", 52, 5} {:message "ERC20TokenInterface::allowance"} allowance#101(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#94: address_t, _spender#96: address_t)
	returns (remaining#99: int);

// 
// Default constructor
procedure {:sourceloc "buggy_32.sol", 46, 1} {:message "ERC20TokenInterface::[implicit_constructor]"} __constructor#102(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Token -------
// Inherits from: ERC20TokenInterface
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_32.sol", 163, 3} {:message "[event] ERC20Token::Transfer"} Transfer#501(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#495: address_t, _to#497: address_t, _value#499: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_32.sol", 165, 3} {:message "[event] ERC20Token::Approval"} Approval#513(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#507: address_t, _spender#509: address_t, _value#511: int)
{
	
}

// Using library SafeMath for uint256
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_32.sol", 62, 3} {:message "ERC20Token::bug_tmstmp32"} bug_tmstmp32#155(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 63, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#112: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#112 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#112);
	pastBlockTime_tmstmp32#112 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_32.sol", 68, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return2:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_32.sol", 71, 3} {:message "totalSupply"} totalSupply#157: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_32.sol", 72, 3} {:message "winner_tmstmp38"} winner_tmstmp38#159: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 73, 1} {:message "ERC20Token::play_tmstmp38"} play_tmstmp38#181(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#161: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#161 + 432000) == __block_timestamp)) {
	winner_tmstmp38#159 := winner_tmstmp38#159[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 76, 3} {:message "balances"} balances#185: [address_t][address_t]int;
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_32.sol", 77, 3} {:message "ERC20Token::bug_tmstmp4"} bug_tmstmp4#232(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 78, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#189: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#189 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#189);
	pastBlockTime_tmstmp4#189 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_32.sol", 83, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return4:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_32.sol", 86, 3} {:message "allowed"} allowed#238: [address_t][address_t][address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 92, 5} {:message "ERC20Token::balanceOf"} balanceOf#252(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#241: address_t)
	returns (value#245: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	value#245 := balances#185[__this][_owner#241];
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_32.sol", 95, 1} {:message "ERC20Token::bug_tmstmp33"} bug_tmstmp33#263(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#255: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#255 := (__block_timestamp >= 1546300800);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 104, 5} {:message "ERC20Token::transfer"} transfer#308(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#266: address_t, _value#268: int)
	returns (success#272: bool)
{
	var sub#28_ret#4: int;
	var add#54_ret#5: int;
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 105, 32} {:message ""} true;
	call sub#28_ret#4 := sub#28(__this, __msg_sender, __msg_value, balances#185[__this][__msg_sender], _value#268);
	balances#185 := balances#185[__this := balances#185[__this][__msg_sender := sub#28_ret#4]];
	assume {:sourceloc "buggy_32.sol", 106, 25} {:message ""} true;
	call add#54_ret#5 := add#54(__this, __msg_sender, __msg_value, balances#185[__this][_to#266], _value#268);
	balances#185 := balances#185[__this := balances#185[__this][_to#266 := add#54_ret#5]];
	call_arg#6 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 107, 14} {:message ""} true;
	call Transfer#501(__this, __msg_sender, __msg_value, call_arg#6, _to#266, _value#268);
	success#272 := true;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_32.sol", 110, 1} {:message "winner_tmstmp27"} winner_tmstmp27#310: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 111, 1} {:message "ERC20Token::play_tmstmp27"} play_tmstmp27#336(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#312: int)
{
	var {:sourceloc "buggy_32.sol", 112, 2} {:message "_vtime"} _vtime#316: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#316 := __block_timestamp;
	if (((startTime#312 + 432000) == _vtime#316)) {
	winner_tmstmp27#310 := winner_tmstmp27#310[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 122, 5} {:message "ERC20Token::transferFrom"} transferFrom#397(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#339: address_t, _to#341: address_t, _value#343: int)
	returns (success#347: bool)
{
	var sub#28_ret#7: int;
	var sub#28_ret#8: int;
	var add#54_ret#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 123, 38} {:message ""} true;
	call sub#28_ret#7 := sub#28(__this, __msg_sender, __msg_value, allowed#238[__this][_from#339][__msg_sender], _value#343);
	allowed#238 := allowed#238[__this := allowed#238[__this][_from#339 := allowed#238[__this][_from#339][__msg_sender := sub#28_ret#7]]];
	assume {:sourceloc "buggy_32.sol", 124, 27} {:message ""} true;
	call sub#28_ret#8 := sub#28(__this, __msg_sender, __msg_value, balances#185[__this][_from#339], _value#343);
	balances#185 := balances#185[__this := balances#185[__this][_from#339 := sub#28_ret#8]];
	assume {:sourceloc "buggy_32.sol", 125, 25} {:message ""} true;
	call add#54_ret#9 := add#54(__this, __msg_sender, __msg_value, balances#185[__this][_to#341], _value#343);
	balances#185 := balances#185[__this := balances#185[__this][_to#341 := add#54_ret#9]];
	assume {:sourceloc "buggy_32.sol", 126, 14} {:message ""} true;
	call Transfer#501(__this, __msg_sender, __msg_value, _from#339, _to#341, _value#343);
	success#347 := true;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_32.sol", 129, 1} {:message "winner_tmstmp31"} winner_tmstmp31#399: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 130, 1} {:message "ERC20Token::play_tmstmp31"} play_tmstmp31#425(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#401: int)
{
	var {:sourceloc "buggy_32.sol", 131, 2} {:message "_vtime"} _vtime#405: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#405 := __block_timestamp;
	if (((startTime#401 + 432000) == _vtime#405)) {
	winner_tmstmp31#399 := winner_tmstmp31#399[__this := __msg_sender];
	}

	$return10:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 140, 5} {:message "ERC20Token::approve"} approve#455(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#428: address_t, _value#430: int)
	returns (success#434: bool)
{
	var call_arg#10: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#238 := allowed#238[__this := allowed#238[__this][__msg_sender := allowed#238[__this][__msg_sender][_spender#428 := _value#430]]];
	call_arg#10 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 142, 14} {:message ""} true;
	call Approval#513(__this, __msg_sender, __msg_value, call_arg#10, _spender#428, _value#430);
	success#434 := true;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_32.sol", 145, 1} {:message "ERC20Token::bug_tmstmp13"} bug_tmstmp13#466(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#458: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#458 := (__block_timestamp >= 1546300800);
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 154, 5} {:message "ERC20Token::allowance"} allowance#484(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#469: address_t, _spender#471: address_t)
	returns (remaining#475: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#475 := allowed#238[__this][_owner#469][_spender#471];
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_32.sol", 157, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#488: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_32.sol", 162, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#493: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_32.sol", 164, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#505: [address_t]int;
// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_32.sol", 60, 1} {:message "ERC20Token::[implicit_constructor]"} __constructor#514(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	totalSupply#157 := totalSupply#157[__this := 0];
	winner_tmstmp38#159 := winner_tmstmp38#159[__this := 0];
	balances#185 := balances#185[__this := default_address_t_int()];
	allowed#238 := allowed#238[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp27#310 := winner_tmstmp27#310[__this := 0];
	winner_tmstmp31#399 := winner_tmstmp31#399[__this := 0];
	bugv_tmstmp5#488 := bugv_tmstmp5#488[__this := __block_timestamp];
	bugv_tmstmp3#493 := bugv_tmstmp3#493[__this := __block_timestamp];
	bugv_tmstmp4#505 := bugv_tmstmp4#505[__this := __block_timestamp];
}

// 
// ------- Contract: AsseteGram -------
// Inherits from: ERC20Token
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_32.sol", 173, 3} {:message "winner_tmstmp7"} winner_tmstmp7#519: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 174, 1} {:message "AsseteGram::play_tmstmp7"} play_tmstmp7#545(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#521: int)
{
	var {:sourceloc "buggy_32.sol", 175, 2} {:message "_vtime"} _vtime#525: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#525 := __block_timestamp;
	if (((startTime#521 + 432000) == _vtime#525)) {
	winner_tmstmp7#519 := winner_tmstmp7#519[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_32.sol", 178, 3} {:message "name"} name#548: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_32.sol", 179, 3} {:message "winner_tmstmp23"} winner_tmstmp23#550: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 180, 1} {:message "AsseteGram::play_tmstmp23"} play_tmstmp23#576(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#552: int)
{
	var {:sourceloc "buggy_32.sol", 181, 2} {:message "_vtime"} _vtime#556: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#556 := __block_timestamp;
	if (((startTime#552 + 432000) == _vtime#556)) {
	winner_tmstmp23#550 := winner_tmstmp23#550[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_32.sol", 184, 3} {:message "decimals"} decimals#579: [address_t]int;
// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_32.sol", 185, 3} {:message "winner_tmstmp14"} winner_tmstmp14#581: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 186, 1} {:message "AsseteGram::play_tmstmp14"} play_tmstmp14#603(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#583: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#583 + 432000) == __block_timestamp)) {
	winner_tmstmp14#581 := winner_tmstmp14#581[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_32.sol", 189, 3} {:message "symbol"} symbol#606: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_32.sol", 190, 3} {:message "winner_tmstmp30"} winner_tmstmp30#608: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 191, 1} {:message "AsseteGram::play_tmstmp30"} play_tmstmp30#630(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#610: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#610 + 432000) == __block_timestamp)) {
	winner_tmstmp30#608 := winner_tmstmp30#608[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// State variable: version: string storage ref
var {:sourceloc "buggy_32.sol", 194, 3} {:message "version"} version#633: [address_t]int_arr_type;
const unique address_0xac775cD446889ac167da466692449ece5439fc12: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 196, 5} {:message "AsseteGram::[constructor]"} __constructor#681(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 197, 9} {:message "initialOwner"} initialOwner#637: address_t;
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp7#519 := winner_tmstmp7#519[__this := 0];
	name#548 := name#548[__this := int_arr#constr(default_int_int()[0 := 69][1 := 108][2 := 101][3 := 99][4 := 116][5 := 114][6 := 111][7 := 110][8 := 105][9 := 99][10 := 32][11 := 71][12 := 114][13 := 97][14 := 109], 15)];
	winner_tmstmp23#550 := winner_tmstmp23#550[__this := 0];
	decimals#579 := decimals#579[__this := 3];
	winner_tmstmp14#581 := winner_tmstmp14#581[__this := 0];
	symbol#606 := symbol#606[__this := int_arr#constr(default_int_int()[0 := 101][1 := 71][2 := 114][3 := 97][4 := 109], 5)];
	winner_tmstmp30#608 := winner_tmstmp30#608[__this := 0];
	version#633 := version#633[__this := int_arr#constr(default_int_int()[0 := 50], 1)];
	bugv_tmstmp1#668 := bugv_tmstmp1#668[__this := __block_timestamp];
	bugv_tmstmp2#680 := bugv_tmstmp2#680[__this := __block_timestamp];
	totalSupply#157 := totalSupply#157[__this := 0];
	winner_tmstmp38#159 := winner_tmstmp38#159[__this := 0];
	balances#185 := balances#185[__this := default_address_t_int()];
	allowed#238 := allowed#238[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp27#310 := winner_tmstmp27#310[__this := 0];
	winner_tmstmp31#399 := winner_tmstmp31#399[__this := 0];
	bugv_tmstmp5#488 := bugv_tmstmp5#488[__this := __block_timestamp];
	bugv_tmstmp3#493 := bugv_tmstmp3#493[__this := __block_timestamp];
	bugv_tmstmp4#505 := bugv_tmstmp4#505[__this := __block_timestamp];
	// Function body starts here
	initialOwner#637 := address_0xac775cD446889ac167da466692449ece5439fc12;
	totalSupply#157 := totalSupply#157[__this := 180000000000];
	balances#185 := balances#185[__this := balances#185[__this][initialOwner#637 := totalSupply#157[__this]]];
	call_arg#11 := 0;
	assume {:sourceloc "buggy_32.sol", 200, 14} {:message ""} true;
	call Transfer#501(__this, __msg_sender, __msg_value, call_arg#11, initialOwner#637, balances#185[__this][initialOwner#637]);
	$return18:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_32.sol", 202, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#668: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 207, 5} {:message "AsseteGram::[fallback]"} #676(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return19:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_32.sol", 210, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#680: [address_t]int;
