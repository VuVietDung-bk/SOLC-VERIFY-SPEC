// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_24.sol -------
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
procedure {:inline 1} {:sourceloc "buggy_24.sol", 32, 5} {:message "SafeMath::add"} add#28(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var {:sourceloc "buggy_24.sol", 33, 9} {:message "c"} c#13: int;
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#13 := (a#5 + b#7);
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#13 >= a#5);
	#10 := c#13;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 48, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#31: int, b#33: int)
	returns (#36: int)
{
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var sub#73_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume {:sourceloc "buggy_24.sol", 49, 16} {:message ""} true;
	call sub#73_ret#4 := sub#73(__this, __msg_sender, __msg_value, a#31, b#33, call_arg#2);
	#36 := sub#73_ret#4;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256,string memory) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 64, 5} {:message "SafeMath::sub"} sub#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#48: int, b#50: int, errorMessage#52: int_arr_ptr)
	returns (#55: int)
{
	var {:sourceloc "buggy_24.sol", 66, 9} {:message "c"} c#65: int;
	// TCC assumptions
	assume (errorMessage#52 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#50 <= a#48);
	c#65 := (a#48 - b#50);
	#55 := c#65;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 80, 5} {:message "SafeMath::mul"} mul#108(__this: address_t, __msg_sender: address_t, __msg_value: int, a#76: int, b#78: int)
	returns (#81: int)
{
	var {:sourceloc "buggy_24.sol", 88, 9} {:message "c"} c#91: int;
	var call_arg#5: int_arr_ptr;
	var new_array#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#76 == 0)) {
	#81 := 0;
	goto $return3;
	}

	c#91 := (a#76 * b#78);
	new_array#6 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#5 := new_array#6;
	mem_arr_int := mem_arr_int[call_arg#5 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#91 div a#76) == b#78);
	#81 := c#91;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 105, 5} {:message "SafeMath::div"} div#125(__this: address_t, __msg_sender: address_t, __msg_value: int, a#111: int, b#113: int)
	returns (#116: int)
{
	var call_arg#7: int_arr_ptr;
	var new_array#8: int_arr_ptr;
	var div#153_ret#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#8 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#7 := new_array#8;
	mem_arr_int := mem_arr_int[call_arg#7 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume {:sourceloc "buggy_24.sol", 106, 16} {:message ""} true;
	call div#153_ret#9 := div#153(__this, __msg_sender, __msg_value, a#111, b#113, call_arg#7);
	#116 := div#153_ret#9;
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256,string memory) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 123, 5} {:message "SafeMath::div"} div#153(__this: address_t, __msg_sender: address_t, __msg_value: int, a#128: int, b#130: int, errorMessage#132: int_arr_ptr)
	returns (#135: int)
{
	var {:sourceloc "buggy_24.sol", 126, 9} {:message "c"} c#145: int;
	// TCC assumptions
	assume (errorMessage#132 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#130 > 0);
	c#145 := (a#128 div b#130);
	#135 := c#145;
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 143, 5} {:message "SafeMath::mod"} mod#170(__this: address_t, __msg_sender: address_t, __msg_value: int, a#156: int, b#158: int)
	returns (#161: int)
{
	var call_arg#10: int_arr_ptr;
	var new_array#11: int_arr_ptr;
	var mod#194_ret#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#10 := new_array#11;
	mem_arr_int := mem_arr_int[call_arg#10 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume {:sourceloc "buggy_24.sol", 144, 16} {:message ""} true;
	call mod#194_ret#12 := mod#194(__this, __msg_sender, __msg_value, a#156, b#158, call_arg#10);
	#161 := mod#194_ret#12;
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256,string memory) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 161, 5} {:message "SafeMath::mod"} mod#194(__this: address_t, __msg_sender: address_t, __msg_value: int, a#173: int, b#175: int, errorMessage#177: int_arr_ptr)
	returns (#180: int)
{
	// TCC assumptions
	assume (errorMessage#177 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#175 != 0);
	#180 := (a#173 mod b#175);
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_24.sol", 22, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// Pragma: solidity>=0.7.0
// 
// ------- Contract: FomoFeast -------
// Using library SafeMath for uint256
// 
// ------- Struct User -------
// Storage
type {:datatype} struct_storage_User#236;
function {:constructor} User#236#constr(totalInvestCount#201: int, totalInvestAmount#203: int, totalStaticCommissionWithdrawAmount#205: int, totalDynamicCommissionWithdrawAmount#207: int, totalWithdrawAmount#209: int, downlineCount#211: int, nodeCount#213: int, totalDownlineInvestAmount#215: int, currentInvestTime#217: int, currentInvestAmount#219: int, currentInvestCycle#221: int, currentlevel#223: int, currentStaticCommissionRatio#225: int, currentStaticCommissionWithdrawAmount#227: int, staticCommissionBalance#229: int, dynamicCommissionBalance#231: int, calcDynamicCommissionAmount#233: int, sponsorAddress#235: address_t) returns (struct_storage_User#236);
// Memory
type address_struct_memory_User#236 = int;
// Member totalInvestCount
var {:sourceloc "buggy_24.sol", 182, 9} {:message "totalInvestCount"} totalInvestCount#201: [address_struct_memory_User#236]int;
// Member totalInvestAmount
var {:sourceloc "buggy_24.sol", 183, 9} {:message "totalInvestAmount"} totalInvestAmount#203: [address_struct_memory_User#236]int;
// Member totalStaticCommissionWithdrawAmount
var {:sourceloc "buggy_24.sol", 184, 9} {:message "totalStaticCommissionWithdrawAmount"} totalStaticCommissionWithdrawAmount#205: [address_struct_memory_User#236]int;
// Member totalDynamicCommissionWithdrawAmount
var {:sourceloc "buggy_24.sol", 185, 9} {:message "totalDynamicCommissionWithdrawAmount"} totalDynamicCommissionWithdrawAmount#207: [address_struct_memory_User#236]int;
// Member totalWithdrawAmount
var {:sourceloc "buggy_24.sol", 186, 9} {:message "totalWithdrawAmount"} totalWithdrawAmount#209: [address_struct_memory_User#236]int;
// Member downlineCount
var {:sourceloc "buggy_24.sol", 187, 9} {:message "downlineCount"} downlineCount#211: [address_struct_memory_User#236]int;
// Member nodeCount
var {:sourceloc "buggy_24.sol", 188, 9} {:message "nodeCount"} nodeCount#213: [address_struct_memory_User#236]int;
// Member totalDownlineInvestAmount
var {:sourceloc "buggy_24.sol", 189, 9} {:message "totalDownlineInvestAmount"} totalDownlineInvestAmount#215: [address_struct_memory_User#236]int;
// Member currentInvestTime
var {:sourceloc "buggy_24.sol", 190, 9} {:message "currentInvestTime"} currentInvestTime#217: [address_struct_memory_User#236]int;
// Member currentInvestAmount
var {:sourceloc "buggy_24.sol", 191, 9} {:message "currentInvestAmount"} currentInvestAmount#219: [address_struct_memory_User#236]int;
// Member currentInvestCycle
var {:sourceloc "buggy_24.sol", 192, 9} {:message "currentInvestCycle"} currentInvestCycle#221: [address_struct_memory_User#236]int;
// Member currentlevel
var {:sourceloc "buggy_24.sol", 193, 9} {:message "currentlevel"} currentlevel#223: [address_struct_memory_User#236]int;
// Member currentStaticCommissionRatio
var {:sourceloc "buggy_24.sol", 194, 9} {:message "currentStaticCommissionRatio"} currentStaticCommissionRatio#225: [address_struct_memory_User#236]int;
// Member currentStaticCommissionWithdrawAmount
var {:sourceloc "buggy_24.sol", 195, 9} {:message "currentStaticCommissionWithdrawAmount"} currentStaticCommissionWithdrawAmount#227: [address_struct_memory_User#236]int;
// Member staticCommissionBalance
var {:sourceloc "buggy_24.sol", 196, 9} {:message "staticCommissionBalance"} staticCommissionBalance#229: [address_struct_memory_User#236]int;
// Member dynamicCommissionBalance
var {:sourceloc "buggy_24.sol", 197, 9} {:message "dynamicCommissionBalance"} dynamicCommissionBalance#231: [address_struct_memory_User#236]int;
// Member calcDynamicCommissionAmount
var {:sourceloc "buggy_24.sol", 198, 9} {:message "calcDynamicCommissionAmount"} calcDynamicCommissionAmount#233: [address_struct_memory_User#236]int;
// Member sponsorAddress
var {:sourceloc "buggy_24.sol", 199, 9} {:message "sponsorAddress"} sponsorAddress#235: [address_struct_memory_User#236]address_t;
// 
// ------- End of struct User -------
// 
// ------- Struct InvestRecord -------
// Storage
type {:datatype} struct_storage_InvestRecord#243;
function {:constructor} InvestRecord#243#constr(time#238: int, amount#240: int, cycle#242: int) returns (struct_storage_InvestRecord#243);
// Memory
type address_struct_memory_InvestRecord#243 = int;
// Member time
var {:sourceloc "buggy_24.sol", 203, 9} {:message "time"} time#238: [address_struct_memory_InvestRecord#243]int;
// Member amount
var {:sourceloc "buggy_24.sol", 204, 9} {:message "amount"} amount#240: [address_struct_memory_InvestRecord#243]int;
// Member cycle
var {:sourceloc "buggy_24.sol", 205, 9} {:message "cycle"} cycle#242: [address_struct_memory_InvestRecord#243]int;
// 
// ------- End of struct InvestRecord -------
// 
// ------- Struct CommissionRecord -------
// Storage
type {:datatype} struct_storage_CommissionRecord#248;
function {:constructor} CommissionRecord#248#constr(time#245: int, amount#247: int) returns (struct_storage_CommissionRecord#248);
// Memory
type address_struct_memory_CommissionRecord#248 = int;
// Member time
var {:sourceloc "buggy_24.sol", 209, 9} {:message "time"} time#245: [address_struct_memory_CommissionRecord#248]int;
// Member amount
var {:sourceloc "buggy_24.sol", 210, 9} {:message "amount"} amount#247: [address_struct_memory_CommissionRecord#248]int;
// 
// ------- End of struct CommissionRecord -------
// 
// State variable: initialized: bool
var {:sourceloc "buggy_24.sol", 219, 5} {:message "initialized"} initialized#263: [address_t]bool;
// 
// State variable: winner_tmstmp18: address
var {:sourceloc "buggy_24.sol", 222, 3} {:message "winner_tmstmp18"} winner_tmstmp18#265: [address_t]address_t;
// 
// Function: play_tmstmp18 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 223, 1} {:message "FomoFeast::play_tmstmp18"} play_tmstmp18#287(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#267: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#267 + 432000) == __block_timestamp)) {
	winner_tmstmp18#265 := winner_tmstmp18#265[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_24.sol", 226, 3} {:message "owner"} owner#289: [address_t]address_t;
// 
// Function: bug_tmstmp29 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 228, 3} {:message "FomoFeast::bug_tmstmp29"} bug_tmstmp29#300(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#292: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#292 := (__block_timestamp >= 1546300800);
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// State variable: totalInvestCount: uint256
var {:sourceloc "buggy_24.sol", 231, 3} {:message "totalInvestCount"} totalInvestCount#302: [address_t]int;
// 
// State variable: winner_tmstmp6: address
var {:sourceloc "buggy_24.sol", 232, 3} {:message "winner_tmstmp6"} winner_tmstmp6#304: [address_t]address_t;
// 
// Function: play_tmstmp6 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 233, 1} {:message "FomoFeast::play_tmstmp6"} play_tmstmp6#326(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#306: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#306 + 432000) == __block_timestamp)) {
	winner_tmstmp6#304 := winner_tmstmp6#304[__this := __msg_sender];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: totalInvestAmount: uint256
var {:sourceloc "buggy_24.sol", 236, 3} {:message "totalInvestAmount"} totalInvestAmount#328: [address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp16 : function ()
procedure {:sourceloc "buggy_24.sol", 237, 3} {:message "FomoFeast::bug_tmstmp16"} bug_tmstmp16#375(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 238, 2} {:message "pastBlockTime_tmstmp16"} pastBlockTime_tmstmp16#332: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp16#332 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp16#332);
	pastBlockTime_tmstmp16#332 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 243, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// State variable: totalStaticCommissionWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 246, 3} {:message "totalStaticCommissionWithdrawAmount"} totalStaticCommissionWithdrawAmount#377: [address_t]int;
// 
// Function: bug_tmstmp24 : function ()
procedure {:sourceloc "buggy_24.sol", 247, 3} {:message "FomoFeast::bug_tmstmp24"} bug_tmstmp24#424(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 248, 2} {:message "pastBlockTime_tmstmp24"} pastBlockTime_tmstmp24#381: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp24#381 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp24#381);
	pastBlockTime_tmstmp24#381 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 253, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return12:
	// Function body ends here
}

// 
// State variable: totalDynamicCommissionWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 256, 3} {:message "totalDynamicCommissionWithdrawAmount"} totalDynamicCommissionWithdrawAmount#426: [address_t]int;
// 
// Function: bug_tmstmp5 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 257, 3} {:message "FomoFeast::bug_tmstmp5"} bug_tmstmp5#437(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#429: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#429 := (__block_timestamp >= 1546300800);
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: totalWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 260, 3} {:message "totalWithdrawAmount"} totalWithdrawAmount#439: [address_t]int;
// 
// State variable: winner_tmstmp15: address
var {:sourceloc "buggy_24.sol", 261, 3} {:message "winner_tmstmp15"} winner_tmstmp15#441: [address_t]address_t;
// 
// Function: play_tmstmp15 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 262, 1} {:message "FomoFeast::play_tmstmp15"} play_tmstmp15#467(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#443: int)
{
	var {:sourceloc "buggy_24.sol", 263, 2} {:message "_vtime"} _vtime#447: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#447 := __block_timestamp;
	if (((startTime#443 + 432000) == _vtime#447)) {
	winner_tmstmp15#441 := winner_tmstmp15#441[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: totalUserCount: uint256
var {:sourceloc "buggy_24.sol", 266, 3} {:message "totalUserCount"} totalUserCount#469: [address_t]int;
// 
// Function: bug_tmstmp28 : function ()
procedure {:sourceloc "buggy_24.sol", 267, 3} {:message "FomoFeast::bug_tmstmp28"} bug_tmstmp28#516(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 268, 2} {:message "pastBlockTime_tmstmp28"} pastBlockTime_tmstmp28#473: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp28#473 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp28#473);
	pastBlockTime_tmstmp28#473 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 273, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return15:
	// Function body ends here
}

// 
// State variable: engineerFunds: uint256
var {:sourceloc "buggy_24.sol", 276, 3} {:message "engineerFunds"} engineerFunds#518: [address_t]int;
// 
// State variable: winner_tmstmp34: address
var {:sourceloc "buggy_24.sol", 277, 3} {:message "winner_tmstmp34"} winner_tmstmp34#520: [address_t]address_t;
// 
// Function: play_tmstmp34 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 278, 1} {:message "FomoFeast::play_tmstmp34"} play_tmstmp34#542(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#522: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#522 + 432000) == __block_timestamp)) {
	winner_tmstmp34#520 := winner_tmstmp34#520[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: engineerWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 281, 3} {:message "engineerWithdrawAmount"} engineerWithdrawAmount#544: [address_t]int;
// 
// Function: bug_tmstmp21 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 282, 3} {:message "FomoFeast::bug_tmstmp21"} bug_tmstmp21#555(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#547: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#547 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: operatorFunds: uint256
var {:sourceloc "buggy_24.sol", 285, 3} {:message "operatorFunds"} operatorFunds#557: [address_t]int;
// 
// State variable: winner_tmstmp10: address
var {:sourceloc "buggy_24.sol", 286, 3} {:message "winner_tmstmp10"} winner_tmstmp10#559: [address_t]address_t;
// 
// Function: play_tmstmp10 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 287, 1} {:message "FomoFeast::play_tmstmp10"} play_tmstmp10#581(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#561: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#561 + 432000) == __block_timestamp)) {
	winner_tmstmp10#559 := winner_tmstmp10#559[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// State variable: operatorWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 290, 3} {:message "operatorWithdrawAmount"} operatorWithdrawAmount#583: [address_t]int;
// 
// State variable: winner_tmstmp22: address
var {:sourceloc "buggy_24.sol", 292, 3} {:message "winner_tmstmp22"} winner_tmstmp22#585: [address_t]address_t;
// 
// Function: play_tmstmp22 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 293, 1} {:message "FomoFeast::play_tmstmp22"} play_tmstmp22#607(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#587: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#587 + 432000) == __block_timestamp)) {
	winner_tmstmp22#585 := winner_tmstmp22#585[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// State variable: userMapping: mapping(address => struct FomoFeast.User storage ref)
var {:sourceloc "buggy_24.sol", 296, 3} {:message "userMapping"} userMapping#611: [address_t][address_t]struct_storage_User#236;
// 
// Function: bug_tmstmp12 : function ()
procedure {:sourceloc "buggy_24.sol", 297, 3} {:message "FomoFeast::bug_tmstmp12"} bug_tmstmp12#658(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 298, 2} {:message "pastBlockTime_tmstmp12"} pastBlockTime_tmstmp12#615: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp12#615 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp12#615);
	pastBlockTime_tmstmp12#615 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 303, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return20:
	// Function body ends here
}

// 
// State variable: addressMapping: mapping(uint256 => address)
var {:sourceloc "buggy_24.sol", 306, 3} {:message "addressMapping"} addressMapping#662: [address_t][int]address_t;
// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_24.sol", 307, 3} {:message "winner_tmstmp11"} winner_tmstmp11#664: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 308, 1} {:message "FomoFeast::play_tmstmp11"} play_tmstmp11#690(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#666: int)
{
	var {:sourceloc "buggy_24.sol", 309, 2} {:message "_vtime"} _vtime#670: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#670 := __block_timestamp;
	if (((startTime#666 + 432000) == _vtime#670)) {
	winner_tmstmp11#664 := winner_tmstmp11#664[__this := __msg_sender];
	}

	$return21:
	// Function body ends here
}

// 
// State variable: investRecordMapping: mapping(address => struct FomoFeast.InvestRecord storage ref[9] storage ref)
type {:datatype} struct_storage_InvestRecord#243_arr_type;
function {:constructor} struct_storage_InvestRecord#243_arr#constr(arr: [int]struct_storage_InvestRecord#243, length: int) returns (struct_storage_InvestRecord#243_arr_type);
var {:sourceloc "buggy_24.sol", 312, 3} {:message "investRecordMapping"} investRecordMapping#696: [address_t][address_t]struct_storage_InvestRecord#243_arr_type;
// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 313, 3} {:message "FomoFeast::bug_tmstmp1"} bug_tmstmp1#707(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#699: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#699 := (__block_timestamp >= 1546300800);
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: staticCommissionRecordMapping: mapping(address => struct FomoFeast.CommissionRecord storage ref[9] storage ref)
type {:datatype} struct_storage_CommissionRecord#248_arr_type;
function {:constructor} struct_storage_CommissionRecord#248_arr#constr(arr: [int]struct_storage_CommissionRecord#248, length: int) returns (struct_storage_CommissionRecord#248_arr_type);
var {:sourceloc "buggy_24.sol", 316, 3} {:message "staticCommissionRecordMapping"} staticCommissionRecordMapping#713: [address_t][address_t]struct_storage_CommissionRecord#248_arr_type;
// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_24.sol", 317, 3} {:message "winner_tmstmp2"} winner_tmstmp2#715: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 318, 1} {:message "FomoFeast::play_tmstmp2"} play_tmstmp2#737(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#717: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#717 + 432000) == __block_timestamp)) {
	winner_tmstmp2#715 := winner_tmstmp2#715[__this := __msg_sender];
	}

	$return23:
	// Function body ends here
}

// 
// State variable: dynamicCommissionRecordMapping: mapping(address => struct FomoFeast.CommissionRecord storage ref[9] storage ref)
var {:sourceloc "buggy_24.sol", 321, 3} {:message "dynamicCommissionRecordMapping"} dynamicCommissionRecordMapping#743: [address_t][address_t]struct_storage_CommissionRecord#248_arr_type;
const unique address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9: address_t;
// 
// Function: initialize : function ()
procedure {:sourceloc "buggy_24.sol", 334, 5} {:message "FomoFeast::initialize"} initialize#791(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int_arr_ptr;
	var new_array#14: int_arr_ptr;
	var call_arg#15: int;
	var call_arg#16: int;
	var call_arg#17: int;
	var call_arg#18: int;
	var call_arg#19: int;
	var call_arg#20: int;
	var call_arg#21: int;
	var call_arg#22: int;
	var call_arg#23: int;
	var call_arg#24: int;
	var call_arg#25: int;
	var call_arg#26: int;
	var call_arg#27: int;
	var call_arg#28: int;
	var call_arg#29: int;
	var call_arg#30: int;
	var call_arg#31: int;
	var call_arg#32: address_t;
	var new_struct_User#33: address_struct_memory_User#236;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#13 := new_array#14;
	mem_arr_int := mem_arr_int[call_arg#13 := int_arr#constr(default_int_int()[0 := 97][1 := 108][2 := 114][3 := 101][4 := 97][5 := 100][6 := 121][7 := 32][8 := 105][9 := 110][10 := 105][11 := 116][12 := 105][13 := 97][14 := 108][15 := 105][16 := 122][17 := 101][18 := 100], 19)];
	assume !(initialized#263[__this]);
	owner#289 := owner#289[__this := __msg_sender];
	call_arg#15 := 1;
	call_arg#16 := 0;
	call_arg#17 := 0;
	call_arg#18 := 0;
	call_arg#19 := 0;
	call_arg#20 := 0;
	call_arg#21 := 0;
	call_arg#22 := 0;
	call_arg#23 := 0;
	call_arg#24 := 0;
	call_arg#25 := 0;
	call_arg#26 := 0;
	call_arg#27 := 0;
	call_arg#28 := 0;
	call_arg#29 := 0;
	call_arg#30 := 0;
	call_arg#31 := 0;
	call_arg#32 := 0;
	new_struct_User#33 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	totalInvestCount#201 := totalInvestCount#201[new_struct_User#33 := call_arg#15];
	totalInvestAmount#203 := totalInvestAmount#203[new_struct_User#33 := call_arg#16];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[new_struct_User#33 := call_arg#17];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[new_struct_User#33 := call_arg#18];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[new_struct_User#33 := call_arg#19];
	downlineCount#211 := downlineCount#211[new_struct_User#33 := call_arg#20];
	nodeCount#213 := nodeCount#213[new_struct_User#33 := call_arg#21];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[new_struct_User#33 := call_arg#22];
	currentInvestTime#217 := currentInvestTime#217[new_struct_User#33 := call_arg#23];
	currentInvestAmount#219 := currentInvestAmount#219[new_struct_User#33 := call_arg#24];
	currentInvestCycle#221 := currentInvestCycle#221[new_struct_User#33 := call_arg#25];
	currentlevel#223 := currentlevel#223[new_struct_User#33 := call_arg#26];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[new_struct_User#33 := call_arg#27];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[new_struct_User#33 := call_arg#28];
	staticCommissionBalance#229 := staticCommissionBalance#229[new_struct_User#33 := call_arg#29];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[new_struct_User#33 := call_arg#30];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[new_struct_User#33 := call_arg#31];
	sponsorAddress#235 := sponsorAddress#235[new_struct_User#33 := call_arg#32];
	// Deep copy struct User
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201[new_struct_User#33], totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203[new_struct_User#33], totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205[new_struct_User#33], totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207[new_struct_User#33], totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209[new_struct_User#33], downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211[new_struct_User#33], nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213[new_struct_User#33], totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215[new_struct_User#33], currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217[new_struct_User#33], currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219[new_struct_User#33], currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221[new_struct_User#33], currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223[new_struct_User#33], currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225[new_struct_User#33], currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227[new_struct_User#33], staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229[new_struct_User#33], dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231[new_struct_User#33], calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233[new_struct_User#33], sponsorAddress#235#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#211#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#213#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#217#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#223#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#235[new_struct_User#33])]];
	initialized#263 := initialized#263[__this := true];
	$return24:
	// Function body ends here
}

// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 340, 1} {:message "FomoFeast::bug_tmstmp17"} bug_tmstmp17#802(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#794: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#794 := (__block_timestamp >= 1546300800);
	goto $return25;
	$return25:
	// Function body ends here
}

function {:builtin "((as const (Array Int |T@struct_storage_User#236|)) (|User#236#constr| 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))"} default_address_t_struct_storage_User#236() returns ([address_t]struct_storage_User#236);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
function {:builtin "((as const (Array Int |T@struct_storage_InvestRecord#243|)) (|InvestRecord#243#constr| 0 0 0))"} default_int_struct_storage_InvestRecord#243() returns ([int]struct_storage_InvestRecord#243);
function {:builtin "((as const (Array Int |T@struct_storage_InvestRecord#243_arr_type|)) (|struct_storage_InvestRecord#243_arr#constr| ((as const (Array Int |T@struct_storage_InvestRecord#243|)) (|InvestRecord#243#constr| 0 0 0)) 9))"} default_address_t_struct_storage_InvestRecord#243_arr_type() returns ([address_t]struct_storage_InvestRecord#243_arr_type);
function {:builtin "((as const (Array Int |T@struct_storage_CommissionRecord#248|)) (|CommissionRecord#248#constr| 0 0))"} default_int_struct_storage_CommissionRecord#248() returns ([int]struct_storage_CommissionRecord#248);
function {:builtin "((as const (Array Int |T@struct_storage_CommissionRecord#248_arr_type|)) (|struct_storage_CommissionRecord#248_arr#constr| ((as const (Array Int |T@struct_storage_CommissionRecord#248|)) (|CommissionRecord#248#constr| 0 0)) 9))"} default_address_t_struct_storage_CommissionRecord#248_arr_type() returns ([address_t]struct_storage_CommissionRecord#248_arr_type);
// 
// Function: 
procedure {:sourceloc "buggy_24.sol", 350, 5} {:message "FomoFeast::[constructor]"} __constructor#3935(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	initialized#263 := initialized#263[__this := false];
	winner_tmstmp18#265 := winner_tmstmp18#265[__this := 0];
	owner#289 := owner#289[__this := 0];
	totalInvestCount#302 := totalInvestCount#302[__this := 0];
	winner_tmstmp6#304 := winner_tmstmp6#304[__this := 0];
	totalInvestAmount#328 := totalInvestAmount#328[__this := 0];
	totalStaticCommissionWithdrawAmount#377 := totalStaticCommissionWithdrawAmount#377[__this := 0];
	totalDynamicCommissionWithdrawAmount#426 := totalDynamicCommissionWithdrawAmount#426[__this := 0];
	totalWithdrawAmount#439 := totalWithdrawAmount#439[__this := 0];
	winner_tmstmp15#441 := winner_tmstmp15#441[__this := 0];
	totalUserCount#469 := totalUserCount#469[__this := 0];
	engineerFunds#518 := engineerFunds#518[__this := 0];
	winner_tmstmp34#520 := winner_tmstmp34#520[__this := 0];
	engineerWithdrawAmount#544 := engineerWithdrawAmount#544[__this := 0];
	operatorFunds#557 := operatorFunds#557[__this := 0];
	winner_tmstmp10#559 := winner_tmstmp10#559[__this := 0];
	operatorWithdrawAmount#583 := operatorWithdrawAmount#583[__this := 0];
	winner_tmstmp22#585 := winner_tmstmp22#585[__this := 0];
	userMapping#611 := userMapping#611[__this := default_address_t_struct_storage_User#236()];
	addressMapping#662 := addressMapping#662[__this := default_int_address_t()];
	winner_tmstmp11#664 := winner_tmstmp11#664[__this := 0];
	investRecordMapping#696 := investRecordMapping#696[__this := default_address_t_struct_storage_InvestRecord#243_arr_type()];
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := default_address_t_struct_storage_CommissionRecord#248_arr_type()];
	winner_tmstmp2#715 := winner_tmstmp2#715[__this := 0];
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := default_address_t_struct_storage_CommissionRecord#248_arr_type()];
	bugv_tmstmp3#838 := bugv_tmstmp3#838[__this := __block_timestamp];
	bugv_tmstmp4#854 := bugv_tmstmp4#854[__this := __block_timestamp];
	winner_tmstmp3#879 := winner_tmstmp3#879[__this := 0];
	winner_tmstmp19#1058 := winner_tmstmp19#1058[__this := 0];
	winner_tmstmp26#1176 := winner_tmstmp26#1176[__this := 0];
	winner_tmstmp38#1538 := winner_tmstmp38#1538[__this := 0];
	winner_tmstmp7#1717 := winner_tmstmp7#1717[__this := 0];
	winner_tmstmp23#2134 := winner_tmstmp23#2134[__this := 0];
	winner_tmstmp14#2274 := winner_tmstmp14#2274[__this := 0];
	winner_tmstmp30#2438 := winner_tmstmp30#2438[__this := 0];
	winner_tmstmp39#2579 := winner_tmstmp39#2579[__this := 0];
	winner_tmstmp35#2740 := winner_tmstmp35#2740[__this := 0];
	winner_tmstmp27#3150 := winner_tmstmp27#3150[__this := 0];
	winner_tmstmp31#3312 := winner_tmstmp31#3312[__this := 0];
	bugv_tmstmp5#3662 := bugv_tmstmp5#3662[__this := __block_timestamp];
	bugv_tmstmp1#3868 := bugv_tmstmp1#3868[__this := __block_timestamp];
	bugv_tmstmp2#3934 := bugv_tmstmp2#3934[__this := __block_timestamp];
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 351, 9} {:message ""} true;
	call initialize#791(__this, __msg_sender, __msg_value);
	$return26:
	// Function body ends here
}

// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 353, 1} {:message "FomoFeast::bug_tmstmp37"} bug_tmstmp37#821(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#813: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#813 := (__block_timestamp >= 1546300800);
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_24.sol", 366, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#838: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_24.sol", 372, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#854: [address_t]int;
// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_24.sol", 378, 5} {:message "FomoFeast::transferOwnership"} transferOwnership#877(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#857: address_t)
{
	var call_arg#35: int_arr_ptr;
	var new_array#36: int_arr_ptr;
	var call_arg#38: int_arr_ptr;
	var new_array#39: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#36 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#35 := new_array#36;
	mem_arr_int := mem_arr_int[call_arg#35 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#289[__this]);
	// Function body starts here
	new_array#39 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#38 := new_array#39;
	mem_arr_int := mem_arr_int[call_arg#38 := int_arr#constr(default_int_int()[0 := 99][1 := 97][2 := 110][3 := 110][4 := 111][5 := 116][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 111][17 := 119][18 := 110][19 := 101][20 := 114][21 := 115][22 := 104][23 := 105][24 := 112][25 := 32][26 := 116][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115][36 := 32][37 := 122][38 := 101][39 := 114][40 := 111], 41)];
	assume (newOwner#857 != 0);
	owner#289 := owner#289[__this := newOwner#857];
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_24.sol", 382, 1} {:message "winner_tmstmp3"} winner_tmstmp3#879: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 383, 1} {:message "FomoFeast::play_tmstmp3"} play_tmstmp3#905(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#881: int)
{
	var {:sourceloc "buggy_24.sol", 384, 2} {:message "_vtime"} _vtime#885: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#885 := __block_timestamp;
	if (((startTime#881 + 432000) == _vtime#885)) {
	winner_tmstmp3#879 := winner_tmstmp3#879[__this := __msg_sender];
	}

	$return30:
	// Function body ends here
}

// 
// Function: getLevelByInvestAmount : function (uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 388, 5} {:message "FomoFeast::getLevelByInvestAmount"} getLevelByInvestAmount#942(__this: address_t, __msg_sender: address_t, __msg_value: int, investAmount#907: int)
	returns (level#910: int)
{
	var call_arg#40: int;
	var mul#108_ret#41: int;
	var call_arg#42: int;
	var mul#108_ret#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#40 := 11;
	assume {:sourceloc "buggy_24.sol", 389, 29} {:message ""} true;
	call mul#108_ret#41 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#40);
	if ((investAmount#907 >= mul#108_ret#41)) {
	level#910 := 3;
	}
	else {
	call_arg#42 := 6;
	assume {:sourceloc "buggy_24.sol", 391, 36} {:message ""} true;
	call mul#108_ret#43 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#42);
	if ((investAmount#907 >= mul#108_ret#43)) {
	level#910 := 2;
	}
	else {
	level#910 := 1;
	}

	}

	$return31:
	// Function body ends here
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 397, 1} {:message "FomoFeast::bug_tmstmp9"} bug_tmstmp9#953(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#945: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#945 := (__block_timestamp >= 1546300800);
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// Function: isInvestExpired : function (struct FomoFeast.User memory) view returns (bool)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 401, 5} {:message "FomoFeast::isInvestExpired"} isInvestExpired#977(__this: address_t, __msg_sender: address_t, __msg_value: int, user#955: address_struct_memory_User#236)
	returns (expired#958: bool)
{
	var mul#108_ret#44: int;
	var add#28_ret#45: int;
	// TCC assumptions
	assume (user#955 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 402, 47} {:message ""} true;
	call mul#108_ret#44 := mul#108(__this, __msg_sender, __msg_value, currentInvestCycle#221[user#955], 86400);
	assume {:sourceloc "buggy_24.sol", 402, 20} {:message ""} true;
	call add#28_ret#45 := add#28(__this, __msg_sender, __msg_value, currentInvestTime#217[user#955], mul#108_ret#44);
	expired#958 := (add#28_ret#45 < __block_timestamp);
	$return33:
	// Function body ends here
}

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 404, 1} {:message "FomoFeast::bug_tmstmp25"} bug_tmstmp25#988(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#980: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#980 := (__block_timestamp >= 1546300800);
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: getAbortInvestAmount : function (struct FomoFeast.User memory) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 408, 5} {:message "FomoFeast::getAbortInvestAmount"} getAbortInvestAmount#1056(__this: address_t, __msg_sender: address_t, __msg_value: int, user#990: address_struct_memory_User#236)
	returns (amount#993: int)
{
	var {:sourceloc "buggy_24.sol", 409, 9} {:message "commissionDays"} commissionDays#996: int;
	var sub#45_ret#46: int;
	var div#125_ret#47: int;
	var call_arg#48: int_arr_ptr;
	var new_array#49: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 411, 9} {:message "lossRatio"} lossRatio#1015: int;
	var mul#108_ret#50: int;
	var call_arg#51: int;
	var div#125_ret#52: int;
	var sub#45_ret#53: int;
	// TCC assumptions
	assume (user#990 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 409, 34} {:message ""} true;
	call sub#45_ret#46 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#217[user#990]);
	assume {:sourceloc "buggy_24.sol", 409, 34} {:message ""} true;
	call div#125_ret#47 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#46, 86400);
	commissionDays#996 := div#125_ret#47;
	new_array#49 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#48 := new_array#49;
	mem_arr_int := mem_arr_int[call_arg#48 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 101][4 := 115][5 := 116][6 := 32][7 := 116][8 := 105][9 := 109][10 := 101][11 := 32][12 := 109][13 := 117][14 := 115][15 := 116][16 := 32][17 := 62][18 := 61][19 := 32][20 := 51][21 := 100][22 := 97][23 := 121][24 := 115], 25)];
	assume (commissionDays#996 >= 3);
	lossRatio#1015 := 15;
	if ((commissionDays#996 >= 60)) {
	lossRatio#1015 := 5;
	}
	else {
	if ((commissionDays#996 >= 30)) {
	lossRatio#1015 := 10;
	}

	}

	amount#993 := currentInvestAmount#219[user#990];
	assume {:sourceloc "buggy_24.sol", 418, 29} {:message ""} true;
	call mul#108_ret#50 := mul#108(__this, __msg_sender, __msg_value, currentInvestAmount#219[user#990], lossRatio#1015);
	call_arg#51 := 100;
	assume {:sourceloc "buggy_24.sol", 418, 29} {:message ""} true;
	call div#125_ret#52 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#50, call_arg#51);
	assume {:sourceloc "buggy_24.sol", 418, 18} {:message ""} true;
	call sub#45_ret#53 := sub#45(__this, __msg_sender, __msg_value, amount#993, div#125_ret#52);
	amount#993 := sub#45_ret#53;
	$return35:
	// Function body ends here
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_24.sol", 420, 1} {:message "winner_tmstmp19"} winner_tmstmp19#1058: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 421, 1} {:message "FomoFeast::play_tmstmp19"} play_tmstmp19#1084(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1060: int)
{
	var {:sourceloc "buggy_24.sol", 422, 2} {:message "_vtime"} _vtime#1064: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1064 := __block_timestamp;
	if (((startTime#1060 + 432000) == _vtime#1064)) {
	winner_tmstmp19#1058 := winner_tmstmp19#1058[__this := __msg_sender];
	}

	$return36:
	// Function body ends here
}

// 
// Function: getStaticCommissionRatio : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 426, 5} {:message "FomoFeast::getStaticCommissionRatio"} getStaticCommissionRatio#1174(__this: address_t, __msg_sender: address_t, __msg_value: int, level#1086: int, investCycle#1088: int)
	returns (ratio#1091: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((level#1086 == 1)) {
	if ((investCycle#1088 == 30)) {
	ratio#1091 := 7;
	}
	else {
	if ((investCycle#1088 == 60)) {
	ratio#1091 := 8;
	}
	else {
	ratio#1091 := 9;
	}

	}

	}
	else {
	if ((level#1086 == 2)) {
	if ((investCycle#1088 == 30)) {
	ratio#1091 := 8;
	}
	else {
	if ((investCycle#1088 == 60)) {
	ratio#1091 := 9;
	}
	else {
	ratio#1091 := 10;
	}

	}

	}
	else {
	if ((investCycle#1088 == 30)) {
	ratio#1091 := 11;
	}
	else {
	if ((investCycle#1088 == 60)) {
	ratio#1091 := 12;
	}
	else {
	ratio#1091 := 13;
	}

	}

	}

	}

	$return37:
	// Function body ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_24.sol", 453, 1} {:message "winner_tmstmp26"} winner_tmstmp26#1176: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 454, 1} {:message "FomoFeast::play_tmstmp26"} play_tmstmp26#1198(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1178: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1178 + 432000) == __block_timestamp)) {
	winner_tmstmp26#1176 := winner_tmstmp26#1176[__this := __msg_sender];
	}

	$return38:
	// Function body ends here
}

// 
// Function: getDynamicCommissionRatio : function (struct FomoFeast.User memory,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 458, 5} {:message "FomoFeast::getDynamicCommissionRatio"} getDynamicCommissionRatio#1316(__this: address_t, __msg_sender: address_t, __msg_value: int, user#1200: address_struct_memory_User#236, depth#1202: int)
	returns (ratio#1205: int)
{
	// TCC assumptions
	assume (user#1200 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	if ((currentlevel#223[user#1200] == 1)) {
	if ((depth#1202 == 1)) {
	ratio#1205 := 50;
	}
	else {
	ratio#1205 := 0;
	}

	}
	else {
	if ((currentlevel#223[user#1200] == 2)) {
	if ((depth#1202 == 1)) {
	ratio#1205 := 70;
	}
	else {
	if ((depth#1202 == 2)) {
	ratio#1205 := 50;
	}
	else {
	ratio#1205 := 0;
	}

	}

	}
	else {
	if ((depth#1202 == 1)) {
	ratio#1205 := 100;
	}
	else {
	if ((depth#1202 == 2)) {
	ratio#1205 := 70;
	}
	else {
	if ((depth#1202 == 3)) {
	ratio#1205 := 50;
	}
	else {
	if (((depth#1202 >= 4) && (depth#1202 <= 10))) {
	ratio#1205 := 10;
	}
	else {
	if (((depth#1202 >= 11) && (depth#1202 <= 20))) {
	ratio#1205 := 5;
	}
	else {
	ratio#1205 := 1;
	}

	}

	}

	}

	}

	}

	}

	$return39:
	// Function body ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_24.sol", 489, 1} {:message "FomoFeast::bug_tmstmp20"} bug_tmstmp20#1363(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 490, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#1320: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#1320 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#1320);
	pastBlockTime_tmstmp20#1320 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 495, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return40:
	// Function body ends here
}

// 
// Function: getAvaliableStaticCommissionAmount : function (struct FomoFeast.User memory) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 499, 5} {:message "FomoFeast::getAvaliableStaticCommissionAmount"} getAvaliableStaticCommissionAmount#1432(__this: address_t, __msg_sender: address_t, __msg_value: int, user#1365: address_struct_memory_User#236)
	returns (amount#1368: int)
{
	var {:sourceloc "buggy_24.sol", 503, 13} {:message "commissionDays"} commissionDays#1380: int;
	var sub#45_ret#54: int;
	var div#125_ret#55: int;
	var mul#108_ret#56: int;
	var mul#108_ret#57: int;
	var call_arg#58: int;
	var div#125_ret#59: int;
	var sub#45_ret#60: int;
	// TCC assumptions
	assume (user#1365 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	if ((currentInvestAmount#219[user#1365] == 0)) {
	amount#1368 := 0;
	}
	else {
	assume {:sourceloc "buggy_24.sol", 503, 38} {:message ""} true;
	call sub#45_ret#54 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#217[user#1365]);
	assume {:sourceloc "buggy_24.sol", 503, 38} {:message ""} true;
	call div#125_ret#55 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#54, 86400);
	commissionDays#1380 := div#125_ret#55;
	if ((commissionDays#1380 > currentInvestCycle#221[user#1365])) {
	commissionDays#1380 := currentInvestCycle#221[user#1365];
	}

	assume {:sourceloc "buggy_24.sol", 507, 22} {:message ""} true;
	call mul#108_ret#56 := mul#108(__this, __msg_sender, __msg_value, currentInvestAmount#219[user#1365], currentStaticCommissionRatio#225[user#1365]);
	assume {:sourceloc "buggy_24.sol", 507, 22} {:message ""} true;
	call mul#108_ret#57 := mul#108(__this, __msg_sender, __msg_value, mul#108_ret#56, commissionDays#1380);
	amount#1368 := mul#108_ret#57;
	call_arg#58 := 1000;
	assume {:sourceloc "buggy_24.sol", 508, 22} {:message ""} true;
	call div#125_ret#59 := div#125(__this, __msg_sender, __msg_value, amount#1368, call_arg#58);
	amount#1368 := div#125_ret#59;
	assume {:sourceloc "buggy_24.sol", 509, 22} {:message ""} true;
	call sub#45_ret#60 := sub#45(__this, __msg_sender, __msg_value, amount#1368, currentStaticCommissionWithdrawAmount#227[user#1365]);
	amount#1368 := sub#45_ret#60;
	}

	$return41:
	// Function body ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_24.sol", 512, 1} {:message "FomoFeast::bug_tmstmp32"} bug_tmstmp32#1479(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 513, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#1436: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#1436 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#1436);
	pastBlockTime_tmstmp32#1436 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 518, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return42:
	// Function body ends here
}

var struct_storage_InvestRecord#243_arr_default_context: [int]struct_storage_InvestRecord#243_arr_type;
// 
// Function: addInvestRecord : function (address,uint256,uint256,uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 522, 5} {:message "FomoFeast::addInvestRecord"} addInvestRecord#1536(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#1481: address_t, time#1483: int, amount#1485: int, cycle#1487: int)
{
	var records#1494: [int]int;
	var {:sourceloc "buggy_24.sol", 524, 14} {:message "i"} i#1500: int;
	var {:sourceloc "buggy_24.sol", 525, 13} {:message "prevRecord"} prevRecord#1510: address_struct_memory_InvestRecord#243;
	var new_struct_InvestRecord#63: address_struct_memory_InvestRecord#243;
	var tmp#64: int;
	var new_struct_InvestRecord#65: address_struct_memory_InvestRecord#243;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	records#1494 := default_int_int()[0 := 25][1 := userAddress#1481];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1500 := 8;
	while ((i#1500 > 0)) {
	// Body
	new_struct_InvestRecord#63 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	prevRecord#1510 := new_struct_InvestRecord#63;
	// Deep copy struct InvestRecord
	time#238 := time#238[prevRecord#1510 := time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr((if (records#1494[0] == 25) then investRecordMapping#696[__this][records#1494[1]] else struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))[(i#1500 - 1)])];
	amount#240 := amount#240[prevRecord#1510 := amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr((if (records#1494[0] == 25) then investRecordMapping#696[__this][records#1494[1]] else struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))[(i#1500 - 1)])];
	cycle#242 := cycle#242[prevRecord#1510 := cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr((if (records#1494[0] == 25) then investRecordMapping#696[__this][records#1494[1]] else struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))[(i#1500 - 1)])];
	// Deep copy struct InvestRecord
	if ((records#1494[0] == 25)) {
	investRecordMapping#696 := investRecordMapping#696[__this := investRecordMapping#696[__this][records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500 := InvestRecord#243#constr(time#238[prevRecord#1510], amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500]), cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500]))], length#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]]))]];
	}
	else {
	struct_storage_InvestRecord#243_arr_default_context := struct_storage_InvestRecord#243_arr_default_context[records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500 := InvestRecord#243#constr(time#238[prevRecord#1510], amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500]), cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500]))], length#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))];
	}

	if ((records#1494[0] == 25)) {
	investRecordMapping#696 := investRecordMapping#696[__this := investRecordMapping#696[__this][records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500]), amount#240[prevRecord#1510], cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500]))], length#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]]))]];
	}
	else {
	struct_storage_InvestRecord#243_arr_default_context := struct_storage_InvestRecord#243_arr_default_context[records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500]), amount#240[prevRecord#1510], cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500]))], length#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))];
	}

	if ((records#1494[0] == 25)) {
	investRecordMapping#696 := investRecordMapping#696[__this := investRecordMapping#696[__this][records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500]), amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[i#1500]), cycle#242[prevRecord#1510])], length#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]]))]];
	}
	else {
	struct_storage_InvestRecord#243_arr_default_context := struct_storage_InvestRecord#243_arr_default_context[records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500]), amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[i#1500]), cycle#242[prevRecord#1510])], length#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))];
	}

	$continue61:
	// Loop expression
	i#1500 := (i#1500 - 1);
	tmp#64 := i#1500;
	}

	break62:
	new_struct_InvestRecord#65 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	time#238 := time#238[new_struct_InvestRecord#65 := time#1483];
	amount#240 := amount#240[new_struct_InvestRecord#65 := amount#1485];
	cycle#242 := cycle#242[new_struct_InvestRecord#65 := cycle#1487];
	// Deep copy struct InvestRecord
	if ((records#1494[0] == 25)) {
	investRecordMapping#696 := investRecordMapping#696[__this := investRecordMapping#696[__this][records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0 := InvestRecord#243#constr(time#238[new_struct_InvestRecord#65], amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0]), cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0]))], length#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]]))]];
	}
	else {
	struct_storage_InvestRecord#243_arr_default_context := struct_storage_InvestRecord#243_arr_default_context[records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0 := InvestRecord#243#constr(time#238[new_struct_InvestRecord#65], amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0]), cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0]))], length#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))];
	}

	if ((records#1494[0] == 25)) {
	investRecordMapping#696 := investRecordMapping#696[__this := investRecordMapping#696[__this][records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0]), amount#240[new_struct_InvestRecord#65], cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0]))], length#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]]))]];
	}
	else {
	struct_storage_InvestRecord#243_arr_default_context := struct_storage_InvestRecord#243_arr_default_context[records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0]), amount#240[new_struct_InvestRecord#65], cycle#242#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0]))], length#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))];
	}

	if ((records#1494[0] == 25)) {
	investRecordMapping#696 := investRecordMapping#696[__this := investRecordMapping#696[__this][records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0]), amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]])[0]), cycle#242[new_struct_InvestRecord#65])], length#struct_storage_InvestRecord#243_arr#constr(investRecordMapping#696[__this][records#1494[1]]))]];
	}
	else {
	struct_storage_InvestRecord#243_arr_default_context := struct_storage_InvestRecord#243_arr_default_context[records#1494[1] := struct_storage_InvestRecord#243_arr#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0 := InvestRecord#243#constr(time#238#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0]), amount#240#InvestRecord#243#constr(arr#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]])[0]), cycle#242[new_struct_InvestRecord#65])], length#struct_storage_InvestRecord#243_arr#constr(struct_storage_InvestRecord#243_arr_default_context[records#1494[1]]))];
	}

	$return43:
	// Function body ends here
}

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_24.sol", 530, 1} {:message "winner_tmstmp38"} winner_tmstmp38#1538: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 531, 1} {:message "FomoFeast::play_tmstmp38"} play_tmstmp38#1560(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1540: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1540 + 432000) == __block_timestamp)) {
	winner_tmstmp38#1538 := winner_tmstmp38#1538[__this := __msg_sender];
	}

	$return44:
	// Function body ends here
}

var struct_storage_CommissionRecord#248_arr_default_context: [int]struct_storage_CommissionRecord#248_arr_type;
// 
// Function: addStaticCommissionRecord : function (address,uint256,uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 535, 5} {:message "FomoFeast::addStaticCommissionRecord"} addStaticCommissionRecord#1614(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#1562: address_t, time#1564: int, amount#1566: int)
{
	var records#1573: [int]int;
	var {:sourceloc "buggy_24.sol", 537, 14} {:message "i"} i#1579: int;
	var {:sourceloc "buggy_24.sol", 538, 13} {:message "prevRecord"} prevRecord#1589: address_struct_memory_CommissionRecord#248;
	var new_struct_CommissionRecord#68: address_struct_memory_CommissionRecord#248;
	var tmp#69: int;
	var new_struct_CommissionRecord#70: address_struct_memory_CommissionRecord#248;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	records#1573 := default_int_int()[0 := 26][1 := userAddress#1562];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1579 := 8;
	while ((i#1579 > 0)) {
	// Body
	new_struct_CommissionRecord#68 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	prevRecord#1589 := new_struct_CommissionRecord#68;
	// Deep copy struct CommissionRecord
	time#245 := time#245[prevRecord#1589 := time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr((if (records#1573[0] == 28) then dynamicCommissionRecordMapping#743[__this][records#1573[1]] else (if (records#1573[0] == 26) then staticCommissionRecordMapping#713[__this][records#1573[1]] else struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])))[(i#1579 - 1)])];
	amount#247 := amount#247[prevRecord#1589 := amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr((if (records#1573[0] == 28) then dynamicCommissionRecordMapping#743[__this][records#1573[1]] else (if (records#1573[0] == 26) then staticCommissionRecordMapping#713[__this][records#1573[1]] else struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])))[(i#1579 - 1)])];
	// Deep copy struct CommissionRecord
	if ((records#1573[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[i#1579 := CommissionRecord#248#constr(time#245[prevRecord#1589], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[i#1579]))], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]]))]];
	}
	else {
	if ((records#1573[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[i#1579 := CommissionRecord#248#constr(time#245[prevRecord#1589], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[i#1579]))], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[i#1579 := CommissionRecord#248#constr(time#245[prevRecord#1589], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[i#1579]))], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]]))];
	}

	}

	if ((records#1573[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[i#1579 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[i#1579]), amount#247[prevRecord#1589])], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]]))]];
	}
	else {
	if ((records#1573[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[i#1579 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[i#1579]), amount#247[prevRecord#1589])], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[i#1579 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[i#1579]), amount#247[prevRecord#1589])], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]]))];
	}

	}

	$continue66:
	// Loop expression
	i#1579 := (i#1579 - 1);
	tmp#69 := i#1579;
	}

	break67:
	new_struct_CommissionRecord#70 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	time#245 := time#245[new_struct_CommissionRecord#70 := time#1564];
	amount#247 := amount#247[new_struct_CommissionRecord#70 := amount#1566];
	// Deep copy struct CommissionRecord
	if ((records#1573[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[0 := CommissionRecord#248#constr(time#245[new_struct_CommissionRecord#70], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[0]))], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]]))]];
	}
	else {
	if ((records#1573[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[0 := CommissionRecord#248#constr(time#245[new_struct_CommissionRecord#70], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[0]))], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[0 := CommissionRecord#248#constr(time#245[new_struct_CommissionRecord#70], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[0]))], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]]))];
	}

	}

	if ((records#1573[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[0 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]])[0]), amount#247[new_struct_CommissionRecord#70])], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1573[1]]))]];
	}
	else {
	if ((records#1573[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[0 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]])[0]), amount#247[new_struct_CommissionRecord#70])], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1573[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1573[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[0 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]])[0]), amount#247[new_struct_CommissionRecord#70])], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1573[1]]))];
	}

	}

	$return45:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_24.sol", 543, 1} {:message "FomoFeast::bug_tmstmp4"} bug_tmstmp4#1661(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 544, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#1618: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#1618 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#1618);
	pastBlockTime_tmstmp4#1618 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 549, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return46:
	// Function body ends here
}

// 
// Function: addDynamicCommissionRecord : function (address,uint256,uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 553, 5} {:message "FomoFeast::addDynamicCommissionRecord"} addDynamicCommissionRecord#1715(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#1663: address_t, time#1665: int, amount#1667: int)
{
	var records#1674: [int]int;
	var {:sourceloc "buggy_24.sol", 555, 14} {:message "i"} i#1680: int;
	var {:sourceloc "buggy_24.sol", 556, 13} {:message "prevRecord"} prevRecord#1690: address_struct_memory_CommissionRecord#248;
	var new_struct_CommissionRecord#73: address_struct_memory_CommissionRecord#248;
	var tmp#74: int;
	var new_struct_CommissionRecord#75: address_struct_memory_CommissionRecord#248;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	records#1674 := default_int_int()[0 := 28][1 := userAddress#1663];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1680 := 8;
	while ((i#1680 > 0)) {
	// Body
	new_struct_CommissionRecord#73 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	prevRecord#1690 := new_struct_CommissionRecord#73;
	// Deep copy struct CommissionRecord
	time#245 := time#245[prevRecord#1690 := time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr((if (records#1674[0] == 28) then dynamicCommissionRecordMapping#743[__this][records#1674[1]] else (if (records#1674[0] == 26) then staticCommissionRecordMapping#713[__this][records#1674[1]] else struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])))[(i#1680 - 1)])];
	amount#247 := amount#247[prevRecord#1690 := amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr((if (records#1674[0] == 28) then dynamicCommissionRecordMapping#743[__this][records#1674[1]] else (if (records#1674[0] == 26) then staticCommissionRecordMapping#713[__this][records#1674[1]] else struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])))[(i#1680 - 1)])];
	// Deep copy struct CommissionRecord
	if ((records#1674[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[i#1680 := CommissionRecord#248#constr(time#245[prevRecord#1690], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[i#1680]))], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]]))]];
	}
	else {
	if ((records#1674[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[i#1680 := CommissionRecord#248#constr(time#245[prevRecord#1690], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[i#1680]))], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[i#1680 := CommissionRecord#248#constr(time#245[prevRecord#1690], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[i#1680]))], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]]))];
	}

	}

	if ((records#1674[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[i#1680 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[i#1680]), amount#247[prevRecord#1690])], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]]))]];
	}
	else {
	if ((records#1674[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[i#1680 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[i#1680]), amount#247[prevRecord#1690])], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[i#1680 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[i#1680]), amount#247[prevRecord#1690])], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]]))];
	}

	}

	$continue71:
	// Loop expression
	i#1680 := (i#1680 - 1);
	tmp#74 := i#1680;
	}

	break72:
	new_struct_CommissionRecord#75 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	time#245 := time#245[new_struct_CommissionRecord#75 := time#1665];
	amount#247 := amount#247[new_struct_CommissionRecord#75 := amount#1667];
	// Deep copy struct CommissionRecord
	if ((records#1674[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[0 := CommissionRecord#248#constr(time#245[new_struct_CommissionRecord#75], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[0]))], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]]))]];
	}
	else {
	if ((records#1674[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[0 := CommissionRecord#248#constr(time#245[new_struct_CommissionRecord#75], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[0]))], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[0 := CommissionRecord#248#constr(time#245[new_struct_CommissionRecord#75], amount#247#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[0]))], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]]))];
	}

	}

	if ((records#1674[0] == 28)) {
	dynamicCommissionRecordMapping#743 := dynamicCommissionRecordMapping#743[__this := dynamicCommissionRecordMapping#743[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[0 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]])[0]), amount#247[new_struct_CommissionRecord#75])], length#struct_storage_CommissionRecord#248_arr#constr(dynamicCommissionRecordMapping#743[__this][records#1674[1]]))]];
	}
	else {
	if ((records#1674[0] == 26)) {
	staticCommissionRecordMapping#713 := staticCommissionRecordMapping#713[__this := staticCommissionRecordMapping#713[__this][records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[0 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]])[0]), amount#247[new_struct_CommissionRecord#75])], length#struct_storage_CommissionRecord#248_arr#constr(staticCommissionRecordMapping#713[__this][records#1674[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#248_arr_default_context := struct_storage_CommissionRecord#248_arr_default_context[records#1674[1] := struct_storage_CommissionRecord#248_arr#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[0 := CommissionRecord#248#constr(time#245#CommissionRecord#248#constr(arr#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]])[0]), amount#247[new_struct_CommissionRecord#75])], length#struct_storage_CommissionRecord#248_arr#constr(struct_storage_CommissionRecord#248_arr_default_context[records#1674[1]]))];
	}

	}

	$return47:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_24.sol", 561, 1} {:message "winner_tmstmp7"} winner_tmstmp7#1717: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 562, 1} {:message "FomoFeast::play_tmstmp7"} play_tmstmp7#1743(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1719: int)
{
	var {:sourceloc "buggy_24.sol", 563, 2} {:message "_vtime"} _vtime#1723: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1723 := __block_timestamp;
	if (((startTime#1719 + 432000) == _vtime#1723)) {
	winner_tmstmp7#1717 := winner_tmstmp7#1717[__this := __msg_sender];
	}

	$return48:
	// Function body ends here
}

var User236default_context: [int]struct_storage_User#236;
// 
// Function: invest
procedure {:sourceloc "buggy_24.sol", 567, 5} {:message "FomoFeast::invest"} invest#2132(__this: address_t, __msg_sender: address_t, __msg_value: int, sponsorAddress#1745: address_t, investCycle#1747: int)
{
	var sponsor#1751: [int]int;
	var call_arg#76: int_arr_ptr;
	var new_array#77: int_arr_ptr;
	var call_arg#78: int_arr_ptr;
	var new_array#79: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 571, 9} {:message "investAmount"} investAmount#1780: int;
	var div#125_ret#80: int;
	var mul#108_ret#81: int;
	var call_arg#82: int_arr_ptr;
	var new_array#83: int_arr_ptr;
	var call_arg#84: int;
	var mul#108_ret#85: int;
	var call_arg#86: int;
	var mul#108_ret#87: int;
	var call_arg#88: int_arr_ptr;
	var new_array#89: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 576, 9} {:message "user"} user#1820: address_struct_memory_User#236;
	var new_struct_User#90: address_struct_memory_User#236;
	var {:sourceloc "buggy_24.sol", 577, 9} {:message "level"} level#1827: int;
	var getLevelByInvestAmount#942_ret#91: int;
	var call_arg#92: int_arr_ptr;
	var new_array#93: int_arr_ptr;
	var call_arg#94: int_arr_ptr;
	var new_array#95: int_arr_ptr;
	var call_arg#96: int_arr_ptr;
	var new_array#97: int_arr_ptr;
	var call_arg#98: int_arr_ptr;
	var new_array#99: int_arr_ptr;
	var call_arg#100: int_arr_ptr;
	var new_array#101: int_arr_ptr;
	var call_arg#102: int_arr_ptr;
	var new_array#103: int_arr_ptr;
	var call_arg#104: int_arr_ptr;
	var new_array#105: int_arr_ptr;
	var call_arg#106: int;
	var add#28_ret#107: int;
	var add#28_ret#108: int;
	var getStaticCommissionRatio#1174_ret#109: int;
	var {:sourceloc "buggy_24.sol", 594, 13} {:message "addressWalker"} addressWalker#1954: address_t;
	var add#28_ret#112: int;
	var call_arg#113: int;
	var call_arg#114: int;
	var call_arg#115: int;
	var call_arg#116: int;
	var call_arg#117: int;
	var call_arg#118: int;
	var getStaticCommissionRatio#1174_ret#119: int;
	var call_arg#120: int;
	var call_arg#121: int;
	var call_arg#122: int;
	var call_arg#123: int;
	var new_struct_User#124: address_struct_memory_User#236;
	var call_arg#125: int;
	var add#28_ret#126: int;
	var {:sourceloc "buggy_24.sol", 607, 13} {:message "addressWalker"} addressWalker#2029: address_t;
	var call_arg#129: int;
	var add#28_ret#130: int;
	var call_arg#131: int;
	var add#28_ret#132: int;
	var add#28_ret#133: int;
	var call_arg#134: address_t;
	var call_arg#135: int;
	var add#28_ret#136: int;
	var add#28_ret#137: int;
	var call_arg#138: int;
	var div#125_ret#139: int;
	var add#28_ret#140: int;
	var call_arg#141: int;
	var mul#108_ret#142: int;
	var call_arg#143: int;
	var div#125_ret#144: int;
	var add#28_ret#145: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	sponsor#1751 := default_int_int()[0 := 22][1 := sponsorAddress#1745];
	new_array#77 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#76 := new_array#77;
	mem_arr_int := mem_arr_int[call_arg#76 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 112][10 := 111][11 := 110][12 := 115][13 := 111][14 := 114][15 := 32][16 := 97][17 := 100][18 := 100][19 := 114][20 := 101][21 := 115][22 := 115], 23)];
	assume (totalInvestCount#201#User#236#constr((if (sponsor#1751[0] == 22) then userMapping#611[__this][sponsor#1751[1]] else User236default_context[sponsor#1751[1]])) > 0);
	new_array#79 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#78 := new_array#79;
	mem_arr_int := mem_arr_int[call_arg#78 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 105][9 := 110][10 := 118][11 := 101][12 := 115][13 := 116][14 := 32][15 := 99][16 := 121][17 := 99][18 := 108][19 := 101], 20)];
	assume (((investCycle#1747 == 30) || (investCycle#1747 == 60)) || (investCycle#1747 == 90));
	assume {:sourceloc "buggy_24.sol", 571, 32} {:message ""} true;
	call div#125_ret#80 := div#125(__this, __msg_sender, __msg_value, __msg_value, 1000000000000000000);
	investAmount#1780 := div#125_ret#80;
	assume {:sourceloc "buggy_24.sol", 572, 24} {:message ""} true;
	call mul#108_ret#81 := mul#108(__this, __msg_sender, __msg_value, investAmount#1780, 1000000000000000000);
	investAmount#1780 := mul#108_ret#81;
	new_array#83 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#82 := new_array#83;
	mem_arr_int := mem_arr_int[call_arg#82 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 101][4 := 115][5 := 116][6 := 32][7 := 97][8 := 109][9 := 111][10 := 117][11 := 110][12 := 116][13 := 32][14 := 105][15 := 115][16 := 32][17 := 110][18 := 111][19 := 116][20 := 32][21 := 105][22 := 110][23 := 116][24 := 101][25 := 103][26 := 101][27 := 114], 28)];
	assume (investAmount#1780 == __msg_value);
	call_arg#84 := 15;
	assume {:sourceloc "buggy_24.sol", 574, 67} {:message ""} true;
	call mul#108_ret#85 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#84);
	call_arg#86 := 1;
	assume {:sourceloc "buggy_24.sol", 574, 33} {:message ""} true;
	call mul#108_ret#87 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#86);
	new_array#89 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#88 := new_array#89;
	mem_arr_int := mem_arr_int[call_arg#88 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 105][9 := 110][10 := 118][11 := 101][12 := 115][13 := 116][14 := 32][15 := 97][16 := 109][17 := 111][18 := 117][19 := 110][20 := 116], 21)];
	assume ((investAmount#1780 >= mul#108_ret#87) && (investAmount#1780 <= mul#108_ret#85));
	new_struct_User#90 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#1820 := new_struct_User#90;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[user#1820 := totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender])];
	totalInvestAmount#203 := totalInvestAmount#203[user#1820 := totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender])];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[user#1820 := totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender])];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[user#1820 := totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender])];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[user#1820 := totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender])];
	downlineCount#211 := downlineCount#211[user#1820 := downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender])];
	nodeCount#213 := nodeCount#213[user#1820 := nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender])];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[user#1820 := totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender])];
	currentInvestTime#217 := currentInvestTime#217[user#1820 := currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender])];
	currentInvestAmount#219 := currentInvestAmount#219[user#1820 := currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender])];
	currentInvestCycle#221 := currentInvestCycle#221[user#1820 := currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender])];
	currentlevel#223 := currentlevel#223[user#1820 := currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender])];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[user#1820 := currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender])];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[user#1820 := currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender])];
	staticCommissionBalance#229 := staticCommissionBalance#229[user#1820 := staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender])];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[user#1820 := dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender])];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[user#1820 := calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender])];
	sponsorAddress#235 := sponsorAddress#235[user#1820 := sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 577, 25} {:message ""} true;
	call getLevelByInvestAmount#942_ret#91 := getLevelByInvestAmount#942(__this, __msg_sender, __msg_value, investAmount#1780);
	level#1827 := getLevelByInvestAmount#942_ret#91;
	if ((totalInvestCount#201[user#1820] > 0)) {
	new_array#93 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#92 := new_array#93;
	mem_arr_int := mem_arr_int[call_arg#92 := int_arr#constr(default_int_int()[0 := 115][1 := 112][2 := 111][3 := 110][4 := 115][5 := 111][6 := 114][7 := 32][8 := 97][9 := 100][10 := 100][11 := 114][12 := 101][13 := 115][14 := 115][15 := 32][16 := 105][17 := 115][18 := 32][19 := 105][20 := 110][21 := 99][22 := 111][23 := 110][24 := 115][25 := 105][26 := 115][27 := 116][28 := 101][29 := 110][30 := 116], 31)];
	assume (sponsorAddress#235[user#1820] == sponsorAddress#1745);
	new_array#95 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#94 := new_array#95;
	mem_arr_int := mem_arr_int[call_arg#94 := int_arr#constr(default_int_int()[0 := 68][1 := 117][2 := 109][3 := 112][4 := 108][5 := 105][6 := 99][7 := 97][8 := 116][9 := 101][10 := 32][11 := 105][12 := 110][13 := 118][14 := 101][15 := 115][16 := 116], 17)];
	assume (currentInvestAmount#219[user#1820] == 0);
	new_array#97 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#96 := new_array#97;
	mem_arr_int := mem_arr_int[call_arg#96 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentInvestTime#217[user#1820] == 0);
	new_array#99 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#98 := new_array#99;
	mem_arr_int := mem_arr_int[call_arg#98 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentInvestCycle#221[user#1820] == 0);
	new_array#101 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#100 := new_array#101;
	mem_arr_int := mem_arr_int[call_arg#100 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentlevel#223[user#1820] == 0);
	new_array#103 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#102 := new_array#103;
	mem_arr_int := mem_arr_int[call_arg#102 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentStaticCommissionRatio#225[user#1820] == 0);
	new_array#105 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#104 := new_array#105;
	mem_arr_int := mem_arr_int[call_arg#104 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentStaticCommissionWithdrawAmount#227[user#1820] == 0);
	call_arg#106 := 1;
	assume {:sourceloc "buggy_24.sol", 586, 37} {:message ""} true;
	call add#28_ret#107 := add#28(__this, __msg_sender, __msg_value, totalInvestCount#201[user#1820], call_arg#106);
	totalInvestCount#201 := totalInvestCount#201[user#1820 := add#28_ret#107];
	assume {:sourceloc "buggy_24.sol", 587, 38} {:message ""} true;
	call add#28_ret#108 := add#28(__this, __msg_sender, __msg_value, totalInvestAmount#203[user#1820], investAmount#1780);
	totalInvestAmount#203 := totalInvestAmount#203[user#1820 := add#28_ret#108];
	currentInvestTime#217 := currentInvestTime#217[user#1820 := __block_timestamp];
	currentInvestAmount#219 := currentInvestAmount#219[user#1820 := investAmount#1780];
	currentInvestCycle#221 := currentInvestCycle#221[user#1820 := investCycle#1747];
	currentlevel#223 := currentlevel#223[user#1820 := level#1827];
	assume {:sourceloc "buggy_24.sol", 592, 49} {:message ""} true;
	call getStaticCommissionRatio#1174_ret#109 := getStaticCommissionRatio#1174(__this, __msg_sender, __msg_value, level#1827, investCycle#1747);
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[user#1820 := getStaticCommissionRatio#1174_ret#109];
	// Deep copy struct User
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201[user#1820], totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203[user#1820], totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205[user#1820], totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207[user#1820], totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209[user#1820], downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211[user#1820], nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213[user#1820], totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215[user#1820], currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217[user#1820], currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219[user#1820], currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221[user#1820], currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223[user#1820], currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225[user#1820], currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227[user#1820], staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229[user#1820], dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231[user#1820], calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233[user#1820], sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235[user#1820])]];
	addressWalker#1954 := sponsorAddress#1745;
	while ((addressWalker#1954 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#1751 := default_int_int()[0 := 22][1 := addressWalker#1954];
	assume {:sourceloc "buggy_24.sol", 597, 53} {:message ""} true;
	call add#28_ret#112 := add#28(__this, __msg_sender, __msg_value, totalDownlineInvestAmount#215#User#236#constr((if (sponsor#1751[0] == 22) then userMapping#611[__this][sponsor#1751[1]] else User236default_context[sponsor#1751[1]])), investAmount#1780);
	if ((sponsor#1751[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), add#28_ret#112, currentInvestTime#217#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][sponsor#1751[1]]))]];
	}
	else {
	User236default_context := User236default_context[sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(User236default_context[sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[sponsor#1751[1]]), downlineCount#211#User#236#constr(User236default_context[sponsor#1751[1]]), nodeCount#213#User#236#constr(User236default_context[sponsor#1751[1]]), add#28_ret#112, currentInvestTime#217#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(User236default_context[sponsor#1751[1]]), currentlevel#223#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[sponsor#1751[1]]), sponsorAddress#235#User#236#constr(User236default_context[sponsor#1751[1]]))];
	}

	addressWalker#1954 := sponsorAddress#235#User#236#constr((if (sponsor#1751[0] == 22) then userMapping#611[__this][sponsor#1751[1]] else User236default_context[sponsor#1751[1]]));
	$continue110:
	}

	break111:
	}
	else {
	call_arg#113 := 1;
	call_arg#114 := 0;
	call_arg#115 := 0;
	call_arg#116 := 0;
	call_arg#117 := 1;
	call_arg#118 := 0;
	assume {:sourceloc "buggy_24.sol", 603, 44} {:message ""} true;
	call getStaticCommissionRatio#1174_ret#119 := getStaticCommissionRatio#1174(__this, __msg_sender, __msg_value, level#1827, investCycle#1747);
	call_arg#120 := 0;
	call_arg#121 := 0;
	call_arg#122 := 0;
	call_arg#123 := 0;
	new_struct_User#124 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	totalInvestCount#201 := totalInvestCount#201[new_struct_User#124 := call_arg#113];
	totalInvestAmount#203 := totalInvestAmount#203[new_struct_User#124 := investAmount#1780];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[new_struct_User#124 := call_arg#114];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[new_struct_User#124 := call_arg#115];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[new_struct_User#124 := call_arg#116];
	downlineCount#211 := downlineCount#211[new_struct_User#124 := call_arg#117];
	nodeCount#213 := nodeCount#213[new_struct_User#124 := call_arg#118];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[new_struct_User#124 := investAmount#1780];
	currentInvestTime#217 := currentInvestTime#217[new_struct_User#124 := __block_timestamp];
	currentInvestAmount#219 := currentInvestAmount#219[new_struct_User#124 := investAmount#1780];
	currentInvestCycle#221 := currentInvestCycle#221[new_struct_User#124 := investCycle#1747];
	currentlevel#223 := currentlevel#223[new_struct_User#124 := level#1827];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[new_struct_User#124 := getStaticCommissionRatio#1174_ret#119];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[new_struct_User#124 := call_arg#120];
	staticCommissionBalance#229 := staticCommissionBalance#229[new_struct_User#124 := call_arg#121];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[new_struct_User#124 := call_arg#122];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[new_struct_User#124 := call_arg#123];
	sponsorAddress#235 := sponsorAddress#235[new_struct_User#124 := sponsorAddress#1745];
	// Deep copy struct User
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201[new_struct_User#124], totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203[new_struct_User#124], totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205[new_struct_User#124], totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207[new_struct_User#124], totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209[new_struct_User#124], downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211[new_struct_User#124], nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213[new_struct_User#124], totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215[new_struct_User#124], currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217[new_struct_User#124], currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219[new_struct_User#124], currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221[new_struct_User#124], currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223[new_struct_User#124], currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225[new_struct_User#124], currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227[new_struct_User#124], staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229[new_struct_User#124], dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231[new_struct_User#124], calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233[new_struct_User#124], sponsorAddress#235#User#236#constr(userMapping#611[__this][__msg_sender]))]];
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][__msg_sender := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][__msg_sender]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][__msg_sender]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][__msg_sender]), downlineCount#211#User#236#constr(userMapping#611[__this][__msg_sender]), nodeCount#213#User#236#constr(userMapping#611[__this][__msg_sender]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestTime#217#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][__msg_sender]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][__msg_sender]), currentlevel#223#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][__msg_sender]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][__msg_sender]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][__msg_sender]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][__msg_sender]), sponsorAddress#235[new_struct_User#124])]];
	addressMapping#662 := addressMapping#662[__this := addressMapping#662[__this][totalUserCount#469[__this] := __msg_sender]];
	call_arg#125 := 1;
	assume {:sourceloc "buggy_24.sol", 606, 30} {:message ""} true;
	call add#28_ret#126 := add#28(__this, __msg_sender, __msg_value, totalUserCount#469[__this], call_arg#125);
	totalUserCount#469 := totalUserCount#469[__this := add#28_ret#126];
	addressWalker#2029 := sponsorAddress#1745;
	while ((addressWalker#2029 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#1751 := default_int_int()[0 := 22][1 := addressWalker#2029];
	call_arg#129 := 1;
	assume {:sourceloc "buggy_24.sol", 610, 41} {:message ""} true;
	call add#28_ret#130 := add#28(__this, __msg_sender, __msg_value, downlineCount#211#User#236#constr((if (sponsor#1751[0] == 22) then userMapping#611[__this][sponsor#1751[1]] else User236default_context[sponsor#1751[1]])), call_arg#129);
	if ((sponsor#1751[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), add#28_ret#130, nodeCount#213#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][sponsor#1751[1]]))]];
	}
	else {
	User236default_context := User236default_context[sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(User236default_context[sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[sponsor#1751[1]]), add#28_ret#130, nodeCount#213#User#236#constr(User236default_context[sponsor#1751[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestTime#217#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(User236default_context[sponsor#1751[1]]), currentlevel#223#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[sponsor#1751[1]]), sponsorAddress#235#User#236#constr(User236default_context[sponsor#1751[1]]))];
	}

	if ((addressWalker#2029 == sponsorAddress#1745)) {
	call_arg#131 := 1;
	assume {:sourceloc "buggy_24.sol", 612, 41} {:message ""} true;
	call add#28_ret#132 := add#28(__this, __msg_sender, __msg_value, nodeCount#213#User#236#constr((if (sponsor#1751[0] == 22) then userMapping#611[__this][sponsor#1751[1]] else User236default_context[sponsor#1751[1]])), call_arg#131);
	if ((sponsor#1751[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), add#28_ret#132, totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][sponsor#1751[1]]))]];
	}
	else {
	User236default_context := User236default_context[sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(User236default_context[sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[sponsor#1751[1]]), downlineCount#211#User#236#constr(User236default_context[sponsor#1751[1]]), add#28_ret#132, totalDownlineInvestAmount#215#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestTime#217#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(User236default_context[sponsor#1751[1]]), currentlevel#223#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[sponsor#1751[1]]), sponsorAddress#235#User#236#constr(User236default_context[sponsor#1751[1]]))];
	}

	}

	assume {:sourceloc "buggy_24.sol", 614, 53} {:message ""} true;
	call add#28_ret#133 := add#28(__this, __msg_sender, __msg_value, totalDownlineInvestAmount#215#User#236#constr((if (sponsor#1751[0] == 22) then userMapping#611[__this][sponsor#1751[1]] else User236default_context[sponsor#1751[1]])), investAmount#1780);
	if ((sponsor#1751[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), add#28_ret#133, currentInvestTime#217#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][sponsor#1751[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][sponsor#1751[1]]))]];
	}
	else {
	User236default_context := User236default_context[sponsor#1751[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[sponsor#1751[1]]), totalInvestAmount#203#User#236#constr(User236default_context[sponsor#1751[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[sponsor#1751[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[sponsor#1751[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[sponsor#1751[1]]), downlineCount#211#User#236#constr(User236default_context[sponsor#1751[1]]), nodeCount#213#User#236#constr(User236default_context[sponsor#1751[1]]), add#28_ret#133, currentInvestTime#217#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestAmount#219#User#236#constr(User236default_context[sponsor#1751[1]]), currentInvestCycle#221#User#236#constr(User236default_context[sponsor#1751[1]]), currentlevel#223#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[sponsor#1751[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[sponsor#1751[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[sponsor#1751[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[sponsor#1751[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[sponsor#1751[1]]), sponsorAddress#235#User#236#constr(User236default_context[sponsor#1751[1]]))];
	}

	addressWalker#2029 := sponsorAddress#235#User#236#constr((if (sponsor#1751[0] == 22) then userMapping#611[__this][sponsor#1751[1]] else User236default_context[sponsor#1751[1]]));
	$continue127:
	}

	break128:
	}

	call_arg#134 := __msg_sender;
	assume {:sourceloc "buggy_24.sol", 619, 9} {:message ""} true;
	call addInvestRecord#1536(__this, __msg_sender, __msg_value, call_arg#134, __block_timestamp, investAmount#1780, investCycle#1747);
	call_arg#135 := 1;
	assume {:sourceloc "buggy_24.sol", 620, 28} {:message ""} true;
	call add#28_ret#136 := add#28(__this, __msg_sender, __msg_value, totalInvestCount#302[__this], call_arg#135);
	totalInvestCount#302 := totalInvestCount#302[__this := add#28_ret#136];
	assume {:sourceloc "buggy_24.sol", 621, 29} {:message ""} true;
	call add#28_ret#137 := add#28(__this, __msg_sender, __msg_value, totalInvestAmount#328[__this], investAmount#1780);
	totalInvestAmount#328 := totalInvestAmount#328[__this := add#28_ret#137];
	call_arg#138 := 50;
	assume {:sourceloc "buggy_24.sol", 622, 43} {:message ""} true;
	call div#125_ret#139 := div#125(__this, __msg_sender, __msg_value, investAmount#1780, call_arg#138);
	assume {:sourceloc "buggy_24.sol", 622, 25} {:message ""} true;
	call add#28_ret#140 := add#28(__this, __msg_sender, __msg_value, engineerFunds#518[__this], div#125_ret#139);
	engineerFunds#518 := engineerFunds#518[__this := add#28_ret#140];
	call_arg#141 := 3;
	assume {:sourceloc "buggy_24.sol", 623, 43} {:message ""} true;
	call mul#108_ret#142 := mul#108(__this, __msg_sender, __msg_value, investAmount#1780, call_arg#141);
	call_arg#143 := 100;
	assume {:sourceloc "buggy_24.sol", 623, 43} {:message ""} true;
	call div#125_ret#144 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#142, call_arg#143);
	assume {:sourceloc "buggy_24.sol", 623, 25} {:message ""} true;
	call add#28_ret#145 := add#28(__this, __msg_sender, __msg_value, operatorFunds#557[__this], div#125_ret#144);
	operatorFunds#557 := operatorFunds#557[__this := add#28_ret#145];
	$return49:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_24.sol", 625, 1} {:message "winner_tmstmp23"} winner_tmstmp23#2134: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 626, 1} {:message "FomoFeast::play_tmstmp23"} play_tmstmp23#2160(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2136: int)
{
	var {:sourceloc "buggy_24.sol", 627, 2} {:message "_vtime"} _vtime#2140: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#2140 := __block_timestamp;
	if (((startTime#2136 + 432000) == _vtime#2140)) {
	winner_tmstmp23#2134 := winner_tmstmp23#2134[__this := __msg_sender];
	}

	$return50:
	// Function body ends here
}

// 
// Function: userWithdraw
procedure {:sourceloc "buggy_24.sol", 631, 5} {:message "FomoFeast::userWithdraw"} userWithdraw#2272(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var user#2164: [int]int;
	var {:sourceloc "buggy_24.sol", 634, 13} {:message "avaliableIA"} avaliableIA#2175: int;
	var call_arg#146: address_struct_memory_User#236;
	var new_struct_User#147: address_struct_memory_User#236;
	var isInvestExpired#977_ret#148: bool;
	var call_arg#149: address_struct_memory_User#236;
	var new_struct_User#150: address_struct_memory_User#236;
	var getAbortInvestAmount#1056_ret#151: int;
	var {:sourceloc "buggy_24.sol", 638, 13} {:message "avaliableSCA"} avaliableSCA#2192: int;
	var call_arg#152: address_struct_memory_User#236;
	var new_struct_User#153: address_struct_memory_User#236;
	var getAvaliableStaticCommissionAmount#1432_ret#154: int;
	var add#28_ret#155: int;
	var add#28_ret#156: int;
	var add#28_ret#157: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	user#2164 := default_int_int()[0 := 22][1 := __msg_sender];
	if ((currentInvestAmount#219#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]])) > 0)) {
	avaliableIA#2175 := currentInvestAmount#219#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]));
	new_struct_User#147 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#146 := new_struct_User#147;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[call_arg#146 := totalInvestCount#201#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalInvestAmount#203 := totalInvestAmount#203[call_arg#146 := totalInvestAmount#203#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[call_arg#146 := totalStaticCommissionWithdrawAmount#205#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[call_arg#146 := totalDynamicCommissionWithdrawAmount#207#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[call_arg#146 := totalWithdrawAmount#209#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	downlineCount#211 := downlineCount#211[call_arg#146 := downlineCount#211#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	nodeCount#213 := nodeCount#213[call_arg#146 := nodeCount#213#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[call_arg#146 := totalDownlineInvestAmount#215#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestTime#217 := currentInvestTime#217[call_arg#146 := currentInvestTime#217#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestAmount#219 := currentInvestAmount#219[call_arg#146 := currentInvestAmount#219#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestCycle#221 := currentInvestCycle#221[call_arg#146 := currentInvestCycle#221#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentlevel#223 := currentlevel#223[call_arg#146 := currentlevel#223#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[call_arg#146 := currentStaticCommissionRatio#225#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[call_arg#146 := currentStaticCommissionWithdrawAmount#227#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	staticCommissionBalance#229 := staticCommissionBalance#229[call_arg#146 := staticCommissionBalance#229#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[call_arg#146 := dynamicCommissionBalance#231#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[call_arg#146 := calcDynamicCommissionAmount#233#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	sponsorAddress#235 := sponsorAddress#235[call_arg#146 := sponsorAddress#235#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	assume {:sourceloc "buggy_24.sol", 635, 18} {:message ""} true;
	call isInvestExpired#977_ret#148 := isInvestExpired#977(__this, __msg_sender, __msg_value, call_arg#146);
	if (!(isInvestExpired#977_ret#148)) {
	new_struct_User#150 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#149 := new_struct_User#150;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[call_arg#149 := totalInvestCount#201#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalInvestAmount#203 := totalInvestAmount#203[call_arg#149 := totalInvestAmount#203#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[call_arg#149 := totalStaticCommissionWithdrawAmount#205#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[call_arg#149 := totalDynamicCommissionWithdrawAmount#207#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[call_arg#149 := totalWithdrawAmount#209#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	downlineCount#211 := downlineCount#211[call_arg#149 := downlineCount#211#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	nodeCount#213 := nodeCount#213[call_arg#149 := nodeCount#213#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[call_arg#149 := totalDownlineInvestAmount#215#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestTime#217 := currentInvestTime#217[call_arg#149 := currentInvestTime#217#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestAmount#219 := currentInvestAmount#219[call_arg#149 := currentInvestAmount#219#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestCycle#221 := currentInvestCycle#221[call_arg#149 := currentInvestCycle#221#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentlevel#223 := currentlevel#223[call_arg#149 := currentlevel#223#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[call_arg#149 := currentStaticCommissionRatio#225#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[call_arg#149 := currentStaticCommissionWithdrawAmount#227#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	staticCommissionBalance#229 := staticCommissionBalance#229[call_arg#149 := staticCommissionBalance#229#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[call_arg#149 := dynamicCommissionBalance#231#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[call_arg#149 := calcDynamicCommissionAmount#233#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	sponsorAddress#235 := sponsorAddress#235[call_arg#149 := sponsorAddress#235#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	assume {:sourceloc "buggy_24.sol", 636, 31} {:message ""} true;
	call getAbortInvestAmount#1056_ret#151 := getAbortInvestAmount#1056(__this, __msg_sender, __msg_value, call_arg#149);
	avaliableIA#2175 := getAbortInvestAmount#1056_ret#151;
	}

	new_struct_User#153 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#152 := new_struct_User#153;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[call_arg#152 := totalInvestCount#201#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalInvestAmount#203 := totalInvestAmount#203[call_arg#152 := totalInvestAmount#203#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[call_arg#152 := totalStaticCommissionWithdrawAmount#205#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[call_arg#152 := totalDynamicCommissionWithdrawAmount#207#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[call_arg#152 := totalWithdrawAmount#209#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	downlineCount#211 := downlineCount#211[call_arg#152 := downlineCount#211#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	nodeCount#213 := nodeCount#213[call_arg#152 := nodeCount#213#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[call_arg#152 := totalDownlineInvestAmount#215#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestTime#217 := currentInvestTime#217[call_arg#152 := currentInvestTime#217#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestAmount#219 := currentInvestAmount#219[call_arg#152 := currentInvestAmount#219#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentInvestCycle#221 := currentInvestCycle#221[call_arg#152 := currentInvestCycle#221#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentlevel#223 := currentlevel#223[call_arg#152 := currentlevel#223#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[call_arg#152 := currentStaticCommissionRatio#225#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[call_arg#152 := currentStaticCommissionWithdrawAmount#227#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	staticCommissionBalance#229 := staticCommissionBalance#229[call_arg#152 := staticCommissionBalance#229#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[call_arg#152 := dynamicCommissionBalance#231#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[call_arg#152 := calcDynamicCommissionAmount#233#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	sponsorAddress#235 := sponsorAddress#235[call_arg#152 := sponsorAddress#235#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]]))];
	assume {:sourceloc "buggy_24.sol", 638, 36} {:message ""} true;
	call getAvaliableStaticCommissionAmount#1432_ret#154 := getAvaliableStaticCommissionAmount#1432(__this, __msg_sender, __msg_value, call_arg#152);
	avaliableSCA#2192 := getAvaliableStaticCommissionAmount#1432_ret#154;
	assume {:sourceloc "buggy_24.sol", 639, 44} {:message ""} true;
	call add#28_ret#155 := add#28(__this, __msg_sender, __msg_value, staticCommissionBalance#229#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]])), avaliableSCA#2192);
	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2164[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2164[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2164[1]]), add#28_ret#155, dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2164[1]]), downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2164[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2164[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2164[1]]), currentlevel#223#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2164[1]]), add#28_ret#155, dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2164[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), 0, currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2164[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2164[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2164[1]]), downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), 0, currentInvestAmount#219#User#236#constr(User236default_context[user#2164[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2164[1]]), currentlevel#223#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2164[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2164[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2164[1]]), 0, currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2164[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2164[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2164[1]]), downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2164[1]]), 0, currentInvestCycle#221#User#236#constr(User236default_context[user#2164[1]]), currentlevel#223#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2164[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2164[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2164[1]]), 0, currentlevel#223#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2164[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2164[1]]), downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2164[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2164[1]]), 0, currentlevel#223#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2164[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2164[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2164[1]]), 0, currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2164[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2164[1]]), downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2164[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2164[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2164[1]]), 0, currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2164[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2164[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2164[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2164[1]]), 0, currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2164[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2164[1]]), downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2164[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2164[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2164[1]]), currentlevel#223#User#236#constr(User236default_context[user#2164[1]]), 0, currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2164[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2164[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2164[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2164[1]]), 0, staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2164[1]]), downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2164[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2164[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2164[1]]), currentlevel#223#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2164[1]]), 0, staticCommissionBalance#229#User#236#constr(User236default_context[user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 646, 40} {:message ""} true;
	call add#28_ret#156 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#209#User#236#constr((if (user#2164[0] == 22) then userMapping#611[__this][user#2164[1]] else User236default_context[user#2164[1]])), avaliableIA#2175);
	if ((user#2164[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2164[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2164[1]]), add#28_ret#156, downlineCount#211#User#236#constr(userMapping#611[__this][user#2164[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2164[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2164[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2164[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2164[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2164[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2164[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2164[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2164[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2164[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2164[1]]), add#28_ret#156, downlineCount#211#User#236#constr(User236default_context[user#2164[1]]), nodeCount#213#User#236#constr(User236default_context[user#2164[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2164[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2164[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2164[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2164[1]]), currentlevel#223#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2164[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2164[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2164[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2164[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2164[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2164[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 647, 35} {:message ""} true;
	call add#28_ret#157 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#439[__this], avaliableIA#2175);
	totalWithdrawAmount#439 := totalWithdrawAmount#439[__this := add#28_ret#157];
	assume {:sourceloc "buggy_24.sol", 648, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableIA#2175);
	}

	$return51:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_24.sol", 651, 1} {:message "winner_tmstmp14"} winner_tmstmp14#2274: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 652, 1} {:message "FomoFeast::play_tmstmp14"} play_tmstmp14#2296(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2276: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#2276 + 432000) == __block_timestamp)) {
	winner_tmstmp14#2274 := winner_tmstmp14#2274[__this := __msg_sender];
	}

	$return52:
	// Function body ends here
}

// 
// Function: userWithdrawCommission
procedure {:sourceloc "buggy_24.sol", 656, 5} {:message "FomoFeast::userWithdrawCommission"} userWithdrawCommission#2436(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var user#2300: [int]int;
	var {:sourceloc "buggy_24.sol", 658, 9} {:message "avaliableDCB"} avaliableDCB#2307: int;
	var {:sourceloc "buggy_24.sol", 659, 9} {:message "avaliableSCA"} avaliableSCA#2312: int;
	var call_arg#158: address_struct_memory_User#236;
	var new_struct_User#159: address_struct_memory_User#236;
	var getAvaliableStaticCommissionAmount#1432_ret#160: int;
	var {:sourceloc "buggy_24.sol", 660, 9} {:message "avaliableSCB"} avaliableSCB#2318: int;
	var add#28_ret#161: int;
	var {:sourceloc "buggy_24.sol", 661, 9} {:message "avaliableWithdrawAmount"} avaliableWithdrawAmount#2326: int;
	var add#28_ret#162: int;
	var call_arg#163: int;
	var div#125_ret#164: int;
	var add#28_ret#165: int;
	var add#28_ret#166: int;
	var add#28_ret#167: int;
	var add#28_ret#168: int;
	var add#28_ret#169: int;
	var add#28_ret#170: int;
	var add#28_ret#171: int;
	var call_arg#172: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	user#2300 := default_int_int()[0 := 22][1 := __msg_sender];
	avaliableDCB#2307 := dynamicCommissionBalance#231#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]));
	new_struct_User#159 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#158 := new_struct_User#159;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[call_arg#158 := totalInvestCount#201#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	totalInvestAmount#203 := totalInvestAmount#203[call_arg#158 := totalInvestAmount#203#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[call_arg#158 := totalStaticCommissionWithdrawAmount#205#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[call_arg#158 := totalDynamicCommissionWithdrawAmount#207#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[call_arg#158 := totalWithdrawAmount#209#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	downlineCount#211 := downlineCount#211[call_arg#158 := downlineCount#211#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	nodeCount#213 := nodeCount#213[call_arg#158 := nodeCount#213#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[call_arg#158 := totalDownlineInvestAmount#215#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	currentInvestTime#217 := currentInvestTime#217[call_arg#158 := currentInvestTime#217#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	currentInvestAmount#219 := currentInvestAmount#219[call_arg#158 := currentInvestAmount#219#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	currentInvestCycle#221 := currentInvestCycle#221[call_arg#158 := currentInvestCycle#221#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	currentlevel#223 := currentlevel#223[call_arg#158 := currentlevel#223#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[call_arg#158 := currentStaticCommissionRatio#225#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[call_arg#158 := currentStaticCommissionWithdrawAmount#227#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	staticCommissionBalance#229 := staticCommissionBalance#229[call_arg#158 := staticCommissionBalance#229#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[call_arg#158 := dynamicCommissionBalance#231#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[call_arg#158 := calcDynamicCommissionAmount#233#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	sponsorAddress#235 := sponsorAddress#235[call_arg#158 := sponsorAddress#235#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]]))];
	assume {:sourceloc "buggy_24.sol", 659, 32} {:message ""} true;
	call getAvaliableStaticCommissionAmount#1432_ret#160 := getAvaliableStaticCommissionAmount#1432(__this, __msg_sender, __msg_value, call_arg#158);
	avaliableSCA#2312 := getAvaliableStaticCommissionAmount#1432_ret#160;
	assume {:sourceloc "buggy_24.sol", 660, 32} {:message ""} true;
	call add#28_ret#161 := add#28(__this, __msg_sender, __msg_value, staticCommissionBalance#229#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]])), avaliableSCA#2312);
	avaliableSCB#2318 := add#28_ret#161;
	assume {:sourceloc "buggy_24.sol", 661, 43} {:message ""} true;
	call add#28_ret#162 := add#28(__this, __msg_sender, __msg_value, avaliableDCB#2307, avaliableSCB#2318);
	avaliableWithdrawAmount#2326 := add#28_ret#162;
	call_arg#163 := 10;
	assume {:sourceloc "buggy_24.sol", 662, 40} {:message ""} true;
	call div#125_ret#164 := div#125(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#163);
	if ((avaliableWithdrawAmount#2326 >= div#125_ret#164)) {
	if ((user#2300[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2300[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2300[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2300[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2300[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2300[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2300[1]]), 0, dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2300[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2300[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2300[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2300[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2300[1]]), downlineCount#211#User#236#constr(User236default_context[user#2300[1]]), nodeCount#213#User#236#constr(User236default_context[user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2300[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2300[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2300[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2300[1]]), currentlevel#223#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2300[1]]), 0, dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2300[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2300[1]]))];
	}

	if ((user#2300[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2300[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2300[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2300[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2300[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2300[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2300[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2300[1]]), 0, calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2300[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2300[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2300[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2300[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2300[1]]), downlineCount#211#User#236#constr(User236default_context[user#2300[1]]), nodeCount#213#User#236#constr(User236default_context[user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2300[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2300[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2300[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2300[1]]), currentlevel#223#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2300[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2300[1]]), 0, calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2300[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2300[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 665, 58} {:message ""} true;
	call add#28_ret#165 := add#28(__this, __msg_sender, __msg_value, currentStaticCommissionWithdrawAmount#227#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]])), avaliableSCA#2312);
	if ((user#2300[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2300[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2300[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2300[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2300[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2300[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2300[1]]), add#28_ret#165, staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2300[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2300[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2300[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2300[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2300[1]]), downlineCount#211#User#236#constr(User236default_context[user#2300[1]]), nodeCount#213#User#236#constr(User236default_context[user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2300[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2300[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2300[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2300[1]]), currentlevel#223#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2300[1]]), add#28_ret#165, staticCommissionBalance#229#User#236#constr(User236default_context[user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2300[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2300[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 666, 56} {:message ""} true;
	call add#28_ret#166 := add#28(__this, __msg_sender, __msg_value, totalStaticCommissionWithdrawAmount#205#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]])), avaliableSCB#2318);
	if ((user#2300[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2300[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2300[1]]), add#28_ret#166, totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2300[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2300[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2300[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2300[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2300[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2300[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2300[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2300[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2300[1]]), add#28_ret#166, totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2300[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#2300[1]]), downlineCount#211#User#236#constr(User236default_context[user#2300[1]]), nodeCount#213#User#236#constr(User236default_context[user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2300[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2300[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2300[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2300[1]]), currentlevel#223#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2300[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2300[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2300[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 667, 57} {:message ""} true;
	call add#28_ret#167 := add#28(__this, __msg_sender, __msg_value, totalDynamicCommissionWithdrawAmount#207#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]])), avaliableDCB#2307);
	if ((user#2300[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2300[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2300[1]]), add#28_ret#167, totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#2300[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#2300[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2300[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2300[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2300[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2300[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2300[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2300[1]]), add#28_ret#167, totalWithdrawAmount#209#User#236#constr(User236default_context[user#2300[1]]), downlineCount#211#User#236#constr(User236default_context[user#2300[1]]), nodeCount#213#User#236#constr(User236default_context[user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2300[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2300[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2300[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2300[1]]), currentlevel#223#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2300[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2300[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2300[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 668, 40} {:message ""} true;
	call add#28_ret#168 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#209#User#236#constr((if (user#2300[0] == 22) then userMapping#611[__this][user#2300[1]] else User236default_context[user#2300[1]])), avaliableWithdrawAmount#2326);
	if ((user#2300[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#2300[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#2300[1]]), add#28_ret#168, downlineCount#211#User#236#constr(userMapping#611[__this][user#2300[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#2300[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#2300[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#2300[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#2300[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#2300[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#2300[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#2300[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#2300[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#2300[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#2300[1]]), add#28_ret#168, downlineCount#211#User#236#constr(User236default_context[user#2300[1]]), nodeCount#213#User#236#constr(User236default_context[user#2300[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#2300[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#2300[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#2300[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#2300[1]]), currentlevel#223#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#2300[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#2300[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#2300[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#2300[1]]), calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#2300[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#2300[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 669, 51} {:message ""} true;
	call add#28_ret#169 := add#28(__this, __msg_sender, __msg_value, totalStaticCommissionWithdrawAmount#377[__this], avaliableSCB#2318);
	totalStaticCommissionWithdrawAmount#377 := totalStaticCommissionWithdrawAmount#377[__this := add#28_ret#169];
	assume {:sourceloc "buggy_24.sol", 670, 52} {:message ""} true;
	call add#28_ret#170 := add#28(__this, __msg_sender, __msg_value, totalDynamicCommissionWithdrawAmount#426[__this], avaliableDCB#2307);
	totalDynamicCommissionWithdrawAmount#426 := totalDynamicCommissionWithdrawAmount#426[__this := add#28_ret#170];
	assume {:sourceloc "buggy_24.sol", 671, 35} {:message ""} true;
	call add#28_ret#171 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#439[__this], avaliableWithdrawAmount#2326);
	totalWithdrawAmount#439 := totalWithdrawAmount#439[__this := add#28_ret#171];
	if ((avaliableSCB#2318 > 0)) {
	call_arg#172 := __msg_sender;
	assume {:sourceloc "buggy_24.sol", 673, 17} {:message ""} true;
	call addStaticCommissionRecord#1614(__this, __msg_sender, __msg_value, call_arg#172, __block_timestamp, avaliableSCB#2318);
	}

	assume {:sourceloc "buggy_24.sol", 675, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableWithdrawAmount#2326);
	}

	$return53:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_24.sol", 678, 1} {:message "winner_tmstmp30"} winner_tmstmp30#2438: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 679, 1} {:message "FomoFeast::play_tmstmp30"} play_tmstmp30#2460(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2440: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#2440 + 432000) == __block_timestamp)) {
	winner_tmstmp30#2438 := winner_tmstmp30#2438[__this := __msg_sender];
	}

	$return54:
	// Function body ends here
}

const unique address_0xddf0bB01f81059CCdB3D5bF5b1C7Bd540aDDFEac: address_t;
// 
// Function: engineerWithdraw
procedure {:sourceloc "buggy_24.sol", 683, 5} {:message "FomoFeast::engineerWithdraw"} engineerWithdraw#2495(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#174: int_arr_ptr;
	var new_array#175: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 684, 9} {:message "avaliableAmount"} avaliableAmount#2466#176: int;
	var add#28_ret#177: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyEngineer starts here
	new_array#175 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#174 := new_array#175;
	mem_arr_int := mem_arr_int[call_arg#174 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 69][5 := 110][6 := 103][7 := 105][8 := 110][9 := 101][10 := 101][11 := 114], 12)];
	assume (__msg_sender == address_0xddf0bB01f81059CCdB3D5bF5b1C7Bd540aDDFEac);
	// Function body starts here
	avaliableAmount#2466#176 := engineerFunds#518[__this];
	if ((avaliableAmount#2466#176 > 0)) {
	engineerFunds#518 := engineerFunds#518[__this := 0];
	assume {:sourceloc "buggy_24.sol", 687, 38} {:message ""} true;
	call add#28_ret#177 := add#28(__this, __msg_sender, __msg_value, engineerWithdrawAmount#544[__this], avaliableAmount#2466#176);
	engineerWithdrawAmount#544 := engineerWithdrawAmount#544[__this := add#28_ret#177];
	assume {:sourceloc "buggy_24.sol", 688, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableAmount#2466#176);
	}

	$return56:
	// Function body ends here
	$return55:
	// Inlined modifier onlyEngineer ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_24.sol", 691, 1} {:message "FomoFeast::bug_tmstmp8"} bug_tmstmp8#2542(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 692, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#2499: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#2499 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#2499);
	pastBlockTime_tmstmp8#2499 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 697, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return57:
	// Function body ends here
}

// 
// Function: operatorWithdraw
procedure {:sourceloc "buggy_24.sol", 701, 5} {:message "FomoFeast::operatorWithdraw"} operatorWithdraw#2577(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#179: int_arr_ptr;
	var new_array#180: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 702, 9} {:message "avaliableAmount"} avaliableAmount#2548#181: int;
	var add#28_ret#182: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#180 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#179 := new_array#180;
	mem_arr_int := mem_arr_int[call_arg#179 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#289[__this]);
	// Function body starts here
	avaliableAmount#2548#181 := operatorFunds#557[__this];
	if ((avaliableAmount#2548#181 > 0)) {
	operatorFunds#557 := operatorFunds#557[__this := 0];
	assume {:sourceloc "buggy_24.sol", 705, 38} {:message ""} true;
	call add#28_ret#182 := add#28(__this, __msg_sender, __msg_value, operatorWithdrawAmount#583[__this], avaliableAmount#2548#181);
	operatorWithdrawAmount#583 := operatorWithdrawAmount#583[__this := add#28_ret#182];
	assume {:sourceloc "buggy_24.sol", 706, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableAmount#2548#181);
	}

	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_24.sol", 709, 1} {:message "winner_tmstmp39"} winner_tmstmp39#2579: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 710, 1} {:message "FomoFeast::play_tmstmp39"} play_tmstmp39#2605(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2581: int)
{
	var {:sourceloc "buggy_24.sol", 711, 2} {:message "_vtime"} _vtime#2585: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#2585 := __block_timestamp;
	if (((startTime#2581 + 432000) == _vtime#2585)) {
	winner_tmstmp39#2579 := winner_tmstmp39#2579[__this := __msg_sender];
	}

	$return60:
	// Function body ends here
}

// 
// Function: getSummary : function () view returns (uint256[11] memory)
procedure {:sourceloc "buggy_24.sol", 715, 5} {:message "FomoFeast::getSummary"} getSummary#2631(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#2610: int_arr_ptr)
{
	var new_array#183: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#183 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[0 := __balance[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[1 := totalInvestCount#302[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[2 := totalInvestAmount#328[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[3 := totalStaticCommissionWithdrawAmount#377[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[4 := totalDynamicCommissionWithdrawAmount#426[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[5 := totalWithdrawAmount#439[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[6 := totalUserCount#469[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[7 := engineerFunds#518[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[8 := engineerWithdrawAmount#544[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[9 := operatorFunds#557[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183])[10 := operatorWithdrawAmount#583[__this]], length#int_arr#constr(mem_arr_int[new_array#183]))];
	mem_arr_int := mem_arr_int[new_array#183 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#183]), 11)];
	#2610 := new_array#183;
	goto $return61;
	$return61:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_24.sol", 724, 1} {:message "FomoFeast::bug_tmstmp36"} bug_tmstmp36#2678(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 725, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#2635: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#2635 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#2635);
	pastBlockTime_tmstmp36#2635 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 730, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return62:
	// Function body ends here
}

// 
// Function: getUserByAddress : function (address) view returns (uint256[16] memory,address)
procedure {:sourceloc "buggy_24.sol", 734, 5} {:message "FomoFeast::getUserByAddress"} getUserByAddress#2738(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#2680: address_t)
	returns (#2685: int_arr_ptr, #2687: address_t)
{
	var {:sourceloc "buggy_24.sol", 736, 9} {:message "user"} user#2690: address_struct_memory_User#236;
	var new_struct_User#184: address_struct_memory_User#236;
	var new_array#185: int_arr_ptr;
	var getAvaliableStaticCommissionAmount#1432_ret#186: int;
	var add#28_ret#187: int;
	var tmp#188: int_arr_ptr;
	var tmp#189: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_struct_User#184 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#2690 := new_struct_User#184;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[user#2690 := totalInvestCount#201#User#236#constr(userMapping#611[__this][userAddress#2680])];
	totalInvestAmount#203 := totalInvestAmount#203[user#2690 := totalInvestAmount#203#User#236#constr(userMapping#611[__this][userAddress#2680])];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[user#2690 := totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][userAddress#2680])];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[user#2690 := totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][userAddress#2680])];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[user#2690 := totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][userAddress#2680])];
	downlineCount#211 := downlineCount#211[user#2690 := downlineCount#211#User#236#constr(userMapping#611[__this][userAddress#2680])];
	nodeCount#213 := nodeCount#213[user#2690 := nodeCount#213#User#236#constr(userMapping#611[__this][userAddress#2680])];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[user#2690 := totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][userAddress#2680])];
	currentInvestTime#217 := currentInvestTime#217[user#2690 := currentInvestTime#217#User#236#constr(userMapping#611[__this][userAddress#2680])];
	currentInvestAmount#219 := currentInvestAmount#219[user#2690 := currentInvestAmount#219#User#236#constr(userMapping#611[__this][userAddress#2680])];
	currentInvestCycle#221 := currentInvestCycle#221[user#2690 := currentInvestCycle#221#User#236#constr(userMapping#611[__this][userAddress#2680])];
	currentlevel#223 := currentlevel#223[user#2690 := currentlevel#223#User#236#constr(userMapping#611[__this][userAddress#2680])];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[user#2690 := currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][userAddress#2680])];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[user#2690 := currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][userAddress#2680])];
	staticCommissionBalance#229 := staticCommissionBalance#229[user#2690 := staticCommissionBalance#229#User#236#constr(userMapping#611[__this][userAddress#2680])];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[user#2690 := dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][userAddress#2680])];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[user#2690 := calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][userAddress#2680])];
	sponsorAddress#235 := sponsorAddress#235[user#2690 := sponsorAddress#235#User#236#constr(userMapping#611[__this][userAddress#2680])];
	new_array#185 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[0 := totalInvestCount#201[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[1 := totalInvestAmount#203[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[2 := totalStaticCommissionWithdrawAmount#205[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[3 := totalDynamicCommissionWithdrawAmount#207[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[4 := totalWithdrawAmount#209[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[5 := downlineCount#211[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[6 := nodeCount#213[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[7 := totalDownlineInvestAmount#215[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[8 := currentInvestTime#217[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[9 := currentInvestAmount#219[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[10 := currentInvestCycle#221[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[11 := currentlevel#223[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[12 := currentStaticCommissionRatio#225[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	assume {:sourceloc "buggy_24.sol", 746, 51} {:message ""} true;
	call getAvaliableStaticCommissionAmount#1432_ret#186 := getAvaliableStaticCommissionAmount#1432(__this, __msg_sender, __msg_value, user#2690);
	assume {:sourceloc "buggy_24.sol", 746, 18} {:message ""} true;
	call add#28_ret#187 := add#28(__this, __msg_sender, __msg_value, staticCommissionBalance#229[user#2690], getAvaliableStaticCommissionAmount#1432_ret#186);
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[13 := add#28_ret#187], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[14 := dynamicCommissionBalance#231[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185])[15 := calcDynamicCommissionAmount#233[user#2690]], length#int_arr#constr(mem_arr_int[new_array#185]))];
	mem_arr_int := mem_arr_int[new_array#185 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#185]), 16)];
	tmp#188 := new_array#185;
	tmp#189 := sponsorAddress#235[user#2690];
	#2687 := tmp#189;
	#2685 := tmp#188;
	goto $return63;
	$return63:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_24.sol", 751, 1} {:message "winner_tmstmp35"} winner_tmstmp35#2740: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 752, 1} {:message "FomoFeast::play_tmstmp35"} play_tmstmp35#2766(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#2742: int)
{
	var {:sourceloc "buggy_24.sol", 753, 2} {:message "_vtime"} _vtime#2746: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#2746 := __block_timestamp;
	if (((startTime#2742 + 432000) == _vtime#2746)) {
	winner_tmstmp35#2740 := winner_tmstmp35#2740[__this := __msg_sender];
	}

	$return64:
	// Function body ends here
}

// 
// Function: getUserByIndex
procedure {:sourceloc "buggy_24.sol", 757, 5} {:message "FomoFeast::getUserByIndex"} getUserByIndex#2786(__this: address_t, __msg_sender: address_t, __msg_value: int, index#2768: int)
	returns (#2775: int_arr_ptr, #2777: address_t)
{
	var call_arg#191: int_arr_ptr;
	var new_array#192: int_arr_ptr;
	var getUserByAddress#2738_ret#194: int_arr_ptr;
	var getUserByAddress#2738_ret#195: address_t;
	var tmp#196: int_arr_ptr;
	var tmp#197: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#192 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#191 := new_array#192;
	mem_arr_int := mem_arr_int[call_arg#191 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#289[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 759, 16} {:message ""} true;
	call getUserByAddress#2738_ret#194, getUserByAddress#2738_ret#195 := getUserByAddress#2738(__this, __msg_sender, __msg_value, addressMapping#662[__this][index#2768]);
	tmp#196 := getUserByAddress#2738_ret#194;
	tmp#197 := getUserByAddress#2738_ret#195;
	#2777 := tmp#197;
	#2775 := tmp#196;
	goto $return66;
	$return66:
	// Function body ends here
	$return65:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_24.sol", 761, 1} {:message "FomoFeast::bug_tmstmp40"} bug_tmstmp40#2833(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 762, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#2790: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#2790 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#2790);
	pastBlockTime_tmstmp40#2790 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_24.sol", 767, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return67:
	// Function body ends here
}

type address_struct_memory_InvestRecord#243_arr_ptr = int;
type {:datatype} address_struct_memory_InvestRecord#243_arr_type;
function {:constructor} address_struct_memory_InvestRecord#243_arr#constr(arr: [int]address_struct_memory_InvestRecord#243, length: int) returns (address_struct_memory_InvestRecord#243_arr_type);
var mem_arr_address_struct_memory_InvestRecord#243: [address_struct_memory_InvestRecord#243_arr_ptr]address_struct_memory_InvestRecord#243_arr_type;
// 
// Function: getInvestRecords
procedure {:sourceloc "buggy_24.sol", 771, 5} {:message "FomoFeast::getInvestRecords"} {:skipped} getInvestRecords#3003(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#2835: address_t)
	returns (#2840: int_arr_ptr, #2844: int_arr_ptr, #2848: int_arr_ptr, #2852: int_arr_ptr, #2856: int_arr_ptr, #2860: int_arr_ptr, #2864: int_arr_ptr, #2868: int_arr_ptr, #2872: int_arr_ptr);
	modifies initialized#263, winner_tmstmp18#265, owner#289, totalInvestCount#302, winner_tmstmp6#304, totalInvestAmount#328, totalStaticCommissionWithdrawAmount#377, totalDynamicCommissionWithdrawAmount#426, totalWithdrawAmount#439, winner_tmstmp15#441, totalUserCount#469, engineerFunds#518, winner_tmstmp34#520, engineerWithdrawAmount#544, operatorFunds#557, winner_tmstmp10#559, operatorWithdrawAmount#583, winner_tmstmp22#585, userMapping#611, addressMapping#662, winner_tmstmp11#664, investRecordMapping#696, staticCommissionRecordMapping#713, winner_tmstmp2#715, dynamicCommissionRecordMapping#743, bugv_tmstmp3#838, bugv_tmstmp4#854, winner_tmstmp3#879, winner_tmstmp19#1058, winner_tmstmp26#1176, winner_tmstmp38#1538, winner_tmstmp7#1717, winner_tmstmp23#2134, winner_tmstmp14#2274, winner_tmstmp30#2438, winner_tmstmp39#2579, winner_tmstmp35#2740, winner_tmstmp27#3150, winner_tmstmp31#3312, bugv_tmstmp5#3662, bugv_tmstmp1#3868, bugv_tmstmp2#3934;

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 791, 1} {:message "FomoFeast::bug_tmstmp33"} bug_tmstmp33#3014(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#3006: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#3006 := (__block_timestamp >= 1546300800);
	goto $return69;
	$return69:
	// Function body ends here
}

type address_struct_memory_CommissionRecord#248_arr_ptr = int;
type {:datatype} address_struct_memory_CommissionRecord#248_arr_type;
function {:constructor} address_struct_memory_CommissionRecord#248_arr#constr(arr: [int]address_struct_memory_CommissionRecord#248, length: int) returns (address_struct_memory_CommissionRecord#248_arr_type);
var mem_arr_address_struct_memory_CommissionRecord#248: [address_struct_memory_CommissionRecord#248_arr_ptr]address_struct_memory_CommissionRecord#248_arr_type;
// 
// Function: getStaticCommissionRecords
procedure {:sourceloc "buggy_24.sol", 795, 5} {:message "FomoFeast::getStaticCommissionRecords"} {:skipped} getStaticCommissionRecords#3148(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#3016: address_t)
	returns (#3021: int_arr_ptr, #3025: int_arr_ptr, #3029: int_arr_ptr, #3033: int_arr_ptr, #3037: int_arr_ptr, #3041: int_arr_ptr, #3045: int_arr_ptr, #3049: int_arr_ptr, #3053: int_arr_ptr);
	modifies initialized#263, winner_tmstmp18#265, owner#289, totalInvestCount#302, winner_tmstmp6#304, totalInvestAmount#328, totalStaticCommissionWithdrawAmount#377, totalDynamicCommissionWithdrawAmount#426, totalWithdrawAmount#439, winner_tmstmp15#441, totalUserCount#469, engineerFunds#518, winner_tmstmp34#520, engineerWithdrawAmount#544, operatorFunds#557, winner_tmstmp10#559, operatorWithdrawAmount#583, winner_tmstmp22#585, userMapping#611, addressMapping#662, winner_tmstmp11#664, investRecordMapping#696, staticCommissionRecordMapping#713, winner_tmstmp2#715, dynamicCommissionRecordMapping#743, bugv_tmstmp3#838, bugv_tmstmp4#854, winner_tmstmp3#879, winner_tmstmp19#1058, winner_tmstmp26#1176, winner_tmstmp38#1538, winner_tmstmp7#1717, winner_tmstmp23#2134, winner_tmstmp14#2274, winner_tmstmp30#2438, winner_tmstmp39#2579, winner_tmstmp35#2740, winner_tmstmp27#3150, winner_tmstmp31#3312, bugv_tmstmp5#3662, bugv_tmstmp1#3868, bugv_tmstmp2#3934;

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_24.sol", 815, 1} {:message "winner_tmstmp27"} winner_tmstmp27#3150: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 816, 1} {:message "FomoFeast::play_tmstmp27"} play_tmstmp27#3176(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#3152: int)
{
	var {:sourceloc "buggy_24.sol", 817, 2} {:message "_vtime"} _vtime#3156: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#3156 := __block_timestamp;
	if (((startTime#3152 + 432000) == _vtime#3156)) {
	winner_tmstmp27#3150 := winner_tmstmp27#3150[__this := __msg_sender];
	}

	$return71:
	// Function body ends here
}

// 
// Function: getDynamicCommissionRecords
procedure {:sourceloc "buggy_24.sol", 821, 5} {:message "FomoFeast::getDynamicCommissionRecords"} {:skipped} getDynamicCommissionRecords#3310(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#3178: address_t)
	returns (#3183: int_arr_ptr, #3187: int_arr_ptr, #3191: int_arr_ptr, #3195: int_arr_ptr, #3199: int_arr_ptr, #3203: int_arr_ptr, #3207: int_arr_ptr, #3211: int_arr_ptr, #3215: int_arr_ptr);
	modifies initialized#263, winner_tmstmp18#265, owner#289, totalInvestCount#302, winner_tmstmp6#304, totalInvestAmount#328, totalStaticCommissionWithdrawAmount#377, totalDynamicCommissionWithdrawAmount#426, totalWithdrawAmount#439, winner_tmstmp15#441, totalUserCount#469, engineerFunds#518, winner_tmstmp34#520, engineerWithdrawAmount#544, operatorFunds#557, winner_tmstmp10#559, operatorWithdrawAmount#583, winner_tmstmp22#585, userMapping#611, addressMapping#662, winner_tmstmp11#664, investRecordMapping#696, staticCommissionRecordMapping#713, winner_tmstmp2#715, dynamicCommissionRecordMapping#743, bugv_tmstmp3#838, bugv_tmstmp4#854, winner_tmstmp3#879, winner_tmstmp19#1058, winner_tmstmp26#1176, winner_tmstmp38#1538, winner_tmstmp7#1717, winner_tmstmp23#2134, winner_tmstmp14#2274, winner_tmstmp30#2438, winner_tmstmp39#2579, winner_tmstmp35#2740, winner_tmstmp27#3150, winner_tmstmp31#3312, bugv_tmstmp5#3662, bugv_tmstmp1#3868, bugv_tmstmp2#3934;

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_24.sol", 841, 1} {:message "winner_tmstmp31"} winner_tmstmp31#3312: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 842, 1} {:message "FomoFeast::play_tmstmp31"} play_tmstmp31#3338(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#3314: int)
{
	var {:sourceloc "buggy_24.sol", 843, 2} {:message "_vtime"} _vtime#3318: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#3318 := __block_timestamp;
	if (((startTime#3314 + 432000) == _vtime#3318)) {
	winner_tmstmp31#3312 := winner_tmstmp31#3312[__this := __msg_sender];
	}

	$return73:
	// Function body ends here
}

// 
// Function: calcDynamicCommission
procedure {:sourceloc "buggy_24.sol", 847, 5} {:message "FomoFeast::calcDynamicCommission"} calcDynamicCommission#3608(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#256: int_arr_ptr;
	var new_array#257: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 848, 14} {:message "i"} i#3344#258: int;
	var user#3354#258: [int]int;
	var tmp#261: int;
	var {:sourceloc "buggy_24.sol", 853, 14} {:message "i"} i#3370#258: int;
	var {:sourceloc "buggy_24.sol", 854, 13} {:message "user"} user#3380#258: address_struct_memory_User#236;
	var new_struct_User#264: address_struct_memory_User#236;
	var {:sourceloc "buggy_24.sol", 856, 17} {:message "commissionDays"} commissionDays#3392#258: int;
	var sub#45_ret#265: int;
	var div#125_ret#266: int;
	var {:sourceloc "buggy_24.sol", 858, 21} {:message "depth"} depth#3412#258: int;
	var {:sourceloc "buggy_24.sol", 859, 21} {:message "addressWalker"} addressWalker#3416#258: address_t;
	var sponsor#3424#258: [int]int;
	var {:sourceloc "buggy_24.sol", 863, 29} {:message "dynamicCommissionRatio"} dynamicCommissionRatio#3434#258: int;
	var call_arg#269: address_struct_memory_User#236;
	var new_struct_User#270: address_struct_memory_User#236;
	var getDynamicCommissionRatio#1316_ret#271: int;
	var {:sourceloc "buggy_24.sol", 865, 33} {:message "dynamicCA"} dynamicCA#3444#258: int;
	var mul#108_ret#272: int;
	var mul#108_ret#273: int;
	var call_arg#274: int;
	var mul#108_ret#275: int;
	var call_arg#276: int;
	var div#125_ret#277: int;
	var call_arg#278: int;
	var mul#108_ret#279: int;
	var call_arg#280: int;
	var div#125_ret#281: int;
	var call_arg#282: int;
	var div#125_ret#283: int;
	var add#28_ret#284: int;
	var call_arg#285: int;
	var add#28_ret#286: int;
	var tmp#287: int;
	var {:sourceloc "buggy_24.sol", 888, 14} {:message "i"} i#3559#258: int;
	var {:sourceloc "buggy_24.sol", 889, 13} {:message "userAddress"} userAddress#3569#258: address_t;
	var user#3575#258: [int]int;
	var add#28_ret#290: int;
	var tmp#291: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#257 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#256 := new_array#257;
	mem_arr_int := mem_arr_int[call_arg#256 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#289[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#3344#258 := 0;
	while ((i#3344#258 < totalUserCount#469[__this])) {
	// Body
	user#3354#258 := default_int_int()[0 := 22][1 := addressMapping#662[__this][i#3344#258]];
	if ((user#3354#258[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#3354#258[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#3354#258[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#3354#258[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#3354#258[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#3354#258[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#3354#258[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#3354#258[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#3354#258[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#3354#258[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#3354#258[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#3354#258[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#3354#258[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#3354#258[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#3354#258[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#3354#258[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#3354#258[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#3354#258[1]]), 0, sponsorAddress#235#User#236#constr(userMapping#611[__this][user#3354#258[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#3354#258[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#3354#258[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#3354#258[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#3354#258[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#3354#258[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#3354#258[1]]), downlineCount#211#User#236#constr(User236default_context[user#3354#258[1]]), nodeCount#213#User#236#constr(User236default_context[user#3354#258[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#3354#258[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#3354#258[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#3354#258[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#3354#258[1]]), currentlevel#223#User#236#constr(User236default_context[user#3354#258[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#3354#258[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#3354#258[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#3354#258[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#3354#258[1]]), 0, sponsorAddress#235#User#236#constr(User236default_context[user#3354#258[1]]))];
	}

	$continue259:
	// Loop expression
	i#3344#258 := (i#3344#258 + 1);
	tmp#261 := i#3344#258;
	}

	break260:
	// The following while loop was mapped from a for loop
	// Initialization
	i#3370#258 := 0;
	while ((i#3370#258 < totalUserCount#469[__this])) {
	// Body
	new_struct_User#264 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#3380#258 := new_struct_User#264;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[user#3380#258 := totalInvestCount#201#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	totalInvestAmount#203 := totalInvestAmount#203[user#3380#258 := totalInvestAmount#203#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[user#3380#258 := totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[user#3380#258 := totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[user#3380#258 := totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	downlineCount#211 := downlineCount#211[user#3380#258 := downlineCount#211#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	nodeCount#213 := nodeCount#213[user#3380#258 := nodeCount#213#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[user#3380#258 := totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	currentInvestTime#217 := currentInvestTime#217[user#3380#258 := currentInvestTime#217#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	currentInvestAmount#219 := currentInvestAmount#219[user#3380#258 := currentInvestAmount#219#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	currentInvestCycle#221 := currentInvestCycle#221[user#3380#258 := currentInvestCycle#221#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	currentlevel#223 := currentlevel#223[user#3380#258 := currentlevel#223#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[user#3380#258 := currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[user#3380#258 := currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	staticCommissionBalance#229 := staticCommissionBalance#229[user#3380#258 := staticCommissionBalance#229#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[user#3380#258 := dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[user#3380#258 := calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	sponsorAddress#235 := sponsorAddress#235[user#3380#258 := sponsorAddress#235#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3370#258]])];
	if ((currentInvestAmount#219[user#3380#258] > 0)) {
	assume {:sourceloc "buggy_24.sol", 856, 42} {:message ""} true;
	call sub#45_ret#265 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#217[user#3380#258]);
	assume {:sourceloc "buggy_24.sol", 856, 42} {:message ""} true;
	call div#125_ret#266 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#265, 86400);
	commissionDays#3392#258 := div#125_ret#266;
	if (((commissionDays#3392#258 >= 1) && (commissionDays#3392#258 <= currentInvestCycle#221[user#3380#258]))) {
	depth#3412#258 := 1;
	addressWalker#3416#258 := sponsorAddress#235[user#3380#258];
	while ((addressWalker#3416#258 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#3424#258 := default_int_int()[0 := 22][1 := addressWalker#3416#258];
	if ((currentInvestAmount#219#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]])) > 0)) {
	new_struct_User#270 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#269 := new_struct_User#270;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[call_arg#269 := totalInvestCount#201#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	totalInvestAmount#203 := totalInvestAmount#203[call_arg#269 := totalInvestAmount#203#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[call_arg#269 := totalStaticCommissionWithdrawAmount#205#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[call_arg#269 := totalDynamicCommissionWithdrawAmount#207#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[call_arg#269 := totalWithdrawAmount#209#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	downlineCount#211 := downlineCount#211[call_arg#269 := downlineCount#211#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	nodeCount#213 := nodeCount#213[call_arg#269 := nodeCount#213#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[call_arg#269 := totalDownlineInvestAmount#215#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	currentInvestTime#217 := currentInvestTime#217[call_arg#269 := currentInvestTime#217#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	currentInvestAmount#219 := currentInvestAmount#219[call_arg#269 := currentInvestAmount#219#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	currentInvestCycle#221 := currentInvestCycle#221[call_arg#269 := currentInvestCycle#221#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	currentlevel#223 := currentlevel#223[call_arg#269 := currentlevel#223#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[call_arg#269 := currentStaticCommissionRatio#225#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[call_arg#269 := currentStaticCommissionWithdrawAmount#227#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	staticCommissionBalance#229 := staticCommissionBalance#229[call_arg#269 := staticCommissionBalance#229#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[call_arg#269 := dynamicCommissionBalance#231#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[call_arg#269 := calcDynamicCommissionAmount#233#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	sponsorAddress#235 := sponsorAddress#235[call_arg#269 := sponsorAddress#235#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]))];
	assume {:sourceloc "buggy_24.sol", 863, 62} {:message ""} true;
	call getDynamicCommissionRatio#1316_ret#271 := getDynamicCommissionRatio#1316(__this, __msg_sender, __msg_value, call_arg#269, depth#3412#258);
	dynamicCommissionRatio#3434#258 := getDynamicCommissionRatio#1316_ret#271;
	if ((dynamicCommissionRatio#3434#258 > 0)) {
	dynamicCA#3444#258 := currentInvestAmount#219#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]));
	if ((dynamicCA#3444#258 > currentInvestAmount#219[user#3380#258])) {
	dynamicCA#3444#258 := currentInvestAmount#219[user#3380#258];
	}

	assume {:sourceloc "buggy_24.sol", 869, 45} {:message ""} true;
	call mul#108_ret#272 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3444#258, currentStaticCommissionRatio#225[user#3380#258]);
	dynamicCA#3444#258 := mul#108_ret#272;
	assume {:sourceloc "buggy_24.sol", 870, 45} {:message ""} true;
	call mul#108_ret#273 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3444#258, dynamicCommissionRatio#3434#258);
	dynamicCA#3444#258 := mul#108_ret#273;
	if ((currentlevel#223#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]])) == 1)) {
	call_arg#274 := 3;
	assume {:sourceloc "buggy_24.sol", 872, 49} {:message ""} true;
	call mul#108_ret#275 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3444#258, call_arg#274);
	call_arg#276 := 1000000;
	assume {:sourceloc "buggy_24.sol", 872, 49} {:message ""} true;
	call div#125_ret#277 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#275, call_arg#276);
	dynamicCA#3444#258 := div#125_ret#277;
	}
	else {
	if ((currentlevel#223#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]])) == 2)) {
	call_arg#278 := 6;
	assume {:sourceloc "buggy_24.sol", 874, 49} {:message ""} true;
	call mul#108_ret#279 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3444#258, call_arg#278);
	call_arg#280 := 1000000;
	assume {:sourceloc "buggy_24.sol", 874, 49} {:message ""} true;
	call div#125_ret#281 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#279, call_arg#280);
	dynamicCA#3444#258 := div#125_ret#281;
	}
	else {
	call_arg#282 := 100000;
	assume {:sourceloc "buggy_24.sol", 876, 49} {:message ""} true;
	call div#125_ret#283 := div#125(__this, __msg_sender, __msg_value, dynamicCA#3444#258, call_arg#282);
	dynamicCA#3444#258 := div#125_ret#283;
	}

	}

	assume {:sourceloc "buggy_24.sol", 878, 71} {:message ""} true;
	call add#28_ret#284 := add#28(__this, __msg_sender, __msg_value, calcDynamicCommissionAmount#233#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]])), dynamicCA#3444#258);
	if ((sponsor#3424#258[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][sponsor#3424#258[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]), add#28_ret#284, sponsorAddress#235#User#236#constr(userMapping#611[__this][sponsor#3424#258[1]]))]];
	}
	else {
	User236default_context := User236default_context[sponsor#3424#258[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[sponsor#3424#258[1]]), totalInvestAmount#203#User#236#constr(User236default_context[sponsor#3424#258[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[sponsor#3424#258[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[sponsor#3424#258[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[sponsor#3424#258[1]]), downlineCount#211#User#236#constr(User236default_context[sponsor#3424#258[1]]), nodeCount#213#User#236#constr(User236default_context[sponsor#3424#258[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[sponsor#3424#258[1]]), currentInvestTime#217#User#236#constr(User236default_context[sponsor#3424#258[1]]), currentInvestAmount#219#User#236#constr(User236default_context[sponsor#3424#258[1]]), currentInvestCycle#221#User#236#constr(User236default_context[sponsor#3424#258[1]]), currentlevel#223#User#236#constr(User236default_context[sponsor#3424#258[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[sponsor#3424#258[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[sponsor#3424#258[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[sponsor#3424#258[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[sponsor#3424#258[1]]), add#28_ret#284, sponsorAddress#235#User#236#constr(User236default_context[sponsor#3424#258[1]]))];
	}

	}

	}

	addressWalker#3416#258 := sponsorAddress#235#User#236#constr((if (sponsor#3424#258[0] == 22) then userMapping#611[__this][sponsor#3424#258[1]] else User236default_context[sponsor#3424#258[1]]));
	call_arg#285 := 1;
	assume {:sourceloc "buggy_24.sol", 882, 33} {:message ""} true;
	call add#28_ret#286 := add#28(__this, __msg_sender, __msg_value, depth#3412#258, call_arg#285);
	depth#3412#258 := add#28_ret#286;
	$continue267:
	}

	break268:
	}

	}

	$continue262:
	// Loop expression
	i#3370#258 := (i#3370#258 + 1);
	tmp#287 := i#3370#258;
	}

	break263:
	// The following while loop was mapped from a for loop
	// Initialization
	i#3559#258 := 0;
	while ((i#3559#258 < totalUserCount#469[__this])) {
	// Body
	userAddress#3569#258 := addressMapping#662[__this][i#3559#258];
	user#3575#258 := default_int_int()[0 := 22][1 := userAddress#3569#258];
	if ((calcDynamicCommissionAmount#233#User#236#constr((if (user#3575#258[0] == 22) then userMapping#611[__this][user#3575#258[1]] else User236default_context[user#3575#258[1]])) > 0)) {
	assume {:sourceloc "buggy_24.sol", 892, 49} {:message ""} true;
	call add#28_ret#290 := add#28(__this, __msg_sender, __msg_value, dynamicCommissionBalance#231#User#236#constr((if (user#3575#258[0] == 22) then userMapping#611[__this][user#3575#258[1]] else User236default_context[user#3575#258[1]])), calcDynamicCommissionAmount#233#User#236#constr((if (user#3575#258[0] == 22) then userMapping#611[__this][user#3575#258[1]] else User236default_context[user#3575#258[1]])));
	if ((user#3575#258[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#3575#258[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#3575#258[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#3575#258[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#3575#258[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#3575#258[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#3575#258[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#3575#258[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#3575#258[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#3575#258[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#3575#258[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#3575#258[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#3575#258[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#3575#258[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#3575#258[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#3575#258[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#3575#258[1]]), add#28_ret#290, calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#3575#258[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#3575#258[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#3575#258[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#3575#258[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#3575#258[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#3575#258[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#3575#258[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#3575#258[1]]), downlineCount#211#User#236#constr(User236default_context[user#3575#258[1]]), nodeCount#213#User#236#constr(User236default_context[user#3575#258[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#3575#258[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#3575#258[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#3575#258[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#3575#258[1]]), currentlevel#223#User#236#constr(User236default_context[user#3575#258[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#3575#258[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#3575#258[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#3575#258[1]]), add#28_ret#290, calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#3575#258[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#3575#258[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 893, 17} {:message ""} true;
	call addDynamicCommissionRecord#1715(__this, __msg_sender, __msg_value, userAddress#3569#258, __block_timestamp, calcDynamicCommissionAmount#233#User#236#constr((if (user#3575#258[0] == 22) then userMapping#611[__this][user#3575#258[1]] else User236default_context[user#3575#258[1]])));
	}

	$continue288:
	// Loop expression
	i#3559#258 := (i#3559#258 + 1);
	tmp#291 := i#3559#258;
	}

	break289:
	$return75:
	// Function body ends here
	$return74:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_24.sol", 897, 1} {:message "FomoFeast::bug_tmstmp13"} bug_tmstmp13#3619(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#3611: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#3611 := (__block_timestamp >= 1546300800);
	goto $return76;
	$return76:
	// Function body ends here
}

// 
// Function: calcDynamicCommissionBegin
procedure {:sourceloc "buggy_24.sol", 901, 5} {:message "FomoFeast::calcDynamicCommissionBegin"} calcDynamicCommissionBegin#3658(__this: address_t, __msg_sender: address_t, __msg_value: int, index#3621: int, length#3623: int)
{
	var call_arg#293: int_arr_ptr;
	var new_array#294: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 902, 14} {:message "i"} i#3629#295: int;
	var user#3642#295: [int]int;
	var tmp#298: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#294 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#293 := new_array#294;
	mem_arr_int := mem_arr_int[call_arg#293 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#289[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#3629#295 := index#3621;
	while ((i#3629#295 < (index#3621 + length#3623))) {
	// Body
	user#3642#295 := default_int_int()[0 := 22][1 := addressMapping#662[__this][i#3629#295]];
	if ((user#3642#295[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#3642#295[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#3642#295[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#3642#295[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#3642#295[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#3642#295[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#3642#295[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#3642#295[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#3642#295[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#3642#295[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#3642#295[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#3642#295[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#3642#295[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#3642#295[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#3642#295[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#3642#295[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#3642#295[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][user#3642#295[1]]), 0, sponsorAddress#235#User#236#constr(userMapping#611[__this][user#3642#295[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#3642#295[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#3642#295[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#3642#295[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#3642#295[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#3642#295[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#3642#295[1]]), downlineCount#211#User#236#constr(User236default_context[user#3642#295[1]]), nodeCount#213#User#236#constr(User236default_context[user#3642#295[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#3642#295[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#3642#295[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#3642#295[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#3642#295[1]]), currentlevel#223#User#236#constr(User236default_context[user#3642#295[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#3642#295[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#3642#295[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#3642#295[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[user#3642#295[1]]), 0, sponsorAddress#235#User#236#constr(User236default_context[user#3642#295[1]]))];
	}

	$continue296:
	// Loop expression
	i#3629#295 := (i#3629#295 + 1);
	tmp#298 := i#3629#295;
	}

	break297:
	$return78:
	// Function body ends here
	$return77:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_24.sol", 907, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#3662: [address_t]int;
// 
// Function: calcDynamicCommissionRange
procedure {:sourceloc "buggy_24.sol", 909, 5} {:message "FomoFeast::calcDynamicCommissionRange"} calcDynamicCommissionRange#3864(__this: address_t, __msg_sender: address_t, __msg_value: int, index#3664: int, length#3666: int)
{
	var call_arg#300: int_arr_ptr;
	var new_array#301: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 910, 14} {:message "i"} i#3672#302: int;
	var {:sourceloc "buggy_24.sol", 911, 13} {:message "user"} user#3685#302: address_struct_memory_User#236;
	var new_struct_User#305: address_struct_memory_User#236;
	var {:sourceloc "buggy_24.sol", 913, 17} {:message "commissionDays"} commissionDays#3697#302: int;
	var sub#45_ret#306: int;
	var div#125_ret#307: int;
	var {:sourceloc "buggy_24.sol", 915, 21} {:message "depth"} depth#3717#302: int;
	var {:sourceloc "buggy_24.sol", 916, 21} {:message "addressWalker"} addressWalker#3721#302: address_t;
	var sponsor#3729#302: [int]int;
	var {:sourceloc "buggy_24.sol", 920, 29} {:message "dynamicCommissionRatio"} dynamicCommissionRatio#3739#302: int;
	var call_arg#310: address_struct_memory_User#236;
	var new_struct_User#311: address_struct_memory_User#236;
	var getDynamicCommissionRatio#1316_ret#312: int;
	var {:sourceloc "buggy_24.sol", 922, 33} {:message "dynamicCA"} dynamicCA#3749#302: int;
	var mul#108_ret#313: int;
	var mul#108_ret#314: int;
	var call_arg#315: int;
	var mul#108_ret#316: int;
	var call_arg#317: int;
	var div#125_ret#318: int;
	var call_arg#319: int;
	var mul#108_ret#320: int;
	var call_arg#321: int;
	var div#125_ret#322: int;
	var call_arg#323: int;
	var div#125_ret#324: int;
	var add#28_ret#325: int;
	var call_arg#326: int;
	var add#28_ret#327: int;
	var tmp#328: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#301 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#300 := new_array#301;
	mem_arr_int := mem_arr_int[call_arg#300 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#289[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#3672#302 := index#3664;
	while ((i#3672#302 < (index#3664 + length#3666))) {
	// Body
	new_struct_User#305 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#3685#302 := new_struct_User#305;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[user#3685#302 := totalInvestCount#201#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	totalInvestAmount#203 := totalInvestAmount#203[user#3685#302 := totalInvestAmount#203#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[user#3685#302 := totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[user#3685#302 := totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[user#3685#302 := totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	downlineCount#211 := downlineCount#211[user#3685#302 := downlineCount#211#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	nodeCount#213 := nodeCount#213[user#3685#302 := nodeCount#213#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[user#3685#302 := totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	currentInvestTime#217 := currentInvestTime#217[user#3685#302 := currentInvestTime#217#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	currentInvestAmount#219 := currentInvestAmount#219[user#3685#302 := currentInvestAmount#219#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	currentInvestCycle#221 := currentInvestCycle#221[user#3685#302 := currentInvestCycle#221#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	currentlevel#223 := currentlevel#223[user#3685#302 := currentlevel#223#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[user#3685#302 := currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[user#3685#302 := currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	staticCommissionBalance#229 := staticCommissionBalance#229[user#3685#302 := staticCommissionBalance#229#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[user#3685#302 := dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[user#3685#302 := calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	sponsorAddress#235 := sponsorAddress#235[user#3685#302 := sponsorAddress#235#User#236#constr(userMapping#611[__this][addressMapping#662[__this][i#3672#302]])];
	if ((currentInvestAmount#219[user#3685#302] > 0)) {
	assume {:sourceloc "buggy_24.sol", 913, 42} {:message ""} true;
	call sub#45_ret#306 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#217[user#3685#302]);
	assume {:sourceloc "buggy_24.sol", 913, 42} {:message ""} true;
	call div#125_ret#307 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#306, 86400);
	commissionDays#3697#302 := div#125_ret#307;
	if (((commissionDays#3697#302 >= 1) && (commissionDays#3697#302 <= currentInvestCycle#221[user#3685#302]))) {
	depth#3717#302 := 1;
	addressWalker#3721#302 := sponsorAddress#235[user#3685#302];
	while ((addressWalker#3721#302 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#3729#302 := default_int_int()[0 := 22][1 := addressWalker#3721#302];
	if ((currentInvestAmount#219#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]])) > 0)) {
	new_struct_User#311 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#310 := new_struct_User#311;
	// Deep copy struct User
	totalInvestCount#201 := totalInvestCount#201[call_arg#310 := totalInvestCount#201#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	totalInvestAmount#203 := totalInvestAmount#203[call_arg#310 := totalInvestAmount#203#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	totalStaticCommissionWithdrawAmount#205 := totalStaticCommissionWithdrawAmount#205[call_arg#310 := totalStaticCommissionWithdrawAmount#205#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	totalDynamicCommissionWithdrawAmount#207 := totalDynamicCommissionWithdrawAmount#207[call_arg#310 := totalDynamicCommissionWithdrawAmount#207#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	totalWithdrawAmount#209 := totalWithdrawAmount#209[call_arg#310 := totalWithdrawAmount#209#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	downlineCount#211 := downlineCount#211[call_arg#310 := downlineCount#211#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	nodeCount#213 := nodeCount#213[call_arg#310 := nodeCount#213#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	totalDownlineInvestAmount#215 := totalDownlineInvestAmount#215[call_arg#310 := totalDownlineInvestAmount#215#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	currentInvestTime#217 := currentInvestTime#217[call_arg#310 := currentInvestTime#217#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	currentInvestAmount#219 := currentInvestAmount#219[call_arg#310 := currentInvestAmount#219#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	currentInvestCycle#221 := currentInvestCycle#221[call_arg#310 := currentInvestCycle#221#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	currentlevel#223 := currentlevel#223[call_arg#310 := currentlevel#223#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	currentStaticCommissionRatio#225 := currentStaticCommissionRatio#225[call_arg#310 := currentStaticCommissionRatio#225#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	currentStaticCommissionWithdrawAmount#227 := currentStaticCommissionWithdrawAmount#227[call_arg#310 := currentStaticCommissionWithdrawAmount#227#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	staticCommissionBalance#229 := staticCommissionBalance#229[call_arg#310 := staticCommissionBalance#229#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	dynamicCommissionBalance#231 := dynamicCommissionBalance#231[call_arg#310 := dynamicCommissionBalance#231#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	calcDynamicCommissionAmount#233 := calcDynamicCommissionAmount#233[call_arg#310 := calcDynamicCommissionAmount#233#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	sponsorAddress#235 := sponsorAddress#235[call_arg#310 := sponsorAddress#235#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]))];
	assume {:sourceloc "buggy_24.sol", 920, 62} {:message ""} true;
	call getDynamicCommissionRatio#1316_ret#312 := getDynamicCommissionRatio#1316(__this, __msg_sender, __msg_value, call_arg#310, depth#3717#302);
	dynamicCommissionRatio#3739#302 := getDynamicCommissionRatio#1316_ret#312;
	if ((dynamicCommissionRatio#3739#302 > 0)) {
	dynamicCA#3749#302 := currentInvestAmount#219#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]));
	if ((dynamicCA#3749#302 > currentInvestAmount#219[user#3685#302])) {
	dynamicCA#3749#302 := currentInvestAmount#219[user#3685#302];
	}

	assume {:sourceloc "buggy_24.sol", 926, 45} {:message ""} true;
	call mul#108_ret#313 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3749#302, currentStaticCommissionRatio#225[user#3685#302]);
	dynamicCA#3749#302 := mul#108_ret#313;
	assume {:sourceloc "buggy_24.sol", 927, 45} {:message ""} true;
	call mul#108_ret#314 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3749#302, dynamicCommissionRatio#3739#302);
	dynamicCA#3749#302 := mul#108_ret#314;
	if ((currentlevel#223#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]])) == 1)) {
	call_arg#315 := 3;
	assume {:sourceloc "buggy_24.sol", 929, 49} {:message ""} true;
	call mul#108_ret#316 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3749#302, call_arg#315);
	call_arg#317 := 1000000;
	assume {:sourceloc "buggy_24.sol", 929, 49} {:message ""} true;
	call div#125_ret#318 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#316, call_arg#317);
	dynamicCA#3749#302 := div#125_ret#318;
	}
	else {
	if ((currentlevel#223#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]])) == 2)) {
	call_arg#319 := 6;
	assume {:sourceloc "buggy_24.sol", 931, 49} {:message ""} true;
	call mul#108_ret#320 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3749#302, call_arg#319);
	call_arg#321 := 1000000;
	assume {:sourceloc "buggy_24.sol", 931, 49} {:message ""} true;
	call div#125_ret#322 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#320, call_arg#321);
	dynamicCA#3749#302 := div#125_ret#322;
	}
	else {
	call_arg#323 := 100000;
	assume {:sourceloc "buggy_24.sol", 933, 49} {:message ""} true;
	call div#125_ret#324 := div#125(__this, __msg_sender, __msg_value, dynamicCA#3749#302, call_arg#323);
	dynamicCA#3749#302 := div#125_ret#324;
	}

	}

	assume {:sourceloc "buggy_24.sol", 935, 71} {:message ""} true;
	call add#28_ret#325 := add#28(__this, __msg_sender, __msg_value, calcDynamicCommissionAmount#233#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]])), dynamicCA#3749#302);
	if ((sponsor#3729#302[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][sponsor#3729#302[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), dynamicCommissionBalance#231#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]), add#28_ret#325, sponsorAddress#235#User#236#constr(userMapping#611[__this][sponsor#3729#302[1]]))]];
	}
	else {
	User236default_context := User236default_context[sponsor#3729#302[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[sponsor#3729#302[1]]), totalInvestAmount#203#User#236#constr(User236default_context[sponsor#3729#302[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[sponsor#3729#302[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[sponsor#3729#302[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[sponsor#3729#302[1]]), downlineCount#211#User#236#constr(User236default_context[sponsor#3729#302[1]]), nodeCount#213#User#236#constr(User236default_context[sponsor#3729#302[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[sponsor#3729#302[1]]), currentInvestTime#217#User#236#constr(User236default_context[sponsor#3729#302[1]]), currentInvestAmount#219#User#236#constr(User236default_context[sponsor#3729#302[1]]), currentInvestCycle#221#User#236#constr(User236default_context[sponsor#3729#302[1]]), currentlevel#223#User#236#constr(User236default_context[sponsor#3729#302[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[sponsor#3729#302[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[sponsor#3729#302[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[sponsor#3729#302[1]]), dynamicCommissionBalance#231#User#236#constr(User236default_context[sponsor#3729#302[1]]), add#28_ret#325, sponsorAddress#235#User#236#constr(User236default_context[sponsor#3729#302[1]]))];
	}

	}

	}

	addressWalker#3721#302 := sponsorAddress#235#User#236#constr((if (sponsor#3729#302[0] == 22) then userMapping#611[__this][sponsor#3729#302[1]] else User236default_context[sponsor#3729#302[1]]));
	call_arg#326 := 1;
	assume {:sourceloc "buggy_24.sol", 939, 33} {:message ""} true;
	call add#28_ret#327 := add#28(__this, __msg_sender, __msg_value, depth#3717#302, call_arg#326);
	depth#3717#302 := add#28_ret#327;
	$continue308:
	}

	break309:
	}

	}

	$continue303:
	// Loop expression
	i#3672#302 := (i#3672#302 + 1);
	tmp#328 := i#3672#302;
	}

	break304:
	$return80:
	// Function body ends here
	$return79:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_24.sol", 945, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#3868: [address_t]int;
// 
// Function: calcDynamicCommissionEnd
procedure {:sourceloc "buggy_24.sol", 947, 5} {:message "FomoFeast::calcDynamicCommissionEnd"} calcDynamicCommissionEnd#3930(__this: address_t, __msg_sender: address_t, __msg_value: int, index#3870: int, length#3872: int)
{
	var call_arg#330: int_arr_ptr;
	var new_array#331: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 948, 14} {:message "i"} i#3878#332: int;
	var {:sourceloc "buggy_24.sol", 949, 13} {:message "userAddress"} userAddress#3891#332: address_t;
	var user#3897#332: [int]int;
	var add#28_ret#335: int;
	var tmp#336: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#331 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#330 := new_array#331;
	mem_arr_int := mem_arr_int[call_arg#330 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#289[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#3878#332 := index#3870;
	while ((i#3878#332 < (index#3870 + length#3872))) {
	// Body
	userAddress#3891#332 := addressMapping#662[__this][i#3878#332];
	user#3897#332 := default_int_int()[0 := 22][1 := userAddress#3891#332];
	if ((calcDynamicCommissionAmount#233#User#236#constr((if (user#3897#332[0] == 22) then userMapping#611[__this][user#3897#332[1]] else User236default_context[user#3897#332[1]])) > 0)) {
	assume {:sourceloc "buggy_24.sol", 952, 49} {:message ""} true;
	call add#28_ret#335 := add#28(__this, __msg_sender, __msg_value, dynamicCommissionBalance#231#User#236#constr((if (user#3897#332[0] == 22) then userMapping#611[__this][user#3897#332[1]] else User236default_context[user#3897#332[1]])), calcDynamicCommissionAmount#233#User#236#constr((if (user#3897#332[0] == 22) then userMapping#611[__this][user#3897#332[1]] else User236default_context[user#3897#332[1]])));
	if ((user#3897#332[0] == 22)) {
	userMapping#611 := userMapping#611[__this := userMapping#611[__this][user#3897#332[1] := User#236#constr(totalInvestCount#201#User#236#constr(userMapping#611[__this][user#3897#332[1]]), totalInvestAmount#203#User#236#constr(userMapping#611[__this][user#3897#332[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(userMapping#611[__this][user#3897#332[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(userMapping#611[__this][user#3897#332[1]]), totalWithdrawAmount#209#User#236#constr(userMapping#611[__this][user#3897#332[1]]), downlineCount#211#User#236#constr(userMapping#611[__this][user#3897#332[1]]), nodeCount#213#User#236#constr(userMapping#611[__this][user#3897#332[1]]), totalDownlineInvestAmount#215#User#236#constr(userMapping#611[__this][user#3897#332[1]]), currentInvestTime#217#User#236#constr(userMapping#611[__this][user#3897#332[1]]), currentInvestAmount#219#User#236#constr(userMapping#611[__this][user#3897#332[1]]), currentInvestCycle#221#User#236#constr(userMapping#611[__this][user#3897#332[1]]), currentlevel#223#User#236#constr(userMapping#611[__this][user#3897#332[1]]), currentStaticCommissionRatio#225#User#236#constr(userMapping#611[__this][user#3897#332[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(userMapping#611[__this][user#3897#332[1]]), staticCommissionBalance#229#User#236#constr(userMapping#611[__this][user#3897#332[1]]), add#28_ret#335, calcDynamicCommissionAmount#233#User#236#constr(userMapping#611[__this][user#3897#332[1]]), sponsorAddress#235#User#236#constr(userMapping#611[__this][user#3897#332[1]]))]];
	}
	else {
	User236default_context := User236default_context[user#3897#332[1] := User#236#constr(totalInvestCount#201#User#236#constr(User236default_context[user#3897#332[1]]), totalInvestAmount#203#User#236#constr(User236default_context[user#3897#332[1]]), totalStaticCommissionWithdrawAmount#205#User#236#constr(User236default_context[user#3897#332[1]]), totalDynamicCommissionWithdrawAmount#207#User#236#constr(User236default_context[user#3897#332[1]]), totalWithdrawAmount#209#User#236#constr(User236default_context[user#3897#332[1]]), downlineCount#211#User#236#constr(User236default_context[user#3897#332[1]]), nodeCount#213#User#236#constr(User236default_context[user#3897#332[1]]), totalDownlineInvestAmount#215#User#236#constr(User236default_context[user#3897#332[1]]), currentInvestTime#217#User#236#constr(User236default_context[user#3897#332[1]]), currentInvestAmount#219#User#236#constr(User236default_context[user#3897#332[1]]), currentInvestCycle#221#User#236#constr(User236default_context[user#3897#332[1]]), currentlevel#223#User#236#constr(User236default_context[user#3897#332[1]]), currentStaticCommissionRatio#225#User#236#constr(User236default_context[user#3897#332[1]]), currentStaticCommissionWithdrawAmount#227#User#236#constr(User236default_context[user#3897#332[1]]), staticCommissionBalance#229#User#236#constr(User236default_context[user#3897#332[1]]), add#28_ret#335, calcDynamicCommissionAmount#233#User#236#constr(User236default_context[user#3897#332[1]]), sponsorAddress#235#User#236#constr(User236default_context[user#3897#332[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 953, 17} {:message ""} true;
	call addDynamicCommissionRecord#1715(__this, __msg_sender, __msg_value, userAddress#3891#332, __block_timestamp, calcDynamicCommissionAmount#233#User#236#constr((if (user#3897#332[0] == 22) then userMapping#611[__this][user#3897#332[1]] else User236default_context[user#3897#332[1]])));
	}

	$continue333:
	// Loop expression
	i#3878#332 := (i#3878#332 + 1);
	tmp#336 := i#3878#332;
	}

	break334:
	$return82:
	// Function body ends here
	$return81:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_24.sol", 957, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#3934: [address_t]int;
