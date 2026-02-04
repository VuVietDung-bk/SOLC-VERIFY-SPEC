// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_48.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 23, 5} {:message "SafeMath::add"} add#23(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (c#8: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#8 := (a#3 + b#5);
	assume (c#8 >= a#3);
	$return0:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 27, 5} {:message "SafeMath::sub"} sub#45(__this: address_t, __msg_sender: address_t, __msg_value: int, a#25: int, b#27: int)
	returns (c#30: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#27 <= a#25);
	c#30 := (a#25 - b#27);
	$return1:
	// Function body ends here
}

// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 31, 5} {:message "SafeMath::mul"} mul#73(__this: address_t, __msg_sender: address_t, __msg_value: int, a#47: int, b#49: int)
	returns (c#52: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#52 := (a#47 * b#49);
	assume ((a#47 == 0) || ((c#52 div a#47) == b#49));
	$return2:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_48.sol", 35, 5} {:message "SafeMath::div"} div#95(__this: address_t, __msg_sender: address_t, __msg_value: int, a#75: int, b#77: int)
	returns (c#80: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#77 > 0);
	c#80 := (a#75 div b#77);
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 22, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#96(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_48.sol", 89, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#339(__this: address_t, __msg_sender: address_t, __msg_value: int, from#333: address_t, to#335: address_t, tokens#337: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_48.sol", 91, 3} {:message "[event] ERC20Interface::Approval"} Approval#351(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#345: address_t, spender#347: address_t, tokens#349: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_48.sol", 47, 5} {:message "ERC20Interface::totalSupply"} totalSupply#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#99: int);
	modifies winner_tmstmp19#121, winner_tmstmp26#158, winner_tmstmp38#305, bugv_tmstmp2#331, bugv_tmstmp3#343;

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_48.sol", 48, 1} {:message "ERC20Interface::bug_tmstmp25"} bug_tmstmp25#112(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#104: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#104 := (__block_timestamp >= 1546300800);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Function: balanceOf
procedure {:sourceloc "buggy_48.sol", 51, 5} {:message "ERC20Interface::balanceOf"} balanceOf#119(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#114: address_t)
	returns (balance#117: int);
	modifies winner_tmstmp19#121, winner_tmstmp26#158, winner_tmstmp38#305, bugv_tmstmp2#331, bugv_tmstmp3#343;

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_48.sol", 52, 1} {:message "winner_tmstmp19"} winner_tmstmp19#121: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 53, 1} {:message "ERC20Interface::play_tmstmp19"} play_tmstmp19#147(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#123: int)
{
	var {:sourceloc "buggy_48.sol", 54, 2} {:message "_vtime"} _vtime#127: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#127 := __block_timestamp;
	if (((startTime#123 + 432000) == _vtime#127)) {
	winner_tmstmp19#121 := winner_tmstmp19#121[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// Function: allowance
procedure {:sourceloc "buggy_48.sol", 57, 5} {:message "ERC20Interface::allowance"} allowance#156(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#149: address_t, spender#151: address_t)
	returns (remaining#154: int);
	modifies winner_tmstmp19#121, winner_tmstmp26#158, winner_tmstmp38#305, bugv_tmstmp2#331, bugv_tmstmp3#343;

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_48.sol", 58, 1} {:message "winner_tmstmp26"} winner_tmstmp26#158: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 59, 1} {:message "ERC20Interface::play_tmstmp26"} play_tmstmp26#180(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#160: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#160 + 432000) == __block_timestamp)) {
	winner_tmstmp26#158 := winner_tmstmp26#158[__this := __msg_sender];
	}

	$return6:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_48.sol", 62, 5} {:message "ERC20Interface::transfer"} transfer#189(__this: address_t, __msg_sender: address_t, __msg_value: int, to#182: address_t, tokens#184: int)
	returns (success#187: bool);
	modifies winner_tmstmp19#121, winner_tmstmp26#158, winner_tmstmp38#305, bugv_tmstmp2#331, bugv_tmstmp3#343;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_48.sol", 63, 1} {:message "ERC20Interface::bug_tmstmp20"} bug_tmstmp20#236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 64, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#193: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#193 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#193);
	pastBlockTime_tmstmp20#193 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_48.sol", 69, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return7:
	// Function body ends here
}

// 
// Function: approve
procedure {:sourceloc "buggy_48.sol", 72, 5} {:message "ERC20Interface::approve"} approve#245(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#238: address_t, tokens#240: int)
	returns (success#243: bool);
	modifies winner_tmstmp19#121, winner_tmstmp26#158, winner_tmstmp38#305, bugv_tmstmp2#331, bugv_tmstmp3#343;

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_48.sol", 73, 1} {:message "ERC20Interface::bug_tmstmp32"} bug_tmstmp32#292(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 74, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#249: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#249 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#249);
	pastBlockTime_tmstmp32#249 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_48.sol", 79, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return8:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_48.sol", 82, 5} {:message "ERC20Interface::transferFrom"} transferFrom#303(__this: address_t, __msg_sender: address_t, __msg_value: int, from#294: address_t, to#296: address_t, tokens#298: int)
	returns (success#301: bool);
	modifies winner_tmstmp19#121, winner_tmstmp26#158, winner_tmstmp38#305, bugv_tmstmp2#331, bugv_tmstmp3#343;

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_48.sol", 83, 1} {:message "winner_tmstmp38"} winner_tmstmp38#305: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 84, 1} {:message "ERC20Interface::play_tmstmp38"} play_tmstmp38#327(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#307: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#307 + 432000) == __block_timestamp)) {
	winner_tmstmp38#305 := winner_tmstmp38#305[__this := __msg_sender];
	}

	$return9:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_48.sol", 88, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#331: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_48.sol", 90, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#343: [address_t]int;
// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 46, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#352(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp19#121 := winner_tmstmp19#121[__this := 0];
	winner_tmstmp26#158 := winner_tmstmp26#158[__this := 0];
	winner_tmstmp38#305 := winner_tmstmp38#305[__this := 0];
	bugv_tmstmp2#331 := bugv_tmstmp2#331[__this := __block_timestamp];
	bugv_tmstmp3#343 := bugv_tmstmp3#343[__this := __block_timestamp];
}

// 
// ------- Contract: ApproveAndCallFallBack -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval : function (address,uint256,address,bytes memory)
procedure {:sourceloc "buggy_48.sol", 101, 5} {:message "ApproveAndCallFallBack::receiveApproval"} receiveApproval#363(__this: address_t, __msg_sender: address_t, __msg_value: int, from#354: address_t, tokens#356: int, token#358: address_t, data#360: int_arr_ptr);

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_48.sol", 102, 1} {:message "ApproveAndCallFallBack::bug_tmstmp4"} bug_tmstmp4#410(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 103, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#367: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#367 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#367);
	pastBlockTime_tmstmp4#367 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_48.sol", 108, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return10:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_48.sol", 100, 1} {:message "ApproveAndCallFallBack::[implicit_constructor]"} __constructor#411(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_48.sol", 136, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#500(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#496: address_t, _to#498: address_t)
{
	
}

// 
// Function: bug_tmstmp12 : function ()
procedure {:sourceloc "buggy_48.sol", 118, 5} {:message "Owned::bug_tmstmp12"} bug_tmstmp12#458(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 119, 2} {:message "pastBlockTime_tmstmp12"} pastBlockTime_tmstmp12#415: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp12#415 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp12#415);
	pastBlockTime_tmstmp12#415 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_48.sol", 124, 25} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_48.sol", 127, 3} {:message "owner"} owner#460: [address_t]address_t;
// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_48.sol", 128, 3} {:message "winner_tmstmp11"} winner_tmstmp11#462: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 129, 1} {:message "Owned::play_tmstmp11"} play_tmstmp11#488(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#464: int)
{
	var {:sourceloc "buggy_48.sol", 130, 2} {:message "_vtime"} _vtime#468: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#468 := __block_timestamp;
	if (((startTime#464 + 432000) == _vtime#468)) {
	winner_tmstmp11#462 := winner_tmstmp11#462[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// State variable: newOwner: address
var {:sourceloc "buggy_48.sol", 133, 3} {:message "newOwner"} newOwner#490: [address_t]address_t;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_48.sol", 135, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#494: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 138, 5} {:message "Owned::[constructor]"} __constructor#644(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#460 := owner#460[__this := 0];
	winner_tmstmp11#462 := winner_tmstmp11#462[__this := 0];
	newOwner#490 := newOwner#490[__this := 0];
	bugv_tmstmp4#494 := bugv_tmstmp4#494[__this := __block_timestamp];
	winner_tmstmp7#511 := winner_tmstmp7#511[__this := 0];
	bugv_tmstmp1#552 := bugv_tmstmp1#552[__this := __block_timestamp];
	winner_tmstmp23#566 := winner_tmstmp23#566[__this := 0];
	winner_tmstmp14#621 := winner_tmstmp14#621[__this := 0];
	// Function body starts here
	owner#460 := owner#460[__this := __msg_sender];
	$return13:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_48.sol", 141, 1} {:message "winner_tmstmp7"} winner_tmstmp7#511: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 142, 1} {:message "Owned::play_tmstmp7"} play_tmstmp7#537(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#513: int)
{
	var {:sourceloc "buggy_48.sol", 143, 2} {:message "_vtime"} _vtime#517: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#517 := __block_timestamp;
	if (((startTime#513 + 432000) == _vtime#517)) {
	winner_tmstmp7#511 := winner_tmstmp7#511[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_48.sol", 151, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#552: [address_t]int;
// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_48.sol", 153, 5} {:message "Owned::transferOwnership"} transferOwnership#564(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#554: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#460[__this]);
	// Function body starts here
	newOwner#490 := newOwner#490[__this := _newOwner#554];
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_48.sol", 156, 1} {:message "winner_tmstmp23"} winner_tmstmp23#566: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 157, 1} {:message "Owned::play_tmstmp23"} play_tmstmp23#592(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#568: int)
{
	var {:sourceloc "buggy_48.sol", 158, 2} {:message "_vtime"} _vtime#572: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#572 := __block_timestamp;
	if (((startTime#568 + 432000) == _vtime#572)) {
	winner_tmstmp23#566 := winner_tmstmp23#566[__this := __msg_sender];
	}

	$return17:
	// Function body ends here
}

// 
// Function: acceptOwnership : function ()
procedure {:sourceloc "buggy_48.sol", 161, 5} {:message "Owned::acceptOwnership"} acceptOwnership#619(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__msg_sender == newOwner#490[__this]);
	assume {:sourceloc "buggy_48.sol", 163, 14} {:message ""} true;
	call OwnershipTransferred#500(__this, __msg_sender, __msg_value, owner#460[__this], newOwner#490[__this]);
	owner#460 := owner#460[__this := newOwner#490[__this]];
	newOwner#490 := newOwner#490[__this := 0];
	$return18:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_48.sol", 167, 1} {:message "winner_tmstmp14"} winner_tmstmp14#621: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 168, 1} {:message "Owned::play_tmstmp14"} play_tmstmp14#643(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#623: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#623 + 432000) == __block_timestamp)) {
	winner_tmstmp14#621 := winner_tmstmp14#621[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// ------- Contract: QurasToken -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// Using library SafeMath for uint256
// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_48.sol", 181, 3} {:message "QurasToken::bug_tmstmp1"} bug_tmstmp1#662(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#654: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#654 := (__block_timestamp >= 1546300800);
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_48.sol", 184, 3} {:message "symbol"} symbol#664: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_48.sol", 185, 3} {:message "winner_tmstmp2"} winner_tmstmp2#666: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 186, 1} {:message "QurasToken::play_tmstmp2"} play_tmstmp2#688(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#668: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#668 + 432000) == __block_timestamp)) {
	winner_tmstmp2#666 := winner_tmstmp2#666[__this := __msg_sender];
	}

	$return21:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_48.sol", 189, 3} {:message "name"} name#690: [address_t]int_arr_type;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_48.sol", 190, 3} {:message "QurasToken::bug_tmstmp17"} bug_tmstmp17#701(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#693: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#693 := (__block_timestamp >= 1546300800);
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_48.sol", 193, 3} {:message "decimals"} decimals#703: [address_t]int;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_48.sol", 194, 3} {:message "QurasToken::bug_tmstmp37"} bug_tmstmp37#714(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#706: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#706 := (__block_timestamp >= 1546300800);
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_48.sol", 197, 3} {:message "_totalSupply"} _totalSupply#716: [address_t]int;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_48.sol", 199, 3} {:message "winner_tmstmp3"} winner_tmstmp3#718: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 200, 1} {:message "QurasToken::play_tmstmp3"} play_tmstmp3#744(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#720: int)
{
	var {:sourceloc "buggy_48.sol", 201, 2} {:message "_vtime"} _vtime#724: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#724 := __block_timestamp;
	if (((startTime#720 + 432000) == _vtime#724)) {
	winner_tmstmp3#718 := winner_tmstmp3#718[__this := __msg_sender];
	}

	$return24:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_48.sol", 204, 3} {:message "balances"} balances#748: [address_t][address_t]int;
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_48.sol", 205, 3} {:message "QurasToken::bug_tmstmp9"} bug_tmstmp9#759(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#751: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#751 := (__block_timestamp >= 1546300800);
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_48.sol", 208, 3} {:message "allowed"} allowed#765: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_48.sol", 214, 5} {:message "QurasToken::[constructor]"} __constructor#1449(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	symbol#664 := symbol#664[__this := int_arr#constr(default_int_int(), 0)];
	winner_tmstmp2#666 := winner_tmstmp2#666[__this := 0];
	name#690 := name#690[__this := int_arr#constr(default_int_int(), 0)];
	decimals#703 := decimals#703[__this := 0];
	_totalSupply#716 := _totalSupply#716[__this := 0];
	winner_tmstmp3#718 := winner_tmstmp3#718[__this := 0];
	balances#748 := balances#748[__this := default_address_t_int()];
	allowed#765 := allowed#765[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp30#802 := winner_tmstmp30#802[__this := 0];
	winner_tmstmp39#903 := winner_tmstmp39#903[__this := 0];
	winner_tmstmp35#1063 := winner_tmstmp35#1063[__this := 0];
	winner_tmstmp27#1298 := winner_tmstmp27#1298[__this := 0];
	winner_tmstmp31#1343 := winner_tmstmp31#1343[__this := 0];
	bugv_tmstmp5#1448 := bugv_tmstmp5#1448[__this := __block_timestamp];
	owner#460 := owner#460[__this := 0];
	winner_tmstmp11#462 := winner_tmstmp11#462[__this := 0];
	newOwner#490 := newOwner#490[__this := 0];
	bugv_tmstmp4#494 := bugv_tmstmp4#494[__this := __block_timestamp];
	winner_tmstmp7#511 := winner_tmstmp7#511[__this := 0];
	bugv_tmstmp1#552 := bugv_tmstmp1#552[__this := __block_timestamp];
	winner_tmstmp23#566 := winner_tmstmp23#566[__this := 0];
	winner_tmstmp14#621 := winner_tmstmp14#621[__this := 0];
	winner_tmstmp19#121 := winner_tmstmp19#121[__this := 0];
	winner_tmstmp26#158 := winner_tmstmp26#158[__this := 0];
	winner_tmstmp38#305 := winner_tmstmp38#305[__this := 0];
	bugv_tmstmp2#331 := bugv_tmstmp2#331[__this := __block_timestamp];
	bugv_tmstmp3#343 := bugv_tmstmp3#343[__this := __block_timestamp];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#460 := owner#460[__this := __msg_sender];
	$return26:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	symbol#664 := symbol#664[__this := int_arr#constr(default_int_int()[0 := 88][1 := 81][2 := 67], 3)];
	name#690 := name#690[__this := int_arr#constr(default_int_int()[0 := 81][1 := 117][2 := 114][3 := 97][4 := 115][5 := 32][6 := 84][7 := 111][8 := 107][9 := 101][10 := 110], 11)];
	decimals#703 := decimals#703[__this := 8];
	_totalSupply#716 := _totalSupply#716[__this := 88888888800000000];
	balances#748 := balances#748[__this := balances#748[__this][owner#460[__this] := _totalSupply#716[__this]]];
	call_arg#3 := 0;
	assume {:sourceloc "buggy_48.sol", 220, 14} {:message ""} true;
	call Transfer#339(__this, __msg_sender, __msg_value, call_arg#3, owner#460[__this], _totalSupply#716[__this]);
	$return27:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_48.sol", 222, 1} {:message "winner_tmstmp30"} winner_tmstmp30#802: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 223, 1} {:message "QurasToken::play_tmstmp30"} play_tmstmp30#824(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#804: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#804 + 432000) == __block_timestamp)) {
	winner_tmstmp30#802 := winner_tmstmp30#802[__this := __msg_sender];
	}

	$return28:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 231, 5} {:message "QurasToken::totalSupply"} totalSupply#841(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#828: int)
{
	var sub#45_ret#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 232, 16} {:message ""} true;
	call sub#45_ret#4 := sub#45(__this, __msg_sender, __msg_value, _totalSupply#716[__this], balances#748[__this][0]);
	#828 := sub#45_ret#4;
	goto $return29;
	$return29:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_48.sol", 234, 1} {:message "QurasToken::bug_tmstmp8"} bug_tmstmp8#888(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 235, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#845: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#845 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#845);
	pastBlockTime_tmstmp8#845 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_48.sol", 240, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return30:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 248, 5} {:message "QurasToken::balanceOf"} balanceOf#901(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#890: address_t)
	returns (balance#894: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#894 := balances#748[__this][tokenOwner#890];
	goto $return31;
	$return31:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_48.sol", 251, 1} {:message "winner_tmstmp39"} winner_tmstmp39#903: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 252, 1} {:message "QurasToken::play_tmstmp39"} play_tmstmp39#929(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#905: int)
{
	var {:sourceloc "buggy_48.sol", 253, 2} {:message "_vtime"} _vtime#909: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#909 := __block_timestamp;
	if (((startTime#905 + 432000) == _vtime#909)) {
	winner_tmstmp39#903 := winner_tmstmp39#903[__this := __msg_sender];
	}

	$return32:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 263, 5} {:message "QurasToken::transfer"} transfer#973(__this: address_t, __msg_sender: address_t, __msg_value: int, to#931: address_t, tokens#933: int)
	returns (success#937: bool)
{
	var sub#45_ret#5: int;
	var add#23_ret#6: int;
	var call_arg#7: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 264, 32} {:message ""} true;
	call sub#45_ret#5 := sub#45(__this, __msg_sender, __msg_value, balances#748[__this][__msg_sender], tokens#933);
	balances#748 := balances#748[__this := balances#748[__this][__msg_sender := sub#45_ret#5]];
	assume {:sourceloc "buggy_48.sol", 265, 24} {:message ""} true;
	call add#23_ret#6 := add#23(__this, __msg_sender, __msg_value, balances#748[__this][to#931], tokens#933);
	balances#748 := balances#748[__this := balances#748[__this][to#931 := add#23_ret#6]];
	call_arg#7 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 266, 14} {:message ""} true;
	call Transfer#339(__this, __msg_sender, __msg_value, call_arg#7, to#931, tokens#933);
	success#937 := true;
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_48.sol", 269, 1} {:message "QurasToken::bug_tmstmp36"} bug_tmstmp36#1020(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 270, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#977: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#977 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#977);
	pastBlockTime_tmstmp36#977 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_48.sol", 275, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return34:
	// Function body ends here
}

// 
// Function: increaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 280, 5} {:message "QurasToken::increaseApproval"} increaseApproval#1061(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#1022: address_t, _addedValue#1024: int)
	returns (#1027: bool)
{
	var add#23_ret#8: int;
	var call_arg#9: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 281, 41} {:message ""} true;
	call add#23_ret#8 := add#23(__this, __msg_sender, __msg_value, allowed#765[__this][__msg_sender][_spender#1022], _addedValue#1024);
	allowed#765 := allowed#765[__this := allowed#765[__this][__msg_sender := allowed#765[__this][__msg_sender][_spender#1022 := add#23_ret#8]]];
	call_arg#9 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 282, 14} {:message ""} true;
	call Approval#351(__this, __msg_sender, __msg_value, call_arg#9, _spender#1022, allowed#765[__this][__msg_sender][_spender#1022]);
	#1027 := true;
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_48.sol", 285, 1} {:message "winner_tmstmp35"} winner_tmstmp35#1063: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 286, 1} {:message "QurasToken::play_tmstmp35"} play_tmstmp35#1089(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1065: int)
{
	var {:sourceloc "buggy_48.sol", 287, 2} {:message "_vtime"} _vtime#1069: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1069 := __block_timestamp;
	if (((startTime#1065 + 432000) == _vtime#1069)) {
	winner_tmstmp35#1063 := winner_tmstmp35#1063[__this := __msg_sender];
	}

	$return36:
	// Function body ends here
}

// 
// Function: decreaseApproval : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 291, 5} {:message "QurasToken::decreaseApproval"} decreaseApproval#1149(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#1091: address_t, _subtractedValue#1093: int)
	returns (#1096: bool)
{
	var {:sourceloc "buggy_48.sol", 292, 9} {:message "oldValue"} oldValue#1099: int;
	var sub#45_ret#10: int;
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	oldValue#1099 := allowed#765[__this][__msg_sender][_spender#1091];
	if ((_subtractedValue#1093 > oldValue#1099)) {
	allowed#765 := allowed#765[__this := allowed#765[__this][__msg_sender := allowed#765[__this][__msg_sender][_spender#1091 := 0]]];
	}
	else {
	assume {:sourceloc "buggy_48.sol", 296, 45} {:message ""} true;
	call sub#45_ret#10 := sub#45(__this, __msg_sender, __msg_value, oldValue#1099, _subtractedValue#1093);
	allowed#765 := allowed#765[__this := allowed#765[__this][__msg_sender := allowed#765[__this][__msg_sender][_spender#1091 := sub#45_ret#10]]];
	}

	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 298, 14} {:message ""} true;
	call Approval#351(__this, __msg_sender, __msg_value, call_arg#11, _spender#1091, allowed#765[__this][__msg_sender][_spender#1091]);
	#1096 := true;
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_48.sol", 301, 1} {:message "QurasToken::bug_tmstmp40"} bug_tmstmp40#1196(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_48.sol", 302, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1153: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1153 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1153);
	pastBlockTime_tmstmp40#1153 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_48.sol", 307, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return38:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 320, 5} {:message "QurasToken::approve"} approve#1225(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1198: address_t, tokens#1200: int)
	returns (success#1204: bool)
{
	var call_arg#12: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#765 := allowed#765[__this := allowed#765[__this][__msg_sender := allowed#765[__this][__msg_sender][spender#1198 := tokens#1200]]];
	call_arg#12 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 322, 14} {:message ""} true;
	call Approval#351(__this, __msg_sender, __msg_value, call_arg#12, spender#1198, tokens#1200);
	success#1204 := true;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_48.sol", 325, 1} {:message "QurasToken::bug_tmstmp33"} bug_tmstmp33#1236(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1228: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1228 := (__block_timestamp >= 1546300800);
	goto $return40;
	$return40:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 339, 5} {:message "QurasToken::transferFrom"} transferFrom#1296(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1238: address_t, to#1240: address_t, tokens#1242: int)
	returns (success#1246: bool)
{
	var sub#45_ret#13: int;
	var sub#45_ret#14: int;
	var add#23_ret#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 340, 26} {:message ""} true;
	call sub#45_ret#13 := sub#45(__this, __msg_sender, __msg_value, balances#748[__this][from#1238], tokens#1242);
	balances#748 := balances#748[__this := balances#748[__this][from#1238 := sub#45_ret#13]];
	assume {:sourceloc "buggy_48.sol", 341, 37} {:message ""} true;
	call sub#45_ret#14 := sub#45(__this, __msg_sender, __msg_value, allowed#765[__this][from#1238][__msg_sender], tokens#1242);
	allowed#765 := allowed#765[__this := allowed#765[__this][from#1238 := allowed#765[__this][from#1238][__msg_sender := sub#45_ret#14]]];
	assume {:sourceloc "buggy_48.sol", 342, 24} {:message ""} true;
	call add#23_ret#15 := add#23(__this, __msg_sender, __msg_value, balances#748[__this][to#1240], tokens#1242);
	balances#748 := balances#748[__this := balances#748[__this][to#1240 := add#23_ret#15]];
	assume {:sourceloc "buggy_48.sol", 343, 14} {:message ""} true;
	call Transfer#339(__this, __msg_sender, __msg_value, from#1238, to#1240, tokens#1242);
	success#1246 := true;
	goto $return41;
	$return41:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_48.sol", 346, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1298: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 347, 1} {:message "QurasToken::play_tmstmp27"} play_tmstmp27#1324(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1300: int)
{
	var {:sourceloc "buggy_48.sol", 348, 2} {:message "_vtime"} _vtime#1304: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1304 := __block_timestamp;
	if (((startTime#1300 + 432000) == _vtime#1304)) {
	winner_tmstmp27#1298 := winner_tmstmp27#1298[__this := __msg_sender];
	}

	$return42:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_48.sol", 357, 5} {:message "QurasToken::allowance"} allowance#1341(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#1326: address_t, spender#1328: address_t)
	returns (remaining#1332: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	remaining#1332 := allowed#765[__this][tokenOwner#1326][spender#1328];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_48.sol", 360, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1343: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_48.sol", 361, 1} {:message "QurasToken::play_tmstmp31"} play_tmstmp31#1369(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1345: int)
{
	var {:sourceloc "buggy_48.sol", 362, 2} {:message "_vtime"} _vtime#1349: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1349 := __block_timestamp;
	if (((startTime#1345 + 432000) == _vtime#1349)) {
	winner_tmstmp31#1343 := winner_tmstmp31#1343[__this := __msg_sender];
	}

	$return44:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_48.sol", 372, 5} {:message "QurasToken::approveAndCall"} approveAndCall#1413(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#1371: address_t, tokens#1373: int, data#1375: int_arr_ptr)
	returns (success#1378: bool)
{
	var call_arg#16: address_t;
	var call_arg#17: address_t;
	// TCC assumptions
	assume (data#1375 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	allowed#765 := allowed#765[__this := allowed#765[__this][__msg_sender := allowed#765[__this][__msg_sender][spender#1371 := tokens#1373]]];
	call_arg#16 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 374, 14} {:message ""} true;
	call Approval#351(__this, __msg_sender, __msg_value, call_arg#16, spender#1371, tokens#1373);
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_48.sol", 375, 9} {:message ""} true;
	call receiveApproval#363(spender#1371, __this, 0, call_arg#17, tokens#1373, __this, data#1375);
	success#1378 := true;
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_48.sol", 378, 1} {:message "QurasToken::bug_tmstmp13"} bug_tmstmp13#1424(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1416: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1416 := (__block_timestamp >= 1546300800);
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// Function: transferAnyERC20Token : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_48.sol", 386, 5} {:message "QurasToken::transferAnyERC20Token"} transferAnyERC20Token#1444(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1426: address_t, tokens#1428: int)
	returns (success#1433: bool)
{
	var transfer#189_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#460[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_48.sol", 387, 16} {:message ""} true;
	call transfer#189_ret#20 := transfer#189(tokenAddress#1426, __this, 0, owner#460[__this], tokens#1428);
	success#1433 := transfer#189_ret#20;
	goto $return48;
	$return48:
	// Function body ends here
	$return47:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_48.sol", 389, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1448: [address_t]int;
