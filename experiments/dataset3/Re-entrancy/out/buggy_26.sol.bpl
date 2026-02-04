// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_26.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 9, 5} {:message "SafeMath::add"} add#26(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_26.sol", 10, 9} {:message "c"} c#11: int;
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#11 := (a#3 + b#5);
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#11 >= a#3);
	#8 := c#11;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 15, 5} {:message "SafeMath::sub"} sub#51(__this: address_t, __msg_sender: address_t, __msg_value: int, a#28: int, b#30: int)
	returns (#33: int)
{
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var {:sourceloc "buggy_26.sol", 17, 9} {:message "c"} c#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#30 <= a#28);
	c#43 := (a#28 - b#30);
	#33 := c#43;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 21, 5} {:message "SafeMath::mul"} mul#85(__this: address_t, __msg_sender: address_t, __msg_value: int, a#53: int, b#55: int)
	returns (#58: int)
{
	var {:sourceloc "buggy_26.sol", 29, 9} {:message "c"} c#68: int;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#53 == 0)) {
	#58 := 0;
	goto $return2;
	}

	c#68 := (a#53 * b#55);
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#68 div a#53) == b#55);
	#58 := c#68;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 35, 5} {:message "SafeMath::div"} div#110(__this: address_t, __msg_sender: address_t, __msg_value: int, a#87: int, b#89: int)
	returns (#92: int)
{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	var {:sourceloc "buggy_26.sol", 38, 9} {:message "c"} c#102: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#89 > 0);
	c#102 := (a#87 div b#89);
	#92 := c#102;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 44, 5} {:message "SafeMath::mod"} mod#131(__this: address_t, __msg_sender: address_t, __msg_value: int, a#112: int, b#114: int)
	returns (#117: int)
{
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume (b#114 != 0);
	#117 := (a#112 mod b#114);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_26.sol", 7, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#132(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_26.sol", 57, 5} {:message "[event] IERC20::Transfer"} Transfer#190(__this: address_t, __msg_sender: address_t, __msg_value: int, from#184: address_t, to#186: address_t, value#188: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_26.sol", 58, 5} {:message "[event] IERC20::Approval"} Approval#198(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#192: address_t, spender#194: address_t, value#196: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_26.sol", 51, 5} {:message "IERC20::totalSupply"} totalSupply#137(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#135: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_26.sol", 52, 5} {:message "IERC20::balanceOf"} balanceOf#144(__this: address_t, __msg_sender: address_t, __msg_value: int, account#139: address_t)
	returns (#142: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_26.sol", 53, 5} {:message "IERC20::transfer"} transfer#153(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#146: address_t, amount#148: int)
	returns (#151: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_26.sol", 54, 5} {:message "IERC20::allowance"} allowance#162(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#155: address_t, spender#157: address_t)
	returns (#160: int);

// 
// Function: approve
procedure {:sourceloc "buggy_26.sol", 55, 5} {:message "IERC20::approve"} approve#171(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#164: address_t, amount#166: int)
	returns (#169: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_26.sol", 56, 5} {:message "IERC20::transferFrom"} transferFrom#182(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#173: address_t, recipient#175: address_t, amount#177: int)
	returns (#180: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_26.sol", 50, 1} {:message "IERC20::[implicit_constructor]"} __constructor#199(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: UBBCToken -------
// Inherits from: IERC20
// Using library SafeMath for uint256
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_26.sol", 63, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#206: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_26.sol", 64, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#208: [address_t]int;
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
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_26.sol", 65, 4} {:message "UBBCToken::buyTicket_re_ent37"} buyTicket_re_ent37#238(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 66, 12} {:message ""} true;
	call __send_ret#10 := __send(lastPlayer_re_ent37#206[__this], __this, 0, jackpot_re_ent37#208[__this]);
	if (!(__send_ret#10)) {
	assume false;
	}

	lastPlayer_re_ent37#206 := lastPlayer_re_ent37#206[__this := __msg_sender];
	jackpot_re_ent37#208 := jackpot_re_ent37#208[__this := __balance[__this]];
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 71, 3} {:message "_balances"} _balances#242: [address_t][address_t]int;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 72, 3} {:message "balances_re_ent3"} balances_re_ent3#246: [address_t][address_t]int;
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

// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 73, 1} {:message "UBBCToken::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#285(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#248: int)
{
	var {:sourceloc "buggy_26.sol", 76, 3} {:message "success"} success#261: bool;
	var __call_ret#11: bool;
	var __call_ret#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#246[__this][__msg_sender] >= _weiToWithdraw#248);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#248);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#248)];
	assume {:sourceloc "buggy_26.sol", 76, 19} {:message ""} true;
	call __call_ret#11, __call_ret#12 := __call(__msg_sender, __this, _weiToWithdraw#248);
	if (__call_ret#11) {
	havoc lastPlayer_re_ent37#206;
	havoc jackpot_re_ent37#208;
	havoc _balances#242;
	havoc balances_re_ent3#246;
	havoc _allowances#291;
	havoc lastPlayer_re_ent9#293;
	havoc jackpot_re_ent9#295;
	havoc _totalSupply#332;
	havoc redeemableEther_re_ent25#336;
	havoc _name#374;
	havoc userBalance_re_ent19#378;
	havoc _symbol#409;
	havoc userBalance_re_ent26#413;
	havoc _decimals#449;
	havoc not_called_re_ent20#478;
	havoc balances_re_ent31#509;
	havoc not_called_re_ent13#545;
	havoc redeemableEther_re_ent32#589;
	havoc balances_re_ent38#637;
	havoc redeemableEther_re_ent4#682;
	havoc counter_re_ent7#730;
	havoc lastPlayer_re_ent23#774;
	havoc jackpot_re_ent23#776;
	havoc counter_re_ent14#829;
	havoc lastPlayer_re_ent30#877;
	havoc jackpot_re_ent30#879;
	havoc balances_re_ent8#933;
	havoc redeemableEther_re_ent39#1002;
	havoc balances_re_ent36#1069;
	havoc counter_re_ent35#1122;
	havoc userBalance_re_ent40#1213;
	havoc userBalance_re_ent33#1295;
	havoc not_called_re_ent27#1339;
	havoc __balance;
	}

	if (!(__call_ret#11)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#248)];
	}

	success#261 := __call_ret#11;
	assume success#261;
	balances_re_ent3#246 := balances_re_ent3#246[__this := balances_re_ent3#246[__this][__msg_sender := (balances_re_ent3#246[__this][__msg_sender] - _weiToWithdraw#248)]];
	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_26.sol", 80, 3} {:message "_allowances"} _allowances#291: [address_t][address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_26.sol", 81, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#293: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_26.sol", 82, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#295: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_26.sol", 83, 4} {:message "UBBCToken::buyTicket_re_ent9"} buyTicket_re_ent9#330(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 84, 10} {:message "success"} success#299: bool;
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#295[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#295[__this])];
	assume {:sourceloc "buggy_26.sol", 84, 27} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(lastPlayer_re_ent9#293[__this], __this, jackpot_re_ent9#295[__this]);
	if (__call_ret#13) {
	havoc lastPlayer_re_ent37#206;
	havoc jackpot_re_ent37#208;
	havoc _balances#242;
	havoc balances_re_ent3#246;
	havoc _allowances#291;
	havoc lastPlayer_re_ent9#293;
	havoc jackpot_re_ent9#295;
	havoc _totalSupply#332;
	havoc redeemableEther_re_ent25#336;
	havoc _name#374;
	havoc userBalance_re_ent19#378;
	havoc _symbol#409;
	havoc userBalance_re_ent26#413;
	havoc _decimals#449;
	havoc not_called_re_ent20#478;
	havoc balances_re_ent31#509;
	havoc not_called_re_ent13#545;
	havoc redeemableEther_re_ent32#589;
	havoc balances_re_ent38#637;
	havoc redeemableEther_re_ent4#682;
	havoc counter_re_ent7#730;
	havoc lastPlayer_re_ent23#774;
	havoc jackpot_re_ent23#776;
	havoc counter_re_ent14#829;
	havoc lastPlayer_re_ent30#877;
	havoc jackpot_re_ent30#879;
	havoc balances_re_ent8#933;
	havoc redeemableEther_re_ent39#1002;
	havoc balances_re_ent36#1069;
	havoc counter_re_ent35#1122;
	havoc userBalance_re_ent40#1213;
	havoc userBalance_re_ent33#1295;
	havoc not_called_re_ent27#1339;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#295[__this])];
	}

	success#299 := __call_ret#13;
	if (!(success#299)) {
	assume false;
	}

	lastPlayer_re_ent9#293 := lastPlayer_re_ent9#293[__this := __msg_sender];
	jackpot_re_ent9#295 := jackpot_re_ent9#295[__this := __balance[__this]];
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_26.sol", 90, 3} {:message "_totalSupply"} _totalSupply#332: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 91, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#336: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_26.sol", 92, 1} {:message "UBBCToken::claimReward_re_ent25"} claimReward_re_ent25#372(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 95, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#349: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#336[__this][__msg_sender] > 0);
	transferValue_re_ent25#349 := redeemableEther_re_ent25#336[__this][__msg_sender];
	assume {:sourceloc "buggy_26.sol", 96, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#349);
	redeemableEther_re_ent25#336 := redeemableEther_re_ent25#336[__this := redeemableEther_re_ent25#336[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_26.sol", 99, 3} {:message "_name"} _name#374: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 100, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#378: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_26.sol", 101, 1} {:message "UBBCToken::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#407(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 104, 16} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, userBalance_re_ent19#378[__this][__msg_sender]);
	if (!(__send_ret#15)) {
	assume false;
	}

	userBalance_re_ent19#378 := userBalance_re_ent19#378[__this := userBalance_re_ent19#378[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_26.sol", 109, 3} {:message "_symbol"} _symbol#409: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 110, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#413: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_26.sol", 111, 1} {:message "UBBCToken::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#447(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 114, 3} {:message "success"} success#417: bool;
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#413[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#413[__this][__msg_sender])];
	assume {:sourceloc "buggy_26.sol", 114, 19} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(__msg_sender, __this, userBalance_re_ent26#413[__this][__msg_sender]);
	if (__call_ret#16) {
	havoc lastPlayer_re_ent37#206;
	havoc jackpot_re_ent37#208;
	havoc _balances#242;
	havoc balances_re_ent3#246;
	havoc _allowances#291;
	havoc lastPlayer_re_ent9#293;
	havoc jackpot_re_ent9#295;
	havoc _totalSupply#332;
	havoc redeemableEther_re_ent25#336;
	havoc _name#374;
	havoc userBalance_re_ent19#378;
	havoc _symbol#409;
	havoc userBalance_re_ent26#413;
	havoc _decimals#449;
	havoc not_called_re_ent20#478;
	havoc balances_re_ent31#509;
	havoc not_called_re_ent13#545;
	havoc redeemableEther_re_ent32#589;
	havoc balances_re_ent38#637;
	havoc redeemableEther_re_ent4#682;
	havoc counter_re_ent7#730;
	havoc lastPlayer_re_ent23#774;
	havoc jackpot_re_ent23#776;
	havoc counter_re_ent14#829;
	havoc lastPlayer_re_ent30#877;
	havoc jackpot_re_ent30#879;
	havoc balances_re_ent8#933;
	havoc redeemableEther_re_ent39#1002;
	havoc balances_re_ent36#1069;
	havoc counter_re_ent35#1122;
	havoc userBalance_re_ent40#1213;
	havoc userBalance_re_ent33#1295;
	havoc not_called_re_ent27#1339;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#413[__this][__msg_sender])];
	}

	success#417 := __call_ret#16;
	if (!(success#417)) {
	assume false;
	}

	userBalance_re_ent26#413 := userBalance_re_ent26#413[__this := userBalance_re_ent26#413[__this][__msg_sender := 0]];
	$return10:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_26.sol", 120, 3} {:message "_decimals"} _decimals#449: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
const unique address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 121, 5} {:message "UBBCToken::[constructor]"} __constructor#1367(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#206 := lastPlayer_re_ent37#206[__this := 0];
	jackpot_re_ent37#208 := jackpot_re_ent37#208[__this := 0];
	_balances#242 := _balances#242[__this := default_address_t_int()];
	balances_re_ent3#246 := balances_re_ent3#246[__this := default_address_t_int()];
	_allowances#291 := _allowances#291[__this := default_address_t__k_address_t_v_int()];
	lastPlayer_re_ent9#293 := lastPlayer_re_ent9#293[__this := 0];
	jackpot_re_ent9#295 := jackpot_re_ent9#295[__this := 0];
	_totalSupply#332 := _totalSupply#332[__this := 0];
	redeemableEther_re_ent25#336 := redeemableEther_re_ent25#336[__this := default_address_t_int()];
	_name#374 := _name#374[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent19#378 := userBalance_re_ent19#378[__this := default_address_t_int()];
	_symbol#409 := _symbol#409[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent26#413 := userBalance_re_ent26#413[__this := default_address_t_int()];
	_decimals#449 := _decimals#449[__this := 0];
	not_called_re_ent20#478 := not_called_re_ent20#478[__this := true];
	balances_re_ent31#509 := balances_re_ent31#509[__this := default_address_t_int()];
	not_called_re_ent13#545 := not_called_re_ent13#545[__this := true];
	redeemableEther_re_ent32#589 := redeemableEther_re_ent32#589[__this := default_address_t_int()];
	balances_re_ent38#637 := balances_re_ent38#637[__this := default_address_t_int()];
	redeemableEther_re_ent4#682 := redeemableEther_re_ent4#682[__this := default_address_t_int()];
	counter_re_ent7#730 := counter_re_ent7#730[__this := 0];
	lastPlayer_re_ent23#774 := lastPlayer_re_ent23#774[__this := 0];
	jackpot_re_ent23#776 := jackpot_re_ent23#776[__this := 0];
	counter_re_ent14#829 := counter_re_ent14#829[__this := 0];
	lastPlayer_re_ent30#877 := lastPlayer_re_ent30#877[__this := 0];
	jackpot_re_ent30#879 := jackpot_re_ent30#879[__this := 0];
	balances_re_ent8#933 := balances_re_ent8#933[__this := default_address_t_int()];
	redeemableEther_re_ent39#1002 := redeemableEther_re_ent39#1002[__this := default_address_t_int()];
	balances_re_ent36#1069 := balances_re_ent36#1069[__this := default_address_t_int()];
	counter_re_ent35#1122 := counter_re_ent35#1122[__this := 0];
	userBalance_re_ent40#1213 := userBalance_re_ent40#1213[__this := default_address_t_int()];
	userBalance_re_ent33#1295 := userBalance_re_ent33#1295[__this := default_address_t_int()];
	not_called_re_ent27#1339 := not_called_re_ent27#1339[__this := true];
	// Function body starts here
	_name#374 := _name#374[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67][4 := 32][5 := 84][6 := 111][7 := 107][8 := 101][9 := 110], 10)];
	_symbol#409 := _symbol#409[__this := int_arr#constr(default_int_int()[0 := 85][1 := 66][2 := 66][3 := 67], 4)];
	_decimals#449 := _decimals#449[__this := 18];
	_totalSupply#332 := _totalSupply#332[__this := 260000000000000000000000000];
	_balances#242 := _balances#242[__this := _balances#242[__this][address_0x0e475cd2c1f8222868cf85B4f97D7EB70fB3ffD3 := _totalSupply#332[__this]]];
	$return11:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_26.sol", 128, 1} {:message "not_called_re_ent20"} not_called_re_ent20#478: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_26.sol", 129, 1} {:message "UBBCToken::bug_re_ent20"} bug_re_ent20#505(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#478[__this];
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 131, 16} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	assume false;
	}

	not_called_re_ent20#478 := not_called_re_ent20#478[__this := false];
	$return12:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 136, 3} {:message "balances_re_ent31"} balances_re_ent31#509: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 137, 1} {:message "UBBCToken::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#542(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#511: int)
{
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#509[__this][__msg_sender] >= _weiToWithdraw#511);
	assume {:sourceloc "buggy_26.sol", 140, 13} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, _weiToWithdraw#511);
	assume __send_ret#20;
	balances_re_ent31#509 := balances_re_ent31#509[__this := balances_re_ent31#509[__this][__msg_sender := (balances_re_ent31#509[__this][__msg_sender] - _weiToWithdraw#511)]];
	$return13:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_26.sol", 143, 5} {:message "not_called_re_ent13"} not_called_re_ent13#545: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_26.sol", 144, 1} {:message "UBBCToken::bug_re_ent13"} bug_re_ent13#577(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 146, 3} {:message "success"} success#553: bool;
	var __call_ret#21: bool;
	var __call_ret#22: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#545[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_26.sol", 146, 18} {:message ""} true;
	call __call_ret#21, __call_ret#22 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#21) {
	havoc lastPlayer_re_ent37#206;
	havoc jackpot_re_ent37#208;
	havoc _balances#242;
	havoc balances_re_ent3#246;
	havoc _allowances#291;
	havoc lastPlayer_re_ent9#293;
	havoc jackpot_re_ent9#295;
	havoc _totalSupply#332;
	havoc redeemableEther_re_ent25#336;
	havoc _name#374;
	havoc userBalance_re_ent19#378;
	havoc _symbol#409;
	havoc userBalance_re_ent26#413;
	havoc _decimals#449;
	havoc not_called_re_ent20#478;
	havoc balances_re_ent31#509;
	havoc not_called_re_ent13#545;
	havoc redeemableEther_re_ent32#589;
	havoc balances_re_ent38#637;
	havoc redeemableEther_re_ent4#682;
	havoc counter_re_ent7#730;
	havoc lastPlayer_re_ent23#774;
	havoc jackpot_re_ent23#776;
	havoc counter_re_ent14#829;
	havoc lastPlayer_re_ent30#877;
	havoc jackpot_re_ent30#879;
	havoc balances_re_ent8#933;
	havoc redeemableEther_re_ent39#1002;
	havoc balances_re_ent36#1069;
	havoc counter_re_ent35#1122;
	havoc userBalance_re_ent40#1213;
	havoc userBalance_re_ent33#1295;
	havoc not_called_re_ent27#1339;
	havoc __balance;
	}

	if (!(__call_ret#21)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#553 := __call_ret#21;
	if (!(success#553)) {
	assume false;
	}

	not_called_re_ent13#545 := not_called_re_ent13#545[__this := false];
	$return14:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 152, 5} {:message "UBBCToken::name"} name#585(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#580: int_arr_ptr)
{
	var new_array#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#23 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#580 := new_array#23;
	mem_arr_int := mem_arr_int[#580 := _name#374[__this]];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 155, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#589: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_26.sol", 156, 1} {:message "UBBCToken::claimReward_re_ent32"} claimReward_re_ent32#625(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 159, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#602: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#589[__this][__msg_sender] > 0);
	transferValue_re_ent32#602 := redeemableEther_re_ent32#589[__this][__msg_sender];
	assume {:sourceloc "buggy_26.sol", 160, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#602);
	redeemableEther_re_ent32#589 := redeemableEther_re_ent32#589[__this := redeemableEther_re_ent32#589[__this][__msg_sender := 0]];
	$return16:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_26.sol", 164, 5} {:message "UBBCToken::symbol"} symbol#633(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#628: int_arr_ptr)
{
	var new_array#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#24 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#628 := new_array#24;
	mem_arr_int := mem_arr_int[#628 := _symbol#409[__this]];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 167, 1} {:message "balances_re_ent38"} balances_re_ent38#637: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_26.sol", 168, 1} {:message "UBBCToken::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#670(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#639: int)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#637[__this][__msg_sender] >= _weiToWithdraw#639);
	assume {:sourceloc "buggy_26.sol", 171, 13} {:message ""} true;
	call __send_ret#25 := __send(__msg_sender, __this, 0, _weiToWithdraw#639);
	assume __send_ret#25;
	balances_re_ent38#637 := balances_re_ent38#637[__this := balances_re_ent38#637[__this][__msg_sender := (balances_re_ent38#637[__this][__msg_sender] - _weiToWithdraw#639)]];
	$return18:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_26.sol", 174, 5} {:message "UBBCToken::decimals"} decimals#678(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#673: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#673 := _decimals#449[__this];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 177, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#682: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_26.sol", 178, 1} {:message "UBBCToken::claimReward_re_ent4"} claimReward_re_ent4#718(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 181, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#695: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#682[__this][__msg_sender] > 0);
	transferValue_re_ent4#695 := redeemableEther_re_ent4#682[__this][__msg_sender];
	assume {:sourceloc "buggy_26.sol", 182, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#695);
	redeemableEther_re_ent4#682 := redeemableEther_re_ent4#682[__this := redeemableEther_re_ent4#682[__this][__msg_sender := 0]];
	$return20:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 186, 5} {:message "UBBCToken::totalSupply"} totalSupply#727(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#722: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#722 := _totalSupply#332[__this];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_26.sol", 189, 1} {:message "counter_re_ent7"} counter_re_ent7#730: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_26.sol", 190, 1} {:message "UBBCToken::callme_re_ent7"} callme_re_ent7#759(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#730[__this] <= 5);
	call_arg#26 := 10000000000000000000;
	assume {:sourceloc "buggy_26.sol", 192, 9} {:message ""} true;
	call __send_ret#27 := __send(__msg_sender, __this, 0, call_arg#26);
	if (!(__send_ret#27)) {
	assume false;
	}

	counter_re_ent7#730 := counter_re_ent7#730[__this := (counter_re_ent7#730[__this] + 1)];
	$return22:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 198, 5} {:message "UBBCToken::balanceOf"} balanceOf#772(__this: address_t, __msg_sender: address_t, __msg_value: int, account#761: address_t)
	returns (#765: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#765 := _balances#242[__this][account#761];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_26.sol", 201, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#774: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_26.sol", 202, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#776: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_26.sol", 203, 4} {:message "UBBCToken::buyTicket_re_ent23"} buyTicket_re_ent23#806(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 204, 12} {:message ""} true;
	call __send_ret#28 := __send(lastPlayer_re_ent23#774[__this], __this, 0, jackpot_re_ent23#776[__this]);
	if (!(__send_ret#28)) {
	assume false;
	}

	lastPlayer_re_ent23#774 := lastPlayer_re_ent23#774[__this := __msg_sender];
	jackpot_re_ent23#776 := jackpot_re_ent23#776[__this := __balance[__this]];
	$return24:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 210, 6} {:message "UBBCToken::transfer"} transfer#826(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#808: address_t, amount#810: int)
	returns (#814: bool)
{
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 211, 10} {:message ""} true;
	call _transfer#1209(__this, __msg_sender, __msg_value, call_arg#29, recipient#808, amount#810);
	#814 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_26.sol", 214, 1} {:message "counter_re_ent14"} counter_re_ent14#829: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_26.sol", 215, 1} {:message "UBBCToken::callme_re_ent14"} callme_re_ent14#858(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#829[__this] <= 5);
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_26.sol", 217, 9} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	counter_re_ent14#829 := counter_re_ent14#829[__this := (counter_re_ent14#829[__this] + 1)];
	$return26:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_26.sol", 223, 5} {:message "UBBCToken::allowance"} allowance#875(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#860: address_t, spender#862: address_t)
	returns (#866: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#866 := _allowances#291[__this][owner#860][spender#862];
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_26.sol", 226, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#877: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_26.sol", 227, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#879: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_26.sol", 228, 4} {:message "UBBCToken::buyTicket_re_ent30"} buyTicket_re_ent30#909(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 229, 12} {:message ""} true;
	call __send_ret#32 := __send(lastPlayer_re_ent30#877[__this], __this, 0, jackpot_re_ent30#879[__this]);
	if (!(__send_ret#32)) {
	assume false;
	}

	lastPlayer_re_ent30#877 := lastPlayer_re_ent30#877[__this := __msg_sender];
	jackpot_re_ent30#879 := jackpot_re_ent30#879[__this := __balance[__this]];
	$return28:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 235, 5} {:message "UBBCToken::approve"} approve#929(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#911: address_t, value#913: int)
	returns (#917: bool)
{
	var call_arg#33: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#33 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 236, 9} {:message ""} true;
	call _approve#1291(__this, __msg_sender, __msg_value, call_arg#33, spender#911, value#913);
	#917 := true;
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 239, 1} {:message "balances_re_ent8"} balances_re_ent8#933: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_26.sol", 240, 5} {:message "UBBCToken::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#962(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 241, 11} {:message "success"} success#937: bool;
	var __call_ret#34: bool;
	var __call_ret#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#933[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#933[__this][__msg_sender])];
	assume {:sourceloc "buggy_26.sol", 241, 28} {:message ""} true;
	call __call_ret#34, __call_ret#35 := __call(__msg_sender, __this, balances_re_ent8#933[__this][__msg_sender]);
	if (__call_ret#34) {
	havoc lastPlayer_re_ent37#206;
	havoc jackpot_re_ent37#208;
	havoc _balances#242;
	havoc balances_re_ent3#246;
	havoc _allowances#291;
	havoc lastPlayer_re_ent9#293;
	havoc jackpot_re_ent9#295;
	havoc _totalSupply#332;
	havoc redeemableEther_re_ent25#336;
	havoc _name#374;
	havoc userBalance_re_ent19#378;
	havoc _symbol#409;
	havoc userBalance_re_ent26#413;
	havoc _decimals#449;
	havoc not_called_re_ent20#478;
	havoc balances_re_ent31#509;
	havoc not_called_re_ent13#545;
	havoc redeemableEther_re_ent32#589;
	havoc balances_re_ent38#637;
	havoc redeemableEther_re_ent4#682;
	havoc counter_re_ent7#730;
	havoc lastPlayer_re_ent23#774;
	havoc jackpot_re_ent23#776;
	havoc counter_re_ent14#829;
	havoc lastPlayer_re_ent30#877;
	havoc jackpot_re_ent30#879;
	havoc balances_re_ent8#933;
	havoc redeemableEther_re_ent39#1002;
	havoc balances_re_ent36#1069;
	havoc counter_re_ent35#1122;
	havoc userBalance_re_ent40#1213;
	havoc userBalance_re_ent33#1295;
	havoc not_called_re_ent27#1339;
	havoc __balance;
	}

	if (!(__call_ret#34)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#933[__this][__msg_sender])];
	}

	success#937 := __call_ret#34;
	if (success#937) {
	balances_re_ent8#933 := balances_re_ent8#933[__this := balances_re_ent8#933[__this][__msg_sender := 0]];
	}

	$return30:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 246, 5} {:message "UBBCToken::transferFrom"} transferFrom#998(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#964: address_t, recipient#966: address_t, amount#968: int)
	returns (#972: bool)
{
	var call_arg#36: address_t;
	var sub#51_ret#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 247, 9} {:message ""} true;
	call _transfer#1209(__this, __msg_sender, __msg_value, sender#964, recipient#966, amount#968);
	call_arg#36 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 248, 38} {:message ""} true;
	call sub#51_ret#37 := sub#51(__this, __msg_sender, __msg_value, _allowances#291[__this][sender#964][__msg_sender], amount#968);
	assume {:sourceloc "buggy_26.sol", 248, 9} {:message ""} true;
	call _approve#1291(__this, __msg_sender, __msg_value, sender#964, call_arg#36, sub#51_ret#37);
	#972 := true;
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 251, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1002: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_26.sol", 252, 1} {:message "UBBCToken::claimReward_re_ent39"} claimReward_re_ent39#1038(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 255, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1015: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1002[__this][__msg_sender] > 0);
	transferValue_re_ent39#1015 := redeemableEther_re_ent39#1002[__this][__msg_sender];
	assume {:sourceloc "buggy_26.sol", 256, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1015);
	redeemableEther_re_ent39#1002 := redeemableEther_re_ent39#1002[__this := redeemableEther_re_ent39#1002[__this][__msg_sender := 0]];
	$return32:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 260, 5} {:message "UBBCToken::increaseAllowance"} increaseAllowance#1065(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1040: address_t, addedValue#1042: int)
	returns (#1045: bool)
{
	var call_arg#38: address_t;
	var add#26_ret#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 261, 39} {:message ""} true;
	call add#26_ret#39 := add#26(__this, __msg_sender, __msg_value, _allowances#291[__this][__msg_sender][spender#1040], addedValue#1042);
	assume {:sourceloc "buggy_26.sol", 261, 9} {:message ""} true;
	call _approve#1291(__this, __msg_sender, __msg_value, call_arg#38, spender#1040, add#26_ret#39);
	#1045 := true;
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 264, 1} {:message "balances_re_ent36"} balances_re_ent36#1069: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_26.sol", 265, 5} {:message "UBBCToken::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1092(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_26.sol", 266, 14} {:message ""} true;
	call __send_ret#40 := __send(__msg_sender, __this, 0, balances_re_ent36#1069[__this][__msg_sender]);
	if (__send_ret#40) {
	balances_re_ent36#1069 := balances_re_ent36#1069[__this := balances_re_ent36#1069[__this][__msg_sender := 0]];
	}

	$return34:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_26.sol", 270, 5} {:message "UBBCToken::decreaseAllowance"} decreaseAllowance#1119(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1094: address_t, subtractedValue#1096: int)
	returns (#1099: bool)
{
	var call_arg#41: address_t;
	var sub#51_ret#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#41 := __msg_sender;
	assume {:sourceloc "buggy_26.sol", 271, 39} {:message ""} true;
	call sub#51_ret#42 := sub#51(__this, __msg_sender, __msg_value, _allowances#291[__this][__msg_sender][spender#1094], subtractedValue#1096);
	assume {:sourceloc "buggy_26.sol", 271, 9} {:message ""} true;
	call _approve#1291(__this, __msg_sender, __msg_value, call_arg#41, spender#1094, sub#51_ret#42);
	#1099 := true;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_26.sol", 274, 1} {:message "counter_re_ent35"} counter_re_ent35#1122: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_26.sol", 275, 1} {:message "UBBCToken::callme_re_ent35"} callme_re_ent35#1151(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1122[__this] <= 5);
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_26.sol", 277, 9} {:message ""} true;
	call __send_ret#44 := __send(__msg_sender, __this, 0, call_arg#43);
	if (!(__send_ret#44)) {
	assume false;
	}

	counter_re_ent35#1122 := counter_re_ent35#1122[__this := (counter_re_ent35#1122[__this] + 1)];
	$return36:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 283, 5} {:message "UBBCToken::_transfer"} _transfer#1209(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#1153: address_t, recipient#1155: address_t, amount#1157: int)
{
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	var call_arg#47: int_arr_ptr;
	var new_array#48: int_arr_ptr;
	var sub#51_ret#49: int;
	var add#26_ret#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#1153 != 0);
	new_array#48 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#47 := new_array#48;
	mem_arr_int := mem_arr_int[call_arg#47 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#1155 != 0);
	assume {:sourceloc "buggy_26.sol", 287, 29} {:message ""} true;
	call sub#51_ret#49 := sub#51(__this, __msg_sender, __msg_value, _balances#242[__this][sender#1153], amount#1157);
	_balances#242 := _balances#242[__this := _balances#242[__this][sender#1153 := sub#51_ret#49]];
	assume {:sourceloc "buggy_26.sol", 288, 32} {:message ""} true;
	call add#26_ret#50 := add#26(__this, __msg_sender, __msg_value, _balances#242[__this][recipient#1155], amount#1157);
	_balances#242 := _balances#242[__this := _balances#242[__this][recipient#1155 := add#26_ret#50]];
	assume {:sourceloc "buggy_26.sol", 289, 14} {:message ""} true;
	call Transfer#190(__this, __msg_sender, __msg_value, sender#1153, recipient#1155, amount#1157);
	$return37:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 291, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1213: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_26.sol", 292, 1} {:message "UBBCToken::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1247(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 295, 3} {:message "success"} success#1217: bool;
	var __call_ret#51: bool;
	var __call_ret#52: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1213[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1213[__this][__msg_sender])];
	assume {:sourceloc "buggy_26.sol", 295, 18} {:message ""} true;
	call __call_ret#51, __call_ret#52 := __call(__msg_sender, __this, userBalance_re_ent40#1213[__this][__msg_sender]);
	if (__call_ret#51) {
	havoc lastPlayer_re_ent37#206;
	havoc jackpot_re_ent37#208;
	havoc _balances#242;
	havoc balances_re_ent3#246;
	havoc _allowances#291;
	havoc lastPlayer_re_ent9#293;
	havoc jackpot_re_ent9#295;
	havoc _totalSupply#332;
	havoc redeemableEther_re_ent25#336;
	havoc _name#374;
	havoc userBalance_re_ent19#378;
	havoc _symbol#409;
	havoc userBalance_re_ent26#413;
	havoc _decimals#449;
	havoc not_called_re_ent20#478;
	havoc balances_re_ent31#509;
	havoc not_called_re_ent13#545;
	havoc redeemableEther_re_ent32#589;
	havoc balances_re_ent38#637;
	havoc redeemableEther_re_ent4#682;
	havoc counter_re_ent7#730;
	havoc lastPlayer_re_ent23#774;
	havoc jackpot_re_ent23#776;
	havoc counter_re_ent14#829;
	havoc lastPlayer_re_ent30#877;
	havoc jackpot_re_ent30#879;
	havoc balances_re_ent8#933;
	havoc redeemableEther_re_ent39#1002;
	havoc balances_re_ent36#1069;
	havoc counter_re_ent35#1122;
	havoc userBalance_re_ent40#1213;
	havoc userBalance_re_ent33#1295;
	havoc not_called_re_ent27#1339;
	havoc __balance;
	}

	if (!(__call_ret#51)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1213[__this][__msg_sender])];
	}

	success#1217 := __call_ret#51;
	if (!(success#1217)) {
	assume false;
	}

	userBalance_re_ent40#1213 := userBalance_re_ent40#1213[__this := userBalance_re_ent40#1213[__this][__msg_sender := 0]];
	$return38:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_26.sol", 302, 5} {:message "UBBCToken::_approve"} _approve#1291(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1249: address_t, spender#1251: address_t, value#1253: int)
{
	var call_arg#53: int_arr_ptr;
	var new_array#54: int_arr_ptr;
	var call_arg#55: int_arr_ptr;
	var new_array#56: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#54 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#53 := new_array#54;
	mem_arr_int := mem_arr_int[call_arg#53 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#1249 != 0);
	new_array#56 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#55 := new_array#56;
	mem_arr_int := mem_arr_int[call_arg#55 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#1251 != 0);
	_allowances#291 := _allowances#291[__this := _allowances#291[__this][owner#1249 := _allowances#291[__this][owner#1249][spender#1251 := value#1253]]];
	assume {:sourceloc "buggy_26.sol", 306, 14} {:message ""} true;
	call Approval#198(__this, __msg_sender, __msg_value, owner#1249, spender#1251, value#1253);
	$return39:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_26.sol", 308, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1295: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_26.sol", 309, 1} {:message "UBBCToken::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1329(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_26.sol", 312, 3} {:message "success"} success#1299: bool;
	var __call_ret#57: bool;
	var __call_ret#58: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1295[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1295[__this][__msg_sender])];
	assume {:sourceloc "buggy_26.sol", 312, 19} {:message ""} true;
	call __call_ret#57, __call_ret#58 := __call(__msg_sender, __this, userBalance_re_ent33#1295[__this][__msg_sender]);
	if (__call_ret#57) {
	havoc lastPlayer_re_ent37#206;
	havoc jackpot_re_ent37#208;
	havoc _balances#242;
	havoc balances_re_ent3#246;
	havoc _allowances#291;
	havoc lastPlayer_re_ent9#293;
	havoc jackpot_re_ent9#295;
	havoc _totalSupply#332;
	havoc redeemableEther_re_ent25#336;
	havoc _name#374;
	havoc userBalance_re_ent19#378;
	havoc _symbol#409;
	havoc userBalance_re_ent26#413;
	havoc _decimals#449;
	havoc not_called_re_ent20#478;
	havoc balances_re_ent31#509;
	havoc not_called_re_ent13#545;
	havoc redeemableEther_re_ent32#589;
	havoc balances_re_ent38#637;
	havoc redeemableEther_re_ent4#682;
	havoc counter_re_ent7#730;
	havoc lastPlayer_re_ent23#774;
	havoc jackpot_re_ent23#776;
	havoc counter_re_ent14#829;
	havoc lastPlayer_re_ent30#877;
	havoc jackpot_re_ent30#879;
	havoc balances_re_ent8#933;
	havoc redeemableEther_re_ent39#1002;
	havoc balances_re_ent36#1069;
	havoc counter_re_ent35#1122;
	havoc userBalance_re_ent40#1213;
	havoc userBalance_re_ent33#1295;
	havoc not_called_re_ent27#1339;
	havoc __balance;
	}

	if (!(__call_ret#57)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1295[__this][__msg_sender])];
	}

	success#1299 := __call_ret#57;
	if (!(success#1299)) {
	assume false;
	}

	userBalance_re_ent33#1295 := userBalance_re_ent33#1295[__this := userBalance_re_ent33#1295[__this][__msg_sender := 0]];
	$return40:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_26.sol", 318, 5} {:message "UBBCToken::[receive]"} #1336(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return41:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_26.sol", 321, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1339: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_26.sol", 322, 1} {:message "UBBCToken::bug_re_ent27"} bug_re_ent27#1366(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int;
	var __send_ret#60: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1339[__this];
	call_arg#59 := 1000000000000000000;
	assume {:sourceloc "buggy_26.sol", 324, 16} {:message ""} true;
	call __send_ret#60 := __send(__msg_sender, __this, 0, call_arg#59);
	if (!(__send_ret#60)) {
	assume false;
	}

	not_called_re_ent27#1339 := not_called_re_ent27#1339[__this := false];
	$return42:
	// Function body ends here
}

