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
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 58, 3} {:message "owned::my_func_uncheck48"} my_func_uncheck48#118(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#105: address_t)
{
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_19.sol", 59, 7} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(dst#105, __this, __msg_value);
	if (__call_ret#0) {
	havoc owner#120;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_19.sol", 61, 3} {:message "owner"} owner#120: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 66, 5} {:message "owned::[constructor]"} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#120 := owner#120[__this := 0];
	// Function body starts here
	owner#120 := owner#120[__this := __msg_sender];
	$return5:
	// Function body ends here
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
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_19.sol", 69, 1} {:message "owned::withdrawBal_unchk17"} withdrawBal_unchk17#147(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 70, 2} {:message "Balances_unchk17"} Balances_unchk17#134: int;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#134 := 0;
	call_arg#2 := Balances_unchk17#134;
	assume {:sourceloc "buggy_19.sol", 71, 2} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, call_arg#2);
	$return6:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_19.sol", 84, 5} {:message "owned::transferOwnership"} transferOwnership#181(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#162: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	assume (newOwner#162 != 0);
	owner#120 := owner#120[__this := newOwner#162];
	$return8:
	// Function body ends here
	$return7:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 88, 1} {:message "owned::callnotchecked_unchk37"} callnotchecked_unchk37#195(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#183: address_t)
{
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_19.sol", 89, 5} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(callee#183, __this, 1000000000000000000);
	if (__call_ret#6) {
	havoc owner#120;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return9:
	// Function body ends here
}

// 
// ------- Contract: ethBank -------
// Inherits from: owned
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 95, 9} {:message "ethBank::[receive]"} #202(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 96, 1} {:message "ethBank::bug_unchk3"} bug_unchk3#214(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#204: address_t)
{
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#8 := 42000000000000000000;
	assume {:sourceloc "buggy_19.sol", 97, 8} {:message ""} true;
	call __send_ret#9 := __send(addr#204, __this, 0, call_arg#8);
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
procedure {:sourceloc "buggy_19.sol", 99, 5} {:message "ethBank::withdrawForUser"} withdrawForUser#238(__this: address_t, __msg_sender: address_t, __msg_value: int, _address#216: address_t, amount#218: int)
{
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 101, 9} {:message ""} true;
	call __transfer(_address#216, __this, 0, amount#218);
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_19.sol", 103, 1} {:message "payedOut_unchk9"} payedOut_unchk9#241: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_19.sol", 105, 1} {:message "ethBank::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#262(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#241[__this];
	assume {:sourceloc "buggy_19.sol", 107, 5} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return14:
	// Function body ends here
}

// 
// Function: moveBrick : function (uint256)
procedure {:sourceloc "buggy_19.sol", 110, 5} {:message "ethBank::moveBrick"} moveBrick#287(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#264: int)
{
	var call_arg#17: int_arr_ptr;
	var new_array#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#18 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#17 := new_array#18;
	mem_arr_int := mem_arr_int[call_arg#17 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 112, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, amount#264);
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 114, 1} {:message "ethBank::callnotchecked_unchk25"} callnotchecked_unchk25#301(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#289: address_t)
{
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_19.sol", 115, 5} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(callee#289, __this, 1000000000000000000);
	if (__call_ret#19) {
	havoc payedOut_unchk9#241;
	havoc payedOut_unchk20#392;
	havoc winner_unchk20#394;
	havoc winAmount_unchk20#396;
	havoc payedOut_unchk32#445;
	havoc winner_unchk32#447;
	havoc winAmount_unchk32#449;
	havoc payedOut_unchk8#809;
	havoc winner_unchk8#811;
	havoc winAmount_unchk8#813;
	havoc payedOut_unchk44#983;
	havoc winner_unchk44#985;
	havoc winAmount_unchk44#987;
	havoc payedOut_unchk33#1078;
	havoc payedOut_unchk45#1216;
	havoc owner#120;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return17:
	// Function body ends here
}

// 
// Function: moveBrickContracts : function ()
procedure {:sourceloc "buggy_19.sol", 122, 5} {:message "ethBank::moveBrickContracts"} moveBrickContracts#329(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int_arr_ptr;
	var new_array#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#24 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#23 := new_array#24;
	mem_arr_int := mem_arr_int[call_arg#23 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 127, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_19.sol", 129, 1} {:message "ethBank::bug_unchk19"} bug_unchk19#350(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 130, 1} {:message "addr_unchk19"} addr_unchk19#333: address_t;
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#333 := 0;
	call_arg#25 := 10000000000000000000;
	assume {:sourceloc "buggy_19.sol", 131, 6} {:message ""} true;
	call __send_ret#26 := __send(addr_unchk19#333, __this, 0, call_arg#25);
	if ((!(__send_ret#26) || (1 == 1))) {
	assume false;
	}

	$return20:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 135, 1} {:message "ethBank::unhandledsend_unchk26"} unhandledsend_unchk26#362(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#352: address_t)
{
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#27 := 5000000000000000000;
	assume {:sourceloc "buggy_19.sol", 136, 5} {:message ""} true;
	call __send_ret#28 := __send(callee#352, __this, 0, call_arg#27);
	$return21:
	// Function body ends here
}

// 
// Function: joinFlexible : function ()
procedure {:sourceloc "buggy_19.sol", 143, 5} {:message "ethBank::joinFlexible"} joinFlexible#389(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int_arr_ptr;
	var new_array#32: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#32 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#31 := new_array#32;
	mem_arr_int := mem_arr_int[call_arg#31 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 145, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_19.sol", 148, 1} {:message "payedOut_unchk20"} payedOut_unchk20#392: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_19.sol", 149, 1} {:message "winner_unchk20"} winner_unchk20#394: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_19.sol", 150, 1} {:message "winAmount_unchk20"} winAmount_unchk20#396: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_19.sol", 152, 1} {:message "ethBank::sendToWinner_unchk20"} sendToWinner_unchk20#415(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#392[__this]);
	assume {:sourceloc "buggy_19.sol", 154, 9} {:message ""} true;
	call __send_ret#33 := __send(winner_unchk20#394[__this], __this, 0, winAmount_unchk20#396[__this]);
	payedOut_unchk20#392 := payedOut_unchk20#392[__this := true];
	$return24:
	// Function body ends here
}

// 
// Function: joinFixed : function ()
procedure {:sourceloc "buggy_19.sol", 157, 5} {:message "ethBank::joinFixed"} joinFixed#442(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#36: int_arr_ptr;
	var new_array#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#37 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#36 := new_array#37;
	mem_arr_int := mem_arr_int[call_arg#36 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 159, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_19.sol", 162, 1} {:message "payedOut_unchk32"} payedOut_unchk32#445: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_19.sol", 163, 1} {:message "winner_unchk32"} winner_unchk32#447: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_19.sol", 164, 1} {:message "winAmount_unchk32"} winAmount_unchk32#449: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_19.sol", 166, 1} {:message "ethBank::sendToWinner_unchk32"} sendToWinner_unchk32#468(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#445[__this]);
	assume {:sourceloc "buggy_19.sol", 168, 9} {:message ""} true;
	call __send_ret#38 := __send(winner_unchk32#447[__this], __this, 0, winAmount_unchk32#449[__this]);
	payedOut_unchk32#445 := payedOut_unchk32#445[__this := true];
	$return27:
	// Function body ends here
}

// 
// Function: staticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 171, 5} {:message "ethBank::staticBonus"} staticBonus#495(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int_arr_ptr;
	var new_array#42: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#42 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#41 := new_array#42;
	mem_arr_int := mem_arr_int[call_arg#41 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 173, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 176, 1} {:message "ethBank::unhandledsend_unchk38"} unhandledsend_unchk38#507(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#497: address_t)
{
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#43 := 5000000000000000000;
	assume {:sourceloc "buggy_19.sol", 177, 5} {:message ""} true;
	call __send_ret#44 := __send(callee#497, __this, 0, call_arg#43);
	$return30:
	// Function body ends here
}

// 
// Function: activeBonus : function ()
procedure {:sourceloc "buggy_19.sol", 179, 5} {:message "ethBank::activeBonus"} activeBonus#534(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#47: int_arr_ptr;
	var new_array#48: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#48 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#47 := new_array#48;
	mem_arr_int := mem_arr_int[call_arg#47 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 181, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return32:
	// Function body ends here
	$return31:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_19.sol", 184, 1} {:message "ethBank::cash_unchk46"} cash_unchk46#558(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#536: int, subpotIndex#538: int, winner_unchk46#540: address_t)
{
	var {:sourceloc "buggy_19.sol", 185, 9} {:message "subpot_unchk46"} subpot_unchk46#544: int;
	var call_arg#49: int;
	var __send_ret#50: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#544 := 3000000000000000000;
	call_arg#49 := subpot_unchk46#544;
	assume {:sourceloc "buggy_19.sol", 186, 9} {:message ""} true;
	call __send_ret#50 := __send(winner_unchk46#540, __this, 0, call_arg#49);
	subpot_unchk46#544 := 0;
	$return33:
	// Function body ends here
}

// 
// Function: teamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 189, 5} {:message "ethBank::teamAddBonus"} teamAddBonus#585(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#53: int_arr_ptr;
	var new_array#54: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#54 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#53 := new_array#54;
	mem_arr_int := mem_arr_int[call_arg#53 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 191, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return35:
	// Function body ends here
	$return34:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_19.sol", 194, 1} {:message "ethBank::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#600(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 195, 4} {:message "addr_unchk4"} addr_unchk4#589: address_t;
	var call_arg#55: int;
	var __send_ret#56: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#589 := 0;
	call_arg#55 := 42000000000000000000;
	assume {:sourceloc "buggy_19.sol", 196, 10} {:message ""} true;
	call __send_ret#56 := __send(addr_unchk4#589, __this, 0, call_arg#55);
	if (!(__send_ret#56)) {
	
	}
	else {
	
	}

	$return36:
	// Function body ends here
}

// 
// Function: staticBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 203, 5} {:message "ethBank::staticBonusCacl"} staticBonusCacl#627(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int_arr_ptr;
	var new_array#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#60 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#59 := new_array#60;
	mem_arr_int := mem_arr_int[call_arg#59 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 205, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_19.sol", 208, 1} {:message "ethBank::bug_unchk7"} bug_unchk7#648(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 209, 1} {:message "addr_unchk7"} addr_unchk7#631: address_t;
	var call_arg#61: int;
	var __send_ret#62: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#631 := 0;
	call_arg#61 := 10000000000000000000;
	assume {:sourceloc "buggy_19.sol", 210, 6} {:message ""} true;
	call __send_ret#62 := __send(addr_unchk7#631, __this, 0, call_arg#61);
	if ((!(__send_ret#62) || (1 == 1))) {
	assume false;
	}

	$return39:
	// Function body ends here
}

// 
// Function: activeBonusCacl_1 : function ()
procedure {:sourceloc "buggy_19.sol", 213, 5} {:message "ethBank::activeBonusCacl_1"} activeBonusCacl_1#675(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#65: int_arr_ptr;
	var new_array#66: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#66 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#65 := new_array#66;
	mem_arr_int := mem_arr_int[call_arg#65 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 215, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 218, 1} {:message "ethBank::my_func_unchk23"} my_func_unchk23#688(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#677: address_t)
{
	var __send_ret#67: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 219, 9} {:message ""} true;
	call __send_ret#67 := __send(dst#677, __this, 0, __msg_value);
	$return42:
	// Function body ends here
}

// 
// Function: activeBonusCacl_2 : function ()
procedure {:sourceloc "buggy_19.sol", 221, 5} {:message "ethBank::activeBonusCacl_2"} activeBonusCacl_2#715(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#70: int_arr_ptr;
	var new_array#71: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#71 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#70 := new_array#71;
	mem_arr_int := mem_arr_int[call_arg#70 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 223, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 226, 1} {:message "ethBank::unhandledsend_unchk14"} unhandledsend_unchk14#727(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#717: address_t)
{
	var call_arg#72: int;
	var __send_ret#73: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#72 := 5000000000000000000;
	assume {:sourceloc "buggy_19.sol", 227, 5} {:message ""} true;
	call __send_ret#73 := __send(callee#717, __this, 0, call_arg#72);
	$return45:
	// Function body ends here
}

// 
// Function: activeBonusCacl_3 : function ()
procedure {:sourceloc "buggy_19.sol", 229, 5} {:message "ethBank::activeBonusCacl_3"} activeBonusCacl_3#754(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#76: int_arr_ptr;
	var new_array#77: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#77 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#76 := new_array#77;
	mem_arr_int := mem_arr_int[call_arg#76 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 231, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_19.sol", 234, 1} {:message "ethBank::bug_unchk30"} bug_unchk30#779(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 235, 1} {:message "receivers_unchk30"} receivers_unchk30#758: int;
	var {:sourceloc "buggy_19.sol", 236, 1} {:message "addr_unchk30"} addr_unchk30#761: address_t;
	var call_arg#78: int;
	var __send_ret#79: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#758 := 0;
	addr_unchk30#761 := 0;
	call_arg#78 := 42000000000000000000;
	assume {:sourceloc "buggy_19.sol", 237, 6} {:message ""} true;
	call __send_ret#79 := __send(addr_unchk30#761, __this, 0, call_arg#78);
	if (!(__send_ret#79)) {
	receivers_unchk30#758 := (receivers_unchk30#758 + 1);
	}
	else {
	assume false;
	}

	$return48:
	// Function body ends here
}

// 
// Function: activeBonusCacl_4 : function ()
procedure {:sourceloc "buggy_19.sol", 242, 5} {:message "ethBank::activeBonusCacl_4"} activeBonusCacl_4#806(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#82: int_arr_ptr;
	var new_array#83: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#83 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#82 := new_array#83;
	mem_arr_int := mem_arr_int[call_arg#82 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 244, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_19.sol", 247, 1} {:message "payedOut_unchk8"} payedOut_unchk8#809: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_19.sol", 248, 1} {:message "winner_unchk8"} winner_unchk8#811: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_19.sol", 249, 1} {:message "winAmount_unchk8"} winAmount_unchk8#813: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_19.sol", 251, 1} {:message "ethBank::sendToWinner_unchk8"} sendToWinner_unchk8#832(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#84: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#809[__this]);
	assume {:sourceloc "buggy_19.sol", 253, 9} {:message ""} true;
	call __send_ret#84 := __send(winner_unchk8#811[__this], __this, 0, winAmount_unchk8#813[__this]);
	payedOut_unchk8#809 := payedOut_unchk8#809[__this := true];
	$return51:
	// Function body ends here
}

// 
// Function: activeBonusCacl_5 : function ()
procedure {:sourceloc "buggy_19.sol", 256, 5} {:message "ethBank::activeBonusCacl_5"} activeBonusCacl_5#859(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#87: int_arr_ptr;
	var new_array#88: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#88 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#87 := new_array#88;
	mem_arr_int := mem_arr_int[call_arg#87 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 258, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return53:
	// Function body ends here
	$return52:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 261, 1} {:message "ethBank::bug_unchk39"} bug_unchk39#871(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#861: address_t)
{
	var call_arg#89: int;
	var __send_ret#90: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#89 := 4000000000000000000;
	assume {:sourceloc "buggy_19.sol", 262, 8} {:message ""} true;
	call __send_ret#90 := __send(addr#861, __this, 0, call_arg#89);
	$return54:
	// Function body ends here
}

// 
// Function: activeBonusCacl_6 : function ()
procedure {:sourceloc "buggy_19.sol", 263, 5} {:message "ethBank::activeBonusCacl_6"} activeBonusCacl_6#898(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#93: int_arr_ptr;
	var new_array#94: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#94 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#93 := new_array#94;
	mem_arr_int := mem_arr_int[call_arg#93 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 265, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return56:
	// Function body ends here
	$return55:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 268, 1} {:message "ethBank::my_func_uncheck36"} my_func_uncheck36#913(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#900: address_t)
{
	var __call_ret#95: bool;
	var __call_ret#96: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_19.sol", 269, 5} {:message ""} true;
	call __call_ret#95, __call_ret#96 := __call(dst#900, __this, __msg_value);
	if (__call_ret#95) {
	havoc payedOut_unchk9#241;
	havoc payedOut_unchk20#392;
	havoc winner_unchk20#394;
	havoc winAmount_unchk20#396;
	havoc payedOut_unchk32#445;
	havoc winner_unchk32#447;
	havoc winAmount_unchk32#449;
	havoc payedOut_unchk8#809;
	havoc winner_unchk8#811;
	havoc winAmount_unchk8#813;
	havoc payedOut_unchk44#983;
	havoc winner_unchk44#985;
	havoc winAmount_unchk44#987;
	havoc payedOut_unchk33#1078;
	havoc payedOut_unchk45#1216;
	havoc owner#120;
	havoc __balance;
	}

	if (!(__call_ret#95)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return57:
	// Function body ends here
}

// 
// Function: activeBonusCacl_7 : function ()
procedure {:sourceloc "buggy_19.sol", 271, 5} {:message "ethBank::activeBonusCacl_7"} activeBonusCacl_7#940(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#99: int_arr_ptr;
	var new_array#100: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#100 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#99 := new_array#100;
	mem_arr_int := mem_arr_int[call_arg#99 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 273, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 276, 1} {:message "ethBank::my_func_unchk35"} my_func_unchk35#953(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#942: address_t)
{
	var __send_ret#101: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_19.sol", 277, 9} {:message ""} true;
	call __send_ret#101 := __send(dst#942, __this, 0, __msg_value);
	$return60:
	// Function body ends here
}

// 
// Function: activeBonusCacl_8 : function ()
procedure {:sourceloc "buggy_19.sol", 279, 5} {:message "ethBank::activeBonusCacl_8"} activeBonusCacl_8#980(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#104: int_arr_ptr;
	var new_array#105: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#105 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#104 := new_array#105;
	mem_arr_int := mem_arr_int[call_arg#104 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 281, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return62:
	// Function body ends here
	$return61:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_19.sol", 284, 1} {:message "payedOut_unchk44"} payedOut_unchk44#983: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_19.sol", 285, 1} {:message "winner_unchk44"} winner_unchk44#985: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_19.sol", 286, 1} {:message "winAmount_unchk44"} winAmount_unchk44#987: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_19.sol", 288, 1} {:message "ethBank::sendToWinner_unchk44"} sendToWinner_unchk44#1006(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#106: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#983[__this]);
	assume {:sourceloc "buggy_19.sol", 290, 9} {:message ""} true;
	call __send_ret#106 := __send(winner_unchk44#985[__this], __this, 0, winAmount_unchk44#987[__this]);
	payedOut_unchk44#983 := payedOut_unchk44#983[__this := true];
	$return63:
	// Function body ends here
}

// 
// Function: activeBonusCacl_9 : function ()
procedure {:sourceloc "buggy_19.sol", 293, 5} {:message "ethBank::activeBonusCacl_9"} activeBonusCacl_9#1033(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#109: int_arr_ptr;
	var new_array#110: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#110 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#109 := new_array#110;
	mem_arr_int := mem_arr_int[call_arg#109 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 295, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return65:
	// Function body ends here
	$return64:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_19.sol", 298, 1} {:message "ethBank::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1048(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 299, 4} {:message "addr_unchk40"} addr_unchk40#1037: address_t;
	var call_arg#111: int;
	var __send_ret#112: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1037 := 0;
	call_arg#111 := 2000000000000000000;
	assume {:sourceloc "buggy_19.sol", 300, 10} {:message ""} true;
	call __send_ret#112 := __send(addr_unchk40#1037, __this, 0, call_arg#111);
	if (!(__send_ret#112)) {
	
	}
	else {
	
	}

	$return66:
	// Function body ends here
}

// 
// Function: teamAddBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 307, 5} {:message "ethBank::teamAddBonusCacl"} teamAddBonusCacl#1075(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#115: int_arr_ptr;
	var new_array#116: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#116 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#115 := new_array#116;
	mem_arr_int := mem_arr_int[call_arg#115 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 309, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return68:
	// Function body ends here
	$return67:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_19.sol", 312, 1} {:message "payedOut_unchk33"} payedOut_unchk33#1078: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_19.sol", 314, 1} {:message "ethBank::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#1099(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#117: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#1078[__this];
	assume {:sourceloc "buggy_19.sol", 316, 5} {:message ""} true;
	call __send_ret#117 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return69:
	// Function body ends here
}

// 
// Function: caclTeamPerformance : function ()
procedure {:sourceloc "buggy_19.sol", 318, 5} {:message "ethBank::caclTeamPerformance"} caclTeamPerformance#1126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#120: int_arr_ptr;
	var new_array#121: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#121 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#120 := new_array#121;
	mem_arr_int := mem_arr_int[call_arg#120 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 320, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return71:
	// Function body ends here
	$return70:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_19.sol", 323, 1} {:message "ethBank::bug_unchk27"} bug_unchk27#1138(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1128: address_t)
{
	var call_arg#122: int;
	var __send_ret#123: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#122 := 42000000000000000000;
	assume {:sourceloc "buggy_19.sol", 324, 8} {:message ""} true;
	call __send_ret#123 := __send(addr#1128, __this, 0, call_arg#122);
	$return72:
	// Function body ends here
}

// 
// Function: releaStaticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 325, 5} {:message "ethBank::releaStaticBonus"} releaStaticBonus#1165(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#126: int_arr_ptr;
	var new_array#127: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#127 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#126 := new_array#127;
	mem_arr_int := mem_arr_int[call_arg#126 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 327, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return74:
	// Function body ends here
	$return73:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_19.sol", 330, 1} {:message "ethBank::bug_unchk31"} bug_unchk31#1186(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_19.sol", 331, 1} {:message "addr_unchk31"} addr_unchk31#1169: address_t;
	var call_arg#128: int;
	var __send_ret#129: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#1169 := 0;
	call_arg#128 := 10000000000000000000;
	assume {:sourceloc "buggy_19.sol", 332, 6} {:message ""} true;
	call __send_ret#129 := __send(addr_unchk31#1169, __this, 0, call_arg#128);
	if ((!(__send_ret#129) || (1 == 1))) {
	assume false;
	}

	$return75:
	// Function body ends here
}

// 
// Function: releaActiveBonus : function ()
procedure {:sourceloc "buggy_19.sol", 335, 5} {:message "ethBank::releaActiveBonus"} releaActiveBonus#1213(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#132: int_arr_ptr;
	var new_array#133: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#133 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#132 := new_array#133;
	mem_arr_int := mem_arr_int[call_arg#132 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 337, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return77:
	// Function body ends here
	$return76:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_19.sol", 340, 1} {:message "payedOut_unchk45"} payedOut_unchk45#1216: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_19.sol", 342, 1} {:message "ethBank::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#1237(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#134: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#1216[__this];
	assume {:sourceloc "buggy_19.sol", 344, 5} {:message ""} true;
	call __send_ret#134 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return78:
	// Function body ends here
}

// 
// Function: releaTeamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 346, 5} {:message "ethBank::releaTeamAddBonus"} releaTeamAddBonus#1264(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#137: int_arr_ptr;
	var new_array#138: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#120[__this]);
	// Function body starts here
	new_array#138 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#137 := new_array#138;
	mem_arr_int := mem_arr_int[call_arg#137 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#120[__this]);
	assume {:sourceloc "buggy_19.sol", 348, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return80:
	// Function body ends here
	$return79:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_19.sol", 351, 1} {:message "ethBank::callnotchecked_unchk13"} callnotchecked_unchk13#1278(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1266: address_t)
{
	var __call_ret#139: bool;
	var __call_ret#140: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_19.sol", 352, 5} {:message ""} true;
	call __call_ret#139, __call_ret#140 := __call(callee#1266, __this, 1000000000000000000);
	if (__call_ret#139) {
	havoc payedOut_unchk9#241;
	havoc payedOut_unchk20#392;
	havoc winner_unchk20#394;
	havoc winAmount_unchk20#396;
	havoc payedOut_unchk32#445;
	havoc winner_unchk32#447;
	havoc winAmount_unchk32#449;
	havoc payedOut_unchk8#809;
	havoc winner_unchk8#811;
	havoc winAmount_unchk8#813;
	havoc payedOut_unchk44#983;
	havoc winner_unchk44#985;
	havoc winAmount_unchk44#987;
	havoc payedOut_unchk33#1078;
	havoc payedOut_unchk45#1216;
	havoc owner#120;
	havoc __balance;
	}

	if (!(__call_ret#139)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return81:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_19.sol", 93, 1} {:message "ethBank::[implicit_constructor]"} __constructor#1279(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk9#241 := payedOut_unchk9#241[__this := false];
	payedOut_unchk20#392 := payedOut_unchk20#392[__this := false];
	winner_unchk20#394 := winner_unchk20#394[__this := 0];
	winAmount_unchk20#396 := winAmount_unchk20#396[__this := 0];
	payedOut_unchk32#445 := payedOut_unchk32#445[__this := false];
	winner_unchk32#447 := winner_unchk32#447[__this := 0];
	winAmount_unchk32#449 := winAmount_unchk32#449[__this := 0];
	payedOut_unchk8#809 := payedOut_unchk8#809[__this := false];
	winner_unchk8#811 := winner_unchk8#811[__this := 0];
	winAmount_unchk8#813 := winAmount_unchk8#813[__this := 0];
	payedOut_unchk44#983 := payedOut_unchk44#983[__this := false];
	winner_unchk44#985 := winner_unchk44#985[__this := 0];
	winAmount_unchk44#987 := winAmount_unchk44#987[__this := 0];
	payedOut_unchk33#1078 := payedOut_unchk33#1078[__this := false];
	payedOut_unchk45#1216 := payedOut_unchk45#1216[__this := false];
	owner#120 := owner#120[__this := 0];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#120 := owner#120[__this := __msg_sender];
	$return82:
	// Function body ends here
	// Inlined constructor for owned ends here
}

