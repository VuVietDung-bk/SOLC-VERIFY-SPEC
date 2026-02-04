// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_41.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_41.sol", 12, 5} {:message "tokenRecipient::receiveApproval"} receiveApproval#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#3: address_t, _value#5: int, _token#7: address_t, _extraData#9: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_41.sol", 11, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#13(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: AO -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_41.sol", 88, 3} {:message "[event] AO::Transfer"} Transfer#310(__this: address_t, __msg_sender: address_t, __msg_value: int, from#304: address_t, to#306: address_t, value#308: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_41.sol", 99, 3} {:message "[event] AO::Approval"} Approval#362(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#356: address_t, _spender#358: address_t, _value#360: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_41.sol", 111, 3} {:message "[event] AO::Burn"} Burn#403(__this: address_t, __msg_sender: address_t, __msg_value: int, from#399: address_t, value#401: int)
{
	
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_41.sol", 17, 3} {:message "not_called_re_ent20"} not_called_re_ent20#16: [address_t]bool;
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
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_41.sol", 18, 1} {:message "AO::bug_re_ent20"} bug_re_ent20#48(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 20, 4} {:message "success"} success#24: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#16[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_41.sol", 20, 21} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#0) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#24 := __call_ret#0;
	if (!(success#24)) {
	assume false;
	}

	not_called_re_ent20#16 := not_called_re_ent20#16[__this := false];
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_41.sol", 26, 3} {:message "name"} name#50: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 27, 3} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#54: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_41.sol", 28, 1} {:message "AO::claimReward_re_ent32"} claimReward_re_ent32#90(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 31, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#67: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#54[__this][__msg_sender] > 0);
	transferValue_re_ent32#67 := redeemableEther_re_ent32#54[__this][__msg_sender];
	assume {:sourceloc "buggy_41.sol", 32, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#67);
	redeemableEther_re_ent32#54 := redeemableEther_re_ent32#54[__this := redeemableEther_re_ent32#54[__this][__msg_sender := 0]];
	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_41.sol", 35, 3} {:message "symbol"} symbol#92: [address_t]int_arr_type;
// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 36, 3} {:message "balances_re_ent38"} balances_re_ent38#96: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_41.sol", 37, 1} {:message "AO::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#136(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#98: int)
{
	var {:sourceloc "buggy_41.sol", 40, 4} {:message "sent"} sent#111: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#96[__this][__msg_sender] >= _weiToWithdraw#98);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#98);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#98)];
	assume {:sourceloc "buggy_41.sol", 40, 18} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(__msg_sender, __this, _weiToWithdraw#98);
	if (__call_ret#2) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#98)];
	}

	sent#111 := __call_ret#2;
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#111;
	balances_re_ent38#96 := balances_re_ent38#96[__this := balances_re_ent38#96[__this][__msg_sender := (balances_re_ent38#96[__this][__msg_sender] - _weiToWithdraw#98)]];
	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_41.sol", 44, 3} {:message "decimals"} decimals#139: [address_t]int;
// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 46, 3} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#143: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_41.sol", 47, 1} {:message "AO::claimReward_re_ent4"} claimReward_re_ent4#179(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 50, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#156: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#143[__this][__msg_sender] > 0);
	transferValue_re_ent4#156 := redeemableEther_re_ent4#143[__this][__msg_sender];
	assume {:sourceloc "buggy_41.sol", 51, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#156);
	redeemableEther_re_ent4#143 := redeemableEther_re_ent4#143[__this := redeemableEther_re_ent4#143[__this][__msg_sender := 0]];
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_41.sol", 54, 3} {:message "totalSupply"} totalSupply#181: [address_t]int;
// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_41.sol", 57, 3} {:message "counter_re_ent7"} counter_re_ent7#184: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_41.sol", 58, 1} {:message "AO::callme_re_ent7"} callme_re_ent7#218(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 60, 3} {:message "success"} success#194: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#184[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_41.sol", 60, 20} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#6) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#194 := __call_ret#6;
	if (!(success#194)) {
	assume false;
	}

	counter_re_ent7#184 := counter_re_ent7#184[__this := (counter_re_ent7#184[__this] + 1)];
	$return4:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 66, 3} {:message "balanceOf"} balanceOf#222: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_41.sol", 67, 3} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#224: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_41.sol", 68, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#226: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_41.sol", 69, 4} {:message "AO::buyTicket_re_ent23"} buyTicket_re_ent23#261(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 70, 7} {:message "sent"} sent#230: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent23#226[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent23#226[__this])];
	assume {:sourceloc "buggy_41.sol", 70, 21} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(lastPlayer_re_ent23#224[__this], __this, jackpot_re_ent23#226[__this]);
	if (__call_ret#8) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent23#226[__this])];
	}

	sent#230 := __call_ret#8;
	if (!(sent#230)) {
	assume false;
	}

	lastPlayer_re_ent23#224 := lastPlayer_re_ent23#224[__this := __msg_sender];
	jackpot_re_ent23#226 := jackpot_re_ent23#226[__this := __balance[__this]];
	$return5:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_41.sol", 76, 3} {:message "allowance"} allowance#267: [address_t][address_t][address_t]int;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_41.sol", 79, 3} {:message "not_called_re_ent27"} not_called_re_ent27#270: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_41.sol", 80, 1} {:message "AO::bug_re_ent27"} bug_re_ent27#302(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 82, 4} {:message "success"} success#278: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#270[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_41.sol", 82, 21} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#10) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#278 := __call_ret#10;
	if (!(success#278)) {
	assume false;
	}

	not_called_re_ent27#270 := not_called_re_ent27#270[__this := false];
	$return6:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 91, 3} {:message "balances_re_ent31"} balances_re_ent31#314: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_41.sol", 92, 1} {:message "AO::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#354(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#316: int)
{
	var {:sourceloc "buggy_41.sol", 95, 4} {:message "sent"} sent#329: bool;
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	var call_arg#14: int_arr_ptr;
	var new_array#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#314[__this][__msg_sender] >= _weiToWithdraw#316);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#316);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#316)];
	assume {:sourceloc "buggy_41.sol", 95, 18} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(__msg_sender, __this, _weiToWithdraw#316);
	if (__call_ret#12) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#316)];
	}

	sent#329 := __call_ret#12;
	new_array#15 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#14 := new_array#15;
	mem_arr_int := mem_arr_int[call_arg#14 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#329;
	balances_re_ent31#314 := balances_re_ent31#314[__this := balances_re_ent31#314[__this][__msg_sender := (balances_re_ent31#314[__this][__msg_sender] - _weiToWithdraw#316)]];
	$return7:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_41.sol", 102, 3} {:message "not_called_re_ent13"} not_called_re_ent13#365: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_41.sol", 103, 1} {:message "AO::bug_re_ent13"} bug_re_ent13#397(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 105, 3} {:message "success"} success#373: bool;
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#365[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_41.sol", 105, 20} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#16) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#373 := __call_ret#16;
	if (!(success#373)) {
	assume false;
	}

	not_called_re_ent13#365 := not_called_re_ent13#365[__this := false];
	$return8:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_41.sol", 118, 5} {:message "AO::[constructor]"} __constructor#1034(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#406: int, tokenName#408: int_arr_ptr, tokenSymbol#410: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#408 < __alloc_counter);
	assume (tokenSymbol#410 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent20#16 := not_called_re_ent20#16[__this := true];
	name#50 := name#50[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent32#54 := redeemableEther_re_ent32#54[__this := default_address_t_int()];
	symbol#92 := symbol#92[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent38#96 := balances_re_ent38#96[__this := default_address_t_int()];
	decimals#139 := decimals#139[__this := 18];
	redeemableEther_re_ent4#143 := redeemableEther_re_ent4#143[__this := default_address_t_int()];
	totalSupply#181 := totalSupply#181[__this := 0];
	counter_re_ent7#184 := counter_re_ent7#184[__this := 0];
	balanceOf#222 := balanceOf#222[__this := default_address_t_int()];
	lastPlayer_re_ent23#224 := lastPlayer_re_ent23#224[__this := 0];
	jackpot_re_ent23#226 := jackpot_re_ent23#226[__this := 0];
	allowance#267 := allowance#267[__this := default_address_t__k_address_t_v_int()];
	not_called_re_ent27#270 := not_called_re_ent27#270[__this := true];
	balances_re_ent31#314 := balances_re_ent31#314[__this := default_address_t_int()];
	not_called_re_ent13#365 := not_called_re_ent13#365[__this := true];
	counter_re_ent14#438 := counter_re_ent14#438[__this := 0];
	lastPlayer_re_ent30#554 := lastPlayer_re_ent30#554[__this := 0];
	jackpot_re_ent30#556 := jackpot_re_ent30#556[__this := 0];
	balances_re_ent8#615 := balances_re_ent8#615[__this := default_address_t_int()];
	redeemableEther_re_ent39#689 := redeemableEther_re_ent39#689[__this := default_address_t_int()];
	balances_re_ent36#758 := balances_re_ent36#758[__this := default_address_t_int()];
	counter_re_ent35#830 := counter_re_ent35#830[__this := 0];
	userBalance_re_ent40#905 := userBalance_re_ent40#905[__this := default_address_t_int()];
	userBalance_re_ent33#999 := userBalance_re_ent33#999[__this := default_address_t_int()];
	// Function body starts here
	totalSupply#181 := totalSupply#181[__this := (initialSupply#406 * 1000000000000000000)];
	balanceOf#222 := balanceOf#222[__this := balanceOf#222[__this][__msg_sender := totalSupply#181[__this]]];
	name#50 := name#50[__this := mem_arr_int[tokenName#408]];
	symbol#92 := symbol#92[__this := mem_arr_int[tokenSymbol#410]];
	$return9:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_41.sol", 128, 1} {:message "counter_re_ent14"} counter_re_ent14#438: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_41.sol", 129, 1} {:message "AO::callme_re_ent14"} callme_re_ent14#472(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 131, 3} {:message "success"} success#448: bool;
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#438[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_41.sol", 131, 20} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#18) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#18)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#448 := __call_ret#18;
	if (!(success#448)) {
	assume false;
	}

	counter_re_ent14#438 := counter_re_ent14#438[__this := (counter_re_ent14#438[__this] + 1)];
	$return10:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_41.sol", 141, 5} {:message "AO::_transfer"} _transfer#552(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#475: address_t, _to#477: address_t, _value#479: int)
{
	var {:sourceloc "buggy_41.sol", 149, 9} {:message "previousBalances"} previousBalances#512: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#477 != 0);
	assume (balanceOf#222[__this][_from#475] >= _value#479);
	assume ((balanceOf#222[__this][_to#477] + _value#479) >= balanceOf#222[__this][_to#477]);
	previousBalances#512 := (balanceOf#222[__this][_from#475] + balanceOf#222[__this][_to#477]);
	balanceOf#222 := balanceOf#222[__this := balanceOf#222[__this][_from#475 := (balanceOf#222[__this][_from#475] - _value#479)]];
	balanceOf#222 := balanceOf#222[__this := balanceOf#222[__this][_to#477 := (balanceOf#222[__this][_to#477] + _value#479)]];
	assume {:sourceloc "buggy_41.sol", 154, 14} {:message ""} true;
	call Transfer#310(__this, __msg_sender, __msg_value, _from#475, _to#477, _value#479);
	assert {:sourceloc "buggy_41.sol", 156, 9} {:message "Assertion might not hold."} ((balanceOf#222[__this][_from#475] + balanceOf#222[__this][_to#477]) == previousBalances#512);
	$return11:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_41.sol", 158, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#554: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_41.sol", 159, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#556: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_41.sol", 160, 4} {:message "AO::buyTicket_re_ent30"} buyTicket_re_ent30#591(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 161, 7} {:message "sent"} sent#560: bool;
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent30#556[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent30#556[__this])];
	assume {:sourceloc "buggy_41.sol", 161, 21} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(lastPlayer_re_ent30#554[__this], __this, jackpot_re_ent30#556[__this]);
	if (__call_ret#20) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent30#556[__this])];
	}

	sent#560 := __call_ret#20;
	if (!(sent#560)) {
	assume false;
	}

	lastPlayer_re_ent30#554 := lastPlayer_re_ent30#554[__this := __msg_sender];
	jackpot_re_ent30#556 := jackpot_re_ent30#556[__this := __balance[__this]];
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 176, 5} {:message "AO::transfer"} transfer#611(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#594: address_t, _value#596: int)
	returns (success#599: bool)
{
	var call_arg#22: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 177, 9} {:message ""} true;
	call _transfer#552(__this, __msg_sender, __msg_value, call_arg#22, _to#594, _value#596);
	success#599 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 180, 1} {:message "balances_re_ent8"} balances_re_ent8#615: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_41.sol", 181, 5} {:message "AO::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#644(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 182, 7} {:message "success"} success#619: bool;
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#615[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#615[__this][__msg_sender])];
	assume {:sourceloc "buggy_41.sol", 182, 24} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(__msg_sender, __this, balances_re_ent8#615[__this][__msg_sender]);
	if (__call_ret#23) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#23)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#615[__this][__msg_sender])];
	}

	success#619 := __call_ret#23;
	if (success#619) {
	balances_re_ent8#615 := balances_re_ent8#615[__this := balances_re_ent8#615[__this][__msg_sender := 0]];
	}

	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 196, 5} {:message "AO::transferFrom"} transferFrom#685(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#647: address_t, _to#649: address_t, _value#651: int)
	returns (success#654: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#651 <= allowance#267[__this][_from#647][__msg_sender]);
	allowance#267 := allowance#267[__this := allowance#267[__this][_from#647 := allowance#267[__this][_from#647][__msg_sender := (allowance#267[__this][_from#647][__msg_sender] - _value#651)]]];
	assume {:sourceloc "buggy_41.sol", 199, 9} {:message ""} true;
	call _transfer#552(__this, __msg_sender, __msg_value, _from#647, _to#649, _value#651);
	success#654 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 202, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#689: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_41.sol", 203, 1} {:message "AO::claimReward_re_ent39"} claimReward_re_ent39#725(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 206, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#702: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#689[__this][__msg_sender] > 0);
	transferValue_re_ent39#702 := redeemableEther_re_ent39#689[__this][__msg_sender];
	assume {:sourceloc "buggy_41.sol", 207, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#702);
	redeemableEther_re_ent39#689 := redeemableEther_re_ent39#689[__this := redeemableEther_re_ent39#689[__this][__msg_sender := 0]];
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 219, 5} {:message "AO::approve"} approve#754(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#728: address_t, _value#730: int)
	returns (success#733: bool)
{
	var call_arg#25: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#267 := allowance#267[__this := allowance#267[__this][__msg_sender := allowance#267[__this][__msg_sender][_spender#728 := _value#730]]];
	call_arg#25 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 222, 14} {:message ""} true;
	call Approval#362(__this, __msg_sender, __msg_value, call_arg#25, _spender#728, _value#730);
	success#733 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 225, 1} {:message "balances_re_ent36"} balances_re_ent36#758: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_41.sol", 226, 5} {:message "AO::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#787(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 227, 4} {:message "sent"} sent#762: bool;
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent36#758[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent36#758[__this][__msg_sender])];
	assume {:sourceloc "buggy_41.sol", 227, 18} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(__msg_sender, __this, balances_re_ent36#758[__this][__msg_sender]);
	if (__call_ret#26) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent36#758[__this][__msg_sender])];
	}

	sent#762 := __call_ret#26;
	if (sent#762) {
	balances_re_ent36#758 := balances_re_ent36#758[__this := balances_re_ent36#758[__this][__msg_sender := 0]];
	}

	$return18:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_41.sol", 241, 5} {:message "AO::approveAndCall"} approveAndCall#827(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#790: address_t, _value#792: int, _extraData#794: int_arr_ptr)
	returns (success#797: bool)
{
	var {:sourceloc "buggy_41.sol", 244, 9} {:message "spender"} spender#800: address_t;
	var approve#754_ret#28: bool;
	var call_arg#29: address_t;
	// TCC assumptions
	assume (_extraData#794 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#800 := _spender#790;
	assume {:sourceloc "buggy_41.sol", 245, 13} {:message ""} true;
	call approve#754_ret#28 := approve#754(__this, __msg_sender, __msg_value, _spender#790, _value#792);
	if (approve#754_ret#28) {
	call_arg#29 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 246, 13} {:message ""} true;
	call receiveApproval#12(spender#800, __this, 0, call_arg#29, _value#792, __this, _extraData#794);
	success#797 := true;
	goto $return19;
	}

	$return19:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_41.sol", 250, 1} {:message "counter_re_ent35"} counter_re_ent35#830: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_41.sol", 251, 1} {:message "AO::callme_re_ent35"} callme_re_ent35#864(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 253, 3} {:message "success"} success#840: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#830[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_41.sol", 253, 20} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#30) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#840 := __call_ret#30;
	if (!(success#840)) {
	assume false;
	}

	counter_re_ent35#830 := counter_re_ent35#830[__this := (counter_re_ent35#830[__this] + 1)];
	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 267, 5} {:message "AO::burn"} burn#901(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#867: int)
	returns (success#870: bool)
{
	var call_arg#32: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#222[__this][__msg_sender] >= _value#867);
	balanceOf#222 := balanceOf#222[__this := balanceOf#222[__this][__msg_sender := (balanceOf#222[__this][__msg_sender] - _value#867)]];
	totalSupply#181 := totalSupply#181[__this := (totalSupply#181[__this] - _value#867)];
	call_arg#32 := __msg_sender;
	assume {:sourceloc "buggy_41.sol", 271, 14} {:message ""} true;
	call Burn#403(__this, __msg_sender, __msg_value, call_arg#32, _value#867);
	success#870 := true;
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 274, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#905: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_41.sol", 275, 1} {:message "AO::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#939(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 278, 10} {:message "success"} success#909: bool;
	var __call_ret#33: bool;
	var __call_ret#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#905[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#905[__this][__msg_sender])];
	assume {:sourceloc "buggy_41.sol", 278, 27} {:message ""} true;
	call __call_ret#33, __call_ret#34 := __call(__msg_sender, __this, userBalance_re_ent40#905[__this][__msg_sender]);
	if (__call_ret#33) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#33)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#905[__this][__msg_sender])];
	}

	success#909 := __call_ret#33;
	if (!(success#909)) {
	assume false;
	}

	userBalance_re_ent40#905 := userBalance_re_ent40#905[__this := userBalance_re_ent40#905[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_41.sol", 293, 5} {:message "AO::burnFrom"} burnFrom#995(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#942: address_t, _value#944: int)
	returns (success#947: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#222[__this][_from#942] >= _value#944);
	assume (_value#944 <= allowance#267[__this][_from#942][__msg_sender]);
	balanceOf#222 := balanceOf#222[__this := balanceOf#222[__this][_from#942 := (balanceOf#222[__this][_from#942] - _value#944)]];
	allowance#267 := allowance#267[__this := allowance#267[__this][_from#942 := allowance#267[__this][_from#942][__msg_sender := (allowance#267[__this][_from#942][__msg_sender] - _value#944)]]];
	totalSupply#181 := totalSupply#181[__this := (totalSupply#181[__this] - _value#944)];
	assume {:sourceloc "buggy_41.sol", 299, 14} {:message ""} true;
	call Burn#403(__this, __msg_sender, __msg_value, _from#942, _value#944);
	success#947 := true;
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_41.sol", 302, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#999: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_41.sol", 303, 1} {:message "AO::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1033(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_41.sol", 306, 10} {:message "success"} success#1003: bool;
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#999[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#999[__this][__msg_sender])];
	assume {:sourceloc "buggy_41.sol", 306, 27} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(__msg_sender, __this, userBalance_re_ent33#999[__this][__msg_sender]);
	if (__call_ret#35) {
	havoc not_called_re_ent20#16;
	havoc name#50;
	havoc redeemableEther_re_ent32#54;
	havoc symbol#92;
	havoc balances_re_ent38#96;
	havoc decimals#139;
	havoc redeemableEther_re_ent4#143;
	havoc totalSupply#181;
	havoc counter_re_ent7#184;
	havoc balanceOf#222;
	havoc lastPlayer_re_ent23#224;
	havoc jackpot_re_ent23#226;
	havoc allowance#267;
	havoc not_called_re_ent27#270;
	havoc balances_re_ent31#314;
	havoc not_called_re_ent13#365;
	havoc counter_re_ent14#438;
	havoc lastPlayer_re_ent30#554;
	havoc jackpot_re_ent30#556;
	havoc balances_re_ent8#615;
	havoc redeemableEther_re_ent39#689;
	havoc balances_re_ent36#758;
	havoc counter_re_ent35#830;
	havoc userBalance_re_ent40#905;
	havoc userBalance_re_ent33#999;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#999[__this][__msg_sender])];
	}

	success#1003 := __call_ret#35;
	if (!(success#1003)) {
	assume false;
	}

	userBalance_re_ent33#999 := userBalance_re_ent33#999[__this := userBalance_re_ent33#999[__this][__msg_sender := 0]];
	$return24:
	// Function body ends here
}

