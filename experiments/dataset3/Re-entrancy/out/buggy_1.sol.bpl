// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_1.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: EIP20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_1.sol", 74, 3} {:message "[event] EIP20Interface::Transfer"} Transfer#258(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#252: address_t, _to#254: address_t, _value#256: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_1.sol", 84, 3} {:message "[event] EIP20Interface::Approval"} Approval#301(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#295: address_t, _spender#297: address_t, _value#299: int)
{
	
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_1.sol", 16, 5} {:message "totalSupply"} totalSupply#3: [address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 18, 5} {:message "EIP20Interface::balanceOf"} balanceOf#10(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#5: address_t)
	returns (balance#8: int);
	modifies totalSupply#3, counter_re_ent7#13, lastPlayer_re_ent23#53, jackpot_re_ent23#55, counter_re_ent14#99, lastPlayer_re_ent30#139, jackpot_re_ent30#141, balances_re_ent8#184, balances_re_ent31#217, not_called_re_ent13#261;

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_1.sol", 19, 1} {:message "counter_re_ent7"} counter_re_ent7#13: [address_t]int;
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
procedure {:sourceloc "buggy_1.sol", 20, 1} {:message "EIP20Interface::callme_re_ent7"} callme_re_ent7#42(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#13[__this] <= 5);
	call_arg#0 := 10000000000000000000;
	assume {:sourceloc "buggy_1.sol", 22, 9} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	assume false;
	}

	counter_re_ent7#13 := counter_re_ent7#13[__this := (counter_re_ent7#13[__this] + 1)];
	$return0:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 28, 5} {:message "EIP20Interface::transfer"} transfer#51(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#44: address_t, _value#46: int)
	returns (success#49: bool);
	modifies totalSupply#3, counter_re_ent7#13, lastPlayer_re_ent23#53, jackpot_re_ent23#55, counter_re_ent14#99, lastPlayer_re_ent30#139, jackpot_re_ent30#141, balances_re_ent8#184, balances_re_ent31#217, not_called_re_ent13#261;

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_1.sol", 29, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#53: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_1.sol", 30, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#55: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_1.sol", 31, 4} {:message "EIP20Interface::buyTicket_re_ent23"} buyTicket_re_ent23#85(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_1.sol", 32, 12} {:message ""} true;
	call __send_ret#2 := __send(lastPlayer_re_ent23#53[__this], __this, 0, jackpot_re_ent23#55[__this]);
	if (!(__send_ret#2)) {
	assume false;
	}

	lastPlayer_re_ent23#53 := lastPlayer_re_ent23#53[__this := __msg_sender];
	jackpot_re_ent23#55 := jackpot_re_ent23#55[__this := __balance[__this]];
	$return1:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 38, 5} {:message "EIP20Interface::transferFrom"} transferFrom#96(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#87: address_t, _to#89: address_t, _value#91: int)
	returns (success#94: bool);
	modifies totalSupply#3, counter_re_ent7#13, lastPlayer_re_ent23#53, jackpot_re_ent23#55, counter_re_ent14#99, lastPlayer_re_ent30#139, jackpot_re_ent30#141, balances_re_ent8#184, balances_re_ent31#217, not_called_re_ent13#261;

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_1.sol", 39, 1} {:message "counter_re_ent14"} counter_re_ent14#99: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_1.sol", 40, 1} {:message "EIP20Interface::callme_re_ent14"} callme_re_ent14#128(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#99[__this] <= 5);
	call_arg#3 := 10000000000000000000;
	assume {:sourceloc "buggy_1.sol", 42, 9} {:message ""} true;
	call __send_ret#4 := __send(__msg_sender, __this, 0, call_arg#3);
	if (!(__send_ret#4)) {
	assume false;
	}

	counter_re_ent14#99 := counter_re_ent14#99[__this := (counter_re_ent14#99[__this] + 1)];
	$return2:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 48, 5} {:message "EIP20Interface::approve"} approve#137(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#130: address_t, _value#132: int)
	returns (success#135: bool);
	modifies totalSupply#3, counter_re_ent7#13, lastPlayer_re_ent23#53, jackpot_re_ent23#55, counter_re_ent14#99, lastPlayer_re_ent30#139, jackpot_re_ent30#141, balances_re_ent8#184, balances_re_ent31#217, not_called_re_ent13#261;

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_1.sol", 49, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#139: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_1.sol", 50, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#141: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_1.sol", 51, 4} {:message "EIP20Interface::buyTicket_re_ent30"} buyTicket_re_ent30#171(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_1.sol", 52, 12} {:message ""} true;
	call __send_ret#5 := __send(lastPlayer_re_ent30#139[__this], __this, 0, jackpot_re_ent30#141[__this]);
	if (!(__send_ret#5)) {
	assume false;
	}

	lastPlayer_re_ent30#139 := lastPlayer_re_ent30#139[__this := __msg_sender];
	jackpot_re_ent30#141 := jackpot_re_ent30#141[__this := __balance[__this]];
	$return3:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 58, 5} {:message "EIP20Interface::allowance"} allowance#180(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#173: address_t, _spender#175: address_t)
	returns (remaining#178: int);
	modifies totalSupply#3, counter_re_ent7#13, lastPlayer_re_ent23#53, jackpot_re_ent23#55, counter_re_ent14#99, lastPlayer_re_ent30#139, jackpot_re_ent30#141, balances_re_ent8#184, balances_re_ent31#217, not_called_re_ent13#261;

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 59, 1} {:message "balances_re_ent8"} balances_re_ent8#184: [address_t][address_t]int;
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
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_1.sol", 60, 5} {:message "EIP20Interface::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#213(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 61, 9} {:message "success"} success#188: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#184[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#184[__this][__msg_sender])];
	assume {:sourceloc "buggy_1.sol", 61, 26} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, balances_re_ent8#184[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc totalSupply#3;
	havoc counter_re_ent7#13;
	havoc lastPlayer_re_ent23#53;
	havoc jackpot_re_ent23#55;
	havoc counter_re_ent14#99;
	havoc lastPlayer_re_ent30#139;
	havoc jackpot_re_ent30#141;
	havoc balances_re_ent8#184;
	havoc balances_re_ent31#217;
	havoc not_called_re_ent13#261;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#184[__this][__msg_sender])];
	}

	success#188 := __call_ret#6;
	if (success#188) {
	balances_re_ent8#184 := balances_re_ent8#184[__this := balances_re_ent8#184[__this][__msg_sender := 0]];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 67, 3} {:message "balances_re_ent31"} balances_re_ent31#217: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 68, 1} {:message "EIP20Interface::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#250(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#219: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#217[__this][__msg_sender] >= _weiToWithdraw#219);
	assume {:sourceloc "buggy_1.sol", 71, 25} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, _weiToWithdraw#219);
	assume __send_ret#8;
	balances_re_ent31#217 := balances_re_ent31#217[__this := balances_re_ent31#217[__this][__msg_sender := (balances_re_ent31#217[__this][__msg_sender] - _weiToWithdraw#219)]];
	$return5:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_1.sol", 75, 3} {:message "not_called_re_ent13"} not_called_re_ent13#261: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_1.sol", 76, 1} {:message "EIP20Interface::bug_re_ent13"} bug_re_ent13#293(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 78, 18} {:message "success"} success#269: bool;
	var __call_ret#9: bool;
	var __call_ret#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#261[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_1.sol", 78, 33} {:message ""} true;
	call __call_ret#9, __call_ret#10 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#9) {
	havoc totalSupply#3;
	havoc counter_re_ent7#13;
	havoc lastPlayer_re_ent23#53;
	havoc jackpot_re_ent23#55;
	havoc counter_re_ent14#99;
	havoc lastPlayer_re_ent30#139;
	havoc jackpot_re_ent30#141;
	havoc balances_re_ent8#184;
	havoc balances_re_ent31#217;
	havoc not_called_re_ent13#261;
	havoc __balance;
	}

	if (!(__call_ret#9)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#269 := __call_ret#9;
	if (!(success#269)) {
	assume false;
	}

	not_called_re_ent13#261 := not_called_re_ent13#261[__this := false];
	$return6:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "buggy_1.sol", 6, 1} {:message "EIP20Interface::[implicit_constructor]"} __constructor#302(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	totalSupply#3 := totalSupply#3[__this := 0];
	counter_re_ent7#13 := counter_re_ent7#13[__this := 0];
	lastPlayer_re_ent23#53 := lastPlayer_re_ent23#53[__this := 0];
	jackpot_re_ent23#55 := jackpot_re_ent23#55[__this := 0];
	counter_re_ent14#99 := counter_re_ent14#99[__this := 0];
	lastPlayer_re_ent30#139 := lastPlayer_re_ent30#139[__this := 0];
	jackpot_re_ent30#141 := jackpot_re_ent30#141[__this := 0];
	balances_re_ent8#184 := balances_re_ent8#184[__this := default_address_t_int()];
	balances_re_ent31#217 := balances_re_ent31#217[__this := default_address_t_int()];
	not_called_re_ent13#261 := not_called_re_ent13#261[__this := true];
}

// 
// ------- Contract: HotDollarsToken -------
// Inherits from: EIP20Interface
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 89, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#315: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_1.sol", 90, 1} {:message "HotDollarsToken::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#349(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 93, 10} {:message "success"} success#319: bool;
	var __call_ret#11: bool;
	var __call_ret#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#315[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#315[__this][__msg_sender])];
	assume {:sourceloc "buggy_1.sol", 93, 26} {:message ""} true;
	call __call_ret#11, __call_ret#12 := __call(__msg_sender, __this, userBalance_re_ent26#315[__this][__msg_sender]);
	if (__call_ret#11) {
	havoc userBalance_re_ent26#315;
	havoc balances#353;
	havoc not_called_re_ent20#356;
	havoc allowed#389;
	havoc redeemableEther_re_ent32#393;
	havoc name#431;
	havoc balances_re_ent38#435;
	havoc decimals#470;
	havoc redeemableEther_re_ent4#474;
	havoc symbol#512;
	havoc redeemableEther_re_ent39#545;
	havoc balances_re_ent36#627;
	havoc counter_re_ent35#721;
	havoc userBalance_re_ent40#767;
	havoc userBalance_re_ent33#834;
	havoc not_called_re_ent27#888;
	havoc totalSupply#3;
	havoc counter_re_ent7#13;
	havoc lastPlayer_re_ent23#53;
	havoc jackpot_re_ent23#55;
	havoc counter_re_ent14#99;
	havoc lastPlayer_re_ent30#139;
	havoc jackpot_re_ent30#141;
	havoc balances_re_ent8#184;
	havoc balances_re_ent31#217;
	havoc not_called_re_ent13#261;
	havoc __balance;
	}

	if (!(__call_ret#11)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#315[__this][__msg_sender])];
	}

	success#319 := __call_ret#11;
	if (!(success#319)) {
	assume false;
	}

	userBalance_re_ent26#315 := userBalance_re_ent26#315[__this := userBalance_re_ent26#315[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 99, 3} {:message "balances"} balances#353: [address_t][address_t]int;
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_1.sol", 100, 3} {:message "not_called_re_ent20"} not_called_re_ent20#356: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_1.sol", 101, 1} {:message "HotDollarsToken::bug_re_ent20"} bug_re_ent20#383(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#356[__this];
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 103, 16} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	assume false;
	}

	not_called_re_ent20#356 := not_called_re_ent20#356[__this := false];
	$return8:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_1.sol", 108, 3} {:message "allowed"} allowed#389: [address_t][address_t][address_t]int;
// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 115, 3} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#393: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_1.sol", 116, 1} {:message "HotDollarsToken::claimReward_re_ent32"} claimReward_re_ent32#429(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 119, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#406: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#393[__this][__msg_sender] > 0);
	transferValue_re_ent32#406 := redeemableEther_re_ent32#393[__this][__msg_sender];
	assume {:sourceloc "buggy_1.sol", 120, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#406);
	redeemableEther_re_ent32#393 := redeemableEther_re_ent32#393[__this := redeemableEther_re_ent32#393[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_1.sol", 123, 3} {:message "name"} name#431: [address_t]int_arr_type;
// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 124, 3} {:message "balances_re_ent38"} balances_re_ent38#435: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_1.sol", 125, 1} {:message "HotDollarsToken::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#468(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#437: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#435[__this][__msg_sender] >= _weiToWithdraw#437);
	assume {:sourceloc "buggy_1.sol", 128, 13} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, _weiToWithdraw#437);
	assume __send_ret#15;
	balances_re_ent38#435 := balances_re_ent38#435[__this := balances_re_ent38#435[__this][__msg_sender := (balances_re_ent38#435[__this][__msg_sender] - _weiToWithdraw#437)]];
	$return10:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_1.sol", 131, 3} {:message "decimals"} decimals#470: [address_t]int;
// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 132, 3} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#474: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_1.sol", 133, 1} {:message "HotDollarsToken::claimReward_re_ent4"} claimReward_re_ent4#510(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 136, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#487: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#474[__this][__msg_sender] > 0);
	transferValue_re_ent4#487 := redeemableEther_re_ent4#474[__this][__msg_sender];
	assume {:sourceloc "buggy_1.sol", 137, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#487);
	redeemableEther_re_ent4#474 := redeemableEther_re_ent4#474[__this := redeemableEther_re_ent4#474[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_1.sol", 140, 3} {:message "symbol"} symbol#512: [address_t]int_arr_type;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_1.sol", 142, 5} {:message "HotDollarsToken::[constructor]"} __constructor#916(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent26#315 := userBalance_re_ent26#315[__this := default_address_t_int()];
	balances#353 := balances#353[__this := default_address_t_int()];
	not_called_re_ent20#356 := not_called_re_ent20#356[__this := true];
	allowed#389 := allowed#389[__this := default_address_t__k_address_t_v_int()];
	redeemableEther_re_ent32#393 := redeemableEther_re_ent32#393[__this := default_address_t_int()];
	name#431 := name#431[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent38#435 := balances_re_ent38#435[__this := default_address_t_int()];
	decimals#470 := decimals#470[__this := 0];
	redeemableEther_re_ent4#474 := redeemableEther_re_ent4#474[__this := default_address_t_int()];
	symbol#512 := symbol#512[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent39#545 := redeemableEther_re_ent39#545[__this := default_address_t_int()];
	balances_re_ent36#627 := balances_re_ent36#627[__this := default_address_t_int()];
	counter_re_ent35#721 := counter_re_ent35#721[__this := 0];
	userBalance_re_ent40#767 := userBalance_re_ent40#767[__this := default_address_t_int()];
	userBalance_re_ent33#834 := userBalance_re_ent33#834[__this := default_address_t_int()];
	not_called_re_ent27#888 := not_called_re_ent27#888[__this := true];
	totalSupply#3 := totalSupply#3[__this := 0];
	counter_re_ent7#13 := counter_re_ent7#13[__this := 0];
	lastPlayer_re_ent23#53 := lastPlayer_re_ent23#53[__this := 0];
	jackpot_re_ent23#55 := jackpot_re_ent23#55[__this := 0];
	counter_re_ent14#99 := counter_re_ent14#99[__this := 0];
	lastPlayer_re_ent30#139 := lastPlayer_re_ent30#139[__this := 0];
	jackpot_re_ent30#141 := jackpot_re_ent30#141[__this := 0];
	balances_re_ent8#184 := balances_re_ent8#184[__this := default_address_t_int()];
	balances_re_ent31#217 := balances_re_ent31#217[__this := default_address_t_int()];
	not_called_re_ent13#261 := not_called_re_ent13#261[__this := true];
	// Function body starts here
	totalSupply#3 := totalSupply#3[__this := 30000000000000000000000000000];
	name#431 := name#431[__this := int_arr#constr(default_int_int()[0 := 72][1 := 111][2 := 116][3 := 68][4 := 111][5 := 108][6 := 108][7 := 97][8 := 114][9 := 115][10 := 32][11 := 84][12 := 111][13 := 107][14 := 101][15 := 110], 16)];
	decimals#470 := decimals#470[__this := 18];
	symbol#512 := symbol#512[__this := int_arr#constr(default_int_int()[0 := 72][1 := 68][2 := 83], 3)];
	balances#353 := balances#353[__this := balances#353[__this][__msg_sender := totalSupply#3[__this]]];
	$return12:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 149, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#545: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_1.sol", 150, 1} {:message "HotDollarsToken::claimReward_re_ent39"} claimReward_re_ent39#581(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 153, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#558: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#545[__this][__msg_sender] > 0);
	transferValue_re_ent39#558 := redeemableEther_re_ent39#545[__this][__msg_sender];
	assume {:sourceloc "buggy_1.sol", 154, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#558);
	redeemableEther_re_ent39#545 := redeemableEther_re_ent39#545[__this := redeemableEther_re_ent39#545[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 158, 5} {:message "HotDollarsToken::transfer"} transfer#623(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#583: address_t, _value#585: int)
	returns (success#589: bool)
{
	var call_arg#16: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#353[__this][__msg_sender] >= _value#585);
	balances#353 := balances#353[__this := balances#353[__this][__msg_sender := (balances#353[__this][__msg_sender] - _value#585)]];
	balances#353 := balances#353[__this := balances#353[__this][_to#583 := (balances#353[__this][_to#583] + _value#585)]];
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 162, 14} {:message ""} true;
	call Transfer#258(__this, __msg_sender, __msg_value, call_arg#16, _to#583, _value#585);
	success#589 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 165, 1} {:message "balances_re_ent36"} balances_re_ent36#627: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_1.sol", 166, 5} {:message "HotDollarsToken::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#650(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_1.sol", 167, 13} {:message ""} true;
	call __send_ret#17 := __send(__msg_sender, __this, 0, balances_re_ent36#627[__this][__msg_sender]);
	if (__send_ret#17) {
	balances_re_ent36#627 := balances_re_ent36#627[__this := balances_re_ent36#627[__this][__msg_sender := 0]];
	}

	$return15:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 171, 5} {:message "HotDollarsToken::transferFrom"} transferFrom#718(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#652: address_t, _to#654: address_t, _value#656: int)
	returns (success#660: bool)
{
	var {:sourceloc "buggy_1.sol", 172, 9} {:message "allowedAmount"} allowedAmount#663: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowedAmount#663 := allowed#389[__this][_from#652][__msg_sender];
	assume ((balances#353[__this][_from#652] >= _value#656) && (allowedAmount#663 >= _value#656));
	balances#353 := balances#353[__this := balances#353[__this][_to#654 := (balances#353[__this][_to#654] + _value#656)]];
	balances#353 := balances#353[__this := balances#353[__this][_from#652 := (balances#353[__this][_from#652] - _value#656)]];
	if ((allowedAmount#663 < 115792089237316195423570985008687907853269984665640564039457584007913129639935)) {
	allowed#389 := allowed#389[__this := allowed#389[__this][_from#652 := allowed#389[__this][_from#652][__msg_sender := (allowed#389[__this][_from#652][__msg_sender] - _value#656)]]];
	}

	assume {:sourceloc "buggy_1.sol", 179, 14} {:message ""} true;
	call Transfer#258(__this, __msg_sender, __msg_value, _from#652, _to#654, _value#656);
	success#660 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_1.sol", 182, 1} {:message "counter_re_ent35"} counter_re_ent35#721: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_1.sol", 183, 1} {:message "HotDollarsToken::callme_re_ent35"} callme_re_ent35#750(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#721[__this] <= 5);
	call_arg#18 := 10000000000000000000;
	assume {:sourceloc "buggy_1.sol", 185, 9} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	assume false;
	}

	counter_re_ent35#721 := counter_re_ent35#721[__this := (counter_re_ent35#721[__this] + 1)];
	$return17:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 191, 5} {:message "HotDollarsToken::balanceOf"} balanceOf#763(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#752: address_t)
	returns (balance#756: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#756 := balances#353[__this][_owner#752];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 194, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#767: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_1.sol", 195, 1} {:message "HotDollarsToken::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#801(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 198, 10} {:message "success"} success#771: bool;
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#767[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#767[__this][__msg_sender])];
	assume {:sourceloc "buggy_1.sol", 198, 25} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(__msg_sender, __this, userBalance_re_ent40#767[__this][__msg_sender]);
	if (__call_ret#20) {
	havoc userBalance_re_ent26#315;
	havoc balances#353;
	havoc not_called_re_ent20#356;
	havoc allowed#389;
	havoc redeemableEther_re_ent32#393;
	havoc name#431;
	havoc balances_re_ent38#435;
	havoc decimals#470;
	havoc redeemableEther_re_ent4#474;
	havoc symbol#512;
	havoc redeemableEther_re_ent39#545;
	havoc balances_re_ent36#627;
	havoc counter_re_ent35#721;
	havoc userBalance_re_ent40#767;
	havoc userBalance_re_ent33#834;
	havoc not_called_re_ent27#888;
	havoc totalSupply#3;
	havoc counter_re_ent7#13;
	havoc lastPlayer_re_ent23#53;
	havoc jackpot_re_ent23#55;
	havoc counter_re_ent14#99;
	havoc lastPlayer_re_ent30#139;
	havoc jackpot_re_ent30#141;
	havoc balances_re_ent8#184;
	havoc balances_re_ent31#217;
	havoc not_called_re_ent13#261;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#767[__this][__msg_sender])];
	}

	success#771 := __call_ret#20;
	if (!(success#771)) {
	assume false;
	}

	userBalance_re_ent40#767 := userBalance_re_ent40#767[__this := userBalance_re_ent40#767[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 205, 5} {:message "HotDollarsToken::approve"} approve#830(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#803: address_t, _value#805: int)
	returns (success#809: bool)
{
	var call_arg#22: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#389 := allowed#389[__this := allowed#389[__this][__msg_sender := allowed#389[__this][__msg_sender][_spender#803 := _value#805]]];
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 207, 14} {:message ""} true;
	call Approval#301(__this, __msg_sender, __msg_value, call_arg#22, _spender#803, _value#805);
	success#809 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 210, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#834: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_1.sol", 211, 1} {:message "HotDollarsToken::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#868(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_1.sol", 214, 10} {:message "success"} success#838: bool;
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#834[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#834[__this][__msg_sender])];
	assume {:sourceloc "buggy_1.sol", 214, 26} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(__msg_sender, __this, userBalance_re_ent33#834[__this][__msg_sender]);
	if (__call_ret#23) {
	havoc userBalance_re_ent26#315;
	havoc balances#353;
	havoc not_called_re_ent20#356;
	havoc allowed#389;
	havoc redeemableEther_re_ent32#393;
	havoc name#431;
	havoc balances_re_ent38#435;
	havoc decimals#470;
	havoc redeemableEther_re_ent4#474;
	havoc symbol#512;
	havoc redeemableEther_re_ent39#545;
	havoc balances_re_ent36#627;
	havoc counter_re_ent35#721;
	havoc userBalance_re_ent40#767;
	havoc userBalance_re_ent33#834;
	havoc not_called_re_ent27#888;
	havoc totalSupply#3;
	havoc counter_re_ent7#13;
	havoc lastPlayer_re_ent23#53;
	havoc jackpot_re_ent23#55;
	havoc counter_re_ent14#99;
	havoc lastPlayer_re_ent30#139;
	havoc jackpot_re_ent30#141;
	havoc balances_re_ent8#184;
	havoc balances_re_ent31#217;
	havoc not_called_re_ent13#261;
	havoc __balance;
	}

	if (!(__call_ret#23)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#834[__this][__msg_sender])];
	}

	success#838 := __call_ret#23;
	if (!(success#838)) {
	assume false;
	}

	userBalance_re_ent33#834 := userBalance_re_ent33#834[__this := userBalance_re_ent33#834[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 221, 5} {:message "HotDollarsToken::allowance"} allowance#885(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#870: address_t, _spender#872: address_t)
	returns (remaining#876: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#876 := allowed#389[__this][_owner#870][_spender#872];
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_1.sol", 224, 1} {:message "not_called_re_ent27"} not_called_re_ent27#888: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_1.sol", 225, 1} {:message "HotDollarsToken::bug_re_ent27"} bug_re_ent27#915(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#888[__this];
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 227, 16} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, call_arg#25);
	if (!(__send_ret#26)) {
	assume false;
	}

	not_called_re_ent27#888 := not_called_re_ent27#888[__this := false];
	$return23:
	// Function body ends here
}

