// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_15.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_15.sol", 8, 5} {:message "tokenRecipient::receiveApproval"} receiveApproval#12(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#3: address_t, _value#5: int, _token#7: address_t, _extraData#9: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_15.sol", 7, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#13(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: MD -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_15.sol", 79, 3} {:message "[event] MD::Transfer"} Transfer#283(__this: address_t, __msg_sender: address_t, __msg_value: int, from#277: address_t, to#279: address_t, value#281: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_15.sol", 89, 3} {:message "[event] MD::Approval"} Approval#328(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#322: address_t, _spender#324: address_t, _value#326: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_15.sol", 101, 3} {:message "[event] MD::Burn"} Burn#369(__this: address_t, __msg_sender: address_t, __msg_value: int, from#365: address_t, value#367: int)
{
	
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_15.sol", 13, 3} {:message "not_called_re_ent20"} not_called_re_ent20#16: [address_t]bool;
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
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_15.sol", 14, 1} {:message "MD::bug_re_ent20"} bug_re_ent20#43(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#0: int;
	var __send_ret#1: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#16[__this];
	call_arg#0 := 1000000000000000000;
	assume {:sourceloc "buggy_15.sol", 16, 12} {:message ""} true;
	call __send_ret#1 := __send(__msg_sender, __this, 0, call_arg#0);
	if (!(__send_ret#1)) {
	assume false;
	}

	not_called_re_ent20#16 := not_called_re_ent20#16[__this := false];
	$return0:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_15.sol", 21, 3} {:message "name"} name#45: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 22, 3} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#49: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_15.sol", 23, 1} {:message "MD::claimReward_re_ent32"} claimReward_re_ent32#85(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 26, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#62: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#49[__this][__msg_sender] > 0);
	transferValue_re_ent32#62 := redeemableEther_re_ent32#49[__this][__msg_sender];
	assume {:sourceloc "buggy_15.sol", 27, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#62);
	redeemableEther_re_ent32#49 := redeemableEther_re_ent32#49[__this := redeemableEther_re_ent32#49[__this][__msg_sender := 0]];
	$return1:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_15.sol", 30, 3} {:message "symbol"} symbol#87: [address_t]int_arr_type;
// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 31, 3} {:message "balances_re_ent38"} balances_re_ent38#91: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_15.sol", 32, 1} {:message "MD::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#124(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#93: int)
{
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#91[__this][__msg_sender] >= _weiToWithdraw#93);
	assume {:sourceloc "buggy_15.sol", 35, 11} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, _weiToWithdraw#93);
	assume __send_ret#2;
	balances_re_ent38#91 := balances_re_ent38#91[__this := balances_re_ent38#91[__this][__msg_sender := (balances_re_ent38#91[__this][__msg_sender] - _weiToWithdraw#93)]];
	$return2:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_15.sol", 38, 3} {:message "decimals"} decimals#127: [address_t]int;
// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 40, 3} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#131: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_15.sol", 41, 1} {:message "MD::claimReward_re_ent4"} claimReward_re_ent4#167(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 44, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#144: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#131[__this][__msg_sender] > 0);
	transferValue_re_ent4#144 := redeemableEther_re_ent4#131[__this][__msg_sender];
	assume {:sourceloc "buggy_15.sol", 45, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#144);
	redeemableEther_re_ent4#131 := redeemableEther_re_ent4#131[__this := redeemableEther_re_ent4#131[__this][__msg_sender := 0]];
	$return3:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_15.sol", 48, 3} {:message "totalSupply"} totalSupply#169: [address_t]int;
// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_15.sol", 51, 3} {:message "counter_re_ent7"} counter_re_ent7#172: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_15.sol", 52, 1} {:message "MD::callme_re_ent7"} callme_re_ent7#201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#3: int;
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#172[__this] <= 5);
	call_arg#3 := 10000000000000000000;
	assume {:sourceloc "buggy_15.sol", 54, 9} {:message ""} true;
	call __send_ret#4 := __send(__msg_sender, __this, 0, call_arg#3);
	if (!(__send_ret#4)) {
	assume false;
	}

	counter_re_ent7#172 := counter_re_ent7#172[__this := (counter_re_ent7#172[__this] + 1)];
	$return4:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 59, 3} {:message "balanceOf"} balanceOf#205: [address_t][address_t]int;
// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_15.sol", 60, 3} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#207: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_15.sol", 61, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#209: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_15.sol", 62, 4} {:message "MD::buyTicket_re_ent23"} buyTicket_re_ent23#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_15.sol", 63, 12} {:message ""} true;
	call __send_ret#5 := __send(lastPlayer_re_ent23#207[__this], __this, 0, jackpot_re_ent23#209[__this]);
	if (!(__send_ret#5)) {
	assume false;
	}

	lastPlayer_re_ent23#207 := lastPlayer_re_ent23#207[__this := __msg_sender];
	jackpot_re_ent23#209 := jackpot_re_ent23#209[__this := __balance[__this]];
	$return5:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_15.sol", 68, 3} {:message "allowance"} allowance#245: [address_t][address_t][address_t]int;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_15.sol", 71, 3} {:message "not_called_re_ent27"} not_called_re_ent27#248: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_15.sol", 72, 1} {:message "MD::bug_re_ent27"} bug_re_ent27#275(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#6: int;
	var __send_ret#7: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#248[__this];
	call_arg#6 := 1000000000000000000;
	assume {:sourceloc "buggy_15.sol", 74, 12} {:message ""} true;
	call __send_ret#7 := __send(__msg_sender, __this, 0, call_arg#6);
	if (!(__send_ret#7)) {
	assume false;
	}

	not_called_re_ent27#248 := not_called_re_ent27#248[__this := false];
	$return6:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 82, 3} {:message "balances_re_ent31"} balances_re_ent31#287: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_15.sol", 83, 1} {:message "MD::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#320(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#289: int)
{
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#287[__this][__msg_sender] >= _weiToWithdraw#289);
	assume {:sourceloc "buggy_15.sol", 86, 11} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, _weiToWithdraw#289);
	assume __send_ret#8;
	balances_re_ent31#287 := balances_re_ent31#287[__this := balances_re_ent31#287[__this][__msg_sender := (balances_re_ent31#287[__this][__msg_sender] - _weiToWithdraw#289)]];
	$return7:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_15.sol", 92, 3} {:message "not_called_re_ent13"} not_called_re_ent13#331: [address_t]bool;
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
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_15.sol", 93, 1} {:message "MD::bug_re_ent13"} bug_re_ent13#363(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 95, 3} {:message "success"} success#339: bool;
	var __call_ret#9: bool;
	var __call_ret#10: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#331[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_15.sol", 95, 18} {:message ""} true;
	call __call_ret#9, __call_ret#10 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#9) {
	havoc not_called_re_ent20#16;
	havoc name#45;
	havoc redeemableEther_re_ent32#49;
	havoc symbol#87;
	havoc balances_re_ent38#91;
	havoc decimals#127;
	havoc redeemableEther_re_ent4#131;
	havoc totalSupply#169;
	havoc counter_re_ent7#172;
	havoc balanceOf#205;
	havoc lastPlayer_re_ent23#207;
	havoc jackpot_re_ent23#209;
	havoc allowance#245;
	havoc not_called_re_ent27#248;
	havoc balances_re_ent31#287;
	havoc not_called_re_ent13#331;
	havoc counter_re_ent14#404;
	havoc lastPlayer_re_ent30#515;
	havoc jackpot_re_ent30#517;
	havoc balances_re_ent8#571;
	havoc redeemableEther_re_ent39#645;
	havoc balances_re_ent36#714;
	havoc counter_re_ent35#780;
	havoc userBalance_re_ent40#850;
	havoc userBalance_re_ent33#944;
	havoc __balance;
	}

	if (!(__call_ret#9)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#339 := __call_ret#9;
	if (!(success#339)) {
	assume false;
	}

	not_called_re_ent13#331 := not_called_re_ent13#331[__this := false];
	$return8:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_15.sol", 108, 5} {:message "MD::[constructor]"} __constructor#979(__this: address_t, __msg_sender: address_t, __msg_value: int, initialSupply#372: int, tokenName#374: int_arr_ptr, tokenSymbol#376: int_arr_ptr)
{
	// TCC assumptions
	assume (tokenName#374 < __alloc_counter);
	assume (tokenSymbol#376 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent20#16 := not_called_re_ent20#16[__this := true];
	name#45 := name#45[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent32#49 := redeemableEther_re_ent32#49[__this := default_address_t_int()];
	symbol#87 := symbol#87[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent38#91 := balances_re_ent38#91[__this := default_address_t_int()];
	decimals#127 := decimals#127[__this := 18];
	redeemableEther_re_ent4#131 := redeemableEther_re_ent4#131[__this := default_address_t_int()];
	totalSupply#169 := totalSupply#169[__this := 0];
	counter_re_ent7#172 := counter_re_ent7#172[__this := 0];
	balanceOf#205 := balanceOf#205[__this := default_address_t_int()];
	lastPlayer_re_ent23#207 := lastPlayer_re_ent23#207[__this := 0];
	jackpot_re_ent23#209 := jackpot_re_ent23#209[__this := 0];
	allowance#245 := allowance#245[__this := default_address_t__k_address_t_v_int()];
	not_called_re_ent27#248 := not_called_re_ent27#248[__this := true];
	balances_re_ent31#287 := balances_re_ent31#287[__this := default_address_t_int()];
	not_called_re_ent13#331 := not_called_re_ent13#331[__this := true];
	counter_re_ent14#404 := counter_re_ent14#404[__this := 0];
	lastPlayer_re_ent30#515 := lastPlayer_re_ent30#515[__this := 0];
	jackpot_re_ent30#517 := jackpot_re_ent30#517[__this := 0];
	balances_re_ent8#571 := balances_re_ent8#571[__this := default_address_t_int()];
	redeemableEther_re_ent39#645 := redeemableEther_re_ent39#645[__this := default_address_t_int()];
	balances_re_ent36#714 := balances_re_ent36#714[__this := default_address_t_int()];
	counter_re_ent35#780 := counter_re_ent35#780[__this := 0];
	userBalance_re_ent40#850 := userBalance_re_ent40#850[__this := default_address_t_int()];
	userBalance_re_ent33#944 := userBalance_re_ent33#944[__this := default_address_t_int()];
	// Function body starts here
	totalSupply#169 := totalSupply#169[__this := (initialSupply#372 * 1000000000000000000)];
	balanceOf#205 := balanceOf#205[__this := balanceOf#205[__this][__msg_sender := totalSupply#169[__this]]];
	name#45 := name#45[__this := mem_arr_int[tokenName#374]];
	symbol#87 := symbol#87[__this := mem_arr_int[tokenSymbol#376]];
	$return9:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_15.sol", 118, 1} {:message "counter_re_ent14"} counter_re_ent14#404: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_15.sol", 119, 1} {:message "MD::callme_re_ent14"} callme_re_ent14#433(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#11: int;
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#404[__this] <= 5);
	call_arg#11 := 10000000000000000000;
	assume {:sourceloc "buggy_15.sol", 121, 9} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, call_arg#11);
	if (!(__send_ret#12)) {
	assume false;
	}

	counter_re_ent14#404 := counter_re_ent14#404[__this := (counter_re_ent14#404[__this] + 1)];
	$return10:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_15.sol", 130, 5} {:message "MD::_transfer"} _transfer#513(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#436: address_t, _to#438: address_t, _value#440: int)
{
	var {:sourceloc "buggy_15.sol", 138, 9} {:message "previousBalances"} previousBalances#473: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#438 != 0);
	assume (balanceOf#205[__this][_from#436] >= _value#440);
	assume ((balanceOf#205[__this][_to#438] + _value#440) >= balanceOf#205[__this][_to#438]);
	previousBalances#473 := (balanceOf#205[__this][_from#436] + balanceOf#205[__this][_to#438]);
	balanceOf#205 := balanceOf#205[__this := balanceOf#205[__this][_from#436 := (balanceOf#205[__this][_from#436] - _value#440)]];
	balanceOf#205 := balanceOf#205[__this := balanceOf#205[__this][_to#438 := (balanceOf#205[__this][_to#438] + _value#440)]];
	assume {:sourceloc "buggy_15.sol", 143, 14} {:message ""} true;
	call Transfer#283(__this, __msg_sender, __msg_value, _from#436, _to#438, _value#440);
	assert {:sourceloc "buggy_15.sol", 145, 9} {:message "Assertion might not hold."} ((balanceOf#205[__this][_from#436] + balanceOf#205[__this][_to#438]) == previousBalances#473);
	$return11:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_15.sol", 147, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#515: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_15.sol", 148, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#517: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_15.sol", 149, 4} {:message "MD::buyTicket_re_ent30"} buyTicket_re_ent30#547(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#13: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_15.sol", 150, 12} {:message ""} true;
	call __send_ret#13 := __send(lastPlayer_re_ent30#515[__this], __this, 0, jackpot_re_ent30#517[__this]);
	if (!(__send_ret#13)) {
	assume false;
	}

	lastPlayer_re_ent30#515 := lastPlayer_re_ent30#515[__this := __msg_sender];
	jackpot_re_ent30#517 := jackpot_re_ent30#517[__this := __balance[__this]];
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 164, 5} {:message "MD::transfer"} transfer#567(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#550: address_t, _value#552: int)
	returns (success#555: bool)
{
	var call_arg#14: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#14 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 165, 9} {:message ""} true;
	call _transfer#513(__this, __msg_sender, __msg_value, call_arg#14, _to#550, _value#552);
	success#555 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 168, 1} {:message "balances_re_ent8"} balances_re_ent8#571: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_15.sol", 169, 5} {:message "MD::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#600(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 170, 6} {:message "success"} success#575: bool;
	var __call_ret#15: bool;
	var __call_ret#16: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#571[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#571[__this][__msg_sender])];
	assume {:sourceloc "buggy_15.sol", 170, 23} {:message ""} true;
	call __call_ret#15, __call_ret#16 := __call(__msg_sender, __this, balances_re_ent8#571[__this][__msg_sender]);
	if (__call_ret#15) {
	havoc not_called_re_ent20#16;
	havoc name#45;
	havoc redeemableEther_re_ent32#49;
	havoc symbol#87;
	havoc balances_re_ent38#91;
	havoc decimals#127;
	havoc redeemableEther_re_ent4#131;
	havoc totalSupply#169;
	havoc counter_re_ent7#172;
	havoc balanceOf#205;
	havoc lastPlayer_re_ent23#207;
	havoc jackpot_re_ent23#209;
	havoc allowance#245;
	havoc not_called_re_ent27#248;
	havoc balances_re_ent31#287;
	havoc not_called_re_ent13#331;
	havoc counter_re_ent14#404;
	havoc lastPlayer_re_ent30#515;
	havoc jackpot_re_ent30#517;
	havoc balances_re_ent8#571;
	havoc redeemableEther_re_ent39#645;
	havoc balances_re_ent36#714;
	havoc counter_re_ent35#780;
	havoc userBalance_re_ent40#850;
	havoc userBalance_re_ent33#944;
	havoc __balance;
	}

	if (!(__call_ret#15)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#571[__this][__msg_sender])];
	}

	success#575 := __call_ret#15;
	if (success#575) {
	balances_re_ent8#571 := balances_re_ent8#571[__this := balances_re_ent8#571[__this][__msg_sender := 0]];
	}

	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 184, 5} {:message "MD::transferFrom"} transferFrom#641(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#603: address_t, _to#605: address_t, _value#607: int)
	returns (success#610: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_value#607 <= allowance#245[__this][_from#603][__msg_sender]);
	allowance#245 := allowance#245[__this := allowance#245[__this][_from#603 := allowance#245[__this][_from#603][__msg_sender := (allowance#245[__this][_from#603][__msg_sender] - _value#607)]]];
	assume {:sourceloc "buggy_15.sol", 187, 9} {:message ""} true;
	call _transfer#513(__this, __msg_sender, __msg_value, _from#603, _to#605, _value#607);
	success#610 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 190, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#645: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_15.sol", 191, 1} {:message "MD::claimReward_re_ent39"} claimReward_re_ent39#681(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 194, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#658: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#645[__this][__msg_sender] > 0);
	transferValue_re_ent39#658 := redeemableEther_re_ent39#645[__this][__msg_sender];
	assume {:sourceloc "buggy_15.sol", 195, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#658);
	redeemableEther_re_ent39#645 := redeemableEther_re_ent39#645[__this := redeemableEther_re_ent39#645[__this][__msg_sender := 0]];
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 207, 5} {:message "MD::approve"} approve#710(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#684: address_t, _value#686: int)
	returns (success#689: bool)
{
	var call_arg#17: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#245 := allowance#245[__this := allowance#245[__this][__msg_sender := allowance#245[__this][__msg_sender][_spender#684 := _value#686]]];
	call_arg#17 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 210, 14} {:message ""} true;
	call Approval#328(__this, __msg_sender, __msg_value, call_arg#17, _spender#684, _value#686);
	success#689 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 213, 1} {:message "balances_re_ent36"} balances_re_ent36#714: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_15.sol", 214, 5} {:message "MD::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#737(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_15.sol", 215, 9} {:message ""} true;
	call __send_ret#18 := __send(__msg_sender, __this, 0, balances_re_ent36#714[__this][__msg_sender]);
	if (__send_ret#18) {
	balances_re_ent36#714 := balances_re_ent36#714[__this := balances_re_ent36#714[__this][__msg_sender := 0]];
	}

	$return18:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_15.sol", 228, 5} {:message "MD::approveAndCall"} approveAndCall#777(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#740: address_t, _value#742: int, _extraData#744: int_arr_ptr)
	returns (success#747: bool)
{
	var {:sourceloc "buggy_15.sol", 231, 9} {:message "spender"} spender#750: address_t;
	var approve#710_ret#19: bool;
	var call_arg#20: address_t;
	// TCC assumptions
	assume (_extraData#744 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#750 := _spender#740;
	assume {:sourceloc "buggy_15.sol", 232, 13} {:message ""} true;
	call approve#710_ret#19 := approve#710(__this, __msg_sender, __msg_value, _spender#740, _value#742);
	if (approve#710_ret#19) {
	call_arg#20 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 233, 13} {:message ""} true;
	call receiveApproval#12(spender#750, __this, 0, call_arg#20, _value#742, __this, _extraData#744);
	success#747 := true;
	goto $return19;
	}

	$return19:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_15.sol", 237, 1} {:message "counter_re_ent35"} counter_re_ent35#780: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_15.sol", 238, 1} {:message "MD::callme_re_ent35"} callme_re_ent35#809(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#21: int;
	var __send_ret#22: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#780[__this] <= 5);
	call_arg#21 := 10000000000000000000;
	assume {:sourceloc "buggy_15.sol", 240, 9} {:message ""} true;
	call __send_ret#22 := __send(__msg_sender, __this, 0, call_arg#21);
	if (!(__send_ret#22)) {
	assume false;
	}

	counter_re_ent35#780 := counter_re_ent35#780[__this := (counter_re_ent35#780[__this] + 1)];
	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 253, 5} {:message "MD::burn"} burn#846(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#812: int)
	returns (success#815: bool)
{
	var call_arg#23: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#205[__this][__msg_sender] >= _value#812);
	balanceOf#205 := balanceOf#205[__this := balanceOf#205[__this][__msg_sender := (balanceOf#205[__this][__msg_sender] - _value#812)]];
	totalSupply#169 := totalSupply#169[__this := (totalSupply#169[__this] - _value#812)];
	call_arg#23 := __msg_sender;
	assume {:sourceloc "buggy_15.sol", 257, 14} {:message ""} true;
	call Burn#369(__this, __msg_sender, __msg_value, call_arg#23, _value#812);
	success#815 := true;
	goto $return21;
	$return21:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 260, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#850: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_15.sol", 261, 1} {:message "MD::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#884(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 264, 3} {:message "success"} success#854: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#850[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#850[__this][__msg_sender])];
	assume {:sourceloc "buggy_15.sol", 264, 18} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(__msg_sender, __this, userBalance_re_ent40#850[__this][__msg_sender]);
	if (__call_ret#24) {
	havoc not_called_re_ent20#16;
	havoc name#45;
	havoc redeemableEther_re_ent32#49;
	havoc symbol#87;
	havoc balances_re_ent38#91;
	havoc decimals#127;
	havoc redeemableEther_re_ent4#131;
	havoc totalSupply#169;
	havoc counter_re_ent7#172;
	havoc balanceOf#205;
	havoc lastPlayer_re_ent23#207;
	havoc jackpot_re_ent23#209;
	havoc allowance#245;
	havoc not_called_re_ent27#248;
	havoc balances_re_ent31#287;
	havoc not_called_re_ent13#331;
	havoc counter_re_ent14#404;
	havoc lastPlayer_re_ent30#515;
	havoc jackpot_re_ent30#517;
	havoc balances_re_ent8#571;
	havoc redeemableEther_re_ent39#645;
	havoc balances_re_ent36#714;
	havoc counter_re_ent35#780;
	havoc userBalance_re_ent40#850;
	havoc userBalance_re_ent33#944;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#850[__this][__msg_sender])];
	}

	success#854 := __call_ret#24;
	if (!(success#854)) {
	assume false;
	}

	userBalance_re_ent40#850 := userBalance_re_ent40#850[__this := userBalance_re_ent40#850[__this][__msg_sender := 0]];
	$return22:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_15.sol", 279, 5} {:message "MD::burnFrom"} burnFrom#940(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#887: address_t, _value#889: int)
	returns (success#892: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balanceOf#205[__this][_from#887] >= _value#889);
	assume (_value#889 <= allowance#245[__this][_from#887][__msg_sender]);
	balanceOf#205 := balanceOf#205[__this := balanceOf#205[__this][_from#887 := (balanceOf#205[__this][_from#887] - _value#889)]];
	allowance#245 := allowance#245[__this := allowance#245[__this][_from#887 := allowance#245[__this][_from#887][__msg_sender := (allowance#245[__this][_from#887][__msg_sender] - _value#889)]]];
	totalSupply#169 := totalSupply#169[__this := (totalSupply#169[__this] - _value#889)];
	assume {:sourceloc "buggy_15.sol", 285, 14} {:message ""} true;
	call Burn#369(__this, __msg_sender, __msg_value, _from#887, _value#889);
	success#892 := true;
	goto $return23;
	$return23:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_15.sol", 288, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#944: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_15.sol", 289, 1} {:message "MD::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#978(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_15.sol", 292, 3} {:message "success"} success#948: bool;
	var __call_ret#26: bool;
	var __call_ret#27: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#944[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#944[__this][__msg_sender])];
	assume {:sourceloc "buggy_15.sol", 292, 19} {:message ""} true;
	call __call_ret#26, __call_ret#27 := __call(__msg_sender, __this, userBalance_re_ent33#944[__this][__msg_sender]);
	if (__call_ret#26) {
	havoc not_called_re_ent20#16;
	havoc name#45;
	havoc redeemableEther_re_ent32#49;
	havoc symbol#87;
	havoc balances_re_ent38#91;
	havoc decimals#127;
	havoc redeemableEther_re_ent4#131;
	havoc totalSupply#169;
	havoc counter_re_ent7#172;
	havoc balanceOf#205;
	havoc lastPlayer_re_ent23#207;
	havoc jackpot_re_ent23#209;
	havoc allowance#245;
	havoc not_called_re_ent27#248;
	havoc balances_re_ent31#287;
	havoc not_called_re_ent13#331;
	havoc counter_re_ent14#404;
	havoc lastPlayer_re_ent30#515;
	havoc jackpot_re_ent30#517;
	havoc balances_re_ent8#571;
	havoc redeemableEther_re_ent39#645;
	havoc balances_re_ent36#714;
	havoc counter_re_ent35#780;
	havoc userBalance_re_ent40#850;
	havoc userBalance_re_ent33#944;
	havoc __balance;
	}

	if (!(__call_ret#26)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#944[__this][__msg_sender])];
	}

	success#948 := __call_ret#26;
	if (!(success#948)) {
	assume false;
	}

	userBalance_re_ent33#944 := userBalance_re_ent33#944[__this := userBalance_re_ent33#944[__this][__msg_sender := 0]];
	$return24:
	// Function body ends here
}

