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
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_19.sol", 58, 3} {:message "owned::bug_unchk_send24"} bug_unchk_send24#116(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 59, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_19.sol", 60, 3} {:message "owner"} owner#118: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 65, 5} {:message "owned::[constructor]"} __constructor#189(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#118 := owner#118[__this := 0];
	// Function body starts here
	owner#118 := owner#118[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_19.sol", 68, 1} {:message "owned::bug_unchk_send5"} bug_unchk_send5#141(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 69, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return6:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_19.sol", 82, 5} {:message "owned::transferOwnership"} transferOwnership#175(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#156: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	assume (newOwner#156 != 0);
	owner#118 := owner#118[__this := newOwner#156];
	$return8:
	// Function body ends here
	$return7:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_19.sol", 86, 1} {:message "owned::bug_unchk_send15"} bug_unchk_send15#188(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 87, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return9:
	// Function body ends here
}

// 
// ------- Contract: ethBank -------
// Inherits from: owned
// 
// Function: 
procedure {:sourceloc "buggy_19.sol", 92, 5} {:message "ethBank::[receive]"} #195(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_19.sol", 93, 1} {:message "ethBank::bug_unchk_send28"} bug_unchk_send28#208(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 94, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return11:
	// Function body ends here
}

type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: withdrawForUser : function (address payable,uint256)
procedure {:sourceloc "buggy_19.sol", 96, 5} {:message "ethBank::withdrawForUser"} withdrawForUser#232(__this: address_t, __msg_sender: address_t, __msg_value: int, _address#210: address_t, amount#212: int)
{
	var call_arg#8: int_arr_ptr;
	var new_array#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#9 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#8 := new_array#9;
	mem_arr_int := mem_arr_int[call_arg#8 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 98, 9} {:message ""} true;
	call __transfer(_address#210, __this, 0, amount#212);
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_19.sol", 100, 1} {:message "ethBank::bug_unchk_send21"} bug_unchk_send21#245(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 101, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return14:
	// Function body ends here
}

// 
// Function: moveBrick : function (uint256)
procedure {:sourceloc "buggy_19.sol", 103, 5} {:message "ethBank::moveBrick"} moveBrick#270(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#247: int)
{
	var call_arg#13: int_arr_ptr;
	var new_array#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#13 := new_array#14;
	mem_arr_int := mem_arr_int[call_arg#13 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 105, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, amount#247);
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_19.sol", 107, 1} {:message "ethBank::bug_unchk_send10"} bug_unchk_send10#283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 108, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return17:
	// Function body ends here
}

// 
// Function: moveBrickContracts : function ()
procedure {:sourceloc "buggy_19.sol", 114, 5} {:message "ethBank::moveBrickContracts"} moveBrickContracts#311(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int_arr_ptr;
	var new_array#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#19 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#18 := new_array#19;
	mem_arr_int := mem_arr_int[call_arg#18 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 119, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_19.sol", 121, 1} {:message "ethBank::bug_unchk_send22"} bug_unchk_send22#324(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 122, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_19.sol", 124, 1} {:message "ethBank::bug_unchk_send12"} bug_unchk_send12#337(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 125, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return21:
	// Function body ends here
}

// 
// Function: joinFlexible : function ()
procedure {:sourceloc "buggy_19.sol", 131, 5} {:message "ethBank::joinFlexible"} joinFlexible#364(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int_arr_ptr;
	var new_array#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#24 := new_array#25;
	mem_arr_int := mem_arr_int[call_arg#24 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 133, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_19.sol", 136, 1} {:message "ethBank::bug_unchk_send11"} bug_unchk_send11#377(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 137, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return24:
	// Function body ends here
}

// 
// Function: joinFixed : function ()
procedure {:sourceloc "buggy_19.sol", 138, 5} {:message "ethBank::joinFixed"} joinFixed#404(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int_arr_ptr;
	var new_array#30: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#30 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#29 := new_array#30;
	mem_arr_int := mem_arr_int[call_arg#29 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 140, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_19.sol", 143, 1} {:message "ethBank::bug_unchk_send1"} bug_unchk_send1#417(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#31 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 144, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#31);
	$return27:
	// Function body ends here
}

// 
// Function: staticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 145, 5} {:message "ethBank::staticBonus"} staticBonus#444(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int_arr_ptr;
	var new_array#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#35 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#34 := new_array#35;
	mem_arr_int := mem_arr_int[call_arg#34 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 147, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_19.sol", 150, 1} {:message "ethBank::bug_unchk_send2"} bug_unchk_send2#457(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#36 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 151, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#36);
	$return30:
	// Function body ends here
}

// 
// Function: activeBonus : function ()
procedure {:sourceloc "buggy_19.sol", 152, 5} {:message "ethBank::activeBonus"} activeBonus#484(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int_arr_ptr;
	var new_array#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#39 := new_array#40;
	mem_arr_int := mem_arr_int[call_arg#39 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 154, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return32:
	// Function body ends here
	$return31:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_19.sol", 157, 1} {:message "ethBank::bug_unchk_send17"} bug_unchk_send17#497(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 158, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#41);
	$return33:
	// Function body ends here
}

// 
// Function: teamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 159, 5} {:message "ethBank::teamAddBonus"} teamAddBonus#524(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int_arr_ptr;
	var new_array#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#45 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#44 := new_array#45;
	mem_arr_int := mem_arr_int[call_arg#44 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 161, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return35:
	// Function body ends here
	$return34:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_19.sol", 164, 1} {:message "ethBank::bug_unchk_send3"} bug_unchk_send3#537(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 165, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#46);
	$return36:
	// Function body ends here
}

// 
// Function: staticBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 166, 5} {:message "ethBank::staticBonusCacl"} staticBonusCacl#564(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#49: int_arr_ptr;
	var new_array#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#50 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#49 := new_array#50;
	mem_arr_int := mem_arr_int[call_arg#49 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 168, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_19.sol", 171, 1} {:message "ethBank::bug_unchk_send9"} bug_unchk_send9#577(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#51 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 172, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#51);
	$return39:
	// Function body ends here
}

// 
// Function: activeBonusCacl_1 : function ()
procedure {:sourceloc "buggy_19.sol", 173, 5} {:message "ethBank::activeBonusCacl_1"} activeBonusCacl_1#604(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#54: int_arr_ptr;
	var new_array#55: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#55 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#54 := new_array#55;
	mem_arr_int := mem_arr_int[call_arg#54 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 175, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_19.sol", 178, 1} {:message "ethBank::bug_unchk_send25"} bug_unchk_send25#617(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#56: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#56 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 179, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#56);
	$return42:
	// Function body ends here
}

// 
// Function: activeBonusCacl_2 : function ()
procedure {:sourceloc "buggy_19.sol", 180, 5} {:message "ethBank::activeBonusCacl_2"} activeBonusCacl_2#644(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int_arr_ptr;
	var new_array#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#60 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#59 := new_array#60;
	mem_arr_int := mem_arr_int[call_arg#59 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 182, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_19.sol", 185, 1} {:message "ethBank::bug_unchk_send19"} bug_unchk_send19#657(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#61: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#61 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 186, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#61);
	$return45:
	// Function body ends here
}

// 
// Function: activeBonusCacl_3 : function ()
procedure {:sourceloc "buggy_19.sol", 187, 5} {:message "ethBank::activeBonusCacl_3"} activeBonusCacl_3#684(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#64: int_arr_ptr;
	var new_array#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#65 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#64 := new_array#65;
	mem_arr_int := mem_arr_int[call_arg#64 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 189, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_19.sol", 192, 1} {:message "ethBank::bug_unchk_send26"} bug_unchk_send26#697(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#66: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#66 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 193, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#66);
	$return48:
	// Function body ends here
}

// 
// Function: activeBonusCacl_4 : function ()
procedure {:sourceloc "buggy_19.sol", 194, 5} {:message "ethBank::activeBonusCacl_4"} activeBonusCacl_4#724(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#69: int_arr_ptr;
	var new_array#70: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#70 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#69 := new_array#70;
	mem_arr_int := mem_arr_int[call_arg#69 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 196, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_19.sol", 199, 1} {:message "ethBank::bug_unchk_send20"} bug_unchk_send20#737(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#71: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#71 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 200, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#71);
	$return51:
	// Function body ends here
}

// 
// Function: activeBonusCacl_5 : function ()
procedure {:sourceloc "buggy_19.sol", 201, 5} {:message "ethBank::activeBonusCacl_5"} activeBonusCacl_5#764(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#74: int_arr_ptr;
	var new_array#75: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#75 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#74 := new_array#75;
	mem_arr_int := mem_arr_int[call_arg#74 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 203, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return53:
	// Function body ends here
	$return52:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_19.sol", 206, 1} {:message "ethBank::bug_unchk_send32"} bug_unchk_send32#777(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#76: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#76 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 207, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#76);
	$return54:
	// Function body ends here
}

// 
// Function: activeBonusCacl_6 : function ()
procedure {:sourceloc "buggy_19.sol", 208, 5} {:message "ethBank::activeBonusCacl_6"} activeBonusCacl_6#804(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#79: int_arr_ptr;
	var new_array#80: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#80 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#79 := new_array#80;
	mem_arr_int := mem_arr_int[call_arg#79 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 210, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return56:
	// Function body ends here
	$return55:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_19.sol", 213, 1} {:message "ethBank::bug_unchk_send4"} bug_unchk_send4#817(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#81: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#81 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 214, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#81);
	$return57:
	// Function body ends here
}

// 
// Function: activeBonusCacl_7 : function ()
procedure {:sourceloc "buggy_19.sol", 215, 5} {:message "ethBank::activeBonusCacl_7"} activeBonusCacl_7#844(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#84: int_arr_ptr;
	var new_array#85: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#85 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#84 := new_array#85;
	mem_arr_int := mem_arr_int[call_arg#84 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 217, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_19.sol", 220, 1} {:message "ethBank::bug_unchk_send7"} bug_unchk_send7#857(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#86: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#86 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 221, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#86);
	$return60:
	// Function body ends here
}

// 
// Function: activeBonusCacl_8 : function ()
procedure {:sourceloc "buggy_19.sol", 222, 5} {:message "ethBank::activeBonusCacl_8"} activeBonusCacl_8#884(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#89: int_arr_ptr;
	var new_array#90: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#90 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#89 := new_array#90;
	mem_arr_int := mem_arr_int[call_arg#89 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 224, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return62:
	// Function body ends here
	$return61:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_19.sol", 227, 1} {:message "ethBank::bug_unchk_send23"} bug_unchk_send23#897(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#91: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#91 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 228, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#91);
	$return63:
	// Function body ends here
}

// 
// Function: activeBonusCacl_9 : function ()
procedure {:sourceloc "buggy_19.sol", 229, 5} {:message "ethBank::activeBonusCacl_9"} activeBonusCacl_9#924(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#94: int_arr_ptr;
	var new_array#95: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#95 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#94 := new_array#95;
	mem_arr_int := mem_arr_int[call_arg#94 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 231, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return65:
	// Function body ends here
	$return64:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_19.sol", 234, 1} {:message "ethBank::bug_unchk_send14"} bug_unchk_send14#937(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#96: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#96 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 235, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#96);
	$return66:
	// Function body ends here
}

// 
// Function: teamAddBonusCacl : function ()
procedure {:sourceloc "buggy_19.sol", 236, 5} {:message "ethBank::teamAddBonusCacl"} teamAddBonusCacl#964(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#99: int_arr_ptr;
	var new_array#100: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#100 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#99 := new_array#100;
	mem_arr_int := mem_arr_int[call_arg#99 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 238, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return68:
	// Function body ends here
	$return67:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_19.sol", 241, 1} {:message "ethBank::bug_unchk_send30"} bug_unchk_send30#977(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#101: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#101 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 242, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#101);
	$return69:
	// Function body ends here
}

// 
// Function: caclTeamPerformance : function ()
procedure {:sourceloc "buggy_19.sol", 243, 5} {:message "ethBank::caclTeamPerformance"} caclTeamPerformance#1004(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#104: int_arr_ptr;
	var new_array#105: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#105 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#104 := new_array#105;
	mem_arr_int := mem_arr_int[call_arg#104 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 245, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return71:
	// Function body ends here
	$return70:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_19.sol", 248, 1} {:message "ethBank::bug_unchk_send8"} bug_unchk_send8#1017(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#106: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#106 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 249, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#106);
	$return72:
	// Function body ends here
}

// 
// Function: releaStaticBonus : function ()
procedure {:sourceloc "buggy_19.sol", 250, 5} {:message "ethBank::releaStaticBonus"} releaStaticBonus#1044(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#109: int_arr_ptr;
	var new_array#110: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#110 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#109 := new_array#110;
	mem_arr_int := mem_arr_int[call_arg#109 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 252, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return74:
	// Function body ends here
	$return73:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_19.sol", 255, 1} {:message "ethBank::bug_unchk_send27"} bug_unchk_send27#1057(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#111: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#111 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 256, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#111);
	$return75:
	// Function body ends here
}

// 
// Function: releaActiveBonus : function ()
procedure {:sourceloc "buggy_19.sol", 257, 5} {:message "ethBank::releaActiveBonus"} releaActiveBonus#1084(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#114: int_arr_ptr;
	var new_array#115: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#115 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#114 := new_array#115;
	mem_arr_int := mem_arr_int[call_arg#114 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 259, 17} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return77:
	// Function body ends here
	$return76:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_19.sol", 262, 1} {:message "ethBank::bug_unchk_send31"} bug_unchk_send31#1097(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#116: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#116 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 263, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#116);
	$return78:
	// Function body ends here
}

// 
// Function: releaTeamAddBonus : function ()
procedure {:sourceloc "buggy_19.sol", 264, 5} {:message "ethBank::releaTeamAddBonus"} releaTeamAddBonus#1124(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#119: int_arr_ptr;
	var new_array#120: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#118[__this]);
	// Function body starts here
	new_array#120 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#119 := new_array#120;
	mem_arr_int := mem_arr_int[call_arg#119 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114][10 := 32][11 := 99][12 := 97][13 := 110][14 := 32][15 := 117][16 := 115][17 := 101][18 := 32][19 := 116][20 := 104][21 := 105][22 := 115][23 := 32][24 := 109][25 := 101][26 := 116][27 := 104][28 := 111][29 := 100], 30)];
	assume (__msg_sender == owner#118[__this]);
	assume {:sourceloc "buggy_19.sol", 266, 17} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	$return80:
	// Function body ends here
	$return79:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_19.sol", 269, 1} {:message "ethBank::bug_unchk_send13"} bug_unchk_send13#1137(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#121: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#121 := 1000000000000000000;
	assume {:sourceloc "buggy_19.sol", 270, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#121);
	$return81:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_19.sol", 90, 1} {:message "ethBank::[implicit_constructor]"} __constructor#1138(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	owner#118 := owner#118[__this := 0];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#118 := owner#118[__this := __msg_sender];
	$return82:
	// Function body ends here
	// Inlined constructor for owned ends here
}

