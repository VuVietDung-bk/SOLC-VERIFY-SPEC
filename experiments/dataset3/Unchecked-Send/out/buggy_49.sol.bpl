// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_49.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: TAMC -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_49.sol", 25, 3} {:message "[event] TAMC::Transfer"} Transfer#92(__this: address_t, __msg_sender: address_t, __msg_value: int, from#86: address_t, to#88: address_t, value#90: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_49.sol", 46, 3} {:message "[event] TAMC::Approval"} Approval#201(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#195: address_t, spender#197: address_t, value#199: int)
{
	
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_49.sol", 8, 3} {:message "TAMC::bug_unchk_send20"} bug_unchk_send20#14(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 9, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 10, 3} {:message "balanceOf"} balanceOf#18: [address_t][address_t]int;
// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_49.sol", 12, 3} {:message "TAMC::bug_unchk_send32"} bug_unchk_send32#31(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 13, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_49.sol", 14, 3} {:message "name"} name#34: [address_t]int_arr_type;
// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_49.sol", 15, 3} {:message "TAMC::bug_unchk_send4"} bug_unchk_send4#47(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 16, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_49.sol", 17, 3} {:message "symbol"} symbol#50: [address_t]int_arr_type;
// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_49.sol", 18, 3} {:message "TAMC::bug_unchk_send7"} bug_unchk_send7#63(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 19, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_49.sol", 20, 3} {:message "decimals"} decimals#66: [address_t]int;
// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_49.sol", 21, 5} {:message "totalSupply"} totalSupply#71: [address_t]int;
// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_49.sol", 23, 3} {:message "TAMC::bug_unchk_send31"} bug_unchk_send31#84(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 24, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_49.sol", 27, 5} {:message "TAMC::[constructor]"} __constructor#335(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: address_t;
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balanceOf#18 := balanceOf#18[__this := default_address_t_int()];
	name#34 := name#34[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	symbol#50 := symbol#50[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	decimals#66 := decimals#66[__this := 18];
	totalSupply#71 := totalSupply#71[__this := 1000000000000000000000000000];
	allowance#220 := allowance#220[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	balanceOf#18 := balanceOf#18[__this := balanceOf#18[__this][__msg_sender := totalSupply#71[__this]]];
	call_arg#5 := 0;
	call_arg#6 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 29, 14} {:message ""} true;
	call Transfer#92(__this, __msg_sender, __msg_value, call_arg#5, call_arg#6, totalSupply#71[__this]);
	$return5:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_49.sol", 31, 1} {:message "TAMC::bug_unchk_send14"} bug_unchk_send14#126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 32, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 34, 5} {:message "TAMC::transfer"} transfer#167(__this: address_t, __msg_sender: address_t, __msg_value: int, to#128: address_t, value#130: int)
	returns (success#133: bool)
{
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#18[__this][__msg_sender] >= value#130);
	balanceOf#18 := balanceOf#18[__this := balanceOf#18[__this][__msg_sender := (balanceOf#18[__this][__msg_sender] - value#130)]];
	balanceOf#18 := balanceOf#18[__this := balanceOf#18[__this][to#128 := (balanceOf#18[__this][to#128] + value#130)]];
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 38, 14} {:message ""} true;
	call Transfer#92(__this, __msg_sender, __msg_value, call_arg#8, to#128, value#130);
	success#133 := true;
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_49.sol", 41, 1} {:message "TAMC::bug_unchk_send30"} bug_unchk_send30#180(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 42, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_49.sol", 44, 3} {:message "TAMC::bug_unchk_send13"} bug_unchk_send13#193(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 45, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_49.sol", 48, 3} {:message "TAMC::bug_unchk_send23"} bug_unchk_send23#214(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 49, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return10:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_49.sol", 50, 3} {:message "allowance"} allowance#220: [address_t][address_t][address_t]int;
// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 52, 5} {:message "TAMC::approve"} approve#248(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#222: address_t, value#224: int)
	returns (success#227: bool)
{
	var call_arg#12: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#220 := allowance#220[__this := allowance#220[__this][__msg_sender := allowance#220[__this][__msg_sender][spender#222 := value#224]]];
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 57, 14} {:message ""} true;
	call Approval#201(__this, __msg_sender, __msg_value, call_arg#12, spender#222, value#224);
	success#227 := true;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_49.sol", 60, 1} {:message "TAMC::bug_unchk_send8"} bug_unchk_send8#261(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 61, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return12:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 63, 5} {:message "TAMC::transferFrom"} transferFrom#321(__this: address_t, __msg_sender: address_t, __msg_value: int, from#263: address_t, to#265: address_t, value#267: int)
	returns (success#270: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#267 <= balanceOf#18[__this][from#263]);
	assume (value#267 <= allowance#220[__this][from#263][__msg_sender]);
	balanceOf#18 := balanceOf#18[__this := balanceOf#18[__this][from#263 := (balanceOf#18[__this][from#263] - value#267)]];
	balanceOf#18 := balanceOf#18[__this := balanceOf#18[__this][to#265 := (balanceOf#18[__this][to#265] + value#267)]];
	allowance#220 := allowance#220[__this := allowance#220[__this][from#263 := allowance#220[__this][from#263][__msg_sender := (allowance#220[__this][from#263][__msg_sender] - value#267)]]];
	assume {:sourceloc "buggy_49.sol", 73, 14} {:message ""} true;
	call Transfer#92(__this, __msg_sender, __msg_value, from#263, to#265, value#267);
	success#270 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_49.sol", 76, 1} {:message "TAMC::bug_unchk_send27"} bug_unchk_send27#334(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_49.sol", 77, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return14:
	// Function body ends here
}

