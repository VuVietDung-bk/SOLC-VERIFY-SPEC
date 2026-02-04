// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_39.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: TAMCContract -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_39.sol", 52, 3} {:message "[event] TAMCContract::Transfer"} Transfer#203(__this: address_t, __msg_sender: address_t, __msg_value: int, from#197: address_t, to#199: address_t, value#201: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_39.sol", 94, 3} {:message "[event] TAMCContract::Approval"} Approval#378(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#372: address_t, spender#374: address_t, value#376: int)
{
	
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_39.sol", 8, 3} {:message "counter_re_ent14"} counter_re_ent14#4: [address_t]int;
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
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_39.sol", 9, 1} {:message "TAMCContract::callme_re_ent14"} callme_re_ent14#33(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#4[__this] <= 5);
	call_arg#0 := 10000000000000000000;
	assume {:sourceloc "buggy_39.sol", 11, 9} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	assume false;
	}

	counter_re_ent14#4 := counter_re_ent14#4[__this := (counter_re_ent14#4[__this] + 1)];
	$return0:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 16, 3} {:message "balanceOf"} balanceOf#37: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_39.sol", 18, 3} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#39: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_39.sol", 19, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#41: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_39.sol", 20, 4} {:message "TAMCContract::buyTicket_re_ent30"} buyTicket_re_ent30#71(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_39.sol", 21, 12} {:message ""} true;
	call __send_ret#2 := __send(lastPlayer_re_ent30#39[__this], __this, 0, jackpot_re_ent30#41[__this]);
	if (!(__send_ret#2)) {
	assume false;
	}

	lastPlayer_re_ent30#39 := lastPlayer_re_ent30#39[__this := __msg_sender];
	jackpot_re_ent30#41 := jackpot_re_ent30#41[__this := __balance[__this]];
	$return1:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_39.sol", 26, 3} {:message "name"} name#74: [address_t]int_arr_type;
// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 27, 3} {:message "balances_re_ent8"} balances_re_ent8#78: [address_t][address_t]int;
type int_arr_ptr = int;
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
procedure {:sourceloc "buggy_39.sol", 28, 5} {:message "TAMCContract::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#107(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_39.sol", 29, 8} {:message "success"} success#82: bool;
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#78[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#78[__this][__msg_sender])];
	assume {:sourceloc "buggy_39.sol", 29, 25} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(__msg_sender, __this, balances_re_ent8#78[__this][__msg_sender]);
	if (__call_ret#3) {
	havoc counter_re_ent14#4;
	havoc balanceOf#37;
	havoc lastPlayer_re_ent30#39;
	havoc jackpot_re_ent30#41;
	havoc name#74;
	havoc balances_re_ent8#78;
	havoc symbol#110;
	havoc redeemableEther_re_ent39#114;
	havoc decimals#153;
	havoc totalSupply#158;
	havoc balances_re_ent31#162;
	havoc counter_re_ent35#227;
	havoc userBalance_re_ent40#301;
	havoc not_called_re_ent13#338;
	havoc balances_re_ent36#382;
	havoc allowance#411;
	havoc userBalance_re_ent33#443;
	havoc not_called_re_ent27#540;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#78[__this][__msg_sender])];
	}

	success#82 := __call_ret#3;
	if (success#82) {
	balances_re_ent8#78 := balances_re_ent8#78[__this := balances_re_ent8#78[__this][__msg_sender := 0]];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_39.sol", 33, 3} {:message "symbol"} symbol#110: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 34, 3} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#114: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_39.sol", 35, 1} {:message "TAMCContract::claimReward_re_ent39"} claimReward_re_ent39#150(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_39.sol", 38, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#127: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#114[__this][__msg_sender] > 0);
	transferValue_re_ent39#127 := redeemableEther_re_ent39#114[__this][__msg_sender];
	assume {:sourceloc "buggy_39.sol", 39, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#127);
	redeemableEther_re_ent39#114 := redeemableEther_re_ent39#114[__this := redeemableEther_re_ent39#114[__this][__msg_sender := 0]];
	$return3:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_39.sol", 42, 3} {:message "decimals"} decimals#153: [address_t]int;
// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_39.sol", 43, 5} {:message "totalSupply"} totalSupply#158: [address_t]int;
// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 45, 3} {:message "balances_re_ent31"} balances_re_ent31#162: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_39.sol", 46, 1} {:message "TAMCContract::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#195(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#164: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#162[__this][__msg_sender] >= _weiToWithdraw#164);
	assume {:sourceloc "buggy_39.sol", 49, 11} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, _weiToWithdraw#164);
	assume __send_ret#5;
	balances_re_ent31#162 := balances_re_ent31#162[__this := balances_re_ent31#162[__this][__msg_sender := (balances_re_ent31#162[__this][__msg_sender] - _weiToWithdraw#164)]];
	$return4:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_39.sol", 54, 5} {:message "TAMCContract::[constructor]"} __constructor#568(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: address_t;
	var call_arg#7: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	counter_re_ent14#4 := counter_re_ent14#4[__this := 0];
	balanceOf#37 := balanceOf#37[__this := default_address_t_int()];
	lastPlayer_re_ent30#39 := lastPlayer_re_ent30#39[__this := 0];
	jackpot_re_ent30#41 := jackpot_re_ent30#41[__this := 0];
	name#74 := name#74[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	balances_re_ent8#78 := balances_re_ent8#78[__this := default_address_t_int()];
	symbol#110 := symbol#110[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	redeemableEther_re_ent39#114 := redeemableEther_re_ent39#114[__this := default_address_t_int()];
	decimals#153 := decimals#153[__this := 18];
	totalSupply#158 := totalSupply#158[__this := 1000000000000000000000000000];
	balances_re_ent31#162 := balances_re_ent31#162[__this := default_address_t_int()];
	counter_re_ent35#227 := counter_re_ent35#227[__this := 0];
	userBalance_re_ent40#301 := userBalance_re_ent40#301[__this := default_address_t_int()];
	not_called_re_ent13#338 := not_called_re_ent13#338[__this := true];
	balances_re_ent36#382 := balances_re_ent36#382[__this := default_address_t_int()];
	allowance#411 := allowance#411[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent33#443 := userBalance_re_ent33#443[__this := default_address_t_int()];
	not_called_re_ent27#540 := not_called_re_ent27#540[__this := true];
	// Function body starts here
	balanceOf#37 := balanceOf#37[__this := balanceOf#37[__this][__msg_sender := totalSupply#158[__this]]];
	call_arg#6 := 0;
	call_arg#7 := __msg_sender;
	assume {:sourceloc "buggy_39.sol", 56, 14} {:message ""} true;
	call Transfer#203(__this, __msg_sender, __msg_value, call_arg#6, call_arg#7, totalSupply#158[__this]);
	$return5:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_39.sol", 58, 1} {:message "counter_re_ent35"} counter_re_ent35#227: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_39.sol", 59, 1} {:message "TAMCContract::callme_re_ent35"} callme_re_ent35#256(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#227[__this] <= 5);
	call_arg#8 := 10000000000000000000;
	assume {:sourceloc "buggy_39.sol", 61, 9} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, call_arg#8);
	if (!(__send_ret#9)) {
	assume false;
	}

	counter_re_ent35#227 := counter_re_ent35#227[__this := (counter_re_ent35#227[__this] + 1)];
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_39.sol", 67, 5} {:message "TAMCContract::transfer"} transfer#297(__this: address_t, __msg_sender: address_t, __msg_value: int, to#258: address_t, value#260: int)
	returns (success#263: bool)
{
	var call_arg#10: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#37[__this][__msg_sender] >= value#260);
	balanceOf#37 := balanceOf#37[__this := balanceOf#37[__this][__msg_sender := (balanceOf#37[__this][__msg_sender] - value#260)]];
	balanceOf#37 := balanceOf#37[__this := balanceOf#37[__this][to#258 := (balanceOf#37[__this][to#258] + value#260)]];
	call_arg#10 := __msg_sender;
	assume {:sourceloc "buggy_39.sol", 71, 14} {:message ""} true;
	call Transfer#203(__this, __msg_sender, __msg_value, call_arg#10, to#258, value#260);
	success#263 := true;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 74, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#301: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_39.sol", 75, 1} {:message "TAMCContract::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#335(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_39.sol", 78, 3} {:message "success"} success#305: bool;
	var __call_ret#11: bool;
	var __call_ret#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#301[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#301[__this][__msg_sender])];
	assume {:sourceloc "buggy_39.sol", 78, 18} {:message ""} true;
	call __call_ret#11, __call_ret#12 := __call(__msg_sender, __this, userBalance_re_ent40#301[__this][__msg_sender]);
	if (__call_ret#11) {
	havoc counter_re_ent14#4;
	havoc balanceOf#37;
	havoc lastPlayer_re_ent30#39;
	havoc jackpot_re_ent30#41;
	havoc name#74;
	havoc balances_re_ent8#78;
	havoc symbol#110;
	havoc redeemableEther_re_ent39#114;
	havoc decimals#153;
	havoc totalSupply#158;
	havoc balances_re_ent31#162;
	havoc counter_re_ent35#227;
	havoc userBalance_re_ent40#301;
	havoc not_called_re_ent13#338;
	havoc balances_re_ent36#382;
	havoc allowance#411;
	havoc userBalance_re_ent33#443;
	havoc not_called_re_ent27#540;
	havoc __balance;
	}

	if (!(__call_ret#11)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#301[__this][__msg_sender])];
	}

	success#305 := __call_ret#11;
	if (!(success#305)) {
	assume false;
	}

	userBalance_re_ent40#301 := userBalance_re_ent40#301[__this := userBalance_re_ent40#301[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_39.sol", 85, 3} {:message "not_called_re_ent13"} not_called_re_ent13#338: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_39.sol", 86, 1} {:message "TAMCContract::bug_re_ent13"} bug_re_ent13#370(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_39.sol", 88, 3} {:message "success"} success#346: bool;
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#338[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_39.sol", 88, 18} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#13) {
	havoc counter_re_ent14#4;
	havoc balanceOf#37;
	havoc lastPlayer_re_ent30#39;
	havoc jackpot_re_ent30#41;
	havoc name#74;
	havoc balances_re_ent8#78;
	havoc symbol#110;
	havoc redeemableEther_re_ent39#114;
	havoc decimals#153;
	havoc totalSupply#158;
	havoc balances_re_ent31#162;
	havoc counter_re_ent35#227;
	havoc userBalance_re_ent40#301;
	havoc not_called_re_ent13#338;
	havoc balances_re_ent36#382;
	havoc allowance#411;
	havoc userBalance_re_ent33#443;
	havoc not_called_re_ent27#540;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#346 := __call_ret#13;
	if (!(success#346)) {
	assume false;
	}

	not_called_re_ent13#338 := not_called_re_ent13#338[__this := false];
	$return9:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 96, 3} {:message "balances_re_ent36"} balances_re_ent36#382: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_39.sol", 97, 5} {:message "TAMCContract::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#405(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_39.sol", 98, 12} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, balances_re_ent36#382[__this][__msg_sender]);
	if (__send_ret#15) {
	balances_re_ent36#382 := balances_re_ent36#382[__this := balances_re_ent36#382[__this][__msg_sender := 0]];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_39.sol", 101, 3} {:message "allowance"} allowance#411: [address_t][address_t][address_t]int;
// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_39.sol", 103, 5} {:message "TAMCContract::approve"} approve#439(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#413: address_t, value#415: int)
	returns (success#418: bool)
{
	var call_arg#16: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#411 := allowance#411[__this := allowance#411[__this][__msg_sender := allowance#411[__this][__msg_sender][spender#413 := value#415]]];
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_39.sol", 108, 14} {:message ""} true;
	call Approval#378(__this, __msg_sender, __msg_value, call_arg#16, spender#413, value#415);
	success#418 := true;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_39.sol", 111, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#443: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_39.sol", 112, 1} {:message "TAMCContract::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#477(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_39.sol", 115, 3} {:message "success"} success#447: bool;
	var __call_ret#17: bool;
	var __call_ret#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#443[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#443[__this][__msg_sender])];
	assume {:sourceloc "buggy_39.sol", 115, 19} {:message ""} true;
	call __call_ret#17, __call_ret#18 := __call(__msg_sender, __this, userBalance_re_ent33#443[__this][__msg_sender]);
	if (__call_ret#17) {
	havoc counter_re_ent14#4;
	havoc balanceOf#37;
	havoc lastPlayer_re_ent30#39;
	havoc jackpot_re_ent30#41;
	havoc name#74;
	havoc balances_re_ent8#78;
	havoc symbol#110;
	havoc redeemableEther_re_ent39#114;
	havoc decimals#153;
	havoc totalSupply#158;
	havoc balances_re_ent31#162;
	havoc counter_re_ent35#227;
	havoc userBalance_re_ent40#301;
	havoc not_called_re_ent13#338;
	havoc balances_re_ent36#382;
	havoc allowance#411;
	havoc userBalance_re_ent33#443;
	havoc not_called_re_ent27#540;
	havoc __balance;
	}

	if (!(__call_ret#17)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#443[__this][__msg_sender])];
	}

	success#447 := __call_ret#17;
	if (!(success#447)) {
	assume false;
	}

	userBalance_re_ent33#443 := userBalance_re_ent33#443[__this := userBalance_re_ent33#443[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_39.sol", 122, 5} {:message "TAMCContract::transferFrom"} transferFrom#537(__this: address_t, __msg_sender: address_t, __msg_value: int, from#479: address_t, to#481: address_t, value#483: int)
	returns (success#486: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#483 <= balanceOf#37[__this][from#479]);
	assume (value#483 <= allowance#411[__this][from#479][__msg_sender]);
	balanceOf#37 := balanceOf#37[__this := balanceOf#37[__this][from#479 := (balanceOf#37[__this][from#479] - value#483)]];
	balanceOf#37 := balanceOf#37[__this := balanceOf#37[__this][to#481 := (balanceOf#37[__this][to#481] + value#483)]];
	allowance#411 := allowance#411[__this := allowance#411[__this][from#479 := allowance#411[__this][from#479][__msg_sender := (allowance#411[__this][from#479][__msg_sender] - value#483)]]];
	assume {:sourceloc "buggy_39.sol", 132, 14} {:message ""} true;
	call Transfer#203(__this, __msg_sender, __msg_value, from#479, to#481, value#483);
	success#486 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_39.sol", 135, 1} {:message "not_called_re_ent27"} not_called_re_ent27#540: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_39.sol", 136, 1} {:message "TAMCContract::bug_re_ent27"} bug_re_ent27#567(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#540[__this];
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_39.sol", 138, 12} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, call_arg#19);
	if (!(__send_ret#20)) {
	assume false;
	}

	not_called_re_ent27#540 := not_called_re_ent27#540[__this := false];
	$return14:
	// Function body ends here
}

