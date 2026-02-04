// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_6.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: Stopped
procedure {:inline 1} {:sourceloc "buggy_6.sol", 41, 3} {:message "[event] Ownable::Stopped"} Stopped#142(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: Started
procedure {:inline 1} {:sourceloc "buggy_6.sol", 50, 3} {:message "[event] Ownable::Started"} Started#176(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_6.sol", 61, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#220(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#216: address_t, newOwner#218: address_t)
{
	
}

// 
// Event: MasterRoleTransferred
procedure {:inline 1} {:sourceloc "buggy_6.sol", 72, 3} {:message "[event] Ownable::MasterRoleTransferred"} MasterRoleTransferred#264(__this: address_t, __msg_sender: address_t, __msg_value: int, previousMaster#260: address_t, newMaster#262: address_t)
{
	
}

// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 9, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#5: [address_t][address_t]int;
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
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_6.sol", 10, 1} {:message "Ownable::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#34(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 13, 16} {:message ""} true;
	call __send_ret#0 := __send(__msg_sender, __this, 0, userBalance_re_ent12#5[__this][__msg_sender]);
	if (!(__send_ret#0)) {
	assume false;
	}

	userBalance_re_ent12#5 := userBalance_re_ent12#5[__this := userBalance_re_ent12#5[__this][__msg_sender := 0]];
	$return0:
	// Function body ends here
}

// 
// State variable: stopped: bool
var {:sourceloc "buggy_6.sol", 18, 3} {:message "stopped"} stopped#36: [address_t]bool;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 19, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#40: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_6.sol", 20, 1} {:message "Ownable::claimReward_re_ent11"} claimReward_re_ent11#76(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 23, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#53: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#40[__this][__msg_sender] > 0);
	transferValue_re_ent11#53 := redeemableEther_re_ent11#40[__this][__msg_sender];
	assume {:sourceloc "buggy_6.sol", 24, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#53);
	redeemableEther_re_ent11#40 := redeemableEther_re_ent11#40[__this := redeemableEther_re_ent11#40[__this][__msg_sender := 0]];
	$return1:
	// Function body ends here
}

// 
// State variable: _owner: address
var {:sourceloc "buggy_6.sol", 27, 3} {:message "_owner"} _owner#78: [address_t]address_t;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 28, 3} {:message "balances_re_ent1"} balances_re_ent1#82: [address_t][address_t]int;
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
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_6.sol", 29, 5} {:message "Ownable::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#111(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 30, 9} {:message "success"} success#86: bool;
	var __call_ret#1: bool;
	var __call_ret#2: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#82[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#82[__this][__msg_sender])];
	assume {:sourceloc "buggy_6.sol", 30, 25} {:message ""} true;
	call __call_ret#1, __call_ret#2 := __call(__msg_sender, __this, balances_re_ent1#82[__this][__msg_sender]);
	if (__call_ret#1) {
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#1)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#82[__this][__msg_sender])];
	}

	success#86 := __call_ret#1;
	if (success#86) {
	balances_re_ent1#82 := balances_re_ent1#82[__this := balances_re_ent1#82[__this][__msg_sender := 0]];
	}

	$return2:
	// Function body ends here
}

// 
// State variable: _master: address
var {:sourceloc "buggy_6.sol", 34, 3} {:message "_master"} _master#113: [address_t]address_t;
// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 36, 3} {:message "balances_re_ent36"} balances_re_ent36#117: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_6.sol", 37, 5} {:message "Ownable::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#140(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 38, 12} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, balances_re_ent36#117[__this][__msg_sender]);
	if (__send_ret#3) {
	balances_re_ent36#117 := balances_re_ent36#117[__this := balances_re_ent36#117[__this][__msg_sender := 0]];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_6.sol", 42, 3} {:message "counter_re_ent35"} counter_re_ent35#145: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_6.sol", 43, 1} {:message "Ownable::callme_re_ent35"} callme_re_ent35#174(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#145[__this] <= 5);
	call_arg#4 := 10000000000000000000;
	assume {:sourceloc "buggy_6.sol", 45, 9} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, call_arg#4);
	if (!(__send_ret#5)) {
	assume false;
	}

	counter_re_ent35#145 := counter_re_ent35#145[__this := (counter_re_ent35#145[__this] + 1)];
	$return4:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 51, 3} {:message "userBalance_re_ent40"} userBalance_re_ent40#180: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_6.sol", 52, 1} {:message "Ownable::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#214(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 55, 10} {:message "success"} success#184: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#180[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#180[__this][__msg_sender])];
	assume {:sourceloc "buggy_6.sol", 55, 25} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, userBalance_re_ent40#180[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#6)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#180[__this][__msg_sender])];
	}

	success#184 := __call_ret#6;
	if (!(success#184)) {
	assume false;
	}

	userBalance_re_ent40#180 := userBalance_re_ent40#180[__this := userBalance_re_ent40#180[__this][__msg_sender := 0]];
	$return5:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 62, 3} {:message "userBalance_re_ent33"} userBalance_re_ent33#224: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_6.sol", 63, 1} {:message "Ownable::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#258(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 66, 10} {:message "success"} success#228: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#224[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#224[__this][__msg_sender])];
	assume {:sourceloc "buggy_6.sol", 66, 26} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, userBalance_re_ent33#224[__this][__msg_sender]);
	if (__call_ret#8) {
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#8)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#224[__this][__msg_sender])];
	}

	success#228 := __call_ret#8;
	if (!(success#228)) {
	assume false;
	}

	userBalance_re_ent33#224 := userBalance_re_ent33#224[__this := userBalance_re_ent33#224[__this][__msg_sender := 0]];
	$return6:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_6.sol", 73, 5} {:message "Ownable::[constructor]"} __constructor#1003(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: address_t;
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent12#5 := userBalance_re_ent12#5[__this := default_address_t_int()];
	stopped#36 := stopped#36[__this := false];
	redeemableEther_re_ent11#40 := redeemableEther_re_ent11#40[__this := default_address_t_int()];
	_owner#78 := _owner#78[__this := 0];
	balances_re_ent1#82 := balances_re_ent1#82[__this := default_address_t_int()];
	_master#113 := _master#113[__this := 0];
	balances_re_ent36#117 := balances_re_ent36#117[__this := default_address_t_int()];
	counter_re_ent35#145 := counter_re_ent35#145[__this := 0];
	userBalance_re_ent40#180 := userBalance_re_ent40#180[__this := default_address_t_int()];
	userBalance_re_ent33#224 := userBalance_re_ent33#224[__this := default_address_t_int()];
	counter_re_ent42#301 := counter_re_ent42#301[__this := 0];
	lastPlayer_re_ent2#340 := lastPlayer_re_ent2#340[__this := 0];
	jackpot_re_ent2#342 := jackpot_re_ent2#342[__this := 0];
	balances_re_ent17#384 := balances_re_ent17#384[__this := default_address_t_int()];
	lastPlayer_re_ent37#467 := lastPlayer_re_ent37#467[__this := 0];
	jackpot_re_ent37#469 := jackpot_re_ent37#469[__this := 0];
	balances_re_ent3#514 := balances_re_ent3#514[__this := default_address_t_int()];
	lastPlayer_re_ent9#567 := lastPlayer_re_ent9#567[__this := 0];
	jackpot_re_ent9#569 := jackpot_re_ent9#569[__this := 0];
	redeemableEther_re_ent25#620 := redeemableEther_re_ent25#620[__this := default_address_t_int()];
	userBalance_re_ent19#668 := userBalance_re_ent19#668[__this := default_address_t_int()];
	userBalance_re_ent26#710 := userBalance_re_ent26#710[__this := default_address_t_int()];
	not_called_re_ent20#756 := not_called_re_ent20#756[__this := true];
	redeemableEther_re_ent32#811 := redeemableEther_re_ent32#811[__this := default_address_t_int()];
	balances_re_ent38#875 := balances_re_ent38#875[__this := default_address_t_int()];
	redeemableEther_re_ent4#923 := redeemableEther_re_ent4#923[__this := default_address_t_int()];
	counter_re_ent7#973 := counter_re_ent7#973[__this := 0];
	// Function body starts here
	stopped#36 := stopped#36[__this := false];
	_owner#78 := _owner#78[__this := __msg_sender];
	_master#113 := _master#113[__this := __msg_sender];
	call_arg#10 := 0;
	assume {:sourceloc "buggy_6.sol", 78, 14} {:message ""} true;
	call OwnershipTransferred#220(__this, __msg_sender, __msg_value, call_arg#10, _owner#78[__this]);
	call_arg#11 := 0;
	assume {:sourceloc "buggy_6.sol", 79, 14} {:message ""} true;
	call MasterRoleTransferred#264(__this, __msg_sender, __msg_value, call_arg#11, _master#113[__this]);
	$return7:
	// Function body ends here
}

// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_6.sol", 81, 1} {:message "counter_re_ent42"} counter_re_ent42#301: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_6.sol", 82, 1} {:message "Ownable::callme_re_ent42"} callme_re_ent42#330(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#301[__this] <= 5);
	call_arg#12 := 10000000000000000000;
	assume {:sourceloc "buggy_6.sol", 84, 9} {:message ""} true;
	call __send_ret#13 := __send(__msg_sender, __this, 0, call_arg#12);
	if (!(__send_ret#13)) {
	assume false;
	}

	counter_re_ent42#301 := counter_re_ent42#301[__this := (counter_re_ent42#301[__this] + 1)];
	$return8:
	// Function body ends here
}

// 
// Function: owner : function () view returns (address)
procedure {:sourceloc "buggy_6.sol", 90, 5} {:message "Ownable::owner"} owner#338(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#333: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#333 := _owner#78[__this];
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_6.sol", 94, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#340: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_6.sol", 95, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#342: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_6.sol", 96, 4} {:message "Ownable::buyTicket_re_ent2"} buyTicket_re_ent2#372(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 97, 12} {:message ""} true;
	call __send_ret#14 := __send(lastPlayer_re_ent2#340[__this], __this, 0, jackpot_re_ent2#342[__this]);
	if (!(__send_ret#14)) {
	assume false;
	}

	lastPlayer_re_ent2#340 := lastPlayer_re_ent2#340[__this := __msg_sender];
	jackpot_re_ent2#342 := jackpot_re_ent2#342[__this := __balance[__this]];
	$return10:
	// Function body ends here
}

// 
// Function: master : function () view returns (address)
procedure {:sourceloc "buggy_6.sol", 103, 5} {:message "Ownable::master"} master#380(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#375: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#375 := _master#113[__this];
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 107, 1} {:message "balances_re_ent17"} balances_re_ent17#384: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_6.sol", 108, 1} {:message "Ownable::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#423(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#386: int)
{
	var {:sourceloc "buggy_6.sol", 111, 10} {:message "success"} success#399: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#384[__this][__msg_sender] >= _weiToWithdraw#386);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#386);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#386)];
	assume {:sourceloc "buggy_6.sol", 111, 25} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, _weiToWithdraw#386);
	if (__call_ret#15) {
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#15)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#386)];
	}

	success#399 := __call_ret#15;
	assume success#399;
	balances_re_ent17#384 := balances_re_ent17#384[__this := balances_re_ent17#384[__this][__msg_sender := (balances_re_ent17#384[__this][__msg_sender] - _weiToWithdraw#386)]];
	$return12:
	// Function body ends here
}

// 
// Function: isOwner : function () view returns (bool)
procedure {:sourceloc "buggy_6.sol", 134, 5} {:message "Ownable::isOwner"} isOwner#465(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#457: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#457 := (__msg_sender == _owner#78[__this]);
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_6.sol", 138, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#467: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_6.sol", 139, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#469: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_6.sol", 140, 4} {:message "Ownable::buyTicket_re_ent37"} buyTicket_re_ent37#499(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 141, 12} {:message ""} true;
	call __send_ret#17 := __send(lastPlayer_re_ent37#467[__this], __this, 0, jackpot_re_ent37#469[__this]);
	if (!(__send_ret#17)) {
	assume false;
	}

	lastPlayer_re_ent37#467 := lastPlayer_re_ent37#467[__this := __msg_sender];
	jackpot_re_ent37#469 := jackpot_re_ent37#469[__this := __balance[__this]];
	$return14:
	// Function body ends here
}

// 
// Function: isMaster : function () view returns (bool)
procedure {:sourceloc "buggy_6.sol", 147, 5} {:message "Ownable::isMaster"} isMaster#510(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#502: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#502 := (__msg_sender == _master#113[__this]);
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 151, 1} {:message "balances_re_ent3"} balances_re_ent3#514: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_6.sol", 152, 1} {:message "Ownable::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#553(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#516: int)
{
	var {:sourceloc "buggy_6.sol", 155, 3} {:message "success"} success#529: bool;
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#514[__this][__msg_sender] >= _weiToWithdraw#516);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#516);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#516)];
	assume {:sourceloc "buggy_6.sol", 155, 19} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(__msg_sender, __this, _weiToWithdraw#516);
	if (__call_ret#18) {
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#18)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#516)];
	}

	success#529 := __call_ret#18;
	assume success#529;
	balances_re_ent3#514 := balances_re_ent3#514[__this := balances_re_ent3#514[__this][__msg_sender := (balances_re_ent3#514[__this][__msg_sender] - _weiToWithdraw#516)]];
	$return16:
	// Function body ends here
}

// 
// Function: transferOwnership
procedure {:sourceloc "buggy_6.sol", 160, 5} {:message "Ownable::transferOwnership"} transferOwnership#565(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#555: address_t)
{
	var isOwner#465_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_6.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#21 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#21;
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 162, 9} {:message ""} true;
	call _transferOwnership#807(__this, __msg_sender, __msg_value, newOwner#555);
	$return18:
	// Function body ends here
	$return17:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_6.sol", 164, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#567: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_6.sol", 165, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#569: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_6.sol", 166, 4} {:message "Ownable::buyTicket_re_ent9"} buyTicket_re_ent9#604(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 167, 7} {:message "success"} success#573: bool;
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#569[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#569[__this])];
	assume {:sourceloc "buggy_6.sol", 167, 24} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(lastPlayer_re_ent9#567[__this], __this, jackpot_re_ent9#569[__this]);
	if (__call_ret#23) {
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#23)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#569[__this])];
	}

	success#573 := __call_ret#23;
	if (!(success#573)) {
	assume false;
	}

	lastPlayer_re_ent9#567 := lastPlayer_re_ent9#567[__this := __msg_sender];
	jackpot_re_ent9#569 := jackpot_re_ent9#569[__this := __balance[__this]];
	$return19:
	// Function body ends here
}

// 
// Function: transferMasterRole
procedure {:sourceloc "buggy_6.sol", 174, 5} {:message "Ownable::transferMasterRole"} transferMasterRole#616(__this: address_t, __msg_sender: address_t, __msg_value: int, newMaster#606: address_t)
{
	var isOwner#465_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_6.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#26 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#26;
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 176, 9} {:message ""} true;
	call _transferMasterRole#871(__this, __msg_sender, __msg_value, newMaster#606);
	$return21:
	// Function body ends here
	$return20:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 178, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#620: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_6.sol", 179, 1} {:message "Ownable::claimReward_re_ent25"} claimReward_re_ent25#656(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 182, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#633: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#620[__this][__msg_sender] > 0);
	transferValue_re_ent25#633 := redeemableEther_re_ent25#620[__this][__msg_sender];
	assume {:sourceloc "buggy_6.sol", 183, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#633);
	redeemableEther_re_ent25#620 := redeemableEther_re_ent25#620[__this := redeemableEther_re_ent25#620[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// Function: isStopped : function () view returns (bool)
procedure {:sourceloc "buggy_6.sol", 187, 5} {:message "Ownable::isStopped"} isStopped#664(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#659: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#659 := stopped#36[__this];
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 191, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#668: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_6.sol", 192, 1} {:message "Ownable::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#697(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 195, 16} {:message ""} true;
	call __send_ret#28 := __send(__msg_sender, __this, 0, userBalance_re_ent19#668[__this][__msg_sender]);
	if (!(__send_ret#28)) {
	assume false;
	}

	userBalance_re_ent19#668 := userBalance_re_ent19#668[__this := userBalance_re_ent19#668[__this][__msg_sender := 0]];
	$return24:
	// Function body ends here
}

// 
// Function: stop : function ()
procedure {:sourceloc "buggy_6.sol", 201, 5} {:message "Ownable::stop"} stop#706(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var isOwner#465_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_6.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#30 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#30;
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 203, 9} {:message ""} true;
	call _stop#919(__this, __msg_sender, __msg_value);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 205, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#710: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_6.sol", 206, 1} {:message "Ownable::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#744(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 209, 10} {:message "success"} success#714: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#710[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#710[__this][__msg_sender])];
	assume {:sourceloc "buggy_6.sol", 209, 26} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, userBalance_re_ent26#710[__this][__msg_sender]);
	if (__call_ret#32) {
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#710[__this][__msg_sender])];
	}

	success#714 := __call_ret#32;
	if (!(success#714)) {
	assume false;
	}

	userBalance_re_ent26#710 := userBalance_re_ent26#710[__this := userBalance_re_ent26#710[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: start : function ()
procedure {:sourceloc "buggy_6.sol", 216, 5} {:message "Ownable::start"} start#753(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var isOwner#465_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_6.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#35 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#35;
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 218, 9} {:message ""} true;
	call _start#970(__this, __msg_sender, __msg_value);
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_6.sol", 220, 1} {:message "not_called_re_ent20"} not_called_re_ent20#756: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_6.sol", 221, 1} {:message "Ownable::bug_re_ent20"} bug_re_ent20#783(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#756[__this];
	call_arg#37 := 1000000000000000000;
	assume {:sourceloc "buggy_6.sol", 223, 16} {:message ""} true;
	call __send_ret#38 := __send(__msg_sender, __this, 0, call_arg#37);
	if (!(__send_ret#38)) {
	assume false;
	}

	not_called_re_ent20#756 := not_called_re_ent20#756[__this := false];
	$return30:
	// Function body ends here
}

// 
// Function: _transferOwnership : function (address)
procedure {:inline 1} {:sourceloc "buggy_6.sol", 229, 5} {:message "Ownable::_transferOwnership"} _transferOwnership#807(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#785: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (newOwner#785 != 0);
	assume {:sourceloc "buggy_6.sol", 232, 14} {:message ""} true;
	call OwnershipTransferred#220(__this, __msg_sender, __msg_value, _owner#78[__this], newOwner#785);
	_owner#78 := _owner#78[__this := newOwner#785];
	$return31:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 235, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#811: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_6.sol", 236, 1} {:message "Ownable::claimReward_re_ent32"} claimReward_re_ent32#847(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 239, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#824: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#811[__this][__msg_sender] > 0);
	transferValue_re_ent32#824 := redeemableEther_re_ent32#811[__this][__msg_sender];
	assume {:sourceloc "buggy_6.sol", 240, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#824);
	redeemableEther_re_ent32#811 := redeemableEther_re_ent32#811[__this := redeemableEther_re_ent32#811[__this][__msg_sender := 0]];
	$return32:
	// Function body ends here
}

// 
// Function: _transferMasterRole : function (address)
procedure {:inline 1} {:sourceloc "buggy_6.sol", 244, 5} {:message "Ownable::_transferMasterRole"} _transferMasterRole#871(__this: address_t, __msg_sender: address_t, __msg_value: int, newMaster#849: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (newMaster#849 != 0);
	assume {:sourceloc "buggy_6.sol", 247, 14} {:message ""} true;
	call MasterRoleTransferred#264(__this, __msg_sender, __msg_value, _master#113[__this], newMaster#849);
	_master#113 := _master#113[__this := newMaster#849];
	$return33:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 250, 1} {:message "balances_re_ent38"} balances_re_ent38#875: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_6.sol", 251, 1} {:message "Ownable::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#908(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#877: int)
{
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#875[__this][__msg_sender] >= _weiToWithdraw#877);
	assume {:sourceloc "buggy_6.sol", 254, 17} {:message ""} true;
	call __send_ret#39 := __send(__msg_sender, __this, 0, _weiToWithdraw#877);
	assume __send_ret#39;
	balances_re_ent38#875 := balances_re_ent38#875[__this := balances_re_ent38#875[__this][__msg_sender := (balances_re_ent38#875[__this][__msg_sender] - _weiToWithdraw#877)]];
	$return34:
	// Function body ends here
}

// 
// Function: _stop : function ()
procedure {:inline 1} {:sourceloc "buggy_6.sol", 258, 5} {:message "Ownable::_stop"} _stop#919(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 260, 14} {:message ""} true;
	call Stopped#142(__this, __msg_sender, __msg_value);
	stopped#36 := stopped#36[__this := true];
	$return35:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 263, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#923: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_6.sol", 264, 1} {:message "Ownable::claimReward_re_ent4"} claimReward_re_ent4#959(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 267, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#936: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#923[__this][__msg_sender] > 0);
	transferValue_re_ent4#936 := redeemableEther_re_ent4#923[__this][__msg_sender];
	assume {:sourceloc "buggy_6.sol", 268, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#936);
	redeemableEther_re_ent4#923 := redeemableEther_re_ent4#923[__this := redeemableEther_re_ent4#923[__this][__msg_sender := 0]];
	$return36:
	// Function body ends here
}

// 
// Function: _start : function ()
procedure {:inline 1} {:sourceloc "buggy_6.sol", 272, 5} {:message "Ownable::_start"} _start#970(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 274, 14} {:message ""} true;
	call Started#176(__this, __msg_sender, __msg_value);
	stopped#36 := stopped#36[__this := false];
	$return37:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_6.sol", 277, 1} {:message "counter_re_ent7"} counter_re_ent7#973: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_6.sol", 278, 1} {:message "Ownable::callme_re_ent7"} callme_re_ent7#1002(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int;
	var __send_ret#41: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#973[__this] <= 5);
	call_arg#40 := 10000000000000000000;
	assume {:sourceloc "buggy_6.sol", 280, 9} {:message ""} true;
	call __send_ret#41 := __send(__msg_sender, __this, 0, call_arg#40);
	if (!(__send_ret#41)) {
	assume false;
	}

	counter_re_ent7#973 := counter_re_ent7#973[__this := (counter_re_ent7#973[__this] + 1)];
	$return38:
	// Function body ends here
}

// 
// ------- Contract: ChannelWallet -------
// Inherits from: Ownable
// 
// Event: SetAddress
procedure {:inline 1} {:sourceloc "buggy_6.sol", 307, 3} {:message "[event] ChannelWallet::SetAddress"} SetAddress#1075(__this: address_t, __msg_sender: address_t, __msg_value: int, channelId#1071: int_arr_ptr, _address#1073: address_t)
{
	
}

// 
// Event: UpdateAddress
procedure {:inline 1} {:sourceloc "buggy_6.sol", 315, 3} {:message "[event] ChannelWallet::UpdateAddress"} UpdateAddress#1118(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1114: int_arr_ptr, to#1116: int_arr_ptr)
{
	
}

// 
// Event: DeleteAddress
procedure {:inline 1} {:sourceloc "buggy_6.sol", 325, 3} {:message "[event] ChannelWallet::DeleteAddress"} DeleteAddress#1157(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1155: int_arr_ptr)
{
	
}

// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_6.sol", 289, 3} {:message "not_called_re_ent41"} not_called_re_ent41#1008: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_6.sol", 290, 1} {:message "ChannelWallet::bug_re_ent41"} bug_re_ent41#1035(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#42: int;
	var __send_ret#43: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#1008[__this];
	call_arg#42 := 1000000000000000000;
	assume {:sourceloc "buggy_6.sol", 292, 16} {:message ""} true;
	call __send_ret#43 := __send(__msg_sender, __this, 0, call_arg#42);
	if (!(__send_ret#43)) {
	assume false;
	}

	not_called_re_ent41#1008 := not_called_re_ent41#1008[__this := false];
	$return39:
	// Function body ends here
}

// 
// State variable: addressMap: mapping(string memory => address)
var {:sourceloc "buggy_6.sol", 297, 3} {:message "addressMap"} addressMap#1039: [address_t][int_arr_type]address_t;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_6.sol", 299, 3} {:message "not_called_re_ent27"} not_called_re_ent27#1042: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_6.sol", 300, 1} {:message "ChannelWallet::bug_re_ent27"} bug_re_ent27#1069(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1042[__this];
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_6.sol", 302, 16} {:message ""} true;
	call __send_ret#45 := __send(__msg_sender, __this, 0, call_arg#44);
	if (!(__send_ret#45)) {
	assume false;
	}

	not_called_re_ent27#1042 := not_called_re_ent27#1042[__this := false];
	$return40:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 308, 3} {:message "balances_re_ent31"} balances_re_ent31#1079: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_6.sol", 309, 1} {:message "ChannelWallet::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1112(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1081: int)
{
	var __send_ret#46: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1079[__this][__msg_sender] >= _weiToWithdraw#1081);
	assume {:sourceloc "buggy_6.sol", 312, 17} {:message ""} true;
	call __send_ret#46 := __send(__msg_sender, __this, 0, _weiToWithdraw#1081);
	assume __send_ret#46;
	balances_re_ent31#1079 := balances_re_ent31#1079[__this := balances_re_ent31#1079[__this][__msg_sender := (balances_re_ent31#1079[__this][__msg_sender] - _weiToWithdraw#1081)]];
	$return41:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_6.sol", 316, 3} {:message "not_called_re_ent13"} not_called_re_ent13#1121: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_6.sol", 317, 1} {:message "ChannelWallet::bug_re_ent13"} bug_re_ent13#1153(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 319, 10} {:message "success"} success#1129: bool;
	var __call_ret#47: bool;
	var __call_ret#48: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1121[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_6.sol", 319, 25} {:message ""} true;
	call __call_ret#47, __call_ret#48 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#47) {
	havoc not_called_re_ent41#1008;
	havoc addressMap#1039;
	havoc not_called_re_ent27#1042;
	havoc balances_re_ent31#1079;
	havoc not_called_re_ent13#1121;
	havoc lastPlayer_re_ent23#1167;
	havoc jackpot_re_ent23#1169;
	havoc counter_re_ent14#1214;
	havoc lastPlayer_re_ent30#1278;
	havoc jackpot_re_ent30#1280;
	havoc balances_re_ent8#1379;
	havoc redeemableEther_re_ent39#1445;
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#47)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1129 := __call_ret#47;
	if (!(success#1129)) {
	assume false;
	}

	not_called_re_ent13#1121 := not_called_re_ent13#1121[__this := false];
	$return42:
	// Function body ends here
}

// 
// Function: version
procedure {:sourceloc "buggy_6.sol", 327, 5} {:message "ChannelWallet::version"} version#1165(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1160: int_arr_ptr)
{
	var new_array#49: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#49 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1160 := new_array#49;
	mem_arr_int := mem_arr_int[#1160 := int_arr#constr(default_int_int()[0 := 48][1 := 46][2 := 48][3 := 46][4 := 49], 5)];
	goto $return43;
	$return43:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_6.sol", 331, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1167: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_6.sol", 332, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1169: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_6.sol", 333, 4} {:message "ChannelWallet::buyTicket_re_ent23"} buyTicket_re_ent23#1199(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#50: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 334, 12} {:message ""} true;
	call __send_ret#50 := __send(lastPlayer_re_ent23#1167[__this], __this, 0, jackpot_re_ent23#1169[__this]);
	if (!(__send_ret#50)) {
	assume false;
	}

	lastPlayer_re_ent23#1167 := lastPlayer_re_ent23#1167[__this := __msg_sender];
	jackpot_re_ent23#1169 := jackpot_re_ent23#1169[__this := __balance[__this]];
	$return44:
	// Function body ends here
}

// 
// Function: getAddress
procedure {:sourceloc "buggy_6.sol", 340, 5} {:message "ChannelWallet::getAddress"} getAddress#1211(__this: address_t, __msg_sender: address_t, __msg_value: int, channelId#1201: int_arr_ptr)
	returns (#1204: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1204 := addressMap#1039[__this][channelId#1201];
	goto $return45;
	$return45:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_6.sol", 344, 1} {:message "counter_re_ent14"} counter_re_ent14#1214: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_6.sol", 345, 1} {:message "ChannelWallet::callme_re_ent14"} callme_re_ent14#1243(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1214[__this] <= 5);
	call_arg#51 := 10000000000000000000;
	assume {:sourceloc "buggy_6.sol", 347, 9} {:message ""} true;
	call __send_ret#52 := __send(__msg_sender, __this, 0, call_arg#51);
	if (!(__send_ret#52)) {
	assume false;
	}

	counter_re_ent14#1214 := counter_re_ent14#1214[__this := (counter_re_ent14#1214[__this] + 1)];
	$return46:
	// Function body ends here
}

// 
// Function: setAddress
procedure {:sourceloc "buggy_6.sol", 353, 5} {:message "ChannelWallet::setAddress"} setAddress#1276(__this: address_t, __msg_sender: address_t, __msg_value: int, channelId#1245: int_arr_ptr, _address#1247: address_t)
{
	var isOwner#465_ret#54: bool;
	var isMaster#510_ret#55: bool;
	var isStopped#664_ret#57: bool;
	var call_arg#59: int_arr_ptr;
	var new_array#60: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyMaster starts here
	assume {:sourceloc "buggy_6.sol", 124, 31} {:message ""} true;
	call isOwner#465_ret#54 := isOwner#465(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_6.sol", 124, 17} {:message ""} true;
	call isMaster#510_ret#55 := isMaster#510(__this, __msg_sender, __msg_value);
	assume (isMaster#510_ret#55 || isOwner#465_ret#54);
	// Inlined modifier onlyWhenNotStopped starts here
	assume {:sourceloc "buggy_6.sol", 130, 18} {:message ""} true;
	call isStopped#664_ret#57 := isStopped#664(__this, __msg_sender, __msg_value);
	assume !(isStopped#664_ret#57);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(mem_arr_int[channelId#1245])) && (length#int_arr#constr(mem_arr_int[channelId#1245]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[channelId#1245]) > 0);
	addressMap#1039 := addressMap#1039[__this := addressMap#1039[__this][channelId#1245 := _address#1247]];
	new_array#60 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#59 := new_array#60;
	mem_arr_int := mem_arr_int[call_arg#59 := mem_arr_int[channelId#1245]];
	assume {:sourceloc "buggy_6.sol", 359, 14} {:message ""} true;
	call SetAddress#1075(__this, __msg_sender, __msg_value, call_arg#59, _address#1247);
	$return49:
	// Function body ends here
	$return48:
	// Inlined modifier onlyWhenNotStopped ends here
	$return47:
	// Inlined modifier onlyMaster ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_6.sol", 361, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1278: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_6.sol", 362, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1280: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_6.sol", 363, 4} {:message "ChannelWallet::buyTicket_re_ent30"} buyTicket_re_ent30#1310(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#61: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_6.sol", 364, 12} {:message ""} true;
	call __send_ret#61 := __send(lastPlayer_re_ent30#1278[__this], __this, 0, jackpot_re_ent30#1280[__this]);
	if (!(__send_ret#61)) {
	assume false;
	}

	lastPlayer_re_ent30#1278 := lastPlayer_re_ent30#1278[__this := __msg_sender];
	jackpot_re_ent30#1280 := jackpot_re_ent30#1280[__this := __balance[__this]];
	$return50:
	// Function body ends here
}

// 
// Function: updateChannel
procedure {:sourceloc "buggy_6.sol", 370, 5} {:message "ChannelWallet::updateChannel"} updateChannel#1375(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1312: int_arr_ptr, to#1314: int_arr_ptr, _address#1316: address_t)
{
	var isOwner#465_ret#63: bool;
	var isMaster#510_ret#64: bool;
	var isStopped#664_ret#66: bool;
	var call_arg#68: int_arr_ptr;
	var new_array#69: int_arr_ptr;
	var call_arg#70: int_arr_ptr;
	var new_array#71: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyMaster starts here
	assume {:sourceloc "buggy_6.sol", 124, 31} {:message ""} true;
	call isOwner#465_ret#63 := isOwner#465(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_6.sol", 124, 17} {:message ""} true;
	call isMaster#510_ret#64 := isMaster#510(__this, __msg_sender, __msg_value);
	assume (isMaster#510_ret#64 || isOwner#465_ret#63);
	// Inlined modifier onlyWhenNotStopped starts here
	assume {:sourceloc "buggy_6.sol", 130, 18} {:message ""} true;
	call isStopped#664_ret#66 := isStopped#664(__this, __msg_sender, __msg_value);
	assume !(isStopped#664_ret#66);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(mem_arr_int[from#1312])) && (length#int_arr#constr(mem_arr_int[from#1312]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[from#1312]) > 0);
	assume ((0 <= length#int_arr#constr(mem_arr_int[to#1314])) && (length#int_arr#constr(mem_arr_int[to#1314]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[to#1314]) > 0);
	assume (addressMap#1039[__this][to#1314] == 0);
	addressMap#1039 := addressMap#1039[__this := addressMap#1039[__this][to#1314 := _address#1316]];
	addressMap#1039 := addressMap#1039[__this := addressMap#1039[__this][from#1312 := 0]];
	new_array#69 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#68 := new_array#69;
	mem_arr_int := mem_arr_int[call_arg#68 := mem_arr_int[from#1312]];
	new_array#71 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#70 := new_array#71;
	mem_arr_int := mem_arr_int[call_arg#70 := mem_arr_int[to#1314]];
	assume {:sourceloc "buggy_6.sol", 380, 14} {:message ""} true;
	call UpdateAddress#1118(__this, __msg_sender, __msg_value, call_arg#68, call_arg#70);
	$return53:
	// Function body ends here
	$return52:
	// Inlined modifier onlyWhenNotStopped ends here
	$return51:
	// Inlined modifier onlyMaster ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 382, 1} {:message "balances_re_ent8"} balances_re_ent8#1379: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_6.sol", 383, 5} {:message "ChannelWallet::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1408(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 384, 9} {:message "success"} success#1383: bool;
	var __call_ret#72: bool;
	var __call_ret#73: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1379[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1379[__this][__msg_sender])];
	assume {:sourceloc "buggy_6.sol", 384, 26} {:message ""} true;
	call __call_ret#72, __call_ret#73 := __call(__msg_sender, __this, balances_re_ent8#1379[__this][__msg_sender]);
	if (__call_ret#72) {
	havoc not_called_re_ent41#1008;
	havoc addressMap#1039;
	havoc not_called_re_ent27#1042;
	havoc balances_re_ent31#1079;
	havoc not_called_re_ent13#1121;
	havoc lastPlayer_re_ent23#1167;
	havoc jackpot_re_ent23#1169;
	havoc counter_re_ent14#1214;
	havoc lastPlayer_re_ent30#1278;
	havoc jackpot_re_ent30#1280;
	havoc balances_re_ent8#1379;
	havoc redeemableEther_re_ent39#1445;
	havoc userBalance_re_ent12#5;
	havoc stopped#36;
	havoc redeemableEther_re_ent11#40;
	havoc _owner#78;
	havoc balances_re_ent1#82;
	havoc _master#113;
	havoc balances_re_ent36#117;
	havoc counter_re_ent35#145;
	havoc userBalance_re_ent40#180;
	havoc userBalance_re_ent33#224;
	havoc counter_re_ent42#301;
	havoc lastPlayer_re_ent2#340;
	havoc jackpot_re_ent2#342;
	havoc balances_re_ent17#384;
	havoc lastPlayer_re_ent37#467;
	havoc jackpot_re_ent37#469;
	havoc balances_re_ent3#514;
	havoc lastPlayer_re_ent9#567;
	havoc jackpot_re_ent9#569;
	havoc redeemableEther_re_ent25#620;
	havoc userBalance_re_ent19#668;
	havoc userBalance_re_ent26#710;
	havoc not_called_re_ent20#756;
	havoc redeemableEther_re_ent32#811;
	havoc balances_re_ent38#875;
	havoc redeemableEther_re_ent4#923;
	havoc counter_re_ent7#973;
	havoc __balance;
	}

	if (!(__call_ret#72)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1379[__this][__msg_sender])];
	}

	success#1383 := __call_ret#72;
	if (success#1383) {
	balances_re_ent8#1379 := balances_re_ent8#1379[__this := balances_re_ent8#1379[__this][__msg_sender := 0]];
	}

	$return54:
	// Function body ends here
}

// 
// Function: deleteChannel
procedure {:sourceloc "buggy_6.sol", 389, 5} {:message "ChannelWallet::deleteChannel"} deleteChannel#1441(__this: address_t, __msg_sender: address_t, __msg_value: int, channelId#1410: int_arr_ptr)
{
	var isOwner#465_ret#75: bool;
	var isMaster#510_ret#76: bool;
	var isStopped#664_ret#78: bool;
	var call_arg#80: int_arr_ptr;
	var new_array#81: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyMaster starts here
	assume {:sourceloc "buggy_6.sol", 124, 31} {:message ""} true;
	call isOwner#465_ret#75 := isOwner#465(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_6.sol", 124, 17} {:message ""} true;
	call isMaster#510_ret#76 := isMaster#510(__this, __msg_sender, __msg_value);
	assume (isMaster#510_ret#76 || isOwner#465_ret#75);
	// Inlined modifier onlyWhenNotStopped starts here
	assume {:sourceloc "buggy_6.sol", 130, 18} {:message ""} true;
	call isStopped#664_ret#78 := isStopped#664(__this, __msg_sender, __msg_value);
	assume !(isStopped#664_ret#78);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(mem_arr_int[channelId#1410])) && (length#int_arr#constr(mem_arr_int[channelId#1410]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[channelId#1410]) > 0);
	addressMap#1039 := addressMap#1039[__this := addressMap#1039[__this][channelId#1410 := 0]];
	new_array#81 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#80 := new_array#81;
	mem_arr_int := mem_arr_int[call_arg#80 := mem_arr_int[channelId#1410]];
	assume {:sourceloc "buggy_6.sol", 395, 14} {:message ""} true;
	call DeleteAddress#1157(__this, __msg_sender, __msg_value, call_arg#80);
	$return57:
	// Function body ends here
	$return56:
	// Inlined modifier onlyWhenNotStopped ends here
	$return55:
	// Inlined modifier onlyMaster ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_6.sol", 397, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1445: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_6.sol", 398, 1} {:message "ChannelWallet::claimReward_re_ent39"} claimReward_re_ent39#1481(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_6.sol", 401, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1458: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1445[__this][__msg_sender] > 0);
	transferValue_re_ent39#1458 := redeemableEther_re_ent39#1445[__this][__msg_sender];
	assume {:sourceloc "buggy_6.sol", 402, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1458);
	redeemableEther_re_ent39#1445 := redeemableEther_re_ent39#1445[__this := redeemableEther_re_ent39#1445[__this][__msg_sender := 0]];
	$return58:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array |T@int_arr_type| Int)) 0)"} default_int_arr_type_address_t() returns ([int_arr_type]address_t);
procedure {:sourceloc "buggy_6.sol", 287, 1} {:message "ChannelWallet::[implicit_constructor]"} __constructor#1482(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#83: address_t;
	var call_arg#84: address_t;
	assume (__balance[__this] >= 0);
	not_called_re_ent41#1008 := not_called_re_ent41#1008[__this := true];
	addressMap#1039 := addressMap#1039[__this := default_int_arr_type_address_t()];
	not_called_re_ent27#1042 := not_called_re_ent27#1042[__this := true];
	balances_re_ent31#1079 := balances_re_ent31#1079[__this := default_address_t_int()];
	not_called_re_ent13#1121 := not_called_re_ent13#1121[__this := true];
	lastPlayer_re_ent23#1167 := lastPlayer_re_ent23#1167[__this := 0];
	jackpot_re_ent23#1169 := jackpot_re_ent23#1169[__this := 0];
	counter_re_ent14#1214 := counter_re_ent14#1214[__this := 0];
	lastPlayer_re_ent30#1278 := lastPlayer_re_ent30#1278[__this := 0];
	jackpot_re_ent30#1280 := jackpot_re_ent30#1280[__this := 0];
	balances_re_ent8#1379 := balances_re_ent8#1379[__this := default_address_t_int()];
	redeemableEther_re_ent39#1445 := redeemableEther_re_ent39#1445[__this := default_address_t_int()];
	userBalance_re_ent12#5 := userBalance_re_ent12#5[__this := default_address_t_int()];
	stopped#36 := stopped#36[__this := false];
	redeemableEther_re_ent11#40 := redeemableEther_re_ent11#40[__this := default_address_t_int()];
	_owner#78 := _owner#78[__this := 0];
	balances_re_ent1#82 := balances_re_ent1#82[__this := default_address_t_int()];
	_master#113 := _master#113[__this := 0];
	balances_re_ent36#117 := balances_re_ent36#117[__this := default_address_t_int()];
	counter_re_ent35#145 := counter_re_ent35#145[__this := 0];
	userBalance_re_ent40#180 := userBalance_re_ent40#180[__this := default_address_t_int()];
	userBalance_re_ent33#224 := userBalance_re_ent33#224[__this := default_address_t_int()];
	counter_re_ent42#301 := counter_re_ent42#301[__this := 0];
	lastPlayer_re_ent2#340 := lastPlayer_re_ent2#340[__this := 0];
	jackpot_re_ent2#342 := jackpot_re_ent2#342[__this := 0];
	balances_re_ent17#384 := balances_re_ent17#384[__this := default_address_t_int()];
	lastPlayer_re_ent37#467 := lastPlayer_re_ent37#467[__this := 0];
	jackpot_re_ent37#469 := jackpot_re_ent37#469[__this := 0];
	balances_re_ent3#514 := balances_re_ent3#514[__this := default_address_t_int()];
	lastPlayer_re_ent9#567 := lastPlayer_re_ent9#567[__this := 0];
	jackpot_re_ent9#569 := jackpot_re_ent9#569[__this := 0];
	redeemableEther_re_ent25#620 := redeemableEther_re_ent25#620[__this := default_address_t_int()];
	userBalance_re_ent19#668 := userBalance_re_ent19#668[__this := default_address_t_int()];
	userBalance_re_ent26#710 := userBalance_re_ent26#710[__this := default_address_t_int()];
	not_called_re_ent20#756 := not_called_re_ent20#756[__this := true];
	redeemableEther_re_ent32#811 := redeemableEther_re_ent32#811[__this := default_address_t_int()];
	balances_re_ent38#875 := balances_re_ent38#875[__this := default_address_t_int()];
	redeemableEther_re_ent4#923 := redeemableEther_re_ent4#923[__this := default_address_t_int()];
	counter_re_ent7#973 := counter_re_ent7#973[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	stopped#36 := stopped#36[__this := false];
	_owner#78 := _owner#78[__this := __msg_sender];
	_master#113 := _master#113[__this := __msg_sender];
	call_arg#83 := 0;
	assume {:sourceloc "buggy_6.sol", 78, 14} {:message ""} true;
	call OwnershipTransferred#220(__this, __msg_sender, __msg_value, call_arg#83, _owner#78[__this]);
	call_arg#84 := 0;
	assume {:sourceloc "buggy_6.sol", 79, 14} {:message ""} true;
	call MasterRoleTransferred#264(__this, __msg_sender, __msg_value, call_arg#84, _master#113[__this]);
	$return59:
	// Function body ends here
	// Inlined constructor for Ownable ends here
}

