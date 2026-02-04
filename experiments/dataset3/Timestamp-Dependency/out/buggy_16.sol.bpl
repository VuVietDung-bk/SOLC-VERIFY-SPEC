// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_16.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 19, 5} {:message "SafeMath::mul"} mul#31(__this: address_t, __msg_sender: address_t, __msg_value: int, a#5: int, b#7: int)
	returns (c#10: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#10 := (a#5 * b#7);
	assume ((a#5 == 0) || ((c#10 div a#5) == b#7));
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 27, 4} {:message "SafeMath::div"} div#54(__this: address_t, __msg_sender: address_t, __msg_value: int, a#34: int, b#36: int)
	returns (c#39: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#36 > 0);
	c#39 := (a#34 div b#36);
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 35, 5} {:message "SafeMath::sub"} sub#77(__this: address_t, __msg_sender: address_t, __msg_value: int, a#57: int, b#59: int)
	returns (c#62: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#59 <= a#57);
	c#62 := (a#57 - b#59);
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 43, 5} {:message "SafeMath::add"} add#100(__this: address_t, __msg_sender: address_t, __msg_value: int, a#80: int, b#82: int)
	returns (c#85: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#85 := (a#80 + b#82);
	assume (c#85 >= a#80);
	$return3:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_16.sol", 14, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#101(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_16.sol", 88, 3} {:message "[event] ERC20Interface::Transfer"} Transfer#302(__this: address_t, __msg_sender: address_t, __msg_value: int, from#296: address_t, to#298: address_t, tokens#300: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_16.sol", 90, 3} {:message "[event] ERC20Interface::Approval"} Approval#314(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#308: address_t, spender#310: address_t, tokens#312: int)
{
	
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 51, 5} {:message "ERC20Interface::totalSupply"} totalSupply#106(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#104: int);
	modifies winner_tmstmp11#162, winner_tmstmp2#219, bugv_tmstmp5#306;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp12 : function ()
procedure {:sourceloc "buggy_16.sol", 52, 1} {:message "ERC20Interface::bug_tmstmp12"} bug_tmstmp12#153(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 53, 2} {:message "pastBlockTime_tmstmp12"} pastBlockTime_tmstmp12#110: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp12#110 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp12#110);
	pastBlockTime_tmstmp12#110 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 58, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return4:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 61, 5} {:message "ERC20Interface::balanceOf"} balanceOf#160(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#155: address_t)
	returns (balance#158: int);
	modifies winner_tmstmp11#162, winner_tmstmp2#219, bugv_tmstmp5#306;

// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_16.sol", 62, 1} {:message "winner_tmstmp11"} winner_tmstmp11#162: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 63, 1} {:message "ERC20Interface::play_tmstmp11"} play_tmstmp11#188(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#164: int)
{
	var {:sourceloc "buggy_16.sol", 64, 2} {:message "_vtime"} _vtime#168: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#168 := __block_timestamp;
	if (((startTime#164 + 432000) == _vtime#168)) {
	winner_tmstmp11#162 := winner_tmstmp11#162[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 67, 5} {:message "ERC20Interface::allowance"} allowance#197(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#190: address_t, spender#192: address_t)
	returns (remaining#195: int);
	modifies winner_tmstmp11#162, winner_tmstmp2#219, bugv_tmstmp5#306;

// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 68, 1} {:message "ERC20Interface::bug_tmstmp1"} bug_tmstmp1#208(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#200: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#200 := (__block_timestamp >= 1546300800);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 71, 5} {:message "ERC20Interface::transfer"} transfer#217(__this: address_t, __msg_sender: address_t, __msg_value: int, to#210: address_t, tokens#212: int)
	returns (success#215: bool);
	modifies winner_tmstmp11#162, winner_tmstmp2#219, bugv_tmstmp5#306;

// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_16.sol", 72, 1} {:message "winner_tmstmp2"} winner_tmstmp2#219: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 73, 1} {:message "ERC20Interface::play_tmstmp2"} play_tmstmp2#241(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#221: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#221 + 432000) == __block_timestamp)) {
	winner_tmstmp2#219 := winner_tmstmp2#219[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 76, 5} {:message "ERC20Interface::approve"} approve#250(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#243: address_t, tokens#245: int)
	returns (success#248: bool);
	modifies winner_tmstmp11#162, winner_tmstmp2#219, bugv_tmstmp5#306;

// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 77, 1} {:message "ERC20Interface::bug_tmstmp17"} bug_tmstmp17#261(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#253: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#253 := (__block_timestamp >= 1546300800);
	goto $return8;
	$return8:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 80, 5} {:message "ERC20Interface::transferFrom"} transferFrom#272(__this: address_t, __msg_sender: address_t, __msg_value: int, from#263: address_t, to#265: address_t, tokens#267: int)
	returns (success#270: bool);
	modifies winner_tmstmp11#162, winner_tmstmp2#219, bugv_tmstmp5#306;

// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 81, 1} {:message "ERC20Interface::bug_tmstmp37"} bug_tmstmp37#283(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#275: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#275 := (__block_timestamp >= 1546300800);
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 85, 3} {:message "ERC20Interface::bug_tmstmp13"} bug_tmstmp13#294(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#286: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#286 := (__block_timestamp >= 1546300800);
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_16.sol", 89, 3} {:message "bugv_tmstmp5"} bugv_tmstmp5#306: [address_t]int;
// 
// Default constructor
procedure {:sourceloc "buggy_16.sol", 50, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#315(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp11#162 := winner_tmstmp11#162[__this := 0];
	winner_tmstmp2#219 := winner_tmstmp2#219[__this := 0];
	bugv_tmstmp5#306 := bugv_tmstmp5#306[__this := __block_timestamp];
}

// 
// ------- Contract: Owned -------
// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_16.sol", 106, 3} {:message "[event] Owned::OwnershipTransferred"} OwnershipTransferred#374(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#370: address_t, newOwner#372: address_t)
{
	
}

// 
// Function: bug_tmstmp16 : function ()
procedure {:sourceloc "buggy_16.sol", 95, 3} {:message "Owned::bug_tmstmp16"} bug_tmstmp16#362(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 96, 2} {:message "pastBlockTime_tmstmp16"} pastBlockTime_tmstmp16#319: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp16#319 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp16#319);
	pastBlockTime_tmstmp16#319 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 101, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return11:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_16.sol", 104, 3} {:message "owner"} owner#364: [address_t]address_t;
// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_16.sol", 105, 3} {:message "bugv_tmstmp1"} bugv_tmstmp1#368: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 112, 5} {:message "Owned::[constructor]"} __constructor#466(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#364 := owner#364[__this := 0];
	bugv_tmstmp1#368 := bugv_tmstmp1#368[__this := __block_timestamp];
	winner_tmstmp3#389 := winner_tmstmp3#389[__this := 0];
	// Function body starts here
	owner#364 := owner#364[__this := __msg_sender];
	$return12:
	// Function body ends here
}

// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_16.sol", 115, 1} {:message "winner_tmstmp3"} winner_tmstmp3#389: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 116, 1} {:message "Owned::play_tmstmp3"} play_tmstmp3#415(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#391: int)
{
	var {:sourceloc "buggy_16.sol", 117, 2} {:message "_vtime"} _vtime#395: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#395 := __block_timestamp;
	if (((startTime#391 + 432000) == _vtime#395)) {
	winner_tmstmp3#389 := winner_tmstmp3#389[__this := __msg_sender];
	}

	$return13:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address payable)
procedure {:sourceloc "buggy_16.sol", 133, 5} {:message "Owned::transferOwnership"} transferOwnership#454(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#430: address_t)
{
	var call_arg#2: address_t;
	var call_arg#3: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#364[__this]);
	// Function body starts here
	assume (newOwner#430 != 0);
	call_arg#2 := owner#364[__this];
	call_arg#3 := newOwner#430;
	assume {:sourceloc "buggy_16.sol", 135, 14} {:message ""} true;
	call OwnershipTransferred#374(__this, __msg_sender, __msg_value, call_arg#2, call_arg#3);
	owner#364 := owner#364[__this := newOwner#430];
	$return15:
	// Function body ends here
	$return14:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 138, 1} {:message "Owned::bug_tmstmp9"} bug_tmstmp9#465(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#457: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#457 := (__block_timestamp >= 1546300800);
	goto $return16;
	$return16:
	// Function body ends here
}

// 
// ------- Contract: ExclusivePlatform -------
// Inherits from: ERC20Interface
// Inherits from: Owned
// 
// Event: TransferEther
procedure {:inline 1} {:sourceloc "buggy_16.sol", 451, 3} {:message "[event] ExclusivePlatform::TransferEther"} TransferEther#1921(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1915: address_t, _to#1917: address_t, _value#1919: int)
{
	
}

// 
// Event: NewPrice
procedure {:inline 1} {:sourceloc "buggy_16.sol", 453, 3} {:message "[event] ExclusivePlatform::NewPrice"} NewPrice#1933(__this: address_t, __msg_sender: address_t, __msg_value: int, _changer#1927: address_t, _lastPrice#1929: int, _newPrice#1931: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_16.sol", 455, 3} {:message "[event] ExclusivePlatform::Burn"} Burn#1943(__this: address_t, __msg_sender: address_t, __msg_value: int, _burner#1939: address_t, value#1941: int)
{
	
}

// Using library SafeMath for uint256
// 
// Function: bug_tmstmp24 : function ()
procedure {:sourceloc "buggy_16.sol", 148, 3} {:message "ExclusivePlatform::bug_tmstmp24"} bug_tmstmp24#520(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 149, 2} {:message "pastBlockTime_tmstmp24"} pastBlockTime_tmstmp24#477: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp24#477 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp24#477);
	pastBlockTime_tmstmp24#477 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 154, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return17:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_16.sol", 157, 3} {:message "balances"} balances#524: [address_t][address_t]int;
// 
// Function: bug_tmstmp5 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 158, 3} {:message "ExclusivePlatform::bug_tmstmp5"} bug_tmstmp5#535(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#527: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#527 := (__block_timestamp >= 1546300800);
	goto $return18;
	$return18:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_16.sol", 161, 3} {:message "allowed"} allowed#541: [address_t][address_t][address_t]int;
// 
// State variable: winner_tmstmp15: address
var {:sourceloc "buggy_16.sol", 163, 3} {:message "winner_tmstmp15"} winner_tmstmp15#543: [address_t]address_t;
// 
// Function: play_tmstmp15 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 164, 1} {:message "ExclusivePlatform::play_tmstmp15"} play_tmstmp15#569(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#545: int)
{
	var {:sourceloc "buggy_16.sol", 165, 2} {:message "_vtime"} _vtime#549: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#549 := __block_timestamp;
	if (((startTime#545 + 432000) == _vtime#549)) {
	winner_tmstmp15#543 := winner_tmstmp15#543[__this := __msg_sender];
	}

	$return19:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_16.sol", 168, 3} {:message "name"} name#572: [address_t]int_arr_type;
// 
// Function: bug_tmstmp28 : function ()
procedure {:sourceloc "buggy_16.sol", 169, 3} {:message "ExclusivePlatform::bug_tmstmp28"} bug_tmstmp28#619(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 170, 2} {:message "pastBlockTime_tmstmp28"} pastBlockTime_tmstmp28#576: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp28#576 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp28#576);
	pastBlockTime_tmstmp28#576 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 175, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return20:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_16.sol", 178, 3} {:message "symbol"} symbol#622: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp34: address
var {:sourceloc "buggy_16.sol", 179, 3} {:message "winner_tmstmp34"} winner_tmstmp34#624: [address_t]address_t;
// 
// Function: play_tmstmp34 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 180, 1} {:message "ExclusivePlatform::play_tmstmp34"} play_tmstmp34#646(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#626: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#626 + 432000) == __block_timestamp)) {
	winner_tmstmp34#624 := winner_tmstmp34#624[__this := __msg_sender];
	}

	$return21:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_16.sol", 183, 3} {:message "decimals"} decimals#649: [address_t]int;
// 
// Function: bug_tmstmp21 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 184, 3} {:message "ExclusivePlatform::bug_tmstmp21"} bug_tmstmp21#660(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#652: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#652 := (__block_timestamp >= 1546300800);
	goto $return22;
	$return22:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_16.sol", 187, 3} {:message "_totalSupply"} _totalSupply#662: [address_t]int;
// 
// State variable: winner_tmstmp10: address
var {:sourceloc "buggy_16.sol", 189, 3} {:message "winner_tmstmp10"} winner_tmstmp10#664: [address_t]address_t;
// 
// Function: play_tmstmp10 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 190, 1} {:message "ExclusivePlatform::play_tmstmp10"} play_tmstmp10#686(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#666: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#666 + 432000) == __block_timestamp)) {
	winner_tmstmp10#664 := winner_tmstmp10#664[__this := __msg_sender];
	}

	$return23:
	// Function body ends here
}

// 
// State variable: XPLPerEther: uint256
var {:sourceloc "buggy_16.sol", 193, 3} {:message "XPLPerEther"} XPLPerEther#689: [address_t]int;
// 
// State variable: minimumBuy: uint256
var {:sourceloc "buggy_16.sol", 194, 5} {:message "minimumBuy"} minimumBuy#694: [address_t]int;
// 
// State variable: winner_tmstmp22: address
var {:sourceloc "buggy_16.sol", 195, 3} {:message "winner_tmstmp22"} winner_tmstmp22#696: [address_t]address_t;
// 
// Function: play_tmstmp22 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 196, 1} {:message "ExclusivePlatform::play_tmstmp22"} play_tmstmp22#718(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#698: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#698 + 432000) == __block_timestamp)) {
	winner_tmstmp22#696 := winner_tmstmp22#696[__this := __msg_sender];
	}

	$return24:
	// Function body ends here
}

// 
// State variable: crowdsaleIsOn: bool
var {:sourceloc "buggy_16.sol", 199, 3} {:message "crowdsaleIsOn"} crowdsaleIsOn#721: [address_t]bool;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 208, 5} {:message "ExclusivePlatform::[constructor]"} __constructor#1944(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: address_t;
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances#524 := balances#524[__this := default_address_t_int()];
	allowed#541 := allowed#541[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp15#543 := winner_tmstmp15#543[__this := 0];
	name#572 := name#572[__this := int_arr#constr(default_int_int()[0 := 69][1 := 120][2 := 99][3 := 108][4 := 117][5 := 115][6 := 105][7 := 118][8 := 101][9 := 32][10 := 80][11 := 108][12 := 97][13 := 116][14 := 102][15 := 111][16 := 114][17 := 109], 18)];
	symbol#622 := symbol#622[__this := int_arr#constr(default_int_int()[0 := 88][1 := 80][2 := 76], 3)];
	winner_tmstmp34#624 := winner_tmstmp34#624[__this := 0];
	decimals#649 := decimals#649[__this := 8];
	_totalSupply#662 := _totalSupply#662[__this := 0];
	winner_tmstmp10#664 := winner_tmstmp10#664[__this := 0];
	XPLPerEther#689 := XPLPerEther#689[__this := 800000000000000];
	minimumBuy#694 := minimumBuy#694[__this := 10000000000000000];
	winner_tmstmp22#696 := winner_tmstmp22#696[__this := 0];
	crowdsaleIsOn#721 := crowdsaleIsOn#721[__this := true];
	winner_tmstmp19#782 := winner_tmstmp19#782[__this := 0];
	winner_tmstmp26#828 := winner_tmstmp26#828[__this := 0];
	winner_tmstmp38#1043 := winner_tmstmp38#1043[__this := 0];
	winner_tmstmp7#1183 := winner_tmstmp7#1183[__this := 0];
	winner_tmstmp23#1268 := winner_tmstmp23#1268[__this := 0];
	winner_tmstmp14#1309 := winner_tmstmp14#1309[__this := 0];
	winner_tmstmp30#1353 := winner_tmstmp30#1353[__this := 0];
	winner_tmstmp39#1520 := winner_tmstmp39#1520[__this := 0];
	winner_tmstmp35#1647 := winner_tmstmp35#1647[__this := 0];
	winner_tmstmp27#1823 := winner_tmstmp27#1823[__this := 0];
	winner_tmstmp31#1883 := winner_tmstmp31#1883[__this := 0];
	bugv_tmstmp2#1913 := bugv_tmstmp2#1913[__this := __block_timestamp];
	bugv_tmstmp3#1925 := bugv_tmstmp3#1925[__this := __block_timestamp];
	bugv_tmstmp4#1937 := bugv_tmstmp4#1937[__this := __block_timestamp];
	owner#364 := owner#364[__this := 0];
	bugv_tmstmp1#368 := bugv_tmstmp1#368[__this := __block_timestamp];
	winner_tmstmp3#389 := winner_tmstmp3#389[__this := 0];
	winner_tmstmp11#162 := winner_tmstmp11#162[__this := 0];
	winner_tmstmp2#219 := winner_tmstmp2#219[__this := 0];
	bugv_tmstmp5#306 := bugv_tmstmp5#306[__this := __block_timestamp];
	// Arguments for Owned
	// Inlined constructor for Owned starts here
	// Function body starts here
	owner#364 := owner#364[__this := __msg_sender];
	$return25:
	// Function body ends here
	// Inlined constructor for Owned ends here
	// Function body starts here
	_totalSupply#662 := _totalSupply#662[__this := 1000000000000000000];
	balances#524 := balances#524[__this := balances#524[__this][owner#364[__this] := _totalSupply#662[__this]]];
	call_arg#5 := 0;
	call_arg#6 := owner#364[__this];
	assume {:sourceloc "buggy_16.sol", 211, 14} {:message ""} true;
	call Transfer#302(__this, __msg_sender, __msg_value, call_arg#5, call_arg#6, _totalSupply#662[__this]);
	$return26:
	// Function body ends here
}

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 213, 1} {:message "ExclusivePlatform::bug_tmstmp25"} bug_tmstmp25#771(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#763: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#763 := (__block_timestamp >= 1546300800);
	goto $return27;
	$return27:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 217, 5} {:message "ExclusivePlatform::totalSupply"} totalSupply#780(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#775: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#775 := _totalSupply#662[__this];
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_16.sol", 220, 1} {:message "winner_tmstmp19"} winner_tmstmp19#782: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 221, 1} {:message "ExclusivePlatform::play_tmstmp19"} play_tmstmp19#808(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#784: int)
{
	var {:sourceloc "buggy_16.sol", 222, 2} {:message "_vtime"} _vtime#788: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#788 := __block_timestamp;
	if (((startTime#784 + 432000) == _vtime#788)) {
	winner_tmstmp19#782 := winner_tmstmp19#782[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// Function: updateXPLPerEther : function (uint256)
procedure {:sourceloc "buggy_16.sol", 226, 5} {:message "ExclusivePlatform::updateXPLPerEther"} updateXPLPerEther#826(__this: address_t, __msg_sender: address_t, __msg_value: int, _XPLPerEther#810: int)
{
	var call_arg#9: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#364[__this]);
	// Function body starts here
	call_arg#9 := owner#364[__this];
	assume {:sourceloc "buggy_16.sol", 227, 14} {:message ""} true;
	call NewPrice#1933(__this, __msg_sender, __msg_value, call_arg#9, XPLPerEther#689[__this], _XPLPerEther#810);
	XPLPerEther#689 := XPLPerEther#689[__this := _XPLPerEther#810];
	$return31:
	// Function body ends here
	$return30:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_16.sol", 230, 1} {:message "winner_tmstmp26"} winner_tmstmp26#828: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 231, 1} {:message "ExclusivePlatform::play_tmstmp26"} play_tmstmp26#850(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#830: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#830 + 432000) == __block_timestamp)) {
	winner_tmstmp26#828 := winner_tmstmp26#828[__this := __msg_sender];
	}

	$return32:
	// Function body ends here
}

// 
// Function: switchCrowdsale : function ()
procedure {:sourceloc "buggy_16.sol", 235, 5} {:message "ExclusivePlatform::switchCrowdsale"} switchCrowdsale#862(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#364[__this]);
	// Function body starts here
	crowdsaleIsOn#721 := crowdsaleIsOn#721[__this := !(crowdsaleIsOn#721[__this])];
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_16.sol", 238, 1} {:message "ExclusivePlatform::bug_tmstmp20"} bug_tmstmp20#909(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 239, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#866: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#866 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#866);
	pastBlockTime_tmstmp20#866 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 244, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return35:
	// Function body ends here
}

// 
// Function: getBonus : function (uint256) view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 248, 5} {:message "ExclusivePlatform::getBonus"} getBonus#956(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#911: int)
	returns (#914: int)
{
	var call_arg#12: int;
	var mul#31_ret#13: int;
	var call_arg#14: int;
	var div#54_ret#15: int;
	var add#100_ret#16: int;
	var call_arg#17: int;
	var div#54_ret#18: int;
	var add#100_ret#19: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#12 := 5;
	assume {:sourceloc "buggy_16.sol", 249, 24} {:message ""} true;
	call mul#31_ret#13 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#689[__this], call_arg#12);
	if ((_amount#911 >= mul#31_ret#13)) {
	call_arg#14 := 100;
	assume {:sourceloc "buggy_16.sol", 253, 21} {:message ""} true;
	call div#54_ret#15 := div#54(__this, __msg_sender, __msg_value, (20 * _amount#911), call_arg#14);
	assume {:sourceloc "buggy_16.sol", 253, 20} {:message ""} true;
	call add#100_ret#16 := add#100(__this, __msg_sender, __msg_value, div#54_ret#15, _amount#911);
	#914 := add#100_ret#16;
	goto $return36;
	}
	else {
	if ((_amount#911 >= XPLPerEther#689[__this])) {
	call_arg#17 := 100;
	assume {:sourceloc "buggy_16.sol", 258, 21} {:message ""} true;
	call div#54_ret#18 := div#54(__this, __msg_sender, __msg_value, (5 * _amount#911), call_arg#17);
	assume {:sourceloc "buggy_16.sol", 258, 20} {:message ""} true;
	call add#100_ret#19 := add#100(__this, __msg_sender, __msg_value, div#54_ret#18, _amount#911);
	#914 := add#100_ret#19;
	goto $return36;
	}

	}

	#914 := _amount#911;
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_16.sol", 262, 1} {:message "ExclusivePlatform::bug_tmstmp32"} bug_tmstmp32#1003(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 263, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#960: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#960 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#960);
	pastBlockTime_tmstmp32#960 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 268, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return37:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_16.sol", 272, 5} {:message "ExclusivePlatform::[receive]"} #1041(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 275, 9} {:message "totalBuy"} totalBuy#1016: int;
	var mul#31_ret#20: int;
	var call_arg#21: int;
	var div#54_ret#22: int;
	var getBonus#956_ret#23: int;
	var call_arg#24: address_t;
	var call_arg#25: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (crowdsaleIsOn#721[__this] && (__msg_value >= minimumBuy#694[__this]));
	assume {:sourceloc "buggy_16.sol", 275, 30} {:message ""} true;
	call mul#31_ret#20 := mul#31(__this, __msg_sender, __msg_value, XPLPerEther#689[__this], __msg_value);
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_16.sol", 275, 29} {:message ""} true;
	call div#54_ret#22 := div#54(__this, __msg_sender, __msg_value, mul#31_ret#20, call_arg#21);
	totalBuy#1016 := div#54_ret#22;
	assume {:sourceloc "buggy_16.sol", 276, 20} {:message ""} true;
	call getBonus#956_ret#23 := getBonus#956(__this, __msg_sender, __msg_value, totalBuy#1016);
	totalBuy#1016 := getBonus#956_ret#23;
	call_arg#24 := owner#364[__this];
	call_arg#25 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 278, 9} {:message ""} true;
	call doTransfer#1266(__this, __msg_sender, __msg_value, call_arg#24, call_arg#25, totalBuy#1016);
	$return38:
	// Function body ends here
}

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_16.sol", 280, 1} {:message "winner_tmstmp38"} winner_tmstmp38#1043: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 281, 1} {:message "ExclusivePlatform::play_tmstmp38"} play_tmstmp38#1065(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1045: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1045 + 432000) == __block_timestamp)) {
	winner_tmstmp38#1043 := winner_tmstmp38#1043[__this := __msg_sender];
	}

	$return39:
	// Function body ends here
}

type address_t_arr_ptr = int;
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var mem_arr_address_t: [address_t_arr_ptr]address_t_arr_type;
// 
// Function: distribute
procedure {:sourceloc "buggy_16.sol", 285, 5} {:message "ExclusivePlatform::distribute"} distribute#1094(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#1068: address_t_arr_ptr, _amount#1070: int)
{
	var {:sourceloc "buggy_16.sol", 286, 14} {:message "i"} i#1074: int;
	var transfer#1351_ret#28: bool;
	var tmp#29: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// The following while loop was mapped from a for loop
	// Initialization
	i#1074 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1068])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1068]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1074 < length#address_t_arr#constr(mem_arr_address_t[_addresses#1068]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 286, 55} {:message ""} true;
	call transfer#1351_ret#28 := transfer#1351(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#1068])[i#1074], _amount#1070);
	$continue26:
	// Loop expression
	tmp#29 := i#1074;
	i#1074 := (i#1074 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1068])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1068]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break27:
	$return40:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_16.sol", 288, 1} {:message "ExclusivePlatform::bug_tmstmp4"} bug_tmstmp4#1141(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 289, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#1098: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#1098 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#1098);
	pastBlockTime_tmstmp4#1098 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 294, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return41:
	// Function body ends here
}

type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: distributeWithAmount
procedure {:sourceloc "buggy_16.sol", 298, 5} {:message "ExclusivePlatform::distributeWithAmount"} distributeWithAmount#1181(__this: address_t, __msg_sender: address_t, __msg_value: int, _addresses#1144: address_t_arr_ptr, _amounts#1147: int_arr_ptr)
{
	var {:sourceloc "buggy_16.sol", 300, 14} {:message "i"} i#1159: int;
	var transfer#1351_ret#32: bool;
	var tmp#33: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1144])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1144]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume ((0 <= length#int_arr#constr(mem_arr_int[_amounts#1147])) && (length#int_arr#constr(mem_arr_int[_amounts#1147]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#address_t_arr#constr(mem_arr_address_t[_addresses#1144]) == length#int_arr#constr(mem_arr_int[_amounts#1147]));
	// The following while loop was mapped from a for loop
	// Initialization
	i#1159 := 0;
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1144])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1144]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1159 < length#address_t_arr#constr(mem_arr_address_t[_addresses#1144]))) {
	// Body
	assume {:sourceloc "buggy_16.sol", 300, 55} {:message ""} true;
	call transfer#1351_ret#32 := transfer#1351(__this, __msg_sender, __msg_value, arr#address_t_arr#constr(mem_arr_address_t[_addresses#1144])[i#1159], arr#int_arr#constr(mem_arr_int[_amounts#1147])[i#1159]);
	$continue30:
	// Loop expression
	tmp#33 := i#1159;
	i#1159 := (i#1159 + 1);
	assume ((0 <= length#address_t_arr#constr(mem_arr_address_t[_addresses#1144])) && (length#address_t_arr#constr(mem_arr_address_t[_addresses#1144]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break31:
	$return42:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_16.sol", 302, 1} {:message "winner_tmstmp7"} winner_tmstmp7#1183: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 303, 1} {:message "ExclusivePlatform::play_tmstmp7"} play_tmstmp7#1209(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1185: int)
{
	var {:sourceloc "buggy_16.sol", 304, 2} {:message "_vtime"} _vtime#1189: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1189 := __block_timestamp;
	if (((startTime#1185 + 432000) == _vtime#1189)) {
	winner_tmstmp7#1183 := winner_tmstmp7#1183[__this := __msg_sender];
	}

	$return43:
	// Function body ends here
}

// 
// Function: doTransfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_16.sol", 312, 5} {:message "ExclusivePlatform::doTransfer"} doTransfer#1266(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1212: address_t, _to#1214: address_t, _amount#1216: int)
{
	var sub#77_ret#34: int;
	var add#100_ret#35: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1214 != 0);
	assume (_amount#1216 <= balances#524[__this][_from#1212]);
	assume {:sourceloc "buggy_16.sol", 316, 27} {:message ""} true;
	call sub#77_ret#34 := sub#77(__this, __msg_sender, __msg_value, balances#524[__this][_from#1212], _amount#1216);
	balances#524 := balances#524[__this := balances#524[__this][_from#1212 := sub#77_ret#34]];
	assume {:sourceloc "buggy_16.sol", 317, 25} {:message ""} true;
	call add#100_ret#35 := add#100(__this, __msg_sender, __msg_value, balances#524[__this][_to#1214], _amount#1216);
	balances#524 := balances#524[__this := balances#524[__this][_to#1214 := add#100_ret#35]];
	assume {:sourceloc "buggy_16.sol", 318, 14} {:message ""} true;
	call Transfer#302(__this, __msg_sender, __msg_value, _from#1212, _to#1214, _amount#1216);
	$return44:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_16.sol", 320, 1} {:message "winner_tmstmp23"} winner_tmstmp23#1268: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 321, 1} {:message "ExclusivePlatform::play_tmstmp23"} play_tmstmp23#1294(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1270: int)
{
	var {:sourceloc "buggy_16.sol", 322, 2} {:message "_vtime"} _vtime#1274: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1274 := __block_timestamp;
	if (((startTime#1270 + 432000) == _vtime#1274)) {
	winner_tmstmp23#1268 := winner_tmstmp23#1268[__this := __msg_sender];
	}

	$return45:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 326, 5} {:message "ExclusivePlatform::balanceOf"} balanceOf#1307(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#1296: address_t)
	returns (#1300: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1300 := balances#524[__this][_owner#1296];
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_16.sol", 329, 1} {:message "winner_tmstmp14"} winner_tmstmp14#1309: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 330, 1} {:message "ExclusivePlatform::play_tmstmp14"} play_tmstmp14#1331(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1311: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1311 + 432000) == __block_timestamp)) {
	winner_tmstmp14#1309 := winner_tmstmp14#1309[__this := __msg_sender];
	}

	$return47:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 334, 5} {:message "ExclusivePlatform::transfer"} transfer#1351(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1333: address_t, _amount#1335: int)
	returns (success#1339: bool)
{
	var call_arg#36: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#36 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 335, 9} {:message ""} true;
	call doTransfer#1266(__this, __msg_sender, __msg_value, call_arg#36, _to#1333, _amount#1335);
	success#1339 := true;
	goto $return48;
	$return48:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_16.sol", 338, 1} {:message "winner_tmstmp30"} winner_tmstmp30#1353: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 339, 1} {:message "ExclusivePlatform::play_tmstmp30"} play_tmstmp30#1375(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1355: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1355 + 432000) == __block_timestamp)) {
	winner_tmstmp30#1353 := winner_tmstmp30#1353[__this := __msg_sender];
	}

	$return49:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 342, 5} {:message "ExclusivePlatform::transferFrom"} transferFrom#1424(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1377: address_t, _to#1379: address_t, _amount#1381: int)
	returns (success#1385: bool)
{
	var sub#77_ret#37: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#541[__this][_from#1377][__msg_sender] >= _amount#1381);
	assume {:sourceloc "buggy_16.sol", 344, 38} {:message ""} true;
	call sub#77_ret#37 := sub#77(__this, __msg_sender, __msg_value, allowed#541[__this][_from#1377][__msg_sender], _amount#1381);
	allowed#541 := allowed#541[__this := allowed#541[__this][_from#1377 := allowed#541[__this][_from#1377][__msg_sender := sub#77_ret#37]]];
	assume {:sourceloc "buggy_16.sol", 345, 9} {:message ""} true;
	call doTransfer#1266(__this, __msg_sender, __msg_value, _from#1377, _to#1379, _amount#1381);
	success#1385 := true;
	goto $return50;
	$return50:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_16.sol", 348, 1} {:message "ExclusivePlatform::bug_tmstmp8"} bug_tmstmp8#1471(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 349, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#1428: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#1428 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#1428);
	pastBlockTime_tmstmp8#1428 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 354, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return51:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_16.sol", 362, 5} {:message "ExclusivePlatform::approve"} approve#1518(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#1474: address_t, _amount#1476: int)
	returns (success#1480: bool)
{
	var call_arg#38: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((_amount#1476 == 0) || (allowed#541[__this][__msg_sender][_spender#1474] == 0));
	allowed#541 := allowed#541[__this := allowed#541[__this][__msg_sender := allowed#541[__this][__msg_sender][_spender#1474 := _amount#1476]]];
	call_arg#38 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 369, 14} {:message ""} true;
	call Approval#314(__this, __msg_sender, __msg_value, call_arg#38, _spender#1474, _amount#1476);
	success#1480 := true;
	goto $return52;
	$return52:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_16.sol", 372, 1} {:message "winner_tmstmp39"} winner_tmstmp39#1520: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 373, 1} {:message "ExclusivePlatform::play_tmstmp39"} play_tmstmp39#1546(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1522: int)
{
	var {:sourceloc "buggy_16.sol", 374, 2} {:message "_vtime"} _vtime#1526: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1526 := __block_timestamp;
	if (((startTime#1522 + 432000) == _vtime#1526)) {
	winner_tmstmp39#1520 := winner_tmstmp39#1520[__this := __msg_sender];
	}

	$return53:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 378, 5} {:message "ExclusivePlatform::allowance"} allowance#1563(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#1548: address_t, _spender#1550: address_t)
	returns (#1554: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1554 := allowed#541[__this][_owner#1548][_spender#1550];
	goto $return54;
	$return54:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_16.sol", 381, 1} {:message "ExclusivePlatform::bug_tmstmp36"} bug_tmstmp36#1610(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 382, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#1567: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#1567 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#1567);
	pastBlockTime_tmstmp36#1567 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 387, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return55:
	// Function body ends here
}

// 
// Function: transferEther : function (address payable,uint256)
procedure {:sourceloc "buggy_16.sol", 391, 5} {:message "ExclusivePlatform::transferEther"} transferEther#1645(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#1612: address_t, _amount#1614: int)
{
	var call_arg#41: address_t;
	var call_arg#42: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#364[__this]);
	// Function body starts here
	assume (_amount#1614 <= __balance[__this]);
	call_arg#41 := __this;
	call_arg#42 := _receiver#1612;
	assume {:sourceloc "buggy_16.sol", 393, 14} {:message ""} true;
	call TransferEther#1921(__this, __msg_sender, __msg_value, call_arg#41, call_arg#42, _amount#1614);
	assume {:sourceloc "buggy_16.sol", 394, 9} {:message ""} true;
	call __transfer(_receiver#1612, __this, 0, _amount#1614);
	$return57:
	// Function body ends here
	$return56:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_16.sol", 396, 1} {:message "winner_tmstmp35"} winner_tmstmp35#1647: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 397, 1} {:message "ExclusivePlatform::play_tmstmp35"} play_tmstmp35#1673(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1649: int)
{
	var {:sourceloc "buggy_16.sol", 398, 2} {:message "_vtime"} _vtime#1653: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1653 := __block_timestamp;
	if (((startTime#1649 + 432000) == _vtime#1653)) {
	winner_tmstmp35#1647 := winner_tmstmp35#1647[__this := __msg_sender];
	}

	$return58:
	// Function body ends here
}

// 
// Function: withdrawFund : function ()
procedure {:sourceloc "buggy_16.sol", 402, 5} {:message "ExclusivePlatform::withdrawFund"} withdrawFund#1693(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 403, 9} {:message "balance"} balance#1679#44: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#364[__this]);
	// Function body starts here
	balance#1679#44 := __balance[__this];
	assume {:sourceloc "buggy_16.sol", 404, 9} {:message ""} true;
	call __transfer(owner#364[__this], __this, 0, balance#1679#44);
	$return60:
	// Function body ends here
	$return59:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_16.sol", 406, 1} {:message "ExclusivePlatform::bug_tmstmp40"} bug_tmstmp40#1740(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_16.sol", 407, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1697: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1697 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1697);
	pastBlockTime_tmstmp40#1697 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_16.sol", 412, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return61:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_16.sol", 416, 5} {:message "ExclusivePlatform::burn"} burn#1785(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#1742: int)
{
	var {:sourceloc "buggy_16.sol", 418, 9} {:message "burner"} burner#1757#46: address_t;
	var sub#77_ret#47: int;
	var sub#77_ret#48: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#364[__this]);
	// Function body starts here
	assume (_value#1742 <= balances#524[__this][__msg_sender]);
	burner#1757#46 := __msg_sender;
	assume {:sourceloc "buggy_16.sol", 419, 28} {:message ""} true;
	call sub#77_ret#47 := sub#77(__this, __msg_sender, __msg_value, balances#524[__this][burner#1757#46], _value#1742);
	balances#524 := balances#524[__this := balances#524[__this][burner#1757#46 := sub#77_ret#47]];
	assume {:sourceloc "buggy_16.sol", 420, 24} {:message ""} true;
	call sub#77_ret#48 := sub#77(__this, __msg_sender, __msg_value, _totalSupply#662[__this], _value#1742);
	_totalSupply#662 := _totalSupply#662[__this := sub#77_ret#48];
	assume {:sourceloc "buggy_16.sol", 421, 14} {:message ""} true;
	call Burn#1943(__this, __msg_sender, __msg_value, burner#1757#46, _value#1742);
	$return63:
	// Function body ends here
	$return62:
	// Inlined modifier onlyOwner ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_16.sol", 423, 1} {:message "ExclusivePlatform::bug_tmstmp33"} bug_tmstmp33#1796(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1788: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1788 := (__block_timestamp >= 1546300800);
	goto $return64;
	$return64:
	// Function body ends here
}

// 
// Function: getForeignTokenBalance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_16.sol", 428, 5} {:message "ExclusivePlatform::getForeignTokenBalance"} getForeignTokenBalance#1821(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1798: address_t, who#1800: address_t)
	returns (#1803: int)
{
	var {:sourceloc "buggy_16.sol", 429, 9} {:message "token"} token#1806: address_t;
	var {:sourceloc "buggy_16.sol", 430, 9} {:message "bal"} bal#1812: int;
	var balanceOf#160_ret#49: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	token#1806 := tokenAddress#1798;
	assume {:sourceloc "buggy_16.sol", 430, 20} {:message ""} true;
	call balanceOf#160_ret#49 := balanceOf#160(token#1806, __this, 0, who#1800);
	bal#1812 := balanceOf#160_ret#49;
	#1803 := bal#1812;
	goto $return65;
	$return65:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_16.sol", 433, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1823: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 434, 1} {:message "ExclusivePlatform::play_tmstmp27"} play_tmstmp27#1849(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1825: int)
{
	var {:sourceloc "buggy_16.sol", 435, 2} {:message "_vtime"} _vtime#1829: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1829 := __block_timestamp;
	if (((startTime#1825 + 432000) == _vtime#1829)) {
	winner_tmstmp27#1823 := winner_tmstmp27#1823[__this := __msg_sender];
	}

	$return66:
	// Function body ends here
}

// 
// Function: withdrawForeignTokens : function (address) returns (bool)
procedure {:sourceloc "buggy_16.sol", 439, 5} {:message "ExclusivePlatform::withdrawForeignTokens"} withdrawForeignTokens#1881(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenAddress#1851: address_t)
	returns (#1856: bool)
{
	var {:sourceloc "buggy_16.sol", 440, 9} {:message "token"} token#1859#51: address_t;
	var {:sourceloc "buggy_16.sol", 441, 9} {:message "amount"} amount#1865#51: int;
	var call_arg#52: address_t;
	var balanceOf#160_ret#53: int;
	var call_arg#54: address_t;
	var transfer#217_ret#55: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#364[__this]);
	// Function body starts here
	token#1859#51 := tokenAddress#1851;
	call_arg#52 := __this;
	assume {:sourceloc "buggy_16.sol", 441, 26} {:message ""} true;
	call balanceOf#160_ret#53 := balanceOf#160(token#1859#51, __this, 0, call_arg#52);
	amount#1865#51 := balanceOf#160_ret#53;
	call_arg#54 := owner#364[__this];
	assume {:sourceloc "buggy_16.sol", 442, 16} {:message ""} true;
	call transfer#217_ret#55 := transfer#217(token#1859#51, __this, 0, call_arg#54, amount#1865#51);
	#1856 := transfer#217_ret#55;
	goto $return68;
	$return68:
	// Function body ends here
	$return67:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_16.sol", 444, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1883: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_16.sol", 445, 1} {:message "ExclusivePlatform::play_tmstmp31"} play_tmstmp31#1909(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1885: int)
{
	var {:sourceloc "buggy_16.sol", 446, 2} {:message "_vtime"} _vtime#1889: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1889 := __block_timestamp;
	if (((startTime#1885 + 432000) == _vtime#1889)) {
	winner_tmstmp31#1883 := winner_tmstmp31#1883[__this := __msg_sender];
	}

	$return69:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_16.sol", 450, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#1913: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_16.sol", 452, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#1925: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_16.sol", 454, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#1937: [address_t]int;
