// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_48.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 23, 5} {:message "SafeMath::add"} add#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (c#8: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#8 := (a#3 + b#5);
	assume (c#8 >= a#3);
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 27, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#25: int, b#27: int)
	returns (c#30: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#27 <= a#25);
	c#30 := (a#25 - b#27);
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 31, 5} {:message "SafeMath::mul"} mul#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#47: int, b#49: int)
	returns (c#52: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#52 := (a#47 * b#49);
	assume ((a#47 == 0) || ((c#52 div a#47) == b#49));
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 35, 5} {:message "SafeMath::div"} div#95(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
	returns (c#80: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#77 > 0);
	c#80 := (a#75 div b#77);
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 22, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_48.sol", 116, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#440(__this: address_t, __msg_sender: address_t, __msg_value: int, from#434: address_t, to#436: address_t, tokens#438: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_48.sol", 125, 3} {:message "[event] ERC20Interface::Approval"} Approval#492(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#486: address_t, spender#488: address_t, tokens#490: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 47, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);
	modifies balances_re_ent17#105, lastPlayer_re_ent37#153, jackpot_re_ent37#155, balances_re_ent3#203, lastPlayer_re_ent9#253, jackpot_re_ent9#255, redeemableEther_re_ent25#303, userBalance_re_ent19#363, not_called_re_ent27#400, balances_re_ent31#444;

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 48, 1} {:message "balances_re_ent17"} balances_re_ent17#105: [address_t][address_t]int;
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
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

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 49, 1} {:message "ERC20Interface::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#144(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#107: int)
{
	var {:sourceloc "buggy_48.sol", 52, 6} {:message "success"} success#120: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#105[__this][__msg_sender] >= _weiToWithdraw#107);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#107);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#107)];
	assume {:sourceloc "buggy_48.sol", 52, 23} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, _weiToWithdraw#107);
	if (__call_ret#0) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#107)];
	}

	success#120 := __call_ret#0;
	assume success#120;
	balances_re_ent17#105 := balances_re_ent17#105[__this := balances_re_ent17#105[__this][__msg_sender := (balances_re_ent17#105[__this][__msg_sender] - _weiToWithdraw#107)]];
	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 56, 5} {:message "ERC20Interface::balanceOf"} balanceOf#151(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#146: address_t)
	returns (balance#149: int);
	modifies balances_re_ent17#105, lastPlayer_re_ent37#153, jackpot_re_ent37#155, balances_re_ent3#203, lastPlayer_re_ent9#253, jackpot_re_ent9#255, redeemableEther_re_ent25#303, userBalance_re_ent19#363, not_called_re_ent27#400, balances_re_ent31#444;

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_48.sol", 57, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#153: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_48.sol", 58, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#155: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_48.sol", 59, 4} {:message "ERC20Interface::buyTicket_re_ent37"} buyTicket_re_ent37#190(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 60, 7} {:message "sent"} sent#159: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent37#155[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent37#155[__this])];
	assume {:sourceloc "buggy_48.sol", 60, 21} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(lastPlayer_re_ent37#153[__this], __this, jackpot_re_ent37#155[__this]);
	if (__call_ret#2) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent37#155[__this])];
	}

	sent#159 := __call_ret#2;
	if (!(sent#159)) {
	assume false;
	}

	lastPlayer_re_ent37#153 := lastPlayer_re_ent37#153[__this := __msg_sender];
	jackpot_re_ent37#155 := jackpot_re_ent37#155[__this := __balance[__this]];
	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 66, 5} {:message "ERC20Interface::allowance"} allowance#199(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#192: address_t, spender#194: address_t)
	returns (remaining#197: int);
	modifies balances_re_ent17#105, lastPlayer_re_ent37#153, jackpot_re_ent37#155, balances_re_ent3#203, lastPlayer_re_ent9#253, jackpot_re_ent9#255, redeemableEther_re_ent25#303, userBalance_re_ent19#363, not_called_re_ent27#400, balances_re_ent31#444;

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 67, 1} {:message "balances_re_ent3"} balances_re_ent3#203: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 68, 1} {:message "ERC20Interface::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#242(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#205: int)
{
	var {:sourceloc "buggy_48.sol", 71, 3} {:message "success"} success#218: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#203[__this][__msg_sender] >= _weiToWithdraw#205);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#205);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#205)];
	assume {:sourceloc "buggy_48.sol", 71, 20} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(__msg_sender, __this, _weiToWithdraw#205);
	if (__call_ret#4) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#205)];
	}

	success#218 := __call_ret#4;
	assume success#218;
	balances_re_ent3#203 := balances_re_ent3#203[__this := balances_re_ent3#203[__this][__msg_sender := (balances_re_ent3#203[__this][__msg_sender] - _weiToWithdraw#205)]];
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 75, 5} {:message "ERC20Interface::transfer"} transfer#251(__this: address_t, __msg_sender: address_t, __msg_value: int, to#244: address_t, tokens#246: int)
	returns (success#249: bool);
	modifies balances_re_ent17#105, lastPlayer_re_ent37#153, jackpot_re_ent37#155, balances_re_ent3#203, lastPlayer_re_ent9#253, jackpot_re_ent9#255, redeemableEther_re_ent25#303, userBalance_re_ent19#363, not_called_re_ent27#400, balances_re_ent31#444;

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_48.sol", 76, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#253: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_48.sol", 77, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#255: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_48.sol", 78, 4} {:message "ERC20Interface::buyTicket_re_ent9"} buyTicket_re_ent9#290(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 79, 10} {:message "success"} success#259: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#255[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#255[__this])];
	assume {:sourceloc "buggy_48.sol", 79, 27} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(lastPlayer_re_ent9#253[__this], __this, jackpot_re_ent9#255[__this]);
	if (__call_ret#6) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#255[__this])];
	}

	success#259 := __call_ret#6;
	if (!(success#259)) {
	assume false;
	}

	lastPlayer_re_ent9#253 := lastPlayer_re_ent9#253[__this := __msg_sender];
	jackpot_re_ent9#255 := jackpot_re_ent9#255[__this := __balance[__this]];
	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 85, 5} {:message "ERC20Interface::approve"} approve#299(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#292: address_t, tokens#294: int)
	returns (success#297: bool);
	modifies balances_re_ent17#105, lastPlayer_re_ent37#153, jackpot_re_ent37#155, balances_re_ent3#203, lastPlayer_re_ent9#253, jackpot_re_ent9#255, redeemableEther_re_ent25#303, userBalance_re_ent19#363, not_called_re_ent27#400, balances_re_ent31#444;

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 86, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#303: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_48.sol", 87, 1} {:message "ERC20Interface::claimReward_re_ent25"} claimReward_re_ent25#348(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 90, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#316: int;
	var {:sourceloc "buggy_48.sol", 91, 6} {:message "sent"} sent#323: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	var call_arg#10: int_arr_ptr;
	var new_array#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#303[__this][__msg_sender] > 0);
	transferValue_re_ent25#316 := redeemableEther_re_ent25#303[__this][__msg_sender];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= transferValue_re_ent25#316);
	__balance := __balance[__this := (__balance[__this] - transferValue_re_ent25#316)];
	assume {:sourceloc "buggy_48.sol", 91, 20} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, transferValue_re_ent25#316);
	if (__call_ret#8) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + transferValue_re_ent25#316)];
	}

	sent#323 := __call_ret#8;
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#10 := new_array#11;
	mem_arr_int := mem_arr_int[call_arg#10 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#323;
	redeemableEther_re_ent25#303 := redeemableEther_re_ent25#303[__this := redeemableEther_re_ent25#303[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 95, 5} {:message "ERC20Interface::transferFrom"} transferFrom#359(__this: address_t, __msg_sender: address_t, __msg_value: int, from#350: address_t, to#352: address_t, tokens#354: int)
	returns (success#357: bool);
	modifies balances_re_ent17#105, lastPlayer_re_ent37#153, jackpot_re_ent37#155, balances_re_ent3#203, lastPlayer_re_ent9#253, jackpot_re_ent9#255, redeemableEther_re_ent25#303, userBalance_re_ent19#363, not_called_re_ent27#400, balances_re_ent31#444;

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 96, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#363: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_48.sol", 97, 1} {:message "ERC20Interface::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#397(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 100, 10} {:message "success"} success#367: bool;
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent19#363[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent19#363[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 100, 27} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(__msg_sender, __this, userBalance_re_ent19#363[__this][__msg_sender]);
	if (__call_ret#12) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent19#363[__this][__msg_sender])];
	}

	success#367 := __call_ret#12;
	if (!(success#367)) {
	assume false;
	}

	userBalance_re_ent19#363 := userBalance_re_ent19#363[__this := userBalance_re_ent19#363[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_48.sol", 107, 3} {:message "not_called_re_ent27"} not_called_re_ent27#400: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_48.sol", 108, 1} {:message "ERC20Interface::bug_re_ent27"} bug_re_ent27#432(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 110, 10} {:message "success"} success#408: bool;
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#400[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 110, 27} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#14) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#14)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#408 := __call_ret#14;
	if (!(success#408)) {
	assume false;
	}

	not_called_re_ent27#400 := not_called_re_ent27#400[__this := false];
	$return10:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 117, 3} {:message "balances_re_ent31"} balances_re_ent31#444: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 118, 1} {:message "ERC20Interface::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#484(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#446: int)
{
	var {:sourceloc "buggy_48.sol", 121, 6} {:message "sent"} sent#459: bool;
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	var call_arg#18: int_arr_ptr;
	var new_array#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#444[__this][__msg_sender] >= _weiToWithdraw#446);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#446);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#446)];
	assume {:sourceloc "buggy_48.sol", 121, 20} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(__msg_sender, __this, _weiToWithdraw#446);
	if (__call_ret#16) {
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#446)];
	}

	sent#459 := __call_ret#16;
	new_array#19 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#18 := new_array#19;
	mem_arr_int := mem_arr_int[call_arg#18 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#459;
	balances_re_ent31#444 := balances_re_ent31#444[__this := balances_re_ent31#444[__this][__msg_sender := (balances_re_ent31#444[__this][__msg_sender] - _weiToWithdraw#446)]];
	$return11:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "buggy_48.sol", 46, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#493(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	balances_re_ent17#105 := balances_re_ent17#105[__this := default_address_t_int()];
	lastPlayer_re_ent37#153 := lastPlayer_re_ent37#153[__this := 0];
	jackpot_re_ent37#155 := jackpot_re_ent37#155[__this := 0];
	balances_re_ent3#203 := balances_re_ent3#203[__this := default_address_t_int()];
	lastPlayer_re_ent9#253 := lastPlayer_re_ent9#253[__this := 0];
	jackpot_re_ent9#255 := jackpot_re_ent9#255[__this := 0];
	redeemableEther_re_ent25#303 := redeemableEther_re_ent25#303[__this := default_address_t_int()];
	userBalance_re_ent19#363 := userBalance_re_ent19#363[__this := default_address_t_int()];
	not_called_re_ent27#400 := not_called_re_ent27#400[__this := true];
	balances_re_ent31#444 := balances_re_ent31#444[__this := default_address_t_int()];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_48.sol", 135, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#504(__this: address_t, __msg_sender: address_t, __msg_value: int, from#495: address_t, tokens#497: int, token#499: address_t, data#501: int_arr_ptr);
	modifies userBalance_re_ent26#508;

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 136, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#508: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_48.sol", 137, 1} {:message "ApproveAndCallFallBack::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#542(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 140, 6} {:message "success"} success#512: bool;
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#508[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#508[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 140, 23} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(__msg_sender, __this, userBalance_re_ent26#508[__this][__msg_sender]);
	if (__call_ret#20) {
	havoc userBalance_re_ent26#508;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#508[__this][__msg_sender])];
	}

	success#512 := __call_ret#20;
	if (!(success#512)) {
	assume false;
	}

	userBalance_re_ent26#508 := userBalance_re_ent26#508[__this := userBalance_re_ent26#508[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 134, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#543(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	userBalance_re_ent26#508 := userBalance_re_ent26#508[__this := default_address_t_int()];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_48.sol", 181, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#659(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#655: address_t, _to#657: address_t)
{
	
}

// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 153, 3} {:message "balances_re_ent21"} balances_re_ent21#547: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_48.sol", 154, 5} {:message "Owned::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#576(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 155, 11} {:message "success"} success#551: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#547[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#547[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 155, 28} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, balances_re_ent21#547[__this][__msg_sender]);
	if (__call_ret#22) {
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#547[__this][__msg_sender])];
	}

	success#551 := __call_ret#22;
	if (success#551) {
	balances_re_ent21#547 := balances_re_ent21#547[__this := balances_re_ent21#547[__this][__msg_sender := 0]];
	}

	$return13:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_48.sol", 159, 3} {:message "owner"} owner#578: [address_t]address_t;
// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 160, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#582: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_48.sol", 161, 1} {:message "Owned::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#616(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 164, 10} {:message "success"} success#586: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent12#582[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent12#582[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 164, 27} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(__msg_sender, __this, userBalance_re_ent12#582[__this][__msg_sender]);
	if (__call_ret#24) {
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent12#582[__this][__msg_sender])];
	}

	success#586 := __call_ret#24;
	if (!(success#586)) {
	assume false;
	}

	userBalance_re_ent12#582 := userBalance_re_ent12#582[__this := userBalance_re_ent12#582[__this][__msg_sender := 0]];
	$return14:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_48.sol", 170, 3} {:message "newOwner"} newOwner#618: [address_t]address_t;
// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_48.sol", 172, 3} {:message "not_called_re_ent13"} not_called_re_ent13#621: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_48.sol", 173, 1} {:message "Owned::bug_re_ent13"} bug_re_ent13#653(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 175, 10} {:message "success"} success#629: bool;
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#621[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 175, 27} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#26) {
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#629 := __call_ret#26;
	if (!(success#629)) {
	assume false;
	}

	not_called_re_ent13#621 := not_called_re_ent13#621[__this := false];
	$return15:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 183, 5} {:message "Owned::[constructor]"} __constructor#847(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent21#547 := balances_re_ent21#547[__this := default_address_t_int()];
	owner#578 := owner#578[__this := 0];
	userBalance_re_ent12#582 := userBalance_re_ent12#582[__this := default_address_t_int()];
	newOwner#618 := newOwner#618[__this := 0];
	not_called_re_ent13#621 := not_called_re_ent13#621[__this := true];
	not_called_re_ent20#671 := not_called_re_ent20#671[__this := true];
	redeemableEther_re_ent32#730 := redeemableEther_re_ent32#730[__this := default_address_t_int()];
	balances_re_ent38#806 := balances_re_ent38#806[__this := default_address_t_int()];
	// Function body starts here
	owner#578 := owner#578[__this := __msg_sender];
	$return16:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_48.sol", 186, 1} {:message "not_called_re_ent20"} not_called_re_ent20#671: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_48.sol", 187, 1} {:message "Owned::bug_re_ent20"} bug_re_ent20#703(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 189, 10} {:message "success"} success#679: bool;
	var __call_ret#28: bool;
	var __call_ret#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#671[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 189, 27} {:message ""} true;
	call __call_ret#28, __call_ret#29 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#28) {
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc __balance;
	}

	if (!(__call_ret#28)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#679 := __call_ret#28;
	if (!(success#679)) {
	assume false;
	}

	not_called_re_ent20#671 := not_called_re_ent20#671[__this := false];
	$return17:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_48.sol", 201, 5} {:message "Owned::transferOwnership"} transferOwnership#726(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#716: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#578[__this]);
	// Function body starts here
	newOwner#618 := newOwner#618[__this := _newOwner#716];
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 204, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#730: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_48.sol", 205, 1} {:message "Owned::claimReward_re_ent32"} claimReward_re_ent32#775(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 208, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#743: int;
	var {:sourceloc "buggy_48.sol", 209, 6} {:message "sent"} sent#750: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	var call_arg#34: int_arr_ptr;
	var new_array#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#730[__this][__msg_sender] > 0);
	transferValue_re_ent32#743 := redeemableEther_re_ent32#730[__this][__msg_sender];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= transferValue_re_ent32#743);
	__balance := __balance[__this := (__balance[__this] - transferValue_re_ent32#743)];
	assume {:sourceloc "buggy_48.sol", 209, 20} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, transferValue_re_ent32#743);
	if (__call_ret#32) {
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + transferValue_re_ent32#743)];
	}

	sent#750 := __call_ret#32;
	new_array#35 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#34 := new_array#35;
	mem_arr_int := mem_arr_int[call_arg#34 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#750;
	redeemableEther_re_ent32#730 := redeemableEther_re_ent32#730[__this := redeemableEther_re_ent32#730[__this][__msg_sender := 0]];
	$return20:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_48.sol", 213, 5} {:message "Owned::acceptOwnership"} acceptOwnership#802(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#618[__this]);
	assume {:sourceloc "buggy_48.sol", 215, 14} {:message ""} true;
	call OwnershipTransferred#659(__this, __msg_sender, __msg_value, owner#578[__this], newOwner#618[__this]);
	owner#578 := owner#578[__this := newOwner#618[__this]];
	newOwner#618 := newOwner#618[__this := 0];
	$return21:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 219, 1} {:message "balances_re_ent38"} balances_re_ent38#806: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 220, 1} {:message "Owned::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#846(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#808: int)
{
	var {:sourceloc "buggy_48.sol", 223, 6} {:message "sent"} sent#821: bool;
	var __call_ret#36: bool;
	var __call_ret#37: int_arr_ptr;
	var call_arg#38: int_arr_ptr;
	var new_array#39: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#806[__this][__msg_sender] >= _weiToWithdraw#808);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#808);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#808)];
	assume {:sourceloc "buggy_48.sol", 223, 20} {:message ""} true;
	call __call_ret#36, __call_ret#37 := __call(__msg_sender, __this, _weiToWithdraw#808);
	if (__call_ret#36) {
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc __balance;
	}

	if (!(__call_ret#36)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#808)];
	}

	sent#821 := __call_ret#36;
	new_array#39 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#38 := new_array#39;
	mem_arr_int := mem_arr_int[call_arg#38 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#821;
	balances_re_ent38#806 := balances_re_ent38#806[__this := balances_re_ent38#806[__this][__msg_sender := (balances_re_ent38#806[__this][__msg_sender] - _weiToWithdraw#808)]];
	$return22:
	// Function body ends here
}

// 
// ------- Contract: QurasToken -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 237, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#858: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_48.sol", 238, 1} {:message "QurasToken::claimReward_re_ent11"} claimReward_re_ent11#903(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 241, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#871: int;
	var {:sourceloc "buggy_48.sol", 242, 6} {:message "sent"} sent#878: bool;
	var __call_ret#40: bool;
	var __call_ret#41: int_arr_ptr;
	var call_arg#42: int_arr_ptr;
	var new_array#43: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#858[__this][__msg_sender] > 0);
	transferValue_re_ent11#871 := redeemableEther_re_ent11#858[__this][__msg_sender];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= transferValue_re_ent11#871);
	__balance := __balance[__this := (__balance[__this] - transferValue_re_ent11#871)];
	assume {:sourceloc "buggy_48.sol", 242, 20} {:message ""} true;
	call __call_ret#40, __call_ret#41 := __call(__msg_sender, __this, transferValue_re_ent11#871);
	if (__call_ret#40) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#40)) {
	__balance := __balance[__this := (__balance[__this] + transferValue_re_ent11#871)];
	}

	sent#878 := __call_ret#40;
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#42 := new_array#43;
	mem_arr_int := mem_arr_int[call_arg#42 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#878;
	redeemableEther_re_ent11#858 := redeemableEther_re_ent11#858[__this := redeemableEther_re_ent11#858[__this][__msg_sender := 0]];
	$return23:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_48.sol", 246, 3} {:message "symbol"} symbol#905: [address_t]int_arr_type;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 247, 3} {:message "balances_re_ent1"} balances_re_ent1#909: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_48.sol", 248, 5} {:message "QurasToken::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#938(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 249, 11} {:message "success"} success#913: bool;
	var __call_ret#44: bool;
	var __call_ret#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#909[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#909[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 249, 28} {:message ""} true;
	call __call_ret#44, __call_ret#45 := __call(__msg_sender, __this, balances_re_ent1#909[__this][__msg_sender]);
	if (__call_ret#44) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#44)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#909[__this][__msg_sender])];
	}

	success#913 := __call_ret#44;
	if (success#913) {
	balances_re_ent1#909 := balances_re_ent1#909[__this := balances_re_ent1#909[__this][__msg_sender := 0]];
	}

	$return24:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_48.sol", 253, 3} {:message "name"} name#940: [address_t]int_arr_type;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_48.sol", 254, 3} {:message "not_called_re_ent41"} not_called_re_ent41#943: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_48.sol", 255, 1} {:message "QurasToken::bug_re_ent41"} bug_re_ent41#975(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 257, 10} {:message "success"} success#951: bool;
	var __call_ret#46: bool;
	var __call_ret#47: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#943[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 257, 27} {:message ""} true;
	call __call_ret#46, __call_ret#47 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#46) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#46)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#951 := __call_ret#46;
	if (!(success#951)) {
	assume false;
	}

	not_called_re_ent41#943 := not_called_re_ent41#943[__this := false];
	$return25:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_48.sol", 263, 3} {:message "decimals"} decimals#977: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_48.sol", 264, 3} {:message "counter_re_ent42"} counter_re_ent42#980: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_48.sol", 265, 1} {:message "QurasToken::callme_re_ent42"} callme_re_ent42#1014(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 267, 3} {:message "success"} success#990: bool;
	var __call_ret#48: bool;
	var __call_ret#49: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#980[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 267, 20} {:message ""} true;
	call __call_ret#48, __call_ret#49 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#48) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#48)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#990 := __call_ret#48;
	if (!(success#990)) {
	assume false;
	}

	counter_re_ent42#980 := counter_re_ent42#980[__this := (counter_re_ent42#980[__this] + 1)];
	$return26:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_48.sol", 273, 3} {:message "_totalSupply"} _totalSupply#1016: [address_t]int;
// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 275, 5} {:message "balances"} balances#1020: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_48.sol", 276, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#1022: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_48.sol", 277, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#1024: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_48.sol", 278, 4} {:message "QurasToken::buyTicket_re_ent2"} buyTicket_re_ent2#1059(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 279, 7} {:message "sent"} sent#1028: bool;
	var __call_ret#50: bool;
	var __call_ret#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent2#1024[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent2#1024[__this])];
	assume {:sourceloc "buggy_48.sol", 279, 21} {:message ""} true;
	call __call_ret#50, __call_ret#51 := __call(lastPlayer_re_ent2#1022[__this], __this, jackpot_re_ent2#1024[__this]);
	if (__call_ret#50) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#50)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent2#1024[__this])];
	}

	sent#1028 := __call_ret#50;
	if (!(sent#1028)) {
	assume false;
	}

	lastPlayer_re_ent2#1022 := lastPlayer_re_ent2#1022[__this := __msg_sender];
	jackpot_re_ent2#1024 := jackpot_re_ent2#1024[__this := __balance[__this]];
	$return27:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_48.sol", 285, 3} {:message "allowed"} allowed#1065: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 291, 5} {:message "QurasToken::[constructor]"} __constructor#1875(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#53: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent11#858 := redeemableEther_re_ent11#858[__this := default_address_t_int()];
	symbol#905 := symbol#905[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#909 := balances_re_ent1#909[__this := default_address_t_int()];
	name#940 := name#940[__this := int_arr#constr(default_int_int(), 0)];
	not_called_re_ent41#943 := not_called_re_ent41#943[__this := true];
	decimals#977 := decimals#977[__this := 0];
	counter_re_ent42#980 := counter_re_ent42#980[__this := 0];
	_totalSupply#1016 := _totalSupply#1016[__this := 0];
	balances#1020 := balances#1020[__this := default_address_t_int()];
	lastPlayer_re_ent2#1022 := lastPlayer_re_ent2#1022[__this := 0];
	jackpot_re_ent2#1024 := jackpot_re_ent2#1024[__this := 0];
	allowed#1065 := allowed#1065[__this := default_address_t__k_address_t_v_int()];
	redeemableEther_re_ent4#1104 := redeemableEther_re_ent4#1104[__this := default_address_t_int()];
	counter_re_ent7#1169 := counter_re_ent7#1169[__this := 0];
	lastPlayer_re_ent23#1218 := lastPlayer_re_ent23#1218[__this := 0];
	jackpot_re_ent23#1220 := jackpot_re_ent23#1220[__this := 0];
	counter_re_ent14#1302 := counter_re_ent14#1302[__this := 0];
	lastPlayer_re_ent30#1379 := lastPlayer_re_ent30#1379[__this := 0];
	jackpot_re_ent30#1381 := jackpot_re_ent30#1381[__this := 0];
	balances_re_ent8#1480 := balances_re_ent8#1480[__this := default_address_t_int()];
	redeemableEther_re_ent39#1542 := redeemableEther_re_ent39#1542[__this := default_address_t_int()];
	balances_re_ent36#1651 := balances_re_ent36#1651[__this := default_address_t_int()];
	counter_re_ent35#1700 := counter_re_ent35#1700[__this := 0];
	userBalance_re_ent40#1782 := userBalance_re_ent40#1782[__this := default_address_t_int()];
	userBalance_re_ent33#1840 := userBalance_re_ent33#1840[__this := default_address_t_int()];
	balances_re_ent21#547 := balances_re_ent21#547[__this := default_address_t_int()];
	owner#578 := owner#578[__this := 0];
	userBalance_re_ent12#582 := userBalance_re_ent12#582[__this := default_address_t_int()];
	newOwner#618 := newOwner#618[__this := 0];
	not_called_re_ent13#621 := not_called_re_ent13#621[__this := true];
	not_called_re_ent20#671 := not_called_re_ent20#671[__this := true];
	redeemableEther_re_ent32#730 := redeemableEther_re_ent32#730[__this := default_address_t_int()];
	balances_re_ent38#806 := balances_re_ent38#806[__this := default_address_t_int()];
	balances_re_ent17#105 := balances_re_ent17#105[__this := default_address_t_int()];
	lastPlayer_re_ent37#153 := lastPlayer_re_ent37#153[__this := 0];
	jackpot_re_ent37#155 := jackpot_re_ent37#155[__this := 0];
	balances_re_ent3#203 := balances_re_ent3#203[__this := default_address_t_int()];
	lastPlayer_re_ent9#253 := lastPlayer_re_ent9#253[__this := 0];
	jackpot_re_ent9#255 := jackpot_re_ent9#255[__this := 0];
	redeemableEther_re_ent25#303 := redeemableEther_re_ent25#303[__this := default_address_t_int()];
	userBalance_re_ent19#363 := userBalance_re_ent19#363[__this := default_address_t_int()];
	not_called_re_ent27#400 := not_called_re_ent27#400[__this := true];
	balances_re_ent31#444 := balances_re_ent31#444[__this := default_address_t_int()];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#578 := owner#578[__this := __msg_sender];
	$return28:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#905 := symbol#905[__this := int_arr#constr(default_int_int()[0 := 88][1 := 81][2 := 67], 3)];
	name#940 := name#940[__this := int_arr#constr(default_int_int()[0 := 81][1 := 117][2 := 114][3 := 97][4 := 115][5 := 32][6 := 84][7 := 111][8 := 107][9 := 101][10 := 110], 11)];
	decimals#977 := decimals#977[__this := 8];
	_totalSupply#1016 := _totalSupply#1016[__this := 88888888800000000];
	balances#1020 := balances#1020[__this := balances#1020[__this][owner#578[__this] := _totalSupply#1016[__this]]];
	call_arg#53 := 0;
	assume {:sourceloc "buggy_48.sol", 297, 14} {:message ""} true;
	call Transfer#440(__this, __msg_sender, __msg_value, call_arg#53, owner#578[__this], _totalSupply#1016[__this]);
	$return29:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 299, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#1104: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_48.sol", 300, 1} {:message "QurasToken::claimReward_re_ent4"} claimReward_re_ent4#1149(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 303, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#1117: int;
	var {:sourceloc "buggy_48.sol", 304, 6} {:message "sent"} sent#1124: bool;
	var __call_ret#54: bool;
	var __call_ret#55: int_arr_ptr;
	var call_arg#56: int_arr_ptr;
	var new_array#57: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#1104[__this][__msg_sender] > 0);
	transferValue_re_ent4#1117 := redeemableEther_re_ent4#1104[__this][__msg_sender];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= transferValue_re_ent4#1117);
	__balance := __balance[__this := (__balance[__this] - transferValue_re_ent4#1117)];
	assume {:sourceloc "buggy_48.sol", 304, 20} {:message ""} true;
	call __call_ret#54, __call_ret#55 := __call(__msg_sender, __this, transferValue_re_ent4#1117);
	if (__call_ret#54) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#54)) {
	__balance := __balance[__this := (__balance[__this] + transferValue_re_ent4#1117)];
	}

	sent#1124 := __call_ret#54;
	new_array#57 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#56 := new_array#57;
	mem_arr_int := mem_arr_int[call_arg#56 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#1124;
	redeemableEther_re_ent4#1104 := redeemableEther_re_ent4#1104[__this := redeemableEther_re_ent4#1104[__this][__msg_sender := 0]];
	$return30:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 313, 5} {:message "QurasToken::totalSupply"} totalSupply#1166(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1153: int)
{
	var sub#45_ret#58: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 314, 16} {:message ""} true;
	call sub#45_ret#58 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#1016[__this], balances#1020[__this][0]);
	#1153 := sub#45_ret#58;
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_48.sol", 316, 1} {:message "counter_re_ent7"} counter_re_ent7#1169: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_48.sol", 317, 1} {:message "QurasToken::callme_re_ent7"} callme_re_ent7#1203(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 319, 3} {:message "success"} success#1179: bool;
	var __call_ret#59: bool;
	var __call_ret#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1169[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 319, 20} {:message ""} true;
	call __call_ret#59, __call_ret#60 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#59) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#59)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1179 := __call_ret#59;
	if (!(success#1179)) {
	assume false;
	}

	counter_re_ent7#1169 := counter_re_ent7#1169[__this := (counter_re_ent7#1169[__this] + 1)];
	$return32:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 330, 5} {:message "QurasToken::balanceOf"} balanceOf#1216(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1205: address_t)
	returns (balance#1209: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#1209 := balances#1020[__this][tokenOwner#1205];
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_48.sol", 333, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1218: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_48.sol", 334, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1220: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_48.sol", 335, 4} {:message "QurasToken::buyTicket_re_ent23"} buyTicket_re_ent23#1255(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 336, 7} {:message "sent"} sent#1224: bool;
	var __call_ret#61: bool;
	var __call_ret#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent23#1220[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent23#1220[__this])];
	assume {:sourceloc "buggy_48.sol", 336, 21} {:message ""} true;
	call __call_ret#61, __call_ret#62 := __call(lastPlayer_re_ent23#1218[__this], __this, jackpot_re_ent23#1220[__this]);
	if (__call_ret#61) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#61)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent23#1220[__this])];
	}

	sent#1224 := __call_ret#61;
	if (!(sent#1224)) {
	assume false;
	}

	lastPlayer_re_ent23#1218 := lastPlayer_re_ent23#1218[__this := __msg_sender];
	jackpot_re_ent23#1220 := jackpot_re_ent23#1220[__this := __balance[__this]];
	$return34:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 349, 5} {:message "QurasToken::transfer"} transfer#1299(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1257: address_t, tokens#1259: int)
	returns (success#1263: bool)
{
	var sub#45_ret#63: int;
	var add#23_ret#64: int;
	var call_arg#65: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 350, 32} {:message ""} true;
	call sub#45_ret#63 := sub#45(__this, __msg_sender, __msg_value, balances#1020[__this][__msg_sender], tokens#1259);
	balances#1020 := balances#1020[__this := balances#1020[__this][__msg_sender := sub#45_ret#63]];
	assume {:sourceloc "buggy_48.sol", 351, 24} {:message ""} true;
	call add#23_ret#64 := add#23(__this, __msg_sender, __msg_value, balances#1020[__this][to#1257], tokens#1259);
	balances#1020 := balances#1020[__this := balances#1020[__this][to#1257 := add#23_ret#64]];
	call_arg#65 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 352, 14} {:message ""} true;
	call Transfer#440(__this, __msg_sender, __msg_value, call_arg#65, to#1257, tokens#1259);
	success#1263 := true;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_48.sol", 355, 1} {:message "counter_re_ent14"} counter_re_ent14#1302: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_48.sol", 356, 1} {:message "QurasToken::callme_re_ent14"} callme_re_ent14#1336(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 358, 3} {:message "success"} success#1312: bool;
	var __call_ret#66: bool;
	var __call_ret#67: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1302[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 358, 20} {:message ""} true;
	call __call_ret#66, __call_ret#67 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#66) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#66)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1312 := __call_ret#66;
	if (!(success#1312)) {
	assume false;
	}

	counter_re_ent14#1302 := counter_re_ent14#1302[__this := (counter_re_ent14#1302[__this] + 1)];
	$return36:
	// Function body ends here
}

// 
// Function: increaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 366, 5} {:message "QurasToken::increaseApproval"} increaseApproval#1377(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#1338: address_t, _addedValue#1340: int)
	returns (#1343: bool)
{
	var add#23_ret#68: int;
	var call_arg#69: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 367, 41} {:message ""} true;
	call add#23_ret#68 := add#23(__this, __msg_sender, __msg_value, allowed#1065[__this][__msg_sender][_spender#1338], _addedValue#1340);
	allowed#1065 := allowed#1065[__this := allowed#1065[__this][__msg_sender := allowed#1065[__this][__msg_sender][_spender#1338 := add#23_ret#68]]];
	call_arg#69 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 368, 14} {:message ""} true;
	call Approval#492(__this, __msg_sender, __msg_value, call_arg#69, _spender#1338, allowed#1065[__this][__msg_sender][_spender#1338]);
	#1343 := true;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_48.sol", 371, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1379: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_48.sol", 372, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1381: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_48.sol", 373, 4} {:message "QurasToken::buyTicket_re_ent30"} buyTicket_re_ent30#1416(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 374, 7} {:message "sent"} sent#1385: bool;
	var __call_ret#70: bool;
	var __call_ret#71: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent30#1381[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent30#1381[__this])];
	assume {:sourceloc "buggy_48.sol", 374, 21} {:message ""} true;
	call __call_ret#70, __call_ret#71 := __call(lastPlayer_re_ent30#1379[__this], __this, jackpot_re_ent30#1381[__this]);
	if (__call_ret#70) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#70)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent30#1381[__this])];
	}

	sent#1385 := __call_ret#70;
	if (!(sent#1385)) {
	assume false;
	}

	lastPlayer_re_ent30#1379 := lastPlayer_re_ent30#1379[__this := __msg_sender];
	jackpot_re_ent30#1381 := jackpot_re_ent30#1381[__this := __balance[__this]];
	$return38:
	// Function body ends here
}

// 
// Function: decreaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 381, 5} {:message "QurasToken::decreaseApproval"} decreaseApproval#1476(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#1418: address_t, _subtractedValue#1420: int)
	returns (#1423: bool)
{
	var {:sourceloc "buggy_48.sol", 382, 9} {:message "oldValue"} oldValue#1426: int;
	var sub#45_ret#72: int;
	var call_arg#73: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	oldValue#1426 := allowed#1065[__this][__msg_sender][_spender#1418];
	if ((_subtractedValue#1420 > oldValue#1426)) {
	allowed#1065 := allowed#1065[__this := allowed#1065[__this][__msg_sender := allowed#1065[__this][__msg_sender][_spender#1418 := 0]]];
	}
	else {
	assume {:sourceloc "buggy_48.sol", 386, 45} {:message ""} true;
	call sub#45_ret#72 := sub#45(__this, __msg_sender, __msg_value, oldValue#1426, _subtractedValue#1420);
	allowed#1065 := allowed#1065[__this := allowed#1065[__this][__msg_sender := allowed#1065[__this][__msg_sender][_spender#1418 := sub#45_ret#72]]];
	}

	call_arg#73 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 388, 14} {:message ""} true;
	call Approval#492(__this, __msg_sender, __msg_value, call_arg#73, _spender#1418, allowed#1065[__this][__msg_sender][_spender#1418]);
	#1423 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 391, 1} {:message "balances_re_ent8"} balances_re_ent8#1480: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_48.sol", 392, 5} {:message "QurasToken::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1509(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 393, 11} {:message "success"} success#1484: bool;
	var __call_ret#74: bool;
	var __call_ret#75: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1480[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1480[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 393, 28} {:message ""} true;
	call __call_ret#74, __call_ret#75 := __call(__msg_sender, __this, balances_re_ent8#1480[__this][__msg_sender]);
	if (__call_ret#74) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#74)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1480[__this][__msg_sender])];
	}

	success#1484 := __call_ret#74;
	if (success#1484) {
	balances_re_ent8#1480 := balances_re_ent8#1480[__this := balances_re_ent8#1480[__this][__msg_sender := 0]];
	}

	$return40:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 407, 5} {:message "QurasToken::approve"} approve#1538(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1511: address_t, tokens#1513: int)
	returns (success#1517: bool)
{
	var call_arg#76: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#1065 := allowed#1065[__this := allowed#1065[__this][__msg_sender := allowed#1065[__this][__msg_sender][spender#1511 := tokens#1513]]];
	call_arg#76 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 409, 14} {:message ""} true;
	call Approval#492(__this, __msg_sender, __msg_value, call_arg#76, spender#1511, tokens#1513);
	success#1517 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 412, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1542: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_48.sol", 413, 1} {:message "QurasToken::claimReward_re_ent39"} claimReward_re_ent39#1587(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 416, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1555: int;
	var {:sourceloc "buggy_48.sol", 417, 6} {:message "sent"} sent#1562: bool;
	var __call_ret#77: bool;
	var __call_ret#78: int_arr_ptr;
	var call_arg#79: int_arr_ptr;
	var new_array#80: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1542[__this][__msg_sender] > 0);
	transferValue_re_ent39#1555 := redeemableEther_re_ent39#1542[__this][__msg_sender];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= transferValue_re_ent39#1555);
	__balance := __balance[__this := (__balance[__this] - transferValue_re_ent39#1555)];
	assume {:sourceloc "buggy_48.sol", 417, 20} {:message ""} true;
	call __call_ret#77, __call_ret#78 := __call(__msg_sender, __this, transferValue_re_ent39#1555);
	if (__call_ret#77) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#77)) {
	__balance := __balance[__this := (__balance[__this] + transferValue_re_ent39#1555)];
	}

	sent#1562 := __call_ret#77;
	new_array#80 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#79 := new_array#80;
	mem_arr_int := mem_arr_int[call_arg#79 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#1562;
	redeemableEther_re_ent39#1542 := redeemableEther_re_ent39#1542[__this := redeemableEther_re_ent39#1542[__this][__msg_sender := 0]];
	$return42:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 432, 5} {:message "QurasToken::transferFrom"} transferFrom#1647(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1589: address_t, to#1591: address_t, tokens#1593: int)
	returns (success#1597: bool)
{
	var sub#45_ret#81: int;
	var sub#45_ret#82: int;
	var add#23_ret#83: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 433, 26} {:message ""} true;
	call sub#45_ret#81 := sub#45(__this, __msg_sender, __msg_value, balances#1020[__this][from#1589], tokens#1593);
	balances#1020 := balances#1020[__this := balances#1020[__this][from#1589 := sub#45_ret#81]];
	assume {:sourceloc "buggy_48.sol", 434, 37} {:message ""} true;
	call sub#45_ret#82 := sub#45(__this, __msg_sender, __msg_value, allowed#1065[__this][from#1589][__msg_sender], tokens#1593);
	allowed#1065 := allowed#1065[__this := allowed#1065[__this][from#1589 := allowed#1065[__this][from#1589][__msg_sender := sub#45_ret#82]]];
	assume {:sourceloc "buggy_48.sol", 435, 24} {:message ""} true;
	call add#23_ret#83 := add#23(__this, __msg_sender, __msg_value, balances#1020[__this][to#1591], tokens#1593);
	balances#1020 := balances#1020[__this := balances#1020[__this][to#1591 := add#23_ret#83]];
	assume {:sourceloc "buggy_48.sol", 436, 14} {:message ""} true;
	call Transfer#440(__this, __msg_sender, __msg_value, from#1589, to#1591, tokens#1593);
	success#1597 := true;
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 439, 1} {:message "balances_re_ent36"} balances_re_ent36#1651: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_48.sol", 440, 5} {:message "QurasToken::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1680(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 441, 11} {:message "sent"} sent#1655: bool;
	var __call_ret#84: bool;
	var __call_ret#85: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent36#1651[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent36#1651[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 441, 25} {:message ""} true;
	call __call_ret#84, __call_ret#85 := __call(__msg_sender, __this, balances_re_ent36#1651[__this][__msg_sender]);
	if (__call_ret#84) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#84)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent36#1651[__this][__msg_sender])];
	}

	sent#1655 := __call_ret#84;
	if (sent#1655) {
	balances_re_ent36#1651 := balances_re_ent36#1651[__this := balances_re_ent36#1651[__this][__msg_sender := 0]];
	}

	$return44:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 451, 5} {:message "QurasToken::allowance"} allowance#1697(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1682: address_t, spender#1684: address_t)
	returns (remaining#1688: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1688 := allowed#1065[__this][tokenOwner#1682][spender#1684];
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_48.sol", 454, 1} {:message "counter_re_ent35"} counter_re_ent35#1700: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_48.sol", 455, 1} {:message "QurasToken::callme_re_ent35"} callme_re_ent35#1734(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 457, 3} {:message "success"} success#1710: bool;
	var __call_ret#86: bool;
	var __call_ret#87: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1700[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_48.sol", 457, 20} {:message ""} true;
	call __call_ret#86, __call_ret#87 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#86) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#86)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1710 := __call_ret#86;
	if (!(success#1710)) {
	assume false;
	}

	counter_re_ent35#1700 := counter_re_ent35#1700[__this := (counter_re_ent35#1700[__this] + 1)];
	$return46:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_48.sol", 470, 5} {:message "QurasToken::approveAndCall"} approveAndCall#1778(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1736: address_t, tokens#1738: int, data#1740: int_arr_ptr)
	returns (success#1743: bool)
{
	var call_arg#88: address_t;
	var call_arg#89: address_t;
	// TCC assumptions
	assume (data#1740 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#1065 := allowed#1065[__this := allowed#1065[__this][__msg_sender := allowed#1065[__this][__msg_sender][spender#1736 := tokens#1738]]];
	call_arg#88 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 472, 14} {:message ""} true;
	call Approval#492(__this, __msg_sender, __msg_value, call_arg#88, spender#1736, tokens#1738);
	call_arg#89 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 473, 9} {:message ""} true;
	call receiveApproval#504(spender#1736, __this, 0, call_arg#89, tokens#1738, __this, data#1740);
	success#1743 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 476, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1782: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_48.sol", 477, 1} {:message "QurasToken::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1816(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 480, 10} {:message "success"} success#1786: bool;
	var __call_ret#90: bool;
	var __call_ret#91: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1782[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1782[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 480, 27} {:message ""} true;
	call __call_ret#90, __call_ret#91 := __call(__msg_sender, __this, userBalance_re_ent40#1782[__this][__msg_sender]);
	if (__call_ret#90) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#90)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1782[__this][__msg_sender])];
	}

	success#1786 := __call_ret#90;
	if (!(success#1786)) {
	assume false;
	}

	userBalance_re_ent40#1782 := userBalance_re_ent40#1782[__this := userBalance_re_ent40#1782[__this][__msg_sender := 0]];
	$return48:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 491, 5} {:message "QurasToken::transferAnyERC20Token"} transferAnyERC20Token#1836(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1818: address_t, tokens#1820: int)
	returns (success#1825: bool)
{
	var transfer#251_ret#94: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#578[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 492, 16} {:message ""} true;
	call transfer#251_ret#94 := transfer#251(tokenAddress#1818, __this, 0, owner#578[__this], tokens#1820);
	success#1825 := transfer#251_ret#94;
	goto $return50;
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 494, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1840: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_48.sol", 495, 1} {:message "QurasToken::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1874(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 498, 6} {:message "success"} success#1844: bool;
	var __call_ret#95: bool;
	var __call_ret#96: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1840[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1840[__this][__msg_sender])];
	assume {:sourceloc "buggy_48.sol", 498, 23} {:message ""} true;
	call __call_ret#95, __call_ret#96 := __call(__msg_sender, __this, userBalance_re_ent33#1840[__this][__msg_sender]);
	if (__call_ret#95) {
	havoc redeemableEther_re_ent11#858;
	havoc symbol#905;
	havoc balances_re_ent1#909;
	havoc name#940;
	havoc not_called_re_ent41#943;
	havoc decimals#977;
	havoc counter_re_ent42#980;
	havoc _totalSupply#1016;
	havoc balances#1020;
	havoc lastPlayer_re_ent2#1022;
	havoc jackpot_re_ent2#1024;
	havoc allowed#1065;
	havoc redeemableEther_re_ent4#1104;
	havoc counter_re_ent7#1169;
	havoc lastPlayer_re_ent23#1218;
	havoc jackpot_re_ent23#1220;
	havoc counter_re_ent14#1302;
	havoc lastPlayer_re_ent30#1379;
	havoc jackpot_re_ent30#1381;
	havoc balances_re_ent8#1480;
	havoc redeemableEther_re_ent39#1542;
	havoc balances_re_ent36#1651;
	havoc counter_re_ent35#1700;
	havoc userBalance_re_ent40#1782;
	havoc userBalance_re_ent33#1840;
	havoc balances_re_ent21#547;
	havoc owner#578;
	havoc userBalance_re_ent12#582;
	havoc newOwner#618;
	havoc not_called_re_ent13#621;
	havoc not_called_re_ent20#671;
	havoc redeemableEther_re_ent32#730;
	havoc balances_re_ent38#806;
	havoc balances_re_ent17#105;
	havoc lastPlayer_re_ent37#153;
	havoc jackpot_re_ent37#155;
	havoc balances_re_ent3#203;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc redeemableEther_re_ent25#303;
	havoc userBalance_re_ent19#363;
	havoc not_called_re_ent27#400;
	havoc balances_re_ent31#444;
	havoc __balance;
	}

	if (!(__call_ret#95)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1840[__this][__msg_sender])];
	}

	success#1844 := __call_ret#95;
	if (!(success#1844)) {
	assume false;
	}

	userBalance_re_ent33#1840 := userBalance_re_ent33#1840[__this := userBalance_re_ent33#1840[__this][__msg_sender := 0]];
	$return51:
	// Function body ends here
}

