// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_42.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_42.sol", 37, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#128(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#124: address_t, _to#126: address_t)
{
	
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_42.sol", 8, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#3: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_42.sol", 9, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#5: [address_t]int;
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
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_42.sol", 10, 4} {:message "Owned::buyTicket_re_ent2"} buyTicket_re_ent2#40(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 11, 7} {:message "sent"} sent#9: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent2#5[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent2#5[__this])];
	assume {:sourceloc "buggy_42.sol", 11, 21} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(lastPlayer_re_ent2#3[__this], __this, jackpot_re_ent2#5[__this]);
	if (__call_ret#0) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent2#5[__this])];
	}

	sent#9 := __call_ret#0;
	if (!(sent#9)) {
	assume false;
	}

	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := __msg_sender];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := __balance[__this]];
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_42.sol", 17, 3} {:message "owner"} owner#42: [address_t]address_t;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 18, 3} {:message "balances_re_ent17"} balances_re_ent17#46: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 19, 1} {:message "Owned::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#85(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#48: int)
{
	var {:sourceloc "buggy_42.sol", 22, 6} {:message "success"} success#61: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#46[__this][__msg_sender] >= _weiToWithdraw#48);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#48);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#48)];
	assume {:sourceloc "buggy_42.sol", 22, 23} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(__msg_sender, __this, _weiToWithdraw#48);
	if (__call_ret#2) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#48)];
	}

	success#61 := __call_ret#2;
	assume success#61;
	balances_re_ent17#46 := balances_re_ent17#46[__this := balances_re_ent17#46[__this][__msg_sender := (balances_re_ent17#46[__this][__msg_sender] - _weiToWithdraw#48)]];
	$return1:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_42.sol", 26, 3} {:message "newOwner"} newOwner#87: [address_t]address_t;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_42.sol", 28, 3} {:message "not_called_re_ent27"} not_called_re_ent27#90: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_42.sol", 29, 1} {:message "Owned::bug_re_ent27"} bug_re_ent27#122(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 31, 6} {:message "success"} success#98: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#90[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 31, 23} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#4) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#98 := __call_ret#4;
	if (!(success#98)) {
	assume false;
	}

	not_called_re_ent27#90 := not_called_re_ent27#90[__this := false];
	$return2:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_42.sol", 39, 5} {:message "Owned::[constructor]"} __constructor#253(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := 0];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := 0];
	owner#42 := owner#42[__this := 0];
	balances_re_ent17#46 := balances_re_ent17#46[__this := default_address_t_int()];
	newOwner#87 := newOwner#87[__this := 0];
	not_called_re_ent27#90 := not_called_re_ent27#90[__this := true];
	redeemableEther_re_ent32#141 := redeemableEther_re_ent32#141[__this := default_address_t_int()];
	balances_re_ent38#212 := balances_re_ent38#212[__this := default_address_t_int()];
	// Function body starts here
	owner#42 := owner#42[__this := __msg_sender];
	$return3:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 42, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#141: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_42.sol", 43, 1} {:message "Owned::claimReward_re_ent32"} claimReward_re_ent32#177(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 46, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#154: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#141[__this][__msg_sender] > 0);
	transferValue_re_ent32#154 := redeemableEther_re_ent32#141[__this][__msg_sender];
	assume {:sourceloc "buggy_42.sol", 47, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#154);
	redeemableEther_re_ent32#141 := redeemableEther_re_ent32#141[__this := redeemableEther_re_ent32#141[__this][__msg_sender := 0]];
	$return4:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_42.sol", 56, 5} {:message "Owned::transferOwnership"} transferOwnership#208(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#198: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#42[__this]) || (__msg_sender == __this));
	// Function body starts here
	newOwner#87 := newOwner#87[__this := _newOwner#198];
	$return6:
	// Function body ends here
	$return5:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 59, 1} {:message "balances_re_ent38"} balances_re_ent38#212: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 60, 1} {:message "Owned::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#252(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#214: int)
{
	var {:sourceloc "buggy_42.sol", 63, 4} {:message "sent"} sent#227: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	var call_arg#10: int_arr_ptr;
	var new_array#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#212[__this][__msg_sender] >= _weiToWithdraw#214);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#214);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#214)];
	assume {:sourceloc "buggy_42.sol", 63, 18} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, _weiToWithdraw#214);
	if (__call_ret#8) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#214)];
	}

	sent#227 := __call_ret#8;
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#10 := new_array#11;
	mem_arr_int := mem_arr_int[call_arg#10 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#227;
	balances_re_ent38#212 := balances_re_ent38#212[__this := balances_re_ent38#212[__this][__msg_sender := (balances_re_ent38#212[__this][__msg_sender] - _weiToWithdraw#214)]];
	$return7:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 70, 3} {:message "SafeMath::mul"} mul#286(__this: address_t, __msg_sender: address_t, __msg_value: int, a#255: int, b#257: int)
	returns (#260: int)
{
	var {:sourceloc "buggy_42.sol", 74, 5} {:message "c"} c#270: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#255 == 0)) {
	#260 := 0;
	goto $return8;
	}

	c#270 := (a#255 * b#257);
	assert {:sourceloc "buggy_42.sol", 75, 5} {:message "Assertion might not hold."} ((c#270 div a#255) == b#257);
	#260 := c#270;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 79, 3} {:message "SafeMath::div"} div#304(__this: address_t, __msg_sender: address_t, __msg_value: int, a#288: int, b#290: int)
	returns (#293: int)
{
	var {:sourceloc "buggy_42.sol", 80, 5} {:message "c"} c#296: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#296 := (a#288 div b#290);
	#293 := c#296;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 84, 3} {:message "SafeMath::sub"} sub#324(__this: address_t, __msg_sender: address_t, __msg_value: int, a#306: int, b#308: int)
	returns (#311: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_42.sol", 85, 5} {:message "Assertion might not hold."} (b#308 <= a#306);
	#311 := (a#306 - b#308);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 89, 3} {:message "SafeMath::add"} add#348(__this: address_t, __msg_sender: address_t, __msg_value: int, a#326: int, b#328: int)
	returns (#331: int)
{
	var {:sourceloc "buggy_42.sol", 90, 5} {:message "c"} c#334: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#334 := (a#326 + b#328);
	assert {:sourceloc "buggy_42.sol", 91, 5} {:message "Assertion might not hold."} (c#334 >= a#326);
	#331 := c#334;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: ceil : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 95, 3} {:message "SafeMath::ceil"} ceil#380(__this: address_t, __msg_sender: address_t, __msg_value: int, a#350: int, m#352: int)
	returns (#355: int)
{
	var {:sourceloc "buggy_42.sol", 96, 5} {:message "c"} c#358: int;
	var add#348_ret#12: int;
	var {:sourceloc "buggy_42.sol", 97, 5} {:message "d"} d#365: int;
	var call_arg#13: int;
	var sub#324_ret#14: int;
	var div#304_ret#15: int;
	var mul#286_ret#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 96, 17} {:message ""} true;
	call add#348_ret#12 := add#348(__this, __msg_sender, __msg_value, a#350, m#352);
	c#358 := add#348_ret#12;
	call_arg#13 := 1;
	assume {:sourceloc "buggy_42.sol", 97, 17} {:message ""} true;
	call sub#324_ret#14 := sub#324(__this, __msg_sender, __msg_value, c#358, call_arg#13);
	d#365 := sub#324_ret#14;
	assume {:sourceloc "buggy_42.sol", 98, 16} {:message ""} true;
	call div#304_ret#15 := div#304(__this, __msg_sender, __msg_value, d#365, m#352);
	assume {:sourceloc "buggy_42.sol", 98, 12} {:message ""} true;
	call mul#286_ret#16 := mul#286(__this, __msg_sender, __msg_value, div#304_ret#15, m#352);
	#355 := mul#286_ret#16;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_42.sol", 69, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#381(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Token -------
// 
// Function: balanceOf
procedure {:sourceloc "buggy_42.sol", 103, 3} {:message "Token::balanceOf"} balanceOf#388(__this: address_t, __msg_sender: address_t, __msg_value: int, who#383: address_t)
	returns (#386: int);
	modifies redeemableEther_re_ent4#392, counter_re_ent7#442, lastPlayer_re_ent23#487, jackpot_re_ent23#489;

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 104, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#392: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_42.sol", 105, 1} {:message "Token::claimReward_re_ent4"} claimReward_re_ent4#428(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 108, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#405: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#392[__this][__msg_sender] > 0);
	transferValue_re_ent4#405 := redeemableEther_re_ent4#392[__this][__msg_sender];
	assume {:sourceloc "buggy_42.sol", 109, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#405);
	redeemableEther_re_ent4#392 := redeemableEther_re_ent4#392[__this := redeemableEther_re_ent4#392[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_42.sol", 112, 5} {:message "Token::transferFrom"} transferFrom#439(__this: address_t, __msg_sender: address_t, __msg_value: int, from#430: address_t, to#432: address_t, value#434: int)
	returns (#437: bool);
	modifies redeemableEther_re_ent4#392, counter_re_ent7#442, lastPlayer_re_ent23#487, jackpot_re_ent23#489;

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_42.sol", 113, 1} {:message "counter_re_ent7"} counter_re_ent7#442: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_42.sol", 114, 1} {:message "Token::callme_re_ent7"} callme_re_ent7#476(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 116, 3} {:message "success"} success#452: bool;
	var __call_ret#17: bool;
	var __call_ret#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#442[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 116, 20} {:message ""} true;
	call __call_ret#17, __call_ret#18 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#17) {
	havoc redeemableEther_re_ent4#392;
	havoc counter_re_ent7#442;
	havoc lastPlayer_re_ent23#487;
	havoc jackpot_re_ent23#489;
	havoc __balance;
	}

	if (!(__call_ret#17)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#452 := __call_ret#17;
	if (!(success#452)) {
	assume false;
	}

	counter_re_ent7#442 := counter_re_ent7#442[__this := (counter_re_ent7#442[__this] + 1)];
	$return14:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_42.sol", 122, 5} {:message "Token::transfer"} transfer#485(__this: address_t, __msg_sender: address_t, __msg_value: int, to#478: address_t, value#480: int)
	returns (#483: bool);
	modifies redeemableEther_re_ent4#392, counter_re_ent7#442, lastPlayer_re_ent23#487, jackpot_re_ent23#489;

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_42.sol", 123, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#487: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_42.sol", 124, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#489: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_42.sol", 125, 4} {:message "Token::buyTicket_re_ent23"} buyTicket_re_ent23#524(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 126, 7} {:message "sent"} sent#493: bool;
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent23#489[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent23#489[__this])];
	assume {:sourceloc "buggy_42.sol", 126, 21} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(lastPlayer_re_ent23#487[__this], __this, jackpot_re_ent23#489[__this]);
	if (__call_ret#19) {
	havoc redeemableEther_re_ent4#392;
	havoc counter_re_ent7#442;
	havoc lastPlayer_re_ent23#487;
	havoc jackpot_re_ent23#489;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent23#489[__this])];
	}

	sent#493 := __call_ret#19;
	if (!(sent#493)) {
	assume false;
	}

	lastPlayer_re_ent23#487 := lastPlayer_re_ent23#487[__this := __msg_sender];
	jackpot_re_ent23#489 := jackpot_re_ent23#489[__this := __balance[__this]];
	$return15:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_42.sol", 102, 1} {:message "Token::[implicit_constructor]"} __constructor#525(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent4#392 := redeemableEther_re_ent4#392[__this := default_address_t_int()];
	counter_re_ent7#442 := counter_re_ent7#442[__this := 0];
	lastPlayer_re_ent23#487 := lastPlayer_re_ent23#487[__this := 0];
	jackpot_re_ent23#489 := jackpot_re_ent23#489[__this := 0];
}

// 
// ------- Contract: Staking -------
// Inherits from: Owned
// 
// Event: stakingstarted
procedure {:inline 1} {:sourceloc "buggy_42.sol", 204, 3} {:message "[event] Staking::stakingstarted"} stakingstarted#834(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#828: address_t, tokens#830: int, time#832: int)
{
	
}

// 
// Event: tokensRedeemed
procedure {:inline 1} {:sourceloc "buggy_42.sol", 214, 3} {:message "[event] Staking::tokensRedeemed"} tokensRedeemed#877(__this: address_t, __msg_sender: address_t, __msg_value: int, staker#871: address_t, stakedTokens#873: int, reward#875: int)
{
	
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_42.sol", 135, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#529: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_42.sol", 136, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#531: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_42.sol", 137, 4} {:message "Staking::buyTicket_re_ent37"} buyTicket_re_ent37#566(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 138, 7} {:message "sent"} sent#535: bool;
	var __call_ret#21: bool;
	var __call_ret#22: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent37#531[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent37#531[__this])];
	assume {:sourceloc "buggy_42.sol", 138, 21} {:message ""} true;
	call __call_ret#21, __call_ret#22 := __call(lastPlayer_re_ent37#529[__this], __this, jackpot_re_ent37#531[__this]);
	if (__call_ret#21) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#21)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent37#531[__this])];
	}

	sent#535 := __call_ret#21;
	if (!(sent#535)) {
	assume false;
	}

	lastPlayer_re_ent37#529 := lastPlayer_re_ent37#529[__this := __msg_sender];
	jackpot_re_ent37#531 := jackpot_re_ent37#531[__this := __balance[__this]];
	$return16:
	// Function body ends here
}

// 
// State variable: token: contract Token
var {:sourceloc "buggy_42.sol", 144, 3} {:message "token"} token#568: [address_t]address_t;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 145, 3} {:message "balances_re_ent3"} balances_re_ent3#572: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 146, 1} {:message "Staking::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#611(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#574: int)
{
	var {:sourceloc "buggy_42.sol", 149, 3} {:message "success"} success#587: bool;
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#572[__this][__msg_sender] >= _weiToWithdraw#574);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#574);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#574)];
	assume {:sourceloc "buggy_42.sol", 149, 20} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(__msg_sender, __this, _weiToWithdraw#574);
	if (__call_ret#23) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#23)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#574)];
	}

	success#587 := __call_ret#23;
	assume success#587;
	balances_re_ent3#572 := balances_re_ent3#572[__this := balances_re_ent3#572[__this][__msg_sender := (balances_re_ent3#572[__this][__msg_sender] - _weiToWithdraw#574)]];
	$return17:
	// Function body ends here
}

// 
// State variable: lock: bool
var {:sourceloc "buggy_42.sol", 153, 3} {:message "lock"} lock#613: [address_t]bool;
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_42.sol", 154, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#615: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_42.sol", 155, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#617: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_42.sol", 156, 4} {:message "Staking::buyTicket_re_ent9"} buyTicket_re_ent9#652(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 157, 7} {:message "success"} success#621: bool;
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#617[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#617[__this])];
	assume {:sourceloc "buggy_42.sol", 157, 24} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(lastPlayer_re_ent9#615[__this], __this, jackpot_re_ent9#617[__this]);
	if (__call_ret#25) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#617[__this])];
	}

	success#621 := __call_ret#25;
	if (!(success#621)) {
	assume false;
	}

	lastPlayer_re_ent9#615 := lastPlayer_re_ent9#615[__this := __msg_sender];
	jackpot_re_ent9#617 := jackpot_re_ent9#617[__this := __balance[__this]];
	$return18:
	// Function body ends here
}

// 
// State variable: stakeTokens: uint256
var {:sourceloc "buggy_42.sol", 163, 3} {:message "stakeTokens"} stakeTokens#654: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 164, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#658: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_42.sol", 165, 1} {:message "Staking::claimReward_re_ent25"} claimReward_re_ent25#694(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 168, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#671: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#658[__this][__msg_sender] > 0);
	transferValue_re_ent25#671 := redeemableEther_re_ent25#658[__this][__msg_sender];
	assume {:sourceloc "buggy_42.sol", 169, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#671);
	redeemableEther_re_ent25#658 := redeemableEther_re_ent25#658[__this := redeemableEther_re_ent25#658[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// State variable: basePercent: uint256
var {:sourceloc "buggy_42.sol", 172, 3} {:message "basePercent"} basePercent#697: [address_t]int;
// Using library SafeMath for uint256
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 174, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#704: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_42.sol", 175, 1} {:message "Staking::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#738(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 178, 8} {:message "success"} success#708: bool;
	var __call_ret#27: bool;
	var __call_ret#28: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent19#704[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent19#704[__this][__msg_sender])];
	assume {:sourceloc "buggy_42.sol", 178, 25} {:message ""} true;
	call __call_ret#27, __call_ret#28 := __call(__msg_sender, __this, userBalance_re_ent19#704[__this][__msg_sender]);
	if (__call_ret#27) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#27)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent19#704[__this][__msg_sender])];
	}

	success#708 := __call_ret#27;
	if (!(success#708)) {
	assume false;
	}

	userBalance_re_ent19#704 := userBalance_re_ent19#704[__this := userBalance_re_ent19#704[__this][__msg_sender := 0]];
	$return20:
	// Function body ends here
}

// 
// State variable: stakeTime: uint256
var {:sourceloc "buggy_42.sol", 184, 3} {:message "stakeTime"} stakeTime#741: [address_t]int;
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 185, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#745: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_42.sol", 186, 1} {:message "Staking::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#779(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 189, 8} {:message "success"} success#749: bool;
	var __call_ret#29: bool;
	var __call_ret#30: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#745[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#745[__this][__msg_sender])];
	assume {:sourceloc "buggy_42.sol", 189, 25} {:message ""} true;
	call __call_ret#29, __call_ret#30 := __call(__msg_sender, __this, userBalance_re_ent26#745[__this][__msg_sender]);
	if (__call_ret#29) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#29)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#745[__this][__msg_sender])];
	}

	success#749 := __call_ret#29;
	if (!(success#749)) {
	assume false;
	}

	userBalance_re_ent26#745 := userBalance_re_ent26#745[__this := userBalance_re_ent26#745[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// State variable: stakePercentage: uint256
var {:sourceloc "buggy_42.sol", 195, 3} {:message "stakePercentage"} stakePercentage#782: [address_t]int;
// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 196, 3} {:message "balances_re_ent31"} balances_re_ent31#786: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_42.sol", 197, 1} {:message "Staking::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#826(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#788: int)
{
	var {:sourceloc "buggy_42.sol", 200, 10} {:message "sent"} sent#801: bool;
	var __call_ret#31: bool;
	var __call_ret#32: int_arr_ptr;
	var call_arg#33: int_arr_ptr;
	var new_array#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#786[__this][__msg_sender] >= _weiToWithdraw#788);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#788);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#788)];
	assume {:sourceloc "buggy_42.sol", 200, 24} {:message ""} true;
	call __call_ret#31, __call_ret#32 := __call(__msg_sender, __this, _weiToWithdraw#788);
	if (__call_ret#31) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#31)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#788)];
	}

	sent#801 := __call_ret#31;
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#33 := new_array#34;
	mem_arr_int := mem_arr_int[call_arg#33 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#801;
	balances_re_ent31#786 := balances_re_ent31#786[__this := balances_re_ent31#786[__this][__msg_sender := (balances_re_ent31#786[__this][__msg_sender] - _weiToWithdraw#788)]];
	$return22:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_42.sol", 205, 3} {:message "not_called_re_ent13"} not_called_re_ent13#837: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_42.sol", 206, 1} {:message "Staking::bug_re_ent13"} bug_re_ent13#869(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 208, 10} {:message "success"} success#845: bool;
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#837[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 208, 27} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#35) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#845 := __call_ret#35;
	if (!(success#845)) {
	assume false;
	}

	not_called_re_ent13#837 := not_called_re_ent13#837[__this := false];
	$return23:
	// Function body ends here
}

// 
// ------- Struct stake -------
// Storage
type {:datatype} struct_storage_stake#884;
function {:constructor} stake#884#constr(time#879: int, redeem#881: bool, tokens#883: int) returns (struct_storage_stake#884);
// Memory
type address_struct_memory_stake#884 = int;
// Member time
var {:sourceloc "buggy_42.sol", 217, 9} {:message "time"} time#879: [address_struct_memory_stake#884]int;
// Member redeem
var {:sourceloc "buggy_42.sol", 218, 9} {:message "redeem"} redeem#881: [address_struct_memory_stake#884]bool;
// Member tokens
var {:sourceloc "buggy_42.sol", 219, 9} {:message "tokens"} tokens#883: [address_struct_memory_stake#884]int;
// 
// ------- End of struct stake -------
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_42.sol", 221, 3} {:message "not_called_re_ent20"} not_called_re_ent20#887: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_42.sol", 222, 1} {:message "Staking::bug_re_ent20"} bug_re_ent20#919(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 224, 8} {:message "success"} success#895: bool;
	var __call_ret#37: bool;
	var __call_ret#38: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#887[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 224, 25} {:message ""} true;
	call __call_ret#37, __call_ret#38 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#37) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#37)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#895 := __call_ret#37;
	if (!(success#895)) {
	assume false;
	}

	not_called_re_ent20#887 := not_called_re_ent20#887[__this := false];
	$return24:
	// Function body ends here
}

// 
// State variable: staker: mapping(address => struct Staking.stake storage ref)
var {:sourceloc "buggy_42.sol", 230, 3} {:message "staker"} staker#923: [address_t][address_t]struct_storage_stake#884;
function {:builtin "((as const (Array Int |T@struct_storage_stake#884|)) (|stake#884#constr| 0 false 0))"} default_address_t_struct_storage_stake#884() returns ([address_t]struct_storage_stake#884);
// 
// Function: 
procedure {:sourceloc "buggy_42.sol", 233, 5} {:message "Staking::[constructor]"} __constructor#1501(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenContractAddress#925: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#529 := lastPlayer_re_ent37#529[__this := 0];
	jackpot_re_ent37#531 := jackpot_re_ent37#531[__this := 0];
	token#568 := token#568[__this := 0];
	balances_re_ent3#572 := balances_re_ent3#572[__this := default_address_t_int()];
	lock#613 := lock#613[__this := false];
	lastPlayer_re_ent9#615 := lastPlayer_re_ent9#615[__this := 0];
	jackpot_re_ent9#617 := jackpot_re_ent9#617[__this := 0];
	stakeTokens#654 := stakeTokens#654[__this := 0];
	redeemableEther_re_ent25#658 := redeemableEther_re_ent25#658[__this := default_address_t_int()];
	basePercent#697 := basePercent#697[__this := 200];
	userBalance_re_ent19#704 := userBalance_re_ent19#704[__this := default_address_t_int()];
	stakeTime#741 := stakeTime#741[__this := 1814400];
	userBalance_re_ent26#745 := userBalance_re_ent26#745[__this := default_address_t_int()];
	stakePercentage#782 := stakePercentage#782[__this := 30];
	balances_re_ent31#786 := balances_re_ent31#786[__this := default_address_t_int()];
	not_called_re_ent13#837 := not_called_re_ent13#837[__this := true];
	not_called_re_ent20#887 := not_called_re_ent20#887[__this := true];
	staker#923 := staker#923[__this := default_address_t_struct_storage_stake#884()];
	counter_re_ent14#954 := counter_re_ent14#954[__this := 0];
	lastPlayer_re_ent30#1063 := lastPlayer_re_ent30#1063[__this := 0];
	jackpot_re_ent30#1065 := jackpot_re_ent30#1065[__this := 0];
	balances_re_ent8#1205 := balances_re_ent8#1205[__this := default_address_t_int()];
	redeemableEther_re_ent39#1257 := redeemableEther_re_ent39#1257[__this := default_address_t_int()];
	balances_re_ent36#1309 := balances_re_ent36#1309[__this := default_address_t_int()];
	counter_re_ent35#1353 := counter_re_ent35#1353[__this := 0];
	userBalance_re_ent40#1401 := userBalance_re_ent40#1401[__this := default_address_t_int()];
	userBalance_re_ent33#1466 := userBalance_re_ent33#1466[__this := default_address_t_int()];
	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := 0];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := 0];
	owner#42 := owner#42[__this := 0];
	balances_re_ent17#46 := balances_re_ent17#46[__this := default_address_t_int()];
	newOwner#87 := newOwner#87[__this := 0];
	not_called_re_ent27#90 := not_called_re_ent27#90[__this := true];
	redeemableEther_re_ent32#141 := redeemableEther_re_ent32#141[__this := default_address_t_int()];
	balances_re_ent38#212 := balances_re_ent38#212[__this := default_address_t_int()];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#42 := owner#42[__this := __msg_sender];
	$return25:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	token#568 := token#568[__this := tokenContractAddress#925];
	owner#42 := owner#42[__this := __msg_sender];
	stakeTokens#654 := stakeTokens#654[__this := (500 * 10000000000)];
	$return26:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_42.sol", 238, 1} {:message "counter_re_ent14"} counter_re_ent14#954: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_42.sol", 239, 1} {:message "Staking::callme_re_ent14"} callme_re_ent14#988(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 241, 5} {:message "success"} success#964: bool;
	var __call_ret#40: bool;
	var __call_ret#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#954[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 241, 22} {:message ""} true;
	call __call_ret#40, __call_ret#41 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#40) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#40)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#964 := __call_ret#40;
	if (!(success#964)) {
	assume false;
	}

	counter_re_ent14#954 := counter_re_ent14#954[__this := (counter_re_ent14#954[__this] + 1)];
	$return27:
	// Function body ends here
}

// 
// Function: startStaking : function ()
procedure {:sourceloc "buggy_42.sol", 248, 5} {:message "Staking::startStaking"} startStaking#1061(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var findOnePercent#1462_ret#42: int;
	var call_arg#43: address_t;
	var balanceOf#388_ret#44: int;
	var call_arg#45: address_t;
	var findOnePercent#1462_ret#46: int;
	var transferFrom#439_ret#47: bool;
	var call_arg#48: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 249, 62} {:message ""} true;
	call findOnePercent#1462_ret#42 := findOnePercent#1462(__this, __msg_sender, __msg_value, stakeTokens#654[__this]);
	call_arg#43 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 249, 17} {:message ""} true;
	call balanceOf#388_ret#44 := balanceOf#388(token#568[__this], __this, 0, call_arg#43);
	assume (balanceOf#388_ret#44 >= (stakeTokens#654[__this] + findOnePercent#1462_ret#42));
	call_arg#45 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 250, 78} {:message ""} true;
	call findOnePercent#1462_ret#46 := findOnePercent#1462(__this, __msg_sender, __msg_value, stakeTokens#654[__this]);
	assume {:sourceloc "buggy_42.sol", 250, 17} {:message ""} true;
	call transferFrom#439_ret#47 := transferFrom#439(token#568[__this], __this, 0, call_arg#45, __this, (stakeTokens#654[__this] + findOnePercent#1462_ret#46));
	assume transferFrom#439_ret#47;
	staker#923 := staker#923[__this := staker#923[__this][__msg_sender := stake#884#constr(__block_timestamp, redeem#881#stake#884#constr(staker#923[__this][__msg_sender]), tokens#883#stake#884#constr(staker#923[__this][__msg_sender]))]];
	staker#923 := staker#923[__this := staker#923[__this][__msg_sender := stake#884#constr(time#879#stake#884#constr(staker#923[__this][__msg_sender]), redeem#881#stake#884#constr(staker#923[__this][__msg_sender]), (tokens#883#stake#884#constr(staker#923[__this][__msg_sender]) + stakeTokens#654[__this]))]];
	call_arg#48 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 253, 14} {:message ""} true;
	call stakingstarted#834(__this, __msg_sender, __msg_value, call_arg#48, tokens#883#stake#884#constr(staker#923[__this][__msg_sender]), time#879#stake#884#constr(staker#923[__this][__msg_sender]));
	$return28:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_42.sol", 255, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1063: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_42.sol", 256, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1065: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_42.sol", 257, 4} {:message "Staking::buyTicket_re_ent30"} buyTicket_re_ent30#1100(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 258, 7} {:message "sent"} sent#1069: bool;
	var __call_ret#49: bool;
	var __call_ret#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent30#1065[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent30#1065[__this])];
	assume {:sourceloc "buggy_42.sol", 258, 21} {:message ""} true;
	call __call_ret#49, __call_ret#50 := __call(lastPlayer_re_ent30#1063[__this], __this, jackpot_re_ent30#1065[__this]);
	if (__call_ret#49) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#49)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent30#1065[__this])];
	}

	sent#1069 := __call_ret#49;
	if (!(sent#1069)) {
	assume false;
	}

	lastPlayer_re_ent30#1063 := lastPlayer_re_ent30#1063[__this := __msg_sender];
	jackpot_re_ent30#1065 := jackpot_re_ent30#1065[__this := __balance[__this]];
	$return29:
	// Function body ends here
}

// 
// Function: redeem : function ()
procedure {:sourceloc "buggy_42.sol", 265, 5} {:message "Staking::redeem"} redeem#1201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: address_t;
	var transfer#485_ret#52: bool;
	var call_arg#53: address_t;
	var transferFrom#439_ret#54: bool;
	var call_arg#55: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(lock#613[__this]);
	assume !(redeem#881#stake#884#constr(staker#923[__this][__msg_sender]));
	assume ((time#879#stake#884#constr(staker#923[__this][__msg_sender]) + stakeTime#741[__this]) <= __block_timestamp);
	call_arg#51 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 269, 17} {:message ""} true;
	call transfer#485_ret#52 := transfer#485(token#568[__this], __this, 0, call_arg#51, tokens#883#stake#884#constr(staker#923[__this][__msg_sender]));
	assume transfer#485_ret#52;
	call_arg#53 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 270, 17} {:message ""} true;
	call transferFrom#439_ret#54 := transferFrom#439(token#568[__this], __this, 0, owner#42[__this], call_arg#53, (((tokens#883#stake#884#constr(staker#923[__this][__msg_sender]) * stakePercentage#782[__this]) * 100) div 10000));
	assume transferFrom#439_ret#54;
	call_arg#55 := __msg_sender;
	assume {:sourceloc "buggy_42.sol", 271, 14} {:message ""} true;
	call tokensRedeemed#877(__this, __msg_sender, __msg_value, call_arg#55, tokens#883#stake#884#constr(staker#923[__this][__msg_sender]), (((tokens#883#stake#884#constr(staker#923[__this][__msg_sender]) * stakePercentage#782[__this]) * 100) div 10000));
	staker#923 := staker#923[__this := staker#923[__this][__msg_sender := stake#884#constr(time#879#stake#884#constr(staker#923[__this][__msg_sender]), true, tokens#883#stake#884#constr(staker#923[__this][__msg_sender]))]];
	staker#923 := staker#923[__this := staker#923[__this][__msg_sender := stake#884#constr(time#879#stake#884#constr(staker#923[__this][__msg_sender]), redeem#881#stake#884#constr(staker#923[__this][__msg_sender]), 0)]];
	$return30:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 275, 1} {:message "balances_re_ent8"} balances_re_ent8#1205: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_42.sol", 276, 5} {:message "Staking::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1234(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 277, 7} {:message "success"} success#1209: bool;
	var __call_ret#56: bool;
	var __call_ret#57: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1205[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1205[__this][__msg_sender])];
	assume {:sourceloc "buggy_42.sol", 277, 24} {:message ""} true;
	call __call_ret#56, __call_ret#57 := __call(__msg_sender, __this, balances_re_ent8#1205[__this][__msg_sender]);
	if (__call_ret#56) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#56)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1205[__this][__msg_sender])];
	}

	success#1209 := __call_ret#56;
	if (success#1209) {
	balances_re_ent8#1205 := balances_re_ent8#1205[__this := balances_re_ent8#1205[__this][__msg_sender := 0]];
	}

	$return31:
	// Function body ends here
}

// 
// Function: changeStakeTokens : function (uint256)
procedure {:sourceloc "buggy_42.sol", 282, 5} {:message "Staking::changeStakeTokens"} changeStakeTokens#1253(__this: address_t, __msg_sender: address_t, __msg_value: int, _NewTokensThreshold#1236: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#42[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTokens#654 := stakeTokens#654[__this := (_NewTokensThreshold#1236 * 10000000000)];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 285, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1257: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_42.sol", 286, 1} {:message "Staking::claimReward_re_ent39"} claimReward_re_ent39#1293(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 289, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1270: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1257[__this][__msg_sender] > 0);
	transferValue_re_ent39#1270 := redeemableEther_re_ent39#1257[__this][__msg_sender];
	assume {:sourceloc "buggy_42.sol", 290, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1270);
	redeemableEther_re_ent39#1257 := redeemableEther_re_ent39#1257[__this := redeemableEther_re_ent39#1257[__this][__msg_sender := 0]];
	$return34:
	// Function body ends here
}

// 
// Function: changeStakeTime : function (uint256)
procedure {:sourceloc "buggy_42.sol", 294, 5} {:message "Staking::changeStakeTime"} changeStakeTime#1305(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakeTime#1295: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#42[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakeTime#741 := stakeTime#741[__this := _newStakeTime#1295];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 297, 1} {:message "balances_re_ent36"} balances_re_ent36#1309: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_42.sol", 298, 5} {:message "Staking::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1338(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 299, 7} {:message "sent"} sent#1313: bool;
	var __call_ret#62: bool;
	var __call_ret#63: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent36#1309[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent36#1309[__this][__msg_sender])];
	assume {:sourceloc "buggy_42.sol", 299, 21} {:message ""} true;
	call __call_ret#62, __call_ret#63 := __call(__msg_sender, __this, balances_re_ent36#1309[__this][__msg_sender]);
	if (__call_ret#62) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#62)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent36#1309[__this][__msg_sender])];
	}

	sent#1313 := __call_ret#62;
	if (sent#1313) {
	balances_re_ent36#1309 := balances_re_ent36#1309[__this := balances_re_ent36#1309[__this][__msg_sender := 0]];
	}

	$return37:
	// Function body ends here
}

// 
// Function: changeStakingPercentage : function (uint256)
procedure {:sourceloc "buggy_42.sol", 304, 5} {:message "Staking::changeStakingPercentage"} changeStakingPercentage#1350(__this: address_t, __msg_sender: address_t, __msg_value: int, _newStakePercentage#1340: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#42[__this]) || (__msg_sender == __this));
	// Function body starts here
	stakePercentage#782 := stakePercentage#782[__this := _newStakePercentage#1340];
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_42.sol", 308, 1} {:message "counter_re_ent35"} counter_re_ent35#1353: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_42.sol", 309, 1} {:message "Staking::callme_re_ent35"} callme_re_ent35#1387(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 311, 3} {:message "success"} success#1363: bool;
	var __call_ret#66: bool;
	var __call_ret#67: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1353[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_42.sol", 311, 20} {:message ""} true;
	call __call_ret#66, __call_ret#67 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#66) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#66)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1363 := __call_ret#66;
	if (!(success#1363)) {
	assume false;
	}

	counter_re_ent35#1353 := counter_re_ent35#1353[__this := (counter_re_ent35#1353[__this] + 1)];
	$return40:
	// Function body ends here
}

// 
// Function: lockWithdrawals : function ()
procedure {:sourceloc "buggy_42.sol", 318, 5} {:message "Staking::lockWithdrawals"} lockWithdrawals#1397(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume ((__msg_sender == owner#42[__this]) || (__msg_sender == __this));
	// Function body starts here
	lock#613 := lock#613[__this := true];
	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 321, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1401: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_42.sol", 322, 1} {:message "Staking::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1435(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 325, 6} {:message "success"} success#1405: bool;
	var __call_ret#70: bool;
	var __call_ret#71: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1401[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1401[__this][__msg_sender])];
	assume {:sourceloc "buggy_42.sol", 325, 23} {:message ""} true;
	call __call_ret#70, __call_ret#71 := __call(__msg_sender, __this, userBalance_re_ent40#1401[__this][__msg_sender]);
	if (__call_ret#70) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#70)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1401[__this][__msg_sender])];
	}

	success#1405 := __call_ret#70;
	if (!(success#1405)) {
	assume false;
	}

	userBalance_re_ent40#1401 := userBalance_re_ent40#1401[__this := userBalance_re_ent40#1401[__this][__msg_sender := 0]];
	$return43:
	// Function body ends here
}

// 
// Function: findOnePercent : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_42.sol", 332, 5} {:message "Staking::findOnePercent"} findOnePercent#1462(__this: address_t, __msg_sender: address_t, __msg_value: int, value#1437: int)
	returns (#1440: int)
{
	var {:sourceloc "buggy_42.sol", 333, 9} {:message "roundValue"} roundValue#1443: int;
	var ceil#380_ret#72: int;
	var {:sourceloc "buggy_42.sol", 334, 9} {:message "onePercent"} onePercent#1450: int;
	var mul#286_ret#73: int;
	var call_arg#74: int;
	var div#304_ret#75: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_42.sol", 333, 30} {:message ""} true;
	call ceil#380_ret#72 := ceil#380(__this, __msg_sender, __msg_value, value#1437, basePercent#697[__this]);
	roundValue#1443 := ceil#380_ret#72;
	assume {:sourceloc "buggy_42.sol", 334, 30} {:message ""} true;
	call mul#286_ret#73 := mul#286(__this, __msg_sender, __msg_value, roundValue#1443, basePercent#697[__this]);
	call_arg#74 := 10000;
	assume {:sourceloc "buggy_42.sol", 334, 30} {:message ""} true;
	call div#304_ret#75 := div#304(__this, __msg_sender, __msg_value, mul#286_ret#73, call_arg#74);
	onePercent#1450 := div#304_ret#75;
	#1440 := onePercent#1450;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_42.sol", 337, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1466: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_42.sol", 338, 1} {:message "Staking::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1500(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_42.sol", 341, 6} {:message "success"} success#1470: bool;
	var __call_ret#76: bool;
	var __call_ret#77: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1466[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1466[__this][__msg_sender])];
	assume {:sourceloc "buggy_42.sol", 341, 23} {:message ""} true;
	call __call_ret#76, __call_ret#77 := __call(__msg_sender, __this, userBalance_re_ent33#1466[__this][__msg_sender]);
	if (__call_ret#76) {
	havoc lastPlayer_re_ent37#529;
	havoc jackpot_re_ent37#531;
	havoc token#568;
	havoc balances_re_ent3#572;
	havoc lock#613;
	havoc lastPlayer_re_ent9#615;
	havoc jackpot_re_ent9#617;
	havoc stakeTokens#654;
	havoc redeemableEther_re_ent25#658;
	havoc basePercent#697;
	havoc userBalance_re_ent19#704;
	havoc stakeTime#741;
	havoc userBalance_re_ent26#745;
	havoc stakePercentage#782;
	havoc balances_re_ent31#786;
	havoc not_called_re_ent13#837;
	havoc not_called_re_ent20#887;
	havoc staker#923;
	havoc counter_re_ent14#954;
	havoc lastPlayer_re_ent30#1063;
	havoc jackpot_re_ent30#1065;
	havoc balances_re_ent8#1205;
	havoc redeemableEther_re_ent39#1257;
	havoc balances_re_ent36#1309;
	havoc counter_re_ent35#1353;
	havoc userBalance_re_ent40#1401;
	havoc userBalance_re_ent33#1466;
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc owner#42;
	havoc balances_re_ent17#46;
	havoc newOwner#87;
	havoc not_called_re_ent27#90;
	havoc redeemableEther_re_ent32#141;
	havoc balances_re_ent38#212;
	havoc __balance;
	}

	if (!(__call_ret#76)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1466[__this][__msg_sender])];
	}

	success#1470 := __call_ret#76;
	if (!(success#1470)) {
	assume false;
	}

	userBalance_re_ent33#1466 := userBalance_re_ent33#1466[__this := userBalance_re_ent33#1466[__this][__msg_sender := 0]];
	$return45:
	// Function body ends here
}

