// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_32.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_32.sol", 24, 5} {:message "SafeMath::sub"} sub#28(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (#10: int)
{
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	var {:sourceloc "buggy_32.sol", 26, 9} {:message "c"} c#20: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 115][11 := 117][12 := 98][13 := 116][14 := 114][15 := 97][16 := 99][17 := 116][18 := 105][19 := 111][20 := 110][21 := 32][22 := 111][23 := 118][24 := 101][25 := 114][26 := 102][27 := 108][28 := 111][29 := 119], 30)];
	assume (b#7 <= a#5);
	c#20 := (a#5 - b#7);
	#10 := c#20;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_32.sol", 34, 5} {:message "SafeMath::add"} add#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#31: int, b#33: int)
	returns (#36: int)
{
	var {:sourceloc "buggy_32.sol", 35, 9} {:message "c"} c#39: int;
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#39 := (a#31 + b#33);
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 83][1 := 97][2 := 102][3 := 101][4 := 77][5 := 97][6 := 116][7 := 104][8 := 58][9 := 32][10 := 97][11 := 100][12 := 100][13 := 105][14 := 116][15 := 105][16 := 111][17 := 110][18 := 32][19 := 111][20 := 118][21 := 101][22 := 114][23 := 102][24 := 108][25 := 111][26 := 119], 27)];
	assume (c#39 >= a#31);
	#36 := c#39;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_32.sol", 19, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#55(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20TokenInterface -------
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 48, 5} {:message "ERC20TokenInterface::balanceOf"} balanceOf#63(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#58: address_t)
	returns (value#61: int);
	modifies payedOut_unchk8#145, winner_unchk8#147, winAmount_unchk8#149;

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
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 49, 1} {:message "ERC20TokenInterface::my_func_unchk23"} my_func_unchk23#76(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#65: address_t)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 50, 9} {:message ""} true;
	call __send_ret#4 := __send(dst#65, __this, 0, __msg_value);
	$return2:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 52, 5} {:message "ERC20TokenInterface::transfer"} transfer#85(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#78: address_t, _value#80: int)
	returns (success#83: bool);
	modifies payedOut_unchk8#145, winner_unchk8#147, winAmount_unchk8#149;

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 53, 1} {:message "ERC20TokenInterface::unhandledsend_unchk14"} unhandledsend_unchk14#97(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#87: address_t)
{
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#5 := 5000000000000000000;
	assume {:sourceloc "buggy_32.sol", 54, 5} {:message ""} true;
	call __send_ret#6 := __send(callee#87, __this, 0, call_arg#5);
	$return3:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 56, 5} {:message "ERC20TokenInterface::transferFrom"} transferFrom#108(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#99: address_t, _to#101: address_t, _value#103: int)
	returns (success#106: bool);
	modifies payedOut_unchk8#145, winner_unchk8#147, winAmount_unchk8#149;

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_32.sol", 57, 1} {:message "ERC20TokenInterface::bug_unchk30"} bug_unchk30#133(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 58, 1} {:message "receivers_unchk30"} receivers_unchk30#112: int;
	var {:sourceloc "buggy_32.sol", 59, 1} {:message "addr_unchk30"} addr_unchk30#115: address_t;
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#112 := 0;
	addr_unchk30#115 := 0;
	call_arg#7 := 42000000000000000000;
	assume {:sourceloc "buggy_32.sol", 60, 6} {:message ""} true;
	call __send_ret#8 := __send(addr_unchk30#115, __this, 0, call_arg#7);
	if (!(__send_ret#8)) {
	receivers_unchk30#112 := (receivers_unchk30#112 + 1);
	}
	else {
	assume false;
	}

	$return4:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 65, 5} {:message "ERC20TokenInterface::approve"} approve#142(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#135: address_t, _value#137: int)
	returns (success#140: bool);
	modifies payedOut_unchk8#145, winner_unchk8#147, winAmount_unchk8#149;

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_32.sol", 66, 1} {:message "payedOut_unchk8"} payedOut_unchk8#145: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_32.sol", 67, 1} {:message "winner_unchk8"} winner_unchk8#147: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_32.sol", 68, 1} {:message "winAmount_unchk8"} winAmount_unchk8#149: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_32.sol", 70, 1} {:message "ERC20TokenInterface::sendToWinner_unchk8"} sendToWinner_unchk8#168(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#145[__this]);
	assume {:sourceloc "buggy_32.sol", 72, 9} {:message ""} true;
	call __send_ret#9 := __send(winner_unchk8#147[__this], __this, 0, winAmount_unchk8#149[__this]);
	payedOut_unchk8#145 := payedOut_unchk8#145[__this := true];
	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 75, 5} {:message "ERC20TokenInterface::allowance"} allowance#177(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#170: address_t, _spender#172: address_t)
	returns (remaining#175: int);
	modifies payedOut_unchk8#145, winner_unchk8#147, winAmount_unchk8#149;

// 
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 76, 1} {:message "ERC20TokenInterface::bug_unchk39"} bug_unchk39#189(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#179: address_t)
{
	var call_arg#10: int;
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#10 := 4000000000000000000;
	assume {:sourceloc "buggy_32.sol", 77, 8} {:message ""} true;
	call __send_ret#11 := __send(addr#179, __this, 0, call_arg#10);
	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_32.sol", 46, 1} {:message "ERC20TokenInterface::[implicit_constructor]"} __constructor#190(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	payedOut_unchk8#145 := payedOut_unchk8#145[__this := false];
	winner_unchk8#147 := winner_unchk8#147[__this := 0];
	winAmount_unchk8#149 := winAmount_unchk8#149[__this := 0];
}

// 
// ------- Contract: ERC20Token -------
// Inherits from: ERC20TokenInterface
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_32.sol", 205, 3} {:message "[event] ERC20Token::Transfer"} Transfer#566(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#560: address_t, _to#562: address_t, _value#564: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_32.sol", 209, 3} {:message "[event] ERC20Token::Approval"} Approval#588(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#582: address_t, _spender#584: address_t, _value#586: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 87, 3} {:message "ERC20Token::unhandledsend_unchk26"} unhandledsend_unchk26#208(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#198: address_t)
{
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#12 := 5000000000000000000;
	assume {:sourceloc "buggy_32.sol", 88, 5} {:message ""} true;
	call __send_ret#13 := __send(callee#198, __this, 0, call_arg#12);
	$return7:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_32.sol", 90, 3} {:message "totalSupply"} totalSupply#210: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_32.sol", 91, 3} {:message "payedOut_unchk20"} payedOut_unchk20#213: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_32.sol", 92, 1} {:message "winner_unchk20"} winner_unchk20#215: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_32.sol", 93, 1} {:message "winAmount_unchk20"} winAmount_unchk20#217: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_32.sol", 95, 1} {:message "ERC20Token::sendToWinner_unchk20"} sendToWinner_unchk20#236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#213[__this]);
	assume {:sourceloc "buggy_32.sol", 97, 9} {:message ""} true;
	call __send_ret#14 := __send(winner_unchk20#215[__this], __this, 0, winAmount_unchk20#217[__this]);
	payedOut_unchk20#213 := payedOut_unchk20#213[__this := true];
	$return8:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_32.sol", 100, 3} {:message "balances"} balances#240: [address_t][address_t]int;
// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_32.sol", 101, 3} {:message "payedOut_unchk32"} payedOut_unchk32#243: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_32.sol", 102, 1} {:message "winner_unchk32"} winner_unchk32#245: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_32.sol", 103, 1} {:message "winAmount_unchk32"} winAmount_unchk32#247: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_32.sol", 105, 1} {:message "ERC20Token::sendToWinner_unchk32"} sendToWinner_unchk32#266(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#243[__this]);
	assume {:sourceloc "buggy_32.sol", 107, 9} {:message ""} true;
	call __send_ret#15 := __send(winner_unchk32#245[__this], __this, 0, winAmount_unchk32#247[__this]);
	payedOut_unchk32#243 := payedOut_unchk32#243[__this := true];
	$return9:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_32.sol", 110, 3} {:message "allowed"} allowed#272: [address_t][address_t][address_t]int;
// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 116, 5} {:message "ERC20Token::balanceOf"} balanceOf#286(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#275: address_t)
	returns (value#279: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	value#279 := balances#240[__this][_owner#275];
	goto $return10;
	$return10:
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
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 119, 1} {:message "ERC20Token::my_func_uncheck36"} my_func_uncheck36#301(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#288: address_t)
{
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_32.sol", 120, 3} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(dst#288, __this, __msg_value);
	if (__call_ret#16) {
	havoc totalSupply#210;
	havoc payedOut_unchk20#213;
	havoc winner_unchk20#215;
	havoc winAmount_unchk20#217;
	havoc balances#240;
	havoc payedOut_unchk32#243;
	havoc winner_unchk32#245;
	havoc winAmount_unchk32#247;
	havoc allowed#272;
	havoc payedOut_unchk44#423;
	havoc winner_unchk44#425;
	havoc winAmount_unchk44#427;
	havoc payedOut_unchk33#512;
	havoc payedOut_unchk45#537;
	havoc payedOut_unchk8#145;
	havoc winner_unchk8#147;
	havoc winAmount_unchk8#149;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return11:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 128, 5} {:message "ERC20Token::transfer"} transfer#346(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#304: address_t, _value#306: int)
	returns (success#310: bool)
{
	var sub#28_ret#18: int;
	var add#54_ret#19: int;
	var call_arg#20: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 129, 32} {:message ""} true;
	call sub#28_ret#18 := sub#28(__this, __msg_sender, __msg_value, balances#240[__this][__msg_sender], _value#306);
	balances#240 := balances#240[__this := balances#240[__this][__msg_sender := sub#28_ret#18]];
	assume {:sourceloc "buggy_32.sol", 130, 25} {:message ""} true;
	call add#54_ret#19 := add#54(__this, __msg_sender, __msg_value, balances#240[__this][_to#304], _value#306);
	balances#240 := balances#240[__this := balances#240[__this][_to#304 := add#54_ret#19]];
	call_arg#20 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 131, 14} {:message ""} true;
	call Transfer#566(__this, __msg_sender, __msg_value, call_arg#20, _to#304, _value#306);
	success#310 := true;
	goto $return12;
	$return12:
	// Function body ends here
}

// 
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 134, 1} {:message "ERC20Token::my_func_unchk35"} my_func_unchk35#359(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#348: address_t)
{
	var __send_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 135, 9} {:message ""} true;
	call __send_ret#21 := __send(dst#348, __this, 0, __msg_value);
	$return13:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 144, 5} {:message "ERC20Token::transferFrom"} transferFrom#420(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#362: address_t, _to#364: address_t, _value#366: int)
	returns (success#370: bool)
{
	var sub#28_ret#22: int;
	var sub#28_ret#23: int;
	var add#54_ret#24: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_32.sol", 145, 38} {:message ""} true;
	call sub#28_ret#22 := sub#28(__this, __msg_sender, __msg_value, allowed#272[__this][_from#362][__msg_sender], _value#366);
	allowed#272 := allowed#272[__this := allowed#272[__this][_from#362 := allowed#272[__this][_from#362][__msg_sender := sub#28_ret#22]]];
	assume {:sourceloc "buggy_32.sol", 146, 27} {:message ""} true;
	call sub#28_ret#23 := sub#28(__this, __msg_sender, __msg_value, balances#240[__this][_from#362], _value#366);
	balances#240 := balances#240[__this := balances#240[__this][_from#362 := sub#28_ret#23]];
	assume {:sourceloc "buggy_32.sol", 147, 25} {:message ""} true;
	call add#54_ret#24 := add#54(__this, __msg_sender, __msg_value, balances#240[__this][_to#364], _value#366);
	balances#240 := balances#240[__this := balances#240[__this][_to#364 := add#54_ret#24]];
	assume {:sourceloc "buggy_32.sol", 148, 14} {:message ""} true;
	call Transfer#566(__this, __msg_sender, __msg_value, _from#362, _to#364, _value#366);
	success#370 := true;
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_32.sol", 151, 1} {:message "payedOut_unchk44"} payedOut_unchk44#423: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_32.sol", 152, 1} {:message "winner_unchk44"} winner_unchk44#425: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_32.sol", 153, 1} {:message "winAmount_unchk44"} winAmount_unchk44#427: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_32.sol", 155, 1} {:message "ERC20Token::sendToWinner_unchk44"} sendToWinner_unchk44#446(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#25: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#423[__this]);
	assume {:sourceloc "buggy_32.sol", 157, 9} {:message ""} true;
	call __send_ret#25 := __send(winner_unchk44#425[__this], __this, 0, winAmount_unchk44#427[__this]);
	payedOut_unchk44#423 := payedOut_unchk44#423[__this := true];
	$return15:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_32.sol", 166, 5} {:message "ERC20Token::approve"} approve#476(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#449: address_t, _value#451: int)
	returns (success#455: bool)
{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#272 := allowed#272[__this := allowed#272[__this][__msg_sender := allowed#272[__this][__msg_sender][_spender#449 := _value#451]]];
	call_arg#26 := __msg_sender;
	assume {:sourceloc "buggy_32.sol", 168, 14} {:message ""} true;
	call Approval#588(__this, __msg_sender, __msg_value, call_arg#26, _spender#449, _value#451);
	success#455 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_32.sol", 171, 1} {:message "ERC20Token::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#491(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 172, 4} {:message "addr_unchk40"} addr_unchk40#480: address_t;
	var call_arg#27: int;
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#480 := 0;
	call_arg#27 := 2000000000000000000;
	assume {:sourceloc "buggy_32.sol", 173, 10} {:message ""} true;
	call __send_ret#28 := __send(addr_unchk40#480, __this, 0, call_arg#27);
	if (!(__send_ret#28)) {
	
	}
	else {
	
	}

	$return17:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_32.sol", 186, 5} {:message "ERC20Token::allowance"} allowance#509(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#494: address_t, _spender#496: address_t)
	returns (remaining#500: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#500 := allowed#272[__this][_owner#494][_spender#496];
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_32.sol", 189, 1} {:message "payedOut_unchk33"} payedOut_unchk33#512: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_32.sol", 191, 1} {:message "ERC20Token::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#533(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#512[__this];
	assume {:sourceloc "buggy_32.sol", 193, 3} {:message ""} true;
	call __send_ret#29 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return19:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_32.sol", 199, 3} {:message "payedOut_unchk45"} payedOut_unchk45#537: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_32.sol", 201, 1} {:message "ERC20Token::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#558(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#537[__this];
	assume {:sourceloc "buggy_32.sol", 203, 3} {:message ""} true;
	call __send_ret#30 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return20:
	// Function body ends here
}

// 
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_32.sol", 206, 3} {:message "ERC20Token::callnotchecked_unchk13"} callnotchecked_unchk13#580(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#568: address_t)
{
	var __call_ret#31: bool;
	var __call_ret#32: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_32.sol", 207, 5} {:message ""} true;
	call __call_ret#31, __call_ret#32 := __call(callee#568, __this, 1000000000000000000);
	if (__call_ret#31) {
	havoc totalSupply#210;
	havoc payedOut_unchk20#213;
	havoc winner_unchk20#215;
	havoc winAmount_unchk20#217;
	havoc balances#240;
	havoc payedOut_unchk32#243;
	havoc winner_unchk32#245;
	havoc winAmount_unchk32#247;
	havoc allowed#272;
	havoc payedOut_unchk44#423;
	havoc winner_unchk44#425;
	havoc winAmount_unchk44#427;
	havoc payedOut_unchk33#512;
	havoc payedOut_unchk45#537;
	havoc payedOut_unchk8#145;
	havoc winner_unchk8#147;
	havoc winAmount_unchk8#149;
	havoc __balance;
	}

	if (!(__call_ret#31)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return21:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_32.sol", 85, 1} {:message "ERC20Token::[implicit_constructor]"} __constructor#589(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	totalSupply#210 := totalSupply#210[__this := 0];
	payedOut_unchk20#213 := payedOut_unchk20#213[__this := false];
	winner_unchk20#215 := winner_unchk20#215[__this := 0];
	winAmount_unchk20#217 := winAmount_unchk20#217[__this := 0];
	balances#240 := balances#240[__this := default_address_t_int()];
	payedOut_unchk32#243 := payedOut_unchk32#243[__this := false];
	winner_unchk32#245 := winner_unchk32#245[__this := 0];
	winAmount_unchk32#247 := winAmount_unchk32#247[__this := 0];
	allowed#272 := allowed#272[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk44#423 := payedOut_unchk44#423[__this := false];
	winner_unchk44#425 := winner_unchk44#425[__this := 0];
	winAmount_unchk44#427 := winAmount_unchk44#427[__this := 0];
	payedOut_unchk33#512 := payedOut_unchk33#512[__this := false];
	payedOut_unchk45#537 := payedOut_unchk45#537[__this := false];
	payedOut_unchk8#145 := payedOut_unchk8#145[__this := false];
	winner_unchk8#147 := winner_unchk8#147[__this := 0];
	winAmount_unchk8#149 := winAmount_unchk8#149[__this := 0];
}

// 
// ------- Contract: AsseteGram -------
// Inherits from: ERC20Token
// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 217, 3} {:message "AsseteGram::unhandledsend_unchk38"} unhandledsend_unchk38#604(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#594: address_t)
{
	var call_arg#33: int;
	var __send_ret#34: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#33 := 5000000000000000000;
	assume {:sourceloc "buggy_32.sol", 218, 5} {:message ""} true;
	call __send_ret#34 := __send(callee#594, __this, 0, call_arg#33);
	$return22:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_32.sol", 220, 3} {:message "name"} name#607: [address_t]int_arr_type;
// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_32.sol", 221, 3} {:message "AsseteGram::cash_unchk46"} cash_unchk46#631(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#609: int, subpotIndex#611: int, winner_unchk46#613: address_t)
{
	var {:sourceloc "buggy_32.sol", 222, 9} {:message "subpot_unchk46"} subpot_unchk46#617: int;
	var call_arg#35: int;
	var __send_ret#36: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#617 := 3000000000000000000;
	call_arg#35 := subpot_unchk46#617;
	assume {:sourceloc "buggy_32.sol", 223, 9} {:message ""} true;
	call __send_ret#36 := __send(winner_unchk46#613, __this, 0, call_arg#35);
	subpot_unchk46#617 := 0;
	$return23:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_32.sol", 226, 3} {:message "decimals"} decimals#634: [address_t]int;
// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_32.sol", 227, 3} {:message "AsseteGram::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#649(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 228, 4} {:message "addr_unchk4"} addr_unchk4#638: address_t;
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#638 := 0;
	call_arg#37 := 42000000000000000000;
	assume {:sourceloc "buggy_32.sol", 229, 10} {:message ""} true;
	call __send_ret#38 := __send(addr_unchk4#638, __this, 0, call_arg#37);
	if (!(__send_ret#38)) {
	
	}
	else {
	
	}

	$return24:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_32.sol", 236, 3} {:message "symbol"} symbol#652: [address_t]int_arr_type;
// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_32.sol", 237, 3} {:message "AsseteGram::bug_unchk7"} bug_unchk7#673(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 238, 1} {:message "addr_unchk7"} addr_unchk7#656: address_t;
	var call_arg#39: int;
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#656 := 0;
	call_arg#39 := 10000000000000000000;
	assume {:sourceloc "buggy_32.sol", 239, 6} {:message ""} true;
	call __send_ret#40 := __send(addr_unchk7#656, __this, 0, call_arg#39);
	if ((!(__send_ret#40) || (1 == 1))) {
	assume false;
	}

	$return25:
	// Function body ends here
}

// 
// State variable: version: string storage ref
var {:sourceloc "buggy_32.sol", 242, 3} {:message "version"} version#676: [address_t]int_arr_type;
const unique address_0xac775cD446889ac167da466692449ece5439fc12: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 244, 5} {:message "AsseteGram::[constructor]"} __constructor#749(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 245, 9} {:message "initialOwner"} initialOwner#680: address_t;
	var call_arg#41: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#607 := name#607[__this := int_arr#constr(default_int_int()[0 := 69][1 := 108][2 := 101][3 := 99][4 := 116][5 := 114][6 := 111][7 := 110][8 := 105][9 := 99][10 := 32][11 := 71][12 := 114][13 := 97][14 := 109], 15)];
	decimals#634 := decimals#634[__this := 3];
	symbol#652 := symbol#652[__this := int_arr#constr(default_int_int()[0 := 101][1 := 71][2 := 114][3 := 97][4 := 109], 5)];
	version#676 := version#676[__this := int_arr#constr(default_int_int()[0 := 50], 1)];
	totalSupply#210 := totalSupply#210[__this := 0];
	payedOut_unchk20#213 := payedOut_unchk20#213[__this := false];
	winner_unchk20#215 := winner_unchk20#215[__this := 0];
	winAmount_unchk20#217 := winAmount_unchk20#217[__this := 0];
	balances#240 := balances#240[__this := default_address_t_int()];
	payedOut_unchk32#243 := payedOut_unchk32#243[__this := false];
	winner_unchk32#245 := winner_unchk32#245[__this := 0];
	winAmount_unchk32#247 := winAmount_unchk32#247[__this := 0];
	allowed#272 := allowed#272[__this := default_address_t__k_address_t_v_int()];
	payedOut_unchk44#423 := payedOut_unchk44#423[__this := false];
	winner_unchk44#425 := winner_unchk44#425[__this := 0];
	winAmount_unchk44#427 := winAmount_unchk44#427[__this := 0];
	payedOut_unchk33#512 := payedOut_unchk33#512[__this := false];
	payedOut_unchk45#537 := payedOut_unchk45#537[__this := false];
	payedOut_unchk8#145 := payedOut_unchk8#145[__this := false];
	winner_unchk8#147 := winner_unchk8#147[__this := 0];
	winAmount_unchk8#149 := winAmount_unchk8#149[__this := 0];
	// Function body starts here
	initialOwner#680 := address_0xac775cD446889ac167da466692449ece5439fc12;
	totalSupply#210 := totalSupply#210[__this := 180000000000];
	balances#240 := balances#240[__this := balances#240[__this][initialOwner#680 := totalSupply#210[__this]]];
	call_arg#41 := 0;
	assume {:sourceloc "buggy_32.sol", 248, 14} {:message ""} true;
	call Transfer#566(__this, __msg_sender, __msg_value, call_arg#41, initialOwner#680, balances#240[__this][initialOwner#680]);
	$return26:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_32.sol", 250, 1} {:message "AsseteGram::bug_unchk27"} bug_unchk27#719(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#709: address_t)
{
	var call_arg#42: int;
	var __send_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#42 := 42000000000000000000;
	assume {:sourceloc "buggy_32.sol", 251, 8} {:message ""} true;
	call __send_ret#43 := __send(addr#709, __this, 0, call_arg#42);
	$return27:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_32.sol", 256, 5} {:message "AsseteGram::[fallback]"} #727(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume false;
	$return28:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_32.sol", 259, 1} {:message "AsseteGram::bug_unchk31"} bug_unchk31#748(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_32.sol", 260, 1} {:message "addr_unchk31"} addr_unchk31#731: address_t;
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#731 := 0;
	call_arg#44 := 10000000000000000000;
	assume {:sourceloc "buggy_32.sol", 261, 6} {:message ""} true;
	call __send_ret#45 := __send(addr_unchk31#731, __this, 0, call_arg#44);
	if ((!(__send_ret#45) || (1 == 1))) {
	assume false;
	}

	$return29:
	// Function body ends here
}

