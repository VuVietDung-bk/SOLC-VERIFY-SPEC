// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_40.sol -------
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
procedure {:inline 1} {:sourceloc "buggy_40.sol", 30, 5} {:message "SafeMath::add"} add#28(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var {:sourceloc "buggy_40.sol", 31, 9} {:message "c"} c#13: int;
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#13 := (a#5 + b#7);
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#13 >= a#5);
	#10 := c#13;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 46, 5} {:message "SafeMath::sub"} sub#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#31: int, b#33: int)
	returns (#36: int)
{
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var {:sourceloc "buggy_40.sol", 48, 9} {:message "c"} c#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#33 <= a#31);
	c#46 := (a#31 - b#33);
	#36 := c#46;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 62, 5} {:message "SafeMath::mul"} mul#89(__this: address_t, __msg_sender: address_t, __msg_value: int, a#57: int, b#59: int)
	returns (#62: int)
{
	var {:sourceloc "buggy_40.sol", 70, 9} {:message "c"} c#72: int;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#57 == 0)) {
	#62 := 0;
	goto $return2;
	}

	c#72 := (a#57 * b#59);
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#72 div a#57) == b#59);
	#62 := c#72;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 87, 5} {:message "SafeMath::div"} div#115(__this: address_t, __msg_sender: address_t, __msg_value: int, a#92: int, b#94: int)
	returns (#97: int)
{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	var {:sourceloc "buggy_40.sol", 90, 9} {:message "c"} c#107: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#94 > 0);
	c#107 := (a#92 div b#94);
	#97 := c#107;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 107, 5} {:message "SafeMath::mod"} mod#137(__this: address_t, __msg_sender: address_t, __msg_value: int, a#118: int, b#120: int)
	returns (#123: int)
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
	assume (b#120 != 0);
	#123 := (a#118 mod b#120);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_40.sol", 20, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#138(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_40.sol", 180, 5} {:message "[event] IERC20::Transfer"} Transfer#204(__this: address_t, __msg_sender: address_t, __msg_value: int, from#198: address_t, to#200: address_t, value#202: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_40.sol", 186, 5} {:message "[event] IERC20::Approval"} Approval#213(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#207: address_t, spender#209: address_t, value#211: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_40.sol", 122, 5} {:message "IERC20::totalSupply"} totalSupply#145(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#143: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_40.sol", 127, 5} {:message "IERC20::balanceOf"} balanceOf#153(__this: address_t, __msg_sender: address_t, __msg_value: int, account#148: address_t)
	returns (#151: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_40.sol", 136, 5} {:message "IERC20::transfer"} transfer#163(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#156: address_t, amount#158: int)
	returns (#161: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_40.sol", 145, 5} {:message "IERC20::allowance"} allowance#173(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#166: address_t, spender#168: address_t)
	returns (#171: int);

// 
// Function: approve
procedure {:sourceloc "buggy_40.sol", 161, 5} {:message "IERC20::approve"} approve#183(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#176: address_t, amount#178: int)
	returns (#181: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_40.sol", 172, 5} {:message "IERC20::transferFrom"} transferFrom#195(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#186: address_t, recipient#188: address_t, amount#190: int)
	returns (#193: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_40.sol", 118, 1} {:message "IERC20::[implicit_constructor]"} __constructor#214(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Using library SafeMath for uint256
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 216, 3} {:message "balances_re_ent17"} balances_re_ent17#224: [address_t][address_t]int;
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
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 217, 1} {:message "ERC20::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#263(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#226: int)
{
	var {:sourceloc "buggy_40.sol", 220, 6} {:message "success"} success#239: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#224[__this][__msg_sender] >= _weiToWithdraw#226);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#226);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#226)];
	assume {:sourceloc "buggy_40.sol", 220, 23} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(__msg_sender, __this, _weiToWithdraw#226);
	if (__call_ret#10) {
	havoc balances_re_ent17#224;
	havoc _balances#267;
	havoc lastPlayer_re_ent37#269;
	havoc jackpot_re_ent37#271;
	havoc _allowances#307;
	havoc balances_re_ent3#311;
	havoc _totalSupply#352;
	havoc userBalance_re_ent26#366;
	havoc not_called_re_ent20#417;
	havoc redeemableEther_re_ent32#469;
	havoc balances_re_ent38#527;
	havoc redeemableEther_re_ent4#585;
	havoc counter_re_ent7#661;
	havoc lastPlayer_re_ent23#720;
	havoc jackpot_re_ent23#722;
	havoc counter_re_ent14#783;
	havoc lastPlayer_re_ent30#873;
	havoc jackpot_re_ent30#875;
	havoc balances_re_ent8#955;
	havoc redeemableEther_re_ent39#1034;
	havoc balances_re_ent36#1119;
	havoc counter_re_ent35#1174;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#226)];
	}

	success#239 := __call_ret#10;
	assume success#239;
	balances_re_ent17#224 := balances_re_ent17#224[__this := balances_re_ent17#224[__this][__msg_sender := (balances_re_ent17#224[__this][__msg_sender] - _weiToWithdraw#226)]];
	$return5:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 224, 3} {:message "_balances"} _balances#267: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_40.sol", 226, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#269: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_40.sol", 227, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#271: [address_t]int;
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
procedure {:sourceloc "buggy_40.sol", 228, 4} {:message "ERC20::buyTicket_re_ent37"} buyTicket_re_ent37#301(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 229, 12} {:message ""} true;
	call __send_ret#12 := __send(lastPlayer_re_ent37#269[__this], __this, 0, jackpot_re_ent37#271[__this]);
	if (!(__send_ret#12)) {
	assume false;
	}

	lastPlayer_re_ent37#269 := lastPlayer_re_ent37#269[__this := __msg_sender];
	jackpot_re_ent37#271 := jackpot_re_ent37#271[__this := __balance[__this]];
	$return6:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_40.sol", 234, 3} {:message "_allowances"} _allowances#307: [address_t][address_t][address_t]int;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 236, 3} {:message "balances_re_ent3"} balances_re_ent3#311: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 237, 1} {:message "ERC20::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#350(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#313: int)
{
	var {:sourceloc "buggy_40.sol", 240, 3} {:message "success"} success#326: bool;
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#311[__this][__msg_sender] >= _weiToWithdraw#313);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#313);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#313)];
	assume {:sourceloc "buggy_40.sol", 240, 20} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(__msg_sender, __this, _weiToWithdraw#313);
	if (__call_ret#13) {
	havoc balances_re_ent17#224;
	havoc _balances#267;
	havoc lastPlayer_re_ent37#269;
	havoc jackpot_re_ent37#271;
	havoc _allowances#307;
	havoc balances_re_ent3#311;
	havoc _totalSupply#352;
	havoc userBalance_re_ent26#366;
	havoc not_called_re_ent20#417;
	havoc redeemableEther_re_ent32#469;
	havoc balances_re_ent38#527;
	havoc redeemableEther_re_ent4#585;
	havoc counter_re_ent7#661;
	havoc lastPlayer_re_ent23#720;
	havoc jackpot_re_ent23#722;
	havoc counter_re_ent14#783;
	havoc lastPlayer_re_ent30#873;
	havoc jackpot_re_ent30#875;
	havoc balances_re_ent8#955;
	havoc redeemableEther_re_ent39#1034;
	havoc balances_re_ent36#1119;
	havoc counter_re_ent35#1174;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#313)];
	}

	success#326 := __call_ret#13;
	assume success#326;
	balances_re_ent3#311 := balances_re_ent3#311[__this := balances_re_ent3#311[__this][__msg_sender := (balances_re_ent3#311[__this][__msg_sender] - _weiToWithdraw#313)]];
	$return7:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_40.sol", 244, 3} {:message "_totalSupply"} _totalSupply#352: [address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 249, 5} {:message "ERC20::totalSupply"} totalSupply#362(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#357: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#357 := _totalSupply#352[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 252, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#366: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_40.sol", 253, 1} {:message "ERC20::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#400(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 256, 6} {:message "success"} success#370: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#366[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#366[__this][__msg_sender])];
	assume {:sourceloc "buggy_40.sol", 256, 23} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, userBalance_re_ent26#366[__this][__msg_sender]);
	if (__call_ret#15) {
	havoc balances_re_ent17#224;
	havoc _balances#267;
	havoc lastPlayer_re_ent37#269;
	havoc jackpot_re_ent37#271;
	havoc _allowances#307;
	havoc balances_re_ent3#311;
	havoc _totalSupply#352;
	havoc userBalance_re_ent26#366;
	havoc not_called_re_ent20#417;
	havoc redeemableEther_re_ent32#469;
	havoc balances_re_ent38#527;
	havoc redeemableEther_re_ent4#585;
	havoc counter_re_ent7#661;
	havoc lastPlayer_re_ent23#720;
	havoc jackpot_re_ent23#722;
	havoc counter_re_ent14#783;
	havoc lastPlayer_re_ent30#873;
	havoc jackpot_re_ent30#875;
	havoc balances_re_ent8#955;
	havoc redeemableEther_re_ent39#1034;
	havoc balances_re_ent36#1119;
	havoc counter_re_ent35#1174;
	havoc __balance;
	}

	if (!(__call_ret#15)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#366[__this][__msg_sender])];
	}

	success#370 := __call_ret#15;
	if (!(success#370)) {
	assume false;
	}

	userBalance_re_ent26#366 := userBalance_re_ent26#366[__this := userBalance_re_ent26#366[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 266, 5} {:message "ERC20::balanceOf"} balanceOf#414(__this: address_t, __msg_sender: address_t, __msg_value: int, account#403: address_t)
	returns (#407: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#407 := _balances#267[__this][account#403];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_40.sol", 269, 1} {:message "not_called_re_ent20"} not_called_re_ent20#417: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_40.sol", 270, 1} {:message "ERC20::bug_re_ent20"} bug_re_ent20#444(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#417[__this];
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 272, 12} {:message ""} true;
	call __send_ret#18 := __send(__msg_sender, __this, 0, call_arg#17);
	if (!(__send_ret#18)) {
	assume false;
	}

	not_called_re_ent20#417 := not_called_re_ent20#417[__this := false];
	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 286, 5} {:message "ERC20::transfer"} transfer#465(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#447: address_t, amount#449: int)
	returns (#453: bool)
{
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 287, 9} {:message ""} true;
	call _transfer#871(__this, __msg_sender, __msg_value, call_arg#19, recipient#447, amount#449);
	#453 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 290, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#469: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_40.sol", 291, 1} {:message "ERC20::claimReward_re_ent32"} claimReward_re_ent32#505(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 294, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#482: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#469[__this][__msg_sender] > 0);
	transferValue_re_ent32#482 := redeemableEther_re_ent32#469[__this][__msg_sender];
	assume {:sourceloc "buggy_40.sol", 295, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#482);
	redeemableEther_re_ent32#469 := redeemableEther_re_ent32#469[__this := redeemableEther_re_ent32#469[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_40.sol", 302, 5} {:message "ERC20::allowance"} allowance#523(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#508: address_t, spender#510: address_t)
	returns (#514: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#514 := _allowances#307[__this][owner#508][spender#510];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 305, 1} {:message "balances_re_ent38"} balances_re_ent38#527: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 306, 1} {:message "ERC20::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#560(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#529: int)
{
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#527[__this][__msg_sender] >= _weiToWithdraw#529);
	assume {:sourceloc "buggy_40.sol", 309, 13} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, _weiToWithdraw#529);
	assume __send_ret#20;
	balances_re_ent38#527 := balances_re_ent38#527[__this := balances_re_ent38#527[__this][__msg_sender := (balances_re_ent38#527[__this][__msg_sender] - _weiToWithdraw#529)]];
	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 320, 5} {:message "ERC20::approve"} approve#581(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#563: address_t, value#565: int)
	returns (#569: bool)
{
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 321, 9} {:message ""} true;
	call _approve#1115(__this, __msg_sender, __msg_value, call_arg#21, spender#563, value#565);
	#569 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 324, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#585: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_40.sol", 325, 1} {:message "ERC20::claimReward_re_ent4"} claimReward_re_ent4#621(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 328, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#598: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#585[__this][__msg_sender] > 0);
	transferValue_re_ent4#598 := redeemableEther_re_ent4#585[__this][__msg_sender];
	assume {:sourceloc "buggy_40.sol", 329, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#598);
	redeemableEther_re_ent4#585 := redeemableEther_re_ent4#585[__this := redeemableEther_re_ent4#585[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 345, 5} {:message "ERC20::transferFrom"} transferFrom#658(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#624: address_t, recipient#626: address_t, amount#628: int)
	returns (#632: bool)
{
	var call_arg#22: address_t;
	var sub#54_ret#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 346, 9} {:message ""} true;
	call _transfer#871(__this, __msg_sender, __msg_value, sender#624, recipient#626, amount#628);
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 347, 38} {:message ""} true;
	call sub#54_ret#23 := sub#54(__this, __msg_sender, __msg_value, _allowances#307[__this][sender#624][__msg_sender], amount#628);
	assume {:sourceloc "buggy_40.sol", 347, 9} {:message ""} true;
	call _approve#1115(__this, __msg_sender, __msg_value, sender#624, call_arg#22, sub#54_ret#23);
	#632 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_40.sol", 350, 1} {:message "counter_re_ent7"} counter_re_ent7#661: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_40.sol", 351, 1} {:message "ERC20::callme_re_ent7"} callme_re_ent7#690(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#661[__this] <= 5);
	call_arg#24 := 10000000000000000000;
	assume {:sourceloc "buggy_40.sol", 353, 9} {:message ""} true;
	call __send_ret#25 := __send(__msg_sender, __this, 0, call_arg#24);
	if (!(__send_ret#25)) {
	assume false;
	}

	counter_re_ent7#661 := counter_re_ent7#661[__this := (counter_re_ent7#661[__this] + 1)];
	$return19:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 371, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#718(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#693: address_t, addedValue#695: int)
	returns (#698: bool)
{
	var call_arg#26: address_t;
	var add#28_ret#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 372, 39} {:message ""} true;
	call add#28_ret#27 := add#28(__this, __msg_sender, __msg_value, _allowances#307[__this][__msg_sender][spender#693], addedValue#695);
	assume {:sourceloc "buggy_40.sol", 372, 9} {:message ""} true;
	call _approve#1115(__this, __msg_sender, __msg_value, call_arg#26, spender#693, add#28_ret#27);
	#698 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_40.sol", 375, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#720: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_40.sol", 376, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#722: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_40.sol", 377, 4} {:message "ERC20::buyTicket_re_ent23"} buyTicket_re_ent23#752(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 378, 12} {:message ""} true;
	call __send_ret#28 := __send(lastPlayer_re_ent23#720[__this], __this, 0, jackpot_re_ent23#722[__this]);
	if (!(__send_ret#28)) {
	assume false;
	}

	lastPlayer_re_ent23#720 := lastPlayer_re_ent23#720[__this := __msg_sender];
	jackpot_re_ent23#722 := jackpot_re_ent23#722[__this := __balance[__this]];
	$return21:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_40.sol", 398, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#780(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#755: address_t, subtractedValue#757: int)
	returns (#760: bool)
{
	var call_arg#29: address_t;
	var sub#54_ret#30: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 399, 39} {:message ""} true;
	call sub#54_ret#30 := sub#54(__this, __msg_sender, __msg_value, _allowances#307[__this][__msg_sender][spender#755], subtractedValue#757);
	assume {:sourceloc "buggy_40.sol", 399, 9} {:message ""} true;
	call _approve#1115(__this, __msg_sender, __msg_value, call_arg#29, spender#755, sub#54_ret#30);
	#760 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_40.sol", 402, 1} {:message "counter_re_ent14"} counter_re_ent14#783: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_40.sol", 403, 1} {:message "ERC20::callme_re_ent14"} callme_re_ent14#812(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#783[__this] <= 5);
	call_arg#31 := 10000000000000000000;
	assume {:sourceloc "buggy_40.sol", 405, 9} {:message ""} true;
	call __send_ret#32 := __send(__msg_sender, __this, 0, call_arg#31);
	if (!(__send_ret#32)) {
	assume false;
	}

	counter_re_ent14#783 := counter_re_ent14#783[__this := (counter_re_ent14#783[__this] + 1)];
	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 425, 5} {:message "ERC20::_transfer"} _transfer#871(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#815: address_t, recipient#817: address_t, amount#819: int)
{
	var call_arg#33: int_arr_ptr;
	var new_array#34: int_arr_ptr;
	var call_arg#35: int_arr_ptr;
	var new_array#36: int_arr_ptr;
	var sub#54_ret#37: int;
	var add#28_ret#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#33 := new_array#34;
	mem_arr_int := mem_arr_int[call_arg#33 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#815 != 0);
	new_array#36 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#35 := new_array#36;
	mem_arr_int := mem_arr_int[call_arg#35 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#817 != 0);
	assume {:sourceloc "buggy_40.sol", 429, 29} {:message ""} true;
	call sub#54_ret#37 := sub#54(__this, __msg_sender, __msg_value, _balances#267[__this][sender#815], amount#819);
	_balances#267 := _balances#267[__this := _balances#267[__this][sender#815 := sub#54_ret#37]];
	assume {:sourceloc "buggy_40.sol", 430, 32} {:message ""} true;
	call add#28_ret#38 := add#28(__this, __msg_sender, __msg_value, _balances#267[__this][recipient#817], amount#819);
	_balances#267 := _balances#267[__this := _balances#267[__this][recipient#817 := add#28_ret#38]];
	assume {:sourceloc "buggy_40.sol", 431, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, sender#815, recipient#817, amount#819);
	$return24:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_40.sol", 433, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#873: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_40.sol", 434, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#875: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_40.sol", 435, 4} {:message "ERC20::buyTicket_re_ent30"} buyTicket_re_ent30#905(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 436, 12} {:message ""} true;
	call __send_ret#39 := __send(lastPlayer_re_ent30#873[__this], __this, 0, jackpot_re_ent30#875[__this]);
	if (!(__send_ret#39)) {
	assume false;
	}

	lastPlayer_re_ent30#873 := lastPlayer_re_ent30#873[__this := __msg_sender];
	jackpot_re_ent30#875 := jackpot_re_ent30#875[__this := __balance[__this]];
	$return25:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 451, 5} {:message "ERC20::_mint"} _mint#951(__this: address_t, __msg_sender: address_t, __msg_value: int, account#908: address_t, amount#910: int)
{
	var call_arg#40: int_arr_ptr;
	var new_array#41: int_arr_ptr;
	var add#28_ret#42: int;
	var add#28_ret#43: int;
	var call_arg#44: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#41 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#40 := new_array#41;
	mem_arr_int := mem_arr_int[call_arg#40 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#908 != 0);
	assume {:sourceloc "buggy_40.sol", 454, 24} {:message ""} true;
	call add#28_ret#42 := add#28(__this, __msg_sender, __msg_value, _totalSupply#352[__this], amount#910);
	_totalSupply#352 := _totalSupply#352[__this := add#28_ret#42];
	assume {:sourceloc "buggy_40.sol", 455, 30} {:message ""} true;
	call add#28_ret#43 := add#28(__this, __msg_sender, __msg_value, _balances#267[__this][account#908], amount#910);
	_balances#267 := _balances#267[__this := _balances#267[__this][account#908 := add#28_ret#43]];
	call_arg#44 := 0;
	assume {:sourceloc "buggy_40.sol", 456, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, call_arg#44, account#908, amount#910);
	$return26:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 458, 1} {:message "balances_re_ent8"} balances_re_ent8#955: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_40.sol", 459, 5} {:message "ERC20::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#984(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 460, 9} {:message "success"} success#959: bool;
	var __call_ret#45: bool;
	var __call_ret#46: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#955[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#955[__this][__msg_sender])];
	assume {:sourceloc "buggy_40.sol", 460, 26} {:message ""} true;
	call __call_ret#45, __call_ret#46 := __call(__msg_sender, __this, balances_re_ent8#955[__this][__msg_sender]);
	if (__call_ret#45) {
	havoc balances_re_ent17#224;
	havoc _balances#267;
	havoc lastPlayer_re_ent37#269;
	havoc jackpot_re_ent37#271;
	havoc _allowances#307;
	havoc balances_re_ent3#311;
	havoc _totalSupply#352;
	havoc userBalance_re_ent26#366;
	havoc not_called_re_ent20#417;
	havoc redeemableEther_re_ent32#469;
	havoc balances_re_ent38#527;
	havoc redeemableEther_re_ent4#585;
	havoc counter_re_ent7#661;
	havoc lastPlayer_re_ent23#720;
	havoc jackpot_re_ent23#722;
	havoc counter_re_ent14#783;
	havoc lastPlayer_re_ent30#873;
	havoc jackpot_re_ent30#875;
	havoc balances_re_ent8#955;
	havoc redeemableEther_re_ent39#1034;
	havoc balances_re_ent36#1119;
	havoc counter_re_ent35#1174;
	havoc __balance;
	}

	if (!(__call_ret#45)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#955[__this][__msg_sender])];
	}

	success#959 := __call_ret#45;
	if (success#959) {
	balances_re_ent8#955 := balances_re_ent8#955[__this := balances_re_ent8#955[__this][__msg_sender := 0]];
	}

	$return27:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 476, 5} {:message "ERC20::_burn"} _burn#1030(__this: address_t, __msg_sender: address_t, __msg_value: int, account#987: address_t, value#989: int)
{
	var call_arg#47: int_arr_ptr;
	var new_array#48: int_arr_ptr;
	var sub#54_ret#49: int;
	var sub#54_ret#50: int;
	var call_arg#51: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#48 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#47 := new_array#48;
	mem_arr_int := mem_arr_int[call_arg#47 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#987 != 0);
	assume {:sourceloc "buggy_40.sol", 479, 24} {:message ""} true;
	call sub#54_ret#49 := sub#54(__this, __msg_sender, __msg_value, _totalSupply#352[__this], value#989);
	_totalSupply#352 := _totalSupply#352[__this := sub#54_ret#49];
	assume {:sourceloc "buggy_40.sol", 480, 30} {:message ""} true;
	call sub#54_ret#50 := sub#54(__this, __msg_sender, __msg_value, _balances#267[__this][account#987], value#989);
	_balances#267 := _balances#267[__this := _balances#267[__this][account#987 := sub#54_ret#50]];
	call_arg#51 := 0;
	assume {:sourceloc "buggy_40.sol", 481, 14} {:message ""} true;
	call Transfer#204(__this, __msg_sender, __msg_value, account#987, call_arg#51, value#989);
	$return28:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 483, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1034: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_40.sol", 484, 1} {:message "ERC20::claimReward_re_ent39"} claimReward_re_ent39#1070(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 487, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1047: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1034[__this][__msg_sender] > 0);
	transferValue_re_ent39#1047 := redeemableEther_re_ent39#1034[__this][__msg_sender];
	assume {:sourceloc "buggy_40.sol", 488, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1047);
	redeemableEther_re_ent39#1034 := redeemableEther_re_ent39#1034[__this := redeemableEther_re_ent39#1034[__this][__msg_sender := 0]];
	$return29:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 505, 5} {:message "ERC20::_approve"} _approve#1115(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1073: address_t, spender#1075: address_t, value#1077: int)
{
	var call_arg#52: int_arr_ptr;
	var new_array#53: int_arr_ptr;
	var call_arg#54: int_arr_ptr;
	var new_array#55: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#53 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#52 := new_array#53;
	mem_arr_int := mem_arr_int[call_arg#52 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#1073 != 0);
	new_array#55 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#54 := new_array#55;
	mem_arr_int := mem_arr_int[call_arg#54 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#1075 != 0);
	_allowances#307 := _allowances#307[__this := _allowances#307[__this][owner#1073 := _allowances#307[__this][owner#1073][spender#1075 := value#1077]]];
	assume {:sourceloc "buggy_40.sol", 510, 14} {:message ""} true;
	call Approval#213(__this, __msg_sender, __msg_value, owner#1073, spender#1075, value#1077);
	$return30:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 512, 1} {:message "balances_re_ent36"} balances_re_ent36#1119: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_40.sol", 513, 5} {:message "ERC20::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1142(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 514, 12} {:message ""} true;
	call __send_ret#56 := __send(__msg_sender, __this, 0, balances_re_ent36#1119[__this][__msg_sender]);
	if (__send_ret#56) {
	balances_re_ent36#1119 := balances_re_ent36#1119[__this := balances_re_ent36#1119[__this][__msg_sender := 0]];
	}

	$return31:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_40.sol", 524, 5} {:message "ERC20::_burnFrom"} _burnFrom#1171(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1145: address_t, amount#1147: int)
{
	var call_arg#57: address_t;
	var sub#54_ret#58: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 525, 9} {:message ""} true;
	call _burn#1030(__this, __msg_sender, __msg_value, account#1145, amount#1147);
	call_arg#57 := __msg_sender;
	assume {:sourceloc "buggy_40.sol", 526, 39} {:message ""} true;
	call sub#54_ret#58 := sub#54(__this, __msg_sender, __msg_value, _allowances#307[__this][account#1145][__msg_sender], amount#1147);
	assume {:sourceloc "buggy_40.sol", 526, 9} {:message ""} true;
	call _approve#1115(__this, __msg_sender, __msg_value, account#1145, call_arg#57, sub#54_ret#58);
	$return32:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_40.sol", 528, 1} {:message "counter_re_ent35"} counter_re_ent35#1174: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_40.sol", 529, 1} {:message "ERC20::callme_re_ent35"} callme_re_ent35#1203(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int;
	var __send_ret#60: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1174[__this] <= 5);
	call_arg#59 := 10000000000000000000;
	assume {:sourceloc "buggy_40.sol", 531, 9} {:message ""} true;
	call __send_ret#60 := __send(__msg_sender, __this, 0, call_arg#59);
	if (!(__send_ret#60)) {
	assume false;
	}

	counter_re_ent35#1174 := counter_re_ent35#1174[__this := (counter_re_ent35#1174[__this] + 1)];
	$return33:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_40.sol", 213, 1} {:message "ERC20::[implicit_constructor]"} __constructor#1204(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	balances_re_ent17#224 := balances_re_ent17#224[__this := default_address_t_int()];
	_balances#267 := _balances#267[__this := default_address_t_int()];
	lastPlayer_re_ent37#269 := lastPlayer_re_ent37#269[__this := 0];
	jackpot_re_ent37#271 := jackpot_re_ent37#271[__this := 0];
	_allowances#307 := _allowances#307[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent3#311 := balances_re_ent3#311[__this := default_address_t_int()];
	_totalSupply#352 := _totalSupply#352[__this := 0];
	userBalance_re_ent26#366 := userBalance_re_ent26#366[__this := default_address_t_int()];
	not_called_re_ent20#417 := not_called_re_ent20#417[__this := true];
	redeemableEther_re_ent32#469 := redeemableEther_re_ent32#469[__this := default_address_t_int()];
	balances_re_ent38#527 := balances_re_ent38#527[__this := default_address_t_int()];
	redeemableEther_re_ent4#585 := redeemableEther_re_ent4#585[__this := default_address_t_int()];
	counter_re_ent7#661 := counter_re_ent7#661[__this := 0];
	lastPlayer_re_ent23#720 := lastPlayer_re_ent23#720[__this := 0];
	jackpot_re_ent23#722 := jackpot_re_ent23#722[__this := 0];
	counter_re_ent14#783 := counter_re_ent14#783[__this := 0];
	lastPlayer_re_ent30#873 := lastPlayer_re_ent30#873[__this := 0];
	jackpot_re_ent30#875 := jackpot_re_ent30#875[__this := 0];
	balances_re_ent8#955 := balances_re_ent8#955[__this := default_address_t_int()];
	redeemableEther_re_ent39#1034 := redeemableEther_re_ent39#1034[__this := default_address_t_int()];
	balances_re_ent36#1119 := balances_re_ent36#1119[__this := default_address_t_int()];
	counter_re_ent35#1174 := counter_re_ent35#1174[__this := 0];
}

// 
// ------- Contract: ERC20Detailed -------
// Inherits from: IERC20
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_40.sol", 542, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#1209: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_40.sol", 543, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#1211: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_40.sol", 544, 4} {:message "ERC20Detailed::buyTicket_re_ent9"} buyTicket_re_ent9#1246(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 545, 10} {:message "success"} success#1215: bool;
	var __call_ret#61: bool;
	var __call_ret#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#1211[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#1211[__this])];
	assume {:sourceloc "buggy_40.sol", 545, 27} {:message ""} true;
	call __call_ret#61, __call_ret#62 := __call(lastPlayer_re_ent9#1209[__this], __this, jackpot_re_ent9#1211[__this]);
	if (__call_ret#61) {
	havoc lastPlayer_re_ent9#1209;
	havoc jackpot_re_ent9#1211;
	havoc _name#1248;
	havoc redeemableEther_re_ent25#1252;
	havoc _symbol#1290;
	havoc userBalance_re_ent19#1294;
	havoc _decimals#1325;
	havoc userBalance_re_ent40#1352;
	havoc userBalance_re_ent33#1399;
	havoc not_called_re_ent27#1445;
	havoc balances_re_ent31#1485;
	havoc __balance;
	}

	if (!(__call_ret#61)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#1211[__this])];
	}

	success#1215 := __call_ret#61;
	if (!(success#1215)) {
	assume false;
	}

	lastPlayer_re_ent9#1209 := lastPlayer_re_ent9#1209[__this := __msg_sender];
	jackpot_re_ent9#1211 := jackpot_re_ent9#1211[__this := __balance[__this]];
	$return34:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_40.sol", 551, 3} {:message "_name"} _name#1248: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 552, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#1252: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_40.sol", 553, 1} {:message "ERC20Detailed::claimReward_re_ent25"} claimReward_re_ent25#1288(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 556, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#1265: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#1252[__this][__msg_sender] > 0);
	transferValue_re_ent25#1265 := redeemableEther_re_ent25#1252[__this][__msg_sender];
	assume {:sourceloc "buggy_40.sol", 557, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#1265);
	redeemableEther_re_ent25#1252 := redeemableEther_re_ent25#1252[__this := redeemableEther_re_ent25#1252[__this][__msg_sender := 0]];
	$return35:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_40.sol", 560, 3} {:message "_symbol"} _symbol#1290: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 561, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#1294: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_40.sol", 562, 1} {:message "ERC20Detailed::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#1323(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#63: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_40.sol", 565, 12} {:message ""} true;
	call __send_ret#63 := __send(__msg_sender, __this, 0, userBalance_re_ent19#1294[__this][__msg_sender]);
	if (!(__send_ret#63)) {
	assume false;
	}

	userBalance_re_ent19#1294 := userBalance_re_ent19#1294[__this := userBalance_re_ent19#1294[__this][__msg_sender := 0]];
	$return36:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_40.sol", 570, 3} {:message "_decimals"} _decimals#1325: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 577, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1519(__this: address_t, __msg_sender: address_t, __msg_value: int, name#1328: int_arr_ptr, symbol#1330: int_arr_ptr, decimals#1332: int)
{
	// TCC assumptions
	assume (name#1328 < __alloc_counter);
	assume (symbol#1330 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent9#1209 := lastPlayer_re_ent9#1209[__this := 0];
	jackpot_re_ent9#1211 := jackpot_re_ent9#1211[__this := 0];
	_name#1248 := _name#1248[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent25#1252 := redeemableEther_re_ent25#1252[__this := default_address_t_int()];
	_symbol#1290 := _symbol#1290[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent19#1294 := userBalance_re_ent19#1294[__this := default_address_t_int()];
	_decimals#1325 := _decimals#1325[__this := 0];
	userBalance_re_ent40#1352 := userBalance_re_ent40#1352[__this := default_address_t_int()];
	userBalance_re_ent33#1399 := userBalance_re_ent33#1399[__this := default_address_t_int()];
	not_called_re_ent27#1445 := not_called_re_ent27#1445[__this := true];
	balances_re_ent31#1485 := balances_re_ent31#1485[__this := default_address_t_int()];
	// Function body starts here
	_name#1248 := _name#1248[__this := mem_arr_int[name#1328]];
	_symbol#1290 := _symbol#1290[__this := mem_arr_int[symbol#1330]];
	_decimals#1325 := _decimals#1325[__this := decimals#1332];
	$return37:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 582, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1352: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_40.sol", 583, 1} {:message "ERC20Detailed::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 586, 6} {:message "success"} success#1356: bool;
	var __call_ret#64: bool;
	var __call_ret#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1352[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1352[__this][__msg_sender])];
	assume {:sourceloc "buggy_40.sol", 586, 23} {:message ""} true;
	call __call_ret#64, __call_ret#65 := __call(__msg_sender, __this, userBalance_re_ent40#1352[__this][__msg_sender]);
	if (__call_ret#64) {
	havoc lastPlayer_re_ent9#1209;
	havoc jackpot_re_ent9#1211;
	havoc _name#1248;
	havoc redeemableEther_re_ent25#1252;
	havoc _symbol#1290;
	havoc userBalance_re_ent19#1294;
	havoc _decimals#1325;
	havoc userBalance_re_ent40#1352;
	havoc userBalance_re_ent33#1399;
	havoc not_called_re_ent27#1445;
	havoc balances_re_ent31#1485;
	havoc __balance;
	}

	if (!(__call_ret#64)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1352[__this][__msg_sender])];
	}

	success#1356 := __call_ret#64;
	if (!(success#1356)) {
	assume false;
	}

	userBalance_re_ent40#1352 := userBalance_re_ent40#1352[__this := userBalance_re_ent40#1352[__this][__msg_sender := 0]];
	$return38:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 596, 5} {:message "ERC20Detailed::name"} name#1395(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1390: int_arr_ptr)
{
	var new_array#66: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#66 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1390 := new_array#66;
	mem_arr_int := mem_arr_int[#1390 := _name#1248[__this]];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 599, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1399: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_40.sol", 600, 1} {:message "ERC20Detailed::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1433(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 603, 6} {:message "success"} success#1403: bool;
	var __call_ret#67: bool;
	var __call_ret#68: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1399[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1399[__this][__msg_sender])];
	assume {:sourceloc "buggy_40.sol", 603, 23} {:message ""} true;
	call __call_ret#67, __call_ret#68 := __call(__msg_sender, __this, userBalance_re_ent33#1399[__this][__msg_sender]);
	if (__call_ret#67) {
	havoc lastPlayer_re_ent9#1209;
	havoc jackpot_re_ent9#1211;
	havoc _name#1248;
	havoc redeemableEther_re_ent25#1252;
	havoc _symbol#1290;
	havoc userBalance_re_ent19#1294;
	havoc _decimals#1325;
	havoc userBalance_re_ent40#1352;
	havoc userBalance_re_ent33#1399;
	havoc not_called_re_ent27#1445;
	havoc balances_re_ent31#1485;
	havoc __balance;
	}

	if (!(__call_ret#67)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1399[__this][__msg_sender])];
	}

	success#1403 := __call_ret#67;
	if (!(success#1403)) {
	assume false;
	}

	userBalance_re_ent33#1399 := userBalance_re_ent33#1399[__this := userBalance_re_ent33#1399[__this][__msg_sender := 0]];
	$return40:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_40.sol", 614, 5} {:message "ERC20Detailed::symbol"} symbol#1442(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1437: int_arr_ptr)
{
	var new_array#69: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#69 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1437 := new_array#69;
	mem_arr_int := mem_arr_int[#1437 := _symbol#1290[__this]];
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_40.sol", 617, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1445: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_40.sol", 618, 1} {:message "ERC20Detailed::bug_re_ent27"} bug_re_ent27#1472(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#70: int;
	var __send_ret#71: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1445[__this];
	call_arg#70 := 1000000000000000000;
	assume {:sourceloc "buggy_40.sol", 620, 12} {:message ""} true;
	call __send_ret#71 := __send(__msg_sender, __this, 0, call_arg#70);
	if (!(__send_ret#71)) {
	assume false;
	}

	not_called_re_ent27#1445 := not_called_re_ent27#1445[__this := false];
	$return42:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_40.sol", 638, 5} {:message "ERC20Detailed::decimals"} decimals#1481(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1476: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1476 := _decimals#1325[__this];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_40.sol", 641, 1} {:message "balances_re_ent31"} balances_re_ent31#1485: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_40.sol", 642, 1} {:message "ERC20Detailed::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1518(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1487: int)
{
	var __send_ret#72: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1485[__this][__msg_sender] >= _weiToWithdraw#1487);
	assume {:sourceloc "buggy_40.sol", 645, 17} {:message ""} true;
	call __send_ret#72 := __send(__msg_sender, __this, 0, _weiToWithdraw#1487);
	assume __send_ret#72;
	balances_re_ent31#1485 := balances_re_ent31#1485[__this := balances_re_ent31#1485[__this][__msg_sender := (balances_re_ent31#1485[__this][__msg_sender] - _weiToWithdraw#1487)]];
	$return44:
	// Function body ends here
}

// 
// ------- Contract: SimpleSwapCoin -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// Function: 
procedure {:sourceloc "buggy_40.sol", 651, 5} {:message "SimpleSwapCoin::[constructor]"} __constructor#1585(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1525: int_arr_ptr, _symbol#1527: int_arr_ptr, _decimals#1529: int)
{
	var name#1328#73: int_arr_ptr;
	var symbol#1330#73: int_arr_ptr;
	var decimals#1332#73: int;
	var call_arg#75: address_t;
	var call_arg#76: int;
	// TCC assumptions
	assume (_name#1525 < __alloc_counter);
	assume (_symbol#1527 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent13#1552 := not_called_re_ent13#1552[__this := true];
	lastPlayer_re_ent9#1209 := lastPlayer_re_ent9#1209[__this := 0];
	jackpot_re_ent9#1211 := jackpot_re_ent9#1211[__this := 0];
	_name#1248 := _name#1248[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent25#1252 := redeemableEther_re_ent25#1252[__this := default_address_t_int()];
	_symbol#1290 := _symbol#1290[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent19#1294 := userBalance_re_ent19#1294[__this := default_address_t_int()];
	_decimals#1325 := _decimals#1325[__this := 0];
	userBalance_re_ent40#1352 := userBalance_re_ent40#1352[__this := default_address_t_int()];
	userBalance_re_ent33#1399 := userBalance_re_ent33#1399[__this := default_address_t_int()];
	not_called_re_ent27#1445 := not_called_re_ent27#1445[__this := true];
	balances_re_ent31#1485 := balances_re_ent31#1485[__this := default_address_t_int()];
	balances_re_ent17#224 := balances_re_ent17#224[__this := default_address_t_int()];
	_balances#267 := _balances#267[__this := default_address_t_int()];
	lastPlayer_re_ent37#269 := lastPlayer_re_ent37#269[__this := 0];
	jackpot_re_ent37#271 := jackpot_re_ent37#271[__this := 0];
	_allowances#307 := _allowances#307[__this := default_address_t__k_address_t_v_int()];
	balances_re_ent3#311 := balances_re_ent3#311[__this := default_address_t_int()];
	_totalSupply#352 := _totalSupply#352[__this := 0];
	userBalance_re_ent26#366 := userBalance_re_ent26#366[__this := default_address_t_int()];
	not_called_re_ent20#417 := not_called_re_ent20#417[__this := true];
	redeemableEther_re_ent32#469 := redeemableEther_re_ent32#469[__this := default_address_t_int()];
	balances_re_ent38#527 := balances_re_ent38#527[__this := default_address_t_int()];
	redeemableEther_re_ent4#585 := redeemableEther_re_ent4#585[__this := default_address_t_int()];
	counter_re_ent7#661 := counter_re_ent7#661[__this := 0];
	lastPlayer_re_ent23#720 := lastPlayer_re_ent23#720[__this := 0];
	jackpot_re_ent23#722 := jackpot_re_ent23#722[__this := 0];
	counter_re_ent14#783 := counter_re_ent14#783[__this := 0];
	lastPlayer_re_ent30#873 := lastPlayer_re_ent30#873[__this := 0];
	jackpot_re_ent30#875 := jackpot_re_ent30#875[__this := 0];
	balances_re_ent8#955 := balances_re_ent8#955[__this := default_address_t_int()];
	redeemableEther_re_ent39#1034 := redeemableEther_re_ent39#1034[__this := default_address_t_int()];
	balances_re_ent36#1119 := balances_re_ent36#1119[__this := default_address_t_int()];
	counter_re_ent35#1174 := counter_re_ent35#1174[__this := 0];
	// Arguments for ERC20Detailed
	name#1328#73 := _name#1525;
	symbol#1330#73 := _symbol#1527;
	decimals#1332#73 := _decimals#1529;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#1248 := _name#1248[__this := mem_arr_int[name#1328#73]];
	_symbol#1290 := _symbol#1290[__this := mem_arr_int[symbol#1330#73]];
	_decimals#1325 := _decimals#1325[__this := decimals#1332#73];
	$return45:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#75 := __msg_sender;
	call_arg#76 := 10000000000000000;
	assume {:sourceloc "buggy_40.sol", 652, 9} {:message ""} true;
	call _mint#951(__this, __msg_sender, __msg_value, call_arg#75, call_arg#76);
	$return46:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_40.sol", 654, 1} {:message "not_called_re_ent13"} not_called_re_ent13#1552: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_40.sol", 655, 1} {:message "SimpleSwapCoin::bug_re_ent13"} bug_re_ent13#1584(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_40.sol", 657, 10} {:message "success"} success#1560: bool;
	var __call_ret#77: bool;
	var __call_ret#78: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1552[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_40.sol", 657, 27} {:message ""} true;
	call __call_ret#77, __call_ret#78 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#77) {
	havoc not_called_re_ent13#1552;
	havoc lastPlayer_re_ent9#1209;
	havoc jackpot_re_ent9#1211;
	havoc _name#1248;
	havoc redeemableEther_re_ent25#1252;
	havoc _symbol#1290;
	havoc userBalance_re_ent19#1294;
	havoc _decimals#1325;
	havoc userBalance_re_ent40#1352;
	havoc userBalance_re_ent33#1399;
	havoc not_called_re_ent27#1445;
	havoc balances_re_ent31#1485;
	havoc balances_re_ent17#224;
	havoc _balances#267;
	havoc lastPlayer_re_ent37#269;
	havoc jackpot_re_ent37#271;
	havoc _allowances#307;
	havoc balances_re_ent3#311;
	havoc _totalSupply#352;
	havoc userBalance_re_ent26#366;
	havoc not_called_re_ent20#417;
	havoc redeemableEther_re_ent32#469;
	havoc balances_re_ent38#527;
	havoc redeemableEther_re_ent4#585;
	havoc counter_re_ent7#661;
	havoc lastPlayer_re_ent23#720;
	havoc jackpot_re_ent23#722;
	havoc counter_re_ent14#783;
	havoc lastPlayer_re_ent30#873;
	havoc jackpot_re_ent30#875;
	havoc balances_re_ent8#955;
	havoc redeemableEther_re_ent39#1034;
	havoc balances_re_ent36#1119;
	havoc counter_re_ent35#1174;
	havoc __balance;
	}

	if (!(__call_ret#77)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1560 := __call_ret#77;
	if (!(success#1560)) {
	assume false;
	}

	not_called_re_ent13#1552 := not_called_re_ent13#1552[__this := false];
	$return47:
	// Function body ends here
}

