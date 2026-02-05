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
procedure {:inline 1} {:sourceloc "buggy_50.sol", 42, 3} {:message "[event] digitalNotary::RegisterHashEvent"} RegisterHashEvent#120(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#114: address_t, hash#116: int, timestamp#118: int)
{
	
}

// 
// Event: ChangeHashOwnershipEvent
procedure {:inline 1} {:sourceloc "buggy_50.sol", 46, 3} {:message "[event] digitalNotary::ChangeHashOwnershipEvent"} ChangeHashOwnershipEvent#143(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#135: address_t, newowner#137: address_t, hash#139: int, timestamp#141: int)
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
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_50.sol", 10, 3} {:message "digitalNotary::bug_unchk_send28"} bug_unchk_send28#14(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 11, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: manager: address payable
var {:sourceloc "buggy_50.sol", 12, 3} {:message "manager"} manager#16: [address_t]address_t;
// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_50.sol", 14, 3} {:message "digitalNotary::bug_unchk_send21"} bug_unchk_send21#29(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 15, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// State variable: contractactive: bool
var {:sourceloc "buggy_50.sol", 16, 3} {:message "contractactive"} contractactive#31: [address_t]bool;
// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_50.sol", 18, 3} {:message "digitalNotary::bug_unchk_send10"} bug_unchk_send10#44(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 19, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// State variable: hashfee: uint256
var {:sourceloc "buggy_50.sol", 20, 3} {:message "hashfee"} hashfee#46: [address_t]int;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_50.sol", 22, 3} {:message "digitalNotary::bug_unchk_send22"} bug_unchk_send22#59(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 23, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// State variable: changehashownerfee: uint256
var {:sourceloc "buggy_50.sol", 24, 3} {:message "changehashownerfee"} changehashownerfee#61: [address_t]int;
// 
// ------- Struct HashRegistration -------
// Storage
type {:datatype} struct_storage_HashRegistration#66;
function {:constructor} HashRegistration#66#constr(owner#63: address_t, registrationtime#65: int) returns (struct_storage_HashRegistration#66);
// Memory
type address_struct_memory_HashRegistration#66 = int;
// Member owner
var {:sourceloc "buggy_50.sol", 28, 9} {:message "owner"} owner#63: [address_struct_memory_HashRegistration#66]address_t;
// Member registrationtime
var {:sourceloc "buggy_50.sol", 29, 9} {:message "registrationtime"} registrationtime#65: [address_struct_memory_HashRegistration#66]int;
// 
// ------- End of struct HashRegistration -------
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_50.sol", 32, 3} {:message "digitalNotary::bug_unchk_send12"} bug_unchk_send12#79(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 33, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

// 
// State variable: HashList: mapping(bytes32 => struct digitalNotary.HashRegistration storage ref[] storage ref)
type {:datatype} struct_storage_HashRegistration#66_arr_type;
function {:constructor} struct_storage_HashRegistration#66_arr#constr(arr: [int]struct_storage_HashRegistration#66, length: int) returns (struct_storage_HashRegistration#66_arr_type);
var {:sourceloc "buggy_50.sol", 34, 3} {:message "HashList"} HashList#84: [address_t][int]struct_storage_HashRegistration#66_arr_type;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_50.sol", 36, 3} {:message "digitalNotary::bug_unchk_send11"} bug_unchk_send11#97(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 37, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// State variable: HashListLength: uint256
var {:sourceloc "buggy_50.sol", 38, 3} {:message "HashListLength"} HashListLength#99: [address_t]int;
// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_50.sol", 40, 3} {:message "digitalNotary::bug_unchk_send31"} bug_unchk_send31#112(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 41, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return6:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_50.sol", 44, 3} {:message "digitalNotary::bug_unchk_send13"} bug_unchk_send13#133(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 45, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return7:
	// Function body ends here
}

function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#66|)) (|HashRegistration#66#constr| 0 0))"} default_int_struct_storage_HashRegistration#66() returns ([int]struct_storage_HashRegistration#66);
function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#66_arr_type|)) (|struct_storage_HashRegistration#66_arr#constr| ((as const (Array Int |T@struct_storage_HashRegistration#66|)) (|HashRegistration#66#constr| 0 0)) 0))"} default_int_struct_storage_HashRegistration#66_arr_type() returns ([int]struct_storage_HashRegistration#66_arr_type);
// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 48, 5} {:message "digitalNotary::[constructor]"} __constructor#752(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	manager#16 := manager#16[__this := 0];
	contractactive#31 := contractactive#31[__this := false];
	hashfee#46 := hashfee#46[__this := 0];
	changehashownerfee#61 := changehashownerfee#61[__this := 0];
	HashList#84 := HashList#84[__this := default_int_struct_storage_HashRegistration#66_arr_type()];
	HashListLength#99 := HashListLength#99[__this := 0];
	// Function body starts here
	manager#16 := manager#16[__this := __msg_sender];
	contractactive#31 := contractactive#31[__this := true];
	hashfee#46 := hashfee#46[__this := 5000000000000000];
	changehashownerfee#61 := changehashownerfee#61[__this := 25000000000000000];
	HashListLength#99 := HashListLength#99[__this := 0];
	$return8:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_50.sol", 62, 1} {:message "digitalNotary::bug_unchk_send1"} bug_unchk_send1#184(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 63, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return9:
	// Function body ends here
}

// 
// Function: gethashfee
procedure {:sourceloc "buggy_50.sol", 72, 5} {:message "digitalNotary::gethashfee"} gethashfee#203(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#198: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#198 := hashfee#46[__this];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_50.sol", 76, 1} {:message "digitalNotary::bug_unchk_send2"} bug_unchk_send2#216(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 77, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return11:
	// Function body ends here
}

// 
// Function: sethashfee
procedure {:sourceloc "buggy_50.sol", 79, 5} {:message "digitalNotary::sethashfee"} sethashfee#234(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#218: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#16[__this]);
	// Function body starts here
	assume (newfee#218 >= 0);
	hashfee#46 := hashfee#46[__this := newfee#218];
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_50.sol", 85, 1} {:message "digitalNotary::bug_unchk_send17"} bug_unchk_send17#247(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 86, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return14:
	// Function body ends here
}

// 
// Function: getchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 88, 5} {:message "digitalNotary::getchangehashownerfee"} getchangehashownerfee#255(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#250: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#250 := changehashownerfee#61[__this];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_50.sol", 92, 1} {:message "digitalNotary::bug_unchk_send3"} bug_unchk_send3#268(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 93, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return16:
	// Function body ends here
}

// 
// Function: setchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 95, 6} {:message "digitalNotary::setchangehashownerfee"} setchangehashownerfee#286(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#270: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#16[__this]);
	// Function body starts here
	assume (newfee#270 >= 0);
	changehashownerfee#61 := changehashownerfee#61[__this := newfee#270];
	$return18:
	// Function body ends here
	$return17:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_50.sol", 101, 1} {:message "digitalNotary::bug_unchk_send9"} bug_unchk_send9#299(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 102, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return19:
	// Function body ends here
}

// 
// Function: getcontractactive
procedure {:sourceloc "buggy_50.sol", 104, 5} {:message "digitalNotary::getcontractactive"} getcontractactive#307(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#302: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#302 := contractactive#31[__this];
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_50.sol", 108, 1} {:message "digitalNotary::bug_unchk_send25"} bug_unchk_send25#320(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 109, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return21:
	// Function body ends here
}

// 
// Function: setcontractactive
procedure {:sourceloc "buggy_50.sol", 111, 5} {:message "digitalNotary::setcontractactive"} setcontractactive#332(__this: address_t, __msg_sender: address_t, __msg_value: int, contactive#322: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#16[__this]);
	// Function body starts here
	contractactive#31 := contractactive#31[__this := contactive#322];
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_50.sol", 115, 1} {:message "digitalNotary::bug_unchk_send19"} bug_unchk_send19#345(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#20 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 116, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#20);
	$return24:
	// Function body ends here
}

// 
// Function: getmanager
procedure {:sourceloc "buggy_50.sol", 118, 6} {:message "digitalNotary::getmanager"} getmanager#353(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#348: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#348 := manager#16[__this];
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_50.sol", 122, 1} {:message "digitalNotary::bug_unchk_send26"} bug_unchk_send26#366(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 123, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#21);
	$return26:
	// Function body ends here
}

// 
// Function: setmanager
procedure {:sourceloc "buggy_50.sol", 125, 5} {:message "digitalNotary::setmanager"} setmanager#385(__this: address_t, __msg_sender: address_t, __msg_value: int, newmngr#368: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#16[__this]);
	// Function body starts here
	assume (__balance[newmngr#368] > 0);
	manager#16 := manager#16[__this := newmngr#368];
	$return28:
	// Function body ends here
	$return27:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_50.sol", 130, 1} {:message "digitalNotary::bug_unchk_send20"} bug_unchk_send20#398(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#24 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 131, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#24);
	$return29:
	// Function body ends here
}

// 
// Function: getcontractbalance : function () view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 133, 5} {:message "digitalNotary::getcontractbalance"} getcontractbalance#410(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#401: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#401 := __balance[__this];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_50.sol", 138, 1} {:message "digitalNotary::bug_unchk_send32"} bug_unchk_send32#423(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#25 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 139, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#25);
	$return31:
	// Function body ends here
}

// 
// Function: transfercontractbalance
procedure {:sourceloc "buggy_50.sol", 141, 5} {:message "digitalNotary::transfercontractbalance"} transfercontractbalance#449(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 143, 9} {:message "cb"} cb#429#27: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#16[__this]);
	// Function body starts here
	cb#429#27 := __balance[__this];
	assume (cb#429#27 > 0);
	assume {:sourceloc "buggy_50.sol", 147, 9} {:message ""} true;
	call __transfer(manager#16[__this], __this, 0, cb#429#27);
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_50.sol", 149, 1} {:message "digitalNotary::bug_unchk_send4"} bug_unchk_send4#462(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#28 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 150, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#28);
	$return34:
	// Function body ends here
}

// 
// Function: getHashOwnersCount : function (bytes32) view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 152, 5} {:message "digitalNotary::getHashOwnersCount"} getHashOwnersCount#475(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#464: int)
	returns (#467: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#464])) && (length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#464]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	#467 := length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#464]);
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_50.sol", 156, 1} {:message "digitalNotary::bug_unchk_send7"} bug_unchk_send7#488(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#29 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 157, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#29);
	$return36:
	// Function body ends here
}

// 
// Function: getNumberofHashesRegistered
procedure {:sourceloc "buggy_50.sol", 159, 5} {:message "digitalNotary::getNumberofHashesRegistered"} getNumberofHashesRegistered#496(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#491: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#491 := HashListLength#99[__this];
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_50.sol", 163, 1} {:message "digitalNotary::bug_unchk_send23"} bug_unchk_send23#509(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 164, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#30);
	$return38:
	// Function body ends here
}

// 
// Function: getHashDetails
procedure {:sourceloc "buggy_50.sol", 166, 6} {:message "digitalNotary::getHashDetails"} getHashDetails#553(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#511: int, indx#513: int)
	returns (#516: address_t, #518: int)
{
	var {:sourceloc "buggy_50.sol", 169, 9} {:message "owncount"} owncount#521: int;
	var getHashOwnersCount#475_ret#31: int;
	var tmp#32: address_t;
	var tmp#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_50.sol", 169, 25} {:message ""} true;
	call getHashOwnersCount#475_ret#31 := getHashOwnersCount#475(__this, __msg_sender, __msg_value, hash#511);
	owncount#521 := getHashOwnersCount#475_ret#31;
	assume (owncount#521 > 0);
	assume (indx#513 < owncount#521);
	tmp#32 := owner#63#HashRegistration#66#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#511])[indx#513]);
	tmp#33 := registrationtime#65#HashRegistration#66#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#511])[indx#513]);
	#518 := tmp#33;
	#516 := tmp#32;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_50.sol", 175, 1} {:message "digitalNotary::bug_unchk_send14"} bug_unchk_send14#566(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#34 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 176, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#34);
	$return40:
	// Function body ends here
}

// 
// Function: registerHash
procedure {:sourceloc "buggy_50.sol", 178, 5} {:message "digitalNotary::registerHash"} registerHash#628(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#568: int)
{
	var getHashOwnersCount#475_ret#35: int;
	var {:sourceloc "buggy_50.sol", 185, 9} {:message "thisregistration"} thisregistration#593: address_struct_memory_HashRegistration#66;
	var new_struct_HashRegistration#36: address_struct_memory_HashRegistration#66;
	var tmp#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#31[__this] == true);
	assume {:sourceloc "buggy_50.sol", 182, 17} {:message ""} true;
	call getHashOwnersCount#475_ret#35 := getHashOwnersCount#475(__this, __msg_sender, __msg_value, hash#568);
	assume (getHashOwnersCount#475_ret#35 == 0);
	assume (__msg_value == hashfee#46[__this]);
	new_struct_HashRegistration#36 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#593 := new_struct_HashRegistration#36;
	owner#63 := owner#63[new_struct_HashRegistration#36 := 0];
	registrationtime#65 := registrationtime#65[new_struct_HashRegistration#36 := 0];
	owner#63 := owner#63[thisregistration#593 := __msg_sender];
	registrationtime#65 := registrationtime#65[thisregistration#593 := __block_timestamp];
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#568 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]) := HashRegistration#66#constr(0, 0)], length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]))]];
	// Deep copy struct HashRegistration
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#568 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]) := HashRegistration#66#constr(owner#63[thisregistration#593], registrationtime#65#HashRegistration#66#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])]))], length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]))]];
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#568 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]) := HashRegistration#66#constr(owner#63#HashRegistration#66#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])]), registrationtime#65[thisregistration#593])], length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]))]];
	assume ((0 <= length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568])) && (length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#568 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]), (length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#568]) + 1))]];
	tmp#37 := HashListLength#99[__this];
	HashListLength#99 := HashListLength#99[__this := (HashListLength#99[__this] + 1)];
	assume {:sourceloc "buggy_50.sol", 193, 14} {:message ""} true;
	call RegisterHashEvent#120(__this, __msg_sender, __msg_value, owner#63[thisregistration#593], hash#568, registrationtime#65[thisregistration#593]);
	$return41:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_50.sol", 196, 1} {:message "digitalNotary::bug_unchk_send30"} bug_unchk_send30#641(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 197, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#38);
	$return42:
	// Function body ends here
}

// 
// Function: changeHashOwnership
procedure {:sourceloc "buggy_50.sol", 199, 5} {:message "digitalNotary::changeHashOwnership"} changeHashOwnership#721(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#643: int, newowner#645: address_t)
{
	var {:sourceloc "buggy_50.sol", 203, 9} {:message "owncount"} owncount#655: int;
	var getHashOwnersCount#475_ret#39: int;
	var {:sourceloc "buggy_50.sol", 208, 9} {:message "thisregistration"} thisregistration#688: address_struct_memory_HashRegistration#66;
	var new_struct_HashRegistration#40: address_struct_memory_HashRegistration#66;
	var call_arg#41: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#31[__this] == true);
	assume {:sourceloc "buggy_50.sol", 203, 25} {:message ""} true;
	call getHashOwnersCount#475_ret#39 := getHashOwnersCount#475(__this, __msg_sender, __msg_value, hash#643);
	owncount#655 := getHashOwnersCount#475_ret#39;
	assume (owncount#655 > 0);
	assume (__msg_sender == owner#63#HashRegistration#66#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])[(owncount#655 - 1)]));
	assume (__msg_value == changehashownerfee#61[__this]);
	new_struct_HashRegistration#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#688 := new_struct_HashRegistration#40;
	owner#63 := owner#63[new_struct_HashRegistration#40 := 0];
	registrationtime#65 := registrationtime#65[new_struct_HashRegistration#40 := 0];
	owner#63 := owner#63[thisregistration#688 := newowner#645];
	registrationtime#65 := registrationtime#65[thisregistration#688 := __block_timestamp];
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#643 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]) := HashRegistration#66#constr(0, 0)], length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]))]];
	// Deep copy struct HashRegistration
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#643 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]) := HashRegistration#66#constr(owner#63[thisregistration#688], registrationtime#65#HashRegistration#66#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])]))], length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]))]];
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#643 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]) := HashRegistration#66#constr(owner#63#HashRegistration#66#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])[length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])]), registrationtime#65[thisregistration#688])], length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]))]];
	assume ((0 <= length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643])) && (length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#84 := HashList#84[__this := HashList#84[__this][hash#643 := struct_storage_HashRegistration#66_arr#constr(arr#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]), (length#struct_storage_HashRegistration#66_arr#constr(HashList#84[__this][hash#643]) + 1))]];
	call_arg#41 := __msg_sender;
	assume {:sourceloc "buggy_50.sol", 214, 14} {:message ""} true;
	call ChangeHashOwnershipEvent#143(__this, __msg_sender, __msg_value, call_arg#41, owner#63[thisregistration#688], hash#643, registrationtime#65[thisregistration#688]);
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_50.sol", 216, 1} {:message "digitalNotary::bug_unchk_send8"} bug_unchk_send8#734(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 217, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#42);
	$return44:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 219, 5} {:message "digitalNotary::[fallback]"} #738(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_50.sol", 223, 1} {:message "digitalNotary::bug_unchk_send27"} bug_unchk_send27#751(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#43 := 1000000000000000000;
	assume {:sourceloc "buggy_50.sol", 224, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#43);
	$return46:
	// Function body ends here
}

