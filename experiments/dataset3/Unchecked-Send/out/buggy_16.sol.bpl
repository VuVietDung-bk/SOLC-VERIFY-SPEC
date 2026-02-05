// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_16.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 19, 5} {:message "SafeMath::mul"} mul#31(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (c#10: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#10 := (a#5 * b#7);
	assume ((a#5 == 0) || ((c#10 div a#5) == b#7));
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 27, 4} {:message "SafeMath::div"} div#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#34: int, b#36: int)
	returns (c#39: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#36 > 0);
	c#39 := (a#34 div b#36);
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 35, 5} {:message "SafeMath::sub"} sub#77(__this: address_t, __msg_sender: address_t, __msg_value: int, a#57: int, b#59: int)
	returns (c#62: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#59 <= a#57);
	c#62 := (a#57 - b#59);
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 43, 5} {:message "SafeMath::add"} add#100(__this: address_t, __msg_sender: address_t, __msg_value: int, a#80: int, b#82: int)
	returns (c#85: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#85 := (a#80 + b#82);
	assume (c#85 >= a#80);
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_16.sol", 14, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_16.sol", 70, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#237(__this: address_t, __msg_sender: address_t, __msg_value: int, from#231: address_t, to#233: address_t, tokens#235: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_16.sol", 73, 3} {:message "[event] ERC20Interface::Approval"} Approval#258(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#252: address_t, spender#254: address_t, tokens#256: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_16.sol", 51, 5} {:message "ERC20Interface::totalSupply"} totalSupply#106(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#104: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_16.sol", 52, 5} {:message "ERC20Interface::balanceOf"} balanceOf#113(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#108: address_t)
	returns (balance#111: int);

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send18 : function ()
procedure {:sourceloc "buggy_16.sol", 53, 1} {:message "ERC20Interface::bug_unchk_send18"} bug_unchk_send18#126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 54, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return4:
	// Function body ends here
}

// 
// Function: allowance
procedure {:sourceloc "buggy_16.sol", 55, 5} {:message "ERC20Interface::allowance"} allowance#135(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#128: address_t, spender#130: address_t)
	returns (remaining#133: int);

// 
// Function: bug_unchk_send29 : function ()
procedure {:sourceloc "buggy_16.sol", 56, 1} {:message "ERC20Interface::bug_unchk_send29"} bug_unchk_send29#148(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 57, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return5:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_16.sol", 58, 5} {:message "ERC20Interface::transfer"} transfer#157(__this: address_t, __msg_sender: address_t, __msg_value: int, to#150: address_t, tokens#152: int)
	returns (success#155: bool);

// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_16.sol", 59, 1} {:message "ERC20Interface::bug_unchk_send6"} bug_unchk_send6#170(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 60, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return6:
	// Function body ends here
}

// 
// Function: approve
procedure {:sourceloc "buggy_16.sol", 61, 5} {:message "ERC20Interface::approve"} approve#179(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#172: address_t, tokens#174: int)
	returns (success#177: bool);

// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_16.sol", 62, 1} {:message "ERC20Interface::bug_unchk_send16"} bug_unchk_send16#192(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 63, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return7:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_16.sol", 64, 5} {:message "ERC20Interface::transferFrom"} transferFrom#203(__this: address_t, __msg_sender: address_t, __msg_value: int, from#194: address_t, to#196: address_t, tokens#198: int)
	returns (success#201: bool);

// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_16.sol", 65, 1} {:message "ERC20Interface::bug_unchk_send24"} bug_unchk_send24#216(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 66, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_16.sol", 68, 3} {:message "ERC20Interface::bug_unchk_send14"} bug_unchk_send14#229(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 69, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return9:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_16.sol", 71, 3} {:message "ERC20Interface::bug_unchk_send30"} bug_unchk_send30#250(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 72, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return10:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_16.sol", 50, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#259(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_16.sol", 81, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#280(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#276: address_t, newOwner#278: address_t)
{
	
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_16.sol", 78, 5} {:message "owner"} owner#261: [address_t]address_t;
// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_16.sol", 79, 3} {:message "Owned::bug_unchk_send8"} bug_unchk_send8#274(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 80, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return11:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 87, 5} {:message "Owned::[constructor]"} __constructor#359(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#261 := owner#261[__this := 0];
	// Function body starts here
	owner#261 := owner#261[__this := __msg_sender];
	$return12:
	// Function body ends here
}

// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_16.sol", 90, 1} {:message "Owned::bug_unchk_send5"} bug_unchk_send5#306(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 91, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return13:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_16.sol", 105, 5} {:message "Owned::transferOwnership"} transferOwnership#345(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#321: address_t)
{
	var call_arg#11: address_t;
	var call_arg#12: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#261[__this]);
	// Function body starts here
	assume (newOwner#321 != 0);
	call_arg#11 := owner#261[__this];
	call_arg#12 := newOwner#321;
	assume {:sourceloc "buggy_16.sol", 107, 14} {:message ""} true;
	call OwnershipTransferred#280(__this, __msg_sender, __msg_value, call_arg#11, call_arg#12);
	owner#261 := owner#261[__this := newOwner#321];
	$return15:
	// Function body ends here
	$return14:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_16.sol", 110, 1} {:message "Owned::bug_unchk_send15"} bug_unchk_send15#358(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 111, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return16:
	// Function body ends here
}

// 
// ------- Contract: ExclusivePlatform -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// 
// Event: TransferEther
procedure {:inline 1} {:sourceloc "buggy_16.sol", 311, 3} {:message "[event] ExclusivePlatform::TransferEther"} TransferEther#1259(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1253: address_t, _to#1255: address_t, _value#1257: int)
{
	
}

// 
// Event: NewPrice
procedure {:inline 1} {:sourceloc "buggy_16.sol", 314, 3} {:message "[event] ExclusivePlatform::NewPrice"} NewPrice#1280(__this: address_t, __msg_sender: address_t, __msg_value: int, _changer#1274: address_t, _lastPrice#1276: int, _newPrice#1278: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_16.sol", 317, 3} {:message "[event] ExclusivePlatform::Burn"} Burn#1299(__this: address_t, __msg_sender: address_t, __msg_value: int, _burner#1295: address_t, value#1297: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 119, 5} {:message "balances"} balances#370: [address_t][address_t]int;
// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_16.sol", 120, 5} {:message "allowed"} allowed#376: [address_t][address_t][address_t]int;
// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_16.sol", 122, 5} {:message "name"} name#379: [address_t]int_arr_type;
// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_16.sol", 123, 5} {:message "symbol"} symbol#382: [address_t]int_arr_type;
// 
// State variable: decimals: uint256
var {:sourceloc "buggy_16.sol", 124, 5} {:message "decimals"} decimals#385: [address_t]int;
// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_16.sol", 125, 5} {:message "_totalSupply"} _totalSupply#387: [address_t]int;
// 
// State variable: XPLPerEther: uint256
var {:sourceloc "buggy_16.sol", 127, 5} {:message "XPLPerEther"} XPLPerEther#390: [address_t]int;
// 
// State variable: minimumBuy: uint256
var {:sourceloc "buggy_16.sol", 128, 5} {:message "minimumBuy"} minimumBuy#395: [address_t]int;
// 
// State variable: crowdsaleIsOn: bool
var {:sourceloc "buggy_16.sol", 129, 5} {:message "crowdsaleIsOn"} crowdsaleIsOn#398: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 138, 5} {:message "ExclusivePlatform::[constructor]"} __constructor#1300(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: address_t;
	var call_arg#16: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances#370 := balances#370[__this := default_address_t_int()];
	allowed#376 := allowed#376[__this := default_address_t__k_address_t_v_int()];
	name#379 := name#379[__this := int_arr#constr(default_int_int()[0 := 69][1 := 120][2 := 99][3 := 108][4 := 117][5 := 115][6 := 105][7 := 118][8 := 101][9 := 32][10 := 80][11 := 108][12 := 97][13 := 116][14 := 102][15 := 111][16 := 114][17 := 109], 18)];
	symbol#382 := symbol#382[__this := int_arr#constr(default_int_int()[0 := 88][1 := 80][2 := 76], 3)];
	decimals#385 := decimals#385[__this := 8];
	_totalSupply#387 := _totalSupply#387[__this := 0];
	XPLPerEther#390 := XPLPerEther#390[__this := 800000000000000];
	minimumBuy#395 := minimumBuy#395[__this := 10000000000000000];
	crowdsaleIsOn#398 := crowdsaleIsOn#398[__this := true];
	owner#261 := owner#261[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#261 := owner#261[__this := __msg_sender];
	$return17:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	_totalSupply#387 := _totalSupply#387[__this := 1000000000000000000];
	balances#370 := balances#370[__this := balances#370[__this][owner#261[__this] := _totalSupply#387[__this]]];
	call_arg#15 := 0;
	call_arg#16 := owner#261[__this];
	assume {:sourceloc "buggy_16.sol", 141, 14} {:message ""} true;
	call Transfer#237(__this, __msg_sender, __msg_value, call_arg#15, call_arg#16, _totalSupply#387[__this]);
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_16.sol", 143, 1} {:message "ExclusivePlatform::bug_unchk_send28"} bug_unchk_send28#450(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 144, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return19:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 146, 5} {:message "ExclusivePlatform::totalSupply"} totalSupply#459(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#454: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#454 := _totalSupply#387[__this];
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_16.sol", 149, 1} {:message "ExclusivePlatform::bug_unchk_send21"} bug_unchk_send21#472(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 150, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return21:
	// Function body ends here
}

// 
// Function: updateXPLPerEther : function (uint256)
procedure {:sourceloc "buggy_16.sol", 152, 5} {:message "ExclusivePlatform::updateXPLPerEther"} updateXPLPerEther#490(__this: address_t, __msg_sender: address_t, __msg_value: int, _XPLPerEther#474: int)
{
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#261[__this]);
	// Function body starts here
	call_arg#21 := owner#261[__this];
	assume {:sourceloc "buggy_16.sol", 153, 14} {:message ""} true;
	call NewPrice#1280(__this, __msg_sender, __msg_value, call_arg#21, XPLPerEther#390[__this], _XPLPerEther#474);
	XPLPerEther#390 := XPLPerEther#390[__this := _XPLPerEther#474];
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_16.sol", 156, 1} {:message "ExclusivePlatform::bug_unchk_send10"} bug_unchk_send10#503(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 157, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return24:
	// Function body ends here
}

// 
// Function: switchCrowdsale : function ()
procedure {:sourceloc "buggy_16.sol", 159, 5} {:message "ExclusivePlatform::switchCrowdsale"} switchCrowdsale#515(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#261[__this]);
	// Function body starts here
	crowdsaleIsOn#398 := crowdsaleIsOn#398[__this := !(crowdsaleIsOn#398[__this])];
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_16.sol", 162, 1} {:message "ExclusivePlatform::bug_unchk_send22"} bug_unchk_send22#528(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 163, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return27:
	// Function body ends here
}

// 
// Function: getBonus : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 165, 5} {:message "ExclusivePlatform::getBonus"} getBonus#575(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#530: int)
	returns (#533: int)
{
	var call_arg#26: int;
	var mul#31_ret#27: int;
	var call_arg#28: int;
	var div#54_ret#29: int;
	var add#100_ret#30: int;
	var call_arg#31: int;
	var div#54_ret#32: int;
	var add#100_ret#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#26 := 5;
	assume {:sourceloc "buggy_16.sol", 166, 24} {:message ""} true;
	call mul#31_ret#27 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#390[__this], call_arg#26);
	if ((_amount#530 >= mul#31_ret#27)) {
	call_arg#28 := 100;
	assume {:sourceloc "buggy_16.sol", 170, 21} {:message ""} true;
	call div#54_ret#29 := div#54(__this, __msg_sender, __msg_value, (20 * _amount#530), call_arg#28);
	assume {:sourceloc "buggy_16.sol", 170, 20} {:message ""} true;
	call add#100_ret#30 := add#100(__this, __msg_sender, __msg_value, div#54_ret#29, _amount#530);
	#533 := add#100_ret#30;
	goto $return28;
	}
	else {
	if ((_amount#530 >= XPLPerEther#390[__this])) {
	call_arg#31 := 100;
	assume {:sourceloc "buggy_16.sol", 175, 21} {:message ""} true;
	call div#54_ret#32 := div#54(__this, __msg_sender, __msg_value, (5 * _amount#530), call_arg#31);
	assume {:sourceloc "buggy_16.sol", 175, 20} {:message ""} true;
	call add#100_ret#33 := add#100(__this, __msg_sender, __msg_value, div#54_ret#32, _amount#530);
	#533 := add#100_ret#33;
	goto $return28;
	}

	}

	#533 := _amount#530;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_16.sol", 179, 1} {:message "ExclusivePlatform::bug_unchk_send12"} bug_unchk_send12#588(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#34 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 180, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#34);
	$return29:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 182, 5} {:message "ExclusivePlatform::[receive]"} #626(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 185, 9} {:message "totalBuy"} totalBuy#601: int;
	var mul#31_ret#35: int;
	var call_arg#36: int;
	var div#54_ret#37: int;
	var getBonus#575_ret#38: int;
	var call_arg#39: address_t;
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (crowdsaleIsOn#398[__this] && (__msg_value >= minimumBuy#395[__this]));
	assume {:sourceloc "buggy_16.sol", 185, 30} {:message ""} true;
	call mul#31_ret#35 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#390[__this], __msg_value);
	call_arg#36 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 185, 29} {:message ""} true;
	call div#54_ret#37 := div#54(__this, __msg_sender, __msg_value, mul#31_ret#35, call_arg#36);
	totalBuy#601 := div#54_ret#37;
	assume {:sourceloc "buggy_16.sol", 186, 20} {:message ""} true;
	call getBonus#575_ret#38 := getBonus#575(__this, __msg_sender, __msg_value, totalBuy#601);
	totalBuy#601 := getBonus#575_ret#38;
	call_arg#39 := owner#261[__this];
	call_arg#40 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 188, 9} {:message ""} true;
	call doTransfer#791(__this, __msg_sender, __msg_value, call_arg#39, call_arg#40, totalBuy#601);
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_16.sol", 190, 1} {:message "ExclusivePlatform::bug_unchk_send11"} bug_unchk_send11#639(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 191, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#41);
	$return31:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: distribute
procedure {:sourceloc "buggy_16.sol", 193, 5} {:message "ExclusivePlatform::distribute"} distribute#668(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#642: address_t_arr_ptr, _amount#644: int)
{
	var {:sourceloc "buggy_16.sol", 194, 14} {:message "i"} i#648: int;
	var transfer#850_ret#44: bool;
	var tmp#45: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#648 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#642])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#642]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#648 < length#address_t_arr#constr(mem_arr_address_t[_addresses#642]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 194, 55} {:message ""} true;
	call transfer#850_ret#44 := transfer#850(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#642])[i#648], _amount#644);
	$continue42:
	// Loop expression
	tmp#45 := i#648;
	i#648 := (i#648 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#642])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#642]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break43:
	$return32:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_16.sol", 196, 1} {:message "ExclusivePlatform::bug_unchk_send1"} bug_unchk_send1#681(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 197, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#46);
	$return33:
	// Function body ends here
}

type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: distributeWithAmount
procedure {:sourceloc "buggy_16.sol", 199, 5} {:message "ExclusivePlatform::distributeWithAmount"} distributeWithAmount#721(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#684: address_t_arr_ptr, _amounts#687: int_arr_ptr)
{
	var {:sourceloc "buggy_16.sol", 201, 14} {:message "i"} i#699: int;
	var transfer#850_ret#49: bool;
	var tmp#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#684])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#684]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_amounts#687])) && (length#int_arr#constr(mem_arr_int[_amounts#687]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_addresses#684]) == length#int_arr#constr(mem_arr_int[_amounts#687]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#699 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#684])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#684]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#699 < length#address_t_arr#constr(mem_arr_address_t[_addresses#684]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 201, 55} {:message ""} true;
	call transfer#850_ret#49 := transfer#850(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#684])[i#699], arr#int_arr#constr(mem_arr_int[_amounts#687])[i#699]);
	$continue47:
	// Loop expression
	tmp#50 := i#699;
	i#699 := (i#699 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#684])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#684]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break48:
	$return34:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_16.sol", 203, 1} {:message "ExclusivePlatform::bug_unchk_send2"} bug_unchk_send2#734(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#51 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 204, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#51);
	$return35:
	// Function body ends here
}

// 
// Function: doTransfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 210, 5} {:message "ExclusivePlatform::doTransfer"} doTransfer#791(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#737: address_t, _to#739: address_t, _amount#741: int)
{
	var sub#77_ret#52: int;
	var add#100_ret#53: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#739 != 0);
	assume (_amount#741 <= balances#370[__this][_from#737]);
	assume {:sourceloc "buggy_16.sol", 214, 27} {:message ""} true;
	call sub#77_ret#52 := sub#77(__this, __msg_sender, __msg_value, balances#370[__this][_from#737], _amount#741);
	balances#370 := balances#370[__this := balances#370[__this][_from#737 := sub#77_ret#52]];
	assume {:sourceloc "buggy_16.sol", 215, 25} {:message ""} true;
	call add#100_ret#53 := add#100(__this, __msg_sender, __msg_value, balances#370[__this][_to#739], _amount#741);
	balances#370 := balances#370[__this := balances#370[__this][_to#739 := add#100_ret#53]];
	assume {:sourceloc "buggy_16.sol", 216, 14} {:message ""} true;
	call Transfer#237(__this, __msg_sender, __msg_value, _from#737, _to#739, _amount#741);
	$return36:
	// Function body ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_16.sol", 218, 1} {:message "ExclusivePlatform::bug_unchk_send17"} bug_unchk_send17#804(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#54 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 219, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#54);
	$return37:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 221, 5} {:message "ExclusivePlatform::balanceOf"} balanceOf#817(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#806: address_t)
	returns (#810: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#810 := balances#370[__this][_owner#806];
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_16.sol", 224, 1} {:message "ExclusivePlatform::bug_unchk_send3"} bug_unchk_send3#830(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#55: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#55 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 225, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#55);
	$return39:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 227, 5} {:message "ExclusivePlatform::transfer"} transfer#850(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#832: address_t, _amount#834: int)
	returns (success#838: bool)
{
	var call_arg#56: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#56 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 228, 9} {:message ""} true;
	call doTransfer#791(__this, __msg_sender, __msg_value, call_arg#56, _to#832, _amount#834);
	success#838 := true;
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_16.sol", 231, 1} {:message "ExclusivePlatform::bug_unchk_send9"} bug_unchk_send9#863(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#57: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#57 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 232, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#57);
	$return41:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 234, 5} {:message "ExclusivePlatform::transferFrom"} transferFrom#913(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#866: address_t, _to#868: address_t, _amount#870: int)
	returns (success#874: bool)
{
	var sub#77_ret#58: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#376[__this][_from#866][__msg_sender] >= _amount#870);
	assume {:sourceloc "buggy_16.sol", 236, 38} {:message ""} true;
	call sub#77_ret#58 := sub#77(__this, __msg_sender, __msg_value, allowed#376[__this][_from#866][__msg_sender], _amount#870);
	allowed#376 := allowed#376[__this := allowed#376[__this][_from#866 := allowed#376[__this][_from#866][__msg_sender := sub#77_ret#58]]];
	assume {:sourceloc "buggy_16.sol", 237, 9} {:message ""} true;
	call doTransfer#791(__this, __msg_sender, __msg_value, _from#866, _to#868, _amount#870);
	success#874 := true;
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_16.sol", 240, 1} {:message "ExclusivePlatform::bug_unchk_send25"} bug_unchk_send25#926(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#59: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#59 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 241, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#59);
	$return43:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 248, 5} {:message "ExclusivePlatform::approve"} approve#973(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#929: address_t, _amount#931: int)
	returns (success#935: bool)
{
	var call_arg#60: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((_amount#931 == 0) || (allowed#376[__this][__msg_sender][_spender#929] == 0));
	allowed#376 := allowed#376[__this := allowed#376[__this][__msg_sender := allowed#376[__this][__msg_sender][_spender#929 := _amount#931]]];
	call_arg#60 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 255, 14} {:message ""} true;
	call Approval#258(__this, __msg_sender, __msg_value, call_arg#60, _spender#929, _amount#931);
	success#935 := true;
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_16.sol", 258, 1} {:message "ExclusivePlatform::bug_unchk_send19"} bug_unchk_send19#986(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#61: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#61 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 259, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#61);
	$return45:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 261, 5} {:message "ExclusivePlatform::allowance"} allowance#1003(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#988: address_t, _spender#990: address_t)
	returns (#994: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#994 := allowed#376[__this][_owner#988][_spender#990];
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_16.sol", 264, 1} {:message "ExclusivePlatform::bug_unchk_send26"} bug_unchk_send26#1016(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#62: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#62 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 265, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#62);
	$return47:
	// Function body ends here
}

// 
// Function: transferEther : function (address payable,uint256)
procedure {:sourceloc "buggy_16.sol", 267, 5} {:message "ExclusivePlatform::transferEther"} transferEther#1051(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#1018: address_t, _amount#1020: int)
{
	var call_arg#65: address_t;
	var call_arg#66: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#261[__this]);
	// Function body starts here
	assume (_amount#1020 <= __balance[__this]);
	call_arg#65 := __this;
	call_arg#66 := _receiver#1018;
	assume {:sourceloc "buggy_16.sol", 269, 14} {:message ""} true;
	call TransferEther#1259(__this, __msg_sender, __msg_value, call_arg#65, call_arg#66, _amount#1020);
	assume {:sourceloc "buggy_16.sol", 270, 9} {:message ""} true;
	call __transfer(_receiver#1018, __this, 0, _amount#1020);
	$return49:
	// Function body ends here
	$return48:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_16.sol", 272, 1} {:message "ExclusivePlatform::bug_unchk_send20"} bug_unchk_send20#1064(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#67: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#67 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 273, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#67);
	$return50:
	// Function body ends here
}

// 
// Function: withdrawFund : function ()
procedure {:sourceloc "buggy_16.sol", 275, 5} {:message "ExclusivePlatform::withdrawFund"} withdrawFund#1084(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 276, 9} {:message "balance"} balance#1070#69: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#261[__this]);
	// Function body starts here
	balance#1070#69 := __balance[__this];
	assume {:sourceloc "buggy_16.sol", 277, 9} {:message ""} true;
	call __transfer(owner#261[__this], __this, 0, balance#1070#69);
	$return52:
	// Function body ends here
	$return51:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_16.sol", 279, 1} {:message "ExclusivePlatform::bug_unchk_send32"} bug_unchk_send32#1097(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#70: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#70 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 280, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#70);
	$return53:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_16.sol", 282, 5} {:message "ExclusivePlatform::burn"} burn#1142(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#1099: int)
{
	var {:sourceloc "buggy_16.sol", 284, 9} {:message "burner"} burner#1114#72: address_t;
	var sub#77_ret#73: int;
	var sub#77_ret#74: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#261[__this]);
	// Function body starts here
	assume (_value#1099 <= balances#370[__this][__msg_sender]);
	burner#1114#72 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 285, 28} {:message ""} true;
	call sub#77_ret#73 := sub#77(__this, __msg_sender, __msg_value, balances#370[__this][burner#1114#72], _value#1099);
	balances#370 := balances#370[__this := balances#370[__this][burner#1114#72 := sub#77_ret#73]];
	assume {:sourceloc "buggy_16.sol", 286, 24} {:message ""} true;
	call sub#77_ret#74 := sub#77(__this, __msg_sender, __msg_value, _totalSupply#387[__this], _value#1099);
	_totalSupply#387 := _totalSupply#387[__this := sub#77_ret#74];
	assume {:sourceloc "buggy_16.sol", 287, 14} {:message ""} true;
	call Burn#1299(__this, __msg_sender, __msg_value, burner#1114#72, _value#1099);
	$return55:
	// Function body ends here
	$return54:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_16.sol", 289, 1} {:message "ExclusivePlatform::bug_unchk_send4"} bug_unchk_send4#1155(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#75: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#75 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 290, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#75);
	$return56:
	// Function body ends here
}

// 
// Function: getForeignTokenBalance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 293, 5} {:message "ExclusivePlatform::getForeignTokenBalance"} getForeignTokenBalance#1180(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1157: address_t, who#1159: address_t)
	returns (#1162: int)
{
	var {:sourceloc "buggy_16.sol", 294, 9} {:message "token"} token#1165: address_t;
	var {:sourceloc "buggy_16.sol", 295, 9} {:message "bal"} bal#1171: int;
	var balanceOf#113_ret#76: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	token#1165 := tokenAddress#1157;
	assume {:sourceloc "buggy_16.sol", 295, 20} {:message ""} true;
	call balanceOf#113_ret#76 := balanceOf#113(token#1165, __this, 0, who#1159);
	bal#1171 := balanceOf#113_ret#76;
	#1162 := bal#1171;
	goto $return57;
	$return57:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_16.sol", 298, 1} {:message "ExclusivePlatform::bug_unchk_send7"} bug_unchk_send7#1193(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#77: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#77 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 299, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#77);
	$return58:
	// Function body ends here
}

// 
// Function: withdrawForeignTokens : function (address) returns (bool)
procedure {:sourceloc "buggy_16.sol", 301, 5} {:message "ExclusivePlatform::withdrawForeignTokens"} withdrawForeignTokens#1225(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1195: address_t)
	returns (#1200: bool)
{
	var {:sourceloc "buggy_16.sol", 302, 9} {:message "token"} token#1203#79: address_t;
	var {:sourceloc "buggy_16.sol", 303, 9} {:message "amount"} amount#1209#79: int;
	var call_arg#80: address_t;
	var balanceOf#113_ret#81: int;
	var call_arg#82: address_t;
	var transfer#157_ret#83: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#261[__this]);
	// Function body starts here
	token#1203#79 := tokenAddress#1195;
	call_arg#80 := __this;
	assume {:sourceloc "buggy_16.sol", 303, 26} {:message ""} true;
	call balanceOf#113_ret#81 := balanceOf#113(token#1203#79, __this, 0, call_arg#80);
	amount#1209#79 := balanceOf#113_ret#81;
	call_arg#82 := owner#261[__this];
	assume {:sourceloc "buggy_16.sol", 304, 16} {:message ""} true;
	call transfer#157_ret#83 := transfer#157(token#1203#79, __this, 0, call_arg#82, amount#1209#79);
	#1200 := transfer#157_ret#83;
	goto $return60;
	$return60:
	// Function body ends here
	$return59:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_16.sol", 306, 1} {:message "ExclusivePlatform::bug_unchk_send23"} bug_unchk_send23#1238(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#84: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#84 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 307, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#84);
	$return61:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_16.sol", 309, 3} {:message "ExclusivePlatform::bug_unchk_send27"} bug_unchk_send27#1251(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#85 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 310, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#85);
	$return62:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_16.sol", 312, 3} {:message "ExclusivePlatform::bug_unchk_send31"} bug_unchk_send31#1272(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#86: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#86 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 313, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#86);
	$return63:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_16.sol", 315, 3} {:message "ExclusivePlatform::bug_unchk_send13"} bug_unchk_send13#1293(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#87: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#87 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 316, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#87);
	$return64:
	// Function body ends here
}

