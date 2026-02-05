// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_13.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_13.sol", 8, 5} {:message "tokenRecipient::receiveApproval"} receiveApproval#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#3: address_t, _value#5: int, _token#7: address_t, _extraData#9: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_13.sol", 7, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#13(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: BitCash -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_13.sol", 38, 3} {:message "[event] BitCash::Transfer"} Transfer#131(__this: address_t, __msg_sender: address_t, __msg_value: int, from#125: address_t, to#127: address_t, value#129: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_13.sol", 43, 3} {:message "[event] BitCash::Approval"} Approval#152(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#146: address_t, _spender#148: address_t, _value#150: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_13.sol", 48, 3} {:message "[event] BitCash::Burn"} Burn#171(__this: address_t, __msg_sender: address_t, __msg_value: int, from#167: address_t, value#169: int)
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
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_13.sol", 13, 3} {:message "BitCash::bug_unchk_send17"} bug_unchk_send17#26(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 14, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_13.sol", 15, 3} {:message "name"} name#28: [address_t]int_arr_type;
// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_13.sol", 16, 3} {:message "BitCash::bug_unchk_send3"} bug_unchk_send3#41(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 17, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_13.sol", 18, 3} {:message "symbol"} symbol#43: [address_t]int_arr_type;
// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_13.sol", 19, 3} {:message "BitCash::bug_unchk_send9"} bug_unchk_send9#56(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 20, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_13.sol", 21, 3} {:message "decimals"} decimals#59: [address_t]int;
// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_13.sol", 23, 3} {:message "BitCash::bug_unchk_send25"} bug_unchk_send25#72(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 24, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_13.sol", 25, 3} {:message "totalSupply"} totalSupply#74: [address_t]int;
// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_13.sol", 28, 3} {:message "BitCash::bug_unchk_send19"} bug_unchk_send19#87(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 29, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_13.sol", 30, 3} {:message "balanceOf"} balanceOf#91: [address_t][address_t]int;
// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_13.sol", 31, 3} {:message "BitCash::bug_unchk_send26"} bug_unchk_send26#104(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 32, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_13.sol", 33, 3} {:message "allowance"} allowance#110: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_13.sol", 36, 3} {:message "BitCash::bug_unchk_send27"} bug_unchk_send27#123(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 37, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return6:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_13.sol", 41, 3} {:message "BitCash::bug_unchk_send31"} bug_unchk_send31#144(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 42, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return7:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_13.sol", 46, 3} {:message "BitCash::bug_unchk_send13"} bug_unchk_send13#165(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 47, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return8:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_13.sol", 55, 5} {:message "BitCash::[constructor]"} __constructor#611(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#174: int, tokenName#176: int_arr_ptr, tokenSymbol#178: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#176 < __alloc_counter);
	assume (tokenSymbol#178 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#28 := name#28[__this := int_arr#constr(default_int_int(), 0)];
	symbol#43 := symbol#43[__this := int_arr#constr(default_int_int(), 0)];
	decimals#59 := decimals#59[__this := 18];
	totalSupply#74 := totalSupply#74[__this := 0];
	balanceOf#91 := balanceOf#91[__this := default_address_t_int()];
	allowance#110 := allowance#110[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	totalSupply#74 := totalSupply#74[__this := (initialSupply#174 * 1000000000000000000)];
	balanceOf#91 := balanceOf#91[__this := balanceOf#91[__this][__msg_sender := totalSupply#74[__this]]];
	name#28 := name#28[__this := mem_arr_int[tokenName#176]];
	symbol#43 := symbol#43[__this := mem_arr_int[tokenSymbol#178]];
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_13.sol", 65, 1} {:message "BitCash::bug_unchk_send20"} bug_unchk_send20#216(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 66, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return10:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_13.sol", 71, 5} {:message "BitCash::_transfer"} _transfer#296(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#219: address_t, _to#221: address_t, _value#223: int)
{
	var {:sourceloc "buggy_13.sol", 79, 9} {:message "previousBalances"} previousBalances#256: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#221 != 0);
	assume (balanceOf#91[__this][_from#219] >= _value#223);
	assume ((balanceOf#91[__this][_to#221] + _value#223) >= balanceOf#91[__this][_to#221]);
	previousBalances#256 := (balanceOf#91[__this][_from#219] + balanceOf#91[__this][_to#221]);
	balanceOf#91 := balanceOf#91[__this := balanceOf#91[__this][_from#219 := (balanceOf#91[__this][_from#219] - _value#223)]];
	balanceOf#91 := balanceOf#91[__this := balanceOf#91[__this][_to#221 := (balanceOf#91[__this][_to#221] + _value#223)]];
	assume {:sourceloc "buggy_13.sol", 84, 14} {:message ""} true;
	call Transfer#131(__this, __msg_sender, __msg_value, _from#219, _to#221, _value#223);
	assert {:sourceloc "buggy_13.sol", 86, 9} {:message "Assertion might not hold."} ((balanceOf#91[__this][_from#219] + balanceOf#91[__this][_to#221]) == previousBalances#256);
	$return11:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_13.sol", 88, 1} {:message "BitCash::bug_unchk_send32"} bug_unchk_send32#309(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 89, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 99, 5} {:message "BitCash::transfer"} transfer#329(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#312: address_t, _value#314: int)
	returns (success#317: bool)
{
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 100, 9} {:message ""} true;
	call _transfer#296(__this, __msg_sender, __msg_value, call_arg#11, _to#312, _value#314);
	success#317 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_13.sol", 103, 1} {:message "BitCash::bug_unchk_send4"} bug_unchk_send4#342(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 104, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 115, 5} {:message "BitCash::transferFrom"} transferFrom#383(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#345: address_t, _to#347: address_t, _value#349: int)
	returns (success#352: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#349 <= allowance#110[__this][_from#345][__msg_sender]);
	allowance#110 := allowance#110[__this := allowance#110[__this][_from#345 := allowance#110[__this][_from#345][__msg_sender := (allowance#110[__this][_from#345][__msg_sender] - _value#349)]]];
	assume {:sourceloc "buggy_13.sol", 118, 9} {:message ""} true;
	call _transfer#296(__this, __msg_sender, __msg_value, _from#345, _to#347, _value#349);
	success#352 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_13.sol", 121, 1} {:message "BitCash::bug_unchk_send7"} bug_unchk_send7#396(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 122, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 132, 5} {:message "BitCash::approve"} approve#425(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#399: address_t, _value#401: int)
	returns (success#404: bool)
{
	var call_arg#14: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#110 := allowance#110[__this := allowance#110[__this][__msg_sender := allowance#110[__this][__msg_sender][_spender#399 := _value#401]]];
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 135, 14} {:message ""} true;
	call Approval#152(__this, __msg_sender, __msg_value, call_arg#14, _spender#399, _value#401);
	success#404 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_13.sol", 138, 1} {:message "BitCash::bug_unchk_send23"} bug_unchk_send23#438(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 139, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return18:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_13.sol", 150, 5} {:message "BitCash::approveAndCall"} approveAndCall#478(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#441: address_t, _value#443: int, _extraData#445: int_arr_ptr)
	returns (success#448: bool)
{
	var {:sourceloc "buggy_13.sol", 153, 9} {:message "spender"} spender#451: address_t;
	var approve#425_ret#16: bool;
	var call_arg#17: address_t;
	// TCC assumptions
	assume (_extraData#445 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#451 := _spender#441;
	assume {:sourceloc "buggy_13.sol", 154, 13} {:message ""} true;
	call approve#425_ret#16 := approve#425(__this, __msg_sender, __msg_value, _spender#441, _value#443);
	if (approve#425_ret#16) {
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 155, 13} {:message ""} true;
	call receiveApproval#12(spender#451, __this, 0, call_arg#17, _value#443, __this, _extraData#445);
	success#448 := true;
	goto $return19;
	}

	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_13.sol", 159, 1} {:message "BitCash::bug_unchk_send14"} bug_unchk_send14#491(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 160, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 169, 5} {:message "BitCash::burn"} burn#528(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#494: int)
	returns (success#497: bool)
{
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#91[__this][__msg_sender] >= _value#494);
	balanceOf#91 := balanceOf#91[__this := balanceOf#91[__this][__msg_sender := (balanceOf#91[__this][__msg_sender] - _value#494)]];
	totalSupply#74 := totalSupply#74[__this := (totalSupply#74[__this] - _value#494)];
	call_arg#19 := __msg_sender;
	assume {:sourceloc "buggy_13.sol", 173, 14} {:message ""} true;
	call Burn#171(__this, __msg_sender, __msg_value, call_arg#19, _value#494);
	success#497 := true;
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_13.sol", 176, 1} {:message "BitCash::bug_unchk_send30"} bug_unchk_send30#541(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 177, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return22:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_13.sol", 187, 5} {:message "BitCash::burnFrom"} burnFrom#597(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#544: address_t, _value#546: int)
	returns (success#549: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#91[__this][_from#544] >= _value#546);
	assume (_value#546 <= allowance#110[__this][_from#544][__msg_sender]);
	balanceOf#91 := balanceOf#91[__this := balanceOf#91[__this][_from#544 := (balanceOf#91[__this][_from#544] - _value#546)]];
	allowance#110 := allowance#110[__this := allowance#110[__this][_from#544 := allowance#110[__this][_from#544][__msg_sender := (allowance#110[__this][_from#544][__msg_sender] - _value#546)]]];
	totalSupply#74 := totalSupply#74[__this := (totalSupply#74[__this] - _value#546)];
	assume {:sourceloc "buggy_13.sol", 193, 14} {:message ""} true;
	call Burn#171(__this, __msg_sender, __msg_value, _from#544, _value#546);
	success#549 := true;
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_13.sol", 196, 1} {:message "BitCash::bug_unchk_send8"} bug_unchk_send8#610(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_13.sol", 197, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return24:
	// Function body ends here
}

