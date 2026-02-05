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
procedure {:inline 1} {:sourceloc "buggy_45.sol", 12, 3} {:message "[event] StockBet::GameCreated"} GameCreated#18(__this: address_t, __msg_sender: address_t, __msg_value: int, bet#16: int)
{
	
}

// 
// Event: GameOpened
procedure {:inline 1} {:sourceloc "buggy_45.sol", 22, 3} {:message "[event] StockBet::GameOpened"} GameOpened#48(__this: address_t, __msg_sender: address_t, __msg_value: int, initialPrice#46: int)
{
	
}

// 
// Event: GameClosed
procedure {:inline 1} {:sourceloc "buggy_45.sol", 32, 3} {:message "[event] StockBet::GameClosed"} GameClosed#65(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: OracleSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 39, 3} {:message "[event] StockBet::OracleSet"} OracleSet#93(__this: address_t, __msg_sender: address_t, __msg_value: int, oracle#91: address_t)
{
	
}

// 
// Event: FinalPriceSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 42, 3} {:message "[event] StockBet::FinalPriceSet"} FinalPriceSet#109(__this: address_t, __msg_sender: address_t, __msg_value: int, finalPrice#107: int)
{
	
}

// 
// Event: PlayerBet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 48, 3} {:message "[event] StockBet::PlayerBet"} PlayerBet#136(__this: address_t, __msg_sender: address_t, __msg_value: int, player#132: address_t, guess#134: int)
{
	
}

// 
// Event: PlayersWin
procedure {:inline 1} {:sourceloc "buggy_45.sol", 56, 3} {:message "[event] StockBet::PlayersWin"} PlayersWin#166(__this: address_t, __msg_sender: address_t, __msg_value: int, result#162: int, splitJackpot#164: int)
{
	
}

// 
// Event: OwnerWins
procedure {:inline 1} {:sourceloc "buggy_45.sol", 60, 3} {:message "[event] StockBet::OwnerWins"} OwnerWins#184(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#182: address_t)
{
	
}

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
// Function: my_func_unchk35 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 9, 3} {:message "StockBet::my_func_unchk35"} my_func_unchk35#14(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#3: address_t)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_45.sol", 10, 9} {:message ""} true;
	call __send_ret#0 := __send(dst#3, __this, 0, __msg_value);
	$return0:
	// Function body ends here
}

// 
// State variable: payedOut_unchk44: bool
var {:sourceloc "buggy_45.sol", 13, 3} {:message "payedOut_unchk44"} payedOut_unchk44#21: [address_t]bool;
// 
// State variable: winner_unchk44: address payable
var {:sourceloc "buggy_45.sol", 14, 1} {:message "winner_unchk44"} winner_unchk44#23: [address_t]address_t;
// 
// State variable: winAmount_unchk44: uint256
var {:sourceloc "buggy_45.sol", 15, 1} {:message "winAmount_unchk44"} winAmount_unchk44#25: [address_t]int;
// 
// Function: sendToWinner_unchk44 : function ()
procedure {:sourceloc "buggy_45.sol", 17, 1} {:message "StockBet::sendToWinner_unchk44"} sendToWinner_unchk44#44(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk44#21[__this]);
	assume {:sourceloc "buggy_45.sol", 19, 9} {:message ""} true;
	call __send_ret#1 := __send(winner_unchk44#23[__this], __this, 0, winAmount_unchk44#25[__this]);
	payedOut_unchk44#21 := payedOut_unchk44#21[__this := true];
	$return1:
	// Function body ends here
}

// 
// Function: UncheckedExternalCall_unchk40 : function ()
procedure {:sourceloc "buggy_45.sol", 23, 3} {:message "StockBet::UncheckedExternalCall_unchk40"} UncheckedExternalCall_unchk40#63(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 24, 4} {:message "addr_unchk40"} addr_unchk40#52: address_t;
	var call_arg#2: int;
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk40#52 := 0;
	call_arg#2 := 2000000000000000000;
	assume {:sourceloc "buggy_45.sol", 25, 10} {:message ""} true;
	call __send_ret#3 := __send(addr_unchk40#52, __this, 0, call_arg#2);
	if (!(__send_ret#3)) {
	
	}
	else {
	
	}

	$return2:
	// Function body ends here
}

// 
// State variable: payedOut_unchk33: bool
var {:sourceloc "buggy_45.sol", 33, 3} {:message "payedOut_unchk33"} payedOut_unchk33#68: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk33 : function ()
procedure {:sourceloc "buggy_45.sol", 35, 1} {:message "StockBet::withdrawLeftOver_unchk33"} withdrawLeftOver_unchk33#89(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk33#68[__this];
	assume {:sourceloc "buggy_45.sol", 37, 3} {:message ""} true;
	call __send_ret#4 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return3:
	// Function body ends here
}

// 
// Function: bug_unchk27 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 40, 3} {:message "StockBet::bug_unchk27"} bug_unchk27#105(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#95: address_t)
{
	var call_arg#5: int;
	var __send_ret#6: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#5 := 42000000000000000000;
	assume {:sourceloc "buggy_45.sol", 41, 8} {:message ""} true;
	call __send_ret#6 := __send(addr#95, __this, 0, call_arg#5);
	$return4:
	// Function body ends here
}

// 
// Function: bug_unchk31 : function ()
procedure {:sourceloc "buggy_45.sol", 43, 3} {:message "StockBet::bug_unchk31"} bug_unchk31#130(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 44, 1} {:message "addr_unchk31"} addr_unchk31#113: address_t;
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk31#113 := 0;
	call_arg#7 := 10000000000000000000;
	assume {:sourceloc "buggy_45.sol", 45, 6} {:message ""} true;
	call __send_ret#8 := __send(addr_unchk31#113, __this, 0, call_arg#7);
	if ((!(__send_ret#8) || (1 == 1))) {
	assume false;
	}

	$return5:
	// Function body ends here
}

// 
// State variable: payedOut_unchk45: bool
var {:sourceloc "buggy_45.sol", 50, 3} {:message "payedOut_unchk45"} payedOut_unchk45#139: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk45 : function ()
procedure {:sourceloc "buggy_45.sol", 52, 1} {:message "StockBet::withdrawLeftOver_unchk45"} withdrawLeftOver_unchk45#160(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#9: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk45#139[__this];
	assume {:sourceloc "buggy_45.sol", 54, 3} {:message ""} true;
	call __send_ret#9 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return6:
	// Function body ends here
}

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
// Function: callnotchecked_unchk13 : function (address)
procedure {:sourceloc "buggy_45.sol", 57, 3} {:message "StockBet::callnotchecked_unchk13"} callnotchecked_unchk13#180(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#168: address_t)
{
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 58, 5} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(callee#168, __this, 1000000000000000000);
	if (__call_ret#10) {
	havoc payedOut_unchk44#21;
	havoc winner_unchk44#23;
	havoc winAmount_unchk44#25;
	havoc payedOut_unchk33#68;
	havoc payedOut_unchk45#139;
	havoc owner#219;
	havoc oracle#238;
	havoc state#254;
	havoc guesses#270;
	havoc payedOut_unchk9#273;
	havoc bet#296;
	havoc splitJackpot#298;
	havoc result#314;
	havoc initialPrice#337;
	havoc finalPrice#351;
	havoc payedOut_unchk20#354;
	havoc winner_unchk20#356;
	havoc winAmount_unchk20#358;
	havoc payedOut_unchk32#383;
	havoc winner_unchk32#385;
	havoc winAmount_unchk32#387;
	havoc payedOut_unchk8#833;
	havoc winner_unchk8#835;
	havoc winAmount_unchk8#837;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return7:
	// Function body ends here
}

// Enum definition State mapped to int
// Enum definition PaidStatus mapped to int
// 
// ------- Struct Guess -------
// Storage
type {:datatype} struct_storage_Guess#202;
function {:constructor} Guess#202#constr(players#199: [address_t]int, guesses_number#201: int) returns (struct_storage_Guess#202);
// Memory
type address_struct_memory_Guess#202 = int;
// Member players
var {:sourceloc "buggy_45.sol", 73, 9} {:message "players"} players#199: [address_struct_memory_Guess#202][address_t]int;
// Member guesses_number
var {:sourceloc "buggy_45.sol", 74, 9} {:message "guesses_number"} guesses_number#201: [address_struct_memory_Guess#202]int;
// 
// ------- End of struct Guess -------
// 
// Function: my_func_uncheck48 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 77, 3} {:message "StockBet::my_func_uncheck48"} my_func_uncheck48#217(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#204: address_t)
{
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_45.sol", 78, 7} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(dst#204, __this, __msg_value);
	if (__call_ret#12) {
	havoc payedOut_unchk44#21;
	havoc winner_unchk44#23;
	havoc winAmount_unchk44#25;
	havoc payedOut_unchk33#68;
	havoc payedOut_unchk45#139;
	havoc owner#219;
	havoc oracle#238;
	havoc state#254;
	havoc guesses#270;
	havoc payedOut_unchk9#273;
	havoc bet#296;
	havoc splitJackpot#298;
	havoc result#314;
	havoc initialPrice#337;
	havoc finalPrice#351;
	havoc payedOut_unchk20#354;
	havoc winner_unchk20#356;
	havoc winAmount_unchk20#358;
	havoc payedOut_unchk32#383;
	havoc winner_unchk32#385;
	havoc winAmount_unchk32#387;
	havoc payedOut_unchk8#833;
	havoc winner_unchk8#835;
	havoc winAmount_unchk8#837;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_45.sol", 80, 3} {:message "owner"} owner#219: [address_t]address_t;
// 
// Function: withdrawBal_unchk17 : function ()
procedure {:sourceloc "buggy_45.sol", 81, 3} {:message "StockBet::withdrawBal_unchk17"} withdrawBal_unchk17#236(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 82, 2} {:message "Balances_unchk17"} Balances_unchk17#223: int;
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	Balances_unchk17#223 := 0;
	call_arg#14 := Balances_unchk17#223;
	assume {:sourceloc "buggy_45.sol", 83, 3} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, call_arg#14);
	$return9:
	// Function body ends here
}

// 
// State variable: oracle: address
var {:sourceloc "buggy_45.sol", 84, 3} {:message "oracle"} oracle#238: [address_t]address_t;
// 
// Function: callnotchecked_unchk37 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 85, 3} {:message "StockBet::callnotchecked_unchk37"} callnotchecked_unchk37#252(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#240: address_t)
{
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 86, 5} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(callee#240, __this, 1000000000000000000);
	if (__call_ret#16) {
	havoc payedOut_unchk44#21;
	havoc winner_unchk44#23;
	havoc winAmount_unchk44#25;
	havoc payedOut_unchk33#68;
	havoc payedOut_unchk45#139;
	havoc owner#219;
	havoc oracle#238;
	havoc state#254;
	havoc guesses#270;
	havoc payedOut_unchk9#273;
	havoc bet#296;
	havoc splitJackpot#298;
	havoc result#314;
	havoc initialPrice#337;
	havoc finalPrice#351;
	havoc payedOut_unchk20#354;
	havoc winner_unchk20#356;
	havoc winAmount_unchk20#358;
	havoc payedOut_unchk32#383;
	havoc winner_unchk32#385;
	havoc winAmount_unchk32#387;
	havoc payedOut_unchk8#833;
	havoc winner_unchk8#835;
	havoc winAmount_unchk8#837;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return10:
	// Function body ends here
}

// 
// State variable: state: enum StockBet.State
var {:sourceloc "buggy_45.sol", 88, 3} {:message "state"} state#254: [address_t]int;
// 
// Function: bug_unchk3 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 90, 3} {:message "StockBet::bug_unchk3"} bug_unchk3#266(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#256: address_t)
{
	var call_arg#18: int;
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#18 := 42000000000000000000;
	assume {:sourceloc "buggy_45.sol", 91, 8} {:message ""} true;
	call __send_ret#19 := __send(addr#256, __this, 0, call_arg#18);
	$return11:
	// Function body ends here
}

// 
// State variable: guesses: mapping(uint256 => struct StockBet.Guess storage ref)
var {:sourceloc "buggy_45.sol", 92, 3} {:message "guesses"} guesses#270: [address_t][int]struct_storage_Guess#202;
// 
// State variable: payedOut_unchk9: bool
var {:sourceloc "buggy_45.sol", 94, 3} {:message "payedOut_unchk9"} payedOut_unchk9#273: [address_t]bool;
// 
// Function: withdrawLeftOver_unchk9 : function ()
procedure {:sourceloc "buggy_45.sol", 96, 1} {:message "StockBet::withdrawLeftOver_unchk9"} withdrawLeftOver_unchk9#294(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#20: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume payedOut_unchk9#273[__this];
	assume {:sourceloc "buggy_45.sol", 98, 3} {:message ""} true;
	call __send_ret#20 := __send(__msg_sender, __this, 0, __balance[__this]);
	$return12:
	// Function body ends here
}

// 
// State variable: bet: uint256
var {:sourceloc "buggy_45.sol", 100, 3} {:message "bet"} bet#296: [address_t]int;
// 
// State variable: splitJackpot: uint256
var {:sourceloc "buggy_45.sol", 101, 5} {:message "splitJackpot"} splitJackpot#298: [address_t]int;
// 
// Function: callnotchecked_unchk25 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 102, 3} {:message "StockBet::callnotchecked_unchk25"} callnotchecked_unchk25#312(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#300: address_t)
{
	var __call_ret#21: bool;
	var __call_ret#22: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 103, 5} {:message ""} true;
	call __call_ret#21, __call_ret#22 := __call(callee#300, __this, 1000000000000000000);
	if (__call_ret#21) {
	havoc payedOut_unchk44#21;
	havoc winner_unchk44#23;
	havoc winAmount_unchk44#25;
	havoc payedOut_unchk33#68;
	havoc payedOut_unchk45#139;
	havoc owner#219;
	havoc oracle#238;
	havoc state#254;
	havoc guesses#270;
	havoc payedOut_unchk9#273;
	havoc bet#296;
	havoc splitJackpot#298;
	havoc result#314;
	havoc initialPrice#337;
	havoc finalPrice#351;
	havoc payedOut_unchk20#354;
	havoc winner_unchk20#356;
	havoc winAmount_unchk20#358;
	havoc payedOut_unchk32#383;
	havoc winner_unchk32#385;
	havoc winAmount_unchk32#387;
	havoc payedOut_unchk8#833;
	havoc winner_unchk8#835;
	havoc winAmount_unchk8#837;
	havoc __balance;
	}

	if (!(__call_ret#21)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	$return13:
	// Function body ends here
}

// 
// State variable: result: uint256
var {:sourceloc "buggy_45.sol", 105, 3} {:message "result"} result#314: [address_t]int;
// 
// Function: bug_unchk19 : function ()
procedure {:sourceloc "buggy_45.sol", 106, 3} {:message "StockBet::bug_unchk19"} bug_unchk19#335(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 107, 1} {:message "addr_unchk19"} addr_unchk19#318: address_t;
	var call_arg#23: int;
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk19#318 := 0;
	call_arg#23 := 10000000000000000000;
	assume {:sourceloc "buggy_45.sol", 108, 6} {:message ""} true;
	call __send_ret#24 := __send(addr_unchk19#318, __this, 0, call_arg#23);
	if ((!(__send_ret#24) || (1 == 1))) {
	assume false;
	}

	$return14:
	// Function body ends here
}

// 
// State variable: initialPrice: uint256
var {:sourceloc "buggy_45.sol", 111, 3} {:message "initialPrice"} initialPrice#337: [address_t]int;
// 
// Function: unhandledsend_unchk26 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 112, 3} {:message "StockBet::unhandledsend_unchk26"} unhandledsend_unchk26#349(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#339: address_t)
{
	var call_arg#25: int;
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#25 := 5000000000000000000;
	assume {:sourceloc "buggy_45.sol", 113, 5} {:message ""} true;
	call __send_ret#26 := __send(callee#339, __this, 0, call_arg#25);
	$return15:
	// Function body ends here
}

// 
// State variable: finalPrice: uint256
var {:sourceloc "buggy_45.sol", 115, 3} {:message "finalPrice"} finalPrice#351: [address_t]int;
// 
// State variable: payedOut_unchk20: bool
var {:sourceloc "buggy_45.sol", 117, 3} {:message "payedOut_unchk20"} payedOut_unchk20#354: [address_t]bool;
// 
// State variable: winner_unchk20: address payable
var {:sourceloc "buggy_45.sol", 118, 1} {:message "winner_unchk20"} winner_unchk20#356: [address_t]address_t;
// 
// State variable: winAmount_unchk20: uint256
var {:sourceloc "buggy_45.sol", 119, 1} {:message "winAmount_unchk20"} winAmount_unchk20#358: [address_t]int;
// 
// Function: sendToWinner_unchk20 : function ()
procedure {:sourceloc "buggy_45.sol", 121, 1} {:message "StockBet::sendToWinner_unchk20"} sendToWinner_unchk20#377(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk20#354[__this]);
	assume {:sourceloc "buggy_45.sol", 123, 9} {:message ""} true;
	call __send_ret#27 := __send(winner_unchk20#356[__this], __this, 0, winAmount_unchk20#358[__this]);
	payedOut_unchk20#354 := payedOut_unchk20#354[__this := true];
	$return16:
	// Function body ends here
}

// 
// State variable: payedOut_unchk32: bool
var {:sourceloc "buggy_45.sol", 127, 3} {:message "payedOut_unchk32"} payedOut_unchk32#383: [address_t]bool;
// 
// State variable: winner_unchk32: address payable
var {:sourceloc "buggy_45.sol", 128, 1} {:message "winner_unchk32"} winner_unchk32#385: [address_t]address_t;
// 
// State variable: winAmount_unchk32: uint256
var {:sourceloc "buggy_45.sol", 129, 1} {:message "winAmount_unchk32"} winAmount_unchk32#387: [address_t]int;
// 
// Function: sendToWinner_unchk32 : function ()
procedure {:sourceloc "buggy_45.sol", 131, 1} {:message "StockBet::sendToWinner_unchk32"} sendToWinner_unchk32#406(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk32#383[__this]);
	assume {:sourceloc "buggy_45.sol", 133, 9} {:message ""} true;
	call __send_ret#28 := __send(winner_unchk32#385[__this], __this, 0, winAmount_unchk32#387[__this]);
	payedOut_unchk32#383 := payedOut_unchk32#383[__this := true];
	$return17:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int |T@struct_storage_Guess#202|)) (|Guess#202#constr| ((as const (Array Int Int)) 0) 0))"} default_int_struct_storage_Guess#202() returns ([int]struct_storage_Guess#202);
// 
// Function: 
procedure {:sourceloc "buggy_45.sol", 162, 5} {:message "StockBet::[constructor]"} __constructor#941(__this: address_t, __msg_sender: address_t, __msg_value: int, _bet#456: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	payedOut_unchk44#21 := payedOut_unchk44#21[__this := false];
	winner_unchk44#23 := winner_unchk44#23[__this := 0];
	winAmount_unchk44#25 := winAmount_unchk44#25[__this := 0];
	payedOut_unchk33#68 := payedOut_unchk33#68[__this := false];
	payedOut_unchk45#139 := payedOut_unchk45#139[__this := false];
	owner#219 := owner#219[__this := 0];
	oracle#238 := oracle#238[__this := 0];
	state#254 := state#254[__this := 0];
	guesses#270 := guesses#270[__this := default_int_struct_storage_Guess#202()];
	payedOut_unchk9#273 := payedOut_unchk9#273[__this := false];
	bet#296 := bet#296[__this := 0];
	splitJackpot#298 := splitJackpot#298[__this := 0];
	result#314 := result#314[__this := 0];
	initialPrice#337 := initialPrice#337[__this := 0];
	finalPrice#351 := finalPrice#351[__this := 0];
	payedOut_unchk20#354 := payedOut_unchk20#354[__this := false];
	winner_unchk20#356 := winner_unchk20#356[__this := 0];
	winAmount_unchk20#358 := winAmount_unchk20#358[__this := 0];
	payedOut_unchk32#383 := payedOut_unchk32#383[__this := false];
	winner_unchk32#385 := winner_unchk32#385[__this := 0];
	winAmount_unchk32#387 := winAmount_unchk32#387[__this := 0];
	payedOut_unchk8#833 := payedOut_unchk8#833[__this := false];
	winner_unchk8#835 := winner_unchk8#835[__this := 0];
	winAmount_unchk8#837 := winAmount_unchk8#837[__this := 0];
	// Function body starts here
	assume (_bet#456 > 0);
	owner#219 := owner#219[__this := __msg_sender];
	state#254 := state#254[__this := 0];
	bet#296 := bet#296[__this := _bet#456];
	assume {:sourceloc "buggy_45.sol", 169, 14} {:message ""} true;
	call GameCreated#18(__this, __msg_sender, __msg_value, bet#296[__this]);
	$return18:
	// Function body ends here
}

// 
// Function: unhandledsend_unchk38 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 171, 1} {:message "StockBet::unhandledsend_unchk38"} unhandledsend_unchk38#499(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#489: address_t)
{
	var call_arg#29: int;
	var __send_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#29 := 5000000000000000000;
	assume {:sourceloc "buggy_45.sol", 172, 5} {:message ""} true;
	call __send_ret#30 := __send(callee#489, __this, 0, call_arg#29);
	$return19:
	// Function body ends here
}

// 
// Function: setOracle : function (address)
procedure {:sourceloc "buggy_45.sol", 175, 5} {:message "StockBet::setOracle"} setOracle#519(__this: address_t, __msg_sender: address_t, __msg_value: int, _oracle#501: address_t)
{
	var expected#444#321: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#219[__this]);
	// Inlined modifier inState starts here
	expected#444#321 := 0;
	assume (state#254[__this] == expected#444#321);
	// Function body starts here
	oracle#238 := oracle#238[__this := _oracle#501];
	assume {:sourceloc "buggy_45.sol", 178, 14} {:message ""} true;
	call OracleSet#93(__this, __msg_sender, __msg_value, oracle#238[__this]);
	$return22:
	// Function body ends here
	$return21:
	// Inlined modifier inState ends here
	$return20:
	// Inlined modifier byOwner ends here
}

// 
// Function: cash_unchk46 : function (uint256,uint256,address payable)
procedure {:sourceloc "buggy_45.sol", 180, 1} {:message "StockBet::cash_unchk46"} cash_unchk46#543(__this: address_t, __msg_sender: address_t, __msg_value: int, roundIndex#521: int, subpotIndex#523: int, winner_unchk46#525: address_t)
{
	var {:sourceloc "buggy_45.sol", 181, 9} {:message "subpot_unchk46"} subpot_unchk46#529: int;
	var call_arg#34: int;
	var __send_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	subpot_unchk46#529 := 3000000000000000000;
	call_arg#34 := subpot_unchk46#529;
	assume {:sourceloc "buggy_45.sol", 182, 9} {:message ""} true;
	call __send_ret#35 := __send(winner_unchk46#525, __this, 0, call_arg#34);
	subpot_unchk46#529 := 0;
	$return23:
	// Function body ends here
}

// 
// Function: setInitialPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 186, 5} {:message "StockBet::setInitialPrice"} setInitialPrice#568(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#545: int)
{
	var expected#444#371: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#238[__this]);
	// Inlined modifier inState starts here
	expected#444#371 := 0;
	assume (state#254[__this] == expected#444#371);
	// Function body starts here
	initialPrice#337 := initialPrice#337[__this := _value#545];
	state#254 := state#254[__this := 2];
	assume {:sourceloc "buggy_45.sol", 190, 14} {:message ""} true;
	call GameOpened#48(__this, __msg_sender, __msg_value, initialPrice#337[__this]);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier inState ends here
	$return24:
	// Inlined modifier byOracle ends here
}

// 
// Function: UncheckedExternalCall_unchk4 : function ()
procedure {:sourceloc "buggy_45.sol", 192, 1} {:message "StockBet::UncheckedExternalCall_unchk4"} UncheckedExternalCall_unchk4#583(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 193, 4} {:message "addr_unchk4"} addr_unchk4#572: address_t;
	var call_arg#39: int;
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk4#572 := 0;
	call_arg#39 := 42000000000000000000;
	assume {:sourceloc "buggy_45.sol", 194, 10} {:message ""} true;
	call __send_ret#40 := __send(addr_unchk4#572, __this, 0, call_arg#39);
	if (!(__send_ret#40)) {
	
	}
	else {
	
	}

	$return27:
	// Function body ends here
}

// 
// Function: closeGame : function ()
procedure {:sourceloc "buggy_45.sol", 202, 5} {:message "StockBet::closeGame"} closeGame#601(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#444#421: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#219[__this]);
	// Inlined modifier inState starts here
	expected#444#421 := 2;
	assume (state#254[__this] == expected#444#421);
	// Function body starts here
	state#254 := state#254[__this := 3];
	assume {:sourceloc "buggy_45.sol", 205, 14} {:message ""} true;
	call GameClosed#65(__this, __msg_sender, __msg_value);
	$return30:
	// Function body ends here
	$return29:
	// Inlined modifier inState ends here
	$return28:
	// Inlined modifier byOwner ends here
}

// 
// Function: bug_unchk7 : function ()
procedure {:sourceloc "buggy_45.sol", 207, 1} {:message "StockBet::bug_unchk7"} bug_unchk7#622(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 208, 1} {:message "addr_unchk7"} addr_unchk7#605: address_t;
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	addr_unchk7#605 := 0;
	call_arg#44 := 10000000000000000000;
	assume {:sourceloc "buggy_45.sol", 209, 6} {:message ""} true;
	call __send_ret#45 := __send(addr_unchk7#605, __this, 0, call_arg#44);
	if ((!(__send_ret#45) || (1 == 1))) {
	assume false;
	}

	$return31:
	// Function body ends here
}

// 
// Function: betUp : function ()
procedure {:sourceloc "buggy_45.sol", 213, 5} {:message "StockBet::betUp"} betUp#665(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#444#471: int;
	var tmp#49: int;
	var call_arg#50: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#238[__this]);
	// Inlined modifier inState starts here
	expected#444#471 := 2;
	assume (state#254[__this] == expected#444#471);
	// Function body starts here
	assume (__msg_value == (bet#296[__this] * 1000000000000000));
	tmp#49 := guesses_number#201#Guess#202#constr(guesses#270[__this][1]);
	guesses#270 := guesses#270[__this := guesses#270[__this][1 := Guess#202#constr(players#199#Guess#202#constr(guesses#270[__this][1]), (guesses_number#201#Guess#202#constr(guesses#270[__this][1]) + 1))]];
	guesses#270 := guesses#270[__this := guesses#270[__this][1 := Guess#202#constr(players#199#Guess#202#constr(guesses#270[__this][1])[__msg_sender := 1], guesses_number#201#Guess#202#constr(guesses#270[__this][1]))]];
	call_arg#50 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 219, 14} {:message ""} true;
	call PlayerBet#136(__this, __msg_sender, __msg_value, call_arg#50, 1);
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier inState ends here
	$return32:
	// Inlined modifier byPlayer ends here
}

// 
// Function: my_func_unchk23 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 221, 1} {:message "StockBet::my_func_unchk23"} my_func_unchk23#678(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#667: address_t)
{
	var __send_ret#51: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume {:sourceloc "buggy_45.sol", 222, 9} {:message ""} true;
	call __send_ret#51 := __send(dst#667, __this, 0, __msg_value);
	$return35:
	// Function body ends here
}

// 
// Function: betDown : function ()
procedure {:sourceloc "buggy_45.sol", 225, 5} {:message "StockBet::betDown"} betDown#721(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#444#531: int;
	var tmp#55: int;
	var call_arg#56: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#238[__this]);
	// Inlined modifier inState starts here
	expected#444#531 := 2;
	assume (state#254[__this] == expected#444#531);
	// Function body starts here
	assume (__msg_value == (bet#296[__this] * 1000000000000000));
	tmp#55 := guesses_number#201#Guess#202#constr(guesses#270[__this][0]);
	guesses#270 := guesses#270[__this := guesses#270[__this][0 := Guess#202#constr(players#199#Guess#202#constr(guesses#270[__this][0]), (guesses_number#201#Guess#202#constr(guesses#270[__this][0]) + 1))]];
	guesses#270 := guesses#270[__this := guesses#270[__this][0 := Guess#202#constr(players#199#Guess#202#constr(guesses#270[__this][0])[__msg_sender := 1], guesses_number#201#Guess#202#constr(guesses#270[__this][0]))]];
	call_arg#56 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 231, 14} {:message ""} true;
	call PlayerBet#136(__this, __msg_sender, __msg_value, call_arg#56, 0);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier inState ends here
	$return36:
	// Inlined modifier byPlayer ends here
}

// 
// Function: unhandledsend_unchk14 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 233, 1} {:message "StockBet::unhandledsend_unchk14"} unhandledsend_unchk14#733(__this: address_t, __msg_sender: address_t, __msg_value: int, callee#723: address_t)
{
	var call_arg#57: int;
	var __send_ret#58: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#57 := 5000000000000000000;
	assume {:sourceloc "buggy_45.sol", 234, 5} {:message ""} true;
	call __send_ret#58 := __send(callee#723, __this, 0, call_arg#57);
	$return39:
	// Function body ends here
}

// 
// Function: setFinalPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 238, 5} {:message "StockBet::setFinalPrice"} setFinalPrice#805(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#735: int)
{
	var expected#444#601: int;
	var getBalance#925_ret#62: int;
	var call_arg#63: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#238[__this]);
	// Inlined modifier inState starts here
	expected#444#601 := 3;
	assume (state#254[__this] == expected#444#601);
	// Function body starts here
	finalPrice#351 := finalPrice#351[__this := _value#735];
	assume {:sourceloc "buggy_45.sol", 243, 14} {:message ""} true;
	call FinalPriceSet#109(__this, __msg_sender, __msg_value, finalPrice#351[__this]);
	if ((finalPrice#351[__this] > initialPrice#337[__this])) {
	result#314 := result#314[__this := 1];
	}
	else {
	result#314 := result#314[__this := 0];
	}

	if ((guesses_number#201#Guess#202#constr(guesses#270[__this][result#314[__this]]) > 0)) {
	state#254 := state#254[__this := 4];
	assume {:sourceloc "buggy_45.sol", 254, 28} {:message ""} true;
	call getBalance#925_ret#62 := getBalance#925(__this, __msg_sender, __msg_value);
	splitJackpot#298 := splitJackpot#298[__this := (getBalance#925_ret#62 div guesses_number#201#Guess#202#constr(guesses#270[__this][result#314[__this]]))];
	assume {:sourceloc "buggy_45.sol", 255, 18} {:message ""} true;
	call PlayersWin#166(__this, __msg_sender, __msg_value, result#314[__this], splitJackpot#298[__this]);
	}
	else {
	state#254 := state#254[__this := 5];
	call_arg#63 := owner#219[__this];
	assume {:sourceloc "buggy_45.sol", 258, 18} {:message ""} true;
	call OwnerWins#184(__this, __msg_sender, __msg_value, call_arg#63);
	}

	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier inState ends here
	$return40:
	// Inlined modifier byOracle ends here
}

// 
// Function: bug_unchk30 : function ()
procedure {:sourceloc "buggy_45.sol", 261, 1} {:message "StockBet::bug_unchk30"} bug_unchk30#830(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 262, 1} {:message "receivers_unchk30"} receivers_unchk30#809: int;
	var {:sourceloc "buggy_45.sol", 263, 1} {:message "addr_unchk30"} addr_unchk30#812: address_t;
	var call_arg#64: int;
	var __send_ret#65: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	receivers_unchk30#809 := 0;
	addr_unchk30#812 := 0;
	call_arg#64 := 42000000000000000000;
	assume {:sourceloc "buggy_45.sol", 264, 6} {:message ""} true;
	call __send_ret#65 := __send(addr_unchk30#812, __this, 0, call_arg#64);
	if (!(__send_ret#65)) {
	receivers_unchk30#809 := (receivers_unchk30#809 + 1);
	}
	else {
	assume false;
	}

	$return43:
	// Function body ends here
}

// 
// State variable: payedOut_unchk8: bool
var {:sourceloc "buggy_45.sol", 270, 1} {:message "payedOut_unchk8"} payedOut_unchk8#833: [address_t]bool;
// 
// State variable: winner_unchk8: address payable
var {:sourceloc "buggy_45.sol", 271, 1} {:message "winner_unchk8"} winner_unchk8#835: [address_t]address_t;
// 
// State variable: winAmount_unchk8: uint256
var {:sourceloc "buggy_45.sol", 272, 1} {:message "winAmount_unchk8"} winAmount_unchk8#837: [address_t]int;
// 
// Function: sendToWinner_unchk8 : function ()
procedure {:sourceloc "buggy_45.sol", 274, 1} {:message "StockBet::sendToWinner_unchk8"} sendToWinner_unchk8#856(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#66: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume !(payedOut_unchk8#833[__this]);
	assume {:sourceloc "buggy_45.sol", 276, 9} {:message ""} true;
	call __send_ret#66 := __send(winner_unchk8#835[__this], __this, 0, winAmount_unchk8#837[__this]);
	payedOut_unchk8#833 := payedOut_unchk8#833[__this := true];
	$return44:
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
// Function: collectPlayerWinnings : function ()
procedure {:sourceloc "buggy_45.sol", 280, 5} {:message "StockBet::collectPlayerWinnings"} collectPlayerWinnings#901(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#444#681: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#238[__this]);
	// Inlined modifier inState starts here
	expected#444#681 := 4;
	assume (state#254[__this] == expected#444#681);
	// Function body starts here
	if ((players#199#Guess#202#constr(guesses#270[__this][result#314[__this]])[__msg_sender] == 1)) {
	guesses#270 := guesses#270[__this := guesses#270[__this][result#314[__this] := Guess#202#constr(players#199#Guess#202#constr(guesses#270[__this][result#314[__this]])[__msg_sender := 2], guesses_number#201#Guess#202#constr(guesses#270[__this][result#314[__this]]))]];
	assume {:sourceloc "buggy_45.sol", 283, 11} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, splitJackpot#298[__this]);
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
// Function: bug_unchk39 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 286, 1} {:message "StockBet::bug_unchk39"} bug_unchk39#913(__this: address_t, __msg_sender: address_t, __msg_value: int, addr#903: address_t)
{
	var call_arg#70: int;
	var __send_ret#71: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#70 := 4000000000000000000;
	assume {:sourceloc "buggy_45.sol", 287, 8} {:message ""} true;
	call __send_ret#71 := __send(addr#903, __this, 0, call_arg#70);
	$return48:
	// Function body ends here
}

// 
// Function: getBalance : function () view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_45.sol", 289, 5} {:message "StockBet::getBalance"} getBalance#925(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#916: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#916 := __balance[__this];
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// Function: my_func_uncheck36 : function (address payable)
procedure {:sourceloc "buggy_45.sol", 292, 1} {:message "StockBet::my_func_uncheck36"} my_func_uncheck36#940(__this: address_t, __msg_sender: address_t, __msg_value: int, dst#927: address_t)
{
	var __call_ret#72: bool;
	var __call_ret#73: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= __msg_value);
	__balance := __balance[__this := (__balance[__this] - __msg_value)];
	assume {:sourceloc "buggy_45.sol", 293, 9} {:message ""} true;
	call __call_ret#72, __call_ret#73 := __call(dst#927, __this, __msg_value);
	if (__call_ret#72) {
	havoc payedOut_unchk44#21;
	havoc winner_unchk44#23;
	havoc winAmount_unchk44#25;
	havoc payedOut_unchk33#68;
	havoc payedOut_unchk45#139;
	havoc owner#219;
	havoc oracle#238;
	havoc state#254;
	havoc guesses#270;
	havoc payedOut_unchk9#273;
	havoc bet#296;
	havoc splitJackpot#298;
	havoc result#314;
	havoc initialPrice#337;
	havoc finalPrice#351;
	havoc payedOut_unchk20#354;
	havoc winner_unchk20#356;
	havoc winAmount_unchk20#358;
	havoc payedOut_unchk32#383;
	havoc winner_unchk32#385;
	havoc winAmount_unchk32#387;
	havoc payedOut_unchk8#833;
	havoc winner_unchk8#835;
	havoc winAmount_unchk8#837;
	havoc __balance;
	}

	if (!(__call_ret#72)) {
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	}

	$return50:
	// Function body ends here
}

