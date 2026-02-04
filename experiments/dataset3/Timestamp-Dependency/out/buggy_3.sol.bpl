// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_3.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: CareerOnToken -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_3.sol", 9, 3} {:message "[event] CareerOnToken::Transfer"} Transfer#13(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#7: address_t, _to#9: address_t, _value#11: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_3.sol", 11, 3} {:message "[event] CareerOnToken::Approval"} Approval#25(__this: address_t, __msg_sender: address_t, __msg_value: int, a_owner#19: address_t, _spender#21: address_t, _value#23: int)
{
	
}

// 
// Event: OwnerChang
procedure {:inline 1} {:sourceloc "buggy_3.sol", 13, 3} {:message "[event] CareerOnToken::OwnerChang"} OwnerChang#37(__this: address_t, __msg_sender: address_t, __msg_value: int, _old#31: address_t, _new#33: address_t, _coin_change#35: int)
{
	
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_3.sol", 8, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#5: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_3.sol", 10, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#17: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_3.sol", 12, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#29: [address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_3.sol", 15, 3} {:message "CareerOnToken::bug_tmstmp32"} bug_tmstmp32#84(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 16, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#41 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#41);
	pastBlockTime_tmstmp32#41 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_3.sol", 21, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return0:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_3.sol", 24, 3} {:message "totalSupply"} totalSupply#86: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_3.sol", 25, 3} {:message "winner_tmstmp38"} winner_tmstmp38#88: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 26, 1} {:message "CareerOnToken::play_tmstmp38"} play_tmstmp38#110(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#90: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#90 + 432000) == __block_timestamp)) {
	winner_tmstmp38#88 := winner_tmstmp38#88[__this := __msg_sender];
	}

	$return1:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_3.sol", 29, 3} {:message "name"} name#112: [address_t]int_arr_type;
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_3.sol", 30, 3} {:message "CareerOnToken::bug_tmstmp4"} bug_tmstmp4#159(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 31, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#116: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#116 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#116);
	pastBlockTime_tmstmp4#116 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_3.sol", 36, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_3.sol", 39, 3} {:message "decimals"} decimals#161: [address_t]int;
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_3.sol", 40, 3} {:message "winner_tmstmp7"} winner_tmstmp7#163: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 41, 1} {:message "CareerOnToken::play_tmstmp7"} play_tmstmp7#189(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#165: int)
{
	var {:sourceloc "buggy_3.sol", 42, 2} {:message "_vtime"} _vtime#169: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#169 := __block_timestamp;
	if (((startTime#165 + 432000) == _vtime#169)) {
	winner_tmstmp7#163 := winner_tmstmp7#163[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_3.sol", 45, 3} {:message "symbol"} symbol#191: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_3.sol", 46, 3} {:message "winner_tmstmp23"} winner_tmstmp23#193: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 47, 1} {:message "CareerOnToken::play_tmstmp23"} play_tmstmp23#219(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#195: int)
{
	var {:sourceloc "buggy_3.sol", 48, 2} {:message "_vtime"} _vtime#199: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#199 := __block_timestamp;
	if (((startTime#195 + 432000) == _vtime#199)) {
	winner_tmstmp23#193 := winner_tmstmp23#193[__this := __msg_sender];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_3.sol", 51, 3} {:message "owner"} owner#221: [address_t]address_t;
// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_3.sol", 53, 3} {:message "winner_tmstmp14"} winner_tmstmp14#223: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 54, 1} {:message "CareerOnToken::play_tmstmp14"} play_tmstmp14#245(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#225: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#225 + 432000) == __block_timestamp)) {
	winner_tmstmp14#223 := winner_tmstmp14#223[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 57, 3} {:message "balances"} balances#249: [address_t][address_t]int;
// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_3.sol", 58, 3} {:message "winner_tmstmp30"} winner_tmstmp30#251: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 59, 1} {:message "CareerOnToken::play_tmstmp30"} play_tmstmp30#273(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#253: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#253 + 432000) == __block_timestamp)) {
	winner_tmstmp30#251 := winner_tmstmp30#251[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_3.sol", 62, 3} {:message "allowed"} allowed#279: [address_t][address_t][address_t]int;
// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_3.sol", 65, 3} {:message "CareerOnToken::bug_tmstmp8"} bug_tmstmp8#326(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 66, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#283: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#283 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#283);
	pastBlockTime_tmstmp8#283 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_3.sol", 71, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return7:
	// Function body ends here
}

// 
// State variable: isTransPaused: bool
var {:sourceloc "buggy_3.sol", 74, 3} {:message "isTransPaused"} isTransPaused#329: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 76, 5} {:message "CareerOnToken::[constructor]"} __constructor#957(__this: address_t, __msg_sender: address_t, __msg_value: int, _initialAmount#331: int, _decimalUnits#333: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	bugv_tmstmp2#5 := bugv_tmstmp2#5[__this := __block_timestamp];
	bugv_tmstmp3#17 := bugv_tmstmp3#17[__this := __block_timestamp];
	bugv_tmstmp4#29 := bugv_tmstmp4#29[__this := __block_timestamp];
	totalSupply#86 := totalSupply#86[__this := 0];
	winner_tmstmp38#88 := winner_tmstmp38#88[__this := 0];
	name#112 := name#112[__this := int_arr#constr(default_int_int(), 0)];
	decimals#161 := decimals#161[__this := 0];
	winner_tmstmp7#163 := winner_tmstmp7#163[__this := 0];
	symbol#191 := symbol#191[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp23#193 := winner_tmstmp23#193[__this := 0];
	owner#221 := owner#221[__this := 0];
	winner_tmstmp14#223 := winner_tmstmp14#223[__this := 0];
	balances#249 := balances#249[__this := default_address_t_int()];
	winner_tmstmp30#251 := winner_tmstmp30#251[__this := 0];
	allowed#279 := allowed#279[__this := default_address_t__k_address_t_v_int()];
	isTransPaused#329 := isTransPaused#329[__this := false];
	winner_tmstmp39#392 := winner_tmstmp39#392[__this := 0];
	winner_tmstmp35#638 := winner_tmstmp35#638[__this := 0];
	winner_tmstmp27#791 := winner_tmstmp27#791[__this := 0];
	winner_tmstmp31#864 := winner_tmstmp31#864[__this := 0];
	bugv_tmstmp5#945 := bugv_tmstmp5#945[__this := __block_timestamp];
	bugv_tmstmp1#956 := bugv_tmstmp1#956[__this := __block_timestamp];
	// Function body starts here
	owner#221 := owner#221[__this := __msg_sender];
	if ((_initialAmount#331 <= 0)) {
	totalSupply#86 := totalSupply#86[__this := 100000000000000000];
	balances#249 := balances#249[__this := balances#249[__this][owner#221[__this] := totalSupply#86[__this]]];
	}
	else {
	totalSupply#86 := totalSupply#86[__this := _initialAmount#331];
	balances#249 := balances#249[__this := balances#249[__this][owner#221[__this] := _initialAmount#331]];
	}

	if ((_decimalUnits#333 <= 0)) {
	decimals#161 := decimals#161[__this := 2];
	}
	else {
	decimals#161 := decimals#161[__this := _decimalUnits#333];
	}

	name#112 := name#112[__this := int_arr#constr(default_int_int()[0 := 67][1 := 97][2 := 114][3 := 101][4 := 101][5 := 114][6 := 79][7 := 110][8 := 32][9 := 67][10 := 104][11 := 97][12 := 105][13 := 110][14 := 32][15 := 84][16 := 111][17 := 107][18 := 101][19 := 110], 20)];
	symbol#191 := symbol#191[__this := int_arr#constr(default_int_int()[0 := 67][1 := 79][2 := 84], 3)];
	$return8:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_3.sol", 96, 1} {:message "winner_tmstmp39"} winner_tmstmp39#392: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 97, 1} {:message "CareerOnToken::play_tmstmp39"} play_tmstmp39#418(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#394: int)
{
	var {:sourceloc "buggy_3.sol", 98, 2} {:message "_vtime"} _vtime#398: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#398 := __block_timestamp;
	if (((startTime#394 + 432000) == _vtime#398)) {
	winner_tmstmp39#392 := winner_tmstmp39#392[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 103, 5} {:message "CareerOnToken::transfer"} transfer#495(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#420: address_t, _value#422: int)
	returns (success#425: bool)
{
	var call_arg#0: address_t;
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 107, 9} {:message "Assertion might not hold."} ((((_to#420 != __this) && !(isTransPaused#329[__this])) && (balances#249[__this][__msg_sender] >= _value#422)) && ((balances#249[__this][_to#420] + _value#422) > balances#249[__this][_to#420]));
	balances#249 := balances#249[__this := balances#249[__this][__msg_sender := (balances#249[__this][__msg_sender] - _value#422)]];
	balances#249 := balances#249[__this := balances#249[__this][_to#420 := (balances#249[__this][_to#420] + _value#422)]];
	if ((__msg_sender == owner#221[__this])) {
	call_arg#0 := __this;
	assume {:sourceloc "buggy_3.sol", 116, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, call_arg#0, _to#420, _value#422);
	}
	else {
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 118, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, call_arg#1, _to#420, _value#422);
	}

	success#425 := true;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_3.sol", 122, 1} {:message "CareerOnToken::bug_tmstmp36"} bug_tmstmp36#542(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 123, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#499: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#499 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#499);
	pastBlockTime_tmstmp36#499 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_3.sol", 128, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 133, 5} {:message "CareerOnToken::transferFrom"} transferFrom#636(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#544: address_t, _to#546: address_t, _value#548: int)
	returns (success#551: bool)
{
	var call_arg#2: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 138, 9} {:message "Assertion might not hold."} (((((_to#546 != __this) && !(isTransPaused#329[__this])) && (balances#249[__this][__msg_sender] >= _value#548)) && ((balances#249[__this][_to#546] + _value#548) > balances#249[__this][_to#546])) && (allowed#279[__this][_from#544][__msg_sender] >= _value#548));
	balances#249 := balances#249[__this := balances#249[__this][_to#546 := (balances#249[__this][_to#546] + _value#548)]];
	balances#249 := balances#249[__this := balances#249[__this][_from#544 := (balances#249[__this][_from#544] - _value#548)]];
	allowed#279 := allowed#279[__this := allowed#279[__this][_from#544 := allowed#279[__this][_from#544][__msg_sender := (allowed#279[__this][_from#544][__msg_sender] - _value#548)]]];
	if ((_from#544 == owner#221[__this])) {
	call_arg#2 := __this;
	assume {:sourceloc "buggy_3.sol", 149, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, call_arg#2, _to#546, _value#548);
	}
	else {
	assume {:sourceloc "buggy_3.sol", 151, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, _from#544, _to#546, _value#548);
	}

	success#551 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_3.sol", 155, 1} {:message "winner_tmstmp35"} winner_tmstmp35#638: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 156, 1} {:message "CareerOnToken::play_tmstmp35"} play_tmstmp35#664(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#640: int)
{
	var {:sourceloc "buggy_3.sol", 157, 2} {:message "_vtime"} _vtime#644: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#644 := __block_timestamp;
	if (((startTime#640 + 432000) == _vtime#644)) {
	winner_tmstmp35#638 := winner_tmstmp35#638[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 161, 5} {:message "CareerOnToken::approve"} approve#703(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#666: address_t, _value#668: int)
	returns (success#671: bool)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 163, 9} {:message "Assertion might not hold."} ((__msg_sender != _spender#666) && (_value#668 > 0));
	allowed#279 := allowed#279[__this := allowed#279[__this][__msg_sender := allowed#279[__this][__msg_sender][_spender#666 := _value#668]]];
	call_arg#3 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 165, 14} {:message ""} true;
	call Approval#25(__this, __msg_sender, __msg_value, call_arg#3, _spender#666, _value#668);
	success#671 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_3.sol", 168, 1} {:message "CareerOnToken::bug_tmstmp40"} bug_tmstmp40#750(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 169, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#707: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#707 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#707);
	pastBlockTime_tmstmp40#707 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_3.sol", 174, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return15:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 178, 5} {:message "CareerOnToken::allowance"} allowance#766(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#752: address_t, _spender#754: address_t)
	returns (remaining#757: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#757 := allowed#279[__this][_owner#752][_spender#754];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_3.sol", 184, 1} {:message "CareerOnToken::bug_tmstmp33"} bug_tmstmp33#777(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#769: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#769 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 188, 5} {:message "CareerOnToken::balanceOf"} balanceOf#789(__this: address_t, __msg_sender: address_t, __msg_value: int, accountAddr#779: address_t)
	returns (#782: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#782 := balances#249[__this][accountAddr#779];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_3.sol", 191, 1} {:message "winner_tmstmp27"} winner_tmstmp27#791: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 192, 1} {:message "CareerOnToken::play_tmstmp27"} play_tmstmp27#817(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#793: int)
{
	var {:sourceloc "buggy_3.sol", 193, 2} {:message "_vtime"} _vtime#797: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#797 := __block_timestamp;
	if (((startTime#793 + 432000) == _vtime#797)) {
	winner_tmstmp27#791 := winner_tmstmp27#791[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: changeOwner : function (address)
procedure {:sourceloc "buggy_3.sol", 199, 2} {:message "CareerOnToken::changeOwner"} changeOwner#862(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#819: address_t)
{
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 200, 9} {:message "Assertion might not hold."} ((__msg_sender == owner#221[__this]) && (__msg_sender != newOwner#819));
	balances#249 := balances#249[__this := balances#249[__this][newOwner#819 := balances#249[__this][owner#221[__this]]]];
	balances#249 := balances#249[__this := balances#249[__this][owner#221[__this] := 0]];
	owner#221 := owner#221[__this := newOwner#819];
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 204, 14} {:message ""} true;
	call OwnerChang#37(__this, __msg_sender, __msg_value, call_arg#4, newOwner#819, balances#249[__this][owner#221[__this]]);
	$return20:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_3.sol", 206, 1} {:message "winner_tmstmp31"} winner_tmstmp31#864: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 207, 1} {:message "CareerOnToken::play_tmstmp31"} play_tmstmp31#890(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#866: int)
{
	var {:sourceloc "buggy_3.sol", 208, 2} {:message "_vtime"} _vtime#870: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#870 := __block_timestamp;
	if (((startTime#866 + 432000) == _vtime#870)) {
	winner_tmstmp31#864 := winner_tmstmp31#864[__this := __msg_sender];
	}

	$return21:
	// Function body ends here
}

// 
// Function: setPauseStatus : function (bool)
procedure {:sourceloc "buggy_3.sol", 213, 5} {:message "CareerOnToken::setPauseStatus"} setPauseStatus#907(__this: address_t, __msg_sender: address_t, __msg_value: int, isPaused#892: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 214, 9} {:message "Assertion might not hold."} (__msg_sender == owner#221[__this]);
	isTransPaused#329 := isTransPaused#329[__this := isPaused#892];
	$return22:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_3.sol", 217, 1} {:message "CareerOnToken::bug_tmstmp13"} bug_tmstmp13#918(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#910: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#910 := (__block_timestamp >= 1546300800);
	goto $return23;
	$return23:
	// Function body ends here
}

type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: changeContractName : function (string memory,string memory)
procedure {:sourceloc "buggy_3.sol", 222, 5} {:message "CareerOnToken::changeContractName"} changeContractName#941(__this: address_t, __msg_sender: address_t, __msg_value: int, _newName#920: int_arr_ptr, _newSymbol#922: int_arr_ptr)
{
	// TCC assumptions
	assume (_newName#920 < __alloc_counter);
	assume (_newSymbol#922 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 223, 9} {:message "Assertion might not hold."} (__msg_sender == owner#221[__this]);
	name#112 := name#112[__this := mem_arr_int[_newName#920]];
	symbol#191 := symbol#191[__this := mem_arr_int[_newSymbol#922]];
	$return24:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_3.sol", 227, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#945: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 230, 5} {:message "CareerOnToken::[fallback]"} #952(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return25:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_3.sol", 233, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#956: [address_t]int;
