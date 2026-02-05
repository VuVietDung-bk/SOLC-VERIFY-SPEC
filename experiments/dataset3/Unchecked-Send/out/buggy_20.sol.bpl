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
procedure {:inline 1} {:sourceloc "buggy_20.sol", 38, 3} {:message "[event] Ownable::OwnerChanged"} OwnerChanged#36(__this: address_t, __msg_sender: address_t, __msg_value: int, oldOwner#32: address_t, newOwner#34: address_t)
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
procedure {:sourceloc "buggy_20.sol", 32, 3} {:message "Ownable::bug_unchk_send29"} bug_unchk_send29#15(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 33, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_20.sol", 34, 3} {:message "owner"} owner#17: [address_t]address_t;
// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_20.sol", 36, 3} {:message "Ownable::bug_unchk_send30"} bug_unchk_send30#30(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 37, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 40, 5} {:message "Ownable::[constructor]"} __constructor#102(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#17 := owner#17[__this := 0];
	// Function body starts here
	owner#17 := owner#17[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_20.sol", 43, 1} {:message "Ownable::bug_unchk_send21"} bug_unchk_send21#58(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 44, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
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
procedure {:sourceloc "buggy_20.sol", 51, 5} {:message "Ownable::changeOwner"} changeOwner#88(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#72: address_t)
{
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	var call_arg#7: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Function body starts here
	owner#17 := owner#17[__this := _newOwner#72];
	call_arg#7 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 53, 14} {:message ""} true;
	call OwnerChanged#36(__this, __msg_sender, __msg_value, call_arg#7, _newOwner#72);
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_20.sol", 55, 1} {:message "Ownable::bug_unchk_send10"} bug_unchk_send10#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 56, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return6:
	// Function body ends here
}

// 
// ------- Contract: Stoppable -------
// Inherits from: Ownable
// 
// Event: IsActiveChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 72, 3} {:message "[event] Stoppable::IsActiveChanged"} IsActiveChanged#138(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#136: bool)
{
	
}

// 
// Function: bug_unchk_send6 : function ()
procedure {:sourceloc "buggy_20.sol", 66, 3} {:message "Stoppable::bug_unchk_send6"} bug_unchk_send6#118(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 67, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return7:
	// Function body ends here
}

// 
// State variable: isActive: bool
var {:sourceloc "buggy_20.sol", 68, 3} {:message "isActive"} isActive#121: [address_t]bool;
// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_20.sol", 70, 3} {:message "Stoppable::bug_unchk_send8"} bug_unchk_send8#134(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 71, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return8:
	// Function body ends here
}

// 
// Function: setIsActive
procedure {:sourceloc "buggy_20.sol", 79, 5} {:message "Stoppable::setIsActive"} setIsActive#168(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#149: bool)
{
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Function body starts here
	if ((_isActive#149 == isActive#121[__this])) {
	goto $return10;
	}

	isActive#121 := isActive#121[__this := _isActive#149];
	assume {:sourceloc "buggy_20.sol", 82, 14} {:message ""} true;
	call IsActiveChanged#138(__this, __msg_sender, __msg_value, _isActive#149);
	$return10:
	// Function body ends here
	$return9:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_20.sol", 84, 1} {:message "Stoppable::bug_unchk_send22"} bug_unchk_send22#181(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 85, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 64, 1} {:message "Stoppable::[implicit_constructor]"} __constructor#182(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	isActive#121 := isActive#121[__this := true];
	owner#17 := owner#17[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#17 := owner#17[__this := __msg_sender];
	$return12:
	// Function body ends here
	// Inlined constructor for Ownable ends here
}

// 
// ------- Contract: RampInstantPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 95, 5} {:message "RampInstantPoolInterface::ASSET_TYPE"} ASSET_TYPE#188(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#186: int);

// 
// Function: sendFundsToSwap
procedure {:sourceloc "buggy_20.sol", 97, 5} {:message "RampInstantPoolInterface::sendFundsToSwap"} sendFundsToSwap#195(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#190: int)
	returns (success#193: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 93, 1} {:message "RampInstantPoolInterface::[implicit_constructor]"} __constructor#196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: RampInstantEscrowsPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 108, 5} {:message "RampInstantEscrowsPoolInterface::ASSET_TYPE"} ASSET_TYPE#202(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#200: int);

// 
// Function: release
procedure {:sourceloc "buggy_20.sol", 110, 5} {:message "RampInstantEscrowsPoolInterface::release"} release#215(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#204: address_t, _receiver#206: address_t, _oracle#208: address_t, _assetData#210: int_arr_ptr, _paymentDetailsHash#212: int);

// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_20.sol", 118, 1} {:message "RampInstantEscrowsPoolInterface::bug_unchk_send12"} bug_unchk_send12#228(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 119, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return13:
	// Function body ends here
}

// 
// Function: returnFunds
procedure {:sourceloc "buggy_20.sol", 121, 5} {:message "RampInstantEscrowsPoolInterface::returnFunds"} returnFunds#241(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#230: address_t, _receiver#232: address_t, _oracle#234: address_t, _assetData#236: int_arr_ptr, _paymentDetailsHash#238: int);

// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_20.sol", 129, 1} {:message "RampInstantEscrowsPoolInterface::bug_unchk_send11"} bug_unchk_send11#254(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 130, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return14:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 106, 1} {:message "RampInstantEscrowsPoolInterface::[implicit_constructor]"} __constructor#255(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: RampInstantPool -------
// Inherits from: Ownable
// Inherits from: Stoppable
// Inherits from: RampInstantPoolInterface
// 
// Event: ReceivedFunds
procedure {:inline 1} {:sourceloc "buggy_20.sol", 169, 3} {:message "[event] RampInstantPool::ReceivedFunds"} ReceivedFunds#349(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#345: address_t, _amount#347: int)
{
	
}

// 
// Event: LimitsChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 172, 3} {:message "[event] RampInstantPool::LimitsChanged"} LimitsChanged#368(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#364: int, _maxAmount#366: int)
{
	
}

// 
// Event: SwapsContractChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 175, 3} {:message "[event] RampInstantPool::SwapsContractChanged"} SwapsContractChanged#387(__this: address_t, __msg_sender: address_t, __msg_value: int, _oldAddress#383: address_t, _newAddress#385: address_t)
{
	
}

// 
// State variable: ASSET_TYPE: uint16
var {:sourceloc "buggy_20.sol", 152, 5} {:message "ASSET_TYPE"} ASSET_TYPE#270: [address_t]int;
// 
// Function: bug_unchk_send16 : function ()
procedure {:sourceloc "buggy_20.sol", 154, 3} {:message "RampInstantPool::bug_unchk_send16"} bug_unchk_send16#283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#19 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 155, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#19);
	$return15:
	// Function body ends here
}

// 
// State variable: swapsContract: address payable
var {:sourceloc "buggy_20.sol", 156, 3} {:message "swapsContract"} swapsContract#285: [address_t]address_t;
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_20.sol", 157, 3} {:message "RampInstantPool::bug_unchk_send24"} bug_unchk_send24#298(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 158, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return16:
	// Function body ends here
}

// 
// State variable: minSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 159, 3} {:message "minSwapAmount"} minSwapAmount#300: [address_t]int;
// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_20.sol", 160, 3} {:message "RampInstantPool::bug_unchk_send5"} bug_unchk_send5#313(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 161, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return17:
	// Function body ends here
}

// 
// State variable: maxSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 162, 3} {:message "maxSwapAmount"} maxSwapAmount#315: [address_t]int;
// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_20.sol", 163, 3} {:message "RampInstantPool::bug_unchk_send15"} bug_unchk_send15#328(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 164, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return18:
	// Function body ends here
}

// 
// State variable: paymentDetailsHash: bytes32
var {:sourceloc "buggy_20.sol", 165, 3} {:message "paymentDetailsHash"} paymentDetailsHash#330: [address_t]int;
// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_20.sol", 167, 3} {:message "RampInstantPool::bug_unchk_send27"} bug_unchk_send27#343(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#23 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 168, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#23);
	$return19:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_20.sol", 170, 3} {:message "RampInstantPool::bug_unchk_send31"} bug_unchk_send31#362(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 171, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_20.sol", 173, 3} {:message "RampInstantPool::bug_unchk_send13"} bug_unchk_send13#381(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 174, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return21:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 177, 5} {:message "RampInstantPool::[constructor]"} __constructor#793(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#389: address_t, _minSwapAmount#391: int, _maxSwapAmount#393: int, _paymentDetailsHash#395: int, _assetType#397: int)
{
	var _minAmount#743#270: int;
	var _maxAmount#745#270: int;
	var call_arg#28: int_arr_ptr;
	var new_array#29: int_arr_ptr;
	var call_arg#30: int_arr_ptr;
	var new_array#31: int_arr_ptr;
	var _swapsContract#765#321: address_t;
	var _assetType#767#321: int;
	var call_arg#33: int_arr_ptr;
	var new_array#34: int_arr_ptr;
	var ASSET_TYPE#202_ret#35: int;
	var call_arg#36: int_arr_ptr;
	var new_array#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	ASSET_TYPE#270 := ASSET_TYPE#270[__this := 0];
	swapsContract#285 := swapsContract#285[__this := 0];
	minSwapAmount#300 := minSwapAmount#300[__this := 0];
	maxSwapAmount#315 := maxSwapAmount#315[__this := 0];
	paymentDetailsHash#330 := paymentDetailsHash#330[__this := 0];
	isActive#121 := isActive#121[__this := true];
	owner#17 := owner#17[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#17 := owner#17[__this := __msg_sender];
	$return22:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined modifier validateLimits starts here
	_minAmount#743#270 := _minSwapAmount#391;
	_maxAmount#745#270 := _maxSwapAmount#393;
	new_array#29 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#28 := new_array#29;
	mem_arr_int := mem_arr_int[call_arg#28 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#743#270 <= _maxAmount#745#270);
	new_array#31 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#30 := new_array#31;
	mem_arr_int := mem_arr_int[call_arg#30 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#745#270 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#765#321 := _swapsContract#389;
	_assetType#767#321 := _assetType#397;
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#33 := new_array#34;
	mem_arr_int := mem_arr_int[call_arg#33 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#765#321 != 0);
	assume {:sourceloc "buggy_20.sol", 302, 13} {:message ""} true;
	call ASSET_TYPE#202_ret#35 := ASSET_TYPE#202(_swapsContract#765#321, __this, 0);
	new_array#37 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#36 := new_array#37;
	mem_arr_int := mem_arr_int[call_arg#36 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#202_ret#35 == _assetType#767#321);
	// Function body starts here
	swapsContract#285 := swapsContract#285[__this := _swapsContract#389];
	paymentDetailsHash#330 := paymentDetailsHash#330[__this := _paymentDetailsHash#395];
	minSwapAmount#300 := minSwapAmount#300[__this := _minSwapAmount#391];
	maxSwapAmount#315 := maxSwapAmount#315[__this := _maxSwapAmount#393];
	ASSET_TYPE#270 := ASSET_TYPE#270[__this := _assetType#397];
	$return25:
	// Function body ends here
	$return24:
	// Inlined modifier validateSwapsContract ends here
	$return23:
	// Inlined modifier validateLimits ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_20.sol", 193, 1} {:message "RampInstantPool::bug_unchk_send1"} bug_unchk_send1#442(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#39 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 194, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#39);
	$return26:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 196, 5} {:message "RampInstantPool::availableFunds"} availableFunds#447(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#445: int);
	modifies ASSET_TYPE#270, swapsContract#285, minSwapAmount#300, maxSwapAmount#315, paymentDetailsHash#330, isActive#121, owner#17;

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_20.sol", 197, 1} {:message "RampInstantPool::bug_unchk_send2"} bug_unchk_send2#460(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#40 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 198, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#40);
	$return27:
	// Function body ends here
}

// 
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 200, 5} {:message "RampInstantPool::withdrawFunds"} withdrawFunds#469(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#462: address_t, _amount#464: int)
	returns (success#467: bool);
	modifies ASSET_TYPE#270, swapsContract#285, minSwapAmount#300, maxSwapAmount#315, paymentDetailsHash#330, isActive#121, owner#17;

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_20.sol", 202, 1} {:message "RampInstantPool::bug_unchk_send17"} bug_unchk_send17#482(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 203, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#41);
	$return28:
	// Function body ends here
}

// 
// Function: withdrawAllFunds : function (address payable) returns (bool)
procedure {:sourceloc "buggy_20.sol", 205, 5} {:message "RampInstantPool::withdrawAllFunds"} withdrawAllFunds#498(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#484: address_t)
	returns (success#489: bool)
{
	var call_arg#43: int_arr_ptr;
	var new_array#44: int_arr_ptr;
	var availableFunds#447_ret#46: int;
	var withdrawFunds#469_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#44 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#43 := new_array#44;
	mem_arr_int := mem_arr_int[call_arg#43 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 206, 35} {:message ""} true;
	call availableFunds#447_ret#46 := availableFunds#447(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_20.sol", 206, 16} {:message ""} true;
	call withdrawFunds#469_ret#47 := withdrawFunds#469(__this, __msg_sender, __msg_value, _to#484, availableFunds#447_ret#46);
	success#489 := withdrawFunds#469_ret#47;
	goto $return30;
	$return30:
	// Function body ends here
	$return29:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_20.sol", 208, 1} {:message "RampInstantPool::bug_unchk_send3"} bug_unchk_send3#511(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#48: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#48 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 209, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#48);
	$return31:
	// Function body ends here
}

// 
// Function: setLimits : function (uint256,uint256)
procedure {:sourceloc "buggy_20.sol", 211, 5} {:message "RampInstantPool::setLimits"} setLimits#538(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#513: int, _maxAmount#515: int)
{
	var call_arg#50: int_arr_ptr;
	var new_array#51: int_arr_ptr;
	var _minAmount#743#521: int;
	var _maxAmount#745#521: int;
	var call_arg#53: int_arr_ptr;
	var new_array#54: int_arr_ptr;
	var call_arg#55: int_arr_ptr;
	var new_array#56: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#51 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#50 := new_array#51;
	mem_arr_int := mem_arr_int[call_arg#50 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Inlined modifier validateLimits starts here
	_minAmount#743#521 := _minAmount#513;
	_maxAmount#745#521 := _maxAmount#515;
	new_array#54 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#53 := new_array#54;
	mem_arr_int := mem_arr_int[call_arg#53 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#743#521 <= _maxAmount#745#521);
	new_array#56 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#55 := new_array#56;
	mem_arr_int := mem_arr_int[call_arg#55 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#745#521 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Function body starts here
	minSwapAmount#300 := minSwapAmount#300[__this := _minAmount#513];
	maxSwapAmount#315 := maxSwapAmount#315[__this := _maxAmount#515];
	assume {:sourceloc "buggy_20.sol", 217, 14} {:message ""} true;
	call LimitsChanged#368(__this, __msg_sender, __msg_value, _minAmount#513, _maxAmount#515);
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier validateLimits ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_20.sol", 219, 1} {:message "RampInstantPool::bug_unchk_send9"} bug_unchk_send9#551(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#58: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#58 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 220, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#58);
	$return35:
	// Function body ends here
}

// 
// Function: setSwapsContract : function (address payable)
procedure {:sourceloc "buggy_20.sol", 222, 5} {:message "RampInstantPool::setSwapsContract"} setSwapsContract#576(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#553: address_t)
{
	var call_arg#60: int_arr_ptr;
	var new_array#61: int_arr_ptr;
	var _swapsContract#765#621: address_t;
	var _assetType#767#621: int;
	var call_arg#63: int_arr_ptr;
	var new_array#64: int_arr_ptr;
	var ASSET_TYPE#202_ret#65: int;
	var call_arg#66: int_arr_ptr;
	var new_array#67: int_arr_ptr;
	var {:sourceloc "buggy_20.sol", 225, 9} {:message "oldSwapsContract"} oldSwapsContract#563#68: address_t;
	var call_arg#69: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#61 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#60 := new_array#61;
	mem_arr_int := mem_arr_int[call_arg#60 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#765#621 := _swapsContract#553;
	_assetType#767#621 := ASSET_TYPE#270[__this];
	new_array#64 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#63 := new_array#64;
	mem_arr_int := mem_arr_int[call_arg#63 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#765#621 != 0);
	assume {:sourceloc "buggy_20.sol", 302, 13} {:message ""} true;
	call ASSET_TYPE#202_ret#65 := ASSET_TYPE#202(_swapsContract#765#621, __this, 0);
	new_array#67 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#66 := new_array#67;
	mem_arr_int := mem_arr_int[call_arg#66 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#202_ret#65 == _assetType#767#621);
	// Function body starts here
	oldSwapsContract#563#68 := swapsContract#285[__this];
	swapsContract#285 := swapsContract#285[__this := _swapsContract#553];
	call_arg#69 := _swapsContract#553;
	assume {:sourceloc "buggy_20.sol", 227, 14} {:message ""} true;
	call SwapsContractChanged#387(__this, __msg_sender, __msg_value, oldSwapsContract#563#68, call_arg#69);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier validateSwapsContract ends here
	$return36:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_20.sol", 229, 1} {:message "RampInstantPool::bug_unchk_send25"} bug_unchk_send25#589(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#70: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#70 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 230, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#70);
	$return39:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 232, 5} {:message "RampInstantPool::sendFundsToSwap"} sendFundsToSwap#597(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#591: int)
	returns (success#595: bool);
	modifies ASSET_TYPE#270, swapsContract#285, minSwapAmount#300, maxSwapAmount#315, paymentDetailsHash#330, isActive#121, owner#17;

// 
// Function: releaseSwap
procedure {:sourceloc "buggy_20.sol", 235, 5} {:message "RampInstantPool::releaseSwap"} releaseSwap#625(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#599: address_t, _oracle#601: address_t, _assetData#603: int_arr_ptr, _paymentDetailsHash#605: int)
{
	var call_arg#72: int_arr_ptr;
	var new_array#73: int_arr_ptr;
	var call_arg#75: address_t;
	var call_arg#76: int_arr_ptr;
	var new_array#77: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#73 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#72 := new_array#73;
	mem_arr_int := mem_arr_int[call_arg#72 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Function body starts here
	call_arg#75 := __this;
	new_array#77 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#76 := new_array#77;
	mem_arr_int := mem_arr_int[call_arg#76 := mem_arr_int[_assetData#603]];
	assume {:sourceloc "buggy_20.sol", 241, 9} {:message ""} true;
	call release#215(swapsContract#285[__this], __this, 0, call_arg#75, _receiver#599, _oracle#601, call_arg#76, _paymentDetailsHash#605);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_20.sol", 249, 1} {:message "RampInstantPool::bug_unchk_send19"} bug_unchk_send19#638(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#78: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#78 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 250, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#78);
	$return42:
	// Function body ends here
}

// 
// Function: returnSwap
procedure {:sourceloc "buggy_20.sol", 252, 5} {:message "RampInstantPool::returnSwap"} returnSwap#669(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#640: address_t, _oracle#642: address_t, _assetData#644: int_arr_ptr, _paymentDetailsHash#646: int)
{
	var call_arg#80: int_arr_ptr;
	var new_array#81: int_arr_ptr;
	var call_arg#83: int_arr_ptr;
	var new_array#84: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#81 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#80 := new_array#81;
	mem_arr_int := mem_arr_int[call_arg#80 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Function body starts here
	new_array#84 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#83 := new_array#84;
	mem_arr_int := mem_arr_int[call_arg#83 := mem_arr_int[_assetData#644]];
	assume {:sourceloc "buggy_20.sol", 258, 9} {:message ""} true;
	call returnFunds#241(swapsContract#285[__this], __this, 0, __this, _receiver#640, _oracle#642, call_arg#83, _paymentDetailsHash#646);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_20.sol", 266, 1} {:message "RampInstantPool::bug_unchk_send26"} bug_unchk_send26#682(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#85: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#85 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 267, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#85);
	$return45:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 273, 5} {:message "RampInstantPool::[fallback]"} #691(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#86: int_arr_ptr;
	var new_array#87: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	new_array#87 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#86 := new_array#87;
	mem_arr_int := mem_arr_int[call_arg#86 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 112][6 := 111][7 := 111][8 := 108][9 := 32][10 := 99][11 := 97][12 := 110][13 := 110][14 := 111][15 := 116][16 := 32][17 := 114][18 := 101][19 := 99][20 := 101][21 := 105][22 := 118][23 := 101][24 := 32][25 := 101][26 := 116][27 := 104][28 := 101][29 := 114], 30)];
	assume false;
	$return46:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_20.sol", 276, 1} {:message "RampInstantPool::bug_unchk_send20"} bug_unchk_send20#704(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#88: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#88 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 277, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#88);
	$return47:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 279, 5} {:message "RampInstantPool::[receive]"} #712(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#89: int_arr_ptr;
	var new_array#90: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	new_array#90 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#89 := new_array#90;
	mem_arr_int := mem_arr_int[call_arg#89 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 112][6 := 111][7 := 111][8 := 108][9 := 32][10 := 99][11 := 97][12 := 110][13 := 110][14 := 111][15 := 116][16 := 32][17 := 114][18 := 101][19 := 99][20 := 101][21 := 105][22 := 118][23 := 101][24 := 32][25 := 101][26 := 116][27 := 104][28 := 101][29 := 114], 30)];
	assume false;
	$return48:
	// Function body ends here
}

// 
// ------- Contract: RampInstantEthPool -------
// Inherits from: RampInstantPool
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_20.sol", 317, 3} {:message "RampInstantEthPool::bug_unchk_send28"} bug_unchk_send28#809(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#91: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#91 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 318, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#91);
	$return49:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 321, 5} {:message "RampInstantEthPool::[constructor]"} __constructor#974(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#814: address_t, _minSwapAmount#816: int, _maxSwapAmount#818: int, _paymentDetailsHash#820: int)
{
	var _swapsContract#389#92: address_t;
	var _minSwapAmount#391#92: int;
	var _maxSwapAmount#393#92: int;
	var _paymentDetailsHash#395#92: int;
	var _assetType#397#92: int;
	var _minAmount#743#940: int;
	var _maxAmount#745#940: int;
	var call_arg#95: int_arr_ptr;
	var new_array#96: int_arr_ptr;
	var call_arg#97: int_arr_ptr;
	var new_array#98: int_arr_ptr;
	var _swapsContract#765#991: address_t;
	var _assetType#767#991: int;
	var call_arg#100: int_arr_ptr;
	var new_array#101: int_arr_ptr;
	var ASSET_TYPE#202_ret#102: int;
	var call_arg#103: int_arr_ptr;
	var new_array#104: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	ASSET_TYPE#270 := ASSET_TYPE#270[__this := 0];
	swapsContract#285 := swapsContract#285[__this := 0];
	minSwapAmount#300 := minSwapAmount#300[__this := 0];
	maxSwapAmount#315 := maxSwapAmount#315[__this := 0];
	paymentDetailsHash#330 := paymentDetailsHash#330[__this := 0];
	isActive#121 := isActive#121[__this := true];
	owner#17 := owner#17[__this := 0];
	// Arguments for RampInstantPool
	_swapsContract#389#92 := _swapsContract#814;
	_minSwapAmount#391#92 := _minSwapAmount#816;
	_maxSwapAmount#393#92 := _maxSwapAmount#818;
	_paymentDetailsHash#395#92 := _paymentDetailsHash#820;
	_assetType#397#92 := 1;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#17 := owner#17[__this := __msg_sender];
	$return50:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for RampInstantPool starts here
	// Inlined modifier validateLimits starts here
	_minAmount#743#940 := _minSwapAmount#391#92;
	_maxAmount#745#940 := _maxSwapAmount#393#92;
	new_array#96 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#95 := new_array#96;
	mem_arr_int := mem_arr_int[call_arg#95 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#743#940 <= _maxAmount#745#940);
	new_array#98 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#97 := new_array#98;
	mem_arr_int := mem_arr_int[call_arg#97 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#745#940 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#765#991 := _swapsContract#389#92;
	_assetType#767#991 := _assetType#397#92;
	new_array#101 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#100 := new_array#101;
	mem_arr_int := mem_arr_int[call_arg#100 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#765#991 != 0);
	assume {:sourceloc "buggy_20.sol", 302, 13} {:message ""} true;
	call ASSET_TYPE#202_ret#102 := ASSET_TYPE#202(_swapsContract#765#991, __this, 0);
	new_array#104 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#103 := new_array#104;
	mem_arr_int := mem_arr_int[call_arg#103 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#202_ret#102 == _assetType#767#991);
	// Function body starts here
	swapsContract#285 := swapsContract#285[__this := _swapsContract#389#92];
	paymentDetailsHash#330 := paymentDetailsHash#330[__this := _paymentDetailsHash#395#92];
	minSwapAmount#300 := minSwapAmount#300[__this := _minSwapAmount#391#92];
	maxSwapAmount#315 := maxSwapAmount#315[__this := _maxSwapAmount#393#92];
	ASSET_TYPE#270 := ASSET_TYPE#270[__this := _assetType#397#92];
	$return53:
	// Function body ends here
	$return52:
	// Inlined modifier validateSwapsContract ends here
	$return51:
	// Inlined modifier validateLimits ends here
	// Inlined constructor for RampInstantPool ends here
	// Function body starts here
	$return54:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_20.sol", 331, 1} {:message "RampInstantEthPool::bug_unchk_send32"} bug_unchk_send32#844(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#107: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#107 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 332, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#107);
	$return55:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 334, 5} {:message "RampInstantEthPool::availableFunds"} availableFunds#857(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#848: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#848 := __balance[__this];
	goto $return56;
	$return56:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_20.sol", 337, 1} {:message "RampInstantEthPool::bug_unchk_send4"} bug_unchk_send4#870(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#108: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#108 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 338, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#108);
	$return57:
	// Function body ends here
}

// 
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 340, 5} {:message "RampInstantEthPool::withdrawFunds"} withdrawFunds#891(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#872: address_t, _amount#874: int)
	returns (success#880: bool)
{
	var call_arg#110: int_arr_ptr;
	var new_array#111: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#111 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#110 := new_array#111;
	mem_arr_int := mem_arr_int[call_arg#110 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#17[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 344, 9} {:message ""} true;
	call __transfer(_to#872, __this, 0, _amount#874);
	success#880 := true;
	goto $return59;
	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_20.sol", 347, 1} {:message "RampInstantEthPool::bug_unchk_send7"} bug_unchk_send7#904(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#113: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#113 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 348, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#113);
	$return60:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 350, 5} {:message "RampInstantEthPool::sendFundsToSwap"} sendFundsToSwap#928(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#906: int)
	returns (success#917: bool)
{
	var call_arg#115: int_arr_ptr;
	var new_array#116: int_arr_ptr;
	var call_arg#118: int_arr_ptr;
	var new_array#119: int_arr_ptr;
	var _amount#726#1202: int;
	var call_arg#121: int_arr_ptr;
	var new_array#122: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyActive starts here
	new_array#116 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#115 := new_array#116;
	mem_arr_int := mem_arr_int[call_arg#115 := int_arr#constr(default_int_int()[0 := 99][1 := 111][2 := 110][3 := 116][4 := 114][5 := 97][6 := 99][7 := 116][8 := 32][9 := 105][10 := 115][11 := 32][12 := 115][13 := 116][14 := 111][15 := 112][16 := 112][17 := 101][18 := 100], 19)];
	assume isActive#121[__this];
	// Inlined modifier onlySwapsContract starts here
	new_array#119 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#118 := new_array#119;
	mem_arr_int := mem_arr_int[call_arg#118 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 115][10 := 119][11 := 97][12 := 112][13 := 115][14 := 32][15 := 99][16 := 111][17 := 110][18 := 116][19 := 114][20 := 97][21 := 99][22 := 116][23 := 32][24 := 99][25 := 97][26 := 110][27 := 32][28 := 99][29 := 97][30 := 108][31 := 108][32 := 32][33 := 116][34 := 104][35 := 105][36 := 115], 37)];
	assume (__msg_sender == swapsContract#285[__this]);
	// Inlined modifier isWithinLimits starts here
	_amount#726#1202 := _amount#906;
	new_array#122 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#121 := new_array#122;
	mem_arr_int := mem_arr_int[call_arg#121 := int_arr#constr(default_int_int()[0 := 97][1 := 109][2 := 111][3 := 117][4 := 110][5 := 116][6 := 32][7 := 111][8 := 117][9 := 116][10 := 115][11 := 105][12 := 100][13 := 101][14 := 32][15 := 115][16 := 119][17 := 97][18 := 112][19 := 32][20 := 108][21 := 105][22 := 109][23 := 105][24 := 116][25 := 115], 26)];
	assume ((_amount#726#1202 >= minSwapAmount#300[__this]) && (_amount#726#1202 <= maxSwapAmount#315[__this]));
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 353, 9} {:message ""} true;
	call __transfer(swapsContract#285[__this], __this, 0, _amount#906);
	success#917 := true;
	goto $return64;
	$return64:
	// Function body ends here
	$return63:
	// Inlined modifier isWithinLimits ends here
	$return62:
	// Inlined modifier onlySwapsContract ends here
	$return61:
	// Inlined modifier onlyActive ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_20.sol", 356, 1} {:message "RampInstantEthPool::bug_unchk_send23"} bug_unchk_send23#941(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#124: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#124 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 357, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#124);
	$return65:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 362, 5} {:message "RampInstantEthPool::[receive]"} #960(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#125: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	if ((__msg_sender != swapsContract#285[__this])) {
	call_arg#125 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 364, 18} {:message ""} true;
	call ReceivedFunds#349(__this, __msg_sender, __msg_value, call_arg#125, __msg_value);
	}

	$return66:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_20.sol", 367, 1} {:message "RampInstantEthPool::bug_unchk_send14"} bug_unchk_send14#973(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#126: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#126 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 368, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#126);
	$return67:
	// Function body ends here
}

