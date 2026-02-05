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
procedure {:inline 1} {:sourceloc "buggy_16.sol", 92, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#278(__this: address_t, __msg_sender: address_t, __msg_value: int, from#272: address_t, to#274: address_t, tokens#276: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_16.sol", 99, 3} {:message "[event] ERC20Interface::Approval"} Approval#310(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#304: address_t, spender#306: address_t, tokens#308: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 51, 5} {:message "ERC20Interface::totalSupply"} totalSupply#106(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#104: int);
	modifies payedOut_unchk33#281;

type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
procedure {:inline 1} {:message "call"} __call(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (__result: bool, __calldata: int_arr_ptr)
{
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	__result := true;
	}
	else {
	__result := false;
	}

}

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: callnotchecked_unchk1 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 52, 1} {:message "ERC20Interface::callnotchecked_unchk1"} callnotchecked_unchk1#120(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#108: address_t)
{
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 2000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 2000000000000000000)];
	assume {:sourceloc "buggy_16.sol", 53, 5} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(callee#108, __this, 2000000000000000000);
	if (__call_ret#0) {
	havoc payedOut_unchk33#281;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + 2000000000000000000)];
	}

	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 55, 5} {:message "ERC20Interface::balanceOf"} balanceOf#127(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#122: address_t)
	returns (balance#125: int);
	modifies payedOut_unchk33#281;

procedure {:inline 1} {:message "send"} __send(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
	returns (__result: bool)
{
	assume (__balance[__msg_sender] >= amount);
	// TODO: call fallback
	if (*) {
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	__result := true;
	}
	else {
	__result := false;
	}

}

// 
// Function: withdrawBal_unchk41 : function ()
procedure {:sourceloc "buggy_16.sol", 56, 1} {:message "ERC20Interface::withdrawBal_unchk41"} withdrawBal_unchk41#144(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 57, 2} {:message "Balances_unchk41"} Balances_unchk41#131: int;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk41#131 := 0;
	call_arg#2 := Balances_unchk41#131;
	assume {:sourceloc "buggy_16.sol", 58, 5} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, call_arg#2);
	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 59, 5} {:message "ERC20Interface::allowance"} allowance#153(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#146: address_t, spender#148: address_t)
	returns (remaining#151: int);
	modifies payedOut_unchk33#281;

// 
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_16.sol", 60, 1} {:message "ERC20Interface::bug_unchk42"} bug_unchk42#178(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 61, 1} {:message "receivers_unchk42"} receivers_unchk42#157: int;
	var {:sourceloc "buggy_16.sol", 62, 1} {:message "addr_unchk42"} addr_unchk42#160: address_t;
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#157 := 0;
	addr_unchk42#160 := 0;
	call_arg#4 := 42000000000000000000;
	assume {:sourceloc "buggy_16.sol", 63, 6} {:message ""} true;
	call __send_ret#5 := __send(addr_unchk42#160, __this, 0, call_arg#4);
	if (!(__send_ret#5)) {
	receivers_unchk42#157 := (receivers_unchk42#157 + 1);
	}
	else {
	assume false;
	}

	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 68, 5} {:message "ERC20Interface::transfer"} transfer#187(__this: address_t, __msg_sender: address_t, __msg_value: int, to#180: address_t, tokens#182: int)
	returns (success#185: bool);
	modifies payedOut_unchk33#281;

// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 69, 1} {:message "ERC20Interface::unhandledsend_unchk2"} unhandledsend_unchk2#199(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#189: address_t)
{
	var call_arg#6: int;
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#6 := 5000000000000000000;
	assume {:sourceloc "buggy_16.sol", 70, 5} {:message ""} true;
	call __send_ret#7 := __send(callee#189, __this, 0, call_arg#6);
	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 72, 5} {:message "ERC20Interface::approve"} approve#208(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#201: address_t, tokens#203: int)
	returns (success#206: bool);
	modifies payedOut_unchk33#281;

// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_16.sol", 73, 1} {:message "ERC20Interface::bug_unchk43"} bug_unchk43#229(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 74, 1} {:message "addr_unchk43"} addr_unchk43#212: address_t;
	var call_arg#8: int;
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#212 := 0;
	call_arg#8 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 75, 6} {:message ""} true;
	call __send_ret#9 := __send(addr_unchk43#212, __this, 0, call_arg#8);
	if ((!(__send_ret#9) || (1 == 1))) {
	assume false;
	}

	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 78, 5} {:message "ERC20Interface::transferFrom"} transferFrom#240(__this: address_t, __msg_sender: address_t, __msg_value: int, from#231: address_t, to#233: address_t, tokens#235: int)
	returns (success#238: bool);
	modifies payedOut_unchk33#281;

// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 79, 1} {:message "ERC20Interface::my_func_uncheck48"} my_func_uncheck48#255(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#242: address_t)
{
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_16.sol", 80, 5} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(dst#242, __this, __msg_value);
	if (__call_ret#10) {
	havoc payedOut_unchk33#281;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return9:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_16.sol", 83, 3} {:message "ERC20Interface::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#270(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 84, 4} {:message "addr_unchk40"} addr_unchk40#259: address_t;
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#259 := 0;
	call_arg#12 := 2000000000000000000;
	assume {:sourceloc "buggy_16.sol", 85, 10} {:message ""} true;
	call __send_ret#13 := __send(addr_unchk40#259, __this, 0, call_arg#12);
	if (!(__send_ret#13)) {
	
	}
	else {
	
	}

	$return10:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_16.sol", 93, 3} {:message "payedOut_unchk33"} payedOut_unchk33#281: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_16.sol", 95, 1} {:message "ERC20Interface::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#302(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#281[__this];
	assume {:sourceloc "buggy_16.sol", 97, 5} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_16.sol", 50, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#311(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk33#281 := payedOut_unchk33#281[__this := false];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_16.sol", 109, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#343(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#339: address_t, newOwner#341: address_t)
{
	
}

// 
// Function: bug_unchk15 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 104, 3} {:message "Owned::bug_unchk15"} bug_unchk15#323(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#313: address_t)
{
	var call_arg#15: int;
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#15 := 42000000000000000000;
	assume {:sourceloc "buggy_16.sol", 105, 8} {:message ""} true;
	call __send_ret#16 := __send(addr#313, __this, 0, call_arg#15);
	$return12:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_16.sol", 106, 3} {:message "owner"} owner#325: [address_t]address_t;
// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 107, 3} {:message "Owned::bug_unchk27"} bug_unchk27#337(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#327: address_t)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#17 := 42000000000000000000;
	assume {:sourceloc "buggy_16.sol", 108, 8} {:message ""} true;
	call __send_ret#18 := __send(addr#327, __this, 0, call_arg#17);
	$return13:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 115, 5} {:message "Owned::[constructor]"} __constructor#427(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#325 := owner#325[__this := 0];
	// Function body starts here
	owner#325 := owner#325[__this := __msg_sender];
	$return14:
	// Function body ends here
}

// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_16.sol", 118, 1} {:message "Owned::withdrawBal_unchk17"} withdrawBal_unchk17#373(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 119, 2} {:message "Balances_unchk17"} Balances_unchk17#360: int;
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#360 := 0;
	call_arg#19 := Balances_unchk17#360;
	assume {:sourceloc "buggy_16.sol", 120, 2} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, call_arg#19);
	$return15:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_16.sol", 134, 5} {:message "Owned::transferOwnership"} transferOwnership#412(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#388: address_t)
{
	var call_arg#23: address_t;
	var call_arg#24: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#325[__this]);
	// Function body starts here
	assume (newOwner#388 != 0);
	call_arg#23 := owner#325[__this];
	call_arg#24 := newOwner#388;
	assume {:sourceloc "buggy_16.sol", 136, 14} {:message ""} true;
	call OwnershipTransferred#343(__this, __msg_sender, __msg_value, call_arg#23, call_arg#24);
	owner#325 := owner#325[__this := newOwner#388];
	$return17:
	// Function body ends here
	$return16:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 139, 1} {:message "Owned::callnotchecked_unchk37"} callnotchecked_unchk37#426(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#414: address_t)
{
	var __call_ret#25: bool;
	var __call_ret#26: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_16.sol", 140, 5} {:message ""} true;
	call __call_ret#25, __call_ret#26 := __call(callee#414, __this, 1000000000000000000);
	if (__call_ret#25) {
	havoc owner#325;
	havoc __balance;
	}

	if (!(__call_ret#25)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return18:
	// Function body ends here
}

// 
// ------- Contract: ExclusivePlatform -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// 
// Event: TransferEther
procedure {:inline 1} {:sourceloc "buggy_16.sol", 444, 3} {:message "[event] ExclusivePlatform::TransferEther"} TransferEther#1589(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1583: address_t, _to#1585: address_t, _value#1587: int)
{
	
}

// 
// Event: NewPrice
procedure {:inline 1} {:sourceloc "buggy_16.sol", 451, 3} {:message "[event] ExclusivePlatform::NewPrice"} NewPrice#1621(__this: address_t, __msg_sender: address_t, __msg_value: int, _changer#1615: address_t, _lastPrice#1617: int, _newPrice#1619: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_16.sol", 455, 3} {:message "[event] ExclusivePlatform::Burn"} Burn#1641(__this: address_t, __msg_sender: address_t, __msg_value: int, _burner#1637: address_t, value#1639: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: UncheckedExternalCall_unchk28 : function ()
procedure {:sourceloc "buggy_16.sol", 149, 3} {:message "ExclusivePlatform::UncheckedExternalCall_unchk28"} UncheckedExternalCall_unchk28#449(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 150, 4} {:message "addr_unchk28"} addr_unchk28#438: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk28#438 := 0;
	call_arg#27 := 42000000000000000000;
	assume {:sourceloc "buggy_16.sol", 151, 10} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk28#438, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	
	}
	else {
	
	}

	$return19:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 158, 3} {:message "balances"} balances#453: [address_t][address_t]int;
// 
// Function: cash_unchk34 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_16.sol", 159, 3} {:message "ExclusivePlatform::cash_unchk34"} cash_unchk34#477(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#455: int, subpotIndex#457: int, winner_unchk34#459: address_t)
{
	var {:sourceloc "buggy_16.sol", 160, 9} {:message "subpot_unchk34"} subpot_unchk34#463: int;
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk34#463 := 10000000000000000000;
	call_arg#29 := subpot_unchk34#463;
	assume {:sourceloc "buggy_16.sol", 161, 9} {:message ""} true;
	call __send_ret#30 := __send(winner_unchk34#459, __this, 0, call_arg#29);
	subpot_unchk34#463 := 0;
	$return20:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_16.sol", 164, 3} {:message "allowed"} allowed#483: [address_t][address_t][address_t]int;
// 
// State variable: payedOut_unchk21: bool
var {:sourceloc "buggy_16.sol", 166, 3} {:message "payedOut_unchk21"} payedOut_unchk21#486: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk21 : function ()
procedure {:sourceloc "buggy_16.sol", 168, 1} {:message "ExclusivePlatform::withdrawLeftOver_unchk21"} withdrawLeftOver_unchk21#507(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk21#486[__this];
	assume {:sourceloc "buggy_16.sol", 170, 5} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return21:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_16.sol", 172, 3} {:message "name"} name#510: [address_t]int_arr_type;
// 
// Function: cash_unchk10 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_16.sol", 173, 3} {:message "ExclusivePlatform::cash_unchk10"} cash_unchk10#534(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#512: int, subpotIndex#514: int, winner_unchk10#516: address_t)
{
	var {:sourceloc "buggy_16.sol", 174, 9} {:message "subpot_unchk10"} subpot_unchk10#520: int;
	var call_arg#32: int;
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk10#520 := 10000000000000000000;
	call_arg#32 := subpot_unchk10#520;
	assume {:sourceloc "buggy_16.sol", 175, 9} {:message ""} true;
	call __send_ret#33 := __send(winner_unchk10#516, __this, 0, call_arg#32);
	subpot_unchk10#520 := 0;
	$return22:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_16.sol", 178, 3} {:message "symbol"} symbol#537: [address_t]int_arr_type;
// 
// Function: my_func_unchk47 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 179, 3} {:message "ExclusivePlatform::my_func_unchk47"} my_func_unchk47#550(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#539: address_t)
{
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 180, 9} {:message ""} true;
	call __send_ret#34 := __send(dst#539, __this, 0, __msg_value);
	$return23:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_16.sol", 182, 3} {:message "decimals"} decimals#553: [address_t]int;
// 
// Function: cash_unchk22 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_16.sol", 183, 3} {:message "ExclusivePlatform::cash_unchk22"} cash_unchk22#577(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#555: int, subpotIndex#557: int, winner_unchk22#559: address_t)
{
	var {:sourceloc "buggy_16.sol", 184, 9} {:message "subpot_unchk22"} subpot_unchk22#563: int;
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk22#563 := 10000000000000000000;
	call_arg#35 := subpot_unchk22#563;
	assume {:sourceloc "buggy_16.sol", 185, 9} {:message ""} true;
	call __send_ret#36 := __send(winner_unchk22#559, __this, 0, call_arg#35);
	subpot_unchk22#563 := 0;
	$return24:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_16.sol", 188, 3} {:message "_totalSupply"} _totalSupply#579: [address_t]int;
// 
// Function: my_func_uncheck12 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 190, 3} {:message "ExclusivePlatform::my_func_uncheck12"} my_func_uncheck12#594(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#581: address_t)
{
	var __call_ret#37: bool;
	var __call_ret#38: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_16.sol", 191, 7} {:message ""} true;
	call __call_ret#37, __call_ret#38 := __call(dst#581, __this, __msg_value);
	if (__call_ret#37) {
	havoc balances#453;
	havoc allowed#483;
	havoc payedOut_unchk21#486;
	havoc name#510;
	havoc symbol#537;
	havoc decimals#553;
	havoc _totalSupply#579;
	havoc XPLPerEther#597;
	havoc minimumBuy#602;
	havoc crowdsaleIsOn#618;
	havoc payedOut_unchk9#681;
	havoc payedOut_unchk20#867;
	havoc winner_unchk20#869;
	havoc winAmount_unchk20#871;
	havoc payedOut_unchk32#922;
	havoc winner_unchk32#924;
	havoc winAmount_unchk32#926;
	havoc payedOut_unchk8#1349;
	havoc winner_unchk8#1351;
	havoc winAmount_unchk8#1353;
	havoc payedOut_unchk44#1537;
	havoc winner_unchk44#1539;
	havoc winAmount_unchk44#1541;
	havoc payedOut_unchk45#1592;
	havoc owner#325;
	havoc payedOut_unchk33#281;
	havoc __balance;
	}

	if (!(__call_ret#37)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return25:
	// Function body ends here
}

// 
// State variable: XPLPerEther: uint256
var {:sourceloc "buggy_16.sol", 193, 3} {:message "XPLPerEther"} XPLPerEther#597: [address_t]int;
// 
// State variable: minimumBuy: uint256
var {:sourceloc "buggy_16.sol", 194, 5} {:message "minimumBuy"} minimumBuy#602: [address_t]int;
// 
// Function: my_func_unchk11 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 195, 3} {:message "ExclusivePlatform::my_func_unchk11"} my_func_unchk11#615(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#604: address_t)
{
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 196, 9} {:message ""} true;
	call __send_ret#39 := __send(dst#604, __this, 0, __msg_value);
	$return26:
	// Function body ends here
}

// 
// State variable: crowdsaleIsOn: bool
var {:sourceloc "buggy_16.sol", 198, 3} {:message "crowdsaleIsOn"} crowdsaleIsOn#618: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 207, 5} {:message "ExclusivePlatform::[constructor]"} __constructor#1642(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: address_t;
	var call_arg#42: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances#453 := balances#453[__this := default_address_t_int()];
	allowed#483 := allowed#483[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk21#486 := payedOut_unchk21#486[__this := false];
	name#510 := name#510[__this := int_arr#constr(default_int_int()[0 := 69][1 := 120][2 := 99][3 := 108][4 := 117][5 := 115][6 := 105][7 := 118][8 := 101][9 := 32][10 := 80][11 := 108][12 := 97][13 := 116][14 := 102][15 := 111][16 := 114][17 := 109], 18)];
	symbol#537 := symbol#537[__this := int_arr#constr(default_int_int()[0 := 88][1 := 80][2 := 76], 3)];
	decimals#553 := decimals#553[__this := 8];
	_totalSupply#579 := _totalSupply#579[__this := 0];
	XPLPerEther#597 := XPLPerEther#597[__this := 800000000000000];
	minimumBuy#602 := minimumBuy#602[__this := 10000000000000000];
	crowdsaleIsOn#618 := crowdsaleIsOn#618[__this := true];
	payedOut_unchk9#681 := payedOut_unchk9#681[__this := false];
	payedOut_unchk20#867 := payedOut_unchk20#867[__this := false];
	winner_unchk20#869 := winner_unchk20#869[__this := 0];
	winAmount_unchk20#871 := winAmount_unchk20#871[__this := 0];
	payedOut_unchk32#922 := payedOut_unchk32#922[__this := false];
	winner_unchk32#924 := winner_unchk32#924[__this := 0];
	winAmount_unchk32#926 := winAmount_unchk32#926[__this := 0];
	payedOut_unchk8#1349 := payedOut_unchk8#1349[__this := false];
	winner_unchk8#1351 := winner_unchk8#1351[__this := 0];
	winAmount_unchk8#1353 := winAmount_unchk8#1353[__this := 0];
	payedOut_unchk44#1537 := payedOut_unchk44#1537[__this := false];
	winner_unchk44#1539 := winner_unchk44#1539[__this := 0];
	winAmount_unchk44#1541 := winAmount_unchk44#1541[__this := 0];
	payedOut_unchk45#1592 := payedOut_unchk45#1592[__this := false];
	owner#325 := owner#325[__this := 0];
	payedOut_unchk33#281 := payedOut_unchk33#281[__this := false];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#325 := owner#325[__this := __msg_sender];
	$return27:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	_totalSupply#579 := _totalSupply#579[__this := 1000000000000000000];
	balances#453 := balances#453[__this := balances#453[__this][owner#325[__this] := _totalSupply#579[__this]]];
	call_arg#41 := 0;
	call_arg#42 := owner#325[__this];
	assume {:sourceloc "buggy_16.sol", 210, 14} {:message ""} true;
	call Transfer#278(__this, __msg_sender, __msg_value, call_arg#41, call_arg#42, _totalSupply#579[__this]);
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 212, 1} {:message "ExclusivePlatform::bug_unchk3"} bug_unchk3#669(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#659: address_t)
{
	var call_arg#43: int;
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#43 := 42000000000000000000;
	assume {:sourceloc "buggy_16.sol", 213, 8} {:message ""} true;
	call __send_ret#44 := __send(addr#659, __this, 0, call_arg#43);
	$return29:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 215, 5} {:message "ExclusivePlatform::totalSupply"} totalSupply#678(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#673: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#673 := _totalSupply#579[__this];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_16.sol", 218, 1} {:message "payedOut_unchk9"} payedOut_unchk9#681: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_16.sol", 220, 1} {:message "ExclusivePlatform::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#702(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#681[__this];
	assume {:sourceloc "buggy_16.sol", 222, 5} {:message ""} true;
	call __send_ret#45 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return31:
	// Function body ends here
}

// 
// Function: updateXPLPerEther : function (uint256)
procedure {:sourceloc "buggy_16.sol", 225, 5} {:message "ExclusivePlatform::updateXPLPerEther"} updateXPLPerEther#720(__this: address_t, __msg_sender: address_t, __msg_value: int, _XPLPerEther#704: int)
{
	var call_arg#48: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#325[__this]);
	// Function body starts here
	call_arg#48 := owner#325[__this];
	assume {:sourceloc "buggy_16.sol", 226, 14} {:message ""} true;
	call NewPrice#1621(__this, __msg_sender, __msg_value, call_arg#48, XPLPerEther#597[__this], _XPLPerEther#704);
	XPLPerEther#597 := XPLPerEther#597[__this := _XPLPerEther#704];
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 229, 1} {:message "ExclusivePlatform::callnotchecked_unchk25"} callnotchecked_unchk25#734(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#722: address_t)
{
	var __call_ret#49: bool;
	var __call_ret#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_16.sol", 230, 5} {:message ""} true;
	call __call_ret#49, __call_ret#50 := __call(callee#722, __this, 1000000000000000000);
	if (__call_ret#49) {
	havoc balances#453;
	havoc allowed#483;
	havoc payedOut_unchk21#486;
	havoc name#510;
	havoc symbol#537;
	havoc decimals#553;
	havoc _totalSupply#579;
	havoc XPLPerEther#597;
	havoc minimumBuy#602;
	havoc crowdsaleIsOn#618;
	havoc payedOut_unchk9#681;
	havoc payedOut_unchk20#867;
	havoc winner_unchk20#869;
	havoc winAmount_unchk20#871;
	havoc payedOut_unchk32#922;
	havoc winner_unchk32#924;
	havoc winAmount_unchk32#926;
	havoc payedOut_unchk8#1349;
	havoc winner_unchk8#1351;
	havoc winAmount_unchk8#1353;
	havoc payedOut_unchk44#1537;
	havoc winner_unchk44#1539;
	havoc winAmount_unchk44#1541;
	havoc payedOut_unchk45#1592;
	havoc owner#325;
	havoc payedOut_unchk33#281;
	havoc __balance;
	}

	if (!(__call_ret#49)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return34:
	// Function body ends here
}

// 
// Function: switchCrowdsale : function ()
procedure {:sourceloc "buggy_16.sol", 233, 5} {:message "ExclusivePlatform::switchCrowdsale"} switchCrowdsale#746(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#325[__this]);
	// Function body starts here
	crowdsaleIsOn#618 := crowdsaleIsOn#618[__this := !(crowdsaleIsOn#618[__this])];
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_16.sol", 236, 1} {:message "ExclusivePlatform::bug_unchk19"} bug_unchk19#767(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 237, 1} {:message "addr_unchk19"} addr_unchk19#750: address_t;
	var call_arg#53: int;
	var __send_ret#54: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#750 := 0;
	call_arg#53 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 238, 6} {:message ""} true;
	call __send_ret#54 := __send(addr_unchk19#750, __this, 0, call_arg#53);
	if ((!(__send_ret#54) || (1 == 1))) {
	assume false;
	}

	$return37:
	// Function body ends here
}

// 
// Function: getBonus : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 242, 5} {:message "ExclusivePlatform::getBonus"} getBonus#814(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#769: int)
	returns (#772: int)
{
	var call_arg#55: int;
	var mul#31_ret#56: int;
	var call_arg#57: int;
	var div#54_ret#58: int;
	var add#100_ret#59: int;
	var call_arg#60: int;
	var div#54_ret#61: int;
	var add#100_ret#62: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#55 := 5;
	assume {:sourceloc "buggy_16.sol", 243, 24} {:message ""} true;
	call mul#31_ret#56 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#597[__this], call_arg#55);
	if ((_amount#769 >= mul#31_ret#56)) {
	call_arg#57 := 100;
	assume {:sourceloc "buggy_16.sol", 247, 21} {:message ""} true;
	call div#54_ret#58 := div#54(__this, __msg_sender, __msg_value, (20 * _amount#769), call_arg#57);
	assume {:sourceloc "buggy_16.sol", 247, 20} {:message ""} true;
	call add#100_ret#59 := add#100(__this, __msg_sender, __msg_value, div#54_ret#58, _amount#769);
	#772 := add#100_ret#59;
	goto $return38;
	}
	else {
	if ((_amount#769 >= XPLPerEther#597[__this])) {
	call_arg#60 := 100;
	assume {:sourceloc "buggy_16.sol", 252, 21} {:message ""} true;
	call div#54_ret#61 := div#54(__this, __msg_sender, __msg_value, (5 * _amount#769), call_arg#60);
	assume {:sourceloc "buggy_16.sol", 252, 20} {:message ""} true;
	call add#100_ret#62 := add#100(__this, __msg_sender, __msg_value, div#54_ret#61, _amount#769);
	#772 := add#100_ret#62;
	goto $return38;
	}

	}

	#772 := _amount#769;
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 256, 1} {:message "ExclusivePlatform::unhandledsend_unchk26"} unhandledsend_unchk26#826(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#816: address_t)
{
	var call_arg#63: int;
	var __send_ret#64: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#63 := 5000000000000000000;
	assume {:sourceloc "buggy_16.sol", 257, 5} {:message ""} true;
	call __send_ret#64 := __send(callee#816, __this, 0, call_arg#63);
	$return39:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 260, 5} {:message "ExclusivePlatform::[receive]"} #864(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 263, 9} {:message "totalBuy"} totalBuy#839: int;
	var mul#31_ret#65: int;
	var call_arg#66: int;
	var div#54_ret#67: int;
	var getBonus#814_ret#68: int;
	var call_arg#69: address_t;
	var call_arg#70: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (crowdsaleIsOn#618[__this] && (__msg_value >= minimumBuy#602[__this]));
	assume {:sourceloc "buggy_16.sol", 263, 30} {:message ""} true;
	call mul#31_ret#65 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#597[__this], __msg_value);
	call_arg#66 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 263, 29} {:message ""} true;
	call div#54_ret#67 := div#54(__this, __msg_sender, __msg_value, mul#31_ret#65, call_arg#66);
	totalBuy#839 := div#54_ret#67;
	assume {:sourceloc "buggy_16.sol", 264, 20} {:message ""} true;
	call getBonus#814_ret#68 := getBonus#814(__this, __msg_sender, __msg_value, totalBuy#839);
	totalBuy#839 := getBonus#814_ret#68;
	call_arg#69 := owner#325[__this];
	call_arg#70 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 266, 9} {:message ""} true;
	call doTransfer#1054(__this, __msg_sender, __msg_value, call_arg#69, call_arg#70, totalBuy#839);
	$return40:
	// Function body ends here
}

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_16.sol", 268, 1} {:message "payedOut_unchk20"} payedOut_unchk20#867: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_16.sol", 269, 1} {:message "winner_unchk20"} winner_unchk20#869: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_16.sol", 270, 1} {:message "winAmount_unchk20"} winAmount_unchk20#871: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_16.sol", 272, 1} {:message "ExclusivePlatform::sendToWinner_unchk20"} sendToWinner_unchk20#890(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#71: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#867[__this]);
	assume {:sourceloc "buggy_16.sol", 274, 9} {:message ""} true;
	call __send_ret#71 := __send(winner_unchk20#869[__this], __this, 0, winAmount_unchk20#871[__this]);
	payedOut_unchk20#867 := payedOut_unchk20#867[__this := true];
	$return41:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: distribute
procedure {:sourceloc "buggy_16.sol", 278, 5} {:message "ExclusivePlatform::distribute"} distribute#919(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#893: address_t_arr_ptr, _amount#895: int)
{
	var {:sourceloc "buggy_16.sol", 279, 14} {:message "i"} i#899: int;
	var transfer#1126_ret#74: bool;
	var tmp#75: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#899 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#893])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#893]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#899 < length#address_t_arr#constr(mem_arr_address_t[_addresses#893]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 279, 55} {:message ""} true;
	call transfer#1126_ret#74 := transfer#1126(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#893])[i#899], _amount#895);
	$continue72:
	// Loop expression
	tmp#75 := i#899;
	i#899 := (i#899 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#893])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#893]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break73:
	$return42:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_16.sol", 281, 1} {:message "payedOut_unchk32"} payedOut_unchk32#922: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_16.sol", 282, 1} {:message "winner_unchk32"} winner_unchk32#924: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_16.sol", 283, 1} {:message "winAmount_unchk32"} winAmount_unchk32#926: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_16.sol", 285, 1} {:message "ExclusivePlatform::sendToWinner_unchk32"} sendToWinner_unchk32#945(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#76: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#922[__this]);
	assume {:sourceloc "buggy_16.sol", 287, 9} {:message ""} true;
	call __send_ret#76 := __send(winner_unchk32#924[__this], __this, 0, winAmount_unchk32#926[__this]);
	payedOut_unchk32#922 := payedOut_unchk32#922[__this := true];
	$return43:
	// Function body ends here
}

// 
// Function: distributeWithAmount
procedure {:sourceloc "buggy_16.sol", 291, 5} {:message "ExclusivePlatform::distributeWithAmount"} distributeWithAmount#985(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#948: address_t_arr_ptr, _amounts#951: int_arr_ptr)
{
	var {:sourceloc "buggy_16.sol", 293, 14} {:message "i"} i#963: int;
	var transfer#1126_ret#79: bool;
	var tmp#80: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#948])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#948]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_amounts#951])) && (length#int_arr#constr(mem_arr_int[_amounts#951]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_addresses#948]) == length#int_arr#constr(mem_arr_int[_amounts#951]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#963 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#948])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#948]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#963 < length#address_t_arr#constr(mem_arr_address_t[_addresses#948]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 293, 55} {:message ""} true;
	call transfer#1126_ret#79 := transfer#1126(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#948])[i#963], arr#int_arr#constr(mem_arr_int[_amounts#951])[i#963]);
	$continue77:
	// Loop expression
	tmp#80 := i#963;
	i#963 := (i#963 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#948])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#948]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break78:
	$return44:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 295, 1} {:message "ExclusivePlatform::unhandledsend_unchk38"} unhandledsend_unchk38#997(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#987: address_t)
{
	var call_arg#81: int;
	var __send_ret#82: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#81 := 5000000000000000000;
	assume {:sourceloc "buggy_16.sol", 296, 5} {:message ""} true;
	call __send_ret#82 := __send(callee#987, __this, 0, call_arg#81);
	$return45:
	// Function body ends here
}

// 
// Function: doTransfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 303, 5} {:message "ExclusivePlatform::doTransfer"} doTransfer#1054(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1000: address_t, _to#1002: address_t, _amount#1004: int)
{
	var sub#77_ret#83: int;
	var add#100_ret#84: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1002 != 0);
	assume (_amount#1004 <= balances#453[__this][_from#1000]);
	assume {:sourceloc "buggy_16.sol", 307, 27} {:message ""} true;
	call sub#77_ret#83 := sub#77(__this, __msg_sender, __msg_value, balances#453[__this][_from#1000], _amount#1004);
	balances#453 := balances#453[__this := balances#453[__this][_from#1000 := sub#77_ret#83]];
	assume {:sourceloc "buggy_16.sol", 308, 25} {:message ""} true;
	call add#100_ret#84 := add#100(__this, __msg_sender, __msg_value, balances#453[__this][_to#1002], _amount#1004);
	balances#453 := balances#453[__this := balances#453[__this][_to#1002 := add#100_ret#84]];
	assume {:sourceloc "buggy_16.sol", 309, 14} {:message ""} true;
	call Transfer#278(__this, __msg_sender, __msg_value, _from#1000, _to#1002, _amount#1004);
	$return46:
	// Function body ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_16.sol", 311, 1} {:message "ExclusivePlatform::cash_unchk46"} cash_unchk46#1078(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#1056: int, subpotIndex#1058: int, winner_unchk46#1060: address_t)
{
	var {:sourceloc "buggy_16.sol", 312, 9} {:message "subpot_unchk46"} subpot_unchk46#1064: int;
	var call_arg#85: int;
	var __send_ret#86: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#1064 := 3000000000000000000;
	call_arg#85 := subpot_unchk46#1064;
	assume {:sourceloc "buggy_16.sol", 313, 9} {:message ""} true;
	call __send_ret#86 := __send(winner_unchk46#1060, __this, 0, call_arg#85);
	subpot_unchk46#1064 := 0;
	$return47:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 317, 5} {:message "ExclusivePlatform::balanceOf"} balanceOf#1091(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#1080: address_t)
	returns (#1084: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1084 := balances#453[__this][_owner#1080];
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_16.sol", 320, 1} {:message "ExclusivePlatform::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#1106(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 321, 4} {:message "addr_unchk4"} addr_unchk4#1095: address_t;
	var call_arg#87: int;
	var __send_ret#88: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#1095 := 0;
	call_arg#87 := 42000000000000000000;
	assume {:sourceloc "buggy_16.sol", 322, 10} {:message ""} true;
	call __send_ret#88 := __send(addr_unchk4#1095, __this, 0, call_arg#87);
	if (!(__send_ret#88)) {
	
	}
	else {
	
	}

	$return49:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 330, 5} {:message "ExclusivePlatform::transfer"} transfer#1126(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1108: address_t, _amount#1110: int)
	returns (success#1114: bool)
{
	var call_arg#89: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#89 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 331, 9} {:message ""} true;
	call doTransfer#1054(__this, __msg_sender, __msg_value, call_arg#89, _to#1108, _amount#1110);
	success#1114 := true;
	goto $return50;
	$return50:
	// Function body ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_16.sol", 334, 1} {:message "ExclusivePlatform::bug_unchk7"} bug_unchk7#1147(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 335, 1} {:message "addr_unchk7"} addr_unchk7#1130: address_t;
	var call_arg#90: int;
	var __send_ret#91: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#1130 := 0;
	call_arg#90 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 336, 6} {:message ""} true;
	call __send_ret#91 := __send(addr_unchk7#1130, __this, 0, call_arg#90);
	if ((!(__send_ret#91) || (1 == 1))) {
	assume false;
	}

	$return51:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 340, 5} {:message "ExclusivePlatform::transferFrom"} transferFrom#1197(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1150: address_t, _to#1152: address_t, _amount#1154: int)
	returns (success#1158: bool)
{
	var sub#77_ret#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#483[__this][_from#1150][__msg_sender] >= _amount#1154);
	assume {:sourceloc "buggy_16.sol", 342, 38} {:message ""} true;
	call sub#77_ret#92 := sub#77(__this, __msg_sender, __msg_value, allowed#483[__this][_from#1150][__msg_sender], _amount#1154);
	allowed#483 := allowed#483[__this := allowed#483[__this][_from#1150 := allowed#483[__this][_from#1150][__msg_sender := sub#77_ret#92]]];
	assume {:sourceloc "buggy_16.sol", 343, 9} {:message ""} true;
	call doTransfer#1054(__this, __msg_sender, __msg_value, _from#1150, _to#1152, _amount#1154);
	success#1158 := true;
	goto $return52;
	$return52:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 346, 1} {:message "ExclusivePlatform::my_func_unchk23"} my_func_unchk23#1210(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1199: address_t)
{
	var __send_ret#93: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 347, 9} {:message ""} true;
	call __send_ret#93 := __send(dst#1199, __this, 0, __msg_value);
	$return53:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 355, 5} {:message "ExclusivePlatform::approve"} approve#1257(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#1213: address_t, _amount#1215: int)
	returns (success#1219: bool)
{
	var call_arg#94: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((_amount#1215 == 0) || (allowed#483[__this][__msg_sender][_spender#1213] == 0));
	allowed#483 := allowed#483[__this := allowed#483[__this][__msg_sender := allowed#483[__this][__msg_sender][_spender#1213 := _amount#1215]]];
	call_arg#94 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 362, 14} {:message ""} true;
	call Approval#310(__this, __msg_sender, __msg_value, call_arg#94, _spender#1213, _amount#1215);
	success#1219 := true;
	goto $return54;
	$return54:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 365, 1} {:message "ExclusivePlatform::unhandledsend_unchk14"} unhandledsend_unchk14#1269(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1259: address_t)
{
	var call_arg#95: int;
	var __send_ret#96: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#95 := 5000000000000000000;
	assume {:sourceloc "buggy_16.sol", 366, 5} {:message ""} true;
	call __send_ret#96 := __send(callee#1259, __this, 0, call_arg#95);
	$return55:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 369, 5} {:message "ExclusivePlatform::allowance"} allowance#1286(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#1271: address_t, _spender#1273: address_t)
	returns (#1277: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1277 := allowed#483[__this][_owner#1271][_spender#1273];
	goto $return56;
	$return56:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_16.sol", 372, 1} {:message "ExclusivePlatform::bug_unchk30"} bug_unchk30#1311(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 373, 1} {:message "receivers_unchk30"} receivers_unchk30#1290: int;
	var {:sourceloc "buggy_16.sol", 374, 1} {:message "addr_unchk30"} addr_unchk30#1293: address_t;
	var call_arg#97: int;
	var __send_ret#98: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#1290 := 0;
	addr_unchk30#1293 := 0;
	call_arg#97 := 42000000000000000000;
	assume {:sourceloc "buggy_16.sol", 375, 6} {:message ""} true;
	call __send_ret#98 := __send(addr_unchk30#1293, __this, 0, call_arg#97);
	if (!(__send_ret#98)) {
	receivers_unchk30#1290 := (receivers_unchk30#1290 + 1);
	}
	else {
	assume false;
	}

	$return57:
	// Function body ends here
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: transferEther : function (address payable,uint256)
procedure {:sourceloc "buggy_16.sol", 381, 5} {:message "ExclusivePlatform::transferEther"} transferEther#1346(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#1313: address_t, _amount#1315: int)
{
	var call_arg#101: address_t;
	var call_arg#102: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#325[__this]);
	// Function body starts here
	assume (_amount#1315 <= __balance[__this]);
	call_arg#101 := __this;
	call_arg#102 := _receiver#1313;
	assume {:sourceloc "buggy_16.sol", 383, 14} {:message ""} true;
	call TransferEther#1589(__this, __msg_sender, __msg_value, call_arg#101, call_arg#102, _amount#1315);
	assume {:sourceloc "buggy_16.sol", 384, 9} {:message ""} true;
	call __transfer(_receiver#1313, __this, 0, _amount#1315);
	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_16.sol", 386, 1} {:message "payedOut_unchk8"} payedOut_unchk8#1349: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_16.sol", 387, 1} {:message "winner_unchk8"} winner_unchk8#1351: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_16.sol", 388, 1} {:message "winAmount_unchk8"} winAmount_unchk8#1353: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_16.sol", 390, 1} {:message "ExclusivePlatform::sendToWinner_unchk8"} sendToWinner_unchk8#1372(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#103: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#1349[__this]);
	assume {:sourceloc "buggy_16.sol", 392, 9} {:message ""} true;
	call __send_ret#103 := __send(winner_unchk8#1351[__this], __this, 0, winAmount_unchk8#1353[__this]);
	payedOut_unchk8#1349 := payedOut_unchk8#1349[__this := true];
	$return60:
	// Function body ends here
}

// 
// Function: withdrawFund : function ()
procedure {:sourceloc "buggy_16.sol", 396, 5} {:message "ExclusivePlatform::withdrawFund"} withdrawFund#1392(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 397, 9} {:message "balance"} balance#1378#105: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#325[__this]);
	// Function body starts here
	balance#1378#105 := __balance[__this];
	assume {:sourceloc "buggy_16.sol", 398, 9} {:message ""} true;
	call __transfer(owner#325[__this], __this, 0, balance#1378#105);
	$return62:
	// Function body ends here
	$return61:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 400, 1} {:message "ExclusivePlatform::bug_unchk39"} bug_unchk39#1404(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#1394: address_t)
{
	var call_arg#106: int;
	var __send_ret#107: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#106 := 4000000000000000000;
	assume {:sourceloc "buggy_16.sol", 401, 8} {:message ""} true;
	call __send_ret#107 := __send(addr#1394, __this, 0, call_arg#106);
	$return63:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_16.sol", 403, 5} {:message "ExclusivePlatform::burn"} burn#1449(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#1406: int)
{
	var {:sourceloc "buggy_16.sol", 405, 9} {:message "burner"} burner#1421#109: address_t;
	var sub#77_ret#110: int;
	var sub#77_ret#111: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#325[__this]);
	// Function body starts here
	assume (_value#1406 <= balances#453[__this][__msg_sender]);
	burner#1421#109 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 406, 28} {:message ""} true;
	call sub#77_ret#110 := sub#77(__this, __msg_sender, __msg_value, balances#453[__this][burner#1421#109], _value#1406);
	balances#453 := balances#453[__this := balances#453[__this][burner#1421#109 := sub#77_ret#110]];
	assume {:sourceloc "buggy_16.sol", 407, 24} {:message ""} true;
	call sub#77_ret#111 := sub#77(__this, __msg_sender, __msg_value, _totalSupply#579[__this], _value#1406);
	_totalSupply#579 := _totalSupply#579[__this := sub#77_ret#111];
	assume {:sourceloc "buggy_16.sol", 408, 14} {:message ""} true;
	call Burn#1641(__this, __msg_sender, __msg_value, burner#1421#109, _value#1406);
	$return65:
	// Function body ends here
	$return64:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 410, 1} {:message "ExclusivePlatform::my_func_uncheck36"} my_func_uncheck36#1464(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1451: address_t)
{
	var __call_ret#112: bool;
	var __call_ret#113: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_16.sol", 411, 5} {:message ""} true;
	call __call_ret#112, __call_ret#113 := __call(dst#1451, __this, __msg_value);
	if (__call_ret#112) {
	havoc balances#453;
	havoc allowed#483;
	havoc payedOut_unchk21#486;
	havoc name#510;
	havoc symbol#537;
	havoc decimals#553;
	havoc _totalSupply#579;
	havoc XPLPerEther#597;
	havoc minimumBuy#602;
	havoc crowdsaleIsOn#618;
	havoc payedOut_unchk9#681;
	havoc payedOut_unchk20#867;
	havoc winner_unchk20#869;
	havoc winAmount_unchk20#871;
	havoc payedOut_unchk32#922;
	havoc winner_unchk32#924;
	havoc winAmount_unchk32#926;
	havoc payedOut_unchk8#1349;
	havoc winner_unchk8#1351;
	havoc winAmount_unchk8#1353;
	havoc payedOut_unchk44#1537;
	havoc winner_unchk44#1539;
	havoc winAmount_unchk44#1541;
	havoc payedOut_unchk45#1592;
	havoc owner#325;
	havoc payedOut_unchk33#281;
	havoc __balance;
	}

	if (!(__call_ret#112)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return66:
	// Function body ends here
}

// 
// Function: getForeignTokenBalance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 415, 5} {:message "ExclusivePlatform::getForeignTokenBalance"} getForeignTokenBalance#1489(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1466: address_t, who#1468: address_t)
	returns (#1471: int)
{
	var {:sourceloc "buggy_16.sol", 416, 9} {:message "token"} token#1474: address_t;
	var {:sourceloc "buggy_16.sol", 417, 9} {:message "bal"} bal#1480: int;
	var balanceOf#127_ret#114: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	token#1474 := tokenAddress#1466;
	assume {:sourceloc "buggy_16.sol", 417, 20} {:message ""} true;
	call balanceOf#127_ret#114 := balanceOf#127(token#1474, __this, 0, who#1468);
	bal#1480 := balanceOf#127_ret#114;
	#1471 := bal#1480;
	goto $return67;
	$return67:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_16.sol", 420, 1} {:message "ExclusivePlatform::my_func_unchk35"} my_func_unchk35#1502(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1491: address_t)
{
	var __send_ret#115: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_16.sol", 421, 9} {:message ""} true;
	call __send_ret#115 := __send(dst#1491, __this, 0, __msg_value);
	$return68:
	// Function body ends here
}

// 
// Function: withdrawForeignTokens : function (address) returns (bool)
procedure {:sourceloc "buggy_16.sol", 424, 5} {:message "ExclusivePlatform::withdrawForeignTokens"} withdrawForeignTokens#1534(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1504: address_t)
	returns (#1509: bool)
{
	var {:sourceloc "buggy_16.sol", 425, 9} {:message "token"} token#1512#117: address_t;
	var {:sourceloc "buggy_16.sol", 426, 9} {:message "amount"} amount#1518#117: int;
	var call_arg#118: address_t;
	var balanceOf#127_ret#119: int;
	var call_arg#120: address_t;
	var transfer#187_ret#121: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#325[__this]);
	// Function body starts here
	token#1512#117 := tokenAddress#1504;
	call_arg#118 := __this;
	assume {:sourceloc "buggy_16.sol", 426, 26} {:message ""} true;
	call balanceOf#127_ret#119 := balanceOf#127(token#1512#117, __this, 0, call_arg#118);
	amount#1518#117 := balanceOf#127_ret#119;
	call_arg#120 := owner#325[__this];
	assume {:sourceloc "buggy_16.sol", 427, 16} {:message ""} true;
	call transfer#187_ret#121 := transfer#187(token#1512#117, __this, 0, call_arg#120, amount#1518#117);
	#1509 := transfer#187_ret#121;
	goto $return70;
	$return70:
	// Function body ends here
	$return69:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_16.sol", 429, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1537: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_16.sol", 430, 1} {:message "winner_unchk44"} winner_unchk44#1539: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_16.sol", 431, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1541: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_16.sol", 433, 1} {:message "ExclusivePlatform::sendToWinner_unchk44"} sendToWinner_unchk44#1560(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#122: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1537[__this]);
	assume {:sourceloc "buggy_16.sol", 435, 9} {:message ""} true;
	call __send_ret#122 := __send(winner_unchk44#1539[__this], __this, 0, winAmount_unchk44#1541[__this]);
	payedOut_unchk44#1537 := payedOut_unchk44#1537[__this := true];
	$return71:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_16.sol", 439, 3} {:message "ExclusivePlatform::bug_unchk31"} bug_unchk31#1581(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 440, 1} {:message "addr_unchk31"} addr_unchk31#1564: address_t;
	var call_arg#123: int;
	var __send_ret#124: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#1564 := 0;
	call_arg#123 := 10000000000000000000;
	assume {:sourceloc "buggy_16.sol", 441, 6} {:message ""} true;
	call __send_ret#124 := __send(addr_unchk31#1564, __this, 0, call_arg#123);
	if ((!(__send_ret#124) || (1 == 1))) {
	assume false;
	}

	$return72:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_16.sol", 445, 3} {:message "payedOut_unchk45"} payedOut_unchk45#1592: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_16.sol", 447, 1} {:message "ExclusivePlatform::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#1613(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#125: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#1592[__this];
	assume {:sourceloc "buggy_16.sol", 449, 5} {:message ""} true;
	call __send_ret#125 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return73:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_16.sol", 452, 3} {:message "ExclusivePlatform::callnotchecked_unchk13"} callnotchecked_unchk13#1635(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#1623: address_t)
{
	var __call_ret#126: bool;
	var __call_ret#127: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_16.sol", 453, 9} {:message ""} true;
	call __call_ret#126, __call_ret#127 := __call(callee#1623, __this, 1000000000000000000);
	if (__call_ret#126) {
	havoc balances#453;
	havoc allowed#483;
	havoc payedOut_unchk21#486;
	havoc name#510;
	havoc symbol#537;
	havoc decimals#553;
	havoc _totalSupply#579;
	havoc XPLPerEther#597;
	havoc minimumBuy#602;
	havoc crowdsaleIsOn#618;
	havoc payedOut_unchk9#681;
	havoc payedOut_unchk20#867;
	havoc winner_unchk20#869;
	havoc winAmount_unchk20#871;
	havoc payedOut_unchk32#922;
	havoc winner_unchk32#924;
	havoc winAmount_unchk32#926;
	havoc payedOut_unchk8#1349;
	havoc winner_unchk8#1351;
	havoc winAmount_unchk8#1353;
	havoc payedOut_unchk44#1537;
	havoc winner_unchk44#1539;
	havoc winAmount_unchk44#1541;
	havoc payedOut_unchk45#1592;
	havoc owner#325;
	havoc payedOut_unchk33#281;
	havoc __balance;
	}

	if (!(__call_ret#126)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return74:
	// Function body ends here
}

