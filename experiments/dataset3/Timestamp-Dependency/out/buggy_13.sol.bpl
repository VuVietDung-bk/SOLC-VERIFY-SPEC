// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_13.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_13.sol", 8, 5} {:message "tokenRecipient::receiveApproval"} receiveApproval#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#3: address_t, _value#5: int, _token#7: address_t, _extraData#9: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_13.sol", 7, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#13(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: BitCash -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_13.sol", 61, 3} {:message "[event] BitCash::Transfer"} Transfer#242(__this: address_t, __msg_sender: address_t, __msg_value: int, from#236: address_t, to#238: address_t, value#240: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_13.sol", 65, 3} {:message "[event] BitCash::Approval"} Approval#254(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#248: address_t, _spender#250: address_t, _value#252: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_13.sol", 69, 3} {:message "[event] BitCash::Burn"} Burn#264(__this: address_t, __msg_sender: address_t, __msg_value: int, from#260: address_t, value#262: int)
{
	
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_13.sol", 13, 3} {:message "winner_tmstmp23"} winner_tmstmp23#15: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_13.sol", 14, 1} {:message "BitCash::play_tmstmp23"} play_tmstmp23#41(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#17: int)
{
	var {:sourceloc "buggy_13.sol", 15, 2} {:message "_vtime"} _vtime#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#21 := __block_timestamp;
	if (((startTime#17 + 432000) == _vtime#21)) {
	winner_tmstmp23#15 := winner_tmstmp23#15[__this := __msg_sender];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_13.sol", 18, 3} {:message "name"} name#43: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_13.sol", 19, 3} {:message "winner_tmstmp14"} winner_tmstmp14#45: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_13.sol", 20, 1} {:message "BitCash::play_tmstmp14"} play_tmstmp14#67(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#47: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#47 + 432000) == __block_timestamp)) {
	winner_tmstmp14#45 := winner_tmstmp14#45[__this := __msg_sender];
	}

	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_13.sol", 23, 3} {:message "symbol"} symbol#69: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_13.sol", 24, 3} {:message "winner_tmstmp30"} winner_tmstmp30#71: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_13.sol", 25, 1} {:message "BitCash::play_tmstmp30"} play_tmstmp30#93(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#73: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#73 + 432000) == __block_timestamp)) {
	winner_tmstmp30#71 := winner_tmstmp30#71[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_13.sol", 28, 3} {:message "decimals"} decimals#96: [address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_13.sol", 30, 3} {:message "BitCash::bug_tmstmp8"} bug_tmstmp8#143(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_13.sol", 31, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#100: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#100 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#100);
	pastBlockTime_tmstmp8#100 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_13.sol", 36, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_13.sol", 39, 3} {:message "totalSupply"} totalSupply#145: [address_t]int;
// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_13.sol", 42, 3} {:message "winner_tmstmp39"} winner_tmstmp39#147: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_13.sol", 43, 1} {:message "BitCash::play_tmstmp39"} play_tmstmp39#173(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#149: int)
{
	var {:sourceloc "buggy_13.sol", 44, 2} {:message "_vtime"} _vtime#153: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#153 := __block_timestamp;
	if (((startTime#149 + 432000) == _vtime#153)) {
	winner_tmstmp39#147 := winner_tmstmp39#147[__this := __msg_sender];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_13.sol", 47, 3} {:message "balanceOf"} balanceOf#177: [address_t][address_t]int;
// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_13.sol", 48, 3} {:message "BitCash::bug_tmstmp36"} bug_tmstmp36#224(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_13.sol", 49, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#181: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#181 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#181);
	pastBlockTime_tmstmp36#181 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_13.sol", 54, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return5:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_13.sol", 57, 3} {:message "allowance"} allowance#230: [address_t][address_t][address_t]int;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_13.sol", 60, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#234: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_13.sol", 64, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#246: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_13.sol", 68, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#258: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_13.sol", 76, 5} {:message "BitCash::[constructor]"} __constructor#761(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#267: int, tokenName#269: int_arr_ptr, tokenSymbol#271: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#269 < __alloc_counter);
	assume (tokenSymbol#271 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp23#15 := winner_tmstmp23#15[__this := 0];
	name#43 := name#43[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp14#45 := winner_tmstmp14#45[__this := 0];
	symbol#69 := symbol#69[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp30#71 := winner_tmstmp30#71[__this := 0];
	decimals#96 := decimals#96[__this := 18];
	totalSupply#145 := totalSupply#145[__this := 0];
	winner_tmstmp39#147 := winner_tmstmp39#147[__this := 0];
	balanceOf#177 := balanceOf#177[__this := default_address_t_int()];
	allowance#230 := allowance#230[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp2#234 := bugv_tmstmp2#234[__this := __block_timestamp];
	bugv_tmstmp3#246 := bugv_tmstmp3#246[__this := __block_timestamp];
	bugv_tmstmp4#258 := bugv_tmstmp4#258[__this := __block_timestamp];
	winner_tmstmp35#298 := winner_tmstmp35#298[__this := 0];
	winner_tmstmp27#525 := winner_tmstmp27#525[__this := 0];
	winner_tmstmp31#582 := winner_tmstmp31#582[__this := 0];
	bugv_tmstmp5#700 := bugv_tmstmp5#700[__this := __block_timestamp];
	bugv_tmstmp1#760 := bugv_tmstmp1#760[__this := __block_timestamp];
	// Function body starts here
	totalSupply#145 := totalSupply#145[__this := (initialSupply#267 * 1000000000000000000)];
	balanceOf#177 := balanceOf#177[__this := balanceOf#177[__this][__msg_sender := totalSupply#145[__this]]];
	name#43 := name#43[__this := mem_arr_int[tokenName#269]];
	symbol#69 := symbol#69[__this := mem_arr_int[tokenSymbol#271]];
	$return6:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_13.sol", 86, 1} {:message "winner_tmstmp35"} winner_tmstmp35#298: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_13.sol", 87, 1} {:message "BitCash::play_tmstmp35"} play_tmstmp35#324(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#300: int)
{
	var {:sourceloc "buggy_13.sol", 88, 2} {:message "_vtime"} _vtime#304: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#304 := __block_timestamp;
	if (((startTime#300 + 432000) == _vtime#304)) {
	winner_tmstmp35#298 := winner_tmstmp35#298[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_13.sol", 95, 5} {:message "BitCash::_transfer"} _transfer#404(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#327: address_t, _to#329: address_t, _value#331: int)
{
	var {:sourceloc "buggy_13.sol", 103, 9} {:message "previousBalances"} previousBalances#364: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#329 != 0);
	assume (balanceOf#177[__this][_from#327] >= _value#331);
	assume ((balanceOf#177[__this][_to#329] + _value#331) >= balanceOf#177[__this][_to#329]);
	previousBalances#364 := (balanceOf#177[__this][_from#327] + balanceOf#177[__this][_to#329]);
	balanceOf#177 := balanceOf#177[__this := balanceOf#177[__this][_from#327 := (balanceOf#177[__this][_from#327] - _value#331)]];
	balanceOf#177 := balanceOf#177[__this := balanceOf#177[__this][_to#329 := (balanceOf#177[__this][_to#329] + _value#331)]];
	assume {:sourceloc "buggy_13.sol", 108, 14} {:message ""} true;
	call Transfer#242(__this, __msg_sender, __msg_value, _from#327, _to#329, _value#331);
	assert {:sourceloc "buggy_13.sol", 110, 9} {:message "Assertion might not hold."} ((balanceOf#177[__this][_from#327] + balanceOf#177[__this][_to#329]) == previousBalances#364);
	$return8:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_13.sol", 112, 1} {:message "BitCash::bug_tmstmp40"} bug_tmstmp40#451(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_13.sol", 113, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#408: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#408 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#408);
	pastBlockTime_tmstmp40#408 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_13.sol", 118, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 130, 5} {:message "BitCash::transfer"} transfer#471(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#454: address_t, _value#456: int)
	returns (success#459: bool)
{
	var call_arg#0: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 131, 9} {:message ""} true;
	call _transfer#404(__this, __msg_sender, __msg_value, call_arg#0, _to#454, _value#456);
	success#459 := true;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_13.sol", 134, 1} {:message "BitCash::bug_tmstmp33"} bug_tmstmp33#482(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#474: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#474 := (__block_timestamp >= 1546300800);
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 147, 5} {:message "BitCash::transferFrom"} transferFrom#523(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#485: address_t, _to#487: address_t, _value#489: int)
	returns (success#492: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#489 <= allowance#230[__this][_from#485][__msg_sender]);
	allowance#230 := allowance#230[__this := allowance#230[__this][_from#485 := allowance#230[__this][_from#485][__msg_sender := (allowance#230[__this][_from#485][__msg_sender] - _value#489)]]];
	assume {:sourceloc "buggy_13.sol", 150, 9} {:message ""} true;
	call _transfer#404(__this, __msg_sender, __msg_value, _from#485, _to#487, _value#489);
	success#492 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_13.sol", 153, 1} {:message "winner_tmstmp27"} winner_tmstmp27#525: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_13.sol", 154, 1} {:message "BitCash::play_tmstmp27"} play_tmstmp27#551(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#527: int)
{
	var {:sourceloc "buggy_13.sol", 155, 2} {:message "_vtime"} _vtime#531: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#531 := __block_timestamp;
	if (((startTime#527 + 432000) == _vtime#531)) {
	winner_tmstmp27#525 := winner_tmstmp27#525[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 167, 5} {:message "BitCash::approve"} approve#580(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#554: address_t, _value#556: int)
	returns (success#559: bool)
{
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#230 := allowance#230[__this := allowance#230[__this][__msg_sender := allowance#230[__this][__msg_sender][_spender#554 := _value#556]]];
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 170, 14} {:message ""} true;
	call Approval#254(__this, __msg_sender, __msg_value, call_arg#1, _spender#554, _value#556);
	success#559 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_13.sol", 173, 1} {:message "winner_tmstmp31"} winner_tmstmp31#582: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_13.sol", 174, 1} {:message "BitCash::play_tmstmp31"} play_tmstmp31#608(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#584: int)
{
	var {:sourceloc "buggy_13.sol", 175, 2} {:message "_vtime"} _vtime#588: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#588 := __block_timestamp;
	if (((startTime#584 + 432000) == _vtime#588)) {
	winner_tmstmp31#582 := winner_tmstmp31#582[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_13.sol", 188, 5} {:message "BitCash::approveAndCall"} approveAndCall#648(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#611: address_t, _value#613: int, _extraData#615: int_arr_ptr)
	returns (success#618: bool)
{
	var {:sourceloc "buggy_13.sol", 191, 9} {:message "spender"} spender#621: address_t;
	var approve#580_ret#2: bool;
	var call_arg#3: address_t;
	// TCC assumptions
	assume (_extraData#615 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#621 := _spender#611;
	assume {:sourceloc "buggy_13.sol", 192, 13} {:message ""} true;
	call approve#580_ret#2 := approve#580(__this, __msg_sender, __msg_value, _spender#611, _value#613);
	if (approve#580_ret#2) {
	call_arg#3 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 193, 13} {:message ""} true;
	call receiveApproval#12(spender#621, __this, 0, call_arg#3, _value#613, __this, _extraData#615);
	success#618 := true;
	goto $return16;
	}

	$return16:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_13.sol", 197, 1} {:message "BitCash::bug_tmstmp13"} bug_tmstmp13#659(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#651: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#651 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 208, 5} {:message "BitCash::burn"} burn#696(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#662: int)
	returns (success#665: bool)
{
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#177[__this][__msg_sender] >= _value#662);
	balanceOf#177 := balanceOf#177[__this := balanceOf#177[__this][__msg_sender := (balanceOf#177[__this][__msg_sender] - _value#662)]];
	totalSupply#145 := totalSupply#145[__this := (totalSupply#145[__this] - _value#662)];
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 212, 14} {:message ""} true;
	call Burn#264(__this, __msg_sender, __msg_value, call_arg#4, _value#662);
	success#665 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_13.sol", 215, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#700: [address_t]int;
// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 225, 5} {:message "BitCash::burnFrom"} burnFrom#756(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#703: address_t, _value#705: int)
	returns (success#708: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#177[__this][_from#703] >= _value#705);
	assume (_value#705 <= allowance#230[__this][_from#703][__msg_sender]);
	balanceOf#177 := balanceOf#177[__this := balanceOf#177[__this][_from#703 := (balanceOf#177[__this][_from#703] - _value#705)]];
	allowance#230 := allowance#230[__this := allowance#230[__this][_from#703 := allowance#230[__this][_from#703][__msg_sender := (allowance#230[__this][_from#703][__msg_sender] - _value#705)]]];
	totalSupply#145 := totalSupply#145[__this := (totalSupply#145[__this] - _value#705)];
	assume {:sourceloc "buggy_13.sol", 231, 14} {:message ""} true;
	call Burn#264(__this, __msg_sender, __msg_value, _from#703, _value#705);
	success#708 := true;
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_13.sol", 234, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#760: [address_t]int;
