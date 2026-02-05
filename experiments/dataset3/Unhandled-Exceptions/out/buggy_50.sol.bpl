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
procedure {:inline 1} {:sourceloc "buggy_50.sol", 62, 3} {:message "[event] digitalNotary::RegisterHashEvent"} RegisterHashEvent#162(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#156: address_t, hash#158: int, timestamp#160: int)
{
	
}

// 
// Event: ChangeHashOwnershipEvent
procedure {:inline 1} {:sourceloc "buggy_50.sol", 67, 3} {:message "[event] digitalNotary::ChangeHashOwnershipEvent"} ChangeHashOwnershipEvent#188(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#180: address_t, newowner#182: address_t, hash#184: int, timestamp#186: int)
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
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 10, 3} {:message "digitalNotary::bug_unchk3"} bug_unchk3#13(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#3: address_t)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#0 := 42000000000000000000;
	assume {:sourceloc "buggy_50.sol", 11, 8} {:message ""} true;
	call __send_ret#1 := __send(addr#3, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// State variable: manager: address payable
var {:sourceloc "buggy_50.sol", 12, 3} {:message "manager"} manager#15: [address_t]address_t;
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_50.sol", 14, 3} {:message "payedOut_unchk9"} payedOut_unchk9#18: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_50.sol", 16, 1} {:message "digitalNotary::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#39(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#18[__this];
	assume {:sourceloc "buggy_50.sol", 18, 5} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return1:
	// Function body ends here
}

// 
// State variable: contractactive: bool
var {:sourceloc "buggy_50.sol", 20, 3} {:message "contractactive"} contractactive#41: [address_t]bool;
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
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 22, 3} {:message "digitalNotary::callnotchecked_unchk25"} callnotchecked_unchk25#55(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#43: address_t)
{
	var __call_ret#3: bool;
	var __call_ret#4: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 23, 9} {:message ""} true;
	call __call_ret#3, __call_ret#4 := __call(callee#43, __this, 1000000000000000000);
	if (__call_ret#3) {
	havoc manager#15;
	havoc payedOut_unchk9#18;
	havoc contractactive#41;
	havoc hashfee#57;
	havoc changehashownerfee#80;
	havoc HashList#102;
	havoc payedOut_unchk20#105;
	havoc winner_unchk20#107;
	havoc winAmount_unchk20#109;
	havoc HashListLength#130;
	havoc payedOut_unchk45#133;
	havoc payedOut_unchk32#219;
	havoc winner_unchk32#221;
	havoc winAmount_unchk32#223;
	havoc payedOut_unchk8#477;
	havoc winner_unchk8#479;
	havoc winAmount_unchk8#481;
	havoc payedOut_unchk44#602;
	havoc winner_unchk44#604;
	havoc winAmount_unchk44#606;
	havoc payedOut_unchk33#749;
	havoc __balance;
	}

	if (!(__call_ret#3)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: hashfee: uint256
var {:sourceloc "buggy_50.sol", 25, 3} {:message "hashfee"} hashfee#57: [address_t]int;
// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_50.sol", 27, 3} {:message "digitalNotary::bug_unchk19"} bug_unchk19#78(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 28, 1} {:message "addr_unchk19"} addr_unchk19#61: address_t;
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#61 := 0;
	call_arg#5 := 10000000000000000000;
	assume {:sourceloc "buggy_50.sol", 29, 6} {:message ""} true;
	call __send_ret#6 := __send(addr_unchk19#61, __this, 0, call_arg#5);
	if ((!(__send_ret#6) || (1 == 1))) {
	assume false;
	}

	$return3:
	// Function body ends here
}

// 
// State variable: changehashownerfee: uint256
var {:sourceloc "buggy_50.sol", 32, 3} {:message "changehashownerfee"} changehashownerfee#80: [address_t]int;
// 
// ------- Struct HashRegistration -------
// Storage
type {:datatype} struct_storage_HashRegistration#85;
function {:constructor} HashRegistration#85#constr(owner#82: address_t, registrationtime#84: int) returns (struct_storage_HashRegistration#85);
// Memory
type address_struct_memory_HashRegistration#85 = int;
// Member owner
var {:sourceloc "buggy_50.sol", 36, 9} {:message "owner"} owner#82: [address_struct_memory_HashRegistration#85]address_t;
// Member registrationtime
var {:sourceloc "buggy_50.sol", 37, 9} {:message "registrationtime"} registrationtime#84: [address_struct_memory_HashRegistration#85]int;
// 
// ------- End of struct HashRegistration -------
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 40, 3} {:message "digitalNotary::unhandledsend_unchk26"} unhandledsend_unchk26#97(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#87: address_t)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := 5000000000000000000;
	assume {:sourceloc "buggy_50.sol", 41, 5} {:message ""} true;
	call __send_ret#8 := __send(callee#87, __this, 0, call_arg#7);
	$return4:
	// Function body ends here
}

// 
// State variable: HashList: mapping(bytes32 => struct digitalNotary.HashRegistration storage ref[] storage ref)
type {:datatype} struct_storage_HashRegistration#85_arr_type;
function {:constructor} struct_storage_HashRegistration#85_arr#constr(arr: [int]struct_storage_HashRegistration#85, length: int) returns (struct_storage_HashRegistration#85_arr_type);
var {:sourceloc "buggy_50.sol", 43, 3} {:message "HashList"} HashList#102: [address_t][int]struct_storage_HashRegistration#85_arr_type;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_50.sol", 45, 3} {:message "payedOut_unchk20"} payedOut_unchk20#105: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_50.sol", 46, 1} {:message "winner_unchk20"} winner_unchk20#107: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_50.sol", 47, 1} {:message "winAmount_unchk20"} winAmount_unchk20#109: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_50.sol", 49, 1} {:message "digitalNotary::sendToWinner_unchk20"} sendToWinner_unchk20#128(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#105[__this]);
	assume {:sourceloc "buggy_50.sol", 51, 9} {:message ""} true;
	call __send_ret#9 := __send(winner_unchk20#107[__this], __this, 0, winAmount_unchk20#109[__this]);
	payedOut_unchk20#105 := payedOut_unchk20#105[__this := true];
	$return5:
	// Function body ends here
}

// 
// State variable: HashListLength: uint256
var {:sourceloc "buggy_50.sol", 54, 3} {:message "HashListLength"} HashListLength#130: [address_t]int;
// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_50.sol", 56, 3} {:message "payedOut_unchk45"} payedOut_unchk45#133: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_50.sol", 58, 1} {:message "digitalNotary::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#154(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#133[__this];
	assume {:sourceloc "buggy_50.sol", 60, 5} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return6:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_50.sol", 64, 3} {:message "digitalNotary::callnotchecked_unchk13"} callnotchecked_unchk13#178(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#164: address_t)
{
	var __call_ret#11: bool;
	var __call_ret#12: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 65, 9} {:message ""} true;
	call __call_ret#11, __call_ret#12 := __call(callee#164, __this, 1000000000000000000);
	if (__call_ret#11) {
	havoc manager#15;
	havoc payedOut_unchk9#18;
	havoc contractactive#41;
	havoc hashfee#57;
	havoc changehashownerfee#80;
	havoc HashList#102;
	havoc payedOut_unchk20#105;
	havoc winner_unchk20#107;
	havoc winAmount_unchk20#109;
	havoc HashListLength#130;
	havoc payedOut_unchk45#133;
	havoc payedOut_unchk32#219;
	havoc winner_unchk32#221;
	havoc winAmount_unchk32#223;
	havoc payedOut_unchk8#477;
	havoc winner_unchk8#479;
	havoc winAmount_unchk8#481;
	havoc payedOut_unchk44#602;
	havoc winner_unchk44#604;
	havoc winAmount_unchk44#606;
	havoc payedOut_unchk33#749;
	havoc __balance;
	}

	if (!(__call_ret#11)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return7:
	// Function body ends here
}

function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#85|)) (|HashRegistration#85#constr| 0 0))"} default_int_struct_storage_HashRegistration#85() returns ([int]struct_storage_HashRegistration#85);
function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#85_arr_type|)) (|struct_storage_HashRegistration#85_arr#constr| ((as const (Array Int |T@struct_storage_HashRegistration#85|)) (|HashRegistration#85#constr| 0 0)) 0))"} default_int_struct_storage_HashRegistration#85_arr_type() returns ([int]struct_storage_HashRegistration#85_arr_type);
// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 69, 5} {:message "digitalNotary::[constructor]"} __constructor#888(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	manager#15 := manager#15[__this := 0];
	payedOut_unchk9#18 := payedOut_unchk9#18[__this := false];
	contractactive#41 := contractactive#41[__this := false];
	hashfee#57 := hashfee#57[__this := 0];
	changehashownerfee#80 := changehashownerfee#80[__this := 0];
	HashList#102 := HashList#102[__this := default_int_struct_storage_HashRegistration#85_arr_type()];
	payedOut_unchk20#105 := payedOut_unchk20#105[__this := false];
	winner_unchk20#107 := winner_unchk20#107[__this := 0];
	winAmount_unchk20#109 := winAmount_unchk20#109[__this := 0];
	HashListLength#130 := HashListLength#130[__this := 0];
	payedOut_unchk45#133 := payedOut_unchk45#133[__this := false];
	payedOut_unchk32#219 := payedOut_unchk32#219[__this := false];
	winner_unchk32#221 := winner_unchk32#221[__this := 0];
	winAmount_unchk32#223 := winAmount_unchk32#223[__this := 0];
	payedOut_unchk8#477 := payedOut_unchk8#477[__this := false];
	winner_unchk8#479 := winner_unchk8#479[__this := 0];
	winAmount_unchk8#481 := winAmount_unchk8#481[__this := 0];
	payedOut_unchk44#602 := payedOut_unchk44#602[__this := false];
	winner_unchk44#604 := winner_unchk44#604[__this := 0];
	winAmount_unchk44#606 := winAmount_unchk44#606[__this := 0];
	payedOut_unchk33#749 := payedOut_unchk33#749[__this := false];
	// Function body starts here
	manager#15 := manager#15[__this := __msg_sender];
	contractactive#41 := contractactive#41[__this := true];
	hashfee#57 := hashfee#57[__this := 5000000000000000];
	changehashownerfee#80 := changehashownerfee#80[__this := 25000000000000000];
	HashListLength#130 := HashListLength#130[__this := 0];
	$return8:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_50.sol", 83, 1} {:message "payedOut_unchk32"} payedOut_unchk32#219: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_50.sol", 84, 1} {:message "winner_unchk32"} winner_unchk32#221: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_50.sol", 85, 1} {:message "winAmount_unchk32"} winAmount_unchk32#223: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_50.sol", 87, 1} {:message "digitalNotary::sendToWinner_unchk32"} sendToWinner_unchk32#242(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#219[__this]);
	assume {:sourceloc "buggy_50.sol", 89, 9} {:message ""} true;
	call __send_ret#13 := __send(winner_unchk32#221[__this], __this, 0, winAmount_unchk32#223[__this]);
	payedOut_unchk32#219 := payedOut_unchk32#219[__this := true];
	$return9:
	// Function body ends here
}

// 
// Function: gethashfee
procedure {:sourceloc "buggy_50.sol", 100, 5} {:message "digitalNotary::gethashfee"} gethashfee#261(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#256: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#256 := hashfee#57[__this];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 104, 1} {:message "digitalNotary::unhandledsend_unchk38"} unhandledsend_unchk38#273(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#263: address_t)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := 5000000000000000000;
	assume {:sourceloc "buggy_50.sol", 105, 5} {:message ""} true;
	call __send_ret#15 := __send(callee#263, __this, 0, call_arg#14);
	$return11:
	// Function body ends here
}

// 
// Function: sethashfee
procedure {:sourceloc "buggy_50.sol", 108, 5} {:message "digitalNotary::sethashfee"} sethashfee#291(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#275: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#15[__this]);
	// Function body starts here
	assume (newfee#275 >= 0);
	hashfee#57 := hashfee#57[__this := newfee#275];
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyManager ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_50.sol", 114, 1} {:message "digitalNotary::cash_unchk46"} cash_unchk46#315(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#293: int, subpotIndex#295: int, winner_unchk46#297: address_t)
{
	var {:sourceloc "buggy_50.sol", 115, 9} {:message "subpot_unchk46"} subpot_unchk46#301: int;
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#301 := 3000000000000000000;
	call_arg#18 := subpot_unchk46#301;
	assume {:sourceloc "buggy_50.sol", 116, 9} {:message ""} true;
	call __send_ret#19 := __send(winner_unchk46#297, __this, 0, call_arg#18);
	subpot_unchk46#301 := 0;
	$return14:
	// Function body ends here
}

// 
// Function: getchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 120, 5} {:message "digitalNotary::getchangehashownerfee"} getchangehashownerfee#323(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#318: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#318 := changehashownerfee#80[__this];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_50.sol", 124, 1} {:message "digitalNotary::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#338(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 125, 4} {:message "addr_unchk4"} addr_unchk4#327: address_t;
	var call_arg#20: int;
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#327 := 0;
	call_arg#20 := 42000000000000000000;
	assume {:sourceloc "buggy_50.sol", 126, 10} {:message ""} true;
	call __send_ret#21 := __send(addr_unchk4#327, __this, 0, call_arg#20);
	if (!(__send_ret#21)) {
	
	}
	else {
	
	}

	$return16:
	// Function body ends here
}

// 
// Function: setchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 134, 6} {:message "digitalNotary::setchangehashownerfee"} setchangehashownerfee#356(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#340: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#15[__this]);
	// Function body starts here
	assume (newfee#340 >= 0);
	changehashownerfee#80 := changehashownerfee#80[__this := newfee#340];
	$return18:
	// Function body ends here
	$return17:
	// Inlined modifier onlyManager ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_50.sol", 140, 1} {:message "digitalNotary::bug_unchk7"} bug_unchk7#377(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 141, 1} {:message "addr_unchk7"} addr_unchk7#360: address_t;
	var call_arg#24: int;
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#360 := 0;
	call_arg#24 := 10000000000000000000;
	assume {:sourceloc "buggy_50.sol", 142, 6} {:message ""} true;
	call __send_ret#25 := __send(addr_unchk7#360, __this, 0, call_arg#24);
	if ((!(__send_ret#25) || (1 == 1))) {
	assume false;
	}

	$return19:
	// Function body ends here
}

// 
// Function: getcontractactive
procedure {:sourceloc "buggy_50.sol", 146, 5} {:message "digitalNotary::getcontractactive"} getcontractactive#385(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#380: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#380 := contractactive#41[__this];
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 150, 1} {:message "digitalNotary::my_func_unchk23"} my_func_unchk23#398(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#387: address_t)
{
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_50.sol", 151, 9} {:message ""} true;
	call __send_ret#26 := __send(dst#387, __this, 0, __msg_value);
	$return21:
	// Function body ends here
}

// 
// Function: setcontractactive
procedure {:sourceloc "buggy_50.sol", 154, 5} {:message "digitalNotary::setcontractactive"} setcontractactive#410(__this: address_t, __msg_sender: address_t, __msg_value: int, contactive#400: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#15[__this]);
	// Function body starts here
	contractactive#41 := contractactive#41[__this := contactive#400];
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyManager ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 158, 1} {:message "digitalNotary::unhandledsend_unchk14"} unhandledsend_unchk14#422(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#412: address_t)
{
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := 5000000000000000000;
	assume {:sourceloc "buggy_50.sol", 159, 5} {:message ""} true;
	call __send_ret#30 := __send(callee#412, __this, 0, call_arg#29);
	$return24:
	// Function body ends here
}

// 
// Function: getmanager
procedure {:sourceloc "buggy_50.sol", 162, 6} {:message "digitalNotary::getmanager"} getmanager#430(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#425: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#425 := manager#15[__this];
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_50.sol", 166, 1} {:message "digitalNotary::bug_unchk30"} bug_unchk30#455(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 167, 1} {:message "receivers_unchk30"} receivers_unchk30#434: int;
	var {:sourceloc "buggy_50.sol", 168, 1} {:message "addr_unchk30"} addr_unchk30#437: address_t;
	var call_arg#31: int;
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#434 := 0;
	addr_unchk30#437 := 0;
	call_arg#31 := 42000000000000000000;
	assume {:sourceloc "buggy_50.sol", 169, 6} {:message ""} true;
	call __send_ret#32 := __send(addr_unchk30#437, __this, 0, call_arg#31);
	if (!(__send_ret#32)) {
	receivers_unchk30#434 := (receivers_unchk30#434 + 1);
	}
	else {
	assume false;
	}

	$return26:
	// Function body ends here
}

// 
// Function: setmanager
procedure {:sourceloc "buggy_50.sol", 175, 5} {:message "digitalNotary::setmanager"} setmanager#474(__this: address_t, __msg_sender: address_t, __msg_value: int, newmngr#457: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#15[__this]);
	// Function body starts here
	assume (__balance[newmngr#457] > 0);
	manager#15 := manager#15[__this := newmngr#457];
	$return28:
	// Function body ends here
	$return27:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_50.sol", 180, 1} {:message "payedOut_unchk8"} payedOut_unchk8#477: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_50.sol", 181, 1} {:message "winner_unchk8"} winner_unchk8#479: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_50.sol", 182, 1} {:message "winAmount_unchk8"} winAmount_unchk8#481: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_50.sol", 184, 1} {:message "digitalNotary::sendToWinner_unchk8"} sendToWinner_unchk8#500(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#477[__this]);
	assume {:sourceloc "buggy_50.sol", 186, 9} {:message ""} true;
	call __send_ret#35 := __send(winner_unchk8#479[__this], __this, 0, winAmount_unchk8#481[__this]);
	payedOut_unchk8#477 := payedOut_unchk8#477[__this := true];
	$return29:
	// Function body ends here
}

// 
// Function: getcontractbalance : function () view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 190, 5} {:message "digitalNotary::getcontractbalance"} getcontractbalance#512(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#503: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#503 := __balance[__this];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 195, 1} {:message "digitalNotary::bug_unchk39"} bug_unchk39#524(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#514: address_t)
{
	var call_arg#36: int;
	var __send_ret#37: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#36 := 4000000000000000000;
	assume {:sourceloc "buggy_50.sol", 196, 8} {:message ""} true;
	call __send_ret#37 := __send(addr#514, __this, 0, call_arg#36);
	$return31:
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
// Function: transfercontractbalance
procedure {:sourceloc "buggy_50.sol", 198, 5} {:message "digitalNotary::transfercontractbalance"} transfercontractbalance#550(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 200, 9} {:message "cb"} cb#530#39: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#15[__this]);
	// Function body starts here
	cb#530#39 := __balance[__this];
	assume (cb#530#39 > 0);
	assume {:sourceloc "buggy_50.sol", 204, 9} {:message ""} true;
	call __transfer(manager#15[__this], __this, 0, cb#530#39);
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyManager ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 206, 1} {:message "digitalNotary::my_func_uncheck36"} my_func_uncheck36#565(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#552: address_t)
{
	var __call_ret#40: bool;
	var __call_ret#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_50.sol", 207, 5} {:message ""} true;
	call __call_ret#40, __call_ret#41 := __call(dst#552, __this, __msg_value);
	if (__call_ret#40) {
	havoc manager#15;
	havoc payedOut_unchk9#18;
	havoc contractactive#41;
	havoc hashfee#57;
	havoc changehashownerfee#80;
	havoc HashList#102;
	havoc payedOut_unchk20#105;
	havoc winner_unchk20#107;
	havoc winAmount_unchk20#109;
	havoc HashListLength#130;
	havoc payedOut_unchk45#133;
	havoc payedOut_unchk32#219;
	havoc winner_unchk32#221;
	havoc winAmount_unchk32#223;
	havoc payedOut_unchk8#477;
	havoc winner_unchk8#479;
	havoc winAmount_unchk8#481;
	havoc payedOut_unchk44#602;
	havoc winner_unchk44#604;
	havoc winAmount_unchk44#606;
	havoc payedOut_unchk33#749;
	havoc __balance;
	}

	if (!(__call_ret#40)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return34:
	// Function body ends here
}

// 
// Function: getHashOwnersCount : function (bytes32) view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 210, 5} {:message "digitalNotary::getHashOwnersCount"} getHashOwnersCount#578(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#567: int)
	returns (#570: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#567])) && (length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#567]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	#570 := length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#567]);
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 214, 1} {:message "digitalNotary::my_func_unchk35"} my_func_unchk35#591(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#580: address_t)
{
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_50.sol", 215, 9} {:message ""} true;
	call __send_ret#42 := __send(dst#580, __this, 0, __msg_value);
	$return36:
	// Function body ends here
}

// 
// Function: getNumberofHashesRegistered
procedure {:sourceloc "buggy_50.sol", 218, 5} {:message "digitalNotary::getNumberofHashesRegistered"} getNumberofHashesRegistered#599(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#594: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#594 := HashListLength#130[__this];
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_50.sol", 222, 1} {:message "payedOut_unchk44"} payedOut_unchk44#602: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_50.sol", 223, 1} {:message "winner_unchk44"} winner_unchk44#604: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_50.sol", 224, 1} {:message "winAmount_unchk44"} winAmount_unchk44#606: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_50.sol", 226, 1} {:message "digitalNotary::sendToWinner_unchk44"} sendToWinner_unchk44#625(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#602[__this]);
	assume {:sourceloc "buggy_50.sol", 228, 9} {:message ""} true;
	call __send_ret#43 := __send(winner_unchk44#604[__this], __this, 0, winAmount_unchk44#606[__this]);
	payedOut_unchk44#602 := payedOut_unchk44#602[__this := true];
	$return38:
	// Function body ends here
}

// 
// Function: getHashDetails
procedure {:sourceloc "buggy_50.sol", 232, 6} {:message "digitalNotary::getHashDetails"} getHashDetails#669(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#627: int, indx#629: int)
	returns (#632: address_t, #634: int)
{
	var {:sourceloc "buggy_50.sol", 235, 9} {:message "owncount"} owncount#637: int;
	var getHashOwnersCount#578_ret#44: int;
	var tmp#45: address_t;
	var tmp#46: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_50.sol", 235, 25} {:message ""} true;
	call getHashOwnersCount#578_ret#44 := getHashOwnersCount#578(__this, __msg_sender, __msg_value, hash#627);
	owncount#637 := getHashOwnersCount#578_ret#44;
	assume (owncount#637 > 0);
	assume (indx#629 < owncount#637);
	tmp#45 := owner#82#HashRegistration#85#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#627])[indx#629]);
	tmp#46 := registrationtime#84#HashRegistration#85#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#627])[indx#629]);
	#634 := tmp#46;
	#632 := tmp#45;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_50.sol", 241, 1} {:message "digitalNotary::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#684(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 242, 4} {:message "addr_unchk40"} addr_unchk40#673: address_t;
	var call_arg#47: int;
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#673 := 0;
	call_arg#47 := 2000000000000000000;
	assume {:sourceloc "buggy_50.sol", 243, 10} {:message ""} true;
	call __send_ret#48 := __send(addr_unchk40#673, __this, 0, call_arg#47);
	if (!(__send_ret#48)) {
	
	}
	else {
	
	}

	$return40:
	// Function body ends here
}

// 
// Function: registerHash
procedure {:sourceloc "buggy_50.sol", 251, 5} {:message "digitalNotary::registerHash"} registerHash#746(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#686: int)
{
	var getHashOwnersCount#578_ret#49: int;
	var {:sourceloc "buggy_50.sol", 258, 9} {:message "thisregistration"} thisregistration#711: address_struct_memory_HashRegistration#85;
	var new_struct_HashRegistration#50: address_struct_memory_HashRegistration#85;
	var tmp#51: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#41[__this] == true);
	assume {:sourceloc "buggy_50.sol", 255, 17} {:message ""} true;
	call getHashOwnersCount#578_ret#49 := getHashOwnersCount#578(__this, __msg_sender, __msg_value, hash#686);
	assume (getHashOwnersCount#578_ret#49 == 0);
	assume (__msg_value == hashfee#57[__this]);
	new_struct_HashRegistration#50 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#711 := new_struct_HashRegistration#50;
	owner#82 := owner#82[new_struct_HashRegistration#50 := 0];
	registrationtime#84 := registrationtime#84[new_struct_HashRegistration#50 := 0];
	owner#82 := owner#82[thisregistration#711 := __msg_sender];
	registrationtime#84 := registrationtime#84[thisregistration#711 := __block_timestamp];
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#686 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]) := HashRegistration#85#constr(0, 0)], length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]))]];
	// Deep copy struct HashRegistration
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#686 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]) := HashRegistration#85#constr(owner#82[thisregistration#711], registrationtime#84#HashRegistration#85#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])]))], length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]))]];
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#686 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]) := HashRegistration#85#constr(owner#82#HashRegistration#85#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])]), registrationtime#84[thisregistration#711])], length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]))]];
	assume ((0 <= length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686])) && (length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#686 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]), (length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#686]) + 1))]];
	tmp#51 := HashListLength#130[__this];
	HashListLength#130 := HashListLength#130[__this := (HashListLength#130[__this] + 1)];
	assume {:sourceloc "buggy_50.sol", 266, 14} {:message ""} true;
	call RegisterHashEvent#162(__this, __msg_sender, __msg_value, owner#82[thisregistration#711], hash#686, registrationtime#84[thisregistration#711]);
	$return41:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_50.sol", 269, 1} {:message "payedOut_unchk33"} payedOut_unchk33#749: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_50.sol", 271, 1} {:message "digitalNotary::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#770(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#749[__this];
	assume {:sourceloc "buggy_50.sol", 273, 5} {:message ""} true;
	call __send_ret#52 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return42:
	// Function body ends here
}

// 
// Function: changeHashOwnership
procedure {:sourceloc "buggy_50.sol", 276, 5} {:message "digitalNotary::changeHashOwnership"} changeHashOwnership#850(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#772: int, newowner#774: address_t)
{
	var {:sourceloc "buggy_50.sol", 280, 9} {:message "owncount"} owncount#784: int;
	var getHashOwnersCount#578_ret#53: int;
	var {:sourceloc "buggy_50.sol", 285, 9} {:message "thisregistration"} thisregistration#817: address_struct_memory_HashRegistration#85;
	var new_struct_HashRegistration#54: address_struct_memory_HashRegistration#85;
	var call_arg#55: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#41[__this] == true);
	assume {:sourceloc "buggy_50.sol", 280, 25} {:message ""} true;
	call getHashOwnersCount#578_ret#53 := getHashOwnersCount#578(__this, __msg_sender, __msg_value, hash#772);
	owncount#784 := getHashOwnersCount#578_ret#53;
	assume (owncount#784 > 0);
	assume (__msg_sender == owner#82#HashRegistration#85#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])[(owncount#784 - 1)]));
	assume (__msg_value == changehashownerfee#80[__this]);
	new_struct_HashRegistration#54 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#817 := new_struct_HashRegistration#54;
	owner#82 := owner#82[new_struct_HashRegistration#54 := 0];
	registrationtime#84 := registrationtime#84[new_struct_HashRegistration#54 := 0];
	owner#82 := owner#82[thisregistration#817 := newowner#774];
	registrationtime#84 := registrationtime#84[thisregistration#817 := __block_timestamp];
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#772 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]) := HashRegistration#85#constr(0, 0)], length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]))]];
	// Deep copy struct HashRegistration
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#772 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]) := HashRegistration#85#constr(owner#82[thisregistration#817], registrationtime#84#HashRegistration#85#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])]))], length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]))]];
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#772 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]) := HashRegistration#85#constr(owner#82#HashRegistration#85#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])[length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])]), registrationtime#84[thisregistration#817])], length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]))]];
	assume ((0 <= length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772])) && (length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#102 := HashList#102[__this := HashList#102[__this][hash#772 := struct_storage_HashRegistration#85_arr#constr(arr#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]), (length#struct_storage_HashRegistration#85_arr#constr(HashList#102[__this][hash#772]) + 1))]];
	call_arg#55 := __msg_sender;
	assume {:sourceloc "buggy_50.sol", 291, 14} {:message ""} true;
	call ChangeHashOwnershipEvent#188(__this, __msg_sender, __msg_value, call_arg#55, owner#82[thisregistration#817], hash#772, registrationtime#84[thisregistration#817]);
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_50.sol", 293, 1} {:message "digitalNotary::bug_unchk27"} bug_unchk27#862(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#852: address_t)
{
	var call_arg#56: int;
	var __send_ret#57: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#56 := 42000000000000000000;
	assume {:sourceloc "buggy_50.sol", 294, 8} {:message ""} true;
	call __send_ret#57 := __send(addr#852, __this, 0, call_arg#56);
	$return44:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 296, 5} {:message "digitalNotary::[fallback]"} #866(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	$return45:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_50.sol", 298, 1} {:message "digitalNotary::bug_unchk31"} bug_unchk31#887(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 299, 1} {:message "addr_unchk31"} addr_unchk31#870: address_t;
	var call_arg#58: int;
	var __send_ret#59: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#870 := 0;
	call_arg#58 := 10000000000000000000;
	assume {:sourceloc "buggy_50.sol", 300, 6} {:message ""} true;
	call __send_ret#59 := __send(addr_unchk31#870, __this, 0, call_arg#58);
	if ((!(__send_ret#59) || (1 == 1))) {
	assume false;
	}

	$return46:
	// Function body ends here
}

