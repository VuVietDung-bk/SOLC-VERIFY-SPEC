// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: 0xec329ffc97d75fe03428ae155fc7793431487f63.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Owned -------
// 
// Function: 
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 10, 5} {:message "Owned::[constructor]"} __constructor#57(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#12 := owner#12[__this := 0];
	// Function body starts here
	owner#12 := owner#12[__this := __msg_sender];
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 14, 5} {:message "owner"} owner#12: [address_t]address_t;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: changeOwner : function (address)
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 21, 5} {:message "Owned::changeOwner"} changeOwner#36(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#26: address_t)
{
	var call_arg#1: int_arr_ptr;
	var new_array#2: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#2 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#1 := new_array#2;
	mem_arr_int := mem_arr_int[call_arg#1 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114], 10)];
	assume (__msg_sender == owner#12[__this]);
	// Function body starts here
	owner#12 := owner#12[__this := _newOwner#26];
	$return2:
	// Function body ends here
	$return1:
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
// Function: execute : function (address,uint256,bytes memory)
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 28, 5} {:message "Owned::execute"} execute#56(__this: address_t, __msg_sender: address_t, __msg_value: int, _dst#38: address_t, _value#40: int, _data#42: int_arr_ptr)
{
	var call_arg#5: int_arr_ptr;
	var new_array#6: int_arr_ptr;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (_data#42 < __alloc_counter);
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#6 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#5 := new_array#6;
	mem_arr_int := mem_arr_int[call_arg#5 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114], 10)];
	assume (__msg_sender == owner#12[__this]);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _value#40);
	__balance := __balance[__this := (__balance[__this] - _value#40)];
	assume {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 30, 9} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(_dst#38, __this, _value#40);
	if (__call_ret#8) {
	havoc owner#12;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + _value#40)];
	}

	$return4:
	// Function body ends here
	$return3:
	// Inlined modifier onlyOwner ends here
}

// 
// ------- Contract: Token -------
// 
// Function: transfer
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 35, 5} {:message "Token::transfer"} transfer#66(__this: address_t, __msg_sender: address_t, __msg_value: int, #59: address_t, #61: int)
	returns (#64: bool);

// 
// Function: balanceOf
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 36, 5} {:message "Token::balanceOf"} balanceOf#73(__this: address_t, __msg_sender: address_t, __msg_value: int, #68: address_t)
	returns (#71: int);

// 
// Default constructor
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 34, 1} {:message "Token::[implicit_constructor]"} __constructor#74(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: TokenSender -------
// Inherits from: Owned
// 
// State variable: token: contract Token
var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 40, 5} {:message "token"} token#78: [address_t]address_t;
// 
// State variable: totalToDistribute: uint256
var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 41, 5} {:message "totalToDistribute"} totalToDistribute#80: [address_t]int;
// 
// State variable: next: uint256
var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 43, 5} {:message "next"} next#82: [address_t]int;
// 
// ------- Struct Transfer -------
// Storage
type {:datatype} struct_storage_Transfer#87;
function {:constructor} Transfer#87#constr(addr#84: address_t, amount#86: int) returns (struct_storage_Transfer#87);
// Memory
type address_struct_memory_Transfer#87 = int;
// Member addr
var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 47, 9} {:message "addr"} addr#84: [address_struct_memory_Transfer#87]address_t;
// Member amount
var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 48, 9} {:message "amount"} amount#86: [address_struct_memory_Transfer#87]int;
// 
// ------- End of struct Transfer -------
// 
// State variable: transfers: struct TokenSender.Transfer storage ref[] storage ref
type {:datatype} struct_storage_Transfer#87_arr_type;
function {:constructor} struct_storage_Transfer#87_arr#constr(arr: [int]struct_storage_Transfer#87, length: int) returns (struct_storage_Transfer#87_arr_type);
var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 51, 5} {:message "transfers"} transfers#90: [address_t]struct_storage_Transfer#87_arr_type;
function {:builtin "((as const (Array Int |T@struct_storage_Transfer#87|)) (|Transfer#87#constr| 0 0))"} default_int_struct_storage_Transfer#87() returns ([int]struct_storage_Transfer#87);
// 
// Function: 
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 53, 5} {:message "TokenSender::[constructor]"} __constructor#307(__this: address_t, __msg_sender: address_t, __msg_value: int, _token#92: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	token#78 := token#78[__this := 0];
	totalToDistribute#80 := totalToDistribute#80[__this := 0];
	next#82 := next#82[__this := 0];
	transfers#90 := transfers#90[__this := struct_storage_Transfer#87_arr#constr(default_int_struct_storage_Transfer#87(), 0)];
	owner#12 := owner#12[__this := 0];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#12 := owner#12[__this := __msg_sender];
	$return5:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	token#78 := token#78[__this := _token#92];
	$return6:
	// Function body ends here
}

// 
// Function: fill : function (uint256[] memory)
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 66, 5} {:message "TokenSender::fill"} {:skipped} fill#179(__this: address_t, __msg_sender: address_t, __msg_value: int, data#108: int_arr_ptr);
	modifies token#78, totalToDistribute#80, next#82, transfers#90, owner#12;

// 
// Function: run : function ()
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 84, 5} {:message "TokenSender::run"} run#275(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int_arr_ptr;
	var new_array#23: int_arr_ptr;
	var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 88, 9} {:message "mNext"} mNext#191#24: int;
	var balanceOf#73_ret#25: int;
	var call_arg#26: int_arr_ptr;
	var new_array#27: int_arr_ptr;
	var gasleft#-7_ret#30: int;
	var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 98, 13} {:message "amount"} amount#232#24: int;
	var {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 99, 13} {:message "addr"} addr#239#24: address_t;
	var transfer#66_ret#31: bool;
	var call_arg#32: int_arr_ptr;
	var new_array#33: int_arr_ptr;
	var tmp#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#23 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#22 := new_array#23;
	mem_arr_int := mem_arr_int[call_arg#22 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 111][6 := 119][7 := 110][8 := 101][9 := 114], 10)];
	assume (__msg_sender == owner#12[__this]);
	// Function body starts here
	assume ((0 <= length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	if ((length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) == 0)) {
	goto $return10;
	}

	mNext#191#24 := next#82[__this];
	assume ((0 <= length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	next#82 := next#82[__this := length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])];
	assume {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 93, 32} {:message ""} true;
	call balanceOf#73_ret#25 := balanceOf#73(token#78[__this], __this, 0, __this);
	if (((mNext#191#24 == 0) && (balanceOf#73_ret#25 != totalToDistribute#80[__this]))) {
	new_array#27 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#26 := new_array#27;
	mem_arr_int := mem_arr_int[call_arg#26 := int_arr#constr(default_int_int()[0 := 98][1 := 97][2 := 108][3 := 97][4 := 110][5 := 99][6 := 101][7 := 32][8 := 109][9 := 105][10 := 115][11 := 109][12 := 97][13 := 116][14 := 99][15 := 104], 16)];
	assume false;
	}

	assume ((0 <= length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 97, 46} {:message ""} true;
	call gasleft#-7_ret#30 := gasleft#-7(__this, __this, 0);
	while (((mNext#191#24 < length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (gasleft#-7_ret#30 > 150000))) {
	amount#232#24 := amount#86#Transfer#87#constr(arr#struct_storage_Transfer#87_arr#constr(transfers#90[__this])[mNext#191#24]);
	addr#239#24 := addr#84#Transfer#87#constr(arr#struct_storage_Transfer#87_arr#constr(transfers#90[__this])[mNext#191#24]);
	if ((amount#232#24 > 0)) {
	assume {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 101, 22} {:message ""} true;
	call transfer#66_ret#31 := transfer#66(token#78[__this], __this, 0, addr#239#24, amount#86#Transfer#87#constr(arr#struct_storage_Transfer#87_arr#constr(transfers#90[__this])[mNext#191#24]));
	if (!(transfer#66_ret#31)) {
	new_array#33 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#32 := new_array#33;
	mem_arr_int := mem_arr_int[call_arg#32 := int_arr#constr(default_int_int()[0 := 116][1 := 111][2 := 107][3 := 101][4 := 110][5 := 32][6 := 116][7 := 114][8 := 97][9 := 110][10 := 115][11 := 102][12 := 101][13 := 114][14 := 32][15 := 102][16 := 97][17 := 105][18 := 108][19 := 101][20 := 100], 21)];
	assume false;
	}

	}

	tmp#34 := mNext#191#24;
	mNext#191#24 := (mNext#191#24 + 1);
	$continue28:
	assume ((0 <= length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 97, 46} {:message ""} true;
	call gasleft#-7_ret#30 := gasleft#-7(__this, __this, 0);
	}

	break29:
	next#82 := next#82[__this := mNext#191#24];
	$return10:
	// Function body ends here
	$return9:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: hasTerminated : function () view returns (bool)
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 117, 5} {:message "TokenSender::hasTerminated"} hasTerminated#297(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#278: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	if ((length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) == 0)) {
	#278 := false;
	goto $return11;
	}

	assume ((0 <= length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	if ((next#82[__this] < length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]))) {
	#278 := false;
	goto $return11;
	}

	#278 := true;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: nTransfers : function () view returns (uint256)
procedure {:sourceloc "0xec329ffc97d75fe03428ae155fc7793431487f63.sol", 123, 5} {:message "TokenSender::nTransfers"} nTransfers#306(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#300: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#struct_storage_Transfer#87_arr#constr(transfers#90[__this])) && (length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	#300 := length#struct_storage_Transfer#87_arr#constr(transfers#90[__this]);
	goto $return12;
	$return12:
	// Function body ends here
}

