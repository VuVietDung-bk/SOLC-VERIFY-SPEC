// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_8.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_8.sol", 14, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#35(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#31: address_t, newOwner#33: address_t)
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
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_8.sol", 8, 3} {:message "Ownable::bug_unchk_send29"} bug_unchk_send29#14(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 9, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_8.sol", 10, 3} {:message "owner"} owner#16: [address_t]address_t;
// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_8.sol", 12, 3} {:message "Ownable::bug_unchk_send30"} bug_unchk_send30#29(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 13, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 21, 3} {:message "Ownable::[constructor]"} __constructor#111(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#16 := owner#16[__this := 0];
	// Function body starts here
	owner#16 := owner#16[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_8.sol", 24, 1} {:message "Ownable::bug_unchk_send12"} bug_unchk_send12#58(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 25, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return3:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_8.sol", 39, 3} {:message "Ownable::transferOwnership"} transferOwnership#97(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#73: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#16[__this]);
	// Function body starts here
	assume (newOwner#73 != 0);
	assume {:sourceloc "buggy_8.sol", 41, 10} {:message ""} true;
	call OwnershipTransferred#35(__this, __msg_sender, __msg_value, owner#16[__this], newOwner#73);
	owner#16 := owner#16[__this := newOwner#73];
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_8.sol", 44, 3} {:message "Ownable::bug_unchk_send11"} bug_unchk_send11#110(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 45, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return6:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_8.sol", 76, 3} {:message "[event] TokenERC20::Transfer"} Transfer#229(__this: address_t, __msg_sender: address_t, __msg_value: int, from#223: address_t, to#225: address_t, value#227: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_8.sol", 81, 3} {:message "[event] TokenERC20::Approval"} Approval#250(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#244: address_t, _spender#246: address_t, _value#248: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_8.sol", 86, 3} {:message "[event] TokenERC20::Burn"} Burn#269(__this: address_t, __msg_sender: address_t, __msg_value: int, from#265: address_t, value#267: int)
{
	
}

// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_8.sol", 51, 5} {:message "TokenERC20::bug_unchk_send6"} bug_unchk_send6#124(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 52, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_8.sol", 53, 3} {:message "name"} name#126: [address_t]int_arr_type;
// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_8.sol", 54, 5} {:message "TokenERC20::bug_unchk_send16"} bug_unchk_send16#139(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 55, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_8.sol", 56, 3} {:message "symbol"} symbol#141: [address_t]int_arr_type;
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_8.sol", 57, 5} {:message "TokenERC20::bug_unchk_send24"} bug_unchk_send24#154(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 58, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_8.sol", 59, 3} {:message "decimals"} decimals#157: [address_t]int;
// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_8.sol", 61, 5} {:message "TokenERC20::bug_unchk_send5"} bug_unchk_send5#170(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 62, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return10:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_8.sol", 63, 3} {:message "totalSupply"} totalSupply#172: [address_t]int;
// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_8.sol", 66, 5} {:message "TokenERC20::bug_unchk_send15"} bug_unchk_send15#185(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 67, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return11:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 68, 3} {:message "balanceOf"} balanceOf#189: [address_t][address_t]int;
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_8.sol", 69, 5} {:message "TokenERC20::bug_unchk_send28"} bug_unchk_send28#202(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 70, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return12:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_8.sol", 71, 3} {:message "allowance"} allowance#208: [address_t][address_t][address_t]int;
// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_8.sol", 74, 5} {:message "TokenERC20::bug_unchk_send8"} bug_unchk_send8#221(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 75, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return13:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_8.sol", 79, 5} {:message "TokenERC20::bug_unchk_send27"} bug_unchk_send27#242(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 80, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_8.sol", 84, 5} {:message "TokenERC20::bug_unchk_send31"} bug_unchk_send31#263(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 85, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return15:
	// Function body ends here
}

type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 93, 5} {:message "TokenERC20::[constructor]"} __constructor#656(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#272: int, tokenName#274: int_arr_ptr, tokenSymbol#276: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#274 < __alloc_counter);
	assume (tokenSymbol#276 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#126 := name#126[__this := int_arr#constr(default_int_int(), 0)];
	symbol#141 := symbol#141[__this := int_arr#constr(default_int_int(), 0)];
	decimals#157 := decimals#157[__this := 18];
	totalSupply#172 := totalSupply#172[__this := 0];
	balanceOf#189 := balanceOf#189[__this := default_address_t_int()];
	allowance#208 := allowance#208[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	totalSupply#172 := totalSupply#172[__this := (initialSupply#272 * 1000000000000000000)];
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][__msg_sender := totalSupply#172[__this]]];
	name#126 := name#126[__this := mem_arr_int[tokenName#274]];
	symbol#141 := symbol#141[__this := mem_arr_int[tokenSymbol#276]];
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_8.sol", 103, 1} {:message "TokenERC20::bug_unchk_send1"} bug_unchk_send1#314(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 104, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return17:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_8.sol", 109, 5} {:message "TokenERC20::_transfer"} _transfer#394(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#317: address_t, _to#319: address_t, _value#321: int)
{
	var {:sourceloc "buggy_8.sol", 117, 9} {:message "previousBalances"} previousBalances#354: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#319 != 0);
	assume (balanceOf#189[__this][_from#317] >= _value#321);
	assume ((balanceOf#189[__this][_to#319] + _value#321) > balanceOf#189[__this][_to#319]);
	previousBalances#354 := (balanceOf#189[__this][_from#317] + balanceOf#189[__this][_to#319]);
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][_from#317 := (balanceOf#189[__this][_from#317] - _value#321)]];
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][_to#319 := (balanceOf#189[__this][_to#319] + _value#321)]];
	assume {:sourceloc "buggy_8.sol", 122, 14} {:message ""} true;
	call Transfer#229(__this, __msg_sender, __msg_value, _from#317, _to#319, _value#321);
	assert {:sourceloc "buggy_8.sol", 124, 9} {:message "Assertion might not hold."} ((balanceOf#189[__this][_from#317] + balanceOf#189[__this][_to#319]) == previousBalances#354);
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_8.sol", 126, 1} {:message "TokenERC20::bug_unchk_send2"} bug_unchk_send2#407(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 127, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return19:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 137, 5} {:message "TokenERC20::transfer"} transfer#427(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#410: address_t, _value#412: int)
	returns (success#415: bool)
{
	var call_arg#17: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 138, 9} {:message ""} true;
	call _transfer#394(__this, __msg_sender, __msg_value, call_arg#17, _to#410, _value#412);
	success#415 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_8.sol", 141, 1} {:message "TokenERC20::bug_unchk_send17"} bug_unchk_send17#440(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 142, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return21:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 153, 5} {:message "TokenERC20::transferFrom"} transferFrom#481(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#443: address_t, _to#445: address_t, _value#447: int)
	returns (success#450: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#447 <= allowance#208[__this][_from#443][__msg_sender]);
	allowance#208 := allowance#208[__this := allowance#208[__this][_from#443 := allowance#208[__this][_from#443][__msg_sender := (allowance#208[__this][_from#443][__msg_sender] - _value#447)]]];
	assume {:sourceloc "buggy_8.sol", 156, 9} {:message ""} true;
	call _transfer#394(__this, __msg_sender, __msg_value, _from#443, _to#445, _value#447);
	success#450 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_8.sol", 159, 1} {:message "TokenERC20::bug_unchk_send3"} bug_unchk_send3#494(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 160, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return23:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 170, 5} {:message "TokenERC20::approve"} approve#523(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#497: address_t, _value#499: int)
	returns (success#502: bool)
{
	var call_arg#20: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#208 := allowance#208[__this := allowance#208[__this][__msg_sender := allowance#208[__this][__msg_sender][_spender#497 := _value#499]]];
	call_arg#20 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 173, 14} {:message ""} true;
	call Approval#250(__this, __msg_sender, __msg_value, call_arg#20, _spender#497, _value#499);
	success#502 := true;
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_8.sol", 176, 1} {:message "TokenERC20::bug_unchk_send9"} bug_unchk_send9#536(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 177, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return25:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 190, 5} {:message "TokenERC20::burn"} burn#573(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#539: int)
	returns (success#542: bool)
{
	var call_arg#22: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#189[__this][__msg_sender] >= _value#539);
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][__msg_sender := (balanceOf#189[__this][__msg_sender] - _value#539)]];
	totalSupply#172 := totalSupply#172[__this := (totalSupply#172[__this] - _value#539)];
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 194, 14} {:message ""} true;
	call Burn#269(__this, __msg_sender, __msg_value, call_arg#22, _value#539);
	success#542 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_8.sol", 197, 1} {:message "TokenERC20::bug_unchk_send25"} bug_unchk_send25#586(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 198, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return27:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 208, 5} {:message "TokenERC20::burnFrom"} burnFrom#642(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#589: address_t, _value#591: int)
	returns (success#594: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#189[__this][_from#589] >= _value#591);
	assume (_value#591 <= allowance#208[__this][_from#589][__msg_sender]);
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][_from#589 := (balanceOf#189[__this][_from#589] - _value#591)]];
	allowance#208 := allowance#208[__this := allowance#208[__this][_from#589 := allowance#208[__this][_from#589][__msg_sender := (allowance#208[__this][_from#589][__msg_sender] - _value#591)]]];
	totalSupply#172 := totalSupply#172[__this := (totalSupply#172[__this] - _value#591)];
	assume {:sourceloc "buggy_8.sol", 214, 14} {:message ""} true;
	call Burn#269(__this, __msg_sender, __msg_value, _from#589, _value#591);
	success#594 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_8.sol", 217, 1} {:message "TokenERC20::bug_unchk_send19"} bug_unchk_send19#655(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 218, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return29:
	// Function body ends here
}

// 
// ------- Contract: YFT -------
// Inherits from: Ownable
// Inherits from: TokenERC20
// 
// Event: FrozenFunds
procedure {:inline 1} {:sourceloc "buggy_8.sol", 241, 3} {:message "[event] YFT::FrozenFunds"} FrozenFunds#726(__this: address_t, __msg_sender: address_t, __msg_value: int, target#722: address_t, frozen#724: bool)
{
	
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_8.sol", 227, 3} {:message "YFT::bug_unchk_send21"} bug_unchk_send21#673(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 228, 6} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return30:
	// Function body ends here
}

// 
// State variable: sellPrice: uint256
var {:sourceloc "buggy_8.sol", 229, 3} {:message "sellPrice"} sellPrice#675: [address_t]int;
// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_8.sol", 230, 3} {:message "YFT::bug_unchk_send10"} bug_unchk_send10#688(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 231, 6} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return31:
	// Function body ends here
}

// 
// State variable: buyPrice: uint256
var {:sourceloc "buggy_8.sol", 232, 3} {:message "buyPrice"} buyPrice#690: [address_t]int;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_8.sol", 234, 3} {:message "YFT::bug_unchk_send22"} bug_unchk_send22#703(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#27 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 235, 6} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#27);
	$return32:
	// Function body ends here
}

// 
// State variable: frozenAccount: mapping(address => bool)
var {:sourceloc "buggy_8.sol", 236, 3} {:message "frozenAccount"} frozenAccount#707: [address_t][address_t]bool;
// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_8.sol", 239, 5} {:message "YFT::bug_unchk_send13"} bug_unchk_send13#720(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 240, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return33:
	// Function body ends here
}

function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 244, 5} {:message "YFT::[constructor]"} __constructor#1054(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#728: int, tokenName#730: int_arr_ptr, tokenSymbol#732: int_arr_ptr)
{
	var initialSupply#272#29: int;
	var tokenName#274#29: int_arr_ptr;
	var tokenSymbol#276#29: int_arr_ptr;
	// TCC assumptions
	assume (tokenName#730 < __alloc_counter);
	assume (tokenSymbol#732 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	sellPrice#675 := sellPrice#675[__this := 0];
	buyPrice#690 := buyPrice#690[__this := 0];
	frozenAccount#707 := frozenAccount#707[__this := default_address_t_bool()];
	name#126 := name#126[__this := int_arr#constr(default_int_int(), 0)];
	symbol#141 := symbol#141[__this := int_arr#constr(default_int_int(), 0)];
	decimals#157 := decimals#157[__this := 18];
	totalSupply#172 := totalSupply#172[__this := 0];
	balanceOf#189 := balanceOf#189[__this := default_address_t_int()];
	allowance#208 := allowance#208[__this := default_address_t__k_address_t_v_int()];
	owner#16 := owner#16[__this := 0];
	// Arguments for TokenERC20
	initialSupply#272#29 := initialSupply#728;
	tokenName#274#29 := tokenName#730;
	tokenSymbol#276#29 := tokenSymbol#732;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#16 := owner#16[__this := __msg_sender];
	$return34:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	totalSupply#172 := totalSupply#172[__this := (initialSupply#272#29 * 1000000000000000000)];
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][__msg_sender := totalSupply#172[__this]]];
	name#126 := name#126[__this := mem_arr_int[tokenName#274#29]];
	symbol#141 := symbol#141[__this := mem_arr_int[tokenSymbol#276#29]];
	$return35:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_8.sol", 249, 1} {:message "YFT::bug_unchk_send26"} bug_unchk_send26#754(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#32 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 250, 4} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#32);
	$return37:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_8.sol", 253, 5} {:message "YFT::_transfer"} _transfer#826(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#756: address_t, _to#758: address_t, _value#760: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#758 != 0);
	assume (balanceOf#189[__this][_from#756] >= _value#760);
	assume ((balanceOf#189[__this][_to#758] + _value#760) >= balanceOf#189[__this][_to#758]);
	assume !(frozenAccount#707[__this][_from#756]);
	assume !(frozenAccount#707[__this][_to#758]);
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][_from#756 := (balanceOf#189[__this][_from#756] - _value#760)]];
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][_to#758 := (balanceOf#189[__this][_to#758] + _value#760)]];
	assume {:sourceloc "buggy_8.sol", 261, 14} {:message ""} true;
	call Transfer#229(__this, __msg_sender, __msg_value, _from#756, _to#758, _value#760);
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_8.sol", 263, 1} {:message "YFT::bug_unchk_send20"} bug_unchk_send20#839(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#33 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 264, 4} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#33);
	$return39:
	// Function body ends here
}

// 
// Function: mintToken : function (address,uint256)
procedure {:sourceloc "buggy_8.sol", 269, 5} {:message "YFT::mintToken"} mintToken#881(__this: address_t, __msg_sender: address_t, __msg_value: int, target#842: address_t, mintedAmount#844: int)
{
	var call_arg#36: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#16[__this]);
	// Function body starts here
	balanceOf#189 := balanceOf#189[__this := balanceOf#189[__this][target#842 := (balanceOf#189[__this][target#842] + mintedAmount#844)]];
	totalSupply#172 := totalSupply#172[__this := (totalSupply#172[__this] + mintedAmount#844)];
	call_arg#36 := 0;
	assume {:sourceloc "buggy_8.sol", 272, 14} {:message ""} true;
	call Transfer#229(__this, __msg_sender, __msg_value, call_arg#36, __this, mintedAmount#844);
	assume {:sourceloc "buggy_8.sol", 273, 14} {:message ""} true;
	call Transfer#229(__this, __msg_sender, __msg_value, __this, target#842, mintedAmount#844);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_8.sol", 275, 1} {:message "YFT::bug_unchk_send32"} bug_unchk_send32#894(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#37 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 276, 4} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#37);
	$return42:
	// Function body ends here
}

// 
// Function: freezeAccount : function (address,bool)
procedure {:sourceloc "buggy_8.sol", 281, 5} {:message "YFT::freezeAccount"} freezeAccount#916(__this: address_t, __msg_sender: address_t, __msg_value: int, target#897: address_t, freeze#899: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#16[__this]);
	// Function body starts here
	frozenAccount#707 := frozenAccount#707[__this := frozenAccount#707[__this][target#897 := freeze#899]];
	assume {:sourceloc "buggy_8.sol", 283, 14} {:message ""} true;
	call FrozenFunds#726(__this, __msg_sender, __msg_value, target#897, freeze#899);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_8.sol", 285, 1} {:message "YFT::bug_unchk_send4"} bug_unchk_send4#929(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#40 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 286, 4} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#40);
	$return45:
	// Function body ends here
}

// 
// Function: setPrices : function (uint256,uint256)
procedure {:sourceloc "buggy_8.sol", 291, 5} {:message "YFT::setPrices"} setPrices#948(__this: address_t, __msg_sender: address_t, __msg_value: int, newSellPrice#932: int, newBuyPrice#934: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#16[__this]);
	// Function body starts here
	sellPrice#675 := sellPrice#675[__this := newSellPrice#932];
	buyPrice#690 := buyPrice#690[__this := newBuyPrice#934];
	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_8.sol", 295, 1} {:message "YFT::bug_unchk_send7"} bug_unchk_send7#961(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#43 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 296, 4} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#43);
	$return48:
	// Function body ends here
}

// 
// Function: buy : function ()
procedure {:sourceloc "buggy_8.sol", 299, 5} {:message "YFT::buy"} buy#983(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 300, 9} {:message "amount"} amount#966: int;
	var call_arg#44: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	amount#966 := (__msg_value div buyPrice#690[__this]);
	call_arg#44 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 301, 9} {:message ""} true;
	call _transfer#826(__this, __msg_sender, __msg_value, __this, call_arg#44, amount#966);
	$return49:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_8.sol", 303, 1} {:message "YFT::bug_unchk_send23"} bug_unchk_send23#996(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#45 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 304, 4} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#45);
	$return50:
	// Function body ends here
}

// 
// Function: sell : function (uint256)
procedure {:sourceloc "buggy_8.sol", 308, 5} {:message "YFT::sell"} sell#1040(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#999: int)
{
	var {:sourceloc "buggy_8.sol", 309, 9} {:message "myAddress"} myAddress#1003: address_t;
	var call_arg#46: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	myAddress#1003 := __this;
	assume (__balance[myAddress#1003] >= (amount#999 * sellPrice#675[__this]));
	call_arg#46 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 311, 9} {:message ""} true;
	call _transfer#826(__this, __msg_sender, __msg_value, call_arg#46, __this, amount#999);
	assume {:sourceloc "buggy_8.sol", 312, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, (amount#999 * sellPrice#675[__this]));
	$return51:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_8.sol", 314, 1} {:message "YFT::bug_unchk_send14"} bug_unchk_send14#1053(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#47: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#47 := 1000000000000000000;
	assume {:sourceloc "buggy_8.sol", 315, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#47);
	$return52:
	// Function body ends here
}

