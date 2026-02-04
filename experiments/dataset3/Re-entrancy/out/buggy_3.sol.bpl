// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_3.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: CareerOnToken -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_3.sol", 16, 3} {:message "[event] CareerOnToken::Transfer"} Transfer#39(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#33: address_t, _to#35: address_t, _value#37: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_3.sol", 24, 3} {:message "[event] CareerOnToken::Approval"} Approval#84(__this: address_t, __msg_sender: address_t, __msg_value: int, a_owner#78: address_t, _spender#80: address_t, _value#82: int)
{
	
}

// 
// Event: OwnerChang
procedure {:inline 1} {:sourceloc "buggy_3.sol", 34, 3} {:message "[event] CareerOnToken::OwnerChang"} OwnerChang#127(__this: address_t, __msg_sender: address_t, __msg_value: int, _old#121: address_t, _new#123: address_t, _coin_change#125: int)
{
	
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_3.sol", 8, 3} {:message "not_called_re_ent27"} not_called_re_ent27#4: [address_t]bool;
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
procedure {:sourceloc "buggy_3.sol", 9, 1} {:message "CareerOnToken::bug_re_ent27"} bug_re_ent27#31(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#4[__this];
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 11, 16} {:message ""} true;
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
var {:sourceloc "buggy_3.sol", 17, 3} {:message "balances_re_ent31"} balances_re_ent31#43: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 18, 1} {:message "CareerOnToken::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#76(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#45: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#43[__this][__msg_sender] >= _weiToWithdraw#45);
	assume {:sourceloc "buggy_3.sol", 21, 13} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, _weiToWithdraw#45);
	assume __send_ret#2;
	balances_re_ent31#43 := balances_re_ent31#43[__this := balances_re_ent31#43[__this][__msg_sender := (balances_re_ent31#43[__this][__msg_sender] - _weiToWithdraw#45)]];
	$return1:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_3.sol", 25, 3} {:message "not_called_re_ent13"} not_called_re_ent13#87: [address_t]bool;
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
procedure {:sourceloc "buggy_3.sol", 26, 1} {:message "CareerOnToken::bug_re_ent13"} bug_re_ent13#119(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 28, 10} {:message "success"} success#95: bool;
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#87[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_3.sol", 28, 25} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#3) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc lastPlayer_re_ent9#129;
	havoc jackpot_re_ent9#131;
	havoc totalSupply#171;
	havoc redeemableEther_re_ent25#175;
	havoc name#213;
	havoc userBalance_re_ent19#217;
	havoc decimals#248;
	havoc userBalance_re_ent26#252;
	havoc symbol#288;
	havoc not_called_re_ent20#291;
	havoc owner#320;
	havoc redeemableEther_re_ent32#324;
	havoc balances#364;
	havoc balances_re_ent38#368;
	havoc allowed#407;
	havoc redeemableEther_re_ent4#411;
	havoc isTransPaused#450;
	havoc counter_re_ent7#514;
	havoc lastPlayer_re_ent23#622;
	havoc jackpot_re_ent23#624;
	havoc counter_re_ent14#751;
	havoc lastPlayer_re_ent30#821;
	havoc jackpot_re_ent30#823;
	havoc balances_re_ent8#873;
	havoc redeemableEther_re_ent39#918;
	havoc balances_re_ent36#1003;
	havoc counter_re_ent35#1046;
	havoc userBalance_re_ent40#1102;
	havoc userBalance_re_ent33#1147;
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
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_3.sol", 36, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#129: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_3.sol", 37, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#131: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_3.sol", 38, 4} {:message "CareerOnToken::buyTicket_re_ent9"} buyTicket_re_ent9#169(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 39, 10} {:message "success"} success#135: bool;
	var __call_ret#5: bool;
	var __call_ret#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#131[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#131[__this])];
	assume {:sourceloc "buggy_3.sol", 39, 27} {:message ""} true;
	call __call_ret#5, __call_ret#6 := __call(lastPlayer_re_ent9#129[__this], __this, jackpot_re_ent9#131[__this]);
	if (__call_ret#5) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc lastPlayer_re_ent9#129;
	havoc jackpot_re_ent9#131;
	havoc totalSupply#171;
	havoc redeemableEther_re_ent25#175;
	havoc name#213;
	havoc userBalance_re_ent19#217;
	havoc decimals#248;
	havoc userBalance_re_ent26#252;
	havoc symbol#288;
	havoc not_called_re_ent20#291;
	havoc owner#320;
	havoc redeemableEther_re_ent32#324;
	havoc balances#364;
	havoc balances_re_ent38#368;
	havoc allowed#407;
	havoc redeemableEther_re_ent4#411;
	havoc isTransPaused#450;
	havoc counter_re_ent7#514;
	havoc lastPlayer_re_ent23#622;
	havoc jackpot_re_ent23#624;
	havoc counter_re_ent14#751;
	havoc lastPlayer_re_ent30#821;
	havoc jackpot_re_ent30#823;
	havoc balances_re_ent8#873;
	havoc redeemableEther_re_ent39#918;
	havoc balances_re_ent36#1003;
	havoc counter_re_ent35#1046;
	havoc userBalance_re_ent40#1102;
	havoc userBalance_re_ent33#1147;
	havoc __balance;
	}

	if (!(__call_ret#5)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#131[__this])];
	}

	success#135 := __call_ret#5;
	if (!(success#135)) {
	assume false;
	}

	lastPlayer_re_ent9#129 := lastPlayer_re_ent9#129[__this := __msg_sender];
	jackpot_re_ent9#131 := jackpot_re_ent9#131[__this := __balance[__this]];
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_3.sol", 45, 3} {:message "totalSupply"} totalSupply#171: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 46, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#175: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_3.sol", 47, 1} {:message "CareerOnToken::claimReward_re_ent25"} claimReward_re_ent25#211(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 50, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#188: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#175[__this][__msg_sender] > 0);
	transferValue_re_ent25#188 := redeemableEther_re_ent25#175[__this][__msg_sender];
	assume {:sourceloc "buggy_3.sol", 51, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#188);
	redeemableEther_re_ent25#175 := redeemableEther_re_ent25#175[__this := redeemableEther_re_ent25#175[__this][__msg_sender := 0]];
	$return4:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_3.sol", 54, 3} {:message "name"} name#213: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 55, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#217: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_3.sol", 56, 1} {:message "CareerOnToken::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#246(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_3.sol", 59, 16} {:message ""} true;
	call __send_ret#7 := __send(__msg_sender, __this, 0, userBalance_re_ent19#217[__this][__msg_sender]);
	if (!(__send_ret#7)) {
	assume false;
	}

	userBalance_re_ent19#217 := userBalance_re_ent19#217[__this := userBalance_re_ent19#217[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_3.sol", 64, 3} {:message "decimals"} decimals#248: [address_t]int;
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 65, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#252: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_3.sol", 66, 1} {:message "CareerOnToken::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#286(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 69, 10} {:message "success"} success#256: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#252[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#252[__this][__msg_sender])];
	assume {:sourceloc "buggy_3.sol", 69, 26} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, userBalance_re_ent26#252[__this][__msg_sender]);
	if (__call_ret#8) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc lastPlayer_re_ent9#129;
	havoc jackpot_re_ent9#131;
	havoc totalSupply#171;
	havoc redeemableEther_re_ent25#175;
	havoc name#213;
	havoc userBalance_re_ent19#217;
	havoc decimals#248;
	havoc userBalance_re_ent26#252;
	havoc symbol#288;
	havoc not_called_re_ent20#291;
	havoc owner#320;
	havoc redeemableEther_re_ent32#324;
	havoc balances#364;
	havoc balances_re_ent38#368;
	havoc allowed#407;
	havoc redeemableEther_re_ent4#411;
	havoc isTransPaused#450;
	havoc counter_re_ent7#514;
	havoc lastPlayer_re_ent23#622;
	havoc jackpot_re_ent23#624;
	havoc counter_re_ent14#751;
	havoc lastPlayer_re_ent30#821;
	havoc jackpot_re_ent30#823;
	havoc balances_re_ent8#873;
	havoc redeemableEther_re_ent39#918;
	havoc balances_re_ent36#1003;
	havoc counter_re_ent35#1046;
	havoc userBalance_re_ent40#1102;
	havoc userBalance_re_ent33#1147;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#252[__this][__msg_sender])];
	}

	success#256 := __call_ret#8;
	if (!(success#256)) {
	assume false;
	}

	userBalance_re_ent26#252 := userBalance_re_ent26#252[__this := userBalance_re_ent26#252[__this][__msg_sender := 0]];
	$return6:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_3.sol", 75, 3} {:message "symbol"} symbol#288: [address_t]int_arr_type;
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_3.sol", 76, 3} {:message "not_called_re_ent20"} not_called_re_ent20#291: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_3.sol", 77, 1} {:message "CareerOnToken::bug_re_ent20"} bug_re_ent20#318(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#291[__this];
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 79, 16} {:message ""} true;
	call __send_ret#11 := __send(__msg_sender, __this, 0, call_arg#10);
	if (!(__send_ret#11)) {
	assume false;
	}

	not_called_re_ent20#291 := not_called_re_ent20#291[__this := false];
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_3.sol", 84, 3} {:message "owner"} owner#320: [address_t]address_t;
// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 86, 3} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#324: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_3.sol", 87, 1} {:message "CareerOnToken::claimReward_re_ent32"} claimReward_re_ent32#360(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 90, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#337: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#324[__this][__msg_sender] > 0);
	transferValue_re_ent32#337 := redeemableEther_re_ent32#324[__this][__msg_sender];
	assume {:sourceloc "buggy_3.sol", 91, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#337);
	redeemableEther_re_ent32#324 := redeemableEther_re_ent32#324[__this := redeemableEther_re_ent32#324[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 94, 3} {:message "balances"} balances#364: [address_t][address_t]int;
// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 95, 3} {:message "balances_re_ent38"} balances_re_ent38#368: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_3.sol", 96, 1} {:message "CareerOnToken::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#401(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#370: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#368[__this][__msg_sender] >= _weiToWithdraw#370);
	assume {:sourceloc "buggy_3.sol", 99, 13} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, _weiToWithdraw#370);
	assume __send_ret#12;
	balances_re_ent38#368 := balances_re_ent38#368[__this := balances_re_ent38#368[__this][__msg_sender := (balances_re_ent38#368[__this][__msg_sender] - _weiToWithdraw#370)]];
	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_3.sol", 102, 3} {:message "allowed"} allowed#407: [address_t][address_t][address_t]int;
// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 105, 3} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#411: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_3.sol", 106, 1} {:message "CareerOnToken::claimReward_re_ent4"} claimReward_re_ent4#447(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 109, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#424: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#411[__this][__msg_sender] > 0);
	transferValue_re_ent4#424 := redeemableEther_re_ent4#411[__this][__msg_sender];
	assume {:sourceloc "buggy_3.sol", 110, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#424);
	redeemableEther_re_ent4#411 := redeemableEther_re_ent4#411[__this := redeemableEther_re_ent4#411[__this][__msg_sender := 0]];
	$return10:
	// Function body ends here
}

// 
// State variable: isTransPaused: bool
var {:sourceloc "buggy_3.sol", 113, 3} {:message "isTransPaused"} isTransPaused#450: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 115, 5} {:message "CareerOnToken::[constructor]"} __constructor#1182(__this: address_t, __msg_sender: address_t, __msg_value: int, _initialAmount#452: int, _decimalUnits#454: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent27#4 := not_called_re_ent27#4[__this := true];
	balances_re_ent31#43 := balances_re_ent31#43[__this := default_address_t_int()];
	not_called_re_ent13#87 := not_called_re_ent13#87[__this := true];
	lastPlayer_re_ent9#129 := lastPlayer_re_ent9#129[__this := 0];
	jackpot_re_ent9#131 := jackpot_re_ent9#131[__this := 0];
	totalSupply#171 := totalSupply#171[__this := 0];
	redeemableEther_re_ent25#175 := redeemableEther_re_ent25#175[__this := default_address_t_int()];
	name#213 := name#213[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent19#217 := userBalance_re_ent19#217[__this := default_address_t_int()];
	decimals#248 := decimals#248[__this := 0];
	userBalance_re_ent26#252 := userBalance_re_ent26#252[__this := default_address_t_int()];
	symbol#288 := symbol#288[__this := int_arr#constr(default_int_int(), 0)];
	not_called_re_ent20#291 := not_called_re_ent20#291[__this := true];
	owner#320 := owner#320[__this := 0];
	redeemableEther_re_ent32#324 := redeemableEther_re_ent32#324[__this := default_address_t_int()];
	balances#364 := balances#364[__this := default_address_t_int()];
	balances_re_ent38#368 := balances_re_ent38#368[__this := default_address_t_int()];
	allowed#407 := allowed#407[__this := default_address_t__k_address_t_v_int()];
	redeemableEther_re_ent4#411 := redeemableEther_re_ent4#411[__this := default_address_t_int()];
	isTransPaused#450 := isTransPaused#450[__this := false];
	counter_re_ent7#514 := counter_re_ent7#514[__this := 0];
	lastPlayer_re_ent23#622 := lastPlayer_re_ent23#622[__this := 0];
	jackpot_re_ent23#624 := jackpot_re_ent23#624[__this := 0];
	counter_re_ent14#751 := counter_re_ent14#751[__this := 0];
	lastPlayer_re_ent30#821 := lastPlayer_re_ent30#821[__this := 0];
	jackpot_re_ent30#823 := jackpot_re_ent30#823[__this := 0];
	balances_re_ent8#873 := balances_re_ent8#873[__this := default_address_t_int()];
	redeemableEther_re_ent39#918 := redeemableEther_re_ent39#918[__this := default_address_t_int()];
	balances_re_ent36#1003 := balances_re_ent36#1003[__this := default_address_t_int()];
	counter_re_ent35#1046 := counter_re_ent35#1046[__this := 0];
	userBalance_re_ent40#1102 := userBalance_re_ent40#1102[__this := default_address_t_int()];
	userBalance_re_ent33#1147 := userBalance_re_ent33#1147[__this := default_address_t_int()];
	// Function body starts here
	owner#320 := owner#320[__this := __msg_sender];
	if ((_initialAmount#452 <= 0)) {
	totalSupply#171 := totalSupply#171[__this := 100000000000000000];
	balances#364 := balances#364[__this := balances#364[__this][owner#320[__this] := totalSupply#171[__this]]];
	}
	else {
	totalSupply#171 := totalSupply#171[__this := _initialAmount#452];
	balances#364 := balances#364[__this := balances#364[__this][owner#320[__this] := _initialAmount#452]];
	}

	if ((_decimalUnits#454 <= 0)) {
	decimals#248 := decimals#248[__this := 2];
	}
	else {
	decimals#248 := decimals#248[__this := _decimalUnits#454];
	}

	name#213 := name#213[__this := int_arr#constr(default_int_int()[0 := 67][1 := 97][2 := 114][3 := 101][4 := 101][5 := 114][6 := 79][7 := 110][8 := 32][9 := 67][10 := 104][11 := 97][12 := 105][13 := 110][14 := 32][15 := 84][16 := 111][17 := 107][18 := 101][19 := 110], 20)];
	symbol#288 := symbol#288[__this := int_arr#constr(default_int_int()[0 := 67][1 := 79][2 := 84], 3)];
	$return11:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_3.sol", 135, 1} {:message "counter_re_ent7"} counter_re_ent7#514: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_3.sol", 136, 1} {:message "CareerOnToken::callme_re_ent7"} callme_re_ent7#543(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#514[__this] <= 5);
	call_arg#13 := 10000000000000000000;
	assume {:sourceloc "buggy_3.sol", 138, 9} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	assume false;
	}

	counter_re_ent7#514 := counter_re_ent7#514[__this := (counter_re_ent7#514[__this] + 1)];
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 145, 5} {:message "CareerOnToken::transfer"} transfer#620(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#545: address_t, _value#547: int)
	returns (success#550: bool)
{
	var call_arg#15: address_t;
	var call_arg#16: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 149, 9} {:message "Assertion might not hold."} ((((_to#545 != __this) && !(isTransPaused#450[__this])) && (balances#364[__this][__msg_sender] >= _value#547)) && ((balances#364[__this][_to#545] + _value#547) > balances#364[__this][_to#545]));
	balances#364 := balances#364[__this := balances#364[__this][__msg_sender := (balances#364[__this][__msg_sender] - _value#547)]];
	balances#364 := balances#364[__this := balances#364[__this][_to#545 := (balances#364[__this][_to#545] + _value#547)]];
	if ((__msg_sender == owner#320[__this])) {
	call_arg#15 := __this;
	assume {:sourceloc "buggy_3.sol", 158, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, call_arg#15, _to#545, _value#547);
	}
	else {
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 160, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, call_arg#16, _to#545, _value#547);
	}

	success#550 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_3.sol", 164, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#622: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_3.sol", 165, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#624: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_3.sol", 166, 4} {:message "CareerOnToken::buyTicket_re_ent23"} buyTicket_re_ent23#654(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_3.sol", 167, 12} {:message ""} true;
	call __send_ret#17 := __send(lastPlayer_re_ent23#622[__this], __this, 0, jackpot_re_ent23#624[__this]);
	if (!(__send_ret#17)) {
	assume false;
	}

	lastPlayer_re_ent23#622 := lastPlayer_re_ent23#622[__this := __msg_sender];
	jackpot_re_ent23#624 := jackpot_re_ent23#624[__this := __balance[__this]];
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 174, 5} {:message "CareerOnToken::transferFrom"} transferFrom#748(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#656: address_t, _to#658: address_t, _value#660: int)
	returns (success#663: bool)
{
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 179, 9} {:message "Assertion might not hold."} (((((_to#658 != __this) && !(isTransPaused#450[__this])) && (balances#364[__this][__msg_sender] >= _value#660)) && ((balances#364[__this][_to#658] + _value#660) > balances#364[__this][_to#658])) && (allowed#407[__this][_from#656][__msg_sender] >= _value#660));
	balances#364 := balances#364[__this := balances#364[__this][_to#658 := (balances#364[__this][_to#658] + _value#660)]];
	balances#364 := balances#364[__this := balances#364[__this][_from#656 := (balances#364[__this][_from#656] - _value#660)]];
	allowed#407 := allowed#407[__this := allowed#407[__this][_from#656 := allowed#407[__this][_from#656][__msg_sender := (allowed#407[__this][_from#656][__msg_sender] - _value#660)]]];
	if ((_from#656 == owner#320[__this])) {
	call_arg#18 := __this;
	assume {:sourceloc "buggy_3.sol", 190, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, call_arg#18, _to#658, _value#660);
	}
	else {
	assume {:sourceloc "buggy_3.sol", 192, 9} {:message ""} true;
	call Transfer#39(__this, __msg_sender, __msg_value, _from#656, _to#658, _value#660);
	}

	success#663 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_3.sol", 196, 1} {:message "counter_re_ent14"} counter_re_ent14#751: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_3.sol", 197, 1} {:message "CareerOnToken::callme_re_ent14"} callme_re_ent14#780(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#751[__this] <= 5);
	call_arg#19 := 10000000000000000000;
	assume {:sourceloc "buggy_3.sol", 199, 9} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, call_arg#19);
	if (!(__send_ret#20)) {
	assume false;
	}

	counter_re_ent14#751 := counter_re_ent14#751[__this := (counter_re_ent14#751[__this] + 1)];
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 205, 5} {:message "CareerOnToken::approve"} approve#819(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#782: address_t, _value#784: int)
	returns (success#787: bool)
{
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 207, 9} {:message "Assertion might not hold."} ((__msg_sender != _spender#782) && (_value#784 > 0));
	allowed#407 := allowed#407[__this := allowed#407[__this][__msg_sender := allowed#407[__this][__msg_sender][_spender#782 := _value#784]]];
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 209, 14} {:message ""} true;
	call Approval#84(__this, __msg_sender, __msg_value, call_arg#21, _spender#782, _value#784);
	success#787 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_3.sol", 212, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#821: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_3.sol", 213, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#823: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_3.sol", 214, 4} {:message "CareerOnToken::buyTicket_re_ent30"} buyTicket_re_ent30#853(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_3.sol", 215, 12} {:message ""} true;
	call __send_ret#22 := __send(lastPlayer_re_ent30#821[__this], __this, 0, jackpot_re_ent30#823[__this]);
	if (!(__send_ret#22)) {
	assume false;
	}

	lastPlayer_re_ent30#821 := lastPlayer_re_ent30#821[__this := __msg_sender];
	jackpot_re_ent30#823 := jackpot_re_ent30#823[__this := __balance[__this]];
	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 221, 5} {:message "CareerOnToken::allowance"} allowance#869(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#855: address_t, _spender#857: address_t)
	returns (remaining#860: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#860 := allowed#407[__this][_owner#855][_spender#857];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 227, 1} {:message "balances_re_ent8"} balances_re_ent8#873: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_3.sol", 228, 5} {:message "CareerOnToken::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#902(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 229, 9} {:message "success"} success#877: bool;
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#873[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#873[__this][__msg_sender])];
	assume {:sourceloc "buggy_3.sol", 229, 26} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(__msg_sender, __this, balances_re_ent8#873[__this][__msg_sender]);
	if (__call_ret#23) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc lastPlayer_re_ent9#129;
	havoc jackpot_re_ent9#131;
	havoc totalSupply#171;
	havoc redeemableEther_re_ent25#175;
	havoc name#213;
	havoc userBalance_re_ent19#217;
	havoc decimals#248;
	havoc userBalance_re_ent26#252;
	havoc symbol#288;
	havoc not_called_re_ent20#291;
	havoc owner#320;
	havoc redeemableEther_re_ent32#324;
	havoc balances#364;
	havoc balances_re_ent38#368;
	havoc allowed#407;
	havoc redeemableEther_re_ent4#411;
	havoc isTransPaused#450;
	havoc counter_re_ent7#514;
	havoc lastPlayer_re_ent23#622;
	havoc jackpot_re_ent23#624;
	havoc counter_re_ent14#751;
	havoc lastPlayer_re_ent30#821;
	havoc jackpot_re_ent30#823;
	havoc balances_re_ent8#873;
	havoc redeemableEther_re_ent39#918;
	havoc balances_re_ent36#1003;
	havoc counter_re_ent35#1046;
	havoc userBalance_re_ent40#1102;
	havoc userBalance_re_ent33#1147;
	havoc __balance;
	}

	if (!(__call_ret#23)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#873[__this][__msg_sender])];
	}

	success#877 := __call_ret#23;
	if (success#877) {
	balances_re_ent8#873 := balances_re_ent8#873[__this := balances_re_ent8#873[__this][__msg_sender := 0]];
	}

	$return20:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 234, 5} {:message "CareerOnToken::balanceOf"} balanceOf#914(__this: address_t, __msg_sender: address_t, __msg_value: int, accountAddr#904: address_t)
	returns (#907: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#907 := balances#364[__this][accountAddr#904];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 237, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#918: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_3.sol", 238, 1} {:message "CareerOnToken::claimReward_re_ent39"} claimReward_re_ent39#954(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 241, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#931: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#918[__this][__msg_sender] > 0);
	transferValue_re_ent39#931 := redeemableEther_re_ent39#918[__this][__msg_sender];
	assume {:sourceloc "buggy_3.sol", 242, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#931);
	redeemableEther_re_ent39#918 := redeemableEther_re_ent39#918[__this := redeemableEther_re_ent39#918[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// Function: changeOwner : function (address)
procedure {:sourceloc "buggy_3.sol", 248, 2} {:message "CareerOnToken::changeOwner"} changeOwner#999(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#956: address_t)
{
	var call_arg#25: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 249, 9} {:message "Assertion might not hold."} ((__msg_sender == owner#320[__this]) && (__msg_sender != newOwner#956));
	balances#364 := balances#364[__this := balances#364[__this][newOwner#956 := balances#364[__this][owner#320[__this]]]];
	balances#364 := balances#364[__this := balances#364[__this][owner#320[__this] := 0]];
	owner#320 := owner#320[__this := newOwner#956];
	call_arg#25 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 253, 14} {:message ""} true;
	call OwnerChang#127(__this, __msg_sender, __msg_value, call_arg#25, newOwner#956, balances#364[__this][owner#320[__this]]);
	$return23:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 255, 1} {:message "balances_re_ent36"} balances_re_ent36#1003: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_3.sol", 256, 5} {:message "CareerOnToken::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1026(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_3.sol", 257, 12} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, balances_re_ent36#1003[__this][__msg_sender]);
	if (__send_ret#26) {
	balances_re_ent36#1003 := balances_re_ent36#1003[__this := balances_re_ent36#1003[__this][__msg_sender := 0]];
	}

	$return24:
	// Function body ends here
}

// 
// Function: setPauseStatus : function (bool)
procedure {:sourceloc "buggy_3.sol", 262, 5} {:message "CareerOnToken::setPauseStatus"} setPauseStatus#1043(__this: address_t, __msg_sender: address_t, __msg_value: int, isPaused#1028: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 263, 9} {:message "Assertion might not hold."} (__msg_sender == owner#320[__this]);
	isTransPaused#450 := isTransPaused#450[__this := isPaused#1028];
	$return25:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_3.sol", 266, 1} {:message "counter_re_ent35"} counter_re_ent35#1046: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_3.sol", 267, 1} {:message "CareerOnToken::callme_re_ent35"} callme_re_ent35#1075(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1046[__this] <= 5);
	call_arg#27 := 10000000000000000000;
	assume {:sourceloc "buggy_3.sol", 269, 9} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	assume false;
	}

	counter_re_ent35#1046 := counter_re_ent35#1046[__this := (counter_re_ent35#1046[__this] + 1)];
	$return26:
	// Function body ends here
}

// 
// Function: changeContractName : function (string memory,string memory)
procedure {:sourceloc "buggy_3.sol", 276, 5} {:message "CareerOnToken::changeContractName"} changeContractName#1098(__this: address_t, __msg_sender: address_t, __msg_value: int, _newName#1077: int_arr_ptr, _newSymbol#1079: int_arr_ptr)
{
	// TCC assumptions
	assume (_newName#1077 < __alloc_counter);
	assume (_newSymbol#1079 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 277, 9} {:message "Assertion might not hold."} (__msg_sender == owner#320[__this]);
	name#213 := name#213[__this := mem_arr_int[_newName#1077]];
	symbol#288 := symbol#288[__this := mem_arr_int[_newSymbol#1079]];
	$return27:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 281, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1102: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_3.sol", 282, 1} {:message "CareerOnToken::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1136(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 285, 10} {:message "success"} success#1106: bool;
	var __call_ret#29: bool;
	var __call_ret#30: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1102[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1102[__this][__msg_sender])];
	assume {:sourceloc "buggy_3.sol", 285, 25} {:message ""} true;
	call __call_ret#29, __call_ret#30 := __call(__msg_sender, __this, userBalance_re_ent40#1102[__this][__msg_sender]);
	if (__call_ret#29) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc lastPlayer_re_ent9#129;
	havoc jackpot_re_ent9#131;
	havoc totalSupply#171;
	havoc redeemableEther_re_ent25#175;
	havoc name#213;
	havoc userBalance_re_ent19#217;
	havoc decimals#248;
	havoc userBalance_re_ent26#252;
	havoc symbol#288;
	havoc not_called_re_ent20#291;
	havoc owner#320;
	havoc redeemableEther_re_ent32#324;
	havoc balances#364;
	havoc balances_re_ent38#368;
	havoc allowed#407;
	havoc redeemableEther_re_ent4#411;
	havoc isTransPaused#450;
	havoc counter_re_ent7#514;
	havoc lastPlayer_re_ent23#622;
	havoc jackpot_re_ent23#624;
	havoc counter_re_ent14#751;
	havoc lastPlayer_re_ent30#821;
	havoc jackpot_re_ent30#823;
	havoc balances_re_ent8#873;
	havoc redeemableEther_re_ent39#918;
	havoc balances_re_ent36#1003;
	havoc counter_re_ent35#1046;
	havoc userBalance_re_ent40#1102;
	havoc userBalance_re_ent33#1147;
	havoc __balance;
	}

	if (!(__call_ret#29)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1102[__this][__msg_sender])];
	}

	success#1106 := __call_ret#29;
	if (!(success#1106)) {
	assume false;
	}

	userBalance_re_ent40#1102 := userBalance_re_ent40#1102[__this := userBalance_re_ent40#1102[__this][__msg_sender := 0]];
	$return28:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 293, 5} {:message "CareerOnToken::[receive]"} #1143(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return29:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 296, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1147: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_3.sol", 297, 1} {:message "CareerOnToken::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1181(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_3.sol", 300, 10} {:message "success"} success#1151: bool;
	var __call_ret#31: bool;
	var __call_ret#32: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1147[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1147[__this][__msg_sender])];
	assume {:sourceloc "buggy_3.sol", 300, 26} {:message ""} true;
	call __call_ret#31, __call_ret#32 := __call(__msg_sender, __this, userBalance_re_ent33#1147[__this][__msg_sender]);
	if (__call_ret#31) {
	havoc not_called_re_ent27#4;
	havoc balances_re_ent31#43;
	havoc not_called_re_ent13#87;
	havoc lastPlayer_re_ent9#129;
	havoc jackpot_re_ent9#131;
	havoc totalSupply#171;
	havoc redeemableEther_re_ent25#175;
	havoc name#213;
	havoc userBalance_re_ent19#217;
	havoc decimals#248;
	havoc userBalance_re_ent26#252;
	havoc symbol#288;
	havoc not_called_re_ent20#291;
	havoc owner#320;
	havoc redeemableEther_re_ent32#324;
	havoc balances#364;
	havoc balances_re_ent38#368;
	havoc allowed#407;
	havoc redeemableEther_re_ent4#411;
	havoc isTransPaused#450;
	havoc counter_re_ent7#514;
	havoc lastPlayer_re_ent23#622;
	havoc jackpot_re_ent23#624;
	havoc counter_re_ent14#751;
	havoc lastPlayer_re_ent30#821;
	havoc jackpot_re_ent30#823;
	havoc balances_re_ent8#873;
	havoc redeemableEther_re_ent39#918;
	havoc balances_re_ent36#1003;
	havoc counter_re_ent35#1046;
	havoc userBalance_re_ent40#1102;
	havoc userBalance_re_ent33#1147;
	havoc __balance;
	}

	if (!(__call_ret#31)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1147[__this][__msg_sender])];
	}

	success#1151 := __call_ret#31;
	if (!(success#1151)) {
	assume false;
	}

	userBalance_re_ent33#1147 := userBalance_re_ent33#1147[__this := userBalance_re_ent33#1147[__this][__msg_sender := 0]];
	$return30:
	// Function body ends here
}

