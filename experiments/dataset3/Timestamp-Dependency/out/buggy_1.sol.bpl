// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_1.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: EIP20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_1.sol", 75, 3} {:message "[event] EIP20Interface::Transfer"} Transfer#227(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#221: address_t, _to#223: address_t, _value#225: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_1.sol", 77, 3} {:message "[event] EIP20Interface::Approval"} Approval#239(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#233: address_t, _spender#235: address_t, _value#237: int)
{
	
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_1.sol", 17, 5} {:message "totalSupply"} totalSupply#4: [address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 20, 5} {:message "EIP20Interface::balanceOf"} balanceOf#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#7: address_t)
	returns (balance#10: int);
	modifies totalSupply#4, winner_tmstmp39#14, winner_tmstmp35#111, bugv_tmstmp3#219, bugv_tmstmp4#231;

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_1.sol", 21, 1} {:message "winner_tmstmp39"} winner_tmstmp39#14: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 22, 1} {:message "EIP20Interface::play_tmstmp39"} play_tmstmp39#40(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#16: int)
{
	var {:sourceloc "buggy_1.sol", 23, 2} {:message "_vtime"} _vtime#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#20 := __block_timestamp;
	if (((startTime#16 + 432000) == _vtime#20)) {
	winner_tmstmp39#14 := winner_tmstmp39#14[__this := __msg_sender];
	}

	$return0:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 30, 5} {:message "EIP20Interface::transfer"} transfer#50(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#43: address_t, _value#45: int)
	returns (success#48: bool);
	modifies totalSupply#4, winner_tmstmp39#14, winner_tmstmp35#111, bugv_tmstmp3#219, bugv_tmstmp4#231;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_1.sol", 31, 1} {:message "EIP20Interface::bug_tmstmp36"} bug_tmstmp36#97(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 32, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#54 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#54);
	pastBlockTime_tmstmp36#54 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_1.sol", 37, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return1:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 45, 5} {:message "EIP20Interface::transferFrom"} transferFrom#109(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#100: address_t, _to#102: address_t, _value#104: int)
	returns (success#107: bool);
	modifies totalSupply#4, winner_tmstmp39#14, winner_tmstmp35#111, bugv_tmstmp3#219, bugv_tmstmp4#231;

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_1.sol", 46, 1} {:message "winner_tmstmp35"} winner_tmstmp35#111: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 47, 1} {:message "EIP20Interface::play_tmstmp35"} play_tmstmp35#137(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#113: int)
{
	var {:sourceloc "buggy_1.sol", 48, 2} {:message "_vtime"} _vtime#117: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#117 := __block_timestamp;
	if (((startTime#113 + 432000) == _vtime#117)) {
	winner_tmstmp35#111 := winner_tmstmp35#111[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 55, 5} {:message "EIP20Interface::approve"} approve#147(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#140: address_t, _value#142: int)
	returns (success#145: bool);
	modifies totalSupply#4, winner_tmstmp39#14, winner_tmstmp35#111, bugv_tmstmp3#219, bugv_tmstmp4#231;

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_1.sol", 56, 1} {:message "EIP20Interface::bug_tmstmp40"} bug_tmstmp40#194(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 57, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#151: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#151 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#151);
	pastBlockTime_tmstmp40#151 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_1.sol", 62, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return3:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 68, 5} {:message "EIP20Interface::allowance"} allowance#204(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#197: address_t, _spender#199: address_t)
	returns (remaining#202: int);
	modifies totalSupply#4, winner_tmstmp39#14, winner_tmstmp35#111, bugv_tmstmp3#219, bugv_tmstmp4#231;

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_1.sol", 69, 1} {:message "EIP20Interface::bug_tmstmp33"} bug_tmstmp33#215(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#207: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#207 := (__block_timestamp >= 1546300800);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_1.sol", 74, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#219: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_1.sol", 76, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#231: [address_t]int;
// 
// Default constructor
procedure {:sourceloc "buggy_1.sol", 6, 1} {:message "EIP20Interface::[implicit_constructor]"} __constructor#240(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	totalSupply#4 := totalSupply#4[__this := 0];
	winner_tmstmp39#14 := winner_tmstmp39#14[__this := 0];
	winner_tmstmp35#111 := winner_tmstmp35#111[__this := 0];
	bugv_tmstmp3#219 := bugv_tmstmp3#219[__this := __block_timestamp];
	bugv_tmstmp4#231 := bugv_tmstmp4#231[__this := __block_timestamp];
}

// 
// ------- Contract: HotDollarsToken -------
// Inherits from: EIP20Interface
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_1.sol", 82, 3} {:message "winner_tmstmp7"} winner_tmstmp7#251: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 83, 1} {:message "HotDollarsToken::play_tmstmp7"} play_tmstmp7#277(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#253: int)
{
	var {:sourceloc "buggy_1.sol", 84, 2} {:message "_vtime"} _vtime#257: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#257 := __block_timestamp;
	if (((startTime#253 + 432000) == _vtime#257)) {
	winner_tmstmp7#251 := winner_tmstmp7#251[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 87, 3} {:message "balances"} balances#281: [address_t][address_t]int;
// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_1.sol", 88, 3} {:message "winner_tmstmp23"} winner_tmstmp23#283: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 89, 1} {:message "HotDollarsToken::play_tmstmp23"} play_tmstmp23#309(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#285: int)
{
	var {:sourceloc "buggy_1.sol", 90, 2} {:message "_vtime"} _vtime#289: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#289 := __block_timestamp;
	if (((startTime#285 + 432000) == _vtime#289)) {
	winner_tmstmp23#283 := winner_tmstmp23#283[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_1.sol", 93, 3} {:message "allowed"} allowed#315: [address_t][address_t][address_t]int;
// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_1.sol", 100, 3} {:message "winner_tmstmp14"} winner_tmstmp14#317: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 101, 1} {:message "HotDollarsToken::play_tmstmp14"} play_tmstmp14#339(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#319: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#319 + 432000) == __block_timestamp)) {
	winner_tmstmp14#317 := winner_tmstmp14#317[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_1.sol", 104, 3} {:message "name"} name#341: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_1.sol", 105, 3} {:message "winner_tmstmp30"} winner_tmstmp30#343: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 106, 1} {:message "HotDollarsToken::play_tmstmp30"} play_tmstmp30#365(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#345: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#345 + 432000) == __block_timestamp)) {
	winner_tmstmp30#343 := winner_tmstmp30#343[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_1.sol", 109, 3} {:message "decimals"} decimals#367: [address_t]int;
// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_1.sol", 110, 3} {:message "HotDollarsToken::bug_tmstmp8"} bug_tmstmp8#414(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 111, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#371: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#371 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#371);
	pastBlockTime_tmstmp8#371 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_1.sol", 116, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_1.sol", 119, 3} {:message "symbol"} symbol#416: [address_t]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_1.sol", 121, 5} {:message "HotDollarsToken::[constructor]"} __constructor#694(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp7#251 := winner_tmstmp7#251[__this := 0];
	balances#281 := balances#281[__this := default_address_t_int()];
	winner_tmstmp23#283 := winner_tmstmp23#283[__this := 0];
	allowed#315 := allowed#315[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp14#317 := winner_tmstmp14#317[__this := 0];
	name#341 := name#341[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp30#343 := winner_tmstmp30#343[__this := 0];
	decimals#367 := decimals#367[__this := 0];
	symbol#416 := symbol#416[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp27#447 := winner_tmstmp27#447[__this := 0];
	winner_tmstmp31#517 := winner_tmstmp31#517[__this := 0];
	bugv_tmstmp5#639 := bugv_tmstmp5#639[__this := __block_timestamp];
	bugv_tmstmp1#672 := bugv_tmstmp1#672[__this := __block_timestamp];
	bugv_tmstmp2#693 := bugv_tmstmp2#693[__this := __block_timestamp];
	totalSupply#4 := totalSupply#4[__this := 0];
	winner_tmstmp39#14 := winner_tmstmp39#14[__this := 0];
	winner_tmstmp35#111 := winner_tmstmp35#111[__this := 0];
	bugv_tmstmp3#219 := bugv_tmstmp3#219[__this := __block_timestamp];
	bugv_tmstmp4#231 := bugv_tmstmp4#231[__this := __block_timestamp];
	// Function body starts here
	totalSupply#4 := totalSupply#4[__this := 30000000000000000000000000000];
	name#341 := name#341[__this := int_arr#constr(default_int_int()[0 := 72][1 := 111][2 := 116][3 := 68][4 := 111][5 := 108][6 := 108][7 := 97][8 := 114][9 := 115][10 := 32][11 := 84][12 := 111][13 := 107][14 := 101][15 := 110], 16)];
	decimals#367 := decimals#367[__this := 18];
	symbol#416 := symbol#416[__this := int_arr#constr(default_int_int()[0 := 72][1 := 68][2 := 83], 3)];
	balances#281 := balances#281[__this := balances#281[__this][__msg_sender := totalSupply#4[__this]]];
	$return10:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_1.sol", 128, 1} {:message "winner_tmstmp27"} winner_tmstmp27#447: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 129, 1} {:message "HotDollarsToken::play_tmstmp27"} play_tmstmp27#473(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#449: int)
{
	var {:sourceloc "buggy_1.sol", 130, 2} {:message "_vtime"} _vtime#453: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#453 := __block_timestamp;
	if (((startTime#449 + 432000) == _vtime#453)) {
	winner_tmstmp27#447 := winner_tmstmp27#447[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 134, 5} {:message "HotDollarsToken::transfer"} transfer#515(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#475: address_t, _value#477: int)
	returns (success#481: bool)
{
	var call_arg#0: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#281[__this][__msg_sender] >= _value#477);
	balances#281 := balances#281[__this := balances#281[__this][__msg_sender := (balances#281[__this][__msg_sender] - _value#477)]];
	balances#281 := balances#281[__this := balances#281[__this][_to#475 := (balances#281[__this][_to#475] + _value#477)]];
	call_arg#0 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 138, 14} {:message ""} true;
	call Transfer#227(__this, __msg_sender, __msg_value, call_arg#0, _to#475, _value#477);
	success#481 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_1.sol", 141, 1} {:message "winner_tmstmp31"} winner_tmstmp31#517: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 142, 1} {:message "HotDollarsToken::play_tmstmp31"} play_tmstmp31#543(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#519: int)
{
	var {:sourceloc "buggy_1.sol", 143, 2} {:message "_vtime"} _vtime#523: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#523 := __block_timestamp;
	if (((startTime#519 + 432000) == _vtime#523)) {
	winner_tmstmp31#517 := winner_tmstmp31#517[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 147, 5} {:message "HotDollarsToken::transferFrom"} transferFrom#611(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#545: address_t, _to#547: address_t, _value#549: int)
	returns (success#553: bool)
{
	var {:sourceloc "buggy_1.sol", 148, 9} {:message "allowance"} allowance#556: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#556 := allowed#315[__this][_from#545][__msg_sender];
	assume ((balances#281[__this][_from#545] >= _value#549) && (allowance#556 >= _value#549));
	balances#281 := balances#281[__this := balances#281[__this][_to#547 := (balances#281[__this][_to#547] + _value#549)]];
	balances#281 := balances#281[__this := balances#281[__this][_from#545 := (balances#281[__this][_from#545] - _value#549)]];
	if ((allowance#556 < 115792089237316195423570985008687907853269984665640564039457584007913129639935)) {
	allowed#315 := allowed#315[__this := allowed#315[__this][_from#545 := allowed#315[__this][_from#545][__msg_sender := (allowed#315[__this][_from#545][__msg_sender] - _value#549)]]];
	}

	assume {:sourceloc "buggy_1.sol", 155, 14} {:message ""} true;
	call Transfer#227(__this, __msg_sender, __msg_value, _from#545, _to#547, _value#549);
	success#553 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_1.sol", 158, 1} {:message "HotDollarsToken::bug_tmstmp13"} bug_tmstmp13#622(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#614: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#614 := (__block_timestamp >= 1546300800);
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 162, 5} {:message "HotDollarsToken::balanceOf"} balanceOf#635(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#624: address_t)
	returns (balance#628: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#628 := balances#281[__this][_owner#624];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_1.sol", 165, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#639: [address_t]int;
// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 167, 5} {:message "HotDollarsToken::approve"} approve#668(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#641: address_t, _value#643: int)
	returns (success#647: bool)
{
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#315 := allowed#315[__this := allowed#315[__this][__msg_sender := allowed#315[__this][__msg_sender][_spender#641 := _value#643]]];
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 169, 14} {:message ""} true;
	call Approval#239(__this, __msg_sender, __msg_value, call_arg#1, _spender#641, _value#643);
	success#647 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_1.sol", 172, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#672: [address_t]int;
// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 174, 5} {:message "HotDollarsToken::allowance"} allowance#689(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#674: address_t, _spender#676: address_t)
	returns (remaining#680: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#680 := allowed#315[__this][_owner#674][_spender#676];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_1.sol", 177, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#693: [address_t]int;
