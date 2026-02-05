// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_20.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnerChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 48, 3} {:message "[event] Ownable::OwnerChanged"} OwnerChanged#59(__this: address_t, __msg_sender: address_t, __msg_value: int, oldOwner#55: address_t, newOwner#57: address_t)
{
	
}

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
// Function: bug_unchk42 : function ()
procedure {:sourceloc "buggy_20.sol", 32, 3} {:message "Ownable::bug_unchk42"} bug_unchk42#27(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 33, 1} {:message "receivers_unchk42"} receivers_unchk42#6: int;
	var {:sourceloc "buggy_20.sol", 34, 1} {:message "addr_unchk42"} addr_unchk42#9: address_t;
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk42#6 := 0;
	addr_unchk42#9 := 0;
	call_arg#0 := 42000000000000000000;
	assume {:sourceloc "buggy_20.sol", 35, 6} {:message ""} true;
	call __send_ret#1 := __send(addr_unchk42#9, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	receivers_unchk42#6 := (receivers_unchk42#6 + 1);
	}
	else {
	assume false;
	}

	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_20.sol", 40, 3} {:message "owner"} owner#29: [address_t]address_t;
// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_20.sol", 42, 3} {:message "payedOut_unchk33"} payedOut_unchk33#32: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_20.sol", 44, 1} {:message "Ownable::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#53(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#32[__this];
	assume {:sourceloc "buggy_20.sol", 46, 5} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return1:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 50, 5} {:message "Ownable::[constructor]"} __constructor#137(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#29 := owner#29[__this := 0];
	payedOut_unchk33#32 := payedOut_unchk33#32[__this := false];
	payedOut_unchk9#71 := payedOut_unchk9#71[__this := false];
	// Function body starts here
	owner#29 := owner#29[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_20.sol", 53, 1} {:message "payedOut_unchk9"} payedOut_unchk9#71: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_20.sol", 55, 1} {:message "Ownable::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#92(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#71[__this];
	assume {:sourceloc "buggy_20.sol", 57, 5} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return3:
	// Function body ends here
}

type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: changeOwner
procedure {:sourceloc "buggy_20.sol", 65, 5} {:message "Ownable::changeOwner"} changeOwner#122(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#106: address_t)
{
	var call_arg#5: int_arr_ptr;
	var new_array#6: int_arr_ptr;
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#6 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#5 := new_array#6;
	mem_arr_int := mem_arr_int[call_arg#5 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Function body starts here
	owner#29 := owner#29[__this := _newOwner#106];
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 67, 14} {:message ""} true;
	call OwnerChanged#59(__this, __msg_sender, __msg_value, call_arg#8, _newOwner#106);
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

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

// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 69, 1} {:message "Ownable::callnotchecked_unchk25"} callnotchecked_unchk25#136(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#124: address_t)
{
	var __call_ret#9: bool;
	var __call_ret#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_20.sol", 70, 5} {:message ""} true;
	call __call_ret#9, __call_ret#10 := __call(callee#124, __this, 1000000000000000000);
	if (__call_ret#9) {
	havoc owner#29;
	havoc payedOut_unchk33#32;
	havoc payedOut_unchk9#71;
	havoc __balance;
	}

	if (!(__call_ret#9)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return6:
	// Function body ends here
}

// 
// ------- Contract: Stoppable -------
// Inherits from: Ownable
// 
// Event: IsActiveChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 88, 3} {:message "[event] Stoppable::IsActiveChanged"} IsActiveChanged#171(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#169: bool)
{
	
}

// 
// Function: unhandledsend_unchk2 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 81, 3} {:message "Stoppable::unhandledsend_unchk2"} unhandledsend_unchk2#152(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#142: address_t)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := 5000000000000000000;
	assume {:sourceloc "buggy_20.sol", 82, 5} {:message ""} true;
	call __send_ret#12 := __send(callee#142, __this, 0, call_arg#11);
	$return7:
	// Function body ends here
}

// 
// State variable: isActive: bool
var {:sourceloc "buggy_20.sol", 84, 3} {:message "isActive"} isActive#155: [address_t]bool;
// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 86, 3} {:message "Stoppable::bug_unchk27"} bug_unchk27#167(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#157: address_t)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#13 := 42000000000000000000;
	assume {:sourceloc "buggy_20.sol", 87, 8} {:message ""} true;
	call __send_ret#14 := __send(addr#157, __this, 0, call_arg#13);
	$return8:
	// Function body ends here
}

// 
// Function: setIsActive
procedure {:sourceloc "buggy_20.sol", 95, 5} {:message "Stoppable::setIsActive"} setIsActive#201(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#182: bool)
{
	var call_arg#16: int_arr_ptr;
	var new_array#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#17 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#16 := new_array#17;
	mem_arr_int := mem_arr_int[call_arg#16 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Function body starts here
	if ((_isActive#182 == isActive#155[__this])) {
	goto $return10;
	}

	isActive#155 := isActive#155[__this := _isActive#182];
	assume {:sourceloc "buggy_20.sol", 98, 14} {:message ""} true;
	call IsActiveChanged#171(__this, __msg_sender, __msg_value, _isActive#182);
	$return10:
	// Function body ends here
	$return9:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_20.sol", 100, 1} {:message "Stoppable::bug_unchk19"} bug_unchk19#222(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 101, 1} {:message "addr_unchk19"} addr_unchk19#205: address_t;
	var call_arg#19: int;
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#205 := 0;
	call_arg#19 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 102, 6} {:message ""} true;
	call __send_ret#20 := __send(addr_unchk19#205, __this, 0, call_arg#19);
	if ((!(__send_ret#20) || (1 == 1))) {
	assume false;
	}

	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 79, 1} {:message "Stoppable::[implicit_constructor]"} __constructor#223(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	isActive#155 := isActive#155[__this := true];
	owner#29 := owner#29[__this := 0];
	payedOut_unchk33#32 := payedOut_unchk33#32[__this := false];
	payedOut_unchk9#71 := payedOut_unchk9#71[__this := false];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#29 := owner#29[__this := __msg_sender];
	$return12:
	// Function body ends here
	// Inlined constructor for Ownable ends here
}

// 
// ------- Contract: RampInstantPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 114, 5} {:message "RampInstantPoolInterface::ASSET_TYPE"} ASSET_TYPE#229(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#227: int);

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 116, 5} {:message "RampInstantPoolInterface::sendFundsToSwap"} sendFundsToSwap#236(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#231: int)
	returns (success#234: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 112, 1} {:message "RampInstantPoolInterface::[implicit_constructor]"} __constructor#237(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: RampInstantEscrowsPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 127, 5} {:message "RampInstantEscrowsPoolInterface::ASSET_TYPE"} ASSET_TYPE#243(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#241: int);
	modifies payedOut_unchk20#284, winner_unchk20#286, winAmount_unchk20#288;

// 
// Function: release
procedure {:sourceloc "buggy_20.sol", 129, 5} {:message "RampInstantEscrowsPoolInterface::release"} release#256(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#245: address_t, _receiver#247: address_t, _oracle#249: address_t, _assetData#251: int_arr_ptr, _paymentDetailsHash#253: int);
	modifies payedOut_unchk20#284, winner_unchk20#286, winAmount_unchk20#288;

// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 137, 1} {:message "RampInstantEscrowsPoolInterface::unhandledsend_unchk26"} unhandledsend_unchk26#268(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#258: address_t)
{
	var call_arg#22: int;
	var __send_ret#23: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#22 := 5000000000000000000;
	assume {:sourceloc "buggy_20.sol", 138, 5} {:message ""} true;
	call __send_ret#23 := __send(callee#258, __this, 0, call_arg#22);
	$return13:
	// Function body ends here
}

// 
// Function: returnFunds
procedure {:sourceloc "buggy_20.sol", 141, 5} {:message "RampInstantEscrowsPoolInterface::returnFunds"} returnFunds#281(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#270: address_t, _receiver#272: address_t, _oracle#274: address_t, _assetData#276: int_arr_ptr, _paymentDetailsHash#278: int);
	modifies payedOut_unchk20#284, winner_unchk20#286, winAmount_unchk20#288;

// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_20.sol", 149, 1} {:message "payedOut_unchk20"} payedOut_unchk20#284: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_20.sol", 150, 1} {:message "winner_unchk20"} winner_unchk20#286: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_20.sol", 151, 1} {:message "winAmount_unchk20"} winAmount_unchk20#288: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_20.sol", 153, 1} {:message "RampInstantEscrowsPoolInterface::sendToWinner_unchk20"} sendToWinner_unchk20#307(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#284[__this]);
	assume {:sourceloc "buggy_20.sol", 155, 9} {:message ""} true;
	call __send_ret#24 := __send(winner_unchk20#286[__this], __this, 0, winAmount_unchk20#288[__this]);
	payedOut_unchk20#284 := payedOut_unchk20#284[__this := true];
	$return14:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 125, 1} {:message "RampInstantEscrowsPoolInterface::[implicit_constructor]"} __constructor#308(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk20#284 := payedOut_unchk20#284[__this := false];
	winner_unchk20#286 := winner_unchk20#286[__this := 0];
	winAmount_unchk20#288 := winAmount_unchk20#288[__this := 0];
}

// 
// ------- Contract: RampInstantPool -------
// Inherits from: Ownable
// Inherits from: Stoppable
// Inherits from: RampInstantPoolInterface
// 
// Event: ReceivedFunds
procedure {:inline 1} {:sourceloc "buggy_20.sol", 205, 3} {:message "[event] RampInstantPool::ReceivedFunds"} ReceivedFunds#424(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#420: address_t, _amount#422: int)
{
	
}

// 
// Event: LimitsChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 212, 3} {:message "[event] RampInstantPool::LimitsChanged"} LimitsChanged#454(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#450: int, _maxAmount#452: int)
{
	
}

// 
// Event: SwapsContractChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 216, 3} {:message "[event] RampInstantPool::SwapsContractChanged"} SwapsContractChanged#474(__this: address_t, __msg_sender: address_t, __msg_value: int, _oldAddress#470: address_t, _newAddress#472: address_t)
{
	
}

// 
// State variable: assetType: uint16
var {:sourceloc "buggy_20.sol", 179, 5} {:message "assetType"} assetType#322: [address_t]int;
// 
// Function: bug_unchk43 : function ()
procedure {:sourceloc "buggy_20.sol", 181, 3} {:message "RampInstantPool::bug_unchk43"} bug_unchk43#343(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 182, 1} {:message "addr_unchk43"} addr_unchk43#326: address_t;
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk43#326 := 0;
	call_arg#25 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 183, 6} {:message ""} true;
	call __send_ret#26 := __send(addr_unchk43#326, __this, 0, call_arg#25);
	if ((!(__send_ret#26) || (1 == 1))) {
	assume false;
	}

	$return15:
	// Function body ends here
}

// 
// State variable: swapsContract: address payable
var {:sourceloc "buggy_20.sol", 186, 3} {:message "swapsContract"} swapsContract#345: [address_t]address_t;
// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 187, 3} {:message "RampInstantPool::my_func_uncheck48"} my_func_uncheck48#360(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#347: address_t)
{
	var __call_ret#27: bool;
	var __call_ret#28: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_20.sol", 188, 7} {:message ""} true;
	call __call_ret#27, __call_ret#28 := __call(dst#347, __this, __msg_value);
	if (__call_ret#27) {
	havoc assetType#322;
	havoc swapsContract#345;
	havoc minSwapAmount#362;
	havoc maxSwapAmount#381;
	havoc paymentDetailsHash#397;
	havoc payedOut_unchk45#427;
	havoc payedOut_unchk32#519;
	havoc winner_unchk32#521;
	havoc winAmount_unchk32#523;
	havoc payedOut_unchk8#842;
	havoc winner_unchk8#844;
	havoc winAmount_unchk8#846;
	havoc isActive#155;
	havoc owner#29;
	havoc payedOut_unchk33#32;
	havoc payedOut_unchk9#71;
	havoc __balance;
	}

	if (!(__call_ret#27)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: minSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 190, 3} {:message "minSwapAmount"} minSwapAmount#362: [address_t]int;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_20.sol", 191, 3} {:message "RampInstantPool::withdrawBal_unchk17"} withdrawBal_unchk17#379(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 192, 2} {:message "Balances_unchk17"} Balances_unchk17#366: int;
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#366 := 0;
	call_arg#29 := Balances_unchk17#366;
	assume {:sourceloc "buggy_20.sol", 193, 5} {:message ""} true;
	call __send_ret#30 := __send(__msg_sender, __this, 0, call_arg#29);
	$return17:
	// Function body ends here
}

// 
// State variable: maxSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 194, 3} {:message "maxSwapAmount"} maxSwapAmount#381: [address_t]int;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 195, 3} {:message "RampInstantPool::callnotchecked_unchk37"} callnotchecked_unchk37#395(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#383: address_t)
{
	var __call_ret#31: bool;
	var __call_ret#32: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_20.sol", 196, 5} {:message ""} true;
	call __call_ret#31, __call_ret#32 := __call(callee#383, __this, 1000000000000000000);
	if (__call_ret#31) {
	havoc assetType#322;
	havoc swapsContract#345;
	havoc minSwapAmount#362;
	havoc maxSwapAmount#381;
	havoc paymentDetailsHash#397;
	havoc payedOut_unchk45#427;
	havoc payedOut_unchk32#519;
	havoc winner_unchk32#521;
	havoc winAmount_unchk32#523;
	havoc payedOut_unchk8#842;
	havoc winner_unchk8#844;
	havoc winAmount_unchk8#846;
	havoc isActive#155;
	havoc owner#29;
	havoc payedOut_unchk33#32;
	havoc payedOut_unchk9#71;
	havoc __balance;
	}

	if (!(__call_ret#31)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return18:
	// Function body ends here
}

// 
// State variable: paymentDetailsHash: bytes32
var {:sourceloc "buggy_20.sol", 198, 3} {:message "paymentDetailsHash"} paymentDetailsHash#397: [address_t]int;
// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_20.sol", 200, 3} {:message "RampInstantPool::bug_unchk31"} bug_unchk31#418(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 201, 1} {:message "addr_unchk31"} addr_unchk31#401: address_t;
	var call_arg#33: int;
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#401 := 0;
	call_arg#33 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 202, 6} {:message ""} true;
	call __send_ret#34 := __send(addr_unchk31#401, __this, 0, call_arg#33);
	if ((!(__send_ret#34) || (1 == 1))) {
	assume false;
	}

	$return19:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_20.sol", 206, 3} {:message "payedOut_unchk45"} payedOut_unchk45#427: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_20.sol", 208, 1} {:message "RampInstantPool::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#448(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#427[__this];
	assume {:sourceloc "buggy_20.sol", 210, 5} {:message ""} true;
	call __send_ret#35 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return20:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_20.sol", 213, 3} {:message "RampInstantPool::callnotchecked_unchk13"} callnotchecked_unchk13#468(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#456: address_t)
{
	var __call_ret#36: bool;
	var __call_ret#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_20.sol", 214, 9} {:message ""} true;
	call __call_ret#36, __call_ret#37 := __call(callee#456, __this, 1000000000000000000);
	if (__call_ret#36) {
	havoc assetType#322;
	havoc swapsContract#345;
	havoc minSwapAmount#362;
	havoc maxSwapAmount#381;
	havoc paymentDetailsHash#397;
	havoc payedOut_unchk45#427;
	havoc payedOut_unchk32#519;
	havoc winner_unchk32#521;
	havoc winAmount_unchk32#523;
	havoc payedOut_unchk8#842;
	havoc winner_unchk8#844;
	havoc winAmount_unchk8#846;
	havoc isActive#155;
	havoc owner#29;
	havoc payedOut_unchk33#32;
	havoc payedOut_unchk9#71;
	havoc __balance;
	}

	if (!(__call_ret#36)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return21:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 218, 5} {:message "RampInstantPool::[constructor]"} __constructor#946(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#476: address_t, _minSwapAmount#478: int, _maxSwapAmount#480: int, _paymentDetailsHash#482: int, _assetType#484: int)
{
	var _minAmount#896#390: int;
	var _maxAmount#898#390: int;
	var call_arg#40: int_arr_ptr;
	var new_array#41: int_arr_ptr;
	var call_arg#42: int_arr_ptr;
	var new_array#43: int_arr_ptr;
	var _swapsContract#918#441: address_t;
	var _assetType#920#441: int;
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	var ASSET_TYPE#243_ret#47: int;
	var call_arg#48: int_arr_ptr;
	var new_array#49: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	assetType#322 := assetType#322[__this := 0];
	swapsContract#345 := swapsContract#345[__this := 0];
	minSwapAmount#362 := minSwapAmount#362[__this := 0];
	maxSwapAmount#381 := maxSwapAmount#381[__this := 0];
	paymentDetailsHash#397 := paymentDetailsHash#397[__this := 0];
	payedOut_unchk45#427 := payedOut_unchk45#427[__this := false];
	payedOut_unchk32#519 := payedOut_unchk32#519[__this := false];
	winner_unchk32#521 := winner_unchk32#521[__this := 0];
	winAmount_unchk32#523 := winAmount_unchk32#523[__this := 0];
	payedOut_unchk8#842 := payedOut_unchk8#842[__this := false];
	winner_unchk8#844 := winner_unchk8#844[__this := 0];
	winAmount_unchk8#846 := winAmount_unchk8#846[__this := 0];
	isActive#155 := isActive#155[__this := true];
	owner#29 := owner#29[__this := 0];
	payedOut_unchk33#32 := payedOut_unchk33#32[__this := false];
	payedOut_unchk9#71 := payedOut_unchk9#71[__this := false];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#29 := owner#29[__this := __msg_sender];
	$return22:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined modifier validateLimits starts here
	_minAmount#896#390 := _minSwapAmount#478;
	_maxAmount#898#390 := _maxSwapAmount#480;
	new_array#41 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#40 := new_array#41;
	mem_arr_int := mem_arr_int[call_arg#40 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#896#390 <= _maxAmount#898#390);
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#42 := new_array#43;
	mem_arr_int := mem_arr_int[call_arg#42 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#898#390 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#918#441 := _swapsContract#476;
	_assetType#920#441 := _assetType#484;
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#918#441 != 0);
	assume {:sourceloc "buggy_20.sol", 382, 13} {:message ""} true;
	call ASSET_TYPE#243_ret#47 := ASSET_TYPE#243(_swapsContract#918#441, __this, 0);
	new_array#49 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#48 := new_array#49;
	mem_arr_int := mem_arr_int[call_arg#48 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#243_ret#47 == _assetType#920#441);
	// Function body starts here
	swapsContract#345 := swapsContract#345[__this := _swapsContract#476];
	paymentDetailsHash#397 := paymentDetailsHash#397[__this := _paymentDetailsHash#482];
	minSwapAmount#362 := minSwapAmount#362[__this := _minSwapAmount#478];
	maxSwapAmount#381 := maxSwapAmount#381[__this := _maxSwapAmount#480];
	assetType#322 := assetType#322[__this := _assetType#484];
	$return25:
	// Function body ends here
	$return24:
	// Inlined modifier validateSwapsContract ends here
	$return23:
	// Inlined modifier validateLimits ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_20.sol", 234, 1} {:message "payedOut_unchk32"} payedOut_unchk32#519: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_20.sol", 235, 1} {:message "winner_unchk32"} winner_unchk32#521: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_20.sol", 236, 1} {:message "winAmount_unchk32"} winAmount_unchk32#523: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_20.sol", 238, 1} {:message "RampInstantPool::sendToWinner_unchk32"} sendToWinner_unchk32#542(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#519[__this]);
	assume {:sourceloc "buggy_20.sol", 240, 9} {:message ""} true;
	call __send_ret#51 := __send(winner_unchk32#521[__this], __this, 0, winAmount_unchk32#523[__this]);
	payedOut_unchk32#519 := payedOut_unchk32#519[__this := true];
	$return26:
	// Function body ends here
}

// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 244, 5} {:message "RampInstantPool::ASSET_TYPE"} ASSET_TYPE#551(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#546: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#546 := assetType#322[__this];
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 248, 5} {:message "RampInstantPool::availableFunds"} availableFunds#556(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#554: int);
	modifies assetType#322, swapsContract#345, minSwapAmount#362, maxSwapAmount#381, paymentDetailsHash#397, payedOut_unchk45#427, payedOut_unchk32#519, winner_unchk32#521, winAmount_unchk32#523, payedOut_unchk8#842, winner_unchk8#844, winAmount_unchk8#846, isActive#155, owner#29, payedOut_unchk33#32, payedOut_unchk9#71;

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 249, 1} {:message "RampInstantPool::unhandledsend_unchk38"} unhandledsend_unchk38#568(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#558: address_t)
{
	var call_arg#52: int;
	var __send_ret#53: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#52 := 5000000000000000000;
	assume {:sourceloc "buggy_20.sol", 250, 5} {:message ""} true;
	call __send_ret#53 := __send(callee#558, __this, 0, call_arg#52);
	$return28:
	// Function body ends here
}

// 
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 253, 5} {:message "RampInstantPool::withdrawFunds"} withdrawFunds#577(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#570: address_t, _amount#572: int)
	returns (success#575: bool);
	modifies assetType#322, swapsContract#345, minSwapAmount#362, maxSwapAmount#381, paymentDetailsHash#397, payedOut_unchk45#427, payedOut_unchk32#519, winner_unchk32#521, winAmount_unchk32#523, payedOut_unchk8#842, winner_unchk8#844, winAmount_unchk8#846, isActive#155, owner#29, payedOut_unchk33#32, payedOut_unchk9#71;

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_20.sol", 255, 1} {:message "RampInstantPool::cash_unchk46"} cash_unchk46#601(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#579: int, subpotIndex#581: int, winner_unchk46#583: address_t)
{
	var {:sourceloc "buggy_20.sol", 256, 9} {:message "subpot_unchk46"} subpot_unchk46#587: int;
	var call_arg#54: int;
	var __send_ret#55: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#587 := 3000000000000000000;
	call_arg#54 := subpot_unchk46#587;
	assume {:sourceloc "buggy_20.sol", 257, 9} {:message ""} true;
	call __send_ret#55 := __send(winner_unchk46#583, __this, 0, call_arg#54);
	subpot_unchk46#587 := 0;
	$return29:
	// Function body ends here
}

// 
// Function: withdrawAllFunds : function (address payable) returns (bool)
procedure {:sourceloc "buggy_20.sol", 261, 5} {:message "RampInstantPool::withdrawAllFunds"} withdrawAllFunds#617(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#603: address_t)
	returns (success#608: bool)
{
	var call_arg#57: int_arr_ptr;
	var new_array#58: int_arr_ptr;
	var availableFunds#556_ret#60: int;
	var withdrawFunds#577_ret#61: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#58 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#57 := new_array#58;
	mem_arr_int := mem_arr_int[call_arg#57 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 262, 35} {:message ""} true;
	call availableFunds#556_ret#60 := availableFunds#556(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_20.sol", 262, 16} {:message ""} true;
	call withdrawFunds#577_ret#61 := withdrawFunds#577(__this, __msg_sender, __msg_value, _to#603, availableFunds#556_ret#60);
	success#608 := withdrawFunds#577_ret#61;
	goto $return31;
	$return31:
	// Function body ends here
	$return30:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_20.sol", 264, 1} {:message "RampInstantPool::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#632(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 265, 4} {:message "addr_unchk4"} addr_unchk4#621: address_t;
	var call_arg#62: int;
	var __send_ret#63: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#621 := 0;
	call_arg#62 := 42000000000000000000;
	assume {:sourceloc "buggy_20.sol", 266, 10} {:message ""} true;
	call __send_ret#63 := __send(addr_unchk4#621, __this, 0, call_arg#62);
	if (!(__send_ret#63)) {
	
	}
	else {
	
	}

	$return32:
	// Function body ends here
}

// 
// Function: setLimits : function (uint256,uint256)
procedure {:sourceloc "buggy_20.sol", 274, 5} {:message "RampInstantPool::setLimits"} setLimits#659(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#634: int, _maxAmount#636: int)
{
	var call_arg#65: int_arr_ptr;
	var new_array#66: int_arr_ptr;
	var _minAmount#896#671: int;
	var _maxAmount#898#671: int;
	var call_arg#68: int_arr_ptr;
	var new_array#69: int_arr_ptr;
	var call_arg#70: int_arr_ptr;
	var new_array#71: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#66 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#65 := new_array#66;
	mem_arr_int := mem_arr_int[call_arg#65 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Inlined modifier validateLimits starts here
	_minAmount#896#671 := _minAmount#634;
	_maxAmount#898#671 := _maxAmount#636;
	new_array#69 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#68 := new_array#69;
	mem_arr_int := mem_arr_int[call_arg#68 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#896#671 <= _maxAmount#898#671);
	new_array#71 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#70 := new_array#71;
	mem_arr_int := mem_arr_int[call_arg#70 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#898#671 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Function body starts here
	minSwapAmount#362 := minSwapAmount#362[__this := _minAmount#634];
	maxSwapAmount#381 := maxSwapAmount#381[__this := _maxAmount#636];
	assume {:sourceloc "buggy_20.sol", 280, 14} {:message ""} true;
	call LimitsChanged#454(__this, __msg_sender, __msg_value, _minAmount#634, _maxAmount#636);
	$return35:
	// Function body ends here
	$return34:
	// Inlined modifier validateLimits ends here
	$return33:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_20.sol", 282, 1} {:message "RampInstantPool::bug_unchk7"} bug_unchk7#680(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 283, 1} {:message "addr_unchk7"} addr_unchk7#663: address_t;
	var call_arg#73: int;
	var __send_ret#74: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#663 := 0;
	call_arg#73 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 284, 6} {:message ""} true;
	call __send_ret#74 := __send(addr_unchk7#663, __this, 0, call_arg#73);
	if ((!(__send_ret#74) || (1 == 1))) {
	assume false;
	}

	$return36:
	// Function body ends here
}

// 
// Function: setSwapsContract : function (address payable)
procedure {:sourceloc "buggy_20.sol", 288, 5} {:message "RampInstantPool::setSwapsContract"} setSwapsContract#705(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#682: address_t)
{
	var call_arg#76: int_arr_ptr;
	var new_array#77: int_arr_ptr;
	var _swapsContract#918#781: address_t;
	var _assetType#920#781: int;
	var call_arg#79: int_arr_ptr;
	var new_array#80: int_arr_ptr;
	var ASSET_TYPE#243_ret#81: int;
	var call_arg#82: int_arr_ptr;
	var new_array#83: int_arr_ptr;
	var {:sourceloc "buggy_20.sol", 291, 9} {:message "oldSwapsContract"} oldSwapsContract#692#84: address_t;
	var call_arg#85: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#77 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#76 := new_array#77;
	mem_arr_int := mem_arr_int[call_arg#76 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#918#781 := _swapsContract#682;
	_assetType#920#781 := assetType#322[__this];
	new_array#80 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#79 := new_array#80;
	mem_arr_int := mem_arr_int[call_arg#79 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#918#781 != 0);
	assume {:sourceloc "buggy_20.sol", 382, 13} {:message ""} true;
	call ASSET_TYPE#243_ret#81 := ASSET_TYPE#243(_swapsContract#918#781, __this, 0);
	new_array#83 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#82 := new_array#83;
	mem_arr_int := mem_arr_int[call_arg#82 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#243_ret#81 == _assetType#920#781);
	// Function body starts here
	oldSwapsContract#692#84 := swapsContract#345[__this];
	swapsContract#345 := swapsContract#345[__this := _swapsContract#682];
	call_arg#85 := _swapsContract#682;
	assume {:sourceloc "buggy_20.sol", 293, 14} {:message ""} true;
	call SwapsContractChanged#474(__this, __msg_sender, __msg_value, oldSwapsContract#692#84, call_arg#85);
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier validateSwapsContract ends here
	$return37:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 295, 1} {:message "RampInstantPool::my_func_unchk23"} my_func_unchk23#718(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#707: address_t)
{
	var __send_ret#86: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 296, 9} {:message ""} true;
	call __send_ret#86 := __send(dst#707, __this, 0, __msg_value);
	$return40:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 299, 5} {:message "RampInstantPool::sendFundsToSwap"} sendFundsToSwap#726(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#720: int)
	returns (success#724: bool);
	modifies assetType#322, swapsContract#345, minSwapAmount#362, maxSwapAmount#381, paymentDetailsHash#397, payedOut_unchk45#427, payedOut_unchk32#519, winner_unchk32#521, winAmount_unchk32#523, payedOut_unchk8#842, winner_unchk8#844, winAmount_unchk8#846, isActive#155, owner#29, payedOut_unchk33#32, payedOut_unchk9#71;

// 
// Function: releaseSwap
procedure {:sourceloc "buggy_20.sol", 302, 5} {:message "RampInstantPool::releaseSwap"} releaseSwap#754(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#728: address_t, _oracle#730: address_t, _assetData#732: int_arr_ptr, _paymentDetailsHash#734: int)
{
	var call_arg#88: int_arr_ptr;
	var new_array#89: int_arr_ptr;
	var call_arg#91: address_t;
	var call_arg#92: int_arr_ptr;
	var new_array#93: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#89 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#88 := new_array#89;
	mem_arr_int := mem_arr_int[call_arg#88 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Function body starts here
	call_arg#91 := __this;
	new_array#93 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#92 := new_array#93;
	mem_arr_int := mem_arr_int[call_arg#92 := mem_arr_int[_assetData#732]];
	assume {:sourceloc "buggy_20.sol", 308, 9} {:message ""} true;
	call release#256(swapsContract#345[__this], __this, 0, call_arg#91, _receiver#728, _oracle#730, call_arg#92, _paymentDetailsHash#734);
	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 316, 1} {:message "RampInstantPool::unhandledsend_unchk14"} unhandledsend_unchk14#766(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#756: address_t)
{
	var call_arg#94: int;
	var __send_ret#95: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#94 := 5000000000000000000;
	assume {:sourceloc "buggy_20.sol", 317, 5} {:message ""} true;
	call __send_ret#95 := __send(callee#756, __this, 0, call_arg#94);
	$return43:
	// Function body ends here
}

// 
// Function: returnSwap
procedure {:sourceloc "buggy_20.sol", 320, 5} {:message "RampInstantPool::returnSwap"} returnSwap#797(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#768: address_t, _oracle#770: address_t, _assetData#772: int_arr_ptr, _paymentDetailsHash#774: int)
{
	var call_arg#97: int_arr_ptr;
	var new_array#98: int_arr_ptr;
	var call_arg#100: int_arr_ptr;
	var new_array#101: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#98 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#97 := new_array#98;
	mem_arr_int := mem_arr_int[call_arg#97 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Function body starts here
	new_array#101 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#100 := new_array#101;
	mem_arr_int := mem_arr_int[call_arg#100 := mem_arr_int[_assetData#772]];
	assume {:sourceloc "buggy_20.sol", 326, 9} {:message ""} true;
	call returnFunds#281(swapsContract#345[__this], __this, 0, __this, _receiver#768, _oracle#770, call_arg#100, _paymentDetailsHash#774);
	$return45:
	// Function body ends here
	$return44:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_20.sol", 334, 1} {:message "RampInstantPool::bug_unchk30"} bug_unchk30#822(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 335, 1} {:message "receivers_unchk30"} receivers_unchk30#801: int;
	var {:sourceloc "buggy_20.sol", 336, 1} {:message "addr_unchk30"} addr_unchk30#804: address_t;
	var call_arg#102: int;
	var __send_ret#103: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#801 := 0;
	addr_unchk30#804 := 0;
	call_arg#102 := 42000000000000000000;
	assume {:sourceloc "buggy_20.sol", 337, 6} {:message ""} true;
	call __send_ret#103 := __send(addr_unchk30#804, __this, 0, call_arg#102);
	if (!(__send_ret#103)) {
	receivers_unchk30#801 := (receivers_unchk30#801 + 1);
	}
	else {
	assume false;
	}

	$return46:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 347, 5} {:message "RampInstantPool::[fallback]"} #831(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#104: int_arr_ptr;
	var new_array#105: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	new_array#105 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#104 := new_array#105;
	mem_arr_int := mem_arr_int[call_arg#104 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 112][6 := 111][7 := 111][8 := 108][9 := 32][10 := 99][11 := 97][12 := 110][13 := 110][14 := 111][15 := 116][16 := 32][17 := 114][18 := 101][19 := 99][20 := 101][21 := 105][22 := 118][23 := 101][24 := 32][25 := 101][26 := 116][27 := 104][28 := 101][29 := 114], 30)];
	assume false;
	$return47:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 350, 5} {:message "RampInstantPool::[receive]"} #839(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#106: int_arr_ptr;
	var new_array#107: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	new_array#107 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#106 := new_array#107;
	mem_arr_int := mem_arr_int[call_arg#106 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 112][6 := 111][7 := 111][8 := 108][9 := 32][10 := 99][11 := 97][12 := 110][13 := 110][14 := 111][15 := 116][16 := 32][17 := 114][18 := 101][19 := 99][20 := 101][21 := 105][22 := 118][23 := 101][24 := 32][25 := 101][26 := 116][27 := 104][28 := 101][29 := 114], 30)];
	assume false;
	$return48:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_20.sol", 353, 1} {:message "payedOut_unchk8"} payedOut_unchk8#842: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_20.sol", 354, 1} {:message "winner_unchk8"} winner_unchk8#844: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_20.sol", 355, 1} {:message "winAmount_unchk8"} winAmount_unchk8#846: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_20.sol", 357, 1} {:message "RampInstantPool::sendToWinner_unchk8"} sendToWinner_unchk8#865(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#108: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#842[__this]);
	assume {:sourceloc "buggy_20.sol", 359, 9} {:message ""} true;
	call __send_ret#108 := __send(winner_unchk8#844[__this], __this, 0, winAmount_unchk8#846[__this]);
	payedOut_unchk8#842 := payedOut_unchk8#842[__this := true];
	$return49:
	// Function body ends here
}

// 
// ------- Contract: RampInstantEthPool -------
// Inherits from: RampInstantPool
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 397, 3} {:message "RampInstantEthPool::bug_unchk3"} bug_unchk3#961(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#951: address_t)
{
	var call_arg#109: int;
	var __send_ret#110: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#109 := 42000000000000000000;
	assume {:sourceloc "buggy_20.sol", 398, 8} {:message ""} true;
	call __send_ret#110 := __send(addr#951, __this, 0, call_arg#109);
	$return50:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 401, 5} {:message "RampInstantEthPool::[constructor]"} __constructor#1142(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#966: address_t, _minSwapAmount#968: int, _maxSwapAmount#970: int, _paymentDetailsHash#972: int)
{
	var _swapsContract#476#111: address_t;
	var _minSwapAmount#478#111: int;
	var _maxSwapAmount#480#111: int;
	var _paymentDetailsHash#482#111: int;
	var _assetType#484#111: int;
	var _minAmount#896#1130: int;
	var _maxAmount#898#1130: int;
	var call_arg#114: int_arr_ptr;
	var new_array#115: int_arr_ptr;
	var call_arg#116: int_arr_ptr;
	var new_array#117: int_arr_ptr;
	var _swapsContract#918#1181: address_t;
	var _assetType#920#1181: int;
	var call_arg#119: int_arr_ptr;
	var new_array#120: int_arr_ptr;
	var ASSET_TYPE#243_ret#121: int;
	var call_arg#122: int_arr_ptr;
	var new_array#123: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk44#1084 := payedOut_unchk44#1084[__this := false];
	winner_unchk44#1086 := winner_unchk44#1086[__this := 0];
	winAmount_unchk44#1088 := winAmount_unchk44#1088[__this := 0];
	assetType#322 := assetType#322[__this := 0];
	swapsContract#345 := swapsContract#345[__this := 0];
	minSwapAmount#362 := minSwapAmount#362[__this := 0];
	maxSwapAmount#381 := maxSwapAmount#381[__this := 0];
	paymentDetailsHash#397 := paymentDetailsHash#397[__this := 0];
	payedOut_unchk45#427 := payedOut_unchk45#427[__this := false];
	payedOut_unchk32#519 := payedOut_unchk32#519[__this := false];
	winner_unchk32#521 := winner_unchk32#521[__this := 0];
	winAmount_unchk32#523 := winAmount_unchk32#523[__this := 0];
	payedOut_unchk8#842 := payedOut_unchk8#842[__this := false];
	winner_unchk8#844 := winner_unchk8#844[__this := 0];
	winAmount_unchk8#846 := winAmount_unchk8#846[__this := 0];
	isActive#155 := isActive#155[__this := true];
	owner#29 := owner#29[__this := 0];
	payedOut_unchk33#32 := payedOut_unchk33#32[__this := false];
	payedOut_unchk9#71 := payedOut_unchk9#71[__this := false];
	// Arguments for RampInstantPool
	_swapsContract#476#111 := _swapsContract#966;
	_minSwapAmount#478#111 := _minSwapAmount#968;
	_maxSwapAmount#480#111 := _maxSwapAmount#970;
	_paymentDetailsHash#482#111 := _paymentDetailsHash#972;
	_assetType#484#111 := 1;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#29 := owner#29[__this := __msg_sender];
	$return51:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for RampInstantPool starts here
	// Inlined modifier validateLimits starts here
	_minAmount#896#1130 := _minSwapAmount#478#111;
	_maxAmount#898#1130 := _maxSwapAmount#480#111;
	new_array#115 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#114 := new_array#115;
	mem_arr_int := mem_arr_int[call_arg#114 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#896#1130 <= _maxAmount#898#1130);
	new_array#117 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#116 := new_array#117;
	mem_arr_int := mem_arr_int[call_arg#116 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#898#1130 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#918#1181 := _swapsContract#476#111;
	_assetType#920#1181 := _assetType#484#111;
	new_array#120 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#119 := new_array#120;
	mem_arr_int := mem_arr_int[call_arg#119 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#918#1181 != 0);
	assume {:sourceloc "buggy_20.sol", 382, 13} {:message ""} true;
	call ASSET_TYPE#243_ret#121 := ASSET_TYPE#243(_swapsContract#918#1181, __this, 0);
	new_array#123 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#122 := new_array#123;
	mem_arr_int := mem_arr_int[call_arg#122 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#243_ret#121 == _assetType#920#1181);
	// Function body starts here
	swapsContract#345 := swapsContract#345[__this := _swapsContract#476#111];
	paymentDetailsHash#397 := paymentDetailsHash#397[__this := _paymentDetailsHash#482#111];
	minSwapAmount#362 := minSwapAmount#362[__this := _minSwapAmount#478#111];
	maxSwapAmount#381 := maxSwapAmount#381[__this := _maxSwapAmount#480#111];
	assetType#322 := assetType#322[__this := _assetType#484#111];
	$return54:
	// Function body ends here
	$return53:
	// Inlined modifier validateSwapsContract ends here
	$return52:
	// Inlined modifier validateLimits ends here
	// Inlined constructor for RampInstantPool ends here
	// Function body starts here
	$return55:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 411, 1} {:message "RampInstantEthPool::bug_unchk39"} bug_unchk39#995(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#985: address_t)
{
	var call_arg#126: int;
	var __send_ret#127: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#126 := 4000000000000000000;
	assume {:sourceloc "buggy_20.sol", 412, 8} {:message ""} true;
	call __send_ret#127 := __send(addr#985, __this, 0, call_arg#126);
	$return56:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 414, 5} {:message "RampInstantEthPool::availableFunds"} availableFunds#1008(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#999: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#999 := __balance[__this];
	goto $return57;
	$return57:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 417, 1} {:message "RampInstantEthPool::my_func_uncheck36"} my_func_uncheck36#1023(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1010: address_t)
{
	var __call_ret#128: bool;
	var __call_ret#129: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_20.sol", 418, 5} {:message ""} true;
	call __call_ret#128, __call_ret#129 := __call(dst#1010, __this, __msg_value);
	if (__call_ret#128) {
	havoc payedOut_unchk44#1084;
	havoc winner_unchk44#1086;
	havoc winAmount_unchk44#1088;
	havoc assetType#322;
	havoc swapsContract#345;
	havoc minSwapAmount#362;
	havoc maxSwapAmount#381;
	havoc paymentDetailsHash#397;
	havoc payedOut_unchk45#427;
	havoc payedOut_unchk32#519;
	havoc winner_unchk32#521;
	havoc winAmount_unchk32#523;
	havoc payedOut_unchk8#842;
	havoc winner_unchk8#844;
	havoc winAmount_unchk8#846;
	havoc isActive#155;
	havoc owner#29;
	havoc payedOut_unchk33#32;
	havoc payedOut_unchk9#71;
	havoc __balance;
	}

	if (!(__call_ret#128)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return58:
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
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 421, 5} {:message "RampInstantEthPool::withdrawFunds"} withdrawFunds#1044(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1025: address_t, _amount#1027: int)
	returns (success#1033: bool)
{
	var call_arg#131: int_arr_ptr;
	var new_array#132: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#132 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#131 := new_array#132;
	mem_arr_int := mem_arr_int[call_arg#131 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#29[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 425, 9} {:message ""} true;
	call __transfer(_to#1025, __this, 0, _amount#1027);
	success#1033 := true;
	goto $return60;
	$return60:
	// Function body ends here
	$return59:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_20.sol", 428, 1} {:message "RampInstantEthPool::my_func_unchk35"} my_func_unchk35#1057(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#1046: address_t)
{
	var __send_ret#134: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 429, 9} {:message ""} true;
	call __send_ret#134 := __send(dst#1046, __this, 0, __msg_value);
	$return61:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 432, 5} {:message "RampInstantEthPool::sendFundsToSwap"} sendFundsToSwap#1081(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#1059: int)
	returns (success#1070: bool)
{
	var call_arg#136: int_arr_ptr;
	var new_array#137: int_arr_ptr;
	var call_arg#139: int_arr_ptr;
	var new_array#140: int_arr_ptr;
	var _amount#879#1412: int;
	var call_arg#142: int_arr_ptr;
	var new_array#143: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyActive starts here
	new_array#137 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#136 := new_array#137;
	mem_arr_int := mem_arr_int[call_arg#136 := int_arr#constr(default_int_int()[0 := 99][1 := 111][2 := 110][3 := 116][4 := 114][5 := 97][6 := 99][7 := 116][8 := 32][9 := 105][10 := 115][11 := 32][12 := 115][13 := 116][14 := 111][15 := 112][16 := 112][17 := 101][18 := 100], 19)];
	assume isActive#155[__this];
	// Inlined modifier onlySwapsContract starts here
	new_array#140 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#139 := new_array#140;
	mem_arr_int := mem_arr_int[call_arg#139 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 115][10 := 119][11 := 97][12 := 112][13 := 115][14 := 32][15 := 99][16 := 111][17 := 110][18 := 116][19 := 114][20 := 97][21 := 99][22 := 116][23 := 32][24 := 99][25 := 97][26 := 110][27 := 32][28 := 99][29 := 97][30 := 108][31 := 108][32 := 32][33 := 116][34 := 104][35 := 105][36 := 115], 37)];
	assume (__msg_sender == swapsContract#345[__this]);
	// Inlined modifier isWithinLimits starts here
	_amount#879#1412 := _amount#1059;
	new_array#143 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#142 := new_array#143;
	mem_arr_int := mem_arr_int[call_arg#142 := int_arr#constr(default_int_int()[0 := 97][1 := 109][2 := 111][3 := 117][4 := 110][5 := 116][6 := 32][7 := 111][8 := 117][9 := 116][10 := 115][11 := 105][12 := 100][13 := 101][14 := 32][15 := 115][16 := 119][17 := 97][18 := 112][19 := 32][20 := 108][21 := 105][22 := 109][23 := 105][24 := 116][25 := 115], 26)];
	assume ((_amount#879#1412 >= minSwapAmount#362[__this]) && (_amount#879#1412 <= maxSwapAmount#381[__this]));
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 435, 9} {:message ""} true;
	call __transfer(swapsContract#345[__this], __this, 0, _amount#1059);
	success#1070 := true;
	goto $return65;
	$return65:
	// Function body ends here
	$return64:
	// Inlined modifier isWithinLimits ends here
	$return63:
	// Inlined modifier onlySwapsContract ends here
	$return62:
	// Inlined modifier onlyActive ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_20.sol", 438, 1} {:message "payedOut_unchk44"} payedOut_unchk44#1084: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_20.sol", 439, 1} {:message "winner_unchk44"} winner_unchk44#1086: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_20.sol", 440, 1} {:message "winAmount_unchk44"} winAmount_unchk44#1088: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_20.sol", 442, 1} {:message "RampInstantEthPool::sendToWinner_unchk44"} sendToWinner_unchk44#1107(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#145: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#1084[__this]);
	assume {:sourceloc "buggy_20.sol", 444, 9} {:message ""} true;
	call __send_ret#145 := __send(winner_unchk44#1086[__this], __this, 0, winAmount_unchk44#1088[__this]);
	payedOut_unchk44#1084 := payedOut_unchk44#1084[__this := true];
	$return66:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 451, 5} {:message "RampInstantEthPool::[receive]"} #1126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#146: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	if ((__msg_sender != swapsContract#345[__this])) {
	call_arg#146 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 453, 18} {:message ""} true;
	call ReceivedFunds#424(__this, __msg_sender, __msg_value, call_arg#146, __msg_value);
	}

	$return67:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_20.sol", 456, 1} {:message "RampInstantEthPool::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#1141(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 457, 4} {:message "addr_unchk40"} addr_unchk40#1130: address_t;
	var call_arg#147: int;
	var __send_ret#148: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#1130 := 0;
	call_arg#147 := 2000000000000000000;
	assume {:sourceloc "buggy_20.sol", 458, 10} {:message ""} true;
	call __send_ret#148 := __send(addr_unchk40#1130, __this, 0, call_arg#147);
	if (!(__send_ret#148)) {
	
	}
	else {
	
	}

	$return68:
	// Function body ends here
}

