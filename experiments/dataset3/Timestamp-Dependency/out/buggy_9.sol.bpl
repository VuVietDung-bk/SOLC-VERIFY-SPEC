// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_9.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 16, 3} {:message "SafeMath::mul"} mul#36(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (c#10: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#5 == 0)) {
	c#10 := 0;
	goto $return0;
	}

	c#10 := (a#5 * b#7);
	assert {:sourceloc "buggy_9.sol", 21, 5} {:message "Assertion might not hold."} ((c#10 div a#5) == b#7);
	c#10 := c#10;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 28, 3} {:message "SafeMath::div"} div#51(__this: address_t, __msg_sender: address_t, __msg_value: int, a#39: int, b#41: int)
	returns (#44: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#44 := (a#39 div b#41);
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 38, 3} {:message "SafeMath::sub"} sub#72(__this: address_t, __msg_sender: address_t, __msg_value: int, a#54: int, b#56: int)
	returns (#59: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assert {:sourceloc "buggy_9.sol", 39, 5} {:message "Assertion might not hold."} (b#56 <= a#54);
	#59 := (a#54 - b#56);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 46, 3} {:message "SafeMath::add"} add#97(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
	returns (c#80: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#80 := (a#75 + b#77);
	assert {:sourceloc "buggy_9.sol", 48, 5} {:message "Assertion might not hold."} (c#80 >= a#75);
	c#80 := c#80;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_9.sol", 11, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#98(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Ownable -------
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_9.sol", 55, 3} {:message "Ownable::bug_tmstmp9"} bug_tmstmp9#109(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#101: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#101 := (__block_timestamp >= 1546300800);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_9.sol", 58, 3} {:message "owner"} owner#111: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 60, 5} {:message "Ownable::[constructor]"} __constructor#164(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#111 := owner#111[__this := 0];
	winner_tmstmp7#122 := winner_tmstmp7#122[__this := 0];
	bugv_tmstmp5#163 := bugv_tmstmp5#163[__this := __block_timestamp];
	// Function body starts here
	owner#111 := owner#111[__this := __msg_sender];
	$return5:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_9.sol", 63, 1} {:message "winner_tmstmp7"} winner_tmstmp7#122: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 64, 1} {:message "Ownable::play_tmstmp7"} play_tmstmp7#148(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#124: int)
{
	var {:sourceloc "buggy_9.sol", 65, 2} {:message "_vtime"} _vtime#128: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#128 := __block_timestamp;
	if (((startTime#124 + 432000) == _vtime#128)) {
	winner_tmstmp7#122 := winner_tmstmp7#122[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_9.sol", 73, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#163: [address_t]int;
// 
// ------- Contract: TokenERC20 -------
// Inherits from: Ownable
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_9.sol", 136, 3} {:message "[event] TokenERC20::Transfer"} Transfer#429(__this: address_t, __msg_sender: address_t, __msg_value: int, from#423: address_t, to#425: address_t, value#427: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_9.sol", 140, 3} {:message "[event] TokenERC20::Approval"} Approval#441(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#435: address_t, spender#437: address_t, value#439: int)
{
	
}

// 
// Event: Mint
procedure {:inline 1} {:sourceloc "buggy_9.sol", 144, 3} {:message "[event] TokenERC20::Mint"} Mint#451(__this: address_t, __msg_sender: address_t, __msg_value: int, to#447: address_t, amount#449: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_9.sol", 80, 3} {:message "TokenERC20::bug_tmstmp25"} bug_tmstmp25#180(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#172: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#172 := (__block_timestamp >= 1546300800);
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_9.sol", 83, 3} {:message "name"} name#182: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_9.sol", 84, 3} {:message "winner_tmstmp19"} winner_tmstmp19#184: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 85, 1} {:message "TokenERC20::play_tmstmp19"} play_tmstmp19#210(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#186: int)
{
	var {:sourceloc "buggy_9.sol", 86, 2} {:message "_vtime"} _vtime#190: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#190 := __block_timestamp;
	if (((startTime#186 + 432000) == _vtime#190)) {
	winner_tmstmp19#184 := winner_tmstmp19#184[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_9.sol", 89, 3} {:message "symbol"} symbol#212: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_9.sol", 90, 3} {:message "winner_tmstmp26"} winner_tmstmp26#214: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 91, 1} {:message "TokenERC20::play_tmstmp26"} play_tmstmp26#236(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#216: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#216 + 432000) == __block_timestamp)) {
	winner_tmstmp26#214 := winner_tmstmp26#214[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_9.sol", 94, 3} {:message "decimals"} decimals#238: [address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_9.sol", 96, 3} {:message "TokenERC20::bug_tmstmp20"} bug_tmstmp20#285(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 97, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#242: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#242 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#242);
	pastBlockTime_tmstmp20#242 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_9.sol", 102, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return10:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_9.sol", 105, 3} {:message "_totalSupply"} _totalSupply#287: [address_t]int;
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_9.sol", 106, 3} {:message "TokenERC20::bug_tmstmp32"} bug_tmstmp32#334(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 107, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#291: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#291 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#291);
	pastBlockTime_tmstmp32#291 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_9.sol", 112, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// State variable: cap: uint256
var {:sourceloc "buggy_9.sol", 115, 3} {:message "cap"} cap#336: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_9.sol", 118, 3} {:message "winner_tmstmp38"} winner_tmstmp38#338: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 119, 1} {:message "TokenERC20::play_tmstmp38"} play_tmstmp38#360(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#340: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#340 + 432000) == __block_timestamp)) {
	winner_tmstmp38#338 := winner_tmstmp38#338[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_9.sol", 122, 3} {:message "_balances"} _balances#364: [address_t][address_t]int;
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_9.sol", 123, 3} {:message "TokenERC20::bug_tmstmp4"} bug_tmstmp4#411(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 124, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#368: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#368 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#368);
	pastBlockTime_tmstmp4#368 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_9.sol", 129, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return13:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_9.sol", 132, 3} {:message "_allowed"} _allowed#417: [address_t][address_t][address_t]int;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_9.sol", 135, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#421: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_9.sol", 139, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#433: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_9.sol", 143, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#445: [address_t]int;
// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_9.sol", 153, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#472: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 160, 5} {:message "TokenERC20::[constructor]"} __constructor#1179(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#475: int, _initialSupply#477: int, _name#479: int_arr_ptr, _symbol#481: int_arr_ptr, _decimals#483: int)
{
	var call_arg#1: address_t;
	// TCC assumptions
	assume (_name#479 < __alloc_counter);
	assume (_symbol#481 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#182 := name#182[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp19#184 := winner_tmstmp19#184[__this := 0];
	symbol#212 := symbol#212[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp26#214 := winner_tmstmp26#214[__this := 0];
	decimals#238 := decimals#238[__this := 0];
	_totalSupply#287 := _totalSupply#287[__this := 0];
	cap#336 := cap#336[__this := 0];
	winner_tmstmp38#338 := winner_tmstmp38#338[__this := 0];
	_balances#364 := _balances#364[__this := default_address_t_int()];
	_allowed#417 := _allowed#417[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp2#421 := bugv_tmstmp2#421[__this := __block_timestamp];
	bugv_tmstmp3#433 := bugv_tmstmp3#433[__this := __block_timestamp];
	bugv_tmstmp4#445 := bugv_tmstmp4#445[__this := __block_timestamp];
	bugv_tmstmp1#472 := bugv_tmstmp1#472[__this := __block_timestamp];
	winner_tmstmp23#530 := winner_tmstmp23#530[__this := 0];
	winner_tmstmp14#567 := winner_tmstmp14#567[__this := 0];
	winner_tmstmp30#604 := winner_tmstmp30#604[__this := 0];
	winner_tmstmp39#712 := winner_tmstmp39#712[__this := 0];
	winner_tmstmp35#843 := winner_tmstmp35#843[__this := 0];
	winner_tmstmp27#1079 := winner_tmstmp27#1079[__this := 0];
	winner_tmstmp31#1152 := winner_tmstmp31#1152[__this := 0];
	owner#111 := owner#111[__this := 0];
	winner_tmstmp7#122 := winner_tmstmp7#122[__this := 0];
	bugv_tmstmp5#163 := bugv_tmstmp5#163[__this := __block_timestamp];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#111 := owner#111[__this := __msg_sender];
	$return14:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Function body starts here
	assume (_cap#475 >= _initialSupply#477);
	cap#336 := cap#336[__this := _cap#475];
	name#182 := name#182[__this := mem_arr_int[_name#479]];
	symbol#212 := symbol#212[__this := mem_arr_int[_symbol#481]];
	decimals#238 := decimals#238[__this := _decimals#483];
	_totalSupply#287 := _totalSupply#287[__this := _initialSupply#477];
	_balances#364 := _balances#364[__this := _balances#364[__this][owner#111[__this] := _totalSupply#287[__this]]];
	call_arg#1 := 0;
	assume {:sourceloc "buggy_9.sol", 176, 14} {:message ""} true;
	call Transfer#429(__this, __msg_sender, __msg_value, call_arg#1, owner#111[__this], _totalSupply#287[__this]);
	$return15:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_9.sol", 178, 1} {:message "winner_tmstmp23"} winner_tmstmp23#530: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 179, 1} {:message "TokenERC20::play_tmstmp23"} play_tmstmp23#556(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#532: int)
{
	var {:sourceloc "buggy_9.sol", 180, 2} {:message "_vtime"} _vtime#536: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#536 := __block_timestamp;
	if (((startTime#532 + 432000) == _vtime#536)) {
	winner_tmstmp23#530 := winner_tmstmp23#530[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 187, 5} {:message "TokenERC20::totalSupply"} totalSupply#565(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#560: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#560 := _totalSupply#287[__this];
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_9.sol", 190, 1} {:message "winner_tmstmp14"} winner_tmstmp14#567: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 191, 1} {:message "TokenERC20::play_tmstmp14"} play_tmstmp14#589(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#569: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#569 + 432000) == __block_timestamp)) {
	winner_tmstmp14#567 := winner_tmstmp14#567[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 200, 5} {:message "TokenERC20::balanceOf"} balanceOf#602(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#592: address_t)
	returns (#595: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#595 := _balances#364[__this][_owner#592];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_9.sol", 203, 1} {:message "winner_tmstmp30"} winner_tmstmp30#604: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 204, 1} {:message "TokenERC20::play_tmstmp30"} play_tmstmp30#626(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#606: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#606 + 432000) == __block_timestamp)) {
	winner_tmstmp30#604 := winner_tmstmp30#604[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_9.sol", 214, 5} {:message "TokenERC20::allowance"} allowance#643(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#629: address_t, _spender#631: address_t)
	returns (#634: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#634 := _allowed#417[__this][_owner#629][_spender#631];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_9.sol", 217, 1} {:message "TokenERC20::bug_tmstmp8"} bug_tmstmp8#690(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 218, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#647: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#647 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#647);
	pastBlockTime_tmstmp8#647 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_9.sol", 223, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return22:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 232, 5} {:message "TokenERC20::transfer"} transfer#710(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#693: address_t, _value#695: int)
	returns (#698: bool)
{
	var call_arg#2: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#2 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 233, 9} {:message ""} true;
	call _transfer#918(__this, __msg_sender, __msg_value, call_arg#2, _to#693, _value#695);
	#698 := true;
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_9.sol", 236, 1} {:message "winner_tmstmp39"} winner_tmstmp39#712: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 237, 1} {:message "TokenERC20::play_tmstmp39"} play_tmstmp39#738(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#714: int)
{
	var {:sourceloc "buggy_9.sol", 238, 2} {:message "_vtime"} _vtime#718: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#718 := __block_timestamp;
	if (((startTime#714 + 432000) == _vtime#718)) {
	winner_tmstmp39#712 := winner_tmstmp39#712[__this := __msg_sender];
	}

	$return24:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 251, 5} {:message "TokenERC20::approve"} approve#758(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#741: address_t, _value#743: int)
	returns (#746: bool)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#3 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 252, 9} {:message ""} true;
	call _approve#1010(__this, __msg_sender, __msg_value, call_arg#3, _spender#741, _value#743);
	#746 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_9.sol", 255, 1} {:message "TokenERC20::bug_tmstmp36"} bug_tmstmp36#805(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 256, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#762: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#762 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#762);
	pastBlockTime_tmstmp36#762 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_9.sol", 261, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return26:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 273, 5} {:message "TokenERC20::transferFrom"} transferFrom#841(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#808: address_t, _to#810: address_t, _value#812: int)
	returns (#815: bool)
{
	var call_arg#4: address_t;
	var sub#72_ret#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 274, 9} {:message ""} true;
	call _transfer#918(__this, __msg_sender, __msg_value, _from#808, _to#810, _value#812);
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_9.sol", 275, 37} {:message ""} true;
	call sub#72_ret#5 := sub#72(__this, __msg_sender, __msg_value, _allowed#417[__this][_from#808][__msg_sender], _value#812);
	assume {:sourceloc "buggy_9.sol", 275, 9} {:message ""} true;
	call _approve#1010(__this, __msg_sender, __msg_value, _from#808, call_arg#4, sub#72_ret#5);
	#815 := true;
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_9.sol", 278, 1} {:message "winner_tmstmp35"} winner_tmstmp35#843: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 279, 1} {:message "TokenERC20::play_tmstmp35"} play_tmstmp35#869(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#845: int)
{
	var {:sourceloc "buggy_9.sol", 280, 2} {:message "_vtime"} _vtime#849: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#849 := __block_timestamp;
	if (((startTime#845 + 432000) == _vtime#849)) {
	winner_tmstmp35#843 := winner_tmstmp35#843[__this := __msg_sender];
	}

	$return28:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 290, 5} {:message "TokenERC20::_transfer"} _transfer#918(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#872: address_t, _to#874: address_t, _value#876: int)
{
	var call_arg#6: int_arr_ptr;
	var new_array#7: int_arr_ptr;
	var sub#72_ret#8: int;
	var add#97_ret#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#7 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#6 := new_array#7;
	mem_arr_int := mem_arr_int[call_arg#6 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 116][8 := 114][9 := 97][10 := 110][11 := 115][12 := 102][13 := 101][14 := 114][15 := 32][16 := 116][17 := 111][18 := 32][19 := 116][20 := 104][21 := 101][22 := 32][23 := 122][24 := 101][25 := 114][26 := 111][27 := 32][28 := 97][29 := 100][30 := 100][31 := 114][32 := 101][33 := 115][34 := 115], 35)];
	assume (_to#874 != 0);
	assume {:sourceloc "buggy_9.sol", 293, 28} {:message ""} true;
	call sub#72_ret#8 := sub#72(__this, __msg_sender, __msg_value, _balances#364[__this][_from#872], _value#876);
	_balances#364 := _balances#364[__this := _balances#364[__this][_from#872 := sub#72_ret#8]];
	assume {:sourceloc "buggy_9.sol", 294, 26} {:message ""} true;
	call add#97_ret#9 := add#97(__this, __msg_sender, __msg_value, _balances#364[__this][_to#874], _value#876);
	_balances#364 := _balances#364[__this := _balances#364[__this][_to#874 := add#97_ret#9]];
	assume {:sourceloc "buggy_9.sol", 295, 14} {:message ""} true;
	call Transfer#429(__this, __msg_sender, __msg_value, _from#872, _to#874, _value#876);
	$return29:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_9.sol", 297, 1} {:message "TokenERC20::bug_tmstmp40"} bug_tmstmp40#965(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_9.sol", 298, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#922: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#922 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#922);
	pastBlockTime_tmstmp40#922 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_9.sol", 303, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return30:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_9.sol", 313, 5} {:message "TokenERC20::_approve"} _approve#1010(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#968: address_t, _spender#970: address_t, _value#972: int)
{
	var call_arg#10: int_arr_ptr;
	var new_array#11: int_arr_ptr;
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#10 := new_array#11;
	mem_arr_int := mem_arr_int[call_arg#10 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 102][16 := 114][17 := 111][18 := 109][19 := 32][20 := 116][21 := 104][22 := 101][23 := 32][24 := 122][25 := 101][26 := 114][27 := 111][28 := 32][29 := 97][30 := 100][31 := 100][32 := 114][33 := 101][34 := 115][35 := 115], 36)];
	assume (_owner#968 != 0);
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 69][1 := 82][2 := 67][3 := 50][4 := 48][5 := 58][6 := 32][7 := 97][8 := 112][9 := 112][10 := 114][11 := 111][12 := 118][13 := 101][14 := 32][15 := 116][16 := 111][17 := 32][18 := 116][19 := 104][20 := 101][21 := 32][22 := 122][23 := 101][24 := 114][25 := 111][26 := 32][27 := 97][28 := 100][29 := 100][30 := 114][31 := 101][32 := 115][33 := 115], 34)];
	assume (_spender#970 != 0);
	_allowed#417 := _allowed#417[__this := _allowed#417[__this][_owner#968 := _allowed#417[__this][_owner#968][_spender#970 := _value#972]]];
	assume {:sourceloc "buggy_9.sol", 318, 14} {:message ""} true;
	call Approval#441(__this, __msg_sender, __msg_value, _owner#968, _spender#970, _value#972);
	$return31:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_9.sol", 320, 1} {:message "TokenERC20::bug_tmstmp33"} bug_tmstmp33#1021(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1013: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1013 := (__block_timestamp >= 1546300800);
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// Function: mint : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_9.sol", 330, 5} {:message "TokenERC20::mint"} mint#1077(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1024: address_t, _amount#1026: int)
	returns (#1031: bool)
{
	var add#97_ret#16: int;
	var add#97_ret#17: int;
	var add#97_ret#18: int;
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#111[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_9.sol", 331, 17} {:message ""} true;
	call add#97_ret#16 := add#97(__this, __msg_sender, __msg_value, _totalSupply#287[__this], _amount#1026);
	assume (add#97_ret#16 <= cap#336[__this]);
	assume {:sourceloc "buggy_9.sol", 333, 24} {:message ""} true;
	call add#97_ret#17 := add#97(__this, __msg_sender, __msg_value, _totalSupply#287[__this], _amount#1026);
	_totalSupply#287 := _totalSupply#287[__this := add#97_ret#17];
	assume {:sourceloc "buggy_9.sol", 334, 26} {:message ""} true;
	call add#97_ret#18 := add#97(__this, __msg_sender, __msg_value, _balances#364[__this][_to#1024], _amount#1026);
	_balances#364 := _balances#364[__this := _balances#364[__this][_to#1024 := add#97_ret#18]];
	assume {:sourceloc "buggy_9.sol", 335, 14} {:message ""} true;
	call Mint#451(__this, __msg_sender, __msg_value, _to#1024, _amount#1026);
	call_arg#19 := 0;
	assume {:sourceloc "buggy_9.sol", 336, 14} {:message ""} true;
	call Transfer#429(__this, __msg_sender, __msg_value, call_arg#19, _to#1024, _amount#1026);
	#1031 := true;
	goto $return34;
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_9.sol", 339, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1079: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 340, 1} {:message "TokenERC20::play_tmstmp27"} play_tmstmp27#1105(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1081: int)
{
	var {:sourceloc "buggy_9.sol", 341, 2} {:message "_vtime"} _vtime#1085: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1085 := __block_timestamp;
	if (((startTime#1081 + 432000) == _vtime#1085)) {
	winner_tmstmp27#1079 := winner_tmstmp27#1079[__this := __msg_sender];
	}

	$return35:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: transferBatch : function (address[] memory,uint256[] memory) returns (bool)
procedure {:sourceloc "buggy_9.sol", 350, 5} {:message "TokenERC20::transferBatch"} transferBatch#1150(__this: address_t, __msg_sender: address_t, __msg_value: int, _tos#1109: address_t_arr_ptr, _values#1112: int_arr_ptr)
	returns (#1115: bool)
{
	var {:sourceloc "buggy_9.sol", 353, 14} {:message "i"} i#1126: int;
	var transfer#710_ret#22: bool;
	var tmp#23: int;
	// TCC assumptions
	assume (_tos#1109 < __alloc_counter);
	assume (_values#1112 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#1109])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#1109]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_values#1112])) && (length#int_arr#constr(mem_arr_int[_values#1112]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_tos#1109]) == length#int_arr#constr(mem_arr_int[_values#1112]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#1126 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#1109])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#1109]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1126 < length#address_t_arr#constr(mem_arr_address_t[_tos#1109]))) {
	// Body
	assume {:sourceloc "buggy_9.sol", 354, 13} {:message ""} true;
	call transfer#710_ret#22 := transfer#710(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_tos#1109])[i#1126], arr#int_arr#constr(mem_arr_int[_values#1112])[i#1126]);
	$continue20:
	// Loop expression
	tmp#23 := i#1126;
	i#1126 := (i#1126 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_tos#1109])) && (length#address_t_arr#constr(mem_arr_address_t[_tos#1109]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break21:
	#1115 := true;
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_9.sol", 358, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1152: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_9.sol", 359, 1} {:message "TokenERC20::play_tmstmp31"} play_tmstmp31#1178(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1154: int)
{
	var {:sourceloc "buggy_9.sol", 360, 2} {:message "_vtime"} _vtime#1158: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1158 := __block_timestamp;
	if (((startTime#1154 + 432000) == _vtime#1158)) {
	winner_tmstmp31#1152 := winner_tmstmp31#1152[__this := __msg_sender];
	}

	$return37:
	// Function body ends here
}

// 
// ------- Contract: XLToken -------
// Inherits from: TokenERC20
// 
// Function: 
procedure {:sourceloc "buggy_9.sol", 371, 5} {:message "XLToken::[constructor]"} __constructor#1214(__this: address_t, __msg_sender: address_t, __msg_value: int, _cap#1183: int, _initialSupply#1185: int, _name#1187: int_arr_ptr, _symbol#1189: int_arr_ptr, _decimals#1191: int)
{
	var _cap#475#24: int;
	var _initialSupply#477#24: int;
	var _name#479#24: int_arr_ptr;
	var _symbol#481#24: int_arr_ptr;
	var _decimals#483#24: int;
	var call_arg#26: address_t;
	// TCC assumptions
	assume (_name#1187 < __alloc_counter);
	assume (_symbol#1189 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#182 := name#182[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp19#184 := winner_tmstmp19#184[__this := 0];
	symbol#212 := symbol#212[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp26#214 := winner_tmstmp26#214[__this := 0];
	decimals#238 := decimals#238[__this := 0];
	_totalSupply#287 := _totalSupply#287[__this := 0];
	cap#336 := cap#336[__this := 0];
	winner_tmstmp38#338 := winner_tmstmp38#338[__this := 0];
	_balances#364 := _balances#364[__this := default_address_t_int()];
	_allowed#417 := _allowed#417[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp2#421 := bugv_tmstmp2#421[__this := __block_timestamp];
	bugv_tmstmp3#433 := bugv_tmstmp3#433[__this := __block_timestamp];
	bugv_tmstmp4#445 := bugv_tmstmp4#445[__this := __block_timestamp];
	bugv_tmstmp1#472 := bugv_tmstmp1#472[__this := __block_timestamp];
	winner_tmstmp23#530 := winner_tmstmp23#530[__this := 0];
	winner_tmstmp14#567 := winner_tmstmp14#567[__this := 0];
	winner_tmstmp30#604 := winner_tmstmp30#604[__this := 0];
	winner_tmstmp39#712 := winner_tmstmp39#712[__this := 0];
	winner_tmstmp35#843 := winner_tmstmp35#843[__this := 0];
	winner_tmstmp27#1079 := winner_tmstmp27#1079[__this := 0];
	winner_tmstmp31#1152 := winner_tmstmp31#1152[__this := 0];
	owner#111 := owner#111[__this := 0];
	winner_tmstmp7#122 := winner_tmstmp7#122[__this := 0];
	bugv_tmstmp5#163 := bugv_tmstmp5#163[__this := __block_timestamp];
	// Arguments for TokenERC20
	_cap#475#24 := _cap#1183;
	_initialSupply#477#24 := _initialSupply#1185;
	_name#479#24 := _name#1187;
	_symbol#481#24 := _symbol#1189;
	_decimals#483#24 := _decimals#1191;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#111 := owner#111[__this := __msg_sender];
	$return38:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	assume (_cap#475#24 >= _initialSupply#477#24);
	cap#336 := cap#336[__this := _cap#475#24];
	name#182 := name#182[__this := mem_arr_int[_name#479#24]];
	symbol#212 := symbol#212[__this := mem_arr_int[_symbol#481#24]];
	decimals#238 := decimals#238[__this := _decimals#483#24];
	_totalSupply#287 := _totalSupply#287[__this := _initialSupply#477#24];
	_balances#364 := _balances#364[__this := _balances#364[__this][owner#111[__this] := _totalSupply#287[__this]]];
	call_arg#26 := 0;
	assume {:sourceloc "buggy_9.sol", 176, 14} {:message ""} true;
	call Transfer#429(__this, __msg_sender, __msg_value, call_arg#26, owner#111[__this], _totalSupply#287[__this]);
	$return39:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return40:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_9.sol", 372, 1} {:message "XLToken::bug_tmstmp13"} bug_tmstmp13#1213(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1205: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1205 := (__block_timestamp >= 1546300800);
	goto $return41;
	$return41:
	// Function body ends here
}

