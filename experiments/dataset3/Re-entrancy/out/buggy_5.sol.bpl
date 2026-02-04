// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_5.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_5.sol", 26, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#80(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#76: address_t, newOwner#78: address_t)
{
	
}

// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 8, 1} {:message "balances_re_ent21"} balances_re_ent21#5: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_5.sol", 9, 3} {:message "Ownable::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#34(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 10, 7} {:message "success"} success#9: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#5[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#5[__this][__msg_sender])];
	assume {:sourceloc "buggy_5.sol", 10, 23} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, balances_re_ent21#5[__this][__msg_sender]);
	if (__call_ret#0) {
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#175;
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
var {:sourceloc "buggy_5.sol", 14, 3} {:message "owner"} owner#36: [address_t]address_t;
// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 16, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#40: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_5.sol", 17, 1} {:message "Ownable::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#74(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 20, 6} {:message "success"} success#44: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#40[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#40[__this][__msg_sender])];
	assume {:sourceloc "buggy_5.sol", 20, 21} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(__msg_sender, __this, userBalance_re_ent40#40[__this][__msg_sender]);
	if (__call_ret#2) {
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#175;
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
procedure {:sourceloc "buggy_5.sol", 33, 3} {:message "Ownable::[constructor]"} __constructor#212(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent21#5 := balances_re_ent21#5[__this := default_address_t_int()];
	owner#36 := owner#36[__this := 0];
	userBalance_re_ent40#40 := userBalance_re_ent40#40[__this := default_address_t_int()];
	lastPlayer_re_ent9#92 := lastPlayer_re_ent9#92[__this := 0];
	jackpot_re_ent9#94 := jackpot_re_ent9#94[__this := 0];
	redeemableEther_re_ent25#175 := redeemableEther_re_ent25#175[__this := default_address_t_int()];
	// Function body starts here
	owner#36 := owner#36[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_5.sol", 36, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#92: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_5.sol", 37, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#94: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_5.sol", 38, 7} {:message "Ownable::buyTicket_re_ent9"} buyTicket_re_ent9#132(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 39, 7} {:message "success"} success#98: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#94[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#94[__this])];
	assume {:sourceloc "buggy_5.sol", 39, 24} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(lastPlayer_re_ent9#92[__this], __this, jackpot_re_ent9#94[__this]);
	if (__call_ret#4) {
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#175;
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
procedure {:sourceloc "buggy_5.sol", 58, 3} {:message "Ownable::transferOwnership"} transferOwnership#171(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#147: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	assume (newOwner#147 != 0);
	assume {:sourceloc "buggy_5.sol", 60, 10} {:message ""} true;
	call OwnershipTransferred#80(__this, __msg_sender, __msg_value, owner#36[__this], newOwner#147);
	owner#36 := owner#36[__this := newOwner#147];
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 63, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#175: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_5.sol", 64, 1} {:message "Ownable::claimReward_re_ent25"} claimReward_re_ent25#211(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 67, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#188: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#175[__this][__msg_sender] > 0);
	transferValue_re_ent25#188 := redeemableEther_re_ent25#175[__this][__msg_sender];
	assume {:sourceloc "buggy_5.sol", 68, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#188);
	redeemableEther_re_ent25#175 := redeemableEther_re_ent25#175[__this := redeemableEther_re_ent25#175[__this][__msg_sender := 0]];
	$return6:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_5.sol", 144, 3} {:message "[event] TokenERC20::Transfer"} Transfer#479(__this: address_t, __msg_sender: address_t, __msg_value: int, from#473: address_t, to#475: address_t, value#477: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_5.sol", 155, 3} {:message "[event] TokenERC20::Approval"} Approval#517(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#511: address_t, _spender#513: address_t, _value#515: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_5.sol", 165, 3} {:message "[event] TokenERC20::Burn"} Burn#560(__this: address_t, __msg_sender: address_t, __msg_value: int, from#556: address_t, value#558: int)
{
	
}

// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 76, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#216: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_5.sol", 77, 1} {:message "TokenERC20::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#245(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 80, 12} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, userBalance_re_ent12#216[__this][__msg_sender]);
	if (!(__send_ret#8)) {
	assume false;
	}

	userBalance_re_ent12#216 := userBalance_re_ent12#216[__this := userBalance_re_ent12#216[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_5.sol", 85, 3} {:message "name"} name#247: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 86, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#251: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_5.sol", 87, 1} {:message "TokenERC20::claimReward_re_ent11"} claimReward_re_ent11#287(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 90, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#264: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#251[__this][__msg_sender] > 0);
	transferValue_re_ent11#264 := redeemableEther_re_ent11#251[__this][__msg_sender];
	assume {:sourceloc "buggy_5.sol", 91, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#264);
	redeemableEther_re_ent11#251 := redeemableEther_re_ent11#251[__this := redeemableEther_re_ent11#251[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_5.sol", 94, 3} {:message "symbol"} symbol#289: [address_t]int_arr_type;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 95, 3} {:message "balances_re_ent1"} balances_re_ent1#293: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_5.sol", 96, 5} {:message "TokenERC20::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#322(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 97, 9} {:message "success"} success#297: bool;
	var __call_ret#9: bool;
	var __call_ret#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#293[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#293[__this][__msg_sender])];
	assume {:sourceloc "buggy_5.sol", 97, 25} {:message ""} true;
	call __call_ret#9, __call_ret#10 := __call(__msg_sender, __this, balances_re_ent1#293[__this][__msg_sender]);
	if (__call_ret#9) {
	havoc userBalance_re_ent12#216;
	havoc name#247;
	havoc redeemableEther_re_ent11#251;
	havoc symbol#289;
	havoc balances_re_ent1#293;
	havoc decimals#325;
	havoc not_called_re_ent41#328;
	havoc totalSupply#357;
	havoc counter_re_ent42#360;
	havoc balanceOf#393;
	havoc lastPlayer_re_ent2#395;
	havoc jackpot_re_ent2#397;
	havoc allowance#433;
	havoc userBalance_re_ent33#437;
	havoc not_called_re_ent27#482;
	havoc balances_re_ent31#521;
	havoc userBalance_re_ent19#596;
	havoc userBalance_re_ent26#709;
	havoc not_called_re_ent20#766;
	havoc redeemableEther_re_ent32#838;
	havoc balances_re_ent38#907;
	havoc redeemableEther_re_ent4#981;
	havoc counter_re_ent7#1076;
	havoc __balance;
	}

	if (!(__call_ret#9)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#293[__this][__msg_sender])];
	}

	success#297 := __call_ret#9;
	if (success#297) {
	balances_re_ent1#293 := balances_re_ent1#293[__this := balances_re_ent1#293[__this][__msg_sender := 0]];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_5.sol", 101, 3} {:message "decimals"} decimals#325: [address_t]int;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_5.sol", 103, 3} {:message "not_called_re_ent41"} not_called_re_ent41#328: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_5.sol", 104, 1} {:message "TokenERC20::bug_re_ent41"} bug_re_ent41#355(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#328[__this];
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_5.sol", 106, 12} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	assume false;
	}

	not_called_re_ent41#328 := not_called_re_ent41#328[__this := false];
	$return10:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_5.sol", 111, 3} {:message "totalSupply"} totalSupply#357: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_5.sol", 114, 3} {:message "counter_re_ent42"} counter_re_ent42#360: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_5.sol", 115, 1} {:message "TokenERC20::callme_re_ent42"} callme_re_ent42#389(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#360[__this] <= 5);
	call_arg#13 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 117, 9} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	assume false;
	}

	counter_re_ent42#360 := counter_re_ent42#360[__this := (counter_re_ent42#360[__this] + 1)];
	$return11:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 122, 3} {:message "balanceOf"} balanceOf#393: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_5.sol", 123, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#395: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_5.sol", 124, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#397: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_5.sol", 125, 4} {:message "TokenERC20::buyTicket_re_ent2"} buyTicket_re_ent2#427(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 126, 12} {:message ""} true;
	call __send_ret#15 := __send(lastPlayer_re_ent2#395[__this], __this, 0, jackpot_re_ent2#397[__this]);
	if (!(__send_ret#15)) {
	assume false;
	}

	lastPlayer_re_ent2#395 := lastPlayer_re_ent2#395[__this := __msg_sender];
	jackpot_re_ent2#397 := jackpot_re_ent2#397[__this := __balance[__this]];
	$return12:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_5.sol", 131, 3} {:message "allowance"} allowance#433: [address_t][address_t][address_t]int;
// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 134, 3} {:message "userBalance_re_ent33"} userBalance_re_ent33#437: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_5.sol", 135, 1} {:message "TokenERC20::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#471(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 138, 6} {:message "success"} success#441: bool;
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#437[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#437[__this][__msg_sender])];
	assume {:sourceloc "buggy_5.sol", 138, 22} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(__msg_sender, __this, userBalance_re_ent33#437[__this][__msg_sender]);
	if (__call_ret#16) {
	havoc userBalance_re_ent12#216;
	havoc name#247;
	havoc redeemableEther_re_ent11#251;
	havoc symbol#289;
	havoc balances_re_ent1#293;
	havoc decimals#325;
	havoc not_called_re_ent41#328;
	havoc totalSupply#357;
	havoc counter_re_ent42#360;
	havoc balanceOf#393;
	havoc lastPlayer_re_ent2#395;
	havoc jackpot_re_ent2#397;
	havoc allowance#433;
	havoc userBalance_re_ent33#437;
	havoc not_called_re_ent27#482;
	havoc balances_re_ent31#521;
	havoc userBalance_re_ent19#596;
	havoc userBalance_re_ent26#709;
	havoc not_called_re_ent20#766;
	havoc redeemableEther_re_ent32#838;
	havoc balances_re_ent38#907;
	havoc redeemableEther_re_ent4#981;
	havoc counter_re_ent7#1076;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#437[__this][__msg_sender])];
	}

	success#441 := __call_ret#16;
	if (!(success#441)) {
	assume false;
	}

	userBalance_re_ent33#437 := userBalance_re_ent33#437[__this := userBalance_re_ent33#437[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_5.sol", 147, 3} {:message "not_called_re_ent27"} not_called_re_ent27#482: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_5.sol", 148, 1} {:message "TokenERC20::bug_re_ent27"} bug_re_ent27#509(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#482[__this];
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_5.sol", 150, 16} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	assume false;
	}

	not_called_re_ent27#482 := not_called_re_ent27#482[__this := false];
	$return14:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 158, 3} {:message "balances_re_ent31"} balances_re_ent31#521: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_5.sol", 159, 1} {:message "TokenERC20::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#554(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#523: int)
{
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#521[__this][__msg_sender] >= _weiToWithdraw#523);
	assume {:sourceloc "buggy_5.sol", 162, 17} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, _weiToWithdraw#523);
	assume __send_ret#20;
	balances_re_ent31#521 := balances_re_ent31#521[__this := balances_re_ent31#521[__this][__msg_sender := (balances_re_ent31#521[__this][__msg_sender] - _weiToWithdraw#523)]];
	$return15:
	// Function body ends here
}

function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_5.sol", 172, 5} {:message "TokenERC20::[constructor]"} __constructor#1106(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#563: int, tokenName#565: int_arr_ptr, tokenSymbol#567: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#565 < __alloc_counter);
	assume (tokenSymbol#567 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent12#216 := userBalance_re_ent12#216[__this := default_address_t_int()];
	name#247 := name#247[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent11#251 := redeemableEther_re_ent11#251[__this := default_address_t_int()];
	symbol#289 := symbol#289[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#293 := balances_re_ent1#293[__this := default_address_t_int()];
	decimals#325 := decimals#325[__this := 18];
	not_called_re_ent41#328 := not_called_re_ent41#328[__this := true];
	totalSupply#357 := totalSupply#357[__this := 0];
	counter_re_ent42#360 := counter_re_ent42#360[__this := 0];
	balanceOf#393 := balanceOf#393[__this := default_address_t_int()];
	lastPlayer_re_ent2#395 := lastPlayer_re_ent2#395[__this := 0];
	jackpot_re_ent2#397 := jackpot_re_ent2#397[__this := 0];
	allowance#433 := allowance#433[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent33#437 := userBalance_re_ent33#437[__this := default_address_t_int()];
	not_called_re_ent27#482 := not_called_re_ent27#482[__this := true];
	balances_re_ent31#521 := balances_re_ent31#521[__this := default_address_t_int()];
	userBalance_re_ent19#596 := userBalance_re_ent19#596[__this := default_address_t_int()];
	userBalance_re_ent26#709 := userBalance_re_ent26#709[__this := default_address_t_int()];
	not_called_re_ent20#766 := not_called_re_ent20#766[__this := true];
	redeemableEther_re_ent32#838 := redeemableEther_re_ent32#838[__this := default_address_t_int()];
	balances_re_ent38#907 := balances_re_ent38#907[__this := default_address_t_int()];
	redeemableEther_re_ent4#981 := redeemableEther_re_ent4#981[__this := default_address_t_int()];
	counter_re_ent7#1076 := counter_re_ent7#1076[__this := 0];
	// Function body starts here
	totalSupply#357 := totalSupply#357[__this := (initialSupply#563 * 1000000000000000000)];
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][__msg_sender := totalSupply#357[__this]]];
	name#247 := name#247[__this := mem_arr_int[tokenName#565]];
	symbol#289 := symbol#289[__this := mem_arr_int[tokenSymbol#567]];
	$return16:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 182, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#596: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_5.sol", 183, 1} {:message "TokenERC20::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#625(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 186, 16} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, userBalance_re_ent19#596[__this][__msg_sender]);
	if (!(__send_ret#21)) {
	assume false;
	}

	userBalance_re_ent19#596 := userBalance_re_ent19#596[__this := userBalance_re_ent19#596[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_5.sol", 195, 5} {:message "TokenERC20::_transfer"} _transfer#705(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#628: address_t, _to#630: address_t, _value#632: int)
{
	var {:sourceloc "buggy_5.sol", 203, 9} {:message "previousBalances"} previousBalances#665: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#630 != 0);
	assume (balanceOf#393[__this][_from#628] >= _value#632);
	assume ((balanceOf#393[__this][_to#630] + _value#632) > balanceOf#393[__this][_to#630]);
	previousBalances#665 := (balanceOf#393[__this][_from#628] + balanceOf#393[__this][_to#630]);
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][_from#628 := (balanceOf#393[__this][_from#628] - _value#632)]];
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][_to#630 := (balanceOf#393[__this][_to#630] + _value#632)]];
	assume {:sourceloc "buggy_5.sol", 208, 14} {:message ""} true;
	call Transfer#479(__this, __msg_sender, __msg_value, _from#628, _to#630, _value#632);
	assert {:sourceloc "buggy_5.sol", 210, 9} {:message "Assertion might not hold."} ((balanceOf#393[__this][_from#628] + balanceOf#393[__this][_to#630]) == previousBalances#665);
	$return18:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 212, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#709: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_5.sol", 213, 1} {:message "TokenERC20::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#743(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 216, 6} {:message "success"} success#713: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#709[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#709[__this][__msg_sender])];
	assume {:sourceloc "buggy_5.sol", 216, 22} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, userBalance_re_ent26#709[__this][__msg_sender]);
	if (__call_ret#22) {
	havoc userBalance_re_ent12#216;
	havoc name#247;
	havoc redeemableEther_re_ent11#251;
	havoc symbol#289;
	havoc balances_re_ent1#293;
	havoc decimals#325;
	havoc not_called_re_ent41#328;
	havoc totalSupply#357;
	havoc counter_re_ent42#360;
	havoc balanceOf#393;
	havoc lastPlayer_re_ent2#395;
	havoc jackpot_re_ent2#397;
	havoc allowance#433;
	havoc userBalance_re_ent33#437;
	havoc not_called_re_ent27#482;
	havoc balances_re_ent31#521;
	havoc userBalance_re_ent19#596;
	havoc userBalance_re_ent26#709;
	havoc not_called_re_ent20#766;
	havoc redeemableEther_re_ent32#838;
	havoc balances_re_ent38#907;
	havoc redeemableEther_re_ent4#981;
	havoc counter_re_ent7#1076;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#709[__this][__msg_sender])];
	}

	success#713 := __call_ret#22;
	if (!(success#713)) {
	assume false;
	}

	userBalance_re_ent26#709 := userBalance_re_ent26#709[__this := userBalance_re_ent26#709[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 231, 5} {:message "TokenERC20::transfer"} transfer#763(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#746: address_t, _value#748: int)
	returns (success#751: bool)
{
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#24 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 232, 9} {:message ""} true;
	call _transfer#705(__this, __msg_sender, __msg_value, call_arg#24, _to#746, _value#748);
	success#751 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_5.sol", 235, 1} {:message "not_called_re_ent20"} not_called_re_ent20#766: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_5.sol", 236, 1} {:message "TokenERC20::bug_re_ent20"} bug_re_ent20#793(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#766[__this];
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_5.sol", 238, 16} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, call_arg#25);
	if (!(__send_ret#26)) {
	assume false;
	}

	not_called_re_ent20#766 := not_called_re_ent20#766[__this := false];
	$return21:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 253, 5} {:message "TokenERC20::transferFrom"} transferFrom#834(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#796: address_t, _to#798: address_t, _value#800: int)
	returns (success#803: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#800 <= allowance#433[__this][_from#796][__msg_sender]);
	allowance#433 := allowance#433[__this := allowance#433[__this][_from#796 := allowance#433[__this][_from#796][__msg_sender := (allowance#433[__this][_from#796][__msg_sender] - _value#800)]]];
	assume {:sourceloc "buggy_5.sol", 256, 9} {:message ""} true;
	call _transfer#705(__this, __msg_sender, __msg_value, _from#796, _to#798, _value#800);
	success#803 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 259, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#838: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_5.sol", 260, 1} {:message "TokenERC20::claimReward_re_ent32"} claimReward_re_ent32#874(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 263, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#851: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#838[__this][__msg_sender] > 0);
	transferValue_re_ent32#851 := redeemableEther_re_ent32#838[__this][__msg_sender];
	assume {:sourceloc "buggy_5.sol", 264, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#851);
	redeemableEther_re_ent32#838 := redeemableEther_re_ent32#838[__this := redeemableEther_re_ent32#838[__this][__msg_sender := 0]];
	$return23:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 276, 5} {:message "TokenERC20::approve"} approve#903(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#877: address_t, _value#879: int)
	returns (success#882: bool)
{
	var call_arg#27: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#433 := allowance#433[__this := allowance#433[__this][__msg_sender := allowance#433[__this][__msg_sender][_spender#877 := _value#879]]];
	call_arg#27 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 279, 14} {:message ""} true;
	call Approval#517(__this, __msg_sender, __msg_value, call_arg#27, _spender#877, _value#879);
	success#882 := true;
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 282, 1} {:message "balances_re_ent38"} balances_re_ent38#907: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_5.sol", 283, 1} {:message "TokenERC20::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#940(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#909: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#907[__this][__msg_sender] >= _weiToWithdraw#909);
	assume {:sourceloc "buggy_5.sol", 286, 17} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, _weiToWithdraw#909);
	assume __send_ret#28;
	balances_re_ent38#907 := balances_re_ent38#907[__this := balances_re_ent38#907[__this][__msg_sender := (balances_re_ent38#907[__this][__msg_sender] - _weiToWithdraw#909)]];
	$return25:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 301, 5} {:message "TokenERC20::burn"} burn#977(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#943: int)
	returns (success#946: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#393[__this][__msg_sender] >= _value#943);
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][__msg_sender := (balanceOf#393[__this][__msg_sender] - _value#943)]];
	totalSupply#357 := totalSupply#357[__this := (totalSupply#357[__this] - _value#943)];
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 305, 14} {:message ""} true;
	call Burn#560(__this, __msg_sender, __msg_value, call_arg#29, _value#943);
	success#946 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 308, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#981: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_5.sol", 309, 1} {:message "TokenERC20::claimReward_re_ent4"} claimReward_re_ent4#1017(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 312, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#994: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#981[__this][__msg_sender] > 0);
	transferValue_re_ent4#994 := redeemableEther_re_ent4#981[__this][__msg_sender];
	assume {:sourceloc "buggy_5.sol", 313, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#994);
	redeemableEther_re_ent4#981 := redeemableEther_re_ent4#981[__this := redeemableEther_re_ent4#981[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_5.sol", 325, 5} {:message "TokenERC20::burnFrom"} burnFrom#1073(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1020: address_t, _value#1022: int)
	returns (success#1025: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#393[__this][_from#1020] >= _value#1022);
	assume (_value#1022 <= allowance#433[__this][_from#1020][__msg_sender]);
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][_from#1020 := (balanceOf#393[__this][_from#1020] - _value#1022)]];
	allowance#433 := allowance#433[__this := allowance#433[__this][_from#1020 := allowance#433[__this][_from#1020][__msg_sender := (allowance#433[__this][_from#1020][__msg_sender] - _value#1022)]]];
	totalSupply#357 := totalSupply#357[__this := (totalSupply#357[__this] - _value#1022)];
	assume {:sourceloc "buggy_5.sol", 331, 14} {:message ""} true;
	call Burn#560(__this, __msg_sender, __msg_value, _from#1020, _value#1022);
	success#1025 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_5.sol", 334, 1} {:message "counter_re_ent7"} counter_re_ent7#1076: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_5.sol", 335, 1} {:message "TokenERC20::callme_re_ent7"} callme_re_ent7#1105(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1076[__this] <= 5);
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 337, 10} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	counter_re_ent7#1076 := counter_re_ent7#1076[__this := (counter_re_ent7#1076[__this] + 1)];
	$return29:
	// Function body ends here
}

// 
// ------- Contract: TTC -------
// Inherits from: Ownable
// Inherits from: TokenERC20
// 
// Event: FrozenFunds
procedure {:inline 1} {:sourceloc "buggy_5.sol", 389, 3} {:message "[event] TTC::FrozenFunds"} FrozenFunds#1279(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1275: address_t, frozen#1277: bool)
{
	
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 350, 3} {:message "balances_re_ent17"} balances_re_ent17#1114: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_5.sol", 351, 1} {:message "TTC::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#1153(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1116: int)
{
	var {:sourceloc "buggy_5.sol", 354, 10} {:message "success"} success#1129: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#1114[__this][__msg_sender] >= _weiToWithdraw#1116);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1116);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1116)];
	assume {:sourceloc "buggy_5.sol", 354, 25} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, _weiToWithdraw#1116);
	if (__call_ret#32) {
	havoc balances_re_ent17#1114;
	havoc sellPrice#1155;
	havoc lastPlayer_re_ent37#1157;
	havoc jackpot_re_ent37#1159;
	havoc buyPrice#1191;
	havoc balances_re_ent3#1195;
	havoc frozenAccount#1238;
	havoc not_called_re_ent13#1241;
	havoc lastPlayer_re_ent23#1296;
	havoc jackpot_re_ent23#1298;
	havoc counter_re_ent14#1403;
	havoc lastPlayer_re_ent30#1476;
	havoc jackpot_re_ent30#1478;
	havoc balances_re_ent8#1534;
	havoc redeemableEther_re_ent39#1586;
	havoc balances_re_ent36#1648;
	havoc counter_re_ent35#1718;
	havoc userBalance_re_ent12#216;
	havoc name#247;
	havoc redeemableEther_re_ent11#251;
	havoc symbol#289;
	havoc balances_re_ent1#293;
	havoc decimals#325;
	havoc not_called_re_ent41#328;
	havoc totalSupply#357;
	havoc counter_re_ent42#360;
	havoc balanceOf#393;
	havoc lastPlayer_re_ent2#395;
	havoc jackpot_re_ent2#397;
	havoc allowance#433;
	havoc userBalance_re_ent33#437;
	havoc not_called_re_ent27#482;
	havoc balances_re_ent31#521;
	havoc userBalance_re_ent19#596;
	havoc userBalance_re_ent26#709;
	havoc not_called_re_ent20#766;
	havoc redeemableEther_re_ent32#838;
	havoc balances_re_ent38#907;
	havoc redeemableEther_re_ent4#981;
	havoc counter_re_ent7#1076;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#175;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1116)];
	}

	success#1129 := __call_ret#32;
	assume success#1129;
	balances_re_ent17#1114 := balances_re_ent17#1114[__this := balances_re_ent17#1114[__this][__msg_sender := (balances_re_ent17#1114[__this][__msg_sender] - _weiToWithdraw#1116)]];
	$return30:
	// Function body ends here
}

// 
// State variable: sellPrice: uint256
var {:sourceloc "buggy_5.sol", 358, 3} {:message "sellPrice"} sellPrice#1155: [address_t]int;
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_5.sol", 359, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#1157: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_5.sol", 360, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#1159: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_5.sol", 361, 4} {:message "TTC::buyTicket_re_ent37"} buyTicket_re_ent37#1189(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 362, 12} {:message ""} true;
	call __send_ret#34 := __send(lastPlayer_re_ent37#1157[__this], __this, 0, jackpot_re_ent37#1159[__this]);
	if (!(__send_ret#34)) {
	assume false;
	}

	lastPlayer_re_ent37#1157 := lastPlayer_re_ent37#1157[__this := __msg_sender];
	jackpot_re_ent37#1159 := jackpot_re_ent37#1159[__this := __balance[__this]];
	$return31:
	// Function body ends here
}

// 
// State variable: buyPrice: uint256
var {:sourceloc "buggy_5.sol", 367, 3} {:message "buyPrice"} buyPrice#1191: [address_t]int;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 369, 3} {:message "balances_re_ent3"} balances_re_ent3#1195: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_5.sol", 370, 1} {:message "TTC::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#1234(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1197: int)
{
	var {:sourceloc "buggy_5.sol", 373, 3} {:message "success"} success#1210: bool;
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#1195[__this][__msg_sender] >= _weiToWithdraw#1197);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1197);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1197)];
	assume {:sourceloc "buggy_5.sol", 373, 19} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(__msg_sender, __this, _weiToWithdraw#1197);
	if (__call_ret#35) {
	havoc balances_re_ent17#1114;
	havoc sellPrice#1155;
	havoc lastPlayer_re_ent37#1157;
	havoc jackpot_re_ent37#1159;
	havoc buyPrice#1191;
	havoc balances_re_ent3#1195;
	havoc frozenAccount#1238;
	havoc not_called_re_ent13#1241;
	havoc lastPlayer_re_ent23#1296;
	havoc jackpot_re_ent23#1298;
	havoc counter_re_ent14#1403;
	havoc lastPlayer_re_ent30#1476;
	havoc jackpot_re_ent30#1478;
	havoc balances_re_ent8#1534;
	havoc redeemableEther_re_ent39#1586;
	havoc balances_re_ent36#1648;
	havoc counter_re_ent35#1718;
	havoc userBalance_re_ent12#216;
	havoc name#247;
	havoc redeemableEther_re_ent11#251;
	havoc symbol#289;
	havoc balances_re_ent1#293;
	havoc decimals#325;
	havoc not_called_re_ent41#328;
	havoc totalSupply#357;
	havoc counter_re_ent42#360;
	havoc balanceOf#393;
	havoc lastPlayer_re_ent2#395;
	havoc jackpot_re_ent2#397;
	havoc allowance#433;
	havoc userBalance_re_ent33#437;
	havoc not_called_re_ent27#482;
	havoc balances_re_ent31#521;
	havoc userBalance_re_ent19#596;
	havoc userBalance_re_ent26#709;
	havoc not_called_re_ent20#766;
	havoc redeemableEther_re_ent32#838;
	havoc balances_re_ent38#907;
	havoc redeemableEther_re_ent4#981;
	havoc counter_re_ent7#1076;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#175;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1197)];
	}

	success#1210 := __call_ret#35;
	assume success#1210;
	balances_re_ent3#1195 := balances_re_ent3#1195[__this := balances_re_ent3#1195[__this][__msg_sender := (balances_re_ent3#1195[__this][__msg_sender] - _weiToWithdraw#1197)]];
	$return32:
	// Function body ends here
}

// 
// State variable: frozenAccount: mapping(address => bool)
var {:sourceloc "buggy_5.sol", 377, 3} {:message "frozenAccount"} frozenAccount#1238: [address_t][address_t]bool;
// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_5.sol", 380, 3} {:message "not_called_re_ent13"} not_called_re_ent13#1241: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_5.sol", 381, 1} {:message "TTC::bug_re_ent13"} bug_re_ent13#1273(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 383, 10} {:message "success"} success#1249: bool;
	var __call_ret#37: bool;
	var __call_ret#38: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1241[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_5.sol", 383, 25} {:message ""} true;
	call __call_ret#37, __call_ret#38 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#37) {
	havoc balances_re_ent17#1114;
	havoc sellPrice#1155;
	havoc lastPlayer_re_ent37#1157;
	havoc jackpot_re_ent37#1159;
	havoc buyPrice#1191;
	havoc balances_re_ent3#1195;
	havoc frozenAccount#1238;
	havoc not_called_re_ent13#1241;
	havoc lastPlayer_re_ent23#1296;
	havoc jackpot_re_ent23#1298;
	havoc counter_re_ent14#1403;
	havoc lastPlayer_re_ent30#1476;
	havoc jackpot_re_ent30#1478;
	havoc balances_re_ent8#1534;
	havoc redeemableEther_re_ent39#1586;
	havoc balances_re_ent36#1648;
	havoc counter_re_ent35#1718;
	havoc userBalance_re_ent12#216;
	havoc name#247;
	havoc redeemableEther_re_ent11#251;
	havoc symbol#289;
	havoc balances_re_ent1#293;
	havoc decimals#325;
	havoc not_called_re_ent41#328;
	havoc totalSupply#357;
	havoc counter_re_ent42#360;
	havoc balanceOf#393;
	havoc lastPlayer_re_ent2#395;
	havoc jackpot_re_ent2#397;
	havoc allowance#433;
	havoc userBalance_re_ent33#437;
	havoc not_called_re_ent27#482;
	havoc balances_re_ent31#521;
	havoc userBalance_re_ent19#596;
	havoc userBalance_re_ent26#709;
	havoc not_called_re_ent20#766;
	havoc redeemableEther_re_ent32#838;
	havoc balances_re_ent38#907;
	havoc redeemableEther_re_ent4#981;
	havoc counter_re_ent7#1076;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#175;
	havoc __balance;
	}

	if (!(__call_ret#37)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1249 := __call_ret#37;
	if (!(success#1249)) {
	assume false;
	}

	not_called_re_ent13#1241 := not_called_re_ent13#1241[__this := false];
	$return33:
	// Function body ends here
}

function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_5.sol", 392, 5} {:message "TTC::[constructor]"} __constructor#1748(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#1281: int, tokenName#1283: int_arr_ptr, tokenSymbol#1285: int_arr_ptr)
{
	var initialSupply#563#39: int;
	var tokenName#565#39: int_arr_ptr;
	var tokenSymbol#567#39: int_arr_ptr;
	// TCC assumptions
	assume (tokenName#1283 < __alloc_counter);
	assume (tokenSymbol#1285 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent17#1114 := balances_re_ent17#1114[__this := default_address_t_int()];
	sellPrice#1155 := sellPrice#1155[__this := 0];
	lastPlayer_re_ent37#1157 := lastPlayer_re_ent37#1157[__this := 0];
	jackpot_re_ent37#1159 := jackpot_re_ent37#1159[__this := 0];
	buyPrice#1191 := buyPrice#1191[__this := 0];
	balances_re_ent3#1195 := balances_re_ent3#1195[__this := default_address_t_int()];
	frozenAccount#1238 := frozenAccount#1238[__this := default_address_t_bool()];
	not_called_re_ent13#1241 := not_called_re_ent13#1241[__this := true];
	lastPlayer_re_ent23#1296 := lastPlayer_re_ent23#1296[__this := 0];
	jackpot_re_ent23#1298 := jackpot_re_ent23#1298[__this := 0];
	counter_re_ent14#1403 := counter_re_ent14#1403[__this := 0];
	lastPlayer_re_ent30#1476 := lastPlayer_re_ent30#1476[__this := 0];
	jackpot_re_ent30#1478 := jackpot_re_ent30#1478[__this := 0];
	balances_re_ent8#1534 := balances_re_ent8#1534[__this := default_address_t_int()];
	redeemableEther_re_ent39#1586 := redeemableEther_re_ent39#1586[__this := default_address_t_int()];
	balances_re_ent36#1648 := balances_re_ent36#1648[__this := default_address_t_int()];
	counter_re_ent35#1718 := counter_re_ent35#1718[__this := 0];
	userBalance_re_ent12#216 := userBalance_re_ent12#216[__this := default_address_t_int()];
	name#247 := name#247[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent11#251 := redeemableEther_re_ent11#251[__this := default_address_t_int()];
	symbol#289 := symbol#289[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#293 := balances_re_ent1#293[__this := default_address_t_int()];
	decimals#325 := decimals#325[__this := 18];
	not_called_re_ent41#328 := not_called_re_ent41#328[__this := true];
	totalSupply#357 := totalSupply#357[__this := 0];
	counter_re_ent42#360 := counter_re_ent42#360[__this := 0];
	balanceOf#393 := balanceOf#393[__this := default_address_t_int()];
	lastPlayer_re_ent2#395 := lastPlayer_re_ent2#395[__this := 0];
	jackpot_re_ent2#397 := jackpot_re_ent2#397[__this := 0];
	allowance#433 := allowance#433[__this := default_address_t__k_address_t_v_int()];
	userBalance_re_ent33#437 := userBalance_re_ent33#437[__this := default_address_t_int()];
	not_called_re_ent27#482 := not_called_re_ent27#482[__this := true];
	balances_re_ent31#521 := balances_re_ent31#521[__this := default_address_t_int()];
	userBalance_re_ent19#596 := userBalance_re_ent19#596[__this := default_address_t_int()];
	userBalance_re_ent26#709 := userBalance_re_ent26#709[__this := default_address_t_int()];
	not_called_re_ent20#766 := not_called_re_ent20#766[__this := true];
	redeemableEther_re_ent32#838 := redeemableEther_re_ent32#838[__this := default_address_t_int()];
	balances_re_ent38#907 := balances_re_ent38#907[__this := default_address_t_int()];
	redeemableEther_re_ent4#981 := redeemableEther_re_ent4#981[__this := default_address_t_int()];
	counter_re_ent7#1076 := counter_re_ent7#1076[__this := 0];
	balances_re_ent21#5 := balances_re_ent21#5[__this := default_address_t_int()];
	owner#36 := owner#36[__this := 0];
	userBalance_re_ent40#40 := userBalance_re_ent40#40[__this := default_address_t_int()];
	lastPlayer_re_ent9#92 := lastPlayer_re_ent9#92[__this := 0];
	jackpot_re_ent9#94 := jackpot_re_ent9#94[__this := 0];
	redeemableEther_re_ent25#175 := redeemableEther_re_ent25#175[__this := default_address_t_int()];
	// Arguments for TokenERC20
	initialSupply#563#39 := initialSupply#1281;
	tokenName#565#39 := tokenName#1283;
	tokenSymbol#567#39 := tokenSymbol#1285;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#36 := owner#36[__this := __msg_sender];
	$return34:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	totalSupply#357 := totalSupply#357[__this := (initialSupply#563#39 * 1000000000000000000)];
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][__msg_sender := totalSupply#357[__this]]];
	name#247 := name#247[__this := mem_arr_int[tokenName#565#39]];
	symbol#289 := symbol#289[__this := mem_arr_int[tokenSymbol#567#39]];
	$return35:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return36:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_5.sol", 397, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1296: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_5.sol", 398, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1298: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_5.sol", 399, 4} {:message "TTC::buyTicket_re_ent23"} buyTicket_re_ent23#1328(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 400, 12} {:message ""} true;
	call __send_ret#42 := __send(lastPlayer_re_ent23#1296[__this], __this, 0, jackpot_re_ent23#1298[__this]);
	if (!(__send_ret#42)) {
	assume false;
	}

	lastPlayer_re_ent23#1296 := lastPlayer_re_ent23#1296[__this := __msg_sender];
	jackpot_re_ent23#1298 := jackpot_re_ent23#1298[__this := __balance[__this]];
	$return37:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_5.sol", 407, 5} {:message "TTC::_transfer"} _transfer#1400(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1330: address_t, _to#1332: address_t, _value#1334: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1332 != 0);
	assume (balanceOf#393[__this][_from#1330] >= _value#1334);
	assume ((balanceOf#393[__this][_to#1332] + _value#1334) >= balanceOf#393[__this][_to#1332]);
	assume !(frozenAccount#1238[__this][_from#1330]);
	assume !(frozenAccount#1238[__this][_to#1332]);
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][_from#1330 := (balanceOf#393[__this][_from#1330] - _value#1334)]];
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][_to#1332 := (balanceOf#393[__this][_to#1332] + _value#1334)]];
	assume {:sourceloc "buggy_5.sol", 415, 14} {:message ""} true;
	call Transfer#479(__this, __msg_sender, __msg_value, _from#1330, _to#1332, _value#1334);
	$return38:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_5.sol", 417, 1} {:message "counter_re_ent14"} counter_re_ent14#1403: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_5.sol", 418, 1} {:message "TTC::callme_re_ent14"} callme_re_ent14#1432(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1403[__this] <= 5);
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 420, 10} {:message ""} true;
	call __send_ret#44 := __send(__msg_sender, __this, 0, call_arg#43);
	if (!(__send_ret#44)) {
	assume false;
	}

	counter_re_ent14#1403 := counter_re_ent14#1403[__this := (counter_re_ent14#1403[__this] + 1)];
	$return39:
	// Function body ends here
}

// 
// Function: mintToken : function (address,uint256)
procedure {:sourceloc "buggy_5.sol", 429, 5} {:message "TTC::mintToken"} mintToken#1474(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1435: address_t, mintedAmount#1437: int)
{
	var call_arg#47: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	balanceOf#393 := balanceOf#393[__this := balanceOf#393[__this][target#1435 := (balanceOf#393[__this][target#1435] + mintedAmount#1437)]];
	totalSupply#357 := totalSupply#357[__this := (totalSupply#357[__this] + mintedAmount#1437)];
	call_arg#47 := 0;
	assume {:sourceloc "buggy_5.sol", 432, 14} {:message ""} true;
	call Transfer#479(__this, __msg_sender, __msg_value, call_arg#47, __this, mintedAmount#1437);
	assume {:sourceloc "buggy_5.sol", 433, 14} {:message ""} true;
	call Transfer#479(__this, __msg_sender, __msg_value, __this, target#1435, mintedAmount#1437);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_5.sol", 435, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1476: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_5.sol", 436, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1478: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_5.sol", 437, 4} {:message "TTC::buyTicket_re_ent30"} buyTicket_re_ent30#1508(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 438, 12} {:message ""} true;
	call __send_ret#48 := __send(lastPlayer_re_ent30#1476[__this], __this, 0, jackpot_re_ent30#1478[__this]);
	if (!(__send_ret#48)) {
	assume false;
	}

	lastPlayer_re_ent30#1476 := lastPlayer_re_ent30#1476[__this := __msg_sender];
	jackpot_re_ent30#1478 := jackpot_re_ent30#1478[__this := __balance[__this]];
	$return42:
	// Function body ends here
}

// 
// Function: freezeAccount : function (address,bool)
procedure {:sourceloc "buggy_5.sol", 447, 5} {:message "TTC::freezeAccount"} freezeAccount#1530(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1511: address_t, freeze#1513: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	frozenAccount#1238 := frozenAccount#1238[__this := frozenAccount#1238[__this][target#1511 := freeze#1513]];
	assume {:sourceloc "buggy_5.sol", 449, 14} {:message ""} true;
	call FrozenFunds#1279(__this, __msg_sender, __msg_value, target#1511, freeze#1513);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 451, 1} {:message "balances_re_ent8"} balances_re_ent8#1534: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_5.sol", 452, 5} {:message "TTC::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1563(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 453, 9} {:message "success"} success#1538: bool;
	var __call_ret#51: bool;
	var __call_ret#52: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1534[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1534[__this][__msg_sender])];
	assume {:sourceloc "buggy_5.sol", 453, 26} {:message ""} true;
	call __call_ret#51, __call_ret#52 := __call(__msg_sender, __this, balances_re_ent8#1534[__this][__msg_sender]);
	if (__call_ret#51) {
	havoc balances_re_ent17#1114;
	havoc sellPrice#1155;
	havoc lastPlayer_re_ent37#1157;
	havoc jackpot_re_ent37#1159;
	havoc buyPrice#1191;
	havoc balances_re_ent3#1195;
	havoc frozenAccount#1238;
	havoc not_called_re_ent13#1241;
	havoc lastPlayer_re_ent23#1296;
	havoc jackpot_re_ent23#1298;
	havoc counter_re_ent14#1403;
	havoc lastPlayer_re_ent30#1476;
	havoc jackpot_re_ent30#1478;
	havoc balances_re_ent8#1534;
	havoc redeemableEther_re_ent39#1586;
	havoc balances_re_ent36#1648;
	havoc counter_re_ent35#1718;
	havoc userBalance_re_ent12#216;
	havoc name#247;
	havoc redeemableEther_re_ent11#251;
	havoc symbol#289;
	havoc balances_re_ent1#293;
	havoc decimals#325;
	havoc not_called_re_ent41#328;
	havoc totalSupply#357;
	havoc counter_re_ent42#360;
	havoc balanceOf#393;
	havoc lastPlayer_re_ent2#395;
	havoc jackpot_re_ent2#397;
	havoc allowance#433;
	havoc userBalance_re_ent33#437;
	havoc not_called_re_ent27#482;
	havoc balances_re_ent31#521;
	havoc userBalance_re_ent19#596;
	havoc userBalance_re_ent26#709;
	havoc not_called_re_ent20#766;
	havoc redeemableEther_re_ent32#838;
	havoc balances_re_ent38#907;
	havoc redeemableEther_re_ent4#981;
	havoc counter_re_ent7#1076;
	havoc balances_re_ent21#5;
	havoc owner#36;
	havoc userBalance_re_ent40#40;
	havoc lastPlayer_re_ent9#92;
	havoc jackpot_re_ent9#94;
	havoc redeemableEther_re_ent25#175;
	havoc __balance;
	}

	if (!(__call_ret#51)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1534[__this][__msg_sender])];
	}

	success#1538 := __call_ret#51;
	if (success#1538) {
	balances_re_ent8#1534 := balances_re_ent8#1534[__this := balances_re_ent8#1534[__this][__msg_sender := 0]];
	}

	$return45:
	// Function body ends here
}

// 
// Function: setPrices : function (uint256,uint256)
procedure {:sourceloc "buggy_5.sol", 461, 5} {:message "TTC::setPrices"} setPrices#1582(__this: address_t, __msg_sender: address_t, __msg_value: int, newSellPrice#1566: int, newBuyPrice#1568: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#36[__this]);
	// Function body starts here
	sellPrice#1155 := sellPrice#1155[__this := newSellPrice#1566];
	buyPrice#1191 := buyPrice#1191[__this := newBuyPrice#1568];
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 465, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1586: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_5.sol", 466, 1} {:message "TTC::claimReward_re_ent39"} claimReward_re_ent39#1622(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 469, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1599: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1586[__this][__msg_sender] > 0);
	transferValue_re_ent39#1599 := redeemableEther_re_ent39#1586[__this][__msg_sender];
	assume {:sourceloc "buggy_5.sol", 470, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1599);
	redeemableEther_re_ent39#1586 := redeemableEther_re_ent39#1586[__this := redeemableEther_re_ent39#1586[__this][__msg_sender := 0]];
	$return48:
	// Function body ends here
}

// 
// Function: buy : function ()
procedure {:sourceloc "buggy_5.sol", 475, 5} {:message "TTC::buy"} buy#1644(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_5.sol", 476, 9} {:message "amount"} amount#1627: int;
	var call_arg#55: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	amount#1627 := (__msg_value div buyPrice#1191[__this]);
	call_arg#55 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 477, 9} {:message ""} true;
	call _transfer#1400(__this, __msg_sender, __msg_value, __this, call_arg#55, amount#1627);
	$return49:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_5.sol", 479, 1} {:message "balances_re_ent36"} balances_re_ent36#1648: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_5.sol", 480, 5} {:message "TTC::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1671(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_5.sol", 481, 11} {:message ""} true;
	call __send_ret#56 := __send(__msg_sender, __this, 0, balances_re_ent36#1648[__this][__msg_sender]);
	if (__send_ret#56) {
	balances_re_ent36#1648 := balances_re_ent36#1648[__this := balances_re_ent36#1648[__this][__msg_sender := 0]];
	}

	$return50:
	// Function body ends here
}

// 
// Function: sell : function (uint256)
procedure {:sourceloc "buggy_5.sol", 487, 5} {:message "TTC::sell"} sell#1715(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1674: int)
{
	var {:sourceloc "buggy_5.sol", 488, 9} {:message "myAddress"} myAddress#1678: address_t;
	var call_arg#57: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	myAddress#1678 := __this;
	assume (__balance[myAddress#1678] >= (amount#1674 * sellPrice#1155[__this]));
	call_arg#57 := __msg_sender;
	assume {:sourceloc "buggy_5.sol", 490, 9} {:message ""} true;
	call _transfer#1400(__this, __msg_sender, __msg_value, call_arg#57, __this, amount#1674);
	assume {:sourceloc "buggy_5.sol", 491, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, (amount#1674 * sellPrice#1155[__this]));
	$return51:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_5.sol", 493, 1} {:message "counter_re_ent35"} counter_re_ent35#1718: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_5.sol", 494, 1} {:message "TTC::callme_re_ent35"} callme_re_ent35#1747(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#58: int;
	var __send_ret#59: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1718[__this] <= 5);
	call_arg#58 := 10000000000000000000;
	assume {:sourceloc "buggy_5.sol", 496, 10} {:message ""} true;
	call __send_ret#59 := __send(__msg_sender, __this, 0, call_arg#58);
	if (!(__send_ret#59)) {
	assume false;
	}

	counter_re_ent35#1718 := counter_re_ent35#1718[__this := (counter_re_ent35#1718[__this] + 1)];
	$return52:
	// Function body ends here
}

