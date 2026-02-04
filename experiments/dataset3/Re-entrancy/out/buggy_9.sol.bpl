// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_9.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 16, 3} {:message "SafeMath::mul"} mul#36(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (c#10: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#5 == 0)) {
	c#10 := 0;
	goto $return0;
	}

	c#10 := (a#5 * b#7);
	assert {:sourceloc "buggy_9.sol", 21, 5} {:message "Assertion might not hold."} ((c#10 div a#5) == b#7);
	c#10 := c#10;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 28, 3} {:message "SafeMath::div"} div#51(__this: address_t, __msg_sender: address_t, __msg_value: int, a#39: int, b#41: int)
	returns (#44: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#44 := (a#39 div b#41);
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 38, 3} {:message "SafeMath::sub"} sub#72(__this: address_t, __msg_sender: address_t, __msg_value: int, a#54: int, b#56: int)
	returns (#59: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_9.sol", 39, 5} {:message "Assertion might not hold."} (b#56 <= a#54);
	#59 := (a#54 - b#56);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 46, 3} {:message "SafeMath::add"} add#97(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
	returns (c#80: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#80 := (a#75 + b#77);
	assert {:sourceloc "buggy_9.sol", 48, 5} {:message "Assertion might not hold."} (c#80 >= a#75);
	c#80 := c#80;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_9.sol", 11, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#98(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Ownable -------
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 55, 3} {:message "balances_re_ent17"} balances_re_ent17#102: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_9.sol", 56, 1} {:message "Ownable::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#141(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#104: int)
{
	var {:sourceloc "buggy_9.sol", 59, 10} {:message "success"} success#117: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#102[__this][__msg_sender] >= _weiToWithdraw#104);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#104);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#104)];
	assume {:sourceloc "buggy_9.sol", 59, 25} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, _weiToWithdraw#104);
	if (__call_ret#0) {
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#104)];
	}

	success#117 := __call_ret#0;
	assume success#117;
	balances_re_ent17#102 := balances_re_ent17#102[__this := balances_re_ent17#102[__this][__msg_sender := (balances_re_ent17#102[__this][__msg_sender] - _weiToWithdraw#104)]];
	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_9.sol", 63, 3} {:message "owner"} owner#143: [address_t]address_t;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 65, 5} {:message "Ownable::[constructor]"} __constructor#204(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent17#102 := balances_re_ent17#102[__this := default_address_t_int()];
	owner#143 := owner#143[__this := 0];
	redeemableEther_re_ent32#156 := redeemableEther_re_ent32#156[__this := default_address_t_int()];
	// Function body starts here
	owner#143 := owner#143[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 68, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#156: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_9.sol", 69, 1} {:message "Ownable::claimReward_re_ent32"} claimReward_re_ent32#192(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 72, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#169: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#156[__this][__msg_sender] > 0);
	transferValue_re_ent32#169 := redeemableEther_re_ent32#156[__this][__msg_sender];
	assume {:sourceloc "buggy_9.sol", 73, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#169);
	redeemableEther_re_ent32#156 := redeemableEther_re_ent32#156[__this := redeemableEther_re_ent32#156[__this][__msg_sender := 0]];
	$return6:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_9.sol", 167, 3} {:message "[event] TokenERC20::Transfer"} Transfer#527(__this: address_t, __msg_sender: address_t, __msg_value: int, from#521: address_t, to#523: address_t, value#525: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_9.sol", 177, 3} {:message "[event] TokenERC20::Approval"} Approval#572(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#566: address_t, spender#568: address_t, value#570: int)
{
	
}

// 
// Event: Mint
procedure {:inline 1} {:sourceloc "buggy_9.sol", 189, 3} {:message "[event] TokenERC20::Mint"} Mint#613(__this: address_t, __msg_sender: address_t, __msg_value: int, to#609: address_t, amount#611: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_9.sol", 87, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#211: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_9.sol", 88, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#213: [address_t]int;
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
procedure {:sourceloc "buggy_9.sol", 89, 4} {:message "TokenERC20::buyTicket_re_ent37"} buyTicket_re_ent37#243(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 90, 12} {:message ""} true;
	call __send_ret#2 := __send(lastPlayer_re_ent37#211[__this], __this, 0, jackpot_re_ent37#213[__this]);
	if (!(__send_ret#2)) {
	assume false;
	}

	lastPlayer_re_ent37#211 := lastPlayer_re_ent37#211[__this := __msg_sender];
	jackpot_re_ent37#213 := jackpot_re_ent37#213[__this := __balance[__this]];
	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_9.sol", 95, 3} {:message "name"} name#245: [address_t]int_arr_type;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 96, 3} {:message "balances_re_ent3"} balances_re_ent3#249: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 97, 1} {:message "TokenERC20::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#288(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#251: int)
{
	var {:sourceloc "buggy_9.sol", 100, 3} {:message "success"} success#264: bool;
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#249[__this][__msg_sender] >= _weiToWithdraw#251);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#251);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#251)];
	assume {:sourceloc "buggy_9.sol", 100, 19} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(__msg_sender, __this, _weiToWithdraw#251);
	if (__call_ret#3) {
	havoc lastPlayer_re_ent37#211;
	havoc jackpot_re_ent37#213;
	havoc name#245;
	havoc balances_re_ent3#249;
	havoc symbol#290;
	havoc lastPlayer_re_ent9#292;
	havoc jackpot_re_ent9#294;
	havoc decimals#334;
	havoc redeemableEther_re_ent25#338;
	havoc _totalSupply#376;
	havoc userBalance_re_ent19#380;
	havoc cap#411;
	havoc userBalance_re_ent26#415;
	havoc _balances#453;
	havoc not_called_re_ent20#456;
	havoc _allowed#489;
	havoc not_called_re_ent27#492;
	havoc balances_re_ent31#531;
	havoc not_called_re_ent13#575;
	havoc balances_re_ent38#690;
	havoc redeemableEther_re_ent4#736;
	havoc counter_re_ent7#788;
	havoc lastPlayer_re_ent23#836;
	havoc jackpot_re_ent23#838;
	havoc counter_re_ent14#891;
	havoc lastPlayer_re_ent30#942;
	havoc jackpot_re_ent30#944;
	havoc balances_re_ent8#1014;
	havoc redeemableEther_re_ent39#1096;
	havoc balances_re_ent36#1181;
	havoc counter_re_ent35#1263;
	havoc userBalance_re_ent40#1341;
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#251)];
	}

	success#264 := __call_ret#3;
	assume success#264;
	balances_re_ent3#249 := balances_re_ent3#249[__this := balances_re_ent3#249[__this][__msg_sender := (balances_re_ent3#249[__this][__msg_sender] - _weiToWithdraw#251)]];
	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_9.sol", 104, 3} {:message "symbol"} symbol#290: [address_t]int_arr_type;
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_9.sol", 105, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#292: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_9.sol", 106, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#294: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_9.sol", 107, 4} {:message "TokenERC20::buyTicket_re_ent9"} buyTicket_re_ent9#332(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 108, 7} {:message "success"} success#298: bool;
	var __call_ret#5: bool;
	var __call_ret#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#294[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#294[__this])];
	assume {:sourceloc "buggy_9.sol", 108, 24} {:message ""} true;
	call __call_ret#5, __call_ret#6 := __call(lastPlayer_re_ent9#292[__this], __this, jackpot_re_ent9#294[__this]);
	if (__call_ret#5) {
	havoc lastPlayer_re_ent37#211;
	havoc jackpot_re_ent37#213;
	havoc name#245;
	havoc balances_re_ent3#249;
	havoc symbol#290;
	havoc lastPlayer_re_ent9#292;
	havoc jackpot_re_ent9#294;
	havoc decimals#334;
	havoc redeemableEther_re_ent25#338;
	havoc _totalSupply#376;
	havoc userBalance_re_ent19#380;
	havoc cap#411;
	havoc userBalance_re_ent26#415;
	havoc _balances#453;
	havoc not_called_re_ent20#456;
	havoc _allowed#489;
	havoc not_called_re_ent27#492;
	havoc balances_re_ent31#531;
	havoc not_called_re_ent13#575;
	havoc balances_re_ent38#690;
	havoc redeemableEther_re_ent4#736;
	havoc counter_re_ent7#788;
	havoc lastPlayer_re_ent23#836;
	havoc jackpot_re_ent23#838;
	havoc counter_re_ent14#891;
	havoc lastPlayer_re_ent30#942;
	havoc jackpot_re_ent30#944;
	havoc balances_re_ent8#1014;
	havoc redeemableEther_re_ent39#1096;
	havoc balances_re_ent36#1181;
	havoc counter_re_ent35#1263;
	havoc userBalance_re_ent40#1341;
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#5)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#294[__this])];
	}

	success#298 := __call_ret#5;
	if (!(success#298)) {
	assume false;
	}

	lastPlayer_re_ent9#292 := lastPlayer_re_ent9#292[__this := __msg_sender];
	jackpot_re_ent9#294 := jackpot_re_ent9#294[__this := __balance[__this]];
	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_9.sol", 114, 3} {:message "decimals"} decimals#334: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 116, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#338: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_9.sol", 117, 1} {:message "TokenERC20::claimReward_re_ent25"} claimReward_re_ent25#374(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 120, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#351: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#338[__this][__msg_sender] > 0);
	transferValue_re_ent25#351 := redeemableEther_re_ent25#338[__this][__msg_sender];
	assume {:sourceloc "buggy_9.sol", 121, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#351);
	redeemableEther_re_ent25#338 := redeemableEther_re_ent25#338[__this := redeemableEther_re_ent25#338[__this][__msg_sender := 0]];
	$return10:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_9.sol", 124, 3} {:message "_totalSupply"} _totalSupply#376: [address_t]int;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 125, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#380: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_9.sol", 126, 1} {:message "TokenERC20::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#409(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 129, 16} {:message ""} true;
	call __send_ret#7 := __send(__msg_sender, __this, 0, userBalance_re_ent19#380[__this][__msg_sender]);
	if (!(__send_ret#7)) {
	assume false;
	}

	userBalance_re_ent19#380 := userBalance_re_ent19#380[__this := userBalance_re_ent19#380[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// State variable: cap: uint256
var {:sourceloc "buggy_9.sol", 134, 3} {:message "cap"} cap#411: [address_t]int;
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 137, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#415: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_9.sol", 138, 1} {:message "TokenERC20::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#449(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 141, 10} {:message "success"} success#419: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#415[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#415[__this][__msg_sender])];
	assume {:sourceloc "buggy_9.sol", 141, 26} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, userBalance_re_ent26#415[__this][__msg_sender]);
	if (__call_ret#8) {
	havoc lastPlayer_re_ent37#211;
	havoc jackpot_re_ent37#213;
	havoc name#245;
	havoc balances_re_ent3#249;
	havoc symbol#290;
	havoc lastPlayer_re_ent9#292;
	havoc jackpot_re_ent9#294;
	havoc decimals#334;
	havoc redeemableEther_re_ent25#338;
	havoc _totalSupply#376;
	havoc userBalance_re_ent19#380;
	havoc cap#411;
	havoc userBalance_re_ent26#415;
	havoc _balances#453;
	havoc not_called_re_ent20#456;
	havoc _allowed#489;
	havoc not_called_re_ent27#492;
	havoc balances_re_ent31#531;
	havoc not_called_re_ent13#575;
	havoc balances_re_ent38#690;
	havoc redeemableEther_re_ent4#736;
	havoc counter_re_ent7#788;
	havoc lastPlayer_re_ent23#836;
	havoc jackpot_re_ent23#838;
	havoc counter_re_ent14#891;
	havoc lastPlayer_re_ent30#942;
	havoc jackpot_re_ent30#944;
	havoc balances_re_ent8#1014;
	havoc redeemableEther_re_ent39#1096;
	havoc balances_re_ent36#1181;
	havoc counter_re_ent35#1263;
	havoc userBalance_re_ent40#1341;
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#415[__this][__msg_sender])];
	}

	success#419 := __call_ret#8;
	if (!(success#419)) {
	assume false;
	}

	userBalance_re_ent26#415 := userBalance_re_ent26#415[__this := userBalance_re_ent26#415[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 147, 3} {:message "_balances"} _balances#453: [address_t][address_t]int;
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_9.sol", 148, 3} {:message "not_called_re_ent20"} not_called_re_ent20#456: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_9.sol", 149, 1} {:message "TokenERC20::bug_re_ent20"} bug_re_ent20#483(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#456[__this];
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 151, 16} {:message ""} true;
	call __send_ret#11 := __send(__msg_sender, __this, 0, call_arg#10);
	if (!(__send_ret#11)) {
	assume false;
	}

	not_called_re_ent20#456 := not_called_re_ent20#456[__this := false];
	$return13:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_9.sol", 156, 3} {:message "_allowed"} _allowed#489: [address_t][address_t][address_t]int;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_9.sol", 159, 3} {:message "not_called_re_ent27"} not_called_re_ent27#492: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_9.sol", 160, 1} {:message "TokenERC20::bug_re_ent27"} bug_re_ent27#519(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#492[__this];
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_9.sol", 162, 12} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, call_arg#12);
	if (!(__send_ret#13)) {
	assume false;
	}

	not_called_re_ent27#492 := not_called_re_ent27#492[__this := false];
	$return14:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 170, 3} {:message "balances_re_ent31"} balances_re_ent31#531: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 171, 1} {:message "TokenERC20::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#564(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#533: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#531[__this][__msg_sender] >= _weiToWithdraw#533);
	assume {:sourceloc "buggy_9.sol", 174, 11} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, _weiToWithdraw#533);
	assume __send_ret#14;
	balances_re_ent31#531 := balances_re_ent31#531[__this := balances_re_ent31#531[__this][__msg_sender := (balances_re_ent31#531[__this][__msg_sender] - _weiToWithdraw#533)]];
	$return15:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_9.sol", 180, 3} {:message "not_called_re_ent13"} not_called_re_ent13#575: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_9.sol", 181, 1} {:message "TokenERC20::bug_re_ent13"} bug_re_ent13#607(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 183, 6} {:message "success"} success#583: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#575[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_9.sol", 183, 21} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#15) {
	havoc lastPlayer_re_ent37#211;
	havoc jackpot_re_ent37#213;
	havoc name#245;
	havoc balances_re_ent3#249;
	havoc symbol#290;
	havoc lastPlayer_re_ent9#292;
	havoc jackpot_re_ent9#294;
	havoc decimals#334;
	havoc redeemableEther_re_ent25#338;
	havoc _totalSupply#376;
	havoc userBalance_re_ent19#380;
	havoc cap#411;
	havoc userBalance_re_ent26#415;
	havoc _balances#453;
	havoc not_called_re_ent20#456;
	havoc _allowed#489;
	havoc not_called_re_ent27#492;
	havoc balances_re_ent31#531;
	havoc not_called_re_ent13#575;
	havoc balances_re_ent38#690;
	havoc redeemableEther_re_ent4#736;
	havoc counter_re_ent7#788;
	havoc lastPlayer_re_ent23#836;
	havoc jackpot_re_ent23#838;
	havoc counter_re_ent14#891;
	havoc lastPlayer_re_ent30#942;
	havoc jackpot_re_ent30#944;
	havoc balances_re_ent8#1014;
	havoc redeemableEther_re_ent39#1096;
	havoc balances_re_ent36#1181;
	havoc counter_re_ent35#1263;
	havoc userBalance_re_ent40#1341;
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#15)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#583 := __call_ret#15;
	if (!(success#583)) {
	assume false;
	}

	not_called_re_ent13#575 := not_called_re_ent13#575[__this := false];
	$return16:
	// Function body ends here
}

function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 204, 5} {:message "TokenERC20::[constructor]"} __constructor#1376(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#633: int, _initialSupply#635: int, _name#637: int_arr_ptr, _symbol#639: int_arr_ptr, _decimals#641: int)
{
	var call_arg#18: address_t;
	// TCC assumptions
	assume (_name#637 < __alloc_counter);
	assume (_symbol#639 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#211 := lastPlayer_re_ent37#211[__this := 0];
	jackpot_re_ent37#213 := jackpot_re_ent37#213[__this := 0];
	name#245 := name#245[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent3#249 := balances_re_ent3#249[__this := default_address_t_int()];
	symbol#290 := symbol#290[__this := int_arr#constr(default_int_int(), 0)];
	lastPlayer_re_ent9#292 := lastPlayer_re_ent9#292[__this := 0];
	jackpot_re_ent9#294 := jackpot_re_ent9#294[__this := 0];
	decimals#334 := decimals#334[__this := 0];
	redeemableEther_re_ent25#338 := redeemableEther_re_ent25#338[__this := default_address_t_int()];
	_totalSupply#376 := _totalSupply#376[__this := 0];
	userBalance_re_ent19#380 := userBalance_re_ent19#380[__this := default_address_t_int()];
	cap#411 := cap#411[__this := 0];
	userBalance_re_ent26#415 := userBalance_re_ent26#415[__this := default_address_t_int()];
	_balances#453 := _balances#453[__this := default_address_t_int()];
	not_called_re_ent20#456 := not_called_re_ent20#456[__this := true];
	_allowed#489 := _allowed#489[__this := default_address_t__k_address_t_v_int()];
	not_called_re_ent27#492 := not_called_re_ent27#492[__this := true];
	balances_re_ent31#531 := balances_re_ent31#531[__this := default_address_t_int()];
	not_called_re_ent13#575 := not_called_re_ent13#575[__this := true];
	balances_re_ent38#690 := balances_re_ent38#690[__this := default_address_t_int()];
	redeemableEther_re_ent4#736 := redeemableEther_re_ent4#736[__this := default_address_t_int()];
	counter_re_ent7#788 := counter_re_ent7#788[__this := 0];
	lastPlayer_re_ent23#836 := lastPlayer_re_ent23#836[__this := 0];
	jackpot_re_ent23#838 := jackpot_re_ent23#838[__this := 0];
	counter_re_ent14#891 := counter_re_ent14#891[__this := 0];
	lastPlayer_re_ent30#942 := lastPlayer_re_ent30#942[__this := 0];
	jackpot_re_ent30#944 := jackpot_re_ent30#944[__this := 0];
	balances_re_ent8#1014 := balances_re_ent8#1014[__this := default_address_t_int()];
	redeemableEther_re_ent39#1096 := redeemableEther_re_ent39#1096[__this := default_address_t_int()];
	balances_re_ent36#1181 := balances_re_ent36#1181[__this := default_address_t_int()];
	counter_re_ent35#1263 := counter_re_ent35#1263[__this := 0];
	userBalance_re_ent40#1341 := userBalance_re_ent40#1341[__this := default_address_t_int()];
	balances_re_ent17#102 := balances_re_ent17#102[__this := default_address_t_int()];
	owner#143 := owner#143[__this := 0];
	redeemableEther_re_ent32#156 := redeemableEther_re_ent32#156[__this := default_address_t_int()];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#143 := owner#143[__this := __msg_sender];
	$return17:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	assume (_cap#633 >= _initialSupply#635);
	cap#411 := cap#411[__this := _cap#633];
	name#245 := name#245[__this := mem_arr_int[_name#637]];
	symbol#290 := symbol#290[__this := mem_arr_int[_symbol#639]];
	decimals#334 := decimals#334[__this := _decimals#641];
	_totalSupply#376 := _totalSupply#376[__this := _initialSupply#635];
	_balances#453 := _balances#453[__this := _balances#453[__this][owner#143[__this] := _totalSupply#376[__this]]];
	call_arg#18 := 0;
	assume {:sourceloc "buggy_9.sol", 220, 14} {:message ""} true;
	call Transfer#527(__this, __msg_sender, __msg_value, call_arg#18, owner#143[__this], _totalSupply#376[__this]);
	$return18:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 222, 1} {:message "balances_re_ent38"} balances_re_ent38#690: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 223, 1} {:message "TokenERC20::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#723(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#692: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#690[__this][__msg_sender] >= _weiToWithdraw#692);
	assume {:sourceloc "buggy_9.sol", 226, 11} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, _weiToWithdraw#692);
	assume __send_ret#19;
	balances_re_ent38#690 := balances_re_ent38#690[__this := balances_re_ent38#690[__this][__msg_sender := (balances_re_ent38#690[__this][__msg_sender] - _weiToWithdraw#692)]];
	$return19:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 233, 5} {:message "TokenERC20::totalSupply"} totalSupply#732(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#727: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#727 := _totalSupply#376[__this];
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 236, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#736: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_9.sol", 237, 1} {:message "TokenERC20::claimReward_re_ent4"} claimReward_re_ent4#772(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 240, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#749: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#736[__this][__msg_sender] > 0);
	transferValue_re_ent4#749 := redeemableEther_re_ent4#736[__this][__msg_sender];
	assume {:sourceloc "buggy_9.sol", 241, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#749);
	redeemableEther_re_ent4#736 := redeemableEther_re_ent4#736[__this := redeemableEther_re_ent4#736[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 250, 5} {:message "TokenERC20::balanceOf"} balanceOf#785(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#775: address_t)
	returns (#778: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#778 := _balances#453[__this][_owner#775];
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_9.sol", 253, 1} {:message "counter_re_ent7"} counter_re_ent7#788: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_9.sol", 254, 1} {:message "TokenERC20::callme_re_ent7"} callme_re_ent7#817(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#788[__this] <= 5);
	call_arg#20 := 10000000000000000000;
	assume {:sourceloc "buggy_9.sol", 256, 9} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	assume false;
	}

	counter_re_ent7#788 := counter_re_ent7#788[__this := (counter_re_ent7#788[__this] + 1)];
	$return23:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 268, 5} {:message "TokenERC20::allowance"} allowance#834(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#820: address_t, _spender#822: address_t)
	returns (#825: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#825 := _allowed#489[__this][_owner#820][_spender#822];
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_9.sol", 271, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#836: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_9.sol", 272, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#838: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_9.sol", 273, 4} {:message "TokenERC20::buyTicket_re_ent23"} buyTicket_re_ent23#868(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 274, 12} {:message ""} true;
	call __send_ret#22 := __send(lastPlayer_re_ent23#836[__this], __this, 0, jackpot_re_ent23#838[__this]);
	if (!(__send_ret#22)) {
	assume false;
	}

	lastPlayer_re_ent23#836 := lastPlayer_re_ent23#836[__this := __msg_sender];
	jackpot_re_ent23#838 := jackpot_re_ent23#838[__this := __balance[__this]];
	$return25:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 285, 5} {:message "TokenERC20::transfer"} transfer#888(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#871: address_t, _value#873: int)
	returns (#876: bool)
{
	var call_arg#23: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 286, 9} {:message ""} true;
	call _transfer#1092(__this, __msg_sender, __msg_value, call_arg#23, _to#871, _value#873);
	#876 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_9.sol", 289, 1} {:message "counter_re_ent14"} counter_re_ent14#891: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_9.sol", 290, 1} {:message "TokenERC20::callme_re_ent14"} callme_re_ent14#920(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#891[__this] <= 5);
	call_arg#24 := 10000000000000000000;
	assume {:sourceloc "buggy_9.sol", 292, 9} {:message ""} true;
	call __send_ret#25 := __send(__msg_sender, __this, 0, call_arg#24);
	if (!(__send_ret#25)) {
	assume false;
	}

	counter_re_ent14#891 := counter_re_ent14#891[__this := (counter_re_ent14#891[__this] + 1)];
	$return27:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 307, 5} {:message "TokenERC20::approve"} approve#940(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#923: address_t, _value#925: int)
	returns (#928: bool)
{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 308, 9} {:message ""} true;
	call _approve#1177(__this, __msg_sender, __msg_value, call_arg#26, _spender#923, _value#925);
	#928 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_9.sol", 311, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#942: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_9.sol", 312, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#944: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_9.sol", 313, 4} {:message "TokenERC20::buyTicket_re_ent30"} buyTicket_re_ent30#974(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 314, 12} {:message ""} true;
	call __send_ret#27 := __send(lastPlayer_re_ent30#942[__this], __this, 0, jackpot_re_ent30#944[__this]);
	if (!(__send_ret#27)) {
	assume false;
	}

	lastPlayer_re_ent30#942 := lastPlayer_re_ent30#942[__this := __msg_sender];
	jackpot_re_ent30#944 := jackpot_re_ent30#944[__this := __balance[__this]];
	$return29:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 328, 5} {:message "TokenERC20::transferFrom"} transferFrom#1010(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#977: address_t, _to#979: address_t, _value#981: int)
	returns (#984: bool)
{
	var call_arg#28: address_t;
	var sub#72_ret#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 329, 9} {:message ""} true;
	call _transfer#1092(__this, __msg_sender, __msg_value, _from#977, _to#979, _value#981);
	call_arg#28 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 330, 37} {:message ""} true;
	call sub#72_ret#29 := sub#72(__this, __msg_sender, __msg_value, _allowed#489[__this][_from#977][__msg_sender], _value#981);
	assume {:sourceloc "buggy_9.sol", 330, 9} {:message ""} true;
	call _approve#1177(__this, __msg_sender, __msg_value, _from#977, call_arg#28, sub#72_ret#29);
	#984 := true;
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 333, 1} {:message "balances_re_ent8"} balances_re_ent8#1014: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_9.sol", 334, 5} {:message "TokenERC20::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1043(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 335, 8} {:message "success"} success#1018: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1014[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1014[__this][__msg_sender])];
	assume {:sourceloc "buggy_9.sol", 335, 25} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(__msg_sender, __this, balances_re_ent8#1014[__this][__msg_sender]);
	if (__call_ret#30) {
	havoc lastPlayer_re_ent37#211;
	havoc jackpot_re_ent37#213;
	havoc name#245;
	havoc balances_re_ent3#249;
	havoc symbol#290;
	havoc lastPlayer_re_ent9#292;
	havoc jackpot_re_ent9#294;
	havoc decimals#334;
	havoc redeemableEther_re_ent25#338;
	havoc _totalSupply#376;
	havoc userBalance_re_ent19#380;
	havoc cap#411;
	havoc userBalance_re_ent26#415;
	havoc _balances#453;
	havoc not_called_re_ent20#456;
	havoc _allowed#489;
	havoc not_called_re_ent27#492;
	havoc balances_re_ent31#531;
	havoc not_called_re_ent13#575;
	havoc balances_re_ent38#690;
	havoc redeemableEther_re_ent4#736;
	havoc counter_re_ent7#788;
	havoc lastPlayer_re_ent23#836;
	havoc jackpot_re_ent23#838;
	havoc counter_re_ent14#891;
	havoc lastPlayer_re_ent30#942;
	havoc jackpot_re_ent30#944;
	havoc balances_re_ent8#1014;
	havoc redeemableEther_re_ent39#1096;
	havoc balances_re_ent36#1181;
	havoc counter_re_ent35#1263;
	havoc userBalance_re_ent40#1341;
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1014[__this][__msg_sender])];
	}

	success#1018 := __call_ret#30;
	if (success#1018) {
	balances_re_ent8#1014 := balances_re_ent8#1014[__this := balances_re_ent8#1014[__this][__msg_sender := 0]];
	}

	$return31:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 346, 5} {:message "TokenERC20::_transfer"} _transfer#1092(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1046: address_t, _to#1048: address_t, _value#1050: int)
{
	var call_arg#32: int_arr_ptr;
	var new_array#33: int_arr_ptr;
	var sub#72_ret#34: int;
	var add#97_ret#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#33 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#32 := new_array#33;
	mem_arr_int := mem_arr_int[call_arg#32 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (_to#1048 != 0);
	assume {:sourceloc "buggy_9.sol", 349, 28} {:message ""} true;
	call sub#72_ret#34 := sub#72(__this, __msg_sender, __msg_value, _balances#453[__this][_from#1046], _value#1050);
	_balances#453 := _balances#453[__this := _balances#453[__this][_from#1046 := sub#72_ret#34]];
	assume {:sourceloc "buggy_9.sol", 350, 26} {:message ""} true;
	call add#97_ret#35 := add#97(__this, __msg_sender, __msg_value, _balances#453[__this][_to#1048], _value#1050);
	_balances#453 := _balances#453[__this := _balances#453[__this][_to#1048 := add#97_ret#35]];
	assume {:sourceloc "buggy_9.sol", 351, 14} {:message ""} true;
	call Transfer#527(__this, __msg_sender, __msg_value, _from#1046, _to#1048, _value#1050);
	$return32:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 353, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1096: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_9.sol", 354, 1} {:message "TokenERC20::claimReward_re_ent39"} claimReward_re_ent39#1132(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 357, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1109: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1096[__this][__msg_sender] > 0);
	transferValue_re_ent39#1109 := redeemableEther_re_ent39#1096[__this][__msg_sender];
	assume {:sourceloc "buggy_9.sol", 358, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1109);
	redeemableEther_re_ent39#1096 := redeemableEther_re_ent39#1096[__this := redeemableEther_re_ent39#1096[__this][__msg_sender := 0]];
	$return33:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 368, 5} {:message "TokenERC20::_approve"} _approve#1177(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#1135: address_t, _spender#1137: address_t, _value#1139: int)
{
	var call_arg#36: int_arr_ptr;
	var new_array#37: int_arr_ptr;
	var call_arg#38: int_arr_ptr;
	var new_array#39: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#37 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#36 := new_array#37;
	mem_arr_int := mem_arr_int[call_arg#36 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (_owner#1135 != 0);
	new_array#39 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#38 := new_array#39;
	mem_arr_int := mem_arr_int[call_arg#38 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (_spender#1137 != 0);
	_allowed#489 := _allowed#489[__this := _allowed#489[__this][_owner#1135 := _allowed#489[__this][_owner#1135][_spender#1137 := _value#1139]]];
	assume {:sourceloc "buggy_9.sol", 373, 14} {:message ""} true;
	call Approval#572(__this, __msg_sender, __msg_value, _owner#1135, _spender#1137, _value#1139);
	$return34:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 375, 1} {:message "balances_re_ent36"} balances_re_ent36#1181: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_9.sol", 376, 5} {:message "TokenERC20::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1204(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 377, 12} {:message ""} true;
	call __send_ret#40 := __send(__msg_sender, __this, 0, balances_re_ent36#1181[__this][__msg_sender]);
	if (__send_ret#40) {
	balances_re_ent36#1181 := balances_re_ent36#1181[__this := balances_re_ent36#1181[__this][__msg_sender := 0]];
	}

	$return35:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 387, 5} {:message "TokenERC20::mint"} mint#1260(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1207: address_t, _amount#1209: int)
	returns (#1214: bool)
{
	var add#97_ret#43: int;
	var add#97_ret#44: int;
	var add#97_ret#45: int;
	var call_arg#46: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#143[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 388, 17} {:message ""} true;
	call add#97_ret#43 := add#97(__this, __msg_sender, __msg_value, _totalSupply#376[__this], _amount#1209);
	assume (add#97_ret#43 <= cap#411[__this]);
	assume {:sourceloc "buggy_9.sol", 390, 24} {:message ""} true;
	call add#97_ret#44 := add#97(__this, __msg_sender, __msg_value, _totalSupply#376[__this], _amount#1209);
	_totalSupply#376 := _totalSupply#376[__this := add#97_ret#44];
	assume {:sourceloc "buggy_9.sol", 391, 26} {:message ""} true;
	call add#97_ret#45 := add#97(__this, __msg_sender, __msg_value, _balances#453[__this][_to#1207], _amount#1209);
	_balances#453 := _balances#453[__this := _balances#453[__this][_to#1207 := add#97_ret#45]];
	assume {:sourceloc "buggy_9.sol", 392, 14} {:message ""} true;
	call Mint#613(__this, __msg_sender, __msg_value, _to#1207, _amount#1209);
	call_arg#46 := 0;
	assume {:sourceloc "buggy_9.sol", 393, 14} {:message ""} true;
	call Transfer#527(__this, __msg_sender, __msg_value, call_arg#46, _to#1207, _amount#1209);
	#1214 := true;
	goto $return37;
	$return37:
	// Function body ends here
	$return36:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_9.sol", 396, 1} {:message "counter_re_ent35"} counter_re_ent35#1263: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_9.sol", 397, 1} {:message "TokenERC20::callme_re_ent35"} callme_re_ent35#1292(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#47: int;
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1263[__this] <= 5);
	call_arg#47 := 10000000000000000000;
	assume {:sourceloc "buggy_9.sol", 399, 9} {:message ""} true;
	call __send_ret#48 := __send(__msg_sender, __this, 0, call_arg#47);
	if (!(__send_ret#48)) {
	assume false;
	}

	counter_re_ent35#1263 := counter_re_ent35#1263[__this := (counter_re_ent35#1263[__this] + 1)];
	$return38:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: transferBatch : function (address[] memory,uint256[] memory) returns (bool)
procedure {:sourceloc "buggy_9.sol", 410, 5} {:message "TokenERC20::transferBatch"} transferBatch#1337(__this: address_t, __msg_sender: address_t, __msg_value: int, _tos#1296: address_t_arr_ptr, _values#1299: int_arr_ptr)
	returns (#1302: bool)
{
	var {:sourceloc "buggy_9.sol", 413, 14} {:message "i"} i#1313: int;
	var transfer#888_ret#51: bool;
	var tmp#52: int;
	// TCC assumptions
	assume (_tos#1296 < __alloc_counter);
	assume (_values#1299 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#1296])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#1296]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_values#1299])) && (length#int_arr#constr(mem_arr_int[_values#1299]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_tos#1296]) == length#int_arr#constr(mem_arr_int[_values#1299]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#1313 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#1296])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#1296]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1313 < length#address_t_arr#constr(mem_arr_address_t[_tos#1296]))) {
	// Body
	assume {:sourceloc "buggy_9.sol", 414, 13} {:message ""} true;
	call transfer#888_ret#51 := transfer#888(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_tos#1296])[i#1313], arr#int_arr#constr(mem_arr_int[_values#1299])[i#1313]);
	$continue49:
	// Loop expression
	tmp#52 := i#1313;
	i#1313 := (i#1313 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#1296])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#1296]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break50:
	#1302 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 418, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1341: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_9.sol", 419, 1} {:message "TokenERC20::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1375(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 422, 3} {:message "success"} success#1345: bool;
	var __call_ret#53: bool;
	var __call_ret#54: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1341[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1341[__this][__msg_sender])];
	assume {:sourceloc "buggy_9.sol", 422, 18} {:message ""} true;
	call __call_ret#53, __call_ret#54 := __call(__msg_sender, __this, userBalance_re_ent40#1341[__this][__msg_sender]);
	if (__call_ret#53) {
	havoc lastPlayer_re_ent37#211;
	havoc jackpot_re_ent37#213;
	havoc name#245;
	havoc balances_re_ent3#249;
	havoc symbol#290;
	havoc lastPlayer_re_ent9#292;
	havoc jackpot_re_ent9#294;
	havoc decimals#334;
	havoc redeemableEther_re_ent25#338;
	havoc _totalSupply#376;
	havoc userBalance_re_ent19#380;
	havoc cap#411;
	havoc userBalance_re_ent26#415;
	havoc _balances#453;
	havoc not_called_re_ent20#456;
	havoc _allowed#489;
	havoc not_called_re_ent27#492;
	havoc balances_re_ent31#531;
	havoc not_called_re_ent13#575;
	havoc balances_re_ent38#690;
	havoc redeemableEther_re_ent4#736;
	havoc counter_re_ent7#788;
	havoc lastPlayer_re_ent23#836;
	havoc jackpot_re_ent23#838;
	havoc counter_re_ent14#891;
	havoc lastPlayer_re_ent30#942;
	havoc jackpot_re_ent30#944;
	havoc balances_re_ent8#1014;
	havoc redeemableEther_re_ent39#1096;
	havoc balances_re_ent36#1181;
	havoc counter_re_ent35#1263;
	havoc userBalance_re_ent40#1341;
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#53)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1341[__this][__msg_sender])];
	}

	success#1345 := __call_ret#53;
	if (!(success#1345)) {
	assume false;
	}

	userBalance_re_ent40#1341 := userBalance_re_ent40#1341[__this := userBalance_re_ent40#1341[__this][__msg_sender := 0]];
	$return40:
	// Function body ends here
}

// 
// ------- Contract: XLToken -------
// Inherits from: TokenERC20
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 436, 5} {:message "XLToken::[constructor]"} __constructor#1438(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#1380: int, _initialSupply#1382: int, _name#1384: int_arr_ptr, _symbol#1386: int_arr_ptr, _decimals#1388: int)
{
	var _cap#633#55: int;
	var _initialSupply#635#55: int;
	var _name#637#55: int_arr_ptr;
	var _symbol#639#55: int_arr_ptr;
	var _decimals#641#55: int;
	var call_arg#57: address_t;
	// TCC assumptions
	assume (_name#1384 < __alloc_counter);
	assume (_symbol#1386 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent33#1403 := userBalance_re_ent33#1403[__this := default_address_t_int()];
	lastPlayer_re_ent37#211 := lastPlayer_re_ent37#211[__this := 0];
	jackpot_re_ent37#213 := jackpot_re_ent37#213[__this := 0];
	name#245 := name#245[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent3#249 := balances_re_ent3#249[__this := default_address_t_int()];
	symbol#290 := symbol#290[__this := int_arr#constr(default_int_int(), 0)];
	lastPlayer_re_ent9#292 := lastPlayer_re_ent9#292[__this := 0];
	jackpot_re_ent9#294 := jackpot_re_ent9#294[__this := 0];
	decimals#334 := decimals#334[__this := 0];
	redeemableEther_re_ent25#338 := redeemableEther_re_ent25#338[__this := default_address_t_int()];
	_totalSupply#376 := _totalSupply#376[__this := 0];
	userBalance_re_ent19#380 := userBalance_re_ent19#380[__this := default_address_t_int()];
	cap#411 := cap#411[__this := 0];
	userBalance_re_ent26#415 := userBalance_re_ent26#415[__this := default_address_t_int()];
	_balances#453 := _balances#453[__this := default_address_t_int()];
	not_called_re_ent20#456 := not_called_re_ent20#456[__this := true];
	_allowed#489 := _allowed#489[__this := default_address_t__k_address_t_v_int()];
	not_called_re_ent27#492 := not_called_re_ent27#492[__this := true];
	balances_re_ent31#531 := balances_re_ent31#531[__this := default_address_t_int()];
	not_called_re_ent13#575 := not_called_re_ent13#575[__this := true];
	balances_re_ent38#690 := balances_re_ent38#690[__this := default_address_t_int()];
	redeemableEther_re_ent4#736 := redeemableEther_re_ent4#736[__this := default_address_t_int()];
	counter_re_ent7#788 := counter_re_ent7#788[__this := 0];
	lastPlayer_re_ent23#836 := lastPlayer_re_ent23#836[__this := 0];
	jackpot_re_ent23#838 := jackpot_re_ent23#838[__this := 0];
	counter_re_ent14#891 := counter_re_ent14#891[__this := 0];
	lastPlayer_re_ent30#942 := lastPlayer_re_ent30#942[__this := 0];
	jackpot_re_ent30#944 := jackpot_re_ent30#944[__this := 0];
	balances_re_ent8#1014 := balances_re_ent8#1014[__this := default_address_t_int()];
	redeemableEther_re_ent39#1096 := redeemableEther_re_ent39#1096[__this := default_address_t_int()];
	balances_re_ent36#1181 := balances_re_ent36#1181[__this := default_address_t_int()];
	counter_re_ent35#1263 := counter_re_ent35#1263[__this := 0];
	userBalance_re_ent40#1341 := userBalance_re_ent40#1341[__this := default_address_t_int()];
	balances_re_ent17#102 := balances_re_ent17#102[__this := default_address_t_int()];
	owner#143 := owner#143[__this := 0];
	redeemableEther_re_ent32#156 := redeemableEther_re_ent32#156[__this := default_address_t_int()];
	// Arguments for TokenERC20
	_cap#633#55 := _cap#1380;
	_initialSupply#635#55 := _initialSupply#1382;
	_name#637#55 := _name#1384;
	_symbol#639#55 := _symbol#1386;
	_decimals#641#55 := _decimals#1388;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#143 := owner#143[__this := __msg_sender];
	$return41:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	assume (_cap#633#55 >= _initialSupply#635#55);
	cap#411 := cap#411[__this := _cap#633#55];
	name#245 := name#245[__this := mem_arr_int[_name#637#55]];
	symbol#290 := symbol#290[__this := mem_arr_int[_symbol#639#55]];
	decimals#334 := decimals#334[__this := _decimals#641#55];
	_totalSupply#376 := _totalSupply#376[__this := _initialSupply#635#55];
	_balances#453 := _balances#453[__this := _balances#453[__this][owner#143[__this] := _totalSupply#376[__this]]];
	call_arg#57 := 0;
	assume {:sourceloc "buggy_9.sol", 220, 14} {:message ""} true;
	call Transfer#527(__this, __msg_sender, __msg_value, call_arg#57, owner#143[__this], _totalSupply#376[__this]);
	$return42:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return43:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 441, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1403: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_9.sol", 442, 1} {:message "XLToken::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1437(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 445, 3} {:message "success"} success#1407: bool;
	var __call_ret#59: bool;
	var __call_ret#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1403[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1403[__this][__msg_sender])];
	assume {:sourceloc "buggy_9.sol", 445, 19} {:message ""} true;
	call __call_ret#59, __call_ret#60 := __call(__msg_sender, __this, userBalance_re_ent33#1403[__this][__msg_sender]);
	if (__call_ret#59) {
	havoc userBalance_re_ent33#1403;
	havoc lastPlayer_re_ent37#211;
	havoc jackpot_re_ent37#213;
	havoc name#245;
	havoc balances_re_ent3#249;
	havoc symbol#290;
	havoc lastPlayer_re_ent9#292;
	havoc jackpot_re_ent9#294;
	havoc decimals#334;
	havoc redeemableEther_re_ent25#338;
	havoc _totalSupply#376;
	havoc userBalance_re_ent19#380;
	havoc cap#411;
	havoc userBalance_re_ent26#415;
	havoc _balances#453;
	havoc not_called_re_ent20#456;
	havoc _allowed#489;
	havoc not_called_re_ent27#492;
	havoc balances_re_ent31#531;
	havoc not_called_re_ent13#575;
	havoc balances_re_ent38#690;
	havoc redeemableEther_re_ent4#736;
	havoc counter_re_ent7#788;
	havoc lastPlayer_re_ent23#836;
	havoc jackpot_re_ent23#838;
	havoc counter_re_ent14#891;
	havoc lastPlayer_re_ent30#942;
	havoc jackpot_re_ent30#944;
	havoc balances_re_ent8#1014;
	havoc redeemableEther_re_ent39#1096;
	havoc balances_re_ent36#1181;
	havoc counter_re_ent35#1263;
	havoc userBalance_re_ent40#1341;
	havoc balances_re_ent17#102;
	havoc owner#143;
	havoc redeemableEther_re_ent32#156;
	havoc __balance;
	}

	if (!(__call_ret#59)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1403[__this][__msg_sender])];
	}

	success#1407 := __call_ret#59;
	if (!(success#1407)) {
	assume false;
	}

	userBalance_re_ent33#1403 := userBalance_re_ent33#1403[__this := userBalance_re_ent33#1403[__this][__msg_sender := 0]];
	$return44:
	// Function body ends here
}

