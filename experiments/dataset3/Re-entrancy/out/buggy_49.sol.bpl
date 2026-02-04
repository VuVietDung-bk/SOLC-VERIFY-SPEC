// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_49.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: TAMC -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_49.sol", 55, 3} {:message "[event] TAMC::Transfer"} Transfer#220(__this: address_t, __msg_sender: address_t, __msg_value: int, from#214: address_t, to#216: address_t, value#218: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_49.sol", 98, 3} {:message "[event] TAMC::Approval"} Approval#400(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#394: address_t, spender#396: address_t, value#398: int)
{
	
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_49.sol", 8, 3} {:message "counter_re_ent14"} counter_re_ent14#4: [address_t]int;
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
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_49.sol", 9, 1} {:message "TAMC::callme_re_ent14"} callme_re_ent14#38(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 11, 5} {:message "success"} success#14: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#4[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_49.sol", 11, 22} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#0) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#14 := __call_ret#0;
	if (!(success#14)) {
	assume false;
	}

	counter_re_ent14#4 := counter_re_ent14#4[__this := (counter_re_ent14#4[__this] + 1)];
	$return0:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 17, 3} {:message "balanceOf"} balanceOf#42: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_49.sol", 19, 3} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#44: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_49.sol", 20, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#46: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_49.sol", 21, 4} {:message "TAMC::buyTicket_re_ent30"} buyTicket_re_ent30#81(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 22, 7} {:message "sent"} sent#50: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent30#46[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent30#46[__this])];
	assume {:sourceloc "buggy_49.sol", 22, 21} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(lastPlayer_re_ent30#44[__this], __this, jackpot_re_ent30#46[__this]);
	if (__call_ret#2) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent30#46[__this])];
	}

	sent#50 := __call_ret#2;
	if (!(sent#50)) {
	assume false;
	}

	lastPlayer_re_ent30#44 := lastPlayer_re_ent30#44[__this := __msg_sender];
	jackpot_re_ent30#46 := jackpot_re_ent30#46[__this := __balance[__this]];
	$return1:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_49.sol", 28, 3} {:message "name"} name#84: [address_t]int_arr_type;
// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 29, 3} {:message "balances_re_ent8"} balances_re_ent8#88: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_49.sol", 30, 5} {:message "TAMC::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#117(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 31, 9} {:message "success"} success#92: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#88[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#88[__this][__msg_sender])];
	assume {:sourceloc "buggy_49.sol", 31, 26} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(__msg_sender, __this, balances_re_ent8#88[__this][__msg_sender]);
	if (__call_ret#4) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#88[__this][__msg_sender])];
	}

	success#92 := __call_ret#4;
	if (success#92) {
	balances_re_ent8#88 := balances_re_ent8#88[__this := balances_re_ent8#88[__this][__msg_sender := 0]];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_49.sol", 35, 3} {:message "symbol"} symbol#120: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 36, 3} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#124: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_49.sol", 37, 1} {:message "TAMC::claimReward_re_ent39"} claimReward_re_ent39#160(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 40, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#137: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#124[__this][__msg_sender] > 0);
	transferValue_re_ent39#137 := redeemableEther_re_ent39#124[__this][__msg_sender];
	assume {:sourceloc "buggy_49.sol", 41, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#137);
	redeemableEther_re_ent39#124 := redeemableEther_re_ent39#124[__this := redeemableEther_re_ent39#124[__this][__msg_sender := 0]];
	$return3:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_49.sol", 44, 3} {:message "decimals"} decimals#163: [address_t]int;
// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_49.sol", 45, 5} {:message "totalSupply"} totalSupply#168: [address_t]int;
// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 47, 3} {:message "balances_re_ent31"} balances_re_ent31#172: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_49.sol", 48, 1} {:message "TAMC::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#212(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#174: int)
{
	var {:sourceloc "buggy_49.sol", 51, 4} {:message "sent"} sent#187: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#172[__this][__msg_sender] >= _weiToWithdraw#174);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#174);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#174)];
	assume {:sourceloc "buggy_49.sol", 51, 18} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, _weiToWithdraw#174);
	if (__call_ret#6) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#174)];
	}

	sent#187 := __call_ret#6;
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#187;
	balances_re_ent31#172 := balances_re_ent31#172[__this := balances_re_ent31#172[__this][__msg_sender := (balances_re_ent31#172[__this][__msg_sender] - _weiToWithdraw#174)]];
	$return4:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_49.sol", 57, 5} {:message "TAMC::[constructor]"} __constructor#601(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: address_t;
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	counter_re_ent14#4 := counter_re_ent14#4[__this := 0];
	balanceOf#42 := balanceOf#42[__this := default_address_t_int()];
	lastPlayer_re_ent30#44 := lastPlayer_re_ent30#44[__this := 0];
	jackpot_re_ent30#46 := jackpot_re_ent30#46[__this := 0];
	name#84 := name#84[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	balances_re_ent8#88 := balances_re_ent8#88[__this := default_address_t_int()];
	symbol#120 := symbol#120[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	redeemableEther_re_ent39#124 := redeemableEther_re_ent39#124[__this := default_address_t_int()];
	decimals#163 := decimals#163[__this := 18];
	totalSupply#168 := totalSupply#168[__this := 1000000000000000000000000000];
	balances_re_ent31#172 := balances_re_ent31#172[__this := default_address_t_int()];
	counter_re_ent35#244 := counter_re_ent35#244[__this := 0];
	userBalance_re_ent40#323 := userBalance_re_ent40#323[__this := default_address_t_int()];
	not_called_re_ent13#360 := not_called_re_ent13#360[__this := true];
	balances_re_ent36#404 := balances_re_ent36#404[__this := default_address_t_int()];
	allowance#439 := allowance#439[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent33#471 := userBalance_re_ent33#471[__this := default_address_t_int()];
	not_called_re_ent27#568 := not_called_re_ent27#568[__this := true];
	// Function body starts here
	balanceOf#42 := balanceOf#42[__this := balanceOf#42[__this][__msg_sender := totalSupply#168[__this]]];
	call_arg#10 := 0;
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 59, 14} {:message ""} true;
	call Transfer#220(__this, __msg_sender, __msg_value, call_arg#10, call_arg#11, totalSupply#168[__this]);
	$return5:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_49.sol", 61, 1} {:message "counter_re_ent35"} counter_re_ent35#244: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_49.sol", 62, 1} {:message "TAMC::callme_re_ent35"} callme_re_ent35#278(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 64, 5} {:message "success"} success#254: bool;
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#244[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_49.sol", 64, 22} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#12) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#254 := __call_ret#12;
	if (!(success#254)) {
	assume false;
	}

	counter_re_ent35#244 := counter_re_ent35#244[__this := (counter_re_ent35#244[__this] + 1)];
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 71, 5} {:message "TAMC::transfer"} transfer#319(__this: address_t, __msg_sender: address_t, __msg_value: int, to#280: address_t, value#282: int)
	returns (success#285: bool)
{
	var call_arg#14: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#42[__this][__msg_sender] >= value#282);
	balanceOf#42 := balanceOf#42[__this := balanceOf#42[__this][__msg_sender := (balanceOf#42[__this][__msg_sender] - value#282)]];
	balanceOf#42 := balanceOf#42[__this := balanceOf#42[__this][to#280 := (balanceOf#42[__this][to#280] + value#282)]];
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 75, 14} {:message ""} true;
	call Transfer#220(__this, __msg_sender, __msg_value, call_arg#14, to#280, value#282);
	success#285 := true;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 78, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#323: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_49.sol", 79, 1} {:message "TAMC::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#357(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 82, 6} {:message "success"} success#327: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#323[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#323[__this][__msg_sender])];
	assume {:sourceloc "buggy_49.sol", 82, 23} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, userBalance_re_ent40#323[__this][__msg_sender]);
	if (__call_ret#15) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#15)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#323[__this][__msg_sender])];
	}

	success#327 := __call_ret#15;
	if (!(success#327)) {
	assume false;
	}

	userBalance_re_ent40#323 := userBalance_re_ent40#323[__this := userBalance_re_ent40#323[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_49.sol", 89, 3} {:message "not_called_re_ent13"} not_called_re_ent13#360: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_49.sol", 90, 1} {:message "TAMC::bug_re_ent13"} bug_re_ent13#392(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 92, 6} {:message "success"} success#368: bool;
	var __call_ret#17: bool;
	var __call_ret#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#360[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_49.sol", 92, 23} {:message ""} true;
	call __call_ret#17, __call_ret#18 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#17) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#17)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#368 := __call_ret#17;
	if (!(success#368)) {
	assume false;
	}

	not_called_re_ent13#360 := not_called_re_ent13#360[__this := false];
	$return9:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 100, 3} {:message "balances_re_ent36"} balances_re_ent36#404: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_49.sol", 101, 5} {:message "TAMC::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#433(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 102, 9} {:message "sent"} sent#408: bool;
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent36#404[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent36#404[__this][__msg_sender])];
	assume {:sourceloc "buggy_49.sol", 102, 23} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(__msg_sender, __this, balances_re_ent36#404[__this][__msg_sender]);
	if (__call_ret#19) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent36#404[__this][__msg_sender])];
	}

	sent#408 := __call_ret#19;
	if (sent#408) {
	balances_re_ent36#404 := balances_re_ent36#404[__this := balances_re_ent36#404[__this][__msg_sender := 0]];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_49.sol", 106, 3} {:message "allowance"} allowance#439: [address_t][address_t][address_t]int;
// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 108, 5} {:message "TAMC::approve"} approve#467(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#441: address_t, value#443: int)
	returns (success#446: bool)
{
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#439 := allowance#439[__this := allowance#439[__this][__msg_sender := allowance#439[__this][__msg_sender][spender#441 := value#443]]];
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 113, 14} {:message ""} true;
	call Approval#400(__this, __msg_sender, __msg_value, call_arg#21, spender#441, value#443);
	success#446 := true;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 116, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#471: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_49.sol", 117, 1} {:message "TAMC::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#505(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 120, 6} {:message "success"} success#475: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#471[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#471[__this][__msg_sender])];
	assume {:sourceloc "buggy_49.sol", 120, 23} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, userBalance_re_ent33#471[__this][__msg_sender]);
	if (__call_ret#22) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#471[__this][__msg_sender])];
	}

	success#475 := __call_ret#22;
	if (!(success#475)) {
	assume false;
	}

	userBalance_re_ent33#471 := userBalance_re_ent33#471[__this := userBalance_re_ent33#471[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 127, 5} {:message "TAMC::transferFrom"} transferFrom#565(__this: address_t, __msg_sender: address_t, __msg_value: int, from#507: address_t, to#509: address_t, value#511: int)
	returns (success#514: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#511 <= balanceOf#42[__this][from#507]);
	assume (value#511 <= allowance#439[__this][from#507][__msg_sender]);
	balanceOf#42 := balanceOf#42[__this := balanceOf#42[__this][from#507 := (balanceOf#42[__this][from#507] - value#511)]];
	balanceOf#42 := balanceOf#42[__this := balanceOf#42[__this][to#509 := (balanceOf#42[__this][to#509] + value#511)]];
	allowance#439 := allowance#439[__this := allowance#439[__this][from#507 := allowance#439[__this][from#507][__msg_sender := (allowance#439[__this][from#507][__msg_sender] - value#511)]]];
	assume {:sourceloc "buggy_49.sol", 137, 14} {:message ""} true;
	call Transfer#220(__this, __msg_sender, __msg_value, from#507, to#509, value#511);
	success#514 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_49.sol", 140, 1} {:message "not_called_re_ent27"} not_called_re_ent27#568: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_49.sol", 141, 1} {:message "TAMC::bug_re_ent27"} bug_re_ent27#600(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 143, 6} {:message "success"} success#576: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#568[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_49.sol", 143, 23} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#24) {
	havoc counter_re_ent14#4;
	havoc balanceOf#42;
	havoc lastPlayer_re_ent30#44;
	havoc jackpot_re_ent30#46;
	havoc name#84;
	havoc balances_re_ent8#88;
	havoc symbol#120;
	havoc redeemableEther_re_ent39#124;
	havoc decimals#163;
	havoc totalSupply#168;
	havoc balances_re_ent31#172;
	havoc counter_re_ent35#244;
	havoc userBalance_re_ent40#323;
	havoc not_called_re_ent13#360;
	havoc balances_re_ent36#404;
	havoc allowance#439;
	havoc userBalance_re_ent33#471;
	havoc not_called_re_ent27#568;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#576 := __call_ret#24;
	if (!(success#576)) {
	assume false;
	}

	not_called_re_ent27#568 := not_called_re_ent27#568[__this := false];
	$return14:
	// Function body ends here
}

