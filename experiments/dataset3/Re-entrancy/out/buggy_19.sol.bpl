// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_19.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 16, 3} {:message "SafeMath::mul"} mul#36(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var {:sourceloc "buggy_19.sol", 20, 5} {:message "c"} c#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#5 == 0)) {
	#10 := 0;
	goto $return0;
	}

	c#20 := (a#5 * b#7);
	assert {:sourceloc "buggy_19.sol", 21, 5} {:message "Assertion might not hold."} ((c#20 div a#5) == b#7);
	#10 := c#20;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 28, 3} {:message "SafeMath::div"} div#55(__this: address_t, __msg_sender: address_t, __msg_value: int, a#39: int, b#41: int)
	returns (#44: int)
{
	var {:sourceloc "buggy_19.sol", 29, 5} {:message "c"} c#47: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#47 := (a#39 div b#41);
	#44 := c#47;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 36, 3} {:message "SafeMath::sub"} sub#76(__this: address_t, __msg_sender: address_t, __msg_value: int, a#58: int, b#60: int)
	returns (#63: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_19.sol", 37, 5} {:message "Assertion might not hold."} (b#60 <= a#58);
	#63 := (a#58 - b#60);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_19.sol", 44, 3} {:message "SafeMath::add"} add#101(__this: address_t, __msg_sender: address_t, __msg_value: int, a#79: int, b#81: int)
	returns (#84: int)
{
	var {:sourceloc "buggy_19.sol", 45, 5} {:message "c"} c#87: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#87 := (a#79 + b#81);
	assert {:sourceloc "buggy_19.sol", 46, 5} {:message "Assertion might not hold."} (c#87 >= a#79);
	#84 := c#87;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_19.sol", 11, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#102(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: owned -------
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 58, 3} {:message "balances_re_ent1"} balances_re_ent1#107: [address_t][address_t]int;
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
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_19.sol", 59, 5} {:message "owned::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#136(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 60, 6} {:message "success"} success#111: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#107[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#107[__this][__msg_sender])];
	assume {:sourceloc "buggy_19.sol", 60, 22} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, balances_re_ent1#107[__this][__msg_sender]);
	if (__call_ret#0) {
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#107[__this][__msg_sender])];
	}

	success#111 := __call_ret#0;
	if (success#111) {
	balances_re_ent1#107 := balances_re_ent1#107[__this := balances_re_ent1#107[__this][__msg_sender := 0]];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_19.sol", 64, 3} {:message "owner"} owner#138: [address_t]address_t;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 69, 5} {:message "owned::[constructor]"} __constructor#245(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent1#107 := balances_re_ent1#107[__this := default_address_t_int()];
	owner#138 := owner#138[__this := 0];
	not_called_re_ent41#151 := not_called_re_ent41#151[__this := true];
	counter_re_ent42#215 := counter_re_ent42#215[__this := 0];
	// Function body starts here
	owner#138 := owner#138[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_19.sol", 72, 1} {:message "not_called_re_ent41"} not_called_re_ent41#151: [address_t]bool;
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
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_19.sol", 73, 1} {:message "owned::bug_re_ent41"} bug_re_ent41#178(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#151[__this];
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 75, 16} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, call_arg#2);
	if (!(__send_ret#3)) {
	assume false;
	}

	not_called_re_ent41#151 := not_called_re_ent41#151[__this := false];
	$return6:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_19.sol", 92, 5} {:message "owned::transferOwnership"} transferOwnership#212(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#193: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	assume (newOwner#193 != 0);
	owner#138 := owner#138[__this := newOwner#193];
	$return8:
	// Function body ends here
	$return7:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_19.sol", 96, 1} {:message "counter_re_ent42"} counter_re_ent42#215: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_19.sol", 97, 1} {:message "owned::callme_re_ent42"} callme_re_ent42#244(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#215[__this] <= 5);
	call_arg#6 := 10000000000000000000;
	assume {:sourceloc "buggy_19.sol", 99, 9} {:message ""} true;
	call __send_ret#7 := __send(__msg_sender, __this, 0, call_arg#6);
	if (!(__send_ret#7)) {
	assume false;
	}

	counter_re_ent42#215 := counter_re_ent42#215[__this := (counter_re_ent42#215[__this] + 1)];
	$return9:
	// Function body ends here
}

// 
// ------- Contract: ethBank -------
// Inherits from: owned
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 108, 5} {:message "ethBank::[receive]"} #251(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	$return10:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_19.sol", 109, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#253: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_19.sol", 110, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#255: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_19.sol", 111, 4} {:message "ethBank::buyTicket_re_ent2"} buyTicket_re_ent2#285(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 112, 12} {:message ""} true;
	call __send_ret#8 := __send(lastPlayer_re_ent2#253[__this], __this, 0, jackpot_re_ent2#255[__this]);
	if (!(__send_ret#8)) {
	assume false;
	}

	lastPlayer_re_ent2#253 := lastPlayer_re_ent2#253[__this := __msg_sender];
	jackpot_re_ent2#255 := jackpot_re_ent2#255[__this := __balance[__this]];
	$return11:
	// Function body ends here
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: withdrawForUser : function (address payable,uint256)
procedure {:sourceloc "buggy_19.sol", 118, 5} {:message "ethBank::withdrawForUser"} withdrawForUser#309(__this: address_t, __msg_sender: address_t, __msg_value: int, _address#287: address_t, amount#289: int)
{
	var call_arg#11: int_arr_ptr;
	var new_array#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#12 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#11 := new_array#12;
	mem_arr_int := mem_arr_int[call_arg#11 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 120, 9} {:message ""} true;
	call __transfer(_address#287, __this, 0, amount#289);
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 122, 1} {:message "balances_re_ent17"} balances_re_ent17#313: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 123, 1} {:message "ethBank::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#346(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#315: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#313[__this][__msg_sender] >= _weiToWithdraw#315);
	assume {:sourceloc "buggy_19.sol", 126, 13} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, _weiToWithdraw#315);
	assume __send_ret#13;
	balances_re_ent17#313 := balances_re_ent17#313[__this := balances_re_ent17#313[__this][__msg_sender := (balances_re_ent17#313[__this][__msg_sender] - _weiToWithdraw#315)]];
	$return14:
	// Function body ends here
}

// 
// Function: moveBrick : function (uint256)
procedure {:sourceloc "buggy_19.sol", 130, 5} {:message "ethBank::moveBrick"} moveBrick#371(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#348: int)
{
	var call_arg#16: int_arr_ptr;
	var new_array#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#17 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#16 := new_array#17;
	mem_arr_int := mem_arr_int[call_arg#16 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 132, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, amount#348);
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_19.sol", 134, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#373: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_19.sol", 135, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#375: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_19.sol", 136, 4} {:message "ethBank::buyTicket_re_ent37"} buyTicket_re_ent37#405(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 137, 12} {:message ""} true;
	call __send_ret#18 := __send(lastPlayer_re_ent37#373[__this], __this, 0, jackpot_re_ent37#375[__this]);
	if (!(__send_ret#18)) {
	assume false;
	}

	lastPlayer_re_ent37#373 := lastPlayer_re_ent37#373[__this := __msg_sender];
	jackpot_re_ent37#375 := jackpot_re_ent37#375[__this := __balance[__this]];
	$return17:
	// Function body ends here
}

// 
// Function: moveBrickContracts : function ()
procedure {:sourceloc "buggy_19.sol", 147, 5} {:message "ethBank::moveBrickContracts"} moveBrickContracts#433(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int_arr_ptr;
	var new_array#22: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#22 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#21 := new_array#22;
	mem_arr_int := mem_arr_int[call_arg#21 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 152, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 154, 1} {:message "balances_re_ent3"} balances_re_ent3#437: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 155, 1} {:message "ethBank::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#476(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#439: int)
{
	var {:sourceloc "buggy_19.sol", 158, 3} {:message "success"} success#452: bool;
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#437[__this][__msg_sender] >= _weiToWithdraw#439);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#439);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#439)];
	assume {:sourceloc "buggy_19.sol", 158, 19} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(__msg_sender, __this, _weiToWithdraw#439);
	if (__call_ret#23) {
	havoc lastPlayer_re_ent2#253;
	havoc jackpot_re_ent2#255;
	havoc balances_re_ent17#313;
	havoc lastPlayer_re_ent37#373;
	havoc jackpot_re_ent37#375;
	havoc balances_re_ent3#437;
	havoc lastPlayer_re_ent9#478;
	havoc jackpot_re_ent9#480;
	havoc redeemableEther_re_ent25#546;
	havoc userBalance_re_ent19#613;
	havoc userBalance_re_ent26#673;
	havoc not_called_re_ent20#737;
	havoc redeemableEther_re_ent32#795;
	havoc balances_re_ent38#862;
	havoc redeemableEther_re_ent4#926;
	havoc counter_re_ent7#992;
	havoc lastPlayer_re_ent23#1050;
	havoc jackpot_re_ent23#1052;
	havoc counter_re_ent14#1112;
	havoc lastPlayer_re_ent30#1170;
	havoc jackpot_re_ent30#1172;
	havoc balances_re_ent8#1233;
	havoc redeemableEther_re_ent39#1293;
	havoc balances_re_ent36#1360;
	havoc counter_re_ent35#1413;
	havoc userBalance_re_ent40#1473;
	havoc userBalance_re_ent33#1538;
	havoc not_called_re_ent27#1602;
	havoc balances_re_ent31#1660;
	havoc not_called_re_ent13#1723;
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#23)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#439)];
	}

	success#452 := __call_ret#23;
	assume success#452;
	balances_re_ent3#437 := balances_re_ent3#437[__this := balances_re_ent3#437[__this][__msg_sender := (balances_re_ent3#437[__this][__msg_sender] - _weiToWithdraw#439)]];
	$return20:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_19.sol", 163, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#478: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_19.sol", 164, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#480: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_19.sol", 165, 4} {:message "ethBank::buyTicket_re_ent9"} buyTicket_re_ent9#515(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 166, 10} {:message "success"} success#484: bool;
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#480[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#480[__this])];
	assume {:sourceloc "buggy_19.sol", 166, 27} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(lastPlayer_re_ent9#478[__this], __this, jackpot_re_ent9#480[__this]);
	if (__call_ret#25) {
	havoc lastPlayer_re_ent2#253;
	havoc jackpot_re_ent2#255;
	havoc balances_re_ent17#313;
	havoc lastPlayer_re_ent37#373;
	havoc jackpot_re_ent37#375;
	havoc balances_re_ent3#437;
	havoc lastPlayer_re_ent9#478;
	havoc jackpot_re_ent9#480;
	havoc redeemableEther_re_ent25#546;
	havoc userBalance_re_ent19#613;
	havoc userBalance_re_ent26#673;
	havoc not_called_re_ent20#737;
	havoc redeemableEther_re_ent32#795;
	havoc balances_re_ent38#862;
	havoc redeemableEther_re_ent4#926;
	havoc counter_re_ent7#992;
	havoc lastPlayer_re_ent23#1050;
	havoc jackpot_re_ent23#1052;
	havoc counter_re_ent14#1112;
	havoc lastPlayer_re_ent30#1170;
	havoc jackpot_re_ent30#1172;
	havoc balances_re_ent8#1233;
	havoc redeemableEther_re_ent39#1293;
	havoc balances_re_ent36#1360;
	havoc counter_re_ent35#1413;
	havoc userBalance_re_ent40#1473;
	havoc userBalance_re_ent33#1538;
	havoc not_called_re_ent27#1602;
	havoc balances_re_ent31#1660;
	havoc not_called_re_ent13#1723;
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#480[__this])];
	}

	success#484 := __call_ret#25;
	if (!(success#484)) {
	assume false;
	}

	lastPlayer_re_ent9#478 := lastPlayer_re_ent9#478[__this := __msg_sender];
	jackpot_re_ent9#480 := jackpot_re_ent9#480[__this := __balance[__this]];
	$return21:
	// Function body ends here
}

// 
// Function: joinFlexible : function ()
procedure {:sourceloc "buggy_19.sol", 177, 5} {:message "ethBank::joinFlexible"} joinFlexible#542(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int_arr_ptr;
	var new_array#30: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#30 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#29 := new_array#30;
	mem_arr_int := mem_arr_int[call_arg#29 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 179, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 182, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#546: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_19.sol", 183, 1} {:message "ethBank::claimReward_re_ent25"} claimReward_re_ent25#582(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 186, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#559: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#546[__this][__msg_sender] > 0);
	transferValue_re_ent25#559 := redeemableEther_re_ent25#546[__this][__msg_sender];
	assume {:sourceloc "buggy_19.sol", 187, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#559);
	redeemableEther_re_ent25#546 := redeemableEther_re_ent25#546[__this := redeemableEther_re_ent25#546[__this][__msg_sender := 0]];
	$return24:
	// Function body ends here
}

// 
// Function: joinFixed : function ()
procedure {:sourceloc "buggy_19.sol", 190, 5} {:message "ethBank::joinFixed"} joinFixed#609(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int_arr_ptr;
	var new_array#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#33 := new_array#34;
	mem_arr_int := mem_arr_int[call_arg#33 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 192, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 195, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#613: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_19.sol", 196, 1} {:message "ethBank::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#642(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 199, 16} {:message ""} true;
	call __send_ret#35 := __send(__msg_sender, __this, 0, userBalance_re_ent19#613[__this][__msg_sender]);
	if (!(__send_ret#35)) {
	assume false;
	}

	userBalance_re_ent19#613 := userBalance_re_ent19#613[__this := userBalance_re_ent19#613[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: staticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 204, 5} {:message "ethBank::staticBonus"} staticBonus#669(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int_arr_ptr;
	var new_array#39: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#39 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#38 := new_array#39;
	mem_arr_int := mem_arr_int[call_arg#38 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 206, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 209, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#673: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_19.sol", 210, 1} {:message "ethBank::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#707(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 213, 10} {:message "success"} success#677: bool;
	var __call_ret#40: bool;
	var __call_ret#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#673[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#673[__this][__msg_sender])];
	assume {:sourceloc "buggy_19.sol", 213, 26} {:message ""} true;
	call __call_ret#40, __call_ret#41 := __call(__msg_sender, __this, userBalance_re_ent26#673[__this][__msg_sender]);
	if (__call_ret#40) {
	havoc lastPlayer_re_ent2#253;
	havoc jackpot_re_ent2#255;
	havoc balances_re_ent17#313;
	havoc lastPlayer_re_ent37#373;
	havoc jackpot_re_ent37#375;
	havoc balances_re_ent3#437;
	havoc lastPlayer_re_ent9#478;
	havoc jackpot_re_ent9#480;
	havoc redeemableEther_re_ent25#546;
	havoc userBalance_re_ent19#613;
	havoc userBalance_re_ent26#673;
	havoc not_called_re_ent20#737;
	havoc redeemableEther_re_ent32#795;
	havoc balances_re_ent38#862;
	havoc redeemableEther_re_ent4#926;
	havoc counter_re_ent7#992;
	havoc lastPlayer_re_ent23#1050;
	havoc jackpot_re_ent23#1052;
	havoc counter_re_ent14#1112;
	havoc lastPlayer_re_ent30#1170;
	havoc jackpot_re_ent30#1172;
	havoc balances_re_ent8#1233;
	havoc redeemableEther_re_ent39#1293;
	havoc balances_re_ent36#1360;
	havoc counter_re_ent35#1413;
	havoc userBalance_re_ent40#1473;
	havoc userBalance_re_ent33#1538;
	havoc not_called_re_ent27#1602;
	havoc balances_re_ent31#1660;
	havoc not_called_re_ent13#1723;
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#40)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#673[__this][__msg_sender])];
	}

	success#677 := __call_ret#40;
	if (!(success#677)) {
	assume false;
	}

	userBalance_re_ent26#673 := userBalance_re_ent26#673[__this := userBalance_re_ent26#673[__this][__msg_sender := 0]];
	$return30:
	// Function body ends here
}

// 
// Function: activeBonus : function ()
procedure {:sourceloc "buggy_19.sol", 219, 5} {:message "ethBank::activeBonus"} activeBonus#734(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int_arr_ptr;
	var new_array#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#45 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#44 := new_array#45;
	mem_arr_int := mem_arr_int[call_arg#44 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 221, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return32:
	// Function body ends here
	$return31:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_19.sol", 224, 1} {:message "not_called_re_ent20"} not_called_re_ent20#737: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_19.sol", 225, 1} {:message "ethBank::bug_re_ent20"} bug_re_ent20#764(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#737[__this];
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 227, 16} {:message ""} true;
	call __send_ret#47 := __send(__msg_sender, __this, 0, call_arg#46);
	if (!(__send_ret#47)) {
	assume false;
	}

	not_called_re_ent20#737 := not_called_re_ent20#737[__this := false];
	$return33:
	// Function body ends here
}

// 
// Function: teamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 232, 5} {:message "ethBank::teamAddBonus"} teamAddBonus#791(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#50: int_arr_ptr;
	var new_array#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#51 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#50 := new_array#51;
	mem_arr_int := mem_arr_int[call_arg#50 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 234, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return35:
	// Function body ends here
	$return34:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 237, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#795: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_19.sol", 238, 1} {:message "ethBank::claimReward_re_ent32"} claimReward_re_ent32#831(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 241, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#808: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#795[__this][__msg_sender] > 0);
	transferValue_re_ent32#808 := redeemableEther_re_ent32#795[__this][__msg_sender];
	assume {:sourceloc "buggy_19.sol", 242, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#808);
	redeemableEther_re_ent32#795 := redeemableEther_re_ent32#795[__this := redeemableEther_re_ent32#795[__this][__msg_sender := 0]];
	$return36:
	// Function body ends here
}

// 
// Function: staticBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 245, 5} {:message "ethBank::staticBonusCacl"} staticBonusCacl#858(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#54: int_arr_ptr;
	var new_array#55: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#55 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#54 := new_array#55;
	mem_arr_int := mem_arr_int[call_arg#54 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 247, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 250, 1} {:message "balances_re_ent38"} balances_re_ent38#862: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 251, 1} {:message "ethBank::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#895(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#864: int)
{
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#862[__this][__msg_sender] >= _weiToWithdraw#864);
	assume {:sourceloc "buggy_19.sol", 254, 13} {:message ""} true;
	call __send_ret#56 := __send(__msg_sender, __this, 0, _weiToWithdraw#864);
	assume __send_ret#56;
	balances_re_ent38#862 := balances_re_ent38#862[__this := balances_re_ent38#862[__this][__msg_sender := (balances_re_ent38#862[__this][__msg_sender] - _weiToWithdraw#864)]];
	$return39:
	// Function body ends here
}

// 
// Function: activeBonusCacl_1 : function ()
procedure {:sourceloc "buggy_19.sol", 257, 5} {:message "ethBank::activeBonusCacl_1"} activeBonusCacl_1#922(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int_arr_ptr;
	var new_array#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#60 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#59 := new_array#60;
	mem_arr_int := mem_arr_int[call_arg#59 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 259, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 262, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#926: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_19.sol", 263, 1} {:message "ethBank::claimReward_re_ent4"} claimReward_re_ent4#962(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 266, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#939: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#926[__this][__msg_sender] > 0);
	transferValue_re_ent4#939 := redeemableEther_re_ent4#926[__this][__msg_sender];
	assume {:sourceloc "buggy_19.sol", 267, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#939);
	redeemableEther_re_ent4#926 := redeemableEther_re_ent4#926[__this := redeemableEther_re_ent4#926[__this][__msg_sender := 0]];
	$return42:
	// Function body ends here
}

// 
// Function: activeBonusCacl_2 : function ()
procedure {:sourceloc "buggy_19.sol", 270, 5} {:message "ethBank::activeBonusCacl_2"} activeBonusCacl_2#989(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#63: int_arr_ptr;
	var new_array#64: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#64 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#63 := new_array#64;
	mem_arr_int := mem_arr_int[call_arg#63 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 272, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_19.sol", 275, 1} {:message "counter_re_ent7"} counter_re_ent7#992: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_19.sol", 276, 1} {:message "ethBank::callme_re_ent7"} callme_re_ent7#1021(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#65: int;
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#992[__this] <= 5);
	call_arg#65 := 10000000000000000000;
	assume {:sourceloc "buggy_19.sol", 278, 9} {:message ""} true;
	call __send_ret#66 := __send(__msg_sender, __this, 0, call_arg#65);
	if (!(__send_ret#66)) {
	assume false;
	}

	counter_re_ent7#992 := counter_re_ent7#992[__this := (counter_re_ent7#992[__this] + 1)];
	$return45:
	// Function body ends here
}

// 
// Function: activeBonusCacl_3 : function ()
procedure {:sourceloc "buggy_19.sol", 283, 5} {:message "ethBank::activeBonusCacl_3"} activeBonusCacl_3#1048(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#69: int_arr_ptr;
	var new_array#70: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#70 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#69 := new_array#70;
	mem_arr_int := mem_arr_int[call_arg#69 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 285, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_19.sol", 288, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1050: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_19.sol", 289, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1052: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_19.sol", 290, 4} {:message "ethBank::buyTicket_re_ent23"} buyTicket_re_ent23#1082(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#71: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 291, 12} {:message ""} true;
	call __send_ret#71 := __send(lastPlayer_re_ent23#1050[__this], __this, 0, jackpot_re_ent23#1052[__this]);
	if (!(__send_ret#71)) {
	assume false;
	}

	lastPlayer_re_ent23#1050 := lastPlayer_re_ent23#1050[__this := __msg_sender];
	jackpot_re_ent23#1052 := jackpot_re_ent23#1052[__this := __balance[__this]];
	$return48:
	// Function body ends here
}

// 
// Function: activeBonusCacl_4 : function ()
procedure {:sourceloc "buggy_19.sol", 296, 5} {:message "ethBank::activeBonusCacl_4"} activeBonusCacl_4#1109(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#74: int_arr_ptr;
	var new_array#75: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#75 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#74 := new_array#75;
	mem_arr_int := mem_arr_int[call_arg#74 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 298, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_19.sol", 301, 1} {:message "counter_re_ent14"} counter_re_ent14#1112: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_19.sol", 302, 1} {:message "ethBank::callme_re_ent14"} callme_re_ent14#1141(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#76: int;
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1112[__this] <= 5);
	call_arg#76 := 10000000000000000000;
	assume {:sourceloc "buggy_19.sol", 304, 9} {:message ""} true;
	call __send_ret#77 := __send(__msg_sender, __this, 0, call_arg#76);
	if (!(__send_ret#77)) {
	assume false;
	}

	counter_re_ent14#1112 := counter_re_ent14#1112[__this := (counter_re_ent14#1112[__this] + 1)];
	$return51:
	// Function body ends here
}

// 
// Function: activeBonusCacl_5 : function ()
procedure {:sourceloc "buggy_19.sol", 309, 5} {:message "ethBank::activeBonusCacl_5"} activeBonusCacl_5#1168(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#80: int_arr_ptr;
	var new_array#81: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#81 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#80 := new_array#81;
	mem_arr_int := mem_arr_int[call_arg#80 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 311, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return53:
	// Function body ends here
	$return52:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_19.sol", 314, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1170: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_19.sol", 315, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1172: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_19.sol", 316, 4} {:message "ethBank::buyTicket_re_ent30"} buyTicket_re_ent30#1202(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#82: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 317, 12} {:message ""} true;
	call __send_ret#82 := __send(lastPlayer_re_ent30#1170[__this], __this, 0, jackpot_re_ent30#1172[__this]);
	if (!(__send_ret#82)) {
	assume false;
	}

	lastPlayer_re_ent30#1170 := lastPlayer_re_ent30#1170[__this := __msg_sender];
	jackpot_re_ent30#1172 := jackpot_re_ent30#1172[__this := __balance[__this]];
	$return54:
	// Function body ends here
}

// 
// Function: activeBonusCacl_6 : function ()
procedure {:sourceloc "buggy_19.sol", 322, 5} {:message "ethBank::activeBonusCacl_6"} activeBonusCacl_6#1229(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#85: int_arr_ptr;
	var new_array#86: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#86 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#85 := new_array#86;
	mem_arr_int := mem_arr_int[call_arg#85 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 324, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return56:
	// Function body ends here
	$return55:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 327, 1} {:message "balances_re_ent8"} balances_re_ent8#1233: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_19.sol", 328, 5} {:message "ethBank::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1262(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 329, 19} {:message "success"} success#1237: bool;
	var __call_ret#87: bool;
	var __call_ret#88: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1233[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1233[__this][__msg_sender])];
	assume {:sourceloc "buggy_19.sol", 329, 36} {:message ""} true;
	call __call_ret#87, __call_ret#88 := __call(__msg_sender, __this, balances_re_ent8#1233[__this][__msg_sender]);
	if (__call_ret#87) {
	havoc lastPlayer_re_ent2#253;
	havoc jackpot_re_ent2#255;
	havoc balances_re_ent17#313;
	havoc lastPlayer_re_ent37#373;
	havoc jackpot_re_ent37#375;
	havoc balances_re_ent3#437;
	havoc lastPlayer_re_ent9#478;
	havoc jackpot_re_ent9#480;
	havoc redeemableEther_re_ent25#546;
	havoc userBalance_re_ent19#613;
	havoc userBalance_re_ent26#673;
	havoc not_called_re_ent20#737;
	havoc redeemableEther_re_ent32#795;
	havoc balances_re_ent38#862;
	havoc redeemableEther_re_ent4#926;
	havoc counter_re_ent7#992;
	havoc lastPlayer_re_ent23#1050;
	havoc jackpot_re_ent23#1052;
	havoc counter_re_ent14#1112;
	havoc lastPlayer_re_ent30#1170;
	havoc jackpot_re_ent30#1172;
	havoc balances_re_ent8#1233;
	havoc redeemableEther_re_ent39#1293;
	havoc balances_re_ent36#1360;
	havoc counter_re_ent35#1413;
	havoc userBalance_re_ent40#1473;
	havoc userBalance_re_ent33#1538;
	havoc not_called_re_ent27#1602;
	havoc balances_re_ent31#1660;
	havoc not_called_re_ent13#1723;
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#87)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1233[__this][__msg_sender])];
	}

	success#1237 := __call_ret#87;
	if (success#1237) {
	balances_re_ent8#1233 := balances_re_ent8#1233[__this := balances_re_ent8#1233[__this][__msg_sender := 0]];
	}

	$return57:
	// Function body ends here
}

// 
// Function: activeBonusCacl_7 : function ()
procedure {:sourceloc "buggy_19.sol", 333, 5} {:message "ethBank::activeBonusCacl_7"} activeBonusCacl_7#1289(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#91: int_arr_ptr;
	var new_array#92: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#92 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#91 := new_array#92;
	mem_arr_int := mem_arr_int[call_arg#91 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 335, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 338, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1293: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_19.sol", 339, 1} {:message "ethBank::claimReward_re_ent39"} claimReward_re_ent39#1329(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 342, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1306: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1293[__this][__msg_sender] > 0);
	transferValue_re_ent39#1306 := redeemableEther_re_ent39#1293[__this][__msg_sender];
	assume {:sourceloc "buggy_19.sol", 343, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1306);
	redeemableEther_re_ent39#1293 := redeemableEther_re_ent39#1293[__this := redeemableEther_re_ent39#1293[__this][__msg_sender := 0]];
	$return60:
	// Function body ends here
}

// 
// Function: activeBonusCacl_8 : function ()
procedure {:sourceloc "buggy_19.sol", 346, 5} {:message "ethBank::activeBonusCacl_8"} activeBonusCacl_8#1356(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#95: int_arr_ptr;
	var new_array#96: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#96 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#95 := new_array#96;
	mem_arr_int := mem_arr_int[call_arg#95 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 348, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return62:
	// Function body ends here
	$return61:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 351, 1} {:message "balances_re_ent36"} balances_re_ent36#1360: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_19.sol", 352, 5} {:message "ethBank::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1383(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#97: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 353, 9} {:message ""} true;
	call __send_ret#97 := __send(__msg_sender, __this, 0, balances_re_ent36#1360[__this][__msg_sender]);
	if (__send_ret#97) {
	balances_re_ent36#1360 := balances_re_ent36#1360[__this := balances_re_ent36#1360[__this][__msg_sender := 0]];
	}

	$return63:
	// Function body ends here
}

// 
// Function: activeBonusCacl_9 : function ()
procedure {:sourceloc "buggy_19.sol", 356, 5} {:message "ethBank::activeBonusCacl_9"} activeBonusCacl_9#1410(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#100: int_arr_ptr;
	var new_array#101: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#101 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#100 := new_array#101;
	mem_arr_int := mem_arr_int[call_arg#100 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 358, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return65:
	// Function body ends here
	$return64:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_19.sol", 361, 1} {:message "counter_re_ent35"} counter_re_ent35#1413: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_19.sol", 362, 1} {:message "ethBank::callme_re_ent35"} callme_re_ent35#1442(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#102: int;
	var __send_ret#103: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1413[__this] <= 5);
	call_arg#102 := 10000000000000000000;
	assume {:sourceloc "buggy_19.sol", 364, 9} {:message ""} true;
	call __send_ret#103 := __send(__msg_sender, __this, 0, call_arg#102);
	if (!(__send_ret#103)) {
	assume false;
	}

	counter_re_ent35#1413 := counter_re_ent35#1413[__this := (counter_re_ent35#1413[__this] + 1)];
	$return66:
	// Function body ends here
}

// 
// Function: teamAddBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 369, 5} {:message "ethBank::teamAddBonusCacl"} teamAddBonusCacl#1469(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#106: int_arr_ptr;
	var new_array#107: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#107 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#106 := new_array#107;
	mem_arr_int := mem_arr_int[call_arg#106 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 371, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return68:
	// Function body ends here
	$return67:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 374, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1473: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_19.sol", 375, 1} {:message "ethBank::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1507(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 378, 6} {:message "success"} success#1477: bool;
	var __call_ret#108: bool;
	var __call_ret#109: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1473[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1473[__this][__msg_sender])];
	assume {:sourceloc "buggy_19.sol", 378, 21} {:message ""} true;
	call __call_ret#108, __call_ret#109 := __call(__msg_sender, __this, userBalance_re_ent40#1473[__this][__msg_sender]);
	if (__call_ret#108) {
	havoc lastPlayer_re_ent2#253;
	havoc jackpot_re_ent2#255;
	havoc balances_re_ent17#313;
	havoc lastPlayer_re_ent37#373;
	havoc jackpot_re_ent37#375;
	havoc balances_re_ent3#437;
	havoc lastPlayer_re_ent9#478;
	havoc jackpot_re_ent9#480;
	havoc redeemableEther_re_ent25#546;
	havoc userBalance_re_ent19#613;
	havoc userBalance_re_ent26#673;
	havoc not_called_re_ent20#737;
	havoc redeemableEther_re_ent32#795;
	havoc balances_re_ent38#862;
	havoc redeemableEther_re_ent4#926;
	havoc counter_re_ent7#992;
	havoc lastPlayer_re_ent23#1050;
	havoc jackpot_re_ent23#1052;
	havoc counter_re_ent14#1112;
	havoc lastPlayer_re_ent30#1170;
	havoc jackpot_re_ent30#1172;
	havoc balances_re_ent8#1233;
	havoc redeemableEther_re_ent39#1293;
	havoc balances_re_ent36#1360;
	havoc counter_re_ent35#1413;
	havoc userBalance_re_ent40#1473;
	havoc userBalance_re_ent33#1538;
	havoc not_called_re_ent27#1602;
	havoc balances_re_ent31#1660;
	havoc not_called_re_ent13#1723;
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#108)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1473[__this][__msg_sender])];
	}

	success#1477 := __call_ret#108;
	if (!(success#1477)) {
	assume false;
	}

	userBalance_re_ent40#1473 := userBalance_re_ent40#1473[__this := userBalance_re_ent40#1473[__this][__msg_sender := 0]];
	$return69:
	// Function body ends here
}

// 
// Function: caclTeamPerformance : function ()
procedure {:sourceloc "buggy_19.sol", 384, 5} {:message "ethBank::caclTeamPerformance"} caclTeamPerformance#1534(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#112: int_arr_ptr;
	var new_array#113: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#113 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#112 := new_array#113;
	mem_arr_int := mem_arr_int[call_arg#112 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 386, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return71:
	// Function body ends here
	$return70:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 389, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1538: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_19.sol", 390, 1} {:message "ethBank::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1572(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 393, 6} {:message "success"} success#1542: bool;
	var __call_ret#114: bool;
	var __call_ret#115: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1538[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1538[__this][__msg_sender])];
	assume {:sourceloc "buggy_19.sol", 393, 22} {:message ""} true;
	call __call_ret#114, __call_ret#115 := __call(__msg_sender, __this, userBalance_re_ent33#1538[__this][__msg_sender]);
	if (__call_ret#114) {
	havoc lastPlayer_re_ent2#253;
	havoc jackpot_re_ent2#255;
	havoc balances_re_ent17#313;
	havoc lastPlayer_re_ent37#373;
	havoc jackpot_re_ent37#375;
	havoc balances_re_ent3#437;
	havoc lastPlayer_re_ent9#478;
	havoc jackpot_re_ent9#480;
	havoc redeemableEther_re_ent25#546;
	havoc userBalance_re_ent19#613;
	havoc userBalance_re_ent26#673;
	havoc not_called_re_ent20#737;
	havoc redeemableEther_re_ent32#795;
	havoc balances_re_ent38#862;
	havoc redeemableEther_re_ent4#926;
	havoc counter_re_ent7#992;
	havoc lastPlayer_re_ent23#1050;
	havoc jackpot_re_ent23#1052;
	havoc counter_re_ent14#1112;
	havoc lastPlayer_re_ent30#1170;
	havoc jackpot_re_ent30#1172;
	havoc balances_re_ent8#1233;
	havoc redeemableEther_re_ent39#1293;
	havoc balances_re_ent36#1360;
	havoc counter_re_ent35#1413;
	havoc userBalance_re_ent40#1473;
	havoc userBalance_re_ent33#1538;
	havoc not_called_re_ent27#1602;
	havoc balances_re_ent31#1660;
	havoc not_called_re_ent13#1723;
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#114)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1538[__this][__msg_sender])];
	}

	success#1542 := __call_ret#114;
	if (!(success#1542)) {
	assume false;
	}

	userBalance_re_ent33#1538 := userBalance_re_ent33#1538[__this := userBalance_re_ent33#1538[__this][__msg_sender := 0]];
	$return72:
	// Function body ends here
}

// 
// Function: releaStaticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 399, 5} {:message "ethBank::releaStaticBonus"} releaStaticBonus#1599(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#118: int_arr_ptr;
	var new_array#119: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#119 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#118 := new_array#119;
	mem_arr_int := mem_arr_int[call_arg#118 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 401, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return74:
	// Function body ends here
	$return73:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_19.sol", 404, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1602: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_19.sol", 405, 1} {:message "ethBank::bug_re_ent27"} bug_re_ent27#1629(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#120: int;
	var __send_ret#121: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1602[__this];
	call_arg#120 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 407, 12} {:message ""} true;
	call __send_ret#121 := __send(__msg_sender, __this, 0, call_arg#120);
	if (!(__send_ret#121)) {
	assume false;
	}

	not_called_re_ent27#1602 := not_called_re_ent27#1602[__this := false];
	$return75:
	// Function body ends here
}

// 
// Function: releaActiveBonus : function ()
procedure {:sourceloc "buggy_19.sol", 412, 5} {:message "ethBank::releaActiveBonus"} releaActiveBonus#1656(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#124: int_arr_ptr;
	var new_array#125: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#125 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#124 := new_array#125;
	mem_arr_int := mem_arr_int[call_arg#124 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 414, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return77:
	// Function body ends here
	$return76:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_19.sol", 417, 1} {:message "balances_re_ent31"} balances_re_ent31#1660: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_19.sol", 418, 1} {:message "ethBank::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1693(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1662: int)
{
	var __send_ret#126: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1660[__this][__msg_sender] >= _weiToWithdraw#1662);
	assume {:sourceloc "buggy_19.sol", 421, 13} {:message ""} true;
	call __send_ret#126 := __send(__msg_sender, __this, 0, _weiToWithdraw#1662);
	assume __send_ret#126;
	balances_re_ent31#1660 := balances_re_ent31#1660[__this := balances_re_ent31#1660[__this][__msg_sender := (balances_re_ent31#1660[__this][__msg_sender] - _weiToWithdraw#1662)]];
	$return78:
	// Function body ends here
}

// 
// Function: releaTeamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 424, 5} {:message "ethBank::releaTeamAddBonus"} releaTeamAddBonus#1720(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#129: int_arr_ptr;
	var new_array#130: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#138[__this]);
	// Function body starts here
	new_array#130 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#129 := new_array#130;
	mem_arr_int := mem_arr_int[call_arg#129 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#138[__this]);
	assume {:sourceloc "buggy_19.sol", 426, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return80:
	// Function body ends here
	$return79:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_19.sol", 429, 1} {:message "not_called_re_ent13"} not_called_re_ent13#1723: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_19.sol", 430, 1} {:message "ethBank::bug_re_ent13"} bug_re_ent13#1755(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 432, 6} {:message "success"} success#1731: bool;
	var __call_ret#131: bool;
	var __call_ret#132: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1723[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_19.sol", 432, 21} {:message ""} true;
	call __call_ret#131, __call_ret#132 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#131) {
	havoc lastPlayer_re_ent2#253;
	havoc jackpot_re_ent2#255;
	havoc balances_re_ent17#313;
	havoc lastPlayer_re_ent37#373;
	havoc jackpot_re_ent37#375;
	havoc balances_re_ent3#437;
	havoc lastPlayer_re_ent9#478;
	havoc jackpot_re_ent9#480;
	havoc redeemableEther_re_ent25#546;
	havoc userBalance_re_ent19#613;
	havoc userBalance_re_ent26#673;
	havoc not_called_re_ent20#737;
	havoc redeemableEther_re_ent32#795;
	havoc balances_re_ent38#862;
	havoc redeemableEther_re_ent4#926;
	havoc counter_re_ent7#992;
	havoc lastPlayer_re_ent23#1050;
	havoc jackpot_re_ent23#1052;
	havoc counter_re_ent14#1112;
	havoc lastPlayer_re_ent30#1170;
	havoc jackpot_re_ent30#1172;
	havoc balances_re_ent8#1233;
	havoc redeemableEther_re_ent39#1293;
	havoc balances_re_ent36#1360;
	havoc counter_re_ent35#1413;
	havoc userBalance_re_ent40#1473;
	havoc userBalance_re_ent33#1538;
	havoc not_called_re_ent27#1602;
	havoc balances_re_ent31#1660;
	havoc not_called_re_ent13#1723;
	havoc balances_re_ent1#107;
	havoc owner#138;
	havoc not_called_re_ent41#151;
	havoc counter_re_ent42#215;
	havoc __balance;
	}

	if (!(__call_ret#131)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1731 := __call_ret#131;
	if (!(success#1731)) {
	assume false;
	}

	not_called_re_ent13#1723 := not_called_re_ent13#1723[__this := false];
	$return81:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_19.sol", 106, 1} {:message "ethBank::[implicit_constructor]"} __constructor#1756(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent2#253 := lastPlayer_re_ent2#253[__this := 0];
	jackpot_re_ent2#255 := jackpot_re_ent2#255[__this := 0];
	balances_re_ent17#313 := balances_re_ent17#313[__this := default_address_t_int()];
	lastPlayer_re_ent37#373 := lastPlayer_re_ent37#373[__this := 0];
	jackpot_re_ent37#375 := jackpot_re_ent37#375[__this := 0];
	balances_re_ent3#437 := balances_re_ent3#437[__this := default_address_t_int()];
	lastPlayer_re_ent9#478 := lastPlayer_re_ent9#478[__this := 0];
	jackpot_re_ent9#480 := jackpot_re_ent9#480[__this := 0];
	redeemableEther_re_ent25#546 := redeemableEther_re_ent25#546[__this := default_address_t_int()];
	userBalance_re_ent19#613 := userBalance_re_ent19#613[__this := default_address_t_int()];
	userBalance_re_ent26#673 := userBalance_re_ent26#673[__this := default_address_t_int()];
	not_called_re_ent20#737 := not_called_re_ent20#737[__this := true];
	redeemableEther_re_ent32#795 := redeemableEther_re_ent32#795[__this := default_address_t_int()];
	balances_re_ent38#862 := balances_re_ent38#862[__this := default_address_t_int()];
	redeemableEther_re_ent4#926 := redeemableEther_re_ent4#926[__this := default_address_t_int()];
	counter_re_ent7#992 := counter_re_ent7#992[__this := 0];
	lastPlayer_re_ent23#1050 := lastPlayer_re_ent23#1050[__this := 0];
	jackpot_re_ent23#1052 := jackpot_re_ent23#1052[__this := 0];
	counter_re_ent14#1112 := counter_re_ent14#1112[__this := 0];
	lastPlayer_re_ent30#1170 := lastPlayer_re_ent30#1170[__this := 0];
	jackpot_re_ent30#1172 := jackpot_re_ent30#1172[__this := 0];
	balances_re_ent8#1233 := balances_re_ent8#1233[__this := default_address_t_int()];
	redeemableEther_re_ent39#1293 := redeemableEther_re_ent39#1293[__this := default_address_t_int()];
	balances_re_ent36#1360 := balances_re_ent36#1360[__this := default_address_t_int()];
	counter_re_ent35#1413 := counter_re_ent35#1413[__this := 0];
	userBalance_re_ent40#1473 := userBalance_re_ent40#1473[__this := default_address_t_int()];
	userBalance_re_ent33#1538 := userBalance_re_ent33#1538[__this := default_address_t_int()];
	not_called_re_ent27#1602 := not_called_re_ent27#1602[__this := true];
	balances_re_ent31#1660 := balances_re_ent31#1660[__this := default_address_t_int()];
	not_called_re_ent13#1723 := not_called_re_ent13#1723[__this := true];
	balances_re_ent1#107 := balances_re_ent1#107[__this := default_address_t_int()];
	owner#138 := owner#138[__this := 0];
	not_called_re_ent41#151 := not_called_re_ent41#151[__this := true];
	counter_re_ent42#215 := counter_re_ent42#215[__this := 0];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#138 := owner#138[__this := __msg_sender];
	$return82:
	// Function body ends here
	// Inlined constructor for owned ends here
}

