// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_3.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: CareerOnToken -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_3.sol", 10, 3} {:message "[event] CareerOnToken::Transfer"} Transfer#22(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#16: address_t, _to#18: address_t, _value#20: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_3.sol", 13, 3} {:message "[event] CareerOnToken::Approval"} Approval#43(__this: address_t, __msg_sender: address_t, __msg_value: int, a_owner#37: address_t, _spender#39: address_t, _value#41: int)
{
	
}

// 
// Event: OwnerChang
procedure {:inline 1} {:sourceloc "buggy_3.sol", 16, 3} {:message "[event] CareerOnToken::OwnerChang"} OwnerChang#64(__this: address_t, __msg_sender: address_t, __msg_value: int, _old#58: address_t, _new#60: address_t, _coin_change#62: int)
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
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_3.sol", 8, 3} {:message "CareerOnToken::bug_unchk_send27"} bug_unchk_send27#14(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 9, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_3.sol", 11, 3} {:message "CareerOnToken::bug_unchk_send31"} bug_unchk_send31#35(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 12, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_3.sol", 14, 3} {:message "CareerOnToken::bug_unchk_send13"} bug_unchk_send13#56(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 15, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_3.sol", 18, 3} {:message "CareerOnToken::bug_unchk_send12"} bug_unchk_send12#77(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 19, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_3.sol", 20, 3} {:message "totalSupply"} totalSupply#79: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_3.sol", 21, 3} {:message "CareerOnToken::bug_unchk_send11"} bug_unchk_send11#92(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 22, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_3.sol", 23, 3} {:message "name"} name#94: [address_t]int_arr_type;
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_3.sol", 24, 3} {:message "CareerOnToken::bug_unchk_send1"} bug_unchk_send1#107(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 25, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_3.sol", 26, 3} {:message "decimals"} decimals#109: [address_t]int;
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_3.sol", 27, 3} {:message "CareerOnToken::bug_unchk_send2"} bug_unchk_send2#122(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 28, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return6:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_3.sol", 29, 3} {:message "symbol"} symbol#124: [address_t]int_arr_type;
// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_3.sol", 30, 3} {:message "CareerOnToken::bug_unchk_send17"} bug_unchk_send17#137(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 31, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_3.sol", 32, 3} {:message "owner"} owner#139: [address_t]address_t;
// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_3.sol", 34, 3} {:message "CareerOnToken::bug_unchk_send3"} bug_unchk_send3#152(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 35, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_3.sol", 36, 3} {:message "balances"} balances#156: [address_t][address_t]int;
// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_3.sol", 37, 3} {:message "CareerOnToken::bug_unchk_send9"} bug_unchk_send9#169(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 38, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_3.sol", 39, 3} {:message "allowed"} allowed#175: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_3.sol", 42, 3} {:message "CareerOnToken::bug_unchk_send25"} bug_unchk_send25#188(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 43, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return10:
	// Function body ends here
}

// 
// State variable: isTransPaused: bool
var {:sourceloc "buggy_3.sol", 44, 3} {:message "isTransPaused"} isTransPaused#191: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 46, 5} {:message "CareerOnToken::[constructor]"} __constructor#713(__this: address_t, __msg_sender: address_t, __msg_value: int, _initialAmount#193: int, _decimalUnits#195: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	totalSupply#79 := totalSupply#79[__this := 0];
	name#94 := name#94[__this := int_arr#constr(default_int_int(), 0)];
	decimals#109 := decimals#109[__this := 0];
	symbol#124 := symbol#124[__this := int_arr#constr(default_int_int(), 0)];
	owner#139 := owner#139[__this := 0];
	balances#156 := balances#156[__this := default_address_t_int()];
	allowed#175 := allowed#175[__this := default_address_t__k_address_t_v_int()];
	isTransPaused#191 := isTransPaused#191[__this := false];
	// Function body starts here
	owner#139 := owner#139[__this := __msg_sender];
	if ((_initialAmount#193 <= 0)) {
	totalSupply#79 := totalSupply#79[__this := 100000000000000000];
	balances#156 := balances#156[__this := balances#156[__this][owner#139[__this] := totalSupply#79[__this]]];
	}
	else {
	totalSupply#79 := totalSupply#79[__this := _initialAmount#193];
	balances#156 := balances#156[__this := balances#156[__this][owner#139[__this] := _initialAmount#193]];
	}

	if ((_decimalUnits#195 <= 0)) {
	decimals#109 := decimals#109[__this := 2];
	}
	else {
	decimals#109 := decimals#109[__this := _decimalUnits#195];
	}

	name#94 := name#94[__this := int_arr#constr(default_int_int()[0 := 67][1 := 97][2 := 114][3 := 101][4 := 101][5 := 114][6 := 79][7 := 110][8 := 32][9 := 67][10 := 104][11 := 97][12 := 105][13 := 110][14 := 32][15 := 84][16 := 111][17 := 107][18 := 101][19 := 110], 20)];
	symbol#124 := symbol#124[__this := int_arr#constr(default_int_int()[0 := 67][1 := 79][2 := 84], 3)];
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_3.sol", 66, 1} {:message "CareerOnToken::bug_unchk_send19"} bug_unchk_send19#265(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 67, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 70, 5} {:message "CareerOnToken::transfer"} transfer#342(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#267: address_t, _value#269: int)
	returns (success#272: bool)
{
	var call_arg#12: address_t;
	var call_arg#13: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 74, 9} {:message "Assertion might not hold."} ((((_to#267 != __this) && !(isTransPaused#191[__this])) && (balances#156[__this][__msg_sender] >= _value#269)) && ((balances#156[__this][_to#267] + _value#269) > balances#156[__this][_to#267]));
	balances#156 := balances#156[__this := balances#156[__this][__msg_sender := (balances#156[__this][__msg_sender] - _value#269)]];
	balances#156 := balances#156[__this := balances#156[__this][_to#267 := (balances#156[__this][_to#267] + _value#269)]];
	if ((__msg_sender == owner#139[__this])) {
	call_arg#12 := __this;
	assume {:sourceloc "buggy_3.sol", 83, 9} {:message ""} true;
	call Transfer#22(__this, __msg_sender, __msg_value, call_arg#12, _to#267, _value#269);
	}
	else {
	call_arg#13 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 85, 9} {:message ""} true;
	call Transfer#22(__this, __msg_sender, __msg_value, call_arg#13, _to#267, _value#269);
	}

	success#272 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_3.sol", 89, 1} {:message "CareerOnToken::bug_unchk_send26"} bug_unchk_send26#355(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 90, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 93, 5} {:message "CareerOnToken::transferFrom"} transferFrom#449(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#357: address_t, _to#359: address_t, _value#361: int)
	returns (success#364: bool)
{
	var call_arg#15: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 98, 9} {:message "Assertion might not hold."} (((((_to#359 != __this) && !(isTransPaused#191[__this])) && (balances#156[__this][__msg_sender] >= _value#361)) && ((balances#156[__this][_to#359] + _value#361) > balances#156[__this][_to#359])) && (allowed#175[__this][_from#357][__msg_sender] >= _value#361));
	balances#156 := balances#156[__this := balances#156[__this][_to#359 := (balances#156[__this][_to#359] + _value#361)]];
	balances#156 := balances#156[__this := balances#156[__this][_from#357 := (balances#156[__this][_from#357] - _value#361)]];
	allowed#175 := allowed#175[__this := allowed#175[__this][_from#357 := allowed#175[__this][_from#357][__msg_sender := (allowed#175[__this][_from#357][__msg_sender] - _value#361)]]];
	if ((_from#357 == owner#139[__this])) {
	call_arg#15 := __this;
	assume {:sourceloc "buggy_3.sol", 109, 9} {:message ""} true;
	call Transfer#22(__this, __msg_sender, __msg_value, call_arg#15, _to#359, _value#361);
	}
	else {
	assume {:sourceloc "buggy_3.sol", 111, 9} {:message ""} true;
	call Transfer#22(__this, __msg_sender, __msg_value, _from#357, _to#359, _value#361);
	}

	success#364 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_3.sol", 115, 1} {:message "CareerOnToken::bug_unchk_send20"} bug_unchk_send20#462(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 116, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_3.sol", 118, 5} {:message "CareerOnToken::approve"} approve#501(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#464: address_t, _value#466: int)
	returns (success#469: bool)
{
	var call_arg#17: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 120, 9} {:message "Assertion might not hold."} ((__msg_sender != _spender#464) && (_value#466 > 0));
	allowed#175 := allowed#175[__this := allowed#175[__this][__msg_sender := allowed#175[__this][__msg_sender][_spender#464 := _value#466]]];
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 122, 14} {:message ""} true;
	call Approval#43(__this, __msg_sender, __msg_value, call_arg#17, _spender#464, _value#466);
	success#469 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_3.sol", 125, 1} {:message "CareerOnToken::bug_unchk_send32"} bug_unchk_send32#514(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 126, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 128, 5} {:message "CareerOnToken::allowance"} allowance#530(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#516: address_t, _spender#518: address_t)
	returns (remaining#521: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#521 := allowed#175[__this][_owner#516][_spender#518];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_3.sol", 134, 1} {:message "CareerOnToken::bug_unchk_send4"} bug_unchk_send4#543(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 135, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return20:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_3.sol", 137, 5} {:message "CareerOnToken::balanceOf"} balanceOf#555(__this: address_t, __msg_sender: address_t, __msg_value: int, accountAddr#545: address_t)
	returns (#548: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#548 := balances#156[__this][accountAddr#545];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_3.sol", 140, 1} {:message "CareerOnToken::bug_unchk_send7"} bug_unchk_send7#568(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 141, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return22:
	// Function body ends here
}

// 
// Function: changeOwner : function (address)
procedure {:sourceloc "buggy_3.sol", 145, 2} {:message "CareerOnToken::changeOwner"} changeOwner#613(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#570: address_t)
{
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 146, 9} {:message "Assertion might not hold."} ((__msg_sender == owner#139[__this]) && (__msg_sender != newOwner#570));
	balances#156 := balances#156[__this := balances#156[__this][newOwner#570 := balances#156[__this][owner#139[__this]]]];
	balances#156 := balances#156[__this := balances#156[__this][owner#139[__this] := 0]];
	owner#139 := owner#139[__this := newOwner#570];
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_3.sol", 150, 14} {:message ""} true;
	call OwnerChang#64(__this, __msg_sender, __msg_value, call_arg#21, newOwner#570, balances#156[__this][owner#139[__this]]);
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_3.sol", 152, 1} {:message "CareerOnToken::bug_unchk_send23"} bug_unchk_send23#626(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 153, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return24:
	// Function body ends here
}

// 
// Function: setPauseStatus : function (bool)
procedure {:sourceloc "buggy_3.sol", 156, 5} {:message "CareerOnToken::setPauseStatus"} setPauseStatus#643(__this: address_t, __msg_sender: address_t, __msg_value: int, isPaused#628: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 157, 9} {:message "Assertion might not hold."} (__msg_sender == owner#139[__this]);
	isTransPaused#191 := isTransPaused#191[__this := isPaused#628];
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_3.sol", 160, 1} {:message "CareerOnToken::bug_unchk_send14"} bug_unchk_send14#656(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 161, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return26:
	// Function body ends here
}

type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: changeContractName : function (string memory,string memory)
procedure {:sourceloc "buggy_3.sol", 164, 5} {:message "CareerOnToken::changeContractName"} changeContractName#679(__this: address_t, __msg_sender: address_t, __msg_value: int, _newName#658: int_arr_ptr, _newSymbol#660: int_arr_ptr)
{
	// TCC assumptions
	assume (_newName#658 < __alloc_counter);
	assume (_newSymbol#660 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_3.sol", 165, 9} {:message "Assertion might not hold."} (__msg_sender == owner#139[__this]);
	name#94 := name#94[__this := mem_arr_int[_newName#658]];
	symbol#124 := symbol#124[__this := mem_arr_int[_newSymbol#660]];
	$return27:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_3.sol", 169, 1} {:message "CareerOnToken::bug_unchk_send30"} bug_unchk_send30#692(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 170, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return28:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_3.sol", 173, 9} {:message "CareerOnToken::[fallback]"} #699(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume false;
	$return29:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_3.sol", 176, 1} {:message "CareerOnToken::bug_unchk_send8"} bug_unchk_send8#712(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_3.sol", 177, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return30:
	// Function body ends here
}

