// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_1.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: EIP20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_1.sol", 60, 3} {:message "[event] EIP20Interface::Transfer"} Transfer#140(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#134: address_t, _to#136: address_t, _value#138: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_1.sol", 63, 3} {:message "[event] EIP20Interface::Approval"} Approval#161(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#155: address_t, _spender#157: address_t, _value#159: int)
{
	
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_1.sol", 17, 5} {:message "totalSupply"} totalSupply#4: [address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 21, 5} {:message "EIP20Interface::balanceOf"} balanceOf#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#7: address_t)
	returns (balance#10: int);
	modifies totalSupply#4;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_1.sol", 22, 1} {:message "EIP20Interface::bug_unchk_send19"} bug_unchk_send19#25(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 23, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 29, 5} {:message "EIP20Interface::transfer"} transfer#35(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#28: address_t, _value#30: int)
	returns (success#33: bool);
	modifies totalSupply#4;

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_1.sol", 30, 1} {:message "EIP20Interface::bug_unchk_send26"} bug_unchk_send26#48(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 31, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 38, 5} {:message "EIP20Interface::transferFrom"} transferFrom#60(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#51: address_t, _to#53: address_t, _value#55: int)
	returns (success#58: bool);
	modifies totalSupply#4;

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_1.sol", 39, 1} {:message "EIP20Interface::bug_unchk_send20"} bug_unchk_send20#73(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 40, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 46, 5} {:message "EIP20Interface::approve"} approve#83(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#76: address_t, _value#78: int)
	returns (success#81: bool);
	modifies totalSupply#4;

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_1.sol", 47, 1} {:message "EIP20Interface::bug_unchk_send32"} bug_unchk_send32#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 48, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 53, 5} {:message "EIP20Interface::allowance"} allowance#106(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#99: address_t, _spender#101: address_t)
	returns (remaining#104: int);
	modifies totalSupply#4;

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_1.sol", 54, 1} {:message "EIP20Interface::bug_unchk_send4"} bug_unchk_send4#119(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 55, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_1.sol", 58, 3} {:message "EIP20Interface::bug_unchk_send31"} bug_unchk_send31#132(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 59, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_1.sol", 61, 3} {:message "EIP20Interface::bug_unchk_send13"} bug_unchk_send13#153(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 62, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_1.sol", 6, 1} {:message "EIP20Interface::[implicit_constructor]"} __constructor#162(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	totalSupply#4 := totalSupply#4[__this := 0];
}

// 
// ------- Contract: HotDollarsToken -------
// Inherits from: EIP20Interface
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_1.sol", 68, 3} {:message "HotDollarsToken::bug_unchk_send2"} bug_unchk_send2#184(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 69, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return7:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_1.sol", 70, 3} {:message "balances"} balances#188: [address_t][address_t]int;
// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_1.sol", 71, 3} {:message "HotDollarsToken::bug_unchk_send17"} bug_unchk_send17#201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 72, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return8:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_1.sol", 73, 3} {:message "allowed"} allowed#207: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_1.sol", 80, 3} {:message "HotDollarsToken::bug_unchk_send3"} bug_unchk_send3#220(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 81, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return9:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_1.sol", 82, 3} {:message "name"} name#222: [address_t]int_arr_type;
// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_1.sol", 83, 3} {:message "HotDollarsToken::bug_unchk_send9"} bug_unchk_send9#235(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 84, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return10:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_1.sol", 85, 3} {:message "decimals"} decimals#237: [address_t]int;
// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_1.sol", 86, 3} {:message "HotDollarsToken::bug_unchk_send25"} bug_unchk_send25#250(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 87, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return11:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_1.sol", 88, 3} {:message "symbol"} symbol#252: [address_t]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_1.sol", 90, 9} {:message "HotDollarsToken::[constructor]"} __constructor#529(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances#188 := balances#188[__this := default_address_t_int()];
	allowed#207 := allowed#207[__this := default_address_t__k_address_t_v_int()];
	name#222 := name#222[__this := int_arr#constr(default_int_int(), 0)];
	decimals#237 := decimals#237[__this := 0];
	symbol#252 := symbol#252[__this := int_arr#constr(default_int_int(), 0)];
	totalSupply#4 := totalSupply#4[__this := 0];
	// Function body starts here
	totalSupply#4 := totalSupply#4[__this := 30000000000000000000000000000];
	name#222 := name#222[__this := int_arr#constr(default_int_int()[0 := 72][1 := 111][2 := 116][3 := 68][4 := 111][5 := 108][6 := 108][7 := 97][8 := 114][9 := 115][10 := 32][11 := 84][12 := 111][13 := 107][14 := 101][15 := 110], 16)];
	decimals#237 := decimals#237[__this := 18];
	symbol#252 := symbol#252[__this := int_arr#constr(default_int_int()[0 := 72][1 := 68][2 := 83], 3)];
	balances#188 := balances#188[__this := balances#188[__this][__msg_sender := totalSupply#4[__this]]];
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_1.sol", 97, 1} {:message "HotDollarsToken::bug_unchk_send7"} bug_unchk_send7#294(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 98, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return13:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 100, 5} {:message "HotDollarsToken::transfer"} transfer#336(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#296: address_t, _value#298: int)
	returns (success#302: bool)
{
	var call_arg#13: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#188[__this][__msg_sender] >= _value#298);
	balances#188 := balances#188[__this := balances#188[__this][__msg_sender := (balances#188[__this][__msg_sender] - _value#298)]];
	balances#188 := balances#188[__this := balances#188[__this][_to#296 := (balances#188[__this][_to#296] + _value#298)]];
	call_arg#13 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 104, 14} {:message ""} true;
	call Transfer#140(__this, __msg_sender, __msg_value, call_arg#13, _to#296, _value#298);
	success#302 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_1.sol", 107, 1} {:message "HotDollarsToken::bug_unchk_send23"} bug_unchk_send23#349(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 108, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return15:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 110, 5} {:message "HotDollarsToken::transferFrom"} transferFrom#417(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#351: address_t, _to#353: address_t, _value#355: int)
	returns (success#359: bool)
{
	var {:sourceloc "buggy_1.sol", 111, 9} {:message "allowedAmount"} allowedAmount#362: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowedAmount#362 := allowed#207[__this][_from#351][__msg_sender];
	assume ((balances#188[__this][_from#351] >= _value#355) && (allowedAmount#362 >= _value#355));
	balances#188 := balances#188[__this := balances#188[__this][_to#353 := (balances#188[__this][_to#353] + _value#355)]];
	balances#188 := balances#188[__this := balances#188[__this][_from#351 := (balances#188[__this][_from#351] - _value#355)]];
	if ((allowedAmount#362 < 115792089237316195423570985008687907853269984665640564039457584007913129639935)) {
	allowed#207 := allowed#207[__this := allowed#207[__this][_from#351 := allowed#207[__this][_from#351][__msg_sender := (allowed#207[__this][_from#351][__msg_sender] - _value#355)]]];
	}

	assume {:sourceloc "buggy_1.sol", 118, 14} {:message ""} true;
	call Transfer#140(__this, __msg_sender, __msg_value, _from#351, _to#353, _value#355);
	success#359 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_1.sol", 121, 1} {:message "HotDollarsToken::bug_unchk_send14"} bug_unchk_send14#430(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 122, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return17:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 124, 5} {:message "HotDollarsToken::balanceOf"} balanceOf#443(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#432: address_t)
	returns (balance#436: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#436 := balances#188[__this][_owner#432];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_1.sol", 127, 1} {:message "HotDollarsToken::bug_unchk_send30"} bug_unchk_send30#456(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 128, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return19:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_1.sol", 130, 5} {:message "HotDollarsToken::approve"} approve#485(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#458: address_t, _value#460: int)
	returns (success#464: bool)
{
	var call_arg#17: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#207 := allowed#207[__this := allowed#207[__this][__msg_sender := allowed#207[__this][__msg_sender][_spender#458 := _value#460]]];
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_1.sol", 132, 14} {:message ""} true;
	call Approval#161(__this, __msg_sender, __msg_value, call_arg#17, _spender#458, _value#460);
	success#464 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_1.sol", 135, 1} {:message "HotDollarsToken::bug_unchk_send8"} bug_unchk_send8#498(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 136, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return21:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_1.sol", 138, 5} {:message "HotDollarsToken::allowance"} allowance#515(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#500: address_t, _spender#502: address_t)
	returns (remaining#506: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#506 := allowed#207[__this][_owner#500][_spender#502];
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_1.sol", 141, 1} {:message "HotDollarsToken::bug_unchk_send27"} bug_unchk_send27#528(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_1.sol", 142, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return23:
	// Function body ends here
}

