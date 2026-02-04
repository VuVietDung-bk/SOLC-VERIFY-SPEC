// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_8.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_8.sol", 26, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#80(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#76: address_t, newOwner#78: address_t)
{
	
}

// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 8, 1} {:message "balances_re_ent21"} balances_re_ent21#5: [address_t][address_t]int;
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
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_8.sol", 9, 5} {:message "Ownable::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#34(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 10, 9} {:message "success"} success#9: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#5[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#5[__this][__msg_sender])];
	assume {:sourceloc "buggy_8.sol", 10, 25} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, balances_re_ent21#5[__this][__msg_sender]);
	if (__call_ret#0) {
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#172;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#5[__this][__msg_sender])];
	}

	success#9 := __call_ret#0;
	if (success#9) {
	balances_re_ent21#5 := balances_re_ent21#5[__this := balances_re_ent21#5[__this][__msg_sender := 0]];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_8.sol", 14, 3} {:message "owner"} owner#36: [address_t]address_t;
// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 16, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#40: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_8.sol", 17, 1} {:message "Ownable::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#74(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 20, 10} {:message "success"} success#44: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#40[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#40[__this][__msg_sender])];
	assume {:sourceloc "buggy_8.sol", 20, 25} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(__msg_sender, __this, userBalance_re_ent40#40[__this][__msg_sender]);
	if (__call_ret#2) {
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#172;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#40[__this][__msg_sender])];
	}

	success#44 := __call_ret#2;
	if (!(success#44)) {
	assume false;
	}

	userBalance_re_ent40#40 := userBalance_re_ent40#40[__this := userBalance_re_ent40#40[__this][__msg_sender := 0]];
	$return1:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 33, 3} {:message "Ownable::[constructor]"} __constructor#209(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent21#5 := balances_re_ent21#5[__this := default_address_t_int()];
	owner#36 := owner#36[__this := 0];
	userBalance_re_ent40#40 := userBalance_re_ent40#40[__this := default_address_t_int()];
	lastPlayer_re_ent9#92 := lastPlayer_re_ent9#92[__this := 0];
	jackpot_re_ent9#94 := jackpot_re_ent9#94[__this := 0];
	redeemableEther_re_ent25#172 := redeemableEther_re_ent25#172[__this := default_address_t_int()];
	// Function body starts here
	owner#36 := owner#36[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_8.sol", 36, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#92: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_8.sol", 37, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#94: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_8.sol", 38, 4} {:message "Ownable::buyTicket_re_ent9"} buyTicket_re_ent9#129(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 39, 7} {:message "success"} success#98: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#94[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#94[__this])];
	assume {:sourceloc "buggy_8.sol", 39, 24} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(lastPlayer_re_ent9#92[__this], __this, jackpot_re_ent9#94[__this]);
	if (__call_ret#4) {
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#172;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#94[__this])];
	}

	success#98 := __call_ret#4;
	if (!(success#98)) {
	assume false;
	}

	lastPlayer_re_ent9#92 := lastPlayer_re_ent9#92[__this := __msg_sender];
	jackpot_re_ent9#94 := jackpot_re_ent9#94[__this := __balance[__this]];
	$return3:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_8.sol", 58, 3} {:message "Ownable::transferOwnership"} transferOwnership#168(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#144: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	assume (newOwner#144 != 0);
	assume {:sourceloc "buggy_8.sol", 60, 10} {:message ""} true;
	call OwnershipTransferred#80(__this, __msg_sender, __msg_value, owner#36[__this], newOwner#144);
	owner#36 := owner#36[__this := newOwner#144];
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 63, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#172: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_8.sol", 64, 1} {:message "Ownable::claimReward_re_ent25"} claimReward_re_ent25#208(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 67, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#185: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#172[__this][__msg_sender] > 0);
	transferValue_re_ent25#185 := redeemableEther_re_ent25#172[__this][__msg_sender];
	assume {:sourceloc "buggy_8.sol", 68, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#185);
	redeemableEther_re_ent25#172 := redeemableEther_re_ent25#172[__this := redeemableEther_re_ent25#172[__this][__msg_sender := 0]];
	$return6:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_8.sol", 144, 3} {:message "[event] TokenERC20::Transfer"} Transfer#476(__this: address_t, __msg_sender: address_t, __msg_value: int, from#470: address_t, to#472: address_t, value#474: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_8.sol", 155, 3} {:message "[event] TokenERC20::Approval"} Approval#514(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#508: address_t, _spender#510: address_t, _value#512: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_8.sol", 165, 3} {:message "[event] TokenERC20::Burn"} Burn#557(__this: address_t, __msg_sender: address_t, __msg_value: int, from#553: address_t, value#555: int)
{
	
}

// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 76, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#213: [address_t][address_t]int;
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
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_8.sol", 77, 1} {:message "TokenERC20::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#242(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_8.sol", 80, 16} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, userBalance_re_ent12#213[__this][__msg_sender]);
	if (!(__send_ret#8)) {
	assume false;
	}

	userBalance_re_ent12#213 := userBalance_re_ent12#213[__this := userBalance_re_ent12#213[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_8.sol", 85, 3} {:message "name"} name#244: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 86, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#248: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_8.sol", 87, 1} {:message "TokenERC20::claimReward_re_ent11"} claimReward_re_ent11#284(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 90, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#261: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#248[__this][__msg_sender] > 0);
	transferValue_re_ent11#261 := redeemableEther_re_ent11#248[__this][__msg_sender];
	assume {:sourceloc "buggy_8.sol", 91, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#261);
	redeemableEther_re_ent11#248 := redeemableEther_re_ent11#248[__this := redeemableEther_re_ent11#248[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_8.sol", 94, 3} {:message "symbol"} symbol#286: [address_t]int_arr_type;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 95, 3} {:message "balances_re_ent1"} balances_re_ent1#290: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_8.sol", 96, 5} {:message "TokenERC20::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#319(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 97, 9} {:message "success"} success#294: bool;
	var __call_ret#9: bool;
	var __call_ret#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#290[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#290[__this][__msg_sender])];
	assume {:sourceloc "buggy_8.sol", 97, 25} {:message ""} true;
	call __call_ret#9, __call_ret#10 := __call(__msg_sender, __this, balances_re_ent1#290[__this][__msg_sender]);
	if (__call_ret#9) {
	havoc userBalance_re_ent12#213;
	havoc name#244;
	havoc redeemableEther_re_ent11#248;
	havoc symbol#286;
	havoc balances_re_ent1#290;
	havoc decimals#322;
	havoc not_called_re_ent41#325;
	havoc totalSupply#354;
	havoc counter_re_ent42#357;
	havoc balanceOf#390;
	havoc lastPlayer_re_ent2#392;
	havoc jackpot_re_ent2#394;
	havoc allowance#430;
	havoc userBalance_re_ent33#434;
	havoc not_called_re_ent27#479;
	havoc balances_re_ent31#518;
	havoc userBalance_re_ent19#593;
	havoc userBalance_re_ent26#706;
	havoc not_called_re_ent20#763;
	havoc redeemableEther_re_ent32#835;
	havoc balances_re_ent38#904;
	havoc redeemableEther_re_ent4#978;
	havoc counter_re_ent7#1073;
	havoc __balance;
	}

	if (!(__call_ret#9)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#290[__this][__msg_sender])];
	}

	success#294 := __call_ret#9;
	if (success#294) {
	balances_re_ent1#290 := balances_re_ent1#290[__this := balances_re_ent1#290[__this][__msg_sender := 0]];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_8.sol", 101, 3} {:message "decimals"} decimals#322: [address_t]int;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_8.sol", 103, 3} {:message "not_called_re_ent41"} not_called_re_ent41#325: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_8.sol", 104, 1} {:message "TokenERC20::bug_re_ent41"} bug_re_ent41#352(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#325[__this];
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 106, 16} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	assume false;
	}

	not_called_re_ent41#325 := not_called_re_ent41#325[__this := false];
	$return10:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_8.sol", 111, 3} {:message "totalSupply"} totalSupply#354: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_8.sol", 114, 3} {:message "counter_re_ent42"} counter_re_ent42#357: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_8.sol", 115, 1} {:message "TokenERC20::callme_re_ent42"} callme_re_ent42#386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#357[__this] <= 5);
	call_arg#13 := 10000000000000000000;
	assume {:sourceloc "buggy_8.sol", 117, 9} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	assume false;
	}

	counter_re_ent42#357 := counter_re_ent42#357[__this := (counter_re_ent42#357[__this] + 1)];
	$return11:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 122, 3} {:message "balanceOf"} balanceOf#390: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_8.sol", 123, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#392: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_8.sol", 124, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#394: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_8.sol", 125, 4} {:message "TokenERC20::buyTicket_re_ent2"} buyTicket_re_ent2#424(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_8.sol", 126, 12} {:message ""} true;
	call __send_ret#15 := __send(lastPlayer_re_ent2#392[__this], __this, 0, jackpot_re_ent2#394[__this]);
	if (!(__send_ret#15)) {
	assume false;
	}

	lastPlayer_re_ent2#392 := lastPlayer_re_ent2#392[__this := __msg_sender];
	jackpot_re_ent2#394 := jackpot_re_ent2#394[__this := __balance[__this]];
	$return12:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_8.sol", 131, 3} {:message "allowance"} allowance#430: [address_t][address_t][address_t]int;
// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 134, 3} {:message "userBalance_re_ent33"} userBalance_re_ent33#434: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_8.sol", 135, 1} {:message "TokenERC20::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#468(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 138, 10} {:message "success"} success#438: bool;
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#434[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#434[__this][__msg_sender])];
	assume {:sourceloc "buggy_8.sol", 138, 26} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(__msg_sender, __this, userBalance_re_ent33#434[__this][__msg_sender]);
	if (__call_ret#16) {
	havoc userBalance_re_ent12#213;
	havoc name#244;
	havoc redeemableEther_re_ent11#248;
	havoc symbol#286;
	havoc balances_re_ent1#290;
	havoc decimals#322;
	havoc not_called_re_ent41#325;
	havoc totalSupply#354;
	havoc counter_re_ent42#357;
	havoc balanceOf#390;
	havoc lastPlayer_re_ent2#392;
	havoc jackpot_re_ent2#394;
	havoc allowance#430;
	havoc userBalance_re_ent33#434;
	havoc not_called_re_ent27#479;
	havoc balances_re_ent31#518;
	havoc userBalance_re_ent19#593;
	havoc userBalance_re_ent26#706;
	havoc not_called_re_ent20#763;
	havoc redeemableEther_re_ent32#835;
	havoc balances_re_ent38#904;
	havoc redeemableEther_re_ent4#978;
	havoc counter_re_ent7#1073;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#434[__this][__msg_sender])];
	}

	success#438 := __call_ret#16;
	if (!(success#438)) {
	assume false;
	}

	userBalance_re_ent33#434 := userBalance_re_ent33#434[__this := userBalance_re_ent33#434[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_8.sol", 147, 3} {:message "not_called_re_ent27"} not_called_re_ent27#479: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_8.sol", 148, 1} {:message "TokenERC20::bug_re_ent27"} bug_re_ent27#506(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#479[__this];
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 150, 16} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	assume false;
	}

	not_called_re_ent27#479 := not_called_re_ent27#479[__this := false];
	$return14:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 158, 3} {:message "balances_re_ent31"} balances_re_ent31#518: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 159, 1} {:message "TokenERC20::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#551(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#520: int)
{
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#518[__this][__msg_sender] >= _weiToWithdraw#520);
	assume {:sourceloc "buggy_8.sol", 162, 17} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, _weiToWithdraw#520);
	assume __send_ret#20;
	balances_re_ent31#518 := balances_re_ent31#518[__this := balances_re_ent31#518[__this][__msg_sender := (balances_re_ent31#518[__this][__msg_sender] - _weiToWithdraw#520)]];
	$return15:
	// Function body ends here
}

function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 172, 5} {:message "TokenERC20::[constructor]"} __constructor#1103(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#560: int, tokenName#562: int_arr_ptr, tokenSymbol#564: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#562 < __alloc_counter);
	assume (tokenSymbol#564 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent12#213 := userBalance_re_ent12#213[__this := default_address_t_int()];
	name#244 := name#244[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent11#248 := redeemableEther_re_ent11#248[__this := default_address_t_int()];
	symbol#286 := symbol#286[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#290 := balances_re_ent1#290[__this := default_address_t_int()];
	decimals#322 := decimals#322[__this := 18];
	not_called_re_ent41#325 := not_called_re_ent41#325[__this := true];
	totalSupply#354 := totalSupply#354[__this := 0];
	counter_re_ent42#357 := counter_re_ent42#357[__this := 0];
	balanceOf#390 := balanceOf#390[__this := default_address_t_int()];
	lastPlayer_re_ent2#392 := lastPlayer_re_ent2#392[__this := 0];
	jackpot_re_ent2#394 := jackpot_re_ent2#394[__this := 0];
	allowance#430 := allowance#430[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent33#434 := userBalance_re_ent33#434[__this := default_address_t_int()];
	not_called_re_ent27#479 := not_called_re_ent27#479[__this := true];
	balances_re_ent31#518 := balances_re_ent31#518[__this := default_address_t_int()];
	userBalance_re_ent19#593 := userBalance_re_ent19#593[__this := default_address_t_int()];
	userBalance_re_ent26#706 := userBalance_re_ent26#706[__this := default_address_t_int()];
	not_called_re_ent20#763 := not_called_re_ent20#763[__this := true];
	redeemableEther_re_ent32#835 := redeemableEther_re_ent32#835[__this := default_address_t_int()];
	balances_re_ent38#904 := balances_re_ent38#904[__this := default_address_t_int()];
	redeemableEther_re_ent4#978 := redeemableEther_re_ent4#978[__this := default_address_t_int()];
	counter_re_ent7#1073 := counter_re_ent7#1073[__this := 0];
	// Function body starts here
	totalSupply#354 := totalSupply#354[__this := (initialSupply#560 * 1000000000000000000)];
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][__msg_sender := totalSupply#354[__this]]];
	name#244 := name#244[__this := mem_arr_int[tokenName#562]];
	symbol#286 := symbol#286[__this := mem_arr_int[tokenSymbol#564]];
	$return16:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 182, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#593: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_8.sol", 183, 1} {:message "TokenERC20::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#622(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_8.sol", 186, 16} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, userBalance_re_ent19#593[__this][__msg_sender]);
	if (!(__send_ret#21)) {
	assume false;
	}

	userBalance_re_ent19#593 := userBalance_re_ent19#593[__this := userBalance_re_ent19#593[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_8.sol", 195, 5} {:message "TokenERC20::_transfer"} _transfer#702(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#625: address_t, _to#627: address_t, _value#629: int)
{
	var {:sourceloc "buggy_8.sol", 203, 9} {:message "previousBalances"} previousBalances#662: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#627 != 0);
	assume (balanceOf#390[__this][_from#625] >= _value#629);
	assume ((balanceOf#390[__this][_to#627] + _value#629) > balanceOf#390[__this][_to#627]);
	previousBalances#662 := (balanceOf#390[__this][_from#625] + balanceOf#390[__this][_to#627]);
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][_from#625 := (balanceOf#390[__this][_from#625] - _value#629)]];
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][_to#627 := (balanceOf#390[__this][_to#627] + _value#629)]];
	assume {:sourceloc "buggy_8.sol", 208, 14} {:message ""} true;
	call Transfer#476(__this, __msg_sender, __msg_value, _from#625, _to#627, _value#629);
	assert {:sourceloc "buggy_8.sol", 210, 9} {:message "Assertion might not hold."} ((balanceOf#390[__this][_from#625] + balanceOf#390[__this][_to#627]) == previousBalances#662);
	$return18:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 212, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#706: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_8.sol", 213, 1} {:message "TokenERC20::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#740(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 216, 10} {:message "success"} success#710: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#706[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#706[__this][__msg_sender])];
	assume {:sourceloc "buggy_8.sol", 216, 26} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, userBalance_re_ent26#706[__this][__msg_sender]);
	if (__call_ret#22) {
	havoc userBalance_re_ent12#213;
	havoc name#244;
	havoc redeemableEther_re_ent11#248;
	havoc symbol#286;
	havoc balances_re_ent1#290;
	havoc decimals#322;
	havoc not_called_re_ent41#325;
	havoc totalSupply#354;
	havoc counter_re_ent42#357;
	havoc balanceOf#390;
	havoc lastPlayer_re_ent2#392;
	havoc jackpot_re_ent2#394;
	havoc allowance#430;
	havoc userBalance_re_ent33#434;
	havoc not_called_re_ent27#479;
	havoc balances_re_ent31#518;
	havoc userBalance_re_ent19#593;
	havoc userBalance_re_ent26#706;
	havoc not_called_re_ent20#763;
	havoc redeemableEther_re_ent32#835;
	havoc balances_re_ent38#904;
	havoc redeemableEther_re_ent4#978;
	havoc counter_re_ent7#1073;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#706[__this][__msg_sender])];
	}

	success#710 := __call_ret#22;
	if (!(success#710)) {
	assume false;
	}

	userBalance_re_ent26#706 := userBalance_re_ent26#706[__this := userBalance_re_ent26#706[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 231, 5} {:message "TokenERC20::transfer"} transfer#760(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#743: address_t, _value#745: int)
	returns (success#748: bool)
{
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#24 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 232, 9} {:message ""} true;
	call _transfer#702(__this, __msg_sender, __msg_value, call_arg#24, _to#743, _value#745);
	success#748 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_8.sol", 235, 1} {:message "not_called_re_ent20"} not_called_re_ent20#763: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_8.sol", 236, 1} {:message "TokenERC20::bug_re_ent20"} bug_re_ent20#790(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#763[__this];
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 238, 16} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, call_arg#25);
	if (!(__send_ret#26)) {
	assume false;
	}

	not_called_re_ent20#763 := not_called_re_ent20#763[__this := false];
	$return21:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 253, 5} {:message "TokenERC20::transferFrom"} transferFrom#831(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#793: address_t, _to#795: address_t, _value#797: int)
	returns (success#800: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#797 <= allowance#430[__this][_from#793][__msg_sender]);
	allowance#430 := allowance#430[__this := allowance#430[__this][_from#793 := allowance#430[__this][_from#793][__msg_sender := (allowance#430[__this][_from#793][__msg_sender] - _value#797)]]];
	assume {:sourceloc "buggy_8.sol", 256, 9} {:message ""} true;
	call _transfer#702(__this, __msg_sender, __msg_value, _from#793, _to#795, _value#797);
	success#800 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 259, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#835: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_8.sol", 260, 1} {:message "TokenERC20::claimReward_re_ent32"} claimReward_re_ent32#871(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 263, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#848: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#835[__this][__msg_sender] > 0);
	transferValue_re_ent32#848 := redeemableEther_re_ent32#835[__this][__msg_sender];
	assume {:sourceloc "buggy_8.sol", 264, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#848);
	redeemableEther_re_ent32#835 := redeemableEther_re_ent32#835[__this := redeemableEther_re_ent32#835[__this][__msg_sender := 0]];
	$return23:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 276, 5} {:message "TokenERC20::approve"} approve#900(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#874: address_t, _value#876: int)
	returns (success#879: bool)
{
	var call_arg#27: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#430 := allowance#430[__this := allowance#430[__this][__msg_sender := allowance#430[__this][__msg_sender][_spender#874 := _value#876]]];
	call_arg#27 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 279, 14} {:message ""} true;
	call Approval#514(__this, __msg_sender, __msg_value, call_arg#27, _spender#874, _value#876);
	success#879 := true;
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 282, 1} {:message "balances_re_ent38"} balances_re_ent38#904: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 283, 1} {:message "TokenERC20::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#937(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#906: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#904[__this][__msg_sender] >= _weiToWithdraw#906);
	assume {:sourceloc "buggy_8.sol", 286, 17} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, _weiToWithdraw#906);
	assume __send_ret#28;
	balances_re_ent38#904 := balances_re_ent38#904[__this := balances_re_ent38#904[__this][__msg_sender := (balances_re_ent38#904[__this][__msg_sender] - _weiToWithdraw#906)]];
	$return25:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 301, 5} {:message "TokenERC20::burn"} burn#974(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#940: int)
	returns (success#943: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#390[__this][__msg_sender] >= _value#940);
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][__msg_sender := (balanceOf#390[__this][__msg_sender] - _value#940)]];
	totalSupply#354 := totalSupply#354[__this := (totalSupply#354[__this] - _value#940)];
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 305, 14} {:message ""} true;
	call Burn#557(__this, __msg_sender, __msg_value, call_arg#29, _value#940);
	success#943 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 308, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#978: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_8.sol", 309, 1} {:message "TokenERC20::claimReward_re_ent4"} claimReward_re_ent4#1014(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 312, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#991: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#978[__this][__msg_sender] > 0);
	transferValue_re_ent4#991 := redeemableEther_re_ent4#978[__this][__msg_sender];
	assume {:sourceloc "buggy_8.sol", 313, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#991);
	redeemableEther_re_ent4#978 := redeemableEther_re_ent4#978[__this := redeemableEther_re_ent4#978[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 325, 5} {:message "TokenERC20::burnFrom"} burnFrom#1070(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1017: address_t, _value#1019: int)
	returns (success#1022: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#390[__this][_from#1017] >= _value#1019);
	assume (_value#1019 <= allowance#430[__this][_from#1017][__msg_sender]);
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][_from#1017 := (balanceOf#390[__this][_from#1017] - _value#1019)]];
	allowance#430 := allowance#430[__this := allowance#430[__this][_from#1017 := allowance#430[__this][_from#1017][__msg_sender := (allowance#430[__this][_from#1017][__msg_sender] - _value#1019)]]];
	totalSupply#354 := totalSupply#354[__this := (totalSupply#354[__this] - _value#1019)];
	assume {:sourceloc "buggy_8.sol", 331, 14} {:message ""} true;
	call Burn#557(__this, __msg_sender, __msg_value, _from#1017, _value#1019);
	success#1022 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_8.sol", 334, 1} {:message "counter_re_ent7"} counter_re_ent7#1073: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_8.sol", 335, 1} {:message "TokenERC20::callme_re_ent7"} callme_re_ent7#1102(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1073[__this] <= 5);
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_8.sol", 337, 9} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	counter_re_ent7#1073 := counter_re_ent7#1073[__this := (counter_re_ent7#1073[__this] + 1)];
	$return29:
	// Function body ends here
}

// 
// ------- Contract: YFT -------
// Inherits from: Ownable
// Inherits from: TokenERC20
// 
// Event: FrozenFunds
procedure {:inline 1} {:sourceloc "buggy_8.sol", 389, 3} {:message "[event] YFT::FrozenFunds"} FrozenFunds#1276(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1272: address_t, frozen#1274: bool)
{
	
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 350, 3} {:message "balances_re_ent17"} balances_re_ent17#1111: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 351, 1} {:message "YFT::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#1150(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1113: int)
{
	var {:sourceloc "buggy_8.sol", 354, 10} {:message "success"} success#1126: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#1111[__this][__msg_sender] >= _weiToWithdraw#1113);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1113);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1113)];
	assume {:sourceloc "buggy_8.sol", 354, 25} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, _weiToWithdraw#1113);
	if (__call_ret#32) {
	havoc balances_re_ent17#1111;
	havoc sellPrice#1152;
	havoc lastPlayer_re_ent37#1154;
	havoc jackpot_re_ent37#1156;
	havoc buyPrice#1188;
	havoc balances_re_ent3#1192;
	havoc frozenAccount#1235;
	havoc not_called_re_ent13#1238;
	havoc lastPlayer_re_ent23#1293;
	havoc jackpot_re_ent23#1295;
	havoc counter_re_ent14#1400;
	havoc lastPlayer_re_ent30#1473;
	havoc jackpot_re_ent30#1475;
	havoc balances_re_ent8#1531;
	havoc redeemableEther_re_ent39#1583;
	havoc balances_re_ent36#1645;
	havoc counter_re_ent35#1715;
	havoc userBalance_re_ent12#213;
	havoc name#244;
	havoc redeemableEther_re_ent11#248;
	havoc symbol#286;
	havoc balances_re_ent1#290;
	havoc decimals#322;
	havoc not_called_re_ent41#325;
	havoc totalSupply#354;
	havoc counter_re_ent42#357;
	havoc balanceOf#390;
	havoc lastPlayer_re_ent2#392;
	havoc jackpot_re_ent2#394;
	havoc allowance#430;
	havoc userBalance_re_ent33#434;
	havoc not_called_re_ent27#479;
	havoc balances_re_ent31#518;
	havoc userBalance_re_ent19#593;
	havoc userBalance_re_ent26#706;
	havoc not_called_re_ent20#763;
	havoc redeemableEther_re_ent32#835;
	havoc balances_re_ent38#904;
	havoc redeemableEther_re_ent4#978;
	havoc counter_re_ent7#1073;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#172;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1113)];
	}

	success#1126 := __call_ret#32;
	assume success#1126;
	balances_re_ent17#1111 := balances_re_ent17#1111[__this := balances_re_ent17#1111[__this][__msg_sender := (balances_re_ent17#1111[__this][__msg_sender] - _weiToWithdraw#1113)]];
	$return30:
	// Function body ends here
}

// 
// State variable: sellPrice: uint256
var {:sourceloc "buggy_8.sol", 358, 3} {:message "sellPrice"} sellPrice#1152: [address_t]int;
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_8.sol", 359, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#1154: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_8.sol", 360, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#1156: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_8.sol", 361, 4} {:message "YFT::buyTicket_re_ent37"} buyTicket_re_ent37#1186(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_8.sol", 362, 12} {:message ""} true;
	call __send_ret#34 := __send(lastPlayer_re_ent37#1154[__this], __this, 0, jackpot_re_ent37#1156[__this]);
	if (!(__send_ret#34)) {
	assume false;
	}

	lastPlayer_re_ent37#1154 := lastPlayer_re_ent37#1154[__this := __msg_sender];
	jackpot_re_ent37#1156 := jackpot_re_ent37#1156[__this := __balance[__this]];
	$return31:
	// Function body ends here
}

// 
// State variable: buyPrice: uint256
var {:sourceloc "buggy_8.sol", 367, 3} {:message "buyPrice"} buyPrice#1188: [address_t]int;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 369, 3} {:message "balances_re_ent3"} balances_re_ent3#1192: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 370, 1} {:message "YFT::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#1231(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1194: int)
{
	var {:sourceloc "buggy_8.sol", 373, 3} {:message "success"} success#1207: bool;
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#1192[__this][__msg_sender] >= _weiToWithdraw#1194);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1194);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1194)];
	assume {:sourceloc "buggy_8.sol", 373, 19} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(__msg_sender, __this, _weiToWithdraw#1194);
	if (__call_ret#35) {
	havoc balances_re_ent17#1111;
	havoc sellPrice#1152;
	havoc lastPlayer_re_ent37#1154;
	havoc jackpot_re_ent37#1156;
	havoc buyPrice#1188;
	havoc balances_re_ent3#1192;
	havoc frozenAccount#1235;
	havoc not_called_re_ent13#1238;
	havoc lastPlayer_re_ent23#1293;
	havoc jackpot_re_ent23#1295;
	havoc counter_re_ent14#1400;
	havoc lastPlayer_re_ent30#1473;
	havoc jackpot_re_ent30#1475;
	havoc balances_re_ent8#1531;
	havoc redeemableEther_re_ent39#1583;
	havoc balances_re_ent36#1645;
	havoc counter_re_ent35#1715;
	havoc userBalance_re_ent12#213;
	havoc name#244;
	havoc redeemableEther_re_ent11#248;
	havoc symbol#286;
	havoc balances_re_ent1#290;
	havoc decimals#322;
	havoc not_called_re_ent41#325;
	havoc totalSupply#354;
	havoc counter_re_ent42#357;
	havoc balanceOf#390;
	havoc lastPlayer_re_ent2#392;
	havoc jackpot_re_ent2#394;
	havoc allowance#430;
	havoc userBalance_re_ent33#434;
	havoc not_called_re_ent27#479;
	havoc balances_re_ent31#518;
	havoc userBalance_re_ent19#593;
	havoc userBalance_re_ent26#706;
	havoc not_called_re_ent20#763;
	havoc redeemableEther_re_ent32#835;
	havoc balances_re_ent38#904;
	havoc redeemableEther_re_ent4#978;
	havoc counter_re_ent7#1073;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#172;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1194)];
	}

	success#1207 := __call_ret#35;
	assume success#1207;
	balances_re_ent3#1192 := balances_re_ent3#1192[__this := balances_re_ent3#1192[__this][__msg_sender := (balances_re_ent3#1192[__this][__msg_sender] - _weiToWithdraw#1194)]];
	$return32:
	// Function body ends here
}

// 
// State variable: frozenAccount: mapping(address => bool)
var {:sourceloc "buggy_8.sol", 377, 3} {:message "frozenAccount"} frozenAccount#1235: [address_t][address_t]bool;
// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_8.sol", 380, 3} {:message "not_called_re_ent13"} not_called_re_ent13#1238: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_8.sol", 381, 1} {:message "YFT::bug_re_ent13"} bug_re_ent13#1270(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 383, 10} {:message "success"} success#1246: bool;
	var __call_ret#37: bool;
	var __call_ret#38: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1238[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_8.sol", 383, 25} {:message ""} true;
	call __call_ret#37, __call_ret#38 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#37) {
	havoc balances_re_ent17#1111;
	havoc sellPrice#1152;
	havoc lastPlayer_re_ent37#1154;
	havoc jackpot_re_ent37#1156;
	havoc buyPrice#1188;
	havoc balances_re_ent3#1192;
	havoc frozenAccount#1235;
	havoc not_called_re_ent13#1238;
	havoc lastPlayer_re_ent23#1293;
	havoc jackpot_re_ent23#1295;
	havoc counter_re_ent14#1400;
	havoc lastPlayer_re_ent30#1473;
	havoc jackpot_re_ent30#1475;
	havoc balances_re_ent8#1531;
	havoc redeemableEther_re_ent39#1583;
	havoc balances_re_ent36#1645;
	havoc counter_re_ent35#1715;
	havoc userBalance_re_ent12#213;
	havoc name#244;
	havoc redeemableEther_re_ent11#248;
	havoc symbol#286;
	havoc balances_re_ent1#290;
	havoc decimals#322;
	havoc not_called_re_ent41#325;
	havoc totalSupply#354;
	havoc counter_re_ent42#357;
	havoc balanceOf#390;
	havoc lastPlayer_re_ent2#392;
	havoc jackpot_re_ent2#394;
	havoc allowance#430;
	havoc userBalance_re_ent33#434;
	havoc not_called_re_ent27#479;
	havoc balances_re_ent31#518;
	havoc userBalance_re_ent19#593;
	havoc userBalance_re_ent26#706;
	havoc not_called_re_ent20#763;
	havoc redeemableEther_re_ent32#835;
	havoc balances_re_ent38#904;
	havoc redeemableEther_re_ent4#978;
	havoc counter_re_ent7#1073;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#172;
	havoc __balance;
	}

	if (!(__call_ret#37)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1246 := __call_ret#37;
	if (!(success#1246)) {
	assume false;
	}

	not_called_re_ent13#1238 := not_called_re_ent13#1238[__this := false];
	$return33:
	// Function body ends here
}

function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 392, 5} {:message "YFT::[constructor]"} __constructor#1745(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#1278: int, tokenName#1280: int_arr_ptr, tokenSymbol#1282: int_arr_ptr)
{
	var initialSupply#560#39: int;
	var tokenName#562#39: int_arr_ptr;
	var tokenSymbol#564#39: int_arr_ptr;
	// TCC assumptions
	assume (tokenName#1280 < __alloc_counter);
	assume (tokenSymbol#1282 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent17#1111 := balances_re_ent17#1111[__this := default_address_t_int()];
	sellPrice#1152 := sellPrice#1152[__this := 0];
	lastPlayer_re_ent37#1154 := lastPlayer_re_ent37#1154[__this := 0];
	jackpot_re_ent37#1156 := jackpot_re_ent37#1156[__this := 0];
	buyPrice#1188 := buyPrice#1188[__this := 0];
	balances_re_ent3#1192 := balances_re_ent3#1192[__this := default_address_t_int()];
	frozenAccount#1235 := frozenAccount#1235[__this := default_address_t_bool()];
	not_called_re_ent13#1238 := not_called_re_ent13#1238[__this := true];
	lastPlayer_re_ent23#1293 := lastPlayer_re_ent23#1293[__this := 0];
	jackpot_re_ent23#1295 := jackpot_re_ent23#1295[__this := 0];
	counter_re_ent14#1400 := counter_re_ent14#1400[__this := 0];
	lastPlayer_re_ent30#1473 := lastPlayer_re_ent30#1473[__this := 0];
	jackpot_re_ent30#1475 := jackpot_re_ent30#1475[__this := 0];
	balances_re_ent8#1531 := balances_re_ent8#1531[__this := default_address_t_int()];
	redeemableEther_re_ent39#1583 := redeemableEther_re_ent39#1583[__this := default_address_t_int()];
	balances_re_ent36#1645 := balances_re_ent36#1645[__this := default_address_t_int()];
	counter_re_ent35#1715 := counter_re_ent35#1715[__this := 0];
	userBalance_re_ent12#213 := userBalance_re_ent12#213[__this := default_address_t_int()];
	name#244 := name#244[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent11#248 := redeemableEther_re_ent11#248[__this := default_address_t_int()];
	symbol#286 := symbol#286[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#290 := balances_re_ent1#290[__this := default_address_t_int()];
	decimals#322 := decimals#322[__this := 18];
	not_called_re_ent41#325 := not_called_re_ent41#325[__this := true];
	totalSupply#354 := totalSupply#354[__this := 0];
	counter_re_ent42#357 := counter_re_ent42#357[__this := 0];
	balanceOf#390 := balanceOf#390[__this := default_address_t_int()];
	lastPlayer_re_ent2#392 := lastPlayer_re_ent2#392[__this := 0];
	jackpot_re_ent2#394 := jackpot_re_ent2#394[__this := 0];
	allowance#430 := allowance#430[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent33#434 := userBalance_re_ent33#434[__this := default_address_t_int()];
	not_called_re_ent27#479 := not_called_re_ent27#479[__this := true];
	balances_re_ent31#518 := balances_re_ent31#518[__this := default_address_t_int()];
	userBalance_re_ent19#593 := userBalance_re_ent19#593[__this := default_address_t_int()];
	userBalance_re_ent26#706 := userBalance_re_ent26#706[__this := default_address_t_int()];
	not_called_re_ent20#763 := not_called_re_ent20#763[__this := true];
	redeemableEther_re_ent32#835 := redeemableEther_re_ent32#835[__this := default_address_t_int()];
	balances_re_ent38#904 := balances_re_ent38#904[__this := default_address_t_int()];
	redeemableEther_re_ent4#978 := redeemableEther_re_ent4#978[__this := default_address_t_int()];
	counter_re_ent7#1073 := counter_re_ent7#1073[__this := 0];
	balances_re_ent21#5 := balances_re_ent21#5[__this := default_address_t_int()];
	owner#36 := owner#36[__this := 0];
	userBalance_re_ent40#40 := userBalance_re_ent40#40[__this := default_address_t_int()];
	lastPlayer_re_ent9#92 := lastPlayer_re_ent9#92[__this := 0];
	jackpot_re_ent9#94 := jackpot_re_ent9#94[__this := 0];
	redeemableEther_re_ent25#172 := redeemableEther_re_ent25#172[__this := default_address_t_int()];
	// Arguments for TokenERC20
	initialSupply#560#39 := initialSupply#1278;
	tokenName#562#39 := tokenName#1280;
	tokenSymbol#564#39 := tokenSymbol#1282;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#36 := owner#36[__this := __msg_sender];
	$return34:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	totalSupply#354 := totalSupply#354[__this := (initialSupply#560#39 * 1000000000000000000)];
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][__msg_sender := totalSupply#354[__this]]];
	name#244 := name#244[__this := mem_arr_int[tokenName#562#39]];
	symbol#286 := symbol#286[__this := mem_arr_int[tokenSymbol#564#39]];
	$return35:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return36:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_8.sol", 397, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1293: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_8.sol", 398, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1295: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_8.sol", 399, 4} {:message "YFT::buyTicket_re_ent23"} buyTicket_re_ent23#1325(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_8.sol", 400, 12} {:message ""} true;
	call __send_ret#42 := __send(lastPlayer_re_ent23#1293[__this], __this, 0, jackpot_re_ent23#1295[__this]);
	if (!(__send_ret#42)) {
	assume false;
	}

	lastPlayer_re_ent23#1293 := lastPlayer_re_ent23#1293[__this := __msg_sender];
	jackpot_re_ent23#1295 := jackpot_re_ent23#1295[__this := __balance[__this]];
	$return37:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_8.sol", 407, 5} {:message "YFT::_transfer"} _transfer#1397(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1327: address_t, _to#1329: address_t, _value#1331: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1329 != 0);
	assume (balanceOf#390[__this][_from#1327] >= _value#1331);
	assume ((balanceOf#390[__this][_to#1329] + _value#1331) >= balanceOf#390[__this][_to#1329]);
	assume !(frozenAccount#1235[__this][_from#1327]);
	assume !(frozenAccount#1235[__this][_to#1329]);
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][_from#1327 := (balanceOf#390[__this][_from#1327] - _value#1331)]];
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][_to#1329 := (balanceOf#390[__this][_to#1329] + _value#1331)]];
	assume {:sourceloc "buggy_8.sol", 415, 14} {:message ""} true;
	call Transfer#476(__this, __msg_sender, __msg_value, _from#1327, _to#1329, _value#1331);
	$return38:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_8.sol", 417, 1} {:message "counter_re_ent14"} counter_re_ent14#1400: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_8.sol", 418, 1} {:message "YFT::callme_re_ent14"} callme_re_ent14#1429(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1400[__this] <= 5);
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_8.sol", 420, 9} {:message ""} true;
	call __send_ret#44 := __send(__msg_sender, __this, 0, call_arg#43);
	if (!(__send_ret#44)) {
	assume false;
	}

	counter_re_ent14#1400 := counter_re_ent14#1400[__this := (counter_re_ent14#1400[__this] + 1)];
	$return39:
	// Function body ends here
}

// 
// Function: mintToken : function (address,uint256)
procedure {:sourceloc "buggy_8.sol", 429, 5} {:message "YFT::mintToken"} mintToken#1471(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1432: address_t, mintedAmount#1434: int)
{
	var call_arg#47: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	balanceOf#390 := balanceOf#390[__this := balanceOf#390[__this][target#1432 := (balanceOf#390[__this][target#1432] + mintedAmount#1434)]];
	totalSupply#354 := totalSupply#354[__this := (totalSupply#354[__this] + mintedAmount#1434)];
	call_arg#47 := 0;
	assume {:sourceloc "buggy_8.sol", 432, 14} {:message ""} true;
	call Transfer#476(__this, __msg_sender, __msg_value, call_arg#47, __this, mintedAmount#1434);
	assume {:sourceloc "buggy_8.sol", 433, 14} {:message ""} true;
	call Transfer#476(__this, __msg_sender, __msg_value, __this, target#1432, mintedAmount#1434);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_8.sol", 435, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1473: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_8.sol", 436, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1475: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_8.sol", 437, 4} {:message "YFT::buyTicket_re_ent30"} buyTicket_re_ent30#1505(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_8.sol", 438, 12} {:message ""} true;
	call __send_ret#48 := __send(lastPlayer_re_ent30#1473[__this], __this, 0, jackpot_re_ent30#1475[__this]);
	if (!(__send_ret#48)) {
	assume false;
	}

	lastPlayer_re_ent30#1473 := lastPlayer_re_ent30#1473[__this := __msg_sender];
	jackpot_re_ent30#1475 := jackpot_re_ent30#1475[__this := __balance[__this]];
	$return42:
	// Function body ends here
}

// 
// Function: freezeAccount : function (address,bool)
procedure {:sourceloc "buggy_8.sol", 447, 5} {:message "YFT::freezeAccount"} freezeAccount#1527(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1508: address_t, freeze#1510: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	frozenAccount#1235 := frozenAccount#1235[__this := frozenAccount#1235[__this][target#1508 := freeze#1510]];
	assume {:sourceloc "buggy_8.sol", 449, 14} {:message ""} true;
	call FrozenFunds#1276(__this, __msg_sender, __msg_value, target#1508, freeze#1510);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 451, 1} {:message "balances_re_ent8"} balances_re_ent8#1531: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_8.sol", 452, 5} {:message "YFT::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1560(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 453, 9} {:message "success"} success#1535: bool;
	var __call_ret#51: bool;
	var __call_ret#52: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1531[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1531[__this][__msg_sender])];
	assume {:sourceloc "buggy_8.sol", 453, 26} {:message ""} true;
	call __call_ret#51, __call_ret#52 := __call(__msg_sender, __this, balances_re_ent8#1531[__this][__msg_sender]);
	if (__call_ret#51) {
	havoc balances_re_ent17#1111;
	havoc sellPrice#1152;
	havoc lastPlayer_re_ent37#1154;
	havoc jackpot_re_ent37#1156;
	havoc buyPrice#1188;
	havoc balances_re_ent3#1192;
	havoc frozenAccount#1235;
	havoc not_called_re_ent13#1238;
	havoc lastPlayer_re_ent23#1293;
	havoc jackpot_re_ent23#1295;
	havoc counter_re_ent14#1400;
	havoc lastPlayer_re_ent30#1473;
	havoc jackpot_re_ent30#1475;
	havoc balances_re_ent8#1531;
	havoc redeemableEther_re_ent39#1583;
	havoc balances_re_ent36#1645;
	havoc counter_re_ent35#1715;
	havoc userBalance_re_ent12#213;
	havoc name#244;
	havoc redeemableEther_re_ent11#248;
	havoc symbol#286;
	havoc balances_re_ent1#290;
	havoc decimals#322;
	havoc not_called_re_ent41#325;
	havoc totalSupply#354;
	havoc counter_re_ent42#357;
	havoc balanceOf#390;
	havoc lastPlayer_re_ent2#392;
	havoc jackpot_re_ent2#394;
	havoc allowance#430;
	havoc userBalance_re_ent33#434;
	havoc not_called_re_ent27#479;
	havoc balances_re_ent31#518;
	havoc userBalance_re_ent19#593;
	havoc userBalance_re_ent26#706;
	havoc not_called_re_ent20#763;
	havoc redeemableEther_re_ent32#835;
	havoc balances_re_ent38#904;
	havoc redeemableEther_re_ent4#978;
	havoc counter_re_ent7#1073;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#172;
	havoc __balance;
	}

	if (!(__call_ret#51)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1531[__this][__msg_sender])];
	}

	success#1535 := __call_ret#51;
	if (success#1535) {
	balances_re_ent8#1531 := balances_re_ent8#1531[__this := balances_re_ent8#1531[__this][__msg_sender := 0]];
	}

	$return45:
	// Function body ends here
}

// 
// Function: setPrices : function (uint256,uint256)
procedure {:sourceloc "buggy_8.sol", 461, 5} {:message "YFT::setPrices"} setPrices#1579(__this: address_t, __msg_sender: address_t, __msg_value: int, newSellPrice#1563: int, newBuyPrice#1565: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	sellPrice#1152 := sellPrice#1152[__this := newSellPrice#1563];
	buyPrice#1188 := buyPrice#1188[__this := newBuyPrice#1565];
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 465, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1583: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_8.sol", 466, 1} {:message "YFT::claimReward_re_ent39"} claimReward_re_ent39#1619(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 469, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1596: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1583[__this][__msg_sender] > 0);
	transferValue_re_ent39#1596 := redeemableEther_re_ent39#1583[__this][__msg_sender];
	assume {:sourceloc "buggy_8.sol", 470, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1596);
	redeemableEther_re_ent39#1583 := redeemableEther_re_ent39#1583[__this := redeemableEther_re_ent39#1583[__this][__msg_sender := 0]];
	$return48:
	// Function body ends here
}

// 
// Function: buy : function ()
procedure {:sourceloc "buggy_8.sol", 475, 5} {:message "YFT::buy"} buy#1641(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 476, 9} {:message "amount"} amount#1624: int;
	var call_arg#55: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	amount#1624 := (__msg_value div buyPrice#1188[__this]);
	call_arg#55 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 477, 9} {:message ""} true;
	call _transfer#1397(__this, __msg_sender, __msg_value, __this, call_arg#55, amount#1624);
	$return49:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 479, 1} {:message "balances_re_ent36"} balances_re_ent36#1645: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_8.sol", 480, 5} {:message "YFT::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1668(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_8.sol", 481, 12} {:message ""} true;
	call __send_ret#56 := __send(__msg_sender, __this, 0, balances_re_ent36#1645[__this][__msg_sender]);
	if (__send_ret#56) {
	balances_re_ent36#1645 := balances_re_ent36#1645[__this := balances_re_ent36#1645[__this][__msg_sender := 0]];
	}

	$return50:
	// Function body ends here
}

// 
// Function: sell : function (uint256)
procedure {:sourceloc "buggy_8.sol", 487, 5} {:message "YFT::sell"} sell#1712(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1671: int)
{
	var {:sourceloc "buggy_8.sol", 488, 9} {:message "myAddress"} myAddress#1675: address_t;
	var call_arg#57: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	myAddress#1675 := __this;
	assume (__balance[myAddress#1675] >= (amount#1671 * sellPrice#1152[__this]));
	call_arg#57 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 490, 9} {:message ""} true;
	call _transfer#1397(__this, __msg_sender, __msg_value, call_arg#57, __this, amount#1671);
	assume {:sourceloc "buggy_8.sol", 491, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, (amount#1671 * sellPrice#1152[__this]));
	$return51:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_8.sol", 493, 1} {:message "counter_re_ent35"} counter_re_ent35#1715: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_8.sol", 494, 1} {:message "YFT::callme_re_ent35"} callme_re_ent35#1744(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#58: int;
	var __send_ret#59: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1715[__this] <= 5);
	call_arg#58 := 10000000000000000000;
	assume {:sourceloc "buggy_8.sol", 496, 9} {:message ""} true;
	call __send_ret#59 := __send(__msg_sender, __this, 0, call_arg#58);
	if (!(__send_ret#59)) {
	assume false;
	}

	counter_re_ent35#1715 := counter_re_ent35#1715[__this := (counter_re_ent35#1715[__this] + 1)];
	$return52:
	// Function body ends here
}

