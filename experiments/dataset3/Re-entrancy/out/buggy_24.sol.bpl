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

// 
// ------- Contract: FomoFeast -------
// Using library SafeMath for uint256
// 
// ------- Struct User -------
// Storage
type {:datatype} struct_storage_User#235;
function {:constructor} User#235#constr(totalInvestCount#200: int, totalInvestAmount#202: int, totalStaticCommissionWithdrawAmount#204: int, totalDynamicCommissionWithdrawAmount#206: int, totalWithdrawAmount#208: int, downlineCount#210: int, nodeCount#212: int, totalDownlineInvestAmount#214: int, currentInvestTime#216: int, currentInvestAmount#218: int, currentInvestCycle#220: int, currentlevel#222: int, currentStaticCommissionRatio#224: int, currentStaticCommissionWithdrawAmount#226: int, staticCommissionBalance#228: int, dynamicCommissionBalance#230: int, calcDynamicCommissionAmount#232: int, sponsorAddress#234: address_t) returns (struct_storage_User#235);
// Memory
type address_struct_memory_User#235 = int;
// Member totalInvestCount
var {:sourceloc "buggy_24.sol", 180, 9} {:message "totalInvestCount"} totalInvestCount#200: [address_struct_memory_User#235]int;
// Member totalInvestAmount
var {:sourceloc "buggy_24.sol", 181, 9} {:message "totalInvestAmount"} totalInvestAmount#202: [address_struct_memory_User#235]int;
// Member totalStaticCommissionWithdrawAmount
var {:sourceloc "buggy_24.sol", 182, 9} {:message "totalStaticCommissionWithdrawAmount"} totalStaticCommissionWithdrawAmount#204: [address_struct_memory_User#235]int;
// Member totalDynamicCommissionWithdrawAmount
var {:sourceloc "buggy_24.sol", 183, 9} {:message "totalDynamicCommissionWithdrawAmount"} totalDynamicCommissionWithdrawAmount#206: [address_struct_memory_User#235]int;
// Member totalWithdrawAmount
var {:sourceloc "buggy_24.sol", 184, 9} {:message "totalWithdrawAmount"} totalWithdrawAmount#208: [address_struct_memory_User#235]int;
// Member downlineCount
var {:sourceloc "buggy_24.sol", 185, 9} {:message "downlineCount"} downlineCount#210: [address_struct_memory_User#235]int;
// Member nodeCount
var {:sourceloc "buggy_24.sol", 186, 9} {:message "nodeCount"} nodeCount#212: [address_struct_memory_User#235]int;
// Member totalDownlineInvestAmount
var {:sourceloc "buggy_24.sol", 187, 9} {:message "totalDownlineInvestAmount"} totalDownlineInvestAmount#214: [address_struct_memory_User#235]int;
// Member currentInvestTime
var {:sourceloc "buggy_24.sol", 188, 9} {:message "currentInvestTime"} currentInvestTime#216: [address_struct_memory_User#235]int;
// Member currentInvestAmount
var {:sourceloc "buggy_24.sol", 189, 9} {:message "currentInvestAmount"} currentInvestAmount#218: [address_struct_memory_User#235]int;
// Member currentInvestCycle
var {:sourceloc "buggy_24.sol", 190, 9} {:message "currentInvestCycle"} currentInvestCycle#220: [address_struct_memory_User#235]int;
// Member currentlevel
var {:sourceloc "buggy_24.sol", 191, 9} {:message "currentlevel"} currentlevel#222: [address_struct_memory_User#235]int;
// Member currentStaticCommissionRatio
var {:sourceloc "buggy_24.sol", 192, 9} {:message "currentStaticCommissionRatio"} currentStaticCommissionRatio#224: [address_struct_memory_User#235]int;
// Member currentStaticCommissionWithdrawAmount
var {:sourceloc "buggy_24.sol", 193, 9} {:message "currentStaticCommissionWithdrawAmount"} currentStaticCommissionWithdrawAmount#226: [address_struct_memory_User#235]int;
// Member staticCommissionBalance
var {:sourceloc "buggy_24.sol", 194, 9} {:message "staticCommissionBalance"} staticCommissionBalance#228: [address_struct_memory_User#235]int;
// Member dynamicCommissionBalance
var {:sourceloc "buggy_24.sol", 195, 9} {:message "dynamicCommissionBalance"} dynamicCommissionBalance#230: [address_struct_memory_User#235]int;
// Member calcDynamicCommissionAmount
var {:sourceloc "buggy_24.sol", 196, 9} {:message "calcDynamicCommissionAmount"} calcDynamicCommissionAmount#232: [address_struct_memory_User#235]int;
// Member sponsorAddress
var {:sourceloc "buggy_24.sol", 197, 9} {:message "sponsorAddress"} sponsorAddress#234: [address_struct_memory_User#235]address_t;
// 
// ------- End of struct User -------
// 
// ------- Struct InvestRecord -------
// Storage
type {:datatype} struct_storage_InvestRecord#242;
function {:constructor} InvestRecord#242#constr(time#237: int, amount#239: int, cycle#241: int) returns (struct_storage_InvestRecord#242);
// Memory
type address_struct_memory_InvestRecord#242 = int;
// Member time
var {:sourceloc "buggy_24.sol", 201, 9} {:message "time"} time#237: [address_struct_memory_InvestRecord#242]int;
// Member amount
var {:sourceloc "buggy_24.sol", 202, 9} {:message "amount"} amount#239: [address_struct_memory_InvestRecord#242]int;
// Member cycle
var {:sourceloc "buggy_24.sol", 203, 9} {:message "cycle"} cycle#241: [address_struct_memory_InvestRecord#242]int;
// 
// ------- End of struct InvestRecord -------
// 
// ------- Struct CommissionRecord -------
// Storage
type {:datatype} struct_storage_CommissionRecord#247;
function {:constructor} CommissionRecord#247#constr(time#244: int, amount#246: int) returns (struct_storage_CommissionRecord#247);
// Memory
type address_struct_memory_CommissionRecord#247 = int;
// Member time
var {:sourceloc "buggy_24.sol", 207, 9} {:message "time"} time#244: [address_struct_memory_CommissionRecord#247]int;
// Member amount
var {:sourceloc "buggy_24.sol", 208, 9} {:message "amount"} amount#246: [address_struct_memory_CommissionRecord#247]int;
// 
// ------- End of struct CommissionRecord -------
// 
// State variable: initialized: bool
var {:sourceloc "buggy_24.sol", 217, 5} {:message "initialized"} initialized#262: [address_t]bool;
// 
// State variable: owner: address
var {:sourceloc "buggy_24.sol", 220, 5} {:message "owner"} owner#264: [address_t]address_t;
// 
// State variable: redeemableEther_re_ent18: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 222, 3} {:message "redeemableEther_re_ent18"} redeemableEther_re_ent18#268: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent18 : function ()
procedure {:sourceloc "buggy_24.sol", 223, 1} {:message "FomoFeast::claimReward_re_ent18"} claimReward_re_ent18#304(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 226, 9} {:message "transferValue_re_ent18"} transferValue_re_ent18#281: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent18#268[__this][__msg_sender] > 0);
	transferValue_re_ent18#281 := redeemableEther_re_ent18#268[__this][__msg_sender];
	assume {:sourceloc "buggy_24.sol", 227, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent18#281);
	redeemableEther_re_ent18#268 := redeemableEther_re_ent18#268[__this := redeemableEther_re_ent18#268[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: totalInvestCount: uint256
var {:sourceloc "buggy_24.sol", 230, 3} {:message "totalInvestCount"} totalInvestCount#306: [address_t]int;
// 
// State variable: balances_re_ent29: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 231, 3} {:message "balances_re_ent29"} balances_re_ent29#310: [address_t][address_t]int;
procedure {:inline 1} {:message "send"} __send(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
	returns (__result: bool)
{
	assume (__balance[__msg_sender] >= amount);
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	__result := true;
	}
	else {
	__result := false;
	}

}

// 
// Function: withdraw_balances_re_ent29 : function ()
procedure {:sourceloc "buggy_24.sol", 232, 5} {:message "FomoFeast::withdraw_balances_re_ent29"} withdraw_balances_re_ent29#333(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 233, 14} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, balances_re_ent29#310[__this][__msg_sender]);
	if (__send_ret#13) {
	balances_re_ent29#310 := balances_re_ent29#310[__this := balances_re_ent29#310[__this][__msg_sender := 0]];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: totalInvestAmount: uint256
var {:sourceloc "buggy_24.sol", 236, 3} {:message "totalInvestAmount"} totalInvestAmount#335: [address_t]int;
// 
// State variable: not_called_re_ent6: bool
var {:sourceloc "buggy_24.sol", 237, 3} {:message "not_called_re_ent6"} not_called_re_ent6#338: [address_t]bool;
// 
// Function: bug_re_ent6 : function ()
procedure {:sourceloc "buggy_24.sol", 238, 1} {:message "FomoFeast::bug_re_ent6"} bug_re_ent6#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent6#338[__this];
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_24.sol", 240, 16} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, call_arg#14);
	if (!(__send_ret#15)) {
	assume false;
	}

	not_called_re_ent6#338 := not_called_re_ent6#338[__this := false];
	$return10:
	// Function body ends here
}

// 
// State variable: totalStaticCommissionWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 245, 3} {:message "totalStaticCommissionWithdrawAmount"} totalStaticCommissionWithdrawAmount#367: [address_t]int;
// 
// State variable: lastPlayer_re_ent16: address payable
var {:sourceloc "buggy_24.sol", 246, 3} {:message "lastPlayer_re_ent16"} lastPlayer_re_ent16#369: [address_t]address_t;
// 
// State variable: jackpot_re_ent16: uint256
var {:sourceloc "buggy_24.sol", 247, 7} {:message "jackpot_re_ent16"} jackpot_re_ent16#371: [address_t]int;
// 
// Function: buyTicket_re_ent16 : function ()
procedure {:sourceloc "buggy_24.sol", 248, 4} {:message "FomoFeast::buyTicket_re_ent16"} buyTicket_re_ent16#401(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 249, 12} {:message ""} true;
	call __send_ret#16 := __send(lastPlayer_re_ent16#369[__this], __this, 0, jackpot_re_ent16#371[__this]);
	if (!(__send_ret#16)) {
	assume false;
	}

	lastPlayer_re_ent16#369 := lastPlayer_re_ent16#369[__this := __msg_sender];
	jackpot_re_ent16#371 := jackpot_re_ent16#371[__this := __balance[__this]];
	$return11:
	// Function body ends here
}

// 
// State variable: totalDynamicCommissionWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 254, 3} {:message "totalDynamicCommissionWithdrawAmount"} totalDynamicCommissionWithdrawAmount#403: [address_t]int;
// 
// State variable: balances_re_ent24: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 255, 3} {:message "balances_re_ent24"} balances_re_ent24#407: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent24 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 256, 1} {:message "FomoFeast::withdrawFunds_re_ent24"} withdrawFunds_re_ent24#440(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#409: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent24#407[__this][__msg_sender] >= _weiToWithdraw#409);
	assume {:sourceloc "buggy_24.sol", 259, 13} {:message ""} true;
	call __send_ret#17 := __send(__msg_sender, __this, 0, _weiToWithdraw#409);
	assume __send_ret#17;
	balances_re_ent24#407 := balances_re_ent24#407[__this := balances_re_ent24#407[__this][__msg_sender := (balances_re_ent24#407[__this][__msg_sender] - _weiToWithdraw#409)]];
	$return12:
	// Function body ends here
}

// 
// State variable: totalWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 262, 3} {:message "totalWithdrawAmount"} totalWithdrawAmount#442: [address_t]int;
// 
// State variable: userBalance_re_ent5: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 263, 3} {:message "userBalance_re_ent5"} userBalance_re_ent5#446: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent5 : function ()
procedure {:sourceloc "buggy_24.sol", 264, 1} {:message "FomoFeast::withdrawBalance_re_ent5"} withdrawBalance_re_ent5#475(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 267, 16} {:message ""} true;
	call __send_ret#18 := __send(__msg_sender, __this, 0, userBalance_re_ent5#446[__this][__msg_sender]);
	if (!(__send_ret#18)) {
	assume false;
	}

	userBalance_re_ent5#446 := userBalance_re_ent5#446[__this := userBalance_re_ent5#446[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// State variable: totalUserCount: uint256
var {:sourceloc "buggy_24.sol", 272, 3} {:message "totalUserCount"} totalUserCount#477: [address_t]int;
// 
// State variable: balances_re_ent15: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 273, 3} {:message "balances_re_ent15"} balances_re_ent15#481: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent15 : function ()
procedure {:sourceloc "buggy_24.sol", 274, 5} {:message "FomoFeast::withdraw_balances_re_ent15"} withdraw_balances_re_ent15#504(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 275, 14} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, balances_re_ent15#481[__this][__msg_sender]);
	if (__send_ret#19) {
	balances_re_ent15#481 := balances_re_ent15#481[__this := balances_re_ent15#481[__this][__msg_sender := 0]];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: engineerFunds: uint256
var {:sourceloc "buggy_24.sol", 278, 3} {:message "engineerFunds"} engineerFunds#506: [address_t]int;
// 
// State variable: counter_re_ent28: uint256
var {:sourceloc "buggy_24.sol", 279, 3} {:message "counter_re_ent28"} counter_re_ent28#509: [address_t]int;
// 
// Function: callme_re_ent28 : function ()
procedure {:sourceloc "buggy_24.sol", 280, 1} {:message "FomoFeast::callme_re_ent28"} callme_re_ent28#538(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent28#509[__this] <= 5);
	call_arg#20 := 10000000000000000000;
	assume {:sourceloc "buggy_24.sol", 282, 9} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	assume false;
	}

	counter_re_ent28#509 := counter_re_ent28#509[__this := (counter_re_ent28#509[__this] + 1)];
	$return15:
	// Function body ends here
}

// 
// State variable: engineerWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 287, 3} {:message "engineerWithdrawAmount"} engineerWithdrawAmount#540: [address_t]int;
// 
// State variable: not_called_re_ent34: bool
var {:sourceloc "buggy_24.sol", 288, 3} {:message "not_called_re_ent34"} not_called_re_ent34#543: [address_t]bool;
// 
// Function: bug_re_ent34 : function ()
procedure {:sourceloc "buggy_24.sol", 289, 1} {:message "FomoFeast::bug_re_ent34"} bug_re_ent34#570(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent34#543[__this];
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_24.sol", 291, 16} {:message ""} true;
	call __send_ret#23 := __send(__msg_sender, __this, 0, call_arg#22);
	if (!(__send_ret#23)) {
	assume false;
	}

	not_called_re_ent34#543 := not_called_re_ent34#543[__this := false];
	$return16:
	// Function body ends here
}

// 
// State variable: operatorFunds: uint256
var {:sourceloc "buggy_24.sol", 296, 3} {:message "operatorFunds"} operatorFunds#572: [address_t]int;
// 
// State variable: counter_re_ent21: uint256
var {:sourceloc "buggy_24.sol", 297, 3} {:message "counter_re_ent21"} counter_re_ent21#575: [address_t]int;
// 
// Function: callme_re_ent21 : function ()
procedure {:sourceloc "buggy_24.sol", 298, 1} {:message "FomoFeast::callme_re_ent21"} callme_re_ent21#604(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent21#575[__this] <= 5);
	call_arg#24 := 10000000000000000000;
	assume {:sourceloc "buggy_24.sol", 300, 9} {:message ""} true;
	call __send_ret#25 := __send(__msg_sender, __this, 0, call_arg#24);
	if (!(__send_ret#25)) {
	assume false;
	}

	counter_re_ent21#575 := counter_re_ent21#575[__this := (counter_re_ent21#575[__this] + 1)];
	$return17:
	// Function body ends here
}

// 
// State variable: operatorWithdrawAmount: uint256
var {:sourceloc "buggy_24.sol", 305, 3} {:message "operatorWithdrawAmount"} operatorWithdrawAmount#606: [address_t]int;
// 
// State variable: balances_re_ent10: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 307, 3} {:message "balances_re_ent10"} balances_re_ent10#610: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent10 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 308, 1} {:message "FomoFeast::withdrawFunds_re_ent10"} withdrawFunds_re_ent10#643(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#612: int)
{
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent10#610[__this][__msg_sender] >= _weiToWithdraw#612);
	assume {:sourceloc "buggy_24.sol", 311, 13} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, _weiToWithdraw#612);
	assume __send_ret#26;
	balances_re_ent10#610 := balances_re_ent10#610[__this := balances_re_ent10#610[__this][__msg_sender := (balances_re_ent10#610[__this][__msg_sender] - _weiToWithdraw#612)]];
	$return18:
	// Function body ends here
}

// 
// State variable: userMapping: mapping(address => struct FomoFeast.User storage ref)
var {:sourceloc "buggy_24.sol", 314, 3} {:message "userMapping"} userMapping#647: [address_t][address_t]struct_storage_User#235;
// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 315, 3} {:message "balances_re_ent21"} balances_re_ent21#651: [address_t][address_t]int;
procedure {:inline 1} {:message "call"} __call(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (__result: bool, __calldata: int_arr_ptr)
{
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	__result := true;
	}
	else {
	__result := false;
	}

}

// 
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_24.sol", 316, 5} {:message "FomoFeast::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#680(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 317, 11} {:message "success"} success#655: bool;
	var __call_ret#27: bool;
	var __call_ret#28: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#651[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#651[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 317, 27} {:message ""} true;
	call __call_ret#27, __call_ret#28 := __call(__msg_sender, __this, balances_re_ent21#651[__this][__msg_sender]);
	if (__call_ret#27) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#27)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#651[__this][__msg_sender])];
	}

	success#655 := __call_ret#27;
	if (success#655) {
	balances_re_ent21#651 := balances_re_ent21#651[__this := balances_re_ent21#651[__this][__msg_sender := 0]];
	}

	$return19:
	// Function body ends here
}

// 
// State variable: addressMapping: mapping(uint256 => address)
var {:sourceloc "buggy_24.sol", 321, 3} {:message "addressMapping"} addressMapping#684: [address_t][int]address_t;
// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 322, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#688: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_24.sol", 323, 1} {:message "FomoFeast::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#717(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 326, 16} {:message ""} true;
	call __send_ret#29 := __send(__msg_sender, __this, 0, userBalance_re_ent12#688[__this][__msg_sender]);
	if (!(__send_ret#29)) {
	assume false;
	}

	userBalance_re_ent12#688 := userBalance_re_ent12#688[__this := userBalance_re_ent12#688[__this][__msg_sender := 0]];
	$return20:
	// Function body ends here
}

// 
// State variable: investRecordMapping: mapping(address => struct FomoFeast.InvestRecord storage ref[9] storage ref)
type {:datatype} struct_storage_InvestRecord#242_arr_type;
function {:constructor} struct_storage_InvestRecord#242_arr#constr(arr: [int]struct_storage_InvestRecord#242, length: int) returns (struct_storage_InvestRecord#242_arr_type);
var {:sourceloc "buggy_24.sol", 331, 3} {:message "investRecordMapping"} investRecordMapping#723: [address_t][address_t]struct_storage_InvestRecord#242_arr_type;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 332, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#727: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_24.sol", 333, 1} {:message "FomoFeast::claimReward_re_ent11"} claimReward_re_ent11#763(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 336, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#740: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#727[__this][__msg_sender] > 0);
	transferValue_re_ent11#740 := redeemableEther_re_ent11#727[__this][__msg_sender];
	assume {:sourceloc "buggy_24.sol", 337, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#740);
	redeemableEther_re_ent11#727 := redeemableEther_re_ent11#727[__this := redeemableEther_re_ent11#727[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// State variable: staticCommissionRecordMapping: mapping(address => struct FomoFeast.CommissionRecord storage ref[9] storage ref)
type {:datatype} struct_storage_CommissionRecord#247_arr_type;
function {:constructor} struct_storage_CommissionRecord#247_arr#constr(arr: [int]struct_storage_CommissionRecord#247, length: int) returns (struct_storage_CommissionRecord#247_arr_type);
var {:sourceloc "buggy_24.sol", 340, 3} {:message "staticCommissionRecordMapping"} staticCommissionRecordMapping#769: [address_t][address_t]struct_storage_CommissionRecord#247_arr_type;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 341, 3} {:message "balances_re_ent1"} balances_re_ent1#773: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_24.sol", 342, 5} {:message "FomoFeast::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#802(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 343, 11} {:message "success"} success#777: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#773[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#773[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 343, 27} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(__msg_sender, __this, balances_re_ent1#773[__this][__msg_sender]);
	if (__call_ret#30) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#773[__this][__msg_sender])];
	}

	success#777 := __call_ret#30;
	if (success#777) {
	balances_re_ent1#773 := balances_re_ent1#773[__this := balances_re_ent1#773[__this][__msg_sender := 0]];
	}

	$return22:
	// Function body ends here
}

// 
// State variable: dynamicCommissionRecordMapping: mapping(address => struct FomoFeast.CommissionRecord storage ref[9] storage ref)
var {:sourceloc "buggy_24.sol", 347, 3} {:message "dynamicCommissionRecordMapping"} dynamicCommissionRecordMapping#808: [address_t][address_t]struct_storage_CommissionRecord#247_arr_type;
const unique address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9: address_t;
// 
// Function: initialize : function ()
procedure {:sourceloc "buggy_24.sol", 360, 5} {:message "FomoFeast::initialize"} initialize#856(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int_arr_ptr;
	var new_array#33: int_arr_ptr;
	var call_arg#34: int;
	var call_arg#35: int;
	var call_arg#36: int;
	var call_arg#37: int;
	var call_arg#38: int;
	var call_arg#39: int;
	var call_arg#40: int;
	var call_arg#41: int;
	var call_arg#42: int;
	var call_arg#43: int;
	var call_arg#44: int;
	var call_arg#45: int;
	var call_arg#46: int;
	var call_arg#47: int;
	var call_arg#48: int;
	var call_arg#49: int;
	var call_arg#50: int;
	var call_arg#51: address_t;
	var new_struct_User#52: address_struct_memory_User#235;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#33 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#32 := new_array#33;
	mem_arr_int := mem_arr_int[call_arg#32 := int_arr#constr(default_int_int()[0 := 97][1 := 108][2 := 114][3 := 101][4 := 97][5 := 100][6 := 121][7 := 32][8 := 105][9 := 110][10 := 105][11 := 116][12 := 105][13 := 97][14 := 108][15 := 105][16 := 122][17 := 101][18 := 100], 19)];
	assume !(initialized#262[__this]);
	owner#264 := owner#264[__this := __msg_sender];
	call_arg#34 := 1;
	call_arg#35 := 0;
	call_arg#36 := 0;
	call_arg#37 := 0;
	call_arg#38 := 0;
	call_arg#39 := 0;
	call_arg#40 := 0;
	call_arg#41 := 0;
	call_arg#42 := 0;
	call_arg#43 := 0;
	call_arg#44 := 0;
	call_arg#45 := 0;
	call_arg#46 := 0;
	call_arg#47 := 0;
	call_arg#48 := 0;
	call_arg#49 := 0;
	call_arg#50 := 0;
	call_arg#51 := 0;
	new_struct_User#52 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	totalInvestCount#200 := totalInvestCount#200[new_struct_User#52 := call_arg#34];
	totalInvestAmount#202 := totalInvestAmount#202[new_struct_User#52 := call_arg#35];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[new_struct_User#52 := call_arg#36];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[new_struct_User#52 := call_arg#37];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[new_struct_User#52 := call_arg#38];
	downlineCount#210 := downlineCount#210[new_struct_User#52 := call_arg#39];
	nodeCount#212 := nodeCount#212[new_struct_User#52 := call_arg#40];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[new_struct_User#52 := call_arg#41];
	currentInvestTime#216 := currentInvestTime#216[new_struct_User#52 := call_arg#42];
	currentInvestAmount#218 := currentInvestAmount#218[new_struct_User#52 := call_arg#43];
	currentInvestCycle#220 := currentInvestCycle#220[new_struct_User#52 := call_arg#44];
	currentlevel#222 := currentlevel#222[new_struct_User#52 := call_arg#45];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[new_struct_User#52 := call_arg#46];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[new_struct_User#52 := call_arg#47];
	staticCommissionBalance#228 := staticCommissionBalance#228[new_struct_User#52 := call_arg#48];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[new_struct_User#52 := call_arg#49];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[new_struct_User#52 := call_arg#50];
	sponsorAddress#234 := sponsorAddress#234[new_struct_User#52 := call_arg#51];
	// Deep copy struct User
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200[new_struct_User#52], totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202[new_struct_User#52], totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204[new_struct_User#52], totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206[new_struct_User#52], totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208[new_struct_User#52], downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210[new_struct_User#52], nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212[new_struct_User#52], totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214[new_struct_User#52], currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216[new_struct_User#52], currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218[new_struct_User#52], currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220[new_struct_User#52], currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222[new_struct_User#52], currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224[new_struct_User#52], currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226[new_struct_User#52], staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228[new_struct_User#52], dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230[new_struct_User#52], calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232[new_struct_User#52], sponsorAddress#234#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9 := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), downlineCount#210#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), nodeCount#212#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestTime#216#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentlevel#222#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9]), sponsorAddress#234[new_struct_User#52])]];
	initialized#262 := initialized#262[__this := true];
	$return23:
	// Function body ends here
}

// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_24.sol", 366, 1} {:message "not_called_re_ent41"} not_called_re_ent41#859: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_24.sol", 367, 1} {:message "FomoFeast::bug_re_ent41"} bug_re_ent41#886(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#53: int;
	var __send_ret#54: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#859[__this];
	call_arg#53 := 1000000000000000000;
	assume {:sourceloc "buggy_24.sol", 369, 16} {:message ""} true;
	call __send_ret#54 := __send(__msg_sender, __this, 0, call_arg#53);
	if (!(__send_ret#54)) {
	assume false;
	}

	not_called_re_ent41#859 := not_called_re_ent41#859[__this := false];
	$return24:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int |T@struct_storage_User#235|)) (|User#235#constr| 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0))"} default_address_t_struct_storage_User#235() returns ([address_t]struct_storage_User#235);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
function {:builtin "((as const (Array Int |T@struct_storage_InvestRecord#242|)) (|InvestRecord#242#constr| 0 0 0))"} default_int_struct_storage_InvestRecord#242() returns ([int]struct_storage_InvestRecord#242);
function {:builtin "((as const (Array Int |T@struct_storage_InvestRecord#242_arr_type|)) (|struct_storage_InvestRecord#242_arr#constr| ((as const (Array Int |T@struct_storage_InvestRecord#242|)) (|InvestRecord#242#constr| 0 0 0)) 9))"} default_address_t_struct_storage_InvestRecord#242_arr_type() returns ([address_t]struct_storage_InvestRecord#242_arr_type);
function {:builtin "((as const (Array Int |T@struct_storage_CommissionRecord#247|)) (|CommissionRecord#247#constr| 0 0))"} default_int_struct_storage_CommissionRecord#247() returns ([int]struct_storage_CommissionRecord#247);
function {:builtin "((as const (Array Int |T@struct_storage_CommissionRecord#247_arr_type|)) (|struct_storage_CommissionRecord#247_arr#constr| ((as const (Array Int |T@struct_storage_CommissionRecord#247|)) (|CommissionRecord#247#constr| 0 0)) 9))"} default_address_t_struct_storage_CommissionRecord#247_arr_type() returns ([address_t]struct_storage_CommissionRecord#247_arr_type);
// 
// Function: 
procedure {:sourceloc "buggy_24.sol", 381, 5} {:message "FomoFeast::[constructor]"} __constructor#4267(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	initialized#262 := initialized#262[__this := false];
	owner#264 := owner#264[__this := 0];
	redeemableEther_re_ent18#268 := redeemableEther_re_ent18#268[__this := default_address_t_int()];
	totalInvestCount#306 := totalInvestCount#306[__this := 0];
	balances_re_ent29#310 := balances_re_ent29#310[__this := default_address_t_int()];
	totalInvestAmount#335 := totalInvestAmount#335[__this := 0];
	not_called_re_ent6#338 := not_called_re_ent6#338[__this := true];
	totalStaticCommissionWithdrawAmount#367 := totalStaticCommissionWithdrawAmount#367[__this := 0];
	lastPlayer_re_ent16#369 := lastPlayer_re_ent16#369[__this := 0];
	jackpot_re_ent16#371 := jackpot_re_ent16#371[__this := 0];
	totalDynamicCommissionWithdrawAmount#403 := totalDynamicCommissionWithdrawAmount#403[__this := 0];
	balances_re_ent24#407 := balances_re_ent24#407[__this := default_address_t_int()];
	totalWithdrawAmount#442 := totalWithdrawAmount#442[__this := 0];
	userBalance_re_ent5#446 := userBalance_re_ent5#446[__this := default_address_t_int()];
	totalUserCount#477 := totalUserCount#477[__this := 0];
	balances_re_ent15#481 := balances_re_ent15#481[__this := default_address_t_int()];
	engineerFunds#506 := engineerFunds#506[__this := 0];
	counter_re_ent28#509 := counter_re_ent28#509[__this := 0];
	engineerWithdrawAmount#540 := engineerWithdrawAmount#540[__this := 0];
	not_called_re_ent34#543 := not_called_re_ent34#543[__this := true];
	operatorFunds#572 := operatorFunds#572[__this := 0];
	counter_re_ent21#575 := counter_re_ent21#575[__this := 0];
	operatorWithdrawAmount#606 := operatorWithdrawAmount#606[__this := 0];
	balances_re_ent10#610 := balances_re_ent10#610[__this := default_address_t_int()];
	userMapping#647 := userMapping#647[__this := default_address_t_struct_storage_User#235()];
	balances_re_ent21#651 := balances_re_ent21#651[__this := default_address_t_int()];
	addressMapping#684 := addressMapping#684[__this := default_int_address_t()];
	userBalance_re_ent12#688 := userBalance_re_ent12#688[__this := default_address_t_int()];
	investRecordMapping#723 := investRecordMapping#723[__this := default_address_t_struct_storage_InvestRecord#242_arr_type()];
	redeemableEther_re_ent11#727 := redeemableEther_re_ent11#727[__this := default_address_t_int()];
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := default_address_t_struct_storage_CommissionRecord#247_arr_type()];
	balances_re_ent1#773 := balances_re_ent1#773[__this := default_address_t_int()];
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := default_address_t_struct_storage_CommissionRecord#247_arr_type()];
	not_called_re_ent41#859 := not_called_re_ent41#859[__this := true];
	counter_re_ent42#897 := counter_re_ent42#897[__this := 0];
	lastPlayer_re_ent2#976 := lastPlayer_re_ent2#976[__this := 0];
	jackpot_re_ent2#978 := jackpot_re_ent2#978[__this := 0];
	balances_re_ent17#1049 := balances_re_ent17#1049[__this := default_address_t_int()];
	lastPlayer_re_ent37#1114 := lastPlayer_re_ent37#1114[__this := 0];
	jackpot_re_ent37#1116 := jackpot_re_ent37#1116[__this := 0];
	balances_re_ent3#1218 := balances_re_ent3#1218[__this := default_address_t_int()];
	lastPlayer_re_ent9#1349 := lastPlayer_re_ent9#1349[__this := 0];
	jackpot_re_ent9#1351 := jackpot_re_ent9#1351[__this := 0];
	redeemableEther_re_ent25#1508 := redeemableEther_re_ent25#1508[__this := default_address_t_int()];
	userBalance_re_ent19#1617 := userBalance_re_ent19#1617[__this := default_address_t_int()];
	userBalance_re_ent26#1707 := userBalance_re_ent26#1707[__this := default_address_t_int()];
	not_called_re_ent20#1798 := not_called_re_ent20#1798[__this := true];
	redeemableEther_re_ent32#1883 := redeemableEther_re_ent32#1883[__this := default_address_t_int()];
	balances_re_ent38#2312 := balances_re_ent38#2312[__this := default_address_t_int()];
	redeemableEther_re_ent4#2461 := redeemableEther_re_ent4#2461[__this := default_address_t_int()];
	counter_re_ent7#2640 := counter_re_ent7#2640[__this := 0];
	lastPlayer_re_ent23#2706 := lastPlayer_re_ent23#2706[__this := 0];
	jackpot_re_ent23#2708 := jackpot_re_ent23#2708[__this := 0];
	counter_re_ent14#2776 := counter_re_ent14#2776[__this := 0];
	lastPlayer_re_ent30#2833 := lastPlayer_re_ent30#2833[__this := 0];
	jackpot_re_ent30#2835 := jackpot_re_ent30#2835[__this := 0];
	balances_re_ent8#2929 := balances_re_ent8#2929[__this := default_address_t_int()];
	redeemableEther_re_ent39#2982 := redeemableEther_re_ent39#2982[__this := default_address_t_int()];
	balances_re_ent36#3192 := balances_re_ent36#3192[__this := default_address_t_int()];
	counter_re_ent35#3352 := counter_re_ent35#3352[__this := 0];
	userBalance_re_ent40#3519 := userBalance_re_ent40#3519[__this := default_address_t_int()];
	userBalance_re_ent33#3827 := userBalance_re_ent33#3827[__this := default_address_t_int()];
	not_called_re_ent27#3903 := not_called_re_ent27#3903[__this := true];
	balances_re_ent31#4136 := balances_re_ent31#4136[__this := default_address_t_int()];
	not_called_re_ent13#4234 := not_called_re_ent13#4234[__this := true];
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 382, 9} {:message ""} true;
	call initialize#856(__this, __msg_sender, __msg_value);
	$return25:
	// Function body ends here
}

// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_24.sol", 384, 1} {:message "counter_re_ent42"} counter_re_ent42#897: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_24.sol", 385, 1} {:message "FomoFeast::callme_re_ent42"} callme_re_ent42#926(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#55: int;
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#897[__this] <= 5);
	call_arg#55 := 10000000000000000000;
	assume {:sourceloc "buggy_24.sol", 387, 9} {:message ""} true;
	call __send_ret#56 := __send(__msg_sender, __this, 0, call_arg#55);
	if (!(__send_ret#56)) {
	assume false;
	}

	counter_re_ent42#897 := counter_re_ent42#897[__this := (counter_re_ent42#897[__this] + 1)];
	$return26:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_24.sol", 412, 5} {:message "FomoFeast::transferOwnership"} transferOwnership#974(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#954: address_t)
{
	var call_arg#58: int_arr_ptr;
	var new_array#59: int_arr_ptr;
	var call_arg#61: int_arr_ptr;
	var new_array#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#59 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#58 := new_array#59;
	mem_arr_int := mem_arr_int[call_arg#58 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#264[__this]);
	// Function body starts here
	new_array#62 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#61 := new_array#62;
	mem_arr_int := mem_arr_int[call_arg#61 := int_arr#constr(default_int_int()[0 := 99][1 := 97][2 := 110][3 := 110][4 := 111][5 := 116][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 111][17 := 119][18 := 110][19 := 101][20 := 114][21 := 115][22 := 104][23 := 105][24 := 112][25 := 32][26 := 116][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115][36 := 32][37 := 122][38 := 101][39 := 114][40 := 111], 41)];
	assume (newOwner#954 != 0);
	owner#264 := owner#264[__this := newOwner#954];
	$return28:
	// Function body ends here
	$return27:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_24.sol", 416, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#976: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_24.sol", 417, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#978: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_24.sol", 418, 4} {:message "FomoFeast::buyTicket_re_ent2"} buyTicket_re_ent2#1008(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#63: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 419, 12} {:message ""} true;
	call __send_ret#63 := __send(lastPlayer_re_ent2#976[__this], __this, 0, jackpot_re_ent2#978[__this]);
	if (!(__send_ret#63)) {
	assume false;
	}

	lastPlayer_re_ent2#976 := lastPlayer_re_ent2#976[__this := __msg_sender];
	jackpot_re_ent2#978 := jackpot_re_ent2#978[__this := __balance[__this]];
	$return29:
	// Function body ends here
}

// 
// Function: getLevelByInvestAmount : function (uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 425, 5} {:message "FomoFeast::getLevelByInvestAmount"} getLevelByInvestAmount#1045(__this: address_t, __msg_sender: address_t, __msg_value: int, investAmount#1010: int)
	returns (level#1013: int)
{
	var call_arg#64: int;
	var mul#108_ret#65: int;
	var call_arg#66: int;
	var mul#108_ret#67: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#64 := 11;
	assume {:sourceloc "buggy_24.sol", 426, 29} {:message ""} true;
	call mul#108_ret#65 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#64);
	if ((investAmount#1010 >= mul#108_ret#65)) {
	level#1013 := 3;
	}
	else {
	call_arg#66 := 6;
	assume {:sourceloc "buggy_24.sol", 428, 36} {:message ""} true;
	call mul#108_ret#67 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#66);
	if ((investAmount#1010 >= mul#108_ret#67)) {
	level#1013 := 2;
	}
	else {
	level#1013 := 1;
	}

	}

	$return30:
	// Function body ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 434, 1} {:message "balances_re_ent17"} balances_re_ent17#1049: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 435, 1} {:message "FomoFeast::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#1088(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1051: int)
{
	var {:sourceloc "buggy_24.sol", 438, 3} {:message "success"} success#1064: bool;
	var __call_ret#68: bool;
	var __call_ret#69: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#1049[__this][__msg_sender] >= _weiToWithdraw#1051);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1051);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1051)];
	assume {:sourceloc "buggy_24.sol", 438, 18} {:message ""} true;
	call __call_ret#68, __call_ret#69 := __call(__msg_sender, __this, _weiToWithdraw#1051);
	if (__call_ret#68) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#68)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1051)];
	}

	success#1064 := __call_ret#68;
	assume success#1064;
	balances_re_ent17#1049 := balances_re_ent17#1049[__this := balances_re_ent17#1049[__this][__msg_sender := (balances_re_ent17#1049[__this][__msg_sender] - _weiToWithdraw#1051)]];
	$return31:
	// Function body ends here
}

// 
// Function: isInvestExpired : function (struct FomoFeast.User memory) view returns (bool)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 443, 5} {:message "FomoFeast::isInvestExpired"} isInvestExpired#1112(__this: address_t, __msg_sender: address_t, __msg_value: int, user#1090: address_struct_memory_User#235)
	returns (expired#1093: bool)
{
	var mul#108_ret#70: int;
	var add#28_ret#71: int;
	// TCC assumptions
	assume (user#1090 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 444, 47} {:message ""} true;
	call mul#108_ret#70 := mul#108(__this, __msg_sender, __msg_value, currentInvestCycle#220[user#1090], 86400);
	assume {:sourceloc "buggy_24.sol", 444, 20} {:message ""} true;
	call add#28_ret#71 := add#28(__this, __msg_sender, __msg_value, currentInvestTime#216[user#1090], mul#108_ret#70);
	expired#1093 := (add#28_ret#71 < __block_timestamp);
	$return32:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_24.sol", 446, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#1114: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_24.sol", 447, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#1116: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_24.sol", 448, 4} {:message "FomoFeast::buyTicket_re_ent37"} buyTicket_re_ent37#1146(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#72: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 449, 12} {:message ""} true;
	call __send_ret#72 := __send(lastPlayer_re_ent37#1114[__this], __this, 0, jackpot_re_ent37#1116[__this]);
	if (!(__send_ret#72)) {
	assume false;
	}

	lastPlayer_re_ent37#1114 := lastPlayer_re_ent37#1114[__this := __msg_sender];
	jackpot_re_ent37#1116 := jackpot_re_ent37#1116[__this := __balance[__this]];
	$return33:
	// Function body ends here
}

// 
// Function: getAbortInvestAmount : function (struct FomoFeast.User memory) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 455, 5} {:message "FomoFeast::getAbortInvestAmount"} getAbortInvestAmount#1214(__this: address_t, __msg_sender: address_t, __msg_value: int, user#1148: address_struct_memory_User#235)
	returns (amount#1151: int)
{
	var {:sourceloc "buggy_24.sol", 456, 9} {:message "commissionDays"} commissionDays#1154: int;
	var sub#45_ret#73: int;
	var div#125_ret#74: int;
	var call_arg#75: int_arr_ptr;
	var new_array#76: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 458, 9} {:message "lossRatio"} lossRatio#1173: int;
	var mul#108_ret#77: int;
	var call_arg#78: int;
	var div#125_ret#79: int;
	var sub#45_ret#80: int;
	// TCC assumptions
	assume (user#1148 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 456, 34} {:message ""} true;
	call sub#45_ret#73 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#216[user#1148]);
	assume {:sourceloc "buggy_24.sol", 456, 34} {:message ""} true;
	call div#125_ret#74 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#73, 86400);
	commissionDays#1154 := div#125_ret#74;
	new_array#76 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#75 := new_array#76;
	mem_arr_int := mem_arr_int[call_arg#75 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 101][4 := 115][5 := 116][6 := 32][7 := 116][8 := 105][9 := 109][10 := 101][11 := 32][12 := 109][13 := 117][14 := 115][15 := 116][16 := 32][17 := 62][18 := 61][19 := 32][20 := 51][21 := 100][22 := 97][23 := 121][24 := 115], 25)];
	assume (commissionDays#1154 >= 3);
	lossRatio#1173 := 15;
	if ((commissionDays#1154 >= 60)) {
	lossRatio#1173 := 5;
	}
	else {
	if ((commissionDays#1154 >= 30)) {
	lossRatio#1173 := 10;
	}

	}

	amount#1151 := currentInvestAmount#218[user#1148];
	assume {:sourceloc "buggy_24.sol", 465, 29} {:message ""} true;
	call mul#108_ret#77 := mul#108(__this, __msg_sender, __msg_value, currentInvestAmount#218[user#1148], lossRatio#1173);
	call_arg#78 := 100;
	assume {:sourceloc "buggy_24.sol", 465, 29} {:message ""} true;
	call div#125_ret#79 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#77, call_arg#78);
	assume {:sourceloc "buggy_24.sol", 465, 18} {:message ""} true;
	call sub#45_ret#80 := sub#45(__this, __msg_sender, __msg_value, amount#1151, div#125_ret#79);
	amount#1151 := sub#45_ret#80;
	$return34:
	// Function body ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 467, 1} {:message "balances_re_ent3"} balances_re_ent3#1218: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 468, 1} {:message "FomoFeast::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#1257(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1220: int)
{
	var {:sourceloc "buggy_24.sol", 471, 3} {:message "success"} success#1233: bool;
	var __call_ret#81: bool;
	var __call_ret#82: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#1218[__this][__msg_sender] >= _weiToWithdraw#1220);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1220);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1220)];
	assume {:sourceloc "buggy_24.sol", 471, 19} {:message ""} true;
	call __call_ret#81, __call_ret#82 := __call(__msg_sender, __this, _weiToWithdraw#1220);
	if (__call_ret#81) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#81)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1220)];
	}

	success#1233 := __call_ret#81;
	assume success#1233;
	balances_re_ent3#1218 := balances_re_ent3#1218[__this := balances_re_ent3#1218[__this][__msg_sender := (balances_re_ent3#1218[__this][__msg_sender] - _weiToWithdraw#1220)]];
	$return35:
	// Function body ends here
}

// 
// Function: getStaticCommissionRatio : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 476, 5} {:message "FomoFeast::getStaticCommissionRatio"} getStaticCommissionRatio#1347(__this: address_t, __msg_sender: address_t, __msg_value: int, level#1259: int, investCycle#1261: int)
	returns (ratio#1264: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((level#1259 == 1)) {
	if ((investCycle#1261 == 30)) {
	ratio#1264 := 7;
	}
	else {
	if ((investCycle#1261 == 60)) {
	ratio#1264 := 8;
	}
	else {
	ratio#1264 := 9;
	}

	}

	}
	else {
	if ((level#1259 == 2)) {
	if ((investCycle#1261 == 30)) {
	ratio#1264 := 8;
	}
	else {
	if ((investCycle#1261 == 60)) {
	ratio#1264 := 9;
	}
	else {
	ratio#1264 := 10;
	}

	}

	}
	else {
	if ((investCycle#1261 == 30)) {
	ratio#1264 := 11;
	}
	else {
	if ((investCycle#1261 == 60)) {
	ratio#1264 := 12;
	}
	else {
	ratio#1264 := 13;
	}

	}

	}

	}

	$return36:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_24.sol", 503, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#1349: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_24.sol", 504, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#1351: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_24.sol", 505, 4} {:message "FomoFeast::buyTicket_re_ent9"} buyTicket_re_ent9#1386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 506, 10} {:message "success"} success#1355: bool;
	var __call_ret#83: bool;
	var __call_ret#84: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#1351[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#1351[__this])];
	assume {:sourceloc "buggy_24.sol", 506, 27} {:message ""} true;
	call __call_ret#83, __call_ret#84 := __call(lastPlayer_re_ent9#1349[__this], __this, jackpot_re_ent9#1351[__this]);
	if (__call_ret#83) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#83)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#1351[__this])];
	}

	success#1355 := __call_ret#83;
	if (!(success#1355)) {
	assume false;
	}

	lastPlayer_re_ent9#1349 := lastPlayer_re_ent9#1349[__this := __msg_sender];
	jackpot_re_ent9#1351 := jackpot_re_ent9#1351[__this := __balance[__this]];
	$return37:
	// Function body ends here
}

// 
// Function: getDynamicCommissionRatio : function (struct FomoFeast.User memory,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 513, 5} {:message "FomoFeast::getDynamicCommissionRatio"} getDynamicCommissionRatio#1504(__this: address_t, __msg_sender: address_t, __msg_value: int, user#1388: address_struct_memory_User#235, depth#1390: int)
	returns (ratio#1393: int)
{
	// TCC assumptions
	assume (user#1388 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	if ((currentlevel#222[user#1388] == 1)) {
	if ((depth#1390 == 1)) {
	ratio#1393 := 50;
	}
	else {
	ratio#1393 := 0;
	}

	}
	else {
	if ((currentlevel#222[user#1388] == 2)) {
	if ((depth#1390 == 1)) {
	ratio#1393 := 70;
	}
	else {
	if ((depth#1390 == 2)) {
	ratio#1393 := 50;
	}
	else {
	ratio#1393 := 0;
	}

	}

	}
	else {
	if ((depth#1390 == 1)) {
	ratio#1393 := 100;
	}
	else {
	if ((depth#1390 == 2)) {
	ratio#1393 := 70;
	}
	else {
	if ((depth#1390 == 3)) {
	ratio#1393 := 50;
	}
	else {
	if (((depth#1390 >= 4) && (depth#1390 <= 10))) {
	ratio#1393 := 10;
	}
	else {
	if (((depth#1390 >= 11) && (depth#1390 <= 20))) {
	ratio#1393 := 5;
	}
	else {
	ratio#1393 := 1;
	}

	}

	}

	}

	}

	}

	}

	$return38:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 544, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#1508: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_24.sol", 545, 1} {:message "FomoFeast::claimReward_re_ent25"} claimReward_re_ent25#1544(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 548, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#1521: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#1508[__this][__msg_sender] > 0);
	transferValue_re_ent25#1521 := redeemableEther_re_ent25#1508[__this][__msg_sender];
	assume {:sourceloc "buggy_24.sol", 549, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#1521);
	redeemableEther_re_ent25#1508 := redeemableEther_re_ent25#1508[__this := redeemableEther_re_ent25#1508[__this][__msg_sender := 0]];
	$return39:
	// Function body ends here
}

// 
// Function: getAvaliableStaticCommissionAmount : function (struct FomoFeast.User memory) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 553, 5} {:message "FomoFeast::getAvaliableStaticCommissionAmount"} getAvaliableStaticCommissionAmount#1613(__this: address_t, __msg_sender: address_t, __msg_value: int, user#1546: address_struct_memory_User#235)
	returns (amount#1549: int)
{
	var {:sourceloc "buggy_24.sol", 557, 13} {:message "commissionDays"} commissionDays#1561: int;
	var sub#45_ret#85: int;
	var div#125_ret#86: int;
	var mul#108_ret#87: int;
	var mul#108_ret#88: int;
	var call_arg#89: int;
	var div#125_ret#90: int;
	var sub#45_ret#91: int;
	// TCC assumptions
	assume (user#1546 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	if ((currentInvestAmount#218[user#1546] == 0)) {
	amount#1549 := 0;
	}
	else {
	assume {:sourceloc "buggy_24.sol", 557, 38} {:message ""} true;
	call sub#45_ret#85 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#216[user#1546]);
	assume {:sourceloc "buggy_24.sol", 557, 38} {:message ""} true;
	call div#125_ret#86 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#85, 86400);
	commissionDays#1561 := div#125_ret#86;
	if ((commissionDays#1561 > currentInvestCycle#220[user#1546])) {
	commissionDays#1561 := currentInvestCycle#220[user#1546];
	}

	assume {:sourceloc "buggy_24.sol", 561, 22} {:message ""} true;
	call mul#108_ret#87 := mul#108(__this, __msg_sender, __msg_value, currentInvestAmount#218[user#1546], currentStaticCommissionRatio#224[user#1546]);
	assume {:sourceloc "buggy_24.sol", 561, 22} {:message ""} true;
	call mul#108_ret#88 := mul#108(__this, __msg_sender, __msg_value, mul#108_ret#87, commissionDays#1561);
	amount#1549 := mul#108_ret#88;
	call_arg#89 := 1000;
	assume {:sourceloc "buggy_24.sol", 562, 22} {:message ""} true;
	call div#125_ret#90 := div#125(__this, __msg_sender, __msg_value, amount#1549, call_arg#89);
	amount#1549 := div#125_ret#90;
	assume {:sourceloc "buggy_24.sol", 563, 22} {:message ""} true;
	call sub#45_ret#91 := sub#45(__this, __msg_sender, __msg_value, amount#1549, currentStaticCommissionWithdrawAmount#226[user#1546]);
	amount#1549 := sub#45_ret#91;
	}

	$return40:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 566, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#1617: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_24.sol", 567, 1} {:message "FomoFeast::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#1646(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#92: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 570, 16} {:message ""} true;
	call __send_ret#92 := __send(__msg_sender, __this, 0, userBalance_re_ent19#1617[__this][__msg_sender]);
	if (!(__send_ret#92)) {
	assume false;
	}

	userBalance_re_ent19#1617 := userBalance_re_ent19#1617[__this := userBalance_re_ent19#1617[__this][__msg_sender := 0]];
	$return41:
	// Function body ends here
}

var struct_storage_InvestRecord#242_arr_default_context: [int]struct_storage_InvestRecord#242_arr_type;
// 
// Function: addInvestRecord : function (address,uint256,uint256,uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 576, 5} {:message "FomoFeast::addInvestRecord"} addInvestRecord#1703(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#1648: address_t, time#1650: int, amount#1652: int, cycle#1654: int)
{
	var records#1661: [int]int;
	var {:sourceloc "buggy_24.sol", 578, 14} {:message "i"} i#1667: int;
	var {:sourceloc "buggy_24.sol", 579, 13} {:message "prevRecord"} prevRecord#1677: address_struct_memory_InvestRecord#242;
	var new_struct_InvestRecord#95: address_struct_memory_InvestRecord#242;
	var tmp#96: int;
	var new_struct_InvestRecord#97: address_struct_memory_InvestRecord#242;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	records#1661 := default_int_int()[0 := 32][1 := userAddress#1648];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1667 := 8;
	while ((i#1667 > 0)) {
	// Body
	new_struct_InvestRecord#95 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	prevRecord#1677 := new_struct_InvestRecord#95;
	// Deep copy struct InvestRecord
	time#237 := time#237[prevRecord#1677 := time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr((if (records#1661[0] == 32) then investRecordMapping#723[__this][records#1661[1]] else struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))[(i#1667 - 1)])];
	amount#239 := amount#239[prevRecord#1677 := amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr((if (records#1661[0] == 32) then investRecordMapping#723[__this][records#1661[1]] else struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))[(i#1667 - 1)])];
	cycle#241 := cycle#241[prevRecord#1677 := cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr((if (records#1661[0] == 32) then investRecordMapping#723[__this][records#1661[1]] else struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))[(i#1667 - 1)])];
	// Deep copy struct InvestRecord
	if ((records#1661[0] == 32)) {
	investRecordMapping#723 := investRecordMapping#723[__this := investRecordMapping#723[__this][records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667 := InvestRecord#242#constr(time#237[prevRecord#1677], amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667]), cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667]))], length#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]]))]];
	}
	else {
	struct_storage_InvestRecord#242_arr_default_context := struct_storage_InvestRecord#242_arr_default_context[records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667 := InvestRecord#242#constr(time#237[prevRecord#1677], amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667]), cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667]))], length#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))];
	}

	if ((records#1661[0] == 32)) {
	investRecordMapping#723 := investRecordMapping#723[__this := investRecordMapping#723[__this][records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667]), amount#239[prevRecord#1677], cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667]))], length#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]]))]];
	}
	else {
	struct_storage_InvestRecord#242_arr_default_context := struct_storage_InvestRecord#242_arr_default_context[records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667]), amount#239[prevRecord#1677], cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667]))], length#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))];
	}

	if ((records#1661[0] == 32)) {
	investRecordMapping#723 := investRecordMapping#723[__this := investRecordMapping#723[__this][records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667]), amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[i#1667]), cycle#241[prevRecord#1677])], length#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]]))]];
	}
	else {
	struct_storage_InvestRecord#242_arr_default_context := struct_storage_InvestRecord#242_arr_default_context[records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667]), amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[i#1667]), cycle#241[prevRecord#1677])], length#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))];
	}

	$continue93:
	// Loop expression
	i#1667 := (i#1667 - 1);
	tmp#96 := i#1667;
	}

	break94:
	new_struct_InvestRecord#97 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	time#237 := time#237[new_struct_InvestRecord#97 := time#1650];
	amount#239 := amount#239[new_struct_InvestRecord#97 := amount#1652];
	cycle#241 := cycle#241[new_struct_InvestRecord#97 := cycle#1654];
	// Deep copy struct InvestRecord
	if ((records#1661[0] == 32)) {
	investRecordMapping#723 := investRecordMapping#723[__this := investRecordMapping#723[__this][records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0 := InvestRecord#242#constr(time#237[new_struct_InvestRecord#97], amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0]), cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0]))], length#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]]))]];
	}
	else {
	struct_storage_InvestRecord#242_arr_default_context := struct_storage_InvestRecord#242_arr_default_context[records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0 := InvestRecord#242#constr(time#237[new_struct_InvestRecord#97], amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0]), cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0]))], length#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))];
	}

	if ((records#1661[0] == 32)) {
	investRecordMapping#723 := investRecordMapping#723[__this := investRecordMapping#723[__this][records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0]), amount#239[new_struct_InvestRecord#97], cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0]))], length#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]]))]];
	}
	else {
	struct_storage_InvestRecord#242_arr_default_context := struct_storage_InvestRecord#242_arr_default_context[records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0]), amount#239[new_struct_InvestRecord#97], cycle#241#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0]))], length#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))];
	}

	if ((records#1661[0] == 32)) {
	investRecordMapping#723 := investRecordMapping#723[__this := investRecordMapping#723[__this][records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0]), amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]])[0]), cycle#241[new_struct_InvestRecord#97])], length#struct_storage_InvestRecord#242_arr#constr(investRecordMapping#723[__this][records#1661[1]]))]];
	}
	else {
	struct_storage_InvestRecord#242_arr_default_context := struct_storage_InvestRecord#242_arr_default_context[records#1661[1] := struct_storage_InvestRecord#242_arr#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0 := InvestRecord#242#constr(time#237#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0]), amount#239#InvestRecord#242#constr(arr#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]])[0]), cycle#241[new_struct_InvestRecord#97])], length#struct_storage_InvestRecord#242_arr#constr(struct_storage_InvestRecord#242_arr_default_context[records#1661[1]]))];
	}

	$return42:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 584, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#1707: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_24.sol", 585, 1} {:message "FomoFeast::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#1741(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 588, 10} {:message "success"} success#1711: bool;
	var __call_ret#98: bool;
	var __call_ret#99: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#1707[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#1707[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 588, 26} {:message ""} true;
	call __call_ret#98, __call_ret#99 := __call(__msg_sender, __this, userBalance_re_ent26#1707[__this][__msg_sender]);
	if (__call_ret#98) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#98)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#1707[__this][__msg_sender])];
	}

	success#1711 := __call_ret#98;
	if (!(success#1711)) {
	assume false;
	}

	userBalance_re_ent26#1707 := userBalance_re_ent26#1707[__this := userBalance_re_ent26#1707[__this][__msg_sender := 0]];
	$return43:
	// Function body ends here
}

var struct_storage_CommissionRecord#247_arr_default_context: [int]struct_storage_CommissionRecord#247_arr_type;
// 
// Function: addStaticCommissionRecord : function (address,uint256,uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 595, 5} {:message "FomoFeast::addStaticCommissionRecord"} addStaticCommissionRecord#1795(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#1743: address_t, time#1745: int, amount#1747: int)
{
	var records#1754: [int]int;
	var {:sourceloc "buggy_24.sol", 597, 14} {:message "i"} i#1760: int;
	var {:sourceloc "buggy_24.sol", 598, 13} {:message "prevRecord"} prevRecord#1770: address_struct_memory_CommissionRecord#247;
	var new_struct_CommissionRecord#102: address_struct_memory_CommissionRecord#247;
	var tmp#103: int;
	var new_struct_CommissionRecord#104: address_struct_memory_CommissionRecord#247;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	records#1754 := default_int_int()[0 := 34][1 := userAddress#1743];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1760 := 8;
	while ((i#1760 > 0)) {
	// Body
	new_struct_CommissionRecord#102 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	prevRecord#1770 := new_struct_CommissionRecord#102;
	// Deep copy struct CommissionRecord
	time#244 := time#244[prevRecord#1770 := time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr((if (records#1754[0] == 36) then dynamicCommissionRecordMapping#808[__this][records#1754[1]] else (if (records#1754[0] == 34) then staticCommissionRecordMapping#769[__this][records#1754[1]] else struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])))[(i#1760 - 1)])];
	amount#246 := amount#246[prevRecord#1770 := amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr((if (records#1754[0] == 36) then dynamicCommissionRecordMapping#808[__this][records#1754[1]] else (if (records#1754[0] == 34) then staticCommissionRecordMapping#769[__this][records#1754[1]] else struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])))[(i#1760 - 1)])];
	// Deep copy struct CommissionRecord
	if ((records#1754[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[i#1760 := CommissionRecord#247#constr(time#244[prevRecord#1770], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[i#1760]))], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]]))]];
	}
	else {
	if ((records#1754[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[i#1760 := CommissionRecord#247#constr(time#244[prevRecord#1770], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[i#1760]))], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[i#1760 := CommissionRecord#247#constr(time#244[prevRecord#1770], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[i#1760]))], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]]))];
	}

	}

	if ((records#1754[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[i#1760 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[i#1760]), amount#246[prevRecord#1770])], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]]))]];
	}
	else {
	if ((records#1754[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[i#1760 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[i#1760]), amount#246[prevRecord#1770])], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[i#1760 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[i#1760]), amount#246[prevRecord#1770])], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]]))];
	}

	}

	$continue100:
	// Loop expression
	i#1760 := (i#1760 - 1);
	tmp#103 := i#1760;
	}

	break101:
	new_struct_CommissionRecord#104 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	time#244 := time#244[new_struct_CommissionRecord#104 := time#1745];
	amount#246 := amount#246[new_struct_CommissionRecord#104 := amount#1747];
	// Deep copy struct CommissionRecord
	if ((records#1754[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[0 := CommissionRecord#247#constr(time#244[new_struct_CommissionRecord#104], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[0]))], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]]))]];
	}
	else {
	if ((records#1754[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[0 := CommissionRecord#247#constr(time#244[new_struct_CommissionRecord#104], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[0]))], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[0 := CommissionRecord#247#constr(time#244[new_struct_CommissionRecord#104], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[0]))], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]]))];
	}

	}

	if ((records#1754[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[0 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]])[0]), amount#246[new_struct_CommissionRecord#104])], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1754[1]]))]];
	}
	else {
	if ((records#1754[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[0 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]])[0]), amount#246[new_struct_CommissionRecord#104])], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1754[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1754[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[0 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]])[0]), amount#246[new_struct_CommissionRecord#104])], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1754[1]]))];
	}

	}

	$return44:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_24.sol", 603, 1} {:message "not_called_re_ent20"} not_called_re_ent20#1798: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_24.sol", 604, 1} {:message "FomoFeast::bug_re_ent20"} bug_re_ent20#1825(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#105: int;
	var __send_ret#106: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#1798[__this];
	call_arg#105 := 1000000000000000000;
	assume {:sourceloc "buggy_24.sol", 606, 16} {:message ""} true;
	call __send_ret#106 := __send(__msg_sender, __this, 0, call_arg#105);
	if (!(__send_ret#106)) {
	assume false;
	}

	not_called_re_ent20#1798 := not_called_re_ent20#1798[__this := false];
	$return45:
	// Function body ends here
}

// 
// Function: addDynamicCommissionRecord : function (address,uint256,uint256)
procedure {:inline 1} {:sourceloc "buggy_24.sol", 612, 5} {:message "FomoFeast::addDynamicCommissionRecord"} addDynamicCommissionRecord#1879(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#1827: address_t, time#1829: int, amount#1831: int)
{
	var records#1838: [int]int;
	var {:sourceloc "buggy_24.sol", 614, 14} {:message "i"} i#1844: int;
	var {:sourceloc "buggy_24.sol", 615, 13} {:message "prevRecord"} prevRecord#1854: address_struct_memory_CommissionRecord#247;
	var new_struct_CommissionRecord#109: address_struct_memory_CommissionRecord#247;
	var tmp#110: int;
	var new_struct_CommissionRecord#111: address_struct_memory_CommissionRecord#247;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	records#1838 := default_int_int()[0 := 36][1 := userAddress#1827];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1844 := 8;
	while ((i#1844 > 0)) {
	// Body
	new_struct_CommissionRecord#109 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	prevRecord#1854 := new_struct_CommissionRecord#109;
	// Deep copy struct CommissionRecord
	time#244 := time#244[prevRecord#1854 := time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr((if (records#1838[0] == 36) then dynamicCommissionRecordMapping#808[__this][records#1838[1]] else (if (records#1838[0] == 34) then staticCommissionRecordMapping#769[__this][records#1838[1]] else struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])))[(i#1844 - 1)])];
	amount#246 := amount#246[prevRecord#1854 := amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr((if (records#1838[0] == 36) then dynamicCommissionRecordMapping#808[__this][records#1838[1]] else (if (records#1838[0] == 34) then staticCommissionRecordMapping#769[__this][records#1838[1]] else struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])))[(i#1844 - 1)])];
	// Deep copy struct CommissionRecord
	if ((records#1838[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[i#1844 := CommissionRecord#247#constr(time#244[prevRecord#1854], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[i#1844]))], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]]))]];
	}
	else {
	if ((records#1838[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[i#1844 := CommissionRecord#247#constr(time#244[prevRecord#1854], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[i#1844]))], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[i#1844 := CommissionRecord#247#constr(time#244[prevRecord#1854], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[i#1844]))], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]]))];
	}

	}

	if ((records#1838[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[i#1844 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[i#1844]), amount#246[prevRecord#1854])], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]]))]];
	}
	else {
	if ((records#1838[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[i#1844 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[i#1844]), amount#246[prevRecord#1854])], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[i#1844 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[i#1844]), amount#246[prevRecord#1854])], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]]))];
	}

	}

	$continue107:
	// Loop expression
	i#1844 := (i#1844 - 1);
	tmp#110 := i#1844;
	}

	break108:
	new_struct_CommissionRecord#111 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	time#244 := time#244[new_struct_CommissionRecord#111 := time#1829];
	amount#246 := amount#246[new_struct_CommissionRecord#111 := amount#1831];
	// Deep copy struct CommissionRecord
	if ((records#1838[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[0 := CommissionRecord#247#constr(time#244[new_struct_CommissionRecord#111], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[0]))], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]]))]];
	}
	else {
	if ((records#1838[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[0 := CommissionRecord#247#constr(time#244[new_struct_CommissionRecord#111], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[0]))], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[0 := CommissionRecord#247#constr(time#244[new_struct_CommissionRecord#111], amount#246#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[0]))], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]]))];
	}

	}

	if ((records#1838[0] == 36)) {
	dynamicCommissionRecordMapping#808 := dynamicCommissionRecordMapping#808[__this := dynamicCommissionRecordMapping#808[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[0 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]])[0]), amount#246[new_struct_CommissionRecord#111])], length#struct_storage_CommissionRecord#247_arr#constr(dynamicCommissionRecordMapping#808[__this][records#1838[1]]))]];
	}
	else {
	if ((records#1838[0] == 34)) {
	staticCommissionRecordMapping#769 := staticCommissionRecordMapping#769[__this := staticCommissionRecordMapping#769[__this][records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[0 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]])[0]), amount#246[new_struct_CommissionRecord#111])], length#struct_storage_CommissionRecord#247_arr#constr(staticCommissionRecordMapping#769[__this][records#1838[1]]))]];
	}
	else {
	struct_storage_CommissionRecord#247_arr_default_context := struct_storage_CommissionRecord#247_arr_default_context[records#1838[1] := struct_storage_CommissionRecord#247_arr#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[0 := CommissionRecord#247#constr(time#244#CommissionRecord#247#constr(arr#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]])[0]), amount#246[new_struct_CommissionRecord#111])], length#struct_storage_CommissionRecord#247_arr#constr(struct_storage_CommissionRecord#247_arr_default_context[records#1838[1]]))];
	}

	}

	$return46:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 620, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#1883: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_24.sol", 621, 1} {:message "FomoFeast::claimReward_re_ent32"} claimReward_re_ent32#1919(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 624, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#1896: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#1883[__this][__msg_sender] > 0);
	transferValue_re_ent32#1896 := redeemableEther_re_ent32#1883[__this][__msg_sender];
	assume {:sourceloc "buggy_24.sol", 625, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#1896);
	redeemableEther_re_ent32#1883 := redeemableEther_re_ent32#1883[__this := redeemableEther_re_ent32#1883[__this][__msg_sender := 0]];
	$return47:
	// Function body ends here
}

var User235default_context: [int]struct_storage_User#235;
// 
// Function: invest
procedure {:sourceloc "buggy_24.sol", 629, 5} {:message "FomoFeast::invest"} invest#2308(__this: address_t, __msg_sender: address_t, __msg_value: int, sponsorAddress#1921: address_t, investCycle#1923: int)
{
	var sponsor#1927: [int]int;
	var call_arg#112: int_arr_ptr;
	var new_array#113: int_arr_ptr;
	var call_arg#114: int_arr_ptr;
	var new_array#115: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 633, 9} {:message "investAmount"} investAmount#1956: int;
	var div#125_ret#116: int;
	var mul#108_ret#117: int;
	var call_arg#118: int_arr_ptr;
	var new_array#119: int_arr_ptr;
	var call_arg#120: int;
	var mul#108_ret#121: int;
	var call_arg#122: int;
	var mul#108_ret#123: int;
	var call_arg#124: int_arr_ptr;
	var new_array#125: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 638, 9} {:message "user"} user#1996: address_struct_memory_User#235;
	var new_struct_User#126: address_struct_memory_User#235;
	var {:sourceloc "buggy_24.sol", 639, 9} {:message "level"} level#2003: int;
	var getLevelByInvestAmount#1045_ret#127: int;
	var call_arg#128: int_arr_ptr;
	var new_array#129: int_arr_ptr;
	var call_arg#130: int_arr_ptr;
	var new_array#131: int_arr_ptr;
	var call_arg#132: int_arr_ptr;
	var new_array#133: int_arr_ptr;
	var call_arg#134: int_arr_ptr;
	var new_array#135: int_arr_ptr;
	var call_arg#136: int_arr_ptr;
	var new_array#137: int_arr_ptr;
	var call_arg#138: int_arr_ptr;
	var new_array#139: int_arr_ptr;
	var call_arg#140: int_arr_ptr;
	var new_array#141: int_arr_ptr;
	var call_arg#142: int;
	var add#28_ret#143: int;
	var add#28_ret#144: int;
	var getStaticCommissionRatio#1347_ret#145: int;
	var {:sourceloc "buggy_24.sol", 656, 13} {:message "addressWalker"} addressWalker#2130: address_t;
	var add#28_ret#148: int;
	var call_arg#149: int;
	var call_arg#150: int;
	var call_arg#151: int;
	var call_arg#152: int;
	var call_arg#153: int;
	var call_arg#154: int;
	var getStaticCommissionRatio#1347_ret#155: int;
	var call_arg#156: int;
	var call_arg#157: int;
	var call_arg#158: int;
	var call_arg#159: int;
	var new_struct_User#160: address_struct_memory_User#235;
	var call_arg#161: int;
	var add#28_ret#162: int;
	var {:sourceloc "buggy_24.sol", 669, 13} {:message "addressWalker"} addressWalker#2205: address_t;
	var call_arg#165: int;
	var add#28_ret#166: int;
	var call_arg#167: int;
	var add#28_ret#168: int;
	var add#28_ret#169: int;
	var call_arg#170: address_t;
	var call_arg#171: int;
	var add#28_ret#172: int;
	var add#28_ret#173: int;
	var call_arg#174: int;
	var div#125_ret#175: int;
	var add#28_ret#176: int;
	var call_arg#177: int;
	var mul#108_ret#178: int;
	var call_arg#179: int;
	var div#125_ret#180: int;
	var add#28_ret#181: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	sponsor#1927 := default_int_int()[0 := 28][1 := sponsorAddress#1921];
	new_array#113 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#112 := new_array#113;
	mem_arr_int := mem_arr_int[call_arg#112 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 112][10 := 111][11 := 110][12 := 115][13 := 111][14 := 114][15 := 32][16 := 97][17 := 100][18 := 100][19 := 114][20 := 101][21 := 115][22 := 115], 23)];
	assume (totalInvestCount#200#User#235#constr((if (sponsor#1927[0] == 28) then userMapping#647[__this][sponsor#1927[1]] else User235default_context[sponsor#1927[1]])) > 0);
	new_array#115 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#114 := new_array#115;
	mem_arr_int := mem_arr_int[call_arg#114 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 105][9 := 110][10 := 118][11 := 101][12 := 115][13 := 116][14 := 32][15 := 99][16 := 121][17 := 99][18 := 108][19 := 101], 20)];
	assume (((investCycle#1923 == 30) || (investCycle#1923 == 60)) || (investCycle#1923 == 90));
	assume {:sourceloc "buggy_24.sol", 633, 32} {:message ""} true;
	call div#125_ret#116 := div#125(__this, __msg_sender, __msg_value, __msg_value, 1000000000000000000);
	investAmount#1956 := div#125_ret#116;
	assume {:sourceloc "buggy_24.sol", 634, 24} {:message ""} true;
	call mul#108_ret#117 := mul#108(__this, __msg_sender, __msg_value, investAmount#1956, 1000000000000000000);
	investAmount#1956 := mul#108_ret#117;
	new_array#119 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#118 := new_array#119;
	mem_arr_int := mem_arr_int[call_arg#118 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 101][4 := 115][5 := 116][6 := 32][7 := 97][8 := 109][9 := 111][10 := 117][11 := 110][12 := 116][13 := 32][14 := 105][15 := 115][16 := 32][17 := 110][18 := 111][19 := 116][20 := 32][21 := 105][22 := 110][23 := 116][24 := 101][25 := 103][26 := 101][27 := 114], 28)];
	assume (investAmount#1956 == __msg_value);
	call_arg#120 := 15;
	assume {:sourceloc "buggy_24.sol", 636, 67} {:message ""} true;
	call mul#108_ret#121 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#120);
	call_arg#122 := 1;
	assume {:sourceloc "buggy_24.sol", 636, 33} {:message ""} true;
	call mul#108_ret#123 := mul#108(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#122);
	new_array#125 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#124 := new_array#125;
	mem_arr_int := mem_arr_int[call_arg#124 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 105][9 := 110][10 := 118][11 := 101][12 := 115][13 := 116][14 := 32][15 := 97][16 := 109][17 := 111][18 := 117][19 := 110][20 := 116], 21)];
	assume ((investAmount#1956 >= mul#108_ret#123) && (investAmount#1956 <= mul#108_ret#121));
	new_struct_User#126 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#1996 := new_struct_User#126;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[user#1996 := totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender])];
	totalInvestAmount#202 := totalInvestAmount#202[user#1996 := totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender])];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[user#1996 := totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender])];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[user#1996 := totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender])];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[user#1996 := totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender])];
	downlineCount#210 := downlineCount#210[user#1996 := downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender])];
	nodeCount#212 := nodeCount#212[user#1996 := nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender])];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[user#1996 := totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender])];
	currentInvestTime#216 := currentInvestTime#216[user#1996 := currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender])];
	currentInvestAmount#218 := currentInvestAmount#218[user#1996 := currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender])];
	currentInvestCycle#220 := currentInvestCycle#220[user#1996 := currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender])];
	currentlevel#222 := currentlevel#222[user#1996 := currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender])];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[user#1996 := currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender])];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[user#1996 := currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender])];
	staticCommissionBalance#228 := staticCommissionBalance#228[user#1996 := staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender])];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[user#1996 := dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender])];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[user#1996 := calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender])];
	sponsorAddress#234 := sponsorAddress#234[user#1996 := sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 639, 25} {:message ""} true;
	call getLevelByInvestAmount#1045_ret#127 := getLevelByInvestAmount#1045(__this, __msg_sender, __msg_value, investAmount#1956);
	level#2003 := getLevelByInvestAmount#1045_ret#127;
	if ((totalInvestCount#200[user#1996] > 0)) {
	new_array#129 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#128 := new_array#129;
	mem_arr_int := mem_arr_int[call_arg#128 := int_arr#constr(default_int_int()[0 := 115][1 := 112][2 := 111][3 := 110][4 := 115][5 := 111][6 := 114][7 := 32][8 := 97][9 := 100][10 := 100][11 := 114][12 := 101][13 := 115][14 := 115][15 := 32][16 := 105][17 := 115][18 := 32][19 := 105][20 := 110][21 := 99][22 := 111][23 := 110][24 := 115][25 := 105][26 := 115][27 := 116][28 := 101][29 := 110][30 := 116], 31)];
	assume (sponsorAddress#234[user#1996] == sponsorAddress#1921);
	new_array#131 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#130 := new_array#131;
	mem_arr_int := mem_arr_int[call_arg#130 := int_arr#constr(default_int_int()[0 := 68][1 := 117][2 := 109][3 := 112][4 := 108][5 := 105][6 := 99][7 := 97][8 := 116][9 := 101][10 := 32][11 := 105][12 := 110][13 := 118][14 := 101][15 := 115][16 := 116], 17)];
	assume (currentInvestAmount#218[user#1996] == 0);
	new_array#133 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#132 := new_array#133;
	mem_arr_int := mem_arr_int[call_arg#132 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentInvestTime#216[user#1996] == 0);
	new_array#135 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#134 := new_array#135;
	mem_arr_int := mem_arr_int[call_arg#134 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentInvestCycle#220[user#1996] == 0);
	new_array#137 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#136 := new_array#137;
	mem_arr_int := mem_arr_int[call_arg#136 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentlevel#222[user#1996] == 0);
	new_array#139 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#138 := new_array#139;
	mem_arr_int := mem_arr_int[call_arg#138 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentStaticCommissionRatio#224[user#1996] == 0);
	new_array#141 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#140 := new_array#141;
	mem_arr_int := mem_arr_int[call_arg#140 := int_arr#constr(default_int_int()[0 := 73][1 := 110][2 := 118][3 := 97][4 := 108][5 := 105][6 := 100][7 := 32][8 := 115][9 := 116][10 := 97][11 := 116][12 := 101], 13)];
	assume (currentStaticCommissionWithdrawAmount#226[user#1996] == 0);
	call_arg#142 := 1;
	assume {:sourceloc "buggy_24.sol", 648, 37} {:message ""} true;
	call add#28_ret#143 := add#28(__this, __msg_sender, __msg_value, totalInvestCount#200[user#1996], call_arg#142);
	totalInvestCount#200 := totalInvestCount#200[user#1996 := add#28_ret#143];
	assume {:sourceloc "buggy_24.sol", 649, 38} {:message ""} true;
	call add#28_ret#144 := add#28(__this, __msg_sender, __msg_value, totalInvestAmount#202[user#1996], investAmount#1956);
	totalInvestAmount#202 := totalInvestAmount#202[user#1996 := add#28_ret#144];
	currentInvestTime#216 := currentInvestTime#216[user#1996 := __block_timestamp];
	currentInvestAmount#218 := currentInvestAmount#218[user#1996 := investAmount#1956];
	currentInvestCycle#220 := currentInvestCycle#220[user#1996 := investCycle#1923];
	currentlevel#222 := currentlevel#222[user#1996 := level#2003];
	assume {:sourceloc "buggy_24.sol", 654, 49} {:message ""} true;
	call getStaticCommissionRatio#1347_ret#145 := getStaticCommissionRatio#1347(__this, __msg_sender, __msg_value, level#2003, investCycle#1923);
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[user#1996 := getStaticCommissionRatio#1347_ret#145];
	// Deep copy struct User
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200[user#1996], totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202[user#1996], totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204[user#1996], totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206[user#1996], totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208[user#1996], downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210[user#1996], nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212[user#1996], totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214[user#1996], currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216[user#1996], currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218[user#1996], currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220[user#1996], currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222[user#1996], currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224[user#1996], currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226[user#1996], staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228[user#1996], dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230[user#1996], calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232[user#1996], sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234[user#1996])]];
	addressWalker#2130 := sponsorAddress#1921;
	while ((addressWalker#2130 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#1927 := default_int_int()[0 := 28][1 := addressWalker#2130];
	assume {:sourceloc "buggy_24.sol", 659, 53} {:message ""} true;
	call add#28_ret#148 := add#28(__this, __msg_sender, __msg_value, totalDownlineInvestAmount#214#User#235#constr((if (sponsor#1927[0] == 28) then userMapping#647[__this][sponsor#1927[1]] else User235default_context[sponsor#1927[1]])), investAmount#1956);
	if ((sponsor#1927[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), add#28_ret#148, currentInvestTime#216#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][sponsor#1927[1]]))]];
	}
	else {
	User235default_context := User235default_context[sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(User235default_context[sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[sponsor#1927[1]]), downlineCount#210#User#235#constr(User235default_context[sponsor#1927[1]]), nodeCount#212#User#235#constr(User235default_context[sponsor#1927[1]]), add#28_ret#148, currentInvestTime#216#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(User235default_context[sponsor#1927[1]]), currentlevel#222#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[sponsor#1927[1]]), sponsorAddress#234#User#235#constr(User235default_context[sponsor#1927[1]]))];
	}

	addressWalker#2130 := sponsorAddress#234#User#235#constr((if (sponsor#1927[0] == 28) then userMapping#647[__this][sponsor#1927[1]] else User235default_context[sponsor#1927[1]]));
	$continue146:
	}

	break147:
	}
	else {
	call_arg#149 := 1;
	call_arg#150 := 0;
	call_arg#151 := 0;
	call_arg#152 := 0;
	call_arg#153 := 1;
	call_arg#154 := 0;
	assume {:sourceloc "buggy_24.sol", 665, 44} {:message ""} true;
	call getStaticCommissionRatio#1347_ret#155 := getStaticCommissionRatio#1347(__this, __msg_sender, __msg_value, level#2003, investCycle#1923);
	call_arg#156 := 0;
	call_arg#157 := 0;
	call_arg#158 := 0;
	call_arg#159 := 0;
	new_struct_User#160 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	totalInvestCount#200 := totalInvestCount#200[new_struct_User#160 := call_arg#149];
	totalInvestAmount#202 := totalInvestAmount#202[new_struct_User#160 := investAmount#1956];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[new_struct_User#160 := call_arg#150];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[new_struct_User#160 := call_arg#151];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[new_struct_User#160 := call_arg#152];
	downlineCount#210 := downlineCount#210[new_struct_User#160 := call_arg#153];
	nodeCount#212 := nodeCount#212[new_struct_User#160 := call_arg#154];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[new_struct_User#160 := investAmount#1956];
	currentInvestTime#216 := currentInvestTime#216[new_struct_User#160 := __block_timestamp];
	currentInvestAmount#218 := currentInvestAmount#218[new_struct_User#160 := investAmount#1956];
	currentInvestCycle#220 := currentInvestCycle#220[new_struct_User#160 := investCycle#1923];
	currentlevel#222 := currentlevel#222[new_struct_User#160 := level#2003];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[new_struct_User#160 := getStaticCommissionRatio#1347_ret#155];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[new_struct_User#160 := call_arg#156];
	staticCommissionBalance#228 := staticCommissionBalance#228[new_struct_User#160 := call_arg#157];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[new_struct_User#160 := call_arg#158];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[new_struct_User#160 := call_arg#159];
	sponsorAddress#234 := sponsorAddress#234[new_struct_User#160 := sponsorAddress#1921];
	// Deep copy struct User
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200[new_struct_User#160], totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202[new_struct_User#160], totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204[new_struct_User#160], totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206[new_struct_User#160], totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208[new_struct_User#160], downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210[new_struct_User#160], nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212[new_struct_User#160], totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214[new_struct_User#160], currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216[new_struct_User#160], currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218[new_struct_User#160], currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220[new_struct_User#160], currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222[new_struct_User#160], currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224[new_struct_User#160], currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226[new_struct_User#160], staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228[new_struct_User#160], dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230[new_struct_User#160], calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232[new_struct_User#160], sponsorAddress#234#User#235#constr(userMapping#647[__this][__msg_sender]))]];
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][__msg_sender := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][__msg_sender]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][__msg_sender]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][__msg_sender]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][__msg_sender]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][__msg_sender]), downlineCount#210#User#235#constr(userMapping#647[__this][__msg_sender]), nodeCount#212#User#235#constr(userMapping#647[__this][__msg_sender]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestTime#216#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][__msg_sender]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][__msg_sender]), currentlevel#222#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][__msg_sender]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][__msg_sender]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][__msg_sender]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][__msg_sender]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][__msg_sender]), sponsorAddress#234[new_struct_User#160])]];
	addressMapping#684 := addressMapping#684[__this := addressMapping#684[__this][totalUserCount#477[__this] := __msg_sender]];
	call_arg#161 := 1;
	assume {:sourceloc "buggy_24.sol", 668, 30} {:message ""} true;
	call add#28_ret#162 := add#28(__this, __msg_sender, __msg_value, totalUserCount#477[__this], call_arg#161);
	totalUserCount#477 := totalUserCount#477[__this := add#28_ret#162];
	addressWalker#2205 := sponsorAddress#1921;
	while ((addressWalker#2205 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#1927 := default_int_int()[0 := 28][1 := addressWalker#2205];
	call_arg#165 := 1;
	assume {:sourceloc "buggy_24.sol", 672, 41} {:message ""} true;
	call add#28_ret#166 := add#28(__this, __msg_sender, __msg_value, downlineCount#210#User#235#constr((if (sponsor#1927[0] == 28) then userMapping#647[__this][sponsor#1927[1]] else User235default_context[sponsor#1927[1]])), call_arg#165);
	if ((sponsor#1927[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), add#28_ret#166, nodeCount#212#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][sponsor#1927[1]]))]];
	}
	else {
	User235default_context := User235default_context[sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(User235default_context[sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[sponsor#1927[1]]), add#28_ret#166, nodeCount#212#User#235#constr(User235default_context[sponsor#1927[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestTime#216#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(User235default_context[sponsor#1927[1]]), currentlevel#222#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[sponsor#1927[1]]), sponsorAddress#234#User#235#constr(User235default_context[sponsor#1927[1]]))];
	}

	if ((addressWalker#2205 == sponsorAddress#1921)) {
	call_arg#167 := 1;
	assume {:sourceloc "buggy_24.sol", 674, 41} {:message ""} true;
	call add#28_ret#168 := add#28(__this, __msg_sender, __msg_value, nodeCount#212#User#235#constr((if (sponsor#1927[0] == 28) then userMapping#647[__this][sponsor#1927[1]] else User235default_context[sponsor#1927[1]])), call_arg#167);
	if ((sponsor#1927[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), add#28_ret#168, totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][sponsor#1927[1]]))]];
	}
	else {
	User235default_context := User235default_context[sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(User235default_context[sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[sponsor#1927[1]]), downlineCount#210#User#235#constr(User235default_context[sponsor#1927[1]]), add#28_ret#168, totalDownlineInvestAmount#214#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestTime#216#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(User235default_context[sponsor#1927[1]]), currentlevel#222#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[sponsor#1927[1]]), sponsorAddress#234#User#235#constr(User235default_context[sponsor#1927[1]]))];
	}

	}

	assume {:sourceloc "buggy_24.sol", 676, 53} {:message ""} true;
	call add#28_ret#169 := add#28(__this, __msg_sender, __msg_value, totalDownlineInvestAmount#214#User#235#constr((if (sponsor#1927[0] == 28) then userMapping#647[__this][sponsor#1927[1]] else User235default_context[sponsor#1927[1]])), investAmount#1956);
	if ((sponsor#1927[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), add#28_ret#169, currentInvestTime#216#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][sponsor#1927[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][sponsor#1927[1]]))]];
	}
	else {
	User235default_context := User235default_context[sponsor#1927[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[sponsor#1927[1]]), totalInvestAmount#202#User#235#constr(User235default_context[sponsor#1927[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[sponsor#1927[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[sponsor#1927[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[sponsor#1927[1]]), downlineCount#210#User#235#constr(User235default_context[sponsor#1927[1]]), nodeCount#212#User#235#constr(User235default_context[sponsor#1927[1]]), add#28_ret#169, currentInvestTime#216#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestAmount#218#User#235#constr(User235default_context[sponsor#1927[1]]), currentInvestCycle#220#User#235#constr(User235default_context[sponsor#1927[1]]), currentlevel#222#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[sponsor#1927[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[sponsor#1927[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[sponsor#1927[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[sponsor#1927[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[sponsor#1927[1]]), sponsorAddress#234#User#235#constr(User235default_context[sponsor#1927[1]]))];
	}

	addressWalker#2205 := sponsorAddress#234#User#235#constr((if (sponsor#1927[0] == 28) then userMapping#647[__this][sponsor#1927[1]] else User235default_context[sponsor#1927[1]]));
	$continue163:
	}

	break164:
	}

	call_arg#170 := __msg_sender;
	assume {:sourceloc "buggy_24.sol", 681, 9} {:message ""} true;
	call addInvestRecord#1703(__this, __msg_sender, __msg_value, call_arg#170, __block_timestamp, investAmount#1956, investCycle#1923);
	call_arg#171 := 1;
	assume {:sourceloc "buggy_24.sol", 682, 28} {:message ""} true;
	call add#28_ret#172 := add#28(__this, __msg_sender, __msg_value, totalInvestCount#306[__this], call_arg#171);
	totalInvestCount#306 := totalInvestCount#306[__this := add#28_ret#172];
	assume {:sourceloc "buggy_24.sol", 683, 29} {:message ""} true;
	call add#28_ret#173 := add#28(__this, __msg_sender, __msg_value, totalInvestAmount#335[__this], investAmount#1956);
	totalInvestAmount#335 := totalInvestAmount#335[__this := add#28_ret#173];
	call_arg#174 := 50;
	assume {:sourceloc "buggy_24.sol", 684, 43} {:message ""} true;
	call div#125_ret#175 := div#125(__this, __msg_sender, __msg_value, investAmount#1956, call_arg#174);
	assume {:sourceloc "buggy_24.sol", 684, 25} {:message ""} true;
	call add#28_ret#176 := add#28(__this, __msg_sender, __msg_value, engineerFunds#506[__this], div#125_ret#175);
	engineerFunds#506 := engineerFunds#506[__this := add#28_ret#176];
	call_arg#177 := 3;
	assume {:sourceloc "buggy_24.sol", 685, 43} {:message ""} true;
	call mul#108_ret#178 := mul#108(__this, __msg_sender, __msg_value, investAmount#1956, call_arg#177);
	call_arg#179 := 100;
	assume {:sourceloc "buggy_24.sol", 685, 43} {:message ""} true;
	call div#125_ret#180 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#178, call_arg#179);
	assume {:sourceloc "buggy_24.sol", 685, 25} {:message ""} true;
	call add#28_ret#181 := add#28(__this, __msg_sender, __msg_value, operatorFunds#572[__this], div#125_ret#180);
	operatorFunds#572 := operatorFunds#572[__this := add#28_ret#181];
	$return48:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 687, 1} {:message "balances_re_ent38"} balances_re_ent38#2312: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 688, 1} {:message "FomoFeast::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#2345(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#2314: int)
{
	var __send_ret#182: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#2312[__this][__msg_sender] >= _weiToWithdraw#2314);
	assume {:sourceloc "buggy_24.sol", 691, 13} {:message ""} true;
	call __send_ret#182 := __send(__msg_sender, __this, 0, _weiToWithdraw#2314);
	assume __send_ret#182;
	balances_re_ent38#2312 := balances_re_ent38#2312[__this := balances_re_ent38#2312[__this][__msg_sender := (balances_re_ent38#2312[__this][__msg_sender] - _weiToWithdraw#2314)]];
	$return49:
	// Function body ends here
}

// 
// Function: userWithdraw
procedure {:sourceloc "buggy_24.sol", 695, 5} {:message "FomoFeast::userWithdraw"} userWithdraw#2457(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var user#2349: [int]int;
	var {:sourceloc "buggy_24.sol", 698, 13} {:message "avaliableIA"} avaliableIA#2360: int;
	var call_arg#183: address_struct_memory_User#235;
	var new_struct_User#184: address_struct_memory_User#235;
	var isInvestExpired#1112_ret#185: bool;
	var call_arg#186: address_struct_memory_User#235;
	var new_struct_User#187: address_struct_memory_User#235;
	var getAbortInvestAmount#1214_ret#188: int;
	var {:sourceloc "buggy_24.sol", 702, 13} {:message "avaliableSCA"} avaliableSCA#2377: int;
	var call_arg#189: address_struct_memory_User#235;
	var new_struct_User#190: address_struct_memory_User#235;
	var getAvaliableStaticCommissionAmount#1613_ret#191: int;
	var add#28_ret#192: int;
	var add#28_ret#193: int;
	var add#28_ret#194: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	user#2349 := default_int_int()[0 := 28][1 := __msg_sender];
	if ((currentInvestAmount#218#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]])) > 0)) {
	avaliableIA#2360 := currentInvestAmount#218#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]));
	new_struct_User#184 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#183 := new_struct_User#184;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[call_arg#183 := totalInvestCount#200#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalInvestAmount#202 := totalInvestAmount#202[call_arg#183 := totalInvestAmount#202#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[call_arg#183 := totalStaticCommissionWithdrawAmount#204#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[call_arg#183 := totalDynamicCommissionWithdrawAmount#206#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[call_arg#183 := totalWithdrawAmount#208#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	downlineCount#210 := downlineCount#210[call_arg#183 := downlineCount#210#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	nodeCount#212 := nodeCount#212[call_arg#183 := nodeCount#212#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[call_arg#183 := totalDownlineInvestAmount#214#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestTime#216 := currentInvestTime#216[call_arg#183 := currentInvestTime#216#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestAmount#218 := currentInvestAmount#218[call_arg#183 := currentInvestAmount#218#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestCycle#220 := currentInvestCycle#220[call_arg#183 := currentInvestCycle#220#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentlevel#222 := currentlevel#222[call_arg#183 := currentlevel#222#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[call_arg#183 := currentStaticCommissionRatio#224#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[call_arg#183 := currentStaticCommissionWithdrawAmount#226#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	staticCommissionBalance#228 := staticCommissionBalance#228[call_arg#183 := staticCommissionBalance#228#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[call_arg#183 := dynamicCommissionBalance#230#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[call_arg#183 := calcDynamicCommissionAmount#232#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	sponsorAddress#234 := sponsorAddress#234[call_arg#183 := sponsorAddress#234#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	assume {:sourceloc "buggy_24.sol", 699, 18} {:message ""} true;
	call isInvestExpired#1112_ret#185 := isInvestExpired#1112(__this, __msg_sender, __msg_value, call_arg#183);
	if (!(isInvestExpired#1112_ret#185)) {
	new_struct_User#187 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#186 := new_struct_User#187;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[call_arg#186 := totalInvestCount#200#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalInvestAmount#202 := totalInvestAmount#202[call_arg#186 := totalInvestAmount#202#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[call_arg#186 := totalStaticCommissionWithdrawAmount#204#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[call_arg#186 := totalDynamicCommissionWithdrawAmount#206#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[call_arg#186 := totalWithdrawAmount#208#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	downlineCount#210 := downlineCount#210[call_arg#186 := downlineCount#210#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	nodeCount#212 := nodeCount#212[call_arg#186 := nodeCount#212#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[call_arg#186 := totalDownlineInvestAmount#214#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestTime#216 := currentInvestTime#216[call_arg#186 := currentInvestTime#216#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestAmount#218 := currentInvestAmount#218[call_arg#186 := currentInvestAmount#218#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestCycle#220 := currentInvestCycle#220[call_arg#186 := currentInvestCycle#220#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentlevel#222 := currentlevel#222[call_arg#186 := currentlevel#222#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[call_arg#186 := currentStaticCommissionRatio#224#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[call_arg#186 := currentStaticCommissionWithdrawAmount#226#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	staticCommissionBalance#228 := staticCommissionBalance#228[call_arg#186 := staticCommissionBalance#228#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[call_arg#186 := dynamicCommissionBalance#230#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[call_arg#186 := calcDynamicCommissionAmount#232#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	sponsorAddress#234 := sponsorAddress#234[call_arg#186 := sponsorAddress#234#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	assume {:sourceloc "buggy_24.sol", 700, 31} {:message ""} true;
	call getAbortInvestAmount#1214_ret#188 := getAbortInvestAmount#1214(__this, __msg_sender, __msg_value, call_arg#186);
	avaliableIA#2360 := getAbortInvestAmount#1214_ret#188;
	}

	new_struct_User#190 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#189 := new_struct_User#190;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[call_arg#189 := totalInvestCount#200#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalInvestAmount#202 := totalInvestAmount#202[call_arg#189 := totalInvestAmount#202#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[call_arg#189 := totalStaticCommissionWithdrawAmount#204#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[call_arg#189 := totalDynamicCommissionWithdrawAmount#206#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[call_arg#189 := totalWithdrawAmount#208#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	downlineCount#210 := downlineCount#210[call_arg#189 := downlineCount#210#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	nodeCount#212 := nodeCount#212[call_arg#189 := nodeCount#212#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[call_arg#189 := totalDownlineInvestAmount#214#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestTime#216 := currentInvestTime#216[call_arg#189 := currentInvestTime#216#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestAmount#218 := currentInvestAmount#218[call_arg#189 := currentInvestAmount#218#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentInvestCycle#220 := currentInvestCycle#220[call_arg#189 := currentInvestCycle#220#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentlevel#222 := currentlevel#222[call_arg#189 := currentlevel#222#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[call_arg#189 := currentStaticCommissionRatio#224#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[call_arg#189 := currentStaticCommissionWithdrawAmount#226#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	staticCommissionBalance#228 := staticCommissionBalance#228[call_arg#189 := staticCommissionBalance#228#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[call_arg#189 := dynamicCommissionBalance#230#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[call_arg#189 := calcDynamicCommissionAmount#232#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	sponsorAddress#234 := sponsorAddress#234[call_arg#189 := sponsorAddress#234#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]]))];
	assume {:sourceloc "buggy_24.sol", 702, 36} {:message ""} true;
	call getAvaliableStaticCommissionAmount#1613_ret#191 := getAvaliableStaticCommissionAmount#1613(__this, __msg_sender, __msg_value, call_arg#189);
	avaliableSCA#2377 := getAvaliableStaticCommissionAmount#1613_ret#191;
	assume {:sourceloc "buggy_24.sol", 703, 44} {:message ""} true;
	call add#28_ret#192 := add#28(__this, __msg_sender, __msg_value, staticCommissionBalance#228#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]])), avaliableSCA#2377);
	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2349[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2349[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2349[1]]), add#28_ret#192, dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2349[1]]), downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2349[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2349[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2349[1]]), currentlevel#222#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2349[1]]), add#28_ret#192, dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2349[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), 0, currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2349[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2349[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2349[1]]), downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), 0, currentInvestAmount#218#User#235#constr(User235default_context[user#2349[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2349[1]]), currentlevel#222#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2349[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2349[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2349[1]]), 0, currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2349[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2349[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2349[1]]), downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2349[1]]), 0, currentInvestCycle#220#User#235#constr(User235default_context[user#2349[1]]), currentlevel#222#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2349[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2349[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2349[1]]), 0, currentlevel#222#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2349[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2349[1]]), downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2349[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2349[1]]), 0, currentlevel#222#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2349[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2349[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2349[1]]), 0, currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2349[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2349[1]]), downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2349[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2349[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2349[1]]), 0, currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2349[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2349[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2349[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2349[1]]), 0, currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2349[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2349[1]]), downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2349[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2349[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2349[1]]), currentlevel#222#User#235#constr(User235default_context[user#2349[1]]), 0, currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2349[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2349[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2349[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2349[1]]), 0, staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2349[1]]), downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2349[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2349[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2349[1]]), currentlevel#222#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2349[1]]), 0, staticCommissionBalance#228#User#235#constr(User235default_context[user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 710, 40} {:message ""} true;
	call add#28_ret#193 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#208#User#235#constr((if (user#2349[0] == 28) then userMapping#647[__this][user#2349[1]] else User235default_context[user#2349[1]])), avaliableIA#2360);
	if ((user#2349[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2349[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2349[1]]), add#28_ret#193, downlineCount#210#User#235#constr(userMapping#647[__this][user#2349[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2349[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2349[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2349[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2349[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2349[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2349[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2349[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2349[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2349[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2349[1]]), add#28_ret#193, downlineCount#210#User#235#constr(User235default_context[user#2349[1]]), nodeCount#212#User#235#constr(User235default_context[user#2349[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2349[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2349[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2349[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2349[1]]), currentlevel#222#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2349[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2349[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2349[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2349[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2349[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2349[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 711, 35} {:message ""} true;
	call add#28_ret#194 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#442[__this], avaliableIA#2360);
	totalWithdrawAmount#442 := totalWithdrawAmount#442[__this := add#28_ret#194];
	assume {:sourceloc "buggy_24.sol", 712, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableIA#2360);
	}

	$return50:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 715, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#2461: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_24.sol", 716, 1} {:message "FomoFeast::claimReward_re_ent4"} claimReward_re_ent4#2497(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 719, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#2474: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#2461[__this][__msg_sender] > 0);
	transferValue_re_ent4#2474 := redeemableEther_re_ent4#2461[__this][__msg_sender];
	assume {:sourceloc "buggy_24.sol", 720, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#2474);
	redeemableEther_re_ent4#2461 := redeemableEther_re_ent4#2461[__this := redeemableEther_re_ent4#2461[__this][__msg_sender := 0]];
	$return51:
	// Function body ends here
}

// 
// Function: userWithdrawCommission
procedure {:sourceloc "buggy_24.sol", 724, 5} {:message "FomoFeast::userWithdrawCommission"} userWithdrawCommission#2637(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var user#2501: [int]int;
	var {:sourceloc "buggy_24.sol", 726, 9} {:message "avaliableDCB"} avaliableDCB#2508: int;
	var {:sourceloc "buggy_24.sol", 727, 9} {:message "avaliableSCA"} avaliableSCA#2513: int;
	var call_arg#195: address_struct_memory_User#235;
	var new_struct_User#196: address_struct_memory_User#235;
	var getAvaliableStaticCommissionAmount#1613_ret#197: int;
	var {:sourceloc "buggy_24.sol", 728, 9} {:message "avaliableSCB"} avaliableSCB#2519: int;
	var add#28_ret#198: int;
	var {:sourceloc "buggy_24.sol", 729, 9} {:message "avaliableWithdrawAmount"} avaliableWithdrawAmount#2527: int;
	var add#28_ret#199: int;
	var call_arg#200: int;
	var div#125_ret#201: int;
	var add#28_ret#202: int;
	var add#28_ret#203: int;
	var add#28_ret#204: int;
	var add#28_ret#205: int;
	var add#28_ret#206: int;
	var add#28_ret#207: int;
	var add#28_ret#208: int;
	var call_arg#209: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	user#2501 := default_int_int()[0 := 28][1 := __msg_sender];
	avaliableDCB#2508 := dynamicCommissionBalance#230#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]));
	new_struct_User#196 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#195 := new_struct_User#196;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[call_arg#195 := totalInvestCount#200#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	totalInvestAmount#202 := totalInvestAmount#202[call_arg#195 := totalInvestAmount#202#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[call_arg#195 := totalStaticCommissionWithdrawAmount#204#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[call_arg#195 := totalDynamicCommissionWithdrawAmount#206#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[call_arg#195 := totalWithdrawAmount#208#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	downlineCount#210 := downlineCount#210[call_arg#195 := downlineCount#210#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	nodeCount#212 := nodeCount#212[call_arg#195 := nodeCount#212#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[call_arg#195 := totalDownlineInvestAmount#214#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	currentInvestTime#216 := currentInvestTime#216[call_arg#195 := currentInvestTime#216#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	currentInvestAmount#218 := currentInvestAmount#218[call_arg#195 := currentInvestAmount#218#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	currentInvestCycle#220 := currentInvestCycle#220[call_arg#195 := currentInvestCycle#220#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	currentlevel#222 := currentlevel#222[call_arg#195 := currentlevel#222#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[call_arg#195 := currentStaticCommissionRatio#224#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[call_arg#195 := currentStaticCommissionWithdrawAmount#226#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	staticCommissionBalance#228 := staticCommissionBalance#228[call_arg#195 := staticCommissionBalance#228#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[call_arg#195 := dynamicCommissionBalance#230#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[call_arg#195 := calcDynamicCommissionAmount#232#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	sponsorAddress#234 := sponsorAddress#234[call_arg#195 := sponsorAddress#234#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]]))];
	assume {:sourceloc "buggy_24.sol", 727, 32} {:message ""} true;
	call getAvaliableStaticCommissionAmount#1613_ret#197 := getAvaliableStaticCommissionAmount#1613(__this, __msg_sender, __msg_value, call_arg#195);
	avaliableSCA#2513 := getAvaliableStaticCommissionAmount#1613_ret#197;
	assume {:sourceloc "buggy_24.sol", 728, 32} {:message ""} true;
	call add#28_ret#198 := add#28(__this, __msg_sender, __msg_value, staticCommissionBalance#228#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]])), avaliableSCA#2513);
	avaliableSCB#2519 := add#28_ret#198;
	assume {:sourceloc "buggy_24.sol", 729, 43} {:message ""} true;
	call add#28_ret#199 := add#28(__this, __msg_sender, __msg_value, avaliableDCB#2508, avaliableSCB#2519);
	avaliableWithdrawAmount#2527 := add#28_ret#199;
	call_arg#200 := 10;
	assume {:sourceloc "buggy_24.sol", 730, 40} {:message ""} true;
	call div#125_ret#201 := div#125(__this, __msg_sender, __msg_value, 1000000000000000000, call_arg#200);
	if ((avaliableWithdrawAmount#2527 >= div#125_ret#201)) {
	if ((user#2501[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2501[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2501[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2501[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2501[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2501[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2501[1]]), 0, dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2501[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2501[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2501[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2501[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2501[1]]), downlineCount#210#User#235#constr(User235default_context[user#2501[1]]), nodeCount#212#User#235#constr(User235default_context[user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2501[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2501[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2501[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2501[1]]), currentlevel#222#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2501[1]]), 0, dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2501[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2501[1]]))];
	}

	if ((user#2501[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2501[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2501[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2501[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2501[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2501[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2501[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2501[1]]), 0, calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2501[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2501[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2501[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2501[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2501[1]]), downlineCount#210#User#235#constr(User235default_context[user#2501[1]]), nodeCount#212#User#235#constr(User235default_context[user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2501[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2501[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2501[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2501[1]]), currentlevel#222#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2501[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2501[1]]), 0, calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2501[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2501[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 733, 58} {:message ""} true;
	call add#28_ret#202 := add#28(__this, __msg_sender, __msg_value, currentStaticCommissionWithdrawAmount#226#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]])), avaliableSCA#2513);
	if ((user#2501[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2501[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2501[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2501[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2501[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2501[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2501[1]]), add#28_ret#202, staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2501[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2501[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2501[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2501[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2501[1]]), downlineCount#210#User#235#constr(User235default_context[user#2501[1]]), nodeCount#212#User#235#constr(User235default_context[user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2501[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2501[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2501[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2501[1]]), currentlevel#222#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2501[1]]), add#28_ret#202, staticCommissionBalance#228#User#235#constr(User235default_context[user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2501[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2501[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 734, 56} {:message ""} true;
	call add#28_ret#203 := add#28(__this, __msg_sender, __msg_value, totalStaticCommissionWithdrawAmount#204#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]])), avaliableSCB#2519);
	if ((user#2501[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2501[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2501[1]]), add#28_ret#203, totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2501[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2501[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2501[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2501[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2501[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2501[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2501[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2501[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2501[1]]), add#28_ret#203, totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2501[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#2501[1]]), downlineCount#210#User#235#constr(User235default_context[user#2501[1]]), nodeCount#212#User#235#constr(User235default_context[user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2501[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2501[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2501[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2501[1]]), currentlevel#222#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2501[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2501[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2501[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 735, 57} {:message ""} true;
	call add#28_ret#204 := add#28(__this, __msg_sender, __msg_value, totalDynamicCommissionWithdrawAmount#206#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]])), avaliableDCB#2508);
	if ((user#2501[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2501[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2501[1]]), add#28_ret#204, totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#2501[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#2501[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2501[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2501[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2501[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2501[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2501[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2501[1]]), add#28_ret#204, totalWithdrawAmount#208#User#235#constr(User235default_context[user#2501[1]]), downlineCount#210#User#235#constr(User235default_context[user#2501[1]]), nodeCount#212#User#235#constr(User235default_context[user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2501[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2501[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2501[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2501[1]]), currentlevel#222#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2501[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2501[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2501[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 736, 40} {:message ""} true;
	call add#28_ret#205 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#208#User#235#constr((if (user#2501[0] == 28) then userMapping#647[__this][user#2501[1]] else User235default_context[user#2501[1]])), avaliableWithdrawAmount#2527);
	if ((user#2501[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#2501[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#2501[1]]), add#28_ret#205, downlineCount#210#User#235#constr(userMapping#647[__this][user#2501[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#2501[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#2501[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#2501[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#2501[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#2501[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#2501[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#2501[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#2501[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#2501[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#2501[1]]), add#28_ret#205, downlineCount#210#User#235#constr(User235default_context[user#2501[1]]), nodeCount#212#User#235#constr(User235default_context[user#2501[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#2501[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#2501[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#2501[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#2501[1]]), currentlevel#222#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#2501[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#2501[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#2501[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#2501[1]]), calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#2501[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#2501[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 737, 51} {:message ""} true;
	call add#28_ret#206 := add#28(__this, __msg_sender, __msg_value, totalStaticCommissionWithdrawAmount#367[__this], avaliableSCB#2519);
	totalStaticCommissionWithdrawAmount#367 := totalStaticCommissionWithdrawAmount#367[__this := add#28_ret#206];
	assume {:sourceloc "buggy_24.sol", 738, 52} {:message ""} true;
	call add#28_ret#207 := add#28(__this, __msg_sender, __msg_value, totalDynamicCommissionWithdrawAmount#403[__this], avaliableDCB#2508);
	totalDynamicCommissionWithdrawAmount#403 := totalDynamicCommissionWithdrawAmount#403[__this := add#28_ret#207];
	assume {:sourceloc "buggy_24.sol", 739, 35} {:message ""} true;
	call add#28_ret#208 := add#28(__this, __msg_sender, __msg_value, totalWithdrawAmount#442[__this], avaliableWithdrawAmount#2527);
	totalWithdrawAmount#442 := totalWithdrawAmount#442[__this := add#28_ret#208];
	if ((avaliableSCB#2519 > 0)) {
	call_arg#209 := __msg_sender;
	assume {:sourceloc "buggy_24.sol", 741, 17} {:message ""} true;
	call addStaticCommissionRecord#1795(__this, __msg_sender, __msg_value, call_arg#209, __block_timestamp, avaliableSCB#2519);
	}

	assume {:sourceloc "buggy_24.sol", 743, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableWithdrawAmount#2527);
	}

	$return52:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_24.sol", 746, 1} {:message "counter_re_ent7"} counter_re_ent7#2640: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_24.sol", 747, 1} {:message "FomoFeast::callme_re_ent7"} callme_re_ent7#2669(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#210: int;
	var __send_ret#211: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#2640[__this] <= 5);
	call_arg#210 := 10000000000000000000;
	assume {:sourceloc "buggy_24.sol", 749, 9} {:message ""} true;
	call __send_ret#211 := __send(__msg_sender, __this, 0, call_arg#210);
	if (!(__send_ret#211)) {
	assume false;
	}

	counter_re_ent7#2640 := counter_re_ent7#2640[__this := (counter_re_ent7#2640[__this] + 1)];
	$return53:
	// Function body ends here
}

const unique address_0xddf0bB01f81059CCdB3D5bF5b1C7Bd540aDDFEac: address_t;
// 
// Function: engineerWithdraw
procedure {:sourceloc "buggy_24.sol", 755, 5} {:message "FomoFeast::engineerWithdraw"} engineerWithdraw#2704(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#213: int_arr_ptr;
	var new_array#214: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 756, 9} {:message "avaliableAmount"} avaliableAmount#2675#215: int;
	var add#28_ret#216: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyEngineer starts here
	new_array#214 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#213 := new_array#214;
	mem_arr_int := mem_arr_int[call_arg#213 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 69][5 := 110][6 := 103][7 := 105][8 := 110][9 := 101][10 := 101][11 := 114], 12)];
	assume (__msg_sender == address_0xddf0bB01f81059CCdB3D5bF5b1C7Bd540aDDFEac);
	// Function body starts here
	avaliableAmount#2675#215 := engineerFunds#506[__this];
	if ((avaliableAmount#2675#215 > 0)) {
	engineerFunds#506 := engineerFunds#506[__this := 0];
	assume {:sourceloc "buggy_24.sol", 759, 38} {:message ""} true;
	call add#28_ret#216 := add#28(__this, __msg_sender, __msg_value, engineerWithdrawAmount#540[__this], avaliableAmount#2675#215);
	engineerWithdrawAmount#540 := engineerWithdrawAmount#540[__this := add#28_ret#216];
	assume {:sourceloc "buggy_24.sol", 760, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableAmount#2675#215);
	}

	$return55:
	// Function body ends here
	$return54:
	// Inlined modifier onlyEngineer ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_24.sol", 763, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#2706: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_24.sol", 764, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#2708: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_24.sol", 765, 4} {:message "FomoFeast::buyTicket_re_ent23"} buyTicket_re_ent23#2738(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#217: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 766, 12} {:message ""} true;
	call __send_ret#217 := __send(lastPlayer_re_ent23#2706[__this], __this, 0, jackpot_re_ent23#2708[__this]);
	if (!(__send_ret#217)) {
	assume false;
	}

	lastPlayer_re_ent23#2706 := lastPlayer_re_ent23#2706[__this := __msg_sender];
	jackpot_re_ent23#2708 := jackpot_re_ent23#2708[__this := __balance[__this]];
	$return56:
	// Function body ends here
}

// 
// Function: operatorWithdraw
procedure {:sourceloc "buggy_24.sol", 772, 5} {:message "FomoFeast::operatorWithdraw"} operatorWithdraw#2773(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#219: int_arr_ptr;
	var new_array#220: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 773, 9} {:message "avaliableAmount"} avaliableAmount#2744#221: int;
	var add#28_ret#222: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#220 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#219 := new_array#220;
	mem_arr_int := mem_arr_int[call_arg#219 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#264[__this]);
	// Function body starts here
	avaliableAmount#2744#221 := operatorFunds#572[__this];
	if ((avaliableAmount#2744#221 > 0)) {
	operatorFunds#572 := operatorFunds#572[__this := 0];
	assume {:sourceloc "buggy_24.sol", 776, 38} {:message ""} true;
	call add#28_ret#222 := add#28(__this, __msg_sender, __msg_value, operatorWithdrawAmount#606[__this], avaliableAmount#2744#221);
	operatorWithdrawAmount#606 := operatorWithdrawAmount#606[__this := add#28_ret#222];
	assume {:sourceloc "buggy_24.sol", 777, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, avaliableAmount#2744#221);
	}

	$return58:
	// Function body ends here
	$return57:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_24.sol", 780, 1} {:message "counter_re_ent14"} counter_re_ent14#2776: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_24.sol", 781, 1} {:message "FomoFeast::callme_re_ent14"} callme_re_ent14#2805(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#223: int;
	var __send_ret#224: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#2776[__this] <= 5);
	call_arg#223 := 10000000000000000000;
	assume {:sourceloc "buggy_24.sol", 783, 9} {:message ""} true;
	call __send_ret#224 := __send(__msg_sender, __this, 0, call_arg#223);
	if (!(__send_ret#224)) {
	assume false;
	}

	counter_re_ent14#2776 := counter_re_ent14#2776[__this := (counter_re_ent14#2776[__this] + 1)];
	$return59:
	// Function body ends here
}

// 
// Function: getSummary : function () view returns (uint256[11] memory)
procedure {:sourceloc "buggy_24.sol", 789, 5} {:message "FomoFeast::getSummary"} getSummary#2831(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#2810: int_arr_ptr)
{
	var new_array#225: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#225 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[0 := __balance[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[1 := totalInvestCount#306[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[2 := totalInvestAmount#335[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[3 := totalStaticCommissionWithdrawAmount#367[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[4 := totalDynamicCommissionWithdrawAmount#403[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[5 := totalWithdrawAmount#442[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[6 := totalUserCount#477[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[7 := engineerFunds#506[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[8 := engineerWithdrawAmount#540[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[9 := operatorFunds#572[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225])[10 := operatorWithdrawAmount#606[__this]], length#int_arr#constr(mem_arr_int[new_array#225]))];
	mem_arr_int := mem_arr_int[new_array#225 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#225]), 11)];
	#2810 := new_array#225;
	goto $return60;
	$return60:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_24.sol", 798, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#2833: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_24.sol", 799, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#2835: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_24.sol", 800, 4} {:message "FomoFeast::buyTicket_re_ent30"} buyTicket_re_ent30#2865(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#226: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 801, 12} {:message ""} true;
	call __send_ret#226 := __send(lastPlayer_re_ent30#2833[__this], __this, 0, jackpot_re_ent30#2835[__this]);
	if (!(__send_ret#226)) {
	assume false;
	}

	lastPlayer_re_ent30#2833 := lastPlayer_re_ent30#2833[__this := __msg_sender];
	jackpot_re_ent30#2835 := jackpot_re_ent30#2835[__this := __balance[__this]];
	$return61:
	// Function body ends here
}

// 
// Function: getUserByAddress : function (address) view returns (uint256[16] memory,address)
procedure {:sourceloc "buggy_24.sol", 807, 5} {:message "FomoFeast::getUserByAddress"} getUserByAddress#2925(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#2867: address_t)
	returns (#2872: int_arr_ptr, #2874: address_t)
{
	var {:sourceloc "buggy_24.sol", 809, 9} {:message "user"} user#2877: address_struct_memory_User#235;
	var new_struct_User#227: address_struct_memory_User#235;
	var new_array#228: int_arr_ptr;
	var getAvaliableStaticCommissionAmount#1613_ret#229: int;
	var add#28_ret#230: int;
	var tmp#231: int_arr_ptr;
	var tmp#232: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_struct_User#227 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#2877 := new_struct_User#227;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[user#2877 := totalInvestCount#200#User#235#constr(userMapping#647[__this][userAddress#2867])];
	totalInvestAmount#202 := totalInvestAmount#202[user#2877 := totalInvestAmount#202#User#235#constr(userMapping#647[__this][userAddress#2867])];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[user#2877 := totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][userAddress#2867])];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[user#2877 := totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][userAddress#2867])];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[user#2877 := totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][userAddress#2867])];
	downlineCount#210 := downlineCount#210[user#2877 := downlineCount#210#User#235#constr(userMapping#647[__this][userAddress#2867])];
	nodeCount#212 := nodeCount#212[user#2877 := nodeCount#212#User#235#constr(userMapping#647[__this][userAddress#2867])];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[user#2877 := totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][userAddress#2867])];
	currentInvestTime#216 := currentInvestTime#216[user#2877 := currentInvestTime#216#User#235#constr(userMapping#647[__this][userAddress#2867])];
	currentInvestAmount#218 := currentInvestAmount#218[user#2877 := currentInvestAmount#218#User#235#constr(userMapping#647[__this][userAddress#2867])];
	currentInvestCycle#220 := currentInvestCycle#220[user#2877 := currentInvestCycle#220#User#235#constr(userMapping#647[__this][userAddress#2867])];
	currentlevel#222 := currentlevel#222[user#2877 := currentlevel#222#User#235#constr(userMapping#647[__this][userAddress#2867])];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[user#2877 := currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][userAddress#2867])];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[user#2877 := currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][userAddress#2867])];
	staticCommissionBalance#228 := staticCommissionBalance#228[user#2877 := staticCommissionBalance#228#User#235#constr(userMapping#647[__this][userAddress#2867])];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[user#2877 := dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][userAddress#2867])];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[user#2877 := calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][userAddress#2867])];
	sponsorAddress#234 := sponsorAddress#234[user#2877 := sponsorAddress#234#User#235#constr(userMapping#647[__this][userAddress#2867])];
	new_array#228 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[0 := totalInvestCount#200[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[1 := totalInvestAmount#202[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[2 := totalStaticCommissionWithdrawAmount#204[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[3 := totalDynamicCommissionWithdrawAmount#206[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[4 := totalWithdrawAmount#208[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[5 := downlineCount#210[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[6 := nodeCount#212[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[7 := totalDownlineInvestAmount#214[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[8 := currentInvestTime#216[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[9 := currentInvestAmount#218[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[10 := currentInvestCycle#220[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[11 := currentlevel#222[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[12 := currentStaticCommissionRatio#224[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	assume {:sourceloc "buggy_24.sol", 819, 51} {:message ""} true;
	call getAvaliableStaticCommissionAmount#1613_ret#229 := getAvaliableStaticCommissionAmount#1613(__this, __msg_sender, __msg_value, user#2877);
	assume {:sourceloc "buggy_24.sol", 819, 18} {:message ""} true;
	call add#28_ret#230 := add#28(__this, __msg_sender, __msg_value, staticCommissionBalance#228[user#2877], getAvaliableStaticCommissionAmount#1613_ret#229);
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[13 := add#28_ret#230], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[14 := dynamicCommissionBalance#230[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228])[15 := calcDynamicCommissionAmount#232[user#2877]], length#int_arr#constr(mem_arr_int[new_array#228]))];
	mem_arr_int := mem_arr_int[new_array#228 := int_arr#constr(arr#int_arr#constr(mem_arr_int[new_array#228]), 16)];
	tmp#231 := new_array#228;
	tmp#232 := sponsorAddress#234[user#2877];
	#2874 := tmp#232;
	#2872 := tmp#231;
	goto $return62;
	$return62:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 824, 1} {:message "balances_re_ent8"} balances_re_ent8#2929: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_24.sol", 825, 5} {:message "FomoFeast::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#2958(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 826, 11} {:message "success"} success#2933: bool;
	var __call_ret#233: bool;
	var __call_ret#234: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#2929[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#2929[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 826, 28} {:message ""} true;
	call __call_ret#233, __call_ret#234 := __call(__msg_sender, __this, balances_re_ent8#2929[__this][__msg_sender]);
	if (__call_ret#233) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#233)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#2929[__this][__msg_sender])];
	}

	success#2933 := __call_ret#233;
	if (success#2933) {
	balances_re_ent8#2929 := balances_re_ent8#2929[__this := balances_re_ent8#2929[__this][__msg_sender := 0]];
	}

	$return63:
	// Function body ends here
}

// 
// Function: getUserByIndex
procedure {:sourceloc "buggy_24.sol", 831, 5} {:message "FomoFeast::getUserByIndex"} getUserByIndex#2978(__this: address_t, __msg_sender: address_t, __msg_value: int, index#2960: int)
	returns (#2967: int_arr_ptr, #2969: address_t)
{
	var call_arg#236: int_arr_ptr;
	var new_array#237: int_arr_ptr;
	var getUserByAddress#2925_ret#239: int_arr_ptr;
	var getUserByAddress#2925_ret#240: address_t;
	var tmp#241: int_arr_ptr;
	var tmp#242: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#237 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#236 := new_array#237;
	mem_arr_int := mem_arr_int[call_arg#236 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#264[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 833, 16} {:message ""} true;
	call getUserByAddress#2925_ret#239, getUserByAddress#2925_ret#240 := getUserByAddress#2925(__this, __msg_sender, __msg_value, addressMapping#684[__this][index#2960]);
	tmp#241 := getUserByAddress#2925_ret#239;
	tmp#242 := getUserByAddress#2925_ret#240;
	#2969 := tmp#242;
	#2967 := tmp#241;
	goto $return65;
	$return65:
	// Function body ends here
	$return64:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 835, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#2982: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_24.sol", 836, 1} {:message "FomoFeast::claimReward_re_ent39"} claimReward_re_ent39#3018(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 839, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#2995: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#2982[__this][__msg_sender] > 0);
	transferValue_re_ent39#2995 := redeemableEther_re_ent39#2982[__this][__msg_sender];
	assume {:sourceloc "buggy_24.sol", 840, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#2995);
	redeemableEther_re_ent39#2982 := redeemableEther_re_ent39#2982[__this := redeemableEther_re_ent39#2982[__this][__msg_sender := 0]];
	$return66:
	// Function body ends here
}

type address_struct_memory_InvestRecord#242_arr_ptr = int;
type {:datatype} address_struct_memory_InvestRecord#242_arr_type;
function {:constructor} address_struct_memory_InvestRecord#242_arr#constr(arr: [int]address_struct_memory_InvestRecord#242, length: int) returns (address_struct_memory_InvestRecord#242_arr_type);
var mem_arr_address_struct_memory_InvestRecord#242: [address_struct_memory_InvestRecord#242_arr_ptr]address_struct_memory_InvestRecord#242_arr_type;
// 
// Function: getInvestRecords
procedure {:sourceloc "buggy_24.sol", 844, 5} {:message "FomoFeast::getInvestRecords"} {:skipped} getInvestRecords#3188(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#3020: address_t)
	returns (#3025: int_arr_ptr, #3029: int_arr_ptr, #3033: int_arr_ptr, #3037: int_arr_ptr, #3041: int_arr_ptr, #3045: int_arr_ptr, #3049: int_arr_ptr, #3053: int_arr_ptr, #3057: int_arr_ptr);
	modifies initialized#262, owner#264, redeemableEther_re_ent18#268, totalInvestCount#306, balances_re_ent29#310, totalInvestAmount#335, not_called_re_ent6#338, totalStaticCommissionWithdrawAmount#367, lastPlayer_re_ent16#369, jackpot_re_ent16#371, totalDynamicCommissionWithdrawAmount#403, balances_re_ent24#407, totalWithdrawAmount#442, userBalance_re_ent5#446, totalUserCount#477, balances_re_ent15#481, engineerFunds#506, counter_re_ent28#509, engineerWithdrawAmount#540, not_called_re_ent34#543, operatorFunds#572, counter_re_ent21#575, operatorWithdrawAmount#606, balances_re_ent10#610, userMapping#647, balances_re_ent21#651, addressMapping#684, userBalance_re_ent12#688, investRecordMapping#723, redeemableEther_re_ent11#727, staticCommissionRecordMapping#769, balances_re_ent1#773, dynamicCommissionRecordMapping#808, not_called_re_ent41#859, counter_re_ent42#897, lastPlayer_re_ent2#976, jackpot_re_ent2#978, balances_re_ent17#1049, lastPlayer_re_ent37#1114, jackpot_re_ent37#1116, balances_re_ent3#1218, lastPlayer_re_ent9#1349, jackpot_re_ent9#1351, redeemableEther_re_ent25#1508, userBalance_re_ent19#1617, userBalance_re_ent26#1707, not_called_re_ent20#1798, redeemableEther_re_ent32#1883, balances_re_ent38#2312, redeemableEther_re_ent4#2461, counter_re_ent7#2640, lastPlayer_re_ent23#2706, jackpot_re_ent23#2708, counter_re_ent14#2776, lastPlayer_re_ent30#2833, jackpot_re_ent30#2835, balances_re_ent8#2929, redeemableEther_re_ent39#2982, balances_re_ent36#3192, counter_re_ent35#3352, userBalance_re_ent40#3519, userBalance_re_ent33#3827, not_called_re_ent27#3903, balances_re_ent31#4136, not_called_re_ent13#4234;

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 864, 1} {:message "balances_re_ent36"} balances_re_ent36#3192: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_24.sol", 865, 5} {:message "FomoFeast::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#3215(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#262: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_24.sol", 866, 14} {:message ""} true;
	call __send_ret#262 := __send(__msg_sender, __this, 0, balances_re_ent36#3192[__this][__msg_sender]);
	if (__send_ret#262) {
	balances_re_ent36#3192 := balances_re_ent36#3192[__this := balances_re_ent36#3192[__this][__msg_sender := 0]];
	}

	$return68:
	// Function body ends here
}

type address_struct_memory_CommissionRecord#247_arr_ptr = int;
type {:datatype} address_struct_memory_CommissionRecord#247_arr_type;
function {:constructor} address_struct_memory_CommissionRecord#247_arr#constr(arr: [int]address_struct_memory_CommissionRecord#247, length: int) returns (address_struct_memory_CommissionRecord#247_arr_type);
var mem_arr_address_struct_memory_CommissionRecord#247: [address_struct_memory_CommissionRecord#247_arr_ptr]address_struct_memory_CommissionRecord#247_arr_type;
// 
// Function: getStaticCommissionRecords
procedure {:sourceloc "buggy_24.sol", 870, 5} {:message "FomoFeast::getStaticCommissionRecords"} {:skipped} getStaticCommissionRecords#3349(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#3217: address_t)
	returns (#3222: int_arr_ptr, #3226: int_arr_ptr, #3230: int_arr_ptr, #3234: int_arr_ptr, #3238: int_arr_ptr, #3242: int_arr_ptr, #3246: int_arr_ptr, #3250: int_arr_ptr, #3254: int_arr_ptr);
	modifies initialized#262, owner#264, redeemableEther_re_ent18#268, totalInvestCount#306, balances_re_ent29#310, totalInvestAmount#335, not_called_re_ent6#338, totalStaticCommissionWithdrawAmount#367, lastPlayer_re_ent16#369, jackpot_re_ent16#371, totalDynamicCommissionWithdrawAmount#403, balances_re_ent24#407, totalWithdrawAmount#442, userBalance_re_ent5#446, totalUserCount#477, balances_re_ent15#481, engineerFunds#506, counter_re_ent28#509, engineerWithdrawAmount#540, not_called_re_ent34#543, operatorFunds#572, counter_re_ent21#575, operatorWithdrawAmount#606, balances_re_ent10#610, userMapping#647, balances_re_ent21#651, addressMapping#684, userBalance_re_ent12#688, investRecordMapping#723, redeemableEther_re_ent11#727, staticCommissionRecordMapping#769, balances_re_ent1#773, dynamicCommissionRecordMapping#808, not_called_re_ent41#859, counter_re_ent42#897, lastPlayer_re_ent2#976, jackpot_re_ent2#978, balances_re_ent17#1049, lastPlayer_re_ent37#1114, jackpot_re_ent37#1116, balances_re_ent3#1218, lastPlayer_re_ent9#1349, jackpot_re_ent9#1351, redeemableEther_re_ent25#1508, userBalance_re_ent19#1617, userBalance_re_ent26#1707, not_called_re_ent20#1798, redeemableEther_re_ent32#1883, balances_re_ent38#2312, redeemableEther_re_ent4#2461, counter_re_ent7#2640, lastPlayer_re_ent23#2706, jackpot_re_ent23#2708, counter_re_ent14#2776, lastPlayer_re_ent30#2833, jackpot_re_ent30#2835, balances_re_ent8#2929, redeemableEther_re_ent39#2982, balances_re_ent36#3192, counter_re_ent35#3352, userBalance_re_ent40#3519, userBalance_re_ent33#3827, not_called_re_ent27#3903, balances_re_ent31#4136, not_called_re_ent13#4234;

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_24.sol", 890, 1} {:message "counter_re_ent35"} counter_re_ent35#3352: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_24.sol", 891, 1} {:message "FomoFeast::callme_re_ent35"} callme_re_ent35#3381(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#282: int;
	var __send_ret#283: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#3352[__this] <= 5);
	call_arg#282 := 10000000000000000000;
	assume {:sourceloc "buggy_24.sol", 893, 9} {:message ""} true;
	call __send_ret#283 := __send(__msg_sender, __this, 0, call_arg#282);
	if (!(__send_ret#283)) {
	assume false;
	}

	counter_re_ent35#3352 := counter_re_ent35#3352[__this := (counter_re_ent35#3352[__this] + 1)];
	$return70:
	// Function body ends here
}

// 
// Function: getDynamicCommissionRecords
procedure {:sourceloc "buggy_24.sol", 899, 5} {:message "FomoFeast::getDynamicCommissionRecords"} {:skipped} getDynamicCommissionRecords#3515(__this: address_t, __msg_sender: address_t, __msg_value: int, userAddress#3383: address_t)
	returns (#3388: int_arr_ptr, #3392: int_arr_ptr, #3396: int_arr_ptr, #3400: int_arr_ptr, #3404: int_arr_ptr, #3408: int_arr_ptr, #3412: int_arr_ptr, #3416: int_arr_ptr, #3420: int_arr_ptr);
	modifies initialized#262, owner#264, redeemableEther_re_ent18#268, totalInvestCount#306, balances_re_ent29#310, totalInvestAmount#335, not_called_re_ent6#338, totalStaticCommissionWithdrawAmount#367, lastPlayer_re_ent16#369, jackpot_re_ent16#371, totalDynamicCommissionWithdrawAmount#403, balances_re_ent24#407, totalWithdrawAmount#442, userBalance_re_ent5#446, totalUserCount#477, balances_re_ent15#481, engineerFunds#506, counter_re_ent28#509, engineerWithdrawAmount#540, not_called_re_ent34#543, operatorFunds#572, counter_re_ent21#575, operatorWithdrawAmount#606, balances_re_ent10#610, userMapping#647, balances_re_ent21#651, addressMapping#684, userBalance_re_ent12#688, investRecordMapping#723, redeemableEther_re_ent11#727, staticCommissionRecordMapping#769, balances_re_ent1#773, dynamicCommissionRecordMapping#808, not_called_re_ent41#859, counter_re_ent42#897, lastPlayer_re_ent2#976, jackpot_re_ent2#978, balances_re_ent17#1049, lastPlayer_re_ent37#1114, jackpot_re_ent37#1116, balances_re_ent3#1218, lastPlayer_re_ent9#1349, jackpot_re_ent9#1351, redeemableEther_re_ent25#1508, userBalance_re_ent19#1617, userBalance_re_ent26#1707, not_called_re_ent20#1798, redeemableEther_re_ent32#1883, balances_re_ent38#2312, redeemableEther_re_ent4#2461, counter_re_ent7#2640, lastPlayer_re_ent23#2706, jackpot_re_ent23#2708, counter_re_ent14#2776, lastPlayer_re_ent30#2833, jackpot_re_ent30#2835, balances_re_ent8#2929, redeemableEther_re_ent39#2982, balances_re_ent36#3192, counter_re_ent35#3352, userBalance_re_ent40#3519, userBalance_re_ent33#3827, not_called_re_ent27#3903, balances_re_ent31#4136, not_called_re_ent13#4234;

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 919, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#3519: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_24.sol", 920, 1} {:message "FomoFeast::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#3553(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 923, 10} {:message "success"} success#3523: bool;
	var __call_ret#303: bool;
	var __call_ret#304: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#3519[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#3519[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 923, 25} {:message ""} true;
	call __call_ret#303, __call_ret#304 := __call(__msg_sender, __this, userBalance_re_ent40#3519[__this][__msg_sender]);
	if (__call_ret#303) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#303)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#3519[__this][__msg_sender])];
	}

	success#3523 := __call_ret#303;
	if (!(success#3523)) {
	assume false;
	}

	userBalance_re_ent40#3519 := userBalance_re_ent40#3519[__this := userBalance_re_ent40#3519[__this][__msg_sender := 0]];
	$return72:
	// Function body ends here
}

// 
// Function: calcDynamicCommission
procedure {:sourceloc "buggy_24.sol", 930, 5} {:message "FomoFeast::calcDynamicCommission"} calcDynamicCommission#3823(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#306: int_arr_ptr;
	var new_array#307: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 931, 14} {:message "i"} i#3559#308: int;
	var user#3569#308: [int]int;
	var tmp#311: int;
	var {:sourceloc "buggy_24.sol", 936, 14} {:message "i"} i#3585#308: int;
	var {:sourceloc "buggy_24.sol", 937, 13} {:message "user"} user#3595#308: address_struct_memory_User#235;
	var new_struct_User#314: address_struct_memory_User#235;
	var {:sourceloc "buggy_24.sol", 939, 17} {:message "commissionDays"} commissionDays#3607#308: int;
	var sub#45_ret#315: int;
	var div#125_ret#316: int;
	var {:sourceloc "buggy_24.sol", 941, 21} {:message "depth"} depth#3627#308: int;
	var {:sourceloc "buggy_24.sol", 942, 21} {:message "addressWalker"} addressWalker#3631#308: address_t;
	var sponsor#3639#308: [int]int;
	var {:sourceloc "buggy_24.sol", 946, 29} {:message "dynamicCommissionRatio"} dynamicCommissionRatio#3649#308: int;
	var call_arg#319: address_struct_memory_User#235;
	var new_struct_User#320: address_struct_memory_User#235;
	var getDynamicCommissionRatio#1504_ret#321: int;
	var {:sourceloc "buggy_24.sol", 948, 33} {:message "dynamicCA"} dynamicCA#3659#308: int;
	var mul#108_ret#322: int;
	var mul#108_ret#323: int;
	var call_arg#324: int;
	var mul#108_ret#325: int;
	var call_arg#326: int;
	var div#125_ret#327: int;
	var call_arg#328: int;
	var mul#108_ret#329: int;
	var call_arg#330: int;
	var div#125_ret#331: int;
	var call_arg#332: int;
	var div#125_ret#333: int;
	var add#28_ret#334: int;
	var call_arg#335: int;
	var add#28_ret#336: int;
	var tmp#337: int;
	var {:sourceloc "buggy_24.sol", 971, 14} {:message "i"} i#3774#308: int;
	var {:sourceloc "buggy_24.sol", 972, 13} {:message "userAddress"} userAddress#3784#308: address_t;
	var user#3790#308: [int]int;
	var add#28_ret#340: int;
	var tmp#341: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#307 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#306 := new_array#307;
	mem_arr_int := mem_arr_int[call_arg#306 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#264[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#3559#308 := 0;
	while ((i#3559#308 < totalUserCount#477[__this])) {
	// Body
	user#3569#308 := default_int_int()[0 := 28][1 := addressMapping#684[__this][i#3559#308]];
	if ((user#3569#308[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#3569#308[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#3569#308[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#3569#308[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#3569#308[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#3569#308[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#3569#308[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#3569#308[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#3569#308[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#3569#308[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#3569#308[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#3569#308[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#3569#308[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#3569#308[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#3569#308[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#3569#308[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#3569#308[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#3569#308[1]]), 0, sponsorAddress#234#User#235#constr(userMapping#647[__this][user#3569#308[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#3569#308[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#3569#308[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#3569#308[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#3569#308[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#3569#308[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#3569#308[1]]), downlineCount#210#User#235#constr(User235default_context[user#3569#308[1]]), nodeCount#212#User#235#constr(User235default_context[user#3569#308[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#3569#308[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#3569#308[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#3569#308[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#3569#308[1]]), currentlevel#222#User#235#constr(User235default_context[user#3569#308[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#3569#308[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#3569#308[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#3569#308[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#3569#308[1]]), 0, sponsorAddress#234#User#235#constr(User235default_context[user#3569#308[1]]))];
	}

	$continue309:
	// Loop expression
	i#3559#308 := (i#3559#308 + 1);
	tmp#311 := i#3559#308;
	}

	break310:
	// The following while loop was mapped from a for loop
	// Initialization
	i#3585#308 := 0;
	while ((i#3585#308 < totalUserCount#477[__this])) {
	// Body
	new_struct_User#314 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#3595#308 := new_struct_User#314;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[user#3595#308 := totalInvestCount#200#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	totalInvestAmount#202 := totalInvestAmount#202[user#3595#308 := totalInvestAmount#202#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[user#3595#308 := totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[user#3595#308 := totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[user#3595#308 := totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	downlineCount#210 := downlineCount#210[user#3595#308 := downlineCount#210#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	nodeCount#212 := nodeCount#212[user#3595#308 := nodeCount#212#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[user#3595#308 := totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	currentInvestTime#216 := currentInvestTime#216[user#3595#308 := currentInvestTime#216#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	currentInvestAmount#218 := currentInvestAmount#218[user#3595#308 := currentInvestAmount#218#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	currentInvestCycle#220 := currentInvestCycle#220[user#3595#308 := currentInvestCycle#220#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	currentlevel#222 := currentlevel#222[user#3595#308 := currentlevel#222#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[user#3595#308 := currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[user#3595#308 := currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	staticCommissionBalance#228 := staticCommissionBalance#228[user#3595#308 := staticCommissionBalance#228#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[user#3595#308 := dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[user#3595#308 := calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	sponsorAddress#234 := sponsorAddress#234[user#3595#308 := sponsorAddress#234#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3585#308]])];
	if ((currentInvestAmount#218[user#3595#308] > 0)) {
	assume {:sourceloc "buggy_24.sol", 939, 42} {:message ""} true;
	call sub#45_ret#315 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#216[user#3595#308]);
	assume {:sourceloc "buggy_24.sol", 939, 42} {:message ""} true;
	call div#125_ret#316 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#315, 86400);
	commissionDays#3607#308 := div#125_ret#316;
	if (((commissionDays#3607#308 >= 1) && (commissionDays#3607#308 <= currentInvestCycle#220[user#3595#308]))) {
	depth#3627#308 := 1;
	addressWalker#3631#308 := sponsorAddress#234[user#3595#308];
	while ((addressWalker#3631#308 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#3639#308 := default_int_int()[0 := 28][1 := addressWalker#3631#308];
	if ((currentInvestAmount#218#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]])) > 0)) {
	new_struct_User#320 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#319 := new_struct_User#320;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[call_arg#319 := totalInvestCount#200#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	totalInvestAmount#202 := totalInvestAmount#202[call_arg#319 := totalInvestAmount#202#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[call_arg#319 := totalStaticCommissionWithdrawAmount#204#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[call_arg#319 := totalDynamicCommissionWithdrawAmount#206#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[call_arg#319 := totalWithdrawAmount#208#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	downlineCount#210 := downlineCount#210[call_arg#319 := downlineCount#210#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	nodeCount#212 := nodeCount#212[call_arg#319 := nodeCount#212#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[call_arg#319 := totalDownlineInvestAmount#214#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	currentInvestTime#216 := currentInvestTime#216[call_arg#319 := currentInvestTime#216#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	currentInvestAmount#218 := currentInvestAmount#218[call_arg#319 := currentInvestAmount#218#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	currentInvestCycle#220 := currentInvestCycle#220[call_arg#319 := currentInvestCycle#220#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	currentlevel#222 := currentlevel#222[call_arg#319 := currentlevel#222#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[call_arg#319 := currentStaticCommissionRatio#224#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[call_arg#319 := currentStaticCommissionWithdrawAmount#226#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	staticCommissionBalance#228 := staticCommissionBalance#228[call_arg#319 := staticCommissionBalance#228#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[call_arg#319 := dynamicCommissionBalance#230#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[call_arg#319 := calcDynamicCommissionAmount#232#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	sponsorAddress#234 := sponsorAddress#234[call_arg#319 := sponsorAddress#234#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]))];
	assume {:sourceloc "buggy_24.sol", 946, 62} {:message ""} true;
	call getDynamicCommissionRatio#1504_ret#321 := getDynamicCommissionRatio#1504(__this, __msg_sender, __msg_value, call_arg#319, depth#3627#308);
	dynamicCommissionRatio#3649#308 := getDynamicCommissionRatio#1504_ret#321;
	if ((dynamicCommissionRatio#3649#308 > 0)) {
	dynamicCA#3659#308 := currentInvestAmount#218#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]));
	if ((dynamicCA#3659#308 > currentInvestAmount#218[user#3595#308])) {
	dynamicCA#3659#308 := currentInvestAmount#218[user#3595#308];
	}

	assume {:sourceloc "buggy_24.sol", 952, 45} {:message ""} true;
	call mul#108_ret#322 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3659#308, currentStaticCommissionRatio#224[user#3595#308]);
	dynamicCA#3659#308 := mul#108_ret#322;
	assume {:sourceloc "buggy_24.sol", 953, 45} {:message ""} true;
	call mul#108_ret#323 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3659#308, dynamicCommissionRatio#3649#308);
	dynamicCA#3659#308 := mul#108_ret#323;
	if ((currentlevel#222#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]])) == 1)) {
	call_arg#324 := 3;
	assume {:sourceloc "buggy_24.sol", 955, 49} {:message ""} true;
	call mul#108_ret#325 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3659#308, call_arg#324);
	call_arg#326 := 1000000;
	assume {:sourceloc "buggy_24.sol", 955, 49} {:message ""} true;
	call div#125_ret#327 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#325, call_arg#326);
	dynamicCA#3659#308 := div#125_ret#327;
	}
	else {
	if ((currentlevel#222#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]])) == 2)) {
	call_arg#328 := 6;
	assume {:sourceloc "buggy_24.sol", 957, 49} {:message ""} true;
	call mul#108_ret#329 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#3659#308, call_arg#328);
	call_arg#330 := 1000000;
	assume {:sourceloc "buggy_24.sol", 957, 49} {:message ""} true;
	call div#125_ret#331 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#329, call_arg#330);
	dynamicCA#3659#308 := div#125_ret#331;
	}
	else {
	call_arg#332 := 100000;
	assume {:sourceloc "buggy_24.sol", 959, 49} {:message ""} true;
	call div#125_ret#333 := div#125(__this, __msg_sender, __msg_value, dynamicCA#3659#308, call_arg#332);
	dynamicCA#3659#308 := div#125_ret#333;
	}

	}

	assume {:sourceloc "buggy_24.sol", 961, 71} {:message ""} true;
	call add#28_ret#334 := add#28(__this, __msg_sender, __msg_value, calcDynamicCommissionAmount#232#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]])), dynamicCA#3659#308);
	if ((sponsor#3639#308[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][sponsor#3639#308[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]), add#28_ret#334, sponsorAddress#234#User#235#constr(userMapping#647[__this][sponsor#3639#308[1]]))]];
	}
	else {
	User235default_context := User235default_context[sponsor#3639#308[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[sponsor#3639#308[1]]), totalInvestAmount#202#User#235#constr(User235default_context[sponsor#3639#308[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[sponsor#3639#308[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[sponsor#3639#308[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[sponsor#3639#308[1]]), downlineCount#210#User#235#constr(User235default_context[sponsor#3639#308[1]]), nodeCount#212#User#235#constr(User235default_context[sponsor#3639#308[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[sponsor#3639#308[1]]), currentInvestTime#216#User#235#constr(User235default_context[sponsor#3639#308[1]]), currentInvestAmount#218#User#235#constr(User235default_context[sponsor#3639#308[1]]), currentInvestCycle#220#User#235#constr(User235default_context[sponsor#3639#308[1]]), currentlevel#222#User#235#constr(User235default_context[sponsor#3639#308[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[sponsor#3639#308[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[sponsor#3639#308[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[sponsor#3639#308[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[sponsor#3639#308[1]]), add#28_ret#334, sponsorAddress#234#User#235#constr(User235default_context[sponsor#3639#308[1]]))];
	}

	}

	}

	addressWalker#3631#308 := sponsorAddress#234#User#235#constr((if (sponsor#3639#308[0] == 28) then userMapping#647[__this][sponsor#3639#308[1]] else User235default_context[sponsor#3639#308[1]]));
	call_arg#335 := 1;
	assume {:sourceloc "buggy_24.sol", 965, 33} {:message ""} true;
	call add#28_ret#336 := add#28(__this, __msg_sender, __msg_value, depth#3627#308, call_arg#335);
	depth#3627#308 := add#28_ret#336;
	$continue317:
	}

	break318:
	}

	}

	$continue312:
	// Loop expression
	i#3585#308 := (i#3585#308 + 1);
	tmp#337 := i#3585#308;
	}

	break313:
	// The following while loop was mapped from a for loop
	// Initialization
	i#3774#308 := 0;
	while ((i#3774#308 < totalUserCount#477[__this])) {
	// Body
	userAddress#3784#308 := addressMapping#684[__this][i#3774#308];
	user#3790#308 := default_int_int()[0 := 28][1 := userAddress#3784#308];
	if ((calcDynamicCommissionAmount#232#User#235#constr((if (user#3790#308[0] == 28) then userMapping#647[__this][user#3790#308[1]] else User235default_context[user#3790#308[1]])) > 0)) {
	assume {:sourceloc "buggy_24.sol", 975, 49} {:message ""} true;
	call add#28_ret#340 := add#28(__this, __msg_sender, __msg_value, dynamicCommissionBalance#230#User#235#constr((if (user#3790#308[0] == 28) then userMapping#647[__this][user#3790#308[1]] else User235default_context[user#3790#308[1]])), calcDynamicCommissionAmount#232#User#235#constr((if (user#3790#308[0] == 28) then userMapping#647[__this][user#3790#308[1]] else User235default_context[user#3790#308[1]])));
	if ((user#3790#308[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#3790#308[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#3790#308[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#3790#308[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#3790#308[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#3790#308[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#3790#308[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#3790#308[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#3790#308[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#3790#308[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#3790#308[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#3790#308[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#3790#308[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#3790#308[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#3790#308[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#3790#308[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#3790#308[1]]), add#28_ret#340, calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#3790#308[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#3790#308[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#3790#308[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#3790#308[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#3790#308[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#3790#308[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#3790#308[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#3790#308[1]]), downlineCount#210#User#235#constr(User235default_context[user#3790#308[1]]), nodeCount#212#User#235#constr(User235default_context[user#3790#308[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#3790#308[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#3790#308[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#3790#308[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#3790#308[1]]), currentlevel#222#User#235#constr(User235default_context[user#3790#308[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#3790#308[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#3790#308[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#3790#308[1]]), add#28_ret#340, calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#3790#308[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#3790#308[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 976, 17} {:message ""} true;
	call addDynamicCommissionRecord#1879(__this, __msg_sender, __msg_value, userAddress#3784#308, __block_timestamp, calcDynamicCommissionAmount#232#User#235#constr((if (user#3790#308[0] == 28) then userMapping#647[__this][user#3790#308[1]] else User235default_context[user#3790#308[1]])));
	}

	$continue338:
	// Loop expression
	i#3774#308 := (i#3774#308 + 1);
	tmp#341 := i#3774#308;
	}

	break339:
	$return74:
	// Function body ends here
	$return73:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 980, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#3827: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_24.sol", 981, 1} {:message "FomoFeast::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#3861(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 984, 3} {:message "success"} success#3831: bool;
	var __call_ret#342: bool;
	var __call_ret#343: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#3827[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#3827[__this][__msg_sender])];
	assume {:sourceloc "buggy_24.sol", 984, 19} {:message ""} true;
	call __call_ret#342, __call_ret#343 := __call(__msg_sender, __this, userBalance_re_ent33#3827[__this][__msg_sender]);
	if (__call_ret#342) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#342)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#3827[__this][__msg_sender])];
	}

	success#3831 := __call_ret#342;
	if (!(success#3831)) {
	assume false;
	}

	userBalance_re_ent33#3827 := userBalance_re_ent33#3827[__this := userBalance_re_ent33#3827[__this][__msg_sender := 0]];
	$return75:
	// Function body ends here
}

// 
// Function: calcDynamicCommissionBegin
procedure {:sourceloc "buggy_24.sol", 991, 5} {:message "FomoFeast::calcDynamicCommissionBegin"} calcDynamicCommissionBegin#3900(__this: address_t, __msg_sender: address_t, __msg_value: int, index#3863: int, length#3865: int)
{
	var call_arg#345: int_arr_ptr;
	var new_array#346: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 992, 14} {:message "i"} i#3871#347: int;
	var user#3884#347: [int]int;
	var tmp#350: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#346 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#345 := new_array#346;
	mem_arr_int := mem_arr_int[call_arg#345 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#264[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#3871#347 := index#3863;
	while ((i#3871#347 < (index#3863 + length#3865))) {
	// Body
	user#3884#347 := default_int_int()[0 := 28][1 := addressMapping#684[__this][i#3871#347]];
	if ((user#3884#347[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#3884#347[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#3884#347[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#3884#347[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#3884#347[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#3884#347[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#3884#347[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#3884#347[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#3884#347[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#3884#347[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#3884#347[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#3884#347[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#3884#347[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#3884#347[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#3884#347[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#3884#347[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#3884#347[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][user#3884#347[1]]), 0, sponsorAddress#234#User#235#constr(userMapping#647[__this][user#3884#347[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#3884#347[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#3884#347[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#3884#347[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#3884#347[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#3884#347[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#3884#347[1]]), downlineCount#210#User#235#constr(User235default_context[user#3884#347[1]]), nodeCount#212#User#235#constr(User235default_context[user#3884#347[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#3884#347[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#3884#347[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#3884#347[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#3884#347[1]]), currentlevel#222#User#235#constr(User235default_context[user#3884#347[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#3884#347[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#3884#347[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#3884#347[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[user#3884#347[1]]), 0, sponsorAddress#234#User#235#constr(User235default_context[user#3884#347[1]]))];
	}

	$continue348:
	// Loop expression
	i#3871#347 := (i#3871#347 + 1);
	tmp#350 := i#3871#347;
	}

	break349:
	$return77:
	// Function body ends here
	$return76:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_24.sol", 997, 1} {:message "not_called_re_ent27"} not_called_re_ent27#3903: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_24.sol", 998, 1} {:message "FomoFeast::bug_re_ent27"} bug_re_ent27#3930(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#351: int;
	var __send_ret#352: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#3903[__this];
	call_arg#351 := 1000000000000000000;
	assume {:sourceloc "buggy_24.sol", 1000, 16} {:message ""} true;
	call __send_ret#352 := __send(__msg_sender, __this, 0, call_arg#351);
	if (!(__send_ret#352)) {
	assume false;
	}

	not_called_re_ent27#3903 := not_called_re_ent27#3903[__this := false];
	$return78:
	// Function body ends here
}

// 
// Function: calcDynamicCommissionRange
procedure {:sourceloc "buggy_24.sol", 1006, 5} {:message "FomoFeast::calcDynamicCommissionRange"} calcDynamicCommissionRange#4132(__this: address_t, __msg_sender: address_t, __msg_value: int, index#3932: int, length#3934: int)
{
	var call_arg#354: int_arr_ptr;
	var new_array#355: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 1007, 14} {:message "i"} i#3940#356: int;
	var {:sourceloc "buggy_24.sol", 1008, 13} {:message "user"} user#3953#356: address_struct_memory_User#235;
	var new_struct_User#359: address_struct_memory_User#235;
	var {:sourceloc "buggy_24.sol", 1010, 17} {:message "commissionDays"} commissionDays#3965#356: int;
	var sub#45_ret#360: int;
	var div#125_ret#361: int;
	var {:sourceloc "buggy_24.sol", 1012, 21} {:message "depth"} depth#3985#356: int;
	var {:sourceloc "buggy_24.sol", 1013, 21} {:message "addressWalker"} addressWalker#3989#356: address_t;
	var sponsor#3997#356: [int]int;
	var {:sourceloc "buggy_24.sol", 1017, 29} {:message "dynamicCommissionRatio"} dynamicCommissionRatio#4007#356: int;
	var call_arg#364: address_struct_memory_User#235;
	var new_struct_User#365: address_struct_memory_User#235;
	var getDynamicCommissionRatio#1504_ret#366: int;
	var {:sourceloc "buggy_24.sol", 1019, 33} {:message "dynamicCA"} dynamicCA#4017#356: int;
	var mul#108_ret#367: int;
	var mul#108_ret#368: int;
	var call_arg#369: int;
	var mul#108_ret#370: int;
	var call_arg#371: int;
	var div#125_ret#372: int;
	var call_arg#373: int;
	var mul#108_ret#374: int;
	var call_arg#375: int;
	var div#125_ret#376: int;
	var call_arg#377: int;
	var div#125_ret#378: int;
	var add#28_ret#379: int;
	var call_arg#380: int;
	var add#28_ret#381: int;
	var tmp#382: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#355 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#354 := new_array#355;
	mem_arr_int := mem_arr_int[call_arg#354 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#264[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#3940#356 := index#3932;
	while ((i#3940#356 < (index#3932 + length#3934))) {
	// Body
	new_struct_User#359 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	user#3953#356 := new_struct_User#359;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[user#3953#356 := totalInvestCount#200#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	totalInvestAmount#202 := totalInvestAmount#202[user#3953#356 := totalInvestAmount#202#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[user#3953#356 := totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[user#3953#356 := totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[user#3953#356 := totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	downlineCount#210 := downlineCount#210[user#3953#356 := downlineCount#210#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	nodeCount#212 := nodeCount#212[user#3953#356 := nodeCount#212#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[user#3953#356 := totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	currentInvestTime#216 := currentInvestTime#216[user#3953#356 := currentInvestTime#216#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	currentInvestAmount#218 := currentInvestAmount#218[user#3953#356 := currentInvestAmount#218#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	currentInvestCycle#220 := currentInvestCycle#220[user#3953#356 := currentInvestCycle#220#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	currentlevel#222 := currentlevel#222[user#3953#356 := currentlevel#222#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[user#3953#356 := currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[user#3953#356 := currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	staticCommissionBalance#228 := staticCommissionBalance#228[user#3953#356 := staticCommissionBalance#228#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[user#3953#356 := dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[user#3953#356 := calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	sponsorAddress#234 := sponsorAddress#234[user#3953#356 := sponsorAddress#234#User#235#constr(userMapping#647[__this][addressMapping#684[__this][i#3940#356]])];
	if ((currentInvestAmount#218[user#3953#356] > 0)) {
	assume {:sourceloc "buggy_24.sol", 1010, 42} {:message ""} true;
	call sub#45_ret#360 := sub#45(__this, __msg_sender, __msg_value, __block_timestamp, currentInvestTime#216[user#3953#356]);
	assume {:sourceloc "buggy_24.sol", 1010, 42} {:message ""} true;
	call div#125_ret#361 := div#125(__this, __msg_sender, __msg_value, sub#45_ret#360, 86400);
	commissionDays#3965#356 := div#125_ret#361;
	if (((commissionDays#3965#356 >= 1) && (commissionDays#3965#356 <= currentInvestCycle#220[user#3953#356]))) {
	depth#3985#356 := 1;
	addressWalker#3989#356 := sponsorAddress#234[user#3953#356];
	while ((addressWalker#3989#356 != address_0xe00d13D53Ba180EAD5F4838BD56b15629026A8C9)) {
	sponsor#3997#356 := default_int_int()[0 := 28][1 := addressWalker#3989#356];
	if ((currentInvestAmount#218#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]])) > 0)) {
	new_struct_User#365 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#364 := new_struct_User#365;
	// Deep copy struct User
	totalInvestCount#200 := totalInvestCount#200[call_arg#364 := totalInvestCount#200#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	totalInvestAmount#202 := totalInvestAmount#202[call_arg#364 := totalInvestAmount#202#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	totalStaticCommissionWithdrawAmount#204 := totalStaticCommissionWithdrawAmount#204[call_arg#364 := totalStaticCommissionWithdrawAmount#204#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	totalDynamicCommissionWithdrawAmount#206 := totalDynamicCommissionWithdrawAmount#206[call_arg#364 := totalDynamicCommissionWithdrawAmount#206#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	totalWithdrawAmount#208 := totalWithdrawAmount#208[call_arg#364 := totalWithdrawAmount#208#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	downlineCount#210 := downlineCount#210[call_arg#364 := downlineCount#210#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	nodeCount#212 := nodeCount#212[call_arg#364 := nodeCount#212#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	totalDownlineInvestAmount#214 := totalDownlineInvestAmount#214[call_arg#364 := totalDownlineInvestAmount#214#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	currentInvestTime#216 := currentInvestTime#216[call_arg#364 := currentInvestTime#216#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	currentInvestAmount#218 := currentInvestAmount#218[call_arg#364 := currentInvestAmount#218#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	currentInvestCycle#220 := currentInvestCycle#220[call_arg#364 := currentInvestCycle#220#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	currentlevel#222 := currentlevel#222[call_arg#364 := currentlevel#222#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	currentStaticCommissionRatio#224 := currentStaticCommissionRatio#224[call_arg#364 := currentStaticCommissionRatio#224#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	currentStaticCommissionWithdrawAmount#226 := currentStaticCommissionWithdrawAmount#226[call_arg#364 := currentStaticCommissionWithdrawAmount#226#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	staticCommissionBalance#228 := staticCommissionBalance#228[call_arg#364 := staticCommissionBalance#228#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	dynamicCommissionBalance#230 := dynamicCommissionBalance#230[call_arg#364 := dynamicCommissionBalance#230#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	calcDynamicCommissionAmount#232 := calcDynamicCommissionAmount#232[call_arg#364 := calcDynamicCommissionAmount#232#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	sponsorAddress#234 := sponsorAddress#234[call_arg#364 := sponsorAddress#234#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]))];
	assume {:sourceloc "buggy_24.sol", 1017, 62} {:message ""} true;
	call getDynamicCommissionRatio#1504_ret#366 := getDynamicCommissionRatio#1504(__this, __msg_sender, __msg_value, call_arg#364, depth#3985#356);
	dynamicCommissionRatio#4007#356 := getDynamicCommissionRatio#1504_ret#366;
	if ((dynamicCommissionRatio#4007#356 > 0)) {
	dynamicCA#4017#356 := currentInvestAmount#218#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]));
	if ((dynamicCA#4017#356 > currentInvestAmount#218[user#3953#356])) {
	dynamicCA#4017#356 := currentInvestAmount#218[user#3953#356];
	}

	assume {:sourceloc "buggy_24.sol", 1023, 45} {:message ""} true;
	call mul#108_ret#367 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#4017#356, currentStaticCommissionRatio#224[user#3953#356]);
	dynamicCA#4017#356 := mul#108_ret#367;
	assume {:sourceloc "buggy_24.sol", 1024, 45} {:message ""} true;
	call mul#108_ret#368 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#4017#356, dynamicCommissionRatio#4007#356);
	dynamicCA#4017#356 := mul#108_ret#368;
	if ((currentlevel#222#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]])) == 1)) {
	call_arg#369 := 3;
	assume {:sourceloc "buggy_24.sol", 1026, 49} {:message ""} true;
	call mul#108_ret#370 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#4017#356, call_arg#369);
	call_arg#371 := 1000000;
	assume {:sourceloc "buggy_24.sol", 1026, 49} {:message ""} true;
	call div#125_ret#372 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#370, call_arg#371);
	dynamicCA#4017#356 := div#125_ret#372;
	}
	else {
	if ((currentlevel#222#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]])) == 2)) {
	call_arg#373 := 6;
	assume {:sourceloc "buggy_24.sol", 1028, 49} {:message ""} true;
	call mul#108_ret#374 := mul#108(__this, __msg_sender, __msg_value, dynamicCA#4017#356, call_arg#373);
	call_arg#375 := 1000000;
	assume {:sourceloc "buggy_24.sol", 1028, 49} {:message ""} true;
	call div#125_ret#376 := div#125(__this, __msg_sender, __msg_value, mul#108_ret#374, call_arg#375);
	dynamicCA#4017#356 := div#125_ret#376;
	}
	else {
	call_arg#377 := 100000;
	assume {:sourceloc "buggy_24.sol", 1030, 49} {:message ""} true;
	call div#125_ret#378 := div#125(__this, __msg_sender, __msg_value, dynamicCA#4017#356, call_arg#377);
	dynamicCA#4017#356 := div#125_ret#378;
	}

	}

	assume {:sourceloc "buggy_24.sol", 1032, 71} {:message ""} true;
	call add#28_ret#379 := add#28(__this, __msg_sender, __msg_value, calcDynamicCommissionAmount#232#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]])), dynamicCA#4017#356);
	if ((sponsor#3997#356[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][sponsor#3997#356[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), dynamicCommissionBalance#230#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]), add#28_ret#379, sponsorAddress#234#User#235#constr(userMapping#647[__this][sponsor#3997#356[1]]))]];
	}
	else {
	User235default_context := User235default_context[sponsor#3997#356[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[sponsor#3997#356[1]]), totalInvestAmount#202#User#235#constr(User235default_context[sponsor#3997#356[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[sponsor#3997#356[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[sponsor#3997#356[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[sponsor#3997#356[1]]), downlineCount#210#User#235#constr(User235default_context[sponsor#3997#356[1]]), nodeCount#212#User#235#constr(User235default_context[sponsor#3997#356[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[sponsor#3997#356[1]]), currentInvestTime#216#User#235#constr(User235default_context[sponsor#3997#356[1]]), currentInvestAmount#218#User#235#constr(User235default_context[sponsor#3997#356[1]]), currentInvestCycle#220#User#235#constr(User235default_context[sponsor#3997#356[1]]), currentlevel#222#User#235#constr(User235default_context[sponsor#3997#356[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[sponsor#3997#356[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[sponsor#3997#356[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[sponsor#3997#356[1]]), dynamicCommissionBalance#230#User#235#constr(User235default_context[sponsor#3997#356[1]]), add#28_ret#379, sponsorAddress#234#User#235#constr(User235default_context[sponsor#3997#356[1]]))];
	}

	}

	}

	addressWalker#3989#356 := sponsorAddress#234#User#235#constr((if (sponsor#3997#356[0] == 28) then userMapping#647[__this][sponsor#3997#356[1]] else User235default_context[sponsor#3997#356[1]]));
	call_arg#380 := 1;
	assume {:sourceloc "buggy_24.sol", 1036, 33} {:message ""} true;
	call add#28_ret#381 := add#28(__this, __msg_sender, __msg_value, depth#3985#356, call_arg#380);
	depth#3985#356 := add#28_ret#381;
	$continue362:
	}

	break363:
	}

	}

	$continue357:
	// Loop expression
	i#3940#356 := (i#3940#356 + 1);
	tmp#382 := i#3940#356;
	}

	break358:
	$return80:
	// Function body ends here
	$return79:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_24.sol", 1042, 1} {:message "balances_re_ent31"} balances_re_ent31#4136: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_24.sol", 1043, 1} {:message "FomoFeast::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#4169(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#4138: int)
{
	var __send_ret#383: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#4136[__this][__msg_sender] >= _weiToWithdraw#4138);
	assume {:sourceloc "buggy_24.sol", 1046, 13} {:message ""} true;
	call __send_ret#383 := __send(__msg_sender, __this, 0, _weiToWithdraw#4138);
	assume __send_ret#383;
	balances_re_ent31#4136 := balances_re_ent31#4136[__this := balances_re_ent31#4136[__this][__msg_sender := (balances_re_ent31#4136[__this][__msg_sender] - _weiToWithdraw#4138)]];
	$return81:
	// Function body ends here
}

// 
// Function: calcDynamicCommissionEnd
procedure {:sourceloc "buggy_24.sol", 1050, 5} {:message "FomoFeast::calcDynamicCommissionEnd"} calcDynamicCommissionEnd#4231(__this: address_t, __msg_sender: address_t, __msg_value: int, index#4171: int, length#4173: int)
{
	var call_arg#385: int_arr_ptr;
	var new_array#386: int_arr_ptr;
	var {:sourceloc "buggy_24.sol", 1051, 14} {:message "i"} i#4179#387: int;
	var {:sourceloc "buggy_24.sol", 1052, 13} {:message "userAddress"} userAddress#4192#387: address_t;
	var user#4198#387: [int]int;
	var add#28_ret#390: int;
	var tmp#391: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#386 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#385 := new_array#386;
	mem_arr_int := mem_arr_int[call_arg#385 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114], 9)];
	assume (__msg_sender == owner#264[__this]);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#4179#387 := index#4171;
	while ((i#4179#387 < (index#4171 + length#4173))) {
	// Body
	userAddress#4192#387 := addressMapping#684[__this][i#4179#387];
	user#4198#387 := default_int_int()[0 := 28][1 := userAddress#4192#387];
	if ((calcDynamicCommissionAmount#232#User#235#constr((if (user#4198#387[0] == 28) then userMapping#647[__this][user#4198#387[1]] else User235default_context[user#4198#387[1]])) > 0)) {
	assume {:sourceloc "buggy_24.sol", 1055, 49} {:message ""} true;
	call add#28_ret#390 := add#28(__this, __msg_sender, __msg_value, dynamicCommissionBalance#230#User#235#constr((if (user#4198#387[0] == 28) then userMapping#647[__this][user#4198#387[1]] else User235default_context[user#4198#387[1]])), calcDynamicCommissionAmount#232#User#235#constr((if (user#4198#387[0] == 28) then userMapping#647[__this][user#4198#387[1]] else User235default_context[user#4198#387[1]])));
	if ((user#4198#387[0] == 28)) {
	userMapping#647 := userMapping#647[__this := userMapping#647[__this][user#4198#387[1] := User#235#constr(totalInvestCount#200#User#235#constr(userMapping#647[__this][user#4198#387[1]]), totalInvestAmount#202#User#235#constr(userMapping#647[__this][user#4198#387[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(userMapping#647[__this][user#4198#387[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(userMapping#647[__this][user#4198#387[1]]), totalWithdrawAmount#208#User#235#constr(userMapping#647[__this][user#4198#387[1]]), downlineCount#210#User#235#constr(userMapping#647[__this][user#4198#387[1]]), nodeCount#212#User#235#constr(userMapping#647[__this][user#4198#387[1]]), totalDownlineInvestAmount#214#User#235#constr(userMapping#647[__this][user#4198#387[1]]), currentInvestTime#216#User#235#constr(userMapping#647[__this][user#4198#387[1]]), currentInvestAmount#218#User#235#constr(userMapping#647[__this][user#4198#387[1]]), currentInvestCycle#220#User#235#constr(userMapping#647[__this][user#4198#387[1]]), currentlevel#222#User#235#constr(userMapping#647[__this][user#4198#387[1]]), currentStaticCommissionRatio#224#User#235#constr(userMapping#647[__this][user#4198#387[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(userMapping#647[__this][user#4198#387[1]]), staticCommissionBalance#228#User#235#constr(userMapping#647[__this][user#4198#387[1]]), add#28_ret#390, calcDynamicCommissionAmount#232#User#235#constr(userMapping#647[__this][user#4198#387[1]]), sponsorAddress#234#User#235#constr(userMapping#647[__this][user#4198#387[1]]))]];
	}
	else {
	User235default_context := User235default_context[user#4198#387[1] := User#235#constr(totalInvestCount#200#User#235#constr(User235default_context[user#4198#387[1]]), totalInvestAmount#202#User#235#constr(User235default_context[user#4198#387[1]]), totalStaticCommissionWithdrawAmount#204#User#235#constr(User235default_context[user#4198#387[1]]), totalDynamicCommissionWithdrawAmount#206#User#235#constr(User235default_context[user#4198#387[1]]), totalWithdrawAmount#208#User#235#constr(User235default_context[user#4198#387[1]]), downlineCount#210#User#235#constr(User235default_context[user#4198#387[1]]), nodeCount#212#User#235#constr(User235default_context[user#4198#387[1]]), totalDownlineInvestAmount#214#User#235#constr(User235default_context[user#4198#387[1]]), currentInvestTime#216#User#235#constr(User235default_context[user#4198#387[1]]), currentInvestAmount#218#User#235#constr(User235default_context[user#4198#387[1]]), currentInvestCycle#220#User#235#constr(User235default_context[user#4198#387[1]]), currentlevel#222#User#235#constr(User235default_context[user#4198#387[1]]), currentStaticCommissionRatio#224#User#235#constr(User235default_context[user#4198#387[1]]), currentStaticCommissionWithdrawAmount#226#User#235#constr(User235default_context[user#4198#387[1]]), staticCommissionBalance#228#User#235#constr(User235default_context[user#4198#387[1]]), add#28_ret#390, calcDynamicCommissionAmount#232#User#235#constr(User235default_context[user#4198#387[1]]), sponsorAddress#234#User#235#constr(User235default_context[user#4198#387[1]]))];
	}

	assume {:sourceloc "buggy_24.sol", 1056, 17} {:message ""} true;
	call addDynamicCommissionRecord#1879(__this, __msg_sender, __msg_value, userAddress#4192#387, __block_timestamp, calcDynamicCommissionAmount#232#User#235#constr((if (user#4198#387[0] == 28) then userMapping#647[__this][user#4198#387[1]] else User235default_context[user#4198#387[1]])));
	}

	$continue388:
	// Loop expression
	i#4179#387 := (i#4179#387 + 1);
	tmp#391 := i#4179#387;
	}

	break389:
	$return83:
	// Function body ends here
	$return82:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_24.sol", 1060, 1} {:message "not_called_re_ent13"} not_called_re_ent13#4234: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_24.sol", 1061, 1} {:message "FomoFeast::bug_re_ent13"} bug_re_ent13#4266(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_24.sol", 1063, 3} {:message "success"} success#4242: bool;
	var __call_ret#392: bool;
	var __call_ret#393: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#4234[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_24.sol", 1063, 18} {:message ""} true;
	call __call_ret#392, __call_ret#393 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#392) {
	havoc initialized#262;
	havoc owner#264;
	havoc redeemableEther_re_ent18#268;
	havoc totalInvestCount#306;
	havoc balances_re_ent29#310;
	havoc totalInvestAmount#335;
	havoc not_called_re_ent6#338;
	havoc totalStaticCommissionWithdrawAmount#367;
	havoc lastPlayer_re_ent16#369;
	havoc jackpot_re_ent16#371;
	havoc totalDynamicCommissionWithdrawAmount#403;
	havoc balances_re_ent24#407;
	havoc totalWithdrawAmount#442;
	havoc userBalance_re_ent5#446;
	havoc totalUserCount#477;
	havoc balances_re_ent15#481;
	havoc engineerFunds#506;
	havoc counter_re_ent28#509;
	havoc engineerWithdrawAmount#540;
	havoc not_called_re_ent34#543;
	havoc operatorFunds#572;
	havoc counter_re_ent21#575;
	havoc operatorWithdrawAmount#606;
	havoc balances_re_ent10#610;
	havoc userMapping#647;
	havoc balances_re_ent21#651;
	havoc addressMapping#684;
	havoc userBalance_re_ent12#688;
	havoc investRecordMapping#723;
	havoc redeemableEther_re_ent11#727;
	havoc staticCommissionRecordMapping#769;
	havoc balances_re_ent1#773;
	havoc dynamicCommissionRecordMapping#808;
	havoc not_called_re_ent41#859;
	havoc counter_re_ent42#897;
	havoc lastPlayer_re_ent2#976;
	havoc jackpot_re_ent2#978;
	havoc balances_re_ent17#1049;
	havoc lastPlayer_re_ent37#1114;
	havoc jackpot_re_ent37#1116;
	havoc balances_re_ent3#1218;
	havoc lastPlayer_re_ent9#1349;
	havoc jackpot_re_ent9#1351;
	havoc redeemableEther_re_ent25#1508;
	havoc userBalance_re_ent19#1617;
	havoc userBalance_re_ent26#1707;
	havoc not_called_re_ent20#1798;
	havoc redeemableEther_re_ent32#1883;
	havoc balances_re_ent38#2312;
	havoc redeemableEther_re_ent4#2461;
	havoc counter_re_ent7#2640;
	havoc lastPlayer_re_ent23#2706;
	havoc jackpot_re_ent23#2708;
	havoc counter_re_ent14#2776;
	havoc lastPlayer_re_ent30#2833;
	havoc jackpot_re_ent30#2835;
	havoc balances_re_ent8#2929;
	havoc redeemableEther_re_ent39#2982;
	havoc balances_re_ent36#3192;
	havoc counter_re_ent35#3352;
	havoc userBalance_re_ent40#3519;
	havoc userBalance_re_ent33#3827;
	havoc not_called_re_ent27#3903;
	havoc balances_re_ent31#4136;
	havoc not_called_re_ent13#4234;
	havoc __balance;
	}

	if (!(__call_ret#392)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#4242 := __call_ret#392;
	if (!(success#4242)) {
	assume false;
	}

	not_called_re_ent13#4234 := not_called_re_ent13#4234[__this := false];
	$return84:
	// Function body ends here
}

