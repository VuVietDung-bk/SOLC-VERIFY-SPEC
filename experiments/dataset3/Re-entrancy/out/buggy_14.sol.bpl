// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_14.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 9, 5} {:message "SafeMath::mul"} mul#34(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_14.sol", 15, 9} {:message "c"} c#18: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((a#3 == 0)) {
	#8 := 0;
	goto $return0;
	}

	c#18 := (a#3 * b#5);
	assume ((c#18 div a#3) == b#5);
	#8 := c#18;
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: div : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 21, 5} {:message "SafeMath::div"} div#58(__this: address_t, __msg_sender: address_t, __msg_value: int, a#36: int, b#38: int)
	returns (#41: int)
{
	var {:sourceloc "buggy_14.sol", 24, 9} {:message "c"} c#50: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#38 > 0);
	c#50 := (a#36 div b#38);
	#41 := c#50;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: sub : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 29, 5} {:message "SafeMath::sub"} sub#82(__this: address_t, __msg_sender: address_t, __msg_value: int, a#60: int, b#62: int)
	returns (#65: int)
{
	var {:sourceloc "buggy_14.sol", 31, 9} {:message "c"} c#74: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#62 <= a#60);
	c#74 := (a#60 - b#62);
	#65 := c#74;
	goto $return2;
	$return2:
	// Function body ends here
}

// 
// Function: add : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 36, 5} {:message "SafeMath::add"} add#106(__this: address_t, __msg_sender: address_t, __msg_value: int, a#84: int, b#86: int)
	returns (#89: int)
{
	var {:sourceloc "buggy_14.sol", 37, 9} {:message "c"} c#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#92 := (a#84 + b#86);
	assume (c#92 >= a#84);
	#89 := c#92;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 43, 5} {:message "SafeMath::mod"} mod#126(__this: address_t, __msg_sender: address_t, __msg_value: int, a#108: int, b#110: int)
	returns (#113: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#110 != 0);
	#113 := (a#108 mod b#110);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_14.sol", 7, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#127(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: IERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_14.sol", 63, 5} {:message "[event] IERC20::Transfer"} Transfer#185(__this: address_t, __msg_sender: address_t, __msg_value: int, from#179: address_t, to#181: address_t, value#183: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_14.sol", 64, 5} {:message "[event] IERC20::Approval"} Approval#193(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#187: address_t, spender#189: address_t, value#191: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_14.sol", 65, 5} {:message "[event] IERC20::Burn"} Burn#199(__this: address_t, __msg_sender: address_t, __msg_value: int, from#195: address_t, value#197: int)
{
	
}

// 
// Function: totalSupply
procedure {:sourceloc "buggy_14.sol", 50, 5} {:message "IERC20::totalSupply"} totalSupply#132(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#130: int);

// 
// Function: balanceOf
procedure {:sourceloc "buggy_14.sol", 52, 5} {:message "IERC20::balanceOf"} balanceOf#139(__this: address_t, __msg_sender: address_t, __msg_value: int, who#134: address_t)
	returns (#137: int);

// 
// Function: transfer
procedure {:sourceloc "buggy_14.sol", 54, 5} {:message "IERC20::transfer"} transfer#148(__this: address_t, __msg_sender: address_t, __msg_value: int, to#141: address_t, value#143: int)
	returns (#146: bool);

// 
// Function: transferFrom
procedure {:sourceloc "buggy_14.sol", 56, 5} {:message "IERC20::transferFrom"} transferFrom#159(__this: address_t, __msg_sender: address_t, __msg_value: int, from#150: address_t, to#152: address_t, value#154: int)
	returns (#157: bool);

// 
// Function: approve
procedure {:sourceloc "buggy_14.sol", 58, 5} {:message "IERC20::approve"} approve#168(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#161: address_t, value#163: int)
	returns (#166: bool);

// 
// Function: allowance
procedure {:sourceloc "buggy_14.sol", 60, 5} {:message "IERC20::allowance"} allowance#177(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#170: address_t, spender#172: address_t)
	returns (#175: int);

// 
// Default constructor
procedure {:sourceloc "buggy_14.sol", 49, 1} {:message "IERC20::[implicit_constructor]"} __constructor#200(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: ERC20 -------
// Inherits from: IERC20
// Using library SafeMath for uint256
// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 72, 3} {:message "balances_re_ent3"} balances_re_ent3#209: [address_t][address_t]int;
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
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 73, 1} {:message "ERC20::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#248(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#211: int)
{
	var {:sourceloc "buggy_14.sol", 76, 6} {:message "success"} success#224: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#209[__this][__msg_sender] >= _weiToWithdraw#211);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#211);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#211)];
	assume {:sourceloc "buggy_14.sol", 76, 22} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, _weiToWithdraw#211);
	if (__call_ret#0) {
	havoc balances_re_ent3#209;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc _totalSupply#292;
	havoc _name#294;
	havoc _symbol#296;
	havoc redeemableEther_re_ent25#300;
	havoc _balances#340;
	havoc userBalance_re_ent19#344;
	havoc _allowed#379;
	havoc redeemableEther_re_ent32#392;
	havoc balances_re_ent38#445;
	havoc redeemableEther_re_ent4#502;
	havoc counter_re_ent7#577;
	havoc lastPlayer_re_ent23#628;
	havoc jackpot_re_ent23#630;
	havoc counter_re_ent14#680;
	havoc lastPlayer_re_ent30#723;
	havoc jackpot_re_ent30#725;
	havoc balances_re_ent8#803;
	havoc redeemableEther_re_ent39#883;
	havoc balances_re_ent36#965;
	havoc counter_re_ent35#1035;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#211)];
	}

	success#224 := __call_ret#0;
	assume success#224;
	balances_re_ent3#209 := balances_re_ent3#209[__this := balances_re_ent3#209[__this][__msg_sender := (balances_re_ent3#209[__this][__msg_sender] - _weiToWithdraw#211)]];
	$return5:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_14.sol", 81, 3} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#253: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_14.sol", 82, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#255: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_14.sol", 83, 4} {:message "ERC20::buyTicket_re_ent9"} buyTicket_re_ent9#290(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 84, 10} {:message "success"} success#259: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#255[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#255[__this])];
	assume {:sourceloc "buggy_14.sol", 84, 27} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(lastPlayer_re_ent9#253[__this], __this, jackpot_re_ent9#255[__this]);
	if (__call_ret#2) {
	havoc balances_re_ent3#209;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc _totalSupply#292;
	havoc _name#294;
	havoc _symbol#296;
	havoc redeemableEther_re_ent25#300;
	havoc _balances#340;
	havoc userBalance_re_ent19#344;
	havoc _allowed#379;
	havoc redeemableEther_re_ent32#392;
	havoc balances_re_ent38#445;
	havoc redeemableEther_re_ent4#502;
	havoc counter_re_ent7#577;
	havoc lastPlayer_re_ent23#628;
	havoc jackpot_re_ent23#630;
	havoc counter_re_ent14#680;
	havoc lastPlayer_re_ent30#723;
	havoc jackpot_re_ent30#725;
	havoc balances_re_ent8#803;
	havoc redeemableEther_re_ent39#883;
	havoc balances_re_ent36#965;
	havoc counter_re_ent35#1035;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#255[__this])];
	}

	success#259 := __call_ret#2;
	if (!(success#259)) {
	assume false;
	}

	lastPlayer_re_ent9#253 := lastPlayer_re_ent9#253[__this := __msg_sender];
	jackpot_re_ent9#255 := jackpot_re_ent9#255[__this := __balance[__this]];
	$return6:
	// Function body ends here
}

// 
// State variable: _totalSupply: uint256
var {:sourceloc "buggy_14.sol", 90, 3} {:message "_totalSupply"} _totalSupply#292: [address_t]int;
// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_14.sol", 91, 5} {:message "_name"} _name#294: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 92, 5} {:message "_symbol"} _symbol#296: [address_t]int_arr_type;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 94, 3} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#300: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_14.sol", 95, 1} {:message "ERC20::claimReward_re_ent25"} claimReward_re_ent25#336(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 98, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#313: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#300[__this][__msg_sender] > 0);
	transferValue_re_ent25#313 := redeemableEther_re_ent25#300[__this][__msg_sender];
	assume {:sourceloc "buggy_14.sol", 99, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#313);
	redeemableEther_re_ent25#300 := redeemableEther_re_ent25#300[__this := redeemableEther_re_ent25#300[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// State variable: _balances: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 102, 3} {:message "_balances"} _balances#340: [address_t][address_t]int;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 103, 3} {:message "userBalance_re_ent19"} userBalance_re_ent19#344: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_14.sol", 104, 1} {:message "ERC20::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#373(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#4: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 107, 16} {:message ""} true;
	call __send_ret#4 := __send(__msg_sender, __this, 0, userBalance_re_ent19#344[__this][__msg_sender]);
	if (!(__send_ret#4)) {
	assume false;
	}

	userBalance_re_ent19#344 := userBalance_re_ent19#344[__this := userBalance_re_ent19#344[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// State variable: _allowed: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_14.sol", 112, 3} {:message "_allowed"} _allowed#379: [address_t][address_t][address_t]int;
// 
// Function: totalSupply : function () view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 115, 5} {:message "ERC20::totalSupply"} totalSupply#388(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#383: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#383 := _totalSupply#292[__this];
	goto $return9;
	$return9:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 118, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#392: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_14.sol", 119, 1} {:message "ERC20::claimReward_re_ent32"} claimReward_re_ent32#428(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 122, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#405: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#392[__this][__msg_sender] > 0);
	transferValue_re_ent32#405 := redeemableEther_re_ent32#392[__this][__msg_sender];
	assume {:sourceloc "buggy_14.sol", 123, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#405);
	redeemableEther_re_ent32#392 := redeemableEther_re_ent32#392[__this := redeemableEther_re_ent32#392[__this][__msg_sender := 0]];
	$return10:
	// Function body ends here
}

// 
// Function: balanceOf : function (address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 127, 5} {:message "ERC20::balanceOf"} balanceOf#441(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#430: address_t)
	returns (#434: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#434 := _balances#340[__this][owner#430];
	goto $return11;
	$return11:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 130, 1} {:message "balances_re_ent38"} balances_re_ent38#445: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 131, 1} {:message "ERC20::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#478(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#447: int)
{
	var __send_ret#5: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#445[__this][__msg_sender] >= _weiToWithdraw#447);
	assume {:sourceloc "buggy_14.sol", 134, 17} {:message ""} true;
	call __send_ret#5 := __send(__msg_sender, __this, 0, _weiToWithdraw#447);
	assume __send_ret#5;
	balances_re_ent38#445 := balances_re_ent38#445[__this := balances_re_ent38#445[__this][__msg_sender := (balances_re_ent38#445[__this][__msg_sender] - _weiToWithdraw#447)]];
	$return12:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 138, 5} {:message "ERC20::transfer"} transfer#498(__this: address_t, __msg_sender: address_t, __msg_value: int, to#480: address_t, value#482: int)
	returns (#486: bool)
{
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#6 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 139, 9} {:message ""} true;
	call _transfer#879(__this, __msg_sender, __msg_value, call_arg#6, to#480, value#482);
	#486 := true;
	goto $return13;
	$return13:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 142, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#502: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_14.sol", 143, 1} {:message "ERC20::claimReward_re_ent4"} claimReward_re_ent4#538(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 146, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#515: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#502[__this][__msg_sender] > 0);
	transferValue_re_ent4#515 := redeemableEther_re_ent4#502[__this][__msg_sender];
	assume {:sourceloc "buggy_14.sol", 147, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#515);
	redeemableEther_re_ent4#502 := redeemableEther_re_ent4#502[__this := redeemableEther_re_ent4#502[__this][__msg_sender := 0]];
	$return14:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 151, 9} {:message "ERC20::transferFrom"} transferFrom#574(__this: address_t, __msg_sender: address_t, __msg_value: int, from#540: address_t, to#542: address_t, value#544: int)
	returns (#548: bool)
{
	var call_arg#7: address_t;
	var sub#82_ret#8: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 152, 10} {:message ""} true;
	call _transfer#879(__this, __msg_sender, __msg_value, from#540, to#542, value#544);
	call_arg#7 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 153, 37} {:message ""} true;
	call sub#82_ret#8 := sub#82(__this, __msg_sender, __msg_value, _allowed#379[__this][from#540][__msg_sender], value#544);
	assume {:sourceloc "buggy_14.sol", 153, 10} {:message ""} true;
	call _approve#961(__this, __msg_sender, __msg_value, from#540, call_arg#7, sub#82_ret#8);
	#548 := true;
	goto $return15;
	$return15:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_14.sol", 156, 1} {:message "counter_re_ent7"} counter_re_ent7#577: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_14.sol", 157, 1} {:message "ERC20::callme_re_ent7"} callme_re_ent7#606(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#577[__this] <= 5);
	call_arg#9 := 10000000000000000000;
	assume {:sourceloc "buggy_14.sol", 159, 9} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, call_arg#9);
	if (!(__send_ret#10)) {
	assume false;
	}

	counter_re_ent7#577 := counter_re_ent7#577[__this := (counter_re_ent7#577[__this] + 1)];
	$return16:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_14.sol", 165, 5} {:message "ERC20::approve"} approve#626(__this: address_t, __msg_sender: address_t, __msg_value: int, spender#608: address_t, value#610: int)
	returns (#614: bool)
{
	var call_arg#11: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#11 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 166, 9} {:message ""} true;
	call _approve#961(__this, __msg_sender, __msg_value, call_arg#11, spender#608, value#610);
	#614 := true;
	goto $return17;
	$return17:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_14.sol", 169, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#628: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_14.sol", 170, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#630: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_14.sol", 171, 4} {:message "ERC20::buyTicket_re_ent23"} buyTicket_re_ent23#660(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 172, 12} {:message ""} true;
	call __send_ret#12 := __send(lastPlayer_re_ent23#628[__this], __this, 0, jackpot_re_ent23#630[__this]);
	if (!(__send_ret#12)) {
	assume false;
	}

	lastPlayer_re_ent23#628 := lastPlayer_re_ent23#628[__this := __msg_sender];
	jackpot_re_ent23#630 := jackpot_re_ent23#630[__this := __balance[__this]];
	$return18:
	// Function body ends here
}

// 
// Function: allowance : function (address,address) view returns (uint256)
procedure {:sourceloc "buggy_14.sol", 178, 5} {:message "ERC20::allowance"} allowance#677(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#662: address_t, spender#664: address_t)
	returns (#668: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#668 := _allowed#379[__this][owner#662][spender#664];
	goto $return19;
	$return19:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_14.sol", 181, 1} {:message "counter_re_ent14"} counter_re_ent14#680: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_14.sol", 182, 1} {:message "ERC20::callme_re_ent14"} callme_re_ent14#709(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#13: int;
	var __send_ret#14: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#680[__this] <= 5);
	call_arg#13 := 10000000000000000000;
	assume {:sourceloc "buggy_14.sol", 184, 9} {:message ""} true;
	call __send_ret#14 := __send(__msg_sender, __this, 0, call_arg#13);
	if (!(__send_ret#14)) {
	assume false;
	}

	counter_re_ent14#680 := counter_re_ent14#680[__this := (counter_re_ent14#680[__this] + 1)];
	$return20:
	// Function body ends here
}

// 
// Function: burn : function (uint256)
procedure {:sourceloc "buggy_14.sol", 190, 5} {:message "ERC20::burn"} burn#721(__this: address_t, __msg_sender: address_t, __msg_value: int, value#711: int)
{
	var call_arg#15: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#15 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 191, 9} {:message ""} true;
	call _burn#1032(__this, __msg_sender, __msg_value, call_arg#15, value#711);
	$return21:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_14.sol", 193, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#723: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_14.sol", 194, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#725: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_14.sol", 195, 4} {:message "ERC20::buyTicket_re_ent30"} buyTicket_re_ent30#755(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 196, 12} {:message ""} true;
	call __send_ret#16 := __send(lastPlayer_re_ent30#723[__this], __this, 0, jackpot_re_ent30#725[__this]);
	if (!(__send_ret#16)) {
	assume false;
	}

	lastPlayer_re_ent30#723 := lastPlayer_re_ent30#723[__this := __msg_sender];
	jackpot_re_ent30#725 := jackpot_re_ent30#725[__this := __balance[__this]];
	$return22:
	// Function body ends here
}

// 
// Function: _mint : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 202, 5} {:message "ERC20::_mint"} _mint#799(__this: address_t, __msg_sender: address_t, __msg_value: int, account#757: address_t, value#759: int)
{
	var add#106_ret#17: int;
	var add#106_ret#18: int;
	var call_arg#19: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#757 != 0);
	assume {:sourceloc "buggy_14.sol", 204, 24} {:message ""} true;
	call add#106_ret#17 := add#106(__this, __msg_sender, __msg_value, _totalSupply#292[__this], value#759);
	_totalSupply#292 := _totalSupply#292[__this := add#106_ret#17];
	assume {:sourceloc "buggy_14.sol", 205, 30} {:message ""} true;
	call add#106_ret#18 := add#106(__this, __msg_sender, __msg_value, _balances#340[__this][account#757], value#759);
	_balances#340 := _balances#340[__this := _balances#340[__this][account#757 := add#106_ret#18]];
	call_arg#19 := 0;
	assume {:sourceloc "buggy_14.sol", 206, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, call_arg#19, account#757, value#759);
	$return23:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 208, 1} {:message "balances_re_ent8"} balances_re_ent8#803: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_14.sol", 209, 5} {:message "ERC20::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#832(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 210, 6} {:message "success"} success#807: bool;
	var __call_ret#20: bool;
	var __call_ret#21: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#803[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#803[__this][__msg_sender])];
	assume {:sourceloc "buggy_14.sol", 210, 23} {:message ""} true;
	call __call_ret#20, __call_ret#21 := __call(__msg_sender, __this, balances_re_ent8#803[__this][__msg_sender]);
	if (__call_ret#20) {
	havoc balances_re_ent3#209;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc _totalSupply#292;
	havoc _name#294;
	havoc _symbol#296;
	havoc redeemableEther_re_ent25#300;
	havoc _balances#340;
	havoc userBalance_re_ent19#344;
	havoc _allowed#379;
	havoc redeemableEther_re_ent32#392;
	havoc balances_re_ent38#445;
	havoc redeemableEther_re_ent4#502;
	havoc counter_re_ent7#577;
	havoc lastPlayer_re_ent23#628;
	havoc jackpot_re_ent23#630;
	havoc counter_re_ent14#680;
	havoc lastPlayer_re_ent30#723;
	havoc jackpot_re_ent30#725;
	havoc balances_re_ent8#803;
	havoc redeemableEther_re_ent39#883;
	havoc balances_re_ent36#965;
	havoc counter_re_ent35#1035;
	havoc __balance;
	}

	if (!(__call_ret#20)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#803[__this][__msg_sender])];
	}

	success#807 := __call_ret#20;
	if (success#807) {
	balances_re_ent8#803 := balances_re_ent8#803[__this := balances_re_ent8#803[__this][__msg_sender := 0]];
	}

	$return24:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 215, 5} {:message "ERC20::_transfer"} _transfer#879(__this: address_t, __msg_sender: address_t, __msg_value: int, from#834: address_t, to#836: address_t, value#838: int)
{
	var sub#82_ret#22: int;
	var add#106_ret#23: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (to#836 != 0);
	assume {:sourceloc "buggy_14.sol", 218, 27} {:message ""} true;
	call sub#82_ret#22 := sub#82(__this, __msg_sender, __msg_value, _balances#340[__this][from#834], value#838);
	_balances#340 := _balances#340[__this := _balances#340[__this][from#834 := sub#82_ret#22]];
	assume {:sourceloc "buggy_14.sol", 219, 25} {:message ""} true;
	call add#106_ret#23 := add#106(__this, __msg_sender, __msg_value, _balances#340[__this][to#836], value#838);
	_balances#340 := _balances#340[__this := _balances#340[__this][to#836 := add#106_ret#23]];
	assume {:sourceloc "buggy_14.sol", 220, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, from#834, to#836, value#838);
	$return25:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 223, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#883: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_14.sol", 224, 1} {:message "ERC20::claimReward_re_ent39"} claimReward_re_ent39#919(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 227, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#896: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#883[__this][__msg_sender] > 0);
	transferValue_re_ent39#896 := redeemableEther_re_ent39#883[__this][__msg_sender];
	assume {:sourceloc "buggy_14.sol", 228, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#896);
	redeemableEther_re_ent39#883 := redeemableEther_re_ent39#883[__this := redeemableEther_re_ent39#883[__this][__msg_sender := 0]];
	$return26:
	// Function body ends here
}

// 
// Function: _approve : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 232, 5} {:message "ERC20::_approve"} _approve#961(__this: address_t, __msg_sender: address_t, __msg_value: int, owner#921: address_t, spender#923: address_t, value#925: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (spender#923 != 0);
	assume (owner#921 != 0);
	_allowed#379 := _allowed#379[__this := _allowed#379[__this][owner#921 := _allowed#379[__this][owner#921][spender#923 := value#925]]];
	assume {:sourceloc "buggy_14.sol", 237, 14} {:message ""} true;
	call Approval#193(__this, __msg_sender, __msg_value, owner#921, spender#923, value#925);
	$return27:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 239, 1} {:message "balances_re_ent36"} balances_re_ent36#965: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_14.sol", 240, 5} {:message "ERC20::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#988(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_14.sol", 241, 9} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, balances_re_ent36#965[__this][__msg_sender]);
	if (__send_ret#24) {
	balances_re_ent36#965 := balances_re_ent36#965[__this := balances_re_ent36#965[__this][__msg_sender := 0]];
	}

	$return28:
	// Function body ends here
}

// 
// Function: _burn : function (address,uint256)
procedure {:inline 1} {:sourceloc "buggy_14.sol", 245, 5} {:message "ERC20::_burn"} _burn#1032(__this: address_t, __msg_sender: address_t, __msg_value: int, account#990: address_t, value#992: int)
{
	var sub#82_ret#25: int;
	var sub#82_ret#26: int;
	var call_arg#27: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (account#990 != 0);
	assume {:sourceloc "buggy_14.sol", 248, 24} {:message ""} true;
	call sub#82_ret#25 := sub#82(__this, __msg_sender, __msg_value, _totalSupply#292[__this], value#992);
	_totalSupply#292 := _totalSupply#292[__this := sub#82_ret#25];
	assume {:sourceloc "buggy_14.sol", 249, 30} {:message ""} true;
	call sub#82_ret#26 := sub#82(__this, __msg_sender, __msg_value, _balances#340[__this][account#990], value#992);
	_balances#340 := _balances#340[__this := _balances#340[__this][account#990 := sub#82_ret#26]];
	call_arg#27 := 0;
	assume {:sourceloc "buggy_14.sol", 250, 14} {:message ""} true;
	call Transfer#185(__this, __msg_sender, __msg_value, account#990, call_arg#27, value#992);
	$return29:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_14.sol", 252, 1} {:message "counter_re_ent35"} counter_re_ent35#1035: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_14.sol", 253, 1} {:message "ERC20::callme_re_ent35"} callme_re_ent35#1064(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1035[__this] <= 5);
	call_arg#28 := 10000000000000000000;
	assume {:sourceloc "buggy_14.sol", 255, 9} {:message ""} true;
	call __send_ret#29 := __send(__msg_sender, __this, 0, call_arg#28);
	if (!(__send_ret#29)) {
	assume false;
	}

	counter_re_ent35#1035 := counter_re_ent35#1035[__this := (counter_re_ent35#1035[__this] + 1)];
	$return30:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
procedure {:sourceloc "buggy_14.sol", 69, 1} {:message "ERC20::[implicit_constructor]"} __constructor#1065(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	balances_re_ent3#209 := balances_re_ent3#209[__this := default_address_t_int()];
	lastPlayer_re_ent9#253 := lastPlayer_re_ent9#253[__this := 0];
	jackpot_re_ent9#255 := jackpot_re_ent9#255[__this := 0];
	_totalSupply#292 := _totalSupply#292[__this := 0];
	_name#294 := _name#294[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#296 := _symbol#296[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent25#300 := redeemableEther_re_ent25#300[__this := default_address_t_int()];
	_balances#340 := _balances#340[__this := default_address_t_int()];
	userBalance_re_ent19#344 := userBalance_re_ent19#344[__this := default_address_t_int()];
	_allowed#379 := _allowed#379[__this := default_address_t__k_address_t_v_int()];
	redeemableEther_re_ent32#392 := redeemableEther_re_ent32#392[__this := default_address_t_int()];
	balances_re_ent38#445 := balances_re_ent38#445[__this := default_address_t_int()];
	redeemableEther_re_ent4#502 := redeemableEther_re_ent4#502[__this := default_address_t_int()];
	counter_re_ent7#577 := counter_re_ent7#577[__this := 0];
	lastPlayer_re_ent23#628 := lastPlayer_re_ent23#628[__this := 0];
	jackpot_re_ent23#630 := jackpot_re_ent23#630[__this := 0];
	counter_re_ent14#680 := counter_re_ent14#680[__this := 0];
	lastPlayer_re_ent30#723 := lastPlayer_re_ent30#723[__this := 0];
	jackpot_re_ent30#725 := jackpot_re_ent30#725[__this := 0];
	balances_re_ent8#803 := balances_re_ent8#803[__this := default_address_t_int()];
	redeemableEther_re_ent39#883 := redeemableEther_re_ent39#883[__this := default_address_t_int()];
	balances_re_ent36#965 := balances_re_ent36#965[__this := default_address_t_int()];
	counter_re_ent35#1035 := counter_re_ent35#1035[__this := 0];
}

// 
// ------- Contract: ERC20Detailed -------
// 
// State variable: _name: string storage ref
var {:sourceloc "buggy_14.sol", 263, 5} {:message "_name"} _name#1067: [address_t]int_arr_type;
// 
// State variable: _symbol: string storage ref
var {:sourceloc "buggy_14.sol", 264, 5} {:message "_symbol"} _symbol#1069: [address_t]int_arr_type;
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 265, 3} {:message "userBalance_re_ent26"} userBalance_re_ent26#1073: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_14.sol", 266, 1} {:message "ERC20Detailed::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#1107(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 269, 10} {:message "success"} success#1077: bool;
	var __call_ret#30: bool;
	var __call_ret#31: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#1073[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#1073[__this][__msg_sender])];
	assume {:sourceloc "buggy_14.sol", 269, 26} {:message ""} true;
	call __call_ret#30, __call_ret#31 := __call(__msg_sender, __this, userBalance_re_ent26#1073[__this][__msg_sender]);
	if (__call_ret#30) {
	havoc _name#1067;
	havoc _symbol#1069;
	havoc userBalance_re_ent26#1073;
	havoc _decimals#1109;
	havoc userBalance_re_ent40#1135;
	havoc userBalance_re_ent33#1182;
	havoc not_called_re_ent27#1228;
	havoc balances_re_ent31#1268;
	havoc __balance;
	}

	if (!(__call_ret#30)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#1073[__this][__msg_sender])];
	}

	success#1077 := __call_ret#30;
	if (!(success#1077)) {
	assume false;
	}

	userBalance_re_ent26#1073 := userBalance_re_ent26#1073[__this := userBalance_re_ent26#1073[__this][__msg_sender := 0]];
	$return31:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_14.sol", 275, 3} {:message "_decimals"} _decimals#1109: [address_t]int;
// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 277, 5} {:message "ERC20Detailed::[constructor]"} __constructor#1302(__this: address_t, __msg_sender: address_t, __msg_value: int, name#1111: int_arr_ptr, symbol#1113: int_arr_ptr, decimals#1115: int)
{
	// TCC assumptions
	assume (name#1111 < __alloc_counter);
	assume (symbol#1113 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	_name#1067 := _name#1067[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1069 := _symbol#1069[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent26#1073 := userBalance_re_ent26#1073[__this := default_address_t_int()];
	_decimals#1109 := _decimals#1109[__this := 0];
	userBalance_re_ent40#1135 := userBalance_re_ent40#1135[__this := default_address_t_int()];
	userBalance_re_ent33#1182 := userBalance_re_ent33#1182[__this := default_address_t_int()];
	not_called_re_ent27#1228 := not_called_re_ent27#1228[__this := true];
	balances_re_ent31#1268 := balances_re_ent31#1268[__this := default_address_t_int()];
	// Function body starts here
	_name#1067 := _name#1067[__this := mem_arr_int[name#1111]];
	_symbol#1069 := _symbol#1069[__this := mem_arr_int[symbol#1113]];
	_decimals#1109 := _decimals#1109[__this := decimals#1115];
	$return32:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 282, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1135: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_14.sol", 283, 1} {:message "ERC20Detailed::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1169(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 286, 10} {:message "success"} success#1139: bool;
	var __call_ret#32: bool;
	var __call_ret#33: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1135[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1135[__this][__msg_sender])];
	assume {:sourceloc "buggy_14.sol", 286, 25} {:message ""} true;
	call __call_ret#32, __call_ret#33 := __call(__msg_sender, __this, userBalance_re_ent40#1135[__this][__msg_sender]);
	if (__call_ret#32) {
	havoc _name#1067;
	havoc _symbol#1069;
	havoc userBalance_re_ent26#1073;
	havoc _decimals#1109;
	havoc userBalance_re_ent40#1135;
	havoc userBalance_re_ent33#1182;
	havoc not_called_re_ent27#1228;
	havoc balances_re_ent31#1268;
	havoc __balance;
	}

	if (!(__call_ret#32)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1135[__this][__msg_sender])];
	}

	success#1139 := __call_ret#32;
	if (!(success#1139)) {
	assume false;
	}

	userBalance_re_ent40#1135 := userBalance_re_ent40#1135[__this := userBalance_re_ent40#1135[__this][__msg_sender := 0]];
	$return33:
	// Function body ends here
}

// 
// Function: name : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 296, 5} {:message "ERC20Detailed::name"} name#1178(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1173: int_arr_ptr)
{
	var new_array#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#34 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1173 := new_array#34;
	mem_arr_int := mem_arr_int[#1173 := _name#1067[__this]];
	goto $return34;
	$return34:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 299, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1182: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_14.sol", 300, 1} {:message "ERC20Detailed::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1216(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 303, 10} {:message "success"} success#1186: bool;
	var __call_ret#35: bool;
	var __call_ret#36: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1182[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1182[__this][__msg_sender])];
	assume {:sourceloc "buggy_14.sol", 303, 26} {:message ""} true;
	call __call_ret#35, __call_ret#36 := __call(__msg_sender, __this, userBalance_re_ent33#1182[__this][__msg_sender]);
	if (__call_ret#35) {
	havoc _name#1067;
	havoc _symbol#1069;
	havoc userBalance_re_ent26#1073;
	havoc _decimals#1109;
	havoc userBalance_re_ent40#1135;
	havoc userBalance_re_ent33#1182;
	havoc not_called_re_ent27#1228;
	havoc balances_re_ent31#1268;
	havoc __balance;
	}

	if (!(__call_ret#35)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1182[__this][__msg_sender])];
	}

	success#1186 := __call_ret#35;
	if (!(success#1186)) {
	assume false;
	}

	userBalance_re_ent33#1182 := userBalance_re_ent33#1182[__this := userBalance_re_ent33#1182[__this][__msg_sender := 0]];
	$return35:
	// Function body ends here
}

// 
// Function: symbol : function () view returns (string memory)
procedure {:sourceloc "buggy_14.sol", 313, 5} {:message "ERC20Detailed::symbol"} symbol#1225(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1220: int_arr_ptr)
{
	var new_array#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#37 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	#1220 := new_array#37;
	mem_arr_int := mem_arr_int[#1220 := _symbol#1069[__this]];
	goto $return36;
	$return36:
	// Function body ends here
}

// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_14.sol", 316, 1} {:message "not_called_re_ent27"} not_called_re_ent27#1228: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_14.sol", 317, 1} {:message "ERC20Detailed::bug_re_ent27"} bug_re_ent27#1255(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#38: int;
	var __send_ret#39: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#1228[__this];
	call_arg#38 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 319, 16} {:message ""} true;
	call __send_ret#39 := __send(__msg_sender, __this, 0, call_arg#38);
	if (!(__send_ret#39)) {
	assume false;
	}

	not_called_re_ent27#1228 := not_called_re_ent27#1228[__this := false];
	$return37:
	// Function body ends here
}

// 
// Function: decimals : function () view returns (uint8)
procedure {:sourceloc "buggy_14.sol", 328, 5} {:message "ERC20Detailed::decimals"} decimals#1264(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1259: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1259 := _decimals#1109[__this];
	goto $return38;
	$return38:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_14.sol", 331, 1} {:message "balances_re_ent31"} balances_re_ent31#1268: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_14.sol", 332, 1} {:message "ERC20Detailed::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#1301(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1270: int)
{
	var __send_ret#40: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#1268[__this][__msg_sender] >= _weiToWithdraw#1270);
	assume {:sourceloc "buggy_14.sol", 335, 13} {:message ""} true;
	call __send_ret#40 := __send(__msg_sender, __this, 0, _weiToWithdraw#1270);
	assume __send_ret#40;
	balances_re_ent31#1268 := balances_re_ent31#1268[__this := balances_re_ent31#1268[__this][__msg_sender := (balances_re_ent31#1268[__this][__msg_sender] - _weiToWithdraw#1270)]];
	$return39:
	// Function body ends here
}

// 
// ------- Contract: SaveWon -------
// Inherits from: ERC20
// Inherits from: ERC20Detailed
// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_14.sol", 341, 3} {:message "not_called_re_ent20"} not_called_re_ent20#1309: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_14.sol", 342, 1} {:message "SaveWon::bug_re_ent20"} bug_re_ent20#1336(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#41: int;
	var __send_ret#42: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#1309[__this];
	call_arg#41 := 1000000000000000000;
	assume {:sourceloc "buggy_14.sol", 344, 16} {:message ""} true;
	call __send_ret#42 := __send(__msg_sender, __this, 0, call_arg#41);
	if (!(__send_ret#42)) {
	assume false;
	}

	not_called_re_ent20#1309 := not_called_re_ent20#1309[__this := false];
	$return40:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_14.sol", 355, 5} {:message "SaveWon::[constructor]"} __constructor#1406(__this: address_t, __msg_sender: address_t, __msg_value: int, _name#1353: int_arr_ptr, _symbol#1355: int_arr_ptr)
{
	var name#1111#43: int_arr_ptr;
	var symbol#1113#43: int_arr_ptr;
	var decimals#1115#43: int;
	var call_arg#45: address_t;
	// TCC assumptions
	assume (_name#1353 < __alloc_counter);
	assume (_symbol#1355 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	not_called_re_ent20#1309 := not_called_re_ent20#1309[__this := true];
	not_called_re_ent13#1373 := not_called_re_ent13#1373[__this := true];
	_name#1067 := _name#1067[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#1069 := _symbol#1069[__this := int_arr#constr(default_int_int(), 0)];
	userBalance_re_ent26#1073 := userBalance_re_ent26#1073[__this := default_address_t_int()];
	_decimals#1109 := _decimals#1109[__this := 0];
	userBalance_re_ent40#1135 := userBalance_re_ent40#1135[__this := default_address_t_int()];
	userBalance_re_ent33#1182 := userBalance_re_ent33#1182[__this := default_address_t_int()];
	not_called_re_ent27#1228 := not_called_re_ent27#1228[__this := true];
	balances_re_ent31#1268 := balances_re_ent31#1268[__this := default_address_t_int()];
	balances_re_ent3#209 := balances_re_ent3#209[__this := default_address_t_int()];
	lastPlayer_re_ent9#253 := lastPlayer_re_ent9#253[__this := 0];
	jackpot_re_ent9#255 := jackpot_re_ent9#255[__this := 0];
	_totalSupply#292 := _totalSupply#292[__this := 0];
	_name#294 := _name#294[__this := int_arr#constr(default_int_int(), 0)];
	_symbol#296 := _symbol#296[__this := int_arr#constr(default_int_int(), 0)];
	redeemableEther_re_ent25#300 := redeemableEther_re_ent25#300[__this := default_address_t_int()];
	_balances#340 := _balances#340[__this := default_address_t_int()];
	userBalance_re_ent19#344 := userBalance_re_ent19#344[__this := default_address_t_int()];
	_allowed#379 := _allowed#379[__this := default_address_t__k_address_t_v_int()];
	redeemableEther_re_ent32#392 := redeemableEther_re_ent32#392[__this := default_address_t_int()];
	balances_re_ent38#445 := balances_re_ent38#445[__this := default_address_t_int()];
	redeemableEther_re_ent4#502 := redeemableEther_re_ent4#502[__this := default_address_t_int()];
	counter_re_ent7#577 := counter_re_ent7#577[__this := 0];
	lastPlayer_re_ent23#628 := lastPlayer_re_ent23#628[__this := 0];
	jackpot_re_ent23#630 := jackpot_re_ent23#630[__this := 0];
	counter_re_ent14#680 := counter_re_ent14#680[__this := 0];
	lastPlayer_re_ent30#723 := lastPlayer_re_ent30#723[__this := 0];
	jackpot_re_ent30#725 := jackpot_re_ent30#725[__this := 0];
	balances_re_ent8#803 := balances_re_ent8#803[__this := default_address_t_int()];
	redeemableEther_re_ent39#883 := redeemableEther_re_ent39#883[__this := default_address_t_int()];
	balances_re_ent36#965 := balances_re_ent36#965[__this := default_address_t_int()];
	counter_re_ent35#1035 := counter_re_ent35#1035[__this := 0];
	// Arguments for ERC20Detailed
	name#1111#43 := _name#1353;
	symbol#1113#43 := _symbol#1355;
	decimals#1115#43 := 18;
	// Inlined constructor for ERC20Detailed starts here
	// Function body starts here
	_name#1067 := _name#1067[__this := mem_arr_int[name#1111#43]];
	_symbol#1069 := _symbol#1069[__this := mem_arr_int[symbol#1113#43]];
	_decimals#1109 := _decimals#1109[__this := decimals#1115#43];
	$return41:
	// Function body ends here
	// Inlined constructor for ERC20Detailed ends here
	// Function body starts here
	call_arg#45 := __msg_sender;
	assume {:sourceloc "buggy_14.sol", 356, 9} {:message ""} true;
	call _mint#799(__this, __msg_sender, __msg_value, call_arg#45, (50000000000 * 1000000000000000000));
	$return42:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_14.sol", 358, 1} {:message "not_called_re_ent13"} not_called_re_ent13#1373: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_14.sol", 359, 1} {:message "SaveWon::bug_re_ent13"} bug_re_ent13#1405(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_14.sol", 361, 10} {:message "success"} success#1381: bool;
	var __call_ret#46: bool;
	var __call_ret#47: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#1373[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_14.sol", 361, 25} {:message ""} true;
	call __call_ret#46, __call_ret#47 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#46) {
	havoc not_called_re_ent20#1309;
	havoc not_called_re_ent13#1373;
	havoc _name#1067;
	havoc _symbol#1069;
	havoc userBalance_re_ent26#1073;
	havoc _decimals#1109;
	havoc userBalance_re_ent40#1135;
	havoc userBalance_re_ent33#1182;
	havoc not_called_re_ent27#1228;
	havoc balances_re_ent31#1268;
	havoc balances_re_ent3#209;
	havoc lastPlayer_re_ent9#253;
	havoc jackpot_re_ent9#255;
	havoc _totalSupply#292;
	havoc _name#294;
	havoc _symbol#296;
	havoc redeemableEther_re_ent25#300;
	havoc _balances#340;
	havoc userBalance_re_ent19#344;
	havoc _allowed#379;
	havoc redeemableEther_re_ent32#392;
	havoc balances_re_ent38#445;
	havoc redeemableEther_re_ent4#502;
	havoc counter_re_ent7#577;
	havoc lastPlayer_re_ent23#628;
	havoc jackpot_re_ent23#630;
	havoc counter_re_ent14#680;
	havoc lastPlayer_re_ent30#723;
	havoc jackpot_re_ent30#725;
	havoc balances_re_ent8#803;
	havoc redeemableEther_re_ent39#883;
	havoc balances_re_ent36#965;
	havoc counter_re_ent35#1035;
	havoc __balance;
	}

	if (!(__call_ret#46)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#1381 := __call_ret#46;
	if (!(success#1381)) {
	assume false;
	}

	not_called_re_ent13#1373 := not_called_re_ent13#1373[__this := false];
	$return43:
	// Function body ends here
}

