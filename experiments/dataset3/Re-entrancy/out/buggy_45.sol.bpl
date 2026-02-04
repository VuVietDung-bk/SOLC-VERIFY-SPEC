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
procedure {:inline 1} {:sourceloc "buggy_45.sol", 17, 3} {:message "[event] StockBet::GameCreated"} GameCreated#45(__this: address_t, __msg_sender: address_t, __msg_value: int, bet#43: int)
{
	
}

// 
// Event: GameOpened
procedure {:inline 1} {:sourceloc "buggy_45.sol", 24, 3} {:message "[event] StockBet::GameOpened"} GameOpened#82(__this: address_t, __msg_sender: address_t, __msg_value: int, initialPrice#80: int)
{
	
}

// 
// Event: GameClosed
procedure {:inline 1} {:sourceloc "buggy_45.sol", 34, 3} {:message "[event] StockBet::GameClosed"} GameClosed#121(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: OracleSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 45, 3} {:message "[event] StockBet::OracleSet"} OracleSet#163(__this: address_t, __msg_sender: address_t, __msg_value: int, oracle#161: address_t)
{
	
}

// 
// Event: FinalPriceSet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 56, 3} {:message "[event] StockBet::FinalPriceSet"} FinalPriceSet#205(__this: address_t, __msg_sender: address_t, __msg_value: int, finalPrice#203: int)
{
	
}

// 
// Event: PlayerBet
procedure {:inline 1} {:sourceloc "buggy_45.sol", 66, 3} {:message "[event] StockBet::PlayerBet"} PlayerBet#246(__this: address_t, __msg_sender: address_t, __msg_value: int, player#242: address_t, guess#244: int)
{
	
}

// 
// Event: PlayersWin
procedure {:inline 1} {:sourceloc "buggy_45.sol", 76, 3} {:message "[event] StockBet::PlayersWin"} PlayersWin#296(__this: address_t, __msg_sender: address_t, __msg_value: int, result#292: int, splitJackpot#294: int)
{
	
}

// 
// Event: OwnerWins
procedure {:inline 1} {:sourceloc "buggy_45.sol", 86, 3} {:message "[event] StockBet::OwnerWins"} OwnerWins#335(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#333: address_t)
{
	
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 9, 3} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#5: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_45.sol", 10, 1} {:message "StockBet::claimReward_re_ent39"} claimReward_re_ent39#41(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 13, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#5[__this][__msg_sender] > 0);
	transferValue_re_ent39#18 := redeemableEther_re_ent39#5[__this][__msg_sender];
	assume {:sourceloc "buggy_45.sol", 14, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#18);
	redeemableEther_re_ent39#5 := redeemableEther_re_ent39#5[__this := redeemableEther_re_ent39#5[__this][__msg_sender := 0]];
	$return0:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 18, 3} {:message "balances_re_ent36"} balances_re_ent36#49: [address_t][address_t]int;
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
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_45.sol", 19, 5} {:message "StockBet::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#78(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 20, 11} {:message "sent"} sent#53: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent36#49[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent36#49[__this][__msg_sender])];
	assume {:sourceloc "buggy_45.sol", 20, 25} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, balances_re_ent36#49[__this][__msg_sender]);
	if (__call_ret#0) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent36#49[__this][__msg_sender])];
	}

	sent#53 := __call_ret#0;
	if (sent#53) {
	balances_re_ent36#49 := balances_re_ent36#49[__this := balances_re_ent36#49[__this][__msg_sender := 0]];
	}

	$return1:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_45.sol", 25, 3} {:message "counter_re_ent35"} counter_re_ent35#85: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_45.sol", 26, 1} {:message "StockBet::callme_re_ent35"} callme_re_ent35#119(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 28, 3} {:message "success"} success#95: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#85[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 28, 20} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#2) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#95 := __call_ret#2;
	if (!(success#95)) {
	assume false;
	}

	counter_re_ent35#85 := counter_re_ent35#85[__this := (counter_re_ent35#85[__this] + 1)];
	$return2:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 35, 3} {:message "userBalance_re_ent40"} userBalance_re_ent40#125: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_45.sol", 36, 1} {:message "StockBet::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#159(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 39, 10} {:message "success"} success#129: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#125[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#125[__this][__msg_sender])];
	assume {:sourceloc "buggy_45.sol", 39, 27} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(__msg_sender, __this, userBalance_re_ent40#125[__this][__msg_sender]);
	if (__call_ret#4) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#125[__this][__msg_sender])];
	}

	success#129 := __call_ret#4;
	if (!(success#129)) {
	assume false;
	}

	userBalance_re_ent40#125 := userBalance_re_ent40#125[__this := userBalance_re_ent40#125[__this][__msg_sender := 0]];
	$return3:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 46, 3} {:message "userBalance_re_ent33"} userBalance_re_ent33#167: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_45.sol", 47, 1} {:message "StockBet::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 50, 10} {:message "success"} success#171: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#167[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#167[__this][__msg_sender])];
	assume {:sourceloc "buggy_45.sol", 50, 27} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, userBalance_re_ent33#167[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#167[__this][__msg_sender])];
	}

	success#171 := __call_ret#6;
	if (!(success#171)) {
	assume false;
	}

	userBalance_re_ent33#167 := userBalance_re_ent33#167[__this := userBalance_re_ent33#167[__this][__msg_sender := 0]];
	$return4:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_45.sol", 57, 3} {:message "not_called_re_ent27"} not_called_re_ent27#208: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_45.sol", 58, 1} {:message "StockBet::bug_re_ent27"} bug_re_ent27#240(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 60, 10} {:message "success"} success#216: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#208[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 60, 27} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#8) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#216 := __call_ret#8;
	if (!(success#216)) {
	assume false;
	}

	not_called_re_ent27#208 := not_called_re_ent27#208[__this := false];
	$return5:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 68, 3} {:message "balances_re_ent31"} balances_re_ent31#250: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 69, 1} {:message "StockBet::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#290(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#252: int)
{
	var {:sourceloc "buggy_45.sol", 72, 6} {:message "sent"} sent#265: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#250[__this][__msg_sender] >= _weiToWithdraw#252);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#252);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#252)];
	assume {:sourceloc "buggy_45.sol", 72, 20} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(__msg_sender, __this, _weiToWithdraw#252);
	if (__call_ret#10) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#252)];
	}

	sent#265 := __call_ret#10;
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#265;
	balances_re_ent31#250 := balances_re_ent31#250[__this := balances_re_ent31#250[__this][__msg_sender := (balances_re_ent31#250[__this][__msg_sender] - _weiToWithdraw#252)]];
	$return6:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_45.sol", 77, 3} {:message "not_called_re_ent13"} not_called_re_ent13#299: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_45.sol", 78, 1} {:message "StockBet::bug_re_ent13"} bug_re_ent13#331(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 80, 10} {:message "success"} success#307: bool;
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#299[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 80, 27} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#14) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#14)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#307 := __call_ret#14;
	if (!(success#307)) {
	assume false;
	}

	not_called_re_ent13#299 := not_called_re_ent13#299[__this := false];
	$return7:
	// Function body ends here
}

// Enum definition State mapped to int
// Enum definition PaidStatus mapped to int
// 
// ------- Struct Guess -------
// Storage
type {:datatype} struct_storage_Guess#353;
function {:constructor} Guess#353#constr(players#350: [address_t]int, guesses_number#352: int) returns (struct_storage_Guess#353);
// Memory
type address_struct_memory_Guess#353 = int;
// Member players
var {:sourceloc "buggy_45.sol", 99, 9} {:message "players"} players#350: [address_struct_memory_Guess#353][address_t]int;
// Member guesses_number
var {:sourceloc "buggy_45.sol", 100, 9} {:message "guesses_number"} guesses_number#352: [address_struct_memory_Guess#353]int;
// 
// ------- End of struct Guess -------
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 103, 3} {:message "balances_re_ent1"} balances_re_ent1#357: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_45.sol", 104, 5} {:message "StockBet::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#386(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 105, 11} {:message "success"} success#361: bool;
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#357[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#357[__this][__msg_sender])];
	assume {:sourceloc "buggy_45.sol", 105, 28} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(__msg_sender, __this, balances_re_ent1#357[__this][__msg_sender]);
	if (__call_ret#16) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#357[__this][__msg_sender])];
	}

	success#361 := __call_ret#16;
	if (success#361) {
	balances_re_ent1#357 := balances_re_ent1#357[__this := balances_re_ent1#357[__this][__msg_sender := 0]];
	}

	$return8:
	// Function body ends here
}

// 
// State variable: owner: address payable
var {:sourceloc "buggy_45.sol", 109, 3} {:message "owner"} owner#388: [address_t]address_t;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_45.sol", 110, 3} {:message "not_called_re_ent41"} not_called_re_ent41#391: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_45.sol", 111, 1} {:message "StockBet::bug_re_ent41"} bug_re_ent41#423(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 113, 10} {:message "success"} success#399: bool;
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#391[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 113, 27} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#18) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#18)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#399 := __call_ret#18;
	if (!(success#399)) {
	assume false;
	}

	not_called_re_ent41#391 := not_called_re_ent41#391[__this := false];
	$return9:
	// Function body ends here
}

// 
// State variable: oracle: address
var {:sourceloc "buggy_45.sol", 119, 3} {:message "oracle"} oracle#425: [address_t]address_t;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_45.sol", 120, 3} {:message "counter_re_ent42"} counter_re_ent42#428: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_45.sol", 121, 1} {:message "StockBet::callme_re_ent42"} callme_re_ent42#462(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 123, 3} {:message "success"} success#438: bool;
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#428[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 123, 20} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#20) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#438 := __call_ret#20;
	if (!(success#438)) {
	assume false;
	}

	counter_re_ent42#428 := counter_re_ent42#428[__this := (counter_re_ent42#428[__this] + 1)];
	$return10:
	// Function body ends here
}

// 
// State variable: state: enum StockBet.State
var {:sourceloc "buggy_45.sol", 129, 3} {:message "state"} state#464: [address_t]int;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_45.sol", 131, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#466: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_45.sol", 132, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#468: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_45.sol", 133, 4} {:message "StockBet::buyTicket_re_ent2"} buyTicket_re_ent2#503(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 134, 7} {:message "sent"} sent#472: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent2#468[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent2#468[__this])];
	assume {:sourceloc "buggy_45.sol", 134, 21} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(lastPlayer_re_ent2#466[__this], __this, jackpot_re_ent2#468[__this]);
	if (__call_ret#22) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent2#468[__this])];
	}

	sent#472 := __call_ret#22;
	if (!(sent#472)) {
	assume false;
	}

	lastPlayer_re_ent2#466 := lastPlayer_re_ent2#466[__this := __msg_sender];
	jackpot_re_ent2#468 := jackpot_re_ent2#468[__this := __balance[__this]];
	$return11:
	// Function body ends here
}

// 
// State variable: guesses: mapping(uint256 => struct StockBet.Guess storage ref)
var {:sourceloc "buggy_45.sol", 140, 3} {:message "guesses"} guesses#507: [address_t][int]struct_storage_Guess#353;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 142, 3} {:message "balances_re_ent17"} balances_re_ent17#511: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 143, 1} {:message "StockBet::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#550(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#513: int)
{
	var {:sourceloc "buggy_45.sol", 146, 6} {:message "success"} success#526: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#511[__this][__msg_sender] >= _weiToWithdraw#513);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#513);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#513)];
	assume {:sourceloc "buggy_45.sol", 146, 23} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(__msg_sender, __this, _weiToWithdraw#513);
	if (__call_ret#24) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#513)];
	}

	success#526 := __call_ret#24;
	assume success#526;
	balances_re_ent17#511 := balances_re_ent17#511[__this := balances_re_ent17#511[__this][__msg_sender := (balances_re_ent17#511[__this][__msg_sender] - _weiToWithdraw#513)]];
	$return12:
	// Function body ends here
}

// 
// State variable: bet: uint256
var {:sourceloc "buggy_45.sol", 150, 3} {:message "bet"} bet#552: [address_t]int;
// 
// State variable: splitJackpot: uint256
var {:sourceloc "buggy_45.sol", 151, 5} {:message "splitJackpot"} splitJackpot#554: [address_t]int;
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_45.sol", 152, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#556: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_45.sol", 153, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#558: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_45.sol", 154, 4} {:message "StockBet::buyTicket_re_ent37"} buyTicket_re_ent37#593(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 155, 7} {:message "sent"} sent#562: bool;
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent37#558[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent37#558[__this])];
	assume {:sourceloc "buggy_45.sol", 155, 21} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(lastPlayer_re_ent37#556[__this], __this, jackpot_re_ent37#558[__this]);
	if (__call_ret#26) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent37#558[__this])];
	}

	sent#562 := __call_ret#26;
	if (!(sent#562)) {
	assume false;
	}

	lastPlayer_re_ent37#556 := lastPlayer_re_ent37#556[__this := __msg_sender];
	jackpot_re_ent37#558 := jackpot_re_ent37#558[__this := __balance[__this]];
	$return13:
	// Function body ends here
}

// 
// State variable: result: uint256
var {:sourceloc "buggy_45.sol", 161, 3} {:message "result"} result#595: [address_t]int;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 162, 3} {:message "balances_re_ent3"} balances_re_ent3#599: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 163, 1} {:message "StockBet::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#638(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#601: int)
{
	var {:sourceloc "buggy_45.sol", 166, 3} {:message "success"} success#614: bool;
	var __call_ret#28: bool;
	var __call_ret#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#599[__this][__msg_sender] >= _weiToWithdraw#601);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#601);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#601)];
	assume {:sourceloc "buggy_45.sol", 166, 20} {:message ""} true;
	call __call_ret#28, __call_ret#29 := __call(__msg_sender, __this, _weiToWithdraw#601);
	if (__call_ret#28) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#28)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#601)];
	}

	success#614 := __call_ret#28;
	assume success#614;
	balances_re_ent3#599 := balances_re_ent3#599[__this := balances_re_ent3#599[__this][__msg_sender := (balances_re_ent3#599[__this][__msg_sender] - _weiToWithdraw#601)]];
	$return14:
	// Function body ends here
}

// 
// State variable: initialPrice: uint256
var {:sourceloc "buggy_45.sol", 170, 3} {:message "initialPrice"} initialPrice#640: [address_t]int;
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_45.sol", 171, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#642: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_45.sol", 172, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#644: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_45.sol", 173, 4} {:message "StockBet::buyTicket_re_ent9"} buyTicket_re_ent9#679(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 174, 10} {:message "success"} success#648: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#644[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#644[__this])];
	assume {:sourceloc "buggy_45.sol", 174, 27} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(lastPlayer_re_ent9#642[__this], __this, jackpot_re_ent9#644[__this]);
	if (__call_ret#30) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#644[__this])];
	}

	success#648 := __call_ret#30;
	if (!(success#648)) {
	assume false;
	}

	lastPlayer_re_ent9#642 := lastPlayer_re_ent9#642[__this := __msg_sender];
	jackpot_re_ent9#644 := jackpot_re_ent9#644[__this := __balance[__this]];
	$return15:
	// Function body ends here
}

// 
// State variable: finalPrice: uint256
var {:sourceloc "buggy_45.sol", 180, 3} {:message "finalPrice"} finalPrice#681: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 182, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#685: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_45.sol", 183, 1} {:message "StockBet::claimReward_re_ent25"} claimReward_re_ent25#721(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 186, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#698: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#685[__this][__msg_sender] > 0);
	transferValue_re_ent25#698 := redeemableEther_re_ent25#685[__this][__msg_sender];
	assume {:sourceloc "buggy_45.sol", 187, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#698);
	redeemableEther_re_ent25#685 := redeemableEther_re_ent25#685[__this := redeemableEther_re_ent25#685[__this][__msg_sender := 0]];
	$return16:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 191, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#728: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_45.sol", 192, 1} {:message "StockBet::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#762(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 195, 10} {:message "success"} success#732: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent19#728[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent19#728[__this][__msg_sender])];
	assume {:sourceloc "buggy_45.sol", 195, 27} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, userBalance_re_ent19#728[__this][__msg_sender]);
	if (__call_ret#32) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent19#728[__this][__msg_sender])];
	}

	success#732 := __call_ret#32;
	if (!(success#732)) {
	assume false;
	}

	userBalance_re_ent19#728 := userBalance_re_ent19#728[__this := userBalance_re_ent19#728[__this][__msg_sender := 0]];
	$return17:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int |T@struct_storage_Guess#353|)) (|Guess#353#constr| ((as const (Array Int Int)) 0) 0))"} default_int_struct_storage_Guess#353() returns ([int]struct_storage_Guess#353);
// 
// Function: 
procedure {:sourceloc "buggy_45.sol", 227, 5} {:message "StockBet::[constructor]"} __constructor#1504(__this: address_t, __msg_sender: address_t, __msg_value: int, _bet#812: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent39#5 := redeemableEther_re_ent39#5[__this := default_address_t_int()];
	balances_re_ent36#49 := balances_re_ent36#49[__this := default_address_t_int()];
	counter_re_ent35#85 := counter_re_ent35#85[__this := 0];
	userBalance_re_ent40#125 := userBalance_re_ent40#125[__this := default_address_t_int()];
	userBalance_re_ent33#167 := userBalance_re_ent33#167[__this := default_address_t_int()];
	not_called_re_ent27#208 := not_called_re_ent27#208[__this := true];
	balances_re_ent31#250 := balances_re_ent31#250[__this := default_address_t_int()];
	not_called_re_ent13#299 := not_called_re_ent13#299[__this := true];
	balances_re_ent1#357 := balances_re_ent1#357[__this := default_address_t_int()];
	owner#388 := owner#388[__this := 0];
	not_called_re_ent41#391 := not_called_re_ent41#391[__this := true];
	oracle#425 := oracle#425[__this := 0];
	counter_re_ent42#428 := counter_re_ent42#428[__this := 0];
	state#464 := state#464[__this := 0];
	lastPlayer_re_ent2#466 := lastPlayer_re_ent2#466[__this := 0];
	jackpot_re_ent2#468 := jackpot_re_ent2#468[__this := 0];
	guesses#507 := guesses#507[__this := default_int_struct_storage_Guess#353()];
	balances_re_ent17#511 := balances_re_ent17#511[__this := default_address_t_int()];
	bet#552 := bet#552[__this := 0];
	splitJackpot#554 := splitJackpot#554[__this := 0];
	lastPlayer_re_ent37#556 := lastPlayer_re_ent37#556[__this := 0];
	jackpot_re_ent37#558 := jackpot_re_ent37#558[__this := 0];
	result#595 := result#595[__this := 0];
	balances_re_ent3#599 := balances_re_ent3#599[__this := default_address_t_int()];
	initialPrice#640 := initialPrice#640[__this := 0];
	lastPlayer_re_ent9#642 := lastPlayer_re_ent9#642[__this := 0];
	jackpot_re_ent9#644 := jackpot_re_ent9#644[__this := 0];
	finalPrice#681 := finalPrice#681[__this := 0];
	redeemableEther_re_ent25#685 := redeemableEther_re_ent25#685[__this := default_address_t_int()];
	userBalance_re_ent19#728 := userBalance_re_ent19#728[__this := default_address_t_int()];
	userBalance_re_ent26#847 := userBalance_re_ent26#847[__this := default_address_t_int()];
	not_called_re_ent20#904 := not_called_re_ent20#904[__this := true];
	redeemableEther_re_ent32#965 := redeemableEther_re_ent32#965[__this := default_address_t_int()];
	balances_re_ent38#1023 := balances_re_ent38#1023[__this := default_address_t_int()];
	redeemableEther_re_ent4#1110 := redeemableEther_re_ent4#1110[__this := default_address_t_int()];
	counter_re_ent7#1192 := counter_re_ent7#1192[__this := 0];
	lastPlayer_re_ent23#1300 := lastPlayer_re_ent23#1300[__this := 0];
	jackpot_re_ent23#1302 := jackpot_re_ent23#1302[__this := 0];
	counter_re_ent14#1340 := counter_re_ent14#1340[__this := 0];
	lastPlayer_re_ent30#1421 := lastPlayer_re_ent30#1421[__this := 0];
	jackpot_re_ent30#1423 := jackpot_re_ent30#1423[__this := 0];
	balances_re_ent8#1474 := balances_re_ent8#1474[__this := default_address_t_int()];
	// Function body starts here
	assume (_bet#812 > 0);
	owner#388 := owner#388[__this := __msg_sender];
	state#464 := state#464[__this := 0];
	bet#552 := bet#552[__this := _bet#812];
	assume {:sourceloc "buggy_45.sol", 234, 14} {:message ""} true;
	call GameCreated#45(__this, __msg_sender, __msg_value, bet#552[__this]);
	$return18:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 236, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#847: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_45.sol", 237, 1} {:message "StockBet::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#881(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 240, 10} {:message "success"} success#851: bool;
	var __call_ret#34: bool;
	var __call_ret#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#847[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#847[__this][__msg_sender])];
	assume {:sourceloc "buggy_45.sol", 240, 27} {:message ""} true;
	call __call_ret#34, __call_ret#35 := __call(__msg_sender, __this, userBalance_re_ent26#847[__this][__msg_sender]);
	if (__call_ret#34) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#34)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#847[__this][__msg_sender])];
	}

	success#851 := __call_ret#34;
	if (!(success#851)) {
	assume false;
	}

	userBalance_re_ent26#847 := userBalance_re_ent26#847[__this := userBalance_re_ent26#847[__this][__msg_sender := 0]];
	$return19:
	// Function body ends here
}

// 
// Function: setOracle : function (address)
procedure {:sourceloc "buggy_45.sol", 247, 5} {:message "StockBet::setOracle"} setOracle#901(__this: address_t, __msg_sender: address_t, __msg_value: int, _oracle#883: address_t)
{
	var expected#800#371: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#388[__this]);
	// Inlined modifier inState starts here
	expected#800#371 := 0;
	assume (state#464[__this] == expected#800#371);
	// Function body starts here
	oracle#425 := oracle#425[__this := _oracle#883];
	assume {:sourceloc "buggy_45.sol", 250, 14} {:message ""} true;
	call OracleSet#163(__this, __msg_sender, __msg_value, oracle#425[__this]);
	$return22:
	// Function body ends here
	$return21:
	// Inlined modifier inState ends here
	$return20:
	// Inlined modifier byOwner ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_45.sol", 252, 1} {:message "not_called_re_ent20"} not_called_re_ent20#904: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_45.sol", 253, 1} {:message "StockBet::bug_re_ent20"} bug_re_ent20#936(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 255, 10} {:message "success"} success#912: bool;
	var __call_ret#39: bool;
	var __call_ret#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#904[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 255, 27} {:message ""} true;
	call __call_ret#39, __call_ret#40 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#39) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#39)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#912 := __call_ret#39;
	if (!(success#912)) {
	assume false;
	}

	not_called_re_ent20#904 := not_called_re_ent20#904[__this := false];
	$return23:
	// Function body ends here
}

// 
// Function: setInitialPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 262, 5} {:message "StockBet::setInitialPrice"} setInitialPrice#961(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#938: int)
{
	var expected#800#421: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#425[__this]);
	// Inlined modifier inState starts here
	expected#800#421 := 0;
	assume (state#464[__this] == expected#800#421);
	// Function body starts here
	initialPrice#640 := initialPrice#640[__this := _value#938];
	state#464 := state#464[__this := 2];
	assume {:sourceloc "buggy_45.sol", 266, 14} {:message ""} true;
	call GameOpened#82(__this, __msg_sender, __msg_value, initialPrice#640[__this]);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier inState ends here
	$return24:
	// Inlined modifier byOracle ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 268, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#965: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_45.sol", 269, 1} {:message "StockBet::claimReward_re_ent32"} claimReward_re_ent32#1001(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 272, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#978: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#965[__this][__msg_sender] > 0);
	transferValue_re_ent32#978 := redeemableEther_re_ent32#965[__this][__msg_sender];
	assume {:sourceloc "buggy_45.sol", 273, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#978);
	redeemableEther_re_ent32#965 := redeemableEther_re_ent32#965[__this := redeemableEther_re_ent32#965[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: closeGame : function ()
procedure {:sourceloc "buggy_45.sol", 277, 5} {:message "StockBet::closeGame"} closeGame#1019(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#800#451: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byOwner starts here
	assume (__msg_sender == owner#388[__this]);
	// Inlined modifier inState starts here
	expected#800#451 := 2;
	assume (state#464[__this] == expected#800#451);
	// Function body starts here
	state#464 := state#464[__this := 3];
	assume {:sourceloc "buggy_45.sol", 280, 14} {:message ""} true;
	call GameClosed#121(__this, __msg_sender, __msg_value);
	$return30:
	// Function body ends here
	$return29:
	// Inlined modifier inState ends here
	$return28:
	// Inlined modifier byOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 282, 1} {:message "balances_re_ent38"} balances_re_ent38#1023: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_45.sol", 283, 1} {:message "StockBet::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#1063(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1025: int)
{
	var {:sourceloc "buggy_45.sol", 286, 6} {:message "sent"} sent#1038: bool;
	var __call_ret#47: bool;
	var __call_ret#48: int_arr_ptr;
	var call_arg#49: int_arr_ptr;
	var new_array#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#1023[__this][__msg_sender] >= _weiToWithdraw#1025);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1025);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1025)];
	assume {:sourceloc "buggy_45.sol", 286, 20} {:message ""} true;
	call __call_ret#47, __call_ret#48 := __call(__msg_sender, __this, _weiToWithdraw#1025);
	if (__call_ret#47) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#47)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1025)];
	}

	sent#1038 := __call_ret#47;
	new_array#50 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#49 := new_array#50;
	mem_arr_int := mem_arr_int[call_arg#49 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#1038;
	balances_re_ent38#1023 := balances_re_ent38#1023[__this := balances_re_ent38#1023[__this][__msg_sender := (balances_re_ent38#1023[__this][__msg_sender] - _weiToWithdraw#1025)]];
	$return31:
	// Function body ends here
}

// 
// Function: betUp : function ()
procedure {:sourceloc "buggy_45.sol", 291, 5} {:message "StockBet::betUp"} betUp#1106(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#800#521: int;
	var tmp#54: int;
	var call_arg#55: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#425[__this]);
	// Inlined modifier inState starts here
	expected#800#521 := 2;
	assume (state#464[__this] == expected#800#521);
	// Function body starts here
	assume (__msg_value == (bet#552[__this] * 1000000000000000));
	tmp#54 := guesses_number#352#Guess#353#constr(guesses#507[__this][1]);
	guesses#507 := guesses#507[__this := guesses#507[__this][1 := Guess#353#constr(players#350#Guess#353#constr(guesses#507[__this][1]), (guesses_number#352#Guess#353#constr(guesses#507[__this][1]) + 1))]];
	guesses#507 := guesses#507[__this := guesses#507[__this][1 := Guess#353#constr(players#350#Guess#353#constr(guesses#507[__this][1])[__msg_sender := 1], guesses_number#352#Guess#353#constr(guesses#507[__this][1]))]];
	call_arg#55 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 297, 14} {:message ""} true;
	call PlayerBet#246(__this, __msg_sender, __msg_value, call_arg#55, 1);
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier inState ends here
	$return32:
	// Inlined modifier byPlayer ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 299, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#1110: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_45.sol", 300, 1} {:message "StockBet::claimReward_re_ent4"} claimReward_re_ent4#1146(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 303, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#1123: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#1110[__this][__msg_sender] > 0);
	transferValue_re_ent4#1123 := redeemableEther_re_ent4#1110[__this][__msg_sender];
	assume {:sourceloc "buggy_45.sol", 304, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#1123);
	redeemableEther_re_ent4#1110 := redeemableEther_re_ent4#1110[__this := redeemableEther_re_ent4#1110[__this][__msg_sender := 0]];
	$return35:
	// Function body ends here
}

// 
// Function: betDown : function ()
procedure {:sourceloc "buggy_45.sol", 308, 5} {:message "StockBet::betDown"} betDown#1189(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#800#571: int;
	var tmp#59: int;
	var call_arg#60: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#425[__this]);
	// Inlined modifier inState starts here
	expected#800#571 := 2;
	assume (state#464[__this] == expected#800#571);
	// Function body starts here
	assume (__msg_value == (bet#552[__this] * 1000000000000000));
	tmp#59 := guesses_number#352#Guess#353#constr(guesses#507[__this][0]);
	guesses#507 := guesses#507[__this := guesses#507[__this][0 := Guess#353#constr(players#350#Guess#353#constr(guesses#507[__this][0]), (guesses_number#352#Guess#353#constr(guesses#507[__this][0]) + 1))]];
	guesses#507 := guesses#507[__this := guesses#507[__this][0 := Guess#353#constr(players#350#Guess#353#constr(guesses#507[__this][0])[__msg_sender := 1], guesses_number#352#Guess#353#constr(guesses#507[__this][0]))]];
	call_arg#60 := __msg_sender;
	assume {:sourceloc "buggy_45.sol", 314, 14} {:message ""} true;
	call PlayerBet#246(__this, __msg_sender, __msg_value, call_arg#60, 0);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier inState ends here
	$return36:
	// Inlined modifier byPlayer ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_45.sol", 316, 1} {:message "counter_re_ent7"} counter_re_ent7#1192: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_45.sol", 317, 1} {:message "StockBet::callme_re_ent7"} callme_re_ent7#1226(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 319, 3} {:message "success"} success#1202: bool;
	var __call_ret#61: bool;
	var __call_ret#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1192[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 319, 20} {:message ""} true;
	call __call_ret#61, __call_ret#62 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#61) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#61)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1202 := __call_ret#61;
	if (!(success#1202)) {
	assume false;
	}

	counter_re_ent7#1192 := counter_re_ent7#1192[__this := (counter_re_ent7#1192[__this] + 1)];
	$return39:
	// Function body ends here
}

// 
// Function: setFinalPrice : function (uint256)
procedure {:sourceloc "buggy_45.sol", 327, 5} {:message "StockBet::setFinalPrice"} setFinalPrice#1298(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#1228: int)
{
	var expected#800#641: int;
	var getBalance#1470_ret#66: int;
	var call_arg#67: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Inlined modifier byOracle starts here
	assume (__msg_sender == oracle#425[__this]);
	// Inlined modifier inState starts here
	expected#800#641 := 3;
	assume (state#464[__this] == expected#800#641);
	// Function body starts here
	finalPrice#681 := finalPrice#681[__this := _value#1228];
	assume {:sourceloc "buggy_45.sol", 332, 14} {:message ""} true;
	call FinalPriceSet#205(__this, __msg_sender, __msg_value, finalPrice#681[__this]);
	if ((finalPrice#681[__this] > initialPrice#640[__this])) {
	result#595 := result#595[__this := 1];
	}
	else {
	result#595 := result#595[__this := 0];
	}

	if ((guesses_number#352#Guess#353#constr(guesses#507[__this][result#595[__this]]) > 0)) {
	state#464 := state#464[__this := 4];
	assume {:sourceloc "buggy_45.sol", 343, 28} {:message ""} true;
	call getBalance#1470_ret#66 := getBalance#1470(__this, __msg_sender, __msg_value);
	splitJackpot#554 := splitJackpot#554[__this := (getBalance#1470_ret#66 div guesses_number#352#Guess#353#constr(guesses#507[__this][result#595[__this]]))];
	assume {:sourceloc "buggy_45.sol", 344, 18} {:message ""} true;
	call PlayersWin#296(__this, __msg_sender, __msg_value, result#595[__this], splitJackpot#554[__this]);
	}
	else {
	state#464 := state#464[__this := 5];
	call_arg#67 := owner#388[__this];
	assume {:sourceloc "buggy_45.sol", 347, 18} {:message ""} true;
	call OwnerWins#335(__this, __msg_sender, __msg_value, call_arg#67);
	}

	$return42:
	// Function body ends here
	$return41:
	// Inlined modifier inState ends here
	$return40:
	// Inlined modifier byOracle ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_45.sol", 350, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1300: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_45.sol", 351, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1302: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_45.sol", 352, 4} {:message "StockBet::buyTicket_re_ent23"} buyTicket_re_ent23#1337(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 353, 7} {:message "sent"} sent#1306: bool;
	var __call_ret#68: bool;
	var __call_ret#69: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent23#1302[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent23#1302[__this])];
	assume {:sourceloc "buggy_45.sol", 353, 21} {:message ""} true;
	call __call_ret#68, __call_ret#69 := __call(lastPlayer_re_ent23#1300[__this], __this, jackpot_re_ent23#1302[__this]);
	if (__call_ret#68) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#68)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent23#1302[__this])];
	}

	sent#1306 := __call_ret#68;
	if (!(sent#1306)) {
	assume false;
	}

	lastPlayer_re_ent23#1300 := lastPlayer_re_ent23#1300[__this := __msg_sender];
	jackpot_re_ent23#1302 := jackpot_re_ent23#1302[__this := __balance[__this]];
	$return43:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_45.sol", 360, 1} {:message "counter_re_ent14"} counter_re_ent14#1340: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_45.sol", 361, 1} {:message "StockBet::callme_re_ent14"} callme_re_ent14#1374(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 363, 3} {:message "success"} success#1350: bool;
	var __call_ret#70: bool;
	var __call_ret#71: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1340[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_45.sol", 363, 20} {:message ""} true;
	call __call_ret#70, __call_ret#71 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#70) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#70)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1350 := __call_ret#70;
	if (!(success#1350)) {
	assume false;
	}

	counter_re_ent14#1340 := counter_re_ent14#1340[__this := (counter_re_ent14#1340[__this] + 1)];
	$return44:
	// Function body ends here
}

// 
// Function: collectPlayerWinnings : function ()
procedure {:sourceloc "buggy_45.sol", 370, 5} {:message "StockBet::collectPlayerWinnings"} collectPlayerWinnings#1419(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var expected#800#731: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier byPlayer starts here
	assume (__msg_sender != oracle#425[__this]);
	// Inlined modifier inState starts here
	expected#800#731 := 4;
	assume (state#464[__this] == expected#800#731);
	// Function body starts here
	if ((players#350#Guess#353#constr(guesses#507[__this][result#595[__this]])[__msg_sender] == 1)) {
	guesses#507 := guesses#507[__this := guesses#507[__this][result#595[__this] := Guess#353#constr(players#350#Guess#353#constr(guesses#507[__this][result#595[__this]])[__msg_sender := 2], guesses_number#352#Guess#353#constr(guesses#507[__this][result#595[__this]]))]];
	assume {:sourceloc "buggy_45.sol", 373, 13} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, splitJackpot#554[__this]);
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
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_45.sol", 376, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1421: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_45.sol", 377, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1423: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_45.sol", 378, 4} {:message "StockBet::buyTicket_re_ent30"} buyTicket_re_ent30#1458(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 379, 7} {:message "sent"} sent#1427: bool;
	var __call_ret#75: bool;
	var __call_ret#76: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent30#1423[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent30#1423[__this])];
	assume {:sourceloc "buggy_45.sol", 379, 21} {:message ""} true;
	call __call_ret#75, __call_ret#76 := __call(lastPlayer_re_ent30#1421[__this], __this, jackpot_re_ent30#1423[__this]);
	if (__call_ret#75) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#75)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent30#1423[__this])];
	}

	sent#1427 := __call_ret#75;
	if (!(sent#1427)) {
	assume false;
	}

	lastPlayer_re_ent30#1421 := lastPlayer_re_ent30#1421[__this := __msg_sender];
	jackpot_re_ent30#1423 := jackpot_re_ent30#1423[__this := __balance[__this]];
	$return48:
	// Function body ends here
}

// 
// Function: getBalance : function () view returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_45.sol", 386, 5} {:message "StockBet::getBalance"} getBalance#1470(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1461: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1461 := __balance[__this];
	goto $return49;
	$return49:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_45.sol", 389, 1} {:message "balances_re_ent8"} balances_re_ent8#1474: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_45.sol", 390, 5} {:message "StockBet::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1503(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_45.sol", 391, 9} {:message "success"} success#1478: bool;
	var __call_ret#77: bool;
	var __call_ret#78: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1474[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1474[__this][__msg_sender])];
	assume {:sourceloc "buggy_45.sol", 391, 26} {:message ""} true;
	call __call_ret#77, __call_ret#78 := __call(__msg_sender, __this, balances_re_ent8#1474[__this][__msg_sender]);
	if (__call_ret#77) {
	havoc redeemableEther_re_ent39#5;
	havoc balances_re_ent36#49;
	havoc counter_re_ent35#85;
	havoc userBalance_re_ent40#125;
	havoc userBalance_re_ent33#167;
	havoc not_called_re_ent27#208;
	havoc balances_re_ent31#250;
	havoc not_called_re_ent13#299;
	havoc balances_re_ent1#357;
	havoc owner#388;
	havoc not_called_re_ent41#391;
	havoc oracle#425;
	havoc counter_re_ent42#428;
	havoc state#464;
	havoc lastPlayer_re_ent2#466;
	havoc jackpot_re_ent2#468;
	havoc guesses#507;
	havoc balances_re_ent17#511;
	havoc bet#552;
	havoc splitJackpot#554;
	havoc lastPlayer_re_ent37#556;
	havoc jackpot_re_ent37#558;
	havoc result#595;
	havoc balances_re_ent3#599;
	havoc initialPrice#640;
	havoc lastPlayer_re_ent9#642;
	havoc jackpot_re_ent9#644;
	havoc finalPrice#681;
	havoc redeemableEther_re_ent25#685;
	havoc userBalance_re_ent19#728;
	havoc userBalance_re_ent26#847;
	havoc not_called_re_ent20#904;
	havoc redeemableEther_re_ent32#965;
	havoc balances_re_ent38#1023;
	havoc redeemableEther_re_ent4#1110;
	havoc counter_re_ent7#1192;
	havoc lastPlayer_re_ent23#1300;
	havoc jackpot_re_ent23#1302;
	havoc counter_re_ent14#1340;
	havoc lastPlayer_re_ent30#1421;
	havoc jackpot_re_ent30#1423;
	havoc balances_re_ent8#1474;
	havoc __balance;
	}

	if (!(__call_ret#77)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1474[__this][__msg_sender])];
	}

	success#1478 := __call_ret#77;
	if (success#1478) {
	balances_re_ent8#1474 := balances_re_ent8#1474[__this := balances_re_ent8#1474[__this][__msg_sender := 0]];
	}

	$return50:
	// Function body ends here
}

