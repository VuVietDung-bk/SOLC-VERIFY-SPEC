// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_47.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Interface -------
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 12, 5} {:message "ERC20Interface::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_47.sol", 13, 1} {:message "ERC20Interface::bug_unchk_send21"} bug_unchk_send21#19(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 13, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 13, 88} {:message "ERC20Interface::balanceOf"} balanceOf#26(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#21: address_t)
	returns (balance#24: int);

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_47.sol", 14, 1} {:message "ERC20Interface::bug_unchk_send10"} bug_unchk_send10#39(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 14, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 14, 88} {:message "ERC20Interface::transfer"} transfer#48(__this: address_t, __msg_sender: address_t, __msg_value: int, to#41: address_t, tokens#43: int)
	returns (success#46: bool);

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_47.sol", 15, 1} {:message "ERC20Interface::bug_unchk_send22"} bug_unchk_send22#61(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 15, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 16, 5} {:message "ERC20Interface::allowance"} allowance#70(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#63: address_t, spender#65: address_t)
	returns (remaining#68: int);

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_47.sol", 17, 1} {:message "ERC20Interface::bug_unchk_send12"} bug_unchk_send12#83(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 17, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 17, 88} {:message "ERC20Interface::approve"} approve#92(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#85: address_t, tokens#87: int)
	returns (success#90: bool);

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_47.sol", 18, 1} {:message "ERC20Interface::bug_unchk_send11"} bug_unchk_send11#105(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 18, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 18, 88} {:message "ERC20Interface::transferFrom"} transferFrom#116(__this: address_t, __msg_sender: address_t, __msg_value: int, from#107: address_t, to#109: address_t, tokens#111: int)
	returns (success#114: bool);

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_47.sol", 19, 1} {:message "ERC20Interface::bug_unchk_send1"} bug_unchk_send1#129(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 19, 44} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_47.sol", 11, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#130(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: AcunarToken -------
// Inherits from: ERC20Interface
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_47.sol", 38, 5} {:message "[event] AcunarToken::Transfer"} Transfer#163(__this: address_t, __msg_sender: address_t, __msg_value: int, from#157: address_t, to#159: address_t, tokens#161: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_47.sol", 39, 5} {:message "[event] AcunarToken::Approval"} Approval#171(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#165: address_t, spender#167: address_t, tokens#169: int)
{
	
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_47.sol", 24, 5} {:message "name"} name#135: [address_t]int_arr_type;
// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_47.sol", 25, 5} {:message "symbol"} symbol#138: [address_t]int_arr_type;
// 
// State variable: decimals: uint256
var {:sourceloc "buggy_47.sol", 26, 5} {:message "decimals"} decimals#141: [address_t]int;
// 
// State variable: supply: uint256
var {:sourceloc "buggy_47.sol", 28, 5} {:message "supply"} supply#143: [address_t]int;
// 
// State variable: founder: address
var {:sourceloc "buggy_47.sol", 29, 5} {:message "founder"} founder#145: [address_t]address_t;
// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 31, 5} {:message "balances"} balances#149: [address_t][address_t]int;
// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_47.sol", 33, 5} {:message "allowed"} allowed#155: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 42, 5} {:message "AcunarToken::[constructor]"} __constructor#464(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#135 := name#135[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	symbol#138 := symbol#138[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	decimals#141 := decimals#141[__this := 0];
	supply#143 := supply#143[__this := 0];
	founder#145 := founder#145[__this := 0];
	balances#149 := balances#149[__this := default_address_t_int()];
	allowed#155 := allowed#155[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	supply#143 := supply#143[__this := 200000000];
	founder#145 := founder#145[__this := __msg_sender];
	balances#149 := balances#149[__this := balances#149[__this][founder#145[__this] := supply#143[__this]]];
	$return6:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_47.sol", 47, 1} {:message "AcunarToken::bug_unchk_send2"} bug_unchk_send2#203(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 47, 44} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return7:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 49, 5} {:message "AcunarToken::allowance"} allowance#220(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#205: address_t, spender#207: address_t)
	returns (#211: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#211 := allowed#155[__this][tokenOwner#205][spender#207];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_47.sol", 52, 1} {:message "AcunarToken::bug_unchk_send17"} bug_unchk_send17#233(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 52, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return9:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 56, 5} {:message "AcunarToken::approve"} approve#277(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#235: address_t, tokens#237: int)
	returns (#241: bool)
{
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#149[__this][__msg_sender] >= tokens#237);
	assume (tokens#237 > 0);
	allowed#155 := allowed#155[__this := allowed#155[__this][__msg_sender := allowed#155[__this][__msg_sender][spender#235 := tokens#237]]];
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 61, 14} {:message ""} true;
	call Approval#171(__this, __msg_sender, __msg_value, call_arg#8, spender#235, tokens#237);
	#241 := true;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_47.sol", 64, 1} {:message "AcunarToken::bug_unchk_send3"} bug_unchk_send3#290(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 64, 44} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return11:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 67, 5} {:message "AcunarToken::transferFrom"} transferFrom#343(__this: address_t, __msg_sender: address_t, __msg_value: int, from#292: address_t, to#294: address_t, tokens#296: int)
	returns (#300: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#155[__this][from#292][to#294] >= tokens#296);
	assume (balances#149[__this][from#292] >= tokens#296);
	balances#149 := balances#149[__this := balances#149[__this][from#292 := (balances#149[__this][from#292] - tokens#296)]];
	balances#149 := balances#149[__this := balances#149[__this][to#294 := (balances#149[__this][to#294] + tokens#296)]];
	allowed#155 := allowed#155[__this := allowed#155[__this][from#292 := allowed#155[__this][from#292][to#294 := (allowed#155[__this][from#292][to#294] - tokens#296)]]];
	#300 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_47.sol", 79, 1} {:message "AcunarToken::bug_unchk_send9"} bug_unchk_send9#356(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 79, 44} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return13:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 81, 5} {:message "AcunarToken::totalSupply"} totalSupply#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#360: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#360 := supply#143[__this];
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_47.sol", 84, 1} {:message "AcunarToken::bug_unchk_send25"} bug_unchk_send25#378(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 84, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return15:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 86, 5} {:message "AcunarToken::balanceOf"} balanceOf#391(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#380: address_t)
	returns (balance#384: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#384 := balances#149[__this][tokenOwner#380];
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_47.sol", 89, 1} {:message "AcunarToken::bug_unchk_send19"} bug_unchk_send19#404(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 89, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return17:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 92, 5} {:message "AcunarToken::transfer"} transfer#450(__this: address_t, __msg_sender: address_t, __msg_value: int, to#406: address_t, tokens#408: int)
	returns (success#412: bool)
{
	var call_arg#13: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((balances#149[__this][__msg_sender] >= tokens#408) && (tokens#408 > 0));
	balances#149 := balances#149[__this := balances#149[__this][to#406 := (balances#149[__this][to#406] + tokens#408)]];
	balances#149 := balances#149[__this := balances#149[__this][__msg_sender := (balances#149[__this][__msg_sender] - tokens#408)]];
	call_arg#13 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 97, 15} {:message ""} true;
	call Transfer#163(__this, __msg_sender, __msg_value, call_arg#13, to#406, tokens#408);
	success#412 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_47.sol", 100, 1} {:message "AcunarToken::bug_unchk_send26"} bug_unchk_send26#463(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 100, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return19:
	// Function body ends here
}

// 
// ------- Contract: AcunarIEO -------
// Inherits from: AcunarToken
// 
// Event: Invest
procedure {:inline 1} {:sourceloc "buggy_47.sol", 135, 88} {:message "[event] AcunarIEO::Invest"} Invest#642(__this: address_t, __msg_sender: address_t, __msg_value: int, investor#636: address_t, value#638: int, tokens#640: int)
{
	
}

// 
// State variable: admin: address
var {:sourceloc "buggy_47.sol", 104, 5} {:message "admin"} admin#468: [address_t]address_t;
// 
// Function: bug_unchk_send18 : function ()
procedure {:sourceloc "buggy_47.sol", 109, 3} {:message "AcunarIEO::bug_unchk_send18"} bug_unchk_send18#481(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 109, 47} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return20:
	// Function body ends here
}

// 
// State variable: deposit: address payable
var {:sourceloc "buggy_47.sol", 109, 88} {:message "deposit"} deposit#483: [address_t]address_t;
// 
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_47.sol", 112, 3} {:message "AcunarIEO::bug_unchk_send29"} bug_unchk_send29#496(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 112, 47} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return21:
	// Function body ends here
}

// 
// State variable: tokenPrice: uint256
var {:sourceloc "buggy_47.sol", 112, 88} {:message "tokenPrice"} tokenPrice#499: [address_t]int;
// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_47.sol", 115, 3} {:message "AcunarIEO::bug_unchk_send6"} bug_unchk_send6#512(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 115, 46} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return22:
	// Function body ends here
}

// 
// State variable: hardCap: uint256
var {:sourceloc "buggy_47.sol", 115, 87} {:message "hardCap"} hardCap#515: [address_t]int;
// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_47.sol", 117, 3} {:message "AcunarIEO::bug_unchk_send16"} bug_unchk_send16#528(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 117, 47} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return23:
	// Function body ends here
}

// 
// State variable: raisedAmount: uint256
var {:sourceloc "buggy_47.sol", 117, 88} {:message "raisedAmount"} raisedAmount#530: [address_t]int;
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_47.sol", 119, 3} {:message "AcunarIEO::bug_unchk_send24"} bug_unchk_send24#543(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 119, 47} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return24:
	// Function body ends here
}

// 
// State variable: saleStart: uint256
var {:sourceloc "buggy_47.sol", 119, 88} {:message "saleStart"} saleStart#547: [address_t]int;
// 
// State variable: saleEnd: uint256
var {:sourceloc "buggy_47.sol", 120, 5} {:message "saleEnd"} saleEnd#553: [address_t]int;
// 
// State variable: coinTradeStart: uint256
var {:sourceloc "buggy_47.sol", 121, 5} {:message "coinTradeStart"} coinTradeStart#558: [address_t]int;
// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_47.sol", 123, 3} {:message "AcunarIEO::bug_unchk_send5"} bug_unchk_send5#571(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 123, 46} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return25:
	// Function body ends here
}

// 
// State variable: maxInvestment: uint256
var {:sourceloc "buggy_47.sol", 123, 87} {:message "maxInvestment"} maxInvestment#574: [address_t]int;
// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_47.sol", 124, 3} {:message "AcunarIEO::bug_unchk_send15"} bug_unchk_send15#587(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 124, 47} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return26:
	// Function body ends here
}

// 
// State variable: minInvestment: uint256
var {:sourceloc "buggy_47.sol", 124, 88} {:message "minInvestment"} minInvestment#590: [address_t]int;
// Enum definition State mapped to int
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_47.sol", 127, 3} {:message "AcunarIEO::bug_unchk_send28"} bug_unchk_send28#608(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 127, 47} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return27:
	// Function body ends here
}

// 
// State variable: ieoState: enum AcunarIEO.State
var {:sourceloc "buggy_47.sol", 127, 88} {:message "ieoState"} ieoState#610: [address_t]int;
// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_47.sol", 135, 3} {:message "AcunarIEO::bug_unchk_send13"} bug_unchk_send13#634(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 135, 47} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return28:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 139, 5} {:message "AcunarIEO::[constructor]"} __constructor#1034(__this: address_t, __msg_sender: address_t, __msg_value: int, _deposit#644: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	admin#468 := admin#468[__this := 0];
	deposit#483 := deposit#483[__this := 0];
	tokenPrice#499 := tokenPrice#499[__this := 100000000000000];
	hardCap#515 := hardCap#515[__this := 21000000000000000000000];
	raisedAmount#530 := raisedAmount#530[__this := 0];
	saleStart#547 := saleStart#547[__this := __block_timestamp];
	saleEnd#553 := saleEnd#553[__this := (__block_timestamp + 14515200)];
	coinTradeStart#558 := coinTradeStart#558[__this := (saleEnd#553[__this] + 15120000)];
	maxInvestment#574 := maxInvestment#574[__this := 30000000000000000000];
	minInvestment#590 := minInvestment#590[__this := 100000000000000000];
	ieoState#610 := ieoState#610[__this := 0];
	name#135 := name#135[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	symbol#138 := symbol#138[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	decimals#141 := decimals#141[__this := 0];
	supply#143 := supply#143[__this := 0];
	founder#145 := founder#145[__this := 0];
	balances#149 := balances#149[__this := default_address_t_int()];
	allowed#155 := allowed#155[__this := default_address_t__k_address_t_v_int()];
	// Arguments for AcunarToken
	// Inlined constructor for AcunarToken starts here
	// Function body starts here
	supply#143 := supply#143[__this := 200000000];
	founder#145 := founder#145[__this := __msg_sender];
	balances#149 := balances#149[__this := balances#149[__this][founder#145[__this] := supply#143[__this]]];
	$return29:
	// Function body ends here
	// Inlined constructor for AcunarToken ends here
	// Function body starts here
	deposit#483 := deposit#483[__this := _deposit#644];
	admin#468 := admin#468[__this := __msg_sender];
	ieoState#610 := ieoState#610[__this := 0];
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_47.sol", 144, 1} {:message "AcunarIEO::bug_unchk_send20"} bug_unchk_send20#675(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 144, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return31:
	// Function body ends here
}

// 
// Function: halt : function ()
procedure {:sourceloc "buggy_47.sol", 146, 5} {:message "AcunarIEO::halt"} halt#686(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#468[__this]);
	// Function body starts here
	ieoState#610 := ieoState#610[__this := 3];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_47.sol", 149, 1} {:message "AcunarIEO::bug_unchk_send32"} bug_unchk_send32#699(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 149, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return34:
	// Function body ends here
}

// 
// Function: unhalt : function ()
procedure {:sourceloc "buggy_47.sol", 151, 5} {:message "AcunarIEO::unhalt"} unhalt#710(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#468[__this]);
	// Function body starts here
	ieoState#610 := ieoState#610[__this := 1];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_47.sol", 154, 1} {:message "AcunarIEO::bug_unchk_send4"} bug_unchk_send4#723(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#31: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#31 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 154, 44} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#31);
	$return37:
	// Function body ends here
}

// 
// Function: changeDepositAddress : function (address payable)
procedure {:sourceloc "buggy_47.sol", 158, 5} {:message "AcunarIEO::changeDepositAddress"} changeDepositAddress#735(__this: address_t, __msg_sender: address_t, __msg_value: int, newDeposit#725: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#468[__this]);
	// Function body starts here
	deposit#483 := deposit#483[__this := newDeposit#725];
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_47.sol", 161, 1} {:message "AcunarIEO::bug_unchk_send7"} bug_unchk_send7#748(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#34 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 161, 44} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#34);
	$return40:
	// Function body ends here
}

// 
// Function: getCurrentState : function () view returns (enum AcunarIEO.State)
procedure {:sourceloc "buggy_47.sol", 165, 5} {:message "AcunarIEO::getCurrentState"} getCurrentState#790(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#751: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((ieoState#610[__this] == 3)) {
	#751 := 3;
	goto $return41;
	}
	else {
	if ((__block_timestamp < saleStart#547[__this])) {
	#751 := 0;
	goto $return41;
	}
	else {
	if (((__block_timestamp >= saleStart#547[__this]) && (__block_timestamp <= saleEnd#553[__this]))) {
	#751 := 1;
	goto $return41;
	}
	else {
	#751 := 2;
	goto $return41;
	}

	}

	}

	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_47.sol", 176, 1} {:message "AcunarIEO::bug_unchk_send23"} bug_unchk_send23#803(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#35 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 176, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#35);
	$return42:
	// Function body ends here
}

// 
// Function: invest : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 179, 5} {:message "AcunarIEO::invest"} invest#884(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#806: bool)
{
	var getCurrentState#790_ret#36: int;
	var {:sourceloc "buggy_47.sol", 186, 9} {:message "tokens"} tokens#833: int;
	var call_arg#37: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 181, 20} {:message ""} true;
	call getCurrentState#790_ret#36 := getCurrentState#790(__this, __msg_sender, __msg_value);
	ieoState#610 := ieoState#610[__this := getCurrentState#790_ret#36];
	assume (ieoState#610[__this] == 1);
	assume ((__msg_value >= minInvestment#590[__this]) && (__msg_value <= maxInvestment#574[__this]));
	tokens#833 := (__msg_value div tokenPrice#499[__this]);
	assume ((raisedAmount#530[__this] + __msg_value) <= hardCap#515[__this]);
	raisedAmount#530 := raisedAmount#530[__this := (raisedAmount#530[__this] + __msg_value)];
	balances#149 := balances#149[__this := balances#149[__this][__msg_sender := (balances#149[__this][__msg_sender] + tokens#833)]];
	balances#149 := balances#149[__this := balances#149[__this][founder#145[__this] := (balances#149[__this][founder#145[__this]] - tokens#833)]];
	assume {:sourceloc "buggy_47.sol", 197, 9} {:message ""} true;
	call __transfer(deposit#483[__this], __this, 0, __msg_value);
	call_arg#37 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 200, 14} {:message ""} true;
	call Invest#642(__this, __msg_sender, __msg_value, call_arg#37, __msg_value, tokens#833);
	#806 := true;
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_47.sol", 206, 1} {:message "AcunarIEO::bug_unchk_send14"} bug_unchk_send14#897(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 206, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#38);
	$return44:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 209, 5} {:message "AcunarIEO::[receive]"} #904(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var invest#884_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 210, 9} {:message ""} true;
	call invest#884_ret#39 := invest#884(__this, __msg_sender, __msg_value);
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_47.sol", 212, 1} {:message "AcunarIEO::bug_unchk_send30"} bug_unchk_send30#917(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#40 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 212, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#40);
	$return46:
	// Function body ends here
}

// 
// Function: burn : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 216, 5} {:message "AcunarIEO::burn"} burn#943(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#920: bool)
{
	var getCurrentState#790_ret#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 217, 20} {:message ""} true;
	call getCurrentState#790_ret#41 := getCurrentState#790(__this, __msg_sender, __msg_value);
	ieoState#610 := ieoState#610[__this := getCurrentState#790_ret#41];
	assume (ieoState#610[__this] == 2);
	balances#149 := balances#149[__this := balances#149[__this][founder#145[__this] := 0]];
	#920 := true;
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_47.sol", 222, 1} {:message "AcunarIEO::bug_unchk_send8"} bug_unchk_send8#956(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 222, 44} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#42);
	$return48:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 225, 5} {:message "AcunarIEO::transfer"} transfer#980(__this: address_t, __msg_sender: address_t, __msg_value: int, to#958: address_t, value#960: int)
	returns (#964: bool)
{
	var transfer#450_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#558[__this]);
	assume {:sourceloc "buggy_47.sol", 227, 16} {:message ""} true;
	call transfer#450_ret#43 := transfer#450(__this, __msg_sender, __msg_value, to#958, value#960);
	#964 := transfer#450_ret#43;
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_47.sol", 229, 1} {:message "AcunarIEO::bug_unchk_send27"} bug_unchk_send27#993(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 229, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#44);
	$return50:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 231, 5} {:message "AcunarIEO::transferFrom"} transferFrom#1020(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#995: address_t, _to#997: address_t, _value#999: int)
	returns (#1003: bool)
{
	var transferFrom#343_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#558[__this]);
	assume {:sourceloc "buggy_47.sol", 233, 16} {:message ""} true;
	call transferFrom#343_ret#45 := transferFrom#343(__this, __msg_sender, __msg_value, _from#995, _to#997, _value#999);
	#1003 := transferFrom#343_ret#45;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_47.sol", 235, 1} {:message "AcunarIEO::bug_unchk_send31"} bug_unchk_send31#1033(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_47.sol", 235, 45} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#46);
	$return52:
	// Function body ends here
}

