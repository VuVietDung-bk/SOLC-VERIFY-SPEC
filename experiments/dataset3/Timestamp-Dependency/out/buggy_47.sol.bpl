// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_47.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: ERC20Interface -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_47.sol", 55, 5} {:message "[event] ERC20Interface::Transfer"} Transfer#240(__this: address_t, __msg_sender: address_t, __msg_value: int, from#234: address_t, to#236: address_t, tokens#238: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_47.sol", 56, 5} {:message "[event] ERC20Interface::Approval"} Approval#248(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#242: address_t, spender#244: address_t, tokens#246: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_47.sol", 12, 3} {:message "ERC20Interface::totalSupply"} totalSupply#6(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#4: int);
	modifies winner_tmstmp19#26, winner_tmstmp26#63, winner_tmstmp38#210;

// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 13, 1} {:message "ERC20Interface::bug_tmstmp25"} bug_tmstmp25#17(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#9: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#9 := (__block_timestamp >= 1546300800);
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: balanceOf
procedure {:sourceloc "buggy_47.sol", 16, 5} {:message "ERC20Interface::balanceOf"} balanceOf#24(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#19: address_t)
	returns (balance#22: int);
	modifies winner_tmstmp19#26, winner_tmstmp26#63, winner_tmstmp38#210;

// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_47.sol", 17, 1} {:message "winner_tmstmp19"} winner_tmstmp19#26: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 18, 1} {:message "ERC20Interface::play_tmstmp19"} play_tmstmp19#52(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#28: int)
{
	var {:sourceloc "buggy_47.sol", 19, 2} {:message "_vtime"} _vtime#32: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#32 := __block_timestamp;
	if (((startTime#28 + 432000) == _vtime#32)) {
	winner_tmstmp19#26 := winner_tmstmp19#26[__this := __msg_sender];
	}

	$return1:
	// Function body ends here
}

// 
// Function: transfer
procedure {:sourceloc "buggy_47.sol", 22, 5} {:message "ERC20Interface::transfer"} transfer#61(__this: address_t, __msg_sender: address_t, __msg_value: int, to#54: address_t, tokens#56: int)
	returns (success#59: bool);
	modifies winner_tmstmp19#26, winner_tmstmp26#63, winner_tmstmp38#210;

// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_47.sol", 23, 1} {:message "winner_tmstmp26"} winner_tmstmp26#63: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 24, 1} {:message "ERC20Interface::play_tmstmp26"} play_tmstmp26#85(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#65: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#65 + 432000) == __block_timestamp)) {
	winner_tmstmp26#63 := winner_tmstmp26#63[__this := __msg_sender];
	}

	$return2:
	// Function body ends here
}

// 
// Function: allowance
procedure {:sourceloc "buggy_47.sol", 29, 5} {:message "ERC20Interface::allowance"} allowance#94(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#87: address_t, spender#89: address_t)
	returns (remaining#92: int);
	modifies winner_tmstmp19#26, winner_tmstmp26#63, winner_tmstmp38#210;

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_47.sol", 30, 1} {:message "ERC20Interface::bug_tmstmp20"} bug_tmstmp20#141(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 31, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#98: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#98 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#98);
	pastBlockTime_tmstmp20#98 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 36, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return3:
	// Function body ends here
}

// 
// Function: approve
procedure {:sourceloc "buggy_47.sol", 39, 5} {:message "ERC20Interface::approve"} approve#150(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#143: address_t, tokens#145: int)
	returns (success#148: bool);
	modifies winner_tmstmp19#26, winner_tmstmp26#63, winner_tmstmp38#210;

// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_47.sol", 40, 1} {:message "ERC20Interface::bug_tmstmp32"} bug_tmstmp32#197(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 41, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#154: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#154 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#154);
	pastBlockTime_tmstmp32#154 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 46, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return4:
	// Function body ends here
}

// 
// Function: transferFrom
procedure {:sourceloc "buggy_47.sol", 49, 5} {:message "ERC20Interface::transferFrom"} transferFrom#208(__this: address_t, __msg_sender: address_t, __msg_value: int, from#199: address_t, to#201: address_t, tokens#203: int)
	returns (success#206: bool);
	modifies winner_tmstmp19#26, winner_tmstmp26#63, winner_tmstmp38#210;

// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_47.sol", 50, 1} {:message "winner_tmstmp38"} winner_tmstmp38#210: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 51, 1} {:message "ERC20Interface::play_tmstmp38"} play_tmstmp38#232(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#212: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#212 + 432000) == __block_timestamp)) {
	winner_tmstmp38#210 := winner_tmstmp38#210[__this := __msg_sender];
	}

	$return5:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_47.sol", 11, 1} {:message "ERC20Interface::[implicit_constructor]"} __constructor#249(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	winner_tmstmp19#26 := winner_tmstmp19#26[__this := 0];
	winner_tmstmp26#63 := winner_tmstmp26#63[__this := 0];
	winner_tmstmp38#210 := winner_tmstmp38#210[__this := 0];
}

// 
// ------- Contract: AcunarToken -------
// Inherits from: ERC20Interface
// 
// Function: bug_tmstmp24 : function ()
procedure {:sourceloc "buggy_47.sol", 60, 3} {:message "AcunarToken::bug_tmstmp24"} bug_tmstmp24#298(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 61, 2} {:message "pastBlockTime_tmstmp24"} pastBlockTime_tmstmp24#255: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp24#255 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp24#255);
	pastBlockTime_tmstmp24#255 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 66, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return6:
	// Function body ends here
}

// 
// State variable: name: string storage ref
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var {:sourceloc "buggy_47.sol", 69, 3} {:message "name"} name#301: [address_t]int_arr_type;
// 
// Function: bug_tmstmp5 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 70, 3} {:message "AcunarToken::bug_tmstmp5"} bug_tmstmp5#312(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#304: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#304 := (__block_timestamp >= 1546300800);
	goto $return7;
	$return7:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_47.sol", 73, 3} {:message "symbol"} symbol#315: [address_t]int_arr_type;
// 
// State variable: winner_tmstmp15: address
var {:sourceloc "buggy_47.sol", 74, 3} {:message "winner_tmstmp15"} winner_tmstmp15#317: [address_t]address_t;
// 
// Function: play_tmstmp15 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 75, 1} {:message "AcunarToken::play_tmstmp15"} play_tmstmp15#343(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#319: int)
{
	var {:sourceloc "buggy_47.sol", 76, 2} {:message "_vtime"} _vtime#323: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#323 := __block_timestamp;
	if (((startTime#319 + 432000) == _vtime#323)) {
	winner_tmstmp15#317 := winner_tmstmp15#317[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: decimals: uint256
var {:sourceloc "buggy_47.sol", 79, 3} {:message "decimals"} decimals#346: [address_t]int;
// 
// Function: bug_tmstmp28 : function ()
procedure {:sourceloc "buggy_47.sol", 81, 3} {:message "AcunarToken::bug_tmstmp28"} bug_tmstmp28#393(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 82, 2} {:message "pastBlockTime_tmstmp28"} pastBlockTime_tmstmp28#350: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp28#350 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp28#350);
	pastBlockTime_tmstmp28#350 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 87, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// State variable: supply: uint256
var {:sourceloc "buggy_47.sol", 90, 3} {:message "supply"} supply#395: [address_t]int;
// 
// State variable: winner_tmstmp34: address
var {:sourceloc "buggy_47.sol", 91, 3} {:message "winner_tmstmp34"} winner_tmstmp34#397: [address_t]address_t;
// 
// Function: play_tmstmp34 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 92, 1} {:message "AcunarToken::play_tmstmp34"} play_tmstmp34#419(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#399: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#399 + 432000) == __block_timestamp)) {
	winner_tmstmp34#397 := winner_tmstmp34#397[__this := __msg_sender];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: founder: address
var {:sourceloc "buggy_47.sol", 95, 3} {:message "founder"} founder#421: [address_t]address_t;
// 
// Function: bug_tmstmp21 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 97, 3} {:message "AcunarToken::bug_tmstmp21"} bug_tmstmp21#432(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#424: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#424 := (__block_timestamp >= 1546300800);
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "buggy_47.sol", 100, 3} {:message "balances"} balances#436: [address_t][address_t]int;
// 
// State variable: winner_tmstmp10: address
var {:sourceloc "buggy_47.sol", 102, 3} {:message "winner_tmstmp10"} winner_tmstmp10#438: [address_t]address_t;
// 
// Function: play_tmstmp10 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 103, 1} {:message "AcunarToken::play_tmstmp10"} play_tmstmp10#460(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#440: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#440 + 432000) == __block_timestamp)) {
	winner_tmstmp10#438 := winner_tmstmp10#438[__this := __msg_sender];
	}

	$return12:
	// Function body ends here
}

// 
// State variable: allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_47.sol", 106, 3} {:message "allowed"} allowed#466: [address_t][address_t][address_t]int;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 111, 5} {:message "AcunarToken::[constructor]"} __constructor#894(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	name#301 := name#301[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	symbol#315 := symbol#315[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	winner_tmstmp15#317 := winner_tmstmp15#317[__this := 0];
	decimals#346 := decimals#346[__this := 0];
	supply#395 := supply#395[__this := 0];
	winner_tmstmp34#397 := winner_tmstmp34#397[__this := 0];
	founder#421 := founder#421[__this := 0];
	balances#436 := balances#436[__this := default_address_t_int()];
	winner_tmstmp10#438 := winner_tmstmp10#438[__this := 0];
	allowed#466 := allowed#466[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp7#551 := winner_tmstmp7#551[__this := 0];
	winner_tmstmp23#623 := winner_tmstmp23#623[__this := 0];
	winner_tmstmp14#704 := winner_tmstmp14#704[__this := 0];
	winner_tmstmp30#737 := winner_tmstmp30#737[__this := 0];
	winner_tmstmp39#867 := winner_tmstmp39#867[__this := 0];
	winner_tmstmp19#26 := winner_tmstmp19#26[__this := 0];
	winner_tmstmp26#63 := winner_tmstmp26#63[__this := 0];
	winner_tmstmp38#210 := winner_tmstmp38#210[__this := 0];
	// Function body starts here
	supply#395 := supply#395[__this := 200000000];
	founder#421 := founder#421[__this := __msg_sender];
	balances#436 := balances#436[__this := balances#436[__this][founder#421[__this] := supply#395[__this]]];
	$return13:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_47.sol", 116, 1} {:message "AcunarToken::bug_tmstmp4"} bug_tmstmp4#532(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 117, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#489: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#489 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#489);
	pastBlockTime_tmstmp4#489 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 122, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return14:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 127, 5} {:message "AcunarToken::allowance"} allowance#549(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#534: address_t, spender#536: address_t)
	returns (#540: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#540 := allowed#466[__this][tokenOwner#534][spender#536];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_47.sol", 130, 1} {:message "winner_tmstmp7"} winner_tmstmp7#551: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 131, 1} {:message "AcunarToken::play_tmstmp7"} play_tmstmp7#577(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#553: int)
{
	var {:sourceloc "buggy_47.sol", 132, 2} {:message "_vtime"} _vtime#557: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#557 := __block_timestamp;
	if (((startTime#553 + 432000) == _vtime#557)) {
	winner_tmstmp7#551 := winner_tmstmp7#551[__this := __msg_sender];
	}

	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 138, 5} {:message "AcunarToken::approve"} approve#621(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#579: address_t, tokens#581: int)
	returns (#585: bool)
{
	var call_arg#0: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances#436[__this][__msg_sender] >= tokens#581);
	assume (tokens#581 > 0);
	allowed#466 := allowed#466[__this := allowed#466[__this][__msg_sender := allowed#466[__this][__msg_sender][spender#579 := tokens#581]]];
	call_arg#0 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 143, 14} {:message ""} true;
	call Approval#248(__this, __msg_sender, __msg_value, call_arg#0, spender#579, tokens#581);
	#585 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_47.sol", 146, 1} {:message "winner_tmstmp23"} winner_tmstmp23#623: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 147, 1} {:message "AcunarToken::play_tmstmp23"} play_tmstmp23#649(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#625: int)
{
	var {:sourceloc "buggy_47.sol", 148, 2} {:message "_vtime"} _vtime#629: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#629 := __block_timestamp;
	if (((startTime#625 + 432000) == _vtime#629)) {
	winner_tmstmp23#623 := winner_tmstmp23#623[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 153, 5} {:message "AcunarToken::transferFrom"} transferFrom#702(__this: address_t, __msg_sender: address_t, __msg_value: int, from#651: address_t, to#653: address_t, tokens#655: int)
	returns (#659: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (allowed#466[__this][from#651][to#653] >= tokens#655);
	assume (balances#436[__this][from#651] >= tokens#655);
	balances#436 := balances#436[__this := balances#436[__this][from#651 := (balances#436[__this][from#651] - tokens#655)]];
	balances#436 := balances#436[__this := balances#436[__this][to#653 := (balances#436[__this][to#653] + tokens#655)]];
	allowed#466 := allowed#466[__this := allowed#466[__this][from#651 := allowed#466[__this][from#651][to#653 := (allowed#466[__this][from#651][to#653] - tokens#655)]]];
	#659 := true;
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_47.sol", 165, 1} {:message "winner_tmstmp14"} winner_tmstmp14#704: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 166, 1} {:message "AcunarToken::play_tmstmp14"} play_tmstmp14#726(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#706: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#706 + 432000) == __block_timestamp)) {
	winner_tmstmp14#704 := winner_tmstmp14#704[__this := __msg_sender];
	}

	$return20:
	// Function body ends here
}

// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 170, 5} {:message "AcunarToken::totalSupply"} totalSupply#735(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#730: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#730 := supply#395[__this];
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_47.sol", 173, 1} {:message "winner_tmstmp30"} winner_tmstmp30#737: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 174, 1} {:message "AcunarToken::play_tmstmp30"} play_tmstmp30#759(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#739: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#739 + 432000) == __block_timestamp)) {
	winner_tmstmp30#737 := winner_tmstmp30#737[__this := __msg_sender];
	}

	$return22:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_47.sol", 178, 5} {:message "AcunarToken::balanceOf"} balanceOf#772(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenOwner#761: address_t)
	returns (balance#765: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	balance#765 := balances#436[__this][tokenOwner#761];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_47.sol", 181, 1} {:message "AcunarToken::bug_tmstmp8"} bug_tmstmp8#819(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 182, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#776: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#776 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#776);
	pastBlockTime_tmstmp8#776 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 187, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return24:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 192, 5} {:message "AcunarToken::transfer"} transfer#865(__this: address_t, __msg_sender: address_t, __msg_value: int, to#821: address_t, tokens#823: int)
	returns (success#827: bool)
{
	var call_arg#1: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((balances#436[__this][__msg_sender] >= tokens#823) && (tokens#823 > 0));
	balances#436 := balances#436[__this := balances#436[__this][to#821 := (balances#436[__this][to#821] + tokens#823)]];
	balances#436 := balances#436[__this := balances#436[__this][__msg_sender := (balances#436[__this][__msg_sender] - tokens#823)]];
	call_arg#1 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 197, 15} {:message ""} true;
	call Transfer#240(__this, __msg_sender, __msg_value, call_arg#1, to#821, tokens#823);
	success#827 := true;
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_47.sol", 200, 1} {:message "winner_tmstmp39"} winner_tmstmp39#867: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 201, 1} {:message "AcunarToken::play_tmstmp39"} play_tmstmp39#893(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#869: int)
{
	var {:sourceloc "buggy_47.sol", 202, 2} {:message "_vtime"} _vtime#873: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#873 := __block_timestamp;
	if (((startTime#869 + 432000) == _vtime#873)) {
	winner_tmstmp39#867 := winner_tmstmp39#867[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// ------- Contract: AcunarIEO -------
// Inherits from: AcunarToken
// 
// Event: Invest
procedure {:inline 1} {:sourceloc "buggy_47.sol", 281, 3} {:message "[event] AcunarIEO::Invest"} Invest#1158(__this: address_t, __msg_sender: address_t, __msg_value: int, investor#1152: address_t, value#1154: int, tokens#1156: int)
{
	
}

// 
// State variable: winner_tmstmp22: address
var {:sourceloc "buggy_47.sol", 209, 3} {:message "winner_tmstmp22"} winner_tmstmp22#898: [address_t]address_t;
// 
// Function: play_tmstmp22 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 210, 1} {:message "AcunarIEO::play_tmstmp22"} play_tmstmp22#920(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#900: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#900 + 432000) == __block_timestamp)) {
	winner_tmstmp22#898 := winner_tmstmp22#898[__this := __msg_sender];
	}

	$return27:
	// Function body ends here
}

// 
// State variable: admin: address
var {:sourceloc "buggy_47.sol", 213, 3} {:message "admin"} admin#922: [address_t]address_t;
// 
// Function: bug_tmstmp12 : function ()
procedure {:sourceloc "buggy_47.sol", 218, 3} {:message "AcunarIEO::bug_tmstmp12"} bug_tmstmp12#969(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 219, 2} {:message "pastBlockTime_tmstmp12"} pastBlockTime_tmstmp12#926: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp12#926 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp12#926);
	pastBlockTime_tmstmp12#926 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 224, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return28:
	// Function body ends here
}

// 
// State variable: deposit: address payable
var {:sourceloc "buggy_47.sol", 227, 3} {:message "deposit"} deposit#971: [address_t]address_t;
// 
// State variable: winner_tmstmp11: address
var {:sourceloc "buggy_47.sol", 230, 3} {:message "winner_tmstmp11"} winner_tmstmp11#973: [address_t]address_t;
// 
// Function: play_tmstmp11 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 231, 1} {:message "AcunarIEO::play_tmstmp11"} play_tmstmp11#999(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#975: int)
{
	var {:sourceloc "buggy_47.sol", 232, 2} {:message "_vtime"} _vtime#979: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#979 := __block_timestamp;
	if (((startTime#975 + 432000) == _vtime#979)) {
	winner_tmstmp11#973 := winner_tmstmp11#973[__this := __msg_sender];
	}

	$return29:
	// Function body ends here
}

// 
// State variable: tokenPrice: uint256
var {:sourceloc "buggy_47.sol", 235, 3} {:message "tokenPrice"} tokenPrice#1002: [address_t]int;
// 
// Function: bug_tmstmp1 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 238, 3} {:message "AcunarIEO::bug_tmstmp1"} bug_tmstmp1#1013(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1005: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1005 := (__block_timestamp >= 1546300800);
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: hardCap: uint256
var {:sourceloc "buggy_47.sol", 241, 3} {:message "hardCap"} hardCap#1016: [address_t]int;
// 
// State variable: winner_tmstmp2: address
var {:sourceloc "buggy_47.sol", 243, 3} {:message "winner_tmstmp2"} winner_tmstmp2#1018: [address_t]address_t;
// 
// Function: play_tmstmp2 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 244, 1} {:message "AcunarIEO::play_tmstmp2"} play_tmstmp2#1040(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1020: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#1020 + 432000) == __block_timestamp)) {
	winner_tmstmp2#1018 := winner_tmstmp2#1018[__this := __msg_sender];
	}

	$return31:
	// Function body ends here
}

// 
// State variable: raisedAmount: uint256
var {:sourceloc "buggy_47.sol", 247, 3} {:message "raisedAmount"} raisedAmount#1042: [address_t]int;
// 
// Function: bug_tmstmp17 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 249, 3} {:message "AcunarIEO::bug_tmstmp17"} bug_tmstmp17#1053(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1045: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1045 := (__block_timestamp >= 1546300800);
	goto $return32;
	$return32:
	// Function body ends here
}

// 
// State variable: saleStart: uint256
var {:sourceloc "buggy_47.sol", 252, 3} {:message "saleStart"} saleStart#1057: [address_t]int;
// 
// State variable: saleEnd: uint256
var {:sourceloc "buggy_47.sol", 253, 5} {:message "saleEnd"} saleEnd#1063: [address_t]int;
// 
// State variable: coinTradeStart: uint256
var {:sourceloc "buggy_47.sol", 254, 5} {:message "coinTradeStart"} coinTradeStart#1068: [address_t]int;
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 256, 3} {:message "AcunarIEO::bug_tmstmp37"} bug_tmstmp37#1079(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1071: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1071 := (__block_timestamp >= 1546300800);
	goto $return33;
	$return33:
	// Function body ends here
}

// 
// State variable: maxInvestment: uint256
var {:sourceloc "buggy_47.sol", 259, 3} {:message "maxInvestment"} maxInvestment#1082: [address_t]int;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_47.sol", 260, 3} {:message "winner_tmstmp3"} winner_tmstmp3#1084: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 261, 1} {:message "AcunarIEO::play_tmstmp3"} play_tmstmp3#1110(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1086: int)
{
	var {:sourceloc "buggy_47.sol", 262, 2} {:message "_vtime"} _vtime#1090: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1090 := __block_timestamp;
	if (((startTime#1086 + 432000) == _vtime#1090)) {
	winner_tmstmp3#1084 := winner_tmstmp3#1084[__this := __msg_sender];
	}

	$return34:
	// Function body ends here
}

// 
// State variable: minInvestment: uint256
var {:sourceloc "buggy_47.sol", 265, 3} {:message "minInvestment"} minInvestment#1113: [address_t]int;
// Enum definition State mapped to int
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 268, 3} {:message "AcunarIEO::bug_tmstmp9"} bug_tmstmp9#1129(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1121: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1121 := (__block_timestamp >= 1546300800);
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: ieoState: enum AcunarIEO.State
var {:sourceloc "buggy_47.sol", 271, 3} {:message "ieoState"} ieoState#1131: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_47.sol", 278, 1} {:message "bugv_tmstmp3"} bugv_tmstmp3#1146: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_47.sol", 280, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#1150: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 285, 5} {:message "AcunarIEO::[constructor]"} __constructor#1632(__this: address_t, __msg_sender: address_t, __msg_value: int, _deposit#1160: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp22#898 := winner_tmstmp22#898[__this := 0];
	admin#922 := admin#922[__this := 0];
	deposit#971 := deposit#971[__this := 0];
	winner_tmstmp11#973 := winner_tmstmp11#973[__this := 0];
	tokenPrice#1002 := tokenPrice#1002[__this := 100000000000000];
	hardCap#1016 := hardCap#1016[__this := 21000000000000000000000];
	winner_tmstmp2#1018 := winner_tmstmp2#1018[__this := 0];
	raisedAmount#1042 := raisedAmount#1042[__this := 0];
	saleStart#1057 := saleStart#1057[__this := __block_timestamp];
	saleEnd#1063 := saleEnd#1063[__this := (__block_timestamp + 14515200)];
	coinTradeStart#1068 := coinTradeStart#1068[__this := (saleEnd#1063[__this] + 15120000)];
	maxInvestment#1082 := maxInvestment#1082[__this := 30000000000000000000];
	winner_tmstmp3#1084 := winner_tmstmp3#1084[__this := 0];
	minInvestment#1113 := minInvestment#1113[__this := 100000000000000000];
	ieoState#1131 := ieoState#1131[__this := 0];
	bugv_tmstmp3#1146 := bugv_tmstmp3#1146[__this := __block_timestamp];
	bugv_tmstmp4#1150 := bugv_tmstmp4#1150[__this := __block_timestamp];
	winner_tmstmp35#1238 := winner_tmstmp35#1238[__this := 0];
	winner_tmstmp27#1389 := winner_tmstmp27#1389[__this := 0];
	winner_tmstmp31#1498 := winner_tmstmp31#1498[__this := 0];
	bugv_tmstmp5#1570 := bugv_tmstmp5#1570[__this := __block_timestamp];
	bugv_tmstmp1#1599 := bugv_tmstmp1#1599[__this := __block_timestamp];
	bugv_tmstmp2#1631 := bugv_tmstmp2#1631[__this := __block_timestamp];
	name#301 := name#301[__this := int_arr#constr(default_int_int()[0 := 65][1 := 99][2 := 117][3 := 110][4 := 97][5 := 114], 6)];
	symbol#315 := symbol#315[__this := int_arr#constr(default_int_int()[0 := 65][1 := 67][2 := 78], 3)];
	winner_tmstmp15#317 := winner_tmstmp15#317[__this := 0];
	decimals#346 := decimals#346[__this := 0];
	supply#395 := supply#395[__this := 0];
	winner_tmstmp34#397 := winner_tmstmp34#397[__this := 0];
	founder#421 := founder#421[__this := 0];
	balances#436 := balances#436[__this := default_address_t_int()];
	winner_tmstmp10#438 := winner_tmstmp10#438[__this := 0];
	allowed#466 := allowed#466[__this := default_address_t__k_address_t_v_int()];
	winner_tmstmp7#551 := winner_tmstmp7#551[__this := 0];
	winner_tmstmp23#623 := winner_tmstmp23#623[__this := 0];
	winner_tmstmp14#704 := winner_tmstmp14#704[__this := 0];
	winner_tmstmp30#737 := winner_tmstmp30#737[__this := 0];
	winner_tmstmp39#867 := winner_tmstmp39#867[__this := 0];
	winner_tmstmp19#26 := winner_tmstmp19#26[__this := 0];
	winner_tmstmp26#63 := winner_tmstmp26#63[__this := 0];
	winner_tmstmp38#210 := winner_tmstmp38#210[__this := 0];
	// Arguments for AcunarToken
	// Inlined constructor for AcunarToken starts here
	// Function body starts here
	supply#395 := supply#395[__this := 200000000];
	founder#421 := founder#421[__this := __msg_sender];
	balances#436 := balances#436[__this := balances#436[__this][founder#421[__this] := supply#395[__this]]];
	$return36:
	// Function body ends here
	// Inlined constructor for AcunarToken ends here
	// Function body starts here
	deposit#971 := deposit#971[__this := _deposit#1160];
	admin#922 := admin#922[__this := __msg_sender];
	ieoState#1131 := ieoState#1131[__this := 0];
	$return37:
	// Function body ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_47.sol", 290, 1} {:message "AcunarIEO::bug_tmstmp36"} bug_tmstmp36#1225(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 291, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#1182: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#1182 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#1182);
	pastBlockTime_tmstmp36#1182 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 296, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return38:
	// Function body ends here
}

// 
// Function: halt : function ()
procedure {:sourceloc "buggy_47.sol", 301, 5} {:message "AcunarIEO::halt"} halt#1236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#922[__this]);
	// Function body starts here
	ieoState#1131 := ieoState#1131[__this := 3];
	$return40:
	// Function body ends here
	$return39:
	// Inlined modifier onlyAdmin ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_47.sol", 304, 1} {:message "winner_tmstmp35"} winner_tmstmp35#1238: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 305, 1} {:message "AcunarIEO::play_tmstmp35"} play_tmstmp35#1264(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1240: int)
{
	var {:sourceloc "buggy_47.sol", 306, 2} {:message "_vtime"} _vtime#1244: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1244 := __block_timestamp;
	if (((startTime#1240 + 432000) == _vtime#1244)) {
	winner_tmstmp35#1238 := winner_tmstmp35#1238[__this := __msg_sender];
	}

	$return41:
	// Function body ends here
}

// 
// Function: unhalt : function ()
procedure {:sourceloc "buggy_47.sol", 311, 5} {:message "AcunarIEO::unhalt"} unhalt#1275(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#922[__this]);
	// Function body starts here
	ieoState#1131 := ieoState#1131[__this := 1];
	$return43:
	// Function body ends here
	$return42:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_47.sol", 314, 1} {:message "AcunarIEO::bug_tmstmp40"} bug_tmstmp40#1322(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_47.sol", 315, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1279: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1279 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1279);
	pastBlockTime_tmstmp40#1279 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_47.sol", 320, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return44:
	// Function body ends here
}

// 
// Function: changeDepositAddress : function (address payable)
procedure {:sourceloc "buggy_47.sol", 327, 5} {:message "AcunarIEO::changeDepositAddress"} changeDepositAddress#1334(__this: address_t, __msg_sender: address_t, __msg_value: int, newDeposit#1324: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyAdmin starts here
	assume (__msg_sender == admin#922[__this]);
	// Function body starts here
	deposit#971 := deposit#971[__this := newDeposit#1324];
	$return46:
	// Function body ends here
	$return45:
	// Inlined modifier onlyAdmin ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 330, 1} {:message "AcunarIEO::bug_tmstmp33"} bug_tmstmp33#1345(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1337: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1337 := (__block_timestamp >= 1546300800);
	goto $return47;
	$return47:
	// Function body ends here
}

// 
// Function: getCurrentState : function () view returns (enum AcunarIEO.State)
procedure {:sourceloc "buggy_47.sol", 336, 5} {:message "AcunarIEO::getCurrentState"} getCurrentState#1387(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1348: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((ieoState#1131[__this] == 3)) {
	#1348 := 3;
	goto $return48;
	}
	else {
	if ((__block_timestamp < saleStart#1057[__this])) {
	#1348 := 0;
	goto $return48;
	}
	else {
	if (((__block_timestamp >= saleStart#1057[__this]) && (__block_timestamp <= saleEnd#1063[__this]))) {
	#1348 := 1;
	goto $return48;
	}
	else {
	#1348 := 2;
	goto $return48;
	}

	}

	}

	$return48:
	// Function body ends here
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_47.sol", 347, 1} {:message "winner_tmstmp27"} winner_tmstmp27#1389: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 348, 1} {:message "AcunarIEO::play_tmstmp27"} play_tmstmp27#1415(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1391: int)
{
	var {:sourceloc "buggy_47.sol", 349, 2} {:message "_vtime"} _vtime#1395: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1395 := __block_timestamp;
	if (((startTime#1391 + 432000) == _vtime#1395)) {
	winner_tmstmp27#1389 := winner_tmstmp27#1389[__this := __msg_sender];
	}

	$return49:
	// Function body ends here
}

// 
// Function: invest : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 354, 5} {:message "AcunarIEO::invest"} invest#1496(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1418: bool)
{
	var getCurrentState#1387_ret#9: int;
	var {:sourceloc "buggy_47.sol", 361, 9} {:message "tokens"} tokens#1445: int;
	var call_arg#10: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 356, 20} {:message ""} true;
	call getCurrentState#1387_ret#9 := getCurrentState#1387(__this, __msg_sender, __msg_value);
	ieoState#1131 := ieoState#1131[__this := getCurrentState#1387_ret#9];
	assume (ieoState#1131[__this] == 1);
	assume ((__msg_value >= minInvestment#1113[__this]) && (__msg_value <= maxInvestment#1082[__this]));
	tokens#1445 := (__msg_value div tokenPrice#1002[__this]);
	assume ((raisedAmount#1042[__this] + __msg_value) <= hardCap#1016[__this]);
	raisedAmount#1042 := raisedAmount#1042[__this := (raisedAmount#1042[__this] + __msg_value)];
	balances#436 := balances#436[__this := balances#436[__this][__msg_sender := (balances#436[__this][__msg_sender] + tokens#1445)]];
	balances#436 := balances#436[__this := balances#436[__this][founder#421[__this] := (balances#436[__this][founder#421[__this]] - tokens#1445)]];
	assume {:sourceloc "buggy_47.sol", 372, 9} {:message ""} true;
	call __transfer(deposit#971[__this], __this, 0, __msg_value);
	call_arg#10 := __msg_sender;
	assume {:sourceloc "buggy_47.sol", 375, 14} {:message ""} true;
	call Invest#1158(__this, __msg_sender, __msg_value, call_arg#10, __msg_value, tokens#1445);
	#1418 := true;
	goto $return50;
	$return50:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_47.sol", 381, 1} {:message "winner_tmstmp31"} winner_tmstmp31#1498: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_47.sol", 382, 1} {:message "AcunarIEO::play_tmstmp31"} play_tmstmp31#1524(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#1500: int)
{
	var {:sourceloc "buggy_47.sol", 383, 2} {:message "_vtime"} _vtime#1504: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#1504 := __block_timestamp;
	if (((startTime#1500 + 432000) == _vtime#1504)) {
	winner_tmstmp31#1498 := winner_tmstmp31#1498[__this := __msg_sender];
	}

	$return51:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_47.sol", 388, 5} {:message "AcunarIEO::[receive]"} #1531(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var invest#1496_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 389, 7} {:message ""} true;
	call invest#1496_ret#11 := invest#1496(__this, __msg_sender, __msg_value);
	$return52:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_47.sol", 391, 1} {:message "AcunarIEO::bug_tmstmp13"} bug_tmstmp13#1542(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1534: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1534 := (__block_timestamp >= 1546300800);
	goto $return53;
	$return53:
	// Function body ends here
}

// 
// Function: burn : function () returns (bool)
procedure {:sourceloc "buggy_47.sol", 397, 5} {:message "AcunarIEO::burn"} burn#1566(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1545: bool)
{
	var getCurrentState#1387_ret#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_47.sol", 398, 20} {:message ""} true;
	call getCurrentState#1387_ret#12 := getCurrentState#1387(__this, __msg_sender, __msg_value);
	ieoState#1131 := ieoState#1131[__this := getCurrentState#1387_ret#12];
	assume (ieoState#1131[__this] == 2);
	balances#436 := balances#436[__this := balances#436[__this][founder#421[__this] := 0]];
	$return54:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_47.sol", 403, 1} {:message "bugv_tmstmp5"} bugv_tmstmp5#1570: [address_t]int;
// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 406, 5} {:message "AcunarIEO::transfer"} transfer#1595(__this: address_t, __msg_sender: address_t, __msg_value: int, to#1572: address_t, value#1574: int)
	returns (#1578: bool)
{
	var transfer#865_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#1068[__this]);
	assume {:sourceloc "buggy_47.sol", 408, 9} {:message ""} true;
	call transfer#865_ret#13 := transfer#865(__this, __msg_sender, __msg_value, to#1572, value#1574);
	$return55:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_47.sol", 410, 1} {:message "bugv_tmstmp1"} bugv_tmstmp1#1599: [address_t]int;
// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_47.sol", 412, 5} {:message "AcunarIEO::transferFrom"} transferFrom#1627(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1601: address_t, _to#1603: address_t, _value#1605: int)
	returns (#1609: bool)
{
	var transferFrom#702_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (__block_timestamp > coinTradeStart#1068[__this]);
	assume {:sourceloc "buggy_47.sol", 414, 9} {:message ""} true;
	call transferFrom#702_ret#14 := transferFrom#702(__this, __msg_sender, __msg_value, _from#1601, _to#1603, _value#1605);
	$return56:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_47.sol", 416, 1} {:message "bugv_tmstmp2"} bugv_tmstmp2#1631: [address_t]int;
