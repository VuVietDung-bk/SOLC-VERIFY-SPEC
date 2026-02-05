// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_17.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 9, 3} {:message "SafeMath::mul"} mul#34(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_17.sol", 13, 5} {:message "c"} c#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#3 == 0)) {
	#8 := 0;
	goto $return0;
	}

	c#18 := (a#3 * b#5);
	assume ((c#18 div a#3) == b#5);
	#8 := c#18;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 17, 3} {:message "SafeMath::div"} div#58(__this: address_t, __msg_sender: address_t, __msg_value: int, a#36: int, b#38: int)
	returns (#41: int)
{
	var {:sourceloc "buggy_17.sol", 19, 5} {:message "c"} c#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#38 > 0);
	c#50 := (a#36 div b#38);
	#41 := c#50;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 22, 3} {:message "SafeMath::sub"} sub#82(__this: address_t, __msg_sender: address_t, __msg_value: int, a#60: int, b#62: int)
	returns (#65: int)
{
	var {:sourceloc "buggy_17.sol", 24, 5} {:message "c"} c#74: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#62 <= a#60);
	c#74 := (a#60 - b#62);
	#65 := c#74;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 27, 3} {:message "SafeMath::add"} add#110(__this: address_t, __msg_sender: address_t, __msg_value: int, a#84: int, b#86: int)
	returns (#89: int)
{
	var {:sourceloc "buggy_17.sol", 28, 5} {:message "c"} c#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#92 := (a#84 + b#86);
	assume ((c#92 >= a#84) && (c#92 >= b#86));
	#89 := c#92;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 32, 3} {:message "SafeMath::mod"} mod#130(__this: address_t, __msg_sender: address_t, __msg_value: int, a#112: int, b#114: int)
	returns (#117: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#114 != 0);
	#117 := (a#112 mod b#114);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Function: max256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 36, 3} {:message "SafeMath::max256"} max256#147(__this: address_t, __msg_sender: address_t, __msg_value: int, a#132: int, b#134: int)
	returns (#137: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#137 := (if (a#132 >= b#134) then a#132 else b#134);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: min256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 39, 3} {:message "SafeMath::min256"} min256#164(__this: address_t, __msg_sender: address_t, __msg_value: int, a#149: int, b#151: int)
	returns (#154: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#154 := (if (a#149 < b#151) then a#149 else b#151);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 8, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#165(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_17.sol", 49, 1} {:message "owned::bug_unchk_send6"} bug_unchk_send6#178(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 50, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_17.sol", 51, 3} {:message "owner"} owner#180: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 53, 3} {:message "owned::[constructor]"} __constructor#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#180 := owner#180[__this := 0];
	// Function body starts here
	owner#180 := owner#180[__this := __msg_sender];
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_17.sol", 56, 1} {:message "owned::bug_unchk_send17"} bug_unchk_send17#202(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 57, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return9:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_17.sol", 64, 3} {:message "owned::transferOwnership"} transferOwnership#225(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#215: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#180[__this]);
	// Function body starts here
	owner#180 := owner#180[__this := newOwner#215];
	$return11:
	// Function body ends here
	$return10:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_17.sol", 67, 1} {:message "owned::bug_unchk_send3"} bug_unchk_send3#238(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 68, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return12:
	// Function body ends here
}

// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_17.sol", 72, 3} {:message "tokenRecipient::receiveApproval"} receiveApproval#250(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#241: address_t, _value#243: int, _token#245: address_t, _extraData#247: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 71, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#251(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_17.sol", 97, 3} {:message "[event] TokenERC20::Transfer"} Transfer#358(__this: address_t, __msg_sender: address_t, __msg_value: int, from#352: address_t, to#354: address_t, value#356: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_17.sol", 99, 3} {:message "[event] TokenERC20::Approval"} Approval#366(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#360: address_t, _spender#362: address_t, _value#364: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_17.sol", 101, 3} {:message "[event] TokenERC20::Burn"} Burn#372(__this: address_t, __msg_sender: address_t, __msg_value: int, from#368: address_t, value#370: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_17.sol", 78, 1} {:message "TokenERC20::bug_unchk_send28"} bug_unchk_send28#267(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 79, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return13:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_17.sol", 80, 3} {:message "name"} name#269: [address_t]int_arr_type;
// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_17.sol", 81, 1} {:message "TokenERC20::bug_unchk_send21"} bug_unchk_send21#282(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 82, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return14:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_17.sol", 83, 3} {:message "symbol"} symbol#284: [address_t]int_arr_type;
// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_17.sol", 84, 1} {:message "TokenERC20::bug_unchk_send27"} bug_unchk_send27#297(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 85, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return15:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_17.sol", 86, 3} {:message "decimals"} decimals#299: [address_t]int;
// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_17.sol", 87, 1} {:message "TokenERC20::bug_unchk_send31"} bug_unchk_send31#312(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 88, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return16:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_17.sol", 89, 3} {:message "totalSupply"} totalSupply#314: [address_t]int;
// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_17.sol", 90, 1} {:message "TokenERC20::bug_unchk_send13"} bug_unchk_send13#327(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 91, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return17:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 92, 3} {:message "balanceOf"} balanceOf#331: [address_t][address_t]int;
// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_17.sol", 93, 1} {:message "TokenERC20::bug_unchk_send9"} bug_unchk_send9#344(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 94, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return18:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_17.sol", 95, 3} {:message "allowance"} allowance#350: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 104, 3} {:message "TokenERC20::[constructor]"} __constructor#630(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenName#374: int_arr_ptr, tokenSymbol#376: int_arr_ptr, dec#378: int)
{
	// TCC assumptions
	assume (tokenName#374 < __alloc_counter);
	assume (tokenSymbol#376 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#269 := name#269[__this := int_arr#constr(default_int_int(), 0)];
	symbol#284 := symbol#284[__this := int_arr#constr(default_int_int(), 0)];
	decimals#299 := decimals#299[__this := 0];
	totalSupply#314 := totalSupply#314[__this := 0];
	balanceOf#331 := balanceOf#331[__this := default_address_t_int()];
	allowance#350 := allowance#350[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	decimals#299 := decimals#299[__this := dec#378];
	name#269 := name#269[__this := mem_arr_int[tokenName#374]];
	symbol#284 := symbol#284[__this := mem_arr_int[tokenSymbol#376]];
	$return19:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 110, 3} {:message "TokenERC20::_transfer"} _transfer#441(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#396: address_t, _to#398: address_t, _value#400: int)
{
	var sub#82_ret#11: int;
	var add#110_ret#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#398 != 0);
	assume {:sourceloc "buggy_17.sol", 112, 24} {:message ""} true;
	call sub#82_ret#11 := sub#82(__this, __msg_sender, __msg_value, balanceOf#331[__this][_from#396], _value#400);
	balanceOf#331 := balanceOf#331[__this := balanceOf#331[__this][_from#396 := sub#82_ret#11]];
	assume {:sourceloc "buggy_17.sol", 113, 22} {:message ""} true;
	call add#110_ret#12 := add#110(__this, __msg_sender, __msg_value, balanceOf#331[__this][_to#398], _value#400);
	balanceOf#331 := balanceOf#331[__this := balanceOf#331[__this][_to#398 := add#110_ret#12]];
	assume {:sourceloc "buggy_17.sol", 114, 10} {:message ""} true;
	call Transfer#358(__this, __msg_sender, __msg_value, _from#396, _to#398, _value#400);
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_17.sol", 116, 1} {:message "TokenERC20::bug_unchk_send25"} bug_unchk_send25#454(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 117, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return21:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 119, 3} {:message "TokenERC20::transfer"} transfer#473(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#456: address_t, _value#458: int)
	returns (success#461: bool)
{
	var call_arg#14: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 120, 5} {:message ""} true;
	call _transfer#441(__this, __msg_sender, __msg_value, call_arg#14, _to#456, _value#458);
	success#461 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_17.sol", 123, 1} {:message "TokenERC20::bug_unchk_send19"} bug_unchk_send19#486(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 124, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return23:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 127, 3} {:message "TokenERC20::transferFrom"} transferFrom#523(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#488: address_t, _to#490: address_t, _value#492: int)
	returns (success#495: bool)
{
	var sub#82_ret#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 128, 36} {:message ""} true;
	call sub#82_ret#16 := sub#82(__this, __msg_sender, __msg_value, allowance#350[__this][_from#488][__msg_sender], _value#492);
	allowance#350 := allowance#350[__this := allowance#350[__this][_from#488 := allowance#350[__this][_from#488][__msg_sender := sub#82_ret#16]]];
	assume {:sourceloc "buggy_17.sol", 129, 3} {:message ""} true;
	call _transfer#441(__this, __msg_sender, __msg_value, _from#488, _to#490, _value#492);
	success#495 := true;
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_17.sol", 132, 1} {:message "TokenERC20::bug_unchk_send26"} bug_unchk_send26#536(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 133, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return25:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 136, 3} {:message "TokenERC20::approve"} approve#564(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#538: address_t, _value#540: int)
	returns (success#543: bool)
{
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#350 := allowance#350[__this := allowance#350[__this][__msg_sender := allowance#350[__this][__msg_sender][_spender#538 := _value#540]]];
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 138, 10} {:message ""} true;
	call Approval#366(__this, __msg_sender, __msg_value, call_arg#18, _spender#538, _value#540);
	success#543 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_17.sol", 141, 1} {:message "TokenERC20::bug_unchk_send20"} bug_unchk_send20#577(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 142, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return27:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_17.sol", 145, 3} {:message "TokenERC20::approveAndCall"} approveAndCall#616(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#579: address_t, _value#581: int, _extraData#583: int_arr_ptr)
	returns (success#586: bool)
{
	var {:sourceloc "buggy_17.sol", 146, 5} {:message "spender"} spender#589: address_t;
	var approve#564_ret#20: bool;
	var call_arg#21: address_t;
	// TCC assumptions
	assume (_extraData#583 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#589 := _spender#579;
	assume {:sourceloc "buggy_17.sol", 147, 9} {:message ""} true;
	call approve#564_ret#20 := approve#564(__this, __msg_sender, __msg_value, _spender#579, _value#581);
	if (approve#564_ret#20) {
	call_arg#21 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 148, 7} {:message ""} true;
	call receiveApproval#250(spender#589, __this, 0, call_arg#21, _value#581, __this, _extraData#583);
	success#586 := true;
	goto $return28;
	}

	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_17.sol", 152, 1} {:message "TokenERC20::bug_unchk_send32"} bug_unchk_send32#629(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 153, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return29:
	// Function body ends here
}

// 
// ------- Contract: AZT -------
// Inherits from: owned
// Inherits from: TokenERC20
// Using library SafeMath for uint256
// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_17.sol", 164, 1} {:message "AZT::bug_unchk_send10"} bug_unchk_send10#650(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 165, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_17.sol", 167, 2} {:message "AZT::bug_unchk_send22"} bug_unchk_send22#663(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 168, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return31:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_17.sol", 170, 1} {:message "AZT::bug_unchk_send12"} bug_unchk_send12#676(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 171, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return32:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_17.sol", 172, 3} {:message "_decimals"} _decimals#679: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_17.sol", 174, 1} {:message "AZT::bug_unchk_send11"} bug_unchk_send11#692(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 175, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return33:
	// Function body ends here
}

// 
// State variable: frozenAddresses: address[] storage ref
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var {:sourceloc "buggy_17.sol", 176, 3} {:message "frozenAddresses"} frozenAddresses#695: [address_t]address_t_arr_type;
// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_17.sol", 177, 1} {:message "AZT::bug_unchk_send1"} bug_unchk_send1#708(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 178, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return34:
	// Function body ends here
}

// 
// State variable: tokenFrozen: bool
var {:sourceloc "buggy_17.sol", 179, 3} {:message "tokenFrozen"} tokenFrozen#710: [address_t]bool;
// 
// ------- Struct frozenWallet -------
// Storage
type {:datatype} struct_storage_frozenWallet#719;
function {:constructor} frozenWallet#719#constr(isFrozen#712: bool, rewardedAmount#714: int, frozenAmount#716: int, frozenTime#718: int) returns (struct_storage_frozenWallet#719);
// Memory
type address_struct_memory_frozenWallet#719 = int;
// Member isFrozen
var {:sourceloc "buggy_17.sol", 182, 5} {:message "isFrozen"} isFrozen#712: [address_struct_memory_frozenWallet#719]bool;
// Member rewardedAmount
var {:sourceloc "buggy_17.sol", 183, 5} {:message "rewardedAmount"} rewardedAmount#714: [address_struct_memory_frozenWallet#719]int;
// Member frozenAmount
var {:sourceloc "buggy_17.sol", 184, 5} {:message "frozenAmount"} frozenAmount#716: [address_struct_memory_frozenWallet#719]int;
// Member frozenTime
var {:sourceloc "buggy_17.sol", 185, 5} {:message "frozenTime"} frozenTime#718: [address_struct_memory_frozenWallet#719]int;
// 
// ------- End of struct frozenWallet -------
// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_17.sol", 188, 1} {:message "AZT::bug_unchk_send2"} bug_unchk_send2#732(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 189, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return35:
	// Function body ends here
}

// 
// State variable: frozenWallets: mapping(address => struct AZT.frozenWallet storage ref)
var {:sourceloc "buggy_17.sol", 190, 3} {:message "frozenWallets"} frozenWallets#736: [address_t][address_t]struct_storage_frozenWallet#719;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
function {:builtin "((as const (Array Int |T@struct_storage_frozenWallet#719|)) (|frozenWallet#719#constr| false 0 0 0))"} default_address_t_struct_storage_frozenWallet#719() returns ([address_t]struct_storage_frozenWallet#719);
const unique address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 194, 3} {:message "AZT::[constructor]"} __constructor#1095(__this: address_t, __msg_sender: address_t, __msg_value: int, _tokenName#738: int_arr_ptr, _tokenSymbol#740: int_arr_ptr)
{
	var tokenName#374#29: int_arr_ptr;
	var tokenSymbol#376#29: int_arr_ptr;
	var dec#378#29: int;
	var call_arg#32: int;
	var call_arg#33: int;
	var new_struct_frozenWallet#34: address_struct_memory_frozenWallet#719;
	var {:sourceloc "buggy_17.sol", 205, 10} {:message "i"} i#776#31: int;
	var tmp#37: int;
	// TCC assumptions
	assume (_tokenName#738 < __alloc_counter);
	assume (_tokenSymbol#740 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_decimals#679 := _decimals#679[__this := 18];
	frozenAddresses#695 := frozenAddresses#695[__this := address_t_arr#constr(default_int_address_t(), 0)];
	tokenFrozen#710 := tokenFrozen#710[__this := false];
	frozenWallets#736 := frozenWallets#736[__this := default_address_t_struct_storage_frozenWallet#719()];
	name#269 := name#269[__this := int_arr#constr(default_int_int(), 0)];
	symbol#284 := symbol#284[__this := int_arr#constr(default_int_int(), 0)];
	decimals#299 := decimals#299[__this := 0];
	totalSupply#314 := totalSupply#314[__this := 0];
	balanceOf#331 := balanceOf#331[__this := default_address_t_int()];
	allowance#350 := allowance#350[__this := default_address_t__k_address_t_v_int()];
	owner#180 := owner#180[__this := 0];
	// Arguments for TokenERC20
	tokenName#374#29 := _tokenName#738;
	tokenSymbol#376#29 := _tokenSymbol#740;
	dec#378#29 := _decimals#679[__this];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#180 := owner#180[__this := __msg_sender];
	$return36:
	// Function body ends here
	// Inlined constructor for owned ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	decimals#299 := decimals#299[__this := dec#378#29];
	name#269 := name#269[__this := mem_arr_int[tokenName#374#29]];
	symbol#284 := symbol#284[__this := mem_arr_int[tokenSymbol#376#29]];
	$return37:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	frozenAddresses#695 := frozenAddresses#695[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#695[__this])[length#address_t_arr#constr(frozenAddresses#695[__this]) := 0], length#address_t_arr#constr(frozenAddresses#695[__this]))];
	frozenAddresses#695 := frozenAddresses#695[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#695[__this])[length#address_t_arr#constr(frozenAddresses#695[__this]) := address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05], length#address_t_arr#constr(frozenAddresses#695[__this]))];
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#695[__this])) && (length#address_t_arr#constr(frozenAddresses#695[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#address_t_arr#constr(frozenAddresses#695[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	frozenAddresses#695 := frozenAddresses#695[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#695[__this]), (length#address_t_arr#constr(frozenAddresses#695[__this]) + 1))];
	call_arg#32 := 30000000;
	call_arg#33 := 0;
	new_struct_frozenWallet#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	isFrozen#712 := isFrozen#712[new_struct_frozenWallet#34 := true];
	rewardedAmount#714 := rewardedAmount#714[new_struct_frozenWallet#34 := call_arg#32];
	frozenAmount#716 := frozenAmount#716[new_struct_frozenWallet#34 := call_arg#33];
	frozenTime#718 := frozenTime#718[new_struct_frozenWallet#34 := (__block_timestamp + 3600)];
	// Deep copy struct frozenWallet
	frozenWallets#736 := frozenWallets#736[__this := frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0] := frozenWallet#719#constr(isFrozen#712[new_struct_frozenWallet#34], rewardedAmount#714#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), frozenAmount#716#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), frozenTime#718#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]))]];
	frozenWallets#736 := frozenWallets#736[__this := frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0] := frozenWallet#719#constr(isFrozen#712#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), rewardedAmount#714[new_struct_frozenWallet#34], frozenAmount#716#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), frozenTime#718#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]))]];
	frozenWallets#736 := frozenWallets#736[__this := frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0] := frozenWallet#719#constr(isFrozen#712#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), rewardedAmount#714#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), frozenAmount#716[new_struct_frozenWallet#34], frozenTime#718#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]))]];
	frozenWallets#736 := frozenWallets#736[__this := frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0] := frozenWallet#719#constr(isFrozen#712#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), rewardedAmount#714#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), frozenAmount#716#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[0]]), frozenTime#718[new_struct_frozenWallet#34])]];
	// The following while loop was mapped from a for loop
	// Initialization
	i#776#31 := 0;
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#695[__this])) && (length#address_t_arr#constr(frozenAddresses#695[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#776#31 < length#address_t_arr#constr(frozenAddresses#695[__this]))) {
	// Body
	balanceOf#331 := balanceOf#331[__this := balanceOf#331[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[i#776#31] := rewardedAmount#714#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[i#776#31]])]];
	totalSupply#314 := totalSupply#314[__this := (totalSupply#314[__this] + rewardedAmount#714#frozenWallet#719#constr(frozenWallets#736[__this][arr#address_t_arr#constr(frozenAddresses#695[__this])[i#776#31]]))];
	$continue35:
	// Loop expression
	tmp#37 := i#776#31;
	i#776#31 := (i#776#31 + 1);
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#695[__this])) && (length#address_t_arr#constr(frozenAddresses#695[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break36:
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_17.sol", 210, 1} {:message "AZT::bug_unchk_send4"} bug_unchk_send4#826(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 211, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#38);
	$return39:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 213, 3} {:message "AZT::_transfer"} _transfer#881(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#828: address_t, _to#830: address_t, _value#832: int)
{
	var checkFrozenWallet#940_ret#39: bool;
	var sub#82_ret#40: int;
	var add#110_ret#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#830 != 0);
	assume {:sourceloc "buggy_17.sol", 215, 13} {:message ""} true;
	call checkFrozenWallet#940_ret#39 := checkFrozenWallet#940(__this, __msg_sender, __msg_value, _from#828, _value#832);
	assume checkFrozenWallet#940_ret#39;
	assume {:sourceloc "buggy_17.sol", 216, 24} {:message ""} true;
	call sub#82_ret#40 := sub#82(__this, __msg_sender, __msg_value, balanceOf#331[__this][_from#828], _value#832);
	balanceOf#331 := balanceOf#331[__this := balanceOf#331[__this][_from#828 := sub#82_ret#40]];
	assume {:sourceloc "buggy_17.sol", 217, 22} {:message ""} true;
	call add#110_ret#41 := add#110(__this, __msg_sender, __msg_value, balanceOf#331[__this][_to#830], _value#832);
	balanceOf#331 := balanceOf#331[__this := balanceOf#331[__this][_to#830 := add#110_ret#41]];
	assume {:sourceloc "buggy_17.sol", 218, 10} {:message ""} true;
	call Transfer#358(__this, __msg_sender, __msg_value, _from#828, _to#830, _value#832);
	$return40:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_17.sol", 220, 1} {:message "AZT::bug_unchk_send7"} bug_unchk_send7#894(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 221, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#42);
	$return41:
	// Function body ends here
}

// 
// Function: checkFrozenWallet : function (address,uint256) view returns (bool)
procedure {:sourceloc "buggy_17.sol", 223, 3} {:message "AZT::checkFrozenWallet"} checkFrozenWallet#940(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#896: address_t, _value#898: int)
	returns (#901: bool)
{
	var sub#82_ret#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 229, 8} {:message ""} true;
	call sub#82_ret#43 := sub#82(__this, __msg_sender, __msg_value, balanceOf#331[__this][_from#896], _value#898);
	#901 := ((_from#896 == owner#180[__this]) || (!(tokenFrozen#710[__this]) && ((!(isFrozen#712#frozenWallet#719#constr(frozenWallets#736[__this][_from#896])) || (__block_timestamp >= frozenTime#718#frozenWallet#719#constr(frozenWallets#736[__this][_from#896]))) || (sub#82_ret#43 >= frozenAmount#716#frozenWallet#719#constr(frozenWallets#736[__this][_from#896])))));
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_17.sol", 232, 1} {:message "AZT::bug_unchk_send23"} bug_unchk_send23#953(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 233, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#44);
	$return43:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 236, 3} {:message "AZT::burn"} burn#991(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#955: int)
	returns (success#960: bool)
{
	var sub#82_ret#47: int;
	var sub#82_ret#48: int;
	var call_arg#49: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#180[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 237, 29} {:message ""} true;
	call sub#82_ret#47 := sub#82(__this, __msg_sender, __msg_value, balanceOf#331[__this][__msg_sender], _value#955);
	balanceOf#331 := balanceOf#331[__this := balanceOf#331[__this][__msg_sender := sub#82_ret#47]];
	assume {:sourceloc "buggy_17.sol", 238, 19} {:message ""} true;
	call sub#82_ret#48 := sub#82(__this, __msg_sender, __msg_value, totalSupply#314[__this], _value#955);
	totalSupply#314 := totalSupply#314[__this := sub#82_ret#48];
	call_arg#49 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 239, 10} {:message ""} true;
	call Burn#372(__this, __msg_sender, __msg_value, call_arg#49, _value#955);
	success#960 := true;
	goto $return45;
	$return45:
	// Function body ends here
	$return44:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_17.sol", 242, 1} {:message "AZT::bug_unchk_send14"} bug_unchk_send14#1004(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#50 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 243, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#50);
	$return46:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 245, 3} {:message "AZT::burnFrom"} burnFrom#1056(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1006: address_t, _value#1008: int)
	returns (success#1011: bool)
{
	var sub#82_ret#51: int;
	var sub#82_ret#52: int;
	var sub#82_ret#53: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 246, 24} {:message ""} true;
	call sub#82_ret#51 := sub#82(__this, __msg_sender, __msg_value, balanceOf#331[__this][_from#1006], _value#1008);
	balanceOf#331 := balanceOf#331[__this := balanceOf#331[__this][_from#1006 := sub#82_ret#51]];
	assume {:sourceloc "buggy_17.sol", 247, 36} {:message ""} true;
	call sub#82_ret#52 := sub#82(__this, __msg_sender, __msg_value, allowance#350[__this][_from#1006][__msg_sender], _value#1008);
	allowance#350 := allowance#350[__this := allowance#350[__this][_from#1006 := allowance#350[__this][_from#1006][__msg_sender := sub#82_ret#52]]];
	assume {:sourceloc "buggy_17.sol", 248, 19} {:message ""} true;
	call sub#82_ret#53 := sub#82(__this, __msg_sender, __msg_value, totalSupply#314[__this], _value#1008);
	totalSupply#314 := totalSupply#314[__this := sub#82_ret#53];
	assume {:sourceloc "buggy_17.sol", 249, 10} {:message ""} true;
	call Burn#372(__this, __msg_sender, __msg_value, _from#1006, _value#1008);
	success#1011 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_17.sol", 252, 1} {:message "AZT::bug_unchk_send30"} bug_unchk_send30#1069(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#54 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 253, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#54);
	$return48:
	// Function body ends here
}

// 
// Function: freezeToken : function (bool)
procedure {:sourceloc "buggy_17.sol", 255, 3} {:message "AZT::freezeToken"} freezeToken#1081(__this: address_t, __msg_sender: address_t, __msg_value: int, freeze#1071: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#180[__this]);
	// Function body starts here
	tokenFrozen#710 := tokenFrozen#710[__this := freeze#1071];
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_17.sol", 258, 1} {:message "AZT::bug_unchk_send8"} bug_unchk_send8#1094(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#57: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#57 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 259, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#57);
	$return51:
	// Function body ends here
}

