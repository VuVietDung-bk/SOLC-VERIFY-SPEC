// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_33.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_33.sol", 35, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#118(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#114: address_t, _to#116: address_t)
{
	
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_33.sol", 8, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#3: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_33.sol", 9, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#5: [address_t]int;
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
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_33.sol", 10, 4} {:message "Owned::buyTicket_re_ent2"} buyTicket_re_ent2#35(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 11, 12} {:message ""} true;
	call __send_ret#0 := __send(lastPlayer_re_ent2#3[__this], __this, 0, jackpot_re_ent2#5[__this]);
	if (!(__send_ret#0)) {
	assume false;
	}

	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := __msg_sender];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := __balance[__this]];
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_33.sol", 16, 3} {:message "owner"} owner#37: [address_t]address_t;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 17, 3} {:message "balances_re_ent17"} balances_re_ent17#41: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_33.sol", 18, 1} {:message "Owned::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#80(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#43: int)
{
	var {:sourceloc "buggy_33.sol", 21, 10} {:message "success"} success#56: bool;
	var __call_ret#1: bool;
	var __call_ret#2: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#41[__this][__msg_sender] >= _weiToWithdraw#43);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#43);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#43)];
	assume {:sourceloc "buggy_33.sol", 21, 25} {:message ""} true;
	call __call_ret#1, __call_ret#2 := __call(__msg_sender, __this, _weiToWithdraw#43);
	if (__call_ret#1) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#1)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#43)];
	}

	success#56 := __call_ret#1;
	assume success#56;
	balances_re_ent17#41 := balances_re_ent17#41[__this := balances_re_ent17#41[__this][__msg_sender := (balances_re_ent17#41[__this][__msg_sender] - _weiToWithdraw#43)]];
	$return1:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_33.sol", 25, 3} {:message "newOwner"} newOwner#82: [address_t]address_t;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_33.sol", 27, 3} {:message "not_called_re_ent27"} not_called_re_ent27#85: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_33.sol", 28, 1} {:message "Owned::bug_re_ent27"} bug_re_ent27#112(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#85[__this];
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 30, 16} {:message ""} true;
	call __send_ret#4 := __send(__msg_sender, __this, 0, call_arg#3);
	if (!(__send_ret#4)) {
	assume false;
	}

	not_called_re_ent27#85 := not_called_re_ent27#85[__this := false];
	$return2:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_33.sol", 37, 5} {:message "Owned::[constructor]"} __constructor#236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := 0];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := 0];
	owner#37 := owner#37[__this := 0];
	balances_re_ent17#41 := balances_re_ent17#41[__this := default_address_t_int()];
	newOwner#82 := newOwner#82[__this := 0];
	not_called_re_ent27#85 := not_called_re_ent27#85[__this := true];
	redeemableEther_re_ent32#131 := redeemableEther_re_ent32#131[__this := default_address_t_int()];
	balances_re_ent38#202 := balances_re_ent38#202[__this := default_address_t_int()];
	// Function body starts here
	owner#37 := owner#37[__this := __msg_sender];
	$return3:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 40, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#131: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_33.sol", 41, 1} {:message "Owned::claimReward_re_ent32"} claimReward_re_ent32#167(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 44, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#144: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#131[__this][__msg_sender] > 0);
	transferValue_re_ent32#144 := redeemableEther_re_ent32#131[__this][__msg_sender];
	assume {:sourceloc "buggy_33.sol", 45, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#144);
	redeemableEther_re_ent32#131 := redeemableEther_re_ent32#131[__this := redeemableEther_re_ent32#131[__this][__msg_sender := 0]];
	$return4:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_33.sol", 54, 5} {:message "Owned::transferOwnership"} transferOwnership#198(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#188: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#37[__this]) || (__msg_sender == __this));
	// Function body starts here
	newOwner#82 := newOwner#82[__this := _newOwner#188];
	$return6:
	// Function body ends here
	$return5:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 57, 1} {:message "balances_re_ent38"} balances_re_ent38#202: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_33.sol", 58, 1} {:message "Owned::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#235(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#204: int)
{
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#202[__this][__msg_sender] >= _weiToWithdraw#204);
	assume {:sourceloc "buggy_33.sol", 61, 17} {:message ""} true;
	call __send_ret#7 := __send(__msg_sender, __this, 0, _weiToWithdraw#204);
	assume __send_ret#7;
	balances_re_ent38#202 := balances_re_ent38#202[__this := balances_re_ent38#202[__this][__msg_sender := (balances_re_ent38#202[__this][__msg_sender] - _weiToWithdraw#204)]];
	$return7:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 67, 3} {:message "SafeMath::mul"} mul#269(__this: address_t, __msg_sender: address_t, __msg_value: int, a#238: int, b#240: int)
	returns (#243: int)
{
	var {:sourceloc "buggy_33.sol", 71, 5} {:message "c"} c#253: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#238 == 0)) {
	#243 := 0;
	goto $return8;
	}

	c#253 := (a#238 * b#240);
	assert {:sourceloc "buggy_33.sol", 72, 5} {:message "Assertion might not hold."} ((c#253 div a#238) == b#240);
	#243 := c#253;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 76, 3} {:message "SafeMath::div"} div#287(__this: address_t, __msg_sender: address_t, __msg_value: int, a#271: int, b#273: int)
	returns (#276: int)
{
	var {:sourceloc "buggy_33.sol", 77, 5} {:message "c"} c#279: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#279 := (a#271 div b#273);
	#276 := c#279;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 81, 3} {:message "SafeMath::sub"} sub#307(__this: address_t, __msg_sender: address_t, __msg_value: int, a#289: int, b#291: int)
	returns (#294: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_33.sol", 82, 5} {:message "Assertion might not hold."} (b#291 <= a#289);
	#294 := (a#289 - b#291);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 86, 3} {:message "SafeMath::add"} add#331(__this: address_t, __msg_sender: address_t, __msg_value: int, a#309: int, b#311: int)
	returns (#314: int)
{
	var {:sourceloc "buggy_33.sol", 87, 5} {:message "c"} c#317: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#317 := (a#309 + b#311);
	assert {:sourceloc "buggy_33.sol", 88, 5} {:message "Assertion might not hold."} (c#317 >= a#309);
	#314 := c#317;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 92, 3} {:message "SafeMath::ceil"} ceil#363(__this: address_t, __msg_sender: address_t, __msg_value: int, a#333: int, m#335: int)
	returns (#338: int)
{
	var {:sourceloc "buggy_33.sol", 93, 5} {:message "c"} c#341: int;
	var add#331_ret#8: int;
	var {:sourceloc "buggy_33.sol", 94, 5} {:message "d"} d#348: int;
	var call_arg#9: int;
	var sub#307_ret#10: int;
	var div#287_ret#11: int;
	var mul#269_ret#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 93, 17} {:message ""} true;
	call add#331_ret#8 := add#331(__this, __msg_sender, __msg_value, a#333, m#335);
	c#341 := add#331_ret#8;
	call_arg#9 := 1;
	assume {:sourceloc "buggy_33.sol", 94, 17} {:message ""} true;
	call sub#307_ret#10 := sub#307(__this, __msg_sender, __msg_value, c#341, call_arg#9);
	d#348 := sub#307_ret#10;
	assume {:sourceloc "buggy_33.sol", 95, 16} {:message ""} true;
	call div#287_ret#11 := div#287(__this, __msg_sender, __msg_value, d#348, m#335);
	assume {:sourceloc "buggy_33.sol", 95, 12} {:message ""} true;
	call mul#269_ret#12 := mul#269(__this, __msg_sender, __msg_value, div#287_ret#11, m#335);
	#338 := mul#269_ret#12;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_33.sol", 66, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#364(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Token -------
// 
// Function: balanceOf
procedure {:sourceloc "buggy_33.sol", 100, 3} {:message "Token::balanceOf"} balanceOf#371(__this: address_t, __msg_sender: address_t, __msg_value: int, who#366: address_t)
	returns (#369: int);
	modifies redeemableEther_re_ent4#375, counter_re_ent7#425, lastPlayer_re_ent23#465, jackpot_re_ent23#467;

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 101, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#375: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_33.sol", 102, 1} {:message "Token::claimReward_re_ent4"} claimReward_re_ent4#411(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 105, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#388: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#375[__this][__msg_sender] > 0);
	transferValue_re_ent4#388 := redeemableEther_re_ent4#375[__this][__msg_sender];
	assume {:sourceloc "buggy_33.sol", 106, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#388);
	redeemableEther_re_ent4#375 := redeemableEther_re_ent4#375[__this := redeemableEther_re_ent4#375[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_33.sol", 109, 5} {:message "Token::transferFrom"} transferFrom#422(__this: address_t, __msg_sender: address_t, __msg_value: int, from#413: address_t, to#415: address_t, value#417: int)
	returns (#420: bool);
	modifies redeemableEther_re_ent4#375, counter_re_ent7#425, lastPlayer_re_ent23#465, jackpot_re_ent23#467;

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_33.sol", 110, 1} {:message "counter_re_ent7"} counter_re_ent7#425: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_33.sol", 111, 1} {:message "Token::callme_re_ent7"} callme_re_ent7#454(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#425[__this] <= 5);
	call_arg#13 := 10000000000000000000;
	assume {:sourceloc "buggy_33.sol", 113, 9} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	assume false;
	}

	counter_re_ent7#425 := counter_re_ent7#425[__this := (counter_re_ent7#425[__this] + 1)];
	$return14:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_33.sol", 118, 5} {:message "Token::transfer"} transfer#463(__this: address_t, __msg_sender: address_t, __msg_value: int, to#456: address_t, value#458: int)
	returns (#461: bool);
	modifies redeemableEther_re_ent4#375, counter_re_ent7#425, lastPlayer_re_ent23#465, jackpot_re_ent23#467;

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_33.sol", 119, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#465: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_33.sol", 120, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#467: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_33.sol", 121, 4} {:message "Token::buyTicket_re_ent23"} buyTicket_re_ent23#497(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 122, 12} {:message ""} true;
	call __send_ret#15 := __send(lastPlayer_re_ent23#465[__this], __this, 0, jackpot_re_ent23#467[__this]);
	if (!(__send_ret#15)) {
	assume false;
	}

	lastPlayer_re_ent23#465 := lastPlayer_re_ent23#465[__this := __msg_sender];
	jackpot_re_ent23#467 := jackpot_re_ent23#467[__this := __balance[__this]];
	$return15:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_33.sol", 99, 1} {:message "Token::[implicit_constructor]"} __constructor#498(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent4#375 := redeemableEther_re_ent4#375[__this := default_address_t_int()];
	counter_re_ent7#425 := counter_re_ent7#425[__this := 0];
	lastPlayer_re_ent23#465 := lastPlayer_re_ent23#465[__this := 0];
	jackpot_re_ent23#467 := jackpot_re_ent23#467[__this := 0];
}

// 
// ------- Contract: Staking -------
// Inherits from: Owned
// 
// Event: stakingstarted
procedure {:inline 1} {:sourceloc "buggy_33.sol", 196, 3} {:message "[event] Staking::stakingstarted"} stakingstarted#790(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#784: address_t, tokens#786: int, time#788: int)
{
	
}

// 
// Event: tokensRedeemed
procedure {:inline 1} {:sourceloc "buggy_33.sol", 206, 3} {:message "[event] Staking::tokensRedeemed"} tokensRedeemed#833(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#827: address_t, stakedTokens#829: int, reward#831: int)
{
	
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_33.sol", 130, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#502: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_33.sol", 131, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#504: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_33.sol", 132, 4} {:message "Staking::buyTicket_re_ent37"} buyTicket_re_ent37#534(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 133, 12} {:message ""} true;
	call __send_ret#16 := __send(lastPlayer_re_ent37#502[__this], __this, 0, jackpot_re_ent37#504[__this]);
	if (!(__send_ret#16)) {
	assume false;
	}

	lastPlayer_re_ent37#502 := lastPlayer_re_ent37#502[__this := __msg_sender];
	jackpot_re_ent37#504 := jackpot_re_ent37#504[__this := __balance[__this]];
	$return16:
	// Function body ends here
}

// 
// State variable: token: contract Token
var {:sourceloc "buggy_33.sol", 138, 3} {:message "token"} token#536: [address_t]address_t;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 139, 3} {:message "balances_re_ent3"} balances_re_ent3#540: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_33.sol", 140, 1} {:message "Staking::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#579(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#542: int)
{
	var {:sourceloc "buggy_33.sol", 143, 3} {:message "success"} success#555: bool;
	var __call_ret#17: bool;
	var __call_ret#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#540[__this][__msg_sender] >= _weiToWithdraw#542);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#542);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#542)];
	assume {:sourceloc "buggy_33.sol", 143, 19} {:message ""} true;
	call __call_ret#17, __call_ret#18 := __call(__msg_sender, __this, _weiToWithdraw#542);
	if (__call_ret#17) {
	havoc lastPlayer_re_ent37#502;
	havoc jackpot_re_ent37#504;
	havoc token#536;
	havoc balances_re_ent3#540;
	havoc lock#581;
	havoc lastPlayer_re_ent9#583;
	havoc jackpot_re_ent9#585;
	havoc minstakeTokens#622;
	havoc redeemableEther_re_ent25#626;
	havoc basePercent#665;
	havoc userBalance_re_ent19#672;
	havoc stakeTime#704;
	havoc userBalance_re_ent26#708;
	havoc stakePercentage#745;
	havoc balances_re_ent31#749;
	havoc not_called_re_ent13#793;
	havoc not_called_re_ent20#843;
	havoc staker#874;
	havoc counter_re_ent14#905;
	havoc lastPlayer_re_ent30#1017;
	havoc jackpot_re_ent30#1019;
	havoc balances_re_ent8#1154;
	havoc redeemableEther_re_ent39#1206;
	havoc balances_re_ent36#1258;
	havoc counter_re_ent35#1296;
	havoc userBalance_re_ent40#1339;
	havoc userBalance_re_ent33#1404;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#17)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#542)];
	}

	success#555 := __call_ret#17;
	assume success#555;
	balances_re_ent3#540 := balances_re_ent3#540[__this := balances_re_ent3#540[__this][__msg_sender := (balances_re_ent3#540[__this][__msg_sender] - _weiToWithdraw#542)]];
	$return17:
	// Function body ends here
}

// 
// State variable: lock: bool
var {:sourceloc "buggy_33.sol", 147, 3} {:message "lock"} lock#581: [address_t]bool;
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_33.sol", 148, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#583: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_33.sol", 149, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#585: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_33.sol", 150, 5} {:message "Staking::buyTicket_re_ent9"} buyTicket_re_ent9#620(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 151, 8} {:message "success"} success#589: bool;
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#585[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#585[__this])];
	assume {:sourceloc "buggy_33.sol", 151, 25} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(lastPlayer_re_ent9#583[__this], __this, jackpot_re_ent9#585[__this]);
	if (__call_ret#19) {
	havoc lastPlayer_re_ent37#502;
	havoc jackpot_re_ent37#504;
	havoc token#536;
	havoc balances_re_ent3#540;
	havoc lock#581;
	havoc lastPlayer_re_ent9#583;
	havoc jackpot_re_ent9#585;
	havoc minstakeTokens#622;
	havoc redeemableEther_re_ent25#626;
	havoc basePercent#665;
	havoc userBalance_re_ent19#672;
	havoc stakeTime#704;
	havoc userBalance_re_ent26#708;
	havoc stakePercentage#745;
	havoc balances_re_ent31#749;
	havoc not_called_re_ent13#793;
	havoc not_called_re_ent20#843;
	havoc staker#874;
	havoc counter_re_ent14#905;
	havoc lastPlayer_re_ent30#1017;
	havoc jackpot_re_ent30#1019;
	havoc balances_re_ent8#1154;
	havoc redeemableEther_re_ent39#1206;
	havoc balances_re_ent36#1258;
	havoc counter_re_ent35#1296;
	havoc userBalance_re_ent40#1339;
	havoc userBalance_re_ent33#1404;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#585[__this])];
	}

	success#589 := __call_ret#19;
	if (!(success#589)) {
	assume false;
	}

	lastPlayer_re_ent9#583 := lastPlayer_re_ent9#583[__this := __msg_sender];
	jackpot_re_ent9#585 := jackpot_re_ent9#585[__this := __balance[__this]];
	$return18:
	// Function body ends here
}

// 
// State variable: minstakeTokens: uint256
var {:sourceloc "buggy_33.sol", 157, 3} {:message "minstakeTokens"} minstakeTokens#622: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 158, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#626: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_33.sol", 159, 1} {:message "Staking::claimReward_re_ent25"} claimReward_re_ent25#662(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 162, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#639: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#626[__this][__msg_sender] > 0);
	transferValue_re_ent25#639 := redeemableEther_re_ent25#626[__this][__msg_sender];
	assume {:sourceloc "buggy_33.sol", 163, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#639);
	redeemableEther_re_ent25#626 := redeemableEther_re_ent25#626[__this := redeemableEther_re_ent25#626[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_33.sol", 166, 3} {:message "basePercent"} basePercent#665: [address_t]int;
// Using library SafeMath for uint256
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 168, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#672: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_33.sol", 169, 1} {:message "Staking::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#701(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 172, 16} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, userBalance_re_ent19#672[__this][__msg_sender]);
	if (!(__send_ret#21)) {
	assume false;
	}

	userBalance_re_ent19#672 := userBalance_re_ent19#672[__this := userBalance_re_ent19#672[__this][__msg_sender := 0]];
	$return20:
	// Function body ends here
}

// 
// State variable: stakeTime: uint256
var {:sourceloc "buggy_33.sol", 177, 3} {:message "stakeTime"} stakeTime#704: [address_t]int;
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 178, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#708: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_33.sol", 179, 1} {:message "Staking::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#742(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 182, 10} {:message "success"} success#712: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#708[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#708[__this][__msg_sender])];
	assume {:sourceloc "buggy_33.sol", 182, 26} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, userBalance_re_ent26#708[__this][__msg_sender]);
	if (__call_ret#22) {
	havoc lastPlayer_re_ent37#502;
	havoc jackpot_re_ent37#504;
	havoc token#536;
	havoc balances_re_ent3#540;
	havoc lock#581;
	havoc lastPlayer_re_ent9#583;
	havoc jackpot_re_ent9#585;
	havoc minstakeTokens#622;
	havoc redeemableEther_re_ent25#626;
	havoc basePercent#665;
	havoc userBalance_re_ent19#672;
	havoc stakeTime#704;
	havoc userBalance_re_ent26#708;
	havoc stakePercentage#745;
	havoc balances_re_ent31#749;
	havoc not_called_re_ent13#793;
	havoc not_called_re_ent20#843;
	havoc staker#874;
	havoc counter_re_ent14#905;
	havoc lastPlayer_re_ent30#1017;
	havoc jackpot_re_ent30#1019;
	havoc balances_re_ent8#1154;
	havoc redeemableEther_re_ent39#1206;
	havoc balances_re_ent36#1258;
	havoc counter_re_ent35#1296;
	havoc userBalance_re_ent40#1339;
	havoc userBalance_re_ent33#1404;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#708[__this][__msg_sender])];
	}

	success#712 := __call_ret#22;
	if (!(success#712)) {
	assume false;
	}

	userBalance_re_ent26#708 := userBalance_re_ent26#708[__this := userBalance_re_ent26#708[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// State variable: stakePercentage: uint256
var {:sourceloc "buggy_33.sol", 188, 3} {:message "stakePercentage"} stakePercentage#745: [address_t]int;
// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 189, 3} {:message "balances_re_ent31"} balances_re_ent31#749: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_33.sol", 190, 1} {:message "Staking::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#782(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#751: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#749[__this][__msg_sender] >= _weiToWithdraw#751);
	assume {:sourceloc "buggy_33.sol", 193, 17} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, _weiToWithdraw#751);
	assume __send_ret#24;
	balances_re_ent31#749 := balances_re_ent31#749[__this := balances_re_ent31#749[__this][__msg_sender := (balances_re_ent31#749[__this][__msg_sender] - _weiToWithdraw#751)]];
	$return22:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_33.sol", 197, 3} {:message "not_called_re_ent13"} not_called_re_ent13#793: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_33.sol", 198, 1} {:message "Staking::bug_re_ent13"} bug_re_ent13#825(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 200, 10} {:message "success"} success#801: bool;
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#793[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_33.sol", 200, 25} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#25) {
	havoc lastPlayer_re_ent37#502;
	havoc jackpot_re_ent37#504;
	havoc token#536;
	havoc balances_re_ent3#540;
	havoc lock#581;
	havoc lastPlayer_re_ent9#583;
	havoc jackpot_re_ent9#585;
	havoc minstakeTokens#622;
	havoc redeemableEther_re_ent25#626;
	havoc basePercent#665;
	havoc userBalance_re_ent19#672;
	havoc stakeTime#704;
	havoc userBalance_re_ent26#708;
	havoc stakePercentage#745;
	havoc balances_re_ent31#749;
	havoc not_called_re_ent13#793;
	havoc not_called_re_ent20#843;
	havoc staker#874;
	havoc counter_re_ent14#905;
	havoc lastPlayer_re_ent30#1017;
	havoc jackpot_re_ent30#1019;
	havoc balances_re_ent8#1154;
	havoc redeemableEther_re_ent39#1206;
	havoc balances_re_ent36#1258;
	havoc counter_re_ent35#1296;
	havoc userBalance_re_ent40#1339;
	havoc userBalance_re_ent33#1404;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#801 := __call_ret#25;
	if (!(success#801)) {
	assume false;
	}

	not_called_re_ent13#793 := not_called_re_ent13#793[__this := false];
	$return23:
	// Function body ends here
}

// 
// ------- Struct stake -------
// Storage
type {:datatype} struct_storage_stake#840;
function {:constructor} stake#840#constr(time#835: int, redeem#837: bool, tokens#839: int) returns (struct_storage_stake#840);
// Memory
type address_struct_memory_stake#840 = int;
// Member time
var {:sourceloc "buggy_33.sol", 209, 9} {:message "time"} time#835: [address_struct_memory_stake#840]int;
// Member redeem
var {:sourceloc "buggy_33.sol", 210, 9} {:message "redeem"} redeem#837: [address_struct_memory_stake#840]bool;
// Member tokens
var {:sourceloc "buggy_33.sol", 211, 9} {:message "tokens"} tokens#839: [address_struct_memory_stake#840]int;
// 
// ------- End of struct stake -------
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_33.sol", 213, 3} {:message "not_called_re_ent20"} not_called_re_ent20#843: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_33.sol", 214, 1} {:message "Staking::bug_re_ent20"} bug_re_ent20#870(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#843[__this];
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_33.sol", 216, 16} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	assume false;
	}

	not_called_re_ent20#843 := not_called_re_ent20#843[__this := false];
	$return24:
	// Function body ends here
}

// 
// State variable: staker: mapping(address => struct Staking.stake storage ref)
var {:sourceloc "buggy_33.sol", 221, 3} {:message "staker"} staker#874: [address_t][address_t]struct_storage_stake#840;
function {:builtin "((as const (Array Int |T@struct_storage_stake#840|)) (|stake#840#constr| 0 false 0))"} default_address_t_struct_storage_stake#840() returns ([address_t]struct_storage_stake#840);
// 
// Function: 
procedure {:sourceloc "buggy_33.sol", 224, 5} {:message "Staking::[constructor]"} __constructor#1439(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenContractAddress#876: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#502 := lastPlayer_re_ent37#502[__this := 0];
	jackpot_re_ent37#504 := jackpot_re_ent37#504[__this := 0];
	token#536 := token#536[__this := 0];
	balances_re_ent3#540 := balances_re_ent3#540[__this := default_address_t_int()];
	lock#581 := lock#581[__this := false];
	lastPlayer_re_ent9#583 := lastPlayer_re_ent9#583[__this := 0];
	jackpot_re_ent9#585 := jackpot_re_ent9#585[__this := 0];
	minstakeTokens#622 := minstakeTokens#622[__this := 0];
	redeemableEther_re_ent25#626 := redeemableEther_re_ent25#626[__this := default_address_t_int()];
	basePercent#665 := basePercent#665[__this := 200];
	userBalance_re_ent19#672 := userBalance_re_ent19#672[__this := default_address_t_int()];
	stakeTime#704 := stakeTime#704[__this := 1814400];
	userBalance_re_ent26#708 := userBalance_re_ent26#708[__this := default_address_t_int()];
	stakePercentage#745 := stakePercentage#745[__this := 30];
	balances_re_ent31#749 := balances_re_ent31#749[__this := default_address_t_int()];
	not_called_re_ent13#793 := not_called_re_ent13#793[__this := true];
	not_called_re_ent20#843 := not_called_re_ent20#843[__this := true];
	staker#874 := staker#874[__this := default_address_t_struct_storage_stake#840()];
	counter_re_ent14#905 := counter_re_ent14#905[__this := 0];
	lastPlayer_re_ent30#1017 := lastPlayer_re_ent30#1017[__this := 0];
	jackpot_re_ent30#1019 := jackpot_re_ent30#1019[__this := 0];
	balances_re_ent8#1154 := balances_re_ent8#1154[__this := default_address_t_int()];
	redeemableEther_re_ent39#1206 := redeemableEther_re_ent39#1206[__this := default_address_t_int()];
	balances_re_ent36#1258 := balances_re_ent36#1258[__this := default_address_t_int()];
	counter_re_ent35#1296 := counter_re_ent35#1296[__this := 0];
	userBalance_re_ent40#1339 := userBalance_re_ent40#1339[__this := default_address_t_int()];
	userBalance_re_ent33#1404 := userBalance_re_ent33#1404[__this := default_address_t_int()];
	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := 0];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := 0];
	owner#37 := owner#37[__this := 0];
	balances_re_ent17#41 := balances_re_ent17#41[__this := default_address_t_int()];
	newOwner#82 := newOwner#82[__this := 0];
	not_called_re_ent27#85 := not_called_re_ent27#85[__this := true];
	redeemableEther_re_ent32#131 := redeemableEther_re_ent32#131[__this := default_address_t_int()];
	balances_re_ent38#202 := balances_re_ent38#202[__this := default_address_t_int()];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#37 := owner#37[__this := __msg_sender];
	$return25:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	token#536 := token#536[__this := tokenContractAddress#876];
	owner#37 := owner#37[__this := __msg_sender];
	minstakeTokens#622 := minstakeTokens#622[__this := (500 * 10000000000)];
	$return26:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_33.sol", 229, 1} {:message "counter_re_ent14"} counter_re_ent14#905: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_33.sol", 230, 3} {:message "Staking::callme_re_ent14"} callme_re_ent14#934(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#905[__this] <= 5);
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_33.sol", 232, 9} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	counter_re_ent14#905 := counter_re_ent14#905[__this := (counter_re_ent14#905[__this] + 1)];
	$return27:
	// Function body ends here
}

// 
// Function: startStaking : function (uint256)
procedure {:sourceloc "buggy_33.sol", 238, 5} {:message "Staking::startStaking"} startStaking#1015(__this: address_t, __msg_sender: address_t, __msg_value: int, stakeTokens#936: int)
{
	var findOnePercent#1400_ret#32: int;
	var call_arg#33: address_t;
	var balanceOf#371_ret#34: int;
	var call_arg#35: address_t;
	var findOnePercent#1400_ret#36: int;
	var transferFrom#422_ret#37: bool;
	var call_arg#38: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (stakeTokens#936 >= minstakeTokens#622[__this]);
	assume {:sourceloc "buggy_33.sol", 240, 62} {:message ""} true;
	call findOnePercent#1400_ret#32 := findOnePercent#1400(__this, __msg_sender, __msg_value, stakeTokens#936);
	call_arg#33 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 240, 17} {:message ""} true;
	call balanceOf#371_ret#34 := balanceOf#371(token#536[__this], __this, 0, call_arg#33);
	assume (balanceOf#371_ret#34 >= (stakeTokens#936 + findOnePercent#1400_ret#32));
	call_arg#35 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 241, 78} {:message ""} true;
	call findOnePercent#1400_ret#36 := findOnePercent#1400(__this, __msg_sender, __msg_value, stakeTokens#936);
	assume {:sourceloc "buggy_33.sol", 241, 17} {:message ""} true;
	call transferFrom#422_ret#37 := transferFrom#422(token#536[__this], __this, 0, call_arg#35, __this, (stakeTokens#936 + findOnePercent#1400_ret#36));
	assume transferFrom#422_ret#37;
	staker#874 := staker#874[__this := staker#874[__this][__msg_sender := stake#840#constr(__block_timestamp, redeem#837#stake#840#constr(staker#874[__this][__msg_sender]), tokens#839#stake#840#constr(staker#874[__this][__msg_sender]))]];
	staker#874 := staker#874[__this := staker#874[__this][__msg_sender := stake#840#constr(time#835#stake#840#constr(staker#874[__this][__msg_sender]), redeem#837#stake#840#constr(staker#874[__this][__msg_sender]), (tokens#839#stake#840#constr(staker#874[__this][__msg_sender]) + stakeTokens#936))]];
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 244, 14} {:message ""} true;
	call stakingstarted#790(__this, __msg_sender, __msg_value, call_arg#38, tokens#839#stake#840#constr(staker#874[__this][__msg_sender]), time#835#stake#840#constr(staker#874[__this][__msg_sender]));
	$return28:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_33.sol", 246, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1017: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_33.sol", 247, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1019: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_33.sol", 248, 4} {:message "Staking::buyTicket_re_ent30"} buyTicket_re_ent30#1049(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 249, 12} {:message ""} true;
	call __send_ret#39 := __send(lastPlayer_re_ent30#1017[__this], __this, 0, jackpot_re_ent30#1019[__this]);
	if (!(__send_ret#39)) {
	assume false;
	}

	lastPlayer_re_ent30#1017 := lastPlayer_re_ent30#1017[__this := __msg_sender];
	jackpot_re_ent30#1019 := jackpot_re_ent30#1019[__this := __balance[__this]];
	$return29:
	// Function body ends here
}

// 
// Function: redeem : function ()
procedure {:sourceloc "buggy_33.sol", 255, 5} {:message "Staking::redeem"} redeem#1150(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: address_t;
	var transfer#463_ret#41: bool;
	var call_arg#42: address_t;
	var transferFrom#422_ret#43: bool;
	var call_arg#44: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(lock#581[__this]);
	assume !(redeem#837#stake#840#constr(staker#874[__this][__msg_sender]));
	assume ((time#835#stake#840#constr(staker#874[__this][__msg_sender]) + stakeTime#704[__this]) <= __block_timestamp);
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 259, 17} {:message ""} true;
	call transfer#463_ret#41 := transfer#463(token#536[__this], __this, 0, call_arg#40, tokens#839#stake#840#constr(staker#874[__this][__msg_sender]));
	assume transfer#463_ret#41;
	call_arg#42 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 260, 17} {:message ""} true;
	call transferFrom#422_ret#43 := transferFrom#422(token#536[__this], __this, 0, owner#37[__this], call_arg#42, (((tokens#839#stake#840#constr(staker#874[__this][__msg_sender]) * stakePercentage#745[__this]) * 100) div 10000));
	assume transferFrom#422_ret#43;
	call_arg#44 := __msg_sender;
	assume {:sourceloc "buggy_33.sol", 261, 14} {:message ""} true;
	call tokensRedeemed#833(__this, __msg_sender, __msg_value, call_arg#44, tokens#839#stake#840#constr(staker#874[__this][__msg_sender]), (((tokens#839#stake#840#constr(staker#874[__this][__msg_sender]) * stakePercentage#745[__this]) * 100) div 10000));
	staker#874 := staker#874[__this := staker#874[__this][__msg_sender := stake#840#constr(time#835#stake#840#constr(staker#874[__this][__msg_sender]), true, tokens#839#stake#840#constr(staker#874[__this][__msg_sender]))]];
	staker#874 := staker#874[__this := staker#874[__this][__msg_sender := stake#840#constr(time#835#stake#840#constr(staker#874[__this][__msg_sender]), redeem#837#stake#840#constr(staker#874[__this][__msg_sender]), 0)]];
	$return30:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 265, 1} {:message "balances_re_ent8"} balances_re_ent8#1154: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_33.sol", 266, 5} {:message "Staking::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1183(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 267, 8} {:message "success"} success#1158: bool;
	var __call_ret#45: bool;
	var __call_ret#46: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1154[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1154[__this][__msg_sender])];
	assume {:sourceloc "buggy_33.sol", 267, 25} {:message ""} true;
	call __call_ret#45, __call_ret#46 := __call(__msg_sender, __this, balances_re_ent8#1154[__this][__msg_sender]);
	if (__call_ret#45) {
	havoc lastPlayer_re_ent37#502;
	havoc jackpot_re_ent37#504;
	havoc token#536;
	havoc balances_re_ent3#540;
	havoc lock#581;
	havoc lastPlayer_re_ent9#583;
	havoc jackpot_re_ent9#585;
	havoc minstakeTokens#622;
	havoc redeemableEther_re_ent25#626;
	havoc basePercent#665;
	havoc userBalance_re_ent19#672;
	havoc stakeTime#704;
	havoc userBalance_re_ent26#708;
	havoc stakePercentage#745;
	havoc balances_re_ent31#749;
	havoc not_called_re_ent13#793;
	havoc not_called_re_ent20#843;
	havoc staker#874;
	havoc counter_re_ent14#905;
	havoc lastPlayer_re_ent30#1017;
	havoc jackpot_re_ent30#1019;
	havoc balances_re_ent8#1154;
	havoc redeemableEther_re_ent39#1206;
	havoc balances_re_ent36#1258;
	havoc counter_re_ent35#1296;
	havoc userBalance_re_ent40#1339;
	havoc userBalance_re_ent33#1404;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#45)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1154[__this][__msg_sender])];
	}

	success#1158 := __call_ret#45;
	if (success#1158) {
	balances_re_ent8#1154 := balances_re_ent8#1154[__this := balances_re_ent8#1154[__this][__msg_sender := 0]];
	}

	$return31:
	// Function body ends here
}

// 
// Function: changeStakeTokens : function (uint256)
procedure {:sourceloc "buggy_33.sol", 272, 5} {:message "Staking::changeStakeTokens"} changeStakeTokens#1202(__this: address_t, __msg_sender: address_t, __msg_value: int, _NewTokensThreshold#1185: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#37[__this]) || (__msg_sender == __this));
	// Function body starts here
	minstakeTokens#622 := minstakeTokens#622[__this := (_NewTokensThreshold#1185 * 10000000000)];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 275, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1206: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_33.sol", 276, 1} {:message "Staking::claimReward_re_ent39"} claimReward_re_ent39#1242(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 279, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1219: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1206[__this][__msg_sender] > 0);
	transferValue_re_ent39#1219 := redeemableEther_re_ent39#1206[__this][__msg_sender];
	assume {:sourceloc "buggy_33.sol", 280, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1219);
	redeemableEther_re_ent39#1206 := redeemableEther_re_ent39#1206[__this := redeemableEther_re_ent39#1206[__this][__msg_sender := 0]];
	$return34:
	// Function body ends here
}

// 
// Function: changeStakeTime : function (uint256)
procedure {:sourceloc "buggy_33.sol", 284, 5} {:message "Staking::changeStakeTime"} changeStakeTime#1254(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakeTime#1244: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#37[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTime#704 := stakeTime#704[__this := _newStakeTime#1244];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 287, 1} {:message "balances_re_ent36"} balances_re_ent36#1258: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_33.sol", 288, 5} {:message "Staking::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1281(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 289, 14} {:message ""} true;
	call __send_ret#51 := __send(__msg_sender, __this, 0, balances_re_ent36#1258[__this][__msg_sender]);
	if (__send_ret#51) {
	balances_re_ent36#1258 := balances_re_ent36#1258[__this := balances_re_ent36#1258[__this][__msg_sender := 0]];
	}

	$return37:
	// Function body ends here
}

// 
// Function: changeStakingPercentage : function (uint256)
procedure {:sourceloc "buggy_33.sol", 293, 5} {:message "Staking::changeStakingPercentage"} changeStakingPercentage#1293(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakePercentage#1283: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#37[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakePercentage#745 := stakePercentage#745[__this := _newStakePercentage#1283];
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_33.sol", 297, 1} {:message "counter_re_ent35"} counter_re_ent35#1296: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_33.sol", 298, 1} {:message "Staking::callme_re_ent35"} callme_re_ent35#1325(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#54: int;
	var __send_ret#55: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1296[__this] <= 5);
	call_arg#54 := 10000000000000000000;
	assume {:sourceloc "buggy_33.sol", 300, 9} {:message ""} true;
	call __send_ret#55 := __send(__msg_sender, __this, 0, call_arg#54);
	if (!(__send_ret#55)) {
	assume false;
	}

	counter_re_ent35#1296 := counter_re_ent35#1296[__this := (counter_re_ent35#1296[__this] + 1)];
	$return40:
	// Function body ends here
}

// 
// Function: lockWithdrawals : function ()
procedure {:sourceloc "buggy_33.sol", 306, 5} {:message "Staking::lockWithdrawals"} lockWithdrawals#1335(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#37[__this]) || (__msg_sender == __this));
	// Function body starts here
	lock#581 := lock#581[__this := true];
	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 309, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1339: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_33.sol", 310, 1} {:message "Staking::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1373(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 313, 10} {:message "success"} success#1343: bool;
	var __call_ret#58: bool;
	var __call_ret#59: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1339[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1339[__this][__msg_sender])];
	assume {:sourceloc "buggy_33.sol", 313, 25} {:message ""} true;
	call __call_ret#58, __call_ret#59 := __call(__msg_sender, __this, userBalance_re_ent40#1339[__this][__msg_sender]);
	if (__call_ret#58) {
	havoc lastPlayer_re_ent37#502;
	havoc jackpot_re_ent37#504;
	havoc token#536;
	havoc balances_re_ent3#540;
	havoc lock#581;
	havoc lastPlayer_re_ent9#583;
	havoc jackpot_re_ent9#585;
	havoc minstakeTokens#622;
	havoc redeemableEther_re_ent25#626;
	havoc basePercent#665;
	havoc userBalance_re_ent19#672;
	havoc stakeTime#704;
	havoc userBalance_re_ent26#708;
	havoc stakePercentage#745;
	havoc balances_re_ent31#749;
	havoc not_called_re_ent13#793;
	havoc not_called_re_ent20#843;
	havoc staker#874;
	havoc counter_re_ent14#905;
	havoc lastPlayer_re_ent30#1017;
	havoc jackpot_re_ent30#1019;
	havoc balances_re_ent8#1154;
	havoc redeemableEther_re_ent39#1206;
	havoc balances_re_ent36#1258;
	havoc counter_re_ent35#1296;
	havoc userBalance_re_ent40#1339;
	havoc userBalance_re_ent33#1404;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#58)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1339[__this][__msg_sender])];
	}

	success#1343 := __call_ret#58;
	if (!(success#1343)) {
	assume false;
	}

	userBalance_re_ent40#1339 := userBalance_re_ent40#1339[__this := userBalance_re_ent40#1339[__this][__msg_sender := 0]];
	$return43:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_33.sol", 320, 5} {:message "Staking::findOnePercent"} findOnePercent#1400(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1375: int)
	returns (#1378: int)
{
	var {:sourceloc "buggy_33.sol", 321, 9} {:message "roundValue"} roundValue#1381: int;
	var ceil#363_ret#60: int;
	var {:sourceloc "buggy_33.sol", 322, 9} {:message "onePercent"} onePercent#1388: int;
	var mul#269_ret#61: int;
	var call_arg#62: int;
	var div#287_ret#63: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_33.sol", 321, 30} {:message ""} true;
	call ceil#363_ret#60 := ceil#363(__this, __msg_sender, __msg_value, value#1375, basePercent#665[__this]);
	roundValue#1381 := ceil#363_ret#60;
	assume {:sourceloc "buggy_33.sol", 322, 30} {:message ""} true;
	call mul#269_ret#61 := mul#269(__this, __msg_sender, __msg_value, roundValue#1381, basePercent#665[__this]);
	call_arg#62 := 10000;
	assume {:sourceloc "buggy_33.sol", 322, 30} {:message ""} true;
	call div#287_ret#63 := div#287(__this, __msg_sender, __msg_value, mul#269_ret#61, call_arg#62);
	onePercent#1388 := div#287_ret#63;
	#1378 := onePercent#1388;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_33.sol", 325, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1404: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_33.sol", 326, 1} {:message "Staking::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1438(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_33.sol", 329, 10} {:message "success"} success#1408: bool;
	var __call_ret#64: bool;
	var __call_ret#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1404[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1404[__this][__msg_sender])];
	assume {:sourceloc "buggy_33.sol", 329, 26} {:message ""} true;
	call __call_ret#64, __call_ret#65 := __call(__msg_sender, __this, userBalance_re_ent33#1404[__this][__msg_sender]);
	if (__call_ret#64) {
	havoc lastPlayer_re_ent37#502;
	havoc jackpot_re_ent37#504;
	havoc token#536;
	havoc balances_re_ent3#540;
	havoc lock#581;
	havoc lastPlayer_re_ent9#583;
	havoc jackpot_re_ent9#585;
	havoc minstakeTokens#622;
	havoc redeemableEther_re_ent25#626;
	havoc basePercent#665;
	havoc userBalance_re_ent19#672;
	havoc stakeTime#704;
	havoc userBalance_re_ent26#708;
	havoc stakePercentage#745;
	havoc balances_re_ent31#749;
	havoc not_called_re_ent13#793;
	havoc not_called_re_ent20#843;
	havoc staker#874;
	havoc counter_re_ent14#905;
	havoc lastPlayer_re_ent30#1017;
	havoc jackpot_re_ent30#1019;
	havoc balances_re_ent8#1154;
	havoc redeemableEther_re_ent39#1206;
	havoc balances_re_ent36#1258;
	havoc counter_re_ent35#1296;
	havoc userBalance_re_ent40#1339;
	havoc userBalance_re_ent33#1404;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#37;
	havoc balances_re_ent17#41;
	havoc newOwner#82;
	havoc not_called_re_ent27#85;
	havoc redeemableEther_re_ent32#131;
	havoc balances_re_ent38#202;
	havoc __balance;
	}

	if (!(__call_ret#64)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1404[__this][__msg_sender])];
	}

	success#1408 := __call_ret#64;
	if (!(success#1408)) {
	assume false;
	}

	userBalance_re_ent33#1404 := userBalance_re_ent33#1404[__this := userBalance_re_ent33#1404[__this][__msg_sender := 0]];
	$return45:
	// Function body ends here
}

