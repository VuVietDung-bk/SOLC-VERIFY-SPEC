// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_4.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_4.sol", 21, 5} {:message "[event] IERC20::Transfer"} Transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, from#25: address_t, to#27: address_t, value#29: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_4.sol", 18, 5} {:message "IERC20::totalSupply"} totalSupply#7(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#5: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_4.sol", 19, 5} {:message "IERC20::balanceOf"} balanceOf#14(__this: address_t, __msg_sender: address_t, __msg_value: int, who#9: address_t)
	returns (#12: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_4.sol", 20, 5} {:message "IERC20::transfer"} transfer#23(__this: address_t, __msg_sender: address_t, __msg_value: int, to#16: address_t, value#18: int)
	returns (#21: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_4.sol", 17, 1} {:message "IERC20::[implicit_constructor]"} __constructor#32(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: PHO -------
// Inherits from: IERC20
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 29, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#39: [address_t][address_t]int;
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
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_4.sol", 30, 1} {:message "PHO::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#73(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 33, 10} {:message "success"} success#43: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#39[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#39[__this][__msg_sender])];
	assume {:sourceloc "buggy_4.sol", 33, 26} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, userBalance_re_ent26#39[__this][__msg_sender]);
	if (__call_ret#0) {
	havoc userBalance_re_ent26#39;
	havoc name#76;
	havoc not_called_re_ent20#79;
	havoc symbol#109;
	havoc redeemableEther_re_ent32#113;
	havoc decimals#152;
	havoc balances_re_ent38#156;
	havoc saleAmount#191;
	havoc redeemableEther_re_ent4#195;
	havoc evtAmount#233;
	havoc counter_re_ent7#236;
	havoc teamAmount#267;
	havoc lastPlayer_re_ent23#269;
	havoc jackpot_re_ent23#271;
	havoc _totalSupply#303;
	havoc counter_re_ent14#306;
	havoc balances#339;
	havoc lastPlayer_re_ent30#341;
	havoc jackpot_re_ent30#343;
	havoc owner#375;
	havoc balances_re_ent8#379;
	havoc sale#410;
	havoc redeemableEther_re_ent39#414;
	havoc evt#452;
	havoc balances_re_ent36#456;
	havoc team#481;
	havoc counter_re_ent35#590;
	havoc userBalance_re_ent40#632;
	havoc userBalance_re_ent33#683;
	havoc not_called_re_ent27#854;
	havoc balances_re_ent31#927;
	havoc not_called_re_ent13#976;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#39[__this][__msg_sender])];
	}

	success#43 := __call_ret#0;
	if (!(success#43)) {
	assume false;
	}

	userBalance_re_ent26#39 := userBalance_re_ent26#39[__this := userBalance_re_ent26#39[__this][__msg_sender := 0]];
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_4.sol", 39, 3} {:message "name"} name#76: [address_t]int_arr_type;
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_4.sol", 40, 3} {:message "not_called_re_ent20"} not_called_re_ent20#79: [address_t]bool;
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
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_4.sol", 41, 1} {:message "PHO::bug_re_ent20"} bug_re_ent20#106(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#79[__this];
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 43, 16} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, call_arg#2);
	if (!(__send_ret#3)) {
	assume false;
	}

	not_called_re_ent20#79 := not_called_re_ent20#79[__this := false];
	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_4.sol", 48, 3} {:message "symbol"} symbol#109: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 49, 3} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#113: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_4.sol", 50, 1} {:message "PHO::claimReward_re_ent32"} claimReward_re_ent32#149(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 53, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#126: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#113[__this][__msg_sender] > 0);
	transferValue_re_ent32#126 := redeemableEther_re_ent32#113[__this][__msg_sender];
	assume {:sourceloc "buggy_4.sol", 54, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#126);
	redeemableEther_re_ent32#113 := redeemableEther_re_ent32#113[__this := redeemableEther_re_ent32#113[__this][__msg_sender := 0]];
	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_4.sol", 57, 3} {:message "decimals"} decimals#152: [address_t]int;
// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 59, 3} {:message "balances_re_ent38"} balances_re_ent38#156: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 60, 1} {:message "PHO::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#189(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#158: int)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#156[__this][__msg_sender] >= _weiToWithdraw#158);
	assume {:sourceloc "buggy_4.sol", 63, 13} {:message ""} true;
	call __send_ret#4 := __send(__msg_sender, __this, 0, _weiToWithdraw#158);
	assume __send_ret#4;
	balances_re_ent38#156 := balances_re_ent38#156[__this := balances_re_ent38#156[__this][__msg_sender := (balances_re_ent38#156[__this][__msg_sender] - _weiToWithdraw#158)]];
	$return3:
	// Function body ends here
}

// 
// State variable: saleAmount: uint256
var {:sourceloc "buggy_4.sol", 66, 3} {:message "saleAmount"} saleAmount#191: [address_t]int;
// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 67, 3} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#195: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_4.sol", 68, 1} {:message "PHO::claimReward_re_ent4"} claimReward_re_ent4#231(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 71, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#208: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#195[__this][__msg_sender] > 0);
	transferValue_re_ent4#208 := redeemableEther_re_ent4#195[__this][__msg_sender];
	assume {:sourceloc "buggy_4.sol", 72, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#208);
	redeemableEther_re_ent4#195 := redeemableEther_re_ent4#195[__this := redeemableEther_re_ent4#195[__this][__msg_sender := 0]];
	$return4:
	// Function body ends here
}

// 
// State variable: evtAmount: uint256
var {:sourceloc "buggy_4.sol", 75, 3} {:message "evtAmount"} evtAmount#233: [address_t]int;
// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_4.sol", 76, 3} {:message "counter_re_ent7"} counter_re_ent7#236: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_4.sol", 77, 1} {:message "PHO::callme_re_ent7"} callme_re_ent7#265(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#236[__this] <= 5);
	call_arg#5 := 10000000000000000000;
	assume {:sourceloc "buggy_4.sol", 79, 9} {:message ""} true;
	call __send_ret#6 := __send(__msg_sender, __this, 0, call_arg#5);
	if (!(__send_ret#6)) {
	assume false;
	}

	counter_re_ent7#236 := counter_re_ent7#236[__this := (counter_re_ent7#236[__this] + 1)];
	$return5:
	// Function body ends here
}

// 
// State variable: teamAmount: uint256
var {:sourceloc "buggy_4.sol", 84, 3} {:message "teamAmount"} teamAmount#267: [address_t]int;
// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_4.sol", 86, 3} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#269: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_4.sol", 87, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#271: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_4.sol", 88, 4} {:message "PHO::buyTicket_re_ent23"} buyTicket_re_ent23#301(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_4.sol", 89, 12} {:message ""} true;
	call __send_ret#7 := __send(lastPlayer_re_ent23#269[__this], __this, 0, jackpot_re_ent23#271[__this]);
	if (!(__send_ret#7)) {
	assume false;
	}

	lastPlayer_re_ent23#269 := lastPlayer_re_ent23#269[__this := __msg_sender];
	jackpot_re_ent23#271 := jackpot_re_ent23#271[__this := __balance[__this]];
	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_4.sol", 94, 3} {:message "_totalSupply"} _totalSupply#303: [address_t]int;
// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_4.sol", 95, 3} {:message "counter_re_ent14"} counter_re_ent14#306: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_4.sol", 96, 1} {:message "PHO::callme_re_ent14"} callme_re_ent14#335(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#306[__this] <= 5);
	call_arg#8 := 10000000000000000000;
	assume {:sourceloc "buggy_4.sol", 98, 9} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, call_arg#8);
	if (!(__send_ret#9)) {
	assume false;
	}

	counter_re_ent14#306 := counter_re_ent14#306[__this := (counter_re_ent14#306[__this] + 1)];
	$return7:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 103, 3} {:message "balances"} balances#339: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_4.sol", 105, 3} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#341: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_4.sol", 106, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#343: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_4.sol", 107, 4} {:message "PHO::buyTicket_re_ent30"} buyTicket_re_ent30#373(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_4.sol", 108, 12} {:message ""} true;
	call __send_ret#10 := __send(lastPlayer_re_ent30#341[__this], __this, 0, jackpot_re_ent30#343[__this]);
	if (!(__send_ret#10)) {
	assume false;
	}

	lastPlayer_re_ent30#341 := lastPlayer_re_ent30#341[__this := __msg_sender];
	jackpot_re_ent30#343 := jackpot_re_ent30#343[__this := __balance[__this]];
	$return8:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_4.sol", 113, 3} {:message "owner"} owner#375: [address_t]address_t;
// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 114, 3} {:message "balances_re_ent8"} balances_re_ent8#379: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_4.sol", 115, 5} {:message "PHO::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#408(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 116, 11} {:message "success"} success#383: bool;
	var __call_ret#11: bool;
	var __call_ret#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#379[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#379[__this][__msg_sender])];
	assume {:sourceloc "buggy_4.sol", 116, 28} {:message ""} true;
	call __call_ret#11, __call_ret#12 := __call(__msg_sender, __this, balances_re_ent8#379[__this][__msg_sender]);
	if (__call_ret#11) {
	havoc userBalance_re_ent26#39;
	havoc name#76;
	havoc not_called_re_ent20#79;
	havoc symbol#109;
	havoc redeemableEther_re_ent32#113;
	havoc decimals#152;
	havoc balances_re_ent38#156;
	havoc saleAmount#191;
	havoc redeemableEther_re_ent4#195;
	havoc evtAmount#233;
	havoc counter_re_ent7#236;
	havoc teamAmount#267;
	havoc lastPlayer_re_ent23#269;
	havoc jackpot_re_ent23#271;
	havoc _totalSupply#303;
	havoc counter_re_ent14#306;
	havoc balances#339;
	havoc lastPlayer_re_ent30#341;
	havoc jackpot_re_ent30#343;
	havoc owner#375;
	havoc balances_re_ent8#379;
	havoc sale#410;
	havoc redeemableEther_re_ent39#414;
	havoc evt#452;
	havoc balances_re_ent36#456;
	havoc team#481;
	havoc counter_re_ent35#590;
	havoc userBalance_re_ent40#632;
	havoc userBalance_re_ent33#683;
	havoc not_called_re_ent27#854;
	havoc balances_re_ent31#927;
	havoc not_called_re_ent13#976;
	havoc __balance;
	}

	if (!(__call_ret#11)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#379[__this][__msg_sender])];
	}

	success#383 := __call_ret#11;
	if (success#383) {
	balances_re_ent8#379 := balances_re_ent8#379[__this := balances_re_ent8#379[__this][__msg_sender := 0]];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: sale: address
var {:sourceloc "buggy_4.sol", 120, 3} {:message "sale"} sale#410: [address_t]address_t;
// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 121, 3} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#414: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_4.sol", 122, 1} {:message "PHO::claimReward_re_ent39"} claimReward_re_ent39#450(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 125, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#427: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#414[__this][__msg_sender] > 0);
	transferValue_re_ent39#427 := redeemableEther_re_ent39#414[__this][__msg_sender];
	assume {:sourceloc "buggy_4.sol", 126, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#427);
	redeemableEther_re_ent39#414 := redeemableEther_re_ent39#414[__this := redeemableEther_re_ent39#414[__this][__msg_sender := 0]];
	$return10:
	// Function body ends here
}

// 
// State variable: evt: address
var {:sourceloc "buggy_4.sol", 129, 3} {:message "evt"} evt#452: [address_t]address_t;
// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 130, 3} {:message "balances_re_ent36"} balances_re_ent36#456: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_4.sol", 131, 5} {:message "PHO::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#479(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_4.sol", 132, 14} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, balances_re_ent36#456[__this][__msg_sender]);
	if (__send_ret#13) {
	balances_re_ent36#456 := balances_re_ent36#456[__this := balances_re_ent36#456[__this][__msg_sender := 0]];
	}

	$return11:
	// Function body ends here
}

// 
// State variable: team: address
var {:sourceloc "buggy_4.sol", 135, 3} {:message "team"} team#481: [address_t]address_t;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
const unique address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561: address_t;
const unique address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6: address_t;
const unique address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_4.sol", 142, 5} {:message "PHO::[constructor]"} __constructor#1009(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	var toWei#973_ret#15: int;
	var call_arg#16: int;
	var toWei#973_ret#17: int;
	var call_arg#18: int;
	var toWei#973_ret#19: int;
	var call_arg#20: int;
	var toWei#973_ret#21: int;
	var call_arg#22: address_t;
	var transfer#851_ret#23: bool;
	var transfer#851_ret#24: bool;
	var transfer#851_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent26#39 := userBalance_re_ent26#39[__this := default_address_t_int()];
	name#76 := name#76[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	not_called_re_ent20#79 := not_called_re_ent20#79[__this := true];
	symbol#109 := symbol#109[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	redeemableEther_re_ent32#113 := redeemableEther_re_ent32#113[__this := default_address_t_int()];
	decimals#152 := decimals#152[__this := 18];
	balances_re_ent38#156 := balances_re_ent38#156[__this := default_address_t_int()];
	saleAmount#191 := saleAmount#191[__this := 0];
	redeemableEther_re_ent4#195 := redeemableEther_re_ent4#195[__this := default_address_t_int()];
	evtAmount#233 := evtAmount#233[__this := 0];
	counter_re_ent7#236 := counter_re_ent7#236[__this := 0];
	teamAmount#267 := teamAmount#267[__this := 0];
	lastPlayer_re_ent23#269 := lastPlayer_re_ent23#269[__this := 0];
	jackpot_re_ent23#271 := jackpot_re_ent23#271[__this := 0];
	_totalSupply#303 := _totalSupply#303[__this := 0];
	counter_re_ent14#306 := counter_re_ent14#306[__this := 0];
	balances#339 := balances#339[__this := default_address_t_int()];
	lastPlayer_re_ent30#341 := lastPlayer_re_ent30#341[__this := 0];
	jackpot_re_ent30#343 := jackpot_re_ent30#343[__this := 0];
	owner#375 := owner#375[__this := 0];
	balances_re_ent8#379 := balances_re_ent8#379[__this := default_address_t_int()];
	sale#410 := sale#410[__this := 0];
	redeemableEther_re_ent39#414 := redeemableEther_re_ent39#414[__this := default_address_t_int()];
	evt#452 := evt#452[__this := 0];
	balances_re_ent36#456 := balances_re_ent36#456[__this := default_address_t_int()];
	team#481 := team#481[__this := 0];
	counter_re_ent35#590 := counter_re_ent35#590[__this := 0];
	userBalance_re_ent40#632 := userBalance_re_ent40#632[__this := default_address_t_int()];
	userBalance_re_ent33#683 := userBalance_re_ent33#683[__this := default_address_t_int()];
	not_called_re_ent27#854 := not_called_re_ent27#854[__this := true];
	balances_re_ent31#927 := balances_re_ent31#927[__this := default_address_t_int()];
	not_called_re_ent13#976 := not_called_re_ent13#976[__this := true];
	// Function body starts here
	owner#375 := owner#375[__this := __msg_sender];
	sale#410 := sale#410[__this := address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561];
	evt#452 := evt#452[__this := address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6];
	team#481 := team#481[__this := address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C];
	call_arg#14 := 1000000000;
	assume {:sourceloc "buggy_4.sol", 148, 25} {:message ""} true;
	call toWei#973_ret#15 := toWei#973(__this, __msg_sender, __msg_value, call_arg#14);
	saleAmount#191 := saleAmount#191[__this := toWei#973_ret#15];
	call_arg#16 := 200000000;
	assume {:sourceloc "buggy_4.sol", 149, 25} {:message ""} true;
	call toWei#973_ret#17 := toWei#973(__this, __msg_sender, __msg_value, call_arg#16);
	evtAmount#233 := evtAmount#233[__this := toWei#973_ret#17];
	call_arg#18 := 800000000;
	assume {:sourceloc "buggy_4.sol", 150, 25} {:message ""} true;
	call toWei#973_ret#19 := toWei#973(__this, __msg_sender, __msg_value, call_arg#18);
	teamAmount#267 := teamAmount#267[__this := toWei#973_ret#19];
	call_arg#20 := 2000000000;
	assume {:sourceloc "buggy_4.sol", 151, 25} {:message ""} true;
	call toWei#973_ret#21 := toWei#973(__this, __msg_sender, __msg_value, call_arg#20);
	_totalSupply#303 := _totalSupply#303[__this := toWei#973_ret#21];
	assume (_totalSupply#303[__this] == ((saleAmount#191[__this] + evtAmount#233[__this]) + teamAmount#267[__this]));
	balances#339 := balances#339[__this := balances#339[__this][owner#375[__this] := _totalSupply#303[__this]]];
	call_arg#22 := 0;
	assume {:sourceloc "buggy_4.sol", 156, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#22, owner#375[__this], balances#339[__this][owner#375[__this]]);
	assume {:sourceloc "buggy_4.sol", 158, 9} {:message ""} true;
	call transfer#851_ret#23 := transfer#851(__this, __msg_sender, __msg_value, sale#410[__this], saleAmount#191[__this]);
	assume {:sourceloc "buggy_4.sol", 159, 9} {:message ""} true;
	call transfer#851_ret#24 := transfer#851(__this, __msg_sender, __msg_value, evt#452[__this], evtAmount#233[__this]);
	assume {:sourceloc "buggy_4.sol", 160, 9} {:message ""} true;
	call transfer#851_ret#25 := transfer#851(__this, __msg_sender, __msg_value, team#481[__this], teamAmount#267[__this]);
	assume (balances#339[__this][owner#375[__this]] == 0);
	$return12:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_4.sol", 163, 1} {:message "counter_re_ent35"} counter_re_ent35#590: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_4.sol", 164, 1} {:message "PHO::callme_re_ent35"} callme_re_ent35#619(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#590[__this] <= 5);
	call_arg#26 := 10000000000000000000;
	assume {:sourceloc "buggy_4.sol", 166, 9} {:message ""} true;
	call __send_ret#27 := __send(__msg_sender, __this, 0, call_arg#26);
	if (!(__send_ret#27)) {
	assume false;
	}

	counter_re_ent35#590 := counter_re_ent35#590[__this := (counter_re_ent35#590[__this] + 1)];
	$return13:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 172, 5} {:message "PHO::totalSupply"} totalSupply#628(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#623: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#623 := _totalSupply#303[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 175, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#632: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_4.sol", 176, 1} {:message "PHO::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#666(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 179, 10} {:message "success"} success#636: bool;
	var __call_ret#28: bool;
	var __call_ret#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#632[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#632[__this][__msg_sender])];
	assume {:sourceloc "buggy_4.sol", 179, 25} {:message ""} true;
	call __call_ret#28, __call_ret#29 := __call(__msg_sender, __this, userBalance_re_ent40#632[__this][__msg_sender]);
	if (__call_ret#28) {
	havoc userBalance_re_ent26#39;
	havoc name#76;
	havoc not_called_re_ent20#79;
	havoc symbol#109;
	havoc redeemableEther_re_ent32#113;
	havoc decimals#152;
	havoc balances_re_ent38#156;
	havoc saleAmount#191;
	havoc redeemableEther_re_ent4#195;
	havoc evtAmount#233;
	havoc counter_re_ent7#236;
	havoc teamAmount#267;
	havoc lastPlayer_re_ent23#269;
	havoc jackpot_re_ent23#271;
	havoc _totalSupply#303;
	havoc counter_re_ent14#306;
	havoc balances#339;
	havoc lastPlayer_re_ent30#341;
	havoc jackpot_re_ent30#343;
	havoc owner#375;
	havoc balances_re_ent8#379;
	havoc sale#410;
	havoc redeemableEther_re_ent39#414;
	havoc evt#452;
	havoc balances_re_ent36#456;
	havoc team#481;
	havoc counter_re_ent35#590;
	havoc userBalance_re_ent40#632;
	havoc userBalance_re_ent33#683;
	havoc not_called_re_ent27#854;
	havoc balances_re_ent31#927;
	havoc not_called_re_ent13#976;
	havoc __balance;
	}

	if (!(__call_ret#28)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#632[__this][__msg_sender])];
	}

	success#636 := __call_ret#28;
	if (!(success#636)) {
	assume false;
	}

	userBalance_re_ent40#632 := userBalance_re_ent40#632[__this := userBalance_re_ent40#632[__this][__msg_sender := 0]];
	$return15:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 186, 5} {:message "PHO::balanceOf"} balanceOf#679(__this: address_t, __msg_sender: address_t, __msg_value: int, who#668: address_t)
	returns (#672: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#672 := balances#339[__this][who#668];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 189, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#683: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_4.sol", 190, 1} {:message "PHO::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#717(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 193, 10} {:message "success"} success#687: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#683[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#683[__this][__msg_sender])];
	assume {:sourceloc "buggy_4.sol", 193, 26} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(__msg_sender, __this, userBalance_re_ent33#683[__this][__msg_sender]);
	if (__call_ret#30) {
	havoc userBalance_re_ent26#39;
	havoc name#76;
	havoc not_called_re_ent20#79;
	havoc symbol#109;
	havoc redeemableEther_re_ent32#113;
	havoc decimals#152;
	havoc balances_re_ent38#156;
	havoc saleAmount#191;
	havoc redeemableEther_re_ent4#195;
	havoc evtAmount#233;
	havoc counter_re_ent7#236;
	havoc teamAmount#267;
	havoc lastPlayer_re_ent23#269;
	havoc jackpot_re_ent23#271;
	havoc _totalSupply#303;
	havoc counter_re_ent14#306;
	havoc balances#339;
	havoc lastPlayer_re_ent30#341;
	havoc jackpot_re_ent30#343;
	havoc owner#375;
	havoc balances_re_ent8#379;
	havoc sale#410;
	havoc redeemableEther_re_ent39#414;
	havoc evt#452;
	havoc balances_re_ent36#456;
	havoc team#481;
	havoc counter_re_ent35#590;
	havoc userBalance_re_ent40#632;
	havoc userBalance_re_ent33#683;
	havoc not_called_re_ent27#854;
	havoc balances_re_ent31#927;
	havoc not_called_re_ent13#976;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#683[__this][__msg_sender])];
	}

	success#687 := __call_ret#30;
	if (!(success#687)) {
	assume false;
	}

	userBalance_re_ent33#683 := userBalance_re_ent33#683[__this := userBalance_re_ent33#683[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_4.sol", 200, 5} {:message "PHO::transfer"} transfer#851(__this: address_t, __msg_sender: address_t, __msg_value: int, to#719: address_t, value#721: int)
	returns (success#725: bool)
{
	var call_arg#32: int;
	var toWei#973_ret#33: int;
	var call_arg#34: int;
	var toWei#973_ret#35: int;
	var call_arg#36: int;
	var toWei#973_ret#37: int;
	var call_arg#38: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender != to#719);
	assume (value#721 > 0);
	assume (balances#339[__this][__msg_sender] >= value#721);
	assume ((balances#339[__this][to#719] + value#721) >= balances#339[__this][to#719]);
	if ((__msg_sender == team#481[__this])) {
	assume (__block_timestamp >= 1589036400);
	call_arg#32 := 600000000;
	assume {:sourceloc "buggy_4.sol", 209, 47} {:message ""} true;
	call toWei#973_ret#33 := toWei#973(__this, __msg_sender, __msg_value, call_arg#32);
	if (((balances#339[__this][__msg_sender] - value#721) < toWei#973_ret#33)) {
	assume (__block_timestamp >= 1620572400);
	}

	call_arg#34 := 400000000;
	assume {:sourceloc "buggy_4.sol", 211, 47} {:message ""} true;
	call toWei#973_ret#35 := toWei#973(__this, __msg_sender, __msg_value, call_arg#34);
	if (((balances#339[__this][__msg_sender] - value#721) < toWei#973_ret#35)) {
	assume (__block_timestamp >= 1652108400);
	}

	call_arg#36 := 200000000;
	assume {:sourceloc "buggy_4.sol", 213, 47} {:message ""} true;
	call toWei#973_ret#37 := toWei#973(__this, __msg_sender, __msg_value, call_arg#36);
	if (((balances#339[__this][__msg_sender] - value#721) < toWei#973_ret#37)) {
	assume (__block_timestamp >= 1683644400);
	}

	}

	balances#339 := balances#339[__this := balances#339[__this][__msg_sender := (balances#339[__this][__msg_sender] - value#721)]];
	balances#339 := balances#339[__this := balances#339[__this][to#719 := (balances#339[__this][to#719] + value#721)]];
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_4.sol", 220, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#38, to#719, value#721);
	success#725 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_4.sol", 223, 1} {:message "not_called_re_ent27"} not_called_re_ent27#854: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_4.sol", 224, 1} {:message "PHO::bug_re_ent27"} bug_re_ent27#881(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#854[__this];
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 226, 16} {:message ""} true;
	call __send_ret#40 := __send(__msg_sender, __this, 0, call_arg#39);
	if (!(__send_ret#40)) {
	assume false;
	}

	not_called_re_ent27#854 := not_called_re_ent27#854[__this := false];
	$return19:
	// Function body ends here
}

// 
// Function: burnCoins : function (uint256)
procedure {:sourceloc "buggy_4.sol", 232, 5} {:message "PHO::burnCoins"} burnCoins#923(__this: address_t, __msg_sender: address_t, __msg_value: int, value#883: int)
{
	var call_arg#41: address_t;
	var call_arg#42: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#339[__this][__msg_sender] >= value#883);
	assume (_totalSupply#303[__this] >= value#883);
	balances#339 := balances#339[__this := balances#339[__this][__msg_sender := (balances#339[__this][__msg_sender] - value#883)]];
	_totalSupply#303 := _totalSupply#303[__this := (_totalSupply#303[__this] - value#883)];
	call_arg#41 := __msg_sender;
	call_arg#42 := 0;
	assume {:sourceloc "buggy_4.sol", 239, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#41, call_arg#42, value#883);
	$return20:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 241, 1} {:message "balances_re_ent31"} balances_re_ent31#927: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_4.sol", 242, 1} {:message "PHO::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#960(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#929: int)
{
	var __send_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#927[__this][__msg_sender] >= _weiToWithdraw#929);
	assume {:sourceloc "buggy_4.sol", 245, 13} {:message ""} true;
	call __send_ret#43 := __send(__msg_sender, __this, 0, _weiToWithdraw#929);
	assume __send_ret#43;
	balances_re_ent31#927 := balances_re_ent31#927[__this := balances_re_ent31#927[__this][__msg_sender := (balances_re_ent31#927[__this][__msg_sender] - _weiToWithdraw#929)]];
	$return21:
	// Function body ends here
}

// 
// Function: toWei : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_4.sol", 253, 5} {:message "PHO::toWei"} toWei#973(__this: address_t, __msg_sender: address_t, __msg_value: int, value#963: int)
	returns (#966: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#966 := (value#963 * 1000000000000000000);
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_4.sol", 256, 1} {:message "not_called_re_ent13"} not_called_re_ent13#976: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_4.sol", 257, 1} {:message "PHO::bug_re_ent13"} bug_re_ent13#1008(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_4.sol", 259, 10} {:message "success"} success#984: bool;
	var __call_ret#44: bool;
	var __call_ret#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#976[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_4.sol", 259, 25} {:message ""} true;
	call __call_ret#44, __call_ret#45 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#44) {
	havoc userBalance_re_ent26#39;
	havoc name#76;
	havoc not_called_re_ent20#79;
	havoc symbol#109;
	havoc redeemableEther_re_ent32#113;
	havoc decimals#152;
	havoc balances_re_ent38#156;
	havoc saleAmount#191;
	havoc redeemableEther_re_ent4#195;
	havoc evtAmount#233;
	havoc counter_re_ent7#236;
	havoc teamAmount#267;
	havoc lastPlayer_re_ent23#269;
	havoc jackpot_re_ent23#271;
	havoc _totalSupply#303;
	havoc counter_re_ent14#306;
	havoc balances#339;
	havoc lastPlayer_re_ent30#341;
	havoc jackpot_re_ent30#343;
	havoc owner#375;
	havoc balances_re_ent8#379;
	havoc sale#410;
	havoc redeemableEther_re_ent39#414;
	havoc evt#452;
	havoc balances_re_ent36#456;
	havoc team#481;
	havoc counter_re_ent35#590;
	havoc userBalance_re_ent40#632;
	havoc userBalance_re_ent33#683;
	havoc not_called_re_ent27#854;
	havoc balances_re_ent31#927;
	havoc not_called_re_ent13#976;
	havoc __balance;
	}

	if (!(__call_ret#44)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#984 := __call_ret#44;
	if (!(success#984)) {
	assume false;
	}

	not_called_re_ent13#976 := not_called_re_ent13#976[__this := false];
	$return23:
	// Function body ends here
}

