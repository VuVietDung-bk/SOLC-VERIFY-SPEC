// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_50.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: digitalNotary -------
// 
// Event: RegisterHashEvent
procedure {:inline 1} {:sourceloc "buggy_50.sol", 62, 3} {:message "[event] digitalNotary::RegisterHashEvent"} RegisterHashEvent#201(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#195: address_t, hash#197: int, timestamp#199: int)
{
	
}

// 
// Event: ChangeHashOwnershipEvent
procedure {:inline 1} {:sourceloc "buggy_50.sol", 65, 3} {:message "[event] digitalNotary::ChangeHashOwnershipEvent"} ChangeHashOwnershipEvent#215(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#207: address_t, newowner#209: address_t, hash#211: int, timestamp#213: int)
{
	
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_50.sol", 10, 3} {:message "digitalNotary::bug_tmstmp9"} bug_tmstmp9#12(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#4 := (__block_timestamp >= 1546300800);
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// State variable: manager: address payable
var {:sourceloc "buggy_50.sol", 13, 3} {:message "manager"} manager#14: [address_t]address_t;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_50.sol", 15, 3} {:message "digitalNotary::bug_tmstmp25"} bug_tmstmp25#25(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#17: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#17 := (__block_timestamp >= 1546300800);
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// State variable: contractactive: bool
var {:sourceloc "buggy_50.sol", 18, 3} {:message "contractactive"} contractactive#27: [address_t]bool;
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_50.sol", 20, 3} {:message "winner_tmstmp19"} winner_tmstmp19#29: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 21, 1} {:message "digitalNotary::play_tmstmp19"} play_tmstmp19#55(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#31: int)
{
	var {:sourceloc "buggy_50.sol", 22, 2} {:message "_vtime"} _vtime#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#35 := __block_timestamp;
	if (((startTime#31 + 432000) == _vtime#35)) {
	winner_tmstmp19#29 := winner_tmstmp19#29[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: hashfee: uint256
var {:sourceloc "buggy_50.sol", 25, 3} {:message "hashfee"} hashfee#57: [address_t]int;
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_50.sol", 27, 3} {:message "winner_tmstmp26"} winner_tmstmp26#59: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 28, 1} {:message "digitalNotary::play_tmstmp26"} play_tmstmp26#81(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#61: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#61 + 432000) == __block_timestamp)) {
	winner_tmstmp26#59 := winner_tmstmp26#59[__this := __msg_sender];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: changehashownerfee: uint256
var {:sourceloc "buggy_50.sol", 31, 3} {:message "changehashownerfee"} changehashownerfee#83: [address_t]int;
// 
// ------- Struct HashRegistration -------
// Storage
type {:datatype} struct_storage_HashRegistration#88;
function {:constructor} HashRegistration#88#constr(owner#85: address_t, registrationtime#87: int) returns (struct_storage_HashRegistration#88);
// Memory
type address_struct_memory_HashRegistration#88 = int;
// Member owner
var {:sourceloc "buggy_50.sol", 35, 9} {:message "owner"} owner#85: [address_struct_memory_HashRegistration#88]address_t;
// Member registrationtime
var {:sourceloc "buggy_50.sol", 36, 9} {:message "registrationtime"} registrationtime#87: [address_struct_memory_HashRegistration#88]int;
// 
// ------- End of struct HashRegistration -------
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_50.sol", 39, 3} {:message "digitalNotary::bug_tmstmp20"} bug_tmstmp20#135(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 40, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#92 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#92);
	pastBlockTime_tmstmp20#92 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_50.sol", 45, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return4:
	// Function body ends here
}

// 
// State variable: HashList: mapping(bytes32 => struct digitalNotary.HashRegistration storage ref[] storage ref)
type {:datatype} struct_storage_HashRegistration#88_arr_type;
function {:constructor} struct_storage_HashRegistration#88_arr#constr(arr: [int]struct_storage_HashRegistration#88, length: int) returns (struct_storage_HashRegistration#88_arr_type);
var {:sourceloc "buggy_50.sol", 48, 3} {:message "HashList"} HashList#140: [address_t][int]struct_storage_HashRegistration#88_arr_type;
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_50.sol", 50, 3} {:message "digitalNotary::bug_tmstmp32"} bug_tmstmp32#187(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 51, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#144: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#144 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#144);
	pastBlockTime_tmstmp32#144 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_50.sol", 56, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return5:
	// Function body ends here
}

// 
// State variable: HashListLength: uint256
var {:sourceloc "buggy_50.sol", 59, 3} {:message "HashListLength"} HashListLength#189: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_50.sol", 61, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#193: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_50.sol", 64, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#205: [address_t]int;
function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#88|)) (|HashRegistration#88#constr| 0 0))"} default_int_struct_storage_HashRegistration#88() returns ([int]struct_storage_HashRegistration#88);
function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#88_arr_type|)) (|struct_storage_HashRegistration#88_arr#constr| ((as const (Array Int |T@struct_storage_HashRegistration#88|)) (|HashRegistration#88#constr| 0 0)) 0))"} default_int_struct_storage_HashRegistration#88_arr_type() returns ([int]struct_storage_HashRegistration#88_arr_type);
// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 67, 5} {:message "digitalNotary::[constructor]"} __constructor#1065(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	manager#14 := manager#14[__this := 0];
	contractactive#27 := contractactive#27[__this := false];
	winner_tmstmp19#29 := winner_tmstmp19#29[__this := 0];
	hashfee#57 := hashfee#57[__this := 0];
	winner_tmstmp26#59 := winner_tmstmp26#59[__this := 0];
	changehashownerfee#83 := changehashownerfee#83[__this := 0];
	HashList#140 := HashList#140[__this := default_int_struct_storage_HashRegistration#88_arr_type()];
	HashListLength#189 := HashListLength#189[__this := 0];
	bugv_tmstmp3#193 := bugv_tmstmp3#193[__this := __block_timestamp];
	bugv_tmstmp4#205 := bugv_tmstmp4#205[__this := __block_timestamp];
	winner_tmstmp38#245 := winner_tmstmp38#245[__this := 0];
	bugv_tmstmp2#282 := bugv_tmstmp2#282[__this := __block_timestamp];
	winner_tmstmp7#357 := winner_tmstmp7#357[__this := 0];
	winner_tmstmp23#393 := winner_tmstmp23#393[__this := 0];
	winner_tmstmp14#439 := winner_tmstmp14#439[__this := 0];
	winner_tmstmp30#471 := winner_tmstmp30#471[__this := 0];
	winner_tmstmp39#562 := winner_tmstmp39#562[__this := 0];
	winner_tmstmp35#668 := winner_tmstmp35#668[__this := 0];
	winner_tmstmp27#801 := winner_tmstmp27#801[__this := 0];
	winner_tmstmp31#873 := winner_tmstmp31#873[__this := 0];
	bugv_tmstmp5#1056 := bugv_tmstmp5#1056[__this := __block_timestamp];
	bugv_tmstmp1#1064 := bugv_tmstmp1#1064[__this := __block_timestamp];
	// Function body starts here
	manager#14 := manager#14[__this := __msg_sender];
	contractactive#27 := contractactive#27[__this := true];
	hashfee#57 := hashfee#57[__this := 5000000000000000];
	changehashownerfee#83 := changehashownerfee#83[__this := 25000000000000000];
	HashListLength#189 := HashListLength#189[__this := 0];
	$return6:
	// Function body ends here
}

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_50.sol", 81, 1} {:message "winner_tmstmp38"} winner_tmstmp38#245: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 82, 1} {:message "digitalNotary::play_tmstmp38"} play_tmstmp38#267(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#247: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#247 + 432000) == __block_timestamp)) {
	winner_tmstmp38#245 := winner_tmstmp38#245[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_50.sol", 91, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#282: [address_t]int;
// 
// Function: gethashfee
procedure {:sourceloc "buggy_50.sol", 94, 5} {:message "digitalNotary::gethashfee"} gethashfee#290(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#285: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#285 := hashfee#57[__this];
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_50.sol", 98, 1} {:message "digitalNotary::bug_tmstmp4"} bug_tmstmp4#337(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 99, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#294: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#294 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#294);
	pastBlockTime_tmstmp4#294 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_50.sol", 104, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// Function: sethashfee
procedure {:sourceloc "buggy_50.sol", 108, 5} {:message "digitalNotary::sethashfee"} sethashfee#355(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#339: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#14[__this]);
	// Function body starts here
	assume (newfee#339 >= 0);
	hashfee#57 := hashfee#57[__this := newfee#339];
	$return11:
	// Function body ends here
	$return10:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_50.sol", 114, 1} {:message "winner_tmstmp7"} winner_tmstmp7#357: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 115, 1} {:message "digitalNotary::play_tmstmp7"} play_tmstmp7#383(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#359: int)
{
	var {:sourceloc "buggy_50.sol", 116, 2} {:message "_vtime"} _vtime#363: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#363 := __block_timestamp;
	if (((startTime#359 + 432000) == _vtime#363)) {
	winner_tmstmp7#357 := winner_tmstmp7#357[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// Function: getchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 120, 5} {:message "digitalNotary::getchangehashownerfee"} getchangehashownerfee#391(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#386: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#386 := changehashownerfee#83[__this];
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_50.sol", 124, 1} {:message "winner_tmstmp23"} winner_tmstmp23#393: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 125, 1} {:message "digitalNotary::play_tmstmp23"} play_tmstmp23#419(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#395: int)
{
	var {:sourceloc "buggy_50.sol", 126, 2} {:message "_vtime"} _vtime#399: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#399 := __block_timestamp;
	if (((startTime#395 + 432000) == _vtime#399)) {
	winner_tmstmp23#393 := winner_tmstmp23#393[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// Function: setchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 130, 6} {:message "digitalNotary::setchangehashownerfee"} setchangehashownerfee#437(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#421: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#14[__this]);
	// Function body starts here
	assume (newfee#421 >= 0);
	changehashownerfee#83 := changehashownerfee#83[__this := newfee#421];
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_50.sol", 136, 1} {:message "winner_tmstmp14"} winner_tmstmp14#439: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 137, 1} {:message "digitalNotary::play_tmstmp14"} play_tmstmp14#461(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#441: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#441 + 432000) == __block_timestamp)) {
	winner_tmstmp14#439 := winner_tmstmp14#439[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// Function: getcontractactive
procedure {:sourceloc "buggy_50.sol", 141, 5} {:message "digitalNotary::getcontractactive"} getcontractactive#469(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#464: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#464 := contractactive#27[__this];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_50.sol", 145, 1} {:message "winner_tmstmp30"} winner_tmstmp30#471: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 146, 1} {:message "digitalNotary::play_tmstmp30"} play_tmstmp30#493(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#473: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#473 + 432000) == __block_timestamp)) {
	winner_tmstmp30#471 := winner_tmstmp30#471[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: setcontractactive
procedure {:sourceloc "buggy_50.sol", 150, 5} {:message "digitalNotary::setcontractactive"} setcontractactive#505(__this: address_t, __msg_sender: address_t, __msg_value: int, contactive#495: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#14[__this]);
	// Function body starts here
	contractactive#27 := contractactive#27[__this := contactive#495];
	$return21:
	// Function body ends here
	$return20:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_50.sol", 154, 1} {:message "digitalNotary::bug_tmstmp8"} bug_tmstmp8#552(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 155, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#509: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#509 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#509);
	pastBlockTime_tmstmp8#509 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_50.sol", 160, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return22:
	// Function body ends here
}

// 
// Function: getmanager
procedure {:sourceloc "buggy_50.sol", 164, 6} {:message "digitalNotary::getmanager"} getmanager#560(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#555: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#555 := manager#14[__this];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_50.sol", 168, 1} {:message "winner_tmstmp39"} winner_tmstmp39#562: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 169, 1} {:message "digitalNotary::play_tmstmp39"} play_tmstmp39#588(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#564: int)
{
	var {:sourceloc "buggy_50.sol", 170, 2} {:message "_vtime"} _vtime#568: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#568 := __block_timestamp;
	if (((startTime#564 + 432000) == _vtime#568)) {
	winner_tmstmp39#562 := winner_tmstmp39#562[__this := __msg_sender];
	}

	$return24:
	// Function body ends here
}

// 
// Function: setmanager
procedure {:sourceloc "buggy_50.sol", 174, 5} {:message "digitalNotary::setmanager"} setmanager#607(__this: address_t, __msg_sender: address_t, __msg_value: int, newmngr#590: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#14[__this]);
	// Function body starts here
	assume (__balance[newmngr#590] > 0);
	manager#14 := manager#14[__this := newmngr#590];
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_50.sol", 179, 1} {:message "digitalNotary::bug_tmstmp36"} bug_tmstmp36#654(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 180, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#611: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#611 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#611);
	pastBlockTime_tmstmp36#611 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_50.sol", 185, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return27:
	// Function body ends here
}

// 
// Function: getcontractbalance : function () view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 189, 5} {:message "digitalNotary::getcontractbalance"} getcontractbalance#666(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#657: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#657 := __balance[__this];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_50.sol", 194, 1} {:message "winner_tmstmp35"} winner_tmstmp35#668: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 195, 1} {:message "digitalNotary::play_tmstmp35"} play_tmstmp35#694(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#670: int)
{
	var {:sourceloc "buggy_50.sol", 196, 2} {:message "_vtime"} _vtime#674: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#674 := __block_timestamp;
	if (((startTime#670 + 432000) == _vtime#674)) {
	winner_tmstmp35#668 := winner_tmstmp35#668[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// Function: transfercontractbalance
procedure {:sourceloc "buggy_50.sol", 200, 5} {:message "digitalNotary::transfercontractbalance"} transfercontractbalance#720(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 202, 9} {:message "cb"} cb#700#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#14[__this]);
	// Function body starts here
	cb#700#9 := __balance[__this];
	assume (cb#700#9 > 0);
	assume {:sourceloc "buggy_50.sol", 206, 9} {:message ""} true;
	call __transfer(manager#14[__this], __this, 0, cb#700#9);
	$return31:
	// Function body ends here
	$return30:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_50.sol", 208, 1} {:message "digitalNotary::bug_tmstmp40"} bug_tmstmp40#767(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 209, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#724: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#724 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#724);
	pastBlockTime_tmstmp40#724 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_50.sol", 214, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return32:
	// Function body ends here
}

// 
// Function: getHashOwnersCount : function (bytes32) view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 218, 5} {:message "digitalNotary::getHashOwnersCount"} getHashOwnersCount#780(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#769: int)
	returns (#772: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#769])) && (length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#769]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	#772 := length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#769]);
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_50.sol", 222, 1} {:message "digitalNotary::bug_tmstmp33"} bug_tmstmp33#791(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#783: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#783 := (__block_timestamp >= 1546300800);
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// Function: getNumberofHashesRegistered
procedure {:sourceloc "buggy_50.sol", 226, 5} {:message "digitalNotary::getNumberofHashesRegistered"} getNumberofHashesRegistered#799(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#794: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#794 := HashListLength#189[__this];
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_50.sol", 230, 1} {:message "winner_tmstmp27"} winner_tmstmp27#801: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 231, 1} {:message "digitalNotary::play_tmstmp27"} play_tmstmp27#827(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#803: int)
{
	var {:sourceloc "buggy_50.sol", 232, 2} {:message "_vtime"} _vtime#807: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#807 := __block_timestamp;
	if (((startTime#803 + 432000) == _vtime#807)) {
	winner_tmstmp27#801 := winner_tmstmp27#801[__this := __msg_sender];
	}

	$return36:
	// Function body ends here
}

// 
// Function: getHashDetails
procedure {:sourceloc "buggy_50.sol", 236, 6} {:message "digitalNotary::getHashDetails"} getHashDetails#871(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#829: int, indx#831: int)
	returns (#834: address_t, #836: int)
{
	var {:sourceloc "buggy_50.sol", 239, 9} {:message "owncount"} owncount#839: int;
	var getHashOwnersCount#780_ret#10: int;
	var tmp#11: address_t;
	var tmp#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_50.sol", 239, 25} {:message ""} true;
	call getHashOwnersCount#780_ret#10 := getHashOwnersCount#780(__this, __msg_sender, __msg_value, hash#829);
	owncount#839 := getHashOwnersCount#780_ret#10;
	assume (owncount#839 > 0);
	assume (indx#831 < owncount#839);
	tmp#11 := owner#85#HashRegistration#88#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#829])[indx#831]);
	tmp#12 := registrationtime#87#HashRegistration#88#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#829])[indx#831]);
	#836 := tmp#12;
	#834 := tmp#11;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_50.sol", 245, 1} {:message "winner_tmstmp31"} winner_tmstmp31#873: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 246, 1} {:message "digitalNotary::play_tmstmp31"} play_tmstmp31#899(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#875: int)
{
	var {:sourceloc "buggy_50.sol", 247, 2} {:message "_vtime"} _vtime#879: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#879 := __block_timestamp;
	if (((startTime#875 + 432000) == _vtime#879)) {
	winner_tmstmp31#873 := winner_tmstmp31#873[__this := __msg_sender];
	}

	$return38:
	// Function body ends here
}

// 
// Function: registerHash
procedure {:sourceloc "buggy_50.sol", 251, 5} {:message "digitalNotary::registerHash"} registerHash#961(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#901: int)
{
	var getHashOwnersCount#780_ret#13: int;
	var {:sourceloc "buggy_50.sol", 258, 9} {:message "thisregistration"} thisregistration#926: address_struct_memory_HashRegistration#88;
	var new_struct_HashRegistration#14: address_struct_memory_HashRegistration#88;
	var tmp#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#27[__this] == true);
	assume {:sourceloc "buggy_50.sol", 255, 17} {:message ""} true;
	call getHashOwnersCount#780_ret#13 := getHashOwnersCount#780(__this, __msg_sender, __msg_value, hash#901);
	assume (getHashOwnersCount#780_ret#13 == 0);
	assume (__msg_value == hashfee#57[__this]);
	new_struct_HashRegistration#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#926 := new_struct_HashRegistration#14;
	owner#85 := owner#85[new_struct_HashRegistration#14 := 0];
	registrationtime#87 := registrationtime#87[new_struct_HashRegistration#14 := 0];
	owner#85 := owner#85[thisregistration#926 := __msg_sender];
	registrationtime#87 := registrationtime#87[thisregistration#926 := __block_timestamp];
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#901 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]) := HashRegistration#88#constr(0, 0)], length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]))]];
	// Deep copy struct HashRegistration
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#901 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]) := HashRegistration#88#constr(owner#85[thisregistration#926], registrationtime#87#HashRegistration#88#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])]))], length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]))]];
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#901 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]) := HashRegistration#88#constr(owner#85#HashRegistration#88#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])]), registrationtime#87[thisregistration#926])], length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]))]];
	assume ((0 <= length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901])) && (length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#901 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]), (length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#901]) + 1))]];
	tmp#15 := HashListLength#189[__this];
	HashListLength#189 := HashListLength#189[__this := (HashListLength#189[__this] + 1)];
	assume {:sourceloc "buggy_50.sol", 266, 14} {:message ""} true;
	call RegisterHashEvent#201(__this, __msg_sender, __msg_value, owner#85[thisregistration#926], hash#901, registrationtime#87[thisregistration#926]);
	$return39:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_50.sol", 269, 1} {:message "digitalNotary::bug_tmstmp13"} bug_tmstmp13#972(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#964: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#964 := (__block_timestamp >= 1546300800);
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: changeHashOwnership
procedure {:sourceloc "buggy_50.sol", 273, 5} {:message "digitalNotary::changeHashOwnership"} changeHashOwnership#1052(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#974: int, newowner#976: address_t)
{
	var {:sourceloc "buggy_50.sol", 277, 9} {:message "owncount"} owncount#986: int;
	var getHashOwnersCount#780_ret#16: int;
	var {:sourceloc "buggy_50.sol", 282, 9} {:message "thisregistration"} thisregistration#1019: address_struct_memory_HashRegistration#88;
	var new_struct_HashRegistration#17: address_struct_memory_HashRegistration#88;
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#27[__this] == true);
	assume {:sourceloc "buggy_50.sol", 277, 25} {:message ""} true;
	call getHashOwnersCount#780_ret#16 := getHashOwnersCount#780(__this, __msg_sender, __msg_value, hash#974);
	owncount#986 := getHashOwnersCount#780_ret#16;
	assume (owncount#986 > 0);
	assume (__msg_sender == owner#85#HashRegistration#88#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])[(owncount#986 - 1)]));
	assume (__msg_value == changehashownerfee#83[__this]);
	new_struct_HashRegistration#17 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#1019 := new_struct_HashRegistration#17;
	owner#85 := owner#85[new_struct_HashRegistration#17 := 0];
	registrationtime#87 := registrationtime#87[new_struct_HashRegistration#17 := 0];
	owner#85 := owner#85[thisregistration#1019 := newowner#976];
	registrationtime#87 := registrationtime#87[thisregistration#1019 := __block_timestamp];
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#974 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]) := HashRegistration#88#constr(0, 0)], length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]))]];
	// Deep copy struct HashRegistration
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#974 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]) := HashRegistration#88#constr(owner#85[thisregistration#1019], registrationtime#87#HashRegistration#88#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])]))], length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]))]];
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#974 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]) := HashRegistration#88#constr(owner#85#HashRegistration#88#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])[length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])]), registrationtime#87[thisregistration#1019])], length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]))]];
	assume ((0 <= length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974])) && (length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#140 := HashList#140[__this := HashList#140[__this][hash#974 := struct_storage_HashRegistration#88_arr#constr(arr#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]), (length#struct_storage_HashRegistration#88_arr#constr(HashList#140[__this][hash#974]) + 1))]];
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_50.sol", 288, 14} {:message ""} true;
	call ChangeHashOwnershipEvent#215(__this, __msg_sender, __msg_value, call_arg#18, owner#85[thisregistration#1019], hash#974, registrationtime#87[thisregistration#1019]);
	$return41:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_50.sol", 290, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1056: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 292, 5} {:message "digitalNotary::[fallback]"} #1060(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	$return42:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_50.sol", 294, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1064: [address_t]int;
