// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_23.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_23.sol", 26, 5} {:message "[event] IERC20::Transfer"} Transfer#60(__this: address_t, __msg_sender: address_t, __msg_value: int, from#54: address_t, to#56: address_t, value#58: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_23.sol", 28, 5} {:message "[event] IERC20::Approval"} Approval#68(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#62: address_t, spender#64: address_t, value#66: int)
{
	
}

// 
// Function: transfer
procedure {:sourceloc "buggy_23.sol", 14, 5} {:message "IERC20::transfer"} transfer#11(__this: address_t, __msg_sender: address_t, __msg_value: int, to#4: address_t, value#6: int)
	returns (#9: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_23.sol", 16, 5} {:message "IERC20::approve"} approve#20(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#13: address_t, value#15: int)
	returns (#18: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_23.sol", 18, 5} {:message "IERC20::transferFrom"} transferFrom#31(__this: address_t, __msg_sender: address_t, __msg_value: int, from#22: address_t, to#24: address_t, value#26: int)
	returns (#29: bool);

// 
// Function: totalSupply
procedure {:sourceloc "buggy_23.sol", 20, 5} {:message "IERC20::totalSupply"} totalSupply#36(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#34: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_23.sol", 22, 5} {:message "IERC20::balanceOf"} balanceOf#43(__this: address_t, __msg_sender: address_t, __msg_value: int, who#38: address_t)
	returns (#41: int);

// 
// Function: allowance
procedure {:sourceloc "buggy_23.sol", 24, 5} {:message "IERC20::allowance"} allowance#52(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#45: address_t, spender#47: address_t)
	returns (#50: int);

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 13, 1} {:message "IERC20::[implicit_constructor]"} __constructor#69(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 43, 5} {:message "SafeMath::mul"} mul#104(__this: address_t, __msg_sender: address_t, __msg_value: int, a#73: int, b#75: int)
	returns (#78: int)
{
	var {:sourceloc "buggy_23.sol", 51, 9} {:message "c"} c#88: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#73 == 0)) {
	#78 := 0;
	goto $return0;
	}

	c#88 := (a#73 * b#75);
	assume ((c#88 div a#73) == b#75);
	#78 := c#88;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 60, 5} {:message "SafeMath::div"} div#129(__this: address_t, __msg_sender: address_t, __msg_value: int, a#107: int, b#109: int)
	returns (#112: int)
{
	var {:sourceloc "buggy_23.sol", 63, 9} {:message "c"} c#121: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#109 > 0);
	c#121 := (a#107 div b#109);
	#112 := c#121;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 72, 5} {:message "SafeMath::sub"} sub#154(__this: address_t, __msg_sender: address_t, __msg_value: int, a#132: int, b#134: int)
	returns (#137: int)
{
	var {:sourceloc "buggy_23.sol", 74, 9} {:message "c"} c#146: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#134 <= a#132);
	c#146 := (a#132 - b#134);
	#137 := c#146;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 82, 5} {:message "SafeMath::add"} add#179(__this: address_t, __msg_sender: address_t, __msg_value: int, a#157: int, b#159: int)
	returns (#162: int)
{
	var {:sourceloc "buggy_23.sol", 83, 9} {:message "c"} c#165: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#165 := (a#157 + b#159);
	assume (c#165 >= a#157);
	#162 := c#165;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 93, 5} {:message "SafeMath::mod"} mod#200(__this: address_t, __msg_sender: address_t, __msg_value: int, a#182: int, b#184: int)
	returns (#187: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#184 != 0);
	#187 := (a#182 mod b#184);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 39, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Using library SafeMath for uint256
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_23.sol", 120, 3} {:message "counter_re_ent42"} counter_re_ent42#210: [address_t]int;
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
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_23.sol", 121, 1} {:message "ERC20::callme_re_ent42"} callme_re_ent42#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#210[__this] <= 5);
	call_arg#0 := 10000000000000000000;
	assume {:sourceloc "buggy_23.sol", 123, 9} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	assume false;
	}

	counter_re_ent42#210 := counter_re_ent42#210[__this := (counter_re_ent42#210[__this] + 1)];
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 128, 3} {:message "_balances"} _balances#243: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_23.sol", 130, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#245: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_23.sol", 131, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#247: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_23.sol", 132, 4} {:message "ERC20::buyTicket_re_ent2"} buyTicket_re_ent2#277(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 133, 12} {:message ""} true;
	call __send_ret#2 := __send(lastPlayer_re_ent2#245[__this], __this, 0, jackpot_re_ent2#247[__this]);
	if (!(__send_ret#2)) {
	assume false;
	}

	lastPlayer_re_ent2#245 := lastPlayer_re_ent2#245[__this := __msg_sender];
	jackpot_re_ent2#247 := jackpot_re_ent2#247[__this := __balance[__this]];
	$return6:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_23.sol", 138, 3} {:message "_allowed"} _allowed#283: [address_t][address_t][address_t]int;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 140, 3} {:message "balances_re_ent17"} balances_re_ent17#287: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_23.sol", 141, 1} {:message "ERC20::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#326(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#289: int)
{
	var {:sourceloc "buggy_23.sol", 144, 6} {:message "success"} success#302: bool;
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#287[__this][__msg_sender] >= _weiToWithdraw#289);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#289);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#289)];
	assume {:sourceloc "buggy_23.sol", 144, 21} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(__msg_sender, __this, _weiToWithdraw#289);
	if (__call_ret#3) {
	havoc counter_re_ent42#210;
	havoc _balances#243;
	havoc lastPlayer_re_ent2#245;
	havoc jackpot_re_ent2#247;
	havoc _allowed#283;
	havoc balances_re_ent17#287;
	havoc _totalSupply#328;
	havoc redeemableEther_re_ent25#342;
	havoc userBalance_re_ent19#396;
	havoc userBalance_re_ent26#447;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#557;
	havoc balances_re_ent38#634;
	havoc redeemableEther_re_ent4#699;
	havoc counter_re_ent7#766;
	havoc lastPlayer_re_ent23#845;
	havoc jackpot_re_ent23#847;
	havoc counter_re_ent14#925;
	havoc lastPlayer_re_ent30#1001;
	havoc jackpot_re_ent30#1003;
	havoc balances_re_ent8#1080;
	havoc redeemableEther_re_ent39#1142;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#289)];
	}

	success#302 := __call_ret#3;
	assume success#302;
	balances_re_ent17#287 := balances_re_ent17#287[__this := balances_re_ent17#287[__this][__msg_sender := (balances_re_ent17#287[__this][__msg_sender] - _weiToWithdraw#289)]];
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_23.sol", 148, 3} {:message "_totalSupply"} _totalSupply#328: [address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 153, 5} {:message "ERC20::totalSupply"} totalSupply#338(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#333: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#333 := _totalSupply#328[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 156, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#342: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_23.sol", 157, 1} {:message "ERC20::claimReward_re_ent25"} claimReward_re_ent25#378(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 160, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#355: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#342[__this][__msg_sender] > 0);
	transferValue_re_ent25#355 := redeemableEther_re_ent25#342[__this][__msg_sender];
	assume {:sourceloc "buggy_23.sol", 161, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#355);
	redeemableEther_re_ent25#342 := redeemableEther_re_ent25#342[__this := redeemableEther_re_ent25#342[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 170, 5} {:message "ERC20::balanceOf"} balanceOf#392(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#381: address_t)
	returns (#385: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#385 := _balances#243[__this][owner#381];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 173, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#396: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_23.sol", 174, 1} {:message "ERC20::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#425(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 177, 16} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, userBalance_re_ent19#396[__this][__msg_sender]);
	if (!(__send_ret#5)) {
	assume false;
	}

	userBalance_re_ent19#396 := userBalance_re_ent19#396[__this := userBalance_re_ent19#396[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_23.sol", 189, 5} {:message "ERC20::allowance"} allowance#443(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#428: address_t, spender#430: address_t)
	returns (#434: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#434 := _allowed#283[__this][owner#428][spender#430];
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 192, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#447: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_23.sol", 193, 1} {:message "ERC20::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#481(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 196, 10} {:message "success"} success#451: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#447[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#447[__this][__msg_sender])];
	assume {:sourceloc "buggy_23.sol", 196, 26} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, userBalance_re_ent26#447[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc counter_re_ent42#210;
	havoc _balances#243;
	havoc lastPlayer_re_ent2#245;
	havoc jackpot_re_ent2#247;
	havoc _allowed#283;
	havoc balances_re_ent17#287;
	havoc _totalSupply#328;
	havoc redeemableEther_re_ent25#342;
	havoc userBalance_re_ent19#396;
	havoc userBalance_re_ent26#447;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#557;
	havoc balances_re_ent38#634;
	havoc redeemableEther_re_ent4#699;
	havoc counter_re_ent7#766;
	havoc lastPlayer_re_ent23#845;
	havoc jackpot_re_ent23#847;
	havoc counter_re_ent14#925;
	havoc lastPlayer_re_ent30#1001;
	havoc jackpot_re_ent30#1003;
	havoc balances_re_ent8#1080;
	havoc redeemableEther_re_ent39#1142;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#447[__this][__msg_sender])];
	}

	success#451 := __call_ret#6;
	if (!(success#451)) {
	assume false;
	}

	userBalance_re_ent26#447 := userBalance_re_ent26#447[__this := userBalance_re_ent26#447[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 208, 5} {:message "ERC20::transfer"} transfer#502(__this: address_t, __msg_sender: address_t, __msg_value: int, to#484: address_t, value#486: int)
	returns (#490: bool)
{
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 209, 9} {:message ""} true;
	call _transfer#843(__this, __msg_sender, __msg_value, call_arg#8, to#484, value#486);
	#490 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_23.sol", 212, 1} {:message "not_called_re_ent20"} not_called_re_ent20#505: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_23.sol", 213, 1} {:message "ERC20::bug_re_ent20"} bug_re_ent20#532(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#505[__this];
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 215, 16} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, call_arg#9);
	if (!(__send_ret#10)) {
	assume false;
	}

	not_called_re_ent20#505 := not_called_re_ent20#505[__this := false];
	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 230, 5} {:message "ERC20::approve"} approve#553(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#535: address_t, value#537: int)
	returns (#541: bool)
{
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 231, 9} {:message ""} true;
	call _approve#1076(__this, __msg_sender, __msg_value, call_arg#11, spender#535, value#537);
	#541 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 234, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#557: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_23.sol", 235, 1} {:message "ERC20::claimReward_re_ent32"} claimReward_re_ent32#593(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 238, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#570: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#557[__this][__msg_sender] > 0);
	transferValue_re_ent32#570 := redeemableEther_re_ent32#557[__this][__msg_sender];
	assume {:sourceloc "buggy_23.sol", 239, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#570);
	redeemableEther_re_ent32#557 := redeemableEther_re_ent32#557[__this := redeemableEther_re_ent32#557[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 251, 5} {:message "ERC20::transferFrom"} transferFrom#630(__this: address_t, __msg_sender: address_t, __msg_value: int, from#596: address_t, to#598: address_t, value#600: int)
	returns (#604: bool)
{
	var call_arg#12: address_t;
	var sub#154_ret#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 252, 9} {:message ""} true;
	call _transfer#843(__this, __msg_sender, __msg_value, from#596, to#598, value#600);
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 253, 36} {:message ""} true;
	call sub#154_ret#13 := sub#154(__this, __msg_sender, __msg_value, _allowed#283[__this][from#596][__msg_sender], value#600);
	assume {:sourceloc "buggy_23.sol", 253, 9} {:message ""} true;
	call _approve#1076(__this, __msg_sender, __msg_value, from#596, call_arg#12, sub#154_ret#13);
	#604 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 256, 1} {:message "balances_re_ent38"} balances_re_ent38#634: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 257, 1} {:message "ERC20::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#667(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#636: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#634[__this][__msg_sender] >= _weiToWithdraw#636);
	assume {:sourceloc "buggy_23.sol", 260, 13} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, _weiToWithdraw#636);
	assume __send_ret#14;
	balances_re_ent38#634 := balances_re_ent38#634[__this := balances_re_ent38#634[__this][__msg_sender := (balances_re_ent38#634[__this][__msg_sender] - _weiToWithdraw#636)]];
	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 274, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#695(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#670: address_t, addedValue#672: int)
	returns (#675: bool)
{
	var call_arg#15: address_t;
	var add#179_ret#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 275, 39} {:message ""} true;
	call add#179_ret#16 := add#179(__this, __msg_sender, __msg_value, _allowed#283[__this][__msg_sender][spender#670], addedValue#672);
	assume {:sourceloc "buggy_23.sol", 275, 9} {:message ""} true;
	call _approve#1076(__this, __msg_sender, __msg_value, call_arg#15, spender#670, add#179_ret#16);
	#675 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 278, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#699: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_23.sol", 279, 1} {:message "ERC20::claimReward_re_ent4"} claimReward_re_ent4#735(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 282, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#712: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#699[__this][__msg_sender] > 0);
	transferValue_re_ent4#712 := redeemableEther_re_ent4#699[__this][__msg_sender];
	assume {:sourceloc "buggy_23.sol", 283, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#712);
	redeemableEther_re_ent4#699 := redeemableEther_re_ent4#699[__this := redeemableEther_re_ent4#699[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_23.sol", 297, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#763(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#738: address_t, subtractedValue#740: int)
	returns (#743: bool)
{
	var call_arg#17: address_t;
	var sub#154_ret#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 298, 39} {:message ""} true;
	call sub#154_ret#18 := sub#154(__this, __msg_sender, __msg_value, _allowed#283[__this][__msg_sender][spender#738], subtractedValue#740);
	assume {:sourceloc "buggy_23.sol", 298, 9} {:message ""} true;
	call _approve#1076(__this, __msg_sender, __msg_value, call_arg#17, spender#738, sub#154_ret#18);
	#743 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_23.sol", 301, 1} {:message "counter_re_ent7"} counter_re_ent7#766: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_23.sol", 302, 1} {:message "ERC20::callme_re_ent7"} callme_re_ent7#795(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#766[__this] <= 5);
	call_arg#19 := 10000000000000000000;
	assume {:sourceloc "buggy_23.sol", 304, 9} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, call_arg#19);
	if (!(__send_ret#20)) {
	assume false;
	}

	counter_re_ent7#766 := counter_re_ent7#766[__this := (counter_re_ent7#766[__this] + 1)];
	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 316, 5} {:message "ERC20::_transfer"} _transfer#843(__this: address_t, __msg_sender: address_t, __msg_value: int, from#798: address_t, to#800: address_t, value#802: int)
{
	var sub#154_ret#21: int;
	var add#179_ret#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#800 != 0);
	assume {:sourceloc "buggy_23.sol", 319, 27} {:message ""} true;
	call sub#154_ret#21 := sub#154(__this, __msg_sender, __msg_value, _balances#243[__this][from#798], value#802);
	_balances#243 := _balances#243[__this := _balances#243[__this][from#798 := sub#154_ret#21]];
	assume {:sourceloc "buggy_23.sol", 320, 25} {:message ""} true;
	call add#179_ret#22 := add#179(__this, __msg_sender, __msg_value, _balances#243[__this][to#800], value#802);
	_balances#243 := _balances#243[__this := _balances#243[__this][to#800 := add#179_ret#22]];
	assume {:sourceloc "buggy_23.sol", 321, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, from#798, to#800, value#802);
	$return24:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_23.sol", 323, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#845: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_23.sol", 324, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#847: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_23.sol", 325, 4} {:message "ERC20::buyTicket_re_ent23"} buyTicket_re_ent23#877(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 326, 12} {:message ""} true;
	call __send_ret#23 := __send(lastPlayer_re_ent23#845[__this], __this, 0, jackpot_re_ent23#847[__this]);
	if (!(__send_ret#23)) {
	assume false;
	}

	lastPlayer_re_ent23#845 := lastPlayer_re_ent23#845[__this := __msg_sender];
	jackpot_re_ent23#847 := jackpot_re_ent23#847[__this := __balance[__this]];
	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 339, 5} {:message "ERC20::_mint"} _mint#922(__this: address_t, __msg_sender: address_t, __msg_value: int, account#880: address_t, value#882: int)
{
	var add#179_ret#24: int;
	var add#179_ret#25: int;
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#880 != 0);
	assume {:sourceloc "buggy_23.sol", 342, 24} {:message ""} true;
	call add#179_ret#24 := add#179(__this, __msg_sender, __msg_value, _totalSupply#328[__this], value#882);
	_totalSupply#328 := _totalSupply#328[__this := add#179_ret#24];
	assume {:sourceloc "buggy_23.sol", 343, 30} {:message ""} true;
	call add#179_ret#25 := add#179(__this, __msg_sender, __msg_value, _balances#243[__this][account#880], value#882);
	_balances#243 := _balances#243[__this := _balances#243[__this][account#880 := add#179_ret#25]];
	call_arg#26 := 0;
	assume {:sourceloc "buggy_23.sol", 344, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, call_arg#26, account#880, value#882);
	$return26:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_23.sol", 346, 1} {:message "counter_re_ent14"} counter_re_ent14#925: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_23.sol", 347, 1} {:message "ERC20::callme_re_ent14"} callme_re_ent14#954(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#925[__this] <= 5);
	call_arg#27 := 10000000000000000000;
	assume {:sourceloc "buggy_23.sol", 349, 9} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	assume false;
	}

	counter_re_ent14#925 := counter_re_ent14#925[__this := (counter_re_ent14#925[__this] + 1)];
	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 361, 5} {:message "ERC20::_burn"} _burn#999(__this: address_t, __msg_sender: address_t, __msg_value: int, account#957: address_t, value#959: int)
{
	var sub#154_ret#29: int;
	var sub#154_ret#30: int;
	var call_arg#31: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#957 != 0);
	assume {:sourceloc "buggy_23.sol", 364, 24} {:message ""} true;
	call sub#154_ret#29 := sub#154(__this, __msg_sender, __msg_value, _totalSupply#328[__this], value#959);
	_totalSupply#328 := _totalSupply#328[__this := sub#154_ret#29];
	assume {:sourceloc "buggy_23.sol", 365, 30} {:message ""} true;
	call sub#154_ret#30 := sub#154(__this, __msg_sender, __msg_value, _balances#243[__this][account#957], value#959);
	_balances#243 := _balances#243[__this := _balances#243[__this][account#957 := sub#154_ret#30]];
	call_arg#31 := 0;
	assume {:sourceloc "buggy_23.sol", 366, 14} {:message ""} true;
	call Transfer#60(__this, __msg_sender, __msg_value, account#957, call_arg#31, value#959);
	$return28:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_23.sol", 368, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1001: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_23.sol", 369, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1003: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_23.sol", 370, 4} {:message "ERC20::buyTicket_re_ent30"} buyTicket_re_ent30#1033(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 371, 12} {:message ""} true;
	call __send_ret#32 := __send(lastPlayer_re_ent30#1001[__this], __this, 0, jackpot_re_ent30#1003[__this]);
	if (!(__send_ret#32)) {
	assume false;
	}

	lastPlayer_re_ent30#1001 := lastPlayer_re_ent30#1001[__this := __msg_sender];
	jackpot_re_ent30#1003 := jackpot_re_ent30#1003[__this := __balance[__this]];
	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 383, 5} {:message "ERC20::_approve"} _approve#1076(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1036: address_t, spender#1038: address_t, value#1040: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#1038 != 0);
	assume (owner#1036 != 0);
	_allowed#283 := _allowed#283[__this := _allowed#283[__this][owner#1036 := _allowed#283[__this][owner#1036][spender#1038 := value#1040]]];
	assume {:sourceloc "buggy_23.sol", 388, 14} {:message ""} true;
	call Approval#68(__this, __msg_sender, __msg_value, owner#1036, spender#1038, value#1040);
	$return30:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 390, 1} {:message "balances_re_ent8"} balances_re_ent8#1080: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_23.sol", 391, 5} {:message "ERC20::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1109(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 392, 9} {:message "success"} success#1084: bool;
	var __call_ret#33: bool;
	var __call_ret#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1080[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1080[__this][__msg_sender])];
	assume {:sourceloc "buggy_23.sol", 392, 26} {:message ""} true;
	call __call_ret#33, __call_ret#34 := __call(__msg_sender, __this, balances_re_ent8#1080[__this][__msg_sender]);
	if (__call_ret#33) {
	havoc counter_re_ent42#210;
	havoc _balances#243;
	havoc lastPlayer_re_ent2#245;
	havoc jackpot_re_ent2#247;
	havoc _allowed#283;
	havoc balances_re_ent17#287;
	havoc _totalSupply#328;
	havoc redeemableEther_re_ent25#342;
	havoc userBalance_re_ent19#396;
	havoc userBalance_re_ent26#447;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#557;
	havoc balances_re_ent38#634;
	havoc redeemableEther_re_ent4#699;
	havoc counter_re_ent7#766;
	havoc lastPlayer_re_ent23#845;
	havoc jackpot_re_ent23#847;
	havoc counter_re_ent14#925;
	havoc lastPlayer_re_ent30#1001;
	havoc jackpot_re_ent30#1003;
	havoc balances_re_ent8#1080;
	havoc redeemableEther_re_ent39#1142;
	havoc __balance;
	}

	if (!(__call_ret#33)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1080[__this][__msg_sender])];
	}

	success#1084 := __call_ret#33;
	if (success#1084) {
	balances_re_ent8#1080 := balances_re_ent8#1080[__this := balances_re_ent8#1080[__this][__msg_sender := 0]];
	}

	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_23.sol", 405, 5} {:message "ERC20::_burnFrom"} _burnFrom#1138(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1112: address_t, value#1114: int)
{
	var call_arg#35: address_t;
	var sub#154_ret#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 406, 9} {:message ""} true;
	call _burn#999(__this, __msg_sender, __msg_value, account#1112, value#1114);
	call_arg#35 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 407, 39} {:message ""} true;
	call sub#154_ret#36 := sub#154(__this, __msg_sender, __msg_value, _allowed#283[__this][account#1112][__msg_sender], value#1114);
	assume {:sourceloc "buggy_23.sol", 407, 9} {:message ""} true;
	call _approve#1076(__this, __msg_sender, __msg_value, account#1112, call_arg#35, sub#154_ret#36);
	$return32:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 409, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1142: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_23.sol", 410, 1} {:message "ERC20::claimReward_re_ent39"} claimReward_re_ent39#1178(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 413, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1155: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1142[__this][__msg_sender] > 0);
	transferValue_re_ent39#1155 := redeemableEther_re_ent39#1142[__this][__msg_sender];
	assume {:sourceloc "buggy_23.sol", 414, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1155);
	redeemableEther_re_ent39#1142 := redeemableEther_re_ent39#1142[__this := redeemableEther_re_ent39#1142[__this][__msg_sender := 0]];
	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_23.sol", 117, 1} {:message "ERC20::[implicit_constructor]"} __constructor#1179(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	counter_re_ent42#210 := counter_re_ent42#210[__this := 0];
	_balances#243 := _balances#243[__this := default_address_t_int()];
	lastPlayer_re_ent2#245 := lastPlayer_re_ent2#245[__this := 0];
	jackpot_re_ent2#247 := jackpot_re_ent2#247[__this := 0];
	_allowed#283 := _allowed#283[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent17#287 := balances_re_ent17#287[__this := default_address_t_int()];
	_totalSupply#328 := _totalSupply#328[__this := 0];
	redeemableEther_re_ent25#342 := redeemableEther_re_ent25#342[__this := default_address_t_int()];
	userBalance_re_ent19#396 := userBalance_re_ent19#396[__this := default_address_t_int()];
	userBalance_re_ent26#447 := userBalance_re_ent26#447[__this := default_address_t_int()];
	not_called_re_ent20#505 := not_called_re_ent20#505[__this := true];
	redeemableEther_re_ent32#557 := redeemableEther_re_ent32#557[__this := default_address_t_int()];
	balances_re_ent38#634 := balances_re_ent38#634[__this := default_address_t_int()];
	redeemableEther_re_ent4#699 := redeemableEther_re_ent4#699[__this := default_address_t_int()];
	counter_re_ent7#766 := counter_re_ent7#766[__this := 0];
	lastPlayer_re_ent23#845 := lastPlayer_re_ent23#845[__this := 0];
	jackpot_re_ent23#847 := jackpot_re_ent23#847[__this := 0];
	counter_re_ent14#925 := counter_re_ent14#925[__this := 0];
	lastPlayer_re_ent30#1001 := lastPlayer_re_ent30#1001[__this := 0];
	jackpot_re_ent30#1003 := jackpot_re_ent30#1003[__this := 0];
	balances_re_ent8#1080 := balances_re_ent8#1080[__this := default_address_t_int()];
	redeemableEther_re_ent39#1142 := redeemableEther_re_ent39#1142[__this := default_address_t_int()];
}

// 
// ------- Contract: ERC20Burnable -------
// Inherits from: ERC20
// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_23.sol", 433, 5} {:message "ERC20Burnable::burn"} burn#1195(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1185: int)
{
	var call_arg#37: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#37 := __msg_sender;
	assume {:sourceloc "buggy_23.sol", 434, 9} {:message ""} true;
	call _burn#999(__this, __msg_sender, __msg_value, call_arg#37, value#1185);
	$return34:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 436, 1} {:message "balances_re_ent36"} balances_re_ent36#1199: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_23.sol", 437, 5} {:message "ERC20Burnable::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1222(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 438, 14} {:message ""} true;
	call __send_ret#38 := __send(__msg_sender, __this, 0, balances_re_ent36#1199[__this][__msg_sender]);
	if (__send_ret#38) {
	balances_re_ent36#1199 := balances_re_ent36#1199[__this := balances_re_ent36#1199[__this][__msg_sender := 0]];
	}

	$return35:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256)
procedure {:sourceloc "buggy_23.sol", 447, 5} {:message "ERC20Burnable::burnFrom"} burnFrom#1236(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1225: address_t, value#1227: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 448, 9} {:message ""} true;
	call _burnFrom#1138(__this, __msg_sender, __msg_value, from#1225, value#1227);
	$return36:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_23.sol", 450, 1} {:message "counter_re_ent35"} counter_re_ent35#1239: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_23.sol", 451, 1} {:message "ERC20Burnable::callme_re_ent35"} callme_re_ent35#1268(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1239[__this] <= 5);
	call_arg#39 := 10000000000000000000;
	assume {:sourceloc "buggy_23.sol", 453, 9} {:message ""} true;
	call __send_ret#40 := __send(__msg_sender, __this, 0, call_arg#39);
	if (!(__send_ret#40)) {
	assume false;
	}

	counter_re_ent35#1239 := counter_re_ent35#1239[__this := (counter_re_ent35#1239[__this] + 1)];
	$return37:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_23.sol", 428, 1} {:message "ERC20Burnable::[implicit_constructor]"} __constructor#1269(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	balances_re_ent36#1199 := balances_re_ent36#1199[__this := default_address_t_int()];
	counter_re_ent35#1239 := counter_re_ent35#1239[__this := 0];
	counter_re_ent42#210 := counter_re_ent42#210[__this := 0];
	_balances#243 := _balances#243[__this := default_address_t_int()];
	lastPlayer_re_ent2#245 := lastPlayer_re_ent2#245[__this := 0];
	jackpot_re_ent2#247 := jackpot_re_ent2#247[__this := 0];
	_allowed#283 := _allowed#283[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent17#287 := balances_re_ent17#287[__this := default_address_t_int()];
	_totalSupply#328 := _totalSupply#328[__this := 0];
	redeemableEther_re_ent25#342 := redeemableEther_re_ent25#342[__this := default_address_t_int()];
	userBalance_re_ent19#396 := userBalance_re_ent19#396[__this := default_address_t_int()];
	userBalance_re_ent26#447 := userBalance_re_ent26#447[__this := default_address_t_int()];
	not_called_re_ent20#505 := not_called_re_ent20#505[__this := true];
	redeemableEther_re_ent32#557 := redeemableEther_re_ent32#557[__this := default_address_t_int()];
	balances_re_ent38#634 := balances_re_ent38#634[__this := default_address_t_int()];
	redeemableEther_re_ent4#699 := redeemableEther_re_ent4#699[__this := default_address_t_int()];
	counter_re_ent7#766 := counter_re_ent7#766[__this := 0];
	lastPlayer_re_ent23#845 := lastPlayer_re_ent23#845[__this := 0];
	jackpot_re_ent23#847 := jackpot_re_ent23#847[__this := 0];
	counter_re_ent14#925 := counter_re_ent14#925[__this := 0];
	lastPlayer_re_ent30#1001 := lastPlayer_re_ent30#1001[__this := 0];
	jackpot_re_ent30#1003 := jackpot_re_ent30#1003[__this := 0];
	balances_re_ent8#1080 := balances_re_ent8#1080[__this := default_address_t_int()];
	redeemableEther_re_ent39#1142 := redeemableEther_re_ent39#1142[__this := default_address_t_int()];
}

// 
// ------- Contract: ERC20Detailed -------
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_23.sol", 472, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#1272: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_23.sol", 473, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#1274: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_23.sol", 474, 4} {:message "ERC20Detailed::buyTicket_re_ent37"} buyTicket_re_ent37#1304(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#41: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_23.sol", 475, 12} {:message ""} true;
	call __send_ret#41 := __send(lastPlayer_re_ent37#1272[__this], __this, 0, jackpot_re_ent37#1274[__this]);
	if (!(__send_ret#41)) {
	assume false;
	}

	lastPlayer_re_ent37#1272 := lastPlayer_re_ent37#1272[__this := __msg_sender];
	jackpot_re_ent37#1274 := jackpot_re_ent37#1274[__this := __balance[__this]];
	$return38:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_23.sol", 480, 3} {:message "_name"} _name#1306: [address_t]int_arr_type;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 481, 3} {:message "balances_re_ent3"} balances_re_ent3#1310: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 482, 1} {:message "ERC20Detailed::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#1349(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1312: int)
{
	var {:sourceloc "buggy_23.sol", 485, 3} {:message "success"} success#1325: bool;
	var __call_ret#42: bool;
	var __call_ret#43: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#1310[__this][__msg_sender] >= _weiToWithdraw#1312);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1312);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1312)];
	assume {:sourceloc "buggy_23.sol", 485, 19} {:message ""} true;
	call __call_ret#42, __call_ret#43 := __call(__msg_sender, __this, _weiToWithdraw#1312);
	if (__call_ret#42) {
	havoc lastPlayer_re_ent37#1272;
	havoc jackpot_re_ent37#1274;
	havoc _name#1306;
	havoc balances_re_ent3#1310;
	havoc _symbol#1351;
	havoc lastPlayer_re_ent9#1353;
	havoc jackpot_re_ent9#1355;
	havoc _decimals#1392;
	havoc userBalance_re_ent40#1418;
	havoc userBalance_re_ent33#1465;
	havoc not_called_re_ent27#1511;
	havoc balances_re_ent31#1551;
	havoc __balance;
	}

	if (!(__call_ret#42)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1312)];
	}

	success#1325 := __call_ret#42;
	assume success#1325;
	balances_re_ent3#1310 := balances_re_ent3#1310[__this := balances_re_ent3#1310[__this][__msg_sender := (balances_re_ent3#1310[__this][__msg_sender] - _weiToWithdraw#1312)]];
	$return39:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_23.sol", 489, 3} {:message "_symbol"} _symbol#1351: [address_t]int_arr_type;
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_23.sol", 490, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#1353: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_23.sol", 491, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#1355: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_23.sol", 492, 4} {:message "ERC20Detailed::buyTicket_re_ent9"} buyTicket_re_ent9#1390(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 493, 10} {:message "success"} success#1359: bool;
	var __call_ret#44: bool;
	var __call_ret#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#1355[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#1355[__this])];
	assume {:sourceloc "buggy_23.sol", 493, 27} {:message ""} true;
	call __call_ret#44, __call_ret#45 := __call(lastPlayer_re_ent9#1353[__this], __this, jackpot_re_ent9#1355[__this]);
	if (__call_ret#44) {
	havoc lastPlayer_re_ent37#1272;
	havoc jackpot_re_ent37#1274;
	havoc _name#1306;
	havoc balances_re_ent3#1310;
	havoc _symbol#1351;
	havoc lastPlayer_re_ent9#1353;
	havoc jackpot_re_ent9#1355;
	havoc _decimals#1392;
	havoc userBalance_re_ent40#1418;
	havoc userBalance_re_ent33#1465;
	havoc not_called_re_ent27#1511;
	havoc balances_re_ent31#1551;
	havoc __balance;
	}

	if (!(__call_ret#44)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#1355[__this])];
	}

	success#1359 := __call_ret#44;
	if (!(success#1359)) {
	assume false;
	}

	lastPlayer_re_ent9#1353 := lastPlayer_re_ent9#1353[__this := __msg_sender];
	jackpot_re_ent9#1355 := jackpot_re_ent9#1355[__this := __balance[__this]];
	$return40:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_23.sol", 499, 3} {:message "_decimals"} _decimals#1392: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_23.sol", 501, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1585(__this: address_t, __msg_sender: address_t, __msg_value: int, name#1394: int_arr_ptr, symbol#1396: int_arr_ptr, decimals#1398: int)
{
	// TCC assumptions
	assume (name#1394 < __alloc_counter);
	assume (symbol#1396 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#1272 := lastPlayer_re_ent37#1272[__this := 0];
	jackpot_re_ent37#1274 := jackpot_re_ent37#1274[__this := 0];
	_name#1306 := _name#1306[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent3#1310 := balances_re_ent3#1310[__this := default_address_t_int()];
	_symbol#1351 := _symbol#1351[__this := int_arr#constr(default_int_int(), 0)];
	lastPlayer_re_ent9#1353 := lastPlayer_re_ent9#1353[__this := 0];
	jackpot_re_ent9#1355 := jackpot_re_ent9#1355[__this := 0];
	_decimals#1392 := _decimals#1392[__this := 0];
	userBalance_re_ent40#1418 := userBalance_re_ent40#1418[__this := default_address_t_int()];
	userBalance_re_ent33#1465 := userBalance_re_ent33#1465[__this := default_address_t_int()];
	not_called_re_ent27#1511 := not_called_re_ent27#1511[__this := true];
	balances_re_ent31#1551 := balances_re_ent31#1551[__this := default_address_t_int()];
	// Function body starts here
	_name#1306 := _name#1306[__this := mem_arr_int[name#1394]];
	_symbol#1351 := _symbol#1351[__this := mem_arr_int[symbol#1396]];
	_decimals#1392 := _decimals#1392[__this := decimals#1398];
	$return41:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 506, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1418: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_23.sol", 507, 1} {:message "ERC20Detailed::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1452(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 510, 10} {:message "success"} success#1422: bool;
	var __call_ret#46: bool;
	var __call_ret#47: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1418[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1418[__this][__msg_sender])];
	assume {:sourceloc "buggy_23.sol", 510, 25} {:message ""} true;
	call __call_ret#46, __call_ret#47 := __call(__msg_sender, __this, userBalance_re_ent40#1418[__this][__msg_sender]);
	if (__call_ret#46) {
	havoc lastPlayer_re_ent37#1272;
	havoc jackpot_re_ent37#1274;
	havoc _name#1306;
	havoc balances_re_ent3#1310;
	havoc _symbol#1351;
	havoc lastPlayer_re_ent9#1353;
	havoc jackpot_re_ent9#1355;
	havoc _decimals#1392;
	havoc userBalance_re_ent40#1418;
	havoc userBalance_re_ent33#1465;
	havoc not_called_re_ent27#1511;
	havoc balances_re_ent31#1551;
	havoc __balance;
	}

	if (!(__call_ret#46)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1418[__this][__msg_sender])];
	}

	success#1422 := __call_ret#46;
	if (!(success#1422)) {
	assume false;
	}

	userBalance_re_ent40#1418 := userBalance_re_ent40#1418[__this := userBalance_re_ent40#1418[__this][__msg_sender := 0]];
	$return42:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 520, 5} {:message "ERC20Detailed::name"} name#1461(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1456: int_arr_ptr)
{
	var new_array#48: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#48 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1456 := new_array#48;
	mem_arr_int := mem_arr_int[#1456 := _name#1306[__this]];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 523, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1465: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_23.sol", 524, 1} {:message "ERC20Detailed::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1499(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 527, 10} {:message "success"} success#1469: bool;
	var __call_ret#49: bool;
	var __call_ret#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1465[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1465[__this][__msg_sender])];
	assume {:sourceloc "buggy_23.sol", 527, 26} {:message ""} true;
	call __call_ret#49, __call_ret#50 := __call(__msg_sender, __this, userBalance_re_ent33#1465[__this][__msg_sender]);
	if (__call_ret#49) {
	havoc lastPlayer_re_ent37#1272;
	havoc jackpot_re_ent37#1274;
	havoc _name#1306;
	havoc balances_re_ent3#1310;
	havoc _symbol#1351;
	havoc lastPlayer_re_ent9#1353;
	havoc jackpot_re_ent9#1355;
	havoc _decimals#1392;
	havoc userBalance_re_ent40#1418;
	havoc userBalance_re_ent33#1465;
	havoc not_called_re_ent27#1511;
	havoc balances_re_ent31#1551;
	havoc __balance;
	}

	if (!(__call_ret#49)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1465[__this][__msg_sender])];
	}

	success#1469 := __call_ret#49;
	if (!(success#1469)) {
	assume false;
	}

	userBalance_re_ent33#1465 := userBalance_re_ent33#1465[__this := userBalance_re_ent33#1465[__this][__msg_sender := 0]];
	$return44:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_23.sol", 537, 5} {:message "ERC20Detailed::symbol"} symbol#1508(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1503: int_arr_ptr)
{
	var new_array#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#51 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1503 := new_array#51;
	mem_arr_int := mem_arr_int[#1503 := _symbol#1351[__this]];
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_23.sol", 540, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1511: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_23.sol", 541, 1} {:message "ERC20Detailed::bug_re_ent27"} bug_re_ent27#1538(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#52: int;
	var __send_ret#53: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1511[__this];
	call_arg#52 := 1000000000000000000;
	assume {:sourceloc "buggy_23.sol", 543, 16} {:message ""} true;
	call __send_ret#53 := __send(__msg_sender, __this, 0, call_arg#52);
	if (!(__send_ret#53)) {
	assume false;
	}

	not_called_re_ent27#1511 := not_called_re_ent27#1511[__this := false];
	$return46:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_23.sol", 552, 5} {:message "ERC20Detailed::decimals"} decimals#1547(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1542: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1542 := _decimals#1392[__this];
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_23.sol", 555, 1} {:message "balances_re_ent31"} balances_re_ent31#1551: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_23.sol", 556, 1} {:message "ERC20Detailed::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1584(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1553: int)
{
	var __send_ret#54: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1551[__this][__msg_sender] >= _weiToWithdraw#1553);
	assume {:sourceloc "buggy_23.sol", 559, 13} {:message ""} true;
	call __send_ret#54 := __send(__msg_sender, __this, 0, _weiToWithdraw#1553);
	assume __send_ret#54;
	balances_re_ent31#1551 := balances_re_ent31#1551[__this := balances_re_ent31#1551[__this][__msg_sender := (balances_re_ent31#1551[__this][__msg_sender] - _weiToWithdraw#1553)]];
	$return48:
	// Function body ends here
}

// 
// ------- Contract: AGR -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// Inherits from: ERC20Burnable
// 
// Function: 
procedure {:sourceloc "buggy_23.sol", 572, 5} {:message "AGR::[constructor]"} __constructor#1650(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1593: int_arr_ptr, _symbol#1595: int_arr_ptr, _decimals#1597: int)
{
	var name#1394#55: int_arr_ptr;
	var symbol#1396#55: int_arr_ptr;
	var decimals#1398#55: int;
	var call_arg#57: address_t;
	var call_arg#58: int;
	// TCC assumptions
	assume (_name#1593 < __alloc_counter);
	assume (_symbol#1595 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent13#1617 := not_called_re_ent13#1617[__this := true];
	balances_re_ent36#1199 := balances_re_ent36#1199[__this := default_address_t_int()];
	counter_re_ent35#1239 := counter_re_ent35#1239[__this := 0];
	lastPlayer_re_ent37#1272 := lastPlayer_re_ent37#1272[__this := 0];
	jackpot_re_ent37#1274 := jackpot_re_ent37#1274[__this := 0];
	_name#1306 := _name#1306[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent3#1310 := balances_re_ent3#1310[__this := default_address_t_int()];
	_symbol#1351 := _symbol#1351[__this := int_arr#constr(default_int_int(), 0)];
	lastPlayer_re_ent9#1353 := lastPlayer_re_ent9#1353[__this := 0];
	jackpot_re_ent9#1355 := jackpot_re_ent9#1355[__this := 0];
	_decimals#1392 := _decimals#1392[__this := 0];
	userBalance_re_ent40#1418 := userBalance_re_ent40#1418[__this := default_address_t_int()];
	userBalance_re_ent33#1465 := userBalance_re_ent33#1465[__this := default_address_t_int()];
	not_called_re_ent27#1511 := not_called_re_ent27#1511[__this := true];
	balances_re_ent31#1551 := balances_re_ent31#1551[__this := default_address_t_int()];
	counter_re_ent42#210 := counter_re_ent42#210[__this := 0];
	_balances#243 := _balances#243[__this := default_address_t_int()];
	lastPlayer_re_ent2#245 := lastPlayer_re_ent2#245[__this := 0];
	jackpot_re_ent2#247 := jackpot_re_ent2#247[__this := 0];
	_allowed#283 := _allowed#283[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent17#287 := balances_re_ent17#287[__this := default_address_t_int()];
	_totalSupply#328 := _totalSupply#328[__this := 0];
	redeemableEther_re_ent25#342 := redeemableEther_re_ent25#342[__this := default_address_t_int()];
	userBalance_re_ent19#396 := userBalance_re_ent19#396[__this := default_address_t_int()];
	userBalance_re_ent26#447 := userBalance_re_ent26#447[__this := default_address_t_int()];
	not_called_re_ent20#505 := not_called_re_ent20#505[__this := true];
	redeemableEther_re_ent32#557 := redeemableEther_re_ent32#557[__this := default_address_t_int()];
	balances_re_ent38#634 := balances_re_ent38#634[__this := default_address_t_int()];
	redeemableEther_re_ent4#699 := redeemableEther_re_ent4#699[__this := default_address_t_int()];
	counter_re_ent7#766 := counter_re_ent7#766[__this := 0];
	lastPlayer_re_ent23#845 := lastPlayer_re_ent23#845[__this := 0];
	jackpot_re_ent23#847 := jackpot_re_ent23#847[__this := 0];
	counter_re_ent14#925 := counter_re_ent14#925[__this := 0];
	lastPlayer_re_ent30#1001 := lastPlayer_re_ent30#1001[__this := 0];
	jackpot_re_ent30#1003 := jackpot_re_ent30#1003[__this := 0];
	balances_re_ent8#1080 := balances_re_ent8#1080[__this := default_address_t_int()];
	redeemableEther_re_ent39#1142 := redeemableEther_re_ent39#1142[__this := default_address_t_int()];
	// Arguments for ERC20Detailed
	name#1394#55 := _name#1593;
	symbol#1396#55 := _symbol#1595;
	decimals#1398#55 := _decimals#1597;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#1306 := _name#1306[__this := mem_arr_int[name#1394#55]];
	_symbol#1351 := _symbol#1351[__this := mem_arr_int[symbol#1396#55]];
	_decimals#1392 := _decimals#1392[__this := decimals#1398#55];
	$return49:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#57 := __msg_sender;
	call_arg#58 := 30000000000000;
	assume {:sourceloc "buggy_23.sol", 573, 9} {:message ""} true;
	call _mint#922(__this, __msg_sender, __msg_value, call_arg#57, call_arg#58);
	$return50:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_23.sol", 575, 1} {:message "not_called_re_ent13"} not_called_re_ent13#1617: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_23.sol", 576, 1} {:message "AGR::bug_re_ent13"} bug_re_ent13#1649(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_23.sol", 578, 3} {:message "success"} success#1625: bool;
	var __call_ret#59: bool;
	var __call_ret#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1617[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_23.sol", 578, 18} {:message ""} true;
	call __call_ret#59, __call_ret#60 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#59) {
	havoc not_called_re_ent13#1617;
	havoc balances_re_ent36#1199;
	havoc counter_re_ent35#1239;
	havoc lastPlayer_re_ent37#1272;
	havoc jackpot_re_ent37#1274;
	havoc _name#1306;
	havoc balances_re_ent3#1310;
	havoc _symbol#1351;
	havoc lastPlayer_re_ent9#1353;
	havoc jackpot_re_ent9#1355;
	havoc _decimals#1392;
	havoc userBalance_re_ent40#1418;
	havoc userBalance_re_ent33#1465;
	havoc not_called_re_ent27#1511;
	havoc balances_re_ent31#1551;
	havoc counter_re_ent42#210;
	havoc _balances#243;
	havoc lastPlayer_re_ent2#245;
	havoc jackpot_re_ent2#247;
	havoc _allowed#283;
	havoc balances_re_ent17#287;
	havoc _totalSupply#328;
	havoc redeemableEther_re_ent25#342;
	havoc userBalance_re_ent19#396;
	havoc userBalance_re_ent26#447;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#557;
	havoc balances_re_ent38#634;
	havoc redeemableEther_re_ent4#699;
	havoc counter_re_ent7#766;
	havoc lastPlayer_re_ent23#845;
	havoc jackpot_re_ent23#847;
	havoc counter_re_ent14#925;
	havoc lastPlayer_re_ent30#1001;
	havoc jackpot_re_ent30#1003;
	havoc balances_re_ent8#1080;
	havoc redeemableEther_re_ent39#1142;
	havoc __balance;
	}

	if (!(__call_ret#59)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1625 := __call_ret#59;
	if (!(success#1625)) {
	assume false;
	}

	not_called_re_ent13#1617 := not_called_re_ent13#1617[__this := false];
	$return51:
	// Function body ends here
}

