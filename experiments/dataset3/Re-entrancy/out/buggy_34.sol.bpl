// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_34.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_34.sol", 24, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#66(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#62: address_t, _to#64: address_t)
{
	
}

// 
// State variable: balances_re_ent15: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 9, 2} {:message "balances_re_ent15"} balances_re_ent15#5: [address_t][address_t]int;
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
// Function: withdraw_balances_re_ent15 : function ()
procedure {:sourceloc "buggy_34.sol", 10, 6} {:message "Ownable::withdraw_balances_re_ent15"} withdraw_balances_re_ent15#28(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 11, 14} {:message ""} true;
	call __send_ret#0 := __send(__msg_sender, __this, 0, balances_re_ent15#5[__this][__msg_sender]);
	if (__send_ret#0) {
	balances_re_ent15#5 := balances_re_ent15#5[__this := balances_re_ent15#5[__this][__msg_sender := 0]];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_34.sol", 14, 3} {:message "owner"} owner#30: [address_t]address_t;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_34.sol", 16, 2} {:message "not_called_re_ent27"} not_called_re_ent27#33: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_34.sol", 17, 1} {:message "Ownable::bug_re_ent27"} bug_re_ent27#60(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#33[__this];
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 19, 16} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, call_arg#1);
	if (!(__send_ret#2)) {
	assume false;
	}

	not_called_re_ent27#33 := not_called_re_ent27#33[__this := false];
	$return1:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 26, 4} {:message "Ownable::[constructor]"} __constructor#179(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent15#5 := balances_re_ent15#5[__this := default_address_t_int()];
	owner#30 := owner#30[__this := 0];
	not_called_re_ent27#33 := not_called_re_ent27#33[__this := true];
	lastPlayer_re_ent2#80 := lastPlayer_re_ent2#80[__this := 0];
	jackpot_re_ent2#82 := jackpot_re_ent2#82[__this := 0];
	balances_re_ent17#139 := balances_re_ent17#139[__this := default_address_t_int()];
	// Function body starts here
	owner#30 := owner#30[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_34.sol", 29, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#80: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_34.sol", 30, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#82: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_34.sol", 31, 4} {:message "Ownable::buyTicket_re_ent2"} buyTicket_re_ent2#112(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 32, 12} {:message ""} true;
	call __send_ret#3 := __send(lastPlayer_re_ent2#80[__this], __this, 0, jackpot_re_ent2#82[__this]);
	if (!(__send_ret#3)) {
	assume false;
	}

	lastPlayer_re_ent2#80 := lastPlayer_re_ent2#80[__this := __msg_sender];
	jackpot_re_ent2#82 := jackpot_re_ent2#82[__this := __balance[__this]];
	$return3:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_34.sol", 43, 4} {:message "Ownable::transferOwnership"} transferOwnership#135(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#125: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#30[__this]);
	// Function body starts here
	owner#30 := owner#30[__this := _newOwner#125];
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 46, 1} {:message "balances_re_ent17"} balances_re_ent17#139: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_34.sol", 47, 1} {:message "Ownable::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#178(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#141: int)
{
	var {:sourceloc "buggy_34.sol", 50, 6} {:message "success"} success#154: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#139[__this][__msg_sender] >= _weiToWithdraw#141);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#141);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#141)];
	assume {:sourceloc "buggy_34.sol", 50, 21} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, _weiToWithdraw#141);
	if (__call_ret#6) {
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#141)];
	}

	success#154 := __call_ret#6;
	assume success#154;
	balances_re_ent17#139 := balances_re_ent17#139[__this := balances_re_ent17#139[__this][__msg_sender := (balances_re_ent17#139[__this][__msg_sender] - _weiToWithdraw#141)]];
	$return6:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 67, 5} {:message "SafeMath::add"} add#205(__this: address_t, __msg_sender: address_t, __msg_value: int, a#182: int, b#184: int)
	returns (#187: int)
{
	var {:sourceloc "buggy_34.sol", 68, 9} {:message "c"} c#190: int;
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#190 := (a#182 + b#184);
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#190 >= a#182);
	#187 := c#190;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 83, 5} {:message "SafeMath::sub"} sub#231(__this: address_t, __msg_sender: address_t, __msg_value: int, a#208: int, b#210: int)
	returns (#213: int)
{
	var call_arg#10: int_arr_ptr;
	var new_array#11: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 85, 9} {:message "c"} c#223: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#10 := new_array#11;
	mem_arr_int := mem_arr_int[call_arg#10 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#210 <= a#208);
	c#223 := (a#208 - b#210);
	#213 := c#223;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 99, 5} {:message "SafeMath::mul"} mul#266(__this: address_t, __msg_sender: address_t, __msg_value: int, a#234: int, b#236: int)
	returns (#239: int)
{
	var {:sourceloc "buggy_34.sol", 107, 9} {:message "c"} c#249: int;
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#234 == 0)) {
	#239 := 0;
	goto $return9;
	}

	c#249 := (a#234 * b#236);
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#249 div a#234) == b#236);
	#239 := c#249;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 124, 5} {:message "SafeMath::div"} div#292(__this: address_t, __msg_sender: address_t, __msg_value: int, a#269: int, b#271: int)
	returns (#274: int)
{
	var call_arg#14: int_arr_ptr;
	var new_array#15: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 127, 9} {:message "c"} c#284: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#15 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#14 := new_array#15;
	mem_arr_int := mem_arr_int[call_arg#14 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#271 > 0);
	c#284 := (a#269 div b#271);
	#274 := c#284;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 144, 5} {:message "SafeMath::mod"} mod#314(__this: address_t, __msg_sender: address_t, __msg_value: int, a#295: int, b#297: int)
	returns (#300: int)
{
	var call_arg#16: int_arr_ptr;
	var new_array#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#17 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#16 := new_array#17;
	mem_arr_int := mem_arr_int[call_arg#16 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume (b#297 != 0);
	#300 := (a#295 mod b#297);
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_34.sol", 57, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#315(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: LollypopToken -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_34.sol", 402, 3} {:message "[event] LollypopToken::Transfer"} Transfer#1235(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1229: address_t, to#1231: address_t, value#1233: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_34.sol", 417, 3} {:message "[event] LollypopToken::Approval"} Approval#1279(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1273: address_t, spender#1275: address_t, value#1277: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: counter_re_ent28: uint256
var {:sourceloc "buggy_34.sol", 153, 3} {:message "counter_re_ent28"} counter_re_ent28#323: [address_t]int;
// 
// Function: callme_re_ent28 : function ()
procedure {:sourceloc "buggy_34.sol", 154, 1} {:message "LollypopToken::callme_re_ent28"} callme_re_ent28#352(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent28#323[__this] <= 5);
	call_arg#18 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 156, 9} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, call_arg#18);
	if (!(__send_ret#19)) {
	assume false;
	}

	counter_re_ent28#323 := counter_re_ent28#323[__this := (counter_re_ent28#323[__this] + 1)];
	$return12:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => struct LollypopToken.transferMapping storage ref)
type {:datatype} struct_storage_transferMapping#689;
var {:sourceloc "buggy_34.sol", 161, 3} {:message "_balances"} _balances#356: [address_t][address_t]struct_storage_transferMapping#689;
// 
// State variable: not_called_re_ent34: bool
var {:sourceloc "buggy_34.sol", 163, 3} {:message "not_called_re_ent34"} not_called_re_ent34#359: [address_t]bool;
// 
// Function: bug_re_ent34 : function ()
procedure {:sourceloc "buggy_34.sol", 164, 1} {:message "LollypopToken::bug_re_ent34"} bug_re_ent34#386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent34#359[__this];
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 166, 16} {:message ""} true;
	call __send_ret#21 := __send(__msg_sender, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	assume false;
	}

	not_called_re_ent34#359 := not_called_re_ent34#359[__this := false];
	$return13:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_34.sol", 171, 3} {:message "_allowances"} _allowances#392: [address_t][address_t][address_t]int;
// 
// State variable: counter_re_ent21: uint256
var {:sourceloc "buggy_34.sol", 173, 3} {:message "counter_re_ent21"} counter_re_ent21#395: [address_t]int;
// 
// Function: callme_re_ent21 : function ()
procedure {:sourceloc "buggy_34.sol", 174, 1} {:message "LollypopToken::callme_re_ent21"} callme_re_ent21#424(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent21#395[__this] <= 5);
	call_arg#22 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 176, 9} {:message ""} true;
	call __send_ret#23 := __send(__msg_sender, __this, 0, call_arg#22);
	if (!(__send_ret#23)) {
	assume false;
	}

	counter_re_ent21#395 := counter_re_ent21#395[__this := (counter_re_ent21#395[__this] + 1)];
	$return14:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_34.sol", 181, 3} {:message "_totalSupply"} _totalSupply#426: [address_t]int;
// 
// State variable: balances_re_ent10: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 182, 3} {:message "balances_re_ent10"} balances_re_ent10#430: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent10 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 183, 1} {:message "LollypopToken::withdrawFunds_re_ent10"} withdrawFunds_re_ent10#463(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#432: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent10#430[__this][__msg_sender] >= _weiToWithdraw#432);
	assume {:sourceloc "buggy_34.sol", 186, 13} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, _weiToWithdraw#432);
	assume __send_ret#24;
	balances_re_ent10#430 := balances_re_ent10#430[__this := balances_re_ent10#430[__this][__msg_sender := (balances_re_ent10#430[__this][__msg_sender] - _weiToWithdraw#432)]];
	$return15:
	// Function body ends here
}

// 
// State variable: _maxTotalSupply: uint256
var {:sourceloc "buggy_34.sol", 189, 3} {:message "_maxTotalSupply"} _maxTotalSupply#465: [address_t]int;
// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 192, 3} {:message "balances_re_ent21"} balances_re_ent21#469: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_34.sol", 193, 5} {:message "LollypopToken::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#498(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 194, 11} {:message "success"} success#473: bool;
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#469[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#469[__this][__msg_sender])];
	assume {:sourceloc "buggy_34.sol", 194, 27} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(__msg_sender, __this, balances_re_ent21#469[__this][__msg_sender]);
	if (__call_ret#25) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#469[__this][__msg_sender])];
	}

	success#473 := __call_ret#25;
	if (success#473) {
	balances_re_ent21#469 := balances_re_ent21#469[__this := balances_re_ent21#469[__this][__msg_sender := 0]];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_34.sol", 198, 3} {:message "_name"} _name#501: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 199, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#505: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_34.sol", 200, 1} {:message "LollypopToken::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#534(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 203, 16} {:message ""} true;
	call __send_ret#27 := __send(__msg_sender, __this, 0, userBalance_re_ent12#505[__this][__msg_sender]);
	if (!(__send_ret#27)) {
	assume false;
	}

	userBalance_re_ent12#505 := userBalance_re_ent12#505[__this := userBalance_re_ent12#505[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_34.sol", 208, 3} {:message "_symbol"} _symbol#537: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 209, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#541: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_34.sol", 210, 1} {:message "LollypopToken::claimReward_re_ent11"} claimReward_re_ent11#577(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 213, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#554: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#541[__this][__msg_sender] > 0);
	transferValue_re_ent11#554 := redeemableEther_re_ent11#541[__this][__msg_sender];
	assume {:sourceloc "buggy_34.sol", 214, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#554);
	redeemableEther_re_ent11#541 := redeemableEther_re_ent11#541[__this := redeemableEther_re_ent11#541[__this][__msg_sender := 0]];
	$return18:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_34.sol", 217, 3} {:message "_decimals"} _decimals#580: [address_t]int;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 219, 3} {:message "balances_re_ent1"} balances_re_ent1#584: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_34.sol", 220, 5} {:message "LollypopToken::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#613(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 221, 6} {:message "success"} success#588: bool;
	var __call_ret#28: bool;
	var __call_ret#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#584[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#584[__this][__msg_sender])];
	assume {:sourceloc "buggy_34.sol", 221, 22} {:message ""} true;
	call __call_ret#28, __call_ret#29 := __call(__msg_sender, __this, balances_re_ent1#584[__this][__msg_sender]);
	if (__call_ret#28) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#28)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#584[__this][__msg_sender])];
	}

	success#588 := __call_ret#28;
	if (success#588) {
	balances_re_ent1#584 := balances_re_ent1#584[__this := balances_re_ent1#584[__this][__msg_sender := 0]];
	}

	$return19:
	// Function body ends here
}

// 
// State variable: maxAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 225, 3} {:message "maxAgeOfToken"} maxAgeOfToken#616: [address_t]int;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_34.sol", 226, 3} {:message "not_called_re_ent41"} not_called_re_ent41#619: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_34.sol", 227, 1} {:message "LollypopToken::bug_re_ent41"} bug_re_ent41#646(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#619[__this];
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 229, 16} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	not_called_re_ent41#619 := not_called_re_ent41#619[__this := false];
	$return20:
	// Function body ends here
}

// 
// State variable: minAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 234, 3} {:message "minAgeOfToken"} minAgeOfToken#649: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_34.sol", 235, 3} {:message "counter_re_ent42"} counter_re_ent42#652: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_34.sol", 236, 1} {:message "LollypopToken::callme_re_ent42"} callme_re_ent42#681(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#652[__this] <= 5);
	call_arg#32 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 238, 9} {:message ""} true;
	call __send_ret#33 := __send(__msg_sender, __this, 0, call_arg#32);
	if (!(__send_ret#33)) {
	assume false;
	}

	counter_re_ent42#652 := counter_re_ent42#652[__this := (counter_re_ent42#652[__this] + 1)];
	$return21:
	// Function body ends here
}

// 
// State variable: perDayBonus: uint256
var {:sourceloc "buggy_34.sol", 243, 3} {:message "perDayBonus"} perDayBonus#684: [address_t]int;
// 
// ------- Struct transferMapping -------
// Storage
function {:constructor} transferMapping#689#constr(amount#686: int, time#688: int) returns (struct_storage_transferMapping#689);
// Memory
type address_struct_memory_transferMapping#689 = int;
// Member amount
var {:sourceloc "buggy_34.sol", 246, 9} {:message "amount"} amount#686: [address_struct_memory_transferMapping#689]int;
// Member time
var {:sourceloc "buggy_34.sol", 247, 9} {:message "time"} time#688: [address_struct_memory_transferMapping#689]int;
// 
// ------- End of struct transferMapping -------
function {:builtin "((as const (Array Int |T@struct_storage_transferMapping#689|)) (|transferMapping#689#constr| 0 0))"} default_address_t_struct_storage_transferMapping#689() returns ([address_t]struct_storage_transferMapping#689);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 251, 5} {:message "LollypopToken::[constructor]"} __constructor#2162(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	counter_re_ent28#323 := counter_re_ent28#323[__this := 0];
	_balances#356 := _balances#356[__this := default_address_t_struct_storage_transferMapping#689()];
	not_called_re_ent34#359 := not_called_re_ent34#359[__this := true];
	_allowances#392 := _allowances#392[__this := default_address_t__k_address_t_v_int()];
	counter_re_ent21#395 := counter_re_ent21#395[__this := 0];
	_totalSupply#426 := _totalSupply#426[__this := 0];
	balances_re_ent10#430 := balances_re_ent10#430[__this := default_address_t_int()];
	_maxTotalSupply#465 := _maxTotalSupply#465[__this := 0];
	balances_re_ent21#469 := balances_re_ent21#469[__this := default_address_t_int()];
	_name#501 := _name#501[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121][5 := 112][6 := 111][7 := 112], 8)];
	userBalance_re_ent12#505 := userBalance_re_ent12#505[__this := default_address_t_int()];
	_symbol#537 := _symbol#537[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121], 5)];
	redeemableEther_re_ent11#541 := redeemableEther_re_ent11#541[__this := default_address_t_int()];
	_decimals#580 := _decimals#580[__this := 18];
	balances_re_ent1#584 := balances_re_ent1#584[__this := default_address_t_int()];
	maxAgeOfToken#616 := maxAgeOfToken#616[__this := 31536000];
	not_called_re_ent41#619 := not_called_re_ent41#619[__this := true];
	minAgeOfToken#649 := minAgeOfToken#649[__this := 86400];
	counter_re_ent42#652 := counter_re_ent42#652[__this := 0];
	perDayBonus#684 := perDayBonus#684[__this := 100];
	lastPlayer_re_ent37#728 := lastPlayer_re_ent37#728[__this := 0];
	jackpot_re_ent37#730 := jackpot_re_ent37#730[__this := 0];
	balances_re_ent3#802 := balances_re_ent3#802[__this := default_address_t_int()];
	lastPlayer_re_ent9#995 := lastPlayer_re_ent9#995[__this := 0];
	jackpot_re_ent9#997 := jackpot_re_ent9#997[__this := 0];
	redeemableEther_re_ent25#1045 := redeemableEther_re_ent25#1045[__this := default_address_t_int()];
	userBalance_re_ent19#1094 := userBalance_re_ent19#1094[__this := default_address_t_int()];
	userBalance_re_ent26#1136 := userBalance_re_ent26#1136[__this := default_address_t_int()];
	balances_re_ent31#1194 := balances_re_ent31#1194[__this := default_address_t_int()];
	not_called_re_ent13#1239 := not_called_re_ent13#1239[__this := true];
	not_called_re_ent20#1330 := not_called_re_ent20#1330[__this := true];
	redeemableEther_re_ent32#1370 := redeemableEther_re_ent32#1370[__this := default_address_t_int()];
	balances_re_ent38#1424 := balances_re_ent38#1424[__this := default_address_t_int()];
	redeemableEther_re_ent4#1474 := redeemableEther_re_ent4#1474[__this := default_address_t_int()];
	counter_re_ent7#1533 := counter_re_ent7#1533[__this := 0];
	lastPlayer_re_ent23#1604 := lastPlayer_re_ent23#1604[__this := 0];
	jackpot_re_ent23#1606 := jackpot_re_ent23#1606[__this := 0];
	counter_re_ent14#1656 := counter_re_ent14#1656[__this := 0];
	lastPlayer_re_ent30#1707 := lastPlayer_re_ent30#1707[__this := 0];
	jackpot_re_ent30#1709 := jackpot_re_ent30#1709[__this := 0];
	balances_re_ent8#1779 := balances_re_ent8#1779[__this := default_address_t_int()];
	redeemableEther_re_ent39#1840 := redeemableEther_re_ent39#1840[__this := default_address_t_int()];
	balances_re_ent36#1908 := balances_re_ent36#1908[__this := default_address_t_int()];
	counter_re_ent35#1982 := counter_re_ent35#1982[__this := 0];
	userBalance_re_ent40#2060 := userBalance_re_ent40#2060[__this := default_address_t_int()];
	userBalance_re_ent33#2127 := userBalance_re_ent33#2127[__this := default_address_t_int()];
	balances_re_ent15#5 := balances_re_ent15#5[__this := default_address_t_int()];
	owner#30 := owner#30[__this := 0];
	not_called_re_ent27#33 := not_called_re_ent27#33[__this := true];
	lastPlayer_re_ent2#80 := lastPlayer_re_ent2#80[__this := 0];
	jackpot_re_ent2#82 := jackpot_re_ent2#82[__this := 0];
	balances_re_ent17#139 := balances_re_ent17#139[__this := default_address_t_int()];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#30 := owner#30[__this := __msg_sender];
	$return22:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	_maxTotalSupply#465 := _maxTotalSupply#465[__this := 1000000000000000000000000000];
	_totalSupply#426 := _totalSupply#426[__this := 2000000000000000000000000];
	_balances#356 := _balances#356[__this := _balances#356[__this][__msg_sender := transferMapping#689#constr(_totalSupply#426[__this], time#688#transferMapping#689#constr(_balances#356[__this][__msg_sender]))]];
	_balances#356 := _balances#356[__this := _balances#356[__this][__msg_sender := transferMapping#689#constr(amount#686#transferMapping#689#constr(_balances#356[__this][__msg_sender]), __block_timestamp)]];
	$return23:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_34.sol", 259, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#728: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_34.sol", 260, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#730: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_34.sol", 261, 4} {:message "LollypopToken::buyTicket_re_ent37"} buyTicket_re_ent37#760(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 262, 12} {:message ""} true;
	call __send_ret#35 := __send(lastPlayer_re_ent37#728[__this], __this, 0, jackpot_re_ent37#730[__this]);
	if (!(__send_ret#35)) {
	assume false;
	}

	lastPlayer_re_ent37#728 := lastPlayer_re_ent37#728[__this := __msg_sender];
	jackpot_re_ent37#730 := jackpot_re_ent37#730[__this := __balance[__this]];
	$return24:
	// Function body ends here
}

// 
// Function: calculateBonus : function (uint256,uint256) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 268, 5} {:message "LollypopToken::calculateBonus"} calculateBonus#798(__this: address_t, __msg_sender: address_t, __msg_value: int, timeElasped#762: int, amount#764: int)
	returns (#767: int)
{
	var {:sourceloc "buggy_34.sol", 269, 9} {:message "totalDays"} totalDays#770: int;
	var div#292_ret#36: int;
	var {:sourceloc "buggy_34.sol", 273, 9} {:message "totalBonus"} totalBonus#786: int;
	var div#292_ret#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 269, 29} {:message ""} true;
	call div#292_ret#36 := div#292(__this, __msg_sender, __msg_value, timeElasped#762, minAgeOfToken#649[__this]);
	totalDays#770 := div#292_ret#36;
	if ((totalDays#770 > maxAgeOfToken#616[__this])) {
	totalDays#770 := maxAgeOfToken#616[__this];
	}

	assume {:sourceloc "buggy_34.sol", 273, 30} {:message ""} true;
	call div#292_ret#37 := div#292(__this, __msg_sender, __msg_value, (totalDays#770 * amount#764), perDayBonus#684[__this]);
	totalBonus#786 := div#292_ret#37;
	#767 := totalBonus#786;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 277, 1} {:message "balances_re_ent3"} balances_re_ent3#802: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 278, 1} {:message "LollypopToken::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#841(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#804: int)
{
	var {:sourceloc "buggy_34.sol", 281, 7} {:message "success"} success#817: bool;
	var __call_ret#38: bool;
	var __call_ret#39: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#802[__this][__msg_sender] >= _weiToWithdraw#804);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#804);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#804)];
	assume {:sourceloc "buggy_34.sol", 281, 23} {:message ""} true;
	call __call_ret#38, __call_ret#39 := __call(__msg_sender, __this, _weiToWithdraw#804);
	if (__call_ret#38) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#38)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#804)];
	}

	success#817 := __call_ret#38;
	assume success#817;
	balances_re_ent3#802 := balances_re_ent3#802[__this := balances_re_ent3#802[__this][__msg_sender := (balances_re_ent3#802[__this][__msg_sender] - _weiToWithdraw#804)]];
	$return26:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 287, 5} {:message "LollypopToken::_transfer"} _transfer#993(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#843: address_t, recipient#845: address_t, amount#847: int)
{
	var call_arg#40: int_arr_ptr;
	var new_array#41: int_arr_ptr;
	var call_arg#42: int_arr_ptr;
	var new_array#43: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 291, 9} {:message "senderTimeElasped"} senderTimeElasped#871: int;
	var {:sourceloc "buggy_34.sol", 292, 9} {:message "recipientTimeElasped"} recipientTimeElasped#882: int;
	var {:sourceloc "buggy_34.sol", 295, 13} {:message "bonus"} bonus#901: int;
	var balanceOf#1420_ret#44: int;
	var calculateBonus#798_ret#45: int;
	var {:sourceloc "buggy_34.sol", 300, 14} {:message "bonus"} bonus#929: int;
	var balanceOf#1420_ret#46: int;
	var calculateBonus#798_ret#47: int;
	var sub#231_ret#48: int;
	var add#205_ret#49: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#41 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#40 := new_array#41;
	mem_arr_int := mem_arr_int[call_arg#40 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#843 != 0);
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#42 := new_array#43;
	mem_arr_int := mem_arr_int[call_arg#42 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#845 != 0);
	senderTimeElasped#871 := (__block_timestamp - time#688#transferMapping#689#constr(_balances#356[__this][sender#843]));
	recipientTimeElasped#882 := (__block_timestamp - time#688#transferMapping#689#constr(_balances#356[__this][recipient#845]));
	if (((senderTimeElasped#871 >= minAgeOfToken#649[__this]) && (_totalSupply#426[__this] < _maxTotalSupply#465[__this]))) {
	assume {:sourceloc "buggy_34.sol", 295, 64} {:message ""} true;
	call balanceOf#1420_ret#44 := balanceOf#1420(__this, __msg_sender, __msg_value, sender#843);
	assume {:sourceloc "buggy_34.sol", 295, 29} {:message ""} true;
	call calculateBonus#798_ret#45 := calculateBonus#798(__this, __msg_sender, __msg_value, senderTimeElasped#871, balanceOf#1420_ret#44);
	bonus#901 := calculateBonus#798_ret#45;
	assume {:sourceloc "buggy_34.sol", 296, 13} {:message ""} true;
	call mint#1327(__this, __msg_sender, __msg_value, sender#843, bonus#901);
	}

	if ((((recipientTimeElasped#882 >= minAgeOfToken#649[__this]) && (_totalSupply#426[__this] < _maxTotalSupply#465[__this])) && (sender#843 != recipient#845))) {
	assume {:sourceloc "buggy_34.sol", 300, 68} {:message ""} true;
	call balanceOf#1420_ret#46 := balanceOf#1420(__this, __msg_sender, __msg_value, recipient#845);
	assume {:sourceloc "buggy_34.sol", 300, 30} {:message ""} true;
	call calculateBonus#798_ret#47 := calculateBonus#798(__this, __msg_sender, __msg_value, recipientTimeElasped#882, balanceOf#1420_ret#46);
	bonus#929 := calculateBonus#798_ret#47;
	assume {:sourceloc "buggy_34.sol", 301, 14} {:message ""} true;
	call mint#1327(__this, __msg_sender, __msg_value, recipient#845, bonus#929);
	}

	assume {:sourceloc "buggy_34.sol", 305, 36} {:message ""} true;
	call sub#231_ret#48 := sub#231(__this, __msg_sender, __msg_value, amount#686#transferMapping#689#constr(_balances#356[__this][sender#843]), amount#847);
	_balances#356 := _balances#356[__this := _balances#356[__this][sender#843 := transferMapping#689#constr(sub#231_ret#48, time#688#transferMapping#689#constr(_balances#356[__this][sender#843]))]];
	assume {:sourceloc "buggy_34.sol", 306, 39} {:message ""} true;
	call add#205_ret#49 := add#205(__this, __msg_sender, __msg_value, amount#686#transferMapping#689#constr(_balances#356[__this][recipient#845]), amount#847);
	_balances#356 := _balances#356[__this := _balances#356[__this][recipient#845 := transferMapping#689#constr(add#205_ret#49, time#688#transferMapping#689#constr(_balances#356[__this][recipient#845]))]];
	_balances#356 := _balances#356[__this := _balances#356[__this][sender#843 := transferMapping#689#constr(amount#686#transferMapping#689#constr(_balances#356[__this][sender#843]), __block_timestamp)]];
	_balances#356 := _balances#356[__this := _balances#356[__this][recipient#845 := transferMapping#689#constr(amount#686#transferMapping#689#constr(_balances#356[__this][recipient#845]), __block_timestamp)]];
	assume {:sourceloc "buggy_34.sol", 311, 14} {:message ""} true;
	call Transfer#1235(__this, __msg_sender, __msg_value, sender#843, recipient#845, amount#847);
	$return27:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_34.sol", 315, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#995: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_34.sol", 316, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#997: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_34.sol", 317, 4} {:message "LollypopToken::buyTicket_re_ent9"} buyTicket_re_ent9#1032(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 318, 10} {:message "success"} success#1001: bool;
	var __call_ret#50: bool;
	var __call_ret#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#997[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#997[__this])];
	assume {:sourceloc "buggy_34.sol", 318, 27} {:message ""} true;
	call __call_ret#50, __call_ret#51 := __call(lastPlayer_re_ent9#995[__this], __this, jackpot_re_ent9#997[__this]);
	if (__call_ret#50) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#50)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#997[__this])];
	}

	success#1001 := __call_ret#50;
	if (!(success#1001)) {
	assume false;
	}

	lastPlayer_re_ent9#995 := lastPlayer_re_ent9#995[__this := __msg_sender];
	jackpot_re_ent9#997 := jackpot_re_ent9#997[__this := __balance[__this]];
	$return28:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 329, 5} {:message "LollypopToken::name"} name#1041(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1036: int_arr_ptr)
{
	var new_array#52: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#52 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1036 := new_array#52;
	mem_arr_int := mem_arr_int[#1036 := _name#501[__this]];
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 332, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#1045: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_34.sol", 333, 1} {:message "LollypopToken::claimReward_re_ent25"} claimReward_re_ent25#1081(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 336, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#1058: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#1045[__this][__msg_sender] > 0);
	transferValue_re_ent25#1058 := redeemableEther_re_ent25#1045[__this][__msg_sender];
	assume {:sourceloc "buggy_34.sol", 337, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#1058);
	redeemableEther_re_ent25#1045 := redeemableEther_re_ent25#1045[__this := redeemableEther_re_ent25#1045[__this][__msg_sender := 0]];
	$return30:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 345, 5} {:message "LollypopToken::symbol"} symbol#1090(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1085: int_arr_ptr)
{
	var new_array#53: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#53 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1085 := new_array#53;
	mem_arr_int := mem_arr_int[#1085 := _symbol#537[__this]];
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 348, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#1094: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_34.sol", 349, 1} {:message "LollypopToken::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#1123(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#54: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 352, 16} {:message ""} true;
	call __send_ret#54 := __send(__msg_sender, __this, 0, userBalance_re_ent19#1094[__this][__msg_sender]);
	if (!(__send_ret#54)) {
	assume false;
	}

	userBalance_re_ent19#1094 := userBalance_re_ent19#1094[__this := userBalance_re_ent19#1094[__this][__msg_sender := 0]];
	$return32:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_34.sol", 370, 5} {:message "LollypopToken::decimals"} decimals#1132(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1127: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1127 := _decimals#580[__this];
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 373, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#1136: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_34.sol", 374, 1} {:message "LollypopToken::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#1170(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 377, 10} {:message "success"} success#1140: bool;
	var __call_ret#55: bool;
	var __call_ret#56: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#1136[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#1136[__this][__msg_sender])];
	assume {:sourceloc "buggy_34.sol", 377, 26} {:message ""} true;
	call __call_ret#55, __call_ret#56 := __call(__msg_sender, __this, userBalance_re_ent26#1136[__this][__msg_sender]);
	if (__call_ret#55) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#55)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#1136[__this][__msg_sender])];
	}

	success#1140 := __call_ret#55;
	if (!(success#1140)) {
	assume false;
	}

	userBalance_re_ent26#1136 := userBalance_re_ent26#1136[__this := userBalance_re_ent26#1136[__this][__msg_sender := 0]];
	$return34:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 395, 3} {:message "balances_re_ent31"} balances_re_ent31#1194: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 396, 1} {:message "LollypopToken::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1227(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1196: int)
{
	var __send_ret#57: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1194[__this][__msg_sender] >= _weiToWithdraw#1196);
	assume {:sourceloc "buggy_34.sol", 399, 13} {:message ""} true;
	call __send_ret#57 := __send(__msg_sender, __this, 0, _weiToWithdraw#1196);
	assume __send_ret#57;
	balances_re_ent31#1194 := balances_re_ent31#1194[__this := balances_re_ent31#1194[__this][__msg_sender := (balances_re_ent31#1194[__this][__msg_sender] - _weiToWithdraw#1196)]];
	$return35:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_34.sol", 408, 3} {:message "not_called_re_ent13"} not_called_re_ent13#1239: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_34.sol", 409, 1} {:message "LollypopToken::bug_re_ent13"} bug_re_ent13#1271(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 411, 3} {:message "success"} success#1247: bool;
	var __call_ret#58: bool;
	var __call_ret#59: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1239[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_34.sol", 411, 18} {:message ""} true;
	call __call_ret#58, __call_ret#59 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#58) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#58)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1247 := __call_ret#58;
	if (!(success#1247)) {
	assume false;
	}

	not_called_re_ent13#1239 := not_called_re_ent13#1239[__this := false];
	$return36:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 431, 5} {:message "LollypopToken::mint"} mint#1327(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1282: address_t, amount#1284: int)
{
	var call_arg#60: int_arr_ptr;
	var new_array#61: int_arr_ptr;
	var add#205_ret#62: int;
	var add#205_ret#63: int;
	var call_arg#64: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#61 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#60 := new_array#61;
	mem_arr_int := mem_arr_int[call_arg#60 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#1282 != 0);
	assume {:sourceloc "buggy_34.sol", 434, 24} {:message ""} true;
	call add#205_ret#62 := add#205(__this, __msg_sender, __msg_value, _totalSupply#426[__this], amount#1284);
	_totalSupply#426 := _totalSupply#426[__this := add#205_ret#62];
	assume {:sourceloc "buggy_34.sol", 435, 37} {:message ""} true;
	call add#205_ret#63 := add#205(__this, __msg_sender, __msg_value, amount#686#transferMapping#689#constr(_balances#356[__this][account#1282]), amount#1284);
	_balances#356 := _balances#356[__this := _balances#356[__this][account#1282 := transferMapping#689#constr(add#205_ret#63, time#688#transferMapping#689#constr(_balances#356[__this][account#1282]))]];
	call_arg#64 := 0;
	assume {:sourceloc "buggy_34.sol", 436, 14} {:message ""} true;
	call Transfer#1235(__this, __msg_sender, __msg_value, call_arg#64, account#1282, amount#1284);
	$return37:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_34.sol", 438, 1} {:message "not_called_re_ent20"} not_called_re_ent20#1330: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_34.sol", 439, 1} {:message "LollypopToken::bug_re_ent20"} bug_re_ent20#1357(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#65: int;
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#1330[__this];
	call_arg#65 := 1000000000000000000;
	assume {:sourceloc "buggy_34.sol", 441, 16} {:message ""} true;
	call __send_ret#66 := __send(__msg_sender, __this, 0, call_arg#65);
	if (!(__send_ret#66)) {
	assume false;
	}

	not_called_re_ent20#1330 := not_called_re_ent20#1330[__this := false];
	$return38:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 452, 5} {:message "LollypopToken::totalSupply"} totalSupply#1366(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1361: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1361 := _totalSupply#426[__this];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 455, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#1370: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_34.sol", 456, 1} {:message "LollypopToken::claimReward_re_ent32"} claimReward_re_ent32#1406(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 459, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#1383: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#1370[__this][__msg_sender] > 0);
	transferValue_re_ent32#1383 := redeemableEther_re_ent32#1370[__this][__msg_sender];
	assume {:sourceloc "buggy_34.sol", 460, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#1383);
	redeemableEther_re_ent32#1370 := redeemableEther_re_ent32#1370[__this := redeemableEther_re_ent32#1370[__this][__msg_sender := 0]];
	$return40:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 467, 5} {:message "LollypopToken::balanceOf"} balanceOf#1420(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1409: address_t)
	returns (#1412: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1412 := amount#686#transferMapping#689#constr(_balances#356[__this][account#1409]);
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 470, 1} {:message "balances_re_ent38"} balances_re_ent38#1424: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_34.sol", 471, 1} {:message "LollypopToken::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#1457(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1426: int)
{
	var __send_ret#67: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#1424[__this][__msg_sender] >= _weiToWithdraw#1426);
	assume {:sourceloc "buggy_34.sol", 474, 13} {:message ""} true;
	call __send_ret#67 := __send(__msg_sender, __this, 0, _weiToWithdraw#1426);
	assume __send_ret#67;
	balances_re_ent38#1424 := balances_re_ent38#1424[__this := balances_re_ent38#1424[__this][__msg_sender := (balances_re_ent38#1424[__this][__msg_sender] - _weiToWithdraw#1426)]];
	$return42:
	// Function body ends here
}

// 
// Function: timeOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 479, 2} {:message "LollypopToken::timeOf"} timeOf#1470(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1459: address_t)
	returns (#1462: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1462 := time#688#transferMapping#689#constr(_balances#356[__this][account#1459]);
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 482, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#1474: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_34.sol", 483, 1} {:message "LollypopToken::claimReward_re_ent4"} claimReward_re_ent4#1510(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 486, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#1487: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#1474[__this][__msg_sender] > 0);
	transferValue_re_ent4#1487 := redeemableEther_re_ent4#1474[__this][__msg_sender];
	assume {:sourceloc "buggy_34.sol", 487, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#1487);
	redeemableEther_re_ent4#1474 := redeemableEther_re_ent4#1474[__this := redeemableEther_re_ent4#1474[__this][__msg_sender := 0]];
	$return44:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 499, 5} {:message "LollypopToken::transfer"} transfer#1530(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#1513: address_t, amount#1515: int)
	returns (#1518: bool)
{
	var call_arg#68: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#68 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 500, 9} {:message ""} true;
	call _transfer#993(__this, __msg_sender, __msg_value, call_arg#68, recipient#1513, amount#1515);
	#1518 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_34.sol", 503, 1} {:message "counter_re_ent7"} counter_re_ent7#1533: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_34.sol", 504, 1} {:message "LollypopToken::callme_re_ent7"} callme_re_ent7#1562(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#69: int;
	var __send_ret#70: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1533[__this] <= 5);
	call_arg#69 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 506, 9} {:message ""} true;
	call __send_ret#70 := __send(__msg_sender, __this, 0, call_arg#69);
	if (!(__send_ret#70)) {
	assume false;
	}

	counter_re_ent7#1533 := counter_re_ent7#1533[__this := (counter_re_ent7#1533[__this] + 1)];
	$return46:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_34.sol", 512, 3} {:message "LollypopToken::multiTransfer"} multiTransfer#1602(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1565: address_t_arr_ptr, amounts#1568: int_arr_ptr)
{
	var {:sourceloc "buggy_34.sol", 514, 10} {:message "i"} i#1580: int;
	var transfer#1530_ret#73: bool;
	var tmp#74: int;
	// TCC assumptions
	assume (receivers#1565 < __alloc_counter);
	assume (amounts#1568 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1565])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1565]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[amounts#1568])) && (length#int_arr#constr(mem_arr_int[amounts#1568]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[receivers#1565]) == length#int_arr#constr(mem_arr_int[amounts#1568]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#1580 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1565])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1565]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1580 < length#address_t_arr#constr(mem_arr_address_t[receivers#1565]))) {
	// Body
	assume {:sourceloc "buggy_34.sol", 515, 7} {:message ""} true;
	call transfer#1530_ret#73 := transfer#1530(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1565])[i#1580], arr#int_arr#constr(mem_arr_int[amounts#1568])[i#1580]);
	$continue71:
	// Loop expression
	tmp#74 := i#1580;
	i#1580 := (i#1580 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1565])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1565]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break72:
	$return47:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_34.sol", 518, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1604: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_34.sol", 519, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1606: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_34.sol", 520, 4} {:message "LollypopToken::buyTicket_re_ent23"} buyTicket_re_ent23#1636(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#75: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 521, 12} {:message ""} true;
	call __send_ret#75 := __send(lastPlayer_re_ent23#1604[__this], __this, 0, jackpot_re_ent23#1606[__this]);
	if (!(__send_ret#75)) {
	assume false;
	}

	lastPlayer_re_ent23#1604 := lastPlayer_re_ent23#1604[__this := __msg_sender];
	jackpot_re_ent23#1606 := jackpot_re_ent23#1606[__this := __balance[__this]];
	$return48:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 531, 5} {:message "LollypopToken::allowance"} allowance#1653(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1639: address_t, spender#1641: address_t)
	returns (#1644: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1644 := _allowances#392[__this][owner#1639][spender#1641];
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_34.sol", 534, 1} {:message "counter_re_ent14"} counter_re_ent14#1656: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_34.sol", 535, 1} {:message "LollypopToken::callme_re_ent14"} callme_re_ent14#1685(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#76: int;
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1656[__this] <= 5);
	call_arg#76 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 537, 9} {:message ""} true;
	call __send_ret#77 := __send(__msg_sender, __this, 0, call_arg#76);
	if (!(__send_ret#77)) {
	assume false;
	}

	counter_re_ent14#1656 := counter_re_ent14#1656[__this := (counter_re_ent14#1656[__this] + 1)];
	$return50:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 550, 5} {:message "LollypopToken::approve"} approve#1705(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1688: address_t, value#1690: int)
	returns (#1693: bool)
{
	var call_arg#78: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#78 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 551, 9} {:message ""} true;
	call _approve#2056(__this, __msg_sender, __msg_value, call_arg#78, spender#1688, value#1690);
	#1693 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_34.sol", 554, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1707: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_34.sol", 555, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1709: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_34.sol", 556, 4} {:message "LollypopToken::buyTicket_re_ent30"} buyTicket_re_ent30#1739(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#79: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 557, 12} {:message ""} true;
	call __send_ret#79 := __send(lastPlayer_re_ent30#1707[__this], __this, 0, jackpot_re_ent30#1709[__this]);
	if (!(__send_ret#79)) {
	assume false;
	}

	lastPlayer_re_ent30#1707 := lastPlayer_re_ent30#1707[__this := __msg_sender];
	jackpot_re_ent30#1709 := jackpot_re_ent30#1709[__this := __balance[__this]];
	$return52:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 575, 5} {:message "LollypopToken::transferFrom"} transferFrom#1775(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#1742: address_t, recipient#1744: address_t, amount#1746: int)
	returns (#1749: bool)
{
	var call_arg#80: address_t;
	var sub#231_ret#81: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 576, 9} {:message ""} true;
	call _transfer#993(__this, __msg_sender, __msg_value, sender#1742, recipient#1744, amount#1746);
	call_arg#80 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 577, 38} {:message ""} true;
	call sub#231_ret#81 := sub#231(__this, __msg_sender, __msg_value, _allowances#392[__this][sender#1742][__msg_sender], amount#1746);
	assume {:sourceloc "buggy_34.sol", 577, 9} {:message ""} true;
	call _approve#2056(__this, __msg_sender, __msg_value, sender#1742, call_arg#80, sub#231_ret#81);
	#1749 := true;
	goto $return53;
	$return53:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 580, 1} {:message "balances_re_ent8"} balances_re_ent8#1779: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_34.sol", 581, 5} {:message "LollypopToken::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1808(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 582, 6} {:message "success"} success#1783: bool;
	var __call_ret#82: bool;
	var __call_ret#83: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1779[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1779[__this][__msg_sender])];
	assume {:sourceloc "buggy_34.sol", 582, 23} {:message ""} true;
	call __call_ret#82, __call_ret#83 := __call(__msg_sender, __this, balances_re_ent8#1779[__this][__msg_sender]);
	if (__call_ret#82) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#82)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1779[__this][__msg_sender])];
	}

	success#1783 := __call_ret#82;
	if (success#1783) {
	balances_re_ent8#1779 := balances_re_ent8#1779[__this := balances_re_ent8#1779[__this][__msg_sender := 0]];
	}

	$return54:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 599, 5} {:message "LollypopToken::increaseAllowance"} increaseAllowance#1836(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1811: address_t, addedValue#1813: int)
	returns (#1816: bool)
{
	var call_arg#84: address_t;
	var add#205_ret#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#84 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 600, 39} {:message ""} true;
	call add#205_ret#85 := add#205(__this, __msg_sender, __msg_value, _allowances#392[__this][__msg_sender][spender#1811], addedValue#1813);
	assume {:sourceloc "buggy_34.sol", 600, 9} {:message ""} true;
	call _approve#2056(__this, __msg_sender, __msg_value, call_arg#84, spender#1811, add#205_ret#85);
	#1816 := true;
	goto $return55;
	$return55:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 603, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1840: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_34.sol", 604, 1} {:message "LollypopToken::claimReward_re_ent39"} claimReward_re_ent39#1876(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 607, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1853: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1840[__this][__msg_sender] > 0);
	transferValue_re_ent39#1853 := redeemableEther_re_ent39#1840[__this][__msg_sender];
	assume {:sourceloc "buggy_34.sol", 608, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1853);
	redeemableEther_re_ent39#1840 := redeemableEther_re_ent39#1840[__this := redeemableEther_re_ent39#1840[__this][__msg_sender := 0]];
	$return56:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 626, 5} {:message "LollypopToken::decreaseAllowance"} decreaseAllowance#1904(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1879: address_t, subtractedValue#1881: int)
	returns (#1884: bool)
{
	var call_arg#86: address_t;
	var sub#231_ret#87: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#86 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 627, 39} {:message ""} true;
	call sub#231_ret#87 := sub#231(__this, __msg_sender, __msg_value, _allowances#392[__this][__msg_sender][spender#1879], subtractedValue#1881);
	assume {:sourceloc "buggy_34.sol", 627, 9} {:message ""} true;
	call _approve#2056(__this, __msg_sender, __msg_value, call_arg#86, spender#1879, sub#231_ret#87);
	#1884 := true;
	goto $return57;
	$return57:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 630, 1} {:message "balances_re_ent36"} balances_re_ent36#1908: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_34.sol", 631, 5} {:message "LollypopToken::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1931(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#88: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 632, 14} {:message ""} true;
	call __send_ret#88 := __send(__msg_sender, __this, 0, balances_re_ent36#1908[__this][__msg_sender]);
	if (__send_ret#88) {
	balances_re_ent36#1908 := balances_re_ent36#1908[__this := balances_re_ent36#1908[__this][__msg_sender := 0]];
	}

	$return58:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 665, 5} {:message "LollypopToken::_burn"} _burn#1979(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1934: address_t, value#1936: int)
{
	var call_arg#89: int_arr_ptr;
	var new_array#90: int_arr_ptr;
	var sub#231_ret#91: int;
	var sub#231_ret#92: int;
	var call_arg#93: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#90 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#89 := new_array#90;
	mem_arr_int := mem_arr_int[call_arg#89 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#1934 != 0);
	assume {:sourceloc "buggy_34.sol", 668, 24} {:message ""} true;
	call sub#231_ret#91 := sub#231(__this, __msg_sender, __msg_value, _totalSupply#426[__this], value#1936);
	_totalSupply#426 := _totalSupply#426[__this := sub#231_ret#91];
	assume {:sourceloc "buggy_34.sol", 669, 37} {:message ""} true;
	call sub#231_ret#92 := sub#231(__this, __msg_sender, __msg_value, amount#686#transferMapping#689#constr(_balances#356[__this][account#1934]), value#1936);
	_balances#356 := _balances#356[__this := _balances#356[__this][account#1934 := transferMapping#689#constr(sub#231_ret#92, time#688#transferMapping#689#constr(_balances#356[__this][account#1934]))]];
	call_arg#93 := 0;
	assume {:sourceloc "buggy_34.sol", 670, 14} {:message ""} true;
	call Transfer#1235(__this, __msg_sender, __msg_value, account#1934, call_arg#93, value#1936);
	$return59:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_34.sol", 672, 1} {:message "counter_re_ent35"} counter_re_ent35#1982: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_34.sol", 673, 1} {:message "LollypopToken::callme_re_ent35"} callme_re_ent35#2011(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#94: int;
	var __send_ret#95: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1982[__this] <= 5);
	call_arg#94 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 675, 9} {:message ""} true;
	call __send_ret#95 := __send(__msg_sender, __this, 0, call_arg#94);
	if (!(__send_ret#95)) {
	assume false;
	}

	counter_re_ent35#1982 := counter_re_ent35#1982[__this := (counter_re_ent35#1982[__this] + 1)];
	$return60:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 694, 5} {:message "LollypopToken::_approve"} _approve#2056(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#2014: address_t, spender#2016: address_t, value#2018: int)
{
	var call_arg#96: int_arr_ptr;
	var new_array#97: int_arr_ptr;
	var call_arg#98: int_arr_ptr;
	var new_array#99: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#97 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#96 := new_array#97;
	mem_arr_int := mem_arr_int[call_arg#96 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#2014 != 0);
	new_array#99 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#98 := new_array#99;
	mem_arr_int := mem_arr_int[call_arg#98 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#2016 != 0);
	_allowances#392 := _allowances#392[__this := _allowances#392[__this][owner#2014 := _allowances#392[__this][owner#2014][spender#2016 := value#2018]]];
	assume {:sourceloc "buggy_34.sol", 699, 14} {:message ""} true;
	call Approval#1279(__this, __msg_sender, __msg_value, owner#2014, spender#2016, value#2018);
	$return61:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 701, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#2060: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_34.sol", 702, 1} {:message "LollypopToken::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#2094(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 705, 3} {:message "success"} success#2064: bool;
	var __call_ret#100: bool;
	var __call_ret#101: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#2060[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#2060[__this][__msg_sender])];
	assume {:sourceloc "buggy_34.sol", 705, 18} {:message ""} true;
	call __call_ret#100, __call_ret#101 := __call(__msg_sender, __this, userBalance_re_ent40#2060[__this][__msg_sender]);
	if (__call_ret#100) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#100)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#2060[__this][__msg_sender])];
	}

	success#2064 := __call_ret#100;
	if (!(success#2064)) {
	assume false;
	}

	userBalance_re_ent40#2060 := userBalance_re_ent40#2060[__this := userBalance_re_ent40#2060[__this][__msg_sender := 0]];
	$return62:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 718, 5} {:message "LollypopToken::_burnFrom"} _burnFrom#2123(__this: address_t, __msg_sender: address_t, __msg_value: int, account#2097: address_t, amount#2099: int)
{
	var call_arg#102: address_t;
	var sub#231_ret#103: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 719, 9} {:message ""} true;
	call _burn#1979(__this, __msg_sender, __msg_value, account#2097, amount#2099);
	call_arg#102 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 720, 39} {:message ""} true;
	call sub#231_ret#103 := sub#231(__this, __msg_sender, __msg_value, _allowances#392[__this][account#2097][__msg_sender], amount#2099);
	assume {:sourceloc "buggy_34.sol", 720, 9} {:message ""} true;
	call _approve#2056(__this, __msg_sender, __msg_value, account#2097, call_arg#102, sub#231_ret#103);
	$return63:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_34.sol", 722, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#2127: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_34.sol", 723, 1} {:message "LollypopToken::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#2161(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 726, 3} {:message "success"} success#2131: bool;
	var __call_ret#104: bool;
	var __call_ret#105: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#2127[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#2127[__this][__msg_sender])];
	assume {:sourceloc "buggy_34.sol", 726, 19} {:message ""} true;
	call __call_ret#104, __call_ret#105 := __call(__msg_sender, __this, userBalance_re_ent33#2127[__this][__msg_sender]);
	if (__call_ret#104) {
	havoc counter_re_ent28#323;
	havoc _balances#356;
	havoc not_called_re_ent34#359;
	havoc _allowances#392;
	havoc counter_re_ent21#395;
	havoc _totalSupply#426;
	havoc balances_re_ent10#430;
	havoc _maxTotalSupply#465;
	havoc balances_re_ent21#469;
	havoc _name#501;
	havoc userBalance_re_ent12#505;
	havoc _symbol#537;
	havoc redeemableEther_re_ent11#541;
	havoc _decimals#580;
	havoc balances_re_ent1#584;
	havoc maxAgeOfToken#616;
	havoc not_called_re_ent41#619;
	havoc minAgeOfToken#649;
	havoc counter_re_ent42#652;
	havoc perDayBonus#684;
	havoc lastPlayer_re_ent37#728;
	havoc jackpot_re_ent37#730;
	havoc balances_re_ent3#802;
	havoc lastPlayer_re_ent9#995;
	havoc jackpot_re_ent9#997;
	havoc redeemableEther_re_ent25#1045;
	havoc userBalance_re_ent19#1094;
	havoc userBalance_re_ent26#1136;
	havoc balances_re_ent31#1194;
	havoc not_called_re_ent13#1239;
	havoc not_called_re_ent20#1330;
	havoc redeemableEther_re_ent32#1370;
	havoc balances_re_ent38#1424;
	havoc redeemableEther_re_ent4#1474;
	havoc counter_re_ent7#1533;
	havoc lastPlayer_re_ent23#1604;
	havoc jackpot_re_ent23#1606;
	havoc counter_re_ent14#1656;
	havoc lastPlayer_re_ent30#1707;
	havoc jackpot_re_ent30#1709;
	havoc balances_re_ent8#1779;
	havoc redeemableEther_re_ent39#1840;
	havoc balances_re_ent36#1908;
	havoc counter_re_ent35#1982;
	havoc userBalance_re_ent40#2060;
	havoc userBalance_re_ent33#2127;
	havoc balances_re_ent15#5;
	havoc owner#30;
	havoc not_called_re_ent27#33;
	havoc lastPlayer_re_ent2#80;
	havoc jackpot_re_ent2#82;
	havoc balances_re_ent17#139;
	havoc __balance;
	}

	if (!(__call_ret#104)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#2127[__this][__msg_sender])];
	}

	success#2131 := __call_ret#104;
	if (!(success#2131)) {
	assume false;
	}

	userBalance_re_ent33#2127 := userBalance_re_ent33#2127[__this := userBalance_re_ent33#2127[__this][__msg_sender := 0]];
	$return64:
	// Function body ends here
}

