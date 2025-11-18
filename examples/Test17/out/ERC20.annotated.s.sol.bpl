// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: ERC20.annotated.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: ERC20 -------
// Contract invariant: forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "ERC20.annotated.s.sol", 14, 5} {:message "[event] ERC20::Transfer"} Transfer#10(__this: address_t, __msg_sender: address_t, __msg_value: int, from#4: address_t, to#6: address_t, amount#8: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "ERC20.annotated.s.sol", 16, 5} {:message "[event] ERC20::Approval"} Approval#18(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#12: address_t, spender#14: address_t, amount#16: int)
{
	
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "ERC20.annotated.s.sol", 20, 5} {:message "name"} name#20: [address_t]int_arr_type;
// 
// State variable: symbol: string storage ref
var {:sourceloc "ERC20.annotated.s.sol", 22, 5} {:message "symbol"} symbol#22: [address_t]int_arr_type;
// 
// State variable: decimals: uint8
var {:sourceloc "ERC20.annotated.s.sol", 24, 5} {:message "decimals"} decimals#24: [address_t]int;
// 
// State variable: totalSupply: uint256
var {:sourceloc "ERC20.annotated.s.sol", 28, 5} {:message "totalSupply"} totalSupply#26: [address_t]int;
// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "ERC20.annotated.s.sol", 30, 5} {:message "balanceOf"} balanceOf#30: [address_t][address_t]int;
// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "ERC20.annotated.s.sol", 32, 5} {:message "allowance"} allowance#36: [address_t][address_t][address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "ERC20.annotated.s.sol", 36, 5} {:message "ERC20::[constructor]"} __constructor#234(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#38: int_arr_ptr, _symbol#40: int_arr_ptr, _decimals#42: int)
	ensures {:sourceloc "ERC20.annotated.s.sol", 36, 5} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold at end of function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));

{
	// TCC assumptions
	assume (_name#38 < __alloc_counter);
	assume (_symbol#40 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#20 := name#20[__this := int_arr#constr(default_int_int(), 0)];
	symbol#22 := symbol#22[__this := int_arr#constr(default_int_int(), 0)];
	decimals#24 := decimals#24[__this := 0];
	totalSupply#26 := totalSupply#26[__this := 0];
	balanceOf#30 := balanceOf#30[__this := default_address_t_int()];
	allowance#36 := allowance#36[__this := default_address_t__k_address_t_v_int()];
	// Function body starts here
	name#20 := name#20[__this := mem_arr_int[_name#38]];
	symbol#22 := symbol#22[__this := mem_arr_int[_symbol#40]];
	decimals#24 := decimals#24[__this := _decimals#42];
	$return0:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "ERC20.annotated.s.sol", 48, 5} {:message "ERC20::approve"} approve#87(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#61: address_t, amount#63: int)
	returns (#66: bool)
	requires {:sourceloc "ERC20.annotated.s.sol", 48, 5} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold when entering function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));
	requires {:sourceloc "ERC20.annotated.s.sol", 48, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#63 >= 0);

	ensures {:sourceloc "ERC20.annotated.s.sol", 48, 5} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold at end of function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));

{
	var call_arg#0: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#36 := allowance#36[__this := allowance#36[__this][__msg_sender := allowance#36[__this][__msg_sender][spender#61 := amount#63]]];
	call_arg#0 := __msg_sender;
	assume {:sourceloc "ERC20.annotated.s.sol", 51, 14} {:message ""} true;
	call Approval#18(__this, __msg_sender, __msg_value, call_arg#0, spender#61, amount#63);
	#66 := true;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "ERC20.annotated.s.sol", 57, 5} {:message "ERC20::transfer"} transfer#120(__this: address_t, __msg_sender: address_t, __msg_value: int, to#90: address_t, amount#92: int)
	returns (#95: bool)
	requires {:sourceloc "ERC20.annotated.s.sol", 57, 5} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold when entering function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));
	requires {:sourceloc "ERC20.annotated.s.sol", 57, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#92 >= 0);

	ensures {:sourceloc "ERC20.annotated.s.sol", 57, 5} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold at end of function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));

{
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balanceOf#30 := balanceOf#30[__this := balanceOf#30[__this][__msg_sender := (balanceOf#30[__this][__msg_sender] - amount#92)]];
	balanceOf#30 := balanceOf#30[__this := balanceOf#30[__this][to#90 := (balanceOf#30[__this][to#90] + amount#92)]];
	call_arg#1 := __msg_sender;
	assume {:sourceloc "ERC20.annotated.s.sol", 64, 14} {:message ""} true;
	call Transfer#10(__this, __msg_sender, __msg_value, call_arg#1, to#90, amount#92);
	#95 := true;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "ERC20.annotated.s.sol", 70, 5} {:message "ERC20::transferFrom"} transferFrom#177(__this: address_t, __msg_sender: address_t, __msg_value: int, from#123: address_t, to#125: address_t, amount#127: int)
	returns (#130: bool)
	requires {:sourceloc "ERC20.annotated.s.sol", 70, 5} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold when entering function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));
	requires {:sourceloc "ERC20.annotated.s.sol", 70, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#127 >= 0);

	ensures {:sourceloc "ERC20.annotated.s.sol", 70, 5} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold at end of function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));

{
	var {:sourceloc "ERC20.annotated.s.sol", 75, 9} {:message "allowed"} allowed#133: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#133 := allowance#36[__this][from#123][__msg_sender];
	if ((allowed#133 != 115792089237316195423570985008687907853269984665640564039457584007913129639935)) {
	allowance#36 := allowance#36[__this := allowance#36[__this][from#123 := allowance#36[__this][from#123][__msg_sender := (allowed#133 - amount#127)]]];
	}

	balanceOf#30 := balanceOf#30[__this := balanceOf#30[__this][from#123 := (balanceOf#30[__this][from#123] - amount#127)]];
	balanceOf#30 := balanceOf#30[__this := balanceOf#30[__this][to#125 := (balanceOf#30[__this][to#125] + amount#127)]];
	assume {:sourceloc "ERC20.annotated.s.sol", 85, 14} {:message ""} true;
	call Transfer#10(__this, __msg_sender, __msg_value, from#123, to#125, amount#127);
	#130 := true;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "ERC20.annotated.s.sol", 92, 5} {:message "ERC20::_mint"} _mint#205(__this: address_t, __msg_sender: address_t, __msg_value: int, to#180: address_t, amount#182: int)
	requires {:sourceloc "ERC20.annotated.s.sol", 92, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#182 >= 0);

{
	var call_arg#2: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	totalSupply#26 := totalSupply#26[__this := (totalSupply#26[__this] + amount#182)];
	balanceOf#30 := balanceOf#30[__this := balanceOf#30[__this][to#180 := (balanceOf#30[__this][to#180] + amount#182)]];
	call_arg#2 := 0;
	assume {:sourceloc "ERC20.annotated.s.sol", 99, 14} {:message ""} true;
	call Transfer#10(__this, __msg_sender, __msg_value, call_arg#2, to#180, amount#182);
	$return4:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "ERC20.annotated.s.sol", 103, 5} {:message "ERC20::_burn"} _burn#233(__this: address_t, __msg_sender: address_t, __msg_value: int, from#208: address_t, amount#210: int)
	requires {:sourceloc "ERC20.annotated.s.sol", 103, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#210 >= 0);

{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balanceOf#30 := balanceOf#30[__this := balanceOf#30[__this][from#208 := (balanceOf#30[__this][from#208] - amount#210)]];
	totalSupply#26 := totalSupply#26[__this := (totalSupply#26[__this] - amount#210)];
	call_arg#3 := 0;
	assume {:sourceloc "ERC20.annotated.s.sol", 110, 14} {:message ""} true;
	call Transfer#10(__this, __msg_sender, __msg_value, from#208, call_arg#3, amount#210);
	$return5:
	// Function body ends here
}

procedure {:sourceloc "ERC20.annotated.s.sol", 11, 1} {:message "ERC20::[receive_ether_selfdestruct]"} ERC20_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "ERC20.annotated.s.sol", 11, 1} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold when entering function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));

	ensures {:sourceloc "ERC20.annotated.s.sol", 11, 1} {:message "Invariant 'forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)' might not hold at end of function."} (forall a#2: address_t, b#4: address_t :: (!((a#2 != b#4)) || ((balanceOf#30[__this][a#2] + balanceOf#30[__this][b#4]) <= totalSupply#26[__this])));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

