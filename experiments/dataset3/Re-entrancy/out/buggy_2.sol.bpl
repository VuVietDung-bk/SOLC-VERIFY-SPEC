// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_2.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: CareerOnToken -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_2.sol", 16, 3} {:message "[event] CareerOnToken::Transfer"} Transfer#39(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#33: address_t, _to#35: address_t, _value#37: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_2.sol", 24, 3} {:message "[event] CareerOnToken::Approval"} Approval#84(__this: address_t, __msg_sender: address_t, __msg_value: int, a_owner#78: address_t, _spender#80: address_t, _value#82: int)
{
	
}

// 
// Event: OwnerChang
procedure {:inline 1} {:sourceloc "buggy_2.sol", 34, 3} {:message "[event] CareerOnToken::OwnerChang"} OwnerChang#127(__this: address_t, __msg_sender: address_t, __msg_value: int, _old#121: address_t, _new#123: address_t, _coin_change#125: int)
{
	
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_2.sol", 8, 3} {:message "not_called_re_ent27"} not_called_re_ent27#4: [address_t]bool;
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
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_2.sol", 9, 1} {:message "CareerOnToken::bug_re_ent27"} bug_re_ent27#31(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#4[__this];
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_2.sol", 11, 16} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	assume false;
	}

	not_called_re_ent27#4 := not_called_re_ent27#4[__this := false];
	$return0:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 17, 3} {:message "balances_re_ent31"} balances_re_ent31#43: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 18, 1} {:message "CareerOnToken::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#76(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#45: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#43[__this][__msg_sender] >= _weiToWithdraw#45);
	assume {:sourceloc "buggy_2.sol", 21, 13} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, _weiToWithdraw#45);
	assume __send_ret#2;
	balances_re_ent31#43 := balances_re_ent31#43[__this := balances_re_ent31#43[__this][__msg_sender := (balances_re_ent31#43[__this][__msg_sender] - _weiToWithdraw#45)]];
	$return1:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_2.sol", 25, 3} {:message "not_called_re_ent13"} not_called_re_ent13#87: [address_t]bool;
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
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_2.sol", 26, 1} {:message "CareerOnToken::bug_re_ent13"} bug_re_ent13#119(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 28, 10} {:message "success"} success#95: bool;
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#87[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_2.sol", 28, 25} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#3) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc redeemableEther_re_ent25#131;
	havoc totalSupply#169;
	havoc userBalance_re_ent19#173;
	havoc name#204;
	havoc userBalance_re_ent26#208;
	havoc decimals#244;
	havoc not_called_re_ent20#247;
	havoc symbol#276;
	havoc redeemableEther_re_ent32#280;
	havoc owner#318;
	havoc balances_re_ent38#322;
	havoc balances#359;
	havoc redeemableEther_re_ent4#363;
	havoc allowed#405;
	havoc counter_re_ent7#408;
	havoc isTransPaused#440;
	havoc lastPlayer_re_ent23#503;
	havoc jackpot_re_ent23#505;
	havoc counter_re_ent14#615;
	havoc lastPlayer_re_ent30#740;
	havoc jackpot_re_ent30#742;
	havoc balances_re_ent8#815;
	havoc redeemableEther_re_ent39#864;
	havoc balances_re_ent36#949;
	havoc counter_re_ent35#992;
	havoc userBalance_re_ent40#1048;
	havoc userBalance_re_ent33#1093;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#95 := __call_ret#3;
	if (!(success#95)) {
	assume false;
	}

	not_called_re_ent13#87 := not_called_re_ent13#87[__this := false];
	$return2:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 36, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#131: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_2.sol", 37, 1} {:message "CareerOnToken::claimReward_re_ent25"} claimReward_re_ent25#167(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 40, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#144: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#131[__this][__msg_sender] > 0);
	transferValue_re_ent25#144 := redeemableEther_re_ent25#131[__this][__msg_sender];
	assume {:sourceloc "buggy_2.sol", 41, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#144);
	redeemableEther_re_ent25#131 := redeemableEther_re_ent25#131[__this := redeemableEther_re_ent25#131[__this][__msg_sender := 0]];
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_2.sol", 44, 3} {:message "totalSupply"} totalSupply#169: [address_t]int;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 45, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#173: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_2.sol", 46, 1} {:message "CareerOnToken::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#202(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_2.sol", 49, 16} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, userBalance_re_ent19#173[__this][__msg_sender]);
	if (!(__send_ret#5)) {
	assume false;
	}

	userBalance_re_ent19#173 := userBalance_re_ent19#173[__this := userBalance_re_ent19#173[__this][__msg_sender := 0]];
	$return4:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_2.sol", 54, 3} {:message "name"} name#204: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 55, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#208: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_2.sol", 56, 1} {:message "CareerOnToken::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#242(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 59, 10} {:message "success"} success#212: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#208[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#208[__this][__msg_sender])];
	assume {:sourceloc "buggy_2.sol", 59, 26} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, userBalance_re_ent26#208[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc redeemableEther_re_ent25#131;
	havoc totalSupply#169;
	havoc userBalance_re_ent19#173;
	havoc name#204;
	havoc userBalance_re_ent26#208;
	havoc decimals#244;
	havoc not_called_re_ent20#247;
	havoc symbol#276;
	havoc redeemableEther_re_ent32#280;
	havoc owner#318;
	havoc balances_re_ent38#322;
	havoc balances#359;
	havoc redeemableEther_re_ent4#363;
	havoc allowed#405;
	havoc counter_re_ent7#408;
	havoc isTransPaused#440;
	havoc lastPlayer_re_ent23#503;
	havoc jackpot_re_ent23#505;
	havoc counter_re_ent14#615;
	havoc lastPlayer_re_ent30#740;
	havoc jackpot_re_ent30#742;
	havoc balances_re_ent8#815;
	havoc redeemableEther_re_ent39#864;
	havoc balances_re_ent36#949;
	havoc counter_re_ent35#992;
	havoc userBalance_re_ent40#1048;
	havoc userBalance_re_ent33#1093;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#208[__this][__msg_sender])];
	}

	success#212 := __call_ret#6;
	if (!(success#212)) {
	assume false;
	}

	userBalance_re_ent26#208 := userBalance_re_ent26#208[__this := userBalance_re_ent26#208[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_2.sol", 65, 3} {:message "decimals"} decimals#244: [address_t]int;
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_2.sol", 66, 3} {:message "not_called_re_ent20"} not_called_re_ent20#247: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_2.sol", 67, 1} {:message "CareerOnToken::bug_re_ent20"} bug_re_ent20#274(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#247[__this];
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_2.sol", 69, 16} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, call_arg#8);
	if (!(__send_ret#9)) {
	assume false;
	}

	not_called_re_ent20#247 := not_called_re_ent20#247[__this := false];
	$return6:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_2.sol", 74, 3} {:message "symbol"} symbol#276: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 75, 3} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#280: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_2.sol", 76, 1} {:message "CareerOnToken::claimReward_re_ent32"} claimReward_re_ent32#316(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 79, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#293: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#280[__this][__msg_sender] > 0);
	transferValue_re_ent32#293 := redeemableEther_re_ent32#280[__this][__msg_sender];
	assume {:sourceloc "buggy_2.sol", 80, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#293);
	redeemableEther_re_ent32#280 := redeemableEther_re_ent32#280[__this := redeemableEther_re_ent32#280[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_2.sol", 83, 3} {:message "owner"} owner#318: [address_t]address_t;
// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 84, 3} {:message "balances_re_ent38"} balances_re_ent38#322: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_2.sol", 85, 1} {:message "CareerOnToken::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#355(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#324: int)
{
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#322[__this][__msg_sender] >= _weiToWithdraw#324);
	assume {:sourceloc "buggy_2.sol", 88, 13} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, _weiToWithdraw#324);
	assume __send_ret#10;
	balances_re_ent38#322 := balances_re_ent38#322[__this := balances_re_ent38#322[__this][__msg_sender := (balances_re_ent38#322[__this][__msg_sender] - _weiToWithdraw#324)]];
	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 91, 3} {:message "balances"} balances#359: [address_t][address_t]int;
// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 92, 3} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#363: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_2.sol", 93, 1} {:message "CareerOnToken::claimReward_re_ent4"} claimReward_re_ent4#399(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 96, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#376: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#363[__this][__msg_sender] > 0);
	transferValue_re_ent4#376 := redeemableEther_re_ent4#363[__this][__msg_sender];
	assume {:sourceloc "buggy_2.sol", 97, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#376);
	redeemableEther_re_ent4#363 := redeemableEther_re_ent4#363[__this := redeemableEther_re_ent4#363[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_2.sol", 100, 3} {:message "allowed"} allowed#405: [address_t][address_t][address_t]int;
// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_2.sol", 103, 3} {:message "counter_re_ent7"} counter_re_ent7#408: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_2.sol", 104, 1} {:message "CareerOnToken::callme_re_ent7"} callme_re_ent7#437(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#408[__this] <= 5);
	call_arg#11 := 10000000000000000000;
	assume {:sourceloc "buggy_2.sol", 106, 9} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	assume false;
	}

	counter_re_ent7#408 := counter_re_ent7#408[__this := (counter_re_ent7#408[__this] + 1)];
	$return10:
	// Function body ends here
}

// 
// State variable: isTransPaused: bool
var {:sourceloc "buggy_2.sol", 111, 3} {:message "isTransPaused"} isTransPaused#440: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_2.sol", 113, 5} {:message "CareerOnToken::[constructor]"} __constructor#1128(__this: address_t, __msg_sender: address_t, __msg_value: int, _initialAmount#442: int, _decimalUnits#444: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent27#4 := not_called_re_ent27#4[__this := true];
	balances_re_ent31#43 := balances_re_ent31#43[__this := default_address_t_int()];
	not_called_re_ent13#87 := not_called_re_ent13#87[__this := true];
	redeemableEther_re_ent25#131 := redeemableEther_re_ent25#131[__this := default_address_t_int()];
	totalSupply#169 := totalSupply#169[__this := 0];
	userBalance_re_ent19#173 := userBalance_re_ent19#173[__this := default_address_t_int()];
	name#204 := name#204[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent26#208 := userBalance_re_ent26#208[__this := default_address_t_int()];
	decimals#244 := decimals#244[__this := 0];
	not_called_re_ent20#247 := not_called_re_ent20#247[__this := true];
	symbol#276 := symbol#276[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent32#280 := redeemableEther_re_ent32#280[__this := default_address_t_int()];
	owner#318 := owner#318[__this := 0];
	balances_re_ent38#322 := balances_re_ent38#322[__this := default_address_t_int()];
	balances#359 := balances#359[__this := default_address_t_int()];
	redeemableEther_re_ent4#363 := redeemableEther_re_ent4#363[__this := default_address_t_int()];
	allowed#405 := allowed#405[__this := default_address_t__k_address_t_v_int()];
	counter_re_ent7#408 := counter_re_ent7#408[__this := 0];
	isTransPaused#440 := isTransPaused#440[__this := false];
	lastPlayer_re_ent23#503 := lastPlayer_re_ent23#503[__this := 0];
	jackpot_re_ent23#505 := jackpot_re_ent23#505[__this := 0];
	counter_re_ent14#615 := counter_re_ent14#615[__this := 0];
	lastPlayer_re_ent30#740 := lastPlayer_re_ent30#740[__this := 0];
	jackpot_re_ent30#742 := jackpot_re_ent30#742[__this := 0];
	balances_re_ent8#815 := balances_re_ent8#815[__this := default_address_t_int()];
	redeemableEther_re_ent39#864 := redeemableEther_re_ent39#864[__this := default_address_t_int()];
	balances_re_ent36#949 := balances_re_ent36#949[__this := default_address_t_int()];
	counter_re_ent35#992 := counter_re_ent35#992[__this := 0];
	userBalance_re_ent40#1048 := userBalance_re_ent40#1048[__this := default_address_t_int()];
	userBalance_re_ent33#1093 := userBalance_re_ent33#1093[__this := default_address_t_int()];
	// Function body starts here
	owner#318 := owner#318[__this := __msg_sender];
	if ((_initialAmount#442 <= 0)) {
	totalSupply#169 := totalSupply#169[__this := 100000000000000000];
	balances#359 := balances#359[__this := balances#359[__this][owner#318[__this] := totalSupply#169[__this]]];
	}
	else {
	totalSupply#169 := totalSupply#169[__this := _initialAmount#442];
	balances#359 := balances#359[__this := balances#359[__this][owner#318[__this] := _initialAmount#442]];
	}

	if ((_decimalUnits#444 <= 0)) {
	decimals#244 := decimals#244[__this := 2];
	}
	else {
	decimals#244 := decimals#244[__this := _decimalUnits#444];
	}

	name#204 := name#204[__this := int_arr#constr(default_int_int()[0 := 67][1 := 97][2 := 114][3 := 101][4 := 101][5 := 114][6 := 79][7 := 110][8 := 32][9 := 67][10 := 104][11 := 97][12 := 105][13 := 110][14 := 32][15 := 84][16 := 111][17 := 107][18 := 101][19 := 110], 20)];
	symbol#276 := symbol#276[__this := int_arr#constr(default_int_int()[0 := 67][1 := 79][2 := 84], 3)];
	$return11:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_2.sol", 133, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#503: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_2.sol", 134, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#505: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_2.sol", 135, 4} {:message "CareerOnToken::buyTicket_re_ent23"} buyTicket_re_ent23#535(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_2.sol", 136, 12} {:message ""} true;
	call __send_ret#13 := __send(lastPlayer_re_ent23#503[__this], __this, 0, jackpot_re_ent23#505[__this]);
	if (!(__send_ret#13)) {
	assume false;
	}

	lastPlayer_re_ent23#503 := lastPlayer_re_ent23#503[__this := __msg_sender];
	jackpot_re_ent23#505 := jackpot_re_ent23#505[__this := __balance[__this]];
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 143, 5} {:message "CareerOnToken::transfer"} transfer#612(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#537: address_t, _value#539: int)
	returns (success#542: bool)
{
	var call_arg#14: address_t;
	var call_arg#15: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 147, 9} {:message "Assertion might not hold."} ((((_to#537 != __this) && !(isTransPaused#440[__this])) && (balances#359[__this][__msg_sender] >= _value#539)) && ((balances#359[__this][_to#537] + _value#539) > balances#359[__this][_to#537]));
	balances#359 := balances#359[__this := balances#359[__this][__msg_sender := (balances#359[__this][__msg_sender] - _value#539)]];
	balances#359 := balances#359[__this := balances#359[__this][_to#537 := (balances#359[__this][_to#537] + _value#539)]];
	if ((__msg_sender == owner#318[__this])) {
	call_arg#14 := __this;
	assume {:sourceloc "buggy_2.sol", 156, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, call_arg#14, _to#537, _value#539);
	}
	else {
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 158, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, call_arg#15, _to#537, _value#539);
	}

	success#542 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_2.sol", 162, 1} {:message "counter_re_ent14"} counter_re_ent14#615: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_2.sol", 163, 1} {:message "CareerOnToken::callme_re_ent14"} callme_re_ent14#644(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#615[__this] <= 5);
	call_arg#16 := 10000000000000000000;
	assume {:sourceloc "buggy_2.sol", 165, 9} {:message ""} true;
	call __send_ret#17 := __send(__msg_sender, __this, 0, call_arg#16);
	if (!(__send_ret#17)) {
	assume false;
	}

	counter_re_ent14#615 := counter_re_ent14#615[__this := (counter_re_ent14#615[__this] + 1)];
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 172, 5} {:message "CareerOnToken::transferFrom"} transferFrom#738(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#646: address_t, _to#648: address_t, _value#650: int)
	returns (success#653: bool)
{
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 177, 9} {:message "Assertion might not hold."} (((((_to#648 != __this) && !(isTransPaused#440[__this])) && (balances#359[__this][__msg_sender] >= _value#650)) && ((balances#359[__this][_to#648] + _value#650) > balances#359[__this][_to#648])) && (allowed#405[__this][_from#646][__msg_sender] >= _value#650));
	balances#359 := balances#359[__this := balances#359[__this][_to#648 := (balances#359[__this][_to#648] + _value#650)]];
	balances#359 := balances#359[__this := balances#359[__this][_from#646 := (balances#359[__this][_from#646] - _value#650)]];
	allowed#405 := allowed#405[__this := allowed#405[__this][_from#646 := allowed#405[__this][_from#646][__msg_sender := (allowed#405[__this][_from#646][__msg_sender] - _value#650)]]];
	if ((_from#646 == owner#318[__this])) {
	call_arg#18 := __this;
	assume {:sourceloc "buggy_2.sol", 188, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, call_arg#18, _to#648, _value#650);
	}
	else {
	assume {:sourceloc "buggy_2.sol", 190, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, _from#646, _to#648, _value#650);
	}

	success#653 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_2.sol", 194, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#740: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_2.sol", 195, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#742: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_2.sol", 196, 4} {:message "CareerOnToken::buyTicket_re_ent30"} buyTicket_re_ent30#772(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_2.sol", 197, 12} {:message ""} true;
	call __send_ret#19 := __send(lastPlayer_re_ent30#740[__this], __this, 0, jackpot_re_ent30#742[__this]);
	if (!(__send_ret#19)) {
	assume false;
	}

	lastPlayer_re_ent30#740 := lastPlayer_re_ent30#740[__this := __msg_sender];
	jackpot_re_ent30#742 := jackpot_re_ent30#742[__this := __balance[__this]];
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_2.sol", 203, 5} {:message "CareerOnToken::approve"} approve#811(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#774: address_t, _value#776: int)
	returns (success#779: bool)
{
	var call_arg#20: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 205, 9} {:message "Assertion might not hold."} ((__msg_sender != _spender#774) && (_value#776 > 0));
	allowed#405 := allowed#405[__this := allowed#405[__this][__msg_sender := allowed#405[__this][__msg_sender][_spender#774 := _value#776]]];
	call_arg#20 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 207, 14} {:message ""} true;
	call Approval#84(__this, __msg_sender, __msg_value, call_arg#20, _spender#774, _value#776);
	success#779 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 210, 1} {:message "balances_re_ent8"} balances_re_ent8#815: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_2.sol", 211, 5} {:message "CareerOnToken::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#844(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 212, 9} {:message "success"} success#819: bool;
	var __call_ret#21: bool;
	var __call_ret#22: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#815[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#815[__this][__msg_sender])];
	assume {:sourceloc "buggy_2.sol", 212, 26} {:message ""} true;
	call __call_ret#21, __call_ret#22 := __call(__msg_sender, __this, balances_re_ent8#815[__this][__msg_sender]);
	if (__call_ret#21) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc redeemableEther_re_ent25#131;
	havoc totalSupply#169;
	havoc userBalance_re_ent19#173;
	havoc name#204;
	havoc userBalance_re_ent26#208;
	havoc decimals#244;
	havoc not_called_re_ent20#247;
	havoc symbol#276;
	havoc redeemableEther_re_ent32#280;
	havoc owner#318;
	havoc balances_re_ent38#322;
	havoc balances#359;
	havoc redeemableEther_re_ent4#363;
	havoc allowed#405;
	havoc counter_re_ent7#408;
	havoc isTransPaused#440;
	havoc lastPlayer_re_ent23#503;
	havoc jackpot_re_ent23#505;
	havoc counter_re_ent14#615;
	havoc lastPlayer_re_ent30#740;
	havoc jackpot_re_ent30#742;
	havoc balances_re_ent8#815;
	havoc redeemableEther_re_ent39#864;
	havoc balances_re_ent36#949;
	havoc counter_re_ent35#992;
	havoc userBalance_re_ent40#1048;
	havoc userBalance_re_ent33#1093;
	havoc __balance;
	}

	if (!(__call_ret#21)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#815[__this][__msg_sender])];
	}

	success#819 := __call_ret#21;
	if (success#819) {
	balances_re_ent8#815 := balances_re_ent8#815[__this := balances_re_ent8#815[__this][__msg_sender := 0]];
	}

	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_2.sol", 217, 5} {:message "CareerOnToken::allowance"} allowance#860(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#846: address_t, _spender#848: address_t)
	returns (remaining#851: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#851 := allowed#405[__this][_owner#846][_spender#848];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 223, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#864: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_2.sol", 224, 1} {:message "CareerOnToken::claimReward_re_ent39"} claimReward_re_ent39#900(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 227, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#877: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#864[__this][__msg_sender] > 0);
	transferValue_re_ent39#877 := redeemableEther_re_ent39#864[__this][__msg_sender];
	assume {:sourceloc "buggy_2.sol", 228, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#877);
	redeemableEther_re_ent39#864 := redeemableEther_re_ent39#864[__this := redeemableEther_re_ent39#864[__this][__msg_sender := 0]];
	$return20:
	// Function body ends here
}

// 
// Function: changeOwner : function (address)
procedure {:sourceloc "buggy_2.sol", 234, 2} {:message "CareerOnToken::changeOwner"} changeOwner#945(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#902: address_t)
{
	var call_arg#23: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 235, 9} {:message "Assertion might not hold."} ((__msg_sender == owner#318[__this]) && (__msg_sender != newOwner#902));
	balances#359 := balances#359[__this := balances#359[__this][newOwner#902 := balances#359[__this][owner#318[__this]]]];
	balances#359 := balances#359[__this := balances#359[__this][owner#318[__this] := 0]];
	owner#318 := owner#318[__this := newOwner#902];
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_2.sol", 239, 14} {:message ""} true;
	call OwnerChang#127(__this, __msg_sender, __msg_value, call_arg#23, newOwner#902, balances#359[__this][owner#318[__this]]);
	$return21:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 241, 1} {:message "balances_re_ent36"} balances_re_ent36#949: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_2.sol", 242, 5} {:message "CareerOnToken::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#972(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_2.sol", 243, 12} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, balances_re_ent36#949[__this][__msg_sender]);
	if (__send_ret#24) {
	balances_re_ent36#949 := balances_re_ent36#949[__this := balances_re_ent36#949[__this][__msg_sender := 0]];
	}

	$return22:
	// Function body ends here
}

// 
// Function: setPauseStatus : function (bool)
procedure {:sourceloc "buggy_2.sol", 248, 5} {:message "CareerOnToken::setPauseStatus"} setPauseStatus#989(__this: address_t, __msg_sender: address_t, __msg_value: int, isPaused#974: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 249, 9} {:message "Assertion might not hold."} (__msg_sender == owner#318[__this]);
	isTransPaused#440 := isTransPaused#440[__this := isPaused#974];
	$return23:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_2.sol", 252, 1} {:message "counter_re_ent35"} counter_re_ent35#992: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_2.sol", 253, 1} {:message "CareerOnToken::callme_re_ent35"} callme_re_ent35#1021(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#992[__this] <= 5);
	call_arg#25 := 10000000000000000000;
	assume {:sourceloc "buggy_2.sol", 255, 9} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, call_arg#25);
	if (!(__send_ret#26)) {
	assume false;
	}

	counter_re_ent35#992 := counter_re_ent35#992[__this := (counter_re_ent35#992[__this] + 1)];
	$return24:
	// Function body ends here
}

// 
// Function: changeContractName : function (string memory,string memory)
procedure {:sourceloc "buggy_2.sol", 262, 5} {:message "CareerOnToken::changeContractName"} changeContractName#1044(__this: address_t, __msg_sender: address_t, __msg_value: int, _newName#1023: int_arr_ptr, _newSymbol#1025: int_arr_ptr)
{
	// TCC assumptions
	assume (_newName#1023 < __alloc_counter);
	assume (_newSymbol#1025 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_2.sol", 263, 9} {:message "Assertion might not hold."} (__msg_sender == owner#318[__this]);
	name#204 := name#204[__this := mem_arr_int[_newName#1023]];
	symbol#276 := symbol#276[__this := mem_arr_int[_newSymbol#1025]];
	$return25:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 267, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1048: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_2.sol", 268, 1} {:message "CareerOnToken::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1082(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 271, 10} {:message "success"} success#1052: bool;
	var __call_ret#27: bool;
	var __call_ret#28: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1048[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1048[__this][__msg_sender])];
	assume {:sourceloc "buggy_2.sol", 271, 25} {:message ""} true;
	call __call_ret#27, __call_ret#28 := __call(__msg_sender, __this, userBalance_re_ent40#1048[__this][__msg_sender]);
	if (__call_ret#27) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc redeemableEther_re_ent25#131;
	havoc totalSupply#169;
	havoc userBalance_re_ent19#173;
	havoc name#204;
	havoc userBalance_re_ent26#208;
	havoc decimals#244;
	havoc not_called_re_ent20#247;
	havoc symbol#276;
	havoc redeemableEther_re_ent32#280;
	havoc owner#318;
	havoc balances_re_ent38#322;
	havoc balances#359;
	havoc redeemableEther_re_ent4#363;
	havoc allowed#405;
	havoc counter_re_ent7#408;
	havoc isTransPaused#440;
	havoc lastPlayer_re_ent23#503;
	havoc jackpot_re_ent23#505;
	havoc counter_re_ent14#615;
	havoc lastPlayer_re_ent30#740;
	havoc jackpot_re_ent30#742;
	havoc balances_re_ent8#815;
	havoc redeemableEther_re_ent39#864;
	havoc balances_re_ent36#949;
	havoc counter_re_ent35#992;
	havoc userBalance_re_ent40#1048;
	havoc userBalance_re_ent33#1093;
	havoc __balance;
	}

	if (!(__call_ret#27)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1048[__this][__msg_sender])];
	}

	success#1052 := __call_ret#27;
	if (!(success#1052)) {
	assume false;
	}

	userBalance_re_ent40#1048 := userBalance_re_ent40#1048[__this := userBalance_re_ent40#1048[__this][__msg_sender := 0]];
	$return26:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_2.sol", 279, 5} {:message "CareerOnToken::[receive]"} #1089(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return27:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_2.sol", 282, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1093: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_2.sol", 283, 1} {:message "CareerOnToken::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1127(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_2.sol", 286, 10} {:message "success"} success#1097: bool;
	var __call_ret#29: bool;
	var __call_ret#30: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1093[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1093[__this][__msg_sender])];
	assume {:sourceloc "buggy_2.sol", 286, 26} {:message ""} true;
	call __call_ret#29, __call_ret#30 := __call(__msg_sender, __this, userBalance_re_ent33#1093[__this][__msg_sender]);
	if (__call_ret#29) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc redeemableEther_re_ent25#131;
	havoc totalSupply#169;
	havoc userBalance_re_ent19#173;
	havoc name#204;
	havoc userBalance_re_ent26#208;
	havoc decimals#244;
	havoc not_called_re_ent20#247;
	havoc symbol#276;
	havoc redeemableEther_re_ent32#280;
	havoc owner#318;
	havoc balances_re_ent38#322;
	havoc balances#359;
	havoc redeemableEther_re_ent4#363;
	havoc allowed#405;
	havoc counter_re_ent7#408;
	havoc isTransPaused#440;
	havoc lastPlayer_re_ent23#503;
	havoc jackpot_re_ent23#505;
	havoc counter_re_ent14#615;
	havoc lastPlayer_re_ent30#740;
	havoc jackpot_re_ent30#742;
	havoc balances_re_ent8#815;
	havoc redeemableEther_re_ent39#864;
	havoc balances_re_ent36#949;
	havoc counter_re_ent35#992;
	havoc userBalance_re_ent40#1048;
	havoc userBalance_re_ent33#1093;
	havoc __balance;
	}

	if (!(__call_ret#29)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1093[__this][__msg_sender])];
	}

	success#1097 := __call_ret#29;
	if (!(success#1097)) {
	assume false;
	}

	userBalance_re_ent33#1093 := userBalance_re_ent33#1093[__this := userBalance_re_ent33#1093[__this][__msg_sender := 0]];
	$return28:
	// Function body ends here
}

