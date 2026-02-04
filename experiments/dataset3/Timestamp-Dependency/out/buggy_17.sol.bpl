// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_17.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 9, 3} {:message "SafeMath::mul"} mul#34(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_17.sol", 13, 5} {:message "c"} c#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#3 == 0)) {
	#8 := 0;
	goto $return0;
	}

	c#18 := (a#3 * b#5);
	assume ((c#18 div a#3) == b#5);
	#8 := c#18;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 17, 3} {:message "SafeMath::div"} div#58(__this: address_t, __msg_sender: address_t, __msg_value: int, a#36: int, b#38: int)
	returns (#41: int)
{
	var {:sourceloc "buggy_17.sol", 19, 5} {:message "c"} c#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#38 > 0);
	c#50 := (a#36 div b#38);
	#41 := c#50;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 22, 3} {:message "SafeMath::sub"} sub#82(__this: address_t, __msg_sender: address_t, __msg_value: int, a#60: int, b#62: int)
	returns (#65: int)
{
	var {:sourceloc "buggy_17.sol", 24, 5} {:message "c"} c#74: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#62 <= a#60);
	c#74 := (a#60 - b#62);
	#65 := c#74;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 27, 3} {:message "SafeMath::add"} add#110(__this: address_t, __msg_sender: address_t, __msg_value: int, a#84: int, b#86: int)
	returns (#89: int)
{
	var {:sourceloc "buggy_17.sol", 28, 5} {:message "c"} c#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#92 := (a#84 + b#86);
	assume ((c#92 >= a#84) && (c#92 >= b#86));
	#89 := c#92;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 32, 3} {:message "SafeMath::mod"} mod#130(__this: address_t, __msg_sender: address_t, __msg_value: int, a#112: int, b#114: int)
	returns (#117: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#114 != 0);
	#117 := (a#112 mod b#114);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Function: max256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 36, 3} {:message "SafeMath::max256"} max256#147(__this: address_t, __msg_sender: address_t, __msg_value: int, a#132: int, b#134: int)
	returns (#137: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#137 := (if (a#132 >= b#134) then a#132 else b#134);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: min256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 39, 3} {:message "SafeMath::min256"} min256#164(__this: address_t, __msg_sender: address_t, __msg_value: int, a#149: int, b#151: int)
	returns (#154: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#154 := (if (a#149 < b#151) then a#149 else b#151);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 8, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#165(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: owned -------
// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_17.sol", 49, 1} {:message "owned::bug_tmstmp1"} bug_tmstmp1#176(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#168: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#168 := (__block_timestamp >= 1546300800);
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_17.sol", 52, 3} {:message "owner"} owner#178: [address_t]address_t;
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 54, 3} {:message "owned::[constructor]"} __constructor#271(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#178 := owner#178[__this := 0];
	winner_tmstmp7#189 := winner_tmstmp7#189[__this := 0];
	bugv_tmstmp1#230 := bugv_tmstmp1#230[__this := __block_timestamp];
	winner_tmstmp23#244 := winner_tmstmp23#244[__this := 0];
	// Function body starts here
	owner#178 := owner#178[__this := __msg_sender];
	$return8:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_17.sol", 57, 1} {:message "winner_tmstmp7"} winner_tmstmp7#189: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 58, 1} {:message "owned::play_tmstmp7"} play_tmstmp7#215(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#191: int)
{
	var {:sourceloc "buggy_17.sol", 59, 2} {:message "_vtime"} _vtime#195: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#195 := __block_timestamp;
	if (((startTime#191 + 432000) == _vtime#195)) {
	winner_tmstmp7#189 := winner_tmstmp7#189[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_17.sol", 67, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#230: [address_t]int;
// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_17.sol", 69, 3} {:message "owned::transferOwnership"} transferOwnership#242(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#232: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#178[__this]);
	// Function body starts here
	owner#178 := owner#178[__this := newOwner#232];
	$return11:
	// Function body ends here
	$return10:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_17.sol", 72, 1} {:message "winner_tmstmp23"} winner_tmstmp23#244: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 73, 1} {:message "owned::play_tmstmp23"} play_tmstmp23#270(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#246: int)
{
	var {:sourceloc "buggy_17.sol", 74, 2} {:message "_vtime"} _vtime#250: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#250 := __block_timestamp;
	if (((startTime#246 + 432000) == _vtime#250)) {
	winner_tmstmp23#244 := winner_tmstmp23#244[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_17.sol", 80, 3} {:message "tokenRecipient::receiveApproval"} receiveApproval#282(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#273: address_t, _value#275: int, _token#277: address_t, _extraData#279: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 79, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#283(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_17.sol", 116, 3} {:message "[event] TokenERC20::Transfer"} Transfer#412(__this: address_t, __msg_sender: address_t, __msg_value: int, from#406: address_t, to#408: address_t, value#410: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_17.sol", 119, 3} {:message "[event] TokenERC20::Approval"} Approval#424(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#418: address_t, _spender#420: address_t, _value#422: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_17.sol", 122, 3} {:message "[event] TokenERC20::Burn"} Burn#434(__this: address_t, __msg_sender: address_t, __msg_value: int, from#430: address_t, value#432: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_17.sol", 86, 1} {:message "winner_tmstmp2"} winner_tmstmp2#288: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 87, 1} {:message "TokenERC20::play_tmstmp2"} play_tmstmp2#310(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#290: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#290 + 432000) == __block_timestamp)) {
	winner_tmstmp2#288 := winner_tmstmp2#288[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_17.sol", 90, 3} {:message "name"} name#312: [address_t]int_arr_type;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_17.sol", 91, 1} {:message "TokenERC20::bug_tmstmp17"} bug_tmstmp17#323(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#315: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#315 := (__block_timestamp >= 1546300800);
	goto $return14;
	$return14:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_17.sol", 94, 3} {:message "symbol"} symbol#325: [address_t]int_arr_type;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_17.sol", 95, 1} {:message "TokenERC20::bug_tmstmp37"} bug_tmstmp37#336(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#328: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#328 := (__block_timestamp >= 1546300800);
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_17.sol", 98, 3} {:message "decimals"} decimals#338: [address_t]int;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_17.sol", 99, 1} {:message "winner_tmstmp3"} winner_tmstmp3#340: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 100, 1} {:message "TokenERC20::play_tmstmp3"} play_tmstmp3#366(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#342: int)
{
	var {:sourceloc "buggy_17.sol", 101, 2} {:message "_vtime"} _vtime#346: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#346 := __block_timestamp;
	if (((startTime#342 + 432000) == _vtime#346)) {
	winner_tmstmp3#340 := winner_tmstmp3#340[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_17.sol", 104, 3} {:message "totalSupply"} totalSupply#368: [address_t]int;
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_17.sol", 106, 1} {:message "TokenERC20::bug_tmstmp9"} bug_tmstmp9#379(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#371: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#371 := (__block_timestamp >= 1546300800);
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 109, 3} {:message "balanceOf"} balanceOf#383: [address_t][address_t]int;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_17.sol", 110, 1} {:message "TokenERC20::bug_tmstmp25"} bug_tmstmp25#394(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#386: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#386 := (__block_timestamp >= 1546300800);
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_17.sol", 113, 3} {:message "allowance"} allowance#400: [address_t][address_t][address_t]int;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_17.sol", 115, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#404: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_17.sol", 118, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#416: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_17.sol", 121, 1} {:message "bugv_tmstmp4"} bugv_tmstmp4#428: [address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 125, 3} {:message "TokenERC20::[constructor]"} __constructor#825(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenName#436: int_arr_ptr, tokenSymbol#438: int_arr_ptr, dec#440: int)
{
	// TCC assumptions
	assume (tokenName#436 < __alloc_counter);
	assume (tokenSymbol#438 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp2#288 := winner_tmstmp2#288[__this := 0];
	name#312 := name#312[__this := int_arr#constr(default_int_int(), 0)];
	symbol#325 := symbol#325[__this := int_arr#constr(default_int_int(), 0)];
	decimals#338 := decimals#338[__this := 0];
	winner_tmstmp3#340 := winner_tmstmp3#340[__this := 0];
	totalSupply#368 := totalSupply#368[__this := 0];
	balanceOf#383 := balanceOf#383[__this := default_address_t_int()];
	allowance#400 := allowance#400[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp2#404 := bugv_tmstmp2#404[__this := __block_timestamp];
	bugv_tmstmp3#416 := bugv_tmstmp3#416[__this := __block_timestamp];
	bugv_tmstmp4#428 := bugv_tmstmp4#428[__this := __block_timestamp];
	winner_tmstmp14#458 := winner_tmstmp14#458[__this := 0];
	winner_tmstmp30#529 := winner_tmstmp30#529[__this := 0];
	winner_tmstmp39#656 := winner_tmstmp39#656[__this := 0];
	winner_tmstmp35#798 := winner_tmstmp35#798[__this := 0];
	// Function body starts here
	decimals#338 := decimals#338[__this := dec#440];
	name#312 := name#312[__this := mem_arr_int[tokenName#436]];
	symbol#325 := symbol#325[__this := mem_arr_int[tokenSymbol#438]];
	$return19:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_17.sol", 130, 1} {:message "winner_tmstmp14"} winner_tmstmp14#458: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 131, 1} {:message "TokenERC20::play_tmstmp14"} play_tmstmp14#480(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#460: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#460 + 432000) == __block_timestamp)) {
	winner_tmstmp14#458 := winner_tmstmp14#458[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 135, 3} {:message "TokenERC20::_transfer"} _transfer#527(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#482: address_t, _to#484: address_t, _value#486: int)
{
	var sub#82_ret#2: int;
	var add#110_ret#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#484 != 0);
	assume {:sourceloc "buggy_17.sol", 137, 24} {:message ""} true;
	call sub#82_ret#2 := sub#82(__this, __msg_sender, __msg_value, balanceOf#383[__this][_from#482], _value#486);
	balanceOf#383 := balanceOf#383[__this := balanceOf#383[__this][_from#482 := sub#82_ret#2]];
	assume {:sourceloc "buggy_17.sol", 138, 22} {:message ""} true;
	call add#110_ret#3 := add#110(__this, __msg_sender, __msg_value, balanceOf#383[__this][_to#484], _value#486);
	balanceOf#383 := balanceOf#383[__this := balanceOf#383[__this][_to#484 := add#110_ret#3]];
	assume {:sourceloc "buggy_17.sol", 139, 10} {:message ""} true;
	call Transfer#412(__this, __msg_sender, __msg_value, _from#482, _to#484, _value#486);
	$return21:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_17.sol", 141, 1} {:message "winner_tmstmp30"} winner_tmstmp30#529: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 142, 1} {:message "TokenERC20::play_tmstmp30"} play_tmstmp30#551(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#531: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#531 + 432000) == __block_timestamp)) {
	winner_tmstmp30#529 := winner_tmstmp30#529[__this := __msg_sender];
	}

	$return22:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 146, 3} {:message "TokenERC20::transfer"} transfer#570(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#553: address_t, _value#555: int)
	returns (success#558: bool)
{
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 147, 5} {:message ""} true;
	call _transfer#527(__this, __msg_sender, __msg_value, call_arg#4, _to#553, _value#555);
	success#558 := true;
	goto $return23;
	$return23:
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
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_17.sol", 150, 1} {:message "TokenERC20::bug_tmstmp8"} bug_tmstmp8#617(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 151, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#574: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#574 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#574);
	pastBlockTime_tmstmp8#574 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_17.sol", 156, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return24:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 161, 3} {:message "TokenERC20::transferFrom"} transferFrom#654(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#619: address_t, _to#621: address_t, _value#623: int)
	returns (success#626: bool)
{
	var sub#82_ret#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 162, 36} {:message ""} true;
	call sub#82_ret#5 := sub#82(__this, __msg_sender, __msg_value, allowance#400[__this][_from#619][__msg_sender], _value#623);
	allowance#400 := allowance#400[__this := allowance#400[__this][_from#619 := allowance#400[__this][_from#619][__msg_sender := sub#82_ret#5]]];
	assume {:sourceloc "buggy_17.sol", 163, 3} {:message ""} true;
	call _transfer#527(__this, __msg_sender, __msg_value, _from#619, _to#621, _value#623);
	success#626 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_17.sol", 166, 1} {:message "winner_tmstmp39"} winner_tmstmp39#656: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 167, 1} {:message "TokenERC20::play_tmstmp39"} play_tmstmp39#682(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#658: int)
{
	var {:sourceloc "buggy_17.sol", 168, 2} {:message "_vtime"} _vtime#662: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#662 := __block_timestamp;
	if (((startTime#658 + 432000) == _vtime#662)) {
	winner_tmstmp39#656 := winner_tmstmp39#656[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 173, 3} {:message "TokenERC20::approve"} approve#710(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#684: address_t, _value#686: int)
	returns (success#689: bool)
{
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#400 := allowance#400[__this := allowance#400[__this][__msg_sender := allowance#400[__this][__msg_sender][_spender#684 := _value#686]]];
	call_arg#6 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 175, 10} {:message ""} true;
	call Approval#424(__this, __msg_sender, __msg_value, call_arg#6, _spender#684, _value#686);
	success#689 := true;
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_17.sol", 178, 1} {:message "TokenERC20::bug_tmstmp36"} bug_tmstmp36#757(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 179, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#714: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#714 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#714);
	pastBlockTime_tmstmp36#714 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_17.sol", 184, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return28:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_17.sol", 189, 3} {:message "TokenERC20::approveAndCall"} approveAndCall#796(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#759: address_t, _value#761: int, _extraData#763: int_arr_ptr)
	returns (success#766: bool)
{
	var {:sourceloc "buggy_17.sol", 190, 5} {:message "spender"} spender#769: address_t;
	var approve#710_ret#7: bool;
	var call_arg#8: address_t;
	// TCC assumptions
	assume (_extraData#763 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#769 := _spender#759;
	assume {:sourceloc "buggy_17.sol", 191, 9} {:message ""} true;
	call approve#710_ret#7 := approve#710(__this, __msg_sender, __msg_value, _spender#759, _value#761);
	if (approve#710_ret#7) {
	call_arg#8 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 192, 7} {:message ""} true;
	call receiveApproval#282(spender#769, __this, 0, call_arg#8, _value#761, __this, _extraData#763);
	success#766 := true;
	goto $return29;
	}

	$return29:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_17.sol", 196, 1} {:message "winner_tmstmp35"} winner_tmstmp35#798: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 197, 1} {:message "TokenERC20::play_tmstmp35"} play_tmstmp35#824(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#800: int)
{
	var {:sourceloc "buggy_17.sol", 198, 2} {:message "_vtime"} _vtime#804: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#804 := __block_timestamp;
	if (((startTime#800 + 432000) == _vtime#804)) {
	winner_tmstmp35#798 := winner_tmstmp35#798[__this := __msg_sender];
	}

	$return30:
	// Function body ends here
}

// 
// ------- Contract: AZT -------
// Inherits from: owned
// Inherits from: TokenERC20
// Using library SafeMath for uint256
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_17.sol", 211, 1} {:message "winner_tmstmp19"} winner_tmstmp19#834: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 212, 1} {:message "AZT::play_tmstmp19"} play_tmstmp19#860(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#836: int)
{
	var {:sourceloc "buggy_17.sol", 213, 2} {:message "_vtime"} _vtime#840: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#840 := __block_timestamp;
	if (((startTime#836 + 432000) == _vtime#840)) {
	winner_tmstmp19#834 := winner_tmstmp19#834[__this := __msg_sender];
	}

	$return31:
	// Function body ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_17.sol", 217, 2} {:message "winner_tmstmp26"} winner_tmstmp26#862: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 218, 1} {:message "AZT::play_tmstmp26"} play_tmstmp26#884(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#864: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#864 + 432000) == __block_timestamp)) {
	winner_tmstmp26#862 := winner_tmstmp26#862[__this := __msg_sender];
	}

	$return32:
	// Function body ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_17.sol", 222, 1} {:message "AZT::bug_tmstmp20"} bug_tmstmp20#931(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 223, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#888: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#888 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#888);
	pastBlockTime_tmstmp20#888 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_17.sol", 228, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return33:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_17.sol", 231, 3} {:message "_decimals"} _decimals#934: [address_t]int;
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_17.sol", 233, 1} {:message "AZT::bug_tmstmp32"} bug_tmstmp32#981(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 234, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#938: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#938 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#938);
	pastBlockTime_tmstmp32#938 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_17.sol", 239, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return34:
	// Function body ends here
}

// 
// State variable: frozenAddresses: address[] storage ref
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var {:sourceloc "buggy_17.sol", 242, 3} {:message "frozenAddresses"} frozenAddresses#984: [address_t]address_t_arr_type;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_17.sol", 243, 1} {:message "winner_tmstmp38"} winner_tmstmp38#986: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 244, 1} {:message "AZT::play_tmstmp38"} play_tmstmp38#1008(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#988: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#988 + 432000) == __block_timestamp)) {
	winner_tmstmp38#986 := winner_tmstmp38#986[__this := __msg_sender];
	}

	$return35:
	// Function body ends here
}

// 
// State variable: tokenFrozen: bool
var {:sourceloc "buggy_17.sol", 247, 3} {:message "tokenFrozen"} tokenFrozen#1010: [address_t]bool;
// 
// ------- Struct frozenWallet -------
// Storage
type {:datatype} struct_storage_frozenWallet#1019;
function {:constructor} frozenWallet#1019#constr(isFrozen#1012: bool, rewardedAmount#1014: int, frozenAmount#1016: int, frozenTime#1018: int) returns (struct_storage_frozenWallet#1019);
// Memory
type address_struct_memory_frozenWallet#1019 = int;
// Member isFrozen
var {:sourceloc "buggy_17.sol", 250, 5} {:message "isFrozen"} isFrozen#1012: [address_struct_memory_frozenWallet#1019]bool;
// Member rewardedAmount
var {:sourceloc "buggy_17.sol", 251, 5} {:message "rewardedAmount"} rewardedAmount#1014: [address_struct_memory_frozenWallet#1019]int;
// Member frozenAmount
var {:sourceloc "buggy_17.sol", 252, 5} {:message "frozenAmount"} frozenAmount#1016: [address_struct_memory_frozenWallet#1019]int;
// Member frozenTime
var {:sourceloc "buggy_17.sol", 253, 5} {:message "frozenTime"} frozenTime#1018: [address_struct_memory_frozenWallet#1019]int;
// 
// ------- End of struct frozenWallet -------
// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_17.sol", 256, 1} {:message "AZT::bug_tmstmp4"} bug_tmstmp4#1066(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 257, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#1023: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#1023 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#1023);
	pastBlockTime_tmstmp4#1023 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_17.sol", 262, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return36:
	// Function body ends here
}

// 
// State variable: frozenWallets: mapping(address => struct AZT.frozenWallet storage ref)
var {:sourceloc "buggy_17.sol", 265, 3} {:message "frozenWallets"} frozenWallets#1070: [address_t][address_t]struct_storage_frozenWallet#1019;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
function {:builtin "((as const (Array Int |T@struct_storage_frozenWallet#1019|)) (|frozenWallet#1019#constr| false 0 0 0))"} default_address_t_struct_storage_frozenWallet#1019() returns ([address_t]struct_storage_frozenWallet#1019);
const unique address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 269, 3} {:message "AZT::[constructor]"} __constructor#1481(__this: address_t, __msg_sender: address_t, __msg_value: int, _tokenName#1072: int_arr_ptr, _tokenSymbol#1074: int_arr_ptr)
{
	var tokenName#436#9: int_arr_ptr;
	var tokenSymbol#438#9: int_arr_ptr;
	var dec#440#9: int;
	var call_arg#12: int;
	var call_arg#13: int;
	var new_struct_frozenWallet#14: address_struct_memory_frozenWallet#1019;
	var {:sourceloc "buggy_17.sol", 280, 10} {:message "i"} i#1110#11: int;
	var add#110_ret#17: int;
	var tmp#18: int;
	// TCC assumptions
	assume (_tokenName#1072 < __alloc_counter);
	assume (_tokenSymbol#1074 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp19#834 := winner_tmstmp19#834[__this := 0];
	winner_tmstmp26#862 := winner_tmstmp26#862[__this := 0];
	_decimals#934 := _decimals#934[__this := 18];
	frozenAddresses#984 := frozenAddresses#984[__this := address_t_arr#constr(default_int_address_t(), 0)];
	winner_tmstmp38#986 := winner_tmstmp38#986[__this := 0];
	tokenFrozen#1010 := tokenFrozen#1010[__this := false];
	frozenWallets#1070 := frozenWallets#1070[__this := default_address_t_struct_storage_frozenWallet#1019()];
	winner_tmstmp27#1309 := winner_tmstmp27#1309[__this := 0];
	winner_tmstmp31#1375 := winner_tmstmp31#1375[__this := 0];
	bugv_tmstmp5#1480 := bugv_tmstmp5#1480[__this := __block_timestamp];
	winner_tmstmp2#288 := winner_tmstmp2#288[__this := 0];
	name#312 := name#312[__this := int_arr#constr(default_int_int(), 0)];
	symbol#325 := symbol#325[__this := int_arr#constr(default_int_int(), 0)];
	decimals#338 := decimals#338[__this := 0];
	winner_tmstmp3#340 := winner_tmstmp3#340[__this := 0];
	totalSupply#368 := totalSupply#368[__this := 0];
	balanceOf#383 := balanceOf#383[__this := default_address_t_int()];
	allowance#400 := allowance#400[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp2#404 := bugv_tmstmp2#404[__this := __block_timestamp];
	bugv_tmstmp3#416 := bugv_tmstmp3#416[__this := __block_timestamp];
	bugv_tmstmp4#428 := bugv_tmstmp4#428[__this := __block_timestamp];
	winner_tmstmp14#458 := winner_tmstmp14#458[__this := 0];
	winner_tmstmp30#529 := winner_tmstmp30#529[__this := 0];
	winner_tmstmp39#656 := winner_tmstmp39#656[__this := 0];
	winner_tmstmp35#798 := winner_tmstmp35#798[__this := 0];
	owner#178 := owner#178[__this := 0];
	winner_tmstmp7#189 := winner_tmstmp7#189[__this := 0];
	bugv_tmstmp1#230 := bugv_tmstmp1#230[__this := __block_timestamp];
	winner_tmstmp23#244 := winner_tmstmp23#244[__this := 0];
	// Arguments for TokenERC20
	tokenName#436#9 := _tokenName#1072;
	tokenSymbol#438#9 := _tokenSymbol#1074;
	dec#440#9 := _decimals#934[__this];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#178 := owner#178[__this := __msg_sender];
	$return37:
	// Function body ends here
	// Inlined constructor for owned ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	decimals#338 := decimals#338[__this := dec#440#9];
	name#312 := name#312[__this := mem_arr_int[tokenName#436#9]];
	symbol#325 := symbol#325[__this := mem_arr_int[tokenSymbol#438#9]];
	$return38:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	frozenAddresses#984 := frozenAddresses#984[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#984[__this])[length#address_t_arr#constr(frozenAddresses#984[__this]) := 0], length#address_t_arr#constr(frozenAddresses#984[__this]))];
	frozenAddresses#984 := frozenAddresses#984[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#984[__this])[length#address_t_arr#constr(frozenAddresses#984[__this]) := address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05], length#address_t_arr#constr(frozenAddresses#984[__this]))];
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#984[__this])) && (length#address_t_arr#constr(frozenAddresses#984[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#address_t_arr#constr(frozenAddresses#984[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	frozenAddresses#984 := frozenAddresses#984[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#984[__this]), (length#address_t_arr#constr(frozenAddresses#984[__this]) + 1))];
	call_arg#12 := 30000000;
	call_arg#13 := 0;
	new_struct_frozenWallet#14 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	isFrozen#1012 := isFrozen#1012[new_struct_frozenWallet#14 := true];
	rewardedAmount#1014 := rewardedAmount#1014[new_struct_frozenWallet#14 := call_arg#12];
	frozenAmount#1016 := frozenAmount#1016[new_struct_frozenWallet#14 := call_arg#13];
	frozenTime#1018 := frozenTime#1018[new_struct_frozenWallet#14 := (__block_timestamp + 3600)];
	// Deep copy struct frozenWallet
	frozenWallets#1070 := frozenWallets#1070[__this := frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0] := frozenWallet#1019#constr(isFrozen#1012[new_struct_frozenWallet#14], rewardedAmount#1014#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), frozenAmount#1016#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), frozenTime#1018#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]))]];
	frozenWallets#1070 := frozenWallets#1070[__this := frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0] := frozenWallet#1019#constr(isFrozen#1012#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), rewardedAmount#1014[new_struct_frozenWallet#14], frozenAmount#1016#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), frozenTime#1018#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]))]];
	frozenWallets#1070 := frozenWallets#1070[__this := frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0] := frozenWallet#1019#constr(isFrozen#1012#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), rewardedAmount#1014#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), frozenAmount#1016[new_struct_frozenWallet#14], frozenTime#1018#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]))]];
	frozenWallets#1070 := frozenWallets#1070[__this := frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0] := frozenWallet#1019#constr(isFrozen#1012#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), rewardedAmount#1014#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), frozenAmount#1016#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[0]]), frozenTime#1018[new_struct_frozenWallet#14])]];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1110#11 := 0;
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#984[__this])) && (length#address_t_arr#constr(frozenAddresses#984[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1110#11 < length#address_t_arr#constr(frozenAddresses#984[__this]))) {
	// Body
	balanceOf#383 := balanceOf#383[__this := balanceOf#383[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[i#1110#11] := rewardedAmount#1014#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[i#1110#11]])]];
	assume {:sourceloc "buggy_17.sol", 282, 21} {:message ""} true;
	call add#110_ret#17 := add#110(__this, __msg_sender, __msg_value, totalSupply#368[__this], rewardedAmount#1014#frozenWallet#1019#constr(frozenWallets#1070[__this][arr#address_t_arr#constr(frozenAddresses#984[__this])[i#1110#11]]));
	totalSupply#368 := totalSupply#368[__this := add#110_ret#17];
	$continue15:
	// Loop expression
	tmp#18 := i#1110#11;
	i#1110#11 := (i#1110#11 + 1);
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#984[__this])) && (length#address_t_arr#constr(frozenAddresses#984[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break16:
	$return39:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_17.sol", 285, 1} {:message "AZT::bug_tmstmp40"} bug_tmstmp40#1195(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 286, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1152: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1152 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1152);
	pastBlockTime_tmstmp40#1152 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_17.sol", 291, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return40:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 295, 3} {:message "AZT::_transfer"} _transfer#1250(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1197: address_t, _to#1199: address_t, _value#1201: int)
{
	var checkFrozenWallet#1307_ret#19: bool;
	var sub#82_ret#20: int;
	var add#110_ret#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1199 != 0);
	assume {:sourceloc "buggy_17.sol", 297, 13} {:message ""} true;
	call checkFrozenWallet#1307_ret#19 := checkFrozenWallet#1307(__this, __msg_sender, __msg_value, _from#1197, _value#1201);
	assume checkFrozenWallet#1307_ret#19;
	assume {:sourceloc "buggy_17.sol", 298, 24} {:message ""} true;
	call sub#82_ret#20 := sub#82(__this, __msg_sender, __msg_value, balanceOf#383[__this][_from#1197], _value#1201);
	balanceOf#383 := balanceOf#383[__this := balanceOf#383[__this][_from#1197 := sub#82_ret#20]];
	assume {:sourceloc "buggy_17.sol", 299, 22} {:message ""} true;
	call add#110_ret#21 := add#110(__this, __msg_sender, __msg_value, balanceOf#383[__this][_to#1199], _value#1201);
	balanceOf#383 := balanceOf#383[__this := balanceOf#383[__this][_to#1199 := add#110_ret#21]];
	assume {:sourceloc "buggy_17.sol", 300, 10} {:message ""} true;
	call Transfer#412(__this, __msg_sender, __msg_value, _from#1197, _to#1199, _value#1201);
	$return41:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_17.sol", 302, 1} {:message "AZT::bug_tmstmp33"} bug_tmstmp33#1261(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1253: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1253 := (__block_timestamp >= 1546300800);
	goto $return42;
	$return42:
	// Function body ends here
}

// 
// Function: checkFrozenWallet : function (address,uint256) view returns (bool)
procedure {:sourceloc "buggy_17.sol", 306, 3} {:message "AZT::checkFrozenWallet"} checkFrozenWallet#1307(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1263: address_t, _value#1265: int)
	returns (#1268: bool)
{
	var sub#82_ret#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 312, 8} {:message ""} true;
	call sub#82_ret#22 := sub#82(__this, __msg_sender, __msg_value, balanceOf#383[__this][_from#1263], _value#1265);
	#1268 := ((_from#1263 == owner#178[__this]) || (!(tokenFrozen#1010[__this]) && ((!(isFrozen#1012#frozenWallet#1019#constr(frozenWallets#1070[__this][_from#1263])) || (__block_timestamp >= frozenTime#1018#frozenWallet#1019#constr(frozenWallets#1070[__this][_from#1263]))) || (sub#82_ret#22 >= frozenAmount#1016#frozenWallet#1019#constr(frozenWallets#1070[__this][_from#1263])))));
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_17.sol", 315, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1309: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 316, 1} {:message "AZT::play_tmstmp27"} play_tmstmp27#1335(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1311: int)
{
	var {:sourceloc "buggy_17.sol", 317, 2} {:message "_vtime"} _vtime#1315: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1315 := __block_timestamp;
	if (((startTime#1311 + 432000) == _vtime#1315)) {
	winner_tmstmp27#1309 := winner_tmstmp27#1309[__this := __msg_sender];
	}

	$return44:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 322, 3} {:message "AZT::burn"} burn#1373(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#1337: int)
	returns (success#1342: bool)
{
	var sub#82_ret#25: int;
	var sub#82_ret#26: int;
	var call_arg#27: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#178[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 323, 29} {:message ""} true;
	call sub#82_ret#25 := sub#82(__this, __msg_sender, __msg_value, balanceOf#383[__this][__msg_sender], _value#1337);
	balanceOf#383 := balanceOf#383[__this := balanceOf#383[__this][__msg_sender := sub#82_ret#25]];
	assume {:sourceloc "buggy_17.sol", 324, 19} {:message ""} true;
	call sub#82_ret#26 := sub#82(__this, __msg_sender, __msg_value, totalSupply#368[__this], _value#1337);
	totalSupply#368 := totalSupply#368[__this := sub#82_ret#26];
	call_arg#27 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 325, 10} {:message ""} true;
	call Burn#434(__this, __msg_sender, __msg_value, call_arg#27, _value#1337);
	success#1342 := true;
	goto $return46;
	$return46:
	// Function body ends here
	$return45:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_17.sol", 328, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1375: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 329, 1} {:message "AZT::play_tmstmp31"} play_tmstmp31#1401(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1377: int)
{
	var {:sourceloc "buggy_17.sol", 330, 2} {:message "_vtime"} _vtime#1381: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1381 := __block_timestamp;
	if (((startTime#1377 + 432000) == _vtime#1381)) {
	winner_tmstmp31#1375 := winner_tmstmp31#1375[__this := __msg_sender];
	}

	$return47:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 334, 3} {:message "AZT::burnFrom"} burnFrom#1453(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1403: address_t, _value#1405: int)
	returns (success#1408: bool)
{
	var sub#82_ret#28: int;
	var sub#82_ret#29: int;
	var sub#82_ret#30: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 335, 24} {:message ""} true;
	call sub#82_ret#28 := sub#82(__this, __msg_sender, __msg_value, balanceOf#383[__this][_from#1403], _value#1405);
	balanceOf#383 := balanceOf#383[__this := balanceOf#383[__this][_from#1403 := sub#82_ret#28]];
	assume {:sourceloc "buggy_17.sol", 336, 36} {:message ""} true;
	call sub#82_ret#29 := sub#82(__this, __msg_sender, __msg_value, allowance#400[__this][_from#1403][__msg_sender], _value#1405);
	allowance#400 := allowance#400[__this := allowance#400[__this][_from#1403 := allowance#400[__this][_from#1403][__msg_sender := sub#82_ret#29]]];
	assume {:sourceloc "buggy_17.sol", 337, 19} {:message ""} true;
	call sub#82_ret#30 := sub#82(__this, __msg_sender, __msg_value, totalSupply#368[__this], _value#1405);
	totalSupply#368 := totalSupply#368[__this := sub#82_ret#30];
	assume {:sourceloc "buggy_17.sol", 338, 10} {:message ""} true;
	call Burn#434(__this, __msg_sender, __msg_value, _from#1403, _value#1405);
	success#1408 := true;
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_17.sol", 341, 1} {:message "AZT::bug_tmstmp13"} bug_tmstmp13#1464(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1456: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1456 := (__block_timestamp >= 1546300800);
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// Function: freezeToken : function (bool)
procedure {:sourceloc "buggy_17.sol", 345, 3} {:message "AZT::freezeToken"} freezeToken#1476(__this: address_t, __msg_sender: address_t, __msg_value: int, freeze#1466: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#178[__this]);
	// Function body starts here
	tokenFrozen#1010 := tokenFrozen#1010[__this := freeze#1466];
	$return51:
	// Function body ends here
	$return50:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_17.sol", 348, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1480: [address_t]int;
