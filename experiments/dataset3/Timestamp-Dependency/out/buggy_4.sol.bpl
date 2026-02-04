// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_4.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_4.sol", 21, 5} {:message "[event] IERC20::Transfer"} Transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, from#25: address_t, to#27: address_t, value#29: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_4.sol", 18, 5} {:message "IERC20::totalSupply"} totalSupply#7(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#5: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_4.sol", 19, 5} {:message "IERC20::balanceOf"} balanceOf#14(__this: address_t, __msg_sender: address_t, __msg_value: int, who#9: address_t)
	returns (#12: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_4.sol", 20, 5} {:message "IERC20::transfer"} transfer#23(__this: address_t, __msg_sender: address_t, __msg_value: int, to#16: address_t, value#18: int)
	returns (#21: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_4.sol", 17, 1} {:message "IERC20::[implicit_constructor]"} __constructor#32(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: PHO -------
// Inherits from: IERC20
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_4.sol", 29, 3} {:message "PHO::bug_tmstmp4"} bug_tmstmp4#82(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 30, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#39 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#39);
	pastBlockTime_tmstmp4#39 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_4.sol", 35, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_4.sol", 38, 3} {:message "name"} name#85: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_4.sol", 39, 3} {:message "winner_tmstmp7"} winner_tmstmp7#87: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 40, 1} {:message "PHO::play_tmstmp7"} play_tmstmp7#113(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#89: int)
{
	var {:sourceloc "buggy_4.sol", 41, 2} {:message "_vtime"} _vtime#93: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#93 := __block_timestamp;
	if (((startTime#89 + 432000) == _vtime#93)) {
	winner_tmstmp7#87 := winner_tmstmp7#87[__this := __msg_sender];
	}

	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_4.sol", 44, 3} {:message "symbol"} symbol#116: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_4.sol", 45, 3} {:message "winner_tmstmp23"} winner_tmstmp23#118: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 46, 1} {:message "PHO::play_tmstmp23"} play_tmstmp23#144(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#120: int)
{
	var {:sourceloc "buggy_4.sol", 47, 2} {:message "_vtime"} _vtime#124: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#124 := __block_timestamp;
	if (((startTime#120 + 432000) == _vtime#124)) {
	winner_tmstmp23#118 := winner_tmstmp23#118[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_4.sol", 50, 3} {:message "decimals"} decimals#147: [address_t]int;
// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_4.sol", 52, 3} {:message "winner_tmstmp14"} winner_tmstmp14#149: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 53, 1} {:message "PHO::play_tmstmp14"} play_tmstmp14#171(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#151: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#151 + 432000) == __block_timestamp)) {
	winner_tmstmp14#149 := winner_tmstmp14#149[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: saleAmount: uint256
var {:sourceloc "buggy_4.sol", 56, 3} {:message "saleAmount"} saleAmount#173: [address_t]int;
// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_4.sol", 57, 3} {:message "winner_tmstmp30"} winner_tmstmp30#175: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 58, 1} {:message "PHO::play_tmstmp30"} play_tmstmp30#197(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#177: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#177 + 432000) == __block_timestamp)) {
	winner_tmstmp30#175 := winner_tmstmp30#175[__this := __msg_sender];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: evtAmount: uint256
var {:sourceloc "buggy_4.sol", 61, 3} {:message "evtAmount"} evtAmount#199: [address_t]int;
// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_4.sol", 62, 3} {:message "PHO::bug_tmstmp8"} bug_tmstmp8#246(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 63, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#203: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#203 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#203);
	pastBlockTime_tmstmp8#203 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_4.sol", 68, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return5:
	// Function body ends here
}

// 
// State variable: teamAmount: uint256
var {:sourceloc "buggy_4.sol", 71, 3} {:message "teamAmount"} teamAmount#248: [address_t]int;
// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_4.sol", 73, 3} {:message "winner_tmstmp39"} winner_tmstmp39#250: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 74, 1} {:message "PHO::play_tmstmp39"} play_tmstmp39#276(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#252: int)
{
	var {:sourceloc "buggy_4.sol", 75, 2} {:message "_vtime"} _vtime#256: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#256 := __block_timestamp;
	if (((startTime#252 + 432000) == _vtime#256)) {
	winner_tmstmp39#250 := winner_tmstmp39#250[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_4.sol", 78, 3} {:message "_totalSupply"} _totalSupply#278: [address_t]int;
// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_4.sol", 79, 3} {:message "PHO::bug_tmstmp36"} bug_tmstmp36#325(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 80, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#282: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#282 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#282);
	pastBlockTime_tmstmp36#282 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_4.sol", 85, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return7:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 88, 3} {:message "balances"} balances#329: [address_t][address_t]int;
// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_4.sol", 90, 3} {:message "winner_tmstmp35"} winner_tmstmp35#331: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 91, 1} {:message "PHO::play_tmstmp35"} play_tmstmp35#357(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#333: int)
{
	var {:sourceloc "buggy_4.sol", 92, 2} {:message "_vtime"} _vtime#337: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#337 := __block_timestamp;
	if (((startTime#333 + 432000) == _vtime#337)) {
	winner_tmstmp35#331 := winner_tmstmp35#331[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_4.sol", 95, 3} {:message "owner"} owner#359: [address_t]address_t;
// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_4.sol", 96, 3} {:message "PHO::bug_tmstmp40"} bug_tmstmp40#406(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 97, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#363: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#363 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#363);
	pastBlockTime_tmstmp40#363 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_4.sol", 102, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// State variable: sale: address
var {:sourceloc "buggy_4.sol", 105, 3} {:message "sale"} sale#408: [address_t]address_t;
// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_4.sol", 106, 3} {:message "PHO::bug_tmstmp33"} bug_tmstmp33#419(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#411: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#411 := (__block_timestamp >= 1546300800);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: evt: address
var {:sourceloc "buggy_4.sol", 109, 3} {:message "evt"} evt#421: [address_t]address_t;
// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_4.sol", 110, 3} {:message "winner_tmstmp27"} winner_tmstmp27#423: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 111, 1} {:message "PHO::play_tmstmp27"} play_tmstmp27#449(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#425: int)
{
	var {:sourceloc "buggy_4.sol", 112, 2} {:message "_vtime"} _vtime#429: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#429 := __block_timestamp;
	if (((startTime#425 + 432000) == _vtime#429)) {
	winner_tmstmp27#423 := winner_tmstmp27#423[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// State variable: team: address
var {:sourceloc "buggy_4.sol", 115, 3} {:message "team"} team#451: [address_t]address_t;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_4.sol", 121, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#466: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
const unique address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561: address_t;
const unique address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6: address_t;
const unique address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_4.sol", 123, 5} {:message "PHO::[constructor]"} __constructor#828(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var toWei#823_ret#1: int;
	var call_arg#2: int;
	var toWei#823_ret#3: int;
	var call_arg#4: int;
	var toWei#823_ret#5: int;
	var call_arg#6: int;
	var toWei#823_ret#7: int;
	var call_arg#8: address_t;
	var transfer#760_ret#9: bool;
	var transfer#760_ret#10: bool;
	var transfer#760_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#85 := name#85[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	winner_tmstmp7#87 := winner_tmstmp7#87[__this := 0];
	symbol#116 := symbol#116[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	winner_tmstmp23#118 := winner_tmstmp23#118[__this := 0];
	decimals#147 := decimals#147[__this := 18];
	winner_tmstmp14#149 := winner_tmstmp14#149[__this := 0];
	saleAmount#173 := saleAmount#173[__this := 0];
	winner_tmstmp30#175 := winner_tmstmp30#175[__this := 0];
	evtAmount#199 := evtAmount#199[__this := 0];
	teamAmount#248 := teamAmount#248[__this := 0];
	winner_tmstmp39#250 := winner_tmstmp39#250[__this := 0];
	_totalSupply#278 := _totalSupply#278[__this := 0];
	balances#329 := balances#329[__this := default_address_t_int()];
	winner_tmstmp35#331 := winner_tmstmp35#331[__this := 0];
	owner#359 := owner#359[__this := 0];
	sale#408 := sale#408[__this := 0];
	evt#421 := evt#421[__this := 0];
	winner_tmstmp27#423 := winner_tmstmp27#423[__this := 0];
	team#451 := team#451[__this := 0];
	bugv_tmstmp4#466 := bugv_tmstmp4#466[__this := __block_timestamp];
	winner_tmstmp31#563 := winner_tmstmp31#563[__this := 0];
	bugv_tmstmp5#626 := bugv_tmstmp5#626[__this := __block_timestamp];
	bugv_tmstmp1#764 := bugv_tmstmp1#764[__this := __block_timestamp];
	bugv_tmstmp2#810 := bugv_tmstmp2#810[__this := __block_timestamp];
	bugv_tmstmp3#827 := bugv_tmstmp3#827[__this := __block_timestamp];
	// Function body starts here
	owner#359 := owner#359[__this := __msg_sender];
	sale#408 := sale#408[__this := address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561];
	evt#421 := evt#421[__this := address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6];
	team#451 := team#451[__this := address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C];
	call_arg#0 := 1000000000;
	assume {:sourceloc "buggy_4.sol", 129, 25} {:message ""} true;
	call toWei#823_ret#1 := toWei#823(__this, __msg_sender, __msg_value, call_arg#0);
	saleAmount#173 := saleAmount#173[__this := toWei#823_ret#1];
	call_arg#2 := 200000000;
	assume {:sourceloc "buggy_4.sol", 130, 25} {:message ""} true;
	call toWei#823_ret#3 := toWei#823(__this, __msg_sender, __msg_value, call_arg#2);
	evtAmount#199 := evtAmount#199[__this := toWei#823_ret#3];
	call_arg#4 := 800000000;
	assume {:sourceloc "buggy_4.sol", 131, 25} {:message ""} true;
	call toWei#823_ret#5 := toWei#823(__this, __msg_sender, __msg_value, call_arg#4);
	teamAmount#248 := teamAmount#248[__this := toWei#823_ret#5];
	call_arg#6 := 2000000000;
	assume {:sourceloc "buggy_4.sol", 132, 25} {:message ""} true;
	call toWei#823_ret#7 := toWei#823(__this, __msg_sender, __msg_value, call_arg#6);
	_totalSupply#278 := _totalSupply#278[__this := toWei#823_ret#7];
	assume (_totalSupply#278[__this] == ((saleAmount#173[__this] + evtAmount#199[__this]) + teamAmount#248[__this]));
	balances#329 := balances#329[__this := balances#329[__this][owner#359[__this] := _totalSupply#278[__this]]];
	call_arg#8 := 0;
	assume {:sourceloc "buggy_4.sol", 137, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#8, owner#359[__this], balances#329[__this][owner#359[__this]]);
	assume {:sourceloc "buggy_4.sol", 139, 9} {:message ""} true;
	call transfer#760_ret#9 := transfer#760(__this, __msg_sender, __msg_value, sale#408[__this], saleAmount#173[__this]);
	assume {:sourceloc "buggy_4.sol", 140, 9} {:message ""} true;
	call transfer#760_ret#10 := transfer#760(__this, __msg_sender, __msg_value, evt#421[__this], evtAmount#199[__this]);
	assume {:sourceloc "buggy_4.sol", 141, 9} {:message ""} true;
	call transfer#760_ret#11 := transfer#760(__this, __msg_sender, __msg_value, team#451[__this], teamAmount#248[__this]);
	assume (balances#329[__this][owner#359[__this]] == 0);
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_4.sol", 144, 1} {:message "winner_tmstmp31"} winner_tmstmp31#563: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 145, 1} {:message "PHO::play_tmstmp31"} play_tmstmp31#589(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#565: int)
{
	var {:sourceloc "buggy_4.sol", 146, 2} {:message "_vtime"} _vtime#569: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#569 := __block_timestamp;
	if (((startTime#565 + 432000) == _vtime#569)) {
	winner_tmstmp31#563 := winner_tmstmp31#563[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 150, 5} {:message "PHO::totalSupply"} totalSupply#598(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#593: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#593 := _totalSupply#278[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_4.sol", 153, 1} {:message "PHO::bug_tmstmp13"} bug_tmstmp13#609(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#601: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#601 := (__block_timestamp >= 1546300800);
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 157, 5} {:message "PHO::balanceOf"} balanceOf#622(__this: address_t, __msg_sender: address_t, __msg_value: int, who#611: address_t)
	returns (#615: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#615 := balances#329[__this][who#611];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_4.sol", 160, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#626: [address_t]int;
// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_4.sol", 162, 5} {:message "PHO::transfer"} transfer#760(__this: address_t, __msg_sender: address_t, __msg_value: int, to#628: address_t, value#630: int)
	returns (success#634: bool)
{
	var call_arg#12: int;
	var toWei#823_ret#13: int;
	var call_arg#14: int;
	var toWei#823_ret#15: int;
	var call_arg#16: int;
	var toWei#823_ret#17: int;
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender != to#628);
	assume (value#630 > 0);
	assume (balances#329[__this][__msg_sender] >= value#630);
	assume ((balances#329[__this][to#628] + value#630) >= balances#329[__this][to#628]);
	if ((__msg_sender == team#451[__this])) {
	assume (__block_timestamp >= 1589036400);
	call_arg#12 := 600000000;
	assume {:sourceloc "buggy_4.sol", 171, 47} {:message ""} true;
	call toWei#823_ret#13 := toWei#823(__this, __msg_sender, __msg_value, call_arg#12);
	if (((balances#329[__this][__msg_sender] - value#630) < toWei#823_ret#13)) {
	assume (__block_timestamp >= 1620572400);
	}

	call_arg#14 := 400000000;
	assume {:sourceloc "buggy_4.sol", 173, 47} {:message ""} true;
	call toWei#823_ret#15 := toWei#823(__this, __msg_sender, __msg_value, call_arg#14);
	if (((balances#329[__this][__msg_sender] - value#630) < toWei#823_ret#15)) {
	assume (__block_timestamp >= 1652108400);
	}

	call_arg#16 := 200000000;
	assume {:sourceloc "buggy_4.sol", 175, 47} {:message ""} true;
	call toWei#823_ret#17 := toWei#823(__this, __msg_sender, __msg_value, call_arg#16);
	if (((balances#329[__this][__msg_sender] - value#630) < toWei#823_ret#17)) {
	assume (__block_timestamp >= 1683644400);
	}

	}

	balances#329 := balances#329[__this := balances#329[__this][__msg_sender := (balances#329[__this][__msg_sender] - value#630)]];
	balances#329 := balances#329[__this := balances#329[__this][to#628 := (balances#329[__this][to#628] + value#630)]];
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_4.sol", 182, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#18, to#628, value#630);
	success#634 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_4.sol", 185, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#764: [address_t]int;
// 
// Function: burnCoins : function (uint256)
procedure {:sourceloc "buggy_4.sol", 187, 5} {:message "PHO::burnCoins"} burnCoins#806(__this: address_t, __msg_sender: address_t, __msg_value: int, value#766: int)
{
	var call_arg#19: address_t;
	var call_arg#20: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#329[__this][__msg_sender] >= value#766);
	assume (_totalSupply#278[__this] >= value#766);
	balances#329 := balances#329[__this := balances#329[__this][__msg_sender := (balances#329[__this][__msg_sender] - value#766)]];
	_totalSupply#278 := _totalSupply#278[__this := (_totalSupply#278[__this] - value#766)];
	call_arg#19 := __msg_sender;
	call_arg#20 := 0;
	assume {:sourceloc "buggy_4.sol", 194, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#19, call_arg#20, value#766);
	$return18:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_4.sol", 196, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#810: [address_t]int;
// 
// Function: toWei : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_4.sol", 202, 5} {:message "PHO::toWei"} toWei#823(__this: address_t, __msg_sender: address_t, __msg_value: int, value#813: int)
	returns (#816: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#816 := (value#813 * 1000000000000000000);
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_4.sol", 205, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#827: [address_t]int;
