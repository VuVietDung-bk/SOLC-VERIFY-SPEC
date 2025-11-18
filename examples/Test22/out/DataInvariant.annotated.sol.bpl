// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: DataInvariant.annotated.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: DataInvariant -------
// Contract invariant: forall (address a) balance[a] <= 0
// 
// State variable: balance: mapping(address => int256)
var {:sourceloc "DataInvariant.annotated.sol", 11, 5} {:message "balance"} balance#6: [address_t][address_t]int;
// 
// State variable: accessInvariant: mapping(address => bool)
var {:sourceloc "DataInvariant.annotated.sol", 12, 5} {:message "accessInvariant"} accessInvariant#10: [address_t][address_t]bool;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: breakInvariant
procedure {:sourceloc "DataInvariant.annotated.sol", 18, 5} {:message "DataInvariant::breakInvariant"} breakInvariant#48(__this: address_t, __msg_sender: address_t, __msg_value: int, a#13: address_t, value#15: int)
	returns (accessInv#18: bool)
	requires {:sourceloc "DataInvariant.annotated.sol", 18, 5} {:message "Invariant 'forall (address a) balance[a] <= 0' might not hold when entering function."} (forall a#2: address_t :: (balance#6[__this][a#2] <= 0));

	ensures {:sourceloc "DataInvariant.annotated.sol", 18, 5} {:message "Invariant 'forall (address a) balance[a] <= 0' might not hold at end of function."} (forall a#2: address_t :: (balance#6[__this][a#2] <= 0));

{
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 86][1 := 97][2 := 108][3 := 117][4 := 101][5 := 32][6 := 109][7 := 117][8 := 115][9 := 116][10 := 32][11 := 98][12 := 101][13 := 32][14 := 110][15 := 111][16 := 110][17 := 110][18 := 101][19 := 103][20 := 97][21 := 116][22 := 105][23 := 118][24 := 101], 25)];
	assume (value#15 >= 0);
	balance#6 := balance#6[__this := balance#6[__this][a#13 := (balance#6[__this][a#13] - (2 * value#15))]];
	accessInv#18 := accessInvariant#10[__this][a#13];
	balance#6 := balance#6[__this := balance#6[__this][a#13 := (balance#6[__this][a#13] + value#15)]];
	$return0:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
procedure {:sourceloc "DataInvariant.annotated.sol", 9, 1} {:message "DataInvariant::[implicit_constructor]"} __constructor#49(__this: address_t, __msg_sender: address_t, __msg_value: int)
	ensures {:sourceloc "DataInvariant.annotated.sol", 9, 1} {:message "State variable initializers might violate invariant 'forall (address a) balance[a] <= 0'."} (forall a#2: address_t :: (balance#6[__this][a#2] <= 0));

{
	assume (__balance[__this] >= 0);
	balance#6 := balance#6[__this := default_address_t_int()];
	accessInvariant#10 := accessInvariant#10[__this := default_address_t_bool()];
}

procedure {:sourceloc "DataInvariant.annotated.sol", 9, 1} {:message "DataInvariant::[receive_ether_selfdestruct]"} DataInvariant_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "DataInvariant.annotated.sol", 9, 1} {:message "Invariant 'forall (address a) balance[a] <= 0' might not hold when entering function."} (forall a#2: address_t :: (balance#6[__this][a#2] <= 0));

	ensures {:sourceloc "DataInvariant.annotated.sol", 9, 1} {:message "Invariant 'forall (address a) balance[a] <= 0' might not hold at end of function."} (forall a#2: address_t :: (balance#6[__this][a#2] <= 0));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

