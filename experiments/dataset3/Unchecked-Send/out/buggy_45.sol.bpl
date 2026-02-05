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
procedure {:inline 1} {:sourceloc "buggy_45.sol", 11, 3} {:message "[event] StockBet::GameCreated"} GameCreated#18(__this: address_t, __msg_sender: address_t, __msg_value: int, bet#16: int)
{
	
}

// 
// Event: GameOpened
procedure {:inline 1} {:sourceloc "buggy_45.sol", 14, 3} {:message "[event] StockBet::GameOpened"} GameOpened#35(__this: address_t, __msg_sender: address_t, __msg_value: int, initialPrice#33: int)
{
	
}

// 
// Event: GameClosed
procedure {:inline 1} {:sourceloc "buggy_45.sol", 17, 3} {:message "[event] StockBet::GameClosed"} GameClosed#50(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: OracleSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 20, 3} {:message "[event] StockBet::OracleSet"} OracleSet#67(__this: address_t, __msg_sender: address_t, __msg_value: int, oracle#65: address_t)
{
	
}

// 
// Event: FinalPriceSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 23, 3} {:message "[event] StockBet::FinalPriceSet"} FinalPriceSet#84(__this: address_t, __msg_sender: address_t, __msg_value: int, finalPrice#82: int)
{
	
}

// 
// Event: PlayerBet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 26, 3} {:message "[event] StockBet::PlayerBet"} PlayerBet#103(__this: address_t, __msg_sender: address_t, __msg_value: int, player#99: address_t, guess#101: int)
{
	
}

// 
// Event: PlayersWin
procedure {:inline 1} {:sourceloc "buggy_45.sol", 30, 3} {:message "[event] StockBet::PlayersWin"} PlayersWin#122(__this: address_t, __msg_sender: address_t, __msg_value: int, result#118: int, splitJackpot#120: int)
{
	
}

// 
// Event: OwnerWins
procedure {:inline 1} {:sourceloc "buggy_45.sol", 33, 3} {:message "[event] StockBet::OwnerWins"} OwnerWins#139(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#137: address_t)
{
	
}

procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bug_unchk_send7 : function ()
procedure {:sourceloc "buggy_45.sol", 9, 3} {:message "StockBet::bug_unchk_send7"} bug_unchk_send7#14(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 10, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#0);
	$return0:
	// Function body ends here
}

// 
// Function: bug_unchk_send23 : function ()
procedure {:sourceloc "buggy_45.sol", 12, 3} {:message "StockBet::bug_unchk_send23"} bug_unchk_send23#31(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 13, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#1);
	$return1:
	// Function body ends here
}

// 
// Function: bug_unchk_send14 : function ()
procedure {:sourceloc "buggy_45.sol", 15, 3} {:message "StockBet::bug_unchk_send14"} bug_unchk_send14#48(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#2: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#2 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 16, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#2);
	$return2:
	// Function body ends here
}

// 
// Function: bug_unchk_send30 : function ()
procedure {:sourceloc "buggy_45.sol", 18, 3} {:message "StockBet::bug_unchk_send30"} bug_unchk_send30#63(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#3 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 19, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#3);
	$return3:
	// Function body ends here
}

// 
// Function: bug_unchk_send8 : function ()
procedure {:sourceloc "buggy_45.sol", 21, 3} {:message "StockBet::bug_unchk_send8"} bug_unchk_send8#80(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#4 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 22, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#4);
	$return4:
	// Function body ends here
}

// 
// Function: bug_unchk_send27 : function ()
procedure {:sourceloc "buggy_45.sol", 24, 3} {:message "StockBet::bug_unchk_send27"} bug_unchk_send27#97(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#5: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#5 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 25, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#5);
	$return5:
	// Function body ends here
}

// 
// Function: bug_unchk_send31 : function ()
procedure {:sourceloc "buggy_45.sol", 28, 3} {:message "StockBet::bug_unchk_send31"} bug_unchk_send31#116(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 29, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#6);
	$return6:
	// Function body ends here
}

// 
// Function: bug_unchk_send13 : function ()
procedure {:sourceloc "buggy_45.sol", 31, 3} {:message "StockBet::bug_unchk_send13"} bug_unchk_send13#135(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 32, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#7);
	$return7:
	// Function body ends here
}

// Enum definition State mapped to int
// Enum definition PaidStatus mapped to int
// 
// ------- Struct Guess -------
// Storage
type {:datatype} struct_storage_Guess#157;
function {:constructor} Guess#157#constr(players#154: [address_t]int, guesses_number#156: int) returns (struct_storage_Guess#157);
// Memory
type address_struct_memory_Guess#157 = int;
// Member players
var {:sourceloc "buggy_45.sol", 46, 9} {:message "players"} players#154: [address_struct_memory_Guess#157][address_t]int;
// Member guesses_number
var {:sourceloc "buggy_45.sol", 47, 9} {:message "guesses_number"} guesses_number#156: [address_struct_memory_Guess#157]int;
// 
// ------- End of struct Guess -------
// 
// Function: bug_unchk_send24 : function ()
procedure {:sourceloc "buggy_45.sol", 50, 3} {:message "StockBet::bug_unchk_send24"} bug_unchk_send24#170(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#8 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 51, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#8);
	$return8:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_45.sol", 52, 3} {:message "owner"} owner#172: [address_t]address_t;
// 
// Function: bug_unchk_send5 : function ()
procedure {:sourceloc "buggy_45.sol", 53, 3} {:message "StockBet::bug_unchk_send5"} bug_unchk_send5#185(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#9 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 54, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#9);
	$return9:
	// Function body ends here
}

// 
// State variable: oracle: address
var {:sourceloc "buggy_45.sol", 55, 3} {:message "oracle"} oracle#187: [address_t]address_t;
// 
// Function: bug_unchk_send15 : function ()
procedure {:sourceloc "buggy_45.sol", 56, 3} {:message "StockBet::bug_unchk_send15"} bug_unchk_send15#200(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 57, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#10);
	$return10:
	// Function body ends here
}

// 
// State variable: state: enum StockBet.State
var {:sourceloc "buggy_45.sol", 58, 3} {:message "state"} state#202: [address_t]int;
// 
// Function: bug_unchk_send28 : function ()
procedure {:sourceloc "buggy_45.sol", 60, 3} {:message "StockBet::bug_unchk_send28"} bug_unchk_send28#215(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#11 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 61, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#11);
	$return11:
	// Function body ends here
}

// 
// State variable: guesses: mapping(uint256 => struct StockBet.Guess storage ref)
var {:sourceloc "buggy_45.sol", 62, 3} {:message "guesses"} guesses#219: [address_t][int]struct_storage_Guess#157;
// 
// Function: bug_unchk_send21 : function ()
procedure {:sourceloc "buggy_45.sol", 64, 3} {:message "StockBet::bug_unchk_send21"} bug_unchk_send21#232(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#12 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 65, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#12);
	$return12:
	// Function body ends here
}

// 
// State variable: bet: uint256
var {:sourceloc "buggy_45.sol", 66, 3} {:message "bet"} bet#234: [address_t]int;
// 
// State variable: splitJackpot: uint256
var {:sourceloc "buggy_45.sol", 67, 5} {:message "splitJackpot"} splitJackpot#236: [address_t]int;
// 
// Function: bug_unchk_send10 : function ()
procedure {:sourceloc "buggy_45.sol", 68, 3} {:message "StockBet::bug_unchk_send10"} bug_unchk_send10#249(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#13 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 69, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#13);
	$return13:
	// Function body ends here
}

// 
// State variable: result: uint256
var {:sourceloc "buggy_45.sol", 70, 3} {:message "result"} result#251: [address_t]int;
// 
// Function: bug_unchk_send22 : function ()
procedure {:sourceloc "buggy_45.sol", 71, 3} {:message "StockBet::bug_unchk_send22"} bug_unchk_send22#264(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 72, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#14);
	$return14:
	// Function body ends here
}

// 
// State variable: initialPrice: uint256
var {:sourceloc "buggy_45.sol", 73, 3} {:message "initialPrice"} initialPrice#266: [address_t]int;
// 
// Function: bug_unchk_send12 : function ()
procedure {:sourceloc "buggy_45.sol", 74, 3} {:message "StockBet::bug_unchk_send12"} bug_unchk_send12#279(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#15: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#15 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 75, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#15);
	$return15:
	// Function body ends here
}

// 
// State variable: finalPrice: uint256
var {:sourceloc "buggy_45.sol", 76, 3} {:message "finalPrice"} finalPrice#281: [address_t]int;
// 
// Function: bug_unchk_send11 : function ()
procedure {:sourceloc "buggy_45.sol", 78, 3} {:message "StockBet::bug_unchk_send11"} bug_unchk_send11#294(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#16: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#16 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 79, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#16);
	$return16:
	// Function body ends here
}

// 
// Function: bug_unchk_send1 : function ()
procedure {:sourceloc "buggy_45.sol", 81, 3} {:message "StockBet::bug_unchk_send1"} bug_unchk_send1#310(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 82, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#17);
	$return17:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int |T@struct_storage_Guess#157|)) (|Guess#157#constr| ((as const (Array Int Int)) 0) 0))"} default_int_struct_storage_Guess#157() returns ([int]struct_storage_Guess#157);
// 
// Function: 
procedure {:sourceloc "buggy_45.sol", 109, 5} {:message "StockBet::[constructor]"} __constructor#800(__this: address_t, __msg_sender: address_t, __msg_value: int, _bet#360: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	owner#172 := owner#172[__this := 0];
	oracle#187 := oracle#187[__this := 0];
	state#202 := state#202[__this := 0];
	guesses#219 := guesses#219[__this := default_int_struct_storage_Guess#157()];
	bet#234 := bet#234[__this := 0];
	splitJackpot#236 := splitJackpot#236[__this := 0];
	result#251 := result#251[__this := 0];
	initialPrice#266 := initialPrice#266[__this := 0];
	finalPrice#281 := finalPrice#281[__this := 0];
	// Function body starts here
	assume (_bet#360 > 0);
	owner#172 := owner#172[__this := __msg_sender];
	state#202 := state#202[__this := 0];
	bet#234 := bet#234[__this := _bet#360];
	assume {:sourceloc "buggy_45.sol", 116, 14} {:message ""} true;
	call GameCreated#18(__this, __msg_sender, __msg_value, bet#234[__this]);
	$return18:
	// Function body ends here
}

// 
// Function: bug_unchk_send2 : function ()
procedure {:sourceloc "buggy_45.sol", 118, 1} {:message "StockBet::bug_unchk_send2"} bug_unchk_send2#404(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#18 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 119, 7} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#18);
	$return19:
	// Function body ends here
}

// 
// Function: setOracle : function (address)
procedure {:sourceloc "buggy_45.sol", 121, 5} {:message "StockBet::setOracle"} setOracle#424(__this: address_t, __msg_sender: address_t, __msg_value: int, _oracle#406: address_t)
{
	var expected#348#201: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#172[__this]);
	// Inlined modifier inState starts here
	expected#348#201 := 0;
	assume (state#202[__this] == expected#348#201);
	// Function body starts here
	oracle#187 := oracle#187[__this := _oracle#406];
	assume {:sourceloc "buggy_45.sol", 124, 14} {:message ""} true;
	call OracleSet#67(__this, __msg_sender, __msg_value, oracle#187[__this]);
	$return22:
	// Function body ends here
	$return21:
	// Inlined modifier inState ends here
	$return20:
	// Inlined modifier byOwner ends here
}

// 
// Function: bug_unchk_send17 : function ()
procedure {:sourceloc "buggy_45.sol", 126, 1} {:message "StockBet::bug_unchk_send17"} bug_unchk_send17#437(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#22: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#22 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 127, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#22);
	$return23:
	// Function body ends here
}

// 
// Function: setInitialPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 129, 5} {:message "StockBet::setInitialPrice"} setInitialPrice#462(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#439: int)
{
	var expected#348#241: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#187[__this]);
	// Inlined modifier inState starts here
	expected#348#241 := 0;
	assume (state#202[__this] == expected#348#241);
	// Function body starts here
	initialPrice#266 := initialPrice#266[__this := _value#439];
	state#202 := state#202[__this := 2];
	assume {:sourceloc "buggy_45.sol", 133, 14} {:message ""} true;
	call GameOpened#35(__this, __msg_sender, __msg_value, initialPrice#266[__this]);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier inState ends here
	$return24:
	// Inlined modifier byOracle ends here
}

// 
// Function: bug_unchk_send3 : function ()
procedure {:sourceloc "buggy_45.sol", 135, 1} {:message "StockBet::bug_unchk_send3"} bug_unchk_send3#475(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 136, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#26);
	$return27:
	// Function body ends here
}

// 
// Function: closeGame : function ()
procedure {:sourceloc "buggy_45.sol", 138, 5} {:message "StockBet::closeGame"} closeGame#493(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#348#281: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#172[__this]);
	// Inlined modifier inState starts here
	expected#348#281 := 2;
	assume (state#202[__this] == expected#348#281);
	// Function body starts here
	state#202 := state#202[__this := 3];
	assume {:sourceloc "buggy_45.sol", 141, 14} {:message ""} true;
	call GameClosed#50(__this, __msg_sender, __msg_value);
	$return30:
	// Function body ends here
	$return29:
	// Inlined modifier inState ends here
	$return28:
	// Inlined modifier byOwner ends here
}

// 
// Function: bug_unchk_send9 : function ()
procedure {:sourceloc "buggy_45.sol", 143, 1} {:message "StockBet::bug_unchk_send9"} bug_unchk_send9#506(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 144, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#30);
	$return31:
	// Function body ends here
}

// 
// Function: betUp : function ()
procedure {:sourceloc "buggy_45.sol", 146, 5} {:message "StockBet::betUp"} betUp#549(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#348#321: int;
	var tmp#34: int;
	var call_arg#35: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#187[__this]);
	// Inlined modifier inState starts here
	expected#348#321 := 2;
	assume (state#202[__this] == expected#348#321);
	// Function body starts here
	assume (__msg_value == (bet#234[__this] * 1000000000000000));
	tmp#34 := guesses_number#156#Guess#157#constr(guesses#219[__this][1]);
	guesses#219 := guesses#219[__this := guesses#219[__this][1 := Guess#157#constr(players#154#Guess#157#constr(guesses#219[__this][1]), (guesses_number#156#Guess#157#constr(guesses#219[__this][1]) + 1))]];
	guesses#219 := guesses#219[__this := guesses#219[__this][1 := Guess#157#constr(players#154#Guess#157#constr(guesses#219[__this][1])[__msg_sender := 1], guesses_number#156#Guess#157#constr(guesses#219[__this][1]))]];
	call_arg#35 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 152, 14} {:message ""} true;
	call PlayerBet#103(__this, __msg_sender, __msg_value, call_arg#35, 1);
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier inState ends here
	$return32:
	// Inlined modifier byPlayer ends here
}

// 
// Function: bug_unchk_send25 : function ()
procedure {:sourceloc "buggy_45.sol", 154, 1} {:message "StockBet::bug_unchk_send25"} bug_unchk_send25#562(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#36: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#36 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 155, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#36);
	$return35:
	// Function body ends here
}

// 
// Function: betDown : function ()
procedure {:sourceloc "buggy_45.sol", 157, 5} {:message "StockBet::betDown"} betDown#605(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#348#381: int;
	var tmp#40: int;
	var call_arg#41: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#187[__this]);
	// Inlined modifier inState starts here
	expected#348#381 := 2;
	assume (state#202[__this] == expected#348#381);
	// Function body starts here
	assume (__msg_value == (bet#234[__this] * 1000000000000000));
	tmp#40 := guesses_number#156#Guess#157#constr(guesses#219[__this][0]);
	guesses#219 := guesses#219[__this := guesses#219[__this][0 := Guess#157#constr(players#154#Guess#157#constr(guesses#219[__this][0]), (guesses_number#156#Guess#157#constr(guesses#219[__this][0]) + 1))]];
	guesses#219 := guesses#219[__this := guesses#219[__this][0 := Guess#157#constr(players#154#Guess#157#constr(guesses#219[__this][0])[__msg_sender := 1], guesses_number#156#Guess#157#constr(guesses#219[__this][0]))]];
	call_arg#41 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 163, 14} {:message ""} true;
	call PlayerBet#103(__this, __msg_sender, __msg_value, call_arg#41, 0);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier inState ends here
	$return36:
	// Inlined modifier byPlayer ends here
}

// 
// Function: bug_unchk_send19 : function ()
procedure {:sourceloc "buggy_45.sol", 165, 1} {:message "StockBet::bug_unchk_send19"} bug_unchk_send19#618(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 166, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#42);
	$return39:
	// Function body ends here
}

// 
// Function: setFinalPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 169, 5} {:message "StockBet::setFinalPrice"} setFinalPrice#690(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#620: int)
{
	var expected#348#441: int;
	var getBalance#786_ret#46: int;
	var call_arg#47: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#187[__this]);
	// Inlined modifier inState starts here
	expected#348#441 := 3;
	assume (state#202[__this] == expected#348#441);
	// Function body starts here
	finalPrice#281 := finalPrice#281[__this := _value#620];
	assume {:sourceloc "buggy_45.sol", 174, 14} {:message ""} true;
	call FinalPriceSet#84(__this, __msg_sender, __msg_value, finalPrice#281[__this]);
	if ((finalPrice#281[__this] > initialPrice#266[__this])) {
	result#251 := result#251[__this := 1];
	}
	else {
	result#251 := result#251[__this := 0];
	}

	if ((guesses_number#156#Guess#157#constr(guesses#219[__this][result#251[__this]]) > 0)) {
	state#202 := state#202[__this := 4];
	assume {:sourceloc "buggy_45.sol", 185, 28} {:message ""} true;
	call getBalance#786_ret#46 := getBalance#786(__this, __msg_sender, __msg_value);
	splitJackpot#236 := splitJackpot#236[__this := (getBalance#786_ret#46 div guesses_number#156#Guess#157#constr(guesses#219[__this][result#251[__this]]))];
	assume {:sourceloc "buggy_45.sol", 186, 18} {:message ""} true;
	call PlayersWin#122(__this, __msg_sender, __msg_value, result#251[__this], splitJackpot#236[__this]);
	}
	else {
	state#202 := state#202[__this := 5];
	call_arg#47 := owner#172[__this];
	assume {:sourceloc "buggy_45.sol", 189, 18} {:message ""} true;
	call OwnerWins#139(__this, __msg_sender, __msg_value, call_arg#47);
	}

	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier inState ends here
	$return40:
	// Inlined modifier byOracle ends here
}

// 
// Function: bug_unchk_send26 : function ()
procedure {:sourceloc "buggy_45.sol", 192, 1} {:message "StockBet::bug_unchk_send26"} bug_unchk_send26#703(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#48: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#48 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 193, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#48);
	$return43:
	// Function body ends here
}

// 
// Function: bug_unchk_send20 : function ()
procedure {:sourceloc "buggy_45.sol", 195, 1} {:message "StockBet::bug_unchk_send20"} bug_unchk_send20#716(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#49: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#49 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 196, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#49);
	$return44:
	// Function body ends here
}

// 
// Function: collectPlayerWinnings : function ()
procedure {:sourceloc "buggy_45.sol", 198, 5} {:message "StockBet::collectPlayerWinnings"} collectPlayerWinnings#761(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#348#511: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#187[__this]);
	// Inlined modifier inState starts here
	expected#348#511 := 4;
	assume (state#202[__this] == expected#348#511);
	// Function body starts here
	if ((players#154#Guess#157#constr(guesses#219[__this][result#251[__this]])[__msg_sender] == 1)) {
	guesses#219 := guesses#219[__this := guesses#219[__this][result#251[__this] := Guess#157#constr(players#154#Guess#157#constr(guesses#219[__this][result#251[__this]])[__msg_sender := 2], guesses_number#156#Guess#157#constr(guesses#219[__this][result#251[__this]]))]];
	assume {:sourceloc "buggy_45.sol", 201, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, splitJackpot#236[__this]);
	}
	else {
	assume false;
	}

	$return47:
	// Function body ends here
	$return46:
	// Inlined modifier inState ends here
	$return45:
	// Inlined modifier byPlayer ends here
}

// 
// Function: bug_unchk_send32 : function ()
procedure {:sourceloc "buggy_45.sol", 204, 1} {:message "StockBet::bug_unchk_send32"} bug_unchk_send32#774(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#53: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#53 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 205, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#53);
	$return48:
	// Function body ends here
}

// 
// Function: getBalance : function () view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_45.sol", 207, 5} {:message "StockBet::getBalance"} getBalance#786(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#777: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#777 := __balance[__this];
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// Function: bug_unchk_send4 : function ()
procedure {:sourceloc "buggy_45.sol", 210, 1} {:message "StockBet::bug_unchk_send4"} bug_unchk_send4#799(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#54: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#54 := 1000000000000000000;
	assume {:sourceloc "buggy_45.sol", 211, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, call_arg#54);
	$return50:
	// Function body ends here
}

