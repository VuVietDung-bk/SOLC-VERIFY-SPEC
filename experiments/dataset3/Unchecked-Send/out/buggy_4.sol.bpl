// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_4.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_4.sol", 21, 5} {:message "[event] IERC20::Transfer"} Transfer#31(__this: address_t, __msg_sender: address_t, __msg_value: int, from#25: address_t, to#27: address_t, value#29: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_4.sol", 18, 5} {:message "IERC20::totalSupply"} totalSupply#7(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#5: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_4.sol", 19, 5} {:message "IERC20::balanceOf"} balanceOf#14(__this: address_t, __msg_sender: address_t, __msg_value: int, who#9: address_t)
	returns (#12: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_4.sol", 20, 5} {:message "IERC20::transfer"} transfer#23(__this: address_t, __msg_sender: address_t, __msg_value: int, to#16: address_t, value#18: int)
	returns (#21: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_4.sol", 17, 1} {:message "IERC20::[implicit_constructor]"} __constructor#32(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: PHO -------
// Inherits from: IERC20
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_4.sol", 29, 3} {:message "PHO::bug_unchk_send2"} bug_unchk_send2#48(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 30, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_4.sol", 31, 3} {:message "name"} name#51: [address_t]int_arr_type;
// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_4.sol", 32, 3} {:message "PHO::bug_unchk_send17"} bug_unchk_send17#64(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 33, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_4.sol", 34, 3} {:message "symbol"} symbol#67: [address_t]int_arr_type;
// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_4.sol", 35, 3} {:message "PHO::bug_unchk_send3"} bug_unchk_send3#80(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 36, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_4.sol", 37, 3} {:message "decimals"} decimals#83: [address_t]int;
// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_4.sol", 39, 3} {:message "PHO::bug_unchk_send9"} bug_unchk_send9#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 40, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// State variable: saleAmount: uint256
var {:sourceloc "buggy_4.sol", 41, 3} {:message "saleAmount"} saleAmount#98: [address_t]int;
// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_4.sol", 42, 3} {:message "PHO::bug_unchk_send25"} bug_unchk_send25#111(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 43, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

// 
// State variable: evtAmount: uint256
var {:sourceloc "buggy_4.sol", 44, 3} {:message "evtAmount"} evtAmount#113: [address_t]int;
// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_4.sol", 45, 3} {:message "PHO::bug_unchk_send19"} bug_unchk_send19#126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 46, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// State variable: teamAmount: uint256
var {:sourceloc "buggy_4.sol", 47, 3} {:message "teamAmount"} teamAmount#128: [address_t]int;
// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_4.sol", 49, 3} {:message "PHO::bug_unchk_send26"} bug_unchk_send26#141(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 50, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_4.sol", 51, 3} {:message "_totalSupply"} _totalSupply#143: [address_t]int;
// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_4.sol", 52, 3} {:message "PHO::bug_unchk_send20"} bug_unchk_send20#156(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 53, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return7:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_4.sol", 54, 3} {:message "balances"} balances#160: [address_t][address_t]int;
// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_4.sol", 56, 3} {:message "PHO::bug_unchk_send32"} bug_unchk_send32#173(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 57, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return8:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_4.sol", 58, 3} {:message "owner"} owner#175: [address_t]address_t;
// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_4.sol", 59, 3} {:message "PHO::bug_unchk_send4"} bug_unchk_send4#188(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 60, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return9:
	// Function body ends here
}

// 
// State variable: sale: address
var {:sourceloc "buggy_4.sol", 61, 3} {:message "sale"} sale#190: [address_t]address_t;
// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_4.sol", 62, 3} {:message "PHO::bug_unchk_send7"} bug_unchk_send7#203(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 63, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return10:
	// Function body ends here
}

// 
// State variable: evt: address
var {:sourceloc "buggy_4.sol", 64, 3} {:message "evt"} evt#205: [address_t]address_t;
// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_4.sol", 65, 3} {:message "PHO::bug_unchk_send23"} bug_unchk_send23#218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 66, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return11:
	// Function body ends here
}

// 
// State variable: team: address
var {:sourceloc "buggy_4.sol", 67, 3} {:message "team"} team#220: [address_t]address_t;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
const unique address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561: address_t;
const unique address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6: address_t;
const unique address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_4.sol", 74, 5} {:message "PHO::[constructor]"} __constructor#616(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	var toWei#602_ret#13: int;
	var call_arg#14: int;
	var toWei#602_ret#15: int;
	var call_arg#16: int;
	var toWei#602_ret#17: int;
	var call_arg#18: int;
	var toWei#602_ret#19: int;
	var call_arg#20: address_t;
	var transfer#521_ret#21: bool;
	var transfer#521_ret#22: bool;
	var transfer#521_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#51 := name#51[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	symbol#67 := symbol#67[__this := int_arr#constr(default_int_int()[0 := 80][1 := 72][2 := 79], 3)];
	decimals#83 := decimals#83[__this := 18];
	saleAmount#98 := saleAmount#98[__this := 0];
	evtAmount#113 := evtAmount#113[__this := 0];
	teamAmount#128 := teamAmount#128[__this := 0];
	_totalSupply#143 := _totalSupply#143[__this := 0];
	balances#160 := balances#160[__this := default_address_t_int()];
	owner#175 := owner#175[__this := 0];
	sale#190 := sale#190[__this := 0];
	evt#205 := evt#205[__this := 0];
	team#220 := team#220[__this := 0];
	// Function body starts here
	owner#175 := owner#175[__this := __msg_sender];
	sale#190 := sale#190[__this := address_0x071F73f4D0befd4406901AACE6D5FFD6D297c561];
	evt#205 := evt#205[__this := address_0x76535ca5BF1d33434A302e5A464Df433BB1F80F6];
	team#220 := team#220[__this := address_0xD7EC5D8697e4c83Dc33D781d19dc2910fB165D5C];
	call_arg#12 := 1000000000;
	assume {:sourceloc "buggy_4.sol", 80, 25} {:message ""} true;
	call toWei#602_ret#13 := toWei#602(__this, __msg_sender, __msg_value, call_arg#12);
	saleAmount#98 := saleAmount#98[__this := toWei#602_ret#13];
	call_arg#14 := 200000000;
	assume {:sourceloc "buggy_4.sol", 81, 25} {:message ""} true;
	call toWei#602_ret#15 := toWei#602(__this, __msg_sender, __msg_value, call_arg#14);
	evtAmount#113 := evtAmount#113[__this := toWei#602_ret#15];
	call_arg#16 := 800000000;
	assume {:sourceloc "buggy_4.sol", 82, 25} {:message ""} true;
	call toWei#602_ret#17 := toWei#602(__this, __msg_sender, __msg_value, call_arg#16);
	teamAmount#128 := teamAmount#128[__this := toWei#602_ret#17];
	call_arg#18 := 2000000000;
	assume {:sourceloc "buggy_4.sol", 83, 25} {:message ""} true;
	call toWei#602_ret#19 := toWei#602(__this, __msg_sender, __msg_value, call_arg#18);
	_totalSupply#143 := _totalSupply#143[__this := toWei#602_ret#19];
	assume (_totalSupply#143[__this] == ((saleAmount#98[__this] + evtAmount#113[__this]) + teamAmount#128[__this]));
	balances#160 := balances#160[__this := balances#160[__this][owner#175[__this] := _totalSupply#143[__this]]];
	call_arg#20 := 0;
	assume {:sourceloc "buggy_4.sol", 88, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#20, owner#175[__this], balances#160[__this][owner#175[__this]]);
	assume {:sourceloc "buggy_4.sol", 90, 9} {:message ""} true;
	call transfer#521_ret#21 := transfer#521(__this, __msg_sender, __msg_value, sale#190[__this], saleAmount#98[__this]);
	assume {:sourceloc "buggy_4.sol", 91, 9} {:message ""} true;
	call transfer#521_ret#22 := transfer#521(__this, __msg_sender, __msg_value, evt#205[__this], evtAmount#113[__this]);
	assume {:sourceloc "buggy_4.sol", 92, 9} {:message ""} true;
	call transfer#521_ret#23 := transfer#521(__this, __msg_sender, __msg_value, team#220[__this], teamAmount#128[__this]);
	assume (balances#160[__this][owner#175[__this]] == 0);
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_4.sol", 95, 1} {:message "PHO::bug_unchk_send14"} bug_unchk_send14#339(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 96, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return13:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 98, 5} {:message "PHO::totalSupply"} totalSupply#348(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#343: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#343 := _totalSupply#143[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_4.sol", 101, 1} {:message "PHO::bug_unchk_send30"} bug_unchk_send30#361(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 102, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return15:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_4.sol", 104, 5} {:message "PHO::balanceOf"} balanceOf#374(__this: address_t, __msg_sender: address_t, __msg_value: int, who#363: address_t)
	returns (#367: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#367 := balances#160[__this][who#363];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_4.sol", 107, 1} {:message "PHO::bug_unchk_send8"} bug_unchk_send8#387(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 108, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return17:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_4.sol", 110, 5} {:message "PHO::transfer"} transfer#521(__this: address_t, __msg_sender: address_t, __msg_value: int, to#389: address_t, value#391: int)
	returns (success#395: bool)
{
	var call_arg#27: int;
	var toWei#602_ret#28: int;
	var call_arg#29: int;
	var toWei#602_ret#30: int;
	var call_arg#31: int;
	var toWei#602_ret#32: int;
	var call_arg#33: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender != to#389);
	assume (value#391 > 0);
	assume (balances#160[__this][__msg_sender] >= value#391);
	assume ((balances#160[__this][to#389] + value#391) >= balances#160[__this][to#389]);
	if ((__msg_sender == team#220[__this])) {
	assume (__block_timestamp >= 1589036400);
	call_arg#27 := 600000000;
	assume {:sourceloc "buggy_4.sol", 119, 47} {:message ""} true;
	call toWei#602_ret#28 := toWei#602(__this, __msg_sender, __msg_value, call_arg#27);
	if (((balances#160[__this][__msg_sender] - value#391) < toWei#602_ret#28)) {
	assume (__block_timestamp >= 1620572400);
	}

	call_arg#29 := 400000000;
	assume {:sourceloc "buggy_4.sol", 121, 47} {:message ""} true;
	call toWei#602_ret#30 := toWei#602(__this, __msg_sender, __msg_value, call_arg#29);
	if (((balances#160[__this][__msg_sender] - value#391) < toWei#602_ret#30)) {
	assume (__block_timestamp >= 1652108400);
	}

	call_arg#31 := 200000000;
	assume {:sourceloc "buggy_4.sol", 123, 47} {:message ""} true;
	call toWei#602_ret#32 := toWei#602(__this, __msg_sender, __msg_value, call_arg#31);
	if (((balances#160[__this][__msg_sender] - value#391) < toWei#602_ret#32)) {
	assume (__block_timestamp >= 1683644400);
	}

	}

	balances#160 := balances#160[__this := balances#160[__this][__msg_sender := (balances#160[__this][__msg_sender] - value#391)]];
	balances#160 := balances#160[__this := balances#160[__this][to#389 := (balances#160[__this][to#389] + value#391)]];
	call_arg#33 := __msg_sender;
	assume {:sourceloc "buggy_4.sol", 130, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#33, to#389, value#391);
	success#395 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_4.sol", 133, 1} {:message "PHO::bug_unchk_send27"} bug_unchk_send27#534(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#34 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 134, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#34);
	$return19:
	// Function body ends here
}

// 
// Function: burnCoins : function (uint256)
procedure {:sourceloc "buggy_4.sol", 136, 5} {:message "PHO::burnCoins"} burnCoins#576(__this: address_t, __msg_sender: address_t, __msg_value: int, value#536: int)
{
	var call_arg#35: address_t;
	var call_arg#36: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#160[__this][__msg_sender] >= value#536);
	assume (_totalSupply#143[__this] >= value#536);
	balances#160 := balances#160[__this := balances#160[__this][__msg_sender := (balances#160[__this][__msg_sender] - value#536)]];
	_totalSupply#143 := _totalSupply#143[__this := (_totalSupply#143[__this] - value#536)];
	call_arg#35 := __msg_sender;
	call_arg#36 := 0;
	assume {:sourceloc "buggy_4.sol", 143, 14} {:message ""} true;
	call Transfer#31(__this, __msg_sender, __msg_value, call_arg#35, call_arg#36, value#536);
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_4.sol", 145, 1} {:message "PHO::bug_unchk_send31"} bug_unchk_send31#589(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#37 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 146, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#37);
	$return21:
	// Function body ends here
}

// 
// Function: toWei : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_4.sol", 152, 5} {:message "PHO::toWei"} toWei#602(__this: address_t, __msg_sender: address_t, __msg_value: int, value#592: int)
	returns (#595: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#595 := (value#592 * 1000000000000000000);
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_4.sol", 155, 1} {:message "PHO::bug_unchk_send13"} bug_unchk_send13#615(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_4.sol", 156, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#38);
	$return23:
	// Function body ends here
}

