// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_2.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: CareerOnToken -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_2.sol", 9, 3} {:message "[event] CareerOnToken::Transfer"} Transfer#13(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#7: address_t, _to#9: address_t, _value#11: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_2.sol", 11, 3} {:message "[event] CareerOnToken::Approval"} Approval#25(__this: address_t, __msg_sender: address_t, __msg_value: int, a_owner#19: address_t, _spender#21: address_t, _value#23: int)
{
	
}

// 
// Event: OwnerChang
procedure {:inline 1} {:sourceloc "buggy_2.sol", 13, 3} {:message "[event] CareerOnToken::OwnerChang"} OwnerChang#37(__this: address_t, __msg_sender: address_t, __msg_value: int, _old#31: address_t, _new#33: address_t, _coin_change#35: int)
{
	
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_2.sol", 8, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#5: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_2.sol", 10, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#17: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_2.sol", 12, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#29: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_2.sol", 15, 3} {:message "winner_tmstmp38"} winner_tmstmp38#39: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 16, 1} {:message "CareerOnToken::play_tmstmp38"} play_tmstmp38#61(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#41: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#41 + 432000) == __block_timestamp)) {
	winner_tmstmp38#39 := winner_tmstmp38#39[__this := __msg_sender];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_2.sol", 19, 3} {:message "totalSupply"} totalSupply#63: [address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_2.sol", 20, 3} {:message "CareerOnToken::bug_tmstmp4"} bug_tmstmp4#110(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 21, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#67: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#67 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#67);
	pastBlockTime_tmstmp4#67 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_2.sol", 26, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return1:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_2.sol", 29, 3} {:message "name"} name#112: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_2.sol", 30, 3} {:message "winner_tmstmp7"} winner_tmstmp7#114: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 31, 1} {:message "CareerOnToken::play_tmstmp7"} play_tmstmp7#140(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#116: int)
{
	var {:sourceloc "buggy_2.sol", 32, 2} {:message "_vtime"} _vtime#120: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#120 := __block_timestamp;
	if (((startTime#116 + 432000) == _vtime#120)) {
	winner_tmstmp7#114 := winner_tmstmp7#114[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_2.sol", 35, 3} {:message "decimals"} decimals#142: [address_t]int;
// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_2.sol", 36, 3} {:message "winner_tmstmp23"} winner_tmstmp23#144: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 37, 1} {:message "CareerOnToken::play_tmstmp23"} play_tmstmp23#170(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#146: int)
{
	var {:sourceloc "buggy_2.sol", 38, 2} {:message "_vtime"} _vtime#150: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#150 := __block_timestamp;
	if (((startTime#146 + 432000) == _vtime#150)) {
	winner_tmstmp23#144 := winner_tmstmp23#144[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_2.sol", 41, 3} {:message "symbol"} symbol#172: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_2.sol", 42, 3} {:message "winner_tmstmp14"} winner_tmstmp14#174: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 43, 1} {:message "CareerOnToken::play_tmstmp14"} play_tmstmp14#196(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#176: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#176 + 432000) == __block_timestamp)) {
	winner_tmstmp14#174 := winner_tmstmp14#174[__this := __msg_sender];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_2.sol", 46, 3} {:message "owner"} owner#198: [address_t]address_t;
// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_2.sol", 47, 3} {:message "winner_tmstmp30"} winner_tmstmp30#200: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 48, 1} {:message "CareerOnToken::play_tmstmp30"} play_tmstmp30#222(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#202: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#202 + 432000) == __block_timestamp)) {
	winner_tmstmp30#200 := winner_tmstmp30#200[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 51, 3} {:message "balances"} balances#226: [address_t][address_t]int;
// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_2.sol", 52, 3} {:message "CareerOnToken::bug_tmstmp8"} bug_tmstmp8#273(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 53, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#230: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#230 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#230);
	pastBlockTime_tmstmp8#230 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_2.sol", 58, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return6:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_2.sol", 61, 3} {:message "allowed"} allowed#279: [address_t][address_t][address_t]int;
// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_2.sol", 64, 3} {:message "winner_tmstmp39"} winner_tmstmp39#281: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 65, 1} {:message "CareerOnToken::play_tmstmp39"} play_tmstmp39#307(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#283: int)
{
	var {:sourceloc "buggy_2.sol", 66, 2} {:message "_vtime"} _vtime#287: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#287 := __block_timestamp;
	if (((startTime#283 + 432000) == _vtime#287)) {
	winner_tmstmp39#281 := winner_tmstmp39#281[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: isTransPaused: bool
var {:sourceloc "buggy_2.sol", 69, 3} {:message "isTransPaused"} isTransPaused#310: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_2.sol", 71, 5} {:message "CareerOnToken::[constructor]"} __constructor#898(__this: address_t, __msg_sender: address_t, __msg_value: int, _initialAmount#312: int, _decimalUnits#314: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	bugv_tmstmp2#5 := bugv_tmstmp2#5[__this := __block_timestamp];
	bugv_tmstmp3#17 := bugv_tmstmp3#17[__this := __block_timestamp];
	bugv_tmstmp4#29 := bugv_tmstmp4#29[__this := __block_timestamp];
	winner_tmstmp38#39 := winner_tmstmp38#39[__this := 0];
	totalSupply#63 := totalSupply#63[__this := 0];
	name#112 := name#112[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp7#114 := winner_tmstmp7#114[__this := 0];
	decimals#142 := decimals#142[__this := 0];
	winner_tmstmp23#144 := winner_tmstmp23#144[__this := 0];
	symbol#172 := symbol#172[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp14#174 := winner_tmstmp14#174[__this := 0];
	owner#198 := owner#198[__this := 0];
	winner_tmstmp30#200 := winner_tmstmp30#200[__this := 0];
	balances#226 := balances#226[__this := default_address_t_int()];
	allowed#279 := allowed#279[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp39#281 := winner_tmstmp39#281[__this := 0];
	isTransPaused#310 := isTransPaused#310[__this := false];
	winner_tmstmp35#497 := winner_tmstmp35#497[__this := 0];
	winner_tmstmp27#732 := winner_tmstmp27#732[__this := 0];
	winner_tmstmp31#805 := winner_tmstmp31#805[__this := 0];
	bugv_tmstmp5#886 := bugv_tmstmp5#886[__this := __block_timestamp];
	bugv_tmstmp1#897 := bugv_tmstmp1#897[__this := __block_timestamp];
	// Function body starts here
	owner#198 := owner#198[__this := __msg_sender];
	if ((_initialAmount#312 <= 0)) {
	totalSupply#63 := totalSupply#63[__this := 100000000000000000];
	balances#226 := balances#226[__this := balances#226[__this][owner#198[__this] := totalSupply#63[__this]]];
	}
	else {
	totalSupply#63 := totalSupply#63[__this := _initialAmount#312];
	balances#226 := balances#226[__this := balances#226[__this][owner#198[__this] := _initialAmount#312]];
	}

	if ((_decimalUnits#314 <= 0)) {
	decimals#142 := decimals#142[__this := 2];
	}
	else {
	decimals#142 := decimals#142[__this := _decimalUnits#314];
	}

	name#112 := name#112[__this := int_arr#constr(default_int_int()[0 := 67][1 := 97][2 := 114][3 := 101][4 := 101][5 := 114][6 := 79][7 := 110][8 := 32][9 := 67][10 := 104][11 := 97][12 := 105][13 := 110][14 := 32][15 := 84][16 := 111][17 := 107][18 := 101][19 := 110], 20)];
	symbol#172 := symbol#172[__this := int_arr#constr(default_int_int()[0 := 67][1 := 79][2 := 84], 3)];
	$return8:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_2.sol", 91, 1} {:message "CareerOnToken::bug_tmstmp36"} bug_tmstmp36#418(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 92, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#375: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#375 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#375);
	pastBlockTime_tmstmp36#375 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_2.sol", 97, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 102, 5} {:message "CareerOnToken::transfer"} transfer#495(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#420: address_t, _value#422: int)
	returns (success#425: bool)
{
	var call_arg#0: address_t;
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 106, 9} {:message "Assertion might not hold."} ((((_to#420 != __this) && !(isTransPaused#310[__this])) && (balances#226[__this][__msg_sender] >= _value#422)) && ((balances#226[__this][_to#420] + _value#422) > balances#226[__this][_to#420]));
	balances#226 := balances#226[__this := balances#226[__this][__msg_sender := (balances#226[__this][__msg_sender] - _value#422)]];
	balances#226 := balances#226[__this := balances#226[__this][_to#420 := (balances#226[__this][_to#420] + _value#422)]];
	if ((__msg_sender == owner#198[__this])) {
	call_arg#0 := __this;
	assume {:sourceloc "buggy_2.sol", 115, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, call_arg#0, _to#420, _value#422);
	}
	else {
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 117, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, call_arg#1, _to#420, _value#422);
	}

	success#425 := true;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_2.sol", 121, 1} {:message "winner_tmstmp35"} winner_tmstmp35#497: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 122, 1} {:message "CareerOnToken::play_tmstmp35"} play_tmstmp35#523(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#499: int)
{
	var {:sourceloc "buggy_2.sol", 123, 2} {:message "_vtime"} _vtime#503: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#503 := __block_timestamp;
	if (((startTime#499 + 432000) == _vtime#503)) {
	winner_tmstmp35#497 := winner_tmstmp35#497[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 128, 5} {:message "CareerOnToken::transferFrom"} transferFrom#617(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#525: address_t, _to#527: address_t, _value#529: int)
	returns (success#532: bool)
{
	var call_arg#2: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 133, 9} {:message "Assertion might not hold."} (((((_to#527 != __this) && !(isTransPaused#310[__this])) && (balances#226[__this][__msg_sender] >= _value#529)) && ((balances#226[__this][_to#527] + _value#529) > balances#226[__this][_to#527])) && (allowed#279[__this][_from#525][__msg_sender] >= _value#529));
	balances#226 := balances#226[__this := balances#226[__this][_to#527 := (balances#226[__this][_to#527] + _value#529)]];
	balances#226 := balances#226[__this := balances#226[__this][_from#525 := (balances#226[__this][_from#525] - _value#529)]];
	allowed#279 := allowed#279[__this := allowed#279[__this][_from#525 := allowed#279[__this][_from#525][__msg_sender := (allowed#279[__this][_from#525][__msg_sender] - _value#529)]]];
	if ((_from#525 == owner#198[__this])) {
	call_arg#2 := __this;
	assume {:sourceloc "buggy_2.sol", 144, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, call_arg#2, _to#527, _value#529);
	}
	else {
	assume {:sourceloc "buggy_2.sol", 146, 9} {:message ""} true;
	call Transfer#13(__this, __msg_sender, __msg_value, _from#525, _to#527, _value#529);
	}

	success#532 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_2.sol", 150, 1} {:message "CareerOnToken::bug_tmstmp40"} bug_tmstmp40#664(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 151, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#621: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#621 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#621);
	pastBlockTime_tmstmp40#621 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_2.sol", 156, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return13:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 160, 5} {:message "CareerOnToken::approve"} approve#703(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#666: address_t, _value#668: int)
	returns (success#671: bool)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 162, 9} {:message "Assertion might not hold."} ((__msg_sender != _spender#666) && (_value#668 > 0));
	allowed#279 := allowed#279[__this := allowed#279[__this][__msg_sender := allowed#279[__this][__msg_sender][_spender#666 := _value#668]]];
	call_arg#3 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 164, 14} {:message ""} true;
	call Approval#25(__this, __msg_sender, __msg_value, call_arg#3, _spender#666, _value#668);
	success#671 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_2.sol", 167, 1} {:message "CareerOnToken::bug_tmstmp33"} bug_tmstmp33#714(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#706: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#706 := (__block_timestamp >= 1546300800);
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_2.sol", 171, 5} {:message "CareerOnToken::allowance"} allowance#730(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#716: address_t, _spender#718: address_t)
	returns (remaining#721: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#721 := allowed#279[__this][_owner#716][_spender#718];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_2.sol", 177, 1} {:message "winner_tmstmp27"} winner_tmstmp27#732: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 178, 1} {:message "CareerOnToken::play_tmstmp27"} play_tmstmp27#758(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#734: int)
{
	var {:sourceloc "buggy_2.sol", 179, 2} {:message "_vtime"} _vtime#738: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#738 := __block_timestamp;
	if (((startTime#734 + 432000) == _vtime#738)) {
	winner_tmstmp27#732 := winner_tmstmp27#732[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// Function: changeOwner : function (address)
procedure {:sourceloc "buggy_2.sol", 185, 2} {:message "CareerOnToken::changeOwner"} changeOwner#803(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#760: address_t)
{
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 186, 9} {:message "Assertion might not hold."} ((__msg_sender == owner#198[__this]) && (__msg_sender != newOwner#760));
	balances#226 := balances#226[__this := balances#226[__this][newOwner#760 := balances#226[__this][owner#198[__this]]]];
	balances#226 := balances#226[__this := balances#226[__this][owner#198[__this] := 0]];
	owner#198 := owner#198[__this := newOwner#760];
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 190, 14} {:message ""} true;
	call OwnerChang#37(__this, __msg_sender, __msg_value, call_arg#4, newOwner#760, balances#226[__this][owner#198[__this]]);
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_2.sol", 192, 1} {:message "winner_tmstmp31"} winner_tmstmp31#805: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 193, 1} {:message "CareerOnToken::play_tmstmp31"} play_tmstmp31#831(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#807: int)
{
	var {:sourceloc "buggy_2.sol", 194, 2} {:message "_vtime"} _vtime#811: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#811 := __block_timestamp;
	if (((startTime#807 + 432000) == _vtime#811)) {
	winner_tmstmp31#805 := winner_tmstmp31#805[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: setPauseStatus : function (bool)
procedure {:sourceloc "buggy_2.sol", 199, 5} {:message "CareerOnToken::setPauseStatus"} setPauseStatus#848(__this: address_t, __msg_sender: address_t, __msg_value: int, isPaused#833: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 200, 9} {:message "Assertion might not hold."} (__msg_sender == owner#198[__this]);
	isTransPaused#310 := isTransPaused#310[__this := isPaused#833];
	$return20:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_2.sol", 203, 1} {:message "CareerOnToken::bug_tmstmp13"} bug_tmstmp13#859(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#851: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#851 := (__block_timestamp >= 1546300800);
	goto $return21;
	$return21:
	// Function body ends here
}

type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: changeContractName : function (string memory,string memory)
procedure {:sourceloc "buggy_2.sol", 208, 5} {:message "CareerOnToken::changeContractName"} changeContractName#882(__this: address_t, __msg_sender: address_t, __msg_value: int, _newName#861: int_arr_ptr, _newSymbol#863: int_arr_ptr)
{
	// TCC assumptions
	assume (_newName#861 < __alloc_counter);
	assume (_newSymbol#863 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 209, 9} {:message "Assertion might not hold."} (__msg_sender == owner#198[__this]);
	name#112 := name#112[__this := mem_arr_int[_newName#861]];
	symbol#172 := symbol#172[__this := mem_arr_int[_newSymbol#863]];
	$return22:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_2.sol", 213, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#886: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_2.sol", 216, 5} {:message "CareerOnToken::[fallback]"} #893(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return23:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_2.sol", 219, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#897: [address_t]int;
