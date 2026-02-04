// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_25.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: WhiteBetting -------
// 
// Event: Success
procedure {:inline 1} {:sourceloc "buggy_25.sol", 77, 3} {:message "[event] WhiteBetting::Success"} Success#187(__this: address_t, __msg_sender: address_t, __msg_value: int, odd#185: int)
{
	
}

// 
// Event: Deposit
procedure {:inline 1} {:sourceloc "buggy_25.sol", 86, 3} {:message "[event] WhiteBetting::Deposit"} Deposit#225(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#221: address_t, eth#223: int)
{
	
}

// 
// Event: Withdraw
procedure {:inline 1} {:sourceloc "buggy_25.sol", 97, 3} {:message "[event] WhiteBetting::Withdraw"} Withdraw#269(__this: address_t, __msg_sender: address_t, __msg_value: int, receiver#265: address_t, eth#267: int)
{
	
}

// 
// Event: NewStake
procedure {:inline 1} {:sourceloc "buggy_25.sol", 108, 3} {:message "[event] WhiteBetting::NewStake"} NewStake#319(__this: address_t, __msg_sender: address_t, __msg_value: int, player#309: address_t, fixtureId#311: int, selectedTeam#313: int, stake#315: int, odd#317: int)
{
	
}

// 
// Event: SetGame
procedure {:inline 1} {:sourceloc "buggy_25.sol", 117, 3} {:message "[event] WhiteBetting::SetGame"} SetGame#373(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#351: int, _timestamp#353: int, _odd_homeTeam#355: int, _odd_drawTeam#357: int, _odd_awayTeam#359: int, _odd_over#361: int, _odd_under#363: int, _odd_homeTeamAndDraw#365: int, _odd_homeAndAwayTeam#367: int, _odd_awayTeamAndDraw#369: int, _open_status#371: int)
{
	
}

// 
// Event: ChangeOdd
procedure {:inline 1} {:sourceloc "buggy_25.sol", 125, 3} {:message "[event] WhiteBetting::ChangeOdd"} ChangeOdd#430(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#412: int, _odd_homeTeam#414: int, _odd_drawTeam#416: int, _odd_awayTeam#418: int, _odd_over#420: int, _odd_under#422: int, _odd_homeTeamAndDraw#424: int, _odd_homeAndAwayTeam#426: int, _odd_awayTeamAndDraw#428: int)
{
	
}

// 
// Event: GivePrizeMoney
procedure {:inline 1} {:sourceloc "buggy_25.sol", 135, 3} {:message "[event] WhiteBetting::GivePrizeMoney"} GivePrizeMoney#473(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#467: int, _homeDrawAway#469: int, _overUnder#471: int)
{
	
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_25.sol", 13, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#3: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_25.sol", 14, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#5: [address_t]int;
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
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

function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_25.sol", 15, 4} {:message "WhiteBetting::buyTicket_re_ent9"} buyTicket_re_ent9#40(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 16, 8} {:message "success"} success#9: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#5[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#5[__this])];
	assume {:sourceloc "buggy_25.sol", 16, 25} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(lastPlayer_re_ent9#3[__this], __this, jackpot_re_ent9#5[__this]);
	if (__call_ret#0) {
	havoc lastPlayer_re_ent9#3;
	havoc jackpot_re_ent9#5;
	havoc owner#42;
	havoc redeemableEther_re_ent25#69;
	havoc gameList#109;
	havoc userBalance_re_ent19#122;
	havoc betList#156;
	havoc balances_re_ent36#160;
	havoc counter_re_ent35#190;
	havoc userBalance_re_ent40#229;
	havoc userBalance_re_ent33#273;
	havoc not_called_re_ent27#322;
	havoc balances_re_ent31#377;
	havoc not_called_re_ent13#433;
	havoc userBalance_re_ent26#489;
	havoc not_called_re_ent20#543;
	havoc redeemableEther_re_ent32#666;
	havoc balances_re_ent38#825;
	havoc redeemableEther_re_ent4#1052;
	havoc counter_re_ent7#1296;
	havoc lastPlayer_re_ent23#1351;
	havoc jackpot_re_ent23#1353;
	havoc counter_re_ent14#1398;
	havoc lastPlayer_re_ent30#1441;
	havoc jackpot_re_ent30#1443;
	havoc balances_re_ent8#1488;
	havoc redeemableEther_re_ent39#1554;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#5[__this])];
	}

	success#9 := __call_ret#0;
	if (!(success#9)) {
	assume false;
	}

	lastPlayer_re_ent9#3 := lastPlayer_re_ent9#3[__this := __msg_sender];
	jackpot_re_ent9#5 := jackpot_re_ent9#5[__this := __balance[__this]];
	$return0:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_25.sol", 22, 3} {:message "owner"} owner#42: [address_t]address_t;
// 
// ------- Struct GameInfo -------
// Storage
type {:datatype} struct_storage_GameInfo#65;
function {:constructor} GameInfo#65#constr(timestamp#44: int, odd_homeTeam#46: int, odd_drawTeam#48: int, odd_awayTeam#50: int, odd_over#52: int, odd_under#54: int, odd_homeTeamAndDraw#56: int, odd_homeAndAwayTeam#58: int, odd_awayTeamAndDraw#60: int, open_status#62: int, isDone#64: bool) returns (struct_storage_GameInfo#65);
// Memory
type address_struct_memory_GameInfo#65 = int;
// Member timestamp
var {:sourceloc "buggy_25.sol", 27, 5} {:message "timestamp"} timestamp#44: [address_struct_memory_GameInfo#65]int;
// Member odd_homeTeam
var {:sourceloc "buggy_25.sol", 29, 5} {:message "odd_homeTeam"} odd_homeTeam#46: [address_struct_memory_GameInfo#65]int;
// Member odd_drawTeam
var {:sourceloc "buggy_25.sol", 30, 5} {:message "odd_drawTeam"} odd_drawTeam#48: [address_struct_memory_GameInfo#65]int;
// Member odd_awayTeam
var {:sourceloc "buggy_25.sol", 31, 5} {:message "odd_awayTeam"} odd_awayTeam#50: [address_struct_memory_GameInfo#65]int;
// Member odd_over
var {:sourceloc "buggy_25.sol", 32, 5} {:message "odd_over"} odd_over#52: [address_struct_memory_GameInfo#65]int;
// Member odd_under
var {:sourceloc "buggy_25.sol", 33, 5} {:message "odd_under"} odd_under#54: [address_struct_memory_GameInfo#65]int;
// Member odd_homeTeamAndDraw
var {:sourceloc "buggy_25.sol", 34, 5} {:message "odd_homeTeamAndDraw"} odd_homeTeamAndDraw#56: [address_struct_memory_GameInfo#65]int;
// Member odd_homeAndAwayTeam
var {:sourceloc "buggy_25.sol", 35, 5} {:message "odd_homeAndAwayTeam"} odd_homeAndAwayTeam#58: [address_struct_memory_GameInfo#65]int;
// Member odd_awayTeamAndDraw
var {:sourceloc "buggy_25.sol", 36, 5} {:message "odd_awayTeamAndDraw"} odd_awayTeamAndDraw#60: [address_struct_memory_GameInfo#65]int;
// Member open_status
var {:sourceloc "buggy_25.sol", 38, 5} {:message "open_status"} open_status#62: [address_struct_memory_GameInfo#65]int;
// Member isDone
var {:sourceloc "buggy_25.sol", 40, 5} {:message "isDone"} isDone#64: [address_struct_memory_GameInfo#65]bool;
// 
// ------- End of struct GameInfo -------
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 42, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#69: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_25.sol", 43, 1} {:message "WhiteBetting::claimReward_re_ent25"} claimReward_re_ent25#105(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 46, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#82: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#69[__this][__msg_sender] > 0);
	transferValue_re_ent25#82 := redeemableEther_re_ent25#69[__this][__msg_sender];
	assume {:sourceloc "buggy_25.sol", 47, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#82);
	redeemableEther_re_ent25#69 := redeemableEther_re_ent25#69[__this := redeemableEther_re_ent25#69[__this][__msg_sender := 0]];
	$return1:
	// Function body ends here
}

// 
// State variable: gameList: mapping(uint64 => struct WhiteBetting.GameInfo storage ref)
var {:sourceloc "buggy_25.sol", 50, 3} {:message "gameList"} gameList#109: [address_t][int]struct_storage_GameInfo#65;
// 
// ------- Struct BetFixture -------
// Storage
type {:datatype} struct_storage_BetFixture#118;
function {:constructor} BetFixture#118#constr(player#111: address_t, stake#113: int, odd#115: int, selectedTeam#117: int) returns (struct_storage_BetFixture#118);
// Memory
type address_struct_memory_BetFixture#118 = int;
// Member player
var {:sourceloc "buggy_25.sol", 54, 5} {:message "player"} player#111: [address_struct_memory_BetFixture#118]address_t;
// Member stake
var {:sourceloc "buggy_25.sol", 55, 5} {:message "stake"} stake#113: [address_struct_memory_BetFixture#118]int;
// Member odd
var {:sourceloc "buggy_25.sol", 56, 5} {:message "odd"} odd#115: [address_struct_memory_BetFixture#118]int;
// Member selectedTeam
var {:sourceloc "buggy_25.sol", 58, 5} {:message "selectedTeam"} selectedTeam#117: [address_struct_memory_BetFixture#118]int;
// 
// ------- End of struct BetFixture -------
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 60, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#122: [address_t][address_t]int;
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
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_25.sol", 61, 1} {:message "WhiteBetting::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#151(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_25.sol", 64, 12} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, userBalance_re_ent19#122[__this][__msg_sender]);
	if (!(__send_ret#2)) {
	assume false;
	}

	userBalance_re_ent19#122 := userBalance_re_ent19#122[__this := userBalance_re_ent19#122[__this][__msg_sender := 0]];
	$return2:
	// Function body ends here
}

// 
// State variable: betList: mapping(uint64 => struct WhiteBetting.BetFixture storage ref[] storage ref)
type {:datatype} struct_storage_BetFixture#118_arr_type;
function {:constructor} struct_storage_BetFixture#118_arr#constr(arr: [int]struct_storage_BetFixture#118, length: int) returns (struct_storage_BetFixture#118_arr_type);
var {:sourceloc "buggy_25.sol", 69, 3} {:message "betList"} betList#156: [address_t][int]struct_storage_BetFixture#118_arr_type;
// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 72, 1} {:message "balances_re_ent36"} balances_re_ent36#160: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_25.sol", 73, 5} {:message "WhiteBetting::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#183(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_25.sol", 74, 12} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, balances_re_ent36#160[__this][__msg_sender]);
	if (__send_ret#3) {
	balances_re_ent36#160 := balances_re_ent36#160[__this := balances_re_ent36#160[__this][__msg_sender := 0]];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_25.sol", 78, 1} {:message "counter_re_ent35"} counter_re_ent35#190: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_25.sol", 79, 1} {:message "WhiteBetting::callme_re_ent35"} callme_re_ent35#219(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#190[__this] <= 5);
	call_arg#4 := 10000000000000000000;
	assume {:sourceloc "buggy_25.sol", 81, 9} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, call_arg#4);
	if (!(__send_ret#5)) {
	assume false;
	}

	counter_re_ent35#190 := counter_re_ent35#190[__this := (counter_re_ent35#190[__this] + 1)];
	$return4:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 87, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#229: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_25.sol", 88, 1} {:message "WhiteBetting::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#263(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 91, 3} {:message "success"} success#233: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#229[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#229[__this][__msg_sender])];
	assume {:sourceloc "buggy_25.sol", 91, 18} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, userBalance_re_ent40#229[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc lastPlayer_re_ent9#3;
	havoc jackpot_re_ent9#5;
	havoc owner#42;
	havoc redeemableEther_re_ent25#69;
	havoc gameList#109;
	havoc userBalance_re_ent19#122;
	havoc betList#156;
	havoc balances_re_ent36#160;
	havoc counter_re_ent35#190;
	havoc userBalance_re_ent40#229;
	havoc userBalance_re_ent33#273;
	havoc not_called_re_ent27#322;
	havoc balances_re_ent31#377;
	havoc not_called_re_ent13#433;
	havoc userBalance_re_ent26#489;
	havoc not_called_re_ent20#543;
	havoc redeemableEther_re_ent32#666;
	havoc balances_re_ent38#825;
	havoc redeemableEther_re_ent4#1052;
	havoc counter_re_ent7#1296;
	havoc lastPlayer_re_ent23#1351;
	havoc jackpot_re_ent23#1353;
	havoc counter_re_ent14#1398;
	havoc lastPlayer_re_ent30#1441;
	havoc jackpot_re_ent30#1443;
	havoc balances_re_ent8#1488;
	havoc redeemableEther_re_ent39#1554;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#229[__this][__msg_sender])];
	}

	success#233 := __call_ret#6;
	if (!(success#233)) {
	assume false;
	}

	userBalance_re_ent40#229 := userBalance_re_ent40#229[__this := userBalance_re_ent40#229[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 98, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#273: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_25.sol", 99, 1} {:message "WhiteBetting::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#307(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 102, 3} {:message "success"} success#277: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#273[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#273[__this][__msg_sender])];
	assume {:sourceloc "buggy_25.sol", 102, 19} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, userBalance_re_ent33#273[__this][__msg_sender]);
	if (__call_ret#8) {
	havoc lastPlayer_re_ent9#3;
	havoc jackpot_re_ent9#5;
	havoc owner#42;
	havoc redeemableEther_re_ent25#69;
	havoc gameList#109;
	havoc userBalance_re_ent19#122;
	havoc betList#156;
	havoc balances_re_ent36#160;
	havoc counter_re_ent35#190;
	havoc userBalance_re_ent40#229;
	havoc userBalance_re_ent33#273;
	havoc not_called_re_ent27#322;
	havoc balances_re_ent31#377;
	havoc not_called_re_ent13#433;
	havoc userBalance_re_ent26#489;
	havoc not_called_re_ent20#543;
	havoc redeemableEther_re_ent32#666;
	havoc balances_re_ent38#825;
	havoc redeemableEther_re_ent4#1052;
	havoc counter_re_ent7#1296;
	havoc lastPlayer_re_ent23#1351;
	havoc jackpot_re_ent23#1353;
	havoc counter_re_ent14#1398;
	havoc lastPlayer_re_ent30#1441;
	havoc jackpot_re_ent30#1443;
	havoc balances_re_ent8#1488;
	havoc redeemableEther_re_ent39#1554;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#273[__this][__msg_sender])];
	}

	success#277 := __call_ret#8;
	if (!(success#277)) {
	assume false;
	}

	userBalance_re_ent33#273 := userBalance_re_ent33#273[__this := userBalance_re_ent33#273[__this][__msg_sender := 0]];
	$return6:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_25.sol", 109, 1} {:message "not_called_re_ent27"} not_called_re_ent27#322: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_25.sol", 110, 1} {:message "WhiteBetting::bug_re_ent27"} bug_re_ent27#349(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: int;
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#322[__this];
	call_arg#10 := 1000000000000000000;
	assume {:sourceloc "buggy_25.sol", 112, 12} {:message ""} true;
	call __send_ret#11 := __send(__msg_sender, __this, 0, call_arg#10);
	if (!(__send_ret#11)) {
	assume false;
	}

	not_called_re_ent27#322 := not_called_re_ent27#322[__this := false];
	$return7:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 118, 1} {:message "balances_re_ent31"} balances_re_ent31#377: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_25.sol", 119, 1} {:message "WhiteBetting::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#410(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#379: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#377[__this][__msg_sender] >= _weiToWithdraw#379);
	assume {:sourceloc "buggy_25.sol", 122, 11} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, _weiToWithdraw#379);
	assume __send_ret#12;
	balances_re_ent31#377 := balances_re_ent31#377[__this := balances_re_ent31#377[__this][__msg_sender := (balances_re_ent31#377[__this][__msg_sender] - _weiToWithdraw#379)]];
	$return8:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_25.sol", 126, 1} {:message "not_called_re_ent13"} not_called_re_ent13#433: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_25.sol", 127, 1} {:message "WhiteBetting::bug_re_ent13"} bug_re_ent13#465(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 129, 3} {:message "success"} success#441: bool;
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#433[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_25.sol", 129, 18} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#13) {
	havoc lastPlayer_re_ent9#3;
	havoc jackpot_re_ent9#5;
	havoc owner#42;
	havoc redeemableEther_re_ent25#69;
	havoc gameList#109;
	havoc userBalance_re_ent19#122;
	havoc betList#156;
	havoc balances_re_ent36#160;
	havoc counter_re_ent35#190;
	havoc userBalance_re_ent40#229;
	havoc userBalance_re_ent33#273;
	havoc not_called_re_ent27#322;
	havoc balances_re_ent31#377;
	havoc not_called_re_ent13#433;
	havoc userBalance_re_ent26#489;
	havoc not_called_re_ent20#543;
	havoc redeemableEther_re_ent32#666;
	havoc balances_re_ent38#825;
	havoc redeemableEther_re_ent4#1052;
	havoc counter_re_ent7#1296;
	havoc lastPlayer_re_ent23#1351;
	havoc jackpot_re_ent23#1353;
	havoc counter_re_ent14#1398;
	havoc lastPlayer_re_ent30#1441;
	havoc jackpot_re_ent30#1443;
	havoc balances_re_ent8#1488;
	havoc redeemableEther_re_ent39#1554;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#441 := __call_ret#13;
	if (!(success#441)) {
	assume false;
	}

	not_called_re_ent13#433 := not_called_re_ent13#433[__this := false];
	$return9:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int |T@struct_storage_GameInfo#65|)) (|GameInfo#65#constr| 0 0 0 0 0 0 0 0 0 0 false))"} default_int_struct_storage_GameInfo#65() returns ([int]struct_storage_GameInfo#65);
function {:builtin "((as const (Array Int |T@struct_storage_BetFixture#118|)) (|BetFixture#118#constr| 0 0 0 0))"} default_int_struct_storage_BetFixture#118() returns ([int]struct_storage_BetFixture#118);
function {:builtin "((as const (Array Int |T@struct_storage_BetFixture#118_arr_type|)) (|struct_storage_BetFixture#118_arr#constr| ((as const (Array Int |T@struct_storage_BetFixture#118|)) (|BetFixture#118#constr| 0 0 0 0)) 0))"} default_int_struct_storage_BetFixture#118_arr_type() returns ([int]struct_storage_BetFixture#118_arr_type);
// 
// Function: 
procedure {:sourceloc "buggy_25.sol", 138, 3} {:message "WhiteBetting::[constructor]"} __constructor#1591(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent9#3 := lastPlayer_re_ent9#3[__this := 0];
	jackpot_re_ent9#5 := jackpot_re_ent9#5[__this := 0];
	owner#42 := owner#42[__this := 0];
	redeemableEther_re_ent25#69 := redeemableEther_re_ent25#69[__this := default_address_t_int()];
	gameList#109 := gameList#109[__this := default_int_struct_storage_GameInfo#65()];
	userBalance_re_ent19#122 := userBalance_re_ent19#122[__this := default_address_t_int()];
	betList#156 := betList#156[__this := default_int_struct_storage_BetFixture#118_arr_type()];
	balances_re_ent36#160 := balances_re_ent36#160[__this := default_address_t_int()];
	counter_re_ent35#190 := counter_re_ent35#190[__this := 0];
	userBalance_re_ent40#229 := userBalance_re_ent40#229[__this := default_address_t_int()];
	userBalance_re_ent33#273 := userBalance_re_ent33#273[__this := default_address_t_int()];
	not_called_re_ent27#322 := not_called_re_ent27#322[__this := true];
	balances_re_ent31#377 := balances_re_ent31#377[__this := default_address_t_int()];
	not_called_re_ent13#433 := not_called_re_ent13#433[__this := true];
	userBalance_re_ent26#489 := userBalance_re_ent26#489[__this := default_address_t_int()];
	not_called_re_ent20#543 := not_called_re_ent20#543[__this := true];
	redeemableEther_re_ent32#666 := redeemableEther_re_ent32#666[__this := default_address_t_int()];
	balances_re_ent38#825 := balances_re_ent38#825[__this := default_address_t_int()];
	redeemableEther_re_ent4#1052 := redeemableEther_re_ent4#1052[__this := default_address_t_int()];
	counter_re_ent7#1296 := counter_re_ent7#1296[__this := 0];
	lastPlayer_re_ent23#1351 := lastPlayer_re_ent23#1351[__this := 0];
	jackpot_re_ent23#1353 := jackpot_re_ent23#1353[__this := 0];
	counter_re_ent14#1398 := counter_re_ent14#1398[__this := 0];
	lastPlayer_re_ent30#1441 := lastPlayer_re_ent30#1441[__this := 0];
	jackpot_re_ent30#1443 := jackpot_re_ent30#1443[__this := 0];
	balances_re_ent8#1488 := balances_re_ent8#1488[__this := default_address_t_int()];
	redeemableEther_re_ent39#1554 := redeemableEther_re_ent39#1554[__this := default_address_t_int()];
	// Function body starts here
	owner#42 := owner#42[__this := __msg_sender];
	$return10:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 141, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#489: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_25.sol", 142, 1} {:message "WhiteBetting::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#523(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 145, 3} {:message "success"} success#493: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#489[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#489[__this][__msg_sender])];
	assume {:sourceloc "buggy_25.sol", 145, 19} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, userBalance_re_ent26#489[__this][__msg_sender]);
	if (__call_ret#15) {
	havoc lastPlayer_re_ent9#3;
	havoc jackpot_re_ent9#5;
	havoc owner#42;
	havoc redeemableEther_re_ent25#69;
	havoc gameList#109;
	havoc userBalance_re_ent19#122;
	havoc betList#156;
	havoc balances_re_ent36#160;
	havoc counter_re_ent35#190;
	havoc userBalance_re_ent40#229;
	havoc userBalance_re_ent33#273;
	havoc not_called_re_ent27#322;
	havoc balances_re_ent31#377;
	havoc not_called_re_ent13#433;
	havoc userBalance_re_ent26#489;
	havoc not_called_re_ent20#543;
	havoc redeemableEther_re_ent32#666;
	havoc balances_re_ent38#825;
	havoc redeemableEther_re_ent4#1052;
	havoc counter_re_ent7#1296;
	havoc lastPlayer_re_ent23#1351;
	havoc jackpot_re_ent23#1353;
	havoc counter_re_ent14#1398;
	havoc lastPlayer_re_ent30#1441;
	havoc jackpot_re_ent30#1443;
	havoc balances_re_ent8#1488;
	havoc redeemableEther_re_ent39#1554;
	havoc __balance;
	}

	if (!(__call_ret#15)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#489[__this][__msg_sender])];
	}

	success#493 := __call_ret#15;
	if (!(success#493)) {
	assume false;
	}

	userBalance_re_ent26#489 := userBalance_re_ent26#489[__this := userBalance_re_ent26#489[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// Function: setOpenStatus
procedure {:sourceloc "buggy_25.sol", 153, 3} {:message "WhiteBetting::setOpenStatus"} setOpenStatus#540(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#525: int, _open_status#527: int)
{
	var call_arg#18: int_arr_ptr;
	var new_array#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#19 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#18 := new_array#19;
	mem_arr_int := mem_arr_int[call_arg#18 := int_arr#constr(default_int_int()[0 := 79][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114][9 := 32][10 := 109][11 := 101][12 := 116][13 := 104][14 := 111][15 := 100][16 := 115][17 := 32][18 := 99][19 := 97][20 := 108][21 := 108][22 := 101][23 := 100][24 := 32][25 := 98][26 := 121][27 := 32][28 := 110][29 := 111][30 := 110][31 := 45][32 := 111][33 := 119][34 := 110][35 := 101][36 := 114][37 := 46], 38)];
	assume (__msg_sender == owner#42[__this]);
	// Function body starts here
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#525 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]), _open_status#527, isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#525]))]];
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_25.sol", 156, 1} {:message "not_called_re_ent20"} not_called_re_ent20#543: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_25.sol", 157, 1} {:message "WhiteBetting::bug_re_ent20"} bug_re_ent20#570(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#543[__this];
	call_arg#21 := 1000000000000000000;
	assume {:sourceloc "buggy_25.sol", 159, 12} {:message ""} true;
	call __send_ret#22 := __send(__msg_sender, __this, 0, call_arg#21);
	if (!(__send_ret#22)) {
	assume false;
	}

	not_called_re_ent20#543 := not_called_re_ent20#543[__this := false];
	$return14:
	// Function body ends here
}

// 
// Function: changeOdd
procedure {:sourceloc "buggy_25.sol", 166, 3} {:message "WhiteBetting::changeOdd"} changeOdd#662(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#572: int, _odd_homeTeam#574: int, _odd_drawTeam#576: int, _odd_awayTeam#578: int, _odd_over#580: int, _odd_under#582: int, _odd_homeTeamAndDraw#584: int, _odd_homeAndAwayTeam#586: int, _odd_awayTeamAndDraw#588: int)
{
	var call_arg#24: int_arr_ptr;
	var new_array#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#25 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#24 := new_array#25;
	mem_arr_int := mem_arr_int[call_arg#24 := int_arr#constr(default_int_int()[0 := 79][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114][9 := 32][10 := 109][11 := 101][12 := 116][13 := 104][14 := 111][15 := 100][16 := 115][17 := 32][18 := 99][19 := 97][20 := 108][21 := 108][22 := 101][23 := 100][24 := 32][25 := 98][26 := 121][27 := 32][28 := 110][29 := 111][30 := 110][31 := 45][32 := 111][33 := 119][34 := 110][35 := 101][36 := 114][37 := 46], 38)];
	assume (__msg_sender == owner#42[__this]);
	// Function body starts here
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_homeTeam#574, odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_drawTeam#576, odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_awayTeam#578, odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_over#580, odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_under#582, odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_homeTeamAndDraw#584, odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_homeAndAwayTeam#586, odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#572 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), _odd_awayTeamAndDraw#588, open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#572]))]];
	assume {:sourceloc "buggy_25.sol", 175, 10} {:message ""} true;
	call ChangeOdd#430(__this, __msg_sender, __msg_value, _fixtureId#572, _odd_homeTeam#574, _odd_drawTeam#576, _odd_awayTeam#578, _odd_over#580, _odd_under#582, _odd_homeTeamAndDraw#584, _odd_homeAndAwayTeam#586, _odd_awayTeamAndDraw#588);
	$return16:
	// Function body ends here
	$return15:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 177, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#666: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_25.sol", 178, 1} {:message "WhiteBetting::claimReward_re_ent32"} claimReward_re_ent32#702(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 181, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#679: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#666[__this][__msg_sender] > 0);
	transferValue_re_ent32#679 := redeemableEther_re_ent32#666[__this][__msg_sender];
	assume {:sourceloc "buggy_25.sol", 182, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#679);
	redeemableEther_re_ent32#666 := redeemableEther_re_ent32#666[__this := redeemableEther_re_ent32#666[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

// 
// Function: setGameInfo
procedure {:sourceloc "buggy_25.sol", 187, 3} {:message "WhiteBetting::setGameInfo"} setGameInfo#821(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#704: int, _timestamp#706: int, _odd_homeTeam#708: int, _odd_drawTeam#710: int, _odd_awayTeam#712: int, _odd_over#714: int, _odd_under#716: int, _odd_homeTeamAndDraw#718: int, _odd_homeAndAwayTeam#720: int, _odd_awayTeamAndDraw#722: int, _open_status#724: int)
{
	var call_arg#28: int_arr_ptr;
	var new_array#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#29 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#28 := new_array#29;
	mem_arr_int := mem_arr_int[call_arg#28 := int_arr#constr(default_int_int()[0 := 79][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114][9 := 32][10 := 109][11 := 101][12 := 116][13 := 104][14 := 111][15 := 100][16 := 115][17 := 32][18 := 99][19 := 97][20 := 108][21 := 108][22 := 101][23 := 100][24 := 32][25 := 98][26 := 121][27 := 32][28 := 110][29 := 111][30 := 110][31 := 45][32 := 111][33 := 119][34 := 110][35 := 101][36 := 114][37 := 46], 38)];
	assume (__msg_sender == owner#42[__this]);
	// Function body starts here
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(_timestamp#706, odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_homeTeam#708, odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_drawTeam#710, odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_awayTeam#712, odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_over#714, odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_under#716, odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_homeTeamAndDraw#718, odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_homeAndAwayTeam#720, odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _odd_awayTeamAndDraw#722, open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), _open_status#724, isDone#64#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]))]];
	gameList#109 := gameList#109[__this := gameList#109[__this][_fixtureId#704 := GameInfo#65#constr(timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#704]), false)]];
	assume {:sourceloc "buggy_25.sol", 199, 10} {:message ""} true;
	call SetGame#373(__this, __msg_sender, __msg_value, _fixtureId#704, _timestamp#706, _odd_homeTeam#708, _odd_drawTeam#710, _odd_awayTeam#712, _odd_over#714, _odd_under#716, _odd_homeTeamAndDraw#718, _odd_homeAndAwayTeam#720, _odd_awayTeamAndDraw#722, _open_status#724);
	$return19:
	// Function body ends here
	$return18:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 201, 1} {:message "balances_re_ent38"} balances_re_ent38#825: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_25.sol", 202, 1} {:message "WhiteBetting::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#858(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#827: int)
{
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#825[__this][__msg_sender] >= _weiToWithdraw#827);
	assume {:sourceloc "buggy_25.sol", 205, 11} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, _weiToWithdraw#827);
	assume __send_ret#31;
	balances_re_ent38#825 := balances_re_ent38#825[__this := balances_re_ent38#825[__this][__msg_sender := (balances_re_ent38#825[__this][__msg_sender] - _weiToWithdraw#827)]];
	$return20:
	// Function body ends here
}

// 
// Function: placeBet
procedure {:sourceloc "buggy_25.sol", 210, 3} {:message "WhiteBetting::placeBet"} placeBet#1048(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#860: int, _selectedTeam#862: int, _odd#864: int)
{
	var {:sourceloc "buggy_25.sol", 211, 5} {:message "stake"} stake#868: int;
	var new_struct_BetFixture#32: address_struct_memory_BetFixture#118;
	var call_arg#33: address_t;
	var call_arg#34: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	stake#868 := __msg_value;
	assume (stake#868 >= 1000000000000000);
	assume (_odd#864 != 0);
	if ((_selectedTeam#862 == 1)) {
	assume (odd_homeTeam#46#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	if ((_selectedTeam#862 == 2)) {
	assume (odd_drawTeam#48#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	if ((_selectedTeam#862 == 3)) {
	assume (odd_awayTeam#50#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	if ((_selectedTeam#862 == 4)) {
	assume (odd_over#52#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	if ((_selectedTeam#862 == 5)) {
	assume (odd_under#54#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	if ((_selectedTeam#862 == 6)) {
	assume (odd_homeTeamAndDraw#56#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	if ((_selectedTeam#862 == 7)) {
	assume (odd_homeAndAwayTeam#58#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	if ((_selectedTeam#862 == 8)) {
	assume (odd_awayTeamAndDraw#60#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == _odd#864);
	}
	else {
	assume false;
	}

	}

	}

	}

	}

	}

	}

	}

	assume (open_status#62#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) == 3);
	assume (__block_timestamp < (timestamp#44#GameInfo#65#constr(gameList#109[__this][_fixtureId#860]) - 600));
	new_struct_BetFixture#32 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	player#111 := player#111[new_struct_BetFixture#32 := __msg_sender];
	stake#113 := stake#113[new_struct_BetFixture#32 := stake#868];
	odd#115 := odd#115[new_struct_BetFixture#32 := _odd#864];
	selectedTeam#117 := selectedTeam#117[new_struct_BetFixture#32 := _selectedTeam#862];
	betList#156 := betList#156[__this := betList#156[__this][_fixtureId#860 := struct_storage_BetFixture#118_arr#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) := BetFixture#118#constr(0, 0, 0, 0)], length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]))]];
	// Deep copy struct BetFixture
	betList#156 := betList#156[__this := betList#156[__this][_fixtureId#860 := struct_storage_BetFixture#118_arr#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) := BetFixture#118#constr(player#111[new_struct_BetFixture#32], stake#113#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), odd#115#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), selectedTeam#117#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]))], length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]))]];
	betList#156 := betList#156[__this := betList#156[__this][_fixtureId#860 := struct_storage_BetFixture#118_arr#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) := BetFixture#118#constr(player#111#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), stake#113[new_struct_BetFixture#32], odd#115#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), selectedTeam#117#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]))], length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]))]];
	betList#156 := betList#156[__this := betList#156[__this][_fixtureId#860 := struct_storage_BetFixture#118_arr#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) := BetFixture#118#constr(player#111#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), stake#113#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), odd#115[new_struct_BetFixture#32], selectedTeam#117#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]))], length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]))]];
	betList#156 := betList#156[__this := betList#156[__this][_fixtureId#860 := struct_storage_BetFixture#118_arr#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) := BetFixture#118#constr(player#111#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), stake#113#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), odd#115#BetFixture#118#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])[length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])]), selectedTeam#117[new_struct_BetFixture#32])], length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]))]];
	assume ((0 <= length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860])) && (length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	betList#156 := betList#156[__this := betList#156[__this][_fixtureId#860 := struct_storage_BetFixture#118_arr#constr(arr#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]), (length#struct_storage_BetFixture#118_arr#constr(betList#156[__this][_fixtureId#860]) + 1))]];
	call_arg#33 := __msg_sender;
	call_arg#34 := _odd#864;
	assume {:sourceloc "buggy_25.sol", 245, 10} {:message ""} true;
	call NewStake#319(__this, __msg_sender, __msg_value, call_arg#33, _fixtureId#860, _selectedTeam#862, stake#868, call_arg#34);
	$return21:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 248, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#1052: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_25.sol", 249, 1} {:message "WhiteBetting::claimReward_re_ent4"} claimReward_re_ent4#1088(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 252, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#1065: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#1052[__this][__msg_sender] > 0);
	transferValue_re_ent4#1065 := redeemableEther_re_ent4#1052[__this][__msg_sender];
	assume {:sourceloc "buggy_25.sol", 253, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#1065);
	redeemableEther_re_ent4#1052 := redeemableEther_re_ent4#1052[__this := redeemableEther_re_ent4#1052[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// Function: givePrizeMoney
procedure {:sourceloc "buggy_25.sol", 258, 3} {:message "WhiteBetting::givePrizeMoney"} {:skipped} givePrizeMoney#1293(__this: address_t, __msg_sender: address_t, __msg_value: int, _fixtureId#1090: int, _homeDrawAway#1092: int, _overUnder#1094: int);
	modifies lastPlayer_re_ent9#3, jackpot_re_ent9#5, owner#42, redeemableEther_re_ent25#69, gameList#109, userBalance_re_ent19#122, betList#156, balances_re_ent36#160, counter_re_ent35#190, userBalance_re_ent40#229, userBalance_re_ent33#273, not_called_re_ent27#322, balances_re_ent31#377, not_called_re_ent13#433, userBalance_re_ent26#489, not_called_re_ent20#543, redeemableEther_re_ent32#666, balances_re_ent38#825, redeemableEther_re_ent4#1052, counter_re_ent7#1296, lastPlayer_re_ent23#1351, jackpot_re_ent23#1353, counter_re_ent14#1398, lastPlayer_re_ent30#1441, jackpot_re_ent30#1443, balances_re_ent8#1488, redeemableEther_re_ent39#1554;

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_25.sol", 290, 1} {:message "counter_re_ent7"} counter_re_ent7#1296: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_25.sol", 291, 1} {:message "WhiteBetting::callme_re_ent7"} callme_re_ent7#1325(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	var __send_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1296[__this] <= 5);
	call_arg#42 := 10000000000000000000;
	assume {:sourceloc "buggy_25.sol", 293, 9} {:message ""} true;
	call __send_ret#43 := __send(__msg_sender, __this, 0, call_arg#42);
	if (!(__send_ret#43)) {
	assume false;
	}

	counter_re_ent7#1296 := counter_re_ent7#1296[__this := (counter_re_ent7#1296[__this] + 1)];
	$return25:
	// Function body ends here
}

// 
// Function: getBalance
procedure {:sourceloc "buggy_25.sol", 306, 3} {:message "WhiteBetting::getBalance"} getBalance#1349(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1340: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1340 := __balance[__this];
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_25.sol", 309, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1351: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_25.sol", 310, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1353: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_25.sol", 311, 4} {:message "WhiteBetting::buyTicket_re_ent23"} buyTicket_re_ent23#1383(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#44: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_25.sol", 312, 12} {:message ""} true;
	call __send_ret#44 := __send(lastPlayer_re_ent23#1351[__this], __this, 0, jackpot_re_ent23#1353[__this]);
	if (!(__send_ret#44)) {
	assume false;
	}

	lastPlayer_re_ent23#1351 := lastPlayer_re_ent23#1351[__this := __msg_sender];
	jackpot_re_ent23#1353 := jackpot_re_ent23#1353[__this := __balance[__this]];
	$return27:
	// Function body ends here
}

// 
// Function: deposit
procedure {:sourceloc "buggy_25.sol", 319, 3} {:message "WhiteBetting::deposit"} deposit#1395(__this: address_t, __msg_sender: address_t, __msg_value: int, _eth#1385: int)
{
	var call_arg#45: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	call_arg#45 := __msg_sender;
	assume {:sourceloc "buggy_25.sol", 320, 10} {:message ""} true;
	call Deposit#225(__this, __msg_sender, __msg_value, call_arg#45, _eth#1385);
	$return28:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_25.sol", 322, 1} {:message "counter_re_ent14"} counter_re_ent14#1398: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_25.sol", 323, 1} {:message "WhiteBetting::callme_re_ent14"} callme_re_ent14#1427(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1398[__this] <= 5);
	call_arg#46 := 10000000000000000000;
	assume {:sourceloc "buggy_25.sol", 325, 9} {:message ""} true;
	call __send_ret#47 := __send(__msg_sender, __this, 0, call_arg#46);
	if (!(__send_ret#47)) {
	assume false;
	}

	counter_re_ent14#1398 := counter_re_ent14#1398[__this := (counter_re_ent14#1398[__this] + 1)];
	$return29:
	// Function body ends here
}

// 
// Function: changeOwner
procedure {:sourceloc "buggy_25.sol", 332, 3} {:message "WhiteBetting::changeOwner"} changeOwner#1439(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#1429: address_t)
{
	var call_arg#49: int_arr_ptr;
	var new_array#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#50 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#49 := new_array#50;
	mem_arr_int := mem_arr_int[call_arg#49 := int_arr#constr(default_int_int()[0 := 79][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114][9 := 32][10 := 109][11 := 101][12 := 116][13 := 104][14 := 111][15 := 100][16 := 115][17 := 32][18 := 99][19 := 97][20 := 108][21 := 108][22 := 101][23 := 100][24 := 32][25 := 98][26 := 121][27 := 32][28 := 110][29 := 111][30 := 110][31 := 45][32 := 111][33 := 119][34 := 110][35 := 101][36 := 114][37 := 46], 38)];
	assume (__msg_sender == owner#42[__this]);
	// Function body starts here
	owner#42 := owner#42[__this := _newOwner#1429];
	$return31:
	// Function body ends here
	$return30:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_25.sol", 335, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1441: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_25.sol", 336, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1443: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_25.sol", 337, 4} {:message "WhiteBetting::buyTicket_re_ent30"} buyTicket_re_ent30#1473(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_25.sol", 338, 12} {:message ""} true;
	call __send_ret#52 := __send(lastPlayer_re_ent30#1441[__this], __this, 0, jackpot_re_ent30#1443[__this]);
	if (!(__send_ret#52)) {
	assume false;
	}

	lastPlayer_re_ent30#1441 := lastPlayer_re_ent30#1441[__this := __msg_sender];
	jackpot_re_ent30#1443 := jackpot_re_ent30#1443[__this := __balance[__this]];
	$return32:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_25.sol", 345, 3} {:message "WhiteBetting::[receive]"} #1484(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_25.sol", 346, 5} {:message ""} true;
	call __transfer(owner#42[__this], __this, 0, __msg_value);
	$return33:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 348, 1} {:message "balances_re_ent8"} balances_re_ent8#1488: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_25.sol", 349, 5} {:message "WhiteBetting::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1517(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 350, 9} {:message "success"} success#1492: bool;
	var __call_ret#53: bool;
	var __call_ret#54: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1488[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1488[__this][__msg_sender])];
	assume {:sourceloc "buggy_25.sol", 350, 26} {:message ""} true;
	call __call_ret#53, __call_ret#54 := __call(__msg_sender, __this, balances_re_ent8#1488[__this][__msg_sender]);
	if (__call_ret#53) {
	havoc lastPlayer_re_ent9#3;
	havoc jackpot_re_ent9#5;
	havoc owner#42;
	havoc redeemableEther_re_ent25#69;
	havoc gameList#109;
	havoc userBalance_re_ent19#122;
	havoc betList#156;
	havoc balances_re_ent36#160;
	havoc counter_re_ent35#190;
	havoc userBalance_re_ent40#229;
	havoc userBalance_re_ent33#273;
	havoc not_called_re_ent27#322;
	havoc balances_re_ent31#377;
	havoc not_called_re_ent13#433;
	havoc userBalance_re_ent26#489;
	havoc not_called_re_ent20#543;
	havoc redeemableEther_re_ent32#666;
	havoc balances_re_ent38#825;
	havoc redeemableEther_re_ent4#1052;
	havoc counter_re_ent7#1296;
	havoc lastPlayer_re_ent23#1351;
	havoc jackpot_re_ent23#1353;
	havoc counter_re_ent14#1398;
	havoc lastPlayer_re_ent30#1441;
	havoc jackpot_re_ent30#1443;
	havoc balances_re_ent8#1488;
	havoc redeemableEther_re_ent39#1554;
	havoc __balance;
	}

	if (!(__call_ret#53)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1488[__this][__msg_sender])];
	}

	success#1492 := __call_ret#53;
	if (success#1492) {
	balances_re_ent8#1488 := balances_re_ent8#1488[__this := balances_re_ent8#1488[__this][__msg_sender := 0]];
	}

	$return34:
	// Function body ends here
}

// 
// Function: withdraw
procedure {:sourceloc "buggy_25.sol", 356, 3} {:message "WhiteBetting::withdraw"} withdraw#1550(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#1519: int)
{
	var call_arg#56: int_arr_ptr;
	var new_array#57: int_arr_ptr;
	var call_arg#59: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier onlyOwner starts here
	new_array#57 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#56 := new_array#57;
	mem_arr_int := mem_arr_int[call_arg#56 := int_arr#constr(default_int_int()[0 := 79][1 := 110][2 := 108][3 := 121][4 := 79][5 := 119][6 := 110][7 := 101][8 := 114][9 := 32][10 := 109][11 := 101][12 := 116][13 := 104][14 := 111][15 := 100][16 := 115][17 := 32][18 := 99][19 := 97][20 := 108][21 := 108][22 := 101][23 := 100][24 := 32][25 := 98][26 := 121][27 := 32][28 := 110][29 := 111][30 := 110][31 := 45][32 := 111][33 := 119][34 := 110][35 := 101][36 := 114][37 := 46], 38)];
	assume (__msg_sender == owner#42[__this]);
	// Function body starts here
	assume ((_amount#1519 > 0) && (_amount#1519 <= __balance[__this]));
	assume {:sourceloc "buggy_25.sol", 358, 5} {:message ""} true;
	call __transfer(owner#42[__this], __this, 0, _amount#1519);
	call_arg#59 := owner#42[__this];
	assume {:sourceloc "buggy_25.sol", 359, 10} {:message ""} true;
	call Withdraw#269(__this, __msg_sender, __msg_value, call_arg#59, _amount#1519);
	$return36:
	// Function body ends here
	$return35:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_25.sol", 361, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1554: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_25.sol", 362, 1} {:message "WhiteBetting::claimReward_re_ent39"} claimReward_re_ent39#1590(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_25.sol", 365, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1567: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1554[__this][__msg_sender] > 0);
	transferValue_re_ent39#1567 := redeemableEther_re_ent39#1554[__this][__msg_sender];
	assume {:sourceloc "buggy_25.sol", 366, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1567);
	redeemableEther_re_ent39#1554 := redeemableEther_re_ent39#1554[__this := redeemableEther_re_ent39#1554[__this][__msg_sender := 0]];
	$return37:
	// Function body ends here
}

