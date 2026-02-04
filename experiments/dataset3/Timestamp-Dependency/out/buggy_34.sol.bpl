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
procedure {:inline 1} {:sourceloc "buggy_34.sol", 21, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#60(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#56: address_t, _to#58: address_t)
{
	
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp28 : function ()
procedure {:sourceloc "buggy_34.sol", 9, 2} {:message "Ownable::bug_tmstmp28"} bug_tmstmp28#48(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 10, 2} {:message "pastBlockTime_tmstmp28"} pastBlockTime_tmstmp28#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp28#5 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp28#5);
	pastBlockTime_tmstmp28#5 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 15, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return0:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_34.sol", 18, 3} {:message "owner"} owner#50: [address_t]address_t;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_34.sol", 20, 2} {:message "bugv_tmstmp2"} bugv_tmstmp2#54: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 23, 4} {:message "Ownable::[constructor]"} __constructor#139(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#50 := owner#50[__this := 0];
	bugv_tmstmp2#54 := bugv_tmstmp2#54[__this := __block_timestamp];
	winner_tmstmp3#74 := winner_tmstmp3#74[__this := 0];
	bugv_tmstmp5#115 := bugv_tmstmp5#115[__this := __block_timestamp];
	// Function body starts here
	owner#50 := owner#50[__this := __msg_sender];
	$return1:
	// Function body ends here
}

// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_34.sol", 26, 1} {:message "winner_tmstmp3"} winner_tmstmp3#74: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 27, 1} {:message "Ownable::play_tmstmp3"} play_tmstmp3#100(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#76: int)
{
	var {:sourceloc "buggy_34.sol", 28, 2} {:message "_vtime"} _vtime#80: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#80 := __block_timestamp;
	if (((startTime#76 + 432000) == _vtime#80)) {
	winner_tmstmp3#74 := winner_tmstmp3#74[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_34.sol", 36, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#115: [address_t]int;
// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_34.sol", 38, 4} {:message "Ownable::transferOwnership"} transferOwnership#127(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#117: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#50[__this]);
	// Function body starts here
	owner#50 := owner#50[__this := _newOwner#117];
	$return4:
	// Function body ends here
	$return3:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 41, 1} {:message "Ownable::bug_tmstmp9"} bug_tmstmp9#138(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#130: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#130 := (__block_timestamp >= 1546300800);
	goto $return5;
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
procedure {:inline 1} {:sourceloc "buggy_34.sol", 57, 5} {:message "SafeMath::add"} add#165(__this: address_t, __msg_sender: address_t, __msg_value: int, a#142: int, b#144: int)
	returns (#147: int)
{
	var {:sourceloc "buggy_34.sol", 58, 9} {:message "c"} c#150: int;
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#150 := (a#142 + b#144);
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#150 >= a#142);
	#147 := c#150;
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 73, 5} {:message "SafeMath::sub"} sub#191(__this: address_t, __msg_sender: address_t, __msg_value: int, a#168: int, b#170: int)
	returns (#173: int)
{
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 75, 9} {:message "c"} c#183: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#170 <= a#168);
	c#183 := (a#168 - b#170);
	#173 := c#183;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 89, 5} {:message "SafeMath::mul"} mul#226(__this: address_t, __msg_sender: address_t, __msg_value: int, a#194: int, b#196: int)
	returns (#199: int)
{
	var {:sourceloc "buggy_34.sol", 97, 9} {:message "c"} c#209: int;
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#194 == 0)) {
	#199 := 0;
	goto $return8;
	}

	c#209 := (a#194 * b#196);
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#209 div a#194) == b#196);
	#199 := c#209;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 114, 5} {:message "SafeMath::div"} div#252(__this: address_t, __msg_sender: address_t, __msg_value: int, a#229: int, b#231: int)
	returns (#234: int)
{
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 117, 9} {:message "c"} c#244: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#231 > 0);
	c#244 := (a#229 div b#231);
	#234 := c#244;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 134, 5} {:message "SafeMath::mod"} mod#274(__this: address_t, __msg_sender: address_t, __msg_value: int, a#255: int, b#257: int)
	returns (#260: int)
{
	var call_arg#10: int_arr_ptr;
	var new_array#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#10 := new_array#11;
	mem_arr_int := mem_arr_int[call_arg#10 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume (b#257 != 0);
	#260 := (a#255 mod b#257);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_34.sol", 47, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#275(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: LollypopToken -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_34.sol", 335, 3} {:message "[event] LollypopToken::Transfer"} Transfer#1003(__this: address_t, __msg_sender: address_t, __msg_value: int, from#997: address_t, to#999: address_t, value#1001: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_34.sol", 342, 3} {:message "[event] LollypopToken::Approval"} Approval#1016(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1010: address_t, spender#1012: address_t, value#1014: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: winner_tmstmp34: address
var {:sourceloc "buggy_34.sol", 143, 3} {:message "winner_tmstmp34"} winner_tmstmp34#282: [address_t]address_t;
// 
// Function: play_tmstmp34 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 144, 1} {:message "LollypopToken::play_tmstmp34"} play_tmstmp34#304(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#284: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#284 + 432000) == __block_timestamp)) {
	winner_tmstmp34#282 := winner_tmstmp34#282[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => struct LollypopToken.transferMapping storage ref)
type {:datatype} struct_storage_transferMapping#532;
var {:sourceloc "buggy_34.sol", 147, 3} {:message "_balances"} _balances#308: [address_t][address_t]struct_storage_transferMapping#532;
// 
// Function: bug_tmstmp21 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 149, 3} {:message "LollypopToken::bug_tmstmp21"} bug_tmstmp21#319(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#311: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#311 := (__block_timestamp >= 1546300800);
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_34.sol", 152, 3} {:message "_allowances"} _allowances#325: [address_t][address_t][address_t]int;
// 
// State variable: winner_tmstmp10: address
var {:sourceloc "buggy_34.sol", 154, 3} {:message "winner_tmstmp10"} winner_tmstmp10#327: [address_t]address_t;
// 
// Function: play_tmstmp10 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 155, 1} {:message "LollypopToken::play_tmstmp10"} play_tmstmp10#349(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#329: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#329 + 432000) == __block_timestamp)) {
	winner_tmstmp10#327 := winner_tmstmp10#327[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_34.sol", 158, 3} {:message "_totalSupply"} _totalSupply#351: [address_t]int;
// 
// State variable: winner_tmstmp22: address
var {:sourceloc "buggy_34.sol", 159, 3} {:message "winner_tmstmp22"} winner_tmstmp22#353: [address_t]address_t;
// 
// Function: play_tmstmp22 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 160, 1} {:message "LollypopToken::play_tmstmp22"} play_tmstmp22#375(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#355: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#355 + 432000) == __block_timestamp)) {
	winner_tmstmp22#353 := winner_tmstmp22#353[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: _maxTotalSupply: uint256
var {:sourceloc "buggy_34.sol", 163, 3} {:message "_maxTotalSupply"} _maxTotalSupply#377: [address_t]int;
// 
// Function: bug_tmstmp12 : function ()
procedure {:sourceloc "buggy_34.sol", 166, 3} {:message "LollypopToken::bug_tmstmp12"} bug_tmstmp12#424(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 167, 2} {:message "pastBlockTime_tmstmp12"} pastBlockTime_tmstmp12#381: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp12#381 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp12#381);
	pastBlockTime_tmstmp12#381 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 172, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return15:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_34.sol", 175, 3} {:message "_name"} _name#427: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_34.sol", 176, 3} {:message "winner_tmstmp11"} winner_tmstmp11#429: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 177, 1} {:message "LollypopToken::play_tmstmp11"} play_tmstmp11#455(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#431: int)
{
	var {:sourceloc "buggy_34.sol", 178, 2} {:message "_vtime"} _vtime#435: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#435 := __block_timestamp;
	if (((startTime#431 + 432000) == _vtime#435)) {
	winner_tmstmp11#429 := winner_tmstmp11#429[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_34.sol", 181, 3} {:message "_symbol"} _symbol#458: [address_t]int_arr_type;
// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 182, 3} {:message "LollypopToken::bug_tmstmp1"} bug_tmstmp1#469(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#461: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#461 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_34.sol", 185, 3} {:message "_decimals"} _decimals#472: [address_t]int;
// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_34.sol", 187, 3} {:message "winner_tmstmp2"} winner_tmstmp2#474: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 188, 1} {:message "LollypopToken::play_tmstmp2"} play_tmstmp2#496(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#476: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#476 + 432000) == __block_timestamp)) {
	winner_tmstmp2#474 := winner_tmstmp2#474[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// State variable: maxAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 191, 3} {:message "maxAgeOfToken"} maxAgeOfToken#499: [address_t]int;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 192, 3} {:message "LollypopToken::bug_tmstmp17"} bug_tmstmp17#510(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#502: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#502 := (__block_timestamp >= 1546300800);
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: minAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 195, 3} {:message "minAgeOfToken"} minAgeOfToken#513: [address_t]int;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 196, 3} {:message "LollypopToken::bug_tmstmp37"} bug_tmstmp37#524(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#516: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#516 := (__block_timestamp >= 1546300800);
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: perDayBonus: uint256
var {:sourceloc "buggy_34.sol", 199, 3} {:message "perDayBonus"} perDayBonus#527: [address_t]int;
// 
// ------- Struct transferMapping -------
// Storage
function {:constructor} transferMapping#532#constr(amount#529: int, time#531: int) returns (struct_storage_transferMapping#532);
// Memory
type address_struct_memory_transferMapping#532 = int;
// Member amount
var {:sourceloc "buggy_34.sol", 202, 9} {:message "amount"} amount#529: [address_struct_memory_transferMapping#532]int;
// Member time
var {:sourceloc "buggy_34.sol", 203, 9} {:message "time"} time#531: [address_struct_memory_transferMapping#532]int;
// 
// ------- End of struct transferMapping -------
function {:builtin "((as const (Array Int |T@struct_storage_transferMapping#532|)) (|transferMapping#532#constr| 0 0))"} default_address_t_struct_storage_transferMapping#532() returns ([address_t]struct_storage_transferMapping#532);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 207, 5} {:message "LollypopToken::[constructor]"} __constructor#1838(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp34#282 := winner_tmstmp34#282[__this := 0];
	_balances#308 := _balances#308[__this := default_address_t_struct_storage_transferMapping#532()];
	_allowances#325 := _allowances#325[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp10#327 := winner_tmstmp10#327[__this := 0];
	_totalSupply#351 := _totalSupply#351[__this := 0];
	winner_tmstmp22#353 := winner_tmstmp22#353[__this := 0];
	_maxTotalSupply#377 := _maxTotalSupply#377[__this := 0];
	_name#427 := _name#427[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121][5 := 112][6 := 111][7 := 112], 8)];
	winner_tmstmp11#429 := winner_tmstmp11#429[__this := 0];
	_symbol#458 := _symbol#458[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121], 5)];
	_decimals#472 := _decimals#472[__this := 18];
	winner_tmstmp2#474 := winner_tmstmp2#474[__this := 0];
	maxAgeOfToken#499 := maxAgeOfToken#499[__this := 31536000];
	minAgeOfToken#513 := minAgeOfToken#513[__this := 86400];
	perDayBonus#527 := perDayBonus#527[__this := 100];
	winner_tmstmp19#620 := winner_tmstmp19#620[__this := 0];
	winner_tmstmp26#800 := winner_tmstmp26#800[__this := 0];
	winner_tmstmp38#945 := winner_tmstmp38#945[__this := 0];
	bugv_tmstmp1#990 := bugv_tmstmp1#990[__this := __block_timestamp];
	bugv_tmstmp3#995 := bugv_tmstmp3#995[__this := __block_timestamp];
	bugv_tmstmp4#1008 := bugv_tmstmp4#1008[__this := __block_timestamp];
	winner_tmstmp7#1122 := winner_tmstmp7#1122[__this := 0];
	winner_tmstmp23#1164 := winner_tmstmp23#1164[__this := 0];
	winner_tmstmp14#1205 := winner_tmstmp14#1205[__this := 0];
	winner_tmstmp30#1249 := winner_tmstmp30#1249[__this := 0];
	winner_tmstmp39#1377 := winner_tmstmp39#1377[__this := 0];
	winner_tmstmp35#1508 := winner_tmstmp35#1508[__this := 0];
	winner_tmstmp27#1698 := winner_tmstmp27#1698[__this := 0];
	winner_tmstmp31#1771 := winner_tmstmp31#1771[__this := 0];
	owner#50 := owner#50[__this := 0];
	bugv_tmstmp2#54 := bugv_tmstmp2#54[__this := __block_timestamp];
	winner_tmstmp3#74 := winner_tmstmp3#74[__this := 0];
	bugv_tmstmp5#115 := bugv_tmstmp5#115[__this := __block_timestamp];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#50 := owner#50[__this := __msg_sender];
	$return21:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	_maxTotalSupply#377 := _maxTotalSupply#377[__this := 1000000000000000000000000000];
	_totalSupply#351 := _totalSupply#351[__this := 2000000000000000000000000];
	_balances#308 := _balances#308[__this := _balances#308[__this][__msg_sender := transferMapping#532#constr(_totalSupply#351[__this], time#531#transferMapping#532#constr(_balances#308[__this][__msg_sender]))]];
	_balances#308 := _balances#308[__this := _balances#308[__this][__msg_sender := transferMapping#532#constr(amount#529#transferMapping#532#constr(_balances#308[__this][__msg_sender]), __block_timestamp)]];
	$return22:
	// Function body ends here
}

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 215, 1} {:message "LollypopToken::bug_tmstmp25"} bug_tmstmp25#580(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#572: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#572 := (__block_timestamp >= 1546300800);
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: calculateBonus : function (uint256,uint256) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 219, 5} {:message "LollypopToken::calculateBonus"} calculateBonus#618(__this: address_t, __msg_sender: address_t, __msg_value: int, timeElasped#582: int, amount#584: int)
	returns (#587: int)
{
	var {:sourceloc "buggy_34.sol", 220, 9} {:message "totalDays"} totalDays#590: int;
	var div#252_ret#13: int;
	var {:sourceloc "buggy_34.sol", 224, 9} {:message "totalBonus"} totalBonus#606: int;
	var div#252_ret#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 220, 29} {:message ""} true;
	call div#252_ret#13 := div#252(__this, __msg_sender, __msg_value, timeElasped#582, minAgeOfToken#513[__this]);
	totalDays#590 := div#252_ret#13;
	if ((totalDays#590 > maxAgeOfToken#499[__this])) {
	totalDays#590 := maxAgeOfToken#499[__this];
	}

	assume {:sourceloc "buggy_34.sol", 224, 30} {:message ""} true;
	call div#252_ret#14 := div#252(__this, __msg_sender, __msg_value, (totalDays#590 * amount#584), perDayBonus#527[__this]);
	totalBonus#606 := div#252_ret#14;
	#587 := totalBonus#606;
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_34.sol", 228, 1} {:message "winner_tmstmp19"} winner_tmstmp19#620: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 229, 1} {:message "LollypopToken::play_tmstmp19"} play_tmstmp19#646(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#622: int)
{
	var {:sourceloc "buggy_34.sol", 230, 2} {:message "_vtime"} _vtime#626: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#626 := __block_timestamp;
	if (((startTime#622 + 432000) == _vtime#626)) {
	winner_tmstmp19#620 := winner_tmstmp19#620[__this := __msg_sender];
	}

	$return25:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 235, 5} {:message "LollypopToken::_transfer"} _transfer#798(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#648: address_t, recipient#650: address_t, amount#652: int)
{
	var call_arg#15: int_arr_ptr;
	var new_array#16: int_arr_ptr;
	var call_arg#17: int_arr_ptr;
	var new_array#18: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 239, 9} {:message "senderTimeElasped"} senderTimeElasped#676: int;
	var {:sourceloc "buggy_34.sol", 240, 9} {:message "recipientTimeElasped"} recipientTimeElasped#687: int;
	var {:sourceloc "buggy_34.sol", 243, 13} {:message "bonus"} bonus#706: int;
	var balanceOf#1162_ret#19: int;
	var calculateBonus#618_ret#20: int;
	var {:sourceloc "buggy_34.sol", 248, 14} {:message "bonus"} bonus#734: int;
	var balanceOf#1162_ret#21: int;
	var calculateBonus#618_ret#22: int;
	var sub#191_ret#23: int;
	var add#165_ret#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#16 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#15 := new_array#16;
	mem_arr_int := mem_arr_int[call_arg#15 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#648 != 0);
	new_array#18 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#17 := new_array#18;
	mem_arr_int := mem_arr_int[call_arg#17 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#650 != 0);
	senderTimeElasped#676 := (__block_timestamp - time#531#transferMapping#532#constr(_balances#308[__this][sender#648]));
	recipientTimeElasped#687 := (__block_timestamp - time#531#transferMapping#532#constr(_balances#308[__this][recipient#650]));
	if (((senderTimeElasped#676 >= minAgeOfToken#513[__this]) && (_totalSupply#351[__this] < _maxTotalSupply#377[__this]))) {
	assume {:sourceloc "buggy_34.sol", 243, 64} {:message ""} true;
	call balanceOf#1162_ret#19 := balanceOf#1162(__this, __msg_sender, __msg_value, sender#648);
	assume {:sourceloc "buggy_34.sol", 243, 29} {:message ""} true;
	call calculateBonus#618_ret#20 := calculateBonus#618(__this, __msg_sender, __msg_value, senderTimeElasped#676, balanceOf#1162_ret#19);
	bonus#706 := calculateBonus#618_ret#20;
	assume {:sourceloc "buggy_34.sol", 244, 13} {:message ""} true;
	call mint#1064(__this, __msg_sender, __msg_value, sender#648, bonus#706);
	}

	if ((((recipientTimeElasped#687 >= minAgeOfToken#513[__this]) && (_totalSupply#351[__this] < _maxTotalSupply#377[__this])) && (sender#648 != recipient#650))) {
	assume {:sourceloc "buggy_34.sol", 248, 68} {:message ""} true;
	call balanceOf#1162_ret#21 := balanceOf#1162(__this, __msg_sender, __msg_value, recipient#650);
	assume {:sourceloc "buggy_34.sol", 248, 30} {:message ""} true;
	call calculateBonus#618_ret#22 := calculateBonus#618(__this, __msg_sender, __msg_value, recipientTimeElasped#687, balanceOf#1162_ret#21);
	bonus#734 := calculateBonus#618_ret#22;
	assume {:sourceloc "buggy_34.sol", 249, 14} {:message ""} true;
	call mint#1064(__this, __msg_sender, __msg_value, recipient#650, bonus#734);
	}

	assume {:sourceloc "buggy_34.sol", 253, 36} {:message ""} true;
	call sub#191_ret#23 := sub#191(__this, __msg_sender, __msg_value, amount#529#transferMapping#532#constr(_balances#308[__this][sender#648]), amount#652);
	_balances#308 := _balances#308[__this := _balances#308[__this][sender#648 := transferMapping#532#constr(sub#191_ret#23, time#531#transferMapping#532#constr(_balances#308[__this][sender#648]))]];
	assume {:sourceloc "buggy_34.sol", 254, 39} {:message ""} true;
	call add#165_ret#24 := add#165(__this, __msg_sender, __msg_value, amount#529#transferMapping#532#constr(_balances#308[__this][recipient#650]), amount#652);
	_balances#308 := _balances#308[__this := _balances#308[__this][recipient#650 := transferMapping#532#constr(add#165_ret#24, time#531#transferMapping#532#constr(_balances#308[__this][recipient#650]))]];
	_balances#308 := _balances#308[__this := _balances#308[__this][sender#648 := transferMapping#532#constr(amount#529#transferMapping#532#constr(_balances#308[__this][sender#648]), __block_timestamp)]];
	_balances#308 := _balances#308[__this := _balances#308[__this][recipient#650 := transferMapping#532#constr(amount#529#transferMapping#532#constr(_balances#308[__this][recipient#650]), __block_timestamp)]];
	assume {:sourceloc "buggy_34.sol", 259, 14} {:message ""} true;
	call Transfer#1003(__this, __msg_sender, __msg_value, sender#648, recipient#650, amount#652);
	$return26:
	// Function body ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_34.sol", 263, 1} {:message "winner_tmstmp26"} winner_tmstmp26#800: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 264, 1} {:message "LollypopToken::play_tmstmp26"} play_tmstmp26#822(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#802: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#802 + 432000) == __block_timestamp)) {
	winner_tmstmp26#800 := winner_tmstmp26#800[__this := __msg_sender];
	}

	$return27:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 272, 5} {:message "LollypopToken::name"} name#831(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#826: int_arr_ptr)
{
	var new_array#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#826 := new_array#25;
	mem_arr_int := mem_arr_int[#826 := _name#427[__this]];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_34.sol", 275, 1} {:message "LollypopToken::bug_tmstmp20"} bug_tmstmp20#878(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 276, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#835: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#835 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#835);
	pastBlockTime_tmstmp20#835 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 281, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return29:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 289, 5} {:message "LollypopToken::symbol"} symbol#887(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#882: int_arr_ptr)
{
	var new_array#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#26 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#882 := new_array#26;
	mem_arr_int := mem_arr_int[#882 := _symbol#458[__this]];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_34.sol", 292, 1} {:message "LollypopToken::bug_tmstmp32"} bug_tmstmp32#934(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 293, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#891: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#891 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#891);
	pastBlockTime_tmstmp32#891 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 298, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return31:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_34.sol", 314, 5} {:message "LollypopToken::decimals"} decimals#943(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#938: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#938 := _decimals#472[__this];
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_34.sol", 317, 1} {:message "winner_tmstmp38"} winner_tmstmp38#945: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 318, 1} {:message "LollypopToken::play_tmstmp38"} play_tmstmp38#967(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#947: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#947 + 432000) == __block_timestamp)) {
	winner_tmstmp38#945 := winner_tmstmp38#945[__this := __msg_sender];
	}

	$return33:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_34.sol", 326, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#990: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_34.sol", 334, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#995: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_34.sol", 341, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#1008: [address_t]int;
// 
// Function: mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 356, 5} {:message "LollypopToken::mint"} mint#1064(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1019: address_t, amount#1021: int)
{
	var call_arg#27: int_arr_ptr;
	var new_array#28: int_arr_ptr;
	var add#165_ret#29: int;
	var add#165_ret#30: int;
	var call_arg#31: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#28 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#27 := new_array#28;
	mem_arr_int := mem_arr_int[call_arg#27 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#1019 != 0);
	assume {:sourceloc "buggy_34.sol", 359, 24} {:message ""} true;
	call add#165_ret#29 := add#165(__this, __msg_sender, __msg_value, _totalSupply#351[__this], amount#1021);
	_totalSupply#351 := _totalSupply#351[__this := add#165_ret#29];
	assume {:sourceloc "buggy_34.sol", 360, 37} {:message ""} true;
	call add#165_ret#30 := add#165(__this, __msg_sender, __msg_value, amount#529#transferMapping#532#constr(_balances#308[__this][account#1019]), amount#1021);
	_balances#308 := _balances#308[__this := _balances#308[__this][account#1019 := transferMapping#532#constr(add#165_ret#30, time#531#transferMapping#532#constr(_balances#308[__this][account#1019]))]];
	call_arg#31 := 0;
	assume {:sourceloc "buggy_34.sol", 361, 14} {:message ""} true;
	call Transfer#1003(__this, __msg_sender, __msg_value, call_arg#31, account#1019, amount#1021);
	$return34:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_34.sol", 363, 1} {:message "LollypopToken::bug_tmstmp4"} bug_tmstmp4#1111(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 364, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#1068: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#1068 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#1068);
	pastBlockTime_tmstmp4#1068 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 369, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return35:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 378, 5} {:message "LollypopToken::totalSupply"} totalSupply#1120(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1115: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1115 := _totalSupply#351[__this];
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_34.sol", 381, 1} {:message "winner_tmstmp7"} winner_tmstmp7#1122: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 382, 1} {:message "LollypopToken::play_tmstmp7"} play_tmstmp7#1148(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1124: int)
{
	var {:sourceloc "buggy_34.sol", 383, 2} {:message "_vtime"} _vtime#1128: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1128 := __block_timestamp;
	if (((startTime#1124 + 432000) == _vtime#1128)) {
	winner_tmstmp7#1122 := winner_tmstmp7#1122[__this := __msg_sender];
	}

	$return37:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 390, 5} {:message "LollypopToken::balanceOf"} balanceOf#1162(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1151: address_t)
	returns (#1154: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1154 := amount#529#transferMapping#532#constr(_balances#308[__this][account#1151]);
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_34.sol", 393, 1} {:message "winner_tmstmp23"} winner_tmstmp23#1164: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 394, 1} {:message "LollypopToken::play_tmstmp23"} play_tmstmp23#1190(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1166: int)
{
	var {:sourceloc "buggy_34.sol", 395, 2} {:message "_vtime"} _vtime#1170: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1170 := __block_timestamp;
	if (((startTime#1166 + 432000) == _vtime#1170)) {
	winner_tmstmp23#1164 := winner_tmstmp23#1164[__this := __msg_sender];
	}

	$return39:
	// Function body ends here
}

// 
// Function: timeOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 400, 2} {:message "LollypopToken::timeOf"} timeOf#1203(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1192: address_t)
	returns (#1195: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1195 := time#531#transferMapping#532#constr(_balances#308[__this][account#1192]);
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_34.sol", 403, 1} {:message "winner_tmstmp14"} winner_tmstmp14#1205: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 404, 1} {:message "LollypopToken::play_tmstmp14"} play_tmstmp14#1227(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1207: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1207 + 432000) == __block_timestamp)) {
	winner_tmstmp14#1205 := winner_tmstmp14#1205[__this := __msg_sender];
	}

	$return41:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 416, 5} {:message "LollypopToken::transfer"} transfer#1247(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#1230: address_t, amount#1232: int)
	returns (#1235: bool)
{
	var call_arg#32: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#32 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 417, 9} {:message ""} true;
	call _transfer#798(__this, __msg_sender, __msg_value, call_arg#32, recipient#1230, amount#1232);
	#1235 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_34.sol", 420, 1} {:message "winner_tmstmp30"} winner_tmstmp30#1249: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 421, 1} {:message "LollypopToken::play_tmstmp30"} play_tmstmp30#1271(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1251: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1251 + 432000) == __block_timestamp)) {
	winner_tmstmp30#1249 := winner_tmstmp30#1249[__this := __msg_sender];
	}

	$return43:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_34.sol", 425, 3} {:message "LollypopToken::multiTransfer"} multiTransfer#1311(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1274: address_t_arr_ptr, amounts#1277: int_arr_ptr)
{
	var {:sourceloc "buggy_34.sol", 427, 10} {:message "i"} i#1289: int;
	var transfer#1247_ret#35: bool;
	var tmp#36: int;
	// TCC assumptions
	assume (receivers#1274 < __alloc_counter);
	assume (amounts#1277 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1274])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1274]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[amounts#1277])) && (length#int_arr#constr(mem_arr_int[amounts#1277]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[receivers#1274]) == length#int_arr#constr(mem_arr_int[amounts#1277]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#1289 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1274])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1274]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1289 < length#address_t_arr#constr(mem_arr_address_t[receivers#1274]))) {
	// Body
	assume {:sourceloc "buggy_34.sol", 428, 7} {:message ""} true;
	call transfer#1247_ret#35 := transfer#1247(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1274])[i#1289], arr#int_arr#constr(mem_arr_int[amounts#1277])[i#1289]);
	$continue33:
	// Loop expression
	tmp#36 := i#1289;
	i#1289 := (i#1289 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1274])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1274]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break34:
	$return44:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_34.sol", 431, 1} {:message "LollypopToken::bug_tmstmp8"} bug_tmstmp8#1358(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 432, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#1315: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#1315 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#1315);
	pastBlockTime_tmstmp8#1315 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 437, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return45:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 445, 5} {:message "LollypopToken::allowance"} allowance#1375(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1361: address_t, spender#1363: address_t)
	returns (#1366: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1366 := _allowances#325[__this][owner#1361][spender#1363];
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_34.sol", 448, 1} {:message "winner_tmstmp39"} winner_tmstmp39#1377: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 449, 1} {:message "LollypopToken::play_tmstmp39"} play_tmstmp39#1403(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1379: int)
{
	var {:sourceloc "buggy_34.sol", 450, 2} {:message "_vtime"} _vtime#1383: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1383 := __block_timestamp;
	if (((startTime#1379 + 432000) == _vtime#1383)) {
	winner_tmstmp39#1377 := winner_tmstmp39#1377[__this := __msg_sender];
	}

	$return47:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 461, 5} {:message "LollypopToken::approve"} approve#1423(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1406: address_t, value#1408: int)
	returns (#1411: bool)
{
	var call_arg#37: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#37 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 462, 9} {:message ""} true;
	call _approve#1769(__this, __msg_sender, __msg_value, call_arg#37, spender#1406, value#1408);
	#1411 := true;
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_34.sol", 465, 1} {:message "LollypopToken::bug_tmstmp36"} bug_tmstmp36#1470(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 466, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#1427: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#1427 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#1427);
	pastBlockTime_tmstmp36#1427 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 471, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return49:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 487, 5} {:message "LollypopToken::transferFrom"} transferFrom#1506(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#1473: address_t, recipient#1475: address_t, amount#1477: int)
	returns (#1480: bool)
{
	var call_arg#38: address_t;
	var sub#191_ret#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 488, 9} {:message ""} true;
	call _transfer#798(__this, __msg_sender, __msg_value, sender#1473, recipient#1475, amount#1477);
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 489, 38} {:message ""} true;
	call sub#191_ret#39 := sub#191(__this, __msg_sender, __msg_value, _allowances#325[__this][sender#1473][__msg_sender], amount#1477);
	assume {:sourceloc "buggy_34.sol", 489, 9} {:message ""} true;
	call _approve#1769(__this, __msg_sender, __msg_value, sender#1473, call_arg#38, sub#191_ret#39);
	#1480 := true;
	goto $return50;
	$return50:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_34.sol", 492, 1} {:message "winner_tmstmp35"} winner_tmstmp35#1508: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 493, 1} {:message "LollypopToken::play_tmstmp35"} play_tmstmp35#1534(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1510: int)
{
	var {:sourceloc "buggy_34.sol", 494, 2} {:message "_vtime"} _vtime#1514: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1514 := __block_timestamp;
	if (((startTime#1510 + 432000) == _vtime#1514)) {
	winner_tmstmp35#1508 := winner_tmstmp35#1508[__this := __msg_sender];
	}

	$return51:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 510, 5} {:message "LollypopToken::increaseAllowance"} increaseAllowance#1562(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1537: address_t, addedValue#1539: int)
	returns (#1542: bool)
{
	var call_arg#40: address_t;
	var add#165_ret#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 511, 39} {:message ""} true;
	call add#165_ret#41 := add#165(__this, __msg_sender, __msg_value, _allowances#325[__this][__msg_sender][spender#1537], addedValue#1539);
	assume {:sourceloc "buggy_34.sol", 511, 9} {:message ""} true;
	call _approve#1769(__this, __msg_sender, __msg_value, call_arg#40, spender#1537, add#165_ret#41);
	#1542 := true;
	goto $return52;
	$return52:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_34.sol", 514, 1} {:message "LollypopToken::bug_tmstmp40"} bug_tmstmp40#1609(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 515, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1566: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1566 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1566);
	pastBlockTime_tmstmp40#1566 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_34.sol", 520, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return53:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 538, 5} {:message "LollypopToken::decreaseAllowance"} decreaseAllowance#1637(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1612: address_t, subtractedValue#1614: int)
	returns (#1617: bool)
{
	var call_arg#42: address_t;
	var sub#191_ret#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#42 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 539, 39} {:message ""} true;
	call sub#191_ret#43 := sub#191(__this, __msg_sender, __msg_value, _allowances#325[__this][__msg_sender][spender#1612], subtractedValue#1614);
	assume {:sourceloc "buggy_34.sol", 539, 9} {:message ""} true;
	call _approve#1769(__this, __msg_sender, __msg_value, call_arg#42, spender#1612, sub#191_ret#43);
	#1617 := true;
	goto $return54;
	$return54:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 542, 1} {:message "LollypopToken::bug_tmstmp33"} bug_tmstmp33#1648(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1640: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1640 := (__block_timestamp >= 1546300800);
	goto $return55;
	$return55:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 575, 5} {:message "LollypopToken::_burn"} _burn#1696(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1651: address_t, value#1653: int)
{
	var call_arg#44: int_arr_ptr;
	var new_array#45: int_arr_ptr;
	var sub#191_ret#46: int;
	var sub#191_ret#47: int;
	var call_arg#48: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#45 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#44 := new_array#45;
	mem_arr_int := mem_arr_int[call_arg#44 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#1651 != 0);
	assume {:sourceloc "buggy_34.sol", 578, 24} {:message ""} true;
	call sub#191_ret#46 := sub#191(__this, __msg_sender, __msg_value, _totalSupply#351[__this], value#1653);
	_totalSupply#351 := _totalSupply#351[__this := sub#191_ret#46];
	assume {:sourceloc "buggy_34.sol", 579, 37} {:message ""} true;
	call sub#191_ret#47 := sub#191(__this, __msg_sender, __msg_value, amount#529#transferMapping#532#constr(_balances#308[__this][account#1651]), value#1653);
	_balances#308 := _balances#308[__this := _balances#308[__this][account#1651 := transferMapping#532#constr(sub#191_ret#47, time#531#transferMapping#532#constr(_balances#308[__this][account#1651]))]];
	call_arg#48 := 0;
	assume {:sourceloc "buggy_34.sol", 580, 14} {:message ""} true;
	call Transfer#1003(__this, __msg_sender, __msg_value, account#1651, call_arg#48, value#1653);
	$return56:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_34.sol", 582, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1698: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 583, 1} {:message "LollypopToken::play_tmstmp27"} play_tmstmp27#1724(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1700: int)
{
	var {:sourceloc "buggy_34.sol", 584, 2} {:message "_vtime"} _vtime#1704: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1704 := __block_timestamp;
	if (((startTime#1700 + 432000) == _vtime#1704)) {
	winner_tmstmp27#1698 := winner_tmstmp27#1698[__this := __msg_sender];
	}

	$return57:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 601, 5} {:message "LollypopToken::_approve"} _approve#1769(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1727: address_t, spender#1729: address_t, value#1731: int)
{
	var call_arg#49: int_arr_ptr;
	var new_array#50: int_arr_ptr;
	var call_arg#51: int_arr_ptr;
	var new_array#52: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#50 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#49 := new_array#50;
	mem_arr_int := mem_arr_int[call_arg#49 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#1727 != 0);
	new_array#52 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#51 := new_array#52;
	mem_arr_int := mem_arr_int[call_arg#51 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#1729 != 0);
	_allowances#325 := _allowances#325[__this := _allowances#325[__this][owner#1727 := _allowances#325[__this][owner#1727][spender#1729 := value#1731]]];
	assume {:sourceloc "buggy_34.sol", 606, 14} {:message ""} true;
	call Approval#1016(__this, __msg_sender, __msg_value, owner#1727, spender#1729, value#1731);
	$return58:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_34.sol", 608, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1771: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 609, 1} {:message "LollypopToken::play_tmstmp31"} play_tmstmp31#1797(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1773: int)
{
	var {:sourceloc "buggy_34.sol", 610, 2} {:message "_vtime"} _vtime#1777: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1777 := __block_timestamp;
	if (((startTime#1773 + 432000) == _vtime#1777)) {
	winner_tmstmp31#1771 := winner_tmstmp31#1771[__this := __msg_sender];
	}

	$return59:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 620, 5} {:message "LollypopToken::_burnFrom"} _burnFrom#1826(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1800: address_t, amount#1802: int)
{
	var call_arg#53: address_t;
	var sub#191_ret#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 621, 9} {:message ""} true;
	call _burn#1696(__this, __msg_sender, __msg_value, account#1800, amount#1802);
	call_arg#53 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 622, 39} {:message ""} true;
	call sub#191_ret#54 := sub#191(__this, __msg_sender, __msg_value, _allowances#325[__this][account#1800][__msg_sender], amount#1802);
	assume {:sourceloc "buggy_34.sol", 622, 9} {:message ""} true;
	call _approve#1769(__this, __msg_sender, __msg_value, account#1800, call_arg#53, sub#191_ret#54);
	$return60:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_34.sol", 624, 1} {:message "LollypopToken::bug_tmstmp13"} bug_tmstmp13#1837(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1829: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1829 := (__block_timestamp >= 1546300800);
	goto $return61;
	$return61:
	// Function body ends here
}

