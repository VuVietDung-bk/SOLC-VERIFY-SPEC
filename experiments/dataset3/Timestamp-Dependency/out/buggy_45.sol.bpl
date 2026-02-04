// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_45.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: StockBet -------
// 
// Event: GameCreated
procedure {:inline 1} {:sourceloc "buggy_45.sol", 14, 3} {:message "[event] StockBet::GameCreated"} GameCreated#33(__this: address_t, __msg_sender: address_t, __msg_value: int, bet#31: int)
{
	
}

// 
// Event: GameOpened
procedure {:inline 1} {:sourceloc "buggy_45.sol", 20, 3} {:message "[event] StockBet::GameOpened"} GameOpened#65(__this: address_t, __msg_sender: address_t, __msg_value: int, initialPrice#63: int)
{
	
}

// 
// Event: GameClosed
procedure {:inline 1} {:sourceloc "buggy_45.sol", 24, 3} {:message "[event] StockBet::GameClosed"} GameClosed#78(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: OracleSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 26, 3} {:message "[event] StockBet::OracleSet"} OracleSet#86(__this: address_t, __msg_sender: address_t, __msg_value: int, oracle#84: address_t)
{
	
}

// 
// Event: FinalPriceSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 28, 3} {:message "[event] StockBet::FinalPriceSet"} FinalPriceSet#94(__this: address_t, __msg_sender: address_t, __msg_value: int, finalPrice#92: int)
{
	
}

// 
// Event: PlayerBet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 30, 3} {:message "[event] StockBet::PlayerBet"} PlayerBet#104(__this: address_t, __msg_sender: address_t, __msg_value: int, player#100: address_t, guess#102: int)
{
	
}

// 
// Event: PlayersWin
procedure {:inline 1} {:sourceloc "buggy_45.sol", 33, 3} {:message "[event] StockBet::PlayersWin"} PlayersWin#114(__this: address_t, __msg_sender: address_t, __msg_value: int, result#110: int, splitJackpot#112: int)
{
	
}

// 
// Event: OwnerWins
procedure {:inline 1} {:sourceloc "buggy_45.sol", 35, 3} {:message "[event] StockBet::OwnerWins"} OwnerWins#122(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#120: address_t)
{
	
}

// 
// State variable: winner_tmstmp27: address
var {:sourceloc "buggy_45.sol", 9, 3} {:message "winner_tmstmp27"} winner_tmstmp27#3: [address_t]address_t;
// 
// Function: play_tmstmp27 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 10, 1} {:message "StockBet::play_tmstmp27"} play_tmstmp27#29(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#5: int)
{
	var {:sourceloc "buggy_45.sol", 11, 2} {:message "_vtime"} _vtime#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#9 := __block_timestamp;
	if (((startTime#5 + 432000) == _vtime#9)) {
	winner_tmstmp27#3 := winner_tmstmp27#3[__this := __msg_sender];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: winner_tmstmp31: address
var {:sourceloc "buggy_45.sol", 15, 3} {:message "winner_tmstmp31"} winner_tmstmp31#35: [address_t]address_t;
// 
// Function: play_tmstmp31 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 16, 1} {:message "StockBet::play_tmstmp31"} play_tmstmp31#61(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#37: int)
{
	var {:sourceloc "buggy_45.sol", 17, 2} {:message "_vtime"} _vtime#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#41 := __block_timestamp;
	if (((startTime#37 + 432000) == _vtime#41)) {
	winner_tmstmp31#35 := winner_tmstmp31#35[__this := __msg_sender];
	}

	$return1:
	// Function body ends here
}

// 
// Function: bug_tmstmp13 : function () view returns (bool)
procedure {:sourceloc "buggy_45.sol", 21, 3} {:message "StockBet::bug_tmstmp13"} bug_tmstmp13#76(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#68: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#68 := (__block_timestamp >= 1546300800);
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// State variable: bugv_tmstmp5: uint256
var {:sourceloc "buggy_45.sol", 25, 3} {:message "bugv_tmstmp5"} bugv_tmstmp5#82: [address_t]int;
// 
// State variable: bugv_tmstmp1: uint256
var {:sourceloc "buggy_45.sol", 27, 3} {:message "bugv_tmstmp1"} bugv_tmstmp1#90: [address_t]int;
// 
// State variable: bugv_tmstmp2: uint256
var {:sourceloc "buggy_45.sol", 29, 3} {:message "bugv_tmstmp2"} bugv_tmstmp2#98: [address_t]int;
// 
// State variable: bugv_tmstmp3: uint256
var {:sourceloc "buggy_45.sol", 32, 3} {:message "bugv_tmstmp3"} bugv_tmstmp3#108: [address_t]int;
// 
// State variable: bugv_tmstmp4: uint256
var {:sourceloc "buggy_45.sol", 34, 3} {:message "bugv_tmstmp4"} bugv_tmstmp4#118: [address_t]int;
// Enum definition State mapped to int
// Enum definition PaidStatus mapped to int
// 
// ------- Struct Guess -------
// Storage
type {:datatype} struct_storage_Guess#140;
function {:constructor} Guess#140#constr(players#137: [address_t]int, guesses_number#139: int) returns (struct_storage_Guess#140);
// Memory
type address_struct_memory_Guess#140 = int;
// Member players
var {:sourceloc "buggy_45.sol", 48, 9} {:message "players"} players#137: [address_struct_memory_Guess#140][address_t]int;
// Member guesses_number
var {:sourceloc "buggy_45.sol", 49, 9} {:message "guesses_number"} guesses_number#139: [address_struct_memory_Guess#140]int;
// 
// ------- End of struct Guess -------
// 
// Function: bug_tmstmp37 : function () view returns (bool)
procedure {:sourceloc "buggy_45.sol", 52, 3} {:message "StockBet::bug_tmstmp37"} bug_tmstmp37#151(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#143: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#143 := (__block_timestamp >= 1546300800);
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_45.sol", 55, 3} {:message "owner"} owner#153: [address_t]address_t;
// 
// State variable: winner_tmstmp3: address
var {:sourceloc "buggy_45.sol", 56, 3} {:message "winner_tmstmp3"} winner_tmstmp3#155: [address_t]address_t;
// 
// Function: play_tmstmp3 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 57, 1} {:message "StockBet::play_tmstmp3"} play_tmstmp3#181(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#157: int)
{
	var {:sourceloc "buggy_45.sol", 58, 2} {:message "_vtime"} _vtime#161: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#161 := __block_timestamp;
	if (((startTime#157 + 432000) == _vtime#161)) {
	winner_tmstmp3#155 := winner_tmstmp3#155[__this := __msg_sender];
	}

	$return4:
	// Function body ends here
}

// 
// State variable: oracle: address
var {:sourceloc "buggy_45.sol", 61, 3} {:message "oracle"} oracle#183: [address_t]address_t;
// 
// Function: bug_tmstmp9 : function () view returns (bool)
procedure {:sourceloc "buggy_45.sol", 62, 3} {:message "StockBet::bug_tmstmp9"} bug_tmstmp9#194(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#186: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#186 := (__block_timestamp >= 1546300800);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// State variable: state: enum StockBet.State
var {:sourceloc "buggy_45.sol", 65, 3} {:message "state"} state#196: [address_t]int;
// 
// Function: bug_tmstmp25 : function () view returns (bool)
procedure {:sourceloc "buggy_45.sol", 67, 3} {:message "StockBet::bug_tmstmp25"} bug_tmstmp25#207(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#199: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#199 := (__block_timestamp >= 1546300800);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// State variable: guesses: mapping(uint256 => struct StockBet.Guess storage ref)
var {:sourceloc "buggy_45.sol", 70, 3} {:message "guesses"} guesses#211: [address_t][int]struct_storage_Guess#140;
// 
// State variable: winner_tmstmp19: address
var {:sourceloc "buggy_45.sol", 72, 3} {:message "winner_tmstmp19"} winner_tmstmp19#213: [address_t]address_t;
// 
// Function: play_tmstmp19 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 73, 1} {:message "StockBet::play_tmstmp19"} play_tmstmp19#239(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#215: int)
{
	var {:sourceloc "buggy_45.sol", 74, 2} {:message "_vtime"} _vtime#219: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#219 := __block_timestamp;
	if (((startTime#215 + 432000) == _vtime#219)) {
	winner_tmstmp19#213 := winner_tmstmp19#213[__this := __msg_sender];
	}

	$return7:
	// Function body ends here
}

// 
// State variable: bet: uint256
var {:sourceloc "buggy_45.sol", 77, 3} {:message "bet"} bet#241: [address_t]int;
// 
// State variable: splitJackpot: uint256
var {:sourceloc "buggy_45.sol", 78, 5} {:message "splitJackpot"} splitJackpot#243: [address_t]int;
// 
// State variable: winner_tmstmp26: address
var {:sourceloc "buggy_45.sol", 79, 3} {:message "winner_tmstmp26"} winner_tmstmp26#245: [address_t]address_t;
// 
// Function: play_tmstmp26 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 80, 1} {:message "StockBet::play_tmstmp26"} play_tmstmp26#267(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#247: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#247 + 432000) == __block_timestamp)) {
	winner_tmstmp26#245 := winner_tmstmp26#245[__this := __msg_sender];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: result: uint256
var {:sourceloc "buggy_45.sol", 83, 3} {:message "result"} result#269: [address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_tmstmp20 : function ()
procedure {:sourceloc "buggy_45.sol", 84, 3} {:message "StockBet::bug_tmstmp20"} bug_tmstmp20#316(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 85, 2} {:message "pastBlockTime_tmstmp20"} pastBlockTime_tmstmp20#273: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp20#273 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp20#273);
	pastBlockTime_tmstmp20#273 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_45.sol", 90, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return9:
	// Function body ends here
}

// 
// State variable: initialPrice: uint256
var {:sourceloc "buggy_45.sol", 93, 3} {:message "initialPrice"} initialPrice#318: [address_t]int;
// 
// Function: bug_tmstmp32 : function ()
procedure {:sourceloc "buggy_45.sol", 94, 3} {:message "StockBet::bug_tmstmp32"} bug_tmstmp32#365(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 95, 2} {:message "pastBlockTime_tmstmp32"} pastBlockTime_tmstmp32#322: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp32#322 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp32#322);
	pastBlockTime_tmstmp32#322 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_45.sol", 100, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return10:
	// Function body ends here
}

// 
// State variable: finalPrice: uint256
var {:sourceloc "buggy_45.sol", 103, 3} {:message "finalPrice"} finalPrice#367: [address_t]int;
// 
// State variable: winner_tmstmp38: address
var {:sourceloc "buggy_45.sol", 105, 3} {:message "winner_tmstmp38"} winner_tmstmp38#369: [address_t]address_t;
// 
// Function: play_tmstmp38 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 106, 1} {:message "StockBet::play_tmstmp38"} play_tmstmp38#391(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#371: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#371 + 432000) == __block_timestamp)) {
	winner_tmstmp38#369 := winner_tmstmp38#369[__this := __msg_sender];
	}

	$return11:
	// Function body ends here
}

// 
// Function: bug_tmstmp4 : function ()
procedure {:sourceloc "buggy_45.sol", 110, 3} {:message "StockBet::bug_tmstmp4"} bug_tmstmp4#441(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 111, 2} {:message "pastBlockTime_tmstmp4"} pastBlockTime_tmstmp4#398: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp4#398 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp4#398);
	pastBlockTime_tmstmp4#398 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_45.sol", 116, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return12:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int |T@struct_storage_Guess#140|)) (|Guess#140#constr| ((as const (Array Int Int)) 0) 0))"} default_int_struct_storage_Guess#140() returns ([int]struct_storage_Guess#140);
// 
// Function: 
procedure {:sourceloc "buggy_45.sol", 145, 5} {:message "StockBet::[constructor]"} __constructor#1113(__this: address_t, __msg_sender: address_t, __msg_value: int, _bet#491: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	winner_tmstmp27#3 := winner_tmstmp27#3[__this := 0];
	winner_tmstmp31#35 := winner_tmstmp31#35[__this := 0];
	bugv_tmstmp5#82 := bugv_tmstmp5#82[__this := __block_timestamp];
	bugv_tmstmp1#90 := bugv_tmstmp1#90[__this := __block_timestamp];
	bugv_tmstmp2#98 := bugv_tmstmp2#98[__this := __block_timestamp];
	bugv_tmstmp3#108 := bugv_tmstmp3#108[__this := __block_timestamp];
	bugv_tmstmp4#118 := bugv_tmstmp4#118[__this := __block_timestamp];
	owner#153 := owner#153[__this := 0];
	winner_tmstmp3#155 := winner_tmstmp3#155[__this := 0];
	oracle#183 := oracle#183[__this := 0];
	state#196 := state#196[__this := 0];
	guesses#211 := guesses#211[__this := default_int_struct_storage_Guess#140()];
	winner_tmstmp19#213 := winner_tmstmp19#213[__this := 0];
	bet#241 := bet#241[__this := 0];
	splitJackpot#243 := splitJackpot#243[__this := 0];
	winner_tmstmp26#245 := winner_tmstmp26#245[__this := 0];
	result#269 := result#269[__this := 0];
	initialPrice#318 := initialPrice#318[__this := 0];
	finalPrice#367 := finalPrice#367[__this := 0];
	winner_tmstmp38#369 := winner_tmstmp38#369[__this := 0];
	winner_tmstmp7#524 := winner_tmstmp7#524[__this := 0];
	winner_tmstmp23#572 := winner_tmstmp23#572[__this := 0];
	winner_tmstmp14#625 := winner_tmstmp14#625[__this := 0];
	winner_tmstmp30#667 := winner_tmstmp30#667[__this := 0];
	winner_tmstmp39#824 := winner_tmstmp39#824[__this := 0];
	winner_tmstmp35#971 := winner_tmstmp35#971[__this := 0];
	// Function body starts here
	assume (_bet#491 > 0);
	owner#153 := owner#153[__this := __msg_sender];
	state#196 := state#196[__this := 0];
	bet#241 := bet#241[__this := _bet#491];
	assume {:sourceloc "buggy_45.sol", 152, 14} {:message ""} true;
	call GameCreated#33(__this, __msg_sender, __msg_value, bet#241[__this]);
	$return13:
	// Function body ends here
}

// 
// State variable: winner_tmstmp7: address
var {:sourceloc "buggy_45.sol", 154, 1} {:message "winner_tmstmp7"} winner_tmstmp7#524: [address_t]address_t;
// 
// Function: play_tmstmp7 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 155, 1} {:message "StockBet::play_tmstmp7"} play_tmstmp7#550(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#526: int)
{
	var {:sourceloc "buggy_45.sol", 156, 2} {:message "_vtime"} _vtime#530: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#530 := __block_timestamp;
	if (((startTime#526 + 432000) == _vtime#530)) {
	winner_tmstmp7#524 := winner_tmstmp7#524[__this := __msg_sender];
	}

	$return14:
	// Function body ends here
}

// 
// Function: setOracle : function (address)
procedure {:sourceloc "buggy_45.sol", 160, 5} {:message "StockBet::setOracle"} setOracle#570(__this: address_t, __msg_sender: address_t, __msg_value: int, _oracle#552: address_t)
{
	var expected#479#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#153[__this]);
	// Inlined modifier inState starts here
	expected#479#11 := 0;
	assume (state#196[__this] == expected#479#11);
	// Function body starts here
	oracle#183 := oracle#183[__this := _oracle#552];
	assume {:sourceloc "buggy_45.sol", 163, 14} {:message ""} true;
	call OracleSet#86(__this, __msg_sender, __msg_value, oracle#183[__this]);
	$return17:
	// Function body ends here
	$return16:
	// Inlined modifier inState ends here
	$return15:
	// Inlined modifier byOwner ends here
}

// 
// State variable: winner_tmstmp23: address
var {:sourceloc "buggy_45.sol", 165, 1} {:message "winner_tmstmp23"} winner_tmstmp23#572: [address_t]address_t;
// 
// Function: play_tmstmp23 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 166, 1} {:message "StockBet::play_tmstmp23"} play_tmstmp23#598(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#574: int)
{
	var {:sourceloc "buggy_45.sol", 167, 2} {:message "_vtime"} _vtime#578: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#578 := __block_timestamp;
	if (((startTime#574 + 432000) == _vtime#578)) {
	winner_tmstmp23#572 := winner_tmstmp23#572[__this := __msg_sender];
	}

	$return18:
	// Function body ends here
}

// 
// Function: setInitialPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 171, 5} {:message "StockBet::setInitialPrice"} setInitialPrice#623(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#600: int)
{
	var expected#479#41: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#183[__this]);
	// Inlined modifier inState starts here
	expected#479#41 := 0;
	assume (state#196[__this] == expected#479#41);
	// Function body starts here
	initialPrice#318 := initialPrice#318[__this := _value#600];
	state#196 := state#196[__this := 2];
	assume {:sourceloc "buggy_45.sol", 175, 14} {:message ""} true;
	call GameOpened#65(__this, __msg_sender, __msg_value, initialPrice#318[__this]);
	$return21:
	// Function body ends here
	$return20:
	// Inlined modifier inState ends here
	$return19:
	// Inlined modifier byOracle ends here
}

// 
// State variable: winner_tmstmp14: address
var {:sourceloc "buggy_45.sol", 177, 1} {:message "winner_tmstmp14"} winner_tmstmp14#625: [address_t]address_t;
// 
// Function: play_tmstmp14 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 178, 1} {:message "StockBet::play_tmstmp14"} play_tmstmp14#647(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#627: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#627 + 432000) == __block_timestamp)) {
	winner_tmstmp14#625 := winner_tmstmp14#625[__this := __msg_sender];
	}

	$return22:
	// Function body ends here
}

// 
// Function: closeGame : function ()
procedure {:sourceloc "buggy_45.sol", 182, 5} {:message "StockBet::closeGame"} closeGame#665(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#479#71: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#153[__this]);
	// Inlined modifier inState starts here
	expected#479#71 := 2;
	assume (state#196[__this] == expected#479#71);
	// Function body starts here
	state#196 := state#196[__this := 3];
	assume {:sourceloc "buggy_45.sol", 185, 14} {:message ""} true;
	call GameClosed#78(__this, __msg_sender, __msg_value);
	$return25:
	// Function body ends here
	$return24:
	// Inlined modifier inState ends here
	$return23:
	// Inlined modifier byOwner ends here
}

// 
// State variable: winner_tmstmp30: address
var {:sourceloc "buggy_45.sol", 187, 1} {:message "winner_tmstmp30"} winner_tmstmp30#667: [address_t]address_t;
// 
// Function: play_tmstmp30 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 188, 1} {:message "StockBet::play_tmstmp30"} play_tmstmp30#689(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#669: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if (((startTime#669 + 432000) == __block_timestamp)) {
	winner_tmstmp30#667 := winner_tmstmp30#667[__this := __msg_sender];
	}

	$return26:
	// Function body ends here
}

// 
// Function: betUp : function ()
procedure {:sourceloc "buggy_45.sol", 192, 5} {:message "StockBet::betUp"} betUp#732(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#479#101: int;
	var tmp#12: int;
	var call_arg#13: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#183[__this]);
	// Inlined modifier inState starts here
	expected#479#101 := 2;
	assume (state#196[__this] == expected#479#101);
	// Function body starts here
	assume (__msg_value == (bet#241[__this] * 1000000000000000));
	tmp#12 := guesses_number#139#Guess#140#constr(guesses#211[__this][1]);
	guesses#211 := guesses#211[__this := guesses#211[__this][1 := Guess#140#constr(players#137#Guess#140#constr(guesses#211[__this][1]), (guesses_number#139#Guess#140#constr(guesses#211[__this][1]) + 1))]];
	guesses#211 := guesses#211[__this := guesses#211[__this][1 := Guess#140#constr(players#137#Guess#140#constr(guesses#211[__this][1])[__msg_sender := 1], guesses_number#139#Guess#140#constr(guesses#211[__this][1]))]];
	call_arg#13 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 198, 14} {:message ""} true;
	call PlayerBet#104(__this, __msg_sender, __msg_value, call_arg#13, 1);
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier inState ends here
	$return27:
	// Inlined modifier byPlayer ends here
}

// 
// Function: bug_tmstmp8 : function ()
procedure {:sourceloc "buggy_45.sol", 200, 1} {:message "StockBet::bug_tmstmp8"} bug_tmstmp8#779(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 201, 2} {:message "pastBlockTime_tmstmp8"} pastBlockTime_tmstmp8#736: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp8#736 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp8#736);
	pastBlockTime_tmstmp8#736 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_45.sol", 206, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return30:
	// Function body ends here
}

// 
// Function: betDown : function ()
procedure {:sourceloc "buggy_45.sol", 210, 5} {:message "StockBet::betDown"} betDown#822(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#479#151: int;
	var tmp#17: int;
	var call_arg#18: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#183[__this]);
	// Inlined modifier inState starts here
	expected#479#151 := 2;
	assume (state#196[__this] == expected#479#151);
	// Function body starts here
	assume (__msg_value == (bet#241[__this] * 1000000000000000));
	tmp#17 := guesses_number#139#Guess#140#constr(guesses#211[__this][0]);
	guesses#211 := guesses#211[__this := guesses#211[__this][0 := Guess#140#constr(players#137#Guess#140#constr(guesses#211[__this][0]), (guesses_number#139#Guess#140#constr(guesses#211[__this][0]) + 1))]];
	guesses#211 := guesses#211[__this := guesses#211[__this][0 := Guess#140#constr(players#137#Guess#140#constr(guesses#211[__this][0])[__msg_sender := 1], guesses_number#139#Guess#140#constr(guesses#211[__this][0]))]];
	call_arg#18 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 216, 14} {:message ""} true;
	call PlayerBet#104(__this, __msg_sender, __msg_value, call_arg#18, 0);
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier inState ends here
	$return31:
	// Inlined modifier byPlayer ends here
}

// 
// State variable: winner_tmstmp39: address
var {:sourceloc "buggy_45.sol", 218, 1} {:message "winner_tmstmp39"} winner_tmstmp39#824: [address_t]address_t;
// 
// Function: play_tmstmp39 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 219, 1} {:message "StockBet::play_tmstmp39"} play_tmstmp39#850(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#826: int)
{
	var {:sourceloc "buggy_45.sol", 220, 2} {:message "_vtime"} _vtime#830: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#830 := __block_timestamp;
	if (((startTime#826 + 432000) == _vtime#830)) {
	winner_tmstmp39#824 := winner_tmstmp39#824[__this := __msg_sender];
	}

	$return34:
	// Function body ends here
}

// 
// Function: setFinalPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 225, 5} {:message "StockBet::setFinalPrice"} setFinalPrice#922(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#852: int)
{
	var expected#479#201: int;
	var getBalance#1101_ret#22: int;
	var call_arg#23: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#183[__this]);
	// Inlined modifier inState starts here
	expected#479#201 := 3;
	assume (state#196[__this] == expected#479#201);
	// Function body starts here
	finalPrice#367 := finalPrice#367[__this := _value#852];
	assume {:sourceloc "buggy_45.sol", 230, 14} {:message ""} true;
	call FinalPriceSet#94(__this, __msg_sender, __msg_value, finalPrice#367[__this]);
	if ((finalPrice#367[__this] > initialPrice#318[__this])) {
	result#269 := result#269[__this := 1];
	}
	else {
	result#269 := result#269[__this := 0];
	}

	if ((guesses_number#139#Guess#140#constr(guesses#211[__this][result#269[__this]]) > 0)) {
	state#196 := state#196[__this := 4];
	assume {:sourceloc "buggy_45.sol", 241, 28} {:message ""} true;
	call getBalance#1101_ret#22 := getBalance#1101(__this, __msg_sender, __msg_value);
	splitJackpot#243 := splitJackpot#243[__this := (getBalance#1101_ret#22 div guesses_number#139#Guess#140#constr(guesses#211[__this][result#269[__this]]))];
	assume {:sourceloc "buggy_45.sol", 242, 18} {:message ""} true;
	call PlayersWin#114(__this, __msg_sender, __msg_value, result#269[__this], splitJackpot#243[__this]);
	}
	else {
	state#196 := state#196[__this := 5];
	call_arg#23 := owner#153[__this];
	assume {:sourceloc "buggy_45.sol", 245, 18} {:message ""} true;
	call OwnerWins#122(__this, __msg_sender, __msg_value, call_arg#23);
	}

	$return37:
	// Function body ends here
	$return36:
	// Inlined modifier inState ends here
	$return35:
	// Inlined modifier byOracle ends here
}

// 
// Function: bug_tmstmp36 : function ()
procedure {:sourceloc "buggy_45.sol", 248, 1} {:message "StockBet::bug_tmstmp36"} bug_tmstmp36#969(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 249, 2} {:message "pastBlockTime_tmstmp36"} pastBlockTime_tmstmp36#926: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp36#926 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp36#926);
	pastBlockTime_tmstmp36#926 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_45.sol", 254, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return38:
	// Function body ends here
}

// 
// State variable: winner_tmstmp35: address
var {:sourceloc "buggy_45.sol", 258, 1} {:message "winner_tmstmp35"} winner_tmstmp35#971: [address_t]address_t;
// 
// Function: play_tmstmp35 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 259, 1} {:message "StockBet::play_tmstmp35"} play_tmstmp35#997(__this: address_t, __msg_sender: address_t, __msg_value: int, startTime#973: int)
{
	var {:sourceloc "buggy_45.sol", 260, 2} {:message "_vtime"} _vtime#977: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	_vtime#977 := __block_timestamp;
	if (((startTime#973 + 432000) == _vtime#977)) {
	winner_tmstmp35#971 := winner_tmstmp35#971[__this := __msg_sender];
	}

	$return39:
	// Function body ends here
}

// 
// Function: collectPlayerWinnings : function ()
procedure {:sourceloc "buggy_45.sol", 264, 5} {:message "StockBet::collectPlayerWinnings"} collectPlayerWinnings#1042(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#479#251: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#183[__this]);
	// Inlined modifier inState starts here
	expected#479#251 := 4;
	assume (state#196[__this] == expected#479#251);
	// Function body starts here
	if ((players#137#Guess#140#constr(guesses#211[__this][result#269[__this]])[__msg_sender] == 1)) {
	guesses#211 := guesses#211[__this := guesses#211[__this][result#269[__this] := Guess#140#constr(players#137#Guess#140#constr(guesses#211[__this][result#269[__this]])[__msg_sender := 2], guesses_number#139#Guess#140#constr(guesses#211[__this][result#269[__this]]))]];
	assume {:sourceloc "buggy_45.sol", 267, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, splitJackpot#243[__this]);
	}
	else {
	assume false;
	}

	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier inState ends here
	$return40:
	// Inlined modifier byPlayer ends here
}

// 
// Function: bug_tmstmp40 : function ()
procedure {:sourceloc "buggy_45.sol", 270, 1} {:message "StockBet::bug_tmstmp40"} bug_tmstmp40#1089(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 271, 2} {:message "pastBlockTime_tmstmp40"} pastBlockTime_tmstmp40#1046: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	pastBlockTime_tmstmp40#1046 := 0;
	assume (__msg_value == 10000000000000000000);
	assume (__block_timestamp != pastBlockTime_tmstmp40#1046);
	pastBlockTime_tmstmp40#1046 := __block_timestamp;
	if (((__block_timestamp mod 15) == 0)) {
	assume {:sourceloc "buggy_45.sol", 276, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, __balance[__this]);
	}

	$return43:
	// Function body ends here
}

// 
// Function: getBalance : function () view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_45.sol", 280, 5} {:message "StockBet::getBalance"} getBalance#1101(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1092: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1092 := __balance[__this];
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// Function: bug_tmstmp33 : function () view returns (bool)
procedure {:sourceloc "buggy_45.sol", 283, 1} {:message "StockBet::bug_tmstmp33"} bug_tmstmp33#1112(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1104: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1104 := (__block_timestamp >= 1546300800);
	goto $return45;
	$return45:
	// Function body ends here
}

