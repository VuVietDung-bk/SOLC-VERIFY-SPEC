// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_47.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_47.sol", 73, 5} {:message "[event] ERC20Interface::Transfer"} Transfer#301(__this: address_t, __msg_sender: address_t, __msg_value: int, from#295: address_t, to#297: address_t, tokens#299: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_47.sol", 74, 5} {:message "[event] ERC20Interface::Approval"} Approval#309(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#303: address_t, spender#305: address_t, tokens#307: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 12, 5} {:message "ERC20Interface::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);
	modifies balances_re_ent17#10, lastPlayer_re_ent37#58, jackpot_re_ent37#60, balances_re_ent3#108, lastPlayer_re_ent9#158, jackpot_re_ent9#160, redeemableEther_re_ent25#208, userBalance_re_ent19#259;

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 13, 1} {:message "balances_re_ent17"} balances_re_ent17#10: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_47.sol", 14, 1} {:message "ERC20Interface::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#49(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#12: int)
{
	var {:sourceloc "buggy_47.sol", 17, 10} {:message "success"} success#25: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#10[__this][__msg_sender] >= _weiToWithdraw#12);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#12);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#12)];
	assume {:sourceloc "buggy_47.sol", 17, 27} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, _weiToWithdraw#12);
	if (__call_ret#0) {
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#12)];
	}

	success#25 := __call_ret#0;
	assume success#25;
	balances_re_ent17#10 := balances_re_ent17#10[__this := balances_re_ent17#10[__this][__msg_sender := (balances_re_ent17#10[__this][__msg_sender] - _weiToWithdraw#12)]];
	$return0:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 21, 5} {:message "ERC20Interface::balanceOf"} balanceOf#56(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#51: address_t)
	returns (balance#54: int);
	modifies balances_re_ent17#10, lastPlayer_re_ent37#58, jackpot_re_ent37#60, balances_re_ent3#108, lastPlayer_re_ent9#158, jackpot_re_ent9#160, redeemableEther_re_ent25#208, userBalance_re_ent19#259;

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_47.sol", 22, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#58: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_47.sol", 23, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#60: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_47.sol", 24, 4} {:message "ERC20Interface::buyTicket_re_ent37"} buyTicket_re_ent37#95(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 25, 7} {:message "sent"} sent#64: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent37#60[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent37#60[__this])];
	assume {:sourceloc "buggy_47.sol", 25, 21} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(lastPlayer_re_ent37#58[__this], __this, jackpot_re_ent37#60[__this]);
	if (__call_ret#2) {
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent37#60[__this])];
	}

	sent#64 := __call_ret#2;
	if (!(sent#64)) {
	assume false;
	}

	lastPlayer_re_ent37#58 := lastPlayer_re_ent37#58[__this := __msg_sender];
	jackpot_re_ent37#60 := jackpot_re_ent37#60[__this := __balance[__this]];
	$return1:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 31, 5} {:message "ERC20Interface::transfer"} transfer#104(__this: address_t, __msg_sender: address_t, __msg_value: int, to#97: address_t, tokens#99: int)
	returns (success#102: bool);
	modifies balances_re_ent17#10, lastPlayer_re_ent37#58, jackpot_re_ent37#60, balances_re_ent3#108, lastPlayer_re_ent9#158, jackpot_re_ent9#160, redeemableEther_re_ent25#208, userBalance_re_ent19#259;

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 32, 1} {:message "balances_re_ent3"} balances_re_ent3#108: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 33, 1} {:message "ERC20Interface::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#147(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#110: int)
{
	var {:sourceloc "buggy_47.sol", 36, 3} {:message "success"} success#123: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#108[__this][__msg_sender] >= _weiToWithdraw#110);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#110);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#110)];
	assume {:sourceloc "buggy_47.sol", 36, 20} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(__msg_sender, __this, _weiToWithdraw#110);
	if (__call_ret#4) {
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#110)];
	}

	success#123 := __call_ret#4;
	assume success#123;
	balances_re_ent3#108 := balances_re_ent3#108[__this := balances_re_ent3#108[__this][__msg_sender := (balances_re_ent3#108[__this][__msg_sender] - _weiToWithdraw#110)]];
	$return2:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 42, 5} {:message "ERC20Interface::allowance"} allowance#156(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#149: address_t, spender#151: address_t)
	returns (remaining#154: int);
	modifies balances_re_ent17#10, lastPlayer_re_ent37#58, jackpot_re_ent37#60, balances_re_ent3#108, lastPlayer_re_ent9#158, jackpot_re_ent9#160, redeemableEther_re_ent25#208, userBalance_re_ent19#259;

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_47.sol", 43, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#158: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_47.sol", 44, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#160: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_47.sol", 45, 4} {:message "ERC20Interface::buyTicket_re_ent9"} buyTicket_re_ent9#195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 46, 7} {:message "success"} success#164: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#160[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#160[__this])];
	assume {:sourceloc "buggy_47.sol", 46, 24} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(lastPlayer_re_ent9#158[__this], __this, jackpot_re_ent9#160[__this]);
	if (__call_ret#6) {
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#160[__this])];
	}

	success#164 := __call_ret#6;
	if (!(success#164)) {
	assume false;
	}

	lastPlayer_re_ent9#158 := lastPlayer_re_ent9#158[__this := __msg_sender];
	jackpot_re_ent9#160 := jackpot_re_ent9#160[__this := __balance[__this]];
	$return3:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 52, 5} {:message "ERC20Interface::approve"} approve#204(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#197: address_t, tokens#199: int)
	returns (success#202: bool);
	modifies balances_re_ent17#10, lastPlayer_re_ent37#58, jackpot_re_ent37#60, balances_re_ent3#108, lastPlayer_re_ent9#158, jackpot_re_ent9#160, redeemableEther_re_ent25#208, userBalance_re_ent19#259;

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 53, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#208: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_47.sol", 54, 1} {:message "ERC20Interface::claimReward_re_ent25"} claimReward_re_ent25#244(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 57, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#221: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#208[__this][__msg_sender] > 0);
	transferValue_re_ent25#221 := redeemableEther_re_ent25#208[__this][__msg_sender];
	assume {:sourceloc "buggy_47.sol", 58, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#221);
	redeemableEther_re_ent25#208 := redeemableEther_re_ent25#208[__this := redeemableEther_re_ent25#208[__this][__msg_sender := 0]];
	$return4:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 61, 5} {:message "ERC20Interface::transferFrom"} transferFrom#255(__this: address_t, __msg_sender: address_t, __msg_value: int, from#246: address_t, to#248: address_t, tokens#250: int)
	returns (success#253: bool);
	modifies balances_re_ent17#10, lastPlayer_re_ent37#58, jackpot_re_ent37#60, balances_re_ent3#108, lastPlayer_re_ent9#158, jackpot_re_ent9#160, redeemableEther_re_ent25#208, userBalance_re_ent19#259;

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 62, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#259: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_47.sol", 63, 1} {:message "ERC20Interface::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#293(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 66, 10} {:message "success"} success#263: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent19#259[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent19#259[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 66, 27} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, userBalance_re_ent19#259[__this][__msg_sender]);
	if (__call_ret#8) {
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent19#259[__this][__msg_sender])];
	}

	success#263 := __call_ret#8;
	if (!(success#263)) {
	assume false;
	}

	userBalance_re_ent19#259 := userBalance_re_ent19#259[__this := userBalance_re_ent19#259[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "buggy_47.sol", 11, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#310(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	balances_re_ent17#10 := balances_re_ent17#10[__this := default_address_t_int()];
	lastPlayer_re_ent37#58 := lastPlayer_re_ent37#58[__this := 0];
	jackpot_re_ent37#60 := jackpot_re_ent37#60[__this := 0];
	balances_re_ent3#108 := balances_re_ent3#108[__this := default_address_t_int()];
	lastPlayer_re_ent9#158 := lastPlayer_re_ent9#158[__this := 0];
	jackpot_re_ent9#160 := jackpot_re_ent9#160[__this := 0];
	redeemableEther_re_ent25#208 := redeemableEther_re_ent25#208[__this := default_address_t_int()];
	userBalance_re_ent19#259 := userBalance_re_ent19#259[__this := default_address_t_int()];
}

// 
// ------- Contract: AcunarToken -------
// Inherits from: ERC20Interface
// 
// State variable: not_called_re_ent6: bool
var {:sourceloc "buggy_47.sol", 78, 3} {:message "not_called_re_ent6"} not_called_re_ent6#315: [address_t]bool;
// 
// Function: bug_re_ent6 : function ()
procedure {:sourceloc "buggy_47.sol", 79, 1} {:message "AcunarToken::bug_re_ent6"} bug_re_ent6#347(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 81, 10} {:message "success"} success#323: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent6#315[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 81, 27} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#10) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#323 := __call_ret#10;
	if (!(success#323)) {
	assume false;
	}

	not_called_re_ent6#315 := not_called_re_ent6#315[__this := false];
	$return6:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_47.sol", 87, 3} {:message "name"} name#350: [address_t]int_arr_type;
// 
// State variable: lastPlayer_re_ent16: address payable
var {:sourceloc "buggy_47.sol", 88, 3} {:message "lastPlayer_re_ent16"} lastPlayer_re_ent16#352: [address_t]address_t;
// 
// State variable: jackpot_re_ent16: uint256
var {:sourceloc "buggy_47.sol", 89, 7} {:message "jackpot_re_ent16"} jackpot_re_ent16#354: [address_t]int;
// 
// Function: buyTicket_re_ent16 : function ()
procedure {:sourceloc "buggy_47.sol", 90, 4} {:message "AcunarToken::buyTicket_re_ent16"} buyTicket_re_ent16#389(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 91, 7} {:message "sent"} sent#358: bool;
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent16#354[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent16#354[__this])];
	assume {:sourceloc "buggy_47.sol", 91, 21} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(lastPlayer_re_ent16#352[__this], __this, jackpot_re_ent16#354[__this]);
	if (__call_ret#12) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent16#354[__this])];
	}

	sent#358 := __call_ret#12;
	if (!(sent#358)) {
	assume false;
	}

	lastPlayer_re_ent16#352 := lastPlayer_re_ent16#352[__this := __msg_sender];
	jackpot_re_ent16#354 := jackpot_re_ent16#354[__this := __balance[__this]];
	$return7:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_47.sol", 97, 3} {:message "symbol"} symbol#392: [address_t]int_arr_type;
// 
// State variable: balances_re_ent24: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 98, 3} {:message "balances_re_ent24"} balances_re_ent24#396: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent24 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 99, 1} {:message "AcunarToken::withdrawFunds_re_ent24"} withdrawFunds_re_ent24#436(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#398: int)
{
	var {:sourceloc "buggy_47.sol", 102, 6} {:message "sent"} sent#411: bool;
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	var call_arg#16: int_arr_ptr;
	var new_array#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent24#396[__this][__msg_sender] >= _weiToWithdraw#398);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#398);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#398)];
	assume {:sourceloc "buggy_47.sol", 102, 20} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(__msg_sender, __this, _weiToWithdraw#398);
	if (__call_ret#14) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#14)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#398)];
	}

	sent#411 := __call_ret#14;
	new_array#17 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#16 := new_array#17;
	mem_arr_int := mem_arr_int[call_arg#16 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#411;
	balances_re_ent24#396 := balances_re_ent24#396[__this := balances_re_ent24#396[__this][__msg_sender := (balances_re_ent24#396[__this][__msg_sender] - _weiToWithdraw#398)]];
	$return8:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_47.sol", 106, 3} {:message "decimals"} decimals#439: [address_t]int;
// 
// State variable: userBalance_re_ent5: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 108, 3} {:message "userBalance_re_ent5"} userBalance_re_ent5#443: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent5 : function ()
procedure {:sourceloc "buggy_47.sol", 109, 1} {:message "AcunarToken::withdrawBalance_re_ent5"} withdrawBalance_re_ent5#477(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 112, 10} {:message "success"} success#447: bool;
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent5#443[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent5#443[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 112, 27} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(__msg_sender, __this, userBalance_re_ent5#443[__this][__msg_sender]);
	if (__call_ret#18) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#18)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent5#443[__this][__msg_sender])];
	}

	success#447 := __call_ret#18;
	if (!(success#447)) {
	assume false;
	}

	userBalance_re_ent5#443 := userBalance_re_ent5#443[__this := userBalance_re_ent5#443[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// State variable: supply: uint256
var {:sourceloc "buggy_47.sol", 118, 3} {:message "supply"} supply#479: [address_t]int;
// 
// State variable: balances_re_ent15: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 119, 3} {:message "balances_re_ent15"} balances_re_ent15#483: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent15 : function ()
procedure {:sourceloc "buggy_47.sol", 120, 5} {:message "AcunarToken::withdraw_balances_re_ent15"} withdraw_balances_re_ent15#512(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 121, 11} {:message "sent"} sent#487: bool;
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent15#483[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent15#483[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 121, 25} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(__msg_sender, __this, balances_re_ent15#483[__this][__msg_sender]);
	if (__call_ret#20) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent15#483[__this][__msg_sender])];
	}

	sent#487 := __call_ret#20;
	if (sent#487) {
	balances_re_ent15#483 := balances_re_ent15#483[__this := balances_re_ent15#483[__this][__msg_sender := 0]];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: founder: address
var {:sourceloc "buggy_47.sol", 125, 3} {:message "founder"} founder#514: [address_t]address_t;
// 
// State variable: counter_re_ent28: uint256
var {:sourceloc "buggy_47.sol", 127, 3} {:message "counter_re_ent28"} counter_re_ent28#517: [address_t]int;
// 
// Function: callme_re_ent28 : function ()
procedure {:sourceloc "buggy_47.sol", 128, 1} {:message "AcunarToken::callme_re_ent28"} callme_re_ent28#551(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 130, 3} {:message "success"} success#527: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent28#517[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 130, 20} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#22) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#527 := __call_ret#22;
	if (!(success#527)) {
	assume false;
	}

	counter_re_ent28#517 := counter_re_ent28#517[__this := (counter_re_ent28#517[__this] + 1)];
	$return11:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 136, 3} {:message "balances"} balances#555: [address_t][address_t]int;
// 
// State variable: not_called_re_ent34: bool
var {:sourceloc "buggy_47.sol", 138, 3} {:message "not_called_re_ent34"} not_called_re_ent34#558: [address_t]bool;
// 
// Function: bug_re_ent34 : function ()
procedure {:sourceloc "buggy_47.sol", 139, 1} {:message "AcunarToken::bug_re_ent34"} bug_re_ent34#590(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 141, 10} {:message "success"} success#566: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent34#558[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 141, 27} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#24) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#566 := __call_ret#24;
	if (!(success#566)) {
	assume false;
	}

	not_called_re_ent34#558 := not_called_re_ent34#558[__this := false];
	$return12:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_47.sol", 147, 3} {:message "allowed"} allowed#596: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 152, 5} {:message "AcunarToken::[constructor]"} __constructor#1071(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent6#315 := not_called_re_ent6#315[__this := true];
	name#350 := name#350[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	lastPlayer_re_ent16#352 := lastPlayer_re_ent16#352[__this := 0];
	jackpot_re_ent16#354 := jackpot_re_ent16#354[__this := 0];
	symbol#392 := symbol#392[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	balances_re_ent24#396 := balances_re_ent24#396[__this := default_address_t_int()];
	decimals#439 := decimals#439[__this := 0];
	userBalance_re_ent5#443 := userBalance_re_ent5#443[__this := default_address_t_int()];
	supply#479 := supply#479[__this := 0];
	balances_re_ent15#483 := balances_re_ent15#483[__this := default_address_t_int()];
	founder#514 := founder#514[__this := 0];
	counter_re_ent28#517 := counter_re_ent28#517[__this := 0];
	balances#555 := balances#555[__this := default_address_t_int()];
	not_called_re_ent34#558 := not_called_re_ent34#558[__this := true];
	allowed#596 := allowed#596[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent26#619 := userBalance_re_ent26#619[__this := default_address_t_int()];
	not_called_re_ent20#673 := not_called_re_ent20#673[__this := true];
	redeemableEther_re_ent32#753 := redeemableEther_re_ent32#753[__this := default_address_t_int()];
	balances_re_ent38#846 := balances_re_ent38#846[__this := default_address_t_int()];
	redeemableEther_re_ent4#899 := redeemableEther_re_ent4#899[__this := default_address_t_int()];
	counter_re_ent7#951 := counter_re_ent7#951[__this := 0];
	lastPlayer_re_ent23#1033 := lastPlayer_re_ent23#1033[__this := 0];
	jackpot_re_ent23#1035 := jackpot_re_ent23#1035[__this := 0];
	balances_re_ent17#10 := balances_re_ent17#10[__this := default_address_t_int()];
	lastPlayer_re_ent37#58 := lastPlayer_re_ent37#58[__this := 0];
	jackpot_re_ent37#60 := jackpot_re_ent37#60[__this := 0];
	balances_re_ent3#108 := balances_re_ent3#108[__this := default_address_t_int()];
	lastPlayer_re_ent9#158 := lastPlayer_re_ent9#158[__this := 0];
	jackpot_re_ent9#160 := jackpot_re_ent9#160[__this := 0];
	redeemableEther_re_ent25#208 := redeemableEther_re_ent25#208[__this := default_address_t_int()];
	userBalance_re_ent19#259 := userBalance_re_ent19#259[__this := default_address_t_int()];
	// Function body starts here
	supply#479 := supply#479[__this := 200000000];
	founder#514 := founder#514[__this := __msg_sender];
	balances#555 := balances#555[__this := balances#555[__this][founder#514[__this] := supply#479[__this]]];
	$return13:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 157, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#619: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_47.sol", 158, 1} {:message "AcunarToken::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#653(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 161, 10} {:message "success"} success#623: bool;
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#619[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#619[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 161, 27} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(__msg_sender, __this, userBalance_re_ent26#619[__this][__msg_sender]);
	if (__call_ret#26) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#619[__this][__msg_sender])];
	}

	success#623 := __call_ret#26;
	if (!(success#623)) {
	assume false;
	}

	userBalance_re_ent26#619 := userBalance_re_ent26#619[__this := userBalance_re_ent26#619[__this][__msg_sender := 0]];
	$return14:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 169, 5} {:message "AcunarToken::allowance"} allowance#670(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#655: address_t, spender#657: address_t)
	returns (#661: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#661 := allowed#596[__this][tokenOwner#655][spender#657];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_47.sol", 172, 1} {:message "not_called_re_ent20"} not_called_re_ent20#673: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_47.sol", 173, 1} {:message "AcunarToken::bug_re_ent20"} bug_re_ent20#705(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 175, 10} {:message "success"} success#681: bool;
	var __call_ret#28: bool;
	var __call_ret#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#673[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 175, 27} {:message ""} true;
	call __call_ret#28, __call_ret#29 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#28) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#28)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#681 := __call_ret#28;
	if (!(success#681)) {
	assume false;
	}

	not_called_re_ent20#673 := not_called_re_ent20#673[__this := false];
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 184, 5} {:message "AcunarToken::approve"} approve#749(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#707: address_t, tokens#709: int)
	returns (#713: bool)
{
	var call_arg#30: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#555[__this][__msg_sender] >= tokens#709);
	assume (tokens#709 > 0);
	allowed#596 := allowed#596[__this := allowed#596[__this][__msg_sender := allowed#596[__this][__msg_sender][spender#707 := tokens#709]]];
	call_arg#30 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 189, 14} {:message ""} true;
	call Approval#309(__this, __msg_sender, __msg_value, call_arg#30, spender#707, tokens#709);
	#713 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 192, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#753: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_47.sol", 193, 1} {:message "AcunarToken::claimReward_re_ent32"} claimReward_re_ent32#789(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 196, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#766: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#753[__this][__msg_sender] > 0);
	transferValue_re_ent32#766 := redeemableEther_re_ent32#753[__this][__msg_sender];
	assume {:sourceloc "buggy_47.sol", 197, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#766);
	redeemableEther_re_ent32#753 := redeemableEther_re_ent32#753[__this := redeemableEther_re_ent32#753[__this][__msg_sender := 0]];
	$return18:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 202, 5} {:message "AcunarToken::transferFrom"} transferFrom#842(__this: address_t, __msg_sender: address_t, __msg_value: int, from#791: address_t, to#793: address_t, tokens#795: int)
	returns (#799: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#596[__this][from#791][to#793] >= tokens#795);
	assume (balances#555[__this][from#791] >= tokens#795);
	balances#555 := balances#555[__this := balances#555[__this][from#791 := (balances#555[__this][from#791] - tokens#795)]];
	balances#555 := balances#555[__this := balances#555[__this][to#793 := (balances#555[__this][to#793] + tokens#795)]];
	allowed#596 := allowed#596[__this := allowed#596[__this][from#791 := allowed#596[__this][from#791][to#793 := (allowed#596[__this][from#791][to#793] - tokens#795)]]];
	#799 := true;
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 214, 1} {:message "balances_re_ent38"} balances_re_ent38#846: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 215, 1} {:message "AcunarToken::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#886(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#848: int)
{
	var {:sourceloc "buggy_47.sol", 218, 6} {:message "sent"} sent#861: bool;
	var __call_ret#31: bool;
	var __call_ret#32: int_arr_ptr;
	var call_arg#33: int_arr_ptr;
	var new_array#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#846[__this][__msg_sender] >= _weiToWithdraw#848);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#848);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#848)];
	assume {:sourceloc "buggy_47.sol", 218, 20} {:message ""} true;
	call __call_ret#31, __call_ret#32 := __call(__msg_sender, __this, _weiToWithdraw#848);
	if (__call_ret#31) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#31)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#848)];
	}

	sent#861 := __call_ret#31;
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#33 := new_array#34;
	mem_arr_int := mem_arr_int[call_arg#33 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#861;
	balances_re_ent38#846 := balances_re_ent38#846[__this := balances_re_ent38#846[__this][__msg_sender := (balances_re_ent38#846[__this][__msg_sender] - _weiToWithdraw#848)]];
	$return20:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 223, 5} {:message "AcunarToken::totalSupply"} totalSupply#895(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#890: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#890 := supply#479[__this];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 226, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#899: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_47.sol", 227, 1} {:message "AcunarToken::claimReward_re_ent4"} claimReward_re_ent4#935(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 230, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#912: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#899[__this][__msg_sender] > 0);
	transferValue_re_ent4#912 := redeemableEther_re_ent4#899[__this][__msg_sender];
	assume {:sourceloc "buggy_47.sol", 231, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#912);
	redeemableEther_re_ent4#899 := redeemableEther_re_ent4#899[__this := redeemableEther_re_ent4#899[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 235, 5} {:message "AcunarToken::balanceOf"} balanceOf#948(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#937: address_t)
	returns (balance#941: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#941 := balances#555[__this][tokenOwner#937];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_47.sol", 238, 1} {:message "counter_re_ent7"} counter_re_ent7#951: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_47.sol", 239, 1} {:message "AcunarToken::callme_re_ent7"} callme_re_ent7#985(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 241, 3} {:message "success"} success#961: bool;
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#951[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 241, 20} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#35) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#961 := __call_ret#35;
	if (!(success#961)) {
	assume false;
	}

	counter_re_ent7#951 := counter_re_ent7#951[__this := (counter_re_ent7#951[__this] + 1)];
	$return24:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 249, 5} {:message "AcunarToken::transfer"} transfer#1031(__this: address_t, __msg_sender: address_t, __msg_value: int, to#987: address_t, tokens#989: int)
	returns (success#993: bool)
{
	var call_arg#37: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((balances#555[__this][__msg_sender] >= tokens#989) && (tokens#989 > 0));
	balances#555 := balances#555[__this := balances#555[__this][to#987 := (balances#555[__this][to#987] + tokens#989)]];
	balances#555 := balances#555[__this := balances#555[__this][__msg_sender := (balances#555[__this][__msg_sender] - tokens#989)]];
	call_arg#37 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 254, 15} {:message ""} true;
	call Transfer#301(__this, __msg_sender, __msg_value, call_arg#37, to#987, tokens#989);
	success#993 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_47.sol", 257, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1033: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_47.sol", 258, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1035: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_47.sol", 259, 4} {:message "AcunarToken::buyTicket_re_ent23"} buyTicket_re_ent23#1070(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 260, 7} {:message "sent"} sent#1039: bool;
	var __call_ret#38: bool;
	var __call_ret#39: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent23#1035[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent23#1035[__this])];
	assume {:sourceloc "buggy_47.sol", 260, 21} {:message ""} true;
	call __call_ret#38, __call_ret#39 := __call(lastPlayer_re_ent23#1033[__this], __this, jackpot_re_ent23#1035[__this]);
	if (__call_ret#38) {
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#38)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent23#1035[__this])];
	}

	sent#1039 := __call_ret#38;
	if (!(sent#1039)) {
	assume false;
	}

	lastPlayer_re_ent23#1033 := lastPlayer_re_ent23#1033[__this := __msg_sender];
	jackpot_re_ent23#1035 := jackpot_re_ent23#1035[__this := __balance[__this]];
	$return26:
	// Function body ends here
}

// 
// ------- Contract: AcunarIEO -------
// Inherits from: AcunarToken
// 
// Event: Invest
procedure {:inline 1} {:sourceloc "buggy_47.sol", 384, 3} {:message "[event] AcunarIEO::Invest"} Invest#1503(__this: address_t, __msg_sender: address_t, __msg_value: int, investor#1497: address_t, value#1499: int, tokens#1501: int)
{
	
}

// 
// State variable: counter_re_ent21: uint256
var {:sourceloc "buggy_47.sol", 270, 3} {:message "counter_re_ent21"} counter_re_ent21#1076: [address_t]int;
// 
// Function: callme_re_ent21 : function ()
procedure {:sourceloc "buggy_47.sol", 271, 1} {:message "AcunarIEO::callme_re_ent21"} callme_re_ent21#1110(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 273, 3} {:message "success"} success#1086: bool;
	var __call_ret#40: bool;
	var __call_ret#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent21#1076[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 273, 20} {:message ""} true;
	call __call_ret#40, __call_ret#41 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#40) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#40)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1086 := __call_ret#40;
	if (!(success#1086)) {
	assume false;
	}

	counter_re_ent21#1076 := counter_re_ent21#1076[__this := (counter_re_ent21#1076[__this] + 1)];
	$return27:
	// Function body ends here
}

// 
// State variable: admin: address
var {:sourceloc "buggy_47.sol", 279, 3} {:message "admin"} admin#1112: [address_t]address_t;
// 
// State variable: balances_re_ent10: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 284, 3} {:message "balances_re_ent10"} balances_re_ent10#1116: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent10 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 285, 1} {:message "AcunarIEO::withdrawFunds_re_ent10"} withdrawFunds_re_ent10#1156(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1118: int)
{
	var {:sourceloc "buggy_47.sol", 288, 6} {:message "sent"} sent#1131: bool;
	var __call_ret#42: bool;
	var __call_ret#43: int_arr_ptr;
	var call_arg#44: int_arr_ptr;
	var new_array#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent10#1116[__this][__msg_sender] >= _weiToWithdraw#1118);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1118);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1118)];
	assume {:sourceloc "buggy_47.sol", 288, 20} {:message ""} true;
	call __call_ret#42, __call_ret#43 := __call(__msg_sender, __this, _weiToWithdraw#1118);
	if (__call_ret#42) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#42)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1118)];
	}

	sent#1131 := __call_ret#42;
	new_array#45 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#44 := new_array#45;
	mem_arr_int := mem_arr_int[call_arg#44 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#1131;
	balances_re_ent10#1116 := balances_re_ent10#1116[__this := balances_re_ent10#1116[__this][__msg_sender := (balances_re_ent10#1116[__this][__msg_sender] - _weiToWithdraw#1118)]];
	$return28:
	// Function body ends here
}

// 
// State variable: deposit: address payable
var {:sourceloc "buggy_47.sol", 292, 3} {:message "deposit"} deposit#1158: [address_t]address_t;
// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 295, 3} {:message "balances_re_ent21"} balances_re_ent21#1162: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_47.sol", 296, 5} {:message "AcunarIEO::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#1191(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 297, 11} {:message "success"} success#1166: bool;
	var __call_ret#46: bool;
	var __call_ret#47: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#1162[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#1162[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 297, 28} {:message ""} true;
	call __call_ret#46, __call_ret#47 := __call(__msg_sender, __this, balances_re_ent21#1162[__this][__msg_sender]);
	if (__call_ret#46) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#46)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#1162[__this][__msg_sender])];
	}

	success#1166 := __call_ret#46;
	if (success#1166) {
	balances_re_ent21#1162 := balances_re_ent21#1162[__this := balances_re_ent21#1162[__this][__msg_sender := 0]];
	}

	$return29:
	// Function body ends here
}

// 
// State variable: tokenPrice: uint256
var {:sourceloc "buggy_47.sol", 301, 3} {:message "tokenPrice"} tokenPrice#1194: [address_t]int;
// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 304, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#1198: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_47.sol", 305, 1} {:message "AcunarIEO::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#1232(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 308, 10} {:message "success"} success#1202: bool;
	var __call_ret#48: bool;
	var __call_ret#49: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent12#1198[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent12#1198[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 308, 27} {:message ""} true;
	call __call_ret#48, __call_ret#49 := __call(__msg_sender, __this, userBalance_re_ent12#1198[__this][__msg_sender]);
	if (__call_ret#48) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#48)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent12#1198[__this][__msg_sender])];
	}

	success#1202 := __call_ret#48;
	if (!(success#1202)) {
	assume false;
	}

	userBalance_re_ent12#1198 := userBalance_re_ent12#1198[__this := userBalance_re_ent12#1198[__this][__msg_sender := 0]];
	$return30:
	// Function body ends here
}

// 
// State variable: hardCap: uint256
var {:sourceloc "buggy_47.sol", 314, 3} {:message "hardCap"} hardCap#1235: [address_t]int;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 316, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#1239: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_47.sol", 317, 1} {:message "AcunarIEO::claimReward_re_ent11"} claimReward_re_ent11#1275(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 320, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#1252: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#1239[__this][__msg_sender] > 0);
	transferValue_re_ent11#1252 := redeemableEther_re_ent11#1239[__this][__msg_sender];
	assume {:sourceloc "buggy_47.sol", 321, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#1252);
	redeemableEther_re_ent11#1239 := redeemableEther_re_ent11#1239[__this := redeemableEther_re_ent11#1239[__this][__msg_sender := 0]];
	$return31:
	// Function body ends here
}

// 
// State variable: raisedAmount: uint256
var {:sourceloc "buggy_47.sol", 324, 3} {:message "raisedAmount"} raisedAmount#1277: [address_t]int;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 326, 3} {:message "balances_re_ent1"} balances_re_ent1#1281: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_47.sol", 327, 5} {:message "AcunarIEO::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#1310(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 328, 15} {:message "success"} success#1285: bool;
	var __call_ret#50: bool;
	var __call_ret#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#1281[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#1281[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 328, 32} {:message ""} true;
	call __call_ret#50, __call_ret#51 := __call(__msg_sender, __this, balances_re_ent1#1281[__this][__msg_sender]);
	if (__call_ret#50) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#50)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#1281[__this][__msg_sender])];
	}

	success#1285 := __call_ret#50;
	if (success#1285) {
	balances_re_ent1#1281 := balances_re_ent1#1281[__this := balances_re_ent1#1281[__this][__msg_sender := 0]];
	}

	$return32:
	// Function body ends here
}

// 
// State variable: saleStart: uint256
var {:sourceloc "buggy_47.sol", 332, 5} {:message "saleStart"} saleStart#1314: [address_t]int;
// 
// State variable: saleEnd: uint256
var {:sourceloc "buggy_47.sol", 333, 9} {:message "saleEnd"} saleEnd#1320: [address_t]int;
// 
// State variable: coinTradeStart: uint256
var {:sourceloc "buggy_47.sol", 334, 9} {:message "coinTradeStart"} coinTradeStart#1325: [address_t]int;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_47.sol", 336, 3} {:message "not_called_re_ent41"} not_called_re_ent41#1328: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_47.sol", 337, 1} {:message "AcunarIEO::bug_re_ent41"} bug_re_ent41#1360(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 339, 10} {:message "success"} success#1336: bool;
	var __call_ret#52: bool;
	var __call_ret#53: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#1328[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 339, 27} {:message ""} true;
	call __call_ret#52, __call_ret#53 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#52) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#52)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1336 := __call_ret#52;
	if (!(success#1336)) {
	assume false;
	}

	not_called_re_ent41#1328 := not_called_re_ent41#1328[__this := false];
	$return33:
	// Function body ends here
}

// 
// State variable: maxInvestment: uint256
var {:sourceloc "buggy_47.sol", 345, 3} {:message "maxInvestment"} maxInvestment#1363: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_47.sol", 346, 3} {:message "counter_re_ent42"} counter_re_ent42#1366: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_47.sol", 347, 1} {:message "AcunarIEO::callme_re_ent42"} callme_re_ent42#1400(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 349, 3} {:message "success"} success#1376: bool;
	var __call_ret#54: bool;
	var __call_ret#55: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#1366[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 349, 20} {:message ""} true;
	call __call_ret#54, __call_ret#55 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#54) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#54)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1376 := __call_ret#54;
	if (!(success#1376)) {
	assume false;
	}

	counter_re_ent42#1366 := counter_re_ent42#1366[__this := (counter_re_ent42#1366[__this] + 1)];
	$return34:
	// Function body ends here
}

// 
// State variable: minInvestment: uint256
var {:sourceloc "buggy_47.sol", 355, 3} {:message "minInvestment"} minInvestment#1403: [address_t]int;
// Enum definition State mapped to int
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_47.sol", 358, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#1410: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_47.sol", 359, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#1412: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_47.sol", 360, 4} {:message "AcunarIEO::buyTicket_re_ent2"} buyTicket_re_ent2#1447(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 361, 7} {:message "sent"} sent#1416: bool;
	var __call_ret#56: bool;
	var __call_ret#57: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent2#1412[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent2#1412[__this])];
	assume {:sourceloc "buggy_47.sol", 361, 21} {:message ""} true;
	call __call_ret#56, __call_ret#57 := __call(lastPlayer_re_ent2#1410[__this], __this, jackpot_re_ent2#1412[__this]);
	if (__call_ret#56) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#56)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent2#1412[__this])];
	}

	sent#1416 := __call_ret#56;
	if (!(sent#1416)) {
	assume false;
	}

	lastPlayer_re_ent2#1410 := lastPlayer_re_ent2#1410[__this := __msg_sender];
	jackpot_re_ent2#1412 := jackpot_re_ent2#1412[__this := __balance[__this]];
	$return35:
	// Function body ends here
}

// 
// State variable: ieoState: enum AcunarIEO.State
var {:sourceloc "buggy_47.sol", 367, 3} {:message "ieoState"} ieoState#1449: [address_t]int;
// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_47.sol", 375, 3} {:message "not_called_re_ent13"} not_called_re_ent13#1463: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_47.sol", 376, 1} {:message "AcunarIEO::bug_re_ent13"} bug_re_ent13#1495(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 378, 10} {:message "success"} success#1471: bool;
	var __call_ret#58: bool;
	var __call_ret#59: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1463[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 378, 27} {:message ""} true;
	call __call_ret#58, __call_ret#59 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#58) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#58)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1471 := __call_ret#58;
	if (!(success#1471)) {
	assume false;
	}

	not_called_re_ent13#1463 := not_called_re_ent13#1463[__this := false];
	$return36:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 388, 5} {:message "AcunarIEO::[constructor]"} __constructor#2139(__this: address_t, __msg_sender: address_t, __msg_value: int, _deposit#1505: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	counter_re_ent21#1076 := counter_re_ent21#1076[__this := 0];
	admin#1112 := admin#1112[__this := 0];
	balances_re_ent10#1116 := balances_re_ent10#1116[__this := default_address_t_int()];
	deposit#1158 := deposit#1158[__this := 0];
	balances_re_ent21#1162 := balances_re_ent21#1162[__this := default_address_t_int()];
	tokenPrice#1194 := tokenPrice#1194[__this := 100000000000000];
	userBalance_re_ent12#1198 := userBalance_re_ent12#1198[__this := default_address_t_int()];
	hardCap#1235 := hardCap#1235[__this := 21000000000000000000000];
	redeemableEther_re_ent11#1239 := redeemableEther_re_ent11#1239[__this := default_address_t_int()];
	raisedAmount#1277 := raisedAmount#1277[__this := 0];
	balances_re_ent1#1281 := balances_re_ent1#1281[__this := default_address_t_int()];
	saleStart#1314 := saleStart#1314[__this := __block_timestamp];
	saleEnd#1320 := saleEnd#1320[__this := (__block_timestamp + 14515200)];
	coinTradeStart#1325 := coinTradeStart#1325[__this := (saleEnd#1320[__this] + 15120000)];
	not_called_re_ent41#1328 := not_called_re_ent41#1328[__this := true];
	maxInvestment#1363 := maxInvestment#1363[__this := 30000000000000000000];
	counter_re_ent42#1366 := counter_re_ent42#1366[__this := 0];
	minInvestment#1403 := minInvestment#1403[__this := 100000000000000000];
	lastPlayer_re_ent2#1410 := lastPlayer_re_ent2#1410[__this := 0];
	jackpot_re_ent2#1412 := jackpot_re_ent2#1412[__this := 0];
	ieoState#1449 := ieoState#1449[__this := 0];
	not_called_re_ent13#1463 := not_called_re_ent13#1463[__this := true];
	counter_re_ent14#1526 := counter_re_ent14#1526[__this := 0];
	lastPlayer_re_ent30#1573 := lastPlayer_re_ent30#1573[__this := 0];
	jackpot_re_ent30#1575 := jackpot_re_ent30#1575[__this := 0];
	balances_re_ent8#1625 := balances_re_ent8#1625[__this := default_address_t_int()];
	redeemableEther_re_ent39#1670 := redeemableEther_re_ent39#1670[__this := default_address_t_int()];
	balances_re_ent36#1752 := balances_re_ent36#1752[__this := default_address_t_int()];
	counter_re_ent35#1865 := counter_re_ent35#1865[__this := 0];
	userBalance_re_ent40#1910 := userBalance_re_ent40#1910[__this := default_address_t_int()];
	userBalance_re_ent33#1972 := userBalance_re_ent33#1972[__this := default_address_t_int()];
	not_called_re_ent27#2034 := not_called_re_ent27#2034[__this := true];
	balances_re_ent31#2098 := balances_re_ent31#2098[__this := default_address_t_int()];
	not_called_re_ent6#315 := not_called_re_ent6#315[__this := true];
	name#350 := name#350[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	lastPlayer_re_ent16#352 := lastPlayer_re_ent16#352[__this := 0];
	jackpot_re_ent16#354 := jackpot_re_ent16#354[__this := 0];
	symbol#392 := symbol#392[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	balances_re_ent24#396 := balances_re_ent24#396[__this := default_address_t_int()];
	decimals#439 := decimals#439[__this := 0];
	userBalance_re_ent5#443 := userBalance_re_ent5#443[__this := default_address_t_int()];
	supply#479 := supply#479[__this := 0];
	balances_re_ent15#483 := balances_re_ent15#483[__this := default_address_t_int()];
	founder#514 := founder#514[__this := 0];
	counter_re_ent28#517 := counter_re_ent28#517[__this := 0];
	balances#555 := balances#555[__this := default_address_t_int()];
	not_called_re_ent34#558 := not_called_re_ent34#558[__this := true];
	allowed#596 := allowed#596[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent26#619 := userBalance_re_ent26#619[__this := default_address_t_int()];
	not_called_re_ent20#673 := not_called_re_ent20#673[__this := true];
	redeemableEther_re_ent32#753 := redeemableEther_re_ent32#753[__this := default_address_t_int()];
	balances_re_ent38#846 := balances_re_ent38#846[__this := default_address_t_int()];
	redeemableEther_re_ent4#899 := redeemableEther_re_ent4#899[__this := default_address_t_int()];
	counter_re_ent7#951 := counter_re_ent7#951[__this := 0];
	lastPlayer_re_ent23#1033 := lastPlayer_re_ent23#1033[__this := 0];
	jackpot_re_ent23#1035 := jackpot_re_ent23#1035[__this := 0];
	balances_re_ent17#10 := balances_re_ent17#10[__this := default_address_t_int()];
	lastPlayer_re_ent37#58 := lastPlayer_re_ent37#58[__this := 0];
	jackpot_re_ent37#60 := jackpot_re_ent37#60[__this := 0];
	balances_re_ent3#108 := balances_re_ent3#108[__this := default_address_t_int()];
	lastPlayer_re_ent9#158 := lastPlayer_re_ent9#158[__this := 0];
	jackpot_re_ent9#160 := jackpot_re_ent9#160[__this := 0];
	redeemableEther_re_ent25#208 := redeemableEther_re_ent25#208[__this := default_address_t_int()];
	userBalance_re_ent19#259 := userBalance_re_ent19#259[__this := default_address_t_int()];
	// Arguments for AcunarToken
	// Inlined constructor for AcunarToken starts here
	// Function body starts here
	supply#479 := supply#479[__this := 200000000];
	founder#514 := founder#514[__this := __msg_sender];
	balances#555 := balances#555[__this := balances#555[__this][founder#514[__this] := supply#479[__this]]];
	$return37:
	// Function body ends here
	// Inlined constructor for AcunarToken ends here
	// Function body starts here
	deposit#1158 := deposit#1158[__this := _deposit#1505];
	admin#1112 := admin#1112[__this := __msg_sender];
	ieoState#1449 := ieoState#1449[__this := 0];
	$return38:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_47.sol", 393, 1} {:message "counter_re_ent14"} counter_re_ent14#1526: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_47.sol", 394, 1} {:message "AcunarIEO::callme_re_ent14"} callme_re_ent14#1560(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 396, 3} {:message "success"} success#1536: bool;
	var __call_ret#61: bool;
	var __call_ret#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1526[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 396, 20} {:message ""} true;
	call __call_ret#61, __call_ret#62 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#61) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#61)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1536 := __call_ret#61;
	if (!(success#1536)) {
	assume false;
	}

	counter_re_ent14#1526 := counter_re_ent14#1526[__this := (counter_re_ent14#1526[__this] + 1)];
	$return39:
	// Function body ends here
}

// 
// Function: halt : function ()
procedure {:sourceloc "buggy_47.sol", 404, 5} {:message "AcunarIEO::halt"} halt#1571(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#1112[__this]);
	// Function body starts here
	ieoState#1449 := ieoState#1449[__this := 3];
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyAdmin ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_47.sol", 407, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1573: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_47.sol", 408, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1575: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_47.sol", 409, 4} {:message "AcunarIEO::buyTicket_re_ent30"} buyTicket_re_ent30#1610(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 410, 7} {:message "sent"} sent#1579: bool;
	var __call_ret#65: bool;
	var __call_ret#66: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent30#1575[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent30#1575[__this])];
	assume {:sourceloc "buggy_47.sol", 410, 21} {:message ""} true;
	call __call_ret#65, __call_ret#66 := __call(lastPlayer_re_ent30#1573[__this], __this, jackpot_re_ent30#1575[__this]);
	if (__call_ret#65) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#65)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent30#1575[__this])];
	}

	sent#1579 := __call_ret#65;
	if (!(sent#1579)) {
	assume false;
	}

	lastPlayer_re_ent30#1573 := lastPlayer_re_ent30#1573[__this := __msg_sender];
	jackpot_re_ent30#1575 := jackpot_re_ent30#1575[__this := __balance[__this]];
	$return42:
	// Function body ends here
}

// 
// Function: unhalt : function ()
procedure {:sourceloc "buggy_47.sol", 418, 5} {:message "AcunarIEO::unhalt"} unhalt#1621(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#1112[__this]);
	// Function body starts here
	ieoState#1449 := ieoState#1449[__this := 1];
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyAdmin ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 421, 1} {:message "balances_re_ent8"} balances_re_ent8#1625: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_47.sol", 422, 5} {:message "AcunarIEO::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1654(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 423, 9} {:message "success"} success#1629: bool;
	var __call_ret#69: bool;
	var __call_ret#70: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1625[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1625[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 423, 26} {:message ""} true;
	call __call_ret#69, __call_ret#70 := __call(__msg_sender, __this, balances_re_ent8#1625[__this][__msg_sender]);
	if (__call_ret#69) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#69)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1625[__this][__msg_sender])];
	}

	success#1629 := __call_ret#69;
	if (success#1629) {
	balances_re_ent8#1625 := balances_re_ent8#1625[__this := balances_re_ent8#1625[__this][__msg_sender := 0]];
	}

	$return45:
	// Function body ends here
}

// 
// Function: changeDepositAddress : function (address payable)
procedure {:sourceloc "buggy_47.sol", 431, 5} {:message "AcunarIEO::changeDepositAddress"} changeDepositAddress#1666(__this: address_t, __msg_sender: address_t, __msg_value: int, newDeposit#1656: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#1112[__this]);
	// Function body starts here
	deposit#1158 := deposit#1158[__this := newDeposit#1656];
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyAdmin ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 434, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1670: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_47.sol", 435, 1} {:message "AcunarIEO::claimReward_re_ent39"} claimReward_re_ent39#1706(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 438, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1683: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1670[__this][__msg_sender] > 0);
	transferValue_re_ent39#1683 := redeemableEther_re_ent39#1670[__this][__msg_sender];
	assume {:sourceloc "buggy_47.sol", 439, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1683);
	redeemableEther_re_ent39#1670 := redeemableEther_re_ent39#1670[__this := redeemableEther_re_ent39#1670[__this][__msg_sender := 0]];
	$return48:
	// Function body ends here
}

// 
// Function: getCurrentState : function () view returns (enum AcunarIEO.State)
procedure {:sourceloc "buggy_47.sol", 445, 5} {:message "AcunarIEO::getCurrentState"} getCurrentState#1748(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1709: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((ieoState#1449[__this] == 3)) {
	#1709 := 3;
	goto $return49;
	}
	else {
	if ((__block_timestamp < saleStart#1314[__this])) {
	#1709 := 0;
	goto $return49;
	}
	else {
	if (((__block_timestamp >= saleStart#1314[__this]) && (__block_timestamp <= saleEnd#1320[__this]))) {
	#1709 := 1;
	goto $return49;
	}
	else {
	#1709 := 2;
	goto $return49;
	}

	}

	}

	$return49:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 456, 1} {:message "balances_re_ent36"} balances_re_ent36#1752: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_47.sol", 457, 5} {:message "AcunarIEO::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1781(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 458, 9} {:message "sent"} sent#1756: bool;
	var __call_ret#73: bool;
	var __call_ret#74: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent36#1752[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent36#1752[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 458, 23} {:message ""} true;
	call __call_ret#73, __call_ret#74 := __call(__msg_sender, __this, balances_re_ent36#1752[__this][__msg_sender]);
	if (__call_ret#73) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#73)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent36#1752[__this][__msg_sender])];
	}

	sent#1756 := __call_ret#73;
	if (sent#1756) {
	balances_re_ent36#1752 := balances_re_ent36#1752[__this := balances_re_ent36#1752[__this][__msg_sender := 0]];
	}

	$return50:
	// Function body ends here
}

// 
// Function: invest : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 464, 5} {:message "AcunarIEO::invest"} invest#1862(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1784: bool)
{
	var getCurrentState#1748_ret#75: int;
	var {:sourceloc "buggy_47.sol", 471, 9} {:message "tokens"} tokens#1811: int;
	var call_arg#76: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 466, 20} {:message ""} true;
	call getCurrentState#1748_ret#75 := getCurrentState#1748(__this, __msg_sender, __msg_value);
	ieoState#1449 := ieoState#1449[__this := getCurrentState#1748_ret#75];
	assume (ieoState#1449[__this] == 1);
	assume ((__msg_value >= minInvestment#1403[__this]) && (__msg_value <= maxInvestment#1363[__this]));
	tokens#1811 := (__msg_value div tokenPrice#1194[__this]);
	assume ((raisedAmount#1277[__this] + __msg_value) <= hardCap#1235[__this]);
	raisedAmount#1277 := raisedAmount#1277[__this := (raisedAmount#1277[__this] + __msg_value)];
	balances#555 := balances#555[__this := balances#555[__this][__msg_sender := (balances#555[__this][__msg_sender] + tokens#1811)]];
	balances#555 := balances#555[__this := balances#555[__this][founder#514[__this] := (balances#555[__this][founder#514[__this]] - tokens#1811)]];
	assume {:sourceloc "buggy_47.sol", 482, 9} {:message ""} true;
	call __transfer(deposit#1158[__this], __this, 0, __msg_value);
	call_arg#76 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 485, 14} {:message ""} true;
	call Invest#1503(__this, __msg_sender, __msg_value, call_arg#76, __msg_value, tokens#1811);
	#1784 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_47.sol", 491, 1} {:message "counter_re_ent35"} counter_re_ent35#1865: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_47.sol", 492, 1} {:message "AcunarIEO::callme_re_ent35"} callme_re_ent35#1899(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 494, 3} {:message "success"} success#1875: bool;
	var __call_ret#77: bool;
	var __call_ret#78: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1865[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 494, 20} {:message ""} true;
	call __call_ret#77, __call_ret#78 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#77) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#77)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1875 := __call_ret#77;
	if (!(success#1875)) {
	assume false;
	}

	counter_re_ent35#1865 := counter_re_ent35#1865[__this := (counter_re_ent35#1865[__this] + 1)];
	$return52:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 502, 5} {:message "AcunarIEO::[receive]"} #1906(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var invest#1862_ret#79: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 503, 9} {:message ""} true;
	call invest#1862_ret#79 := invest#1862(__this, __msg_sender, __msg_value);
	$return53:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 505, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1910: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_47.sol", 506, 1} {:message "AcunarIEO::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1944(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 509, 14} {:message "success"} success#1914: bool;
	var __call_ret#80: bool;
	var __call_ret#81: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1910[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1910[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 509, 31} {:message ""} true;
	call __call_ret#80, __call_ret#81 := __call(__msg_sender, __this, userBalance_re_ent40#1910[__this][__msg_sender]);
	if (__call_ret#80) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#80)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1910[__this][__msg_sender])];
	}

	success#1914 := __call_ret#80;
	if (!(success#1914)) {
	assume false;
	}

	userBalance_re_ent40#1910 := userBalance_re_ent40#1910[__this := userBalance_re_ent40#1910[__this][__msg_sender := 0]];
	$return54:
	// Function body ends here
}

// 
// Function: burn : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 518, 5} {:message "AcunarIEO::burn"} burn#1968(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1947: bool)
{
	var getCurrentState#1748_ret#82: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 519, 20} {:message ""} true;
	call getCurrentState#1748_ret#82 := getCurrentState#1748(__this, __msg_sender, __msg_value);
	ieoState#1449 := ieoState#1449[__this := getCurrentState#1748_ret#82];
	assume (ieoState#1449[__this] == 2);
	balances#555 := balances#555[__this := balances#555[__this][founder#514[__this] := 0]];
	$return55:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 524, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1972: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_47.sol", 525, 1} {:message "AcunarIEO::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#2006(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 528, 10} {:message "success"} success#1976: bool;
	var __call_ret#83: bool;
	var __call_ret#84: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1972[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1972[__this][__msg_sender])];
	assume {:sourceloc "buggy_47.sol", 528, 27} {:message ""} true;
	call __call_ret#83, __call_ret#84 := __call(__msg_sender, __this, userBalance_re_ent33#1972[__this][__msg_sender]);
	if (__call_ret#83) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#83)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1972[__this][__msg_sender])];
	}

	success#1976 := __call_ret#83;
	if (!(success#1976)) {
	assume false;
	}

	userBalance_re_ent33#1972 := userBalance_re_ent33#1972[__this := userBalance_re_ent33#1972[__this][__msg_sender := 0]];
	$return56:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 536, 5} {:message "AcunarIEO::transfer"} transfer#2031(__this: address_t, __msg_sender: address_t, __msg_value: int, to#2008: address_t, value#2010: int)
	returns (#2014: bool)
{
	var transfer#1031_ret#85: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#1325[__this]);
	assume {:sourceloc "buggy_47.sol", 538, 9} {:message ""} true;
	call transfer#1031_ret#85 := transfer#1031(__this, __msg_sender, __msg_value, to#2008, value#2010);
	$return57:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_47.sol", 540, 1} {:message "not_called_re_ent27"} not_called_re_ent27#2034: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_47.sol", 541, 1} {:message "AcunarIEO::bug_re_ent27"} bug_re_ent27#2066(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 543, 10} {:message "success"} success#2042: bool;
	var __call_ret#86: bool;
	var __call_ret#87: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#2034[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_47.sol", 543, 27} {:message ""} true;
	call __call_ret#86, __call_ret#87 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#86) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#86)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#2042 := __call_ret#86;
	if (!(success#2042)) {
	assume false;
	}

	not_called_re_ent27#2034 := not_called_re_ent27#2034[__this := false];
	$return58:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 550, 5} {:message "AcunarIEO::transferFrom"} transferFrom#2094(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#2068: address_t, _to#2070: address_t, _value#2072: int)
	returns (#2076: bool)
{
	var transferFrom#842_ret#88: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#1325[__this]);
	assume {:sourceloc "buggy_47.sol", 552, 9} {:message ""} true;
	call transferFrom#842_ret#88 := transferFrom#842(__this, __msg_sender, __msg_value, _from#2068, _to#2070, _value#2072);
	$return59:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 554, 1} {:message "balances_re_ent31"} balances_re_ent31#2098: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 555, 1} {:message "AcunarIEO::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#2138(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#2100: int)
{
	var {:sourceloc "buggy_47.sol", 558, 6} {:message "sent"} sent#2113: bool;
	var __call_ret#89: bool;
	var __call_ret#90: int_arr_ptr;
	var call_arg#91: int_arr_ptr;
	var new_array#92: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#2098[__this][__msg_sender] >= _weiToWithdraw#2100);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#2100);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#2100)];
	assume {:sourceloc "buggy_47.sol", 558, 20} {:message ""} true;
	call __call_ret#89, __call_ret#90 := __call(__msg_sender, __this, _weiToWithdraw#2100);
	if (__call_ret#89) {
	havoc counter_re_ent21#1076;
	havoc admin#1112;
	havoc balances_re_ent10#1116;
	havoc deposit#1158;
	havoc balances_re_ent21#1162;
	havoc tokenPrice#1194;
	havoc userBalance_re_ent12#1198;
	havoc hardCap#1235;
	havoc redeemableEther_re_ent11#1239;
	havoc raisedAmount#1277;
	havoc balances_re_ent1#1281;
	havoc saleStart#1314;
	havoc saleEnd#1320;
	havoc coinTradeStart#1325;
	havoc not_called_re_ent41#1328;
	havoc maxInvestment#1363;
	havoc counter_re_ent42#1366;
	havoc minInvestment#1403;
	havoc lastPlayer_re_ent2#1410;
	havoc jackpot_re_ent2#1412;
	havoc ieoState#1449;
	havoc not_called_re_ent13#1463;
	havoc counter_re_ent14#1526;
	havoc lastPlayer_re_ent30#1573;
	havoc jackpot_re_ent30#1575;
	havoc balances_re_ent8#1625;
	havoc redeemableEther_re_ent39#1670;
	havoc balances_re_ent36#1752;
	havoc counter_re_ent35#1865;
	havoc userBalance_re_ent40#1910;
	havoc userBalance_re_ent33#1972;
	havoc not_called_re_ent27#2034;
	havoc balances_re_ent31#2098;
	havoc not_called_re_ent6#315;
	havoc name#350;
	havoc lastPlayer_re_ent16#352;
	havoc jackpot_re_ent16#354;
	havoc symbol#392;
	havoc balances_re_ent24#396;
	havoc decimals#439;
	havoc userBalance_re_ent5#443;
	havoc supply#479;
	havoc balances_re_ent15#483;
	havoc founder#514;
	havoc counter_re_ent28#517;
	havoc balances#555;
	havoc not_called_re_ent34#558;
	havoc allowed#596;
	havoc userBalance_re_ent26#619;
	havoc not_called_re_ent20#673;
	havoc redeemableEther_re_ent32#753;
	havoc balances_re_ent38#846;
	havoc redeemableEther_re_ent4#899;
	havoc counter_re_ent7#951;
	havoc lastPlayer_re_ent23#1033;
	havoc jackpot_re_ent23#1035;
	havoc balances_re_ent17#10;
	havoc lastPlayer_re_ent37#58;
	havoc jackpot_re_ent37#60;
	havoc balances_re_ent3#108;
	havoc lastPlayer_re_ent9#158;
	havoc jackpot_re_ent9#160;
	havoc redeemableEther_re_ent25#208;
	havoc userBalance_re_ent19#259;
	havoc __balance;
	}

	if (!(__call_ret#89)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#2100)];
	}

	sent#2113 := __call_ret#89;
	new_array#92 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#91 := new_array#92;
	mem_arr_int := mem_arr_int[call_arg#91 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#2113;
	balances_re_ent31#2098 := balances_re_ent31#2098[__this := balances_re_ent31#2098[__this][__msg_sender := (balances_re_ent31#2098[__this][__msg_sender] - _weiToWithdraw#2100)]];
	$return60:
	// Function body ends here
}

