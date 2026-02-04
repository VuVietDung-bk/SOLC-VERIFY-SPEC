// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_11.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_11.sol", 9, 5} {:message "SafeMath::add"} add#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
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
procedure {:inline 1} {:sourceloc "buggy_11.sol", 13, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#25: int, b#27: int)
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
procedure {:inline 1} {:sourceloc "buggy_11.sol", 17, 5} {:message "SafeMath::mul"} mul#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#47: int, b#49: int)
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
procedure {:inline 1} {:sourceloc "buggy_11.sol", 21, 5} {:message "SafeMath::div"} div#95(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
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
procedure {:sourceloc "buggy_11.sol", 8, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_11.sol", 95, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#414(__this: address_t, __msg_sender: address_t, __msg_value: int, from#408: address_t, to#410: address_t, tokens#412: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_11.sol", 103, 3} {:message "[event] ERC20Interface::Approval"} Approval#459(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#453: address_t, spender#455: address_t, tokens#457: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 28, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);
	modifies lastPlayer_re_ent37#103, jackpot_re_ent37#105, balances_re_ent3#146, lastPlayer_re_ent9#196, jackpot_re_ent9#198, redeemableEther_re_ent25#249, userBalance_re_ent19#298, userBalance_re_ent26#342, not_called_re_ent27#379, balances_re_ent31#418;

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_11.sol", 29, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#103: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_11.sol", 30, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#105: [address_t]int;
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
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_11.sol", 31, 4} {:message "ERC20Interface::buyTicket_re_ent37"} buyTicket_re_ent37#135(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 32, 12} {:message ""} true;
	call __send_ret#0 := __send(lastPlayer_re_ent37#103[__this], __this, 0, jackpot_re_ent37#105[__this]);
	if (!(__send_ret#0)) {
	assume false;
	}

	lastPlayer_re_ent37#103 := lastPlayer_re_ent37#103[__this := __msg_sender];
	jackpot_re_ent37#105 := jackpot_re_ent37#105[__this := __balance[__this]];
	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 37, 5} {:message "ERC20Interface::balanceOf"} balanceOf#142(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#137: address_t)
	returns (balance#140: int);
	modifies lastPlayer_re_ent37#103, jackpot_re_ent37#105, balances_re_ent3#146, lastPlayer_re_ent9#196, jackpot_re_ent9#198, redeemableEther_re_ent25#249, userBalance_re_ent19#298, userBalance_re_ent26#342, not_called_re_ent27#379, balances_re_ent31#418;

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 38, 1} {:message "balances_re_ent3"} balances_re_ent3#146: [address_t][address_t]int;
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
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 39, 1} {:message "ERC20Interface::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#185(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#148: int)
{
	var {:sourceloc "buggy_11.sol", 42, 3} {:message "success"} success#161: bool;
	var __call_ret#1: bool;
	var __call_ret#2: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#146[__this][__msg_sender] >= _weiToWithdraw#148);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#148);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#148)];
	assume {:sourceloc "buggy_11.sol", 42, 19} {:message ""} true;
	call __call_ret#1, __call_ret#2 := __call(__msg_sender, __this, _weiToWithdraw#148);
	if (__call_ret#1) {
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#1)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#148)];
	}

	success#161 := __call_ret#1;
	assume success#161;
	balances_re_ent3#146 := balances_re_ent3#146[__this := balances_re_ent3#146[__this][__msg_sender := (balances_re_ent3#146[__this][__msg_sender] - _weiToWithdraw#148)]];
	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 46, 5} {:message "ERC20Interface::allowance"} allowance#194(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#187: address_t, spender#189: address_t)
	returns (remaining#192: int);
	modifies lastPlayer_re_ent37#103, jackpot_re_ent37#105, balances_re_ent3#146, lastPlayer_re_ent9#196, jackpot_re_ent9#198, redeemableEther_re_ent25#249, userBalance_re_ent19#298, userBalance_re_ent26#342, not_called_re_ent27#379, balances_re_ent31#418;

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_11.sol", 47, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#196: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_11.sol", 48, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#198: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_11.sol", 49, 4} {:message "ERC20Interface::buyTicket_re_ent9"} buyTicket_re_ent9#236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 50, 10} {:message "success"} success#202: bool;
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#198[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#198[__this])];
	assume {:sourceloc "buggy_11.sol", 50, 27} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(lastPlayer_re_ent9#196[__this], __this, jackpot_re_ent9#198[__this]);
	if (__call_ret#3) {
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#198[__this])];
	}

	success#202 := __call_ret#3;
	if (!(success#202)) {
	assume false;
	}

	lastPlayer_re_ent9#196 := lastPlayer_re_ent9#196[__this := __msg_sender];
	jackpot_re_ent9#198 := jackpot_re_ent9#198[__this := __balance[__this]];
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 56, 5} {:message "ERC20Interface::transfer"} transfer#245(__this: address_t, __msg_sender: address_t, __msg_value: int, to#238: address_t, tokens#240: int)
	returns (success#243: bool);
	modifies lastPlayer_re_ent37#103, jackpot_re_ent37#105, balances_re_ent3#146, lastPlayer_re_ent9#196, jackpot_re_ent9#198, redeemableEther_re_ent25#249, userBalance_re_ent19#298, userBalance_re_ent26#342, not_called_re_ent27#379, balances_re_ent31#418;

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 57, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#249: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_11.sol", 58, 1} {:message "ERC20Interface::claimReward_re_ent25"} claimReward_re_ent25#285(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 61, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#262: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#249[__this][__msg_sender] > 0);
	transferValue_re_ent25#262 := redeemableEther_re_ent25#249[__this][__msg_sender];
	assume {:sourceloc "buggy_11.sol", 62, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#262);
	redeemableEther_re_ent25#249 := redeemableEther_re_ent25#249[__this := redeemableEther_re_ent25#249[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 65, 5} {:message "ERC20Interface::approve"} approve#294(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#287: address_t, tokens#289: int)
	returns (success#292: bool);
	modifies lastPlayer_re_ent37#103, jackpot_re_ent37#105, balances_re_ent3#146, lastPlayer_re_ent9#196, jackpot_re_ent9#198, redeemableEther_re_ent25#249, userBalance_re_ent19#298, userBalance_re_ent26#342, not_called_re_ent27#379, balances_re_ent31#418;

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 66, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#298: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_11.sol", 67, 1} {:message "ERC20Interface::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#327(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 70, 16} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, userBalance_re_ent19#298[__this][__msg_sender]);
	if (!(__send_ret#5)) {
	assume false;
	}

	userBalance_re_ent19#298 := userBalance_re_ent19#298[__this := userBalance_re_ent19#298[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 75, 5} {:message "ERC20Interface::transferFrom"} transferFrom#338(__this: address_t, __msg_sender: address_t, __msg_value: int, from#329: address_t, to#331: address_t, tokens#333: int)
	returns (success#336: bool);
	modifies lastPlayer_re_ent37#103, jackpot_re_ent37#105, balances_re_ent3#146, lastPlayer_re_ent9#196, jackpot_re_ent9#198, redeemableEther_re_ent25#249, userBalance_re_ent19#298, userBalance_re_ent26#342, not_called_re_ent27#379, balances_re_ent31#418;

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 76, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#342: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_11.sol", 77, 1} {:message "ERC20Interface::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#376(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 80, 3} {:message "success"} success#346: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#342[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#342[__this][__msg_sender])];
	assume {:sourceloc "buggy_11.sol", 80, 19} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, userBalance_re_ent26#342[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#342[__this][__msg_sender])];
	}

	success#346 := __call_ret#6;
	if (!(success#346)) {
	assume false;
	}

	userBalance_re_ent26#342 := userBalance_re_ent26#342[__this := userBalance_re_ent26#342[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_11.sol", 87, 3} {:message "not_called_re_ent27"} not_called_re_ent27#379: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_11.sol", 88, 1} {:message "ERC20Interface::bug_re_ent27"} bug_re_ent27#406(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#379[__this];
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 90, 16} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, call_arg#8);
	if (!(__send_ret#9)) {
	assume false;
	}

	not_called_re_ent27#379 := not_called_re_ent27#379[__this := false];
	$return10:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 96, 3} {:message "balances_re_ent31"} balances_re_ent31#418: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 97, 1} {:message "ERC20Interface::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#451(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#420: int)
{
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#418[__this][__msg_sender] >= _weiToWithdraw#420);
	assume {:sourceloc "buggy_11.sol", 100, 13} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, _weiToWithdraw#420);
	assume __send_ret#10;
	balances_re_ent31#418 := balances_re_ent31#418[__this := balances_re_ent31#418[__this][__msg_sender := (balances_re_ent31#418[__this][__msg_sender] - _weiToWithdraw#420)]];
	$return11:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "buggy_11.sol", 27, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#460(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#103 := lastPlayer_re_ent37#103[__this := 0];
	jackpot_re_ent37#105 := jackpot_re_ent37#105[__this := 0];
	balances_re_ent3#146 := balances_re_ent3#146[__this := default_address_t_int()];
	lastPlayer_re_ent9#196 := lastPlayer_re_ent9#196[__this := 0];
	jackpot_re_ent9#198 := jackpot_re_ent9#198[__this := 0];
	redeemableEther_re_ent25#249 := redeemableEther_re_ent25#249[__this := default_address_t_int()];
	userBalance_re_ent19#298 := userBalance_re_ent19#298[__this := default_address_t_int()];
	userBalance_re_ent26#342 := userBalance_re_ent26#342[__this := default_address_t_int()];
	not_called_re_ent27#379 := not_called_re_ent27#379[__this := true];
	balances_re_ent31#418 := balances_re_ent31#418[__this := default_address_t_int()];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_11.sol", 108, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#471(__this: address_t, __msg_sender: address_t, __msg_value: int, from#462: address_t, tokens#464: int, token#466: address_t, data#468: int_arr_ptr);
	modifies not_called_re_ent20#474;

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_11.sol", 109, 1} {:message "not_called_re_ent20"} not_called_re_ent20#474: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_11.sol", 110, 1} {:message "ApproveAndCallFallBack::bug_re_ent20"} bug_re_ent20#501(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#474[__this];
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 112, 16} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	assume false;
	}

	not_called_re_ent20#474 := not_called_re_ent20#474[__this := false];
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_11.sol", 107, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#502(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	not_called_re_ent20#474 := not_called_re_ent20#474[__this := true];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_11.sol", 150, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#620(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#616: address_t, _to#618: address_t)
{
	
}

// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 121, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#506: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_11.sol", 122, 1} {:message "Owned::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#535(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 125, 16} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, userBalance_re_ent12#506[__this][__msg_sender]);
	if (!(__send_ret#13)) {
	assume false;
	}

	userBalance_re_ent12#506 := userBalance_re_ent12#506[__this := userBalance_re_ent12#506[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_11.sol", 130, 3} {:message "owner"} owner#537: [address_t]address_t;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 131, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#541: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_11.sol", 132, 1} {:message "Owned::claimReward_re_ent11"} claimReward_re_ent11#577(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 135, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#554: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#541[__this][__msg_sender] > 0);
	transferValue_re_ent11#554 := redeemableEther_re_ent11#541[__this][__msg_sender];
	assume {:sourceloc "buggy_11.sol", 136, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#554);
	redeemableEther_re_ent11#541 := redeemableEther_re_ent11#541[__this := redeemableEther_re_ent11#541[__this][__msg_sender := 0]];
	$return14:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_11.sol", 139, 3} {:message "newOwner"} newOwner#579: [address_t]address_t;
// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_11.sol", 141, 3} {:message "not_called_re_ent13"} not_called_re_ent13#582: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_11.sol", 142, 1} {:message "Owned::bug_re_ent13"} bug_re_ent13#614(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 144, 10} {:message "success"} success#590: bool;
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#582[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_11.sol", 144, 25} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#14) {
	havoc userBalance_re_ent12#506;
	havoc owner#537;
	havoc redeemableEther_re_ent11#541;
	havoc newOwner#579;
	havoc not_called_re_ent13#582;
	havoc redeemableEther_re_ent32#633;
	havoc balances_re_ent38#696;
	havoc redeemableEther_re_ent4#760;
	havoc __balance;
	}

	if (!(__call_ret#14)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#590 := __call_ret#14;
	if (!(success#590)) {
	assume false;
	}

	not_called_re_ent13#582 := not_called_re_ent13#582[__this := false];
	$return15:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 152, 5} {:message "Owned::[constructor]"} __constructor#797(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent12#506 := userBalance_re_ent12#506[__this := default_address_t_int()];
	owner#537 := owner#537[__this := 0];
	redeemableEther_re_ent11#541 := redeemableEther_re_ent11#541[__this := default_address_t_int()];
	newOwner#579 := newOwner#579[__this := 0];
	not_called_re_ent13#582 := not_called_re_ent13#582[__this := true];
	redeemableEther_re_ent32#633 := redeemableEther_re_ent32#633[__this := default_address_t_int()];
	balances_re_ent38#696 := balances_re_ent38#696[__this := default_address_t_int()];
	redeemableEther_re_ent4#760 := redeemableEther_re_ent4#760[__this := default_address_t_int()];
	// Function body starts here
	owner#537 := owner#537[__this := __msg_sender];
	$return16:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 155, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#633: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_11.sol", 156, 1} {:message "Owned::claimReward_re_ent32"} claimReward_re_ent32#669(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 159, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#646: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#633[__this][__msg_sender] > 0);
	transferValue_re_ent32#646 := redeemableEther_re_ent32#633[__this][__msg_sender];
	assume {:sourceloc "buggy_11.sol", 160, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#646);
	redeemableEther_re_ent32#633 := redeemableEther_re_ent32#633[__this := redeemableEther_re_ent32#633[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_11.sol", 169, 5} {:message "Owned::transferOwnership"} transferOwnership#692(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#682: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#537[__this]);
	// Function body starts here
	newOwner#579 := newOwner#579[__this := _newOwner#682];
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 172, 1} {:message "balances_re_ent38"} balances_re_ent38#696: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 173, 1} {:message "Owned::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#729(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#698: int)
{
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#696[__this][__msg_sender] >= _weiToWithdraw#698);
	assume {:sourceloc "buggy_11.sol", 176, 13} {:message ""} true;
	call __send_ret#18 := __send(__msg_sender, __this, 0, _weiToWithdraw#698);
	assume __send_ret#18;
	balances_re_ent38#696 := balances_re_ent38#696[__this := balances_re_ent38#696[__this][__msg_sender := (balances_re_ent38#696[__this][__msg_sender] - _weiToWithdraw#698)]];
	$return20:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_11.sol", 179, 5} {:message "Owned::acceptOwnership"} acceptOwnership#756(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#579[__this]);
	assume {:sourceloc "buggy_11.sol", 181, 14} {:message ""} true;
	call OwnershipTransferred#620(__this, __msg_sender, __msg_value, owner#537[__this], newOwner#579[__this]);
	owner#537 := owner#537[__this := newOwner#579[__this]];
	newOwner#579 := newOwner#579[__this := 0];
	$return21:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 185, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#760: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_11.sol", 186, 1} {:message "Owned::claimReward_re_ent4"} claimReward_re_ent4#796(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 189, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#773: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#760[__this][__msg_sender] > 0);
	transferValue_re_ent4#773 := redeemableEther_re_ent4#760[__this][__msg_sender];
	assume {:sourceloc "buggy_11.sol", 190, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#773);
	redeemableEther_re_ent4#760 := redeemableEther_re_ent4#760[__this := redeemableEther_re_ent4#760[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// ------- Contract: ForTheBlockchain -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 199, 3} {:message "balances_re_ent1"} balances_re_ent1#808: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_11.sol", 200, 5} {:message "ForTheBlockchain::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#837(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 201, 10} {:message "success"} success#812: bool;
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#808[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#808[__this][__msg_sender])];
	assume {:sourceloc "buggy_11.sol", 201, 26} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(__msg_sender, __this, balances_re_ent1#808[__this][__msg_sender]);
	if (__call_ret#19) {
	havoc balances_re_ent1#808;
	havoc symbol#839;
	havoc not_called_re_ent41#842;
	havoc decimals#871;
	havoc counter_re_ent42#874;
	havoc name#905;
	havoc lastPlayer_re_ent2#907;
	havoc jackpot_re_ent2#909;
	havoc _totalSupply#941;
	havoc balances#945;
	havoc balances_re_ent17#949;
	havoc allowed#994;
	havoc counter_re_ent7#1034;
	havoc lastPlayer_re_ent23#1082;
	havoc jackpot_re_ent23#1084;
	havoc counter_re_ent14#1130;
	havoc lastPlayer_re_ent30#1205;
	havoc jackpot_re_ent30#1207;
	havoc balances_re_ent8#1270;
	havoc redeemableEther_re_ent39#1363;
	havoc balances_re_ent36#1420;
	havoc counter_re_ent35#1490;
	havoc userBalance_re_ent40#1530;
	havoc userBalance_re_ent33#1588;
	havoc userBalance_re_ent12#506;
	havoc owner#537;
	havoc redeemableEther_re_ent11#541;
	havoc newOwner#579;
	havoc not_called_re_ent13#582;
	havoc redeemableEther_re_ent32#633;
	havoc balances_re_ent38#696;
	havoc redeemableEther_re_ent4#760;
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#808[__this][__msg_sender])];
	}

	success#812 := __call_ret#19;
	if (success#812) {
	balances_re_ent1#808 := balances_re_ent1#808[__this := balances_re_ent1#808[__this][__msg_sender := 0]];
	}

	$return23:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_11.sol", 205, 3} {:message "symbol"} symbol#839: [address_t]int_arr_type;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_11.sol", 206, 3} {:message "not_called_re_ent41"} not_called_re_ent41#842: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_11.sol", 207, 1} {:message "ForTheBlockchain::bug_re_ent41"} bug_re_ent41#869(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#842[__this];
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_11.sol", 209, 16} {:message ""} true;
	call __send_ret#22 := __send(__msg_sender, __this, 0, call_arg#21);
	if (!(__send_ret#22)) {
	assume false;
	}

	not_called_re_ent41#842 := not_called_re_ent41#842[__this := false];
	$return24:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_11.sol", 214, 3} {:message "decimals"} decimals#871: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_11.sol", 215, 3} {:message "counter_re_ent42"} counter_re_ent42#874: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_11.sol", 216, 1} {:message "ForTheBlockchain::callme_re_ent42"} callme_re_ent42#903(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#874[__this] <= 5);
	call_arg#23 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 218, 9} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, call_arg#23);
	if (!(__send_ret#24)) {
	assume false;
	}

	counter_re_ent42#874 := counter_re_ent42#874[__this := (counter_re_ent42#874[__this] + 1)];
	$return25:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_11.sol", 223, 3} {:message "name"} name#905: [address_t]int_arr_type;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_11.sol", 224, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#907: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_11.sol", 225, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#909: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_11.sol", 226, 4} {:message "ForTheBlockchain::buyTicket_re_ent2"} buyTicket_re_ent2#939(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 227, 12} {:message ""} true;
	call __send_ret#25 := __send(lastPlayer_re_ent2#907[__this], __this, 0, jackpot_re_ent2#909[__this]);
	if (!(__send_ret#25)) {
	assume false;
	}

	lastPlayer_re_ent2#907 := lastPlayer_re_ent2#907[__this := __msg_sender];
	jackpot_re_ent2#909 := jackpot_re_ent2#909[__this := __balance[__this]];
	$return26:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_11.sol", 232, 3} {:message "_totalSupply"} _totalSupply#941: [address_t]int;
// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 235, 5} {:message "balances"} balances#945: [address_t][address_t]int;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 236, 3} {:message "balances_re_ent17"} balances_re_ent17#949: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_11.sol", 237, 1} {:message "ForTheBlockchain::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#988(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#951: int)
{
	var {:sourceloc "buggy_11.sol", 240, 6} {:message "success"} success#964: bool;
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#949[__this][__msg_sender] >= _weiToWithdraw#951);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#951);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#951)];
	assume {:sourceloc "buggy_11.sol", 240, 21} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(__msg_sender, __this, _weiToWithdraw#951);
	if (__call_ret#26) {
	havoc balances_re_ent1#808;
	havoc symbol#839;
	havoc not_called_re_ent41#842;
	havoc decimals#871;
	havoc counter_re_ent42#874;
	havoc name#905;
	havoc lastPlayer_re_ent2#907;
	havoc jackpot_re_ent2#909;
	havoc _totalSupply#941;
	havoc balances#945;
	havoc balances_re_ent17#949;
	havoc allowed#994;
	havoc counter_re_ent7#1034;
	havoc lastPlayer_re_ent23#1082;
	havoc jackpot_re_ent23#1084;
	havoc counter_re_ent14#1130;
	havoc lastPlayer_re_ent30#1205;
	havoc jackpot_re_ent30#1207;
	havoc balances_re_ent8#1270;
	havoc redeemableEther_re_ent39#1363;
	havoc balances_re_ent36#1420;
	havoc counter_re_ent35#1490;
	havoc userBalance_re_ent40#1530;
	havoc userBalance_re_ent33#1588;
	havoc userBalance_re_ent12#506;
	havoc owner#537;
	havoc redeemableEther_re_ent11#541;
	havoc newOwner#579;
	havoc not_called_re_ent13#582;
	havoc redeemableEther_re_ent32#633;
	havoc balances_re_ent38#696;
	havoc redeemableEther_re_ent4#760;
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#951)];
	}

	success#964 := __call_ret#26;
	assume success#964;
	balances_re_ent17#949 := balances_re_ent17#949[__this := balances_re_ent17#949[__this][__msg_sender := (balances_re_ent17#949[__this][__msg_sender] - _weiToWithdraw#951)]];
	$return27:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_11.sol", 244, 3} {:message "allowed"} allowed#994: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 250, 5} {:message "ForTheBlockchain::[constructor]"} __constructor#1623(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent1#808 := balances_re_ent1#808[__this := default_address_t_int()];
	symbol#839 := symbol#839[__this := int_arr#constr(default_int_int(), 0)];
	not_called_re_ent41#842 := not_called_re_ent41#842[__this := true];
	decimals#871 := decimals#871[__this := 0];
	counter_re_ent42#874 := counter_re_ent42#874[__this := 0];
	name#905 := name#905[__this := int_arr#constr(default_int_int(), 0)];
	lastPlayer_re_ent2#907 := lastPlayer_re_ent2#907[__this := 0];
	jackpot_re_ent2#909 := jackpot_re_ent2#909[__this := 0];
	_totalSupply#941 := _totalSupply#941[__this := 0];
	balances#945 := balances#945[__this := default_address_t_int()];
	balances_re_ent17#949 := balances_re_ent17#949[__this := default_address_t_int()];
	allowed#994 := allowed#994[__this := default_address_t__k_address_t_v_int()];
	counter_re_ent7#1034 := counter_re_ent7#1034[__this := 0];
	lastPlayer_re_ent23#1082 := lastPlayer_re_ent23#1082[__this := 0];
	jackpot_re_ent23#1084 := jackpot_re_ent23#1084[__this := 0];
	counter_re_ent14#1130 := counter_re_ent14#1130[__this := 0];
	lastPlayer_re_ent30#1205 := lastPlayer_re_ent30#1205[__this := 0];
	jackpot_re_ent30#1207 := jackpot_re_ent30#1207[__this := 0];
	balances_re_ent8#1270 := balances_re_ent8#1270[__this := default_address_t_int()];
	redeemableEther_re_ent39#1363 := redeemableEther_re_ent39#1363[__this := default_address_t_int()];
	balances_re_ent36#1420 := balances_re_ent36#1420[__this := default_address_t_int()];
	counter_re_ent35#1490 := counter_re_ent35#1490[__this := 0];
	userBalance_re_ent40#1530 := userBalance_re_ent40#1530[__this := default_address_t_int()];
	userBalance_re_ent33#1588 := userBalance_re_ent33#1588[__this := default_address_t_int()];
	userBalance_re_ent12#506 := userBalance_re_ent12#506[__this := default_address_t_int()];
	owner#537 := owner#537[__this := 0];
	redeemableEther_re_ent11#541 := redeemableEther_re_ent11#541[__this := default_address_t_int()];
	newOwner#579 := newOwner#579[__this := 0];
	not_called_re_ent13#582 := not_called_re_ent13#582[__this := true];
	redeemableEther_re_ent32#633 := redeemableEther_re_ent32#633[__this := default_address_t_int()];
	balances_re_ent38#696 := balances_re_ent38#696[__this := default_address_t_int()];
	redeemableEther_re_ent4#760 := redeemableEther_re_ent4#760[__this := default_address_t_int()];
	lastPlayer_re_ent37#103 := lastPlayer_re_ent37#103[__this := 0];
	jackpot_re_ent37#105 := jackpot_re_ent37#105[__this := 0];
	balances_re_ent3#146 := balances_re_ent3#146[__this := default_address_t_int()];
	lastPlayer_re_ent9#196 := lastPlayer_re_ent9#196[__this := 0];
	jackpot_re_ent9#198 := jackpot_re_ent9#198[__this := 0];
	redeemableEther_re_ent25#249 := redeemableEther_re_ent25#249[__this := default_address_t_int()];
	userBalance_re_ent19#298 := userBalance_re_ent19#298[__this := default_address_t_int()];
	userBalance_re_ent26#342 := userBalance_re_ent26#342[__this := default_address_t_int()];
	not_called_re_ent27#379 := not_called_re_ent27#379[__this := true];
	balances_re_ent31#418 := balances_re_ent31#418[__this := default_address_t_int()];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#537 := owner#537[__this := __msg_sender];
	$return28:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#839 := symbol#839[__this := int_arr#constr(default_int_int()[0 := 70][1 := 84][2 := 66], 3)];
	name#905 := name#905[__this := int_arr#constr(default_int_int()[0 := 70][1 := 111][2 := 114][3 := 84][4 := 104][5 := 101][6 := 66][7 := 108][8 := 111][9 := 99][10 := 107][11 := 99][12 := 104][13 := 97][14 := 105][15 := 110], 16)];
	decimals#871 := decimals#871[__this := 8];
	_totalSupply#941 := _totalSupply#941[__this := 10000000000000000];
	balances#945 := balances#945[__this := balances#945[__this][owner#537[__this] := _totalSupply#941[__this]]];
	call_arg#29 := 0;
	assume {:sourceloc "buggy_11.sol", 256, 14} {:message ""} true;
	call Transfer#414(__this, __msg_sender, __msg_value, call_arg#29, owner#537[__this], _totalSupply#941[__this]);
	$return29:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_11.sol", 259, 1} {:message "counter_re_ent7"} counter_re_ent7#1034: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_11.sol", 260, 1} {:message "ForTheBlockchain::callme_re_ent7"} callme_re_ent7#1063(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1034[__this] <= 5);
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 262, 9} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	counter_re_ent7#1034 := counter_re_ent7#1034[__this := (counter_re_ent7#1034[__this] + 1)];
	$return30:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 272, 5} {:message "ForTheBlockchain::totalSupply"} totalSupply#1080(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1067: int)
{
	var sub#45_ret#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 273, 16} {:message ""} true;
	call sub#45_ret#32 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#941[__this], balances#945[__this][0]);
	#1067 := sub#45_ret#32;
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_11.sol", 275, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1082: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_11.sol", 276, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1084: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_11.sol", 277, 4} {:message "ForTheBlockchain::buyTicket_re_ent23"} buyTicket_re_ent23#1114(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 278, 12} {:message ""} true;
	call __send_ret#33 := __send(lastPlayer_re_ent23#1082[__this], __this, 0, jackpot_re_ent23#1084[__this]);
	if (!(__send_ret#33)) {
	assume false;
	}

	lastPlayer_re_ent23#1082 := lastPlayer_re_ent23#1082[__this := __msg_sender];
	jackpot_re_ent23#1084 := jackpot_re_ent23#1084[__this := __balance[__this]];
	$return32:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 288, 5} {:message "ForTheBlockchain::balanceOf"} balanceOf#1127(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1116: address_t)
	returns (balance#1120: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#1120 := balances#945[__this][tokenOwner#1116];
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_11.sol", 291, 1} {:message "counter_re_ent14"} counter_re_ent14#1130: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_11.sol", 292, 1} {:message "ForTheBlockchain::callme_re_ent14"} callme_re_ent14#1159(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1130[__this] <= 5);
	call_arg#34 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 294, 9} {:message ""} true;
	call __send_ret#35 := __send(__msg_sender, __this, 0, call_arg#34);
	if (!(__send_ret#35)) {
	assume false;
	}

	counter_re_ent14#1130 := counter_re_ent14#1130[__this := (counter_re_ent14#1130[__this] + 1)];
	$return34:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 306, 5} {:message "ForTheBlockchain::transfer"} transfer#1203(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1161: address_t, tokens#1163: int)
	returns (success#1167: bool)
{
	var sub#45_ret#36: int;
	var add#23_ret#37: int;
	var call_arg#38: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 307, 32} {:message ""} true;
	call sub#45_ret#36 := sub#45(__this, __msg_sender, __msg_value, balances#945[__this][__msg_sender], tokens#1163);
	balances#945 := balances#945[__this := balances#945[__this][__msg_sender := sub#45_ret#36]];
	assume {:sourceloc "buggy_11.sol", 308, 24} {:message ""} true;
	call add#23_ret#37 := add#23(__this, __msg_sender, __msg_value, balances#945[__this][to#1161], tokens#1163);
	balances#945 := balances#945[__this := balances#945[__this][to#1161 := add#23_ret#37]];
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 309, 14} {:message ""} true;
	call Transfer#414(__this, __msg_sender, __msg_value, call_arg#38, to#1161, tokens#1163);
	success#1167 := true;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_11.sol", 312, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1205: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_11.sol", 313, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1207: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_11.sol", 314, 4} {:message "ForTheBlockchain::buyTicket_re_ent30"} buyTicket_re_ent30#1237(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 315, 12} {:message ""} true;
	call __send_ret#39 := __send(lastPlayer_re_ent30#1205[__this], __this, 0, jackpot_re_ent30#1207[__this]);
	if (!(__send_ret#39)) {
	assume false;
	}

	lastPlayer_re_ent30#1205 := lastPlayer_re_ent30#1205[__this := __msg_sender];
	jackpot_re_ent30#1207 := jackpot_re_ent30#1207[__this := __balance[__this]];
	$return36:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 330, 5} {:message "ForTheBlockchain::approve"} approve#1266(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1239: address_t, tokens#1241: int)
	returns (success#1245: bool)
{
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#994 := allowed#994[__this := allowed#994[__this][__msg_sender := allowed#994[__this][__msg_sender][spender#1239 := tokens#1241]]];
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 332, 14} {:message ""} true;
	call Approval#459(__this, __msg_sender, __msg_value, call_arg#40, spender#1239, tokens#1241);
	success#1245 := true;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 335, 1} {:message "balances_re_ent8"} balances_re_ent8#1270: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_11.sol", 336, 5} {:message "ForTheBlockchain::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1299(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 337, 10} {:message "success"} success#1274: bool;
	var __call_ret#41: bool;
	var __call_ret#42: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1270[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1270[__this][__msg_sender])];
	assume {:sourceloc "buggy_11.sol", 337, 27} {:message ""} true;
	call __call_ret#41, __call_ret#42 := __call(__msg_sender, __this, balances_re_ent8#1270[__this][__msg_sender]);
	if (__call_ret#41) {
	havoc balances_re_ent1#808;
	havoc symbol#839;
	havoc not_called_re_ent41#842;
	havoc decimals#871;
	havoc counter_re_ent42#874;
	havoc name#905;
	havoc lastPlayer_re_ent2#907;
	havoc jackpot_re_ent2#909;
	havoc _totalSupply#941;
	havoc balances#945;
	havoc balances_re_ent17#949;
	havoc allowed#994;
	havoc counter_re_ent7#1034;
	havoc lastPlayer_re_ent23#1082;
	havoc jackpot_re_ent23#1084;
	havoc counter_re_ent14#1130;
	havoc lastPlayer_re_ent30#1205;
	havoc jackpot_re_ent30#1207;
	havoc balances_re_ent8#1270;
	havoc redeemableEther_re_ent39#1363;
	havoc balances_re_ent36#1420;
	havoc counter_re_ent35#1490;
	havoc userBalance_re_ent40#1530;
	havoc userBalance_re_ent33#1588;
	havoc userBalance_re_ent12#506;
	havoc owner#537;
	havoc redeemableEther_re_ent11#541;
	havoc newOwner#579;
	havoc not_called_re_ent13#582;
	havoc redeemableEther_re_ent32#633;
	havoc balances_re_ent38#696;
	havoc redeemableEther_re_ent4#760;
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#41)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1270[__this][__msg_sender])];
	}

	success#1274 := __call_ret#41;
	if (success#1274) {
	balances_re_ent8#1270 := balances_re_ent8#1270[__this := balances_re_ent8#1270[__this][__msg_sender := 0]];
	}

	$return38:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 352, 5} {:message "ForTheBlockchain::transferFrom"} transferFrom#1359(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1301: address_t, to#1303: address_t, tokens#1305: int)
	returns (success#1309: bool)
{
	var sub#45_ret#43: int;
	var sub#45_ret#44: int;
	var add#23_ret#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 353, 26} {:message ""} true;
	call sub#45_ret#43 := sub#45(__this, __msg_sender, __msg_value, balances#945[__this][from#1301], tokens#1305);
	balances#945 := balances#945[__this := balances#945[__this][from#1301 := sub#45_ret#43]];
	assume {:sourceloc "buggy_11.sol", 354, 37} {:message ""} true;
	call sub#45_ret#44 := sub#45(__this, __msg_sender, __msg_value, allowed#994[__this][from#1301][__msg_sender], tokens#1305);
	allowed#994 := allowed#994[__this := allowed#994[__this][from#1301 := allowed#994[__this][from#1301][__msg_sender := sub#45_ret#44]]];
	assume {:sourceloc "buggy_11.sol", 355, 24} {:message ""} true;
	call add#23_ret#45 := add#23(__this, __msg_sender, __msg_value, balances#945[__this][to#1303], tokens#1305);
	balances#945 := balances#945[__this := balances#945[__this][to#1303 := add#23_ret#45]];
	assume {:sourceloc "buggy_11.sol", 356, 14} {:message ""} true;
	call Transfer#414(__this, __msg_sender, __msg_value, from#1301, to#1303, tokens#1305);
	success#1309 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 359, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1363: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_11.sol", 360, 1} {:message "ForTheBlockchain::claimReward_re_ent39"} claimReward_re_ent39#1399(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 363, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1376: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1363[__this][__msg_sender] > 0);
	transferValue_re_ent39#1376 := redeemableEther_re_ent39#1363[__this][__msg_sender];
	assume {:sourceloc "buggy_11.sol", 364, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1376);
	redeemableEther_re_ent39#1363 := redeemableEther_re_ent39#1363[__this := redeemableEther_re_ent39#1363[__this][__msg_sender := 0]];
	$return40:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_11.sol", 373, 5} {:message "ForTheBlockchain::allowance"} allowance#1416(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1401: address_t, spender#1403: address_t)
	returns (remaining#1407: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1407 := allowed#994[__this][tokenOwner#1401][spender#1403];
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 376, 1} {:message "balances_re_ent36"} balances_re_ent36#1420: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_11.sol", 377, 5} {:message "ForTheBlockchain::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1443(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 378, 14} {:message ""} true;
	call __send_ret#46 := __send(__msg_sender, __this, 0, balances_re_ent36#1420[__this][__msg_sender]);
	if (__send_ret#46) {
	balances_re_ent36#1420 := balances_re_ent36#1420[__this := balances_re_ent36#1420[__this][__msg_sender := 0]];
	}

	$return42:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_11.sol", 388, 5} {:message "ForTheBlockchain::approveAndCall"} approveAndCall#1487(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1445: address_t, tokens#1447: int, data#1449: int_arr_ptr)
	returns (success#1452: bool)
{
	var call_arg#47: address_t;
	var call_arg#48: address_t;
	var call_arg#49: address_t;
	// TCC assumptions
	assume (data#1449 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#994 := allowed#994[__this := allowed#994[__this][__msg_sender := allowed#994[__this][__msg_sender][spender#1445 := tokens#1447]]];
	call_arg#47 := __msg_sender;
	assume {:sourceloc "buggy_11.sol", 390, 14} {:message ""} true;
	call Approval#459(__this, __msg_sender, __msg_value, call_arg#47, spender#1445, tokens#1447);
	call_arg#48 := __msg_sender;
	call_arg#49 := __this;
	assume {:sourceloc "buggy_11.sol", 391, 9} {:message ""} true;
	call receiveApproval#471(spender#1445, __this, 0, call_arg#48, tokens#1447, call_arg#49, data#1449);
	success#1452 := true;
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_11.sol", 394, 1} {:message "counter_re_ent35"} counter_re_ent35#1490: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_11.sol", 395, 1} {:message "ForTheBlockchain::callme_re_ent35"} callme_re_ent35#1519(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#50: int;
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1490[__this] <= 5);
	call_arg#50 := 10000000000000000000;
	assume {:sourceloc "buggy_11.sol", 397, 9} {:message ""} true;
	call __send_ret#51 := __send(__msg_sender, __this, 0, call_arg#50);
	if (!(__send_ret#51)) {
	assume false;
	}

	counter_re_ent35#1490 := counter_re_ent35#1490[__this := (counter_re_ent35#1490[__this] + 1)];
	$return44:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_11.sol", 407, 5} {:message "ForTheBlockchain::[receive]"} #1526(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return45:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 410, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1530: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_11.sol", 411, 1} {:message "ForTheBlockchain::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1564(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 414, 10} {:message "success"} success#1534: bool;
	var __call_ret#52: bool;
	var __call_ret#53: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1530[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1530[__this][__msg_sender])];
	assume {:sourceloc "buggy_11.sol", 414, 25} {:message ""} true;
	call __call_ret#52, __call_ret#53 := __call(__msg_sender, __this, userBalance_re_ent40#1530[__this][__msg_sender]);
	if (__call_ret#52) {
	havoc balances_re_ent1#808;
	havoc symbol#839;
	havoc not_called_re_ent41#842;
	havoc decimals#871;
	havoc counter_re_ent42#874;
	havoc name#905;
	havoc lastPlayer_re_ent2#907;
	havoc jackpot_re_ent2#909;
	havoc _totalSupply#941;
	havoc balances#945;
	havoc balances_re_ent17#949;
	havoc allowed#994;
	havoc counter_re_ent7#1034;
	havoc lastPlayer_re_ent23#1082;
	havoc jackpot_re_ent23#1084;
	havoc counter_re_ent14#1130;
	havoc lastPlayer_re_ent30#1205;
	havoc jackpot_re_ent30#1207;
	havoc balances_re_ent8#1270;
	havoc redeemableEther_re_ent39#1363;
	havoc balances_re_ent36#1420;
	havoc counter_re_ent35#1490;
	havoc userBalance_re_ent40#1530;
	havoc userBalance_re_ent33#1588;
	havoc userBalance_re_ent12#506;
	havoc owner#537;
	havoc redeemableEther_re_ent11#541;
	havoc newOwner#579;
	havoc not_called_re_ent13#582;
	havoc redeemableEther_re_ent32#633;
	havoc balances_re_ent38#696;
	havoc redeemableEther_re_ent4#760;
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#52)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1530[__this][__msg_sender])];
	}

	success#1534 := __call_ret#52;
	if (!(success#1534)) {
	assume false;
	}

	userBalance_re_ent40#1530 := userBalance_re_ent40#1530[__this := userBalance_re_ent40#1530[__this][__msg_sender := 0]];
	$return46:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_11.sol", 425, 5} {:message "ForTheBlockchain::transferAnyERC20Token"} transferAnyERC20Token#1584(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1566: address_t, tokens#1568: int)
	returns (success#1573: bool)
{
	var transfer#245_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#537[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_11.sol", 426, 16} {:message ""} true;
	call transfer#245_ret#56 := transfer#245(tokenAddress#1566, __this, 0, owner#537[__this], tokens#1568);
	success#1573 := transfer#245_ret#56;
	goto $return48;
	$return48:
	// Function body ends here
	$return47:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_11.sol", 428, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1588: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_11.sol", 429, 1} {:message "ForTheBlockchain::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1622(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_11.sol", 432, 10} {:message "success"} success#1592: bool;
	var __call_ret#57: bool;
	var __call_ret#58: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1588[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1588[__this][__msg_sender])];
	assume {:sourceloc "buggy_11.sol", 432, 26} {:message ""} true;
	call __call_ret#57, __call_ret#58 := __call(__msg_sender, __this, userBalance_re_ent33#1588[__this][__msg_sender]);
	if (__call_ret#57) {
	havoc balances_re_ent1#808;
	havoc symbol#839;
	havoc not_called_re_ent41#842;
	havoc decimals#871;
	havoc counter_re_ent42#874;
	havoc name#905;
	havoc lastPlayer_re_ent2#907;
	havoc jackpot_re_ent2#909;
	havoc _totalSupply#941;
	havoc balances#945;
	havoc balances_re_ent17#949;
	havoc allowed#994;
	havoc counter_re_ent7#1034;
	havoc lastPlayer_re_ent23#1082;
	havoc jackpot_re_ent23#1084;
	havoc counter_re_ent14#1130;
	havoc lastPlayer_re_ent30#1205;
	havoc jackpot_re_ent30#1207;
	havoc balances_re_ent8#1270;
	havoc redeemableEther_re_ent39#1363;
	havoc balances_re_ent36#1420;
	havoc counter_re_ent35#1490;
	havoc userBalance_re_ent40#1530;
	havoc userBalance_re_ent33#1588;
	havoc userBalance_re_ent12#506;
	havoc owner#537;
	havoc redeemableEther_re_ent11#541;
	havoc newOwner#579;
	havoc not_called_re_ent13#582;
	havoc redeemableEther_re_ent32#633;
	havoc balances_re_ent38#696;
	havoc redeemableEther_re_ent4#760;
	havoc lastPlayer_re_ent37#103;
	havoc jackpot_re_ent37#105;
	havoc balances_re_ent3#146;
	havoc lastPlayer_re_ent9#196;
	havoc jackpot_re_ent9#198;
	havoc redeemableEther_re_ent25#249;
	havoc userBalance_re_ent19#298;
	havoc userBalance_re_ent26#342;
	havoc not_called_re_ent27#379;
	havoc balances_re_ent31#418;
	havoc __balance;
	}

	if (!(__call_ret#57)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1588[__this][__msg_sender])];
	}

	success#1592 := __call_ret#57;
	if (!(success#1592)) {
	assume false;
	}

	userBalance_re_ent33#1588 := userBalance_re_ent33#1588[__this := userBalance_re_ent33#1588[__this][__msg_sender := 0]];
	$return49:
	// Function body ends here
}

