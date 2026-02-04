// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_16.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 19, 5} {:message "SafeMath::mul"} mul#31(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (c#10: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#10 := (a#5 * b#7);
	assume ((a#5 == 0) || ((c#10 div a#5) == b#7));
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 27, 4} {:message "SafeMath::div"} div#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#34: int, b#36: int)
	returns (c#39: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#36 > 0);
	c#39 := (a#34 div b#36);
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 35, 5} {:message "SafeMath::sub"} sub#77(__this: address_t, __msg_sender: address_t, __msg_value: int, a#57: int, b#59: int)
	returns (c#62: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#59 <= a#57);
	c#62 := (a#57 - b#59);
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 43, 5} {:message "SafeMath::add"} add#100(__this: address_t, __msg_sender: address_t, __msg_value: int, a#80: int, b#82: int)
	returns (c#85: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#85 := (a#80 + b#82);
	assume (c#85 >= a#80);
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_16.sol", 14, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_16.sol", 110, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#399(__this: address_t, __msg_sender: address_t, __msg_value: int, from#393: address_t, to#395: address_t, tokens#397: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_16.sol", 121, 3} {:message "[event] ERC20Interface::Approval"} Approval#445(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#439: address_t, spender#441: address_t, tokens#443: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 51, 5} {:message "ERC20Interface::totalSupply"} totalSupply#106(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#104: int);
	modifies counter_re_ent21#109, balances_re_ent10#149, balances_re_ent21#195, userBalance_re_ent12#237, redeemableEther_re_ent11#279, balances_re_ent1#330, counter_re_ent35#362, userBalance_re_ent40#403;

// 
// State variable: counter_re_ent21: uint256
var {:sourceloc "buggy_16.sol", 52, 1} {:message "counter_re_ent21"} counter_re_ent21#109: [address_t]int;
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
// Function: callme_re_ent21 : function ()
procedure {:sourceloc "buggy_16.sol", 53, 1} {:message "ERC20Interface::callme_re_ent21"} callme_re_ent21#138(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent21#109[__this] <= 5);
	call_arg#0 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 55, 9} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	assume false;
	}

	counter_re_ent21#109 := counter_re_ent21#109[__this := (counter_re_ent21#109[__this] + 1)];
	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 60, 5} {:message "ERC20Interface::balanceOf"} balanceOf#145(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#140: address_t)
	returns (balance#143: int);
	modifies counter_re_ent21#109, balances_re_ent10#149, balances_re_ent21#195, userBalance_re_ent12#237, redeemableEther_re_ent11#279, balances_re_ent1#330, counter_re_ent35#362, userBalance_re_ent40#403;

// 
// State variable: balances_re_ent10: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 61, 1} {:message "balances_re_ent10"} balances_re_ent10#149: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent10 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 62, 1} {:message "ERC20Interface::withdrawFunds_re_ent10"} withdrawFunds_re_ent10#182(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#151: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent10#149[__this][__msg_sender] >= _weiToWithdraw#151);
	assume {:sourceloc "buggy_16.sol", 65, 13} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, _weiToWithdraw#151);
	assume __send_ret#2;
	balances_re_ent10#149 := balances_re_ent10#149[__this := balances_re_ent10#149[__this][__msg_sender := (balances_re_ent10#149[__this][__msg_sender] - _weiToWithdraw#151)]];
	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 68, 5} {:message "ERC20Interface::allowance"} allowance#191(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#184: address_t, spender#186: address_t)
	returns (remaining#189: int);
	modifies counter_re_ent21#109, balances_re_ent10#149, balances_re_ent21#195, userBalance_re_ent12#237, redeemableEther_re_ent11#279, balances_re_ent1#330, counter_re_ent35#362, userBalance_re_ent40#403;

// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 69, 1} {:message "balances_re_ent21"} balances_re_ent21#195: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_16.sol", 70, 5} {:message "ERC20Interface::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#224(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 71, 6} {:message "success"} success#199: bool;
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#195[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#195[__this][__msg_sender])];
	assume {:sourceloc "buggy_16.sol", 71, 22} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(__msg_sender, __this, balances_re_ent21#195[__this][__msg_sender]);
	if (__call_ret#3) {
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#195[__this][__msg_sender])];
	}

	success#199 := __call_ret#3;
	if (success#199) {
	balances_re_ent21#195 := balances_re_ent21#195[__this := balances_re_ent21#195[__this][__msg_sender := 0]];
	}

	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 75, 5} {:message "ERC20Interface::transfer"} transfer#233(__this: address_t, __msg_sender: address_t, __msg_value: int, to#226: address_t, tokens#228: int)
	returns (success#231: bool);
	modifies counter_re_ent21#109, balances_re_ent10#149, balances_re_ent21#195, userBalance_re_ent12#237, redeemableEther_re_ent11#279, balances_re_ent1#330, counter_re_ent35#362, userBalance_re_ent40#403;

// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 76, 1} {:message "userBalance_re_ent12"} userBalance_re_ent12#237: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_16.sol", 77, 1} {:message "ERC20Interface::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#266(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 80, 16} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, userBalance_re_ent12#237[__this][__msg_sender]);
	if (!(__send_ret#5)) {
	assume false;
	}

	userBalance_re_ent12#237 := userBalance_re_ent12#237[__this := userBalance_re_ent12#237[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 85, 5} {:message "ERC20Interface::approve"} approve#275(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#268: address_t, tokens#270: int)
	returns (success#273: bool);
	modifies counter_re_ent21#109, balances_re_ent10#149, balances_re_ent21#195, userBalance_re_ent12#237, redeemableEther_re_ent11#279, balances_re_ent1#330, counter_re_ent35#362, userBalance_re_ent40#403;

// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 86, 1} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#279: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_16.sol", 87, 1} {:message "ERC20Interface::claimReward_re_ent11"} claimReward_re_ent11#315(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 90, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#292: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#279[__this][__msg_sender] > 0);
	transferValue_re_ent11#292 := redeemableEther_re_ent11#279[__this][__msg_sender];
	assume {:sourceloc "buggy_16.sol", 91, 2} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#292);
	redeemableEther_re_ent11#279 := redeemableEther_re_ent11#279[__this := redeemableEther_re_ent11#279[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 94, 5} {:message "ERC20Interface::transferFrom"} transferFrom#326(__this: address_t, __msg_sender: address_t, __msg_value: int, from#317: address_t, to#319: address_t, tokens#321: int)
	returns (success#324: bool);
	modifies counter_re_ent21#109, balances_re_ent10#149, balances_re_ent21#195, userBalance_re_ent12#237, redeemableEther_re_ent11#279, balances_re_ent1#330, counter_re_ent35#362, userBalance_re_ent40#403;

// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 95, 1} {:message "balances_re_ent1"} balances_re_ent1#330: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_16.sol", 96, 6} {:message "ERC20Interface::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#359(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 97, 11} {:message "success"} success#334: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#330[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#330[__this][__msg_sender])];
	assume {:sourceloc "buggy_16.sol", 97, 27} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, balances_re_ent1#330[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#330[__this][__msg_sender])];
	}

	success#334 := __call_ret#6;
	if (success#334) {
	balances_re_ent1#330 := balances_re_ent1#330[__this := balances_re_ent1#330[__this][__msg_sender := 0]];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_16.sol", 102, 3} {:message "counter_re_ent35"} counter_re_ent35#362: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_16.sol", 103, 1} {:message "ERC20Interface::callme_re_ent35"} callme_re_ent35#391(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#362[__this] <= 5);
	call_arg#8 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 105, 9} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, call_arg#8);
	if (!(__send_ret#9)) {
	assume false;
	}

	counter_re_ent35#362 := counter_re_ent35#362[__this := (counter_re_ent35#362[__this] + 1)];
	$return10:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 111, 3} {:message "userBalance_re_ent40"} userBalance_re_ent40#403: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_16.sol", 112, 1} {:message "ERC20Interface::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#437(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 115, 3} {:message "success"} success#407: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#403[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#403[__this][__msg_sender])];
	assume {:sourceloc "buggy_16.sol", 115, 18} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(__msg_sender, __this, userBalance_re_ent40#403[__this][__msg_sender]);
	if (__call_ret#10) {
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#403[__this][__msg_sender])];
	}

	success#407 := __call_ret#10;
	if (!(success#407)) {
	assume false;
	}

	userBalance_re_ent40#403 := userBalance_re_ent40#403[__this := userBalance_re_ent40#403[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "buggy_16.sol", 50, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#446(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	counter_re_ent21#109 := counter_re_ent21#109[__this := 0];
	balances_re_ent10#149 := balances_re_ent10#149[__this := default_address_t_int()];
	balances_re_ent21#195 := balances_re_ent21#195[__this := default_address_t_int()];
	userBalance_re_ent12#237 := userBalance_re_ent12#237[__this := default_address_t_int()];
	redeemableEther_re_ent11#279 := redeemableEther_re_ent11#279[__this := default_address_t_int()];
	balances_re_ent1#330 := balances_re_ent1#330[__this := default_address_t_int()];
	counter_re_ent35#362 := counter_re_ent35#362[__this := 0];
	userBalance_re_ent40#403 := userBalance_re_ent40#403[__this := default_address_t_int()];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_16.sol", 145, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#532(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#528: address_t, newOwner#530: address_t)
{
	
}

// 
// State variable: redeemableEther_re_ent18: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 126, 3} {:message "redeemableEther_re_ent18"} redeemableEther_re_ent18#450: [address_t][address_t]int;
// 
// Function: claimReward_re_ent18 : function ()
procedure {:sourceloc "buggy_16.sol", 127, 1} {:message "Owned::claimReward_re_ent18"} claimReward_re_ent18#486(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 130, 9} {:message "transferValue_re_ent18"} transferValue_re_ent18#463: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent18#450[__this][__msg_sender] > 0);
	transferValue_re_ent18#463 := redeemableEther_re_ent18#450[__this][__msg_sender];
	assume {:sourceloc "buggy_16.sol", 131, 2} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent18#463);
	redeemableEther_re_ent18#450 := redeemableEther_re_ent18#450[__this := redeemableEther_re_ent18#450[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_16.sol", 134, 3} {:message "owner"} owner#488: [address_t]address_t;
// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 135, 3} {:message "userBalance_re_ent33"} userBalance_re_ent33#492: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_16.sol", 136, 1} {:message "Owned::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#526(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 139, 3} {:message "success"} success#496: bool;
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#492[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#492[__this][__msg_sender])];
	assume {:sourceloc "buggy_16.sol", 139, 19} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(__msg_sender, __this, userBalance_re_ent33#492[__this][__msg_sender]);
	if (__call_ret#12) {
	havoc redeemableEther_re_ent18#450;
	havoc owner#488;
	havoc userBalance_re_ent33#492;
	havoc not_called_re_ent41#548;
	havoc counter_re_ent42#617;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#492[__this][__msg_sender])];
	}

	success#496 := __call_ret#12;
	if (!(success#496)) {
	assume false;
	}

	userBalance_re_ent33#492 := userBalance_re_ent33#492[__this := userBalance_re_ent33#492[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 151, 5} {:message "Owned::[constructor]"} __constructor#647(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent18#450 := redeemableEther_re_ent18#450[__this := default_address_t_int()];
	owner#488 := owner#488[__this := 0];
	userBalance_re_ent33#492 := userBalance_re_ent33#492[__this := default_address_t_int()];
	not_called_re_ent41#548 := not_called_re_ent41#548[__this := true];
	counter_re_ent42#617 := counter_re_ent42#617[__this := 0];
	// Function body starts here
	owner#488 := owner#488[__this := __msg_sender];
	$return14:
	// Function body ends here
}

// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_16.sol", 154, 1} {:message "not_called_re_ent41"} not_called_re_ent41#548: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_16.sol", 155, 1} {:message "Owned::bug_re_ent41"} bug_re_ent41#575(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#548[__this];
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 157, 16} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, call_arg#14);
	if (!(__send_ret#15)) {
	assume false;
	}

	not_called_re_ent41#548 := not_called_re_ent41#548[__this := false];
	$return15:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_16.sol", 175, 5} {:message "Owned::transferOwnership"} transferOwnership#614(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#590: address_t)
{
	var call_arg#18: address_t;
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#488[__this]);
	// Function body starts here
	assume (newOwner#590 != 0);
	call_arg#18 := owner#488[__this];
	call_arg#19 := newOwner#590;
	assume {:sourceloc "buggy_16.sol", 177, 14} {:message ""} true;
	call OwnershipTransferred#532(__this, __msg_sender, __msg_value, call_arg#18, call_arg#19);
	owner#488 := owner#488[__this := newOwner#590];
	$return17:
	// Function body ends here
	$return16:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_16.sol", 180, 1} {:message "counter_re_ent42"} counter_re_ent42#617: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_16.sol", 181, 1} {:message "Owned::callme_re_ent42"} callme_re_ent42#646(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#617[__this] <= 5);
	call_arg#20 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 183, 9} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	assume false;
	}

	counter_re_ent42#617 := counter_re_ent42#617[__this := (counter_re_ent42#617[__this] + 1)];
	$return18:
	// Function body ends here
}

// 
// ------- Contract: ExclusivePlatform -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// 
// Event: TransferEther
procedure {:inline 1} {:sourceloc "buggy_16.sol", 561, 3} {:message "[event] ExclusivePlatform::TransferEther"} TransferEther#2249(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#2243: address_t, _to#2245: address_t, _value#2247: int)
{
	
}

// 
// Event: NewPrice
procedure {:inline 1} {:sourceloc "buggy_16.sol", 569, 3} {:message "[event] ExclusivePlatform::NewPrice"} NewPrice#2294(__this: address_t, __msg_sender: address_t, __msg_value: int, _changer#2288: address_t, _lastPrice#2290: int, _newPrice#2292: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_16.sol", 579, 3} {:message "[event] ExclusivePlatform::Burn"} Burn#2335(__this: address_t, __msg_sender: address_t, __msg_value: int, _burner#2331: address_t, value#2333: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: balances_re_ent29: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 195, 3} {:message "balances_re_ent29"} balances_re_ent29#658: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent29 : function ()
procedure {:sourceloc "buggy_16.sol", 196, 5} {:message "ExclusivePlatform::withdraw_balances_re_ent29"} withdraw_balances_re_ent29#681(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 197, 9} {:message ""} true;
	call __send_ret#22 := __send(__msg_sender, __this, 0, balances_re_ent29#658[__this][__msg_sender]);
	if (__send_ret#22) {
	balances_re_ent29#658 := balances_re_ent29#658[__this := balances_re_ent29#658[__this][__msg_sender := 0]];
	}

	$return19:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 200, 3} {:message "balances"} balances#685: [address_t][address_t]int;
// 
// State variable: not_called_re_ent6: bool
var {:sourceloc "buggy_16.sol", 201, 3} {:message "not_called_re_ent6"} not_called_re_ent6#688: [address_t]bool;
// 
// Function: bug_re_ent6 : function ()
procedure {:sourceloc "buggy_16.sol", 202, 1} {:message "ExclusivePlatform::bug_re_ent6"} bug_re_ent6#715(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent6#688[__this];
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 204, 16} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, call_arg#23);
	if (!(__send_ret#24)) {
	assume false;
	}

	not_called_re_ent6#688 := not_called_re_ent6#688[__this := false];
	$return20:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_16.sol", 209, 3} {:message "allowed"} allowed#721: [address_t][address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent16: address payable
var {:sourceloc "buggy_16.sol", 211, 3} {:message "lastPlayer_re_ent16"} lastPlayer_re_ent16#723: [address_t]address_t;
// 
// State variable: jackpot_re_ent16: uint256
var {:sourceloc "buggy_16.sol", 212, 7} {:message "jackpot_re_ent16"} jackpot_re_ent16#725: [address_t]int;
// 
// Function: buyTicket_re_ent16 : function ()
procedure {:sourceloc "buggy_16.sol", 213, 4} {:message "ExclusivePlatform::buyTicket_re_ent16"} buyTicket_re_ent16#755(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 214, 12} {:message ""} true;
	call __send_ret#25 := __send(lastPlayer_re_ent16#723[__this], __this, 0, jackpot_re_ent16#725[__this]);
	if (!(__send_ret#25)) {
	assume false;
	}

	lastPlayer_re_ent16#723 := lastPlayer_re_ent16#723[__this := __msg_sender];
	jackpot_re_ent16#725 := jackpot_re_ent16#725[__this := __balance[__this]];
	$return21:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_16.sol", 219, 3} {:message "name"} name#758: [address_t]int_arr_type;
// 
// State variable: balances_re_ent24: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 220, 3} {:message "balances_re_ent24"} balances_re_ent24#762: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent24 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 221, 1} {:message "ExclusivePlatform::withdrawFunds_re_ent24"} withdrawFunds_re_ent24#795(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#764: int)
{
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent24#762[__this][__msg_sender] >= _weiToWithdraw#764);
	assume {:sourceloc "buggy_16.sol", 224, 13} {:message ""} true;
	call __send_ret#26 := __send(__msg_sender, __this, 0, _weiToWithdraw#764);
	assume __send_ret#26;
	balances_re_ent24#762 := balances_re_ent24#762[__this := balances_re_ent24#762[__this][__msg_sender := (balances_re_ent24#762[__this][__msg_sender] - _weiToWithdraw#764)]];
	$return22:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_16.sol", 227, 3} {:message "symbol"} symbol#798: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent5: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 228, 3} {:message "userBalance_re_ent5"} userBalance_re_ent5#802: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent5 : function ()
procedure {:sourceloc "buggy_16.sol", 229, 1} {:message "ExclusivePlatform::withdrawBalance_re_ent5"} withdrawBalance_re_ent5#831(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 232, 16} {:message ""} true;
	call __send_ret#27 := __send(__msg_sender, __this, 0, userBalance_re_ent5#802[__this][__msg_sender]);
	if (!(__send_ret#27)) {
	assume false;
	}

	userBalance_re_ent5#802 := userBalance_re_ent5#802[__this := userBalance_re_ent5#802[__this][__msg_sender := 0]];
	$return23:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_16.sol", 237, 3} {:message "decimals"} decimals#834: [address_t]int;
// 
// State variable: balances_re_ent15: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 238, 3} {:message "balances_re_ent15"} balances_re_ent15#838: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent15 : function ()
procedure {:sourceloc "buggy_16.sol", 239, 5} {:message "ExclusivePlatform::withdraw_balances_re_ent15"} withdraw_balances_re_ent15#861(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 240, 9} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, balances_re_ent15#838[__this][__msg_sender]);
	if (__send_ret#28) {
	balances_re_ent15#838 := balances_re_ent15#838[__this := balances_re_ent15#838[__this][__msg_sender := 0]];
	}

	$return24:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_16.sol", 243, 3} {:message "_totalSupply"} _totalSupply#863: [address_t]int;
// 
// State variable: counter_re_ent28: uint256
var {:sourceloc "buggy_16.sol", 245, 3} {:message "counter_re_ent28"} counter_re_ent28#866: [address_t]int;
// 
// Function: callme_re_ent28 : function ()
procedure {:sourceloc "buggy_16.sol", 246, 1} {:message "ExclusivePlatform::callme_re_ent28"} callme_re_ent28#895(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent28#866[__this] <= 5);
	call_arg#29 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 248, 9} {:message ""} true;
	call __send_ret#30 := __send(__msg_sender, __this, 0, call_arg#29);
	if (!(__send_ret#30)) {
	assume false;
	}

	counter_re_ent28#866 := counter_re_ent28#866[__this := (counter_re_ent28#866[__this] + 1)];
	$return25:
	// Function body ends here
}

// 
// State variable: XPLPerEther: uint256
var {:sourceloc "buggy_16.sol", 253, 3} {:message "XPLPerEther"} XPLPerEther#898: [address_t]int;
// 
// State variable: minimumBuy: uint256
var {:sourceloc "buggy_16.sol", 254, 5} {:message "minimumBuy"} minimumBuy#903: [address_t]int;
// 
// State variable: not_called_re_ent34: bool
var {:sourceloc "buggy_16.sol", 255, 3} {:message "not_called_re_ent34"} not_called_re_ent34#906: [address_t]bool;
// 
// Function: bug_re_ent34 : function ()
procedure {:sourceloc "buggy_16.sol", 256, 1} {:message "ExclusivePlatform::bug_re_ent34"} bug_re_ent34#933(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent34#906[__this];
	call_arg#31 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 258, 16} {:message ""} true;
	call __send_ret#32 := __send(__msg_sender, __this, 0, call_arg#31);
	if (!(__send_ret#32)) {
	assume false;
	}

	not_called_re_ent34#906 := not_called_re_ent34#906[__this := false];
	$return26:
	// Function body ends here
}

// 
// State variable: crowdsaleIsOn: bool
var {:sourceloc "buggy_16.sol", 263, 3} {:message "crowdsaleIsOn"} crowdsaleIsOn#936: [address_t]bool;
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 272, 5} {:message "ExclusivePlatform::[constructor]"} __constructor#2336(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: address_t;
	var call_arg#35: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent29#658 := balances_re_ent29#658[__this := default_address_t_int()];
	balances#685 := balances#685[__this := default_address_t_int()];
	not_called_re_ent6#688 := not_called_re_ent6#688[__this := true];
	allowed#721 := allowed#721[__this := default_address_t__k_address_t_v_int()];
	lastPlayer_re_ent16#723 := lastPlayer_re_ent16#723[__this := 0];
	jackpot_re_ent16#725 := jackpot_re_ent16#725[__this := 0];
	name#758 := name#758[__this := int_arr#constr(default_int_int()[0 := 69][1 := 120][2 := 99][3 := 108][4 := 117][5 := 115][6 := 105][7 := 118][8 := 101][9 := 32][10 := 80][11 := 108][12 := 97][13 := 116][14 := 102][15 := 111][16 := 114][17 := 109], 18)];
	balances_re_ent24#762 := balances_re_ent24#762[__this := default_address_t_int()];
	symbol#798 := symbol#798[__this := int_arr#constr(default_int_int()[0 := 88][1 := 80][2 := 76], 3)];
	userBalance_re_ent5#802 := userBalance_re_ent5#802[__this := default_address_t_int()];
	decimals#834 := decimals#834[__this := 8];
	balances_re_ent15#838 := balances_re_ent15#838[__this := default_address_t_int()];
	_totalSupply#863 := _totalSupply#863[__this := 0];
	counter_re_ent28#866 := counter_re_ent28#866[__this := 0];
	XPLPerEther#898 := XPLPerEther#898[__this := 800000000000000];
	minimumBuy#903 := minimumBuy#903[__this := 10000000000000000];
	not_called_re_ent34#906 := not_called_re_ent34#906[__this := true];
	crowdsaleIsOn#936 := crowdsaleIsOn#936[__this := true];
	lastPlayer_re_ent2#977 := lastPlayer_re_ent2#977[__this := 0];
	jackpot_re_ent2#979 := jackpot_re_ent2#979[__this := 0];
	balances_re_ent17#1022 := balances_re_ent17#1022[__this := default_address_t_int()];
	lastPlayer_re_ent37#1081 := lastPlayer_re_ent37#1081[__this := 0];
	jackpot_re_ent37#1083 := jackpot_re_ent37#1083[__this := 0];
	balances_re_ent3#1129 := balances_re_ent3#1129[__this := default_address_t_int()];
	lastPlayer_re_ent9#1217 := lastPlayer_re_ent9#1217[__this := 0];
	jackpot_re_ent9#1219 := jackpot_re_ent9#1219[__this := 0];
	redeemableEther_re_ent25#1296 := redeemableEther_re_ent25#1296[__this := default_address_t_int()];
	userBalance_re_ent19#1365 := userBalance_re_ent19#1365[__this := default_address_t_int()];
	userBalance_re_ent26#1438 := userBalance_re_ent26#1438[__this := default_address_t_int()];
	not_called_re_ent20#1532 := not_called_re_ent20#1532[__this := true];
	redeemableEther_re_ent32#1576 := redeemableEther_re_ent32#1576[__this := default_address_t_int()];
	balances_re_ent38#1636 := balances_re_ent38#1636[__this := default_address_t_int()];
	redeemableEther_re_ent4#1722 := redeemableEther_re_ent4#1722[__this := default_address_t_int()];
	counter_re_ent7#1808 := counter_re_ent7#1808[__this := 0];
	lastPlayer_re_ent23#1856 := lastPlayer_re_ent23#1856[__this := 0];
	jackpot_re_ent23#1858 := jackpot_re_ent23#1858[__this := 0];
	counter_re_ent14#1926 := counter_re_ent14#1926[__this := 0];
	lastPlayer_re_ent30#1977 := lastPlayer_re_ent30#1977[__this := 0];
	jackpot_re_ent30#1979 := jackpot_re_ent30#1979[__this := 0];
	balances_re_ent8#2058 := balances_re_ent8#2058[__this := default_address_t_int()];
	redeemableEther_re_ent39#2116 := redeemableEther_re_ent39#2116[__this := default_address_t_int()];
	balances_re_ent36#2188 := balances_re_ent36#2188[__this := default_address_t_int()];
	not_called_re_ent27#2214 := not_called_re_ent27#2214[__this := true];
	balances_re_ent31#2253 := balances_re_ent31#2253[__this := default_address_t_int()];
	not_called_re_ent13#2297 := not_called_re_ent13#2297[__this := true];
	redeemableEther_re_ent18#450 := redeemableEther_re_ent18#450[__this := default_address_t_int()];
	owner#488 := owner#488[__this := 0];
	userBalance_re_ent33#492 := userBalance_re_ent33#492[__this := default_address_t_int()];
	not_called_re_ent41#548 := not_called_re_ent41#548[__this := true];
	counter_re_ent42#617 := counter_re_ent42#617[__this := 0];
	counter_re_ent21#109 := counter_re_ent21#109[__this := 0];
	balances_re_ent10#149 := balances_re_ent10#149[__this := default_address_t_int()];
	balances_re_ent21#195 := balances_re_ent21#195[__this := default_address_t_int()];
	userBalance_re_ent12#237 := userBalance_re_ent12#237[__this := default_address_t_int()];
	redeemableEther_re_ent11#279 := redeemableEther_re_ent11#279[__this := default_address_t_int()];
	balances_re_ent1#330 := balances_re_ent1#330[__this := default_address_t_int()];
	counter_re_ent35#362 := counter_re_ent35#362[__this := 0];
	userBalance_re_ent40#403 := userBalance_re_ent40#403[__this := default_address_t_int()];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#488 := owner#488[__this := __msg_sender];
	$return27:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	_totalSupply#863 := _totalSupply#863[__this := 1000000000000000000];
	balances#685 := balances#685[__this := balances#685[__this][owner#488[__this] := _totalSupply#863[__this]]];
	call_arg#34 := 0;
	call_arg#35 := owner#488[__this];
	assume {:sourceloc "buggy_16.sol", 275, 14} {:message ""} true;
	call Transfer#399(__this, __msg_sender, __msg_value, call_arg#34, call_arg#35, _totalSupply#863[__this]);
	$return28:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_16.sol", 277, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#977: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_16.sol", 278, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#979: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_16.sol", 279, 4} {:message "ExclusivePlatform::buyTicket_re_ent2"} buyTicket_re_ent2#1009(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 280, 12} {:message ""} true;
	call __send_ret#36 := __send(lastPlayer_re_ent2#977[__this], __this, 0, jackpot_re_ent2#979[__this]);
	if (!(__send_ret#36)) {
	assume false;
	}

	lastPlayer_re_ent2#977 := lastPlayer_re_ent2#977[__this := __msg_sender];
	jackpot_re_ent2#979 := jackpot_re_ent2#979[__this := __balance[__this]];
	$return29:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 286, 5} {:message "ExclusivePlatform::totalSupply"} totalSupply#1018(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1013: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1013 := _totalSupply#863[__this];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 289, 1} {:message "balances_re_ent17"} balances_re_ent17#1022: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 290, 1} {:message "ExclusivePlatform::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#1061(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1024: int)
{
	var {:sourceloc "buggy_16.sol", 293, 10} {:message "success"} success#1037: bool;
	var __call_ret#37: bool;
	var __call_ret#38: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#1022[__this][__msg_sender] >= _weiToWithdraw#1024);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1024);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1024)];
	assume {:sourceloc "buggy_16.sol", 293, 25} {:message ""} true;
	call __call_ret#37, __call_ret#38 := __call(__msg_sender, __this, _weiToWithdraw#1024);
	if (__call_ret#37) {
	havoc balances_re_ent29#658;
	havoc balances#685;
	havoc not_called_re_ent6#688;
	havoc allowed#721;
	havoc lastPlayer_re_ent16#723;
	havoc jackpot_re_ent16#725;
	havoc name#758;
	havoc balances_re_ent24#762;
	havoc symbol#798;
	havoc userBalance_re_ent5#802;
	havoc decimals#834;
	havoc balances_re_ent15#838;
	havoc _totalSupply#863;
	havoc counter_re_ent28#866;
	havoc XPLPerEther#898;
	havoc minimumBuy#903;
	havoc not_called_re_ent34#906;
	havoc crowdsaleIsOn#936;
	havoc lastPlayer_re_ent2#977;
	havoc jackpot_re_ent2#979;
	havoc balances_re_ent17#1022;
	havoc lastPlayer_re_ent37#1081;
	havoc jackpot_re_ent37#1083;
	havoc balances_re_ent3#1129;
	havoc lastPlayer_re_ent9#1217;
	havoc jackpot_re_ent9#1219;
	havoc redeemableEther_re_ent25#1296;
	havoc userBalance_re_ent19#1365;
	havoc userBalance_re_ent26#1438;
	havoc not_called_re_ent20#1532;
	havoc redeemableEther_re_ent32#1576;
	havoc balances_re_ent38#1636;
	havoc redeemableEther_re_ent4#1722;
	havoc counter_re_ent7#1808;
	havoc lastPlayer_re_ent23#1856;
	havoc jackpot_re_ent23#1858;
	havoc counter_re_ent14#1926;
	havoc lastPlayer_re_ent30#1977;
	havoc jackpot_re_ent30#1979;
	havoc balances_re_ent8#2058;
	havoc redeemableEther_re_ent39#2116;
	havoc balances_re_ent36#2188;
	havoc not_called_re_ent27#2214;
	havoc balances_re_ent31#2253;
	havoc not_called_re_ent13#2297;
	havoc redeemableEther_re_ent18#450;
	havoc owner#488;
	havoc userBalance_re_ent33#492;
	havoc not_called_re_ent41#548;
	havoc counter_re_ent42#617;
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#37)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1024)];
	}

	success#1037 := __call_ret#37;
	assume success#1037;
	balances_re_ent17#1022 := balances_re_ent17#1022[__this := balances_re_ent17#1022[__this][__msg_sender := (balances_re_ent17#1022[__this][__msg_sender] - _weiToWithdraw#1024)]];
	$return31:
	// Function body ends here
}

// 
// Function: updateXPLPerEther : function (uint256)
procedure {:sourceloc "buggy_16.sol", 298, 5} {:message "ExclusivePlatform::updateXPLPerEther"} updateXPLPerEther#1079(__this: address_t, __msg_sender: address_t, __msg_value: int, _XPLPerEther#1063: int)
{
	var call_arg#41: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#488[__this]);
	// Function body starts here
	call_arg#41 := owner#488[__this];
	assume {:sourceloc "buggy_16.sol", 299, 14} {:message ""} true;
	call NewPrice#2294(__this, __msg_sender, __msg_value, call_arg#41, XPLPerEther#898[__this], _XPLPerEther#1063);
	XPLPerEther#898 := XPLPerEther#898[__this := _XPLPerEther#1063];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_16.sol", 302, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#1081: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_16.sol", 303, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#1083: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_16.sol", 304, 4} {:message "ExclusivePlatform::buyTicket_re_ent37"} buyTicket_re_ent37#1113(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 305, 12} {:message ""} true;
	call __send_ret#42 := __send(lastPlayer_re_ent37#1081[__this], __this, 0, jackpot_re_ent37#1083[__this]);
	if (!(__send_ret#42)) {
	assume false;
	}

	lastPlayer_re_ent37#1081 := lastPlayer_re_ent37#1081[__this := __msg_sender];
	jackpot_re_ent37#1083 := jackpot_re_ent37#1083[__this := __balance[__this]];
	$return34:
	// Function body ends here
}

// 
// Function: switchCrowdsale : function ()
procedure {:sourceloc "buggy_16.sol", 311, 5} {:message "ExclusivePlatform::switchCrowdsale"} switchCrowdsale#1125(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#488[__this]);
	// Function body starts here
	crowdsaleIsOn#936 := crowdsaleIsOn#936[__this := !(crowdsaleIsOn#936[__this])];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 314, 1} {:message "balances_re_ent3"} balances_re_ent3#1129: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 315, 1} {:message "ExclusivePlatform::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#1168(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1131: int)
{
	var {:sourceloc "buggy_16.sol", 318, 3} {:message "success"} success#1144: bool;
	var __call_ret#45: bool;
	var __call_ret#46: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#1129[__this][__msg_sender] >= _weiToWithdraw#1131);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1131);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1131)];
	assume {:sourceloc "buggy_16.sol", 318, 19} {:message ""} true;
	call __call_ret#45, __call_ret#46 := __call(__msg_sender, __this, _weiToWithdraw#1131);
	if (__call_ret#45) {
	havoc balances_re_ent29#658;
	havoc balances#685;
	havoc not_called_re_ent6#688;
	havoc allowed#721;
	havoc lastPlayer_re_ent16#723;
	havoc jackpot_re_ent16#725;
	havoc name#758;
	havoc balances_re_ent24#762;
	havoc symbol#798;
	havoc userBalance_re_ent5#802;
	havoc decimals#834;
	havoc balances_re_ent15#838;
	havoc _totalSupply#863;
	havoc counter_re_ent28#866;
	havoc XPLPerEther#898;
	havoc minimumBuy#903;
	havoc not_called_re_ent34#906;
	havoc crowdsaleIsOn#936;
	havoc lastPlayer_re_ent2#977;
	havoc jackpot_re_ent2#979;
	havoc balances_re_ent17#1022;
	havoc lastPlayer_re_ent37#1081;
	havoc jackpot_re_ent37#1083;
	havoc balances_re_ent3#1129;
	havoc lastPlayer_re_ent9#1217;
	havoc jackpot_re_ent9#1219;
	havoc redeemableEther_re_ent25#1296;
	havoc userBalance_re_ent19#1365;
	havoc userBalance_re_ent26#1438;
	havoc not_called_re_ent20#1532;
	havoc redeemableEther_re_ent32#1576;
	havoc balances_re_ent38#1636;
	havoc redeemableEther_re_ent4#1722;
	havoc counter_re_ent7#1808;
	havoc lastPlayer_re_ent23#1856;
	havoc jackpot_re_ent23#1858;
	havoc counter_re_ent14#1926;
	havoc lastPlayer_re_ent30#1977;
	havoc jackpot_re_ent30#1979;
	havoc balances_re_ent8#2058;
	havoc redeemableEther_re_ent39#2116;
	havoc balances_re_ent36#2188;
	havoc not_called_re_ent27#2214;
	havoc balances_re_ent31#2253;
	havoc not_called_re_ent13#2297;
	havoc redeemableEther_re_ent18#450;
	havoc owner#488;
	havoc userBalance_re_ent33#492;
	havoc not_called_re_ent41#548;
	havoc counter_re_ent42#617;
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#45)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1131)];
	}

	success#1144 := __call_ret#45;
	assume success#1144;
	balances_re_ent3#1129 := balances_re_ent3#1129[__this := balances_re_ent3#1129[__this][__msg_sender := (balances_re_ent3#1129[__this][__msg_sender] - _weiToWithdraw#1131)]];
	$return37:
	// Function body ends here
}

// 
// Function: getBonus : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 323, 5} {:message "ExclusivePlatform::getBonus"} getBonus#1215(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#1170: int)
	returns (#1173: int)
{
	var call_arg#47: int;
	var mul#31_ret#48: int;
	var call_arg#49: int;
	var div#54_ret#50: int;
	var add#100_ret#51: int;
	var call_arg#52: int;
	var div#54_ret#53: int;
	var add#100_ret#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#47 := 5;
	assume {:sourceloc "buggy_16.sol", 324, 24} {:message ""} true;
	call mul#31_ret#48 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#898[__this], call_arg#47);
	if ((_amount#1170 >= mul#31_ret#48)) {
	call_arg#49 := 100;
	assume {:sourceloc "buggy_16.sol", 328, 21} {:message ""} true;
	call div#54_ret#50 := div#54(__this, __msg_sender, __msg_value, (20 * _amount#1170), call_arg#49);
	assume {:sourceloc "buggy_16.sol", 328, 20} {:message ""} true;
	call add#100_ret#51 := add#100(__this, __msg_sender, __msg_value, div#54_ret#50, _amount#1170);
	#1173 := add#100_ret#51;
	goto $return38;
	}
	else {
	if ((_amount#1170 >= XPLPerEther#898[__this])) {
	call_arg#52 := 100;
	assume {:sourceloc "buggy_16.sol", 333, 21} {:message ""} true;
	call div#54_ret#53 := div#54(__this, __msg_sender, __msg_value, (5 * _amount#1170), call_arg#52);
	assume {:sourceloc "buggy_16.sol", 333, 20} {:message ""} true;
	call add#100_ret#54 := add#100(__this, __msg_sender, __msg_value, div#54_ret#53, _amount#1170);
	#1173 := add#100_ret#54;
	goto $return38;
	}

	}

	#1173 := _amount#1170;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_16.sol", 337, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#1217: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_16.sol", 338, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#1219: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_16.sol", 339, 4} {:message "ExclusivePlatform::buyTicket_re_ent9"} buyTicket_re_ent9#1254(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 340, 10} {:message "success"} success#1223: bool;
	var __call_ret#55: bool;
	var __call_ret#56: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#1219[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#1219[__this])];
	assume {:sourceloc "buggy_16.sol", 340, 27} {:message ""} true;
	call __call_ret#55, __call_ret#56 := __call(lastPlayer_re_ent9#1217[__this], __this, jackpot_re_ent9#1219[__this]);
	if (__call_ret#55) {
	havoc balances_re_ent29#658;
	havoc balances#685;
	havoc not_called_re_ent6#688;
	havoc allowed#721;
	havoc lastPlayer_re_ent16#723;
	havoc jackpot_re_ent16#725;
	havoc name#758;
	havoc balances_re_ent24#762;
	havoc symbol#798;
	havoc userBalance_re_ent5#802;
	havoc decimals#834;
	havoc balances_re_ent15#838;
	havoc _totalSupply#863;
	havoc counter_re_ent28#866;
	havoc XPLPerEther#898;
	havoc minimumBuy#903;
	havoc not_called_re_ent34#906;
	havoc crowdsaleIsOn#936;
	havoc lastPlayer_re_ent2#977;
	havoc jackpot_re_ent2#979;
	havoc balances_re_ent17#1022;
	havoc lastPlayer_re_ent37#1081;
	havoc jackpot_re_ent37#1083;
	havoc balances_re_ent3#1129;
	havoc lastPlayer_re_ent9#1217;
	havoc jackpot_re_ent9#1219;
	havoc redeemableEther_re_ent25#1296;
	havoc userBalance_re_ent19#1365;
	havoc userBalance_re_ent26#1438;
	havoc not_called_re_ent20#1532;
	havoc redeemableEther_re_ent32#1576;
	havoc balances_re_ent38#1636;
	havoc redeemableEther_re_ent4#1722;
	havoc counter_re_ent7#1808;
	havoc lastPlayer_re_ent23#1856;
	havoc jackpot_re_ent23#1858;
	havoc counter_re_ent14#1926;
	havoc lastPlayer_re_ent30#1977;
	havoc jackpot_re_ent30#1979;
	havoc balances_re_ent8#2058;
	havoc redeemableEther_re_ent39#2116;
	havoc balances_re_ent36#2188;
	havoc not_called_re_ent27#2214;
	havoc balances_re_ent31#2253;
	havoc not_called_re_ent13#2297;
	havoc redeemableEther_re_ent18#450;
	havoc owner#488;
	havoc userBalance_re_ent33#492;
	havoc not_called_re_ent41#548;
	havoc counter_re_ent42#617;
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#55)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#1219[__this])];
	}

	success#1223 := __call_ret#55;
	if (!(success#1223)) {
	assume false;
	}

	lastPlayer_re_ent9#1217 := lastPlayer_re_ent9#1217[__this := __msg_sender];
	jackpot_re_ent9#1219 := jackpot_re_ent9#1219[__this := __balance[__this]];
	$return39:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 347, 5} {:message "ExclusivePlatform::[receive]"} #1292(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 350, 9} {:message "totalBuy"} totalBuy#1267: int;
	var mul#31_ret#57: int;
	var call_arg#58: int;
	var div#54_ret#59: int;
	var getBonus#1215_ret#60: int;
	var call_arg#61: address_t;
	var call_arg#62: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (crowdsaleIsOn#936[__this] && (__msg_value >= minimumBuy#903[__this]));
	assume {:sourceloc "buggy_16.sol", 350, 30} {:message ""} true;
	call mul#31_ret#57 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#898[__this], __msg_value);
	call_arg#58 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 350, 29} {:message ""} true;
	call div#54_ret#59 := div#54(__this, __msg_sender, __msg_value, mul#31_ret#57, call_arg#58);
	totalBuy#1267 := div#54_ret#59;
	assume {:sourceloc "buggy_16.sol", 351, 20} {:message ""} true;
	call getBonus#1215_ret#60 := getBonus#1215(__this, __msg_sender, __msg_value, totalBuy#1267);
	totalBuy#1267 := getBonus#1215_ret#60;
	call_arg#61 := owner#488[__this];
	call_arg#62 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 353, 9} {:message ""} true;
	call doTransfer#1529(__this, __msg_sender, __msg_value, call_arg#61, call_arg#62, totalBuy#1267);
	$return40:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 355, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#1296: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_16.sol", 356, 1} {:message "ExclusivePlatform::claimReward_re_ent25"} claimReward_re_ent25#1332(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 359, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#1309: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#1296[__this][__msg_sender] > 0);
	transferValue_re_ent25#1309 := redeemableEther_re_ent25#1296[__this][__msg_sender];
	assume {:sourceloc "buggy_16.sol", 360, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#1309);
	redeemableEther_re_ent25#1296 := redeemableEther_re_ent25#1296[__this := redeemableEther_re_ent25#1296[__this][__msg_sender := 0]];
	$return41:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: distribute
procedure {:sourceloc "buggy_16.sol", 364, 5} {:message "ExclusivePlatform::distribute"} distribute#1361(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#1335: address_t_arr_ptr, _amount#1337: int)
{
	var {:sourceloc "buggy_16.sol", 365, 14} {:message "i"} i#1341: int;
	var transfer#1632_ret#65: bool;
	var tmp#66: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1341 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1335])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1335]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1341 < length#address_t_arr#constr(mem_arr_address_t[_addresses#1335]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 365, 55} {:message ""} true;
	call transfer#1632_ret#65 := transfer#1632(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#1335])[i#1341], _amount#1337);
	$continue63:
	// Loop expression
	tmp#66 := i#1341;
	i#1341 := (i#1341 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1335])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1335]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break64:
	$return42:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 367, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#1365: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_16.sol", 368, 1} {:message "ExclusivePlatform::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#1394(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#67: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 371, 16} {:message ""} true;
	call __send_ret#67 := __send(__msg_sender, __this, 0, userBalance_re_ent19#1365[__this][__msg_sender]);
	if (!(__send_ret#67)) {
	assume false;
	}

	userBalance_re_ent19#1365 := userBalance_re_ent19#1365[__this := userBalance_re_ent19#1365[__this][__msg_sender := 0]];
	$return43:
	// Function body ends here
}

// 
// Function: distributeWithAmount
procedure {:sourceloc "buggy_16.sol", 377, 5} {:message "ExclusivePlatform::distributeWithAmount"} distributeWithAmount#1434(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#1397: address_t_arr_ptr, _amounts#1400: int_arr_ptr)
{
	var {:sourceloc "buggy_16.sol", 379, 14} {:message "i"} i#1412: int;
	var transfer#1632_ret#70: bool;
	var tmp#71: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1397])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1397]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_amounts#1400])) && (length#int_arr#constr(mem_arr_int[_amounts#1400]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_addresses#1397]) == length#int_arr#constr(mem_arr_int[_amounts#1400]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#1412 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1397])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1397]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1412 < length#address_t_arr#constr(mem_arr_address_t[_addresses#1397]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 379, 55} {:message ""} true;
	call transfer#1632_ret#70 := transfer#1632(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#1397])[i#1412], arr#int_arr#constr(mem_arr_int[_amounts#1400])[i#1412]);
	$continue68:
	// Loop expression
	tmp#71 := i#1412;
	i#1412 := (i#1412 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1397])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1397]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break69:
	$return44:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 381, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#1438: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_16.sol", 382, 1} {:message "ExclusivePlatform::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#1472(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 385, 10} {:message "success"} success#1442: bool;
	var __call_ret#72: bool;
	var __call_ret#73: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#1438[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#1438[__this][__msg_sender])];
	assume {:sourceloc "buggy_16.sol", 385, 26} {:message ""} true;
	call __call_ret#72, __call_ret#73 := __call(__msg_sender, __this, userBalance_re_ent26#1438[__this][__msg_sender]);
	if (__call_ret#72) {
	havoc balances_re_ent29#658;
	havoc balances#685;
	havoc not_called_re_ent6#688;
	havoc allowed#721;
	havoc lastPlayer_re_ent16#723;
	havoc jackpot_re_ent16#725;
	havoc name#758;
	havoc balances_re_ent24#762;
	havoc symbol#798;
	havoc userBalance_re_ent5#802;
	havoc decimals#834;
	havoc balances_re_ent15#838;
	havoc _totalSupply#863;
	havoc counter_re_ent28#866;
	havoc XPLPerEther#898;
	havoc minimumBuy#903;
	havoc not_called_re_ent34#906;
	havoc crowdsaleIsOn#936;
	havoc lastPlayer_re_ent2#977;
	havoc jackpot_re_ent2#979;
	havoc balances_re_ent17#1022;
	havoc lastPlayer_re_ent37#1081;
	havoc jackpot_re_ent37#1083;
	havoc balances_re_ent3#1129;
	havoc lastPlayer_re_ent9#1217;
	havoc jackpot_re_ent9#1219;
	havoc redeemableEther_re_ent25#1296;
	havoc userBalance_re_ent19#1365;
	havoc userBalance_re_ent26#1438;
	havoc not_called_re_ent20#1532;
	havoc redeemableEther_re_ent32#1576;
	havoc balances_re_ent38#1636;
	havoc redeemableEther_re_ent4#1722;
	havoc counter_re_ent7#1808;
	havoc lastPlayer_re_ent23#1856;
	havoc jackpot_re_ent23#1858;
	havoc counter_re_ent14#1926;
	havoc lastPlayer_re_ent30#1977;
	havoc jackpot_re_ent30#1979;
	havoc balances_re_ent8#2058;
	havoc redeemableEther_re_ent39#2116;
	havoc balances_re_ent36#2188;
	havoc not_called_re_ent27#2214;
	havoc balances_re_ent31#2253;
	havoc not_called_re_ent13#2297;
	havoc redeemableEther_re_ent18#450;
	havoc owner#488;
	havoc userBalance_re_ent33#492;
	havoc not_called_re_ent41#548;
	havoc counter_re_ent42#617;
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#72)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#1438[__this][__msg_sender])];
	}

	success#1442 := __call_ret#72;
	if (!(success#1442)) {
	assume false;
	}

	userBalance_re_ent26#1438 := userBalance_re_ent26#1438[__this := userBalance_re_ent26#1438[__this][__msg_sender := 0]];
	$return45:
	// Function body ends here
}

// 
// Function: doTransfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 396, 5} {:message "ExclusivePlatform::doTransfer"} doTransfer#1529(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1475: address_t, _to#1477: address_t, _amount#1479: int)
{
	var sub#77_ret#74: int;
	var add#100_ret#75: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1477 != 0);
	assume (_amount#1479 <= balances#685[__this][_from#1475]);
	assume {:sourceloc "buggy_16.sol", 400, 27} {:message ""} true;
	call sub#77_ret#74 := sub#77(__this, __msg_sender, __msg_value, balances#685[__this][_from#1475], _amount#1479);
	balances#685 := balances#685[__this := balances#685[__this][_from#1475 := sub#77_ret#74]];
	assume {:sourceloc "buggy_16.sol", 401, 25} {:message ""} true;
	call add#100_ret#75 := add#100(__this, __msg_sender, __msg_value, balances#685[__this][_to#1477], _amount#1479);
	balances#685 := balances#685[__this := balances#685[__this][_to#1477 := add#100_ret#75]];
	assume {:sourceloc "buggy_16.sol", 402, 14} {:message ""} true;
	call Transfer#399(__this, __msg_sender, __msg_value, _from#1475, _to#1477, _amount#1479);
	$return46:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_16.sol", 404, 1} {:message "not_called_re_ent20"} not_called_re_ent20#1532: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_16.sol", 405, 1} {:message "ExclusivePlatform::bug_re_ent20"} bug_re_ent20#1559(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#76: int;
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#1532[__this];
	call_arg#76 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 407, 16} {:message ""} true;
	call __send_ret#77 := __send(__msg_sender, __this, 0, call_arg#76);
	if (!(__send_ret#77)) {
	assume false;
	}

	not_called_re_ent20#1532 := not_called_re_ent20#1532[__this := false];
	$return47:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 413, 5} {:message "ExclusivePlatform::balanceOf"} balanceOf#1572(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#1561: address_t)
	returns (#1565: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1565 := balances#685[__this][_owner#1561];
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 416, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#1576: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_16.sol", 417, 1} {:message "ExclusivePlatform::claimReward_re_ent32"} claimReward_re_ent32#1612(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 420, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#1589: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#1576[__this][__msg_sender] > 0);
	transferValue_re_ent32#1589 := redeemableEther_re_ent32#1576[__this][__msg_sender];
	assume {:sourceloc "buggy_16.sol", 421, 6} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#1589);
	redeemableEther_re_ent32#1576 := redeemableEther_re_ent32#1576[__this := redeemableEther_re_ent32#1576[__this][__msg_sender := 0]];
	$return49:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 425, 5} {:message "ExclusivePlatform::transfer"} transfer#1632(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1614: address_t, _amount#1616: int)
	returns (success#1620: bool)
{
	var call_arg#78: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#78 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 426, 9} {:message ""} true;
	call doTransfer#1529(__this, __msg_sender, __msg_value, call_arg#78, _to#1614, _amount#1616);
	success#1620 := true;
	goto $return50;
	$return50:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 429, 1} {:message "balances_re_ent38"} balances_re_ent38#1636: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 430, 1} {:message "ExclusivePlatform::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#1669(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1638: int)
{
	var __send_ret#79: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#1636[__this][__msg_sender] >= _weiToWithdraw#1638);
	assume {:sourceloc "buggy_16.sol", 433, 17} {:message ""} true;
	call __send_ret#79 := __send(__msg_sender, __this, 0, _weiToWithdraw#1638);
	assume __send_ret#79;
	balances_re_ent38#1636 := balances_re_ent38#1636[__this := balances_re_ent38#1636[__this][__msg_sender := (balances_re_ent38#1636[__this][__msg_sender] - _weiToWithdraw#1638)]];
	$return51:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 436, 5} {:message "ExclusivePlatform::transferFrom"} transferFrom#1718(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1671: address_t, _to#1673: address_t, _amount#1675: int)
	returns (success#1679: bool)
{
	var sub#77_ret#80: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#721[__this][_from#1671][__msg_sender] >= _amount#1675);
	assume {:sourceloc "buggy_16.sol", 438, 38} {:message ""} true;
	call sub#77_ret#80 := sub#77(__this, __msg_sender, __msg_value, allowed#721[__this][_from#1671][__msg_sender], _amount#1675);
	allowed#721 := allowed#721[__this := allowed#721[__this][_from#1671 := allowed#721[__this][_from#1671][__msg_sender := sub#77_ret#80]]];
	assume {:sourceloc "buggy_16.sol", 439, 9} {:message ""} true;
	call doTransfer#1529(__this, __msg_sender, __msg_value, _from#1671, _to#1673, _amount#1675);
	success#1679 := true;
	goto $return52;
	$return52:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 442, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#1722: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_16.sol", 443, 1} {:message "ExclusivePlatform::claimReward_re_ent4"} claimReward_re_ent4#1758(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 446, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#1735: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#1722[__this][__msg_sender] > 0);
	transferValue_re_ent4#1735 := redeemableEther_re_ent4#1722[__this][__msg_sender];
	assume {:sourceloc "buggy_16.sol", 447, 6} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#1735);
	redeemableEther_re_ent4#1722 := redeemableEther_re_ent4#1722[__this := redeemableEther_re_ent4#1722[__this][__msg_sender := 0]];
	$return53:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 455, 5} {:message "ExclusivePlatform::approve"} approve#1805(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#1761: address_t, _amount#1763: int)
	returns (success#1767: bool)
{
	var call_arg#81: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((_amount#1763 == 0) || (allowed#721[__this][__msg_sender][_spender#1761] == 0));
	allowed#721 := allowed#721[__this := allowed#721[__this][__msg_sender := allowed#721[__this][__msg_sender][_spender#1761 := _amount#1763]]];
	call_arg#81 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 462, 14} {:message ""} true;
	call Approval#445(__this, __msg_sender, __msg_value, call_arg#81, _spender#1761, _amount#1763);
	success#1767 := true;
	goto $return54;
	$return54:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_16.sol", 465, 1} {:message "counter_re_ent7"} counter_re_ent7#1808: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_16.sol", 466, 1} {:message "ExclusivePlatform::callme_re_ent7"} callme_re_ent7#1837(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#82: int;
	var __send_ret#83: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1808[__this] <= 5);
	call_arg#82 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 468, 9} {:message ""} true;
	call __send_ret#83 := __send(__msg_sender, __this, 0, call_arg#82);
	if (!(__send_ret#83)) {
	assume false;
	}

	counter_re_ent7#1808 := counter_re_ent7#1808[__this := (counter_re_ent7#1808[__this] + 1)];
	$return55:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 474, 5} {:message "ExclusivePlatform::allowance"} allowance#1854(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#1839: address_t, _spender#1841: address_t)
	returns (#1845: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1845 := allowed#721[__this][_owner#1839][_spender#1841];
	goto $return56;
	$return56:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_16.sol", 477, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1856: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_16.sol", 478, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1858: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_16.sol", 479, 4} {:message "ExclusivePlatform::buyTicket_re_ent23"} buyTicket_re_ent23#1888(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#84: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 480, 12} {:message ""} true;
	call __send_ret#84 := __send(lastPlayer_re_ent23#1856[__this], __this, 0, jackpot_re_ent23#1858[__this]);
	if (!(__send_ret#84)) {
	assume false;
	}

	lastPlayer_re_ent23#1856 := lastPlayer_re_ent23#1856[__this := __msg_sender];
	jackpot_re_ent23#1858 := jackpot_re_ent23#1858[__this := __balance[__this]];
	$return57:
	// Function body ends here
}

// 
// Function: transferEther : function (address payable,uint256)
procedure {:sourceloc "buggy_16.sol", 486, 5} {:message "ExclusivePlatform::transferEther"} transferEther#1923(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#1890: address_t, _amount#1892: int)
{
	var call_arg#87: address_t;
	var call_arg#88: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#488[__this]);
	// Function body starts here
	assume (_amount#1892 <= __balance[__this]);
	call_arg#87 := __this;
	call_arg#88 := _receiver#1890;
	assume {:sourceloc "buggy_16.sol", 488, 14} {:message ""} true;
	call TransferEther#2249(__this, __msg_sender, __msg_value, call_arg#87, call_arg#88, _amount#1892);
	assume {:sourceloc "buggy_16.sol", 489, 9} {:message ""} true;
	call __transfer(_receiver#1890, __this, 0, _amount#1892);
	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_16.sol", 491, 1} {:message "counter_re_ent14"} counter_re_ent14#1926: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_16.sol", 492, 1} {:message "ExclusivePlatform::callme_re_ent14"} callme_re_ent14#1955(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#89: int;
	var __send_ret#90: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1926[__this] <= 5);
	call_arg#89 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 494, 9} {:message ""} true;
	call __send_ret#90 := __send(__msg_sender, __this, 0, call_arg#89);
	if (!(__send_ret#90)) {
	assume false;
	}

	counter_re_ent14#1926 := counter_re_ent14#1926[__this := (counter_re_ent14#1926[__this] + 1)];
	$return60:
	// Function body ends here
}

// 
// Function: withdrawFund : function ()
procedure {:sourceloc "buggy_16.sol", 500, 5} {:message "ExclusivePlatform::withdrawFund"} withdrawFund#1975(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 501, 9} {:message "balance"} balance#1961#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#488[__this]);
	// Function body starts here
	balance#1961#92 := __balance[__this];
	assume {:sourceloc "buggy_16.sol", 502, 9} {:message ""} true;
	call __transfer(owner#488[__this], __this, 0, balance#1961#92);
	$return62:
	// Function body ends here
	$return61:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_16.sol", 504, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1977: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_16.sol", 505, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1979: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_16.sol", 506, 4} {:message "ExclusivePlatform::buyTicket_re_ent30"} buyTicket_re_ent30#2009(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#93: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 507, 12} {:message ""} true;
	call __send_ret#93 := __send(lastPlayer_re_ent30#1977[__this], __this, 0, jackpot_re_ent30#1979[__this]);
	if (!(__send_ret#93)) {
	assume false;
	}

	lastPlayer_re_ent30#1977 := lastPlayer_re_ent30#1977[__this := __msg_sender];
	jackpot_re_ent30#1979 := jackpot_re_ent30#1979[__this := __balance[__this]];
	$return63:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_16.sol", 513, 5} {:message "ExclusivePlatform::burn"} burn#2054(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#2011: int)
{
	var {:sourceloc "buggy_16.sol", 515, 9} {:message "burner"} burner#2026#95: address_t;
	var sub#77_ret#96: int;
	var sub#77_ret#97: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#488[__this]);
	// Function body starts here
	assume (_value#2011 <= balances#685[__this][__msg_sender]);
	burner#2026#95 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 516, 28} {:message ""} true;
	call sub#77_ret#96 := sub#77(__this, __msg_sender, __msg_value, balances#685[__this][burner#2026#95], _value#2011);
	balances#685 := balances#685[__this := balances#685[__this][burner#2026#95 := sub#77_ret#96]];
	assume {:sourceloc "buggy_16.sol", 517, 24} {:message ""} true;
	call sub#77_ret#97 := sub#77(__this, __msg_sender, __msg_value, _totalSupply#863[__this], _value#2011);
	_totalSupply#863 := _totalSupply#863[__this := sub#77_ret#97];
	assume {:sourceloc "buggy_16.sol", 518, 14} {:message ""} true;
	call Burn#2335(__this, __msg_sender, __msg_value, burner#2026#95, _value#2011);
	$return65:
	// Function body ends here
	$return64:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 520, 1} {:message "balances_re_ent8"} balances_re_ent8#2058: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_16.sol", 521, 6} {:message "ExclusivePlatform::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#2087(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 522, 11} {:message "success"} success#2062: bool;
	var __call_ret#98: bool;
	var __call_ret#99: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#2058[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#2058[__this][__msg_sender])];
	assume {:sourceloc "buggy_16.sol", 522, 28} {:message ""} true;
	call __call_ret#98, __call_ret#99 := __call(__msg_sender, __this, balances_re_ent8#2058[__this][__msg_sender]);
	if (__call_ret#98) {
	havoc balances_re_ent29#658;
	havoc balances#685;
	havoc not_called_re_ent6#688;
	havoc allowed#721;
	havoc lastPlayer_re_ent16#723;
	havoc jackpot_re_ent16#725;
	havoc name#758;
	havoc balances_re_ent24#762;
	havoc symbol#798;
	havoc userBalance_re_ent5#802;
	havoc decimals#834;
	havoc balances_re_ent15#838;
	havoc _totalSupply#863;
	havoc counter_re_ent28#866;
	havoc XPLPerEther#898;
	havoc minimumBuy#903;
	havoc not_called_re_ent34#906;
	havoc crowdsaleIsOn#936;
	havoc lastPlayer_re_ent2#977;
	havoc jackpot_re_ent2#979;
	havoc balances_re_ent17#1022;
	havoc lastPlayer_re_ent37#1081;
	havoc jackpot_re_ent37#1083;
	havoc balances_re_ent3#1129;
	havoc lastPlayer_re_ent9#1217;
	havoc jackpot_re_ent9#1219;
	havoc redeemableEther_re_ent25#1296;
	havoc userBalance_re_ent19#1365;
	havoc userBalance_re_ent26#1438;
	havoc not_called_re_ent20#1532;
	havoc redeemableEther_re_ent32#1576;
	havoc balances_re_ent38#1636;
	havoc redeemableEther_re_ent4#1722;
	havoc counter_re_ent7#1808;
	havoc lastPlayer_re_ent23#1856;
	havoc jackpot_re_ent23#1858;
	havoc counter_re_ent14#1926;
	havoc lastPlayer_re_ent30#1977;
	havoc jackpot_re_ent30#1979;
	havoc balances_re_ent8#2058;
	havoc redeemableEther_re_ent39#2116;
	havoc balances_re_ent36#2188;
	havoc not_called_re_ent27#2214;
	havoc balances_re_ent31#2253;
	havoc not_called_re_ent13#2297;
	havoc redeemableEther_re_ent18#450;
	havoc owner#488;
	havoc userBalance_re_ent33#492;
	havoc not_called_re_ent41#548;
	havoc counter_re_ent42#617;
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#98)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#2058[__this][__msg_sender])];
	}

	success#2062 := __call_ret#98;
	if (success#2062) {
	balances_re_ent8#2058 := balances_re_ent8#2058[__this := balances_re_ent8#2058[__this][__msg_sender := 0]];
	}

	$return66:
	// Function body ends here
}

// 
// Function: getForeignTokenBalance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 528, 5} {:message "ExclusivePlatform::getForeignTokenBalance"} getForeignTokenBalance#2112(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#2089: address_t, who#2091: address_t)
	returns (#2094: int)
{
	var {:sourceloc "buggy_16.sol", 529, 9} {:message "token"} token#2097: address_t;
	var {:sourceloc "buggy_16.sol", 530, 9} {:message "bal"} bal#2103: int;
	var balanceOf#145_ret#100: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	token#2097 := tokenAddress#2089;
	assume {:sourceloc "buggy_16.sol", 530, 20} {:message ""} true;
	call balanceOf#145_ret#100 := balanceOf#145(token#2097, __this, 0, who#2091);
	bal#2103 := balanceOf#145_ret#100;
	#2094 := bal#2103;
	goto $return67;
	$return67:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 533, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#2116: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_16.sol", 534, 1} {:message "ExclusivePlatform::claimReward_re_ent39"} claimReward_re_ent39#2152(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 537, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#2129: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#2116[__this][__msg_sender] > 0);
	transferValue_re_ent39#2129 := redeemableEther_re_ent39#2116[__this][__msg_sender];
	assume {:sourceloc "buggy_16.sol", 538, 6} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#2129);
	redeemableEther_re_ent39#2116 := redeemableEther_re_ent39#2116[__this := redeemableEther_re_ent39#2116[__this][__msg_sender := 0]];
	$return68:
	// Function body ends here
}

// 
// Function: withdrawForeignTokens : function (address) returns (bool)
procedure {:sourceloc "buggy_16.sol", 542, 5} {:message "ExclusivePlatform::withdrawForeignTokens"} withdrawForeignTokens#2184(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#2154: address_t)
	returns (#2159: bool)
{
	var {:sourceloc "buggy_16.sol", 543, 9} {:message "token"} token#2162#102: address_t;
	var {:sourceloc "buggy_16.sol", 544, 9} {:message "amount"} amount#2168#102: int;
	var call_arg#103: address_t;
	var balanceOf#145_ret#104: int;
	var call_arg#105: address_t;
	var transfer#233_ret#106: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#488[__this]);
	// Function body starts here
	token#2162#102 := tokenAddress#2154;
	call_arg#103 := __this;
	assume {:sourceloc "buggy_16.sol", 544, 26} {:message ""} true;
	call balanceOf#145_ret#104 := balanceOf#145(token#2162#102, __this, 0, call_arg#103);
	amount#2168#102 := balanceOf#145_ret#104;
	call_arg#105 := owner#488[__this];
	assume {:sourceloc "buggy_16.sol", 545, 16} {:message ""} true;
	call transfer#233_ret#106 := transfer#233(token#2162#102, __this, 0, call_arg#105, amount#2168#102);
	#2159 := transfer#233_ret#106;
	goto $return70;
	$return70:
	// Function body ends here
	$return69:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 547, 1} {:message "balances_re_ent36"} balances_re_ent36#2188: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_16.sol", 548, 5} {:message "ExclusivePlatform::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#2211(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#107: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 549, 9} {:message ""} true;
	call __send_ret#107 := __send(__msg_sender, __this, 0, balances_re_ent36#2188[__this][__msg_sender]);
	if (__send_ret#107) {
	balances_re_ent36#2188 := balances_re_ent36#2188[__this := balances_re_ent36#2188[__this][__msg_sender := 0]];
	}

	$return71:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_16.sol", 553, 3} {:message "not_called_re_ent27"} not_called_re_ent27#2214: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_16.sol", 554, 1} {:message "ExclusivePlatform::bug_re_ent27"} bug_re_ent27#2241(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#108: int;
	var __send_ret#109: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#2214[__this];
	call_arg#108 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 556, 16} {:message ""} true;
	call __send_ret#109 := __send(__msg_sender, __this, 0, call_arg#108);
	if (!(__send_ret#109)) {
	assume false;
	}

	not_called_re_ent27#2214 := not_called_re_ent27#2214[__this := false];
	$return72:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 562, 3} {:message "balances_re_ent31"} balances_re_ent31#2253: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 563, 1} {:message "ExclusivePlatform::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#2286(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#2255: int)
{
	var __send_ret#110: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#2253[__this][__msg_sender] >= _weiToWithdraw#2255);
	assume {:sourceloc "buggy_16.sol", 566, 13} {:message ""} true;
	call __send_ret#110 := __send(__msg_sender, __this, 0, _weiToWithdraw#2255);
	assume __send_ret#110;
	balances_re_ent31#2253 := balances_re_ent31#2253[__this := balances_re_ent31#2253[__this][__msg_sender := (balances_re_ent31#2253[__this][__msg_sender] - _weiToWithdraw#2255)]];
	$return73:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_16.sol", 570, 3} {:message "not_called_re_ent13"} not_called_re_ent13#2297: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_16.sol", 571, 1} {:message "ExclusivePlatform::bug_re_ent13"} bug_re_ent13#2329(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 573, 10} {:message "success"} success#2305: bool;
	var __call_ret#111: bool;
	var __call_ret#112: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#2297[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_16.sol", 573, 25} {:message ""} true;
	call __call_ret#111, __call_ret#112 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#111) {
	havoc balances_re_ent29#658;
	havoc balances#685;
	havoc not_called_re_ent6#688;
	havoc allowed#721;
	havoc lastPlayer_re_ent16#723;
	havoc jackpot_re_ent16#725;
	havoc name#758;
	havoc balances_re_ent24#762;
	havoc symbol#798;
	havoc userBalance_re_ent5#802;
	havoc decimals#834;
	havoc balances_re_ent15#838;
	havoc _totalSupply#863;
	havoc counter_re_ent28#866;
	havoc XPLPerEther#898;
	havoc minimumBuy#903;
	havoc not_called_re_ent34#906;
	havoc crowdsaleIsOn#936;
	havoc lastPlayer_re_ent2#977;
	havoc jackpot_re_ent2#979;
	havoc balances_re_ent17#1022;
	havoc lastPlayer_re_ent37#1081;
	havoc jackpot_re_ent37#1083;
	havoc balances_re_ent3#1129;
	havoc lastPlayer_re_ent9#1217;
	havoc jackpot_re_ent9#1219;
	havoc redeemableEther_re_ent25#1296;
	havoc userBalance_re_ent19#1365;
	havoc userBalance_re_ent26#1438;
	havoc not_called_re_ent20#1532;
	havoc redeemableEther_re_ent32#1576;
	havoc balances_re_ent38#1636;
	havoc redeemableEther_re_ent4#1722;
	havoc counter_re_ent7#1808;
	havoc lastPlayer_re_ent23#1856;
	havoc jackpot_re_ent23#1858;
	havoc counter_re_ent14#1926;
	havoc lastPlayer_re_ent30#1977;
	havoc jackpot_re_ent30#1979;
	havoc balances_re_ent8#2058;
	havoc redeemableEther_re_ent39#2116;
	havoc balances_re_ent36#2188;
	havoc not_called_re_ent27#2214;
	havoc balances_re_ent31#2253;
	havoc not_called_re_ent13#2297;
	havoc redeemableEther_re_ent18#450;
	havoc owner#488;
	havoc userBalance_re_ent33#492;
	havoc not_called_re_ent41#548;
	havoc counter_re_ent42#617;
	havoc counter_re_ent21#109;
	havoc balances_re_ent10#149;
	havoc balances_re_ent21#195;
	havoc userBalance_re_ent12#237;
	havoc redeemableEther_re_ent11#279;
	havoc balances_re_ent1#330;
	havoc counter_re_ent35#362;
	havoc userBalance_re_ent40#403;
	havoc __balance;
	}

	if (!(__call_ret#111)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#2305 := __call_ret#111;
	if (!(success#2305)) {
	assume false;
	}

	not_called_re_ent13#2297 := not_called_re_ent13#2297[__this := false];
	$return74:
	// Function body ends here
}

