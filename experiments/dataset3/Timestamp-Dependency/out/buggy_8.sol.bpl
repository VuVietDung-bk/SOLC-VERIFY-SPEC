// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_8.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_8.sol", 14, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#24(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#20: address_t, newOwner#22: address_t)
{
	
}

// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_8.sol", 8, 1} {:message "Ownable::bug_tmstmp1"} bug_tmstmp1#12(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
// State variable: owner: address
var {:sourceloc "buggy_8.sol", 11, 3} {:message "owner"} owner#14: [address_t]address_t;
// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_8.sol", 13, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#18: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 21, 3} {:message "Ownable::[constructor]"} __constructor#145(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#14 := owner#14[__this := 0];
	bugv_tmstmp5#18 := bugv_tmstmp5#18[__this := __block_timestamp];
	winner_tmstmp38#122 := winner_tmstmp38#122[__this := 0];
	// Function body starts here
	owner#14 := owner#14[__this := __msg_sender];
	$return1:
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
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_8.sol", 24, 1} {:message "Ownable::bug_tmstmp32"} bug_tmstmp32#81(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 25, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#38: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#38 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#38);
	pastBlockTime_tmstmp32#38 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_8.sol", 30, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return2:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_8.sol", 46, 3} {:message "Ownable::transferOwnership"} transferOwnership#120(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#96: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#14[__this]);
	// Function body starts here
	assume (newOwner#96 != 0);
	assume {:sourceloc "buggy_8.sol", 48, 10} {:message ""} true;
	call OwnershipTransferred#24(__this, __msg_sender, __msg_value, owner#14[__this], newOwner#96);
	owner#14 := owner#14[__this := newOwner#96];
	$return4:
	// Function body ends here
	$return3:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_8.sol", 51, 1} {:message "winner_tmstmp38"} winner_tmstmp38#122: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 52, 1} {:message "Ownable::play_tmstmp38"} play_tmstmp38#144(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#124: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#124 + 432000) == __block_timestamp)) {
	winner_tmstmp38#122 := winner_tmstmp38#122[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_8.sol", 93, 3} {:message "[event] TokenERC20::Transfer"} Transfer#272(__this: address_t, __msg_sender: address_t, __msg_value: int, from#266: address_t, to#268: address_t, value#270: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_8.sol", 97, 3} {:message "[event] TokenERC20::Approval"} Approval#284(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#278: address_t, _spender#280: address_t, _value#282: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_8.sol", 101, 3} {:message "[event] TokenERC20::Burn"} Burn#294(__this: address_t, __msg_sender: address_t, __msg_value: int, from#290: address_t, value#292: int)
{
	
}

// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_8.sol", 60, 3} {:message "winner_tmstmp2"} winner_tmstmp2#147: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 61, 1} {:message "TokenERC20::play_tmstmp2"} play_tmstmp2#169(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#149: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#149 + 432000) == __block_timestamp)) {
	winner_tmstmp2#147 := winner_tmstmp2#147[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_8.sol", 64, 3} {:message "name"} name#171: [address_t]int_arr_type;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_8.sol", 65, 3} {:message "TokenERC20::bug_tmstmp17"} bug_tmstmp17#182(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#174: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#174 := (__block_timestamp >= 1546300800);
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_8.sol", 68, 3} {:message "symbol"} symbol#184: [address_t]int_arr_type;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_8.sol", 69, 3} {:message "TokenERC20::bug_tmstmp37"} bug_tmstmp37#195(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#187: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#187 := (__block_timestamp >= 1546300800);
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_8.sol", 72, 3} {:message "decimals"} decimals#198: [address_t]int;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_8.sol", 74, 3} {:message "winner_tmstmp3"} winner_tmstmp3#200: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 75, 1} {:message "TokenERC20::play_tmstmp3"} play_tmstmp3#226(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#202: int)
{
	var {:sourceloc "buggy_8.sol", 76, 2} {:message "_vtime"} _vtime#206: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#206 := __block_timestamp;
	if (((startTime#202 + 432000) == _vtime#206)) {
	winner_tmstmp3#200 := winner_tmstmp3#200[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_8.sol", 79, 3} {:message "totalSupply"} totalSupply#228: [address_t]int;
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_8.sol", 82, 3} {:message "TokenERC20::bug_tmstmp9"} bug_tmstmp9#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#231: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#231 := (__block_timestamp >= 1546300800);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_8.sol", 85, 3} {:message "balanceOf"} balanceOf#243: [address_t][address_t]int;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_8.sol", 86, 3} {:message "TokenERC20::bug_tmstmp25"} bug_tmstmp25#254(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#246: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#246 := (__block_timestamp >= 1546300800);
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_8.sol", 89, 3} {:message "allowance"} allowance#260: [address_t][address_t][address_t]int;
// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_8.sol", 92, 3} {:message "bugv_tmstmp1"} bugv_tmstmp1#264: [address_t]int;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_8.sol", 96, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#276: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_8.sol", 100, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#288: [address_t]int;
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 108, 5} {:message "TokenERC20::[constructor]"} __constructor#816(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#297: int, tokenName#299: int_arr_ptr, tokenSymbol#301: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#299 < __alloc_counter);
	assume (tokenSymbol#301 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp2#147 := winner_tmstmp2#147[__this := 0];
	name#171 := name#171[__this := int_arr#constr(default_int_int(), 0)];
	symbol#184 := symbol#184[__this := int_arr#constr(default_int_int(), 0)];
	decimals#198 := decimals#198[__this := 18];
	winner_tmstmp3#200 := winner_tmstmp3#200[__this := 0];
	totalSupply#228 := totalSupply#228[__this := 0];
	balanceOf#243 := balanceOf#243[__this := default_address_t_int()];
	allowance#260 := allowance#260[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp1#264 := bugv_tmstmp1#264[__this := __block_timestamp];
	bugv_tmstmp2#276 := bugv_tmstmp2#276[__this := __block_timestamp];
	bugv_tmstmp3#288 := bugv_tmstmp3#288[__this := __block_timestamp];
	winner_tmstmp7#455 := winner_tmstmp7#455[__this := 0];
	winner_tmstmp23#503 := winner_tmstmp23#503[__this := 0];
	winner_tmstmp14#572 := winner_tmstmp14#572[__this := 0];
	winner_tmstmp30#625 := winner_tmstmp30#625[__this := 0];
	winner_tmstmp39#789 := winner_tmstmp39#789[__this := 0];
	// Function body starts here
	totalSupply#228 := totalSupply#228[__this := (initialSupply#297 * 1000000000000000000)];
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][__msg_sender := totalSupply#228[__this]]];
	name#171 := name#171[__this := mem_arr_int[tokenName#299]];
	symbol#184 := symbol#184[__this := mem_arr_int[tokenSymbol#301]];
	$return12:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_8.sol", 118, 1} {:message "TokenERC20::bug_tmstmp4"} bug_tmstmp4#373(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 119, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#330: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#330 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#330);
	pastBlockTime_tmstmp4#330 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_8.sol", 124, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return13:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_8.sol", 131, 5} {:message "TokenERC20::_transfer"} _transfer#453(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#376: address_t, _to#378: address_t, _value#380: int)
{
	var {:sourceloc "buggy_8.sol", 139, 9} {:message "previousBalances"} previousBalances#413: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#378 != 0);
	assume (balanceOf#243[__this][_from#376] >= _value#380);
	assume ((balanceOf#243[__this][_to#378] + _value#380) > balanceOf#243[__this][_to#378]);
	previousBalances#413 := (balanceOf#243[__this][_from#376] + balanceOf#243[__this][_to#378]);
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][_from#376 := (balanceOf#243[__this][_from#376] - _value#380)]];
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][_to#378 := (balanceOf#243[__this][_to#378] + _value#380)]];
	assume {:sourceloc "buggy_8.sol", 144, 14} {:message ""} true;
	call Transfer#272(__this, __msg_sender, __msg_value, _from#376, _to#378, _value#380);
	assert {:sourceloc "buggy_8.sol", 146, 9} {:message "Assertion might not hold."} ((balanceOf#243[__this][_from#376] + balanceOf#243[__this][_to#378]) == previousBalances#413);
	$return14:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_8.sol", 148, 1} {:message "winner_tmstmp7"} winner_tmstmp7#455: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 149, 1} {:message "TokenERC20::play_tmstmp7"} play_tmstmp7#481(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#457: int)
{
	var {:sourceloc "buggy_8.sol", 150, 2} {:message "_vtime"} _vtime#461: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#461 := __block_timestamp;
	if (((startTime#457 + 432000) == _vtime#461)) {
	winner_tmstmp7#455 := winner_tmstmp7#455[__this := __msg_sender];
	}

	$return15:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 162, 5} {:message "TokenERC20::transfer"} transfer#501(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#484: address_t, _value#486: int)
	returns (success#489: bool)
{
	var call_arg#2: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#2 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 163, 9} {:message ""} true;
	call _transfer#453(__this, __msg_sender, __msg_value, call_arg#2, _to#484, _value#486);
	success#489 := true;
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_8.sol", 166, 1} {:message "winner_tmstmp23"} winner_tmstmp23#503: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 167, 1} {:message "TokenERC20::play_tmstmp23"} play_tmstmp23#529(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#505: int)
{
	var {:sourceloc "buggy_8.sol", 168, 2} {:message "_vtime"} _vtime#509: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#509 := __block_timestamp;
	if (((startTime#505 + 432000) == _vtime#509)) {
	winner_tmstmp23#503 := winner_tmstmp23#503[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 181, 5} {:message "TokenERC20::transferFrom"} transferFrom#570(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#532: address_t, _to#534: address_t, _value#536: int)
	returns (success#539: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#536 <= allowance#260[__this][_from#532][__msg_sender]);
	allowance#260 := allowance#260[__this := allowance#260[__this][_from#532 := allowance#260[__this][_from#532][__msg_sender := (allowance#260[__this][_from#532][__msg_sender] - _value#536)]]];
	assume {:sourceloc "buggy_8.sol", 184, 9} {:message ""} true;
	call _transfer#453(__this, __msg_sender, __msg_value, _from#532, _to#534, _value#536);
	success#539 := true;
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_8.sol", 187, 1} {:message "winner_tmstmp14"} winner_tmstmp14#572: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 188, 1} {:message "TokenERC20::play_tmstmp14"} play_tmstmp14#594(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#574: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#574 + 432000) == __block_timestamp)) {
	winner_tmstmp14#572 := winner_tmstmp14#572[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 200, 5} {:message "TokenERC20::approve"} approve#623(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#597: address_t, _value#599: int)
	returns (success#602: bool)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#260 := allowance#260[__this := allowance#260[__this][__msg_sender := allowance#260[__this][__msg_sender][_spender#597 := _value#599]]];
	call_arg#3 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 203, 14} {:message ""} true;
	call Approval#284(__this, __msg_sender, __msg_value, call_arg#3, _spender#597, _value#599);
	success#602 := true;
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_8.sol", 206, 1} {:message "winner_tmstmp30"} winner_tmstmp30#625: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 207, 1} {:message "TokenERC20::play_tmstmp30"} play_tmstmp30#647(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#627: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#627 + 432000) == __block_timestamp)) {
	winner_tmstmp30#625 := winner_tmstmp30#625[__this := __msg_sender];
	}

	$return21:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 222, 5} {:message "TokenERC20::burn"} burn#684(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#650: int)
	returns (success#653: bool)
{
	var call_arg#4: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#243[__this][__msg_sender] >= _value#650);
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][__msg_sender := (balanceOf#243[__this][__msg_sender] - _value#650)]];
	totalSupply#228 := totalSupply#228[__this := (totalSupply#228[__this] - _value#650)];
	call_arg#4 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 226, 14} {:message ""} true;
	call Burn#294(__this, __msg_sender, __msg_value, call_arg#4, _value#650);
	success#653 := true;
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_8.sol", 229, 1} {:message "TokenERC20::bug_tmstmp8"} bug_tmstmp8#731(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 230, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#688: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#688 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#688);
	pastBlockTime_tmstmp8#688 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_8.sol", 235, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return23:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_8.sol", 247, 5} {:message "TokenERC20::burnFrom"} burnFrom#787(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#734: address_t, _value#736: int)
	returns (success#739: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#243[__this][_from#734] >= _value#736);
	assume (_value#736 <= allowance#260[__this][_from#734][__msg_sender]);
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][_from#734 := (balanceOf#243[__this][_from#734] - _value#736)]];
	allowance#260 := allowance#260[__this := allowance#260[__this][_from#734 := allowance#260[__this][_from#734][__msg_sender := (allowance#260[__this][_from#734][__msg_sender] - _value#736)]]];
	totalSupply#228 := totalSupply#228[__this := (totalSupply#228[__this] - _value#736)];
	assume {:sourceloc "buggy_8.sol", 253, 14} {:message ""} true;
	call Burn#294(__this, __msg_sender, __msg_value, _from#734, _value#736);
	success#739 := true;
	goto $return24;
	$return24:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_8.sol", 256, 1} {:message "winner_tmstmp39"} winner_tmstmp39#789: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 257, 1} {:message "TokenERC20::play_tmstmp39"} play_tmstmp39#815(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#791: int)
{
	var {:sourceloc "buggy_8.sol", 258, 2} {:message "_vtime"} _vtime#795: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#795 := __block_timestamp;
	if (((startTime#791 + 432000) == _vtime#795)) {
	winner_tmstmp39#789 := winner_tmstmp39#789[__this := __msg_sender];
	}

	$return25:
	// Function body ends here
}

// 
// ------- Contract: YFT -------
// Inherits from: Ownable
// Inherits from: TokenERC20
// 
// Event: FrozenFunds
procedure {:inline 1} {:sourceloc "buggy_8.sol", 294, 3} {:message "[event] YFT::FrozenFunds"} FrozenFunds#937(__this: address_t, __msg_sender: address_t, __msg_value: int, target#933: address_t, frozen#935: bool)
{
	
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_8.sol", 269, 3} {:message "winner_tmstmp19"} winner_tmstmp19#822: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 270, 1} {:message "YFT::play_tmstmp19"} play_tmstmp19#848(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#824: int)
{
	var {:sourceloc "buggy_8.sol", 271, 2} {:message "_vtime"} _vtime#828: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#828 := __block_timestamp;
	if (((startTime#824 + 432000) == _vtime#828)) {
	winner_tmstmp19#822 := winner_tmstmp19#822[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// State variable: sellPrice: uint256
var {:sourceloc "buggy_8.sol", 274, 3} {:message "sellPrice"} sellPrice#850: [address_t]int;
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_8.sol", 275, 3} {:message "winner_tmstmp26"} winner_tmstmp26#852: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 276, 1} {:message "YFT::play_tmstmp26"} play_tmstmp26#874(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#854: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#854 + 432000) == __block_timestamp)) {
	winner_tmstmp26#852 := winner_tmstmp26#852[__this := __msg_sender];
	}

	$return27:
	// Function body ends here
}

// 
// State variable: buyPrice: uint256
var {:sourceloc "buggy_8.sol", 279, 3} {:message "buyPrice"} buyPrice#876: [address_t]int;
// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_8.sol", 281, 3} {:message "YFT::bug_tmstmp20"} bug_tmstmp20#923(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 282, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#880: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#880 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#880);
	pastBlockTime_tmstmp20#880 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_8.sol", 287, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return28:
	// Function body ends here
}

// 
// State variable: frozenAccount: mapping(address => bool)
var {:sourceloc "buggy_8.sol", 290, 3} {:message "frozenAccount"} frozenAccount#927: [address_t][address_t]bool;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_8.sol", 293, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#931: [address_t]int;
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
// 
// Function: 
procedure {:sourceloc "buggy_8.sol", 297, 5} {:message "YFT::[constructor]"} __constructor#1374(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#939: int, tokenName#941: int_arr_ptr, tokenSymbol#943: int_arr_ptr)
{
	var initialSupply#297#5: int;
	var tokenName#299#5: int_arr_ptr;
	var tokenSymbol#301#5: int_arr_ptr;
	// TCC assumptions
	assume (tokenName#941 < __alloc_counter);
	assume (tokenSymbol#943 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp19#822 := winner_tmstmp19#822[__this := 0];
	sellPrice#850 := sellPrice#850[__this := 0];
	winner_tmstmp26#852 := winner_tmstmp26#852[__this := 0];
	buyPrice#876 := buyPrice#876[__this := 0];
	frozenAccount#927 := frozenAccount#927[__this := default_address_t_bool()];
	bugv_tmstmp4#931 := bugv_tmstmp4#931[__this := __block_timestamp];
	winner_tmstmp35#1073 := winner_tmstmp35#1073[__this := 0];
	winner_tmstmp27#1242 := winner_tmstmp27#1242[__this := 0];
	winner_tmstmp31#1292 := winner_tmstmp31#1292[__this := 0];
	winner_tmstmp2#147 := winner_tmstmp2#147[__this := 0];
	name#171 := name#171[__this := int_arr#constr(default_int_int(), 0)];
	symbol#184 := symbol#184[__this := int_arr#constr(default_int_int(), 0)];
	decimals#198 := decimals#198[__this := 18];
	winner_tmstmp3#200 := winner_tmstmp3#200[__this := 0];
	totalSupply#228 := totalSupply#228[__this := 0];
	balanceOf#243 := balanceOf#243[__this := default_address_t_int()];
	allowance#260 := allowance#260[__this := default_address_t__k_address_t_v_int()];
	bugv_tmstmp1#264 := bugv_tmstmp1#264[__this := __block_timestamp];
	bugv_tmstmp2#276 := bugv_tmstmp2#276[__this := __block_timestamp];
	bugv_tmstmp3#288 := bugv_tmstmp3#288[__this := __block_timestamp];
	winner_tmstmp7#455 := winner_tmstmp7#455[__this := 0];
	winner_tmstmp23#503 := winner_tmstmp23#503[__this := 0];
	winner_tmstmp14#572 := winner_tmstmp14#572[__this := 0];
	winner_tmstmp30#625 := winner_tmstmp30#625[__this := 0];
	winner_tmstmp39#789 := winner_tmstmp39#789[__this := 0];
	owner#14 := owner#14[__this := 0];
	bugv_tmstmp5#18 := bugv_tmstmp5#18[__this := __block_timestamp];
	winner_tmstmp38#122 := winner_tmstmp38#122[__this := 0];
	// Arguments for TokenERC20
	initialSupply#297#5 := initialSupply#939;
	tokenName#299#5 := tokenName#941;
	tokenSymbol#301#5 := tokenSymbol#943;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#14 := owner#14[__this := __msg_sender];
	$return29:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	totalSupply#228 := totalSupply#228[__this := (initialSupply#297#5 * 1000000000000000000)];
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][__msg_sender := totalSupply#228[__this]]];
	name#171 := name#171[__this := mem_arr_int[tokenName#299#5]];
	symbol#184 := symbol#184[__this := mem_arr_int[tokenSymbol#301#5]];
	$return30:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	$return31:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_8.sol", 302, 1} {:message "YFT::bug_tmstmp36"} bug_tmstmp36#999(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 303, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#956: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#956 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#956);
	pastBlockTime_tmstmp36#956 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_8.sol", 308, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return32:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_8.sol", 313, 5} {:message "YFT::_transfer"} _transfer#1071(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1001: address_t, _to#1003: address_t, _value#1005: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1003 != 0);
	assume (balanceOf#243[__this][_from#1001] >= _value#1005);
	assume ((balanceOf#243[__this][_to#1003] + _value#1005) >= balanceOf#243[__this][_to#1003]);
	assume !(frozenAccount#927[__this][_from#1001]);
	assume !(frozenAccount#927[__this][_to#1003]);
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][_from#1001 := (balanceOf#243[__this][_from#1001] - _value#1005)]];
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][_to#1003 := (balanceOf#243[__this][_to#1003] + _value#1005)]];
	assume {:sourceloc "buggy_8.sol", 321, 14} {:message ""} true;
	call Transfer#272(__this, __msg_sender, __msg_value, _from#1001, _to#1003, _value#1005);
	$return33:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_8.sol", 323, 1} {:message "winner_tmstmp35"} winner_tmstmp35#1073: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 324, 1} {:message "YFT::play_tmstmp35"} play_tmstmp35#1099(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1075: int)
{
	var {:sourceloc "buggy_8.sol", 325, 2} {:message "_vtime"} _vtime#1079: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1079 := __block_timestamp;
	if (((startTime#1075 + 432000) == _vtime#1079)) {
	winner_tmstmp35#1073 := winner_tmstmp35#1073[__this := __msg_sender];
	}

	$return34:
	// Function body ends here
}

// 
// Function: mintToken : function (address,uint256)
procedure {:sourceloc "buggy_8.sol", 332, 5} {:message "YFT::mintToken"} mintToken#1141(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1102: address_t, mintedAmount#1104: int)
{
	var call_arg#10: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#14[__this]);
	// Function body starts here
	balanceOf#243 := balanceOf#243[__this := balanceOf#243[__this][target#1102 := (balanceOf#243[__this][target#1102] + mintedAmount#1104)]];
	totalSupply#228 := totalSupply#228[__this := (totalSupply#228[__this] + mintedAmount#1104)];
	call_arg#10 := 0;
	assume {:sourceloc "buggy_8.sol", 335, 14} {:message ""} true;
	call Transfer#272(__this, __msg_sender, __msg_value, call_arg#10, __this, mintedAmount#1104);
	assume {:sourceloc "buggy_8.sol", 336, 14} {:message ""} true;
	call Transfer#272(__this, __msg_sender, __msg_value, __this, target#1102, mintedAmount#1104);
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_8.sol", 338, 1} {:message "YFT::bug_tmstmp40"} bug_tmstmp40#1188(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 339, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1145: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1145 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1145);
	pastBlockTime_tmstmp40#1145 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_8.sol", 344, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return37:
	// Function body ends here
}

// 
// Function: freezeAccount : function (address,bool)
procedure {:sourceloc "buggy_8.sol", 351, 5} {:message "YFT::freezeAccount"} freezeAccount#1210(__this: address_t, __msg_sender: address_t, __msg_value: int, target#1191: address_t, freeze#1193: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#14[__this]);
	// Function body starts here
	frozenAccount#927 := frozenAccount#927[__this := frozenAccount#927[__this][target#1191 := freeze#1193]];
	assume {:sourceloc "buggy_8.sol", 353, 14} {:message ""} true;
	call FrozenFunds#937(__this, __msg_sender, __msg_value, target#1191, freeze#1193);
	$return39:
	// Function body ends here
	$return38:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_8.sol", 355, 1} {:message "YFT::bug_tmstmp33"} bug_tmstmp33#1221(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1213: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1213 := (__block_timestamp >= 1546300800);
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: setPrices : function (uint256,uint256)
procedure {:sourceloc "buggy_8.sol", 362, 5} {:message "YFT::setPrices"} setPrices#1240(__this: address_t, __msg_sender: address_t, __msg_value: int, newSellPrice#1224: int, newBuyPrice#1226: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#14[__this]);
	// Function body starts here
	sellPrice#850 := sellPrice#850[__this := newSellPrice#1224];
	buyPrice#876 := buyPrice#876[__this := newBuyPrice#1226];
	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_8.sol", 366, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1242: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 367, 1} {:message "YFT::play_tmstmp27"} play_tmstmp27#1268(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1244: int)
{
	var {:sourceloc "buggy_8.sol", 368, 2} {:message "_vtime"} _vtime#1248: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1248 := __block_timestamp;
	if (((startTime#1244 + 432000) == _vtime#1248)) {
	winner_tmstmp27#1242 := winner_tmstmp27#1242[__this := __msg_sender];
	}

	$return43:
	// Function body ends here
}

// 
// Function: buy : function ()
procedure {:sourceloc "buggy_8.sol", 373, 5} {:message "YFT::buy"} buy#1290(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_8.sol", 374, 9} {:message "amount"} amount#1273: int;
	var call_arg#15: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	amount#1273 := (__msg_value div buyPrice#876[__this]);
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 375, 9} {:message ""} true;
	call _transfer#1071(__this, __msg_sender, __msg_value, __this, call_arg#15, amount#1273);
	$return44:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_8.sol", 377, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1292: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_8.sol", 378, 1} {:message "YFT::play_tmstmp31"} play_tmstmp31#1318(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1294: int)
{
	var {:sourceloc "buggy_8.sol", 379, 2} {:message "_vtime"} _vtime#1298: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1298 := __block_timestamp;
	if (((startTime#1294 + 432000) == _vtime#1298)) {
	winner_tmstmp31#1292 := winner_tmstmp31#1292[__this := __msg_sender];
	}

	$return45:
	// Function body ends here
}

// 
// Function: sell : function (uint256)
procedure {:sourceloc "buggy_8.sol", 385, 5} {:message "YFT::sell"} sell#1362(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#1321: int)
{
	var {:sourceloc "buggy_8.sol", 386, 9} {:message "myAddress"} myAddress#1325: address_t;
	var call_arg#16: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	myAddress#1325 := __this;
	assume (__balance[myAddress#1325] >= (amount#1321 * sellPrice#850[__this]));
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_8.sol", 388, 9} {:message ""} true;
	call _transfer#1071(__this, __msg_sender, __msg_value, call_arg#16, __this, amount#1321);
	assume {:sourceloc "buggy_8.sol", 389, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, (amount#1321 * sellPrice#850[__this]));
	$return46:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_8.sol", 391, 1} {:message "YFT::bug_tmstmp13"} bug_tmstmp13#1373(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1365: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1365 := (__block_timestamp >= 1546300800);
	goto $return47;
	$return47:
	// Function body ends here
}

