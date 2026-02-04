// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_32.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_32.sol", 24, 5} {:message "SafeMath::sub"} sub#28(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	var {:sourceloc "buggy_32.sol", 26, 9} {:message "c"} c#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#7 <= a#5);
	c#20 := (a#5 - b#7);
	#10 := c#20;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_32.sol", 34, 5} {:message "SafeMath::add"} add#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#31: int, b#33: int)
	returns (#36: int)
{
	var {:sourceloc "buggy_32.sol", 35, 9} {:message "c"} c#39: int;
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#39 := (a#31 + b#33);
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#39 >= a#31);
	#36 := c#39;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_32.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#55(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20TokenInterface -------
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 48, 5} {:message "ERC20TokenInterface::balanceOf"} balanceOf#63(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#58: address_t)
	returns (value#61: int);
	modifies redeemableEther_re_ent4#67, counter_re_ent7#115, lastPlayer_re_ent23#157, jackpot_re_ent23#159, counter_re_ent14#201, lastPlayer_re_ent30#241, jackpot_re_ent30#243;

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 49, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#67: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_32.sol", 50, 1} {:message "ERC20TokenInterface::claimReward_re_ent4"} claimReward_re_ent4#103(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 53, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#80: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#67[__this][__msg_sender] > 0);
	transferValue_re_ent4#80 := redeemableEther_re_ent4#67[__this][__msg_sender];
	assume {:sourceloc "buggy_32.sol", 54, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#80);
	redeemableEther_re_ent4#67 := redeemableEther_re_ent4#67[__this := redeemableEther_re_ent4#67[__this][__msg_sender := 0]];
	$return2:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 57, 5} {:message "ERC20TokenInterface::transfer"} transfer#112(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#105: address_t, _value#107: int)
	returns (success#110: bool);
	modifies redeemableEther_re_ent4#67, counter_re_ent7#115, lastPlayer_re_ent23#157, jackpot_re_ent23#159, counter_re_ent14#201, lastPlayer_re_ent30#241, jackpot_re_ent30#243;

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_32.sol", 58, 1} {:message "counter_re_ent7"} counter_re_ent7#115: [address_t]int;
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
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_32.sol", 59, 1} {:message "ERC20TokenInterface::callme_re_ent7"} callme_re_ent7#144(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#115[__this] <= 5);
	call_arg#4 := 10000000000000000000;
	assume {:sourceloc "buggy_32.sol", 61, 9} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, call_arg#4);
	if (!(__send_ret#5)) {
	assume false;
	}

	counter_re_ent7#115 := counter_re_ent7#115[__this := (counter_re_ent7#115[__this] + 1)];
	$return3:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 66, 5} {:message "ERC20TokenInterface::transferFrom"} transferFrom#155(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#146: address_t, _to#148: address_t, _value#150: int)
	returns (success#153: bool);
	modifies redeemableEther_re_ent4#67, counter_re_ent7#115, lastPlayer_re_ent23#157, jackpot_re_ent23#159, counter_re_ent14#201, lastPlayer_re_ent30#241, jackpot_re_ent30#243;

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_32.sol", 67, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#157: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_32.sol", 68, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#159: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_32.sol", 69, 4} {:message "ERC20TokenInterface::buyTicket_re_ent23"} buyTicket_re_ent23#189(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 70, 12} {:message ""} true;
	call __send_ret#6 := __send(lastPlayer_re_ent23#157[__this], __this, 0, jackpot_re_ent23#159[__this]);
	if (!(__send_ret#6)) {
	assume false;
	}

	lastPlayer_re_ent23#157 := lastPlayer_re_ent23#157[__this := __msg_sender];
	jackpot_re_ent23#159 := jackpot_re_ent23#159[__this := __balance[__this]];
	$return4:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 75, 5} {:message "ERC20TokenInterface::approve"} approve#198(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#191: address_t, _value#193: int)
	returns (success#196: bool);
	modifies redeemableEther_re_ent4#67, counter_re_ent7#115, lastPlayer_re_ent23#157, jackpot_re_ent23#159, counter_re_ent14#201, lastPlayer_re_ent30#241, jackpot_re_ent30#243;

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_32.sol", 76, 1} {:message "counter_re_ent14"} counter_re_ent14#201: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_32.sol", 77, 1} {:message "ERC20TokenInterface::callme_re_ent14"} callme_re_ent14#230(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#201[__this] <= 5);
	call_arg#7 := 10000000000000000000;
	assume {:sourceloc "buggy_32.sol", 79, 9} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, call_arg#7);
	if (!(__send_ret#8)) {
	assume false;
	}

	counter_re_ent14#201 := counter_re_ent14#201[__this := (counter_re_ent14#201[__this] + 1)];
	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 84, 5} {:message "ERC20TokenInterface::allowance"} allowance#239(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#232: address_t, _spender#234: address_t)
	returns (remaining#237: int);
	modifies redeemableEther_re_ent4#67, counter_re_ent7#115, lastPlayer_re_ent23#157, jackpot_re_ent23#159, counter_re_ent14#201, lastPlayer_re_ent30#241, jackpot_re_ent30#243;

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_32.sol", 85, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#241: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_32.sol", 86, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#243: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_32.sol", 87, 4} {:message "ERC20TokenInterface::buyTicket_re_ent30"} buyTicket_re_ent30#273(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 88, 12} {:message ""} true;
	call __send_ret#9 := __send(lastPlayer_re_ent30#241[__this], __this, 0, jackpot_re_ent30#243[__this]);
	if (!(__send_ret#9)) {
	assume false;
	}

	lastPlayer_re_ent30#241 := lastPlayer_re_ent30#241[__this := __msg_sender];
	jackpot_re_ent30#243 := jackpot_re_ent30#243[__this := __balance[__this]];
	$return6:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "buggy_32.sol", 46, 1} {:message "ERC20TokenInterface::[implicit_constructor]"} __constructor#274(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent4#67 := redeemableEther_re_ent4#67[__this := default_address_t_int()];
	counter_re_ent7#115 := counter_re_ent7#115[__this := 0];
	lastPlayer_re_ent23#157 := lastPlayer_re_ent23#157[__this := 0];
	jackpot_re_ent23#159 := jackpot_re_ent23#159[__this := 0];
	counter_re_ent14#201 := counter_re_ent14#201[__this := 0];
	lastPlayer_re_ent30#241 := lastPlayer_re_ent30#241[__this := 0];
	jackpot_re_ent30#243 := jackpot_re_ent30#243[__this := 0];
}

// 
// ------- Contract: ERC20Token -------
// Inherits from: ERC20TokenInterface
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_32.sol", 233, 3} {:message "[event] ERC20Token::Transfer"} Transfer#788(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#782: address_t, _to#784: address_t, _value#786: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_32.sol", 243, 3} {:message "[event] ERC20Token::Approval"} Approval#831(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#825: address_t, _spender#827: address_t, _value#829: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_32.sol", 102, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#282: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_32.sol", 103, 13} {:message "jackpot_re_ent9"} jackpot_re_ent9#284: [address_t]int;
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
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_32.sol", 104, 4} {:message "ERC20Token::buyTicket_re_ent9"} buyTicket_re_ent9#319(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 105, 7} {:message "success"} success#288: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#284[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#284[__this])];
	assume {:sourceloc "buggy_32.sol", 105, 24} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(lastPlayer_re_ent9#282[__this], __this, jackpot_re_ent9#284[__this]);
	if (__call_ret#10) {
	havoc lastPlayer_re_ent9#282;
	havoc jackpot_re_ent9#284;
	havoc totalSupply#321;
	havoc redeemableEther_re_ent25#325;
	havoc balances#365;
	havoc userBalance_re_ent19#369;
	havoc allowed#404;
	havoc balances_re_ent8#422;
	havoc redeemableEther_re_ent39#500;
	havoc balances_re_ent36#601;
	havoc counter_re_ent35#657;
	havoc userBalance_re_ent40#708;
	havoc balances_re_ent31#747;
	havoc not_called_re_ent13#791;
	havoc redeemableEther_re_ent4#67;
	havoc counter_re_ent7#115;
	havoc lastPlayer_re_ent23#157;
	havoc jackpot_re_ent23#159;
	havoc counter_re_ent14#201;
	havoc lastPlayer_re_ent30#241;
	havoc jackpot_re_ent30#243;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#284[__this])];
	}

	success#288 := __call_ret#10;
	if (!(success#288)) {
	assume false;
	}

	lastPlayer_re_ent9#282 := lastPlayer_re_ent9#282[__this := __msg_sender];
	jackpot_re_ent9#284 := jackpot_re_ent9#284[__this := __balance[__this]];
	$return7:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_32.sol", 111, 3} {:message "totalSupply"} totalSupply#321: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 112, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#325: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_32.sol", 113, 1} {:message "ERC20Token::claimReward_re_ent25"} claimReward_re_ent25#361(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 116, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#338: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#325[__this][__msg_sender] > 0);
	transferValue_re_ent25#338 := redeemableEther_re_ent25#325[__this][__msg_sender];
	assume {:sourceloc "buggy_32.sol", 117, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#338);
	redeemableEther_re_ent25#325 := redeemableEther_re_ent25#325[__this := redeemableEther_re_ent25#325[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 120, 3} {:message "balances"} balances#365: [address_t][address_t]int;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 121, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#369: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_32.sol", 122, 1} {:message "ERC20Token::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#398(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 125, 16} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, userBalance_re_ent19#369[__this][__msg_sender]);
	if (!(__send_ret#12)) {
	assume false;
	}

	userBalance_re_ent19#369 := userBalance_re_ent19#369[__this := userBalance_re_ent19#369[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_32.sol", 130, 3} {:message "allowed"} allowed#404: [address_t][address_t][address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 136, 5} {:message "ERC20Token::balanceOf"} balanceOf#418(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#407: address_t)
	returns (value#411: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	value#411 := balances#365[__this][_owner#407];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 139, 1} {:message "balances_re_ent8"} balances_re_ent8#422: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_32.sol", 140, 5} {:message "ERC20Token::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#451(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 141, 6} {:message "success"} success#426: bool;
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#422[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#422[__this][__msg_sender])];
	assume {:sourceloc "buggy_32.sol", 141, 23} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(__msg_sender, __this, balances_re_ent8#422[__this][__msg_sender]);
	if (__call_ret#13) {
	havoc lastPlayer_re_ent9#282;
	havoc jackpot_re_ent9#284;
	havoc totalSupply#321;
	havoc redeemableEther_re_ent25#325;
	havoc balances#365;
	havoc userBalance_re_ent19#369;
	havoc allowed#404;
	havoc balances_re_ent8#422;
	havoc redeemableEther_re_ent39#500;
	havoc balances_re_ent36#601;
	havoc counter_re_ent35#657;
	havoc userBalance_re_ent40#708;
	havoc balances_re_ent31#747;
	havoc not_called_re_ent13#791;
	havoc redeemableEther_re_ent4#67;
	havoc counter_re_ent7#115;
	havoc lastPlayer_re_ent23#157;
	havoc jackpot_re_ent23#159;
	havoc counter_re_ent14#201;
	havoc lastPlayer_re_ent30#241;
	havoc jackpot_re_ent30#243;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#422[__this][__msg_sender])];
	}

	success#426 := __call_ret#13;
	if (success#426) {
	balances_re_ent8#422 := balances_re_ent8#422[__this := balances_re_ent8#422[__this][__msg_sender := 0]];
	}

	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 151, 5} {:message "ERC20Token::transfer"} transfer#496(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#454: address_t, _value#456: int)
	returns (success#460: bool)
{
	var sub#28_ret#15: int;
	var add#54_ret#16: int;
	var call_arg#17: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 152, 32} {:message ""} true;
	call sub#28_ret#15 := sub#28(__this, __msg_sender, __msg_value, balances#365[__this][__msg_sender], _value#456);
	balances#365 := balances#365[__this := balances#365[__this][__msg_sender := sub#28_ret#15]];
	assume {:sourceloc "buggy_32.sol", 153, 25} {:message ""} true;
	call add#54_ret#16 := add#54(__this, __msg_sender, __msg_value, balances#365[__this][_to#454], _value#456);
	balances#365 := balances#365[__this := balances#365[__this][_to#454 := add#54_ret#16]];
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 154, 14} {:message ""} true;
	call Transfer#788(__this, __msg_sender, __msg_value, call_arg#17, _to#454, _value#456);
	success#460 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 157, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#500: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_32.sol", 158, 1} {:message "ERC20Token::claimReward_re_ent39"} claimReward_re_ent39#536(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 161, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#513: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#500[__this][__msg_sender] > 0);
	transferValue_re_ent39#513 := redeemableEther_re_ent39#500[__this][__msg_sender];
	assume {:sourceloc "buggy_32.sol", 162, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#513);
	redeemableEther_re_ent39#500 := redeemableEther_re_ent39#500[__this := redeemableEther_re_ent39#500[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 172, 5} {:message "ERC20Token::transferFrom"} transferFrom#597(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#539: address_t, _to#541: address_t, _value#543: int)
	returns (success#547: bool)
{
	var sub#28_ret#18: int;
	var sub#28_ret#19: int;
	var add#54_ret#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 173, 38} {:message ""} true;
	call sub#28_ret#18 := sub#28(__this, __msg_sender, __msg_value, allowed#404[__this][_from#539][__msg_sender], _value#543);
	allowed#404 := allowed#404[__this := allowed#404[__this][_from#539 := allowed#404[__this][_from#539][__msg_sender := sub#28_ret#18]]];
	assume {:sourceloc "buggy_32.sol", 174, 27} {:message ""} true;
	call sub#28_ret#19 := sub#28(__this, __msg_sender, __msg_value, balances#365[__this][_from#539], _value#543);
	balances#365 := balances#365[__this := balances#365[__this][_from#539 := sub#28_ret#19]];
	assume {:sourceloc "buggy_32.sol", 175, 25} {:message ""} true;
	call add#54_ret#20 := add#54(__this, __msg_sender, __msg_value, balances#365[__this][_to#541], _value#543);
	balances#365 := balances#365[__this := balances#365[__this][_to#541 := add#54_ret#20]];
	assume {:sourceloc "buggy_32.sol", 176, 14} {:message ""} true;
	call Transfer#788(__this, __msg_sender, __msg_value, _from#539, _to#541, _value#543);
	success#547 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 179, 1} {:message "balances_re_ent36"} balances_re_ent36#601: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_32.sol", 180, 5} {:message "ERC20Token::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#624(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 181, 12} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, balances_re_ent36#601[__this][__msg_sender]);
	if (__send_ret#21) {
	balances_re_ent36#601 := balances_re_ent36#601[__this := balances_re_ent36#601[__this][__msg_sender := 0]];
	}

	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 190, 5} {:message "ERC20Token::approve"} approve#654(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#627: address_t, _value#629: int)
	returns (success#633: bool)
{
	var call_arg#22: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#404 := allowed#404[__this := allowed#404[__this][__msg_sender := allowed#404[__this][__msg_sender][_spender#627 := _value#629]]];
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 192, 14} {:message ""} true;
	call Approval#831(__this, __msg_sender, __msg_value, call_arg#22, _spender#627, _value#629);
	success#633 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_32.sol", 195, 1} {:message "counter_re_ent35"} counter_re_ent35#657: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_32.sol", 196, 1} {:message "ERC20Token::callme_re_ent35"} callme_re_ent35#686(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#657[__this] <= 5);
	call_arg#23 := 10000000000000000000;
	assume {:sourceloc "buggy_32.sol", 198, 9} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, call_arg#23);
	if (!(__send_ret#24)) {
	assume false;
	}

	counter_re_ent35#657 := counter_re_ent35#657[__this := (counter_re_ent35#657[__this] + 1)];
	$return17:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 209, 5} {:message "ERC20Token::allowance"} allowance#704(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#689: address_t, _spender#691: address_t)
	returns (remaining#695: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#695 := allowed#404[__this][_owner#689][_spender#691];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 212, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#708: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_32.sol", 213, 1} {:message "ERC20Token::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#742(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 216, 10} {:message "success"} success#712: bool;
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#708[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#708[__this][__msg_sender])];
	assume {:sourceloc "buggy_32.sol", 216, 25} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(__msg_sender, __this, userBalance_re_ent40#708[__this][__msg_sender]);
	if (__call_ret#25) {
	havoc lastPlayer_re_ent9#282;
	havoc jackpot_re_ent9#284;
	havoc totalSupply#321;
	havoc redeemableEther_re_ent25#325;
	havoc balances#365;
	havoc userBalance_re_ent19#369;
	havoc allowed#404;
	havoc balances_re_ent8#422;
	havoc redeemableEther_re_ent39#500;
	havoc balances_re_ent36#601;
	havoc counter_re_ent35#657;
	havoc userBalance_re_ent40#708;
	havoc balances_re_ent31#747;
	havoc not_called_re_ent13#791;
	havoc redeemableEther_re_ent4#67;
	havoc counter_re_ent7#115;
	havoc lastPlayer_re_ent23#157;
	havoc jackpot_re_ent23#159;
	havoc counter_re_ent14#201;
	havoc lastPlayer_re_ent30#241;
	havoc jackpot_re_ent30#243;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#708[__this][__msg_sender])];
	}

	success#712 := __call_ret#25;
	if (!(success#712)) {
	assume false;
	}

	userBalance_re_ent40#708 := userBalance_re_ent40#708[__this := userBalance_re_ent40#708[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 226, 3} {:message "balances_re_ent31"} balances_re_ent31#747: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 227, 1} {:message "ERC20Token::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#780(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#749: int)
{
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#747[__this][__msg_sender] >= _weiToWithdraw#749);
	assume {:sourceloc "buggy_32.sol", 230, 17} {:message ""} true;
	call __send_ret#27 := __send(__msg_sender, __this, 0, _weiToWithdraw#749);
	assume __send_ret#27;
	balances_re_ent31#747 := balances_re_ent31#747[__this := balances_re_ent31#747[__this][__msg_sender := (balances_re_ent31#747[__this][__msg_sender] - _weiToWithdraw#749)]];
	$return20:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_32.sol", 234, 3} {:message "not_called_re_ent13"} not_called_re_ent13#791: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_32.sol", 235, 1} {:message "ERC20Token::bug_re_ent13"} bug_re_ent13#823(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 237, 10} {:message "success"} success#799: bool;
	var __call_ret#28: bool;
	var __call_ret#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#791[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_32.sol", 237, 25} {:message ""} true;
	call __call_ret#28, __call_ret#29 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#28) {
	havoc lastPlayer_re_ent9#282;
	havoc jackpot_re_ent9#284;
	havoc totalSupply#321;
	havoc redeemableEther_re_ent25#325;
	havoc balances#365;
	havoc userBalance_re_ent19#369;
	havoc allowed#404;
	havoc balances_re_ent8#422;
	havoc redeemableEther_re_ent39#500;
	havoc balances_re_ent36#601;
	havoc counter_re_ent35#657;
	havoc userBalance_re_ent40#708;
	havoc balances_re_ent31#747;
	havoc not_called_re_ent13#791;
	havoc redeemableEther_re_ent4#67;
	havoc counter_re_ent7#115;
	havoc lastPlayer_re_ent23#157;
	havoc jackpot_re_ent23#159;
	havoc counter_re_ent14#201;
	havoc lastPlayer_re_ent30#241;
	havoc jackpot_re_ent30#243;
	havoc __balance;
	}

	if (!(__call_ret#28)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#799 := __call_ret#28;
	if (!(success#799)) {
	assume false;
	}

	not_called_re_ent13#791 := not_called_re_ent13#791[__this := false];
	$return21:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_32.sol", 100, 1} {:message "ERC20Token::[implicit_constructor]"} __constructor#832(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent9#282 := lastPlayer_re_ent9#282[__this := 0];
	jackpot_re_ent9#284 := jackpot_re_ent9#284[__this := 0];
	totalSupply#321 := totalSupply#321[__this := 0];
	redeemableEther_re_ent25#325 := redeemableEther_re_ent25#325[__this := default_address_t_int()];
	balances#365 := balances#365[__this := default_address_t_int()];
	userBalance_re_ent19#369 := userBalance_re_ent19#369[__this := default_address_t_int()];
	allowed#404 := allowed#404[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent8#422 := balances_re_ent8#422[__this := default_address_t_int()];
	redeemableEther_re_ent39#500 := redeemableEther_re_ent39#500[__this := default_address_t_int()];
	balances_re_ent36#601 := balances_re_ent36#601[__this := default_address_t_int()];
	counter_re_ent35#657 := counter_re_ent35#657[__this := 0];
	userBalance_re_ent40#708 := userBalance_re_ent40#708[__this := default_address_t_int()];
	balances_re_ent31#747 := balances_re_ent31#747[__this := default_address_t_int()];
	not_called_re_ent13#791 := not_called_re_ent13#791[__this := true];
	redeemableEther_re_ent4#67 := redeemableEther_re_ent4#67[__this := default_address_t_int()];
	counter_re_ent7#115 := counter_re_ent7#115[__this := 0];
	lastPlayer_re_ent23#157 := lastPlayer_re_ent23#157[__this := 0];
	jackpot_re_ent23#159 := jackpot_re_ent23#159[__this := 0];
	counter_re_ent14#201 := counter_re_ent14#201[__this := 0];
	lastPlayer_re_ent30#241 := lastPlayer_re_ent30#241[__this := 0];
	jackpot_re_ent30#243 := jackpot_re_ent30#243[__this := 0];
}

// 
// ------- Contract: AsseteGram -------
// Inherits from: ERC20Token
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 251, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#839: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_32.sol", 252, 1} {:message "AsseteGram::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#873(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 255, 10} {:message "success"} success#843: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#839[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#839[__this][__msg_sender])];
	assume {:sourceloc "buggy_32.sol", 255, 26} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(__msg_sender, __this, userBalance_re_ent26#839[__this][__msg_sender]);
	if (__call_ret#30) {
	havoc userBalance_re_ent26#839;
	havoc name#876;
	havoc not_called_re_ent20#879;
	havoc decimals#909;
	havoc redeemableEther_re_ent32#913;
	havoc symbol#952;
	havoc balances_re_ent38#956;
	havoc version#992;
	havoc userBalance_re_ent33#1027;
	havoc not_called_re_ent27#1072;
	havoc lastPlayer_re_ent9#282;
	havoc jackpot_re_ent9#284;
	havoc totalSupply#321;
	havoc redeemableEther_re_ent25#325;
	havoc balances#365;
	havoc userBalance_re_ent19#369;
	havoc allowed#404;
	havoc balances_re_ent8#422;
	havoc redeemableEther_re_ent39#500;
	havoc balances_re_ent36#601;
	havoc counter_re_ent35#657;
	havoc userBalance_re_ent40#708;
	havoc balances_re_ent31#747;
	havoc not_called_re_ent13#791;
	havoc redeemableEther_re_ent4#67;
	havoc counter_re_ent7#115;
	havoc lastPlayer_re_ent23#157;
	havoc jackpot_re_ent23#159;
	havoc counter_re_ent14#201;
	havoc lastPlayer_re_ent30#241;
	havoc jackpot_re_ent30#243;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#839[__this][__msg_sender])];
	}

	success#843 := __call_ret#30;
	if (!(success#843)) {
	assume false;
	}

	userBalance_re_ent26#839 := userBalance_re_ent26#839[__this := userBalance_re_ent26#839[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_32.sol", 261, 3} {:message "name"} name#876: [address_t]int_arr_type;
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_32.sol", 262, 3} {:message "not_called_re_ent20"} not_called_re_ent20#879: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_32.sol", 263, 1} {:message "AsseteGram::bug_re_ent20"} bug_re_ent20#906(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#879[__this];
	call_arg#32 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 265, 16} {:message ""} true;
	call __send_ret#33 := __send(__msg_sender, __this, 0, call_arg#32);
	if (!(__send_ret#33)) {
	assume false;
	}

	not_called_re_ent20#879 := not_called_re_ent20#879[__this := false];
	$return23:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_32.sol", 270, 3} {:message "decimals"} decimals#909: [address_t]int;
// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 271, 3} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#913: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_32.sol", 272, 1} {:message "AsseteGram::claimReward_re_ent32"} claimReward_re_ent32#949(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 275, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#926: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#913[__this][__msg_sender] > 0);
	transferValue_re_ent32#926 := redeemableEther_re_ent32#913[__this][__msg_sender];
	assume {:sourceloc "buggy_32.sol", 276, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#926);
	redeemableEther_re_ent32#913 := redeemableEther_re_ent32#913[__this := redeemableEther_re_ent32#913[__this][__msg_sender := 0]];
	$return24:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_32.sol", 279, 3} {:message "symbol"} symbol#952: [address_t]int_arr_type;
// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 280, 3} {:message "balances_re_ent38"} balances_re_ent38#956: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_32.sol", 281, 1} {:message "AsseteGram::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#989(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#958: int)
{
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#956[__this][__msg_sender] >= _weiToWithdraw#958);
	assume {:sourceloc "buggy_32.sol", 284, 17} {:message ""} true;
	call __send_ret#34 := __send(__msg_sender, __this, 0, _weiToWithdraw#958);
	assume __send_ret#34;
	balances_re_ent38#956 := balances_re_ent38#956[__this := balances_re_ent38#956[__this][__msg_sender := (balances_re_ent38#956[__this][__msg_sender] - _weiToWithdraw#958)]];
	$return25:
	// Function body ends here
}

// 
// State variable: version: string storage ref
var {:sourceloc "buggy_32.sol", 287, 3} {:message "version"} version#992: [address_t]int_arr_type;
const unique address_0xac775cD446889ac167da466692449ece5439fc12: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 289, 5} {:message "AsseteGram::[constructor]"} __constructor#1100(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 290, 9} {:message "initialOwner"} initialOwner#996: address_t;
	var call_arg#35: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent26#839 := userBalance_re_ent26#839[__this := default_address_t_int()];
	name#876 := name#876[__this := int_arr#constr(default_int_int()[0 := 69][1 := 108][2 := 101][3 := 99][4 := 116][5 := 114][6 := 111][7 := 110][8 := 105][9 := 99][10 := 32][11 := 71][12 := 114][13 := 97][14 := 109], 15)];
	not_called_re_ent20#879 := not_called_re_ent20#879[__this := true];
	decimals#909 := decimals#909[__this := 3];
	redeemableEther_re_ent32#913 := redeemableEther_re_ent32#913[__this := default_address_t_int()];
	symbol#952 := symbol#952[__this := int_arr#constr(default_int_int()[0 := 101][1 := 71][2 := 114][3 := 97][4 := 109], 5)];
	balances_re_ent38#956 := balances_re_ent38#956[__this := default_address_t_int()];
	version#992 := version#992[__this := int_arr#constr(default_int_int()[0 := 50], 1)];
	userBalance_re_ent33#1027 := userBalance_re_ent33#1027[__this := default_address_t_int()];
	not_called_re_ent27#1072 := not_called_re_ent27#1072[__this := true];
	lastPlayer_re_ent9#282 := lastPlayer_re_ent9#282[__this := 0];
	jackpot_re_ent9#284 := jackpot_re_ent9#284[__this := 0];
	totalSupply#321 := totalSupply#321[__this := 0];
	redeemableEther_re_ent25#325 := redeemableEther_re_ent25#325[__this := default_address_t_int()];
	balances#365 := balances#365[__this := default_address_t_int()];
	userBalance_re_ent19#369 := userBalance_re_ent19#369[__this := default_address_t_int()];
	allowed#404 := allowed#404[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent8#422 := balances_re_ent8#422[__this := default_address_t_int()];
	redeemableEther_re_ent39#500 := redeemableEther_re_ent39#500[__this := default_address_t_int()];
	balances_re_ent36#601 := balances_re_ent36#601[__this := default_address_t_int()];
	counter_re_ent35#657 := counter_re_ent35#657[__this := 0];
	userBalance_re_ent40#708 := userBalance_re_ent40#708[__this := default_address_t_int()];
	balances_re_ent31#747 := balances_re_ent31#747[__this := default_address_t_int()];
	not_called_re_ent13#791 := not_called_re_ent13#791[__this := true];
	redeemableEther_re_ent4#67 := redeemableEther_re_ent4#67[__this := default_address_t_int()];
	counter_re_ent7#115 := counter_re_ent7#115[__this := 0];
	lastPlayer_re_ent23#157 := lastPlayer_re_ent23#157[__this := 0];
	jackpot_re_ent23#159 := jackpot_re_ent23#159[__this := 0];
	counter_re_ent14#201 := counter_re_ent14#201[__this := 0];
	lastPlayer_re_ent30#241 := lastPlayer_re_ent30#241[__this := 0];
	jackpot_re_ent30#243 := jackpot_re_ent30#243[__this := 0];
	// Function body starts here
	initialOwner#996 := address_0xac775cD446889ac167da466692449ece5439fc12;
	totalSupply#321 := totalSupply#321[__this := 180000000000];
	balances#365 := balances#365[__this := balances#365[__this][initialOwner#996 := totalSupply#321[__this]]];
	call_arg#35 := 0;
	assume {:sourceloc "buggy_32.sol", 293, 14} {:message ""} true;
	call Transfer#788(__this, __msg_sender, __msg_value, call_arg#35, initialOwner#996, balances#365[__this][initialOwner#996]);
	$return26:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 295, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1027: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_32.sol", 296, 1} {:message "AsseteGram::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1061(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 299, 10} {:message "success"} success#1031: bool;
	var __call_ret#36: bool;
	var __call_ret#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1027[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1027[__this][__msg_sender])];
	assume {:sourceloc "buggy_32.sol", 299, 26} {:message ""} true;
	call __call_ret#36, __call_ret#37 := __call(__msg_sender, __this, userBalance_re_ent33#1027[__this][__msg_sender]);
	if (__call_ret#36) {
	havoc userBalance_re_ent26#839;
	havoc name#876;
	havoc not_called_re_ent20#879;
	havoc decimals#909;
	havoc redeemableEther_re_ent32#913;
	havoc symbol#952;
	havoc balances_re_ent38#956;
	havoc version#992;
	havoc userBalance_re_ent33#1027;
	havoc not_called_re_ent27#1072;
	havoc lastPlayer_re_ent9#282;
	havoc jackpot_re_ent9#284;
	havoc totalSupply#321;
	havoc redeemableEther_re_ent25#325;
	havoc balances#365;
	havoc userBalance_re_ent19#369;
	havoc allowed#404;
	havoc balances_re_ent8#422;
	havoc redeemableEther_re_ent39#500;
	havoc balances_re_ent36#601;
	havoc counter_re_ent35#657;
	havoc userBalance_re_ent40#708;
	havoc balances_re_ent31#747;
	havoc not_called_re_ent13#791;
	havoc redeemableEther_re_ent4#67;
	havoc counter_re_ent7#115;
	havoc lastPlayer_re_ent23#157;
	havoc jackpot_re_ent23#159;
	havoc counter_re_ent14#201;
	havoc lastPlayer_re_ent30#241;
	havoc jackpot_re_ent30#243;
	havoc __balance;
	}

	if (!(__call_ret#36)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1027[__this][__msg_sender])];
	}

	success#1031 := __call_ret#36;
	if (!(success#1031)) {
	assume false;
	}

	userBalance_re_ent33#1027 := userBalance_re_ent33#1027[__this := userBalance_re_ent33#1027[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 309, 5} {:message "AsseteGram::[fallback]"} #1069(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume false;
	$return28:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_32.sol", 312, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1072: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_32.sol", 313, 1} {:message "AsseteGram::bug_re_ent27"} bug_re_ent27#1099(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1072[__this];
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_32.sol", 315, 16} {:message ""} true;
	call __send_ret#39 := __send(__msg_sender, __this, 0, call_arg#38);
	if (!(__send_ret#39)) {
	assume false;
	}

	not_called_re_ent27#1072 := not_called_re_ent27#1072[__this := false];
	$return29:
	// Function body ends here
}

