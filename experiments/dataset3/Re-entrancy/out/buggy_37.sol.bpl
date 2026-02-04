// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_37.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: safeAdd : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 26, 5} {:message "SafeMath::safeAdd"} safeAdd#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
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
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_37.sol", 30, 1} {:message "not_called_re_ent41"} not_called_re_ent41#26: [address_t]bool;
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
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_37.sol", 31, 1} {:message "SafeMath::bug_re_ent41"} bug_re_ent41#53(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#26[__this];
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 33, 16} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	assume false;
	}

	not_called_re_ent41#26 := not_called_re_ent41#26[__this := false];
	$return1:
	// Function body ends here
}

// 
// Function: safeSub : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 38, 5} {:message "SafeMath::safeSub"} safeSub#75(__this: address_t, __msg_sender: address_t, __msg_value: int, a#55: int, b#57: int)
	returns (c#60: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#57 <= a#55);
	c#60 := (a#55 - b#57);
	$return2:
	// Function body ends here
}

// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_37.sol", 42, 1} {:message "counter_re_ent42"} counter_re_ent42#78: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_37.sol", 43, 1} {:message "SafeMath::callme_re_ent42"} callme_re_ent42#107(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#78[__this] <= 5);
	call_arg#2 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 45, 9} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, call_arg#2);
	if (!(__send_ret#3)) {
	assume false;
	}

	counter_re_ent42#78 := counter_re_ent42#78[__this := (counter_re_ent42#78[__this] + 1)];
	$return3:
	// Function body ends here
}

// 
// Function: safeMul : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 50, 5} {:message "SafeMath::safeMul"} safeMul#135(__this: address_t, __msg_sender: address_t, __msg_value: int, a#109: int, b#111: int)
	returns (c#114: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#114 := (a#109 * b#111);
	assume ((a#109 == 0) || ((c#114 div a#109) == b#111));
	$return4:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_37.sol", 54, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#137: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_37.sol", 55, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#139: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_37.sol", 56, 4} {:message "SafeMath::buyTicket_re_ent2"} buyTicket_re_ent2#169(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 57, 12} {:message ""} true;
	call __send_ret#4 := __send(lastPlayer_re_ent2#137[__this], __this, 0, jackpot_re_ent2#139[__this]);
	if (!(__send_ret#4)) {
	assume false;
	}

	lastPlayer_re_ent2#137 := lastPlayer_re_ent2#137[__this := __msg_sender];
	jackpot_re_ent2#139 := jackpot_re_ent2#139[__this := __balance[__this]];
	$return5:
	// Function body ends here
}

// 
// Function: safeDiv : function (uint256,uint256) pure returns (uint256)
procedure {:sourceloc "buggy_37.sol", 62, 5} {:message "SafeMath::safeDiv"} safeDiv#191(__this: address_t, __msg_sender: address_t, __msg_value: int, a#171: int, b#173: int)
	returns (c#176: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#173 > 0);
	c#176 := (a#171 div b#173);
	$return6:
	// Function body ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 66, 1} {:message "balances_re_ent17"} balances_re_ent17#195: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_37.sol", 67, 1} {:message "SafeMath::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#234(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#197: int)
{
	var {:sourceloc "buggy_37.sol", 70, 6} {:message "success"} success#210: bool;
	var __call_ret#5: bool;
	var __call_ret#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#195[__this][__msg_sender] >= _weiToWithdraw#197);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#197);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#197)];
	assume {:sourceloc "buggy_37.sol", 70, 21} {:message ""} true;
	call __call_ret#5, __call_ret#6 := __call(__msg_sender, __this, _weiToWithdraw#197);
	if (__call_ret#5) {
	havoc not_called_re_ent41#26;
	havoc counter_re_ent42#78;
	havoc lastPlayer_re_ent2#137;
	havoc jackpot_re_ent2#139;
	havoc balances_re_ent17#195;
	havoc __balance;
	}

	if (!(__call_ret#5)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#197)];
	}

	success#210 := __call_ret#5;
	assume success#210;
	balances_re_ent17#195 := balances_re_ent17#195[__this := balances_re_ent17#195[__this][__msg_sender := (balances_re_ent17#195[__this][__msg_sender] - _weiToWithdraw#197)]];
	$return7:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "buggy_37.sol", 25, 1} {:message "SafeMath::[implicit_constructor]"} __constructor#235(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	not_called_re_ent41#26 := not_called_re_ent41#26[__this := true];
	counter_re_ent42#78 := counter_re_ent42#78[__this := 0];
	lastPlayer_re_ent2#137 := lastPlayer_re_ent2#137[__this := 0];
	jackpot_re_ent2#139 := jackpot_re_ent2#139[__this := 0];
	balances_re_ent17#195 := balances_re_ent17#195[__this := default_address_t_int()];
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_37.sol", 149, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#550(__this: address_t, __msg_sender: address_t, __msg_value: int, from#544: address_t, to#546: address_t, tokens#548: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_37.sol", 157, 3} {:message "[event] ERC20Interface::Approval"} Approval#595(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#589: address_t, spender#591: address_t, tokens#593: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 82, 5} {:message "ERC20Interface::totalSupply"} totalSupply#240(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#238: int);
	modifies lastPlayer_re_ent37#242, jackpot_re_ent37#244, balances_re_ent3#285, lastPlayer_re_ent9#335, jackpot_re_ent9#337, redeemableEther_re_ent25#385, userBalance_re_ent19#434, userBalance_re_ent26#478, not_called_re_ent27#515, balances_re_ent31#554;

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_37.sol", 83, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#242: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_37.sol", 84, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#244: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_37.sol", 85, 4} {:message "ERC20Interface::buyTicket_re_ent37"} buyTicket_re_ent37#274(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 86, 12} {:message ""} true;
	call __send_ret#7 := __send(lastPlayer_re_ent37#242[__this], __this, 0, jackpot_re_ent37#244[__this]);
	if (!(__send_ret#7)) {
	assume false;
	}

	lastPlayer_re_ent37#242 := lastPlayer_re_ent37#242[__this := __msg_sender];
	jackpot_re_ent37#244 := jackpot_re_ent37#244[__this := __balance[__this]];
	$return8:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 91, 5} {:message "ERC20Interface::balanceOf"} balanceOf#281(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#276: address_t)
	returns (balance#279: int);
	modifies lastPlayer_re_ent37#242, jackpot_re_ent37#244, balances_re_ent3#285, lastPlayer_re_ent9#335, jackpot_re_ent9#337, redeemableEther_re_ent25#385, userBalance_re_ent19#434, userBalance_re_ent26#478, not_called_re_ent27#515, balances_re_ent31#554;

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 92, 1} {:message "balances_re_ent3"} balances_re_ent3#285: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 93, 1} {:message "ERC20Interface::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#324(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#287: int)
{
	var {:sourceloc "buggy_37.sol", 96, 3} {:message "success"} success#300: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#285[__this][__msg_sender] >= _weiToWithdraw#287);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#287);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#287)];
	assume {:sourceloc "buggy_37.sol", 96, 19} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, _weiToWithdraw#287);
	if (__call_ret#8) {
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#287)];
	}

	success#300 := __call_ret#8;
	assume success#300;
	balances_re_ent3#285 := balances_re_ent3#285[__this := balances_re_ent3#285[__this][__msg_sender := (balances_re_ent3#285[__this][__msg_sender] - _weiToWithdraw#287)]];
	$return9:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 100, 5} {:message "ERC20Interface::allowance"} allowance#333(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#326: address_t, spender#328: address_t)
	returns (remaining#331: int);
	modifies lastPlayer_re_ent37#242, jackpot_re_ent37#244, balances_re_ent3#285, lastPlayer_re_ent9#335, jackpot_re_ent9#337, redeemableEther_re_ent25#385, userBalance_re_ent19#434, userBalance_re_ent26#478, not_called_re_ent27#515, balances_re_ent31#554;

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_37.sol", 101, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#335: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_37.sol", 102, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#337: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_37.sol", 103, 7} {:message "ERC20Interface::buyTicket_re_ent9"} buyTicket_re_ent9#372(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 104, 10} {:message "success"} success#341: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#337[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#337[__this])];
	assume {:sourceloc "buggy_37.sol", 104, 27} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(lastPlayer_re_ent9#335[__this], __this, jackpot_re_ent9#337[__this]);
	if (__call_ret#10) {
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#337[__this])];
	}

	success#341 := __call_ret#10;
	if (!(success#341)) {
	assume false;
	}

	lastPlayer_re_ent9#335 := lastPlayer_re_ent9#335[__this := __msg_sender];
	jackpot_re_ent9#337 := jackpot_re_ent9#337[__this := __balance[__this]];
	$return10:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 110, 5} {:message "ERC20Interface::transfer"} transfer#381(__this: address_t, __msg_sender: address_t, __msg_value: int, to#374: address_t, tokens#376: int)
	returns (success#379: bool);
	modifies lastPlayer_re_ent37#242, jackpot_re_ent37#244, balances_re_ent3#285, lastPlayer_re_ent9#335, jackpot_re_ent9#337, redeemableEther_re_ent25#385, userBalance_re_ent19#434, userBalance_re_ent26#478, not_called_re_ent27#515, balances_re_ent31#554;

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 111, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#385: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_37.sol", 112, 1} {:message "ERC20Interface::claimReward_re_ent25"} claimReward_re_ent25#421(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 115, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#398: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#385[__this][__msg_sender] > 0);
	transferValue_re_ent25#398 := redeemableEther_re_ent25#385[__this][__msg_sender];
	assume {:sourceloc "buggy_37.sol", 116, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#398);
	redeemableEther_re_ent25#385 := redeemableEther_re_ent25#385[__this := redeemableEther_re_ent25#385[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 119, 5} {:message "ERC20Interface::approve"} approve#430(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#423: address_t, tokens#425: int)
	returns (success#428: bool);
	modifies lastPlayer_re_ent37#242, jackpot_re_ent37#244, balances_re_ent3#285, lastPlayer_re_ent9#335, jackpot_re_ent9#337, redeemableEther_re_ent25#385, userBalance_re_ent19#434, userBalance_re_ent26#478, not_called_re_ent27#515, balances_re_ent31#554;

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 120, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#434: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_37.sol", 121, 1} {:message "ERC20Interface::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#463(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 124, 16} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, userBalance_re_ent19#434[__this][__msg_sender]);
	if (!(__send_ret#12)) {
	assume false;
	}

	userBalance_re_ent19#434 := userBalance_re_ent19#434[__this := userBalance_re_ent19#434[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 129, 5} {:message "ERC20Interface::transferFrom"} transferFrom#474(__this: address_t, __msg_sender: address_t, __msg_value: int, from#465: address_t, to#467: address_t, tokens#469: int)
	returns (success#472: bool);
	modifies lastPlayer_re_ent37#242, jackpot_re_ent37#244, balances_re_ent3#285, lastPlayer_re_ent9#335, jackpot_re_ent9#337, redeemableEther_re_ent25#385, userBalance_re_ent19#434, userBalance_re_ent26#478, not_called_re_ent27#515, balances_re_ent31#554;

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 130, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#478: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_37.sol", 131, 1} {:message "ERC20Interface::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#512(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 134, 3} {:message "success"} success#482: bool;
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#478[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#478[__this][__msg_sender])];
	assume {:sourceloc "buggy_37.sol", 134, 19} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(__msg_sender, __this, userBalance_re_ent26#478[__this][__msg_sender]);
	if (__call_ret#13) {
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#478[__this][__msg_sender])];
	}

	success#482 := __call_ret#13;
	if (!(success#482)) {
	assume false;
	}

	userBalance_re_ent26#478 := userBalance_re_ent26#478[__this := userBalance_re_ent26#478[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_37.sol", 141, 3} {:message "not_called_re_ent27"} not_called_re_ent27#515: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_37.sol", 142, 1} {:message "ERC20Interface::bug_re_ent27"} bug_re_ent27#542(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#515[__this];
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 144, 12} {:message ""} true;
	call __send_ret#16 := __send(__msg_sender, __this, 0, call_arg#15);
	if (!(__send_ret#16)) {
	assume false;
	}

	not_called_re_ent27#515 := not_called_re_ent27#515[__this := false];
	$return14:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 150, 3} {:message "balances_re_ent31"} balances_re_ent31#554: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 151, 1} {:message "ERC20Interface::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#587(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#556: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#554[__this][__msg_sender] >= _weiToWithdraw#556);
	assume {:sourceloc "buggy_37.sol", 154, 13} {:message ""} true;
	call __send_ret#17 := __send(__msg_sender, __this, 0, _weiToWithdraw#556);
	assume __send_ret#17;
	balances_re_ent31#554 := balances_re_ent31#554[__this := balances_re_ent31#554[__this][__msg_sender := (balances_re_ent31#554[__this][__msg_sender] - _weiToWithdraw#556)]];
	$return15:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 81, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#596(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#242 := lastPlayer_re_ent37#242[__this := 0];
	jackpot_re_ent37#244 := jackpot_re_ent37#244[__this := 0];
	balances_re_ent3#285 := balances_re_ent3#285[__this := default_address_t_int()];
	lastPlayer_re_ent9#335 := lastPlayer_re_ent9#335[__this := 0];
	jackpot_re_ent9#337 := jackpot_re_ent9#337[__this := 0];
	redeemableEther_re_ent25#385 := redeemableEther_re_ent25#385[__this := default_address_t_int()];
	userBalance_re_ent19#434 := userBalance_re_ent19#434[__this := default_address_t_int()];
	userBalance_re_ent26#478 := userBalance_re_ent26#478[__this := default_address_t_int()];
	not_called_re_ent27#515 := not_called_re_ent27#515[__this := true];
	balances_re_ent31#554 := balances_re_ent31#554[__this := default_address_t_int()];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_37.sol", 167, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#607(__this: address_t, __msg_sender: address_t, __msg_value: int, from#598: address_t, tokens#600: int, token#602: address_t, data#604: int_arr_ptr);
	modifies not_called_re_ent20#610;

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_37.sol", 168, 1} {:message "not_called_re_ent20"} not_called_re_ent20#610: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_37.sol", 169, 1} {:message "ApproveAndCallFallBack::bug_re_ent20"} bug_re_ent20#637(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#610[__this];
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 171, 16} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	assume false;
	}

	not_called_re_ent20#610 := not_called_re_ent20#610[__this := false];
	$return16:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_37.sol", 166, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#638(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	not_called_re_ent20#610 := not_called_re_ent20#610[__this := true];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_37.sol", 211, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#745(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#741: address_t, _to#743: address_t)
{
	
}

// 
// State variable: not_called_re_ent34: bool
var {:sourceloc "buggy_37.sol", 183, 3} {:message "not_called_re_ent34"} not_called_re_ent34#641: [address_t]bool;
// 
// Function: bug_re_ent34 : function ()
procedure {:sourceloc "buggy_37.sol", 184, 1} {:message "Owned::bug_re_ent34"} bug_re_ent34#668(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent34#641[__this];
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_37.sol", 186, 24} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	assume false;
	}

	not_called_re_ent34#641 := not_called_re_ent34#641[__this := false];
	$return17:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_37.sol", 191, 3} {:message "owner"} owner#670: [address_t]address_t;
// 
// State variable: counter_re_ent21: uint256
var {:sourceloc "buggy_37.sol", 192, 3} {:message "counter_re_ent21"} counter_re_ent21#673: [address_t]int;
// 
// Function: callme_re_ent21 : function ()
procedure {:sourceloc "buggy_37.sol", 193, 1} {:message "Owned::callme_re_ent21"} callme_re_ent21#702(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent21#673[__this] <= 5);
	call_arg#22 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 195, 9} {:message ""} true;
	call __send_ret#23 := __send(__msg_sender, __this, 0, call_arg#22);
	if (!(__send_ret#23)) {
	assume false;
	}

	counter_re_ent21#673 := counter_re_ent21#673[__this := (counter_re_ent21#673[__this] + 1)];
	$return18:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_37.sol", 200, 3} {:message "newOwner"} newOwner#704: [address_t]address_t;
// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_37.sol", 202, 3} {:message "not_called_re_ent13"} not_called_re_ent13#707: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_37.sol", 203, 1} {:message "Owned::bug_re_ent13"} bug_re_ent13#739(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 205, 3} {:message "success"} success#715: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#707[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_37.sol", 205, 18} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#24) {
	havoc not_called_re_ent34#641;
	havoc owner#670;
	havoc counter_re_ent21#673;
	havoc newOwner#704;
	havoc not_called_re_ent13#707;
	havoc redeemableEther_re_ent32#758;
	havoc balances_re_ent38#821;
	havoc redeemableEther_re_ent4#885;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#715 := __call_ret#24;
	if (!(success#715)) {
	assume false;
	}

	not_called_re_ent13#707 := not_called_re_ent13#707[__this := false];
	$return19:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 213, 5} {:message "Owned::[constructor]"} __constructor#922(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent34#641 := not_called_re_ent34#641[__this := true];
	owner#670 := owner#670[__this := 0];
	counter_re_ent21#673 := counter_re_ent21#673[__this := 0];
	newOwner#704 := newOwner#704[__this := 0];
	not_called_re_ent13#707 := not_called_re_ent13#707[__this := true];
	redeemableEther_re_ent32#758 := redeemableEther_re_ent32#758[__this := default_address_t_int()];
	balances_re_ent38#821 := balances_re_ent38#821[__this := default_address_t_int()];
	redeemableEther_re_ent4#885 := redeemableEther_re_ent4#885[__this := default_address_t_int()];
	// Function body starts here
	owner#670 := owner#670[__this := __msg_sender];
	$return20:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 216, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#758: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_37.sol", 217, 1} {:message "Owned::claimReward_re_ent32"} claimReward_re_ent32#794(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 220, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#771: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#758[__this][__msg_sender] > 0);
	transferValue_re_ent32#771 := redeemableEther_re_ent32#758[__this][__msg_sender];
	assume {:sourceloc "buggy_37.sol", 221, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#771);
	redeemableEther_re_ent32#758 := redeemableEther_re_ent32#758[__this := redeemableEther_re_ent32#758[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_37.sol", 230, 5} {:message "Owned::transferOwnership"} transferOwnership#817(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#807: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#670[__this]);
	// Function body starts here
	newOwner#704 := newOwner#704[__this := _newOwner#807];
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 233, 1} {:message "balances_re_ent38"} balances_re_ent38#821: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 234, 1} {:message "Owned::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#854(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#823: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#821[__this][__msg_sender] >= _weiToWithdraw#823);
	assume {:sourceloc "buggy_37.sol", 237, 13} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, _weiToWithdraw#823);
	assume __send_ret#28;
	balances_re_ent38#821 := balances_re_ent38#821[__this := balances_re_ent38#821[__this][__msg_sender := (balances_re_ent38#821[__this][__msg_sender] - _weiToWithdraw#823)]];
	$return24:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_37.sol", 240, 5} {:message "Owned::acceptOwnership"} acceptOwnership#881(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#704[__this]);
	assume {:sourceloc "buggy_37.sol", 242, 14} {:message ""} true;
	call OwnershipTransferred#745(__this, __msg_sender, __msg_value, owner#670[__this], newOwner#704[__this]);
	owner#670 := owner#670[__this := newOwner#704[__this]];
	newOwner#704 := newOwner#704[__this := 0];
	$return25:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 246, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#885: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_37.sol", 247, 1} {:message "Owned::claimReward_re_ent4"} claimReward_re_ent4#921(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 250, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#898: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#885[__this][__msg_sender] > 0);
	transferValue_re_ent4#898 := redeemableEther_re_ent4#885[__this][__msg_sender];
	assume {:sourceloc "buggy_37.sol", 251, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#898);
	redeemableEther_re_ent4#885 := redeemableEther_re_ent4#885[__this := redeemableEther_re_ent4#885[__this][__msg_sender := 0]];
	$return26:
	// Function body ends here
}

// 
// ------- Contract: AugustCoin -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Inherits from: SafeMath
// 
// State variable: balances_re_ent10: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 262, 3} {:message "balances_re_ent10"} balances_re_ent10#932: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent10 : function (uint256)
procedure {:sourceloc "buggy_37.sol", 263, 1} {:message "AugustCoin::withdrawFunds_re_ent10"} withdrawFunds_re_ent10#965(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#934: int)
{
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent10#932[__this][__msg_sender] >= _weiToWithdraw#934);
	assume {:sourceloc "buggy_37.sol", 266, 13} {:message ""} true;
	call __send_ret#29 := __send(__msg_sender, __this, 0, _weiToWithdraw#934);
	assume __send_ret#29;
	balances_re_ent10#932 := balances_re_ent10#932[__this := balances_re_ent10#932[__this][__msg_sender := (balances_re_ent10#932[__this][__msg_sender] - _weiToWithdraw#934)]];
	$return27:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_37.sol", 269, 3} {:message "symbol"} symbol#967: [address_t]int_arr_type;
// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 270, 3} {:message "balances_re_ent21"} balances_re_ent21#971: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_37.sol", 271, 5} {:message "AugustCoin::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#1000(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 272, 11} {:message "success"} success#975: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#971[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#971[__this][__msg_sender])];
	assume {:sourceloc "buggy_37.sol", 272, 27} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(__msg_sender, __this, balances_re_ent21#971[__this][__msg_sender]);
	if (__call_ret#30) {
	havoc balances_re_ent10#932;
	havoc symbol#967;
	havoc balances_re_ent21#971;
	havoc name#1002;
	havoc userBalance_re_ent12#1006;
	havoc decimals#1037;
	havoc redeemableEther_re_ent11#1041;
	havoc _totalSupply#1079;
	havoc balances#1083;
	havoc balances_re_ent1#1087;
	havoc allowed#1122;
	havoc counter_re_ent7#1160;
	havoc lastPlayer_re_ent23#1207;
	havoc jackpot_re_ent23#1209;
	havoc counter_re_ent14#1255;
	havoc lastPlayer_re_ent30#1330;
	havoc jackpot_re_ent30#1332;
	havoc balances_re_ent8#1395;
	havoc redeemableEther_re_ent39#1488;
	havoc balances_re_ent36#1545;
	havoc counter_re_ent35#1615;
	havoc userBalance_re_ent40#1655;
	havoc userBalance_re_ent33#1713;
	havoc not_called_re_ent41#26;
	havoc counter_re_ent42#78;
	havoc lastPlayer_re_ent2#137;
	havoc jackpot_re_ent2#139;
	havoc balances_re_ent17#195;
	havoc not_called_re_ent34#641;
	havoc owner#670;
	havoc counter_re_ent21#673;
	havoc newOwner#704;
	havoc not_called_re_ent13#707;
	havoc redeemableEther_re_ent32#758;
	havoc balances_re_ent38#821;
	havoc redeemableEther_re_ent4#885;
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#971[__this][__msg_sender])];
	}

	success#975 := __call_ret#30;
	if (success#975) {
	balances_re_ent21#971 := balances_re_ent21#971[__this := balances_re_ent21#971[__this][__msg_sender := 0]];
	}

	$return28:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_37.sol", 276, 3} {:message "name"} name#1002: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 277, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#1006: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_37.sol", 278, 1} {:message "AugustCoin::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#1035(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 281, 16} {:message ""} true;
	call __send_ret#32 := __send(__msg_sender, __this, 0, userBalance_re_ent12#1006[__this][__msg_sender]);
	if (!(__send_ret#32)) {
	assume false;
	}

	userBalance_re_ent12#1006 := userBalance_re_ent12#1006[__this := userBalance_re_ent12#1006[__this][__msg_sender := 0]];
	$return29:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_37.sol", 286, 3} {:message "decimals"} decimals#1037: [address_t]int;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 287, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#1041: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_37.sol", 288, 1} {:message "AugustCoin::claimReward_re_ent11"} claimReward_re_ent11#1077(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 291, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#1054: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#1041[__this][__msg_sender] > 0);
	transferValue_re_ent11#1054 := redeemableEther_re_ent11#1041[__this][__msg_sender];
	assume {:sourceloc "buggy_37.sol", 292, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#1054);
	redeemableEther_re_ent11#1041 := redeemableEther_re_ent11#1041[__this := redeemableEther_re_ent11#1041[__this][__msg_sender := 0]];
	$return30:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_37.sol", 295, 3} {:message "_totalSupply"} _totalSupply#1079: [address_t]int;
// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 297, 5} {:message "balances"} balances#1083: [address_t][address_t]int;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 298, 3} {:message "balances_re_ent1"} balances_re_ent1#1087: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_37.sol", 299, 5} {:message "AugustCoin::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#1116(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 300, 11} {:message "success"} success#1091: bool;
	var __call_ret#33: bool;
	var __call_ret#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#1087[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#1087[__this][__msg_sender])];
	assume {:sourceloc "buggy_37.sol", 300, 27} {:message ""} true;
	call __call_ret#33, __call_ret#34 := __call(__msg_sender, __this, balances_re_ent1#1087[__this][__msg_sender]);
	if (__call_ret#33) {
	havoc balances_re_ent10#932;
	havoc symbol#967;
	havoc balances_re_ent21#971;
	havoc name#1002;
	havoc userBalance_re_ent12#1006;
	havoc decimals#1037;
	havoc redeemableEther_re_ent11#1041;
	havoc _totalSupply#1079;
	havoc balances#1083;
	havoc balances_re_ent1#1087;
	havoc allowed#1122;
	havoc counter_re_ent7#1160;
	havoc lastPlayer_re_ent23#1207;
	havoc jackpot_re_ent23#1209;
	havoc counter_re_ent14#1255;
	havoc lastPlayer_re_ent30#1330;
	havoc jackpot_re_ent30#1332;
	havoc balances_re_ent8#1395;
	havoc redeemableEther_re_ent39#1488;
	havoc balances_re_ent36#1545;
	havoc counter_re_ent35#1615;
	havoc userBalance_re_ent40#1655;
	havoc userBalance_re_ent33#1713;
	havoc not_called_re_ent41#26;
	havoc counter_re_ent42#78;
	havoc lastPlayer_re_ent2#137;
	havoc jackpot_re_ent2#139;
	havoc balances_re_ent17#195;
	havoc not_called_re_ent34#641;
	havoc owner#670;
	havoc counter_re_ent21#673;
	havoc newOwner#704;
	havoc not_called_re_ent13#707;
	havoc redeemableEther_re_ent32#758;
	havoc balances_re_ent38#821;
	havoc redeemableEther_re_ent4#885;
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#33)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#1087[__this][__msg_sender])];
	}

	success#1091 := __call_ret#33;
	if (success#1091) {
	balances_re_ent1#1087 := balances_re_ent1#1087[__this := balances_re_ent1#1087[__this][__msg_sender := 0]];
	}

	$return31:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_37.sol", 304, 3} {:message "allowed"} allowed#1122: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 310, 5} {:message "AugustCoin::[constructor]"} __constructor#1748(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#36: address_t;
	var call_arg#37: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent10#932 := balances_re_ent10#932[__this := default_address_t_int()];
	symbol#967 := symbol#967[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent21#971 := balances_re_ent21#971[__this := default_address_t_int()];
	name#1002 := name#1002[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent12#1006 := userBalance_re_ent12#1006[__this := default_address_t_int()];
	decimals#1037 := decimals#1037[__this := 0];
	redeemableEther_re_ent11#1041 := redeemableEther_re_ent11#1041[__this := default_address_t_int()];
	_totalSupply#1079 := _totalSupply#1079[__this := 0];
	balances#1083 := balances#1083[__this := default_address_t_int()];
	balances_re_ent1#1087 := balances_re_ent1#1087[__this := default_address_t_int()];
	allowed#1122 := allowed#1122[__this := default_address_t__k_address_t_v_int()];
	counter_re_ent7#1160 := counter_re_ent7#1160[__this := 0];
	lastPlayer_re_ent23#1207 := lastPlayer_re_ent23#1207[__this := 0];
	jackpot_re_ent23#1209 := jackpot_re_ent23#1209[__this := 0];
	counter_re_ent14#1255 := counter_re_ent14#1255[__this := 0];
	lastPlayer_re_ent30#1330 := lastPlayer_re_ent30#1330[__this := 0];
	jackpot_re_ent30#1332 := jackpot_re_ent30#1332[__this := 0];
	balances_re_ent8#1395 := balances_re_ent8#1395[__this := default_address_t_int()];
	redeemableEther_re_ent39#1488 := redeemableEther_re_ent39#1488[__this := default_address_t_int()];
	balances_re_ent36#1545 := balances_re_ent36#1545[__this := default_address_t_int()];
	counter_re_ent35#1615 := counter_re_ent35#1615[__this := 0];
	userBalance_re_ent40#1655 := userBalance_re_ent40#1655[__this := default_address_t_int()];
	userBalance_re_ent33#1713 := userBalance_re_ent33#1713[__this := default_address_t_int()];
	not_called_re_ent41#26 := not_called_re_ent41#26[__this := true];
	counter_re_ent42#78 := counter_re_ent42#78[__this := 0];
	lastPlayer_re_ent2#137 := lastPlayer_re_ent2#137[__this := 0];
	jackpot_re_ent2#139 := jackpot_re_ent2#139[__this := 0];
	balances_re_ent17#195 := balances_re_ent17#195[__this := default_address_t_int()];
	not_called_re_ent34#641 := not_called_re_ent34#641[__this := true];
	owner#670 := owner#670[__this := 0];
	counter_re_ent21#673 := counter_re_ent21#673[__this := 0];
	newOwner#704 := newOwner#704[__this := 0];
	not_called_re_ent13#707 := not_called_re_ent13#707[__this := true];
	redeemableEther_re_ent32#758 := redeemableEther_re_ent32#758[__this := default_address_t_int()];
	balances_re_ent38#821 := balances_re_ent38#821[__this := default_address_t_int()];
	redeemableEther_re_ent4#885 := redeemableEther_re_ent4#885[__this := default_address_t_int()];
	lastPlayer_re_ent37#242 := lastPlayer_re_ent37#242[__this := 0];
	jackpot_re_ent37#244 := jackpot_re_ent37#244[__this := 0];
	balances_re_ent3#285 := balances_re_ent3#285[__this := default_address_t_int()];
	lastPlayer_re_ent9#335 := lastPlayer_re_ent9#335[__this := 0];
	jackpot_re_ent9#337 := jackpot_re_ent9#337[__this := 0];
	redeemableEther_re_ent25#385 := redeemableEther_re_ent25#385[__this := default_address_t_int()];
	userBalance_re_ent19#434 := userBalance_re_ent19#434[__this := default_address_t_int()];
	userBalance_re_ent26#478 := userBalance_re_ent26#478[__this := default_address_t_int()];
	not_called_re_ent27#515 := not_called_re_ent27#515[__this := true];
	balances_re_ent31#554 := balances_re_ent31#554[__this := default_address_t_int()];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#670 := owner#670[__this := __msg_sender];
	$return32:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#967 := symbol#967[__this := int_arr#constr(default_int_int()[0 := 65][1 := 85][2 := 67], 3)];
	name#1002 := name#1002[__this := int_arr#constr(default_int_int()[0 := 65][1 := 117][2 := 103][3 := 117][4 := 115][5 := 116][6 := 67][7 := 111][8 := 105][9 := 110], 10)];
	decimals#1037 := decimals#1037[__this := 18];
	_totalSupply#1079 := _totalSupply#1079[__this := 100000000000000000000000000];
	balances#1083 := balances#1083[__this := balances#1083[__this][address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD := _totalSupply#1079[__this]]];
	call_arg#36 := 0;
	call_arg#37 := address_0xe4948b8A5609c3c39E49eC1e36679a94F72D62bD;
	assume {:sourceloc "buggy_37.sol", 316, 14} {:message ""} true;
	call Transfer#550(__this, __msg_sender, __msg_value, call_arg#36, call_arg#37, _totalSupply#1079[__this]);
	$return33:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_37.sol", 318, 1} {:message "counter_re_ent7"} counter_re_ent7#1160: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_37.sol", 319, 1} {:message "AugustCoin::callme_re_ent7"} callme_re_ent7#1189(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1160[__this] <= 5);
	call_arg#38 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 321, 9} {:message ""} true;
	call __send_ret#39 := __send(__msg_sender, __this, 0, call_arg#38);
	if (!(__send_ret#39)) {
	assume false;
	}

	counter_re_ent7#1160 := counter_re_ent7#1160[__this := (counter_re_ent7#1160[__this] + 1)];
	$return34:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 331, 5} {:message "AugustCoin::totalSupply"} totalSupply#1205(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1193: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1193 := (_totalSupply#1079[__this] - balances#1083[__this][0]);
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_37.sol", 334, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1207: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_37.sol", 335, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1209: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_37.sol", 336, 4} {:message "AugustCoin::buyTicket_re_ent23"} buyTicket_re_ent23#1239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 337, 12} {:message ""} true;
	call __send_ret#40 := __send(lastPlayer_re_ent23#1207[__this], __this, 0, jackpot_re_ent23#1209[__this]);
	if (!(__send_ret#40)) {
	assume false;
	}

	lastPlayer_re_ent23#1207 := lastPlayer_re_ent23#1207[__this := __msg_sender];
	jackpot_re_ent23#1209 := jackpot_re_ent23#1209[__this := __balance[__this]];
	$return36:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 347, 5} {:message "AugustCoin::balanceOf"} balanceOf#1252(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1241: address_t)
	returns (balance#1245: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#1245 := balances#1083[__this][tokenOwner#1241];
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_37.sol", 350, 1} {:message "counter_re_ent14"} counter_re_ent14#1255: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_37.sol", 351, 1} {:message "AugustCoin::callme_re_ent14"} callme_re_ent14#1284(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1255[__this] <= 5);
	call_arg#41 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 353, 9} {:message ""} true;
	call __send_ret#42 := __send(__msg_sender, __this, 0, call_arg#41);
	if (!(__send_ret#42)) {
	assume false;
	}

	counter_re_ent14#1255 := counter_re_ent14#1255[__this := (counter_re_ent14#1255[__this] + 1)];
	$return38:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 365, 5} {:message "AugustCoin::transfer"} transfer#1328(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1286: address_t, tokens#1288: int)
	returns (success#1292: bool)
{
	var safeSub#75_ret#43: int;
	var safeAdd#23_ret#44: int;
	var call_arg#45: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 366, 32} {:message ""} true;
	call safeSub#75_ret#43 := safeSub#75(__this, __msg_sender, __msg_value, balances#1083[__this][__msg_sender], tokens#1288);
	balances#1083 := balances#1083[__this := balances#1083[__this][__msg_sender := safeSub#75_ret#43]];
	assume {:sourceloc "buggy_37.sol", 367, 24} {:message ""} true;
	call safeAdd#23_ret#44 := safeAdd#23(__this, __msg_sender, __msg_value, balances#1083[__this][to#1286], tokens#1288);
	balances#1083 := balances#1083[__this := balances#1083[__this][to#1286 := safeAdd#23_ret#44]];
	call_arg#45 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 368, 14} {:message ""} true;
	call Transfer#550(__this, __msg_sender, __msg_value, call_arg#45, to#1286, tokens#1288);
	success#1292 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_37.sol", 371, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1330: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_37.sol", 372, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1332: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_37.sol", 373, 4} {:message "AugustCoin::buyTicket_re_ent30"} buyTicket_re_ent30#1362(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 374, 12} {:message ""} true;
	call __send_ret#46 := __send(lastPlayer_re_ent30#1330[__this], __this, 0, jackpot_re_ent30#1332[__this]);
	if (!(__send_ret#46)) {
	assume false;
	}

	lastPlayer_re_ent30#1330 := lastPlayer_re_ent30#1330[__this := __msg_sender];
	jackpot_re_ent30#1332 := jackpot_re_ent30#1332[__this := __balance[__this]];
	$return40:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 389, 5} {:message "AugustCoin::approve"} approve#1391(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1364: address_t, tokens#1366: int)
	returns (success#1370: bool)
{
	var call_arg#47: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#1122 := allowed#1122[__this := allowed#1122[__this][__msg_sender := allowed#1122[__this][__msg_sender][spender#1364 := tokens#1366]]];
	call_arg#47 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 391, 14} {:message ""} true;
	call Approval#595(__this, __msg_sender, __msg_value, call_arg#47, spender#1364, tokens#1366);
	success#1370 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 394, 1} {:message "balances_re_ent8"} balances_re_ent8#1395: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_37.sol", 395, 5} {:message "AugustCoin::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1424(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 396, 6} {:message "success"} success#1399: bool;
	var __call_ret#48: bool;
	var __call_ret#49: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1395[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1395[__this][__msg_sender])];
	assume {:sourceloc "buggy_37.sol", 396, 23} {:message ""} true;
	call __call_ret#48, __call_ret#49 := __call(__msg_sender, __this, balances_re_ent8#1395[__this][__msg_sender]);
	if (__call_ret#48) {
	havoc balances_re_ent10#932;
	havoc symbol#967;
	havoc balances_re_ent21#971;
	havoc name#1002;
	havoc userBalance_re_ent12#1006;
	havoc decimals#1037;
	havoc redeemableEther_re_ent11#1041;
	havoc _totalSupply#1079;
	havoc balances#1083;
	havoc balances_re_ent1#1087;
	havoc allowed#1122;
	havoc counter_re_ent7#1160;
	havoc lastPlayer_re_ent23#1207;
	havoc jackpot_re_ent23#1209;
	havoc counter_re_ent14#1255;
	havoc lastPlayer_re_ent30#1330;
	havoc jackpot_re_ent30#1332;
	havoc balances_re_ent8#1395;
	havoc redeemableEther_re_ent39#1488;
	havoc balances_re_ent36#1545;
	havoc counter_re_ent35#1615;
	havoc userBalance_re_ent40#1655;
	havoc userBalance_re_ent33#1713;
	havoc not_called_re_ent41#26;
	havoc counter_re_ent42#78;
	havoc lastPlayer_re_ent2#137;
	havoc jackpot_re_ent2#139;
	havoc balances_re_ent17#195;
	havoc not_called_re_ent34#641;
	havoc owner#670;
	havoc counter_re_ent21#673;
	havoc newOwner#704;
	havoc not_called_re_ent13#707;
	havoc redeemableEther_re_ent32#758;
	havoc balances_re_ent38#821;
	havoc redeemableEther_re_ent4#885;
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#48)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1395[__this][__msg_sender])];
	}

	success#1399 := __call_ret#48;
	if (success#1399) {
	balances_re_ent8#1395 := balances_re_ent8#1395[__this := balances_re_ent8#1395[__this][__msg_sender := 0]];
	}

	$return42:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 411, 5} {:message "AugustCoin::transferFrom"} transferFrom#1484(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1426: address_t, to#1428: address_t, tokens#1430: int)
	returns (success#1434: bool)
{
	var safeSub#75_ret#50: int;
	var safeSub#75_ret#51: int;
	var safeAdd#23_ret#52: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 412, 26} {:message ""} true;
	call safeSub#75_ret#50 := safeSub#75(__this, __msg_sender, __msg_value, balances#1083[__this][from#1426], tokens#1430);
	balances#1083 := balances#1083[__this := balances#1083[__this][from#1426 := safeSub#75_ret#50]];
	assume {:sourceloc "buggy_37.sol", 413, 37} {:message ""} true;
	call safeSub#75_ret#51 := safeSub#75(__this, __msg_sender, __msg_value, allowed#1122[__this][from#1426][__msg_sender], tokens#1430);
	allowed#1122 := allowed#1122[__this := allowed#1122[__this][from#1426 := allowed#1122[__this][from#1426][__msg_sender := safeSub#75_ret#51]]];
	assume {:sourceloc "buggy_37.sol", 414, 24} {:message ""} true;
	call safeAdd#23_ret#52 := safeAdd#23(__this, __msg_sender, __msg_value, balances#1083[__this][to#1428], tokens#1430);
	balances#1083 := balances#1083[__this := balances#1083[__this][to#1428 := safeAdd#23_ret#52]];
	assume {:sourceloc "buggy_37.sol", 415, 14} {:message ""} true;
	call Transfer#550(__this, __msg_sender, __msg_value, from#1426, to#1428, tokens#1430);
	success#1434 := true;
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 418, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1488: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_37.sol", 419, 1} {:message "AugustCoin::claimReward_re_ent39"} claimReward_re_ent39#1524(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 422, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1501: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1488[__this][__msg_sender] > 0);
	transferValue_re_ent39#1501 := redeemableEther_re_ent39#1488[__this][__msg_sender];
	assume {:sourceloc "buggy_37.sol", 423, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1501);
	redeemableEther_re_ent39#1488 := redeemableEther_re_ent39#1488[__this := redeemableEther_re_ent39#1488[__this][__msg_sender := 0]];
	$return44:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_37.sol", 432, 5} {:message "AugustCoin::allowance"} allowance#1541(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1526: address_t, spender#1528: address_t)
	returns (remaining#1532: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1532 := allowed#1122[__this][tokenOwner#1526][spender#1528];
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 435, 1} {:message "balances_re_ent36"} balances_re_ent36#1545: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_37.sol", 436, 5} {:message "AugustCoin::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1568(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#53: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 437, 14} {:message ""} true;
	call __send_ret#53 := __send(__msg_sender, __this, 0, balances_re_ent36#1545[__this][__msg_sender]);
	if (__send_ret#53) {
	balances_re_ent36#1545 := balances_re_ent36#1545[__this := balances_re_ent36#1545[__this][__msg_sender := 0]];
	}

	$return46:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_37.sol", 447, 5} {:message "AugustCoin::approveAndCall"} approveAndCall#1612(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1570: address_t, tokens#1572: int, data#1574: int_arr_ptr)
	returns (success#1577: bool)
{
	var call_arg#54: address_t;
	var call_arg#55: address_t;
	var call_arg#56: address_t;
	// TCC assumptions
	assume (data#1574 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#1122 := allowed#1122[__this := allowed#1122[__this][__msg_sender := allowed#1122[__this][__msg_sender][spender#1570 := tokens#1572]]];
	call_arg#54 := __msg_sender;
	assume {:sourceloc "buggy_37.sol", 449, 14} {:message ""} true;
	call Approval#595(__this, __msg_sender, __msg_value, call_arg#54, spender#1570, tokens#1572);
	call_arg#55 := __msg_sender;
	call_arg#56 := __this;
	assume {:sourceloc "buggy_37.sol", 450, 9} {:message ""} true;
	call receiveApproval#607(spender#1570, __this, 0, call_arg#55, tokens#1572, call_arg#56, data#1574);
	success#1577 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_37.sol", 453, 1} {:message "counter_re_ent35"} counter_re_ent35#1615: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_37.sol", 454, 1} {:message "AugustCoin::callme_re_ent35"} callme_re_ent35#1644(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#57: int;
	var __send_ret#58: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1615[__this] <= 5);
	call_arg#57 := 10000000000000000000;
	assume {:sourceloc "buggy_37.sol", 456, 9} {:message ""} true;
	call __send_ret#58 := __send(__msg_sender, __this, 0, call_arg#57);
	if (!(__send_ret#58)) {
	assume false;
	}

	counter_re_ent35#1615 := counter_re_ent35#1615[__this := (counter_re_ent35#1615[__this] + 1)];
	$return48:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_37.sol", 466, 5} {:message "AugustCoin::[fallback]"} #1651(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return49:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 469, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1655: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_37.sol", 470, 1} {:message "AugustCoin::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1689(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 473, 3} {:message "success"} success#1659: bool;
	var __call_ret#59: bool;
	var __call_ret#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1655[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1655[__this][__msg_sender])];
	assume {:sourceloc "buggy_37.sol", 473, 18} {:message ""} true;
	call __call_ret#59, __call_ret#60 := __call(__msg_sender, __this, userBalance_re_ent40#1655[__this][__msg_sender]);
	if (__call_ret#59) {
	havoc balances_re_ent10#932;
	havoc symbol#967;
	havoc balances_re_ent21#971;
	havoc name#1002;
	havoc userBalance_re_ent12#1006;
	havoc decimals#1037;
	havoc redeemableEther_re_ent11#1041;
	havoc _totalSupply#1079;
	havoc balances#1083;
	havoc balances_re_ent1#1087;
	havoc allowed#1122;
	havoc counter_re_ent7#1160;
	havoc lastPlayer_re_ent23#1207;
	havoc jackpot_re_ent23#1209;
	havoc counter_re_ent14#1255;
	havoc lastPlayer_re_ent30#1330;
	havoc jackpot_re_ent30#1332;
	havoc balances_re_ent8#1395;
	havoc redeemableEther_re_ent39#1488;
	havoc balances_re_ent36#1545;
	havoc counter_re_ent35#1615;
	havoc userBalance_re_ent40#1655;
	havoc userBalance_re_ent33#1713;
	havoc not_called_re_ent41#26;
	havoc counter_re_ent42#78;
	havoc lastPlayer_re_ent2#137;
	havoc jackpot_re_ent2#139;
	havoc balances_re_ent17#195;
	havoc not_called_re_ent34#641;
	havoc owner#670;
	havoc counter_re_ent21#673;
	havoc newOwner#704;
	havoc not_called_re_ent13#707;
	havoc redeemableEther_re_ent32#758;
	havoc balances_re_ent38#821;
	havoc redeemableEther_re_ent4#885;
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#59)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1655[__this][__msg_sender])];
	}

	success#1659 := __call_ret#59;
	if (!(success#1659)) {
	assume false;
	}

	userBalance_re_ent40#1655 := userBalance_re_ent40#1655[__this := userBalance_re_ent40#1655[__this][__msg_sender := 0]];
	$return50:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_37.sol", 484, 5} {:message "AugustCoin::transferAnyERC20Token"} transferAnyERC20Token#1709(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1691: address_t, tokens#1693: int)
	returns (success#1698: bool)
{
	var transfer#381_ret#63: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#670[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_37.sol", 485, 16} {:message ""} true;
	call transfer#381_ret#63 := transfer#381(tokenAddress#1691, __this, 0, owner#670[__this], tokens#1693);
	success#1698 := transfer#381_ret#63;
	goto $return52;
	$return52:
	// Function body ends here
	$return51:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_37.sol", 487, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1713: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_37.sol", 488, 1} {:message "AugustCoin::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1747(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_37.sol", 491, 3} {:message "success"} success#1717: bool;
	var __call_ret#64: bool;
	var __call_ret#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1713[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1713[__this][__msg_sender])];
	assume {:sourceloc "buggy_37.sol", 491, 19} {:message ""} true;
	call __call_ret#64, __call_ret#65 := __call(__msg_sender, __this, userBalance_re_ent33#1713[__this][__msg_sender]);
	if (__call_ret#64) {
	havoc balances_re_ent10#932;
	havoc symbol#967;
	havoc balances_re_ent21#971;
	havoc name#1002;
	havoc userBalance_re_ent12#1006;
	havoc decimals#1037;
	havoc redeemableEther_re_ent11#1041;
	havoc _totalSupply#1079;
	havoc balances#1083;
	havoc balances_re_ent1#1087;
	havoc allowed#1122;
	havoc counter_re_ent7#1160;
	havoc lastPlayer_re_ent23#1207;
	havoc jackpot_re_ent23#1209;
	havoc counter_re_ent14#1255;
	havoc lastPlayer_re_ent30#1330;
	havoc jackpot_re_ent30#1332;
	havoc balances_re_ent8#1395;
	havoc redeemableEther_re_ent39#1488;
	havoc balances_re_ent36#1545;
	havoc counter_re_ent35#1615;
	havoc userBalance_re_ent40#1655;
	havoc userBalance_re_ent33#1713;
	havoc not_called_re_ent41#26;
	havoc counter_re_ent42#78;
	havoc lastPlayer_re_ent2#137;
	havoc jackpot_re_ent2#139;
	havoc balances_re_ent17#195;
	havoc not_called_re_ent34#641;
	havoc owner#670;
	havoc counter_re_ent21#673;
	havoc newOwner#704;
	havoc not_called_re_ent13#707;
	havoc redeemableEther_re_ent32#758;
	havoc balances_re_ent38#821;
	havoc redeemableEther_re_ent4#885;
	havoc lastPlayer_re_ent37#242;
	havoc jackpot_re_ent37#244;
	havoc balances_re_ent3#285;
	havoc lastPlayer_re_ent9#335;
	havoc jackpot_re_ent9#337;
	havoc redeemableEther_re_ent25#385;
	havoc userBalance_re_ent19#434;
	havoc userBalance_re_ent26#478;
	havoc not_called_re_ent27#515;
	havoc balances_re_ent31#554;
	havoc __balance;
	}

	if (!(__call_ret#64)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1713[__this][__msg_sender])];
	}

	success#1717 := __call_ret#64;
	if (!(success#1717)) {
	assume false;
	}

	userBalance_re_ent33#1713 := userBalance_re_ent33#1713[__this := userBalance_re_ent33#1713[__this][__msg_sender := 0]];
	$return53:
	// Function body ends here
}

