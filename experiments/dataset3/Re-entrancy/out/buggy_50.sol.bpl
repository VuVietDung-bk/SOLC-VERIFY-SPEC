// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_50.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: digitalNotary -------
// 
// Event: RegisterHashEvent
procedure {:inline 1} {:sourceloc "buggy_50.sol", 87, 3} {:message "[event] digitalNotary::RegisterHashEvent"} RegisterHashEvent#316(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#310: address_t, hash#312: int, timestamp#314: int)
{
	
}

// 
// Event: ChangeHashOwnershipEvent
procedure {:inline 1} {:sourceloc "buggy_50.sol", 98, 3} {:message "[event] digitalNotary::ChangeHashOwnershipEvent"} ChangeHashOwnershipEvent#361(__this: address_t, __msg_sender: address_t, __msg_value: int, msgsender#353: address_t, newowner#355: address_t, hash#357: int, timestamp#359: int)
{
	
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_50.sol", 10, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#3: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_50.sol", 11, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#5: [address_t]int;
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
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_50.sol", 12, 4} {:message "digitalNotary::buyTicket_re_ent2"} buyTicket_re_ent2#40(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 13, 7} {:message "sent"} sent#9: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent2#5[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent2#5[__this])];
	assume {:sourceloc "buggy_50.sol", 13, 21} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(lastPlayer_re_ent2#3[__this], __this, jackpot_re_ent2#5[__this]);
	if (__call_ret#0) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent2#5[__this])];
	}

	sent#9 := __call_ret#0;
	if (!(sent#9)) {
	assume false;
	}

	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := __msg_sender];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := __balance[__this]];
	$return0:
	// Function body ends here
}

// 
// State variable: manager: address payable
var {:sourceloc "buggy_50.sol", 19, 3} {:message "manager"} manager#42: [address_t]address_t;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 21, 3} {:message "balances_re_ent17"} balances_re_ent17#46: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 22, 1} {:message "digitalNotary::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#85(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#48: int)
{
	var {:sourceloc "buggy_50.sol", 25, 6} {:message "success"} success#61: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#46[__this][__msg_sender] >= _weiToWithdraw#48);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#48);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#48)];
	assume {:sourceloc "buggy_50.sol", 25, 23} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(__msg_sender, __this, _weiToWithdraw#48);
	if (__call_ret#2) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#48)];
	}

	success#61 := __call_ret#2;
	assume success#61;
	balances_re_ent17#46 := balances_re_ent17#46[__this := balances_re_ent17#46[__this][__msg_sender := (balances_re_ent17#46[__this][__msg_sender] - _weiToWithdraw#48)]];
	$return1:
	// Function body ends here
}

// 
// State variable: contractactive: bool
var {:sourceloc "buggy_50.sol", 29, 3} {:message "contractactive"} contractactive#87: [address_t]bool;
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_50.sol", 31, 3} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#89: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_50.sol", 32, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#91: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_50.sol", 33, 4} {:message "digitalNotary::buyTicket_re_ent37"} buyTicket_re_ent37#126(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 34, 7} {:message "sent"} sent#95: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent37#91[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent37#91[__this])];
	assume {:sourceloc "buggy_50.sol", 34, 21} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(lastPlayer_re_ent37#89[__this], __this, jackpot_re_ent37#91[__this]);
	if (__call_ret#4) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent37#91[__this])];
	}

	sent#95 := __call_ret#4;
	if (!(sent#95)) {
	assume false;
	}

	lastPlayer_re_ent37#89 := lastPlayer_re_ent37#89[__this := __msg_sender];
	jackpot_re_ent37#91 := jackpot_re_ent37#91[__this := __balance[__this]];
	$return2:
	// Function body ends here
}

// 
// State variable: hashfee: uint256
var {:sourceloc "buggy_50.sol", 40, 3} {:message "hashfee"} hashfee#128: [address_t]int;
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 42, 3} {:message "balances_re_ent3"} balances_re_ent3#132: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 43, 1} {:message "digitalNotary::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#171(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#134: int)
{
	var {:sourceloc "buggy_50.sol", 46, 3} {:message "success"} success#147: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#132[__this][__msg_sender] >= _weiToWithdraw#134);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#134);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#134)];
	assume {:sourceloc "buggy_50.sol", 46, 20} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, _weiToWithdraw#134);
	if (__call_ret#6) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#134)];
	}

	success#147 := __call_ret#6;
	assume success#147;
	balances_re_ent3#132 := balances_re_ent3#132[__this := balances_re_ent3#132[__this][__msg_sender := (balances_re_ent3#132[__this][__msg_sender] - _weiToWithdraw#134)]];
	$return3:
	// Function body ends here
}

// 
// State variable: changehashownerfee: uint256
var {:sourceloc "buggy_50.sol", 50, 3} {:message "changehashownerfee"} changehashownerfee#173: [address_t]int;
// 
// ------- Struct HashRegistration -------
// Storage
type {:datatype} struct_storage_HashRegistration#178;
function {:constructor} HashRegistration#178#constr(owner#175: address_t, registrationtime#177: int) returns (struct_storage_HashRegistration#178);
// Memory
type address_struct_memory_HashRegistration#178 = int;
// Member owner
var {:sourceloc "buggy_50.sol", 54, 9} {:message "owner"} owner#175: [address_struct_memory_HashRegistration#178]address_t;
// Member registrationtime
var {:sourceloc "buggy_50.sol", 55, 9} {:message "registrationtime"} registrationtime#177: [address_struct_memory_HashRegistration#178]int;
// 
// ------- End of struct HashRegistration -------
// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_50.sol", 58, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#180: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_50.sol", 59, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#182: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_50.sol", 60, 4} {:message "digitalNotary::buyTicket_re_ent9"} buyTicket_re_ent9#217(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 61, 7} {:message "success"} success#186: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#182[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#182[__this])];
	assume {:sourceloc "buggy_50.sol", 61, 24} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(lastPlayer_re_ent9#180[__this], __this, jackpot_re_ent9#182[__this]);
	if (__call_ret#8) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#182[__this])];
	}

	success#186 := __call_ret#8;
	if (!(success#186)) {
	assume false;
	}

	lastPlayer_re_ent9#180 := lastPlayer_re_ent9#180[__this := __msg_sender];
	jackpot_re_ent9#182 := jackpot_re_ent9#182[__this := __balance[__this]];
	$return4:
	// Function body ends here
}

// 
// State variable: HashList: mapping(bytes32 => struct digitalNotary.HashRegistration storage ref[] storage ref)
type {:datatype} struct_storage_HashRegistration#178_arr_type;
function {:constructor} struct_storage_HashRegistration#178_arr#constr(arr: [int]struct_storage_HashRegistration#178, length: int) returns (struct_storage_HashRegistration#178_arr_type);
var {:sourceloc "buggy_50.sol", 67, 3} {:message "HashList"} HashList#222: [address_t][int]struct_storage_HashRegistration#178_arr_type;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 69, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#226: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_50.sol", 70, 1} {:message "digitalNotary::claimReward_re_ent25"} claimReward_re_ent25#262(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 73, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#239: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#226[__this][__msg_sender] > 0);
	transferValue_re_ent25#239 := redeemableEther_re_ent25#226[__this][__msg_sender];
	assume {:sourceloc "buggy_50.sol", 74, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#239);
	redeemableEther_re_ent25#226 := redeemableEther_re_ent25#226[__this := redeemableEther_re_ent25#226[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

// 
// State variable: HashListLength: uint256
var {:sourceloc "buggy_50.sol", 77, 3} {:message "HashListLength"} HashListLength#264: [address_t]int;
// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 79, 3} {:message "balances_re_ent31"} balances_re_ent31#268: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 80, 1} {:message "digitalNotary::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#308(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#270: int)
{
	var {:sourceloc "buggy_50.sol", 83, 6} {:message "sent"} sent#283: bool;
	var __call_ret#10: bool;
	var __call_ret#11: int_arr_ptr;
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#268[__this][__msg_sender] >= _weiToWithdraw#270);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#270);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#270)];
	assume {:sourceloc "buggy_50.sol", 83, 20} {:message ""} true;
	call __call_ret#10, __call_ret#11 := __call(__msg_sender, __this, _weiToWithdraw#270);
	if (__call_ret#10) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#10)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#270)];
	}

	sent#283 := __call_ret#10;
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#283;
	balances_re_ent31#268 := balances_re_ent31#268[__this := balances_re_ent31#268[__this][__msg_sender := (balances_re_ent31#268[__this][__msg_sender] - _weiToWithdraw#270)]];
	$return6:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_50.sol", 89, 3} {:message "not_called_re_ent13"} not_called_re_ent13#319: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_50.sol", 90, 1} {:message "digitalNotary::bug_re_ent13"} bug_re_ent13#351(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 92, 10} {:message "success"} success#327: bool;
	var __call_ret#14: bool;
	var __call_ret#15: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#319[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 92, 27} {:message ""} true;
	call __call_ret#14, __call_ret#15 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#14) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#14)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#327 := __call_ret#14;
	if (!(success#327)) {
	assume false;
	}

	not_called_re_ent13#319 := not_called_re_ent13#319[__this := false];
	$return7:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#178|)) (|HashRegistration#178#constr| 0 0))"} default_int_struct_storage_HashRegistration#178() returns ([int]struct_storage_HashRegistration#178);
function {:builtin "((as const (Array Int |T@struct_storage_HashRegistration#178_arr_type|)) (|struct_storage_HashRegistration#178_arr#constr| ((as const (Array Int |T@struct_storage_HashRegistration#178|)) (|HashRegistration#178#constr| 0 0)) 0))"} default_int_struct_storage_HashRegistration#178_arr_type() returns ([int]struct_storage_HashRegistration#178_arr_type);
// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 100, 5} {:message "digitalNotary::[constructor]"} __constructor#1390(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent2#3 := lastPlayer_re_ent2#3[__this := 0];
	jackpot_re_ent2#5 := jackpot_re_ent2#5[__this := 0];
	manager#42 := manager#42[__this := 0];
	balances_re_ent17#46 := balances_re_ent17#46[__this := default_address_t_int()];
	contractactive#87 := contractactive#87[__this := false];
	lastPlayer_re_ent37#89 := lastPlayer_re_ent37#89[__this := 0];
	jackpot_re_ent37#91 := jackpot_re_ent37#91[__this := 0];
	hashfee#128 := hashfee#128[__this := 0];
	balances_re_ent3#132 := balances_re_ent3#132[__this := default_address_t_int()];
	changehashownerfee#173 := changehashownerfee#173[__this := 0];
	lastPlayer_re_ent9#180 := lastPlayer_re_ent9#180[__this := 0];
	jackpot_re_ent9#182 := jackpot_re_ent9#182[__this := 0];
	HashList#222 := HashList#222[__this := default_int_struct_storage_HashRegistration#178_arr_type()];
	redeemableEther_re_ent25#226 := redeemableEther_re_ent25#226[__this := default_address_t_int()];
	HashListLength#264 := HashListLength#264[__this := 0];
	balances_re_ent31#268 := balances_re_ent31#268[__this := default_address_t_int()];
	not_called_re_ent13#319 := not_called_re_ent13#319[__this := true];
	userBalance_re_ent19#393 := userBalance_re_ent19#393[__this := default_address_t_int()];
	userBalance_re_ent26#450 := userBalance_re_ent26#450[__this := default_address_t_int()];
	not_called_re_ent20#505 := not_called_re_ent20#505[__this := true];
	redeemableEther_re_ent32#549 := redeemableEther_re_ent32#549[__this := default_address_t_int()];
	balances_re_ent38#607 := balances_re_ent38#607[__this := default_address_t_int()];
	redeemableEther_re_ent4#659 := redeemableEther_re_ent4#659[__this := default_address_t_int()];
	counter_re_ent7#710 := counter_re_ent7#710[__this := 0];
	lastPlayer_re_ent23#754 := lastPlayer_re_ent23#754[__this := 0];
	jackpot_re_ent23#756 := jackpot_re_ent23#756[__this := 0];
	counter_re_ent14#813 := counter_re_ent14#813[__this := 0];
	lastPlayer_re_ent30#861 := lastPlayer_re_ent30#861[__this := 0];
	jackpot_re_ent30#863 := jackpot_re_ent30#863[__this := 0];
	balances_re_ent8#928 := balances_re_ent8#928[__this := default_address_t_int()];
	redeemableEther_re_ent39#974 := redeemableEther_re_ent39#974[__this := default_address_t_int()];
	balances_re_ent36#1022 := balances_re_ent36#1022[__this := default_address_t_int()];
	counter_re_ent35#1098 := counter_re_ent35#1098[__this := 0];
	userBalance_re_ent40#1198 := userBalance_re_ent40#1198[__this := default_address_t_int()];
	userBalance_re_ent33#1316 := userBalance_re_ent33#1316[__this := default_address_t_int()];
	not_called_re_ent27#1357 := not_called_re_ent27#1357[__this := true];
	// Function body starts here
	manager#42 := manager#42[__this := __msg_sender];
	contractactive#87 := contractactive#87[__this := true];
	hashfee#128 := hashfee#128[__this := 5000000000000000];
	changehashownerfee#173 := changehashownerfee#173[__this := 25000000000000000];
	HashListLength#264 := HashListLength#264[__this := 0];
	$return8:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 114, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#393: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_50.sol", 115, 1} {:message "digitalNotary::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#427(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 118, 10} {:message "success"} success#397: bool;
	var __call_ret#16: bool;
	var __call_ret#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent19#393[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent19#393[__this][__msg_sender])];
	assume {:sourceloc "buggy_50.sol", 118, 27} {:message ""} true;
	call __call_ret#16, __call_ret#17 := __call(__msg_sender, __this, userBalance_re_ent19#393[__this][__msg_sender]);
	if (__call_ret#16) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#16)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent19#393[__this][__msg_sender])];
	}

	success#397 := __call_ret#16;
	if (!(success#397)) {
	assume false;
	}

	userBalance_re_ent19#393 := userBalance_re_ent19#393[__this := userBalance_re_ent19#393[__this][__msg_sender := 0]];
	$return9:
	// Function body ends here
}

// 
// Function: gethashfee
procedure {:sourceloc "buggy_50.sol", 132, 5} {:message "digitalNotary::gethashfee"} gethashfee#446(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#441: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#441 := hashfee#128[__this];
	goto $return10;
	$return10:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 136, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#450: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_50.sol", 137, 1} {:message "digitalNotary::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#484(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 140, 10} {:message "success"} success#454: bool;
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#450[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#450[__this][__msg_sender])];
	assume {:sourceloc "buggy_50.sol", 140, 27} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(__msg_sender, __this, userBalance_re_ent26#450[__this][__msg_sender]);
	if (__call_ret#18) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#18)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#450[__this][__msg_sender])];
	}

	success#454 := __call_ret#18;
	if (!(success#454)) {
	assume false;
	}

	userBalance_re_ent26#450 := userBalance_re_ent26#450[__this := userBalance_re_ent26#450[__this][__msg_sender := 0]];
	$return11:
	// Function body ends here
}

// 
// Function: sethashfee
procedure {:sourceloc "buggy_50.sol", 147, 5} {:message "digitalNotary::sethashfee"} sethashfee#502(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#486: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#42[__this]);
	// Function body starts here
	assume (newfee#486 >= 0);
	hashfee#128 := hashfee#128[__this := newfee#486];
	$return13:
	// Function body ends here
	$return12:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_50.sol", 153, 1} {:message "not_called_re_ent20"} not_called_re_ent20#505: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_50.sol", 154, 1} {:message "digitalNotary::bug_re_ent20"} bug_re_ent20#537(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 156, 10} {:message "success"} success#513: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#505[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 156, 27} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#22) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#513 := __call_ret#22;
	if (!(success#513)) {
	assume false;
	}

	not_called_re_ent20#505 := not_called_re_ent20#505[__this := false];
	$return14:
	// Function body ends here
}

// 
// Function: getchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 163, 5} {:message "digitalNotary::getchangehashownerfee"} getchangehashownerfee#545(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#540: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#540 := changehashownerfee#173[__this];
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 167, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#549: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_50.sol", 168, 1} {:message "digitalNotary::claimReward_re_ent32"} claimReward_re_ent32#585(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 171, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#562: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#549[__this][__msg_sender] > 0);
	transferValue_re_ent32#562 := redeemableEther_re_ent32#549[__this][__msg_sender];
	assume {:sourceloc "buggy_50.sol", 172, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#562);
	redeemableEther_re_ent32#549 := redeemableEther_re_ent32#549[__this := redeemableEther_re_ent32#549[__this][__msg_sender := 0]];
	$return16:
	// Function body ends here
}

// 
// Function: setchangehashownerfee
procedure {:sourceloc "buggy_50.sol", 176, 6} {:message "digitalNotary::setchangehashownerfee"} setchangehashownerfee#603(__this: address_t, __msg_sender: address_t, __msg_value: int, newfee#587: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#42[__this]);
	// Function body starts here
	assume (newfee#587 >= 0);
	changehashownerfee#173 := changehashownerfee#173[__this := newfee#587];
	$return18:
	// Function body ends here
	$return17:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 182, 1} {:message "balances_re_ent38"} balances_re_ent38#607: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_50.sol", 183, 1} {:message "digitalNotary::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#647(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#609: int)
{
	var {:sourceloc "buggy_50.sol", 186, 6} {:message "sent"} sent#622: bool;
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	var call_arg#28: int_arr_ptr;
	var new_array#29: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#607[__this][__msg_sender] >= _weiToWithdraw#609);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#609);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#609)];
	assume {:sourceloc "buggy_50.sol", 186, 20} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(__msg_sender, __this, _weiToWithdraw#609);
	if (__call_ret#26) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#609)];
	}

	sent#622 := __call_ret#26;
	new_array#29 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#28 := new_array#29;
	mem_arr_int := mem_arr_int[call_arg#28 := int_arr#constr(default_int_int()[0 := 115][1 := 101][2 := 110][3 := 100][4 := 32][5 := 102][6 := 97][7 := 105][8 := 108][9 := 101][10 := 100], 11)];
	assume sent#622;
	balances_re_ent38#607 := balances_re_ent38#607[__this := balances_re_ent38#607[__this][__msg_sender := (balances_re_ent38#607[__this][__msg_sender] - _weiToWithdraw#609)]];
	$return19:
	// Function body ends here
}

// 
// Function: getcontractactive
procedure {:sourceloc "buggy_50.sol", 191, 5} {:message "digitalNotary::getcontractactive"} getcontractactive#655(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#650: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#650 := contractactive#87[__this];
	goto $return20;
	$return20:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 195, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#659: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_50.sol", 196, 1} {:message "digitalNotary::claimReward_re_ent4"} claimReward_re_ent4#695(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 199, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#672: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#659[__this][__msg_sender] > 0);
	transferValue_re_ent4#672 := redeemableEther_re_ent4#659[__this][__msg_sender];
	assume {:sourceloc "buggy_50.sol", 200, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#672);
	redeemableEther_re_ent4#659 := redeemableEther_re_ent4#659[__this := redeemableEther_re_ent4#659[__this][__msg_sender := 0]];
	$return21:
	// Function body ends here
}

// 
// Function: setcontractactive
procedure {:sourceloc "buggy_50.sol", 204, 5} {:message "digitalNotary::setcontractactive"} setcontractactive#707(__this: address_t, __msg_sender: address_t, __msg_value: int, contactive#697: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#42[__this]);
	// Function body starts here
	contractactive#87 := contractactive#87[__this := contactive#697];
	$return23:
	// Function body ends here
	$return22:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_50.sol", 208, 1} {:message "counter_re_ent7"} counter_re_ent7#710: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_50.sol", 209, 1} {:message "digitalNotary::callme_re_ent7"} callme_re_ent7#744(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 211, 3} {:message "success"} success#720: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#710[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 211, 20} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#32) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#720 := __call_ret#32;
	if (!(success#720)) {
	assume false;
	}

	counter_re_ent7#710 := counter_re_ent7#710[__this := (counter_re_ent7#710[__this] + 1)];
	$return24:
	// Function body ends here
}

// 
// Function: getmanager
procedure {:sourceloc "buggy_50.sol", 218, 6} {:message "digitalNotary::getmanager"} getmanager#752(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#747: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#747 := manager#42[__this];
	goto $return25;
	$return25:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_50.sol", 222, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#754: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_50.sol", 223, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#756: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_50.sol", 224, 4} {:message "digitalNotary::buyTicket_re_ent23"} buyTicket_re_ent23#791(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 225, 7} {:message "sent"} sent#760: bool;
	var __call_ret#34: bool;
	var __call_ret#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent23#756[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent23#756[__this])];
	assume {:sourceloc "buggy_50.sol", 225, 21} {:message ""} true;
	call __call_ret#34, __call_ret#35 := __call(lastPlayer_re_ent23#754[__this], __this, jackpot_re_ent23#756[__this]);
	if (__call_ret#34) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#34)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent23#756[__this])];
	}

	sent#760 := __call_ret#34;
	if (!(sent#760)) {
	assume false;
	}

	lastPlayer_re_ent23#754 := lastPlayer_re_ent23#754[__this := __msg_sender];
	jackpot_re_ent23#756 := jackpot_re_ent23#756[__this := __balance[__this]];
	$return26:
	// Function body ends here
}

// 
// Function: setmanager
procedure {:sourceloc "buggy_50.sol", 232, 5} {:message "digitalNotary::setmanager"} setmanager#810(__this: address_t, __msg_sender: address_t, __msg_value: int, newmngr#793: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#42[__this]);
	// Function body starts here
	assume (__balance[newmngr#793] > 0);
	manager#42 := manager#42[__this := newmngr#793];
	$return28:
	// Function body ends here
	$return27:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_50.sol", 237, 1} {:message "counter_re_ent14"} counter_re_ent14#813: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_50.sol", 238, 1} {:message "digitalNotary::callme_re_ent14"} callme_re_ent14#847(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 240, 3} {:message "success"} success#823: bool;
	var __call_ret#38: bool;
	var __call_ret#39: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#813[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 240, 20} {:message ""} true;
	call __call_ret#38, __call_ret#39 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#38) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#38)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#823 := __call_ret#38;
	if (!(success#823)) {
	assume false;
	}

	counter_re_ent14#813 := counter_re_ent14#813[__this := (counter_re_ent14#813[__this] + 1)];
	$return29:
	// Function body ends here
}

// 
// Function: getcontractbalance : function () view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 247, 5} {:message "digitalNotary::getcontractbalance"} getcontractbalance#859(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#850: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#850 := __balance[__this];
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_50.sol", 252, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#861: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_50.sol", 253, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#863: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_50.sol", 254, 4} {:message "digitalNotary::buyTicket_re_ent30"} buyTicket_re_ent30#898(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 255, 7} {:message "sent"} sent#867: bool;
	var __call_ret#40: bool;
	var __call_ret#41: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent30#863[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent30#863[__this])];
	assume {:sourceloc "buggy_50.sol", 255, 21} {:message ""} true;
	call __call_ret#40, __call_ret#41 := __call(lastPlayer_re_ent30#861[__this], __this, jackpot_re_ent30#863[__this]);
	if (__call_ret#40) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#40)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent30#863[__this])];
	}

	sent#867 := __call_ret#40;
	if (!(sent#867)) {
	assume false;
	}

	lastPlayer_re_ent30#861 := lastPlayer_re_ent30#861[__this := __msg_sender];
	jackpot_re_ent30#863 := jackpot_re_ent30#863[__this := __balance[__this]];
	$return31:
	// Function body ends here
}

// 
// Function: transfercontractbalance
procedure {:sourceloc "buggy_50.sol", 262, 5} {:message "digitalNotary::transfercontractbalance"} transfercontractbalance#924(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 264, 9} {:message "cb"} cb#904#43: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyManager starts here
	assume (__msg_sender == manager#42[__this]);
	// Function body starts here
	cb#904#43 := __balance[__this];
	assume (cb#904#43 > 0);
	assume {:sourceloc "buggy_50.sol", 268, 9} {:message ""} true;
	call __transfer(manager#42[__this], __this, 0, cb#904#43);
	$return33:
	// Function body ends here
	$return32:
	// Inlined modifier onlyManager ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 270, 1} {:message "balances_re_ent8"} balances_re_ent8#928: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_50.sol", 271, 5} {:message "digitalNotary::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#957(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 272, 9} {:message "success"} success#932: bool;
	var __call_ret#44: bool;
	var __call_ret#45: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#928[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#928[__this][__msg_sender])];
	assume {:sourceloc "buggy_50.sol", 272, 26} {:message ""} true;
	call __call_ret#44, __call_ret#45 := __call(__msg_sender, __this, balances_re_ent8#928[__this][__msg_sender]);
	if (__call_ret#44) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#44)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#928[__this][__msg_sender])];
	}

	success#932 := __call_ret#44;
	if (success#932) {
	balances_re_ent8#928 := balances_re_ent8#928[__this := balances_re_ent8#928[__this][__msg_sender := 0]];
	}

	$return34:
	// Function body ends here
}

// 
// Function: getHashOwnersCount : function (bytes32) view returns (uint256)
procedure {:sourceloc "buggy_50.sol", 277, 5} {:message "digitalNotary::getHashOwnersCount"} getHashOwnersCount#970(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#959: int)
	returns (#962: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume ((0 <= length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#959])) && (length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#959]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	#962 := length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#959]);
	goto $return35;
	$return35:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 281, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#974: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_50.sol", 282, 1} {:message "digitalNotary::claimReward_re_ent39"} claimReward_re_ent39#1010(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 285, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#987: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#974[__this][__msg_sender] > 0);
	transferValue_re_ent39#987 := redeemableEther_re_ent39#974[__this][__msg_sender];
	assume {:sourceloc "buggy_50.sol", 286, 5} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#987);
	redeemableEther_re_ent39#974 := redeemableEther_re_ent39#974[__this := redeemableEther_re_ent39#974[__this][__msg_sender := 0]];
	$return36:
	// Function body ends here
}

// 
// Function: getNumberofHashesRegistered
procedure {:sourceloc "buggy_50.sol", 290, 5} {:message "digitalNotary::getNumberofHashesRegistered"} getNumberofHashesRegistered#1018(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1013: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1013 := HashListLength#264[__this];
	goto $return37;
	$return37:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 294, 1} {:message "balances_re_ent36"} balances_re_ent36#1022: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_50.sol", 295, 5} {:message "digitalNotary::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1051(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 296, 11} {:message "sent"} sent#1026: bool;
	var __call_ret#46: bool;
	var __call_ret#47: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent36#1022[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent36#1022[__this][__msg_sender])];
	assume {:sourceloc "buggy_50.sol", 296, 25} {:message ""} true;
	call __call_ret#46, __call_ret#47 := __call(__msg_sender, __this, balances_re_ent36#1022[__this][__msg_sender]);
	if (__call_ret#46) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#46)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent36#1022[__this][__msg_sender])];
	}

	sent#1026 := __call_ret#46;
	if (sent#1026) {
	balances_re_ent36#1022 := balances_re_ent36#1022[__this := balances_re_ent36#1022[__this][__msg_sender := 0]];
	}

	$return38:
	// Function body ends here
}

// 
// Function: getHashDetails
procedure {:sourceloc "buggy_50.sol", 301, 6} {:message "digitalNotary::getHashDetails"} getHashDetails#1095(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#1053: int, indx#1055: int)
	returns (#1058: address_t, #1060: int)
{
	var {:sourceloc "buggy_50.sol", 304, 9} {:message "owncount"} owncount#1063: int;
	var getHashOwnersCount#970_ret#48: int;
	var tmp#49: address_t;
	var tmp#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_50.sol", 304, 25} {:message ""} true;
	call getHashOwnersCount#970_ret#48 := getHashOwnersCount#970(__this, __msg_sender, __msg_value, hash#1053);
	owncount#1063 := getHashOwnersCount#970_ret#48;
	assume (owncount#1063 > 0);
	assume (indx#1055 < owncount#1063);
	tmp#49 := owner#175#HashRegistration#178#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1053])[indx#1055]);
	tmp#50 := registrationtime#177#HashRegistration#178#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1053])[indx#1055]);
	#1060 := tmp#50;
	#1058 := tmp#49;
	goto $return39;
	$return39:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_50.sol", 310, 1} {:message "counter_re_ent35"} counter_re_ent35#1098: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_50.sol", 311, 1} {:message "digitalNotary::callme_re_ent35"} callme_re_ent35#1132(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 313, 3} {:message "success"} success#1108: bool;
	var __call_ret#51: bool;
	var __call_ret#52: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1098[__this] <= 5);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 10000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 10000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 313, 20} {:message ""} true;
	call __call_ret#51, __call_ret#52 := __call(__msg_sender, __this, 10000000000000000000);
	if (__call_ret#51) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#51)) {
	__balance := __balance[__this := (__balance[__this] + 10000000000000000000)];
	}

	success#1108 := __call_ret#51;
	if (!(success#1108)) {
	assume false;
	}

	counter_re_ent35#1098 := counter_re_ent35#1098[__this := (counter_re_ent35#1098[__this] + 1)];
	$return40:
	// Function body ends here
}

// 
// Function: registerHash
procedure {:sourceloc "buggy_50.sol", 320, 5} {:message "digitalNotary::registerHash"} registerHash#1194(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#1134: int)
{
	var getHashOwnersCount#970_ret#53: int;
	var {:sourceloc "buggy_50.sol", 327, 9} {:message "thisregistration"} thisregistration#1159: address_struct_memory_HashRegistration#178;
	var new_struct_HashRegistration#54: address_struct_memory_HashRegistration#178;
	var tmp#55: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#87[__this] == true);
	assume {:sourceloc "buggy_50.sol", 324, 17} {:message ""} true;
	call getHashOwnersCount#970_ret#53 := getHashOwnersCount#970(__this, __msg_sender, __msg_value, hash#1134);
	assume (getHashOwnersCount#970_ret#53 == 0);
	assume (__msg_value == hashfee#128[__this]);
	new_struct_HashRegistration#54 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#1159 := new_struct_HashRegistration#54;
	owner#175 := owner#175[new_struct_HashRegistration#54 := 0];
	registrationtime#177 := registrationtime#177[new_struct_HashRegistration#54 := 0];
	owner#175 := owner#175[thisregistration#1159 := __msg_sender];
	registrationtime#177 := registrationtime#177[thisregistration#1159 := __block_timestamp];
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1134 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]) := HashRegistration#178#constr(0, 0)], length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]))]];
	// Deep copy struct HashRegistration
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1134 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]) := HashRegistration#178#constr(owner#175[thisregistration#1159], registrationtime#177#HashRegistration#178#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])]))], length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]))]];
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1134 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]) := HashRegistration#178#constr(owner#175#HashRegistration#178#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])]), registrationtime#177[thisregistration#1159])], length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]))]];
	assume ((0 <= length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134])) && (length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1134 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]), (length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1134]) + 1))]];
	tmp#55 := HashListLength#264[__this];
	HashListLength#264 := HashListLength#264[__this := (HashListLength#264[__this] + 1)];
	assume {:sourceloc "buggy_50.sol", 335, 14} {:message ""} true;
	call RegisterHashEvent#316(__this, __msg_sender, __msg_value, owner#175[thisregistration#1159], hash#1134, registrationtime#177[thisregistration#1159]);
	$return41:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 338, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1198: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_50.sol", 339, 1} {:message "digitalNotary::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1232(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 342, 10} {:message "success"} success#1202: bool;
	var __call_ret#56: bool;
	var __call_ret#57: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1198[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1198[__this][__msg_sender])];
	assume {:sourceloc "buggy_50.sol", 342, 27} {:message ""} true;
	call __call_ret#56, __call_ret#57 := __call(__msg_sender, __this, userBalance_re_ent40#1198[__this][__msg_sender]);
	if (__call_ret#56) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#56)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1198[__this][__msg_sender])];
	}

	success#1202 := __call_ret#56;
	if (!(success#1202)) {
	assume false;
	}

	userBalance_re_ent40#1198 := userBalance_re_ent40#1198[__this := userBalance_re_ent40#1198[__this][__msg_sender := 0]];
	$return42:
	// Function body ends here
}

// 
// Function: changeHashOwnership
procedure {:sourceloc "buggy_50.sol", 349, 5} {:message "digitalNotary::changeHashOwnership"} changeHashOwnership#1312(__this: address_t, __msg_sender: address_t, __msg_value: int, hash#1234: int, newowner#1236: address_t)
{
	var {:sourceloc "buggy_50.sol", 353, 9} {:message "owncount"} owncount#1246: int;
	var getHashOwnersCount#970_ret#58: int;
	var {:sourceloc "buggy_50.sol", 358, 9} {:message "thisregistration"} thisregistration#1279: address_struct_memory_HashRegistration#178;
	var new_struct_HashRegistration#59: address_struct_memory_HashRegistration#178;
	var call_arg#60: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	assume (contractactive#87[__this] == true);
	assume {:sourceloc "buggy_50.sol", 353, 25} {:message ""} true;
	call getHashOwnersCount#970_ret#58 := getHashOwnersCount#970(__this, __msg_sender, __msg_value, hash#1234);
	owncount#1246 := getHashOwnersCount#970_ret#58;
	assume (owncount#1246 > 0);
	assume (__msg_sender == owner#175#HashRegistration#178#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])[(owncount#1246 - 1)]));
	assume (__msg_value == changehashownerfee#173[__this]);
	new_struct_HashRegistration#59 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	thisregistration#1279 := new_struct_HashRegistration#59;
	owner#175 := owner#175[new_struct_HashRegistration#59 := 0];
	registrationtime#177 := registrationtime#177[new_struct_HashRegistration#59 := 0];
	owner#175 := owner#175[thisregistration#1279 := newowner#1236];
	registrationtime#177 := registrationtime#177[thisregistration#1279 := __block_timestamp];
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1234 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]) := HashRegistration#178#constr(0, 0)], length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]))]];
	// Deep copy struct HashRegistration
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1234 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]) := HashRegistration#178#constr(owner#175[thisregistration#1279], registrationtime#177#HashRegistration#178#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])]))], length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]))]];
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1234 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]) := HashRegistration#178#constr(owner#175#HashRegistration#178#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])[length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])]), registrationtime#177[thisregistration#1279])], length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]))]];
	assume ((0 <= length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234])) && (length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	HashList#222 := HashList#222[__this := HashList#222[__this][hash#1234 := struct_storage_HashRegistration#178_arr#constr(arr#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]), (length#struct_storage_HashRegistration#178_arr#constr(HashList#222[__this][hash#1234]) + 1))]];
	call_arg#60 := __msg_sender;
	assume {:sourceloc "buggy_50.sol", 364, 14} {:message ""} true;
	call ChangeHashOwnershipEvent#361(__this, __msg_sender, __msg_value, call_arg#60, owner#175[thisregistration#1279], hash#1234, registrationtime#177[thisregistration#1279]);
	$return43:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_50.sol", 366, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1316: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_50.sol", 367, 1} {:message "digitalNotary::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1350(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 370, 10} {:message "success"} success#1320: bool;
	var __call_ret#61: bool;
	var __call_ret#62: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1316[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1316[__this][__msg_sender])];
	assume {:sourceloc "buggy_50.sol", 370, 27} {:message ""} true;
	call __call_ret#61, __call_ret#62 := __call(__msg_sender, __this, userBalance_re_ent33#1316[__this][__msg_sender]);
	if (__call_ret#61) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#61)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1316[__this][__msg_sender])];
	}

	success#1320 := __call_ret#61;
	if (!(success#1320)) {
	assume false;
	}

	userBalance_re_ent33#1316 := userBalance_re_ent33#1316[__this := userBalance_re_ent33#1316[__this][__msg_sender := 0]];
	$return44:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_50.sol", 377, 5} {:message "digitalNotary::[receive]"} #1354(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	$return45:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_50.sol", 378, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1357: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_50.sol", 379, 1} {:message "digitalNotary::bug_re_ent27"} bug_re_ent27#1389(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_50.sol", 381, 10} {:message "success"} success#1365: bool;
	var __call_ret#63: bool;
	var __call_ret#64: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1357[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_50.sol", 381, 27} {:message ""} true;
	call __call_ret#63, __call_ret#64 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#63) {
	havoc lastPlayer_re_ent2#3;
	havoc jackpot_re_ent2#5;
	havoc manager#42;
	havoc balances_re_ent17#46;
	havoc contractactive#87;
	havoc lastPlayer_re_ent37#89;
	havoc jackpot_re_ent37#91;
	havoc hashfee#128;
	havoc balances_re_ent3#132;
	havoc changehashownerfee#173;
	havoc lastPlayer_re_ent9#180;
	havoc jackpot_re_ent9#182;
	havoc HashList#222;
	havoc redeemableEther_re_ent25#226;
	havoc HashListLength#264;
	havoc balances_re_ent31#268;
	havoc not_called_re_ent13#319;
	havoc userBalance_re_ent19#393;
	havoc userBalance_re_ent26#450;
	havoc not_called_re_ent20#505;
	havoc redeemableEther_re_ent32#549;
	havoc balances_re_ent38#607;
	havoc redeemableEther_re_ent4#659;
	havoc counter_re_ent7#710;
	havoc lastPlayer_re_ent23#754;
	havoc jackpot_re_ent23#756;
	havoc counter_re_ent14#813;
	havoc lastPlayer_re_ent30#861;
	havoc jackpot_re_ent30#863;
	havoc balances_re_ent8#928;
	havoc redeemableEther_re_ent39#974;
	havoc balances_re_ent36#1022;
	havoc counter_re_ent35#1098;
	havoc userBalance_re_ent40#1198;
	havoc userBalance_re_ent33#1316;
	havoc not_called_re_ent27#1357;
	havoc __balance;
	}

	if (!(__call_ret#63)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1365 := __call_ret#63;
	if (!(success#1365)) {
	assume false;
	}

	not_called_re_ent27#1357 := not_called_re_ent27#1357[__this := false];
	$return46:
	// Function body ends here
}

