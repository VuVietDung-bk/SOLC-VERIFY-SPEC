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
procedure {:inline 1} {:sourceloc "buggy_34.sol", 21, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#54(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#50: address_t, _to#52: address_t)
{
	
}

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
// Function: cash_unchk22 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_34.sol", 9, 2} {:message "Ownable::cash_unchk22"} cash_unchk22#25(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#3: int, subpotIndex#5: int, winner_unchk22#7: address_t)
{
	var {:sourceloc "buggy_34.sol", 10, 9} {:message "subpot_unchk22"} subpot_unchk22#11: int;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk22#11 := 10000000000000000000;
	call_arg#0 := subpot_unchk22#11;
	assume {:sourceloc "buggy_34.sol", 11, 9} {:message ""} true;
	call __send_ret#1 := __send(winner_unchk22#7, __this, 0, call_arg#0);
	subpot_unchk22#11 := 0;
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_34.sol", 14, 3} {:message "owner"} owner#27: [address_t]address_t;
// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_34.sol", 16, 2} {:message "Ownable::bug_unchk31"} bug_unchk31#48(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 17, 1} {:message "addr_unchk31"} addr_unchk31#31: address_t;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#31 := 0;
	call_arg#2 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 18, 6} {:message ""} true;
	call __send_ret#3 := __send(addr_unchk31#31, __this, 0, call_arg#2);
	if ((!(__send_ret#3) || (1 == 1))) {
	assume false;
	}

	$return1:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 23, 8} {:message "Ownable::[constructor]"} __constructor#126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#27 := owner#27[__this := 0];
	payedOut_unchk9#104 := payedOut_unchk9#104[__this := false];
	// Function body starts here
	owner#27 := owner#27[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 26, 1} {:message "Ownable::bug_unchk3"} bug_unchk3#78(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#68: address_t)
{
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#4 := 42000000000000000000;
	assume {:sourceloc "buggy_34.sol", 27, 8} {:message ""} true;
	call __send_ret#5 := __send(addr#68, __this, 0, call_arg#4);
	$return3:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_34.sol", 34, 4} {:message "Ownable::transferOwnership"} transferOwnership#101(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#91: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#27[__this]);
	// Function body starts here
	owner#27 := owner#27[__this := _newOwner#91];
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_34.sol", 37, 1} {:message "payedOut_unchk9"} payedOut_unchk9#104: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_34.sol", 39, 1} {:message "Ownable::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#125(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#104[__this];
	assume {:sourceloc "buggy_34.sol", 41, 5} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return6:
	// Function body ends here
}

// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 56, 5} {:message "SafeMath::add"} add#152(__this: address_t, __msg_sender: address_t, __msg_value: int, a#129: int, b#131: int)
	returns (#134: int)
{
	var {:sourceloc "buggy_34.sol", 57, 9} {:message "c"} c#137: int;
	var call_arg#9: int_arr_ptr;
	var new_array#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#137 := (a#129 + b#131);
	new_array#10 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#9 := new_array#10;
	mem_arr_int := mem_arr_int[call_arg#9 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#137 >= a#129);
	#134 := c#137;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 72, 5} {:message "SafeMath::sub"} sub#178(__this: address_t, __msg_sender: address_t, __msg_value: int, a#155: int, b#157: int)
	returns (#160: int)
{
	var call_arg#11: int_arr_ptr;
	var new_array#12: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 74, 9} {:message "c"} c#170: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#12 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#11 := new_array#12;
	mem_arr_int := mem_arr_int[call_arg#11 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#157 <= a#155);
	c#170 := (a#155 - b#157);
	#160 := c#170;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 88, 5} {:message "SafeMath::mul"} mul#213(__this: address_t, __msg_sender: address_t, __msg_value: int, a#181: int, b#183: int)
	returns (#186: int)
{
	var {:sourceloc "buggy_34.sol", 96, 9} {:message "c"} c#196: int;
	var call_arg#13: int_arr_ptr;
	var new_array#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#181 == 0)) {
	#186 := 0;
	goto $return9;
	}

	c#196 := (a#181 * b#183);
	new_array#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#13 := new_array#14;
	mem_arr_int := mem_arr_int[call_arg#13 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 117][12 := 108][13 := 116][14 := 105][15 := 112][16 := 108][17 := 105][18 := 99][19 := 97][20 := 116][21 := 105][22 := 111][23 := 110][24 := 32][25 := 111][26 := 118][27 := 101][28 := 114][29 := 102][30 := 108][31 := 111][32 := 119], 33)];
	assume ((c#196 div a#181) == b#183);
	#186 := c#196;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 113, 5} {:message "SafeMath::div"} div#239(__this: address_t, __msg_sender: address_t, __msg_value: int, a#216: int, b#218: int)
	returns (#221: int)
{
	var call_arg#15: int_arr_ptr;
	var new_array#16: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 116, 9} {:message "c"} c#231: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#16 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#15 := new_array#16;
	mem_arr_int := mem_arr_int[call_arg#15 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 100][11 := 105][12 := 118][13 := 105][14 := 115][15 := 105][16 := 111][17 := 110][18 := 32][19 := 98][20 := 121][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111], 26)];
	assume (b#218 > 0);
	c#231 := (a#216 div b#218);
	#221 := c#231;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 133, 5} {:message "SafeMath::mod"} mod#261(__this: address_t, __msg_sender: address_t, __msg_value: int, a#242: int, b#244: int)
	returns (#247: int)
{
	var call_arg#17: int_arr_ptr;
	var new_array#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#18 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#17 := new_array#18;
	mem_arr_int := mem_arr_int[call_arg#17 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 109][11 := 111][12 := 100][13 := 117][14 := 108][15 := 111][16 := 32][17 := 98][18 := 121][19 := 32][20 := 122][21 := 101][22 := 114][23 := 111], 24)];
	assume (b#244 != 0);
	#247 := (a#242 mod b#244);
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_34.sol", 46, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#262(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: LollypopToken -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_34.sol", 331, 3} {:message "[event] LollypopToken::Transfer"} Transfer#884(__this: address_t, __msg_sender: address_t, __msg_value: int, from#878: address_t, to#880: address_t, value#882: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_34.sol", 340, 3} {:message "[event] LollypopToken::Approval"} Approval#907(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#901: address_t, spender#903: address_t, value#905: int)
{
	
}

// Using library SafeMath for uint256
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
// Function: my_func_uncheck12 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 142, 3} {:message "LollypopToken::my_func_uncheck12"} my_func_uncheck12#282(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#269: address_t)
{
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_34.sol", 143, 7} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(dst#269, __this, __msg_value);
	if (__call_ret#19) {
	havoc _balances#286;
	havoc _allowances#305;
	havoc _totalSupply#321;
	havoc _maxTotalSupply#340;
	havoc _name#368;
	havoc _symbol#383;
	havoc _decimals#407;
	havoc maxAgeOfToken#425;
	havoc minAgeOfToken#445;
	havoc perDayBonus#462;
	havoc payedOut_unchk20#753;
	havoc winner_unchk20#755;
	havoc winAmount_unchk20#757;
	havoc payedOut_unchk32#788;
	havoc winner_unchk32#790;
	havoc winAmount_unchk32#792;
	havoc payedOut_unchk45#855;
	havoc payedOut_unchk8#1181;
	havoc winner_unchk8#1183;
	havoc winAmount_unchk8#1185;
	havoc payedOut_unchk44#1359;
	havoc winner_unchk44#1361;
	havoc winAmount_unchk44#1363;
	havoc payedOut_unchk33#1493;
	havoc owner#27;
	havoc payedOut_unchk9#104;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return12:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => struct LollypopToken.transferMapping storage ref)
type {:datatype} struct_storage_transferMapping#467;
var {:sourceloc "buggy_34.sol", 145, 3} {:message "_balances"} _balances#286: [address_t][address_t]struct_storage_transferMapping#467;
// 
// Function: my_func_unchk11 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 147, 3} {:message "LollypopToken::my_func_unchk11"} my_func_unchk11#299(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#288: address_t)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 148, 9} {:message ""} true;
	call __send_ret#21 := __send(dst#288, __this, 0, __msg_value);
	$return13:
	// Function body ends here
}

// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_34.sol", 150, 3} {:message "_allowances"} _allowances#305: [address_t][address_t][address_t]int;
// 
// Function: callnotchecked_unchk1 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 152, 5} {:message "LollypopToken::callnotchecked_unchk1"} callnotchecked_unchk1#319(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#307: address_t)
{
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 2000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 2000000000000000000)];
	assume {:sourceloc "buggy_34.sol", 153, 9} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(callee#307, __this, 2000000000000000000);
	if (__call_ret#22) {
	havoc _balances#286;
	havoc _allowances#305;
	havoc _totalSupply#321;
	havoc _maxTotalSupply#340;
	havoc _name#368;
	havoc _symbol#383;
	havoc _decimals#407;
	havoc maxAgeOfToken#425;
	havoc minAgeOfToken#445;
	havoc perDayBonus#462;
	havoc payedOut_unchk20#753;
	havoc winner_unchk20#755;
	havoc winAmount_unchk20#757;
	havoc payedOut_unchk32#788;
	havoc winner_unchk32#790;
	havoc winAmount_unchk32#792;
	havoc payedOut_unchk45#855;
	havoc payedOut_unchk8#1181;
	havoc winner_unchk8#1183;
	havoc winAmount_unchk8#1185;
	havoc payedOut_unchk44#1359;
	havoc winner_unchk44#1361;
	havoc winAmount_unchk44#1363;
	havoc payedOut_unchk33#1493;
	havoc owner#27;
	havoc payedOut_unchk9#104;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + 2000000000000000000)];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_34.sol", 155, 3} {:message "_totalSupply"} _totalSupply#321: [address_t]int;
// 
// Function: withdrawBal_unchk41 : function ()
procedure {:sourceloc "buggy_34.sol", 156, 3} {:message "LollypopToken::withdrawBal_unchk41"} withdrawBal_unchk41#338(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 157, 5} {:message "Balances_unchk41"} Balances_unchk41#325: int;
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk41#325 := 0;
	call_arg#24 := Balances_unchk41#325;
	assume {:sourceloc "buggy_34.sol", 158, 5} {:message ""} true;
	call __send_ret#25 := __send(__msg_sender, __this, 0, call_arg#24);
	$return15:
	// Function body ends here
}

// 
// State variable: _maxTotalSupply: uint256
var {:sourceloc "buggy_34.sol", 159, 3} {:message "_maxTotalSupply"} _maxTotalSupply#340: [address_t]int;
// 
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_34.sol", 162, 3} {:message "LollypopToken::bug_unchk42"} bug_unchk42#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 163, 1} {:message "receivers_unchk42"} receivers_unchk42#344: int;
	var {:sourceloc "buggy_34.sol", 164, 1} {:message "addr_unchk42"} addr_unchk42#347: address_t;
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#344 := 0;
	addr_unchk42#347 := 0;
	call_arg#26 := 42000000000000000000;
	assume {:sourceloc "buggy_34.sol", 165, 6} {:message ""} true;
	call __send_ret#27 := __send(addr_unchk42#347, __this, 0, call_arg#26);
	if (!(__send_ret#27)) {
	receivers_unchk42#344 := (receivers_unchk42#344 + 1);
	}
	else {
	assume false;
	}

	$return16:
	// Function body ends here
}

// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_34.sol", 170, 3} {:message "_name"} _name#368: [address_t]int_arr_type;
// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 171, 3} {:message "LollypopToken::unhandledsend_unchk2"} unhandledsend_unchk2#380(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#370: address_t)
{
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#28 := 5000000000000000000;
	assume {:sourceloc "buggy_34.sol", 172, 5} {:message ""} true;
	call __send_ret#29 := __send(callee#370, __this, 0, call_arg#28);
	$return17:
	// Function body ends here
}

// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_34.sol", 174, 3} {:message "_symbol"} _symbol#383: [address_t]int_arr_type;
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_34.sol", 175, 3} {:message "LollypopToken::bug_unchk43"} bug_unchk43#404(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 176, 1} {:message "addr_unchk43"} addr_unchk43#387: address_t;
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#387 := 0;
	call_arg#30 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 177, 6} {:message ""} true;
	call __send_ret#31 := __send(addr_unchk43#387, __this, 0, call_arg#30);
	if ((!(__send_ret#31) || (1 == 1))) {
	assume false;
	}

	$return18:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_34.sol", 180, 3} {:message "_decimals"} _decimals#407: [address_t]int;
// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 182, 5} {:message "LollypopToken::my_func_uncheck48"} my_func_uncheck48#422(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#409: address_t)
{
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_34.sol", 183, 17} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(dst#409, __this, __msg_value);
	if (__call_ret#32) {
	havoc _balances#286;
	havoc _allowances#305;
	havoc _totalSupply#321;
	havoc _maxTotalSupply#340;
	havoc _name#368;
	havoc _symbol#383;
	havoc _decimals#407;
	havoc maxAgeOfToken#425;
	havoc minAgeOfToken#445;
	havoc perDayBonus#462;
	havoc payedOut_unchk20#753;
	havoc winner_unchk20#755;
	havoc winAmount_unchk20#757;
	havoc payedOut_unchk32#788;
	havoc winner_unchk32#790;
	havoc winAmount_unchk32#792;
	havoc payedOut_unchk45#855;
	havoc payedOut_unchk8#1181;
	havoc winner_unchk8#1183;
	havoc winAmount_unchk8#1185;
	havoc payedOut_unchk44#1359;
	havoc winner_unchk44#1361;
	havoc winAmount_unchk44#1363;
	havoc payedOut_unchk33#1493;
	havoc owner#27;
	havoc payedOut_unchk9#104;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return19:
	// Function body ends here
}

// 
// State variable: maxAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 185, 3} {:message "maxAgeOfToken"} maxAgeOfToken#425: [address_t]int;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_34.sol", 186, 3} {:message "LollypopToken::withdrawBal_unchk17"} withdrawBal_unchk17#442(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 187, 2} {:message "Balances_unchk17"} Balances_unchk17#429: int;
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#429 := 0;
	call_arg#34 := Balances_unchk17#429;
	assume {:sourceloc "buggy_34.sol", 188, 5} {:message ""} true;
	call __send_ret#35 := __send(__msg_sender, __this, 0, call_arg#34);
	$return20:
	// Function body ends here
}

// 
// State variable: minAgeOfToken: uint256
var {:sourceloc "buggy_34.sol", 189, 3} {:message "minAgeOfToken"} minAgeOfToken#445: [address_t]int;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 190, 3} {:message "LollypopToken::callnotchecked_unchk37"} callnotchecked_unchk37#459(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#447: address_t)
{
	var __call_ret#36: bool;
	var __call_ret#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_34.sol", 191, 9} {:message ""} true;
	call __call_ret#36, __call_ret#37 := __call(callee#447, __this, 1000000000000000000);
	if (__call_ret#36) {
	havoc _balances#286;
	havoc _allowances#305;
	havoc _totalSupply#321;
	havoc _maxTotalSupply#340;
	havoc _name#368;
	havoc _symbol#383;
	havoc _decimals#407;
	havoc maxAgeOfToken#425;
	havoc minAgeOfToken#445;
	havoc perDayBonus#462;
	havoc payedOut_unchk20#753;
	havoc winner_unchk20#755;
	havoc winAmount_unchk20#757;
	havoc payedOut_unchk32#788;
	havoc winner_unchk32#790;
	havoc winAmount_unchk32#792;
	havoc payedOut_unchk45#855;
	havoc payedOut_unchk8#1181;
	havoc winner_unchk8#1183;
	havoc winAmount_unchk8#1185;
	havoc payedOut_unchk44#1359;
	havoc winner_unchk44#1361;
	havoc winAmount_unchk44#1363;
	havoc payedOut_unchk33#1493;
	havoc owner#27;
	havoc payedOut_unchk9#104;
	havoc __balance;
	}

	if (!(__call_ret#36)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return21:
	// Function body ends here
}

// 
// State variable: perDayBonus: uint256
var {:sourceloc "buggy_34.sol", 193, 3} {:message "perDayBonus"} perDayBonus#462: [address_t]int;
// 
// ------- Struct transferMapping -------
// Storage
function {:constructor} transferMapping#467#constr(amount#464: int, time#466: int) returns (struct_storage_transferMapping#467);
// Memory
type address_struct_memory_transferMapping#467 = int;
// Member amount
var {:sourceloc "buggy_34.sol", 196, 9} {:message "amount"} amount#464: [address_struct_memory_transferMapping#467]int;
// Member time
var {:sourceloc "buggy_34.sol", 197, 9} {:message "time"} time#466: [address_struct_memory_transferMapping#467]int;
// 
// ------- End of struct transferMapping -------
function {:builtin "((as const (Array Int |T@struct_storage_transferMapping#467|)) (|transferMapping#467#constr| 0 0))"} default_address_t_struct_storage_transferMapping#467() returns ([address_t]struct_storage_transferMapping#467);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_34.sol", 201, 5} {:message "LollypopToken::[constructor]"} __constructor#1556(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#286 := _balances#286[__this := default_address_t_struct_storage_transferMapping#467()];
	_allowances#305 := _allowances#305[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#321 := _totalSupply#321[__this := 0];
	_maxTotalSupply#340 := _maxTotalSupply#340[__this := 0];
	_name#368 := _name#368[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121][5 := 112][6 := 111][7 := 112], 8)];
	_symbol#383 := _symbol#383[__this := int_arr#constr(default_int_int()[0 := 76][1 := 111][2 := 108][3 := 108][4 := 121], 5)];
	_decimals#407 := _decimals#407[__this := 18];
	maxAgeOfToken#425 := maxAgeOfToken#425[__this := 31536000];
	minAgeOfToken#445 := minAgeOfToken#445[__this := 86400];
	perDayBonus#462 := perDayBonus#462[__this := 100];
	payedOut_unchk20#753 := payedOut_unchk20#753[__this := false];
	winner_unchk20#755 := winner_unchk20#755[__this := 0];
	winAmount_unchk20#757 := winAmount_unchk20#757[__this := 0];
	payedOut_unchk32#788 := payedOut_unchk32#788[__this := false];
	winner_unchk32#790 := winner_unchk32#790[__this := 0];
	winAmount_unchk32#792 := winAmount_unchk32#792[__this := 0];
	payedOut_unchk45#855 := payedOut_unchk45#855[__this := false];
	payedOut_unchk8#1181 := payedOut_unchk8#1181[__this := false];
	winner_unchk8#1183 := winner_unchk8#1183[__this := 0];
	winAmount_unchk8#1185 := winAmount_unchk8#1185[__this := 0];
	payedOut_unchk44#1359 := payedOut_unchk44#1359[__this := false];
	winner_unchk44#1361 := winner_unchk44#1361[__this := 0];
	winAmount_unchk44#1363 := winAmount_unchk44#1363[__this := 0];
	payedOut_unchk33#1493 := payedOut_unchk33#1493[__this := false];
	owner#27 := owner#27[__this := 0];
	payedOut_unchk9#104 := payedOut_unchk9#104[__this := false];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#27 := owner#27[__this := __msg_sender];
	$return22:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	_maxTotalSupply#340 := _maxTotalSupply#340[__this := 1000000000000000000000000000];
	_totalSupply#321 := _totalSupply#321[__this := 2000000000000000000000000];
	_balances#286 := _balances#286[__this := _balances#286[__this][__msg_sender := transferMapping#467#constr(_totalSupply#321[__this], time#466#transferMapping#467#constr(_balances#286[__this][__msg_sender]))]];
	_balances#286 := _balances#286[__this := _balances#286[__this][__msg_sender := transferMapping#467#constr(amount#464#transferMapping#467#constr(_balances#286[__this][__msg_sender]), __block_timestamp)]];
	$return23:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 209, 1} {:message "LollypopToken::callnotchecked_unchk25"} callnotchecked_unchk25#518(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#506: address_t)
{
	var __call_ret#39: bool;
	var __call_ret#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_34.sol", 210, 5} {:message ""} true;
	call __call_ret#39, __call_ret#40 := __call(callee#506, __this, 1000000000000000000);
	if (__call_ret#39) {
	havoc _balances#286;
	havoc _allowances#305;
	havoc _totalSupply#321;
	havoc _maxTotalSupply#340;
	havoc _name#368;
	havoc _symbol#383;
	havoc _decimals#407;
	havoc maxAgeOfToken#425;
	havoc minAgeOfToken#445;
	havoc perDayBonus#462;
	havoc payedOut_unchk20#753;
	havoc winner_unchk20#755;
	havoc winAmount_unchk20#757;
	havoc payedOut_unchk32#788;
	havoc winner_unchk32#790;
	havoc winAmount_unchk32#792;
	havoc payedOut_unchk45#855;
	havoc payedOut_unchk8#1181;
	havoc winner_unchk8#1183;
	havoc winAmount_unchk8#1185;
	havoc payedOut_unchk44#1359;
	havoc winner_unchk44#1361;
	havoc winAmount_unchk44#1363;
	havoc payedOut_unchk33#1493;
	havoc owner#27;
	havoc payedOut_unchk9#104;
	havoc __balance;
	}

	if (!(__call_ret#39)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return24:
	// Function body ends here
}

// 
// Function: calculateBonus : function (uint256,uint256) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 213, 5} {:message "LollypopToken::calculateBonus"} calculateBonus#556(__this: address_t, __msg_sender: address_t, __msg_value: int, timeElasped#520: int, amount#522: int)
	returns (#525: int)
{
	var {:sourceloc "buggy_34.sol", 214, 9} {:message "totalDays"} totalDays#528: int;
	var div#239_ret#41: int;
	var {:sourceloc "buggy_34.sol", 218, 9} {:message "totalBonus"} totalBonus#544: int;
	var div#239_ret#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 214, 29} {:message ""} true;
	call div#239_ret#41 := div#239(__this, __msg_sender, __msg_value, timeElasped#520, minAgeOfToken#445[__this]);
	totalDays#528 := div#239_ret#41;
	if ((totalDays#528 > maxAgeOfToken#425[__this])) {
	totalDays#528 := maxAgeOfToken#425[__this];
	}

	assume {:sourceloc "buggy_34.sol", 218, 30} {:message ""} true;
	call div#239_ret#42 := div#239(__this, __msg_sender, __msg_value, (totalDays#528 * amount#522), perDayBonus#462[__this]);
	totalBonus#544 := div#239_ret#42;
	#525 := totalBonus#544;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_34.sol", 222, 1} {:message "LollypopToken::bug_unchk19"} bug_unchk19#577(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 223, 1} {:message "addr_unchk19"} addr_unchk19#560: address_t;
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#560 := 0;
	call_arg#43 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 224, 6} {:message ""} true;
	call __send_ret#44 := __send(addr_unchk19#560, __this, 0, call_arg#43);
	if ((!(__send_ret#44) || (1 == 1))) {
	assume false;
	}

	$return26:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 229, 5} {:message "LollypopToken::_transfer"} _transfer#729(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#579: address_t, recipient#581: address_t, amount#583: int)
{
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	var call_arg#47: int_arr_ptr;
	var new_array#48: int_arr_ptr;
	var {:sourceloc "buggy_34.sol", 233, 9} {:message "senderTimeElasped"} senderTimeElasped#607: int;
	var {:sourceloc "buggy_34.sol", 234, 9} {:message "recipientTimeElasped"} recipientTimeElasped#618: int;
	var {:sourceloc "buggy_34.sol", 237, 13} {:message "bonus"} bonus#637: int;
	var balanceOf#1017_ret#49: int;
	var calculateBonus#556_ret#50: int;
	var {:sourceloc "buggy_34.sol", 242, 14} {:message "bonus"} bonus#665: int;
	var balanceOf#1017_ret#51: int;
	var calculateBonus#556_ret#52: int;
	var sub#178_ret#53: int;
	var add#152_ret#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#579 != 0);
	new_array#48 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#47 := new_array#48;
	mem_arr_int := mem_arr_int[call_arg#47 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#581 != 0);
	senderTimeElasped#607 := (__block_timestamp - time#466#transferMapping#467#constr(_balances#286[__this][sender#579]));
	recipientTimeElasped#618 := (__block_timestamp - time#466#transferMapping#467#constr(_balances#286[__this][recipient#581]));
	if (((senderTimeElasped#607 >= minAgeOfToken#445[__this]) && (_totalSupply#321[__this] < _maxTotalSupply#340[__this]))) {
	assume {:sourceloc "buggy_34.sol", 237, 64} {:message ""} true;
	call balanceOf#1017_ret#49 := balanceOf#1017(__this, __msg_sender, __msg_value, sender#579);
	assume {:sourceloc "buggy_34.sol", 237, 29} {:message ""} true;
	call calculateBonus#556_ret#50 := calculateBonus#556(__this, __msg_sender, __msg_value, senderTimeElasped#607, balanceOf#1017_ret#49);
	bonus#637 := calculateBonus#556_ret#50;
	assume {:sourceloc "buggy_34.sol", 238, 13} {:message ""} true;
	call mint#955(__this, __msg_sender, __msg_value, sender#579, bonus#637);
	}

	if ((((recipientTimeElasped#618 >= minAgeOfToken#445[__this]) && (_totalSupply#321[__this] < _maxTotalSupply#340[__this])) && (sender#579 != recipient#581))) {
	assume {:sourceloc "buggy_34.sol", 242, 68} {:message ""} true;
	call balanceOf#1017_ret#51 := balanceOf#1017(__this, __msg_sender, __msg_value, recipient#581);
	assume {:sourceloc "buggy_34.sol", 242, 30} {:message ""} true;
	call calculateBonus#556_ret#52 := calculateBonus#556(__this, __msg_sender, __msg_value, recipientTimeElasped#618, balanceOf#1017_ret#51);
	bonus#665 := calculateBonus#556_ret#52;
	assume {:sourceloc "buggy_34.sol", 243, 14} {:message ""} true;
	call mint#955(__this, __msg_sender, __msg_value, recipient#581, bonus#665);
	}

	assume {:sourceloc "buggy_34.sol", 247, 36} {:message ""} true;
	call sub#178_ret#53 := sub#178(__this, __msg_sender, __msg_value, amount#464#transferMapping#467#constr(_balances#286[__this][sender#579]), amount#583);
	_balances#286 := _balances#286[__this := _balances#286[__this][sender#579 := transferMapping#467#constr(sub#178_ret#53, time#466#transferMapping#467#constr(_balances#286[__this][sender#579]))]];
	assume {:sourceloc "buggy_34.sol", 248, 39} {:message ""} true;
	call add#152_ret#54 := add#152(__this, __msg_sender, __msg_value, amount#464#transferMapping#467#constr(_balances#286[__this][recipient#581]), amount#583);
	_balances#286 := _balances#286[__this := _balances#286[__this][recipient#581 := transferMapping#467#constr(add#152_ret#54, time#466#transferMapping#467#constr(_balances#286[__this][recipient#581]))]];
	_balances#286 := _balances#286[__this := _balances#286[__this][sender#579 := transferMapping#467#constr(amount#464#transferMapping#467#constr(_balances#286[__this][sender#579]), __block_timestamp)]];
	_balances#286 := _balances#286[__this := _balances#286[__this][recipient#581 := transferMapping#467#constr(amount#464#transferMapping#467#constr(_balances#286[__this][recipient#581]), __block_timestamp)]];
	assume {:sourceloc "buggy_34.sol", 253, 14} {:message ""} true;
	call Transfer#884(__this, __msg_sender, __msg_value, sender#579, recipient#581, amount#583);
	$return27:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 257, 1} {:message "LollypopToken::unhandledsend_unchk26"} unhandledsend_unchk26#741(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#731: address_t)
{
	var call_arg#55: int;
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#55 := 5000000000000000000;
	assume {:sourceloc "buggy_34.sol", 258, 5} {:message ""} true;
	call __send_ret#56 := __send(callee#731, __this, 0, call_arg#55);
	$return28:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 265, 5} {:message "LollypopToken::name"} name#750(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#745: int_arr_ptr)
{
	var new_array#57: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#57 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#745 := new_array#57;
	mem_arr_int := mem_arr_int[#745 := _name#368[__this]];
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_34.sol", 268, 1} {:message "payedOut_unchk20"} payedOut_unchk20#753: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_34.sol", 269, 1} {:message "winner_unchk20"} winner_unchk20#755: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_34.sol", 270, 1} {:message "winAmount_unchk20"} winAmount_unchk20#757: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_34.sol", 272, 1} {:message "LollypopToken::sendToWinner_unchk20"} sendToWinner_unchk20#776(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#58: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#753[__this]);
	assume {:sourceloc "buggy_34.sol", 274, 9} {:message ""} true;
	call __send_ret#58 := __send(winner_unchk20#755[__this], __this, 0, winAmount_unchk20#757[__this]);
	payedOut_unchk20#753 := payedOut_unchk20#753[__this := true];
	$return30:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_34.sol", 282, 5} {:message "LollypopToken::symbol"} symbol#785(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#780: int_arr_ptr)
{
	var new_array#59: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#59 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#780 := new_array#59;
	mem_arr_int := mem_arr_int[#780 := _symbol#383[__this]];
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_34.sol", 285, 1} {:message "payedOut_unchk32"} payedOut_unchk32#788: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_34.sol", 286, 1} {:message "winner_unchk32"} winner_unchk32#790: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_34.sol", 287, 1} {:message "winAmount_unchk32"} winAmount_unchk32#792: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_34.sol", 289, 1} {:message "LollypopToken::sendToWinner_unchk32"} sendToWinner_unchk32#811(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#60: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#788[__this]);
	assume {:sourceloc "buggy_34.sol", 291, 9} {:message ""} true;
	call __send_ret#60 := __send(winner_unchk32#790[__this], __this, 0, winAmount_unchk32#792[__this]);
	payedOut_unchk32#788 := payedOut_unchk32#788[__this := true];
	$return32:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_34.sol", 307, 5} {:message "LollypopToken::decimals"} decimals#820(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#815: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#815 := _decimals#407[__this];
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 310, 1} {:message "LollypopToken::unhandledsend_unchk38"} unhandledsend_unchk38#832(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#822: address_t)
{
	var call_arg#61: int;
	var __send_ret#62: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#61 := 5000000000000000000;
	assume {:sourceloc "buggy_34.sol", 311, 5} {:message ""} true;
	call __send_ret#62 := __send(callee#822, __this, 0, call_arg#61);
	$return34:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_34.sol", 325, 3} {:message "payedOut_unchk45"} payedOut_unchk45#855: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_34.sol", 327, 1} {:message "LollypopToken::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#876(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#63: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#855[__this];
	assume {:sourceloc "buggy_34.sol", 329, 5} {:message ""} true;
	call __send_ret#63 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return35:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_34.sol", 337, 3} {:message "LollypopToken::callnotchecked_unchk13"} callnotchecked_unchk13#899(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#887: address_t)
{
	var __call_ret#64: bool;
	var __call_ret#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_34.sol", 338, 9} {:message ""} true;
	call __call_ret#64, __call_ret#65 := __call(callee#887, __this, 1000000000000000000);
	if (__call_ret#64) {
	havoc _balances#286;
	havoc _allowances#305;
	havoc _totalSupply#321;
	havoc _maxTotalSupply#340;
	havoc _name#368;
	havoc _symbol#383;
	havoc _decimals#407;
	havoc maxAgeOfToken#425;
	havoc minAgeOfToken#445;
	havoc perDayBonus#462;
	havoc payedOut_unchk20#753;
	havoc winner_unchk20#755;
	havoc winAmount_unchk20#757;
	havoc payedOut_unchk32#788;
	havoc winner_unchk32#790;
	havoc winAmount_unchk32#792;
	havoc payedOut_unchk45#855;
	havoc payedOut_unchk8#1181;
	havoc winner_unchk8#1183;
	havoc winAmount_unchk8#1185;
	havoc payedOut_unchk44#1359;
	havoc winner_unchk44#1361;
	havoc winAmount_unchk44#1363;
	havoc payedOut_unchk33#1493;
	havoc owner#27;
	havoc payedOut_unchk9#104;
	havoc __balance;
	}

	if (!(__call_ret#64)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return36:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 354, 5} {:message "LollypopToken::mint"} mint#955(__this: address_t, __msg_sender: address_t, __msg_value: int, account#910: address_t, amount#912: int)
{
	var call_arg#66: int_arr_ptr;
	var new_array#67: int_arr_ptr;
	var add#152_ret#68: int;
	var add#152_ret#69: int;
	var call_arg#70: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#67 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#66 := new_array#67;
	mem_arr_int := mem_arr_int[call_arg#66 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#910 != 0);
	assume {:sourceloc "buggy_34.sol", 357, 24} {:message ""} true;
	call add#152_ret#68 := add#152(__this, __msg_sender, __msg_value, _totalSupply#321[__this], amount#912);
	_totalSupply#321 := _totalSupply#321[__this := add#152_ret#68];
	assume {:sourceloc "buggy_34.sol", 358, 37} {:message ""} true;
	call add#152_ret#69 := add#152(__this, __msg_sender, __msg_value, amount#464#transferMapping#467#constr(_balances#286[__this][account#910]), amount#912);
	_balances#286 := _balances#286[__this := _balances#286[__this][account#910 := transferMapping#467#constr(add#152_ret#69, time#466#transferMapping#467#constr(_balances#286[__this][account#910]))]];
	call_arg#70 := 0;
	assume {:sourceloc "buggy_34.sol", 359, 14} {:message ""} true;
	call Transfer#884(__this, __msg_sender, __msg_value, call_arg#70, account#910, amount#912);
	$return37:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_34.sol", 361, 1} {:message "LollypopToken::cash_unchk46"} cash_unchk46#979(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#957: int, subpotIndex#959: int, winner_unchk46#961: address_t)
{
	var {:sourceloc "buggy_34.sol", 362, 9} {:message "subpot_unchk46"} subpot_unchk46#965: int;
	var call_arg#71: int;
	var __send_ret#72: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#965 := 3000000000000000000;
	call_arg#71 := subpot_unchk46#965;
	assume {:sourceloc "buggy_34.sol", 363, 9} {:message ""} true;
	call __send_ret#72 := __send(winner_unchk46#961, __this, 0, call_arg#71);
	subpot_unchk46#965 := 0;
	$return38:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 372, 5} {:message "LollypopToken::totalSupply"} totalSupply#988(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#983: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#983 := _totalSupply#321[__this];
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_34.sol", 375, 1} {:message "LollypopToken::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#1003(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 376, 4} {:message "addr_unchk4"} addr_unchk4#992: address_t;
	var call_arg#73: int;
	var __send_ret#74: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#992 := 0;
	call_arg#73 := 42000000000000000000;
	assume {:sourceloc "buggy_34.sol", 377, 10} {:message ""} true;
	call __send_ret#74 := __send(addr_unchk4#992, __this, 0, call_arg#73);
	if (!(__send_ret#74)) {
	
	}
	else {
	
	}

	$return40:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 388, 5} {:message "LollypopToken::balanceOf"} balanceOf#1017(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1006: address_t)
	returns (#1009: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1009 := amount#464#transferMapping#467#constr(_balances#286[__this][account#1006]);
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_34.sol", 391, 1} {:message "LollypopToken::bug_unchk7"} bug_unchk7#1038(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 392, 1} {:message "addr_unchk7"} addr_unchk7#1021: address_t;
	var call_arg#75: int;
	var __send_ret#76: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#1021 := 0;
	call_arg#75 := 10000000000000000000;
	assume {:sourceloc "buggy_34.sol", 393, 6} {:message ""} true;
	call __send_ret#76 := __send(addr_unchk7#1021, __this, 0, call_arg#75);
	if ((!(__send_ret#76) || (1 == 1))) {
	assume false;
	}

	$return42:
	// Function body ends here
}

// 
// Function: timeOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 398, 2} {:message "LollypopToken::timeOf"} timeOf#1051(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1040: address_t)
	returns (#1043: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1043 := time#466#transferMapping#467#constr(_balances#286[__this][account#1040]);
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 401, 1} {:message "LollypopToken::my_func_unchk23"} my_func_unchk23#1064(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1053: address_t)
{
	var __send_ret#77: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 402, 9} {:message ""} true;
	call __send_ret#77 := __send(dst#1053, __this, 0, __msg_value);
	$return44:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 413, 5} {:message "LollypopToken::transfer"} transfer#1084(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#1067: address_t, amount#1069: int)
	returns (#1072: bool)
{
	var call_arg#78: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#78 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 414, 9} {:message ""} true;
	call _transfer#729(__this, __msg_sender, __msg_value, call_arg#78, recipient#1067, amount#1069);
	#1072 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 417, 1} {:message "LollypopToken::unhandledsend_unchk14"} unhandledsend_unchk14#1096(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1086: address_t)
{
	var call_arg#79: int;
	var __send_ret#80: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#79 := 5000000000000000000;
	assume {:sourceloc "buggy_34.sol", 418, 5} {:message ""} true;
	call __send_ret#80 := __send(callee#1086, __this, 0, call_arg#79);
	$return46:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: multiTransfer : function (address[] memory,uint256[] memory)
procedure {:sourceloc "buggy_34.sol", 421, 3} {:message "LollypopToken::multiTransfer"} multiTransfer#1136(__this: address_t, __msg_sender: address_t, __msg_value: int, receivers#1099: address_t_arr_ptr, amounts#1102: int_arr_ptr)
{
	var {:sourceloc "buggy_34.sol", 423, 10} {:message "i"} i#1114: int;
	var transfer#1084_ret#83: bool;
	var tmp#84: int;
	// TCC assumptions
	assume (receivers#1099 < __alloc_counter);
	assume (amounts#1102 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1099])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1099]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[amounts#1102])) && (length#int_arr#constr(mem_arr_int[amounts#1102]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[receivers#1099]) == length#int_arr#constr(mem_arr_int[amounts#1102]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#1114 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1099])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1099]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1114 < length#address_t_arr#constr(mem_arr_address_t[receivers#1099]))) {
	// Body
	assume {:sourceloc "buggy_34.sol", 424, 7} {:message ""} true;
	call transfer#1084_ret#83 := transfer#1084(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[receivers#1099])[i#1114], arr#int_arr#constr(mem_arr_int[amounts#1102])[i#1114]);
	$continue81:
	// Loop expression
	tmp#84 := i#1114;
	i#1114 := (i#1114 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[receivers#1099])) && (length#address_t_arr#constr(mem_arr_address_t[receivers#1099]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break82:
	$return47:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_34.sol", 427, 1} {:message "LollypopToken::bug_unchk30"} bug_unchk30#1161(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 428, 1} {:message "receivers_unchk30"} receivers_unchk30#1140: int;
	var {:sourceloc "buggy_34.sol", 429, 1} {:message "addr_unchk30"} addr_unchk30#1143: address_t;
	var call_arg#85: int;
	var __send_ret#86: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#1140 := 0;
	addr_unchk30#1143 := 0;
	call_arg#85 := 42000000000000000000;
	assume {:sourceloc "buggy_34.sol", 430, 6} {:message ""} true;
	call __send_ret#86 := __send(addr_unchk30#1143, __this, 0, call_arg#85);
	if (!(__send_ret#86)) {
	receivers_unchk30#1140 := (receivers_unchk30#1140 + 1);
	}
	else {
	assume false;
	}

	$return48:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_34.sol", 440, 5} {:message "LollypopToken::allowance"} allowance#1178(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1164: address_t, spender#1166: address_t)
	returns (#1169: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1169 := _allowances#305[__this][owner#1164][spender#1166];
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_34.sol", 443, 1} {:message "payedOut_unchk8"} payedOut_unchk8#1181: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_34.sol", 444, 1} {:message "winner_unchk8"} winner_unchk8#1183: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_34.sol", 445, 1} {:message "winAmount_unchk8"} winAmount_unchk8#1185: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_34.sol", 447, 1} {:message "LollypopToken::sendToWinner_unchk8"} sendToWinner_unchk8#1204(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#87: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#1181[__this]);
	assume {:sourceloc "buggy_34.sol", 449, 9} {:message ""} true;
	call __send_ret#87 := __send(winner_unchk8#1183[__this], __this, 0, winAmount_unchk8#1185[__this]);
	payedOut_unchk8#1181 := payedOut_unchk8#1181[__this := true];
	$return50:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 460, 5} {:message "LollypopToken::approve"} approve#1224(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1207: address_t, value#1209: int)
	returns (#1212: bool)
{
	var call_arg#88: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#88 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 461, 9} {:message ""} true;
	call _approve#1490(__this, __msg_sender, __msg_value, call_arg#88, spender#1207, value#1209);
	#1212 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 464, 1} {:message "LollypopToken::bug_unchk39"} bug_unchk39#1236(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1226: address_t)
{
	var call_arg#89: int;
	var __send_ret#90: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#89 := 4000000000000000000;
	assume {:sourceloc "buggy_34.sol", 465, 8} {:message ""} true;
	call __send_ret#90 := __send(addr#1226, __this, 0, call_arg#89);
	$return52:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 479, 5} {:message "LollypopToken::transferFrom"} transferFrom#1272(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#1239: address_t, recipient#1241: address_t, amount#1243: int)
	returns (#1246: bool)
{
	var call_arg#91: address_t;
	var sub#178_ret#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 480, 9} {:message ""} true;
	call _transfer#729(__this, __msg_sender, __msg_value, sender#1239, recipient#1241, amount#1243);
	call_arg#91 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 481, 38} {:message ""} true;
	call sub#178_ret#92 := sub#178(__this, __msg_sender, __msg_value, _allowances#305[__this][sender#1239][__msg_sender], amount#1243);
	assume {:sourceloc "buggy_34.sol", 481, 9} {:message ""} true;
	call _approve#1490(__this, __msg_sender, __msg_value, sender#1239, call_arg#91, sub#178_ret#92);
	#1246 := true;
	goto $return53;
	$return53:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 484, 1} {:message "LollypopToken::my_func_uncheck36"} my_func_uncheck36#1287(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1274: address_t)
{
	var __call_ret#93: bool;
	var __call_ret#94: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_34.sol", 485, 5} {:message ""} true;
	call __call_ret#93, __call_ret#94 := __call(dst#1274, __this, __msg_value);
	if (__call_ret#93) {
	havoc _balances#286;
	havoc _allowances#305;
	havoc _totalSupply#321;
	havoc _maxTotalSupply#340;
	havoc _name#368;
	havoc _symbol#383;
	havoc _decimals#407;
	havoc maxAgeOfToken#425;
	havoc minAgeOfToken#445;
	havoc perDayBonus#462;
	havoc payedOut_unchk20#753;
	havoc winner_unchk20#755;
	havoc winAmount_unchk20#757;
	havoc payedOut_unchk32#788;
	havoc winner_unchk32#790;
	havoc winAmount_unchk32#792;
	havoc payedOut_unchk45#855;
	havoc payedOut_unchk8#1181;
	havoc winner_unchk8#1183;
	havoc winAmount_unchk8#1185;
	havoc payedOut_unchk44#1359;
	havoc winner_unchk44#1361;
	havoc winAmount_unchk44#1363;
	havoc payedOut_unchk33#1493;
	havoc owner#27;
	havoc payedOut_unchk9#104;
	havoc __balance;
	}

	if (!(__call_ret#93)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return54:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 500, 5} {:message "LollypopToken::increaseAllowance"} increaseAllowance#1315(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1290: address_t, addedValue#1292: int)
	returns (#1295: bool)
{
	var call_arg#95: address_t;
	var add#152_ret#96: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#95 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 501, 39} {:message ""} true;
	call add#152_ret#96 := add#152(__this, __msg_sender, __msg_value, _allowances#305[__this][__msg_sender][spender#1290], addedValue#1292);
	assume {:sourceloc "buggy_34.sol", 501, 9} {:message ""} true;
	call _approve#1490(__this, __msg_sender, __msg_value, call_arg#95, spender#1290, add#152_ret#96);
	#1295 := true;
	goto $return55;
	$return55:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 504, 1} {:message "LollypopToken::my_func_unchk35"} my_func_unchk35#1328(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1317: address_t)
{
	var __send_ret#97: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 505, 9} {:message ""} true;
	call __send_ret#97 := __send(dst#1317, __this, 0, __msg_value);
	$return56:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_34.sol", 522, 5} {:message "LollypopToken::decreaseAllowance"} decreaseAllowance#1356(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1331: address_t, subtractedValue#1333: int)
	returns (#1336: bool)
{
	var call_arg#98: address_t;
	var sub#178_ret#99: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#98 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 523, 39} {:message ""} true;
	call sub#178_ret#99 := sub#178(__this, __msg_sender, __msg_value, _allowances#305[__this][__msg_sender][spender#1331], subtractedValue#1333);
	assume {:sourceloc "buggy_34.sol", 523, 9} {:message ""} true;
	call _approve#1490(__this, __msg_sender, __msg_value, call_arg#98, spender#1331, sub#178_ret#99);
	#1336 := true;
	goto $return57;
	$return57:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_34.sol", 526, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1359: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_34.sol", 527, 1} {:message "winner_unchk44"} winner_unchk44#1361: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_34.sol", 528, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1363: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_34.sol", 530, 1} {:message "LollypopToken::sendToWinner_unchk44"} sendToWinner_unchk44#1382(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#100: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1359[__this]);
	assume {:sourceloc "buggy_34.sol", 532, 9} {:message ""} true;
	call __send_ret#100 := __send(winner_unchk44#1361[__this], __this, 0, winAmount_unchk44#1363[__this]);
	payedOut_unchk44#1359 := payedOut_unchk44#1359[__this := true];
	$return58:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 565, 5} {:message "LollypopToken::_burn"} _burn#1430(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1385: address_t, value#1387: int)
{
	var call_arg#101: int_arr_ptr;
	var new_array#102: int_arr_ptr;
	var sub#178_ret#103: int;
	var sub#178_ret#104: int;
	var call_arg#105: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#102 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#101 := new_array#102;
	mem_arr_int := mem_arr_int[call_arg#101 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#1385 != 0);
	assume {:sourceloc "buggy_34.sol", 568, 24} {:message ""} true;
	call sub#178_ret#103 := sub#178(__this, __msg_sender, __msg_value, _totalSupply#321[__this], value#1387);
	_totalSupply#321 := _totalSupply#321[__this := sub#178_ret#103];
	assume {:sourceloc "buggy_34.sol", 569, 37} {:message ""} true;
	call sub#178_ret#104 := sub#178(__this, __msg_sender, __msg_value, amount#464#transferMapping#467#constr(_balances#286[__this][account#1385]), value#1387);
	_balances#286 := _balances#286[__this := _balances#286[__this][account#1385 := transferMapping#467#constr(sub#178_ret#104, time#466#transferMapping#467#constr(_balances#286[__this][account#1385]))]];
	call_arg#105 := 0;
	assume {:sourceloc "buggy_34.sol", 570, 14} {:message ""} true;
	call Transfer#884(__this, __msg_sender, __msg_value, account#1385, call_arg#105, value#1387);
	$return59:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_34.sol", 572, 1} {:message "LollypopToken::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1445(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_34.sol", 573, 4} {:message "addr_unchk40"} addr_unchk40#1434: address_t;
	var call_arg#106: int;
	var __send_ret#107: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1434 := 0;
	call_arg#106 := 2000000000000000000;
	assume {:sourceloc "buggy_34.sol", 574, 10} {:message ""} true;
	call __send_ret#107 := __send(addr_unchk40#1434, __this, 0, call_arg#106);
	if (!(__send_ret#107)) {
	
	}
	else {
	
	}

	$return60:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 595, 5} {:message "LollypopToken::_approve"} _approve#1490(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#1448: address_t, spender#1450: address_t, value#1452: int)
{
	var call_arg#108: int_arr_ptr;
	var new_array#109: int_arr_ptr;
	var call_arg#110: int_arr_ptr;
	var new_array#111: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#109 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#108 := new_array#109;
	mem_arr_int := mem_arr_int[call_arg#108 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#1448 != 0);
	new_array#111 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#110 := new_array#111;
	mem_arr_int := mem_arr_int[call_arg#110 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#1450 != 0);
	_allowances#305 := _allowances#305[__this := _allowances#305[__this][owner#1448 := _allowances#305[__this][owner#1448][spender#1450 := value#1452]]];
	assume {:sourceloc "buggy_34.sol", 600, 14} {:message ""} true;
	call Approval#907(__this, __msg_sender, __msg_value, owner#1448, spender#1450, value#1452);
	$return61:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_34.sol", 602, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1493: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_34.sol", 604, 1} {:message "LollypopToken::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1514(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#112: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1493[__this];
	assume {:sourceloc "buggy_34.sol", 606, 5} {:message ""} true;
	call __send_ret#112 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return62:
	// Function body ends here
}

// 
// Function: _burnFrom : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_34.sol", 615, 5} {:message "LollypopToken::_burnFrom"} _burnFrom#1543(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1517: address_t, amount#1519: int)
{
	var call_arg#113: address_t;
	var sub#178_ret#114: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_34.sol", 616, 9} {:message ""} true;
	call _burn#1430(__this, __msg_sender, __msg_value, account#1517, amount#1519);
	call_arg#113 := __msg_sender;
	assume {:sourceloc "buggy_34.sol", 617, 39} {:message ""} true;
	call sub#178_ret#114 := sub#178(__this, __msg_sender, __msg_value, _allowances#305[__this][account#1517][__msg_sender], amount#1519);
	assume {:sourceloc "buggy_34.sol", 617, 9} {:message ""} true;
	call _approve#1490(__this, __msg_sender, __msg_value, account#1517, call_arg#113, sub#178_ret#114);
	$return63:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_34.sol", 619, 1} {:message "LollypopToken::bug_unchk27"} bug_unchk27#1555(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1545: address_t)
{
	var call_arg#115: int;
	var __send_ret#116: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#115 := 42000000000000000000;
	assume {:sourceloc "buggy_34.sol", 620, 8} {:message ""} true;
	call __send_ret#116 := __send(addr#1545, __this, 0, call_arg#115);
	$return64:
	// Function body ends here
}

