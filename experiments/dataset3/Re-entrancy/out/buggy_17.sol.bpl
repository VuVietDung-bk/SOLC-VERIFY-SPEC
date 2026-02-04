// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_17.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: SafeMath -------
// 
// Function: mul : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 9, 3} {:message "SafeMath::mul"} mul#34(__this: address_t, __msg_sender: address_t, __msg_value: int, a#3: int, b#5: int)
	returns (#8: int)
{
	var {:sourceloc "buggy_17.sol", 13, 5} {:message "c"} c#18: int;
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
procedure {:inline 1} {:sourceloc "buggy_17.sol", 17, 3} {:message "SafeMath::div"} div#58(__this: address_t, __msg_sender: address_t, __msg_value: int, a#36: int, b#38: int)
	returns (#41: int)
{
	var {:sourceloc "buggy_17.sol", 19, 5} {:message "c"} c#50: int;
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
procedure {:inline 1} {:sourceloc "buggy_17.sol", 22, 3} {:message "SafeMath::sub"} sub#82(__this: address_t, __msg_sender: address_t, __msg_value: int, a#60: int, b#62: int)
	returns (#65: int)
{
	var {:sourceloc "buggy_17.sol", 24, 5} {:message "c"} c#74: int;
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
procedure {:inline 1} {:sourceloc "buggy_17.sol", 27, 3} {:message "SafeMath::add"} add#110(__this: address_t, __msg_sender: address_t, __msg_value: int, a#84: int, b#86: int)
	returns (#89: int)
{
	var {:sourceloc "buggy_17.sol", 28, 5} {:message "c"} c#92: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	c#92 := (a#84 + b#86);
	assume ((c#92 >= a#84) && (c#92 >= b#86));
	#89 := c#92;
	goto $return3;
	$return3:
	// Function body ends here
}

// 
// Function: mod : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 32, 3} {:message "SafeMath::mod"} mod#130(__this: address_t, __msg_sender: address_t, __msg_value: int, a#112: int, b#114: int)
	returns (#117: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (b#114 != 0);
	#117 := (a#112 mod b#114);
	goto $return4;
	$return4:
	// Function body ends here
}

// 
// Function: max256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 36, 3} {:message "SafeMath::max256"} max256#147(__this: address_t, __msg_sender: address_t, __msg_value: int, a#132: int, b#134: int)
	returns (#137: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#137 := (if (a#132 >= b#134) then a#132 else b#134);
	goto $return5;
	$return5:
	// Function body ends here
}

// 
// Function: min256 : function (uint256,uint256) pure returns (uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 39, 3} {:message "SafeMath::min256"} min256#164(__this: address_t, __msg_sender: address_t, __msg_value: int, a#149: int, b#151: int)
	returns (#154: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#154 := (if (a#149 < b#151) then a#149 else b#151);
	goto $return6;
	$return6:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 8, 1} {:message "SafeMath::[implicit_constructor]"} {:inline 1} __constructor#165(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: owned -------
// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 49, 1} {:message "userBalance_re_ent12"} userBalance_re_ent12#169: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_17.sol", 50, 1} {:message "owned::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#198(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#0: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 53, 12} {:message ""} true;
	call __send_ret#0 := __send(__msg_sender, __this, 0, userBalance_re_ent12#169[__this][__msg_sender]);
	if (!(__send_ret#0)) {
	assume false;
	}

	userBalance_re_ent12#169 := userBalance_re_ent12#169[__this := userBalance_re_ent12#169[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_17.sol", 58, 3} {:message "owner"} owner#200: [address_t]address_t;
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 60, 3} {:message "owned::[constructor]"} __constructor#303(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	userBalance_re_ent12#169 := userBalance_re_ent12#169[__this := default_address_t_int()];
	owner#200 := owner#200[__this := 0];
	not_called_re_ent20#212 := not_called_re_ent20#212[__this := true];
	redeemableEther_re_ent32#266 := redeemableEther_re_ent32#266[__this := default_address_t_int()];
	// Function body starts here
	owner#200 := owner#200[__this := __msg_sender];
	$return8:
	// Function body ends here
}

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_17.sol", 63, 1} {:message "not_called_re_ent20"} not_called_re_ent20#212: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_17.sol", 64, 1} {:message "owned::bug_re_ent20"} bug_re_ent20#239(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#1: int;
	var __send_ret#2: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#212[__this];
	call_arg#1 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 66, 12} {:message ""} true;
	call __send_ret#2 := __send(__msg_sender, __this, 0, call_arg#1);
	if (!(__send_ret#2)) {
	assume false;
	}

	not_called_re_ent20#212 := not_called_re_ent20#212[__this := false];
	$return9:
	// Function body ends here
}

// 
// Function: transferOwnership : function (address)
procedure {:sourceloc "buggy_17.sol", 77, 3} {:message "owned::transferOwnership"} transferOwnership#262(__this: address_t, __msg_sender: address_t, __msg_value: int, newOwner#252: address_t)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#200[__this]);
	// Function body starts here
	owner#200 := owner#200[__this := newOwner#252];
	$return11:
	// Function body ends here
	$return10:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 80, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#266: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_17.sol", 81, 1} {:message "owned::claimReward_re_ent32"} claimReward_re_ent32#302(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 84, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#279: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#266[__this][__msg_sender] > 0);
	transferValue_re_ent32#279 := redeemableEther_re_ent32#266[__this][__msg_sender];
	assume {:sourceloc "buggy_17.sol", 85, 2} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#279);
	redeemableEther_re_ent32#266 := redeemableEther_re_ent32#266[__this := redeemableEther_re_ent32#266[__this][__msg_sender := 0]];
	$return12:
	// Function body ends here
}

// 
// ------- Contract: tokenRecipient -------
type int_arr_ptr = int;
type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: receiveApproval
procedure {:sourceloc "buggy_17.sol", 91, 3} {:message "tokenRecipient::receiveApproval"} receiveApproval#314(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#305: address_t, _value#307: int, _token#309: address_t, _extraData#311: int_arr_ptr);

// 
// Default constructor
procedure {:sourceloc "buggy_17.sol", 90, 1} {:message "tokenRecipient::[implicit_constructor]"} __constructor#315(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: TokenERC20 -------
// 
// Event: Transfer
procedure {:inline 1} {:sourceloc "buggy_17.sol", 159, 3} {:message "[event] TokenERC20::Transfer"} Transfer#586(__this: address_t, __msg_sender: address_t, __msg_value: int, from#580: address_t, to#582: address_t, value#584: int)
{
	
}

// 
// Event: Approval
procedure {:inline 1} {:sourceloc "buggy_17.sol", 168, 3} {:message "[event] TokenERC20::Approval"} Approval#631(__this: address_t, __msg_sender: address_t, __msg_value: int, _owner#625: address_t, _spender#627: address_t, _value#629: int)
{
	
}

// 
// Event: Burn
procedure {:inline 1} {:sourceloc "buggy_17.sol", 178, 3} {:message "[event] TokenERC20::Burn"} Burn#667(__this: address_t, __msg_sender: address_t, __msg_value: int, from#663: address_t, value#665: int)
{
	
}

// Using library SafeMath for uint256
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 97, 1} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#322: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_17.sol", 98, 1} {:message "TokenERC20::claimReward_re_ent11"} claimReward_re_ent11#358(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 101, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#335: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#322[__this][__msg_sender] > 0);
	transferValue_re_ent11#335 := redeemableEther_re_ent11#322[__this][__msg_sender];
	assume {:sourceloc "buggy_17.sol", 102, 2} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#335);
	redeemableEther_re_ent11#322 := redeemableEther_re_ent11#322[__this := redeemableEther_re_ent11#322[__this][__msg_sender := 0]];
	$return13:
	// Function body ends here
}

// 
// State variable: name: string storage ref
var {:sourceloc "buggy_17.sol", 105, 3} {:message "name"} name#360: [address_t]int_arr_type;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 106, 1} {:message "balances_re_ent1"} balances_re_ent1#364: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_17.sol", 107, 6} {:message "TokenERC20::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#393(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 108, 9} {:message "success"} success#368: bool;
	var __call_ret#5: bool;
	var __call_ret#6: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#364[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#364[__this][__msg_sender])];
	assume {:sourceloc "buggy_17.sol", 108, 25} {:message ""} true;
	call __call_ret#5, __call_ret#6 := __call(__msg_sender, __this, balances_re_ent1#364[__this][__msg_sender]);
	if (__call_ret#5) {
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc __balance;
	}

	if (!(__call_ret#5)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#364[__this][__msg_sender])];
	}

	success#368 := __call_ret#5;
	if (success#368) {
	balances_re_ent1#364 := balances_re_ent1#364[__this := balances_re_ent1#364[__this][__msg_sender := 0]];
	}

	$return14:
	// Function body ends here
}

// 
// State variable: symbol: string storage ref
var {:sourceloc "buggy_17.sol", 112, 3} {:message "symbol"} symbol#395: [address_t]int_arr_type;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_17.sol", 113, 1} {:message "not_called_re_ent41"} not_called_re_ent41#398: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_17.sol", 114, 1} {:message "TokenERC20::bug_re_ent41"} bug_re_ent41#425(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#7: int;
	var __send_ret#8: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#398[__this];
	call_arg#7 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 116, 12} {:message ""} true;
	call __send_ret#8 := __send(__msg_sender, __this, 0, call_arg#7);
	if (!(__send_ret#8)) {
	assume false;
	}

	not_called_re_ent41#398 := not_called_re_ent41#398[__this := false];
	$return15:
	// Function body ends here
}

// 
// State variable: decimals: uint8
var {:sourceloc "buggy_17.sol", 121, 3} {:message "decimals"} decimals#427: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_17.sol", 122, 1} {:message "counter_re_ent42"} counter_re_ent42#430: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_17.sol", 123, 1} {:message "TokenERC20::callme_re_ent42"} callme_re_ent42#459(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#9: int;
	var __send_ret#10: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#430[__this] <= 5);
	call_arg#9 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 125, 9} {:message ""} true;
	call __send_ret#10 := __send(__msg_sender, __this, 0, call_arg#9);
	if (!(__send_ret#10)) {
	assume false;
	}

	counter_re_ent42#430 := counter_re_ent42#430[__this := (counter_re_ent42#430[__this] + 1)];
	$return16:
	// Function body ends here
}

// 
// State variable: totalSupply: uint256
var {:sourceloc "buggy_17.sol", 130, 3} {:message "totalSupply"} totalSupply#461: [address_t]int;
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_17.sol", 132, 1} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#463: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_17.sol", 133, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#465: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_17.sol", 134, 4} {:message "TokenERC20::buyTicket_re_ent2"} buyTicket_re_ent2#495(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 135, 12} {:message ""} true;
	call __send_ret#11 := __send(lastPlayer_re_ent2#463[__this], __this, 0, jackpot_re_ent2#465[__this]);
	if (!(__send_ret#11)) {
	assume false;
	}

	lastPlayer_re_ent2#463 := lastPlayer_re_ent2#463[__this := __msg_sender];
	jackpot_re_ent2#465 := jackpot_re_ent2#465[__this := __balance[__this]];
	$return17:
	// Function body ends here
}

// 
// State variable: balanceOf: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 140, 3} {:message "balanceOf"} balanceOf#499: [address_t][address_t]int;
// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 141, 1} {:message "balances_re_ent17"} balances_re_ent17#503: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 142, 1} {:message "TokenERC20::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#542(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#505: int)
{
	var {:sourceloc "buggy_17.sol", 145, 4} {:message "success"} success#518: bool;
	var __call_ret#12: bool;
	var __call_ret#13: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#503[__this][__msg_sender] >= _weiToWithdraw#505);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#505);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#505)];
	assume {:sourceloc "buggy_17.sol", 145, 19} {:message ""} true;
	call __call_ret#12, __call_ret#13 := __call(__msg_sender, __this, _weiToWithdraw#505);
	if (__call_ret#12) {
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc __balance;
	}

	if (!(__call_ret#12)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#505)];
	}

	success#518 := __call_ret#12;
	assume success#518;
	balances_re_ent17#503 := balances_re_ent17#503[__this := balances_re_ent17#503[__this][__msg_sender := (balances_re_ent17#503[__this][__msg_sender] - _weiToWithdraw#505)]];
	$return18:
	// Function body ends here
}

// 
// State variable: allowance: mapping(address => mapping(address => uint256))
var {:sourceloc "buggy_17.sol", 149, 3} {:message "allowance"} allowance#548: [address_t][address_t][address_t]int;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_17.sol", 151, 1} {:message "not_called_re_ent27"} not_called_re_ent27#551: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_17.sol", 152, 1} {:message "TokenERC20::bug_re_ent27"} bug_re_ent27#578(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#14: int;
	var __send_ret#15: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#551[__this];
	call_arg#14 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 154, 12} {:message ""} true;
	call __send_ret#15 := __send(__msg_sender, __this, 0, call_arg#14);
	if (!(__send_ret#15)) {
	assume false;
	}

	not_called_re_ent27#551 := not_called_re_ent27#551[__this := false];
	$return19:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 161, 1} {:message "balances_re_ent31"} balances_re_ent31#590: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 162, 1} {:message "TokenERC20::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#623(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#592: int)
{
	var __send_ret#16: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#590[__this][__msg_sender] >= _weiToWithdraw#592);
	assume {:sourceloc "buggy_17.sol", 165, 11} {:message ""} true;
	call __send_ret#16 := __send(__msg_sender, __this, 0, _weiToWithdraw#592);
	assume __send_ret#16;
	balances_re_ent31#590 := balances_re_ent31#590[__this := balances_re_ent31#590[__this][__msg_sender := (balances_re_ent31#590[__this][__msg_sender] - _weiToWithdraw#592)]];
	$return20:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_17.sol", 170, 1} {:message "not_called_re_ent13"} not_called_re_ent13#634: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_17.sol", 171, 1} {:message "TokenERC20::bug_re_ent13"} bug_re_ent13#661(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#17: int;
	var __send_ret#18: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#634[__this];
	call_arg#17 := 1000000000000000000;
	assume {:sourceloc "buggy_17.sol", 173, 9} {:message ""} true;
	call __send_ret#18 := __send(__msg_sender, __this, 0, call_arg#17);
	if (!(__send_ret#18)) {
	assume false;
	}

	not_called_re_ent13#634 := not_called_re_ent13#634[__this := false];
	$return21:
	// Function body ends here
}

function {:builtin "((as const (Array Int (Array Int Int))) ((as const (Array Int Int)) 0))"} default_address_t__k_address_t_v_int() returns ([address_t][address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 181, 3} {:message "TokenERC20::[constructor]"} __constructor#1069(__this: address_t, __msg_sender: address_t, __msg_value: int, tokenName#669: int_arr_ptr, tokenSymbol#671: int_arr_ptr, dec#673: int)
{
	// TCC assumptions
	assume (tokenName#669 < __alloc_counter);
	assume (tokenSymbol#671 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	redeemableEther_re_ent11#322 := redeemableEther_re_ent11#322[__this := default_address_t_int()];
	name#360 := name#360[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#364 := balances_re_ent1#364[__this := default_address_t_int()];
	symbol#395 := symbol#395[__this := int_arr#constr(default_int_int(), 0)];
	not_called_re_ent41#398 := not_called_re_ent41#398[__this := true];
	decimals#427 := decimals#427[__this := 0];
	counter_re_ent42#430 := counter_re_ent42#430[__this := 0];
	totalSupply#461 := totalSupply#461[__this := 0];
	lastPlayer_re_ent2#463 := lastPlayer_re_ent2#463[__this := 0];
	jackpot_re_ent2#465 := jackpot_re_ent2#465[__this := 0];
	balanceOf#499 := balanceOf#499[__this := default_address_t_int()];
	balances_re_ent17#503 := balances_re_ent17#503[__this := default_address_t_int()];
	allowance#548 := allowance#548[__this := default_address_t__k_address_t_v_int()];
	not_called_re_ent27#551 := not_called_re_ent27#551[__this := true];
	balances_re_ent31#590 := balances_re_ent31#590[__this := default_address_t_int()];
	not_called_re_ent13#634 := not_called_re_ent13#634[__this := true];
	balances_re_ent38#693 := balances_re_ent38#693[__this := default_address_t_int()];
	redeemableEther_re_ent4#777 := redeemableEther_re_ent4#777[__this := default_address_t_int()];
	counter_re_ent7#835 := counter_re_ent7#835[__this := 0];
	lastPlayer_re_ent23#903 := lastPlayer_re_ent23#903[__this := 0];
	jackpot_re_ent23#905 := jackpot_re_ent23#905[__this := 0];
	counter_re_ent14#966 := counter_re_ent14#966[__this := 0];
	lastPlayer_re_ent30#1036 := lastPlayer_re_ent30#1036[__this := 0];
	jackpot_re_ent30#1038 := jackpot_re_ent30#1038[__this := 0];
	// Function body starts here
	decimals#427 := decimals#427[__this := dec#673];
	name#360 := name#360[__this := mem_arr_int[tokenName#669]];
	symbol#395 := symbol#395[__this := mem_arr_int[tokenSymbol#671]];
	$return22:
	// Function body ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 186, 1} {:message "balances_re_ent38"} balances_re_ent38#693: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 187, 1} {:message "TokenERC20::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#726(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#695: int)
{
	var __send_ret#19: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#693[__this][__msg_sender] >= _weiToWithdraw#695);
	assume {:sourceloc "buggy_17.sol", 190, 11} {:message ""} true;
	call __send_ret#19 := __send(__msg_sender, __this, 0, _weiToWithdraw#695);
	assume __send_ret#19;
	balances_re_ent38#693 := balances_re_ent38#693[__this := balances_re_ent38#693[__this][__msg_sender := (balances_re_ent38#693[__this][__msg_sender] - _weiToWithdraw#695)]];
	$return23:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 194, 3} {:message "TokenERC20::_transfer"} _transfer#773(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#728: address_t, _to#730: address_t, _value#732: int)
{
	var sub#82_ret#20: int;
	var add#110_ret#21: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#730 != 0);
	assume {:sourceloc "buggy_17.sol", 196, 24} {:message ""} true;
	call sub#82_ret#20 := sub#82(__this, __msg_sender, __msg_value, balanceOf#499[__this][_from#728], _value#732);
	balanceOf#499 := balanceOf#499[__this := balanceOf#499[__this][_from#728 := sub#82_ret#20]];
	assume {:sourceloc "buggy_17.sol", 197, 22} {:message ""} true;
	call add#110_ret#21 := add#110(__this, __msg_sender, __msg_value, balanceOf#499[__this][_to#730], _value#732);
	balanceOf#499 := balanceOf#499[__this := balanceOf#499[__this][_to#730 := add#110_ret#21]];
	assume {:sourceloc "buggy_17.sol", 198, 10} {:message ""} true;
	call Transfer#586(__this, __msg_sender, __msg_value, _from#728, _to#730, _value#732);
	$return24:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 200, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#777: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_17.sol", 201, 1} {:message "TokenERC20::claimReward_re_ent4"} claimReward_re_ent4#813(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 204, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#790: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#777[__this][__msg_sender] > 0);
	transferValue_re_ent4#790 := redeemableEther_re_ent4#777[__this][__msg_sender];
	assume {:sourceloc "buggy_17.sol", 205, 8} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#790);
	redeemableEther_re_ent4#777 := redeemableEther_re_ent4#777[__this := redeemableEther_re_ent4#777[__this][__msg_sender := 0]];
	$return25:
	// Function body ends here
}

// 
// Function: transfer : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 209, 3} {:message "TokenERC20::transfer"} transfer#832(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#815: address_t, _value#817: int)
	returns (success#820: bool)
{
	var call_arg#22: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#22 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 210, 5} {:message ""} true;
	call _transfer#773(__this, __msg_sender, __msg_value, call_arg#22, _to#815, _value#817);
	success#820 := true;
	goto $return26;
	$return26:
	// Function body ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_17.sol", 213, 1} {:message "counter_re_ent7"} counter_re_ent7#835: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_17.sol", 214, 1} {:message "TokenERC20::callme_re_ent7"} callme_re_ent7#864(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#23: int;
	var __send_ret#24: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#835[__this] <= 5);
	call_arg#23 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 216, 9} {:message ""} true;
	call __send_ret#24 := __send(__msg_sender, __this, 0, call_arg#23);
	if (!(__send_ret#24)) {
	assume false;
	}

	counter_re_ent7#835 := counter_re_ent7#835[__this := (counter_re_ent7#835[__this] + 1)];
	$return27:
	// Function body ends here
}

// 
// Function: transferFrom : function (address,address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 223, 3} {:message "TokenERC20::transferFrom"} transferFrom#901(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#866: address_t, _to#868: address_t, _value#870: int)
	returns (success#873: bool)
{
	var sub#82_ret#25: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 224, 36} {:message ""} true;
	call sub#82_ret#25 := sub#82(__this, __msg_sender, __msg_value, allowance#548[__this][_from#866][__msg_sender], _value#870);
	allowance#548 := allowance#548[__this := allowance#548[__this][_from#866 := allowance#548[__this][_from#866][__msg_sender := sub#82_ret#25]]];
	assume {:sourceloc "buggy_17.sol", 225, 3} {:message ""} true;
	call _transfer#773(__this, __msg_sender, __msg_value, _from#866, _to#868, _value#870);
	success#873 := true;
	goto $return28;
	$return28:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_17.sol", 228, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#903: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_17.sol", 229, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#905: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_17.sol", 230, 4} {:message "TokenERC20::buyTicket_re_ent23"} buyTicket_re_ent23#935(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#26: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 231, 12} {:message ""} true;
	call __send_ret#26 := __send(lastPlayer_re_ent23#903[__this], __this, 0, jackpot_re_ent23#905[__this]);
	if (!(__send_ret#26)) {
	assume false;
	}

	lastPlayer_re_ent23#903 := lastPlayer_re_ent23#903[__this := __msg_sender];
	jackpot_re_ent23#905 := jackpot_re_ent23#905[__this := __balance[__this]];
	$return29:
	// Function body ends here
}

// 
// Function: approve : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 238, 3} {:message "TokenERC20::approve"} approve#963(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#937: address_t, _value#939: int)
	returns (success#942: bool)
{
	var call_arg#27: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	allowance#548 := allowance#548[__this := allowance#548[__this][__msg_sender := allowance#548[__this][__msg_sender][_spender#937 := _value#939]]];
	call_arg#27 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 240, 10} {:message ""} true;
	call Approval#631(__this, __msg_sender, __msg_value, call_arg#27, _spender#937, _value#939);
	success#942 := true;
	goto $return30;
	$return30:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_17.sol", 243, 1} {:message "counter_re_ent14"} counter_re_ent14#966: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_17.sol", 244, 1} {:message "TokenERC20::callme_re_ent14"} callme_re_ent14#995(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#966[__this] <= 5);
	call_arg#28 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 246, 9} {:message ""} true;
	call __send_ret#29 := __send(__msg_sender, __this, 0, call_arg#28);
	if (!(__send_ret#29)) {
	assume false;
	}

	counter_re_ent14#966 := counter_re_ent14#966[__this := (counter_re_ent14#966[__this] + 1)];
	$return31:
	// Function body ends here
}

// 
// Function: approveAndCall : function (address,uint256,bytes memory) returns (bool)
procedure {:sourceloc "buggy_17.sol", 253, 3} {:message "TokenERC20::approveAndCall"} approveAndCall#1034(__this: address_t, __msg_sender: address_t, __msg_value: int, _spender#997: address_t, _value#999: int, _extraData#1001: int_arr_ptr)
	returns (success#1004: bool)
{
	var {:sourceloc "buggy_17.sol", 254, 5} {:message "spender"} spender#1007: address_t;
	var approve#963_ret#30: bool;
	var call_arg#31: address_t;
	// TCC assumptions
	assume (_extraData#1001 < __alloc_counter);
	assume (__msg_sender != 0);
	// Function body starts here
	spender#1007 := _spender#997;
	assume {:sourceloc "buggy_17.sol", 255, 9} {:message ""} true;
	call approve#963_ret#30 := approve#963(__this, __msg_sender, __msg_value, _spender#997, _value#999);
	if (approve#963_ret#30) {
	call_arg#31 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 256, 7} {:message ""} true;
	call receiveApproval#314(spender#1007, __this, 0, call_arg#31, _value#999, __this, _extraData#1001);
	success#1004 := true;
	goto $return32;
	}

	$return32:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_17.sol", 260, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1036: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_17.sol", 261, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1038: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_17.sol", 262, 4} {:message "TokenERC20::buyTicket_re_ent30"} buyTicket_re_ent30#1068(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 263, 12} {:message ""} true;
	call __send_ret#32 := __send(lastPlayer_re_ent30#1036[__this], __this, 0, jackpot_re_ent30#1038[__this]);
	if (!(__send_ret#32)) {
	assume false;
	}

	lastPlayer_re_ent30#1036 := lastPlayer_re_ent30#1036[__this := __msg_sender];
	jackpot_re_ent30#1038 := jackpot_re_ent30#1038[__this := __balance[__this]];
	$return33:
	// Function body ends here
}

// 
// ------- Contract: AZT -------
// Inherits from: owned
// Inherits from: TokenERC20
// Using library SafeMath for uint256
// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_17.sol", 278, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#1078: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_17.sol", 279, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#1080: [address_t]int;
// 
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_17.sol", 280, 4} {:message "AZT::buyTicket_re_ent37"} buyTicket_re_ent37#1110(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#33: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 281, 12} {:message ""} true;
	call __send_ret#33 := __send(lastPlayer_re_ent37#1078[__this], __this, 0, jackpot_re_ent37#1080[__this]);
	if (!(__send_ret#33)) {
	assume false;
	}

	lastPlayer_re_ent37#1078 := lastPlayer_re_ent37#1078[__this := __msg_sender];
	jackpot_re_ent37#1080 := jackpot_re_ent37#1080[__this := __balance[__this]];
	$return34:
	// Function body ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 287, 2} {:message "balances_re_ent3"} balances_re_ent3#1114: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_17.sol", 288, 1} {:message "AZT::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#1153(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1116: int)
{
	var {:sourceloc "buggy_17.sol", 291, 5} {:message "success"} success#1129: bool;
	var __call_ret#34: bool;
	var __call_ret#35: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#1114[__this][__msg_sender] >= _weiToWithdraw#1116);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#1116);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#1116)];
	assume {:sourceloc "buggy_17.sol", 291, 21} {:message ""} true;
	call __call_ret#34, __call_ret#35 := __call(__msg_sender, __this, _weiToWithdraw#1116);
	if (__call_ret#34) {
	havoc lastPlayer_re_ent37#1078;
	havoc jackpot_re_ent37#1080;
	havoc balances_re_ent3#1114;
	havoc lastPlayer_re_ent9#1155;
	havoc jackpot_re_ent9#1157;
	havoc _decimals#1195;
	havoc redeemableEther_re_ent25#1199;
	havoc frozenAddresses#1238;
	havoc userBalance_re_ent19#1242;
	havoc tokenFrozen#1273;
	havoc userBalance_re_ent26#1286;
	havoc frozenWallets#1324;
	havoc balances_re_ent8#1406;
	havoc redeemableEther_re_ent39#1503;
	havoc balances_re_ent36#1589;
	havoc counter_re_ent35#1653;
	havoc userBalance_re_ent40#1738;
	havoc userBalance_re_ent33#1788;
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc userBalance_re_ent12#169;
	havoc owner#200;
	havoc not_called_re_ent20#212;
	havoc redeemableEther_re_ent32#266;
	havoc __balance;
	}

	if (!(__call_ret#34)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#1116)];
	}

	success#1129 := __call_ret#34;
	assume success#1129;
	balances_re_ent3#1114 := balances_re_ent3#1114[__this := balances_re_ent3#1114[__this][__msg_sender := (balances_re_ent3#1114[__this][__msg_sender] - _weiToWithdraw#1116)]];
	$return35:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_17.sol", 296, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#1155: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_17.sol", 297, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#1157: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_17.sol", 298, 4} {:message "AZT::buyTicket_re_ent9"} buyTicket_re_ent9#1192(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 299, 8} {:message "success"} success#1161: bool;
	var __call_ret#36: bool;
	var __call_ret#37: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#1157[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#1157[__this])];
	assume {:sourceloc "buggy_17.sol", 299, 25} {:message ""} true;
	call __call_ret#36, __call_ret#37 := __call(lastPlayer_re_ent9#1155[__this], __this, jackpot_re_ent9#1157[__this]);
	if (__call_ret#36) {
	havoc lastPlayer_re_ent37#1078;
	havoc jackpot_re_ent37#1080;
	havoc balances_re_ent3#1114;
	havoc lastPlayer_re_ent9#1155;
	havoc jackpot_re_ent9#1157;
	havoc _decimals#1195;
	havoc redeemableEther_re_ent25#1199;
	havoc frozenAddresses#1238;
	havoc userBalance_re_ent19#1242;
	havoc tokenFrozen#1273;
	havoc userBalance_re_ent26#1286;
	havoc frozenWallets#1324;
	havoc balances_re_ent8#1406;
	havoc redeemableEther_re_ent39#1503;
	havoc balances_re_ent36#1589;
	havoc counter_re_ent35#1653;
	havoc userBalance_re_ent40#1738;
	havoc userBalance_re_ent33#1788;
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc userBalance_re_ent12#169;
	havoc owner#200;
	havoc not_called_re_ent20#212;
	havoc redeemableEther_re_ent32#266;
	havoc __balance;
	}

	if (!(__call_ret#36)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#1157[__this])];
	}

	success#1161 := __call_ret#36;
	if (!(success#1161)) {
	assume false;
	}

	lastPlayer_re_ent9#1155 := lastPlayer_re_ent9#1155[__this := __msg_sender];
	jackpot_re_ent9#1157 := jackpot_re_ent9#1157[__this := __balance[__this]];
	$return36:
	// Function body ends here
}

// 
// State variable: _decimals: uint8
var {:sourceloc "buggy_17.sol", 305, 3} {:message "_decimals"} _decimals#1195: [address_t]int;
// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 307, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#1199: [address_t][address_t]int;
// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_17.sol", 308, 1} {:message "AZT::claimReward_re_ent25"} claimReward_re_ent25#1235(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 311, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#1212: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#1199[__this][__msg_sender] > 0);
	transferValue_re_ent25#1212 := redeemableEther_re_ent25#1199[__this][__msg_sender];
	assume {:sourceloc "buggy_17.sol", 312, 3} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#1212);
	redeemableEther_re_ent25#1199 := redeemableEther_re_ent25#1199[__this := redeemableEther_re_ent25#1199[__this][__msg_sender := 0]];
	$return37:
	// Function body ends here
}

// 
// State variable: frozenAddresses: address[] storage ref
type {:datatype} address_t_arr_type;
function {:constructor} address_t_arr#constr(arr: [int]address_t, length: int) returns (address_t_arr_type);
var {:sourceloc "buggy_17.sol", 315, 3} {:message "frozenAddresses"} frozenAddresses#1238: [address_t]address_t_arr_type;
// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 316, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#1242: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_17.sol", 317, 1} {:message "AZT::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#1271(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#38: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 320, 12} {:message ""} true;
	call __send_ret#38 := __send(__msg_sender, __this, 0, userBalance_re_ent19#1242[__this][__msg_sender]);
	if (!(__send_ret#38)) {
	assume false;
	}

	userBalance_re_ent19#1242 := userBalance_re_ent19#1242[__this := userBalance_re_ent19#1242[__this][__msg_sender := 0]];
	$return38:
	// Function body ends here
}

// 
// State variable: tokenFrozen: bool
var {:sourceloc "buggy_17.sol", 325, 3} {:message "tokenFrozen"} tokenFrozen#1273: [address_t]bool;
// 
// ------- Struct frozenWallet -------
// Storage
type {:datatype} struct_storage_frozenWallet#1282;
function {:constructor} frozenWallet#1282#constr(isFrozen#1275: bool, rewardedAmount#1277: int, frozenAmount#1279: int, frozenTime#1281: int) returns (struct_storage_frozenWallet#1282);
// Memory
type address_struct_memory_frozenWallet#1282 = int;
// Member isFrozen
var {:sourceloc "buggy_17.sol", 328, 5} {:message "isFrozen"} isFrozen#1275: [address_struct_memory_frozenWallet#1282]bool;
// Member rewardedAmount
var {:sourceloc "buggy_17.sol", 329, 5} {:message "rewardedAmount"} rewardedAmount#1277: [address_struct_memory_frozenWallet#1282]int;
// Member frozenAmount
var {:sourceloc "buggy_17.sol", 330, 5} {:message "frozenAmount"} frozenAmount#1279: [address_struct_memory_frozenWallet#1282]int;
// Member frozenTime
var {:sourceloc "buggy_17.sol", 331, 5} {:message "frozenTime"} frozenTime#1281: [address_struct_memory_frozenWallet#1282]int;
// 
// ------- End of struct frozenWallet -------
// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 334, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#1286: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_17.sol", 335, 1} {:message "AZT::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#1320(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 338, 3} {:message "success"} success#1290: bool;
	var __call_ret#39: bool;
	var __call_ret#40: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#1286[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#1286[__this][__msg_sender])];
	assume {:sourceloc "buggy_17.sol", 338, 19} {:message ""} true;
	call __call_ret#39, __call_ret#40 := __call(__msg_sender, __this, userBalance_re_ent26#1286[__this][__msg_sender]);
	if (__call_ret#39) {
	havoc lastPlayer_re_ent37#1078;
	havoc jackpot_re_ent37#1080;
	havoc balances_re_ent3#1114;
	havoc lastPlayer_re_ent9#1155;
	havoc jackpot_re_ent9#1157;
	havoc _decimals#1195;
	havoc redeemableEther_re_ent25#1199;
	havoc frozenAddresses#1238;
	havoc userBalance_re_ent19#1242;
	havoc tokenFrozen#1273;
	havoc userBalance_re_ent26#1286;
	havoc frozenWallets#1324;
	havoc balances_re_ent8#1406;
	havoc redeemableEther_re_ent39#1503;
	havoc balances_re_ent36#1589;
	havoc counter_re_ent35#1653;
	havoc userBalance_re_ent40#1738;
	havoc userBalance_re_ent33#1788;
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc userBalance_re_ent12#169;
	havoc owner#200;
	havoc not_called_re_ent20#212;
	havoc redeemableEther_re_ent32#266;
	havoc __balance;
	}

	if (!(__call_ret#39)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#1286[__this][__msg_sender])];
	}

	success#1290 := __call_ret#39;
	if (!(success#1290)) {
	assume false;
	}

	userBalance_re_ent26#1286 := userBalance_re_ent26#1286[__this := userBalance_re_ent26#1286[__this][__msg_sender := 0]];
	$return39:
	// Function body ends here
}

// 
// State variable: frozenWallets: mapping(address => struct AZT.frozenWallet storage ref)
var {:sourceloc "buggy_17.sol", 344, 3} {:message "frozenWallets"} frozenWallets#1324: [address_t][address_t]struct_storage_frozenWallet#1282;
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
function {:builtin "((as const (Array Int |T@struct_storage_frozenWallet#1282|)) (|frozenWallet#1282#constr| false 0 0 0))"} default_address_t_struct_storage_frozenWallet#1282() returns ([address_t]struct_storage_frozenWallet#1282);
const unique address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05: address_t;
// 
// Function: 
procedure {:sourceloc "buggy_17.sol", 348, 3} {:message "AZT::[constructor]"} __constructor#1823(__this: address_t, __msg_sender: address_t, __msg_value: int, _tokenName#1326: int_arr_ptr, _tokenSymbol#1328: int_arr_ptr)
{
	var tokenName#669#41: int_arr_ptr;
	var tokenSymbol#671#41: int_arr_ptr;
	var dec#673#41: int;
	var call_arg#44: int;
	var call_arg#45: int;
	var new_struct_frozenWallet#46: address_struct_memory_frozenWallet#1282;
	var {:sourceloc "buggy_17.sol", 359, 10} {:message "i"} i#1364#43: int;
	var add#110_ret#49: int;
	var tmp#50: int;
	// TCC assumptions
	assume (_tokenName#1326 < __alloc_counter);
	assume (_tokenSymbol#1328 < __alloc_counter);
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent37#1078 := lastPlayer_re_ent37#1078[__this := 0];
	jackpot_re_ent37#1080 := jackpot_re_ent37#1080[__this := 0];
	balances_re_ent3#1114 := balances_re_ent3#1114[__this := default_address_t_int()];
	lastPlayer_re_ent9#1155 := lastPlayer_re_ent9#1155[__this := 0];
	jackpot_re_ent9#1157 := jackpot_re_ent9#1157[__this := 0];
	_decimals#1195 := _decimals#1195[__this := 18];
	redeemableEther_re_ent25#1199 := redeemableEther_re_ent25#1199[__this := default_address_t_int()];
	frozenAddresses#1238 := frozenAddresses#1238[__this := address_t_arr#constr(default_int_address_t(), 0)];
	userBalance_re_ent19#1242 := userBalance_re_ent19#1242[__this := default_address_t_int()];
	tokenFrozen#1273 := tokenFrozen#1273[__this := false];
	userBalance_re_ent26#1286 := userBalance_re_ent26#1286[__this := default_address_t_int()];
	frozenWallets#1324 := frozenWallets#1324[__this := default_address_t_struct_storage_frozenWallet#1282()];
	balances_re_ent8#1406 := balances_re_ent8#1406[__this := default_address_t_int()];
	redeemableEther_re_ent39#1503 := redeemableEther_re_ent39#1503[__this := default_address_t_int()];
	balances_re_ent36#1589 := balances_re_ent36#1589[__this := default_address_t_int()];
	counter_re_ent35#1653 := counter_re_ent35#1653[__this := 0];
	userBalance_re_ent40#1738 := userBalance_re_ent40#1738[__this := default_address_t_int()];
	userBalance_re_ent33#1788 := userBalance_re_ent33#1788[__this := default_address_t_int()];
	redeemableEther_re_ent11#322 := redeemableEther_re_ent11#322[__this := default_address_t_int()];
	name#360 := name#360[__this := int_arr#constr(default_int_int(), 0)];
	balances_re_ent1#364 := balances_re_ent1#364[__this := default_address_t_int()];
	symbol#395 := symbol#395[__this := int_arr#constr(default_int_int(), 0)];
	not_called_re_ent41#398 := not_called_re_ent41#398[__this := true];
	decimals#427 := decimals#427[__this := 0];
	counter_re_ent42#430 := counter_re_ent42#430[__this := 0];
	totalSupply#461 := totalSupply#461[__this := 0];
	lastPlayer_re_ent2#463 := lastPlayer_re_ent2#463[__this := 0];
	jackpot_re_ent2#465 := jackpot_re_ent2#465[__this := 0];
	balanceOf#499 := balanceOf#499[__this := default_address_t_int()];
	balances_re_ent17#503 := balances_re_ent17#503[__this := default_address_t_int()];
	allowance#548 := allowance#548[__this := default_address_t__k_address_t_v_int()];
	not_called_re_ent27#551 := not_called_re_ent27#551[__this := true];
	balances_re_ent31#590 := balances_re_ent31#590[__this := default_address_t_int()];
	not_called_re_ent13#634 := not_called_re_ent13#634[__this := true];
	balances_re_ent38#693 := balances_re_ent38#693[__this := default_address_t_int()];
	redeemableEther_re_ent4#777 := redeemableEther_re_ent4#777[__this := default_address_t_int()];
	counter_re_ent7#835 := counter_re_ent7#835[__this := 0];
	lastPlayer_re_ent23#903 := lastPlayer_re_ent23#903[__this := 0];
	jackpot_re_ent23#905 := jackpot_re_ent23#905[__this := 0];
	counter_re_ent14#966 := counter_re_ent14#966[__this := 0];
	lastPlayer_re_ent30#1036 := lastPlayer_re_ent30#1036[__this := 0];
	jackpot_re_ent30#1038 := jackpot_re_ent30#1038[__this := 0];
	userBalance_re_ent12#169 := userBalance_re_ent12#169[__this := default_address_t_int()];
	owner#200 := owner#200[__this := 0];
	not_called_re_ent20#212 := not_called_re_ent20#212[__this := true];
	redeemableEther_re_ent32#266 := redeemableEther_re_ent32#266[__this := default_address_t_int()];
	// Arguments for TokenERC20
	tokenName#669#41 := _tokenName#1326;
	tokenSymbol#671#41 := _tokenSymbol#1328;
	dec#673#41 := _decimals#1195[__this];
	// Arguments for owned
	// Inlined constructor for owned starts here
	// Function body starts here
	owner#200 := owner#200[__this := __msg_sender];
	$return40:
	// Function body ends here
	// Inlined constructor for owned ends here
	// Inlined constructor for TokenERC20 starts here
	// Function body starts here
	decimals#427 := decimals#427[__this := dec#673#41];
	name#360 := name#360[__this := mem_arr_int[tokenName#669#41]];
	symbol#395 := symbol#395[__this := mem_arr_int[tokenSymbol#671#41]];
	$return41:
	// Function body ends here
	// Inlined constructor for TokenERC20 ends here
	// Function body starts here
	frozenAddresses#1238 := frozenAddresses#1238[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#1238[__this])[length#address_t_arr#constr(frozenAddresses#1238[__this]) := 0], length#address_t_arr#constr(frozenAddresses#1238[__this]))];
	frozenAddresses#1238 := frozenAddresses#1238[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#1238[__this])[length#address_t_arr#constr(frozenAddresses#1238[__this]) := address_0x9fd50776F133751E8Ae6abE1Be124638Bb917E05], length#address_t_arr#constr(frozenAddresses#1238[__this]))];
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#1238[__this])) && (length#address_t_arr#constr(frozenAddresses#1238[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	// Implicit assumption that push cannot overflow length.
	assume (length#address_t_arr#constr(frozenAddresses#1238[__this]) < 115792089237316195423570985008687907853269984665640564039457584007913129639935);
	frozenAddresses#1238 := frozenAddresses#1238[__this := address_t_arr#constr(arr#address_t_arr#constr(frozenAddresses#1238[__this]), (length#address_t_arr#constr(frozenAddresses#1238[__this]) + 1))];
	call_arg#44 := 30000000;
	call_arg#45 := 0;
	new_struct_frozenWallet#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	isFrozen#1275 := isFrozen#1275[new_struct_frozenWallet#46 := true];
	rewardedAmount#1277 := rewardedAmount#1277[new_struct_frozenWallet#46 := call_arg#44];
	frozenAmount#1279 := frozenAmount#1279[new_struct_frozenWallet#46 := call_arg#45];
	frozenTime#1281 := frozenTime#1281[new_struct_frozenWallet#46 := (__block_timestamp + 3600)];
	// Deep copy struct frozenWallet
	frozenWallets#1324 := frozenWallets#1324[__this := frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0] := frozenWallet#1282#constr(isFrozen#1275[new_struct_frozenWallet#46], rewardedAmount#1277#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), frozenAmount#1279#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), frozenTime#1281#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]))]];
	frozenWallets#1324 := frozenWallets#1324[__this := frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0] := frozenWallet#1282#constr(isFrozen#1275#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), rewardedAmount#1277[new_struct_frozenWallet#46], frozenAmount#1279#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), frozenTime#1281#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]))]];
	frozenWallets#1324 := frozenWallets#1324[__this := frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0] := frozenWallet#1282#constr(isFrozen#1275#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), rewardedAmount#1277#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), frozenAmount#1279[new_struct_frozenWallet#46], frozenTime#1281#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]))]];
	frozenWallets#1324 := frozenWallets#1324[__this := frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0] := frozenWallet#1282#constr(isFrozen#1275#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), rewardedAmount#1277#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), frozenAmount#1279#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[0]]), frozenTime#1281[new_struct_frozenWallet#46])]];
	// The following while loop was mapped from a for loop
	// Initialization
	i#1364#43 := 0;
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#1238[__this])) && (length#address_t_arr#constr(frozenAddresses#1238[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	while ((i#1364#43 < length#address_t_arr#constr(frozenAddresses#1238[__this]))) {
	// Body
	balanceOf#499 := balanceOf#499[__this := balanceOf#499[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[i#1364#43] := rewardedAmount#1277#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[i#1364#43]])]];
	assume {:sourceloc "buggy_17.sol", 361, 21} {:message ""} true;
	call add#110_ret#49 := add#110(__this, __msg_sender, __msg_value, totalSupply#461[__this], rewardedAmount#1277#frozenWallet#1282#constr(frozenWallets#1324[__this][arr#address_t_arr#constr(frozenAddresses#1238[__this])[i#1364#43]]));
	totalSupply#461 := totalSupply#461[__this := add#110_ret#49];
	$continue47:
	// Loop expression
	tmp#50 := i#1364#43;
	i#1364#43 := (i#1364#43 + 1);
	assume ((0 <= length#address_t_arr#constr(frozenAddresses#1238[__this])) && (length#address_t_arr#constr(frozenAddresses#1238[__this]) <= 115792089237316195423570985008687907853269984665640564039457584007913129639935));
	}

	break48:
	$return42:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 364, 1} {:message "balances_re_ent8"} balances_re_ent8#1406: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_17.sol", 365, 5} {:message "AZT::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1444(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 366, 6} {:message "success"} success#1410: bool;
	var __call_ret#51: bool;
	var __call_ret#52: int_arr_ptr;
	var __send_ret#53: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1406[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1406[__this][__msg_sender])];
	assume {:sourceloc "buggy_17.sol", 366, 23} {:message ""} true;
	call __call_ret#51, __call_ret#52 := __call(__msg_sender, __this, balances_re_ent8#1406[__this][__msg_sender]);
	if (__call_ret#51) {
	havoc lastPlayer_re_ent37#1078;
	havoc jackpot_re_ent37#1080;
	havoc balances_re_ent3#1114;
	havoc lastPlayer_re_ent9#1155;
	havoc jackpot_re_ent9#1157;
	havoc _decimals#1195;
	havoc redeemableEther_re_ent25#1199;
	havoc frozenAddresses#1238;
	havoc userBalance_re_ent19#1242;
	havoc tokenFrozen#1273;
	havoc userBalance_re_ent26#1286;
	havoc frozenWallets#1324;
	havoc balances_re_ent8#1406;
	havoc redeemableEther_re_ent39#1503;
	havoc balances_re_ent36#1589;
	havoc counter_re_ent35#1653;
	havoc userBalance_re_ent40#1738;
	havoc userBalance_re_ent33#1788;
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc userBalance_re_ent12#169;
	havoc owner#200;
	havoc not_called_re_ent20#212;
	havoc redeemableEther_re_ent32#266;
	havoc __balance;
	}

	if (!(__call_ret#51)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1406[__this][__msg_sender])];
	}

	success#1410 := __call_ret#51;
	if (success#1410) {
	assume {:sourceloc "buggy_17.sol", 368, 12} {:message ""} true;
	call __send_ret#53 := __send(__msg_sender, __this, 0, userBalance_re_ent19#1242[__this][__msg_sender]);
	if (!(__send_ret#53)) {
	
	}

	}

	$return43:
	// Function body ends here
}

// 
// Function: _transfer : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "buggy_17.sol", 373, 3} {:message "AZT::_transfer"} _transfer#1499(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1446: address_t, _to#1448: address_t, _value#1450: int)
{
	var checkFrozenWallet#1585_ret#54: bool;
	var sub#82_ret#55: int;
	var add#110_ret#56: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_to#1448 != 0);
	assume {:sourceloc "buggy_17.sol", 375, 13} {:message ""} true;
	call checkFrozenWallet#1585_ret#54 := checkFrozenWallet#1585(__this, __msg_sender, __msg_value, _from#1446, _value#1450);
	assume checkFrozenWallet#1585_ret#54;
	assume {:sourceloc "buggy_17.sol", 376, 24} {:message ""} true;
	call sub#82_ret#55 := sub#82(__this, __msg_sender, __msg_value, balanceOf#499[__this][_from#1446], _value#1450);
	balanceOf#499 := balanceOf#499[__this := balanceOf#499[__this][_from#1446 := sub#82_ret#55]];
	assume {:sourceloc "buggy_17.sol", 377, 22} {:message ""} true;
	call add#110_ret#56 := add#110(__this, __msg_sender, __msg_value, balanceOf#499[__this][_to#1448], _value#1450);
	balanceOf#499 := balanceOf#499[__this := balanceOf#499[__this][_to#1448 := add#110_ret#56]];
	assume {:sourceloc "buggy_17.sol", 378, 10} {:message ""} true;
	call Transfer#586(__this, __msg_sender, __msg_value, _from#1446, _to#1448, _value#1450);
	$return44:
	// Function body ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 380, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1503: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_17.sol", 381, 1} {:message "AZT::claimReward_re_ent39"} claimReward_re_ent39#1539(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 384, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1516: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1503[__this][__msg_sender] > 0);
	transferValue_re_ent39#1516 := redeemableEther_re_ent39#1503[__this][__msg_sender];
	assume {:sourceloc "buggy_17.sol", 385, 8} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1516);
	redeemableEther_re_ent39#1503 := redeemableEther_re_ent39#1503[__this := redeemableEther_re_ent39#1503[__this][__msg_sender := 0]];
	$return45:
	// Function body ends here
}

// 
// Function: checkFrozenWallet : function (address,uint256) view returns (bool)
procedure {:sourceloc "buggy_17.sol", 389, 3} {:message "AZT::checkFrozenWallet"} checkFrozenWallet#1585(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1541: address_t, _value#1543: int)
	returns (#1546: bool)
{
	var sub#82_ret#57: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 395, 8} {:message ""} true;
	call sub#82_ret#57 := sub#82(__this, __msg_sender, __msg_value, balanceOf#499[__this][_from#1541], _value#1543);
	#1546 := ((_from#1541 == owner#200[__this]) || (!(tokenFrozen#1273[__this]) && ((!(isFrozen#1275#frozenWallet#1282#constr(frozenWallets#1324[__this][_from#1541])) || (__block_timestamp >= frozenTime#1281#frozenWallet#1282#constr(frozenWallets#1324[__this][_from#1541]))) || (sub#82_ret#57 >= frozenAmount#1279#frozenWallet#1282#constr(frozenWallets#1324[__this][_from#1541])))));
	goto $return46;
	$return46:
	// Function body ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 398, 1} {:message "balances_re_ent36"} balances_re_ent36#1589: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_17.sol", 399, 5} {:message "AZT::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1612(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#58: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 400, 9} {:message ""} true;
	call __send_ret#58 := __send(__msg_sender, __this, 0, balances_re_ent36#1589[__this][__msg_sender]);
	if (__send_ret#58) {
	balances_re_ent36#1589 := balances_re_ent36#1589[__this := balances_re_ent36#1589[__this][__msg_sender := 0]];
	}

	$return47:
	// Function body ends here
}

// 
// Function: burn : function (uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 405, 3} {:message "AZT::burn"} burn#1650(__this: address_t, __msg_sender: address_t, __msg_value: int, _value#1614: int)
	returns (success#1619: bool)
{
	var sub#82_ret#61: int;
	var sub#82_ret#62: int;
	var call_arg#63: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#200[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 406, 29} {:message ""} true;
	call sub#82_ret#61 := sub#82(__this, __msg_sender, __msg_value, balanceOf#499[__this][__msg_sender], _value#1614);
	balanceOf#499 := balanceOf#499[__this := balanceOf#499[__this][__msg_sender := sub#82_ret#61]];
	assume {:sourceloc "buggy_17.sol", 407, 19} {:message ""} true;
	call sub#82_ret#62 := sub#82(__this, __msg_sender, __msg_value, totalSupply#461[__this], _value#1614);
	totalSupply#461 := totalSupply#461[__this := sub#82_ret#62];
	call_arg#63 := __msg_sender;
	assume {:sourceloc "buggy_17.sol", 408, 10} {:message ""} true;
	call Burn#667(__this, __msg_sender, __msg_value, call_arg#63, _value#1614);
	success#1619 := true;
	goto $return49;
	$return49:
	// Function body ends here
	$return48:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_17.sol", 411, 1} {:message "counter_re_ent35"} counter_re_ent35#1653: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_17.sol", 412, 1} {:message "AZT::callme_re_ent35"} callme_re_ent35#1682(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#64: int;
	var __send_ret#65: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1653[__this] <= 5);
	call_arg#64 := 10000000000000000000;
	assume {:sourceloc "buggy_17.sol", 414, 9} {:message ""} true;
	call __send_ret#65 := __send(__msg_sender, __this, 0, call_arg#64);
	if (!(__send_ret#65)) {
	assume false;
	}

	counter_re_ent35#1653 := counter_re_ent35#1653[__this := (counter_re_ent35#1653[__this] + 1)];
	$return50:
	// Function body ends here
}

// 
// Function: burnFrom : function (address,uint256) returns (bool)
procedure {:sourceloc "buggy_17.sol", 420, 3} {:message "AZT::burnFrom"} burnFrom#1734(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#1684: address_t, _value#1686: int)
	returns (success#1689: bool)
{
	var sub#82_ret#66: int;
	var sub#82_ret#67: int;
	var sub#82_ret#68: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_17.sol", 421, 24} {:message ""} true;
	call sub#82_ret#66 := sub#82(__this, __msg_sender, __msg_value, balanceOf#499[__this][_from#1684], _value#1686);
	balanceOf#499 := balanceOf#499[__this := balanceOf#499[__this][_from#1684 := sub#82_ret#66]];
	assume {:sourceloc "buggy_17.sol", 422, 36} {:message ""} true;
	call sub#82_ret#67 := sub#82(__this, __msg_sender, __msg_value, allowance#548[__this][_from#1684][__msg_sender], _value#1686);
	allowance#548 := allowance#548[__this := allowance#548[__this][_from#1684 := allowance#548[__this][_from#1684][__msg_sender := sub#82_ret#67]]];
	assume {:sourceloc "buggy_17.sol", 423, 19} {:message ""} true;
	call sub#82_ret#68 := sub#82(__this, __msg_sender, __msg_value, totalSupply#461[__this], _value#1686);
	totalSupply#461 := totalSupply#461[__this := sub#82_ret#68];
	assume {:sourceloc "buggy_17.sol", 424, 10} {:message ""} true;
	call Burn#667(__this, __msg_sender, __msg_value, _from#1684, _value#1686);
	success#1689 := true;
	goto $return51;
	$return51:
	// Function body ends here
}

// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 427, 1} {:message "userBalance_re_ent40"} userBalance_re_ent40#1738: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_17.sol", 428, 1} {:message "AZT::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#1772(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 431, 3} {:message "success"} success#1742: bool;
	var __call_ret#69: bool;
	var __call_ret#70: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#1738[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#1738[__this][__msg_sender])];
	assume {:sourceloc "buggy_17.sol", 431, 18} {:message ""} true;
	call __call_ret#69, __call_ret#70 := __call(__msg_sender, __this, userBalance_re_ent40#1738[__this][__msg_sender]);
	if (__call_ret#69) {
	havoc lastPlayer_re_ent37#1078;
	havoc jackpot_re_ent37#1080;
	havoc balances_re_ent3#1114;
	havoc lastPlayer_re_ent9#1155;
	havoc jackpot_re_ent9#1157;
	havoc _decimals#1195;
	havoc redeemableEther_re_ent25#1199;
	havoc frozenAddresses#1238;
	havoc userBalance_re_ent19#1242;
	havoc tokenFrozen#1273;
	havoc userBalance_re_ent26#1286;
	havoc frozenWallets#1324;
	havoc balances_re_ent8#1406;
	havoc redeemableEther_re_ent39#1503;
	havoc balances_re_ent36#1589;
	havoc counter_re_ent35#1653;
	havoc userBalance_re_ent40#1738;
	havoc userBalance_re_ent33#1788;
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc userBalance_re_ent12#169;
	havoc owner#200;
	havoc not_called_re_ent20#212;
	havoc redeemableEther_re_ent32#266;
	havoc __balance;
	}

	if (!(__call_ret#69)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#1738[__this][__msg_sender])];
	}

	success#1742 := __call_ret#69;
	if (!(success#1742)) {
	assume false;
	}

	userBalance_re_ent40#1738 := userBalance_re_ent40#1738[__this := userBalance_re_ent40#1738[__this][__msg_sender := 0]];
	$return52:
	// Function body ends here
}

// 
// Function: freezeToken : function (bool)
procedure {:sourceloc "buggy_17.sol", 438, 3} {:message "AZT::freezeToken"} freezeToken#1784(__this: address_t, __msg_sender: address_t, __msg_value: int, freeze#1774: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	assume (__msg_sender == owner#200[__this]);
	// Function body starts here
	tokenFrozen#1273 := tokenFrozen#1273[__this := freeze#1774];
	$return54:
	// Function body ends here
	$return53:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_17.sol", 441, 1} {:message "userBalance_re_ent33"} userBalance_re_ent33#1788: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_17.sol", 442, 1} {:message "AZT::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#1822(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_17.sol", 445, 3} {:message "success"} success#1792: bool;
	var __call_ret#73: bool;
	var __call_ret#74: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#1788[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#1788[__this][__msg_sender])];
	assume {:sourceloc "buggy_17.sol", 445, 19} {:message ""} true;
	call __call_ret#73, __call_ret#74 := __call(__msg_sender, __this, userBalance_re_ent33#1788[__this][__msg_sender]);
	if (__call_ret#73) {
	havoc lastPlayer_re_ent37#1078;
	havoc jackpot_re_ent37#1080;
	havoc balances_re_ent3#1114;
	havoc lastPlayer_re_ent9#1155;
	havoc jackpot_re_ent9#1157;
	havoc _decimals#1195;
	havoc redeemableEther_re_ent25#1199;
	havoc frozenAddresses#1238;
	havoc userBalance_re_ent19#1242;
	havoc tokenFrozen#1273;
	havoc userBalance_re_ent26#1286;
	havoc frozenWallets#1324;
	havoc balances_re_ent8#1406;
	havoc redeemableEther_re_ent39#1503;
	havoc balances_re_ent36#1589;
	havoc counter_re_ent35#1653;
	havoc userBalance_re_ent40#1738;
	havoc userBalance_re_ent33#1788;
	havoc redeemableEther_re_ent11#322;
	havoc name#360;
	havoc balances_re_ent1#364;
	havoc symbol#395;
	havoc not_called_re_ent41#398;
	havoc decimals#427;
	havoc counter_re_ent42#430;
	havoc totalSupply#461;
	havoc lastPlayer_re_ent2#463;
	havoc jackpot_re_ent2#465;
	havoc balanceOf#499;
	havoc balances_re_ent17#503;
	havoc allowance#548;
	havoc not_called_re_ent27#551;
	havoc balances_re_ent31#590;
	havoc not_called_re_ent13#634;
	havoc balances_re_ent38#693;
	havoc redeemableEther_re_ent4#777;
	havoc counter_re_ent7#835;
	havoc lastPlayer_re_ent23#903;
	havoc jackpot_re_ent23#905;
	havoc counter_re_ent14#966;
	havoc lastPlayer_re_ent30#1036;
	havoc jackpot_re_ent30#1038;
	havoc userBalance_re_ent12#169;
	havoc owner#200;
	havoc not_called_re_ent20#212;
	havoc redeemableEther_re_ent32#266;
	havoc __balance;
	}

	if (!(__call_ret#73)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#1788[__this][__msg_sender])];
	}

	success#1792 := __call_ret#73;
	if (!(success#1792)) {
	assume false;
	}

	userBalance_re_ent33#1788 := userBalance_re_ent33#1788[__this := userBalance_re_ent33#1788[__this][__msg_sender := 0]];
	$return55:
	// Function body ends here
}

