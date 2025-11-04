// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: ERC20.balanceChangesFromCertainFunctions.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Inherits from: IERC20Metadata
// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 35, 5} {:message "_balances"} _balances#12: [address_t][address_t]int;
// 
// State variable: _allowances: mapping(address => mapping(address => uint256))
var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 37, 5} {:message "_allowances"} _allowances#18: [address_t][address_t][address_t]int;
// 
// State variable: _totalSupply: uint256
var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 39, 5} {:message "_totalSupply"} _totalSupply#20: [address_t]int;
// 
// State variable: _owner: address
var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 41, 5} {:message "_owner"} _owner#22: [address_t]address_t;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 52, 5} {:message "ERC20::[constructor]"} __constructor#582(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_balances#12 := _balances#12[__this := default_address_t_int()];
	_allowances#18 := _allowances#18[__this := default_address_t__k_address_t_v_int()];
	_totalSupply#20 := _totalSupply#20[__this := 0];
	_owner#22 := _owner#22[__this := 0];
	// Function body starts here
	$return0:
	// Function body ends here
}

type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 63, 5} {:message "ERC20::name"} name#48(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#43: int_arr_ptr)
{
	var new_array#0: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#0 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#43 := new_array#0;
	mem_arr_int := mem_arr_int[#43 := int_arr#constr(default_int_int()[0 := 110][1 := 97][2 := 109][3 := 101], 4)];
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 71, 5} {:message "ERC20::symbol"} symbol#58(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#53: int_arr_ptr)
{
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#53 := new_array#1;
	mem_arr_int := mem_arr_int[#53 := int_arr#constr(default_int_int()[0 := 115][1 := 121][2 := 109][3 := 98][4 := 111][5 := 108], 6)];
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 88, 5} {:message "ERC20::decimals"} decimals#68(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#63: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#63 := 18;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 95, 5} {:message "ERC20::totalSupply"} totalSupply#78(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#73: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#73 := _totalSupply#20[__this];
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 102, 5} {:message "ERC20::balanceOf"} balanceOf#92(__this: address_t, __msg_sender: address_t, __msg_value: int, account#81: address_t)
	returns (#85: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#85 := _balances#12[__this][account#81];
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 120, 5} {:message "ERC20::transfer"} transfer#113(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#95: address_t, amount#97: int)
	returns (#101: bool)
{
	var call_arg#2: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#2 := __msg_sender;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 126, 9} {:message ""} true;
	call _transfer#333(__this, __msg_sender, __msg_value, call_arg#2, recipient#95, amount#97);
	#101 := true;
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 133, 5} {:message "ERC20::allowance"} allowance#131(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#116: address_t, spender#118: address_t)
	returns (#122: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#122 := _allowances#18[__this][owner#116][spender#118];
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 152, 5} {:message "ERC20::approve"} approve#152(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#134: address_t, amount#136: int)
	returns (#140: bool)
	requires {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 152, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#136 >= 0);

	ensures {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 152, 5} {:message "Postcondition 'forall (address user) !(_balances[user] != __verifier_old_uint(_balances[user]))' might not hold at end of function."} (forall user#2: address_t :: !((_balances#12[__this][user#2] != old(_balances#12[__this][user#2]))));

{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#3 := __msg_sender;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 158, 9} {:message ""} true;
	call _approve#511(__this, __msg_sender, __msg_value, call_arg#3, spender#134, amount#136);
	#140 := true;
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 177, 5} {:message "ERC20::transferFrom"} transferFrom#199(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#155: address_t, recipient#157: address_t, amount#159: int)
	returns (#163: bool)
	requires {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 177, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#159 >= 0);

	ensures {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 177, 5} {:message "Postcondition 'forall (address user) !(_balances[user] != __verifier_old_uint(_balances[user]))' might not hold at end of function."} (forall user#2: address_t :: !((_balances#12[__this][user#2] != old(_balances#12[__this][user#2]))));

{
	var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 182, 9} {:message "currentAllowance"} currentAllowance#166: int;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	currentAllowance#166 := _allowances#18[__this][sender#155][__msg_sender];
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 97][17 := 109][18 := 111][19 := 117][20 := 110][21 := 116][22 := 32][23 := 101][24 := 120][25 := 99][26 := 101][27 := 101][28 := 100][29 := 115][30 := 32][31 := 97][32 := 108][33 := 108][34 := 111][35 := 119][36 := 97][37 := 110][38 := 99][39 := 101], 40)];
	assume (currentAllowance#166 >= amount#159);
	call_arg#6 := __msg_sender;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 187, 9} {:message ""} true;
	call _approve#511(__this, __msg_sender, __msg_value, sender#155, call_arg#6, (currentAllowance#166 - amount#159));
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 189, 9} {:message ""} true;
	call _transfer#333(__this, __msg_sender, __msg_value, sender#155, recipient#157, amount#159);
	#163 := true;
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: increaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 208, 5} {:message "ERC20::increaseAllowance"} increaseAllowance#226(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#202: address_t, addedValue#204: int)
	returns (#207: bool)
	requires {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 208, 5} {:message "Precondition 'addedValue >= 0' might not hold when entering function."} (addedValue#204 >= 0);

	ensures {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 208, 5} {:message "Postcondition 'forall (address user) !(_balances[user] != __verifier_old_uint(_balances[user]))' might not hold at end of function."} (forall user#2: address_t :: !((_balances#12[__this][user#2] != old(_balances#12[__this][user#2]))));

{
	var call_arg#7: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := __msg_sender;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 213, 9} {:message ""} true;
	call _approve#511(__this, __msg_sender, __msg_value, call_arg#7, spender#202, (_allowances#18[__this][__msg_sender][spender#202] + addedValue#204));
	#207 := true;
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// Function: decreaseAllowance : function (address,uint256) returns (bool)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 237, 5} {:message "ERC20::decreaseAllowance"} decreaseAllowance#257(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#229: address_t, subtractedValue#231: int)
	returns (#234: bool)
	requires {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 237, 5} {:message "Precondition 'subtractedValue >= 0' might not hold when entering function."} (subtractedValue#231 >= 0);

	ensures {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 237, 5} {:message "Postcondition 'forall (address user) !(_balances[user] != __verifier_old_uint(_balances[user]))' might not hold at end of function."} (forall user#2: address_t :: !((_balances#12[__this][user#2] != old(_balances#12[__this][user#2]))));

{
	var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 242, 9} {:message "currentAllowance"} currentAllowance#237: int;
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	currentAllowance#237 := _allowances#18[__this][__msg_sender][spender#229];
	call_arg#8 := __msg_sender;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 244, 9} {:message ""} true;
	call _approve#511(__this, __msg_sender, __msg_value, call_arg#8, spender#229, (currentAllowance#237 - subtractedValue#231));
	#234 := true;
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 263, 5} {:message "ERC20::_transfer"} _transfer#333(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#260: address_t, recipient#262: address_t, amount#264: int)
{
	var call_arg#9: int_arr_ptr;
	var new_array#10: int_arr_ptr;
	var call_arg#11: int_arr_ptr;
	var new_array#12: int_arr_ptr;
	var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 273, 9} {:message "senderBalance"} senderBalance#294: int;
	var call_arg#13: int_arr_ptr;
	var new_array#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#10 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#9 := new_array#10;
	mem_arr_int := mem_arr_int[call_arg#9 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 102][17 := 114][18 := 111][19 := 109][20 := 32][21 := 116][22 := 104][23 := 101][24 := 32][25 := 122][26 := 101][27 := 114][28 := 111][29 := 32][30 := 97][31 := 100][32 := 100][33 := 114][34 := 101][35 := 115][36 := 115], 37)];
	assume (sender#260 != 0);
	new_array#12 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#11 := new_array#12;
	mem_arr_int := mem_arr_int[call_arg#11 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (recipient#262 != 0);
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 271, 9} {:message ""} true;
	call _beforeTokenTransfer#522(__this, __msg_sender, __msg_value, sender#260, recipient#262, amount#264);
	senderBalance#294 := _balances#12[__this][sender#260];
	new_array#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#13 := new_array#14;
	mem_arr_int := mem_arr_int[call_arg#13 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 97][17 := 109][18 := 111][19 := 117][20 := 110][21 := 116][22 := 32][23 := 101][24 := 120][25 := 99][26 := 101][27 := 101][28 := 100][29 := 115][30 := 32][31 := 98][32 := 97][33 := 108][34 := 97][35 := 110][36 := 99][37 := 101], 38)];
	assume (senderBalance#294 >= amount#264);
	_balances#12 := _balances#12[__this := _balances#12[__this][sender#260 := (senderBalance#294 - amount#264)]];
	_balances#12 := _balances#12[__this := _balances#12[__this][recipient#262 := (_balances#12[__this][recipient#262] + amount#264)]];
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 281, 14} {:message ""} true;
	call Transfer#666(__this, __msg_sender, __msg_value, sender#260, recipient#262, amount#264);
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 283, 9} {:message ""} true;
	call _afterTokenTransfer#533(__this, __msg_sender, __msg_value, sender#260, recipient#262, amount#264);
	$return12:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 295, 5} {:message "ERC20::mint"} mint#392(__this: address_t, __msg_sender: address_t, __msg_value: int, account#336: address_t, amount#338: int)
{
	var call_arg#17: int_arr_ptr;
	var new_array#18: int_arr_ptr;
	var call_arg#19: address_t;
	var call_arg#20: address_t;
	var call_arg#21: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (_owner#22[__this] == __msg_sender);
	// Function body starts here
	new_array#18 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#17 := new_array#18;
	mem_arr_int := mem_arr_int[call_arg#17 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 109][8 := 105][9 := 110][10 := 116][11 := 32][12 := 116][13 := 111][14 := 32][15 := 116][16 := 104][17 := 101][18 := 32][19 := 122][20 := 101][21 := 114][22 := 111][23 := 32][24 := 97][25 := 100][26 := 100][27 := 114][28 := 101][29 := 115][30 := 115], 31)];
	assume (account#336 != 0);
	call_arg#19 := 0;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 298, 9} {:message ""} true;
	call _beforeTokenTransfer#522(__this, __msg_sender, __msg_value, call_arg#19, account#336, amount#338);
	_totalSupply#20 := _totalSupply#20[__this := (_totalSupply#20[__this] + amount#338)];
	_balances#12 := _balances#12[__this := _balances#12[__this][account#336 := (_balances#12[__this][account#336] + amount#338)]];
	call_arg#20 := 0;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 302, 14} {:message ""} true;
	call Transfer#666(__this, __msg_sender, __msg_value, call_arg#20, account#336, amount#338);
	call_arg#21 := 0;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 304, 9} {:message ""} true;
	call _afterTokenTransfer#533(__this, __msg_sender, __msg_value, call_arg#21, account#336, amount#338);
	$return14:
	// Function body ends here
	$return13:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: burn : function (address,uint256)
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 318, 5} {:message "ERC20::burn"} burn#466(__this: address_t, __msg_sender: address_t, __msg_value: int, account#395: address_t, amount#397: int)
{
	var call_arg#24: int_arr_ptr;
	var new_array#25: int_arr_ptr;
	var call_arg#26: address_t;
	var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 323, 9} {:message "accountBalance"} accountBalance#423#23: int;
	var call_arg#27: int_arr_ptr;
	var new_array#28: int_arr_ptr;
	var call_arg#29: address_t;
	var call_arg#30: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (_owner#22[__this] == __msg_sender);
	// Function body starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#24 := new_array#25;
	mem_arr_int := mem_arr_int[call_arg#24 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 102][13 := 114][14 := 111][15 := 109][16 := 32][17 := 116][18 := 104][19 := 101][20 := 32][21 := 122][22 := 101][23 := 114][24 := 111][25 := 32][26 := 97][27 := 100][28 := 100][29 := 114][30 := 101][31 := 115][32 := 115], 33)];
	assume (account#395 != 0);
	call_arg#26 := 0;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 321, 9} {:message ""} true;
	call _beforeTokenTransfer#522(__this, __msg_sender, __msg_value, account#395, call_arg#26, amount#397);
	accountBalance#423#23 := _balances#12[__this][account#395];
	new_array#28 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#27 := new_array#28;
	mem_arr_int := mem_arr_int[call_arg#27 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 98][8 := 117][9 := 114][10 := 110][11 := 32][12 := 97][13 := 109][14 := 111][15 := 117][16 := 110][17 := 116][18 := 32][19 := 101][20 := 120][21 := 99][22 := 101][23 := 101][24 := 100][25 := 115][26 := 32][27 := 98][28 := 97][29 := 108][30 := 97][31 := 110][32 := 99][33 := 101], 34)];
	assume (accountBalance#423#23 >= amount#397);
	_balances#12 := _balances#12[__this := _balances#12[__this][account#395 := (accountBalance#423#23 - amount#397)]];
	_totalSupply#20 := _totalSupply#20[__this := (_totalSupply#20[__this] - amount#397)];
	call_arg#29 := 0;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 328, 14} {:message ""} true;
	call Transfer#666(__this, __msg_sender, __msg_value, account#395, call_arg#29, amount#397);
	call_arg#30 := 0;
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 330, 9} {:message ""} true;
	call _afterTokenTransfer#533(__this, __msg_sender, __msg_value, account#395, call_arg#30, amount#397);
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 346, 5} {:message "ERC20::_approve"} _approve#511(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#469: address_t, spender#471: address_t, amount#473: int)
{
	var call_arg#31: int_arr_ptr;
	var new_array#32: int_arr_ptr;
	var call_arg#33: int_arr_ptr;
	var new_array#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#32 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#31 := new_array#32;
	mem_arr_int := mem_arr_int[call_arg#31 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (owner#469 != 0);
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#33 := new_array#34;
	mem_arr_int := mem_arr_int[call_arg#33 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (spender#471 != 0);
	_allowances#18 := _allowances#18[__this := _allowances#18[__this][owner#469 := _allowances#18[__this][owner#469][spender#471 := amount#473]]];
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 354, 14} {:message ""} true;
	call Approval#675(__this, __msg_sender, __msg_value, owner#469, spender#471, amount#473);
	$return17:
	// Function body ends here
}

// 
// Function: _beforeTokenTransfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 371, 5} {:message "ERC20::_beforeTokenTransfer"} _beforeTokenTransfer#522(__this: address_t, __msg_sender: address_t, __msg_value: int, from#514: address_t, to#516: address_t, amount#518: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	$return18:
	// Function body ends here
}

// 
// Function: _afterTokenTransfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 391, 5} {:message "ERC20::_afterTokenTransfer"} _afterTokenTransfer#533(__this: address_t, __msg_sender: address_t, __msg_value: int, from#525: address_t, to#527: address_t, amount#529: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	$return19:
	// Function body ends here
}

// 
// Function: deposit
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 397, 5} {:message "ERC20::deposit"} deposit#545(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	_balances#12 := _balances#12[__this := _balances#12[__this][__msg_sender := (_balances#12[__this][__msg_sender] + __msg_value)]];
	$return20:
	// Function body ends here
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
// Function: withdraw
procedure {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 401, 5} {:message "ERC20::withdraw"} withdraw#581(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#547: int)
{
	var {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 404, 10} {:message "success"} success#567: bool;
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (amount#547 <= _balances#12[__this][__msg_sender]);
	_balances#12 := _balances#12[__this := _balances#12[__this][__msg_sender := (_balances#12[__this][__msg_sender] - amount#547)]];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= amount#547);
	__balance := __balance[__this := (__balance[__this] - amount#547)];
	assume {:sourceloc "ERC20.balanceChangesFromCertainFunctions.s.sol", 404, 28} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(__msg_sender, __this, amount#547);
	if (__call_ret#35) {
	havoc _balances#12;
	havoc _allowances#18;
	havoc _totalSupply#20;
	havoc _owner#22;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + amount#547)];
	}

	success#567 := __call_ret#35;
	assume success#567;
	$return21:
	// Function body ends here
}

// 
// ------- Source: IERC20.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "IERC20.sol", 122, 5} {:message "[event] IERC20::Transfer"} Transfer#666(__this: address_t, __msg_sender: address_t, __msg_value: int, from#660: address_t, to#662: address_t, value#664: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "IERC20.sol", 128, 5} {:message "[event] IERC20::Approval"} Approval#675(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#669: address_t, spender#671: address_t, value#673: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "IERC20.sol", 39, 5} {:message "IERC20::totalSupply"} totalSupply#591(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#589: int);

// 
// Function: balanceOf
procedure {:sourceloc "IERC20.sol", 44, 5} {:message "IERC20::balanceOf"} balanceOf#599(__this: address_t, __msg_sender: address_t, __msg_value: int, account#594: address_t)
	returns (#597: int);

// 
// Function: transfer
procedure {:sourceloc "IERC20.sol", 53, 5} {:message "IERC20::transfer"} transfer#609(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#602: address_t, amount#604: int)
	returns (#607: bool);

// 
// Function: allowance
procedure {:sourceloc "IERC20.sol", 64, 5} {:message "IERC20::allowance"} allowance#619(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#612: address_t, spender#614: address_t)
	returns (#617: int);

// 
// Function: approve
procedure {:sourceloc "IERC20.sol", 83, 5} {:message "IERC20::approve"} approve#629(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#622: address_t, amount#624: int)
	returns (#627: bool);

// 
// Function: transferFrom
procedure {:sourceloc "IERC20.sol", 94, 5} {:message "IERC20::transferFrom"} transferFrom#641(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#632: address_t, recipient#634: address_t, amount#636: int)
	returns (#639: bool);

// 
// Function: mint
procedure {:sourceloc "IERC20.sol", 106, 5} {:message "IERC20::mint"} mint#649(__this: address_t, __msg_sender: address_t, __msg_value: int, #644: address_t, #646: int);

// 
// Function: burn
procedure {:sourceloc "IERC20.sol", 114, 5} {:message "IERC20::burn"} burn#657(__this: address_t, __msg_sender: address_t, __msg_value: int, #652: address_t, #654: int);

// 
// Default constructor
procedure {:sourceloc "IERC20.sol", 35, 1} {:message "IERC20::[implicit_constructor]"} __constructor#676(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Source: IERC20Metadata.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: IERC20Metadata -------
// Inherits from: IERC20
// 
// Function: name
procedure {:sourceloc "IERC20Metadata.sol", 17, 5} {:message "IERC20Metadata::name"} name#688(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#686: int_arr_ptr);

// 
// Function: symbol
procedure {:sourceloc "IERC20Metadata.sol", 22, 5} {:message "IERC20Metadata::symbol"} symbol#694(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#692: int_arr_ptr);

// 
// Function: decimals
procedure {:sourceloc "IERC20Metadata.sol", 27, 5} {:message "IERC20Metadata::decimals"} decimals#700(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#698: int);

// 
// Default constructor
procedure {:sourceloc "IERC20Metadata.sol", 13, 1} {:message "IERC20Metadata::[implicit_constructor]"} __constructor#701(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

