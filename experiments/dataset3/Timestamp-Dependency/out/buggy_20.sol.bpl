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
procedure {:inline 1} {:sourceloc "buggy_20.sol", 38, 3} {:message "[event] Ownable::OwnerChanged"} OwnerChanged#25(__this: address_t, __msg_sender: address_t, __msg_value: int, oldOwner#21: address_t, newOwner#23: address_t)
{
	
}

// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_20.sol", 32, 3} {:message "Ownable::bug_tmstmp1"} bug_tmstmp1#13(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#5: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#5 := (__block_timestamp >= 1546300800);
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_20.sol", 35, 3} {:message "owner"} owner#15: [address_t]address_t;
// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_20.sol", 37, 3} {:message "bugv_tmstmp5"} bugv_tmstmp5#19: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 40, 5} {:message "Ownable::[constructor]"} __constructor#117(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#15 := owner#15[__this := 0];
	bugv_tmstmp5#19 := bugv_tmstmp5#19[__this := __block_timestamp];
	winner_tmstmp19#36 := winner_tmstmp19#36[__this := 0];
	winner_tmstmp26#94 := winner_tmstmp26#94[__this := 0];
	// Function body starts here
	owner#15 := owner#15[__this := __msg_sender];
	$return1:
	// Function body ends here
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_20.sol", 43, 1} {:message "winner_tmstmp19"} winner_tmstmp19#36: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 44, 1} {:message "Ownable::play_tmstmp19"} play_tmstmp19#62(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#38: int)
{
	var {:sourceloc "buggy_20.sol", 45, 2} {:message "_vtime"} _vtime#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#42 := __block_timestamp;
	if (((startTime#38 + 432000) == _vtime#42)) {
	winner_tmstmp19#36 := winner_tmstmp19#36[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: changeOwner
procedure {:sourceloc "buggy_20.sol", 54, 5} {:message "Ownable::changeOwner"} changeOwner#92(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#76: address_t)
{
	var call_arg#1: int_arr_ptr;
	var new_array#2: int_arr_ptr;
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#2 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#1 := new_array#2;
	mem_arr_int := mem_arr_int[call_arg#1 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Function body starts here
	owner#15 := owner#15[__this := _newOwner#76];
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 56, 14} {:message ""} true;
	call OwnerChanged#25(__this, __msg_sender, __msg_value, call_arg#4, _newOwner#76);
	$return4:
	// Function body ends here
	$return3:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_20.sol", 58, 1} {:message "winner_tmstmp26"} winner_tmstmp26#94: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 59, 1} {:message "Ownable::play_tmstmp26"} play_tmstmp26#116(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#96: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#96 + 432000) == __block_timestamp)) {
	winner_tmstmp26#94 := winner_tmstmp26#94[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// ------- Contract: Stoppable -------
// Inherits from: Ownable
// 
// Event: IsActiveChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 78, 3} {:message "[event] Stoppable::IsActiveChanged"} IsActiveChanged#155(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#153: bool)
{
	
}

// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_20.sol", 71, 3} {:message "winner_tmstmp2"} winner_tmstmp2#122: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 72, 1} {:message "Stoppable::play_tmstmp2"} play_tmstmp2#144(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#124: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#124 + 432000) == __block_timestamp)) {
	winner_tmstmp2#122 := winner_tmstmp2#122[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: isActive: bool
var {:sourceloc "buggy_20.sol", 75, 3} {:message "isActive"} isActive#147: [address_t]bool;
// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_20.sol", 77, 3} {:message "bugv_tmstmp1"} bugv_tmstmp1#151: [address_t]int;
// 
// Function: setIsActive
procedure {:sourceloc "buggy_20.sol", 85, 5} {:message "Stoppable::setIsActive"} setIsActive#185(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#166: bool)
{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Function body starts here
	if ((_isActive#166 == isActive#147[__this])) {
	goto $return8;
	}

	isActive#147 := isActive#147[__this := _isActive#166];
	assume {:sourceloc "buggy_20.sol", 88, 14} {:message ""} true;
	call IsActiveChanged#155(__this, __msg_sender, __msg_value, _isActive#166);
	$return8:
	// Function body ends here
	$return7:
	// Inlined modifier onlyOwner ends here
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_20.sol", 90, 1} {:message "Stoppable::bug_tmstmp20"} bug_tmstmp20#232(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 91, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#189: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#189 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#189);
	pastBlockTime_tmstmp20#189 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_20.sol", 96, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 69, 1} {:message "Stoppable::[implicit_constructor]"} __constructor#233(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp2#122 := winner_tmstmp2#122[__this := 0];
	isActive#147 := isActive#147[__this := true];
	bugv_tmstmp1#151 := bugv_tmstmp1#151[__this := __block_timestamp];
	owner#15 := owner#15[__this := 0];
	bugv_tmstmp5#19 := bugv_tmstmp5#19[__this := __block_timestamp];
	winner_tmstmp19#36 := winner_tmstmp19#36[__this := 0];
	winner_tmstmp26#94 := winner_tmstmp26#94[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#15 := owner#15[__this := __msg_sender];
	$return10:
	// Function body ends here
	// Inlined constructor for Ownable ends here
}

// 
// ------- Contract: RampInstantPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 108, 5} {:message "RampInstantPoolInterface::ASSET_TYPE"} ASSET_TYPE#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#237: int);

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 110, 5} {:message "RampInstantPoolInterface::sendFundsToSwap"} sendFundsToSwap#246(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#241: int)
	returns (success#244: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 106, 1} {:message "RampInstantPoolInterface::[implicit_constructor]"} __constructor#247(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: RampInstantEscrowsPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 121, 5} {:message "RampInstantEscrowsPoolInterface::ASSET_TYPE"} ASSET_TYPE#253(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#251: int);
	modifies winner_tmstmp38#328;

// 
// Function: release
procedure {:sourceloc "buggy_20.sol", 123, 5} {:message "RampInstantEscrowsPoolInterface::release"} release#266(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#255: address_t, _receiver#257: address_t, _oracle#259: address_t, _assetData#261: int_arr_ptr, _paymentDetailsHash#263: int);
	modifies winner_tmstmp38#328;

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_20.sol", 131, 1} {:message "RampInstantEscrowsPoolInterface::bug_tmstmp32"} bug_tmstmp32#313(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 132, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#270: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#270 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#270);
	pastBlockTime_tmstmp32#270 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_20.sol", 137, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// Function: returnFunds
procedure {:sourceloc "buggy_20.sol", 141, 5} {:message "RampInstantEscrowsPoolInterface::returnFunds"} returnFunds#326(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#315: address_t, _receiver#317: address_t, _oracle#319: address_t, _assetData#321: int_arr_ptr, _paymentDetailsHash#323: int);
	modifies winner_tmstmp38#328;

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_20.sol", 149, 1} {:message "winner_tmstmp38"} winner_tmstmp38#328: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 150, 1} {:message "RampInstantEscrowsPoolInterface::play_tmstmp38"} play_tmstmp38#350(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#330: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#330 + 432000) == __block_timestamp)) {
	winner_tmstmp38#328 := winner_tmstmp38#328[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 119, 1} {:message "RampInstantEscrowsPoolInterface::[implicit_constructor]"} __constructor#351(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp38#328 := winner_tmstmp38#328[__this := 0];
}

// 
// ------- Contract: RampInstantPool -------
// Inherits from: Ownable
// Inherits from: Stoppable
// Inherits from: RampInstantPoolInterface
// 
// Event: ReceivedFunds
procedure {:inline 1} {:sourceloc "buggy_20.sol", 196, 3} {:message "[event] RampInstantPool::ReceivedFunds"} ReceivedFunds#445(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#441: address_t, _amount#443: int)
{
	
}

// 
// Event: LimitsChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 198, 3} {:message "[event] RampInstantPool::LimitsChanged"} LimitsChanged#455(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#451: int, _maxAmount#453: int)
{
	
}

// 
// Event: SwapsContractChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 200, 3} {:message "[event] RampInstantPool::SwapsContractChanged"} SwapsContractChanged#465(__this: address_t, __msg_sender: address_t, __msg_value: int, _oldAddress#461: address_t, _newAddress#463: address_t)
{
	
}

// 
// State variable: ASSET_TYPE: uint16
var {:sourceloc "buggy_20.sol", 174, 5} {:message "ASSET_TYPE"} ASSET_TYPE#366: [address_t]int;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_20.sol", 176, 3} {:message "RampInstantPool::bug_tmstmp17"} bug_tmstmp17#377(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#369: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#369 := (__block_timestamp >= 1546300800);
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: swapsContract: address payable
var {:sourceloc "buggy_20.sol", 179, 3} {:message "swapsContract"} swapsContract#379: [address_t]address_t;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_20.sol", 180, 3} {:message "RampInstantPool::bug_tmstmp37"} bug_tmstmp37#390(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#382: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#382 := (__block_timestamp >= 1546300800);
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: minSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 183, 3} {:message "minSwapAmount"} minSwapAmount#392: [address_t]int;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_20.sol", 184, 3} {:message "winner_tmstmp3"} winner_tmstmp3#394: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 185, 1} {:message "RampInstantPool::play_tmstmp3"} play_tmstmp3#420(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#396: int)
{
	var {:sourceloc "buggy_20.sol", 186, 2} {:message "_vtime"} _vtime#400: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#400 := __block_timestamp;
	if (((startTime#396 + 432000) == _vtime#400)) {
	winner_tmstmp3#394 := winner_tmstmp3#394[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// State variable: maxSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 189, 3} {:message "maxSwapAmount"} maxSwapAmount#422: [address_t]int;
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_20.sol", 190, 3} {:message "RampInstantPool::bug_tmstmp9"} bug_tmstmp9#433(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#425: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#425 := (__block_timestamp >= 1546300800);
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: paymentDetailsHash: bytes32
var {:sourceloc "buggy_20.sol", 193, 3} {:message "paymentDetailsHash"} paymentDetailsHash#435: [address_t]int;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_20.sol", 195, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#439: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_20.sol", 197, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#449: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_20.sol", 199, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#459: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 202, 5} {:message "RampInstantPool::[constructor]"} __constructor#1055(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#467: address_t, _minSwapAmount#469: int, _maxSwapAmount#471: int, _paymentDetailsHash#473: int, _assetType#475: int)
{
	var _minAmount#1005#110: int;
	var _maxAmount#1007#110: int;
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	var call_arg#14: int_arr_ptr;
	var new_array#15: int_arr_ptr;
	var _swapsContract#1027#161: address_t;
	var _assetType#1029#161: int;
	var call_arg#17: int_arr_ptr;
	var new_array#18: int_arr_ptr;
	var ASSET_TYPE#253_ret#19: int;
	var call_arg#20: int_arr_ptr;
	var new_array#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	ASSET_TYPE#366 := ASSET_TYPE#366[__this := 0];
	swapsContract#379 := swapsContract#379[__this := 0];
	minSwapAmount#392 := minSwapAmount#392[__this := 0];
	winner_tmstmp3#394 := winner_tmstmp3#394[__this := 0];
	maxSwapAmount#422 := maxSwapAmount#422[__this := 0];
	paymentDetailsHash#435 := paymentDetailsHash#435[__this := 0];
	bugv_tmstmp2#439 := bugv_tmstmp2#439[__this := __block_timestamp];
	bugv_tmstmp3#449 := bugv_tmstmp3#449[__this := __block_timestamp];
	bugv_tmstmp4#459 := bugv_tmstmp4#459[__this := __block_timestamp];
	winner_tmstmp7#561 := winner_tmstmp7#561[__this := 0];
	winner_tmstmp23#598 := winner_tmstmp23#598[__this := 0];
	winner_tmstmp14#642 := winner_tmstmp14#642[__this := 0];
	winner_tmstmp30#693 := winner_tmstmp30#693[__this := 0];
	winner_tmstmp39#825 := winner_tmstmp39#825[__this := 0];
	winner_tmstmp35#948 := winner_tmstmp35#948[__this := 0];
	winner_tmstmp2#122 := winner_tmstmp2#122[__this := 0];
	isActive#147 := isActive#147[__this := true];
	bugv_tmstmp1#151 := bugv_tmstmp1#151[__this := __block_timestamp];
	owner#15 := owner#15[__this := 0];
	bugv_tmstmp5#19 := bugv_tmstmp5#19[__this := __block_timestamp];
	winner_tmstmp19#36 := winner_tmstmp19#36[__this := 0];
	winner_tmstmp26#94 := winner_tmstmp26#94[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#15 := owner#15[__this := __msg_sender];
	$return17:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined modifier validateLimits starts here
	_minAmount#1005#110 := _minSwapAmount#469;
	_maxAmount#1007#110 := _maxSwapAmount#471;
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#1005#110 <= _maxAmount#1007#110);
	new_array#15 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#14 := new_array#15;
	mem_arr_int := mem_arr_int[call_arg#14 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#1007#110 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#1027#161 := _swapsContract#467;
	_assetType#1029#161 := _assetType#475;
	new_array#18 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#17 := new_array#18;
	mem_arr_int := mem_arr_int[call_arg#17 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#1027#161 != 0);
	assume {:sourceloc "buggy_20.sol", 364, 13} {:message ""} true;
	call ASSET_TYPE#253_ret#19 := ASSET_TYPE#253(_swapsContract#1027#161, __this, 0);
	new_array#21 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#20 := new_array#21;
	mem_arr_int := mem_arr_int[call_arg#20 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#253_ret#19 == _assetType#1029#161);
	// Function body starts here
	swapsContract#379 := swapsContract#379[__this := _swapsContract#467];
	paymentDetailsHash#435 := paymentDetailsHash#435[__this := _paymentDetailsHash#473];
	minSwapAmount#392 := minSwapAmount#392[__this := _minSwapAmount#469];
	maxSwapAmount#422 := maxSwapAmount#422[__this := _maxSwapAmount#471];
	ASSET_TYPE#366 := ASSET_TYPE#366[__this := _assetType#475];
	$return20:
	// Function body ends here
	$return19:
	// Inlined modifier validateSwapsContract ends here
	$return18:
	// Inlined modifier validateLimits ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_20.sol", 218, 1} {:message "RampInstantPool::bug_tmstmp4"} bug_tmstmp4#554(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 219, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#511: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#511 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#511);
	pastBlockTime_tmstmp4#511 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_20.sol", 224, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return21:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 228, 5} {:message "RampInstantPool::availableFunds"} availableFunds#559(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#557: int);
	modifies ASSET_TYPE#366, swapsContract#379, minSwapAmount#392, winner_tmstmp3#394, maxSwapAmount#422, paymentDetailsHash#435, bugv_tmstmp2#439, bugv_tmstmp3#449, bugv_tmstmp4#459, winner_tmstmp7#561, winner_tmstmp23#598, winner_tmstmp14#642, winner_tmstmp30#693, winner_tmstmp39#825, winner_tmstmp35#948, winner_tmstmp2#122, isActive#147, bugv_tmstmp1#151, owner#15, bugv_tmstmp5#19, winner_tmstmp19#36, winner_tmstmp26#94;

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_20.sol", 229, 1} {:message "winner_tmstmp7"} winner_tmstmp7#561: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 230, 1} {:message "RampInstantPool::play_tmstmp7"} play_tmstmp7#587(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#563: int)
{
	var {:sourceloc "buggy_20.sol", 231, 2} {:message "_vtime"} _vtime#567: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#567 := __block_timestamp;
	if (((startTime#563 + 432000) == _vtime#567)) {
	winner_tmstmp7#561 := winner_tmstmp7#561[__this := __msg_sender];
	}

	$return22:
	// Function body ends here
}

// 
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 235, 5} {:message "RampInstantPool::withdrawFunds"} withdrawFunds#596(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#589: address_t, _amount#591: int)
	returns (success#594: bool);
	modifies ASSET_TYPE#366, swapsContract#379, minSwapAmount#392, winner_tmstmp3#394, maxSwapAmount#422, paymentDetailsHash#435, bugv_tmstmp2#439, bugv_tmstmp3#449, bugv_tmstmp4#459, winner_tmstmp7#561, winner_tmstmp23#598, winner_tmstmp14#642, winner_tmstmp30#693, winner_tmstmp39#825, winner_tmstmp35#948, winner_tmstmp2#122, isActive#147, bugv_tmstmp1#151, owner#15, bugv_tmstmp5#19, winner_tmstmp19#36, winner_tmstmp26#94;

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_20.sol", 237, 1} {:message "winner_tmstmp23"} winner_tmstmp23#598: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 238, 1} {:message "RampInstantPool::play_tmstmp23"} play_tmstmp23#624(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#600: int)
{
	var {:sourceloc "buggy_20.sol", 239, 2} {:message "_vtime"} _vtime#604: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#604 := __block_timestamp;
	if (((startTime#600 + 432000) == _vtime#604)) {
	winner_tmstmp23#598 := winner_tmstmp23#598[__this := __msg_sender];
	}

	$return23:
	// Function body ends here
}

// 
// Function: withdrawAllFunds : function (address payable) returns (bool)
procedure {:sourceloc "buggy_20.sol", 243, 5} {:message "RampInstantPool::withdrawAllFunds"} withdrawAllFunds#640(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#626: address_t)
	returns (success#631: bool)
{
	var call_arg#24: int_arr_ptr;
	var new_array#25: int_arr_ptr;
	var availableFunds#559_ret#27: int;
	var withdrawFunds#596_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#24 := new_array#25;
	mem_arr_int := mem_arr_int[call_arg#24 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 244, 35} {:message ""} true;
	call availableFunds#559_ret#27 := availableFunds#559(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_20.sol", 244, 16} {:message ""} true;
	call withdrawFunds#596_ret#28 := withdrawFunds#596(__this, __msg_sender, __msg_value, _to#626, availableFunds#559_ret#27);
	success#631 := withdrawFunds#596_ret#28;
	goto $return25;
	$return25:
	// Function body ends here
	$return24:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_20.sol", 246, 1} {:message "winner_tmstmp14"} winner_tmstmp14#642: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 247, 1} {:message "RampInstantPool::play_tmstmp14"} play_tmstmp14#664(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#644: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#644 + 432000) == __block_timestamp)) {
	winner_tmstmp14#642 := winner_tmstmp14#642[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// Function: setLimits : function (uint256,uint256)
procedure {:sourceloc "buggy_20.sol", 251, 5} {:message "RampInstantPool::setLimits"} setLimits#691(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#666: int, _maxAmount#668: int)
{
	var call_arg#30: int_arr_ptr;
	var new_array#31: int_arr_ptr;
	var _minAmount#1005#321: int;
	var _maxAmount#1007#321: int;
	var call_arg#33: int_arr_ptr;
	var new_array#34: int_arr_ptr;
	var call_arg#35: int_arr_ptr;
	var new_array#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#31 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#30 := new_array#31;
	mem_arr_int := mem_arr_int[call_arg#30 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Inlined modifier validateLimits starts here
	_minAmount#1005#321 := _minAmount#666;
	_maxAmount#1007#321 := _maxAmount#668;
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#33 := new_array#34;
	mem_arr_int := mem_arr_int[call_arg#33 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#1005#321 <= _maxAmount#1007#321);
	new_array#36 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#35 := new_array#36;
	mem_arr_int := mem_arr_int[call_arg#35 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#1007#321 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Function body starts here
	minSwapAmount#392 := minSwapAmount#392[__this := _minAmount#666];
	maxSwapAmount#422 := maxSwapAmount#422[__this := _maxAmount#668];
	assume {:sourceloc "buggy_20.sol", 257, 14} {:message ""} true;
	call LimitsChanged#455(__this, __msg_sender, __msg_value, _minAmount#666, _maxAmount#668);
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier validateLimits ends here
	$return27:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_20.sol", 259, 1} {:message "winner_tmstmp30"} winner_tmstmp30#693: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 260, 1} {:message "RampInstantPool::play_tmstmp30"} play_tmstmp30#715(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#695: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#695 + 432000) == __block_timestamp)) {
	winner_tmstmp30#693 := winner_tmstmp30#693[__this := __msg_sender];
	}

	$return30:
	// Function body ends here
}

// 
// Function: setSwapsContract : function (address payable)
procedure {:sourceloc "buggy_20.sol", 264, 5} {:message "RampInstantPool::setSwapsContract"} setSwapsContract#740(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#717: address_t)
{
	var call_arg#39: int_arr_ptr;
	var new_array#40: int_arr_ptr;
	var _swapsContract#1027#411: address_t;
	var _assetType#1029#411: int;
	var call_arg#42: int_arr_ptr;
	var new_array#43: int_arr_ptr;
	var ASSET_TYPE#253_ret#44: int;
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	var {:sourceloc "buggy_20.sol", 267, 9} {:message "oldSwapsContract"} oldSwapsContract#727#47: address_t;
	var call_arg#48: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#39 := new_array#40;
	mem_arr_int := mem_arr_int[call_arg#39 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#1027#411 := _swapsContract#717;
	_assetType#1029#411 := ASSET_TYPE#366[__this];
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#42 := new_array#43;
	mem_arr_int := mem_arr_int[call_arg#42 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#1027#411 != 0);
	assume {:sourceloc "buggy_20.sol", 364, 13} {:message ""} true;
	call ASSET_TYPE#253_ret#44 := ASSET_TYPE#253(_swapsContract#1027#411, __this, 0);
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#253_ret#44 == _assetType#1029#411);
	// Function body starts here
	oldSwapsContract#727#47 := swapsContract#379[__this];
	swapsContract#379 := swapsContract#379[__this := _swapsContract#717];
	call_arg#48 := _swapsContract#717;
	assume {:sourceloc "buggy_20.sol", 269, 14} {:message ""} true;
	call SwapsContractChanged#465(__this, __msg_sender, __msg_value, oldSwapsContract#727#47, call_arg#48);
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier validateSwapsContract ends here
	$return31:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_20.sol", 271, 1} {:message "RampInstantPool::bug_tmstmp8"} bug_tmstmp8#787(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 272, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#744: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#744 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#744);
	pastBlockTime_tmstmp8#744 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_20.sol", 277, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return34:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 281, 5} {:message "RampInstantPool::sendFundsToSwap"} sendFundsToSwap#795(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#789: int)
	returns (success#793: bool);
	modifies ASSET_TYPE#366, swapsContract#379, minSwapAmount#392, winner_tmstmp3#394, maxSwapAmount#422, paymentDetailsHash#435, bugv_tmstmp2#439, bugv_tmstmp3#449, bugv_tmstmp4#459, winner_tmstmp7#561, winner_tmstmp23#598, winner_tmstmp14#642, winner_tmstmp30#693, winner_tmstmp39#825, winner_tmstmp35#948, winner_tmstmp2#122, isActive#147, bugv_tmstmp1#151, owner#15, bugv_tmstmp5#19, winner_tmstmp19#36, winner_tmstmp26#94;

// 
// Function: releaseSwap
procedure {:sourceloc "buggy_20.sol", 284, 5} {:message "RampInstantPool::releaseSwap"} releaseSwap#823(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#797: address_t, _oracle#799: address_t, _assetData#801: int_arr_ptr, _paymentDetailsHash#803: int)
{
	var call_arg#50: int_arr_ptr;
	var new_array#51: int_arr_ptr;
	var call_arg#53: address_t;
	var call_arg#54: int_arr_ptr;
	var new_array#55: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#51 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#50 := new_array#51;
	mem_arr_int := mem_arr_int[call_arg#50 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Function body starts here
	call_arg#53 := __this;
	new_array#55 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#54 := new_array#55;
	mem_arr_int := mem_arr_int[call_arg#54 := mem_arr_int[_assetData#801]];
	assume {:sourceloc "buggy_20.sol", 290, 9} {:message ""} true;
	call release#266(swapsContract#379[__this], __this, 0, call_arg#53, _receiver#797, _oracle#799, call_arg#54, _paymentDetailsHash#803);
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_20.sol", 298, 1} {:message "winner_tmstmp39"} winner_tmstmp39#825: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 299, 1} {:message "RampInstantPool::play_tmstmp39"} play_tmstmp39#851(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#827: int)
{
	var {:sourceloc "buggy_20.sol", 300, 2} {:message "_vtime"} _vtime#831: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#831 := __block_timestamp;
	if (((startTime#827 + 432000) == _vtime#831)) {
	winner_tmstmp39#825 := winner_tmstmp39#825[__this := __msg_sender];
	}

	$return37:
	// Function body ends here
}

// 
// Function: returnSwap
procedure {:sourceloc "buggy_20.sol", 304, 5} {:message "RampInstantPool::returnSwap"} returnSwap#882(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#853: address_t, _oracle#855: address_t, _assetData#857: int_arr_ptr, _paymentDetailsHash#859: int)
{
	var call_arg#57: int_arr_ptr;
	var new_array#58: int_arr_ptr;
	var call_arg#60: int_arr_ptr;
	var new_array#61: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#58 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#57 := new_array#58;
	mem_arr_int := mem_arr_int[call_arg#57 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Function body starts here
	new_array#61 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#60 := new_array#61;
	mem_arr_int := mem_arr_int[call_arg#60 := mem_arr_int[_assetData#857]];
	assume {:sourceloc "buggy_20.sol", 310, 9} {:message ""} true;
	call returnFunds#326(swapsContract#379[__this], __this, 0, __this, _receiver#853, _oracle#855, call_arg#60, _paymentDetailsHash#859);
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_20.sol", 318, 1} {:message "RampInstantPool::bug_tmstmp36"} bug_tmstmp36#929(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 319, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#886: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#886 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#886);
	pastBlockTime_tmstmp36#886 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_20.sol", 324, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return40:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 332, 5} {:message "RampInstantPool::[receive]"} #938(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#62: int_arr_ptr;
	var new_array#63: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	new_array#63 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#62 := new_array#63;
	mem_arr_int := mem_arr_int[call_arg#62 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 112][6 := 111][7 := 111][8 := 108][9 := 32][10 := 99][11 := 97][12 := 110][13 := 110][14 := 111][15 := 116][16 := 32][17 := 114][18 := 101][19 := 99][20 := 101][21 := 105][22 := 118][23 := 101][24 := 32][25 := 101][26 := 116][27 := 104][28 := 101][29 := 114], 30)];
	assume false;
	$return41:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 336, 5} {:message "RampInstantPool::[fallback]"} #946(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#64: int_arr_ptr;
	var new_array#65: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	new_array#65 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#64 := new_array#65;
	mem_arr_int := mem_arr_int[call_arg#64 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 112][6 := 111][7 := 111][8 := 108][9 := 32][10 := 99][11 := 97][12 := 110][13 := 110][14 := 111][15 := 116][16 := 32][17 := 114][18 := 101][19 := 99][20 := 101][21 := 105][22 := 118][23 := 101][24 := 32][25 := 101][26 := 116][27 := 104][28 := 101][29 := 114], 30)];
	assume false;
	$return42:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_20.sol", 339, 1} {:message "winner_tmstmp35"} winner_tmstmp35#948: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 340, 1} {:message "RampInstantPool::play_tmstmp35"} play_tmstmp35#974(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#950: int)
{
	var {:sourceloc "buggy_20.sol", 341, 2} {:message "_vtime"} _vtime#954: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#954 := __block_timestamp;
	if (((startTime#950 + 432000) == _vtime#954)) {
	winner_tmstmp35#948 := winner_tmstmp35#948[__this := __msg_sender];
	}

	$return43:
	// Function body ends here
}

// 
// ------- Contract: RampInstantEthPool -------
// Inherits from: RampInstantPool
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_20.sol", 379, 3} {:message "RampInstantEthPool::bug_tmstmp25"} bug_tmstmp25#1069(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1061: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1061 := (__block_timestamp >= 1546300800);
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 384, 5} {:message "RampInstantEthPool::[constructor]"} __constructor#1312(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#1074: address_t, _minSwapAmount#1076: int, _maxSwapAmount#1078: int, _paymentDetailsHash#1080: int)
{
	var _swapsContract#467#66: address_t;
	var _minSwapAmount#469#66: int;
	var _maxSwapAmount#471#66: int;
	var _paymentDetailsHash#473#66: int;
	var _assetType#475#66: int;
	var _minAmount#1005#680: int;
	var _maxAmount#1007#680: int;
	var call_arg#69: int_arr_ptr;
	var new_array#70: int_arr_ptr;
	var call_arg#71: int_arr_ptr;
	var new_array#72: int_arr_ptr;
	var _swapsContract#1027#731: address_t;
	var _assetType#1029#731: int;
	var call_arg#74: int_arr_ptr;
	var new_array#75: int_arr_ptr;
	var ASSET_TYPE#253_ret#76: int;
	var call_arg#77: int_arr_ptr;
	var new_array#78: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp27#1185 := winner_tmstmp27#1185[__this := 0];
	winner_tmstmp31#1237 := winner_tmstmp31#1237[__this := 0];
	ASSET_TYPE#366 := ASSET_TYPE#366[__this := 0];
	swapsContract#379 := swapsContract#379[__this := 0];
	minSwapAmount#392 := minSwapAmount#392[__this := 0];
	winner_tmstmp3#394 := winner_tmstmp3#394[__this := 0];
	maxSwapAmount#422 := maxSwapAmount#422[__this := 0];
	paymentDetailsHash#435 := paymentDetailsHash#435[__this := 0];
	bugv_tmstmp2#439 := bugv_tmstmp2#439[__this := __block_timestamp];
	bugv_tmstmp3#449 := bugv_tmstmp3#449[__this := __block_timestamp];
	bugv_tmstmp4#459 := bugv_tmstmp4#459[__this := __block_timestamp];
	winner_tmstmp7#561 := winner_tmstmp7#561[__this := 0];
	winner_tmstmp23#598 := winner_tmstmp23#598[__this := 0];
	winner_tmstmp14#642 := winner_tmstmp14#642[__this := 0];
	winner_tmstmp30#693 := winner_tmstmp30#693[__this := 0];
	winner_tmstmp39#825 := winner_tmstmp39#825[__this := 0];
	winner_tmstmp35#948 := winner_tmstmp35#948[__this := 0];
	winner_tmstmp2#122 := winner_tmstmp2#122[__this := 0];
	isActive#147 := isActive#147[__this := true];
	bugv_tmstmp1#151 := bugv_tmstmp1#151[__this := __block_timestamp];
	owner#15 := owner#15[__this := 0];
	bugv_tmstmp5#19 := bugv_tmstmp5#19[__this := __block_timestamp];
	winner_tmstmp19#36 := winner_tmstmp19#36[__this := 0];
	winner_tmstmp26#94 := winner_tmstmp26#94[__this := 0];
	// Arguments for RampInstantPool
	_swapsContract#467#66 := _swapsContract#1074;
	_minSwapAmount#469#66 := _minSwapAmount#1076;
	_maxSwapAmount#471#66 := _maxSwapAmount#1078;
	_paymentDetailsHash#473#66 := _paymentDetailsHash#1080;
	_assetType#475#66 := 1;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#15 := owner#15[__this := __msg_sender];
	$return45:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for RampInstantPool starts here
	// Inlined modifier validateLimits starts here
	_minAmount#1005#680 := _minSwapAmount#469#66;
	_maxAmount#1007#680 := _maxSwapAmount#471#66;
	new_array#70 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#69 := new_array#70;
	mem_arr_int := mem_arr_int[call_arg#69 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#1005#680 <= _maxAmount#1007#680);
	new_array#72 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#71 := new_array#72;
	mem_arr_int := mem_arr_int[call_arg#71 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#1007#680 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#1027#731 := _swapsContract#467#66;
	_assetType#1029#731 := _assetType#475#66;
	new_array#75 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#74 := new_array#75;
	mem_arr_int := mem_arr_int[call_arg#74 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#1027#731 != 0);
	assume {:sourceloc "buggy_20.sol", 364, 13} {:message ""} true;
	call ASSET_TYPE#253_ret#76 := ASSET_TYPE#253(_swapsContract#1027#731, __this, 0);
	new_array#78 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#77 := new_array#78;
	mem_arr_int := mem_arr_int[call_arg#77 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#253_ret#76 == _assetType#1029#731);
	// Function body starts here
	swapsContract#379 := swapsContract#379[__this := _swapsContract#467#66];
	paymentDetailsHash#435 := paymentDetailsHash#435[__this := _paymentDetailsHash#473#66];
	minSwapAmount#392 := minSwapAmount#392[__this := _minSwapAmount#469#66];
	maxSwapAmount#422 := maxSwapAmount#422[__this := _maxSwapAmount#471#66];
	ASSET_TYPE#366 := ASSET_TYPE#366[__this := _assetType#475#66];
	$return48:
	// Function body ends here
	$return47:
	// Inlined modifier validateSwapsContract ends here
	$return46:
	// Inlined modifier validateLimits ends here
	// Inlined constructor for RampInstantPool ends here
	// Function body starts here
	$return49:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_20.sol", 394, 1} {:message "RampInstantEthPool::bug_tmstmp40"} bug_tmstmp40#1138(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 395, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1095: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1095 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1095);
	pastBlockTime_tmstmp40#1095 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_20.sol", 400, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return50:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 404, 5} {:message "RampInstantEthPool::availableFunds"} availableFunds#1151(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1142: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1142 := __balance[__this];
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_20.sol", 407, 1} {:message "RampInstantEthPool::bug_tmstmp33"} bug_tmstmp33#1162(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1154: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1154 := (__block_timestamp >= 1546300800);
	goto $return52;
	$return52:
	// Function body ends here
}

// 
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 411, 5} {:message "RampInstantEthPool::withdrawFunds"} withdrawFunds#1183(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1164: address_t, _amount#1166: int)
	returns (success#1172: bool)
{
	var call_arg#82: int_arr_ptr;
	var new_array#83: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#83 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#82 := new_array#83;
	mem_arr_int := mem_arr_int[call_arg#82 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#15[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 415, 9} {:message ""} true;
	call __transfer(_to#1164, __this, 0, _amount#1166);
	success#1172 := true;
	goto $return54;
	$return54:
	// Function body ends here
	$return53:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_20.sol", 418, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1185: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 419, 1} {:message "RampInstantEthPool::play_tmstmp27"} play_tmstmp27#1211(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1187: int)
{
	var {:sourceloc "buggy_20.sol", 420, 2} {:message "_vtime"} _vtime#1191: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1191 := __block_timestamp;
	if (((startTime#1187 + 432000) == _vtime#1191)) {
	winner_tmstmp27#1185 := winner_tmstmp27#1185[__this := __msg_sender];
	}

	$return55:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 424, 5} {:message "RampInstantEthPool::sendFundsToSwap"} sendFundsToSwap#1235(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#1213: int)
	returns (success#1224: bool)
{
	var call_arg#86: int_arr_ptr;
	var new_array#87: int_arr_ptr;
	var call_arg#89: int_arr_ptr;
	var new_array#90: int_arr_ptr;
	var _amount#988#912: int;
	var call_arg#92: int_arr_ptr;
	var new_array#93: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyActive starts here
	new_array#87 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#86 := new_array#87;
	mem_arr_int := mem_arr_int[call_arg#86 := int_arr#constr(default_int_int()[0 := 99][1 := 111][2 := 110][3 := 116][4 := 114][5 := 97][6 := 99][7 := 116][8 := 32][9 := 105][10 := 115][11 := 32][12 := 115][13 := 116][14 := 111][15 := 112][16 := 112][17 := 101][18 := 100], 19)];
	assume isActive#147[__this];
	// Inlined modifier onlySwapsContract starts here
	new_array#90 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#89 := new_array#90;
	mem_arr_int := mem_arr_int[call_arg#89 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 115][10 := 119][11 := 97][12 := 112][13 := 115][14 := 32][15 := 99][16 := 111][17 := 110][18 := 116][19 := 114][20 := 97][21 := 99][22 := 116][23 := 32][24 := 99][25 := 97][26 := 110][27 := 32][28 := 99][29 := 97][30 := 108][31 := 108][32 := 32][33 := 116][34 := 104][35 := 105][36 := 115], 37)];
	assume (__msg_sender == swapsContract#379[__this]);
	// Inlined modifier isWithinLimits starts here
	_amount#988#912 := _amount#1213;
	new_array#93 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#92 := new_array#93;
	mem_arr_int := mem_arr_int[call_arg#92 := int_arr#constr(default_int_int()[0 := 97][1 := 109][2 := 111][3 := 117][4 := 110][5 := 116][6 := 32][7 := 111][8 := 117][9 := 116][10 := 115][11 := 105][12 := 100][13 := 101][14 := 32][15 := 115][16 := 119][17 := 97][18 := 112][19 := 32][20 := 108][21 := 105][22 := 109][23 := 105][24 := 116][25 := 115], 26)];
	assume ((_amount#988#912 >= minSwapAmount#392[__this]) && (_amount#988#912 <= maxSwapAmount#422[__this]));
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 427, 9} {:message ""} true;
	call __transfer(swapsContract#379[__this], __this, 0, _amount#1213);
	success#1224 := true;
	goto $return59;
	$return59:
	// Function body ends here
	$return58:
	// Inlined modifier isWithinLimits ends here
	$return57:
	// Inlined modifier onlySwapsContract ends here
	$return56:
	// Inlined modifier onlyActive ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_20.sol", 430, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1237: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 431, 1} {:message "RampInstantEthPool::play_tmstmp31"} play_tmstmp31#1263(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1239: int)
{
	var {:sourceloc "buggy_20.sol", 432, 2} {:message "_vtime"} _vtime#1243: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1243 := __block_timestamp;
	if (((startTime#1239 + 432000) == _vtime#1243)) {
	winner_tmstmp31#1237 := winner_tmstmp31#1237[__this := __msg_sender];
	}

	$return60:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 439, 5} {:message "RampInstantEthPool::[receive]"} #1282(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#95: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	if ((__msg_sender != swapsContract#379[__this])) {
	call_arg#95 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 441, 18} {:message ""} true;
	call ReceivedFunds#445(__this, __msg_sender, __msg_value, call_arg#95, __msg_value);
	}

	$return61:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 445, 5} {:message "RampInstantEthPool::[fallback]"} #1300(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#96: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	if ((__msg_sender != swapsContract#379[__this])) {
	call_arg#96 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 447, 18} {:message ""} true;
	call ReceivedFunds#445(__this, __msg_sender, __msg_value, call_arg#96, __msg_value);
	}

	$return62:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_20.sol", 450, 1} {:message "RampInstantEthPool::bug_tmstmp13"} bug_tmstmp13#1311(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1303: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1303 := (__block_timestamp >= 1546300800);
	goto $return63;
	$return63:
	// Function body ends here
}

