// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_7.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: Stopped
procedure {:inline 1} {:sourceloc "buggy_7.sol", 41, 3} {:message "[event] Ownable::Stopped"} Stopped#142(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: Started
procedure {:inline 1} {:sourceloc "buggy_7.sol", 50, 3} {:message "[event] Ownable::Started"} Started#176(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: OwnershipTransferred
procedure {:inline 1} {:sourceloc "buggy_7.sol", 61, 3} {:message "[event] Ownable::OwnershipTransferred"} OwnershipTransferred#220(__this: address_t, __msg_sender: address_t, __msg_value: int, previousOwner#216: address_t, newOwner#218: address_t)
{
	
}

// 
// Event: MasterRoleTransferred
procedure {:inline 1} {:sourceloc "buggy_7.sol", 72, 3} {:message "[event] Ownable::MasterRoleTransferred"} MasterRoleTransferred#264(__this: address_t, __msg_sender: address_t, __msg_value: int, previousMaster#260: address_t, newMaster#262: address_t)
{
	
}

// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 9, 3} {:message "balances_re_ent21"} balances_re_ent21#5: [address_t][address_t]int;
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
// Function: withdraw_balances_re_ent21 : function ()
procedure {:sourceloc "buggy_7.sol", 10, 5} {:message "Ownable::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#34(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 11, 9} {:message "success"} success#9: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#5[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#5[__this][__msg_sender])];
	assume {:sourceloc "buggy_7.sol", 11, 25} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, balances_re_ent21#5[__this][__msg_sender]);
	if (__call_ret#0) {
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#5[__this][__msg_sender])];
	}

	success#9 := __call_ret#0;
	if (success#9) {
	balances_re_ent21#5 := balances_re_ent21#5[__this := balances_re_ent21#5[__this][__msg_sender := 0]];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: stopped: bool
var {:sourceloc "buggy_7.sol", 15, 3} {:message "stopped"} stopped#36: [address_t]bool;
// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 16, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#40: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_7.sol", 17, 1} {:message "Ownable::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#69(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 20, 16} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, userBalance_re_ent12#40[__this][__msg_sender]);
	if (!(__send_ret#2)) {
	assume false;
	}

	userBalance_re_ent12#40 := userBalance_re_ent12#40[__this := userBalance_re_ent12#40[__this][__msg_sender := 0]];
	$return1:
	// Function body ends here
}

// 
// State variable: _owner: address
var {:sourceloc "buggy_7.sol", 25, 3} {:message "_owner"} _owner#71: [address_t]address_t;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 26, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#75: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_7.sol", 27, 1} {:message "Ownable::claimReward_re_ent11"} claimReward_re_ent11#111(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 30, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#88: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#75[__this][__msg_sender] > 0);
	transferValue_re_ent11#88 := redeemableEther_re_ent11#75[__this][__msg_sender];
	assume {:sourceloc "buggy_7.sol", 31, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#88);
	redeemableEther_re_ent11#75 := redeemableEther_re_ent11#75[__this := redeemableEther_re_ent11#75[__this][__msg_sender := 0]];
	$return2:
	// Function body ends here
}

// 
// State variable: _master: address
var {:sourceloc "buggy_7.sol", 34, 3} {:message "_master"} _master#113: [address_t]address_t;
// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 36, 3} {:message "balances_re_ent36"} balances_re_ent36#117: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_7.sol", 37, 5} {:message "Ownable::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#140(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#3: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 38, 12} {:message ""} true;
	call __send_ret#3 := __send(__msg_sender, __this, 0, balances_re_ent36#117[__this][__msg_sender]);
	if (__send_ret#3) {
	balances_re_ent36#117 := balances_re_ent36#117[__this := balances_re_ent36#117[__this][__msg_sender := 0]];
	}

	$return3:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_7.sol", 42, 3} {:message "counter_re_ent35"} counter_re_ent35#145: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_7.sol", 43, 1} {:message "Ownable::callme_re_ent35"} callme_re_ent35#174(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#4: int;
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#145[__this] <= 5);
	call_arg#4 := 10000000000000000000;
	assume {:sourceloc "buggy_7.sol", 45, 9} {:message ""} true;
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
var {:sourceloc "buggy_7.sol", 51, 3} {:message "userBalance_re_ent40"} userBalance_re_ent40#180: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_7.sol", 52, 1} {:message "Ownable::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#214(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 55, 10} {:message "success"} success#184: bool;
	var __call_ret#6: bool;
	var __call_ret#7: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#180[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#180[__this][__msg_sender])];
	assume {:sourceloc "buggy_7.sol", 55, 25} {:message ""} true;
	call __call_ret#6, __call_ret#7 := __call(__msg_sender, __this, userBalance_re_ent40#180[__this][__msg_sender]);
	if (__call_ret#6) {
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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
var {:sourceloc "buggy_7.sol", 62, 3} {:message "userBalance_re_ent33"} userBalance_re_ent33#224: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_7.sol", 63, 1} {:message "Ownable::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#258(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 66, 10} {:message "success"} success#228: bool;
	var __call_ret#8: bool;
	var __call_ret#9: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#224[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#224[__this][__msg_sender])];
	assume {:sourceloc "buggy_7.sol", 66, 26} {:message ""} true;
	call __call_ret#8, __call_ret#9 := __call(__msg_sender, __this, userBalance_re_ent33#224[__this][__msg_sender]);
	if (__call_ret#8) {
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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
procedure {:sourceloc "buggy_7.sol", 73, 5} {:message "Ownable::[constructor]"} __constructor#1003(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#10: address_t;
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent21#5 := balances_re_ent21#5[__this := default_address_t_int()];
	stopped#36 := stopped#36[__this := false];
	userBalance_re_ent12#40 := userBalance_re_ent12#40[__this := default_address_t_int()];
	_owner#71 := _owner#71[__this := 0];
	redeemableEther_re_ent11#75 := redeemableEther_re_ent11#75[__this := default_address_t_int()];
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
	_owner#71 := _owner#71[__this := __msg_sender];
	_master#113 := _master#113[__this := __msg_sender];
	call_arg#10 := 0;
	assume {:sourceloc "buggy_7.sol", 78, 14} {:message ""} true;
	call OwnershipTransferred#220(__this, __msg_sender, __msg_value, call_arg#10, _owner#71[__this]);
	call_arg#11 := 0;
	assume {:sourceloc "buggy_7.sol", 79, 14} {:message ""} true;
	call MasterRoleTransferred#264(__this, __msg_sender, __msg_value, call_arg#11, _master#113[__this]);
	$return7:
	// Function body ends here
}

// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_7.sol", 81, 1} {:message "counter_re_ent42"} counter_re_ent42#301: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_7.sol", 82, 1} {:message "Ownable::callme_re_ent42"} callme_re_ent42#330(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#12: int;
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#301[__this] <= 5);
	call_arg#12 := 10000000000000000000;
	assume {:sourceloc "buggy_7.sol", 84, 9} {:message ""} true;
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
procedure {:sourceloc "buggy_7.sol", 90, 5} {:message "Ownable::owner"} owner#338(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#333: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#333 := _owner#71[__this];
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_7.sol", 94, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#340: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_7.sol", 95, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#342: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_7.sol", 96, 4} {:message "Ownable::buyTicket_re_ent2"} buyTicket_re_ent2#372(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 97, 12} {:message ""} true;
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
procedure {:sourceloc "buggy_7.sol", 103, 5} {:message "Ownable::master"} master#380(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
var {:sourceloc "buggy_7.sol", 107, 1} {:message "balances_re_ent17"} balances_re_ent17#384: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_7.sol", 108, 1} {:message "Ownable::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#423(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#386: int)
{
	var {:sourceloc "buggy_7.sol", 111, 10} {:message "success"} success#399: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#384[__this][__msg_sender] >= _weiToWithdraw#386);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#386);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#386)];
	assume {:sourceloc "buggy_7.sol", 111, 25} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, _weiToWithdraw#386);
	if (__call_ret#15) {
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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
procedure {:sourceloc "buggy_7.sol", 134, 5} {:message "Ownable::isOwner"} isOwner#465(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#457: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#457 := (__msg_sender == _owner#71[__this]);
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_7.sol", 138, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#467: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_7.sol", 139, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#469: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_7.sol", 140, 4} {:message "Ownable::buyTicket_re_ent37"} buyTicket_re_ent37#499(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#17: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 141, 12} {:message ""} true;
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
procedure {:sourceloc "buggy_7.sol", 147, 5} {:message "Ownable::isMaster"} isMaster#510(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
var {:sourceloc "buggy_7.sol", 151, 1} {:message "balances_re_ent3"} balances_re_ent3#514: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_7.sol", 152, 1} {:message "Ownable::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#553(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#516: int)
{
	var {:sourceloc "buggy_7.sol", 155, 3} {:message "success"} success#529: bool;
	var __call_ret#18: bool;
	var __call_ret#19: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#514[__this][__msg_sender] >= _weiToWithdraw#516);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#516);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#516)];
	assume {:sourceloc "buggy_7.sol", 155, 19} {:message ""} true;
	call __call_ret#18, __call_ret#19 := __call(__msg_sender, __this, _weiToWithdraw#516);
	if (__call_ret#18) {
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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
procedure {:sourceloc "buggy_7.sol", 160, 5} {:message "Ownable::transferOwnership"} transferOwnership#565(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#555: address_t)
{
	var isOwner#465_ret#21: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_7.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#21 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#21;
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 162, 9} {:message ""} true;
	call _transferOwnership#807(__this, __msg_sender, __msg_value, newOwner#555);
	$return18:
	// Function body ends here
	$return17:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_7.sol", 164, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#567: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_7.sol", 165, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#569: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_7.sol", 166, 4} {:message "Ownable::buyTicket_re_ent9"} buyTicket_re_ent9#604(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 167, 7} {:message "success"} success#573: bool;
	var __call_ret#23: bool;
	var __call_ret#24: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#569[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#569[__this])];
	assume {:sourceloc "buggy_7.sol", 167, 24} {:message ""} true;
	call __call_ret#23, __call_ret#24 := __call(lastPlayer_re_ent9#567[__this], __this, jackpot_re_ent9#569[__this]);
	if (__call_ret#23) {
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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
procedure {:sourceloc "buggy_7.sol", 174, 5} {:message "Ownable::transferMasterRole"} transferMasterRole#616(__this: address_t, __msg_sender: address_t, __msg_value: int, newMaster#606: address_t)
{
	var isOwner#465_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_7.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#26 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#26;
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 176, 9} {:message ""} true;
	call _transferMasterRole#871(__this, __msg_sender, __msg_value, newMaster#606);
	$return21:
	// Function body ends here
	$return20:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 178, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#620: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_7.sol", 179, 1} {:message "Ownable::claimReward_re_ent25"} claimReward_re_ent25#656(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 182, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#633: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#620[__this][__msg_sender] > 0);
	transferValue_re_ent25#633 := redeemableEther_re_ent25#620[__this][__msg_sender];
	assume {:sourceloc "buggy_7.sol", 183, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#633);
	redeemableEther_re_ent25#620 := redeemableEther_re_ent25#620[__this := redeemableEther_re_ent25#620[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// Function: isStopped : function () view returns (bool)
procedure {:sourceloc "buggy_7.sol", 187, 5} {:message "Ownable::isStopped"} isStopped#664(__this: address_t, __msg_sender: address_t, __msg_value: int)
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
var {:sourceloc "buggy_7.sol", 191, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#668: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_7.sol", 192, 1} {:message "Ownable::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#697(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#28: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 195, 16} {:message ""} true;
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
procedure {:sourceloc "buggy_7.sol", 201, 5} {:message "Ownable::stop"} stop#706(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var isOwner#465_ret#30: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_7.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#30 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#30;
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 203, 9} {:message ""} true;
	call _stop#919(__this, __msg_sender, __msg_value);
	$return26:
	// Function body ends here
	$return25:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 205, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#710: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_7.sol", 206, 1} {:message "Ownable::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#744(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 209, 10} {:message "success"} success#714: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#710[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#710[__this][__msg_sender])];
	assume {:sourceloc "buggy_7.sol", 209, 26} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, userBalance_re_ent26#710[__this][__msg_sender]);
	if (__call_ret#32) {
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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
procedure {:sourceloc "buggy_7.sol", 216, 5} {:message "Ownable::start"} start#753(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var isOwner#465_ret#35: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume {:sourceloc "buggy_7.sol", 118, 17} {:message ""} true;
	call isOwner#465_ret#35 := isOwner#465(__this, __msg_sender, __msg_value);
	assume isOwner#465_ret#35;
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 218, 9} {:message ""} true;
	call _start#970(__this, __msg_sender, __msg_value);
	$return29:
	// Function body ends here
	$return28:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_7.sol", 220, 1} {:message "not_called_re_ent20"} not_called_re_ent20#756: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_7.sol", 221, 1} {:message "Ownable::bug_re_ent20"} bug_re_ent20#783(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#37: int;
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#756[__this];
	call_arg#37 := 1000000000000000000;
	assume {:sourceloc "buggy_7.sol", 223, 16} {:message ""} true;
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
procedure {:inline 1} {:sourceloc "buggy_7.sol", 229, 5} {:message "Ownable::_transferOwnership"} _transferOwnership#807(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#785: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (newOwner#785 != 0);
	assume {:sourceloc "buggy_7.sol", 232, 14} {:message ""} true;
	call OwnershipTransferred#220(__this, __msg_sender, __msg_value, _owner#71[__this], newOwner#785);
	_owner#71 := _owner#71[__this := newOwner#785];
	$return31:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 235, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#811: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_7.sol", 236, 1} {:message "Ownable::claimReward_re_ent32"} claimReward_re_ent32#847(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 239, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#824: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#811[__this][__msg_sender] > 0);
	transferValue_re_ent32#824 := redeemableEther_re_ent32#811[__this][__msg_sender];
	assume {:sourceloc "buggy_7.sol", 240, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#824);
	redeemableEther_re_ent32#811 := redeemableEther_re_ent32#811[__this := redeemableEther_re_ent32#811[__this][__msg_sender := 0]];
	$return32:
	// Function body ends here
}

// 
// Function: _transferMasterRole : function (address)
procedure {:inline 1} {:sourceloc "buggy_7.sol", 244, 5} {:message "Ownable::_transferMasterRole"} _transferMasterRole#871(__this: address_t, __msg_sender: address_t, __msg_value: int, newMaster#849: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (newMaster#849 != 0);
	assume {:sourceloc "buggy_7.sol", 247, 14} {:message ""} true;
	call MasterRoleTransferred#264(__this, __msg_sender, __msg_value, _master#113[__this], newMaster#849);
	_master#113 := _master#113[__this := newMaster#849];
	$return33:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 250, 1} {:message "balances_re_ent38"} balances_re_ent38#875: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_7.sol", 251, 1} {:message "Ownable::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#908(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#877: int)
{
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#875[__this][__msg_sender] >= _weiToWithdraw#877);
	assume {:sourceloc "buggy_7.sol", 254, 17} {:message ""} true;
	call __send_ret#39 := __send(__msg_sender, __this, 0, _weiToWithdraw#877);
	assume __send_ret#39;
	balances_re_ent38#875 := balances_re_ent38#875[__this := balances_re_ent38#875[__this][__msg_sender := (balances_re_ent38#875[__this][__msg_sender] - _weiToWithdraw#877)]];
	$return34:
	// Function body ends here
}

// 
// Function: _stop : function ()
procedure {:inline 1} {:sourceloc "buggy_7.sol", 258, 5} {:message "Ownable::_stop"} _stop#919(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 260, 14} {:message ""} true;
	call Stopped#142(__this, __msg_sender, __msg_value);
	stopped#36 := stopped#36[__this := true];
	$return35:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 263, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#923: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_7.sol", 264, 1} {:message "Ownable::claimReward_re_ent4"} claimReward_re_ent4#959(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 267, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#936: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#923[__this][__msg_sender] > 0);
	transferValue_re_ent4#936 := redeemableEther_re_ent4#923[__this][__msg_sender];
	assume {:sourceloc "buggy_7.sol", 268, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#936);
	redeemableEther_re_ent4#923 := redeemableEther_re_ent4#923[__this := redeemableEther_re_ent4#923[__this][__msg_sender := 0]];
	$return36:
	// Function body ends here
}

// 
// Function: _start : function ()
procedure {:inline 1} {:sourceloc "buggy_7.sol", 272, 5} {:message "Ownable::_start"} _start#970(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 274, 14} {:message ""} true;
	call Started#176(__this, __msg_sender, __msg_value);
	stopped#36 := stopped#36[__this := false];
	$return37:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_7.sol", 277, 1} {:message "counter_re_ent7"} counter_re_ent7#973: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_7.sol", 278, 1} {:message "Ownable::callme_re_ent7"} callme_re_ent7#1002(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#40: int;
	var __send_ret#41: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#973[__this] <= 5);
	call_arg#40 := 10000000000000000000;
	assume {:sourceloc "buggy_7.sol", 280, 9} {:message ""} true;
	call __send_ret#41 := __send(__msg_sender, __this, 0, call_arg#40);
	if (!(__send_ret#41)) {
	assume false;
	}

	counter_re_ent7#973 := counter_re_ent7#973[__this := (counter_re_ent7#973[__this] + 1)];
	$return38:
	// Function body ends here
}

// 
// ------- Contract: AccountWallet -------
// Inherits from: Ownable
// 
// Event: SetAddress
procedure {:inline 1} {:sourceloc "buggy_7.sol", 314, 3} {:message "[event] AccountWallet::SetAddress"} SetAddress#1114(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1108: int_arr_ptr, btcAddress#1110: int_arr_ptr, ethAddress#1112: address_t)
{
	
}

// 
// Event: UpdateAddress
procedure {:inline 1} {:sourceloc "buggy_7.sol", 322, 3} {:message "[event] AccountWallet::UpdateAddress"} UpdateAddress#1157(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1153: int_arr_ptr, to#1155: int_arr_ptr)
{
	
}

// 
// Event: DeleteAddress
procedure {:inline 1} {:sourceloc "buggy_7.sol", 332, 3} {:message "[event] AccountWallet::DeleteAddress"} DeleteAddress#1196(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1194: int_arr_ptr)
{
	
}

// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 289, 3} {:message "balances_re_ent1"} balances_re_ent1#1009: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_7.sol", 290, 5} {:message "AccountWallet::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#1038(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 291, 9} {:message "success"} success#1013: bool;
	var __call_ret#42: bool;
	var __call_ret#43: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#1009[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#1009[__this][__msg_sender])];
	assume {:sourceloc "buggy_7.sol", 291, 25} {:message ""} true;
	call __call_ret#42, __call_ret#43 := __call(__msg_sender, __this, balances_re_ent1#1009[__this][__msg_sender]);
	if (__call_ret#42) {
	havoc balances_re_ent1#1009;
	havoc btc#1042;
	havoc not_called_re_ent41#1045;
	havoc eth#1076;
	havoc not_called_re_ent27#1079;
	havoc balances_re_ent31#1118;
	havoc not_called_re_ent13#1160;
	havoc lastPlayer_re_ent23#1206;
	havoc jackpot_re_ent23#1208;
	havoc counter_re_ent14#1259;
	havoc lastPlayer_re_ent30#1332;
	havoc jackpot_re_ent30#1334;
	havoc balances_re_ent8#1436;
	havoc redeemableEther_re_ent39#1508;
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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

	if (!(__call_ret#42)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#1009[__this][__msg_sender])];
	}

	success#1013 := __call_ret#42;
	if (success#1013) {
	balances_re_ent1#1009 := balances_re_ent1#1009[__this := balances_re_ent1#1009[__this][__msg_sender := 0]];
	}

	$return39:
	// Function body ends here
}

// 
// State variable: btc: mapping(string memory => string storage ref)
var {:sourceloc "buggy_7.sol", 295, 3} {:message "btc"} btc#1042: [address_t][int_arr_type]int_arr_type;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_7.sol", 296, 3} {:message "not_called_re_ent41"} not_called_re_ent41#1045: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_7.sol", 297, 1} {:message "AccountWallet::bug_re_ent41"} bug_re_ent41#1072(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#44: int;
	var __send_ret#45: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#1045[__this];
	call_arg#44 := 1000000000000000000;
	assume {:sourceloc "buggy_7.sol", 299, 16} {:message ""} true;
	call __send_ret#45 := __send(__msg_sender, __this, 0, call_arg#44);
	if (!(__send_ret#45)) {
	assume false;
	}

	not_called_re_ent41#1045 := not_called_re_ent41#1045[__this := false];
	$return40:
	// Function body ends here
}

// 
// State variable: eth: mapping(string memory => address)
var {:sourceloc "buggy_7.sol", 304, 3} {:message "eth"} eth#1076: [address_t][int_arr_type]address_t;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_7.sol", 306, 3} {:message "not_called_re_ent27"} not_called_re_ent27#1079: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_7.sol", 307, 1} {:message "AccountWallet::bug_re_ent27"} bug_re_ent27#1106(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#46: int;
	var __send_ret#47: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1079[__this];
	call_arg#46 := 1000000000000000000;
	assume {:sourceloc "buggy_7.sol", 309, 16} {:message ""} true;
	call __send_ret#47 := __send(__msg_sender, __this, 0, call_arg#46);
	if (!(__send_ret#47)) {
	assume false;
	}

	not_called_re_ent27#1079 := not_called_re_ent27#1079[__this := false];
	$return41:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 315, 3} {:message "balances_re_ent31"} balances_re_ent31#1118: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_7.sol", 316, 1} {:message "AccountWallet::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1151(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1120: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1118[__this][__msg_sender] >= _weiToWithdraw#1120);
	assume {:sourceloc "buggy_7.sol", 319, 17} {:message ""} true;
	call __send_ret#48 := __send(__msg_sender, __this, 0, _weiToWithdraw#1120);
	assume __send_ret#48;
	balances_re_ent31#1118 := balances_re_ent31#1118[__this := balances_re_ent31#1118[__this][__msg_sender := (balances_re_ent31#1118[__this][__msg_sender] - _weiToWithdraw#1120)]];
	$return42:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_7.sol", 323, 3} {:message "not_called_re_ent13"} not_called_re_ent13#1160: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_7.sol", 324, 1} {:message "AccountWallet::bug_re_ent13"} bug_re_ent13#1192(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 326, 10} {:message "success"} success#1168: bool;
	var __call_ret#49: bool;
	var __call_ret#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1160[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_7.sol", 326, 25} {:message ""} true;
	call __call_ret#49, __call_ret#50 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#49) {
	havoc balances_re_ent1#1009;
	havoc btc#1042;
	havoc not_called_re_ent41#1045;
	havoc eth#1076;
	havoc not_called_re_ent27#1079;
	havoc balances_re_ent31#1118;
	havoc not_called_re_ent13#1160;
	havoc lastPlayer_re_ent23#1206;
	havoc jackpot_re_ent23#1208;
	havoc counter_re_ent14#1259;
	havoc lastPlayer_re_ent30#1332;
	havoc jackpot_re_ent30#1334;
	havoc balances_re_ent8#1436;
	havoc redeemableEther_re_ent39#1508;
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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

	if (!(__call_ret#49)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1168 := __call_ret#49;
	if (!(success#1168)) {
	assume false;
	}

	not_called_re_ent13#1160 := not_called_re_ent13#1160[__this := false];
	$return43:
	// Function body ends here
}

// 
// Function: version
procedure {:sourceloc "buggy_7.sol", 334, 5} {:message "AccountWallet::version"} version#1204(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1199: int_arr_ptr)
{
	var new_array#51: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#51 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1199 := new_array#51;
	mem_arr_int := mem_arr_int[#1199 := int_arr#constr(default_int_int()[0 := 49][1 := 46][2 := 48][3 := 46][4 := 48], 5)];
	goto $return44;
	$return44:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_7.sol", 338, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1206: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_7.sol", 339, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1208: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_7.sol", 340, 4} {:message "AccountWallet::buyTicket_re_ent23"} buyTicket_re_ent23#1238(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 341, 12} {:message ""} true;
	call __send_ret#52 := __send(lastPlayer_re_ent23#1206[__this], __this, 0, jackpot_re_ent23#1208[__this]);
	if (!(__send_ret#52)) {
	assume false;
	}

	lastPlayer_re_ent23#1206 := lastPlayer_re_ent23#1206[__this := __msg_sender];
	jackpot_re_ent23#1208 := jackpot_re_ent23#1208[__this := __balance[__this]];
	$return45:
	// Function body ends here
}

var int_arr_default_context: [int]int_arr_type;
// 
// Function: getAddress
procedure {:sourceloc "buggy_7.sol", 347, 5} {:message "AccountWallet::getAddress"} {:skipped} getAddress#1256(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1240: int_arr_ptr)
	returns (#1243: int_arr_ptr, #1245: address_t);
	modifies balances_re_ent1#1009, btc#1042, not_called_re_ent41#1045, eth#1076, not_called_re_ent27#1079, balances_re_ent31#1118, not_called_re_ent13#1160, lastPlayer_re_ent23#1206, jackpot_re_ent23#1208, counter_re_ent14#1259, lastPlayer_re_ent30#1332, jackpot_re_ent30#1334, balances_re_ent8#1436, redeemableEther_re_ent39#1508, balances_re_ent21#5, stopped#36, userBalance_re_ent12#40, _owner#71, redeemableEther_re_ent11#75, _master#113, balances_re_ent36#117, counter_re_ent35#145, userBalance_re_ent40#180, userBalance_re_ent33#224, counter_re_ent42#301, lastPlayer_re_ent2#340, jackpot_re_ent2#342, balances_re_ent17#384, lastPlayer_re_ent37#467, jackpot_re_ent37#469, balances_re_ent3#514, lastPlayer_re_ent9#567, jackpot_re_ent9#569, redeemableEther_re_ent25#620, userBalance_re_ent19#668, userBalance_re_ent26#710, not_called_re_ent20#756, redeemableEther_re_ent32#811, balances_re_ent38#875, redeemableEther_re_ent4#923, counter_re_ent7#973;

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_7.sol", 351, 1} {:message "counter_re_ent14"} counter_re_ent14#1259: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_7.sol", 352, 1} {:message "AccountWallet::callme_re_ent14"} callme_re_ent14#1288(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#56: int;
	var __send_ret#57: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1259[__this] <= 5);
	call_arg#56 := 10000000000000000000;
	assume {:sourceloc "buggy_7.sol", 354, 9} {:message ""} true;
	call __send_ret#57 := __send(__msg_sender, __this, 0, call_arg#56);
	if (!(__send_ret#57)) {
	assume false;
	}

	counter_re_ent14#1259 := counter_re_ent14#1259[__this := (counter_re_ent14#1259[__this] + 1)];
	$return47:
	// Function body ends here
}

// 
// Function: setAddress
procedure {:sourceloc "buggy_7.sol", 360, 5} {:message "AccountWallet::setAddress"} setAddress#1330(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1290: int_arr_ptr, btcAddress#1292: int_arr_ptr, ethAddress#1294: address_t)
{
	var isOwner#465_ret#59: bool;
	var isMaster#510_ret#60: bool;
	var isStopped#664_ret#62: bool;
	var call_arg#64: int_arr_ptr;
	var new_array#65: int_arr_ptr;
	var call_arg#66: int_arr_ptr;
	var new_array#67: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyMaster starts here
	assume {:sourceloc "buggy_7.sol", 124, 31} {:message ""} true;
	call isOwner#465_ret#59 := isOwner#465(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_7.sol", 124, 17} {:message ""} true;
	call isMaster#510_ret#60 := isMaster#510(__this, __msg_sender, __msg_value);
	assume (isMaster#510_ret#60 || isOwner#465_ret#59);
	// Inlined modifier onlyWhenNotStopped starts here
	assume {:sourceloc "buggy_7.sol", 130, 18} {:message ""} true;
	call isStopped#664_ret#62 := isStopped#664(__this, __msg_sender, __msg_value);
	assume !(isStopped#664_ret#62);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(mem_arr_int[account#1290])) && (length#int_arr#constr(mem_arr_int[account#1290]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[account#1290]) > 0);
	btc#1042 := btc#1042[__this := btc#1042[__this][account#1290 := mem_arr_int[btcAddress#1292]]];
	eth#1076 := eth#1076[__this := eth#1076[__this][account#1290 := ethAddress#1294]];
	new_array#65 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#64 := new_array#65;
	mem_arr_int := mem_arr_int[call_arg#64 := mem_arr_int[account#1290]];
	new_array#67 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#66 := new_array#67;
	mem_arr_int := mem_arr_int[call_arg#66 := mem_arr_int[btcAddress#1292]];
	assume {:sourceloc "buggy_7.sol", 367, 14} {:message ""} true;
	call SetAddress#1114(__this, __msg_sender, __msg_value, call_arg#64, call_arg#66, ethAddress#1294);
	$return50:
	// Function body ends here
	$return49:
	// Inlined modifier onlyWhenNotStopped ends here
	$return48:
	// Inlined modifier onlyMaster ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_7.sol", 369, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1332: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_7.sol", 370, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1334: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_7.sol", 371, 4} {:message "AccountWallet::buyTicket_re_ent30"} buyTicket_re_ent30#1364(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#68: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_7.sol", 372, 12} {:message ""} true;
	call __send_ret#68 := __send(lastPlayer_re_ent30#1332[__this], __this, 0, jackpot_re_ent30#1334[__this]);
	if (!(__send_ret#68)) {
	assume false;
	}

	lastPlayer_re_ent30#1332 := lastPlayer_re_ent30#1332[__this := __msg_sender];
	jackpot_re_ent30#1334 := jackpot_re_ent30#1334[__this := __balance[__this]];
	$return51:
	// Function body ends here
}

// 
// Function: updateAccount
procedure {:sourceloc "buggy_7.sol", 378, 5} {:message "AccountWallet::updateAccount"} updateAccount#1432(__this: address_t, __msg_sender: address_t, __msg_value: int, from#1366: int_arr_ptr, to#1368: int_arr_ptr)
{
	var isOwner#465_ret#70: bool;
	var isMaster#510_ret#71: bool;
	var isStopped#664_ret#73: bool;
	var call_arg#75: int_arr_ptr;
	var new_array#76: int_arr_ptr;
	var call_arg#77: int_arr_ptr;
	var new_array#78: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyMaster starts here
	assume {:sourceloc "buggy_7.sol", 124, 31} {:message ""} true;
	call isOwner#465_ret#70 := isOwner#465(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_7.sol", 124, 17} {:message ""} true;
	call isMaster#510_ret#71 := isMaster#510(__this, __msg_sender, __msg_value);
	assume (isMaster#510_ret#71 || isOwner#465_ret#70);
	// Inlined modifier onlyWhenNotStopped starts here
	assume {:sourceloc "buggy_7.sol", 130, 18} {:message ""} true;
	call isStopped#664_ret#73 := isStopped#664(__this, __msg_sender, __msg_value);
	assume !(isStopped#664_ret#73);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(mem_arr_int[from#1366])) && (length#int_arr#constr(mem_arr_int[from#1366]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[from#1366]) > 0);
	assume ((0 <= length#int_arr#constr(mem_arr_int[to#1368])) && (length#int_arr#constr(mem_arr_int[to#1368]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[to#1368]) > 0);
	btc#1042 := btc#1042[__this := btc#1042[__this][to#1368 := btc#1042[__this][from#1366]]];
	eth#1076 := eth#1076[__this := eth#1076[__this][to#1368 := eth#1076[__this][from#1366]]];
	btc#1042 := btc#1042[__this := btc#1042[__this][from#1366 := int_arr#constr(default_int_int(), 0)]];
	eth#1076 := eth#1076[__this := eth#1076[__this][from#1366 := 0]];
	new_array#76 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#75 := new_array#76;
	mem_arr_int := mem_arr_int[call_arg#75 := mem_arr_int[from#1366]];
	new_array#78 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#77 := new_array#78;
	mem_arr_int := mem_arr_int[call_arg#77 := mem_arr_int[to#1368]];
	assume {:sourceloc "buggy_7.sol", 389, 14} {:message ""} true;
	call UpdateAddress#1157(__this, __msg_sender, __msg_value, call_arg#75, call_arg#77);
	$return54:
	// Function body ends here
	$return53:
	// Inlined modifier onlyWhenNotStopped ends here
	$return52:
	// Inlined modifier onlyMaster ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 391, 1} {:message "balances_re_ent8"} balances_re_ent8#1436: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_7.sol", 392, 5} {:message "AccountWallet::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1465(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 393, 9} {:message "success"} success#1440: bool;
	var __call_ret#79: bool;
	var __call_ret#80: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1436[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1436[__this][__msg_sender])];
	assume {:sourceloc "buggy_7.sol", 393, 26} {:message ""} true;
	call __call_ret#79, __call_ret#80 := __call(__msg_sender, __this, balances_re_ent8#1436[__this][__msg_sender]);
	if (__call_ret#79) {
	havoc balances_re_ent1#1009;
	havoc btc#1042;
	havoc not_called_re_ent41#1045;
	havoc eth#1076;
	havoc not_called_re_ent27#1079;
	havoc balances_re_ent31#1118;
	havoc not_called_re_ent13#1160;
	havoc lastPlayer_re_ent23#1206;
	havoc jackpot_re_ent23#1208;
	havoc counter_re_ent14#1259;
	havoc lastPlayer_re_ent30#1332;
	havoc jackpot_re_ent30#1334;
	havoc balances_re_ent8#1436;
	havoc redeemableEther_re_ent39#1508;
	havoc balances_re_ent21#5;
	havoc stopped#36;
	havoc userBalance_re_ent12#40;
	havoc _owner#71;
	havoc redeemableEther_re_ent11#75;
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

	if (!(__call_ret#79)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1436[__this][__msg_sender])];
	}

	success#1440 := __call_ret#79;
	if (success#1440) {
	balances_re_ent8#1436 := balances_re_ent8#1436[__this := balances_re_ent8#1436[__this][__msg_sender := 0]];
	}

	$return55:
	// Function body ends here
}

// 
// Function: deleteAccount
procedure {:sourceloc "buggy_7.sol", 398, 5} {:message "AccountWallet::deleteAccount"} deleteAccount#1504(__this: address_t, __msg_sender: address_t, __msg_value: int, account#1467: int_arr_ptr)
{
	var isOwner#465_ret#82: bool;
	var isMaster#510_ret#83: bool;
	var isStopped#664_ret#85: bool;
	var call_arg#87: int_arr_ptr;
	var new_array#88: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyMaster starts here
	assume {:sourceloc "buggy_7.sol", 124, 31} {:message ""} true;
	call isOwner#465_ret#82 := isOwner#465(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_7.sol", 124, 17} {:message ""} true;
	call isMaster#510_ret#83 := isMaster#510(__this, __msg_sender, __msg_value);
	assume (isMaster#510_ret#83 || isOwner#465_ret#82);
	// Inlined modifier onlyWhenNotStopped starts here
	assume {:sourceloc "buggy_7.sol", 130, 18} {:message ""} true;
	call isStopped#664_ret#85 := isStopped#664(__this, __msg_sender, __msg_value);
	assume !(isStopped#664_ret#85);
	// Function body starts here
	assume ((0 <= length#int_arr#constr(mem_arr_int[account#1467])) && (length#int_arr#constr(mem_arr_int[account#1467]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	assume (length#int_arr#constr(mem_arr_int[account#1467]) > 0);
	btc#1042 := btc#1042[__this := btc#1042[__this][account#1467 := int_arr#constr(default_int_int(), 0)]];
	eth#1076 := eth#1076[__this := eth#1076[__this][account#1467 := 0]];
	new_array#88 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#87 := new_array#88;
	mem_arr_int := mem_arr_int[call_arg#87 := mem_arr_int[account#1467]];
	assume {:sourceloc "buggy_7.sol", 405, 14} {:message ""} true;
	call DeleteAddress#1196(__this, __msg_sender, __msg_value, call_arg#87);
	$return58:
	// Function body ends here
	$return57:
	// Inlined modifier onlyWhenNotStopped ends here
	$return56:
	// Inlined modifier onlyMaster ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_7.sol", 407, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1508: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_7.sol", 408, 1} {:message "AccountWallet::claimReward_re_ent39"} claimReward_re_ent39#1544(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_7.sol", 411, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1521: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1508[__this][__msg_sender] > 0);
	transferValue_re_ent39#1521 := redeemableEther_re_ent39#1508[__this][__msg_sender];
	assume {:sourceloc "buggy_7.sol", 412, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1521);
	redeemableEther_re_ent39#1508 := redeemableEther_re_ent39#1508[__this := redeemableEther_re_ent39#1508[__this][__msg_sender := 0]];
	$return59:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array |T@int_arr_type| |T@int_arr_type|)) (|int_arr#constr| ((as const (Array Int Int)) 0) 0))"} default_int_arr_type_int_arr_type() returns ([int_arr_type]int_arr_type);
function {:builtin "((as const (Array |T@int_arr_type| Int)) 0)"} default_int_arr_type_address_t() returns ([int_arr_type]address_t);
procedure {:sourceloc "buggy_7.sol", 287, 1} {:message "AccountWallet::[implicit_constructor]"} __constructor#1545(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#90: address_t;
	var call_arg#91: address_t;
	assume (__balance[__this] >= 0);
	balances_re_ent1#1009 := balances_re_ent1#1009[__this := default_address_t_int()];
	btc#1042 := btc#1042[__this := default_int_arr_type_int_arr_type()];
	not_called_re_ent41#1045 := not_called_re_ent41#1045[__this := true];
	eth#1076 := eth#1076[__this := default_int_arr_type_address_t()];
	not_called_re_ent27#1079 := not_called_re_ent27#1079[__this := true];
	balances_re_ent31#1118 := balances_re_ent31#1118[__this := default_address_t_int()];
	not_called_re_ent13#1160 := not_called_re_ent13#1160[__this := true];
	lastPlayer_re_ent23#1206 := lastPlayer_re_ent23#1206[__this := 0];
	jackpot_re_ent23#1208 := jackpot_re_ent23#1208[__this := 0];
	counter_re_ent14#1259 := counter_re_ent14#1259[__this := 0];
	lastPlayer_re_ent30#1332 := lastPlayer_re_ent30#1332[__this := 0];
	jackpot_re_ent30#1334 := jackpot_re_ent30#1334[__this := 0];
	balances_re_ent8#1436 := balances_re_ent8#1436[__this := default_address_t_int()];
	redeemableEther_re_ent39#1508 := redeemableEther_re_ent39#1508[__this := default_address_t_int()];
	balances_re_ent21#5 := balances_re_ent21#5[__this := default_address_t_int()];
	stopped#36 := stopped#36[__this := false];
	userBalance_re_ent12#40 := userBalance_re_ent12#40[__this := default_address_t_int()];
	_owner#71 := _owner#71[__this := 0];
	redeemableEther_re_ent11#75 := redeemableEther_re_ent11#75[__this := default_address_t_int()];
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
	_owner#71 := _owner#71[__this := __msg_sender];
	_master#113 := _master#113[__this := __msg_sender];
	call_arg#90 := 0;
	assume {:sourceloc "buggy_7.sol", 78, 14} {:message ""} true;
	call OwnershipTransferred#220(__this, __msg_sender, __msg_value, call_arg#90, _owner#71[__this]);
	call_arg#91 := 0;
	assume {:sourceloc "buggy_7.sol", 79, 14} {:message ""} true;
	call MasterRoleTransferred#264(__this, __msg_sender, __msg_value, call_arg#91, _master#113[__this]);
	$return60:
	// Function body ends here
	// Inlined constructor for Ownable ends here
}

