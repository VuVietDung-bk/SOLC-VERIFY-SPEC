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
procedure {:inline 1} {:sourceloc "buggy_49.sol", 38, 3} {:message "[event] TAMC::Transfer"} Transfer#145(__this: address_t, __msg_sender: address_t, __msg_value: int, from#139: address_t, to#141: address_t, value#143: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_49.sol", 58, 3} {:message "[event] TAMC::Approval"} Approval#234(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#228: address_t, spender#230: address_t, value#232: int)
{
	
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_49.sol", 8, 3} {:message "winner_tmstmp35"} winner_tmstmp35#3: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_49.sol", 9, 1} {:message "TAMC::play_tmstmp35"} play_tmstmp35#29(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#5: int)
{
	var {:sourceloc "buggy_49.sol", 10, 2} {:message "_vtime"} _vtime#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#9 := __block_timestamp;
	if (((startTime#5 + 432000) == _vtime#9)) {
	winner_tmstmp35#3 := winner_tmstmp35#3[__this := __msg_sender];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_49.sol", 13, 3} {:message "balanceOf"} balanceOf#33: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_49.sol", 15, 3} {:message "TAMC::bug_tmstmp40"} bug_tmstmp40#80(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_49.sol", 16, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#37 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#37);
	pastBlockTime_tmstmp40#37 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_49.sol", 21, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return1:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_49.sol", 24, 3} {:message "name"} name#83: [address_t]int_arr_type;
// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_49.sol", 25, 3} {:message "TAMC::bug_tmstmp33"} bug_tmstmp33#94(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#86: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#86 := (__block_timestamp >= 1546300800);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_49.sol", 28, 3} {:message "symbol"} symbol#97: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_49.sol", 29, 3} {:message "winner_tmstmp27"} winner_tmstmp27#99: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_49.sol", 30, 1} {:message "TAMC::play_tmstmp27"} play_tmstmp27#125(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#101: int)
{
	var {:sourceloc "buggy_49.sol", 31, 2} {:message "_vtime"} _vtime#105: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#105 := __block_timestamp;
	if (((startTime#101 + 432000) == _vtime#105)) {
	winner_tmstmp27#99 := winner_tmstmp27#99[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_49.sol", 34, 3} {:message "decimals"} decimals#128: [address_t]int;
// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_49.sol", 35, 5} {:message "totalSupply"} totalSupply#133: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_49.sol", 37, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#137: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_49.sol", 40, 5} {:message "TAMC::[constructor]"} __constructor#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: address_t;
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp35#3 := winner_tmstmp35#3[__this := 0];
	balanceOf#33 := balanceOf#33[__this := default_address_t_int()];
	name#83 := name#83[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	symbol#97 := symbol#97[__this := int_arr#constr(default_int_int()[0 := 84][1 := 65][2 := 77][3 := 67], 4)];
	winner_tmstmp27#99 := winner_tmstmp27#99[__this := 0];
	decimals#128 := decimals#128[__this := 18];
	totalSupply#133 := totalSupply#133[__this := 1000000000000000000000000000];
	bugv_tmstmp3#137 := bugv_tmstmp3#137[__this := __block_timestamp];
	bugv_tmstmp5#222 := bugv_tmstmp5#222[__this := __block_timestamp];
	bugv_tmstmp4#226 := bugv_tmstmp4#226[__this := __block_timestamp];
	winner_tmstmp31#236 := winner_tmstmp31#236[__this := 0];
	allowance#268 := allowance#268[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp1#300 := bugv_tmstmp1#300[__this := __block_timestamp];
	bugv_tmstmp2#364 := bugv_tmstmp2#364[__this := __block_timestamp];
	// Function body starts here
	balanceOf#33 := balanceOf#33[__this := balanceOf#33[__this][__msg_sender := totalSupply#133[__this]]];
	call_arg#0 := 0;
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 42, 14} {:message ""} true;
	call Transfer#145(__this, __msg_sender, __msg_value, call_arg#0, call_arg#1, totalSupply#133[__this]);
	$return4:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_49.sol", 44, 1} {:message "TAMC::bug_tmstmp13"} bug_tmstmp13#177(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#169: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#169 := (__block_timestamp >= 1546300800);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 48, 5} {:message "TAMC::transfer"} transfer#218(__this: address_t, __msg_sender: address_t, __msg_value: int, to#179: address_t, value#181: int)
	returns (success#184: bool)
{
	var call_arg#2: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#33[__this][__msg_sender] >= value#181);
	balanceOf#33 := balanceOf#33[__this := balanceOf#33[__this][__msg_sender := (balanceOf#33[__this][__msg_sender] - value#181)]];
	balanceOf#33 := balanceOf#33[__this := balanceOf#33[__this][to#179 := (balanceOf#33[__this][to#179] + value#181)]];
	call_arg#2 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 52, 14} {:message ""} true;
	call Transfer#145(__this, __msg_sender, __msg_value, call_arg#2, to#179, value#181);
	success#184 := true;
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_49.sol", 55, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#222: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_49.sol", 57, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#226: [address_t]int;
// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_49.sol", 60, 3} {:message "winner_tmstmp31"} winner_tmstmp31#236: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_49.sol", 61, 1} {:message "TAMC::play_tmstmp31"} play_tmstmp31#262(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#238: int)
{
	var {:sourceloc "buggy_49.sol", 62, 2} {:message "_vtime"} _vtime#242: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#242 := __block_timestamp;
	if (((startTime#238 + 432000) == _vtime#242)) {
	winner_tmstmp31#236 := winner_tmstmp31#236[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_49.sol", 65, 3} {:message "allowance"} allowance#268: [address_t][address_t][address_t]int;
// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 67, 5} {:message "TAMC::approve"} approve#296(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#270: address_t, value#272: int)
	returns (success#275: bool)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#268 := allowance#268[__this := allowance#268[__this][__msg_sender := allowance#268[__this][__msg_sender][spender#270 := value#272]]];
	call_arg#3 := __msg_sender;
	assume {:sourceloc "buggy_49.sol", 72, 14} {:message ""} true;
	call Approval#234(__this, __msg_sender, __msg_value, call_arg#3, spender#270, value#272);
	success#275 := true;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_49.sol", 75, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#300: [address_t]int;
// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_49.sol", 77, 5} {:message "TAMC::transferFrom"} transferFrom#360(__this: address_t, __msg_sender: address_t, __msg_value: int, from#302: address_t, to#304: address_t, value#306: int)
	returns (success#309: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (value#306 <= balanceOf#33[__this][from#302]);
	assume (value#306 <= allowance#268[__this][from#302][__msg_sender]);
	balanceOf#33 := balanceOf#33[__this := balanceOf#33[__this][from#302 := (balanceOf#33[__this][from#302] - value#306)]];
	balanceOf#33 := balanceOf#33[__this := balanceOf#33[__this][to#304 := (balanceOf#33[__this][to#304] + value#306)]];
	allowance#268 := allowance#268[__this := allowance#268[__this][from#302 := allowance#268[__this][from#302][__msg_sender := (allowance#268[__this][from#302][__msg_sender] - value#306)]]];
	assume {:sourceloc "buggy_49.sol", 87, 14} {:message ""} true;
	call Transfer#145(__this, __msg_sender, __msg_value, from#302, to#304, value#306);
	success#309 := true;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_49.sol", 90, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#364: [address_t]int;
