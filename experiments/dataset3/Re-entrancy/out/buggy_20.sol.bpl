// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: buggy_20.sol -------
// Pragma: solidity>=0.7.0
// 
// ------- Contract: Ownable -------
// 
// Event: OwnerChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 50, 3} {:message "[event] Ownable::OwnerChanged"} OwnerChanged#81(__this: address_t, __msg_sender: address_t, __msg_value: int, oldOwner#77: address_t, newOwner#79: address_t)
{
	
}

// 
// State variable: balances_re_ent21: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 32, 3} {:message "balances_re_ent21"} balances_re_ent21#6: [address_t][address_t]int;
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
procedure {:sourceloc "buggy_20.sol", 33, 5} {:message "Ownable::withdraw_balances_re_ent21"} withdraw_balances_re_ent21#35(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 34, 6} {:message "success"} success#10: bool;
	var __call_ret#0: bool;
	var __call_ret#1: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent21#6[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent21#6[__this][__msg_sender])];
	assume {:sourceloc "buggy_20.sol", 34, 22} {:message ""} true;
	call __call_ret#0, __call_ret#1 := __call(__msg_sender, __this, balances_re_ent21#6[__this][__msg_sender]);
	if (__call_ret#0) {
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#0)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent21#6[__this][__msg_sender])];
	}

	success#10 := __call_ret#0;
	if (success#10) {
	balances_re_ent21#6 := balances_re_ent21#6[__this := balances_re_ent21#6[__this][__msg_sender := 0]];
	}

	$return0:
	// Function body ends here
}

// 
// State variable: owner: address
var {:sourceloc "buggy_20.sol", 38, 3} {:message "owner"} owner#37: [address_t]address_t;
// 
// State variable: userBalance_re_ent40: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 40, 3} {:message "userBalance_re_ent40"} userBalance_re_ent40#41: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent40 : function ()
procedure {:sourceloc "buggy_20.sol", 41, 1} {:message "Ownable::withdrawBalance_re_ent40"} withdrawBalance_re_ent40#75(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 44, 3} {:message "success"} success#45: bool;
	var __call_ret#2: bool;
	var __call_ret#3: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent40#41[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent40#41[__this][__msg_sender])];
	assume {:sourceloc "buggy_20.sol", 44, 18} {:message ""} true;
	call __call_ret#2, __call_ret#3 := __call(__msg_sender, __this, userBalance_re_ent40#41[__this][__msg_sender]);
	if (__call_ret#2) {
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#2)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent40#41[__this][__msg_sender])];
	}

	success#45 := __call_ret#2;
	if (!(success#45)) {
	assume false;
	}

	userBalance_re_ent40#41 := userBalance_re_ent40#41[__this := userBalance_re_ent40#41[__this][__msg_sender := 0]];
	$return1:
	// Function body ends here
}

function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 52, 5} {:message "Ownable::[constructor]"} __constructor#201(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	balances_re_ent21#6 := balances_re_ent21#6[__this := default_address_t_int()];
	owner#37 := owner#37[__this := 0];
	userBalance_re_ent40#41 := userBalance_re_ent40#41[__this := default_address_t_int()];
	balances_re_ent17#97 := balances_re_ent17#97[__this := default_address_t_int()];
	lastPlayer_re_ent37#168 := lastPlayer_re_ent37#168[__this := 0];
	jackpot_re_ent37#170 := jackpot_re_ent37#170[__this := 0];
	// Function body starts here
	owner#37 := owner#37[__this := __msg_sender];
	$return2:
	// Function body ends here
}

// 
// State variable: balances_re_ent17: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 55, 1} {:message "balances_re_ent17"} balances_re_ent17#97: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent17 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 56, 1} {:message "Ownable::withdrawFunds_re_ent17"} withdrawFunds_re_ent17#136(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#99: int)
{
	var {:sourceloc "buggy_20.sol", 59, 3} {:message "success"} success#112: bool;
	var __call_ret#4: bool;
	var __call_ret#5: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent17#97[__this][__msg_sender] >= _weiToWithdraw#99);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#99);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#99)];
	assume {:sourceloc "buggy_20.sol", 59, 18} {:message ""} true;
	call __call_ret#4, __call_ret#5 := __call(__msg_sender, __this, _weiToWithdraw#99);
	if (__call_ret#4) {
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#4)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#99)];
	}

	success#112 := __call_ret#4;
	assume success#112;
	balances_re_ent17#97 := balances_re_ent17#97[__this := balances_re_ent17#97[__this][__msg_sender := (balances_re_ent17#97[__this][__msg_sender] - _weiToWithdraw#99)]];
	$return3:
	// Function body ends here
}

// 
// Function: changeOwner
procedure {:sourceloc "buggy_20.sol", 69, 5} {:message "Ownable::changeOwner"} changeOwner#166(__this: address_t, __msg_sender: address_t, __msg_value: int, _newOwner#150: address_t)
{
	var call_arg#7: int_arr_ptr;
	var new_array#8: int_arr_ptr;
	var call_arg#10: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#8 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#7 := new_array#8;
	mem_arr_int := mem_arr_int[call_arg#7 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Function body starts here
	owner#37 := owner#37[__this := _newOwner#150];
	call_arg#10 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 71, 14} {:message ""} true;
	call OwnerChanged#81(__this, __msg_sender, __msg_value, call_arg#10, _newOwner#150);
	$return5:
	// Function body ends here
	$return4:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent37: address payable
var {:sourceloc "buggy_20.sol", 73, 1} {:message "lastPlayer_re_ent37"} lastPlayer_re_ent37#168: [address_t]address_t;
// 
// State variable: jackpot_re_ent37: uint256
var {:sourceloc "buggy_20.sol", 74, 7} {:message "jackpot_re_ent37"} jackpot_re_ent37#170: [address_t]int;
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
// Function: buyTicket_re_ent37 : function ()
procedure {:sourceloc "buggy_20.sol", 75, 4} {:message "Ownable::buyTicket_re_ent37"} buyTicket_re_ent37#200(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#11: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 76, 12} {:message ""} true;
	call __send_ret#11 := __send(lastPlayer_re_ent37#168[__this], __this, 0, jackpot_re_ent37#170[__this]);
	if (!(__send_ret#11)) {
	assume false;
	}

	lastPlayer_re_ent37#168 := lastPlayer_re_ent37#168[__this := __msg_sender];
	jackpot_re_ent37#170 := jackpot_re_ent37#170[__this := __balance[__this]];
	$return6:
	// Function body ends here
}

// 
// ------- Contract: Stoppable -------
// Inherits from: Ownable
// 
// Event: IsActiveChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 111, 3} {:message "[event] Stoppable::IsActiveChanged"} IsActiveChanged#282(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#280: bool)
{
	
}

// 
// State variable: userBalance_re_ent12: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 90, 3} {:message "userBalance_re_ent12"} userBalance_re_ent12#208: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent12 : function ()
procedure {:sourceloc "buggy_20.sol", 91, 1} {:message "Stoppable::withdrawBalance_re_ent12"} withdrawBalance_re_ent12#237(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#12: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 94, 16} {:message ""} true;
	call __send_ret#12 := __send(__msg_sender, __this, 0, userBalance_re_ent12#208[__this][__msg_sender]);
	if (!(__send_ret#12)) {
	assume false;
	}

	userBalance_re_ent12#208 := userBalance_re_ent12#208[__this := userBalance_re_ent12#208[__this][__msg_sender := 0]];
	$return7:
	// Function body ends here
}

// 
// State variable: isActive: bool
var {:sourceloc "buggy_20.sol", 99, 3} {:message "isActive"} isActive#240: [address_t]bool;
// 
// State variable: userBalance_re_ent33: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 101, 3} {:message "userBalance_re_ent33"} userBalance_re_ent33#244: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent33 : function ()
procedure {:sourceloc "buggy_20.sol", 102, 1} {:message "Stoppable::withdrawBalance_re_ent33"} withdrawBalance_re_ent33#278(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 105, 3} {:message "success"} success#248: bool;
	var __call_ret#13: bool;
	var __call_ret#14: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent33#244[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent33#244[__this][__msg_sender])];
	assume {:sourceloc "buggy_20.sol", 105, 19} {:message ""} true;
	call __call_ret#13, __call_ret#14 := __call(__msg_sender, __this, userBalance_re_ent33#244[__this][__msg_sender]);
	if (__call_ret#13) {
	havoc userBalance_re_ent12#208;
	havoc isActive#240;
	havoc userBalance_re_ent33#244;
	havoc balances_re_ent3#316;
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#13)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent33#244[__this][__msg_sender])];
	}

	success#248 := __call_ret#13;
	if (!(success#248)) {
	assume false;
	}

	userBalance_re_ent33#244 := userBalance_re_ent33#244[__this := userBalance_re_ent33#244[__this][__msg_sender := 0]];
	$return8:
	// Function body ends here
}

// 
// Function: setIsActive
procedure {:sourceloc "buggy_20.sol", 118, 5} {:message "Stoppable::setIsActive"} setIsActive#312(__this: address_t, __msg_sender: address_t, __msg_value: int, _isActive#293: bool)
{
	var call_arg#16: int_arr_ptr;
	var new_array#17: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#17 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#16 := new_array#17;
	mem_arr_int := mem_arr_int[call_arg#16 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Function body starts here
	if ((_isActive#293 == isActive#240[__this])) {
	goto $return10;
	}

	isActive#240 := isActive#240[__this := _isActive#293];
	assume {:sourceloc "buggy_20.sol", 121, 14} {:message ""} true;
	call IsActiveChanged#282(__this, __msg_sender, __msg_value, _isActive#293);
	$return10:
	// Function body ends here
	$return9:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent3: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 123, 1} {:message "balances_re_ent3"} balances_re_ent3#316: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent3 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 124, 1} {:message "Stoppable::withdrawFunds_re_ent3"} withdrawFunds_re_ent3#355(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#318: int)
{
	var {:sourceloc "buggy_20.sol", 127, 3} {:message "success"} success#331: bool;
	var __call_ret#19: bool;
	var __call_ret#20: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent3#316[__this][__msg_sender] >= _weiToWithdraw#318);
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= _weiToWithdraw#318);
	__balance := __balance[__this := (__balance[__this] - _weiToWithdraw#318)];
	assume {:sourceloc "buggy_20.sol", 127, 19} {:message ""} true;
	call __call_ret#19, __call_ret#20 := __call(__msg_sender, __this, _weiToWithdraw#318);
	if (__call_ret#19) {
	havoc userBalance_re_ent12#208;
	havoc isActive#240;
	havoc userBalance_re_ent33#244;
	havoc balances_re_ent3#316;
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#19)) {
	__balance := __balance[__this := (__balance[__this] + _weiToWithdraw#318)];
	}

	success#331 := __call_ret#19;
	assume success#331;
	balances_re_ent3#316 := balances_re_ent3#316[__this := balances_re_ent3#316[__this][__msg_sender := (balances_re_ent3#316[__this][__msg_sender] - _weiToWithdraw#318)]];
	$return11:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 88, 1} {:message "Stoppable::[implicit_constructor]"} __constructor#356(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	userBalance_re_ent12#208 := userBalance_re_ent12#208[__this := default_address_t_int()];
	isActive#240 := isActive#240[__this := true];
	userBalance_re_ent33#244 := userBalance_re_ent33#244[__this := default_address_t_int()];
	balances_re_ent3#316 := balances_re_ent3#316[__this := default_address_t_int()];
	balances_re_ent21#6 := balances_re_ent21#6[__this := default_address_t_int()];
	owner#37 := owner#37[__this := 0];
	userBalance_re_ent40#41 := userBalance_re_ent40#41[__this := default_address_t_int()];
	balances_re_ent17#97 := balances_re_ent17#97[__this := default_address_t_int()];
	lastPlayer_re_ent37#168 := lastPlayer_re_ent37#168[__this := 0];
	jackpot_re_ent37#170 := jackpot_re_ent37#170[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#37 := owner#37[__this := __msg_sender];
	$return12:
	// Function body ends here
	// Inlined constructor for Ownable ends here
}

// 
// ------- Contract: RampInstantPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 140, 5} {:message "RampInstantPoolInterface::ASSET_TYPE"} ASSET_TYPE#362(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#360: int);

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 142, 5} {:message "RampInstantPoolInterface::sendFundsToSwap"} sendFundsToSwap#369(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#364: int)
	returns (success#367: bool);

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 138, 1} {:message "RampInstantPoolInterface::[implicit_constructor]"} __constructor#370(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Contract: RampInstantEscrowsPoolInterface -------
// 
// Function: ASSET_TYPE
procedure {:sourceloc "buggy_20.sol", 153, 5} {:message "RampInstantEscrowsPoolInterface::ASSET_TYPE"} ASSET_TYPE#376(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#374: int);
	modifies lastPlayer_re_ent9#391, jackpot_re_ent9#393, redeemableEther_re_ent25#445;

// 
// Function: release
procedure {:sourceloc "buggy_20.sol", 155, 5} {:message "RampInstantEscrowsPoolInterface::release"} release#389(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#378: address_t, _receiver#380: address_t, _oracle#382: address_t, _assetData#384: int_arr_ptr, _paymentDetailsHash#386: int);
	modifies lastPlayer_re_ent9#391, jackpot_re_ent9#393, redeemableEther_re_ent25#445;

// 
// State variable: lastPlayer_re_ent9: address payable
var {:sourceloc "buggy_20.sol", 163, 1} {:message "lastPlayer_re_ent9"} lastPlayer_re_ent9#391: [address_t]address_t;
// 
// State variable: jackpot_re_ent9: uint256
var {:sourceloc "buggy_20.sol", 164, 7} {:message "jackpot_re_ent9"} jackpot_re_ent9#393: [address_t]int;
// 
// Function: buyTicket_re_ent9 : function ()
procedure {:sourceloc "buggy_20.sol", 165, 4} {:message "RampInstantEscrowsPoolInterface::buyTicket_re_ent9"} buyTicket_re_ent9#428(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 166, 10} {:message "success"} success#397: bool;
	var __call_ret#22: bool;
	var __call_ret#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= jackpot_re_ent9#393[__this]);
	__balance := __balance[__this := (__balance[__this] - jackpot_re_ent9#393[__this])];
	assume {:sourceloc "buggy_20.sol", 166, 27} {:message ""} true;
	call __call_ret#22, __call_ret#23 := __call(lastPlayer_re_ent9#391[__this], __this, jackpot_re_ent9#393[__this]);
	if (__call_ret#22) {
	havoc lastPlayer_re_ent9#391;
	havoc jackpot_re_ent9#393;
	havoc redeemableEther_re_ent25#445;
	havoc __balance;
	}

	if (!(__call_ret#22)) {
	__balance := __balance[__this := (__balance[__this] + jackpot_re_ent9#393[__this])];
	}

	success#397 := __call_ret#22;
	if (!(success#397)) {
	assume false;
	}

	lastPlayer_re_ent9#391 := lastPlayer_re_ent9#391[__this := __msg_sender];
	jackpot_re_ent9#393 := jackpot_re_ent9#393[__this := __balance[__this]];
	$return13:
	// Function body ends here
}

// 
// Function: returnFunds
procedure {:sourceloc "buggy_20.sol", 173, 5} {:message "RampInstantEscrowsPoolInterface::returnFunds"} returnFunds#441(__this: address_t, __msg_sender: address_t, __msg_value: int, _pool#430: address_t, _receiver#432: address_t, _oracle#434: address_t, _assetData#436: int_arr_ptr, _paymentDetailsHash#438: int);
	modifies lastPlayer_re_ent9#391, jackpot_re_ent9#393, redeemableEther_re_ent25#445;

// 
// State variable: redeemableEther_re_ent25: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 181, 1} {:message "redeemableEther_re_ent25"} redeemableEther_re_ent25#445: [address_t][address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: claimReward_re_ent25 : function ()
procedure {:sourceloc "buggy_20.sol", 182, 1} {:message "RampInstantEscrowsPoolInterface::claimReward_re_ent25"} claimReward_re_ent25#481(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 185, 9} {:message "transferValue_re_ent25"} transferValue_re_ent25#458: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent25#445[__this][__msg_sender] > 0);
	transferValue_re_ent25#458 := redeemableEther_re_ent25#445[__this][__msg_sender];
	assume {:sourceloc "buggy_20.sol", 186, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent25#458);
	redeemableEther_re_ent25#445 := redeemableEther_re_ent25#445[__this := redeemableEther_re_ent25#445[__this][__msg_sender := 0]];
	$return14:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "buggy_20.sol", 151, 1} {:message "RampInstantEscrowsPoolInterface::[implicit_constructor]"} __constructor#482(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent9#391 := lastPlayer_re_ent9#391[__this := 0];
	jackpot_re_ent9#393 := jackpot_re_ent9#393[__this := 0];
	redeemableEther_re_ent25#445 := redeemableEther_re_ent25#445[__this := default_address_t_int()];
}

// 
// ------- Contract: RampInstantPool -------
// Inherits from: Ownable
// Inherits from: Stoppable
// Inherits from: RampInstantPoolInterface
// 
// Event: ReceivedFunds
procedure {:inline 1} {:sourceloc "buggy_20.sol", 255, 3} {:message "[event] RampInstantPool::ReceivedFunds"} ReceivedFunds#676(__this: address_t, __msg_sender: address_t, __msg_value: int, _from#672: address_t, _amount#674: int)
{
	
}

// 
// Event: LimitsChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 263, 3} {:message "[event] RampInstantPool::LimitsChanged"} LimitsChanged#719(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#715: int, _maxAmount#717: int)
{
	
}

// 
// Event: SwapsContractChanged
procedure {:inline 1} {:sourceloc "buggy_20.sol", 273, 3} {:message "[event] RampInstantPool::SwapsContractChanged"} SwapsContractChanged#760(__this: address_t, __msg_sender: address_t, __msg_value: int, _oldAddress#756: address_t, _newAddress#758: address_t)
{
	
}

// 
// State variable: ASSET_TYPE: uint16
var {:sourceloc "buggy_20.sol", 210, 5} {:message "ASSET_TYPE"} ASSET_TYPE#497: [address_t]int;
// 
// State variable: redeemableEther_re_ent11: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 212, 3} {:message "redeemableEther_re_ent11"} redeemableEther_re_ent11#501: [address_t][address_t]int;
// 
// Function: claimReward_re_ent11 : function ()
procedure {:sourceloc "buggy_20.sol", 213, 1} {:message "RampInstantPool::claimReward_re_ent11"} claimReward_re_ent11#537(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 216, 9} {:message "transferValue_re_ent11"} transferValue_re_ent11#514: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent11#501[__this][__msg_sender] > 0);
	transferValue_re_ent11#514 := redeemableEther_re_ent11#501[__this][__msg_sender];
	assume {:sourceloc "buggy_20.sol", 217, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent11#514);
	redeemableEther_re_ent11#501 := redeemableEther_re_ent11#501[__this := redeemableEther_re_ent11#501[__this][__msg_sender := 0]];
	$return15:
	// Function body ends here
}

// 
// State variable: swapsContract: address payable
var {:sourceloc "buggy_20.sol", 220, 3} {:message "swapsContract"} swapsContract#539: [address_t]address_t;
// 
// State variable: balances_re_ent1: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 221, 3} {:message "balances_re_ent1"} balances_re_ent1#543: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent1 : function ()
procedure {:sourceloc "buggy_20.sol", 222, 5} {:message "RampInstantPool::withdraw_balances_re_ent1"} withdraw_balances_re_ent1#572(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 223, 6} {:message "success"} success#547: bool;
	var __call_ret#24: bool;
	var __call_ret#25: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent1#543[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent1#543[__this][__msg_sender])];
	assume {:sourceloc "buggy_20.sol", 223, 22} {:message ""} true;
	call __call_ret#24, __call_ret#25 := __call(__msg_sender, __this, balances_re_ent1#543[__this][__msg_sender]);
	if (__call_ret#24) {
	havoc ASSET_TYPE#497;
	havoc redeemableEther_re_ent11#501;
	havoc swapsContract#539;
	havoc balances_re_ent1#543;
	havoc minSwapAmount#574;
	havoc not_called_re_ent41#577;
	havoc maxSwapAmount#606;
	havoc counter_re_ent42#609;
	havoc paymentDetailsHash#640;
	havoc not_called_re_ent27#643;
	havoc balances_re_ent31#680;
	havoc not_called_re_ent13#722;
	havoc userBalance_re_ent19#806;
	havoc userBalance_re_ent26#844;
	havoc not_called_re_ent20#890;
	havoc redeemableEther_re_ent32#937;
	havoc balances_re_ent38#1004;
	havoc redeemableEther_re_ent4#1066;
	havoc counter_re_ent7#1141;
	havoc lastPlayer_re_ent23#1203;
	havoc jackpot_re_ent23#1205;
	havoc counter_re_ent14#1247;
	havoc userBalance_re_ent12#208;
	havoc isActive#240;
	havoc userBalance_re_ent33#244;
	havoc balances_re_ent3#316;
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#24)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent1#543[__this][__msg_sender])];
	}

	success#547 := __call_ret#24;
	if (success#547) {
	balances_re_ent1#543 := balances_re_ent1#543[__this := balances_re_ent1#543[__this][__msg_sender := 0]];
	}

	$return16:
	// Function body ends here
}

// 
// State variable: minSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 227, 3} {:message "minSwapAmount"} minSwapAmount#574: [address_t]int;
// 
// State variable: not_called_re_ent41: bool
var {:sourceloc "buggy_20.sol", 228, 3} {:message "not_called_re_ent41"} not_called_re_ent41#577: [address_t]bool;
// 
// Function: bug_re_ent41 : function ()
procedure {:sourceloc "buggy_20.sol", 229, 1} {:message "RampInstantPool::bug_re_ent41"} bug_re_ent41#604(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#26: int;
	var __send_ret#27: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent41#577[__this];
	call_arg#26 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 231, 16} {:message ""} true;
	call __send_ret#27 := __send(__msg_sender, __this, 0, call_arg#26);
	if (!(__send_ret#27)) {
	assume false;
	}

	not_called_re_ent41#577 := not_called_re_ent41#577[__this := false];
	$return17:
	// Function body ends here
}

// 
// State variable: maxSwapAmount: uint256
var {:sourceloc "buggy_20.sol", 236, 3} {:message "maxSwapAmount"} maxSwapAmount#606: [address_t]int;
// 
// State variable: counter_re_ent42: uint256
var {:sourceloc "buggy_20.sol", 237, 3} {:message "counter_re_ent42"} counter_re_ent42#609: [address_t]int;
// 
// Function: callme_re_ent42 : function ()
procedure {:sourceloc "buggy_20.sol", 238, 1} {:message "RampInstantPool::callme_re_ent42"} callme_re_ent42#638(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#28: int;
	var __send_ret#29: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent42#609[__this] <= 5);
	call_arg#28 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 240, 9} {:message ""} true;
	call __send_ret#29 := __send(__msg_sender, __this, 0, call_arg#28);
	if (!(__send_ret#29)) {
	assume false;
	}

	counter_re_ent42#609 := counter_re_ent42#609[__this := (counter_re_ent42#609[__this] + 1)];
	$return18:
	// Function body ends here
}

// 
// State variable: paymentDetailsHash: bytes32
var {:sourceloc "buggy_20.sol", 245, 3} {:message "paymentDetailsHash"} paymentDetailsHash#640: [address_t]int;
// 
// State variable: not_called_re_ent27: bool
var {:sourceloc "buggy_20.sol", 247, 3} {:message "not_called_re_ent27"} not_called_re_ent27#643: [address_t]bool;
// 
// Function: bug_re_ent27 : function ()
procedure {:sourceloc "buggy_20.sol", 248, 1} {:message "RampInstantPool::bug_re_ent27"} bug_re_ent27#670(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#30: int;
	var __send_ret#31: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent27#643[__this];
	call_arg#30 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 250, 16} {:message ""} true;
	call __send_ret#31 := __send(__msg_sender, __this, 0, call_arg#30);
	if (!(__send_ret#31)) {
	assume false;
	}

	not_called_re_ent27#643 := not_called_re_ent27#643[__this := false];
	$return19:
	// Function body ends here
}

// 
// State variable: balances_re_ent31: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 256, 3} {:message "balances_re_ent31"} balances_re_ent31#680: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent31 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 257, 1} {:message "RampInstantPool::withdrawFunds_re_ent31"} withdrawFunds_re_ent31#713(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#682: int)
{
	var __send_ret#32: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent31#680[__this][__msg_sender] >= _weiToWithdraw#682);
	assume {:sourceloc "buggy_20.sol", 260, 13} {:message ""} true;
	call __send_ret#32 := __send(__msg_sender, __this, 0, _weiToWithdraw#682);
	assume __send_ret#32;
	balances_re_ent31#680 := balances_re_ent31#680[__this := balances_re_ent31#680[__this][__msg_sender := (balances_re_ent31#680[__this][__msg_sender] - _weiToWithdraw#682)]];
	$return20:
	// Function body ends here
}

// 
// State variable: not_called_re_ent13: bool
var {:sourceloc "buggy_20.sol", 264, 3} {:message "not_called_re_ent13"} not_called_re_ent13#722: [address_t]bool;
// 
// Function: bug_re_ent13 : function ()
procedure {:sourceloc "buggy_20.sol", 265, 1} {:message "RampInstantPool::bug_re_ent13"} bug_re_ent13#754(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 267, 3} {:message "success"} success#730: bool;
	var __call_ret#33: bool;
	var __call_ret#34: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent13#722[__this];
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= 1000000000000000000);
	__balance := __balance[__this := (__balance[__this] - 1000000000000000000)];
	assume {:sourceloc "buggy_20.sol", 267, 18} {:message ""} true;
	call __call_ret#33, __call_ret#34 := __call(__msg_sender, __this, 1000000000000000000);
	if (__call_ret#33) {
	havoc ASSET_TYPE#497;
	havoc redeemableEther_re_ent11#501;
	havoc swapsContract#539;
	havoc balances_re_ent1#543;
	havoc minSwapAmount#574;
	havoc not_called_re_ent41#577;
	havoc maxSwapAmount#606;
	havoc counter_re_ent42#609;
	havoc paymentDetailsHash#640;
	havoc not_called_re_ent27#643;
	havoc balances_re_ent31#680;
	havoc not_called_re_ent13#722;
	havoc userBalance_re_ent19#806;
	havoc userBalance_re_ent26#844;
	havoc not_called_re_ent20#890;
	havoc redeemableEther_re_ent32#937;
	havoc balances_re_ent38#1004;
	havoc redeemableEther_re_ent4#1066;
	havoc counter_re_ent7#1141;
	havoc lastPlayer_re_ent23#1203;
	havoc jackpot_re_ent23#1205;
	havoc counter_re_ent14#1247;
	havoc userBalance_re_ent12#208;
	havoc isActive#240;
	havoc userBalance_re_ent33#244;
	havoc balances_re_ent3#316;
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#33)) {
	__balance := __balance[__this := (__balance[__this] + 1000000000000000000)];
	}

	success#730 := __call_ret#33;
	if (!(success#730)) {
	assume false;
	}

	not_called_re_ent13#722 := not_called_re_ent13#722[__this := false];
	$return21:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 275, 5} {:message "RampInstantPool::[constructor]"} __constructor#1357(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#762: address_t, _minSwapAmount#764: int, _maxSwapAmount#766: int, _paymentDetailsHash#768: int, _assetType#770: int)
{
	var _minAmount#1307#360: int;
	var _maxAmount#1309#360: int;
	var call_arg#37: int_arr_ptr;
	var new_array#38: int_arr_ptr;
	var call_arg#39: int_arr_ptr;
	var new_array#40: int_arr_ptr;
	var _swapsContract#1329#411: address_t;
	var _assetType#1331#411: int;
	var call_arg#42: int_arr_ptr;
	var new_array#43: int_arr_ptr;
	var ASSET_TYPE#376_ret#44: int;
	var call_arg#45: int_arr_ptr;
	var new_array#46: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	ASSET_TYPE#497 := ASSET_TYPE#497[__this := 0];
	redeemableEther_re_ent11#501 := redeemableEther_re_ent11#501[__this := default_address_t_int()];
	swapsContract#539 := swapsContract#539[__this := 0];
	balances_re_ent1#543 := balances_re_ent1#543[__this := default_address_t_int()];
	minSwapAmount#574 := minSwapAmount#574[__this := 0];
	not_called_re_ent41#577 := not_called_re_ent41#577[__this := true];
	maxSwapAmount#606 := maxSwapAmount#606[__this := 0];
	counter_re_ent42#609 := counter_re_ent42#609[__this := 0];
	paymentDetailsHash#640 := paymentDetailsHash#640[__this := 0];
	not_called_re_ent27#643 := not_called_re_ent27#643[__this := true];
	balances_re_ent31#680 := balances_re_ent31#680[__this := default_address_t_int()];
	not_called_re_ent13#722 := not_called_re_ent13#722[__this := true];
	userBalance_re_ent19#806 := userBalance_re_ent19#806[__this := default_address_t_int()];
	userBalance_re_ent26#844 := userBalance_re_ent26#844[__this := default_address_t_int()];
	not_called_re_ent20#890 := not_called_re_ent20#890[__this := true];
	redeemableEther_re_ent32#937 := redeemableEther_re_ent32#937[__this := default_address_t_int()];
	balances_re_ent38#1004 := balances_re_ent38#1004[__this := default_address_t_int()];
	redeemableEther_re_ent4#1066 := redeemableEther_re_ent4#1066[__this := default_address_t_int()];
	counter_re_ent7#1141 := counter_re_ent7#1141[__this := 0];
	lastPlayer_re_ent23#1203 := lastPlayer_re_ent23#1203[__this := 0];
	jackpot_re_ent23#1205 := jackpot_re_ent23#1205[__this := 0];
	counter_re_ent14#1247 := counter_re_ent14#1247[__this := 0];
	userBalance_re_ent12#208 := userBalance_re_ent12#208[__this := default_address_t_int()];
	isActive#240 := isActive#240[__this := true];
	userBalance_re_ent33#244 := userBalance_re_ent33#244[__this := default_address_t_int()];
	balances_re_ent3#316 := balances_re_ent3#316[__this := default_address_t_int()];
	balances_re_ent21#6 := balances_re_ent21#6[__this := default_address_t_int()];
	owner#37 := owner#37[__this := 0];
	userBalance_re_ent40#41 := userBalance_re_ent40#41[__this := default_address_t_int()];
	balances_re_ent17#97 := balances_re_ent17#97[__this := default_address_t_int()];
	lastPlayer_re_ent37#168 := lastPlayer_re_ent37#168[__this := 0];
	jackpot_re_ent37#170 := jackpot_re_ent37#170[__this := 0];
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#37 := owner#37[__this := __msg_sender];
	$return22:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined modifier validateLimits starts here
	_minAmount#1307#360 := _minSwapAmount#764;
	_maxAmount#1309#360 := _maxSwapAmount#766;
	new_array#38 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#37 := new_array#38;
	mem_arr_int := mem_arr_int[call_arg#37 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#1307#360 <= _maxAmount#1309#360);
	new_array#40 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#39 := new_array#40;
	mem_arr_int := mem_arr_int[call_arg#39 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#1309#360 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#1329#411 := _swapsContract#762;
	_assetType#1331#411 := _assetType#770;
	new_array#43 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#42 := new_array#43;
	mem_arr_int := mem_arr_int[call_arg#42 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#1329#411 != 0);
	assume {:sourceloc "buggy_20.sol", 453, 13} {:message ""} true;
	call ASSET_TYPE#376_ret#44 := ASSET_TYPE#376(_swapsContract#1329#411, __this, 0);
	new_array#46 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#45 := new_array#46;
	mem_arr_int := mem_arr_int[call_arg#45 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#376_ret#44 == _assetType#1331#411);
	// Function body starts here
	swapsContract#539 := swapsContract#539[__this := _swapsContract#762];
	paymentDetailsHash#640 := paymentDetailsHash#640[__this := _paymentDetailsHash#768];
	minSwapAmount#574 := minSwapAmount#574[__this := _minSwapAmount#764];
	maxSwapAmount#606 := maxSwapAmount#606[__this := _maxSwapAmount#766];
	ASSET_TYPE#497 := ASSET_TYPE#497[__this := _assetType#770];
	$return25:
	// Function body ends here
	$return24:
	// Inlined modifier validateSwapsContract ends here
	$return23:
	// Inlined modifier validateLimits ends here
}

// 
// State variable: userBalance_re_ent19: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 292, 1} {:message "userBalance_re_ent19"} userBalance_re_ent19#806: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent19 : function ()
procedure {:sourceloc "buggy_20.sol", 293, 1} {:message "RampInstantPool::withdrawBalance_re_ent19"} withdrawBalance_re_ent19#835(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#48: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 296, 16} {:message ""} true;
	call __send_ret#48 := __send(__msg_sender, __this, 0, userBalance_re_ent19#806[__this][__msg_sender]);
	if (!(__send_ret#48)) {
	assume false;
	}

	userBalance_re_ent19#806 := userBalance_re_ent19#806[__this := userBalance_re_ent19#806[__this][__msg_sender := 0]];
	$return26:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 302, 5} {:message "RampInstantPool::availableFunds"} availableFunds#840(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#838: int);
	modifies ASSET_TYPE#497, redeemableEther_re_ent11#501, swapsContract#539, balances_re_ent1#543, minSwapAmount#574, not_called_re_ent41#577, maxSwapAmount#606, counter_re_ent42#609, paymentDetailsHash#640, not_called_re_ent27#643, balances_re_ent31#680, not_called_re_ent13#722, userBalance_re_ent19#806, userBalance_re_ent26#844, not_called_re_ent20#890, redeemableEther_re_ent32#937, balances_re_ent38#1004, redeemableEther_re_ent4#1066, counter_re_ent7#1141, lastPlayer_re_ent23#1203, jackpot_re_ent23#1205, counter_re_ent14#1247, userBalance_re_ent12#208, isActive#240, userBalance_re_ent33#244, balances_re_ent3#316, balances_re_ent21#6, owner#37, userBalance_re_ent40#41, balances_re_ent17#97, lastPlayer_re_ent37#168, jackpot_re_ent37#170;

// 
// State variable: userBalance_re_ent26: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 303, 1} {:message "userBalance_re_ent26"} userBalance_re_ent26#844: [address_t][address_t]int;
// 
// Function: withdrawBalance_re_ent26 : function ()
procedure {:sourceloc "buggy_20.sol", 304, 1} {:message "RampInstantPool::withdrawBalance_re_ent26"} withdrawBalance_re_ent26#878(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 307, 3} {:message "success"} success#848: bool;
	var __call_ret#49: bool;
	var __call_ret#50: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= userBalance_re_ent26#844[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - userBalance_re_ent26#844[__this][__msg_sender])];
	assume {:sourceloc "buggy_20.sol", 307, 19} {:message ""} true;
	call __call_ret#49, __call_ret#50 := __call(__msg_sender, __this, userBalance_re_ent26#844[__this][__msg_sender]);
	if (__call_ret#49) {
	havoc ASSET_TYPE#497;
	havoc redeemableEther_re_ent11#501;
	havoc swapsContract#539;
	havoc balances_re_ent1#543;
	havoc minSwapAmount#574;
	havoc not_called_re_ent41#577;
	havoc maxSwapAmount#606;
	havoc counter_re_ent42#609;
	havoc paymentDetailsHash#640;
	havoc not_called_re_ent27#643;
	havoc balances_re_ent31#680;
	havoc not_called_re_ent13#722;
	havoc userBalance_re_ent19#806;
	havoc userBalance_re_ent26#844;
	havoc not_called_re_ent20#890;
	havoc redeemableEther_re_ent32#937;
	havoc balances_re_ent38#1004;
	havoc redeemableEther_re_ent4#1066;
	havoc counter_re_ent7#1141;
	havoc lastPlayer_re_ent23#1203;
	havoc jackpot_re_ent23#1205;
	havoc counter_re_ent14#1247;
	havoc userBalance_re_ent12#208;
	havoc isActive#240;
	havoc userBalance_re_ent33#244;
	havoc balances_re_ent3#316;
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#49)) {
	__balance := __balance[__this := (__balance[__this] + userBalance_re_ent26#844[__this][__msg_sender])];
	}

	success#848 := __call_ret#49;
	if (!(success#848)) {
	assume false;
	}

	userBalance_re_ent26#844 := userBalance_re_ent26#844[__this := userBalance_re_ent26#844[__this][__msg_sender := 0]];
	$return27:
	// Function body ends here
}

// 
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 314, 5} {:message "RampInstantPool::withdrawFunds"} withdrawFunds#887(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#880: address_t, _amount#882: int)
	returns (success#885: bool);
	modifies ASSET_TYPE#497, redeemableEther_re_ent11#501, swapsContract#539, balances_re_ent1#543, minSwapAmount#574, not_called_re_ent41#577, maxSwapAmount#606, counter_re_ent42#609, paymentDetailsHash#640, not_called_re_ent27#643, balances_re_ent31#680, not_called_re_ent13#722, userBalance_re_ent19#806, userBalance_re_ent26#844, not_called_re_ent20#890, redeemableEther_re_ent32#937, balances_re_ent38#1004, redeemableEther_re_ent4#1066, counter_re_ent7#1141, lastPlayer_re_ent23#1203, jackpot_re_ent23#1205, counter_re_ent14#1247, userBalance_re_ent12#208, isActive#240, userBalance_re_ent33#244, balances_re_ent3#316, balances_re_ent21#6, owner#37, userBalance_re_ent40#41, balances_re_ent17#97, lastPlayer_re_ent37#168, jackpot_re_ent37#170;

// 
// State variable: not_called_re_ent20: bool
var {:sourceloc "buggy_20.sol", 316, 1} {:message "not_called_re_ent20"} not_called_re_ent20#890: [address_t]bool;
// 
// Function: bug_re_ent20 : function ()
procedure {:sourceloc "buggy_20.sol", 317, 1} {:message "RampInstantPool::bug_re_ent20"} bug_re_ent20#917(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#51: int;
	var __send_ret#52: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume not_called_re_ent20#890[__this];
	call_arg#51 := 1000000000000000000;
	assume {:sourceloc "buggy_20.sol", 319, 16} {:message ""} true;
	call __send_ret#52 := __send(__msg_sender, __this, 0, call_arg#51);
	if (!(__send_ret#52)) {
	assume false;
	}

	not_called_re_ent20#890 := not_called_re_ent20#890[__this := false];
	$return28:
	// Function body ends here
}

// 
// Function: withdrawAllFunds : function (address payable) returns (bool)
procedure {:sourceloc "buggy_20.sol", 325, 5} {:message "RampInstantPool::withdrawAllFunds"} withdrawAllFunds#933(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#919: address_t)
	returns (success#924: bool)
{
	var call_arg#54: int_arr_ptr;
	var new_array#55: int_arr_ptr;
	var availableFunds#840_ret#57: int;
	var withdrawFunds#887_ret#58: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#55 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#54 := new_array#55;
	mem_arr_int := mem_arr_int[call_arg#54 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 326, 35} {:message ""} true;
	call availableFunds#840_ret#57 := availableFunds#840(__this, __msg_sender, __msg_value);
	assume {:sourceloc "buggy_20.sol", 326, 16} {:message ""} true;
	call withdrawFunds#887_ret#58 := withdrawFunds#887(__this, __msg_sender, __msg_value, _to#919, availableFunds#840_ret#57);
	success#924 := withdrawFunds#887_ret#58;
	goto $return30;
	$return30:
	// Function body ends here
	$return29:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent32: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 328, 1} {:message "redeemableEther_re_ent32"} redeemableEther_re_ent32#937: [address_t][address_t]int;
// 
// Function: claimReward_re_ent32 : function ()
procedure {:sourceloc "buggy_20.sol", 329, 1} {:message "RampInstantPool::claimReward_re_ent32"} claimReward_re_ent32#973(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 332, 9} {:message "transferValue_re_ent32"} transferValue_re_ent32#950: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent32#937[__this][__msg_sender] > 0);
	transferValue_re_ent32#950 := redeemableEther_re_ent32#937[__this][__msg_sender];
	assume {:sourceloc "buggy_20.sol", 333, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent32#950);
	redeemableEther_re_ent32#937 := redeemableEther_re_ent32#937[__this := redeemableEther_re_ent32#937[__this][__msg_sender := 0]];
	$return31:
	// Function body ends here
}

// 
// Function: setLimits : function (uint256,uint256)
procedure {:sourceloc "buggy_20.sol", 337, 5} {:message "RampInstantPool::setLimits"} setLimits#1000(__this: address_t, __msg_sender: address_t, __msg_value: int, _minAmount#975: int, _maxAmount#977: int)
{
	var call_arg#60: int_arr_ptr;
	var new_array#61: int_arr_ptr;
	var _minAmount#1307#621: int;
	var _maxAmount#1309#621: int;
	var call_arg#63: int_arr_ptr;
	var new_array#64: int_arr_ptr;
	var call_arg#65: int_arr_ptr;
	var new_array#66: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#61 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#60 := new_array#61;
	mem_arr_int := mem_arr_int[call_arg#60 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Inlined modifier validateLimits starts here
	_minAmount#1307#621 := _minAmount#975;
	_maxAmount#1309#621 := _maxAmount#977;
	new_array#64 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#63 := new_array#64;
	mem_arr_int := mem_arr_int[call_arg#63 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#1307#621 <= _maxAmount#1309#621);
	new_array#66 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#65 := new_array#66;
	mem_arr_int := mem_arr_int[call_arg#65 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#1309#621 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Function body starts here
	minSwapAmount#574 := minSwapAmount#574[__this := _minAmount#975];
	maxSwapAmount#606 := maxSwapAmount#606[__this := _maxAmount#977];
	assume {:sourceloc "buggy_20.sol", 343, 14} {:message ""} true;
	call LimitsChanged#719(__this, __msg_sender, __msg_value, _minAmount#975, _maxAmount#977);
	$return34:
	// Function body ends here
	$return33:
	// Inlined modifier validateLimits ends here
	$return32:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: balances_re_ent38: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 345, 1} {:message "balances_re_ent38"} balances_re_ent38#1004: [address_t][address_t]int;
// 
// Function: withdrawFunds_re_ent38 : function (uint256)
procedure {:sourceloc "buggy_20.sol", 346, 1} {:message "RampInstantPool::withdrawFunds_re_ent38"} withdrawFunds_re_ent38#1037(__this: address_t, __msg_sender: address_t, __msg_value: int, _weiToWithdraw#1006: int)
{
	var __send_ret#68: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (balances_re_ent38#1004[__this][__msg_sender] >= _weiToWithdraw#1006);
	assume {:sourceloc "buggy_20.sol", 349, 13} {:message ""} true;
	call __send_ret#68 := __send(__msg_sender, __this, 0, _weiToWithdraw#1006);
	assume __send_ret#68;
	balances_re_ent38#1004 := balances_re_ent38#1004[__this := balances_re_ent38#1004[__this][__msg_sender := (balances_re_ent38#1004[__this][__msg_sender] - _weiToWithdraw#1006)]];
	$return35:
	// Function body ends here
}

// 
// Function: setSwapsContract : function (address payable)
procedure {:sourceloc "buggy_20.sol", 353, 5} {:message "RampInstantPool::setSwapsContract"} setSwapsContract#1062(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#1039: address_t)
{
	var call_arg#70: int_arr_ptr;
	var new_array#71: int_arr_ptr;
	var _swapsContract#1329#721: address_t;
	var _assetType#1331#721: int;
	var call_arg#73: int_arr_ptr;
	var new_array#74: int_arr_ptr;
	var ASSET_TYPE#376_ret#75: int;
	var call_arg#76: int_arr_ptr;
	var new_array#77: int_arr_ptr;
	var {:sourceloc "buggy_20.sol", 356, 9} {:message "oldSwapsContract"} oldSwapsContract#1049#78: address_t;
	var call_arg#79: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#71 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#70 := new_array#71;
	mem_arr_int := mem_arr_int[call_arg#70 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#1329#721 := _swapsContract#1039;
	_assetType#1331#721 := ASSET_TYPE#497[__this];
	new_array#74 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#73 := new_array#74;
	mem_arr_int := mem_arr_int[call_arg#73 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#1329#721 != 0);
	assume {:sourceloc "buggy_20.sol", 453, 13} {:message ""} true;
	call ASSET_TYPE#376_ret#75 := ASSET_TYPE#376(_swapsContract#1329#721, __this, 0);
	new_array#77 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#76 := new_array#77;
	mem_arr_int := mem_arr_int[call_arg#76 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#376_ret#75 == _assetType#1331#721);
	// Function body starts here
	oldSwapsContract#1049#78 := swapsContract#539[__this];
	swapsContract#539 := swapsContract#539[__this := _swapsContract#1039];
	call_arg#79 := _swapsContract#1039;
	assume {:sourceloc "buggy_20.sol", 358, 14} {:message ""} true;
	call SwapsContractChanged#760(__this, __msg_sender, __msg_value, oldSwapsContract#1049#78, call_arg#79);
	$return38:
	// Function body ends here
	$return37:
	// Inlined modifier validateSwapsContract ends here
	$return36:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent4: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 360, 1} {:message "redeemableEther_re_ent4"} redeemableEther_re_ent4#1066: [address_t][address_t]int;
// 
// Function: claimReward_re_ent4 : function ()
procedure {:sourceloc "buggy_20.sol", 361, 1} {:message "RampInstantPool::claimReward_re_ent4"} claimReward_re_ent4#1102(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 364, 9} {:message "transferValue_re_ent4"} transferValue_re_ent4#1079: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent4#1066[__this][__msg_sender] > 0);
	transferValue_re_ent4#1079 := redeemableEther_re_ent4#1066[__this][__msg_sender];
	assume {:sourceloc "buggy_20.sol", 365, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent4#1079);
	redeemableEther_re_ent4#1066 := redeemableEther_re_ent4#1066[__this := redeemableEther_re_ent4#1066[__this][__msg_sender := 0]];
	$return39:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 369, 5} {:message "RampInstantPool::sendFundsToSwap"} sendFundsToSwap#1110(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#1104: int)
	returns (success#1108: bool);
	modifies ASSET_TYPE#497, redeemableEther_re_ent11#501, swapsContract#539, balances_re_ent1#543, minSwapAmount#574, not_called_re_ent41#577, maxSwapAmount#606, counter_re_ent42#609, paymentDetailsHash#640, not_called_re_ent27#643, balances_re_ent31#680, not_called_re_ent13#722, userBalance_re_ent19#806, userBalance_re_ent26#844, not_called_re_ent20#890, redeemableEther_re_ent32#937, balances_re_ent38#1004, redeemableEther_re_ent4#1066, counter_re_ent7#1141, lastPlayer_re_ent23#1203, jackpot_re_ent23#1205, counter_re_ent14#1247, userBalance_re_ent12#208, isActive#240, userBalance_re_ent33#244, balances_re_ent3#316, balances_re_ent21#6, owner#37, userBalance_re_ent40#41, balances_re_ent17#97, lastPlayer_re_ent37#168, jackpot_re_ent37#170;

// 
// Function: releaseSwap
procedure {:sourceloc "buggy_20.sol", 372, 5} {:message "RampInstantPool::releaseSwap"} releaseSwap#1138(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#1112: address_t, _oracle#1114: address_t, _assetData#1116: int_arr_ptr, _paymentDetailsHash#1118: int)
{
	var call_arg#81: int_arr_ptr;
	var new_array#82: int_arr_ptr;
	var call_arg#84: address_t;
	var call_arg#85: int_arr_ptr;
	var new_array#86: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#82 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#81 := new_array#82;
	mem_arr_int := mem_arr_int[call_arg#81 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Function body starts here
	call_arg#84 := __this;
	new_array#86 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#85 := new_array#86;
	mem_arr_int := mem_arr_int[call_arg#85 := mem_arr_int[_assetData#1116]];
	assume {:sourceloc "buggy_20.sol", 378, 9} {:message ""} true;
	call release#389(swapsContract#539[__this], __this, 0, call_arg#84, _receiver#1112, _oracle#1114, call_arg#85, _paymentDetailsHash#1118);
	$return41:
	// Function body ends here
	$return40:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: counter_re_ent7: uint256
var {:sourceloc "buggy_20.sol", 386, 1} {:message "counter_re_ent7"} counter_re_ent7#1141: [address_t]int;
// 
// Function: callme_re_ent7 : function ()
procedure {:sourceloc "buggy_20.sol", 387, 1} {:message "RampInstantPool::callme_re_ent7"} callme_re_ent7#1170(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#87: int;
	var __send_ret#88: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent7#1141[__this] <= 5);
	call_arg#87 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 389, 9} {:message ""} true;
	call __send_ret#88 := __send(__msg_sender, __this, 0, call_arg#87);
	if (!(__send_ret#88)) {
	assume false;
	}

	counter_re_ent7#1141 := counter_re_ent7#1141[__this := (counter_re_ent7#1141[__this] + 1)];
	$return42:
	// Function body ends here
}

// 
// Function: returnSwap
procedure {:sourceloc "buggy_20.sol", 395, 5} {:message "RampInstantPool::returnSwap"} returnSwap#1201(__this: address_t, __msg_sender: address_t, __msg_value: int, _receiver#1172: address_t, _oracle#1174: address_t, _assetData#1176: int_arr_ptr, _paymentDetailsHash#1178: int)
{
	var call_arg#90: int_arr_ptr;
	var new_array#91: int_arr_ptr;
	var call_arg#93: int_arr_ptr;
	var new_array#94: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#91 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#90 := new_array#91;
	mem_arr_int := mem_arr_int[call_arg#90 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Function body starts here
	new_array#94 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#93 := new_array#94;
	mem_arr_int := mem_arr_int[call_arg#93 := mem_arr_int[_assetData#1176]];
	assume {:sourceloc "buggy_20.sol", 401, 9} {:message ""} true;
	call returnFunds#441(swapsContract#539[__this], __this, 0, __this, _receiver#1172, _oracle#1174, call_arg#93, _paymentDetailsHash#1178);
	$return44:
	// Function body ends here
	$return43:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: lastPlayer_re_ent23: address payable
var {:sourceloc "buggy_20.sol", 409, 1} {:message "lastPlayer_re_ent23"} lastPlayer_re_ent23#1203: [address_t]address_t;
// 
// State variable: jackpot_re_ent23: uint256
var {:sourceloc "buggy_20.sol", 410, 7} {:message "jackpot_re_ent23"} jackpot_re_ent23#1205: [address_t]int;
// 
// Function: buyTicket_re_ent23 : function ()
procedure {:sourceloc "buggy_20.sol", 411, 4} {:message "RampInstantPool::buyTicket_re_ent23"} buyTicket_re_ent23#1235(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#95: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 412, 12} {:message ""} true;
	call __send_ret#95 := __send(lastPlayer_re_ent23#1203[__this], __this, 0, jackpot_re_ent23#1205[__this]);
	if (!(__send_ret#95)) {
	assume false;
	}

	lastPlayer_re_ent23#1203 := lastPlayer_re_ent23#1203[__this := __msg_sender];
	jackpot_re_ent23#1205 := jackpot_re_ent23#1205[__this := __balance[__this]];
	$return45:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 422, 5} {:message "RampInstantPool::[receive]"} #1244(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#96: int_arr_ptr;
	var new_array#97: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	new_array#97 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#96 := new_array#97;
	mem_arr_int := mem_arr_int[call_arg#96 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 105][3 := 115][4 := 32][5 := 112][6 := 111][7 := 111][8 := 108][9 := 32][10 := 99][11 := 97][12 := 110][13 := 110][14 := 111][15 := 116][16 := 32][17 := 114][18 := 101][19 := 99][20 := 101][21 := 105][22 := 118][23 := 101][24 := 32][25 := 101][26 := 116][27 := 104][28 := 101][29 := 114], 30)];
	assume false;
	$return46:
	// Function body ends here
}

// 
// State variable: counter_re_ent14: uint256
var {:sourceloc "buggy_20.sol", 425, 1} {:message "counter_re_ent14"} counter_re_ent14#1247: [address_t]int;
// 
// Function: callme_re_ent14 : function ()
procedure {:sourceloc "buggy_20.sol", 426, 1} {:message "RampInstantPool::callme_re_ent14"} callme_re_ent14#1276(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#98: int;
	var __send_ret#99: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent14#1247[__this] <= 5);
	call_arg#98 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 428, 9} {:message ""} true;
	call __send_ret#99 := __send(__msg_sender, __this, 0, call_arg#98);
	if (!(__send_ret#99)) {
	assume false;
	}

	counter_re_ent14#1247 := counter_re_ent14#1247[__this := (counter_re_ent14#1247[__this] + 1)];
	$return47:
	// Function body ends here
}

// 
// ------- Contract: RampInstantEthPool -------
// Inherits from: RampInstantPool
// 
// State variable: lastPlayer_re_ent2: address payable
var {:sourceloc "buggy_20.sol", 468, 3} {:message "lastPlayer_re_ent2"} lastPlayer_re_ent2#1362: [address_t]address_t;
// 
// State variable: jackpot_re_ent2: uint256
var {:sourceloc "buggy_20.sol", 469, 7} {:message "jackpot_re_ent2"} jackpot_re_ent2#1364: [address_t]int;
// 
// Function: buyTicket_re_ent2 : function ()
procedure {:sourceloc "buggy_20.sol", 470, 4} {:message "RampInstantEthPool::buyTicket_re_ent2"} buyTicket_re_ent2#1394(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#100: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 471, 12} {:message ""} true;
	call __send_ret#100 := __send(lastPlayer_re_ent2#1362[__this], __this, 0, jackpot_re_ent2#1364[__this]);
	if (!(__send_ret#100)) {
	assume false;
	}

	lastPlayer_re_ent2#1362 := lastPlayer_re_ent2#1362[__this := __msg_sender];
	jackpot_re_ent2#1364 := jackpot_re_ent2#1364[__this := __balance[__this]];
	$return48:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 478, 5} {:message "RampInstantEthPool::[constructor]"} __constructor#1660(__this: address_t, __msg_sender: address_t, __msg_value: int, _swapsContract#1399: address_t, _minSwapAmount#1401: int, _maxSwapAmount#1403: int, _paymentDetailsHash#1405: int)
{
	var _swapsContract#762#101: address_t;
	var _minSwapAmount#764#101: int;
	var _maxSwapAmount#766#101: int;
	var _paymentDetailsHash#768#101: int;
	var _assetType#770#101: int;
	var _minAmount#1307#1030: int;
	var _maxAmount#1309#1030: int;
	var call_arg#104: int_arr_ptr;
	var new_array#105: int_arr_ptr;
	var call_arg#106: int_arr_ptr;
	var new_array#107: int_arr_ptr;
	var _swapsContract#1329#1081: address_t;
	var _assetType#1331#1081: int;
	var call_arg#109: int_arr_ptr;
	var new_array#110: int_arr_ptr;
	var ASSET_TYPE#376_ret#111: int;
	var call_arg#112: int_arr_ptr;
	var new_array#113: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	lastPlayer_re_ent2#1362 := lastPlayer_re_ent2#1362[__this := 0];
	jackpot_re_ent2#1364 := jackpot_re_ent2#1364[__this := 0];
	lastPlayer_re_ent30#1418 := lastPlayer_re_ent30#1418[__this := 0];
	jackpot_re_ent30#1420 := jackpot_re_ent30#1420[__this := 0];
	balances_re_ent8#1467 := balances_re_ent8#1467[__this := default_address_t_int()];
	redeemableEther_re_ent39#1521 := redeemableEther_re_ent39#1521[__this := default_address_t_int()];
	balances_re_ent36#1585 := balances_re_ent36#1585[__this := default_address_t_int()];
	counter_re_ent35#1630 := counter_re_ent35#1630[__this := 0];
	ASSET_TYPE#497 := ASSET_TYPE#497[__this := 0];
	redeemableEther_re_ent11#501 := redeemableEther_re_ent11#501[__this := default_address_t_int()];
	swapsContract#539 := swapsContract#539[__this := 0];
	balances_re_ent1#543 := balances_re_ent1#543[__this := default_address_t_int()];
	minSwapAmount#574 := minSwapAmount#574[__this := 0];
	not_called_re_ent41#577 := not_called_re_ent41#577[__this := true];
	maxSwapAmount#606 := maxSwapAmount#606[__this := 0];
	counter_re_ent42#609 := counter_re_ent42#609[__this := 0];
	paymentDetailsHash#640 := paymentDetailsHash#640[__this := 0];
	not_called_re_ent27#643 := not_called_re_ent27#643[__this := true];
	balances_re_ent31#680 := balances_re_ent31#680[__this := default_address_t_int()];
	not_called_re_ent13#722 := not_called_re_ent13#722[__this := true];
	userBalance_re_ent19#806 := userBalance_re_ent19#806[__this := default_address_t_int()];
	userBalance_re_ent26#844 := userBalance_re_ent26#844[__this := default_address_t_int()];
	not_called_re_ent20#890 := not_called_re_ent20#890[__this := true];
	redeemableEther_re_ent32#937 := redeemableEther_re_ent32#937[__this := default_address_t_int()];
	balances_re_ent38#1004 := balances_re_ent38#1004[__this := default_address_t_int()];
	redeemableEther_re_ent4#1066 := redeemableEther_re_ent4#1066[__this := default_address_t_int()];
	counter_re_ent7#1141 := counter_re_ent7#1141[__this := 0];
	lastPlayer_re_ent23#1203 := lastPlayer_re_ent23#1203[__this := 0];
	jackpot_re_ent23#1205 := jackpot_re_ent23#1205[__this := 0];
	counter_re_ent14#1247 := counter_re_ent14#1247[__this := 0];
	userBalance_re_ent12#208 := userBalance_re_ent12#208[__this := default_address_t_int()];
	isActive#240 := isActive#240[__this := true];
	userBalance_re_ent33#244 := userBalance_re_ent33#244[__this := default_address_t_int()];
	balances_re_ent3#316 := balances_re_ent3#316[__this := default_address_t_int()];
	balances_re_ent21#6 := balances_re_ent21#6[__this := default_address_t_int()];
	owner#37 := owner#37[__this := 0];
	userBalance_re_ent40#41 := userBalance_re_ent40#41[__this := default_address_t_int()];
	balances_re_ent17#97 := balances_re_ent17#97[__this := default_address_t_int()];
	lastPlayer_re_ent37#168 := lastPlayer_re_ent37#168[__this := 0];
	jackpot_re_ent37#170 := jackpot_re_ent37#170[__this := 0];
	// Arguments for RampInstantPool
	_swapsContract#762#101 := _swapsContract#1399;
	_minSwapAmount#764#101 := _minSwapAmount#1401;
	_maxSwapAmount#766#101 := _maxSwapAmount#1403;
	_paymentDetailsHash#768#101 := _paymentDetailsHash#1405;
	_assetType#770#101 := 1;
	// Arguments for Ownable
	// Inlined constructor for Ownable starts here
	// Function body starts here
	owner#37 := owner#37[__this := __msg_sender];
	$return49:
	// Function body ends here
	// Inlined constructor for Ownable ends here
	// Inlined constructor for RampInstantPool starts here
	// Inlined modifier validateLimits starts here
	_minAmount#1307#1030 := _minSwapAmount#764#101;
	_maxAmount#1309#1030 := _maxSwapAmount#766#101;
	new_array#105 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#104 := new_array#105;
	mem_arr_int := mem_arr_int[call_arg#104 := int_arr#constr(default_int_int()[0 := 109][1 := 105][2 := 110][3 := 32][4 := 108][5 := 105][6 := 109][7 := 105][8 := 116][9 := 32][10 := 111][11 := 118][12 := 101][13 := 114][14 := 32][15 := 109][16 := 97][17 := 120][18 := 32][19 := 108][20 := 105][21 := 109][22 := 105][23 := 116], 24)];
	assume (_minAmount#1307#1030 <= _maxAmount#1309#1030);
	new_array#107 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#106 := new_array#107;
	mem_arr_int := mem_arr_int[call_arg#106 := int_arr#constr(default_int_int()[0 := 109][1 := 97][2 := 120][3 := 65][4 := 109][5 := 111][6 := 117][7 := 110][8 := 116][9 := 32][10 := 116][11 := 111][12 := 111][13 := 32][14 := 104][15 := 105][16 := 103][17 := 104], 18)];
	assume (_maxAmount#1309#1030 <= 1766847064778384329583297500742918515827483896875618958121606201292619776);
	// Inlined modifier validateSwapsContract starts here
	_swapsContract#1329#1081 := _swapsContract#762#101;
	_assetType#1331#1081 := _assetType#770#101;
	new_array#110 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#109 := new_array#110;
	mem_arr_int := mem_arr_int[call_arg#109 := int_arr#constr(default_int_int()[0 := 110][1 := 117][2 := 108][3 := 108][4 := 32][5 := 115][6 := 119][7 := 97][8 := 112][9 := 115][10 := 32][11 := 99][12 := 111][13 := 110][14 := 116][15 := 114][16 := 97][17 := 99][18 := 116][19 := 32][20 := 97][21 := 100][22 := 100][23 := 114][24 := 101][25 := 115][26 := 115], 27)];
	assume (_swapsContract#1329#1081 != 0);
	assume {:sourceloc "buggy_20.sol", 453, 13} {:message ""} true;
	call ASSET_TYPE#376_ret#111 := ASSET_TYPE#376(_swapsContract#1329#1081, __this, 0);
	new_array#113 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#112 := new_array#113;
	mem_arr_int := mem_arr_int[call_arg#112 := int_arr#constr(default_int_int()[0 := 112][1 := 111][2 := 111][3 := 108][4 := 32][5 := 97][6 := 115][7 := 115][8 := 101][9 := 116][10 := 32][11 := 116][12 := 121][13 := 112][14 := 101][15 := 32][16 := 100][17 := 111][18 := 101][19 := 115][20 := 110][21 := 39][22 := 116][23 := 32][24 := 109][25 := 97][26 := 116][27 := 99][28 := 104][29 := 32][30 := 115][31 := 119][32 := 97][33 := 112][34 := 32][35 := 99][36 := 111][37 := 110][38 := 116][39 := 114][40 := 97][41 := 99][42 := 116], 43)];
	assume (ASSET_TYPE#376_ret#111 == _assetType#1331#1081);
	// Function body starts here
	swapsContract#539 := swapsContract#539[__this := _swapsContract#762#101];
	paymentDetailsHash#640 := paymentDetailsHash#640[__this := _paymentDetailsHash#768#101];
	minSwapAmount#574 := minSwapAmount#574[__this := _minSwapAmount#764#101];
	maxSwapAmount#606 := maxSwapAmount#606[__this := _maxSwapAmount#766#101];
	ASSET_TYPE#497 := ASSET_TYPE#497[__this := _assetType#770#101];
	$return52:
	// Function body ends here
	$return51:
	// Inlined modifier validateSwapsContract ends here
	$return50:
	// Inlined modifier validateLimits ends here
	// Inlined constructor for RampInstantPool ends here
	// Function body starts here
	$return53:
	// Function body ends here
}

// 
// State variable: lastPlayer_re_ent30: address payable
var {:sourceloc "buggy_20.sol", 489, 1} {:message "lastPlayer_re_ent30"} lastPlayer_re_ent30#1418: [address_t]address_t;
// 
// State variable: jackpot_re_ent30: uint256
var {:sourceloc "buggy_20.sol", 490, 7} {:message "jackpot_re_ent30"} jackpot_re_ent30#1420: [address_t]int;
// 
// Function: buyTicket_re_ent30 : function ()
procedure {:sourceloc "buggy_20.sol", 491, 4} {:message "RampInstantEthPool::buyTicket_re_ent30"} buyTicket_re_ent30#1450(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#116: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 492, 12} {:message ""} true;
	call __send_ret#116 := __send(lastPlayer_re_ent30#1418[__this], __this, 0, jackpot_re_ent30#1420[__this]);
	if (!(__send_ret#116)) {
	assume false;
	}

	lastPlayer_re_ent30#1418 := lastPlayer_re_ent30#1418[__this := __msg_sender];
	jackpot_re_ent30#1420 := jackpot_re_ent30#1420[__this := __balance[__this]];
	$return54:
	// Function body ends here
}

// 
// Function: availableFunds : function () view returns (uint256)
procedure {:sourceloc "buggy_20.sol", 498, 5} {:message "RampInstantEthPool::availableFunds"} availableFunds#1463(__this: address_t, __msg_sender: address_t, __msg_value: int)
	returns (#1454: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#1454 := __balance[__this];
	goto $return55;
	$return55:
	// Function body ends here
}

// 
// State variable: balances_re_ent8: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 501, 1} {:message "balances_re_ent8"} balances_re_ent8#1467: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent8 : function ()
procedure {:sourceloc "buggy_20.sol", 502, 5} {:message "RampInstantEthPool::withdraw_balances_re_ent8"} withdraw_balances_re_ent8#1496(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 503, 6} {:message "success"} success#1471: bool;
	var __call_ret#117: bool;
	var __call_ret#118: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	// Implicit assumption that we have enough ether
	assume (__balance[__this] >= balances_re_ent8#1467[__this][__msg_sender]);
	__balance := __balance[__this := (__balance[__this] - balances_re_ent8#1467[__this][__msg_sender])];
	assume {:sourceloc "buggy_20.sol", 503, 23} {:message ""} true;
	call __call_ret#117, __call_ret#118 := __call(__msg_sender, __this, balances_re_ent8#1467[__this][__msg_sender]);
	if (__call_ret#117) {
	havoc lastPlayer_re_ent2#1362;
	havoc jackpot_re_ent2#1364;
	havoc lastPlayer_re_ent30#1418;
	havoc jackpot_re_ent30#1420;
	havoc balances_re_ent8#1467;
	havoc redeemableEther_re_ent39#1521;
	havoc balances_re_ent36#1585;
	havoc counter_re_ent35#1630;
	havoc ASSET_TYPE#497;
	havoc redeemableEther_re_ent11#501;
	havoc swapsContract#539;
	havoc balances_re_ent1#543;
	havoc minSwapAmount#574;
	havoc not_called_re_ent41#577;
	havoc maxSwapAmount#606;
	havoc counter_re_ent42#609;
	havoc paymentDetailsHash#640;
	havoc not_called_re_ent27#643;
	havoc balances_re_ent31#680;
	havoc not_called_re_ent13#722;
	havoc userBalance_re_ent19#806;
	havoc userBalance_re_ent26#844;
	havoc not_called_re_ent20#890;
	havoc redeemableEther_re_ent32#937;
	havoc balances_re_ent38#1004;
	havoc redeemableEther_re_ent4#1066;
	havoc counter_re_ent7#1141;
	havoc lastPlayer_re_ent23#1203;
	havoc jackpot_re_ent23#1205;
	havoc counter_re_ent14#1247;
	havoc userBalance_re_ent12#208;
	havoc isActive#240;
	havoc userBalance_re_ent33#244;
	havoc balances_re_ent3#316;
	havoc balances_re_ent21#6;
	havoc owner#37;
	havoc userBalance_re_ent40#41;
	havoc balances_re_ent17#97;
	havoc lastPlayer_re_ent37#168;
	havoc jackpot_re_ent37#170;
	havoc __balance;
	}

	if (!(__call_ret#117)) {
	__balance := __balance[__this := (__balance[__this] + balances_re_ent8#1467[__this][__msg_sender])];
	}

	success#1471 := __call_ret#117;
	if (success#1471) {
	balances_re_ent8#1467 := balances_re_ent8#1467[__this := balances_re_ent8#1467[__this][__msg_sender := 0]];
	}

	$return56:
	// Function body ends here
}

// 
// Function: withdrawFunds : function (address payable,uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 508, 5} {:message "RampInstantEthPool::withdrawFunds"} withdrawFunds#1517(__this: address_t, __msg_sender: address_t, __msg_value: int, _to#1498: address_t, _amount#1500: int)
	returns (success#1506: bool)
{
	var call_arg#120: int_arr_ptr;
	var new_array#121: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyOwner starts here
	new_array#121 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#120 := new_array#121;
	mem_arr_int := mem_arr_int[call_arg#120 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 111][10 := 119][11 := 110][12 := 101][13 := 114][14 := 32][15 := 99][16 := 97][17 := 110][18 := 32][19 := 99][20 := 97][21 := 108][22 := 108][23 := 32][24 := 116][25 := 104][26 := 105][27 := 115], 28)];
	assume (__msg_sender == owner#37[__this]);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 512, 9} {:message ""} true;
	call __transfer(_to#1498, __this, 0, _amount#1500);
	success#1506 := true;
	goto $return58;
	$return58:
	// Function body ends here
	$return57:
	// Inlined modifier onlyOwner ends here
}

// 
// State variable: redeemableEther_re_ent39: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 515, 1} {:message "redeemableEther_re_ent39"} redeemableEther_re_ent39#1521: [address_t][address_t]int;
// 
// Function: claimReward_re_ent39 : function ()
procedure {:sourceloc "buggy_20.sol", 516, 1} {:message "RampInstantEthPool::claimReward_re_ent39"} claimReward_re_ent39#1557(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var {:sourceloc "buggy_20.sol", 519, 9} {:message "transferValue_re_ent39"} transferValue_re_ent39#1534: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (redeemableEther_re_ent39#1521[__this][__msg_sender] > 0);
	transferValue_re_ent39#1534 := redeemableEther_re_ent39#1521[__this][__msg_sender];
	assume {:sourceloc "buggy_20.sol", 520, 9} {:message ""} true;
	call __transfer(__msg_sender, __this, 0, transferValue_re_ent39#1534);
	redeemableEther_re_ent39#1521 := redeemableEther_re_ent39#1521[__this := redeemableEther_re_ent39#1521[__this][__msg_sender := 0]];
	$return59:
	// Function body ends here
}

// 
// Function: sendFundsToSwap : function (uint256) returns (bool)
procedure {:sourceloc "buggy_20.sol", 524, 5} {:message "RampInstantEthPool::sendFundsToSwap"} sendFundsToSwap#1581(__this: address_t, __msg_sender: address_t, __msg_value: int, _amount#1559: int)
	returns (success#1570: bool)
{
	var call_arg#124: int_arr_ptr;
	var new_array#125: int_arr_ptr;
	var call_arg#127: int_arr_ptr;
	var new_array#128: int_arr_ptr;
	var _amount#1290#1292: int;
	var call_arg#130: int_arr_ptr;
	var new_array#131: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Inlined modifier onlyActive starts here
	new_array#125 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#124 := new_array#125;
	mem_arr_int := mem_arr_int[call_arg#124 := int_arr#constr(default_int_int()[0 := 99][1 := 111][2 := 110][3 := 116][4 := 114][5 := 97][6 := 99][7 := 116][8 := 32][9 := 105][10 := 115][11 := 32][12 := 115][13 := 116][14 := 111][15 := 112][16 := 112][17 := 101][18 := 100], 19)];
	assume isActive#240[__this];
	// Inlined modifier onlySwapsContract starts here
	new_array#128 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#127 := new_array#128;
	mem_arr_int := mem_arr_int[call_arg#127 := int_arr#constr(default_int_int()[0 := 111][1 := 110][2 := 108][3 := 121][4 := 32][5 := 116][6 := 104][7 := 101][8 := 32][9 := 115][10 := 119][11 := 97][12 := 112][13 := 115][14 := 32][15 := 99][16 := 111][17 := 110][18 := 116][19 := 114][20 := 97][21 := 99][22 := 116][23 := 32][24 := 99][25 := 97][26 := 110][27 := 32][28 := 99][29 := 97][30 := 108][31 := 108][32 := 32][33 := 116][34 := 104][35 := 105][36 := 115], 37)];
	assume (__msg_sender == swapsContract#539[__this]);
	// Inlined modifier isWithinLimits starts here
	_amount#1290#1292 := _amount#1559;
	new_array#131 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#130 := new_array#131;
	mem_arr_int := mem_arr_int[call_arg#130 := int_arr#constr(default_int_int()[0 := 97][1 := 109][2 := 111][3 := 117][4 := 110][5 := 116][6 := 32][7 := 111][8 := 117][9 := 116][10 := 115][11 := 105][12 := 100][13 := 101][14 := 32][15 := 115][16 := 119][17 := 97][18 := 112][19 := 32][20 := 108][21 := 105][22 := 109][23 := 105][24 := 116][25 := 115], 26)];
	assume ((_amount#1290#1292 >= minSwapAmount#574[__this]) && (_amount#1290#1292 <= maxSwapAmount#606[__this]));
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 527, 9} {:message ""} true;
	call __transfer(swapsContract#539[__this], __this, 0, _amount#1559);
	success#1570 := true;
	goto $return63;
	$return63:
	// Function body ends here
	$return62:
	// Inlined modifier isWithinLimits ends here
	$return61:
	// Inlined modifier onlySwapsContract ends here
	$return60:
	// Inlined modifier onlyActive ends here
}

// 
// State variable: balances_re_ent36: mapping(address => uint256)
var {:sourceloc "buggy_20.sol", 530, 1} {:message "balances_re_ent36"} balances_re_ent36#1585: [address_t][address_t]int;
// 
// Function: withdraw_balances_re_ent36 : function ()
procedure {:sourceloc "buggy_20.sol", 531, 5} {:message "RampInstantEthPool::withdraw_balances_re_ent36"} withdraw_balances_re_ent36#1608(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var __send_ret#133: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume {:sourceloc "buggy_20.sol", 532, 9} {:message ""} true;
	call __send_ret#133 := __send(__msg_sender, __this, 0, balances_re_ent36#1585[__this][__msg_sender]);
	if (__send_ret#133) {
	balances_re_ent36#1585 := balances_re_ent36#1585[__this := balances_re_ent36#1585[__this][__msg_sender := 0]];
	}

	$return64:
	// Function body ends here
}

// 
// Function: 
procedure {:sourceloc "buggy_20.sol", 539, 5} {:message "RampInstantEthPool::[receive]"} #1627(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#134: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	// Function body starts here
	if ((__msg_sender != swapsContract#539[__this])) {
	call_arg#134 := __msg_sender;
	assume {:sourceloc "buggy_20.sol", 541, 18} {:message ""} true;
	call ReceivedFunds#676(__this, __msg_sender, __msg_value, call_arg#134, __msg_value);
	}

	$return65:
	// Function body ends here
}

// 
// State variable: counter_re_ent35: uint256
var {:sourceloc "buggy_20.sol", 544, 1} {:message "counter_re_ent35"} counter_re_ent35#1630: [address_t]int;
// 
// Function: callme_re_ent35 : function ()
procedure {:sourceloc "buggy_20.sol", 545, 1} {:message "RampInstantEthPool::callme_re_ent35"} callme_re_ent35#1659(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	var call_arg#135: int;
	var __send_ret#136: bool;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (counter_re_ent35#1630[__this] <= 5);
	call_arg#135 := 10000000000000000000;
	assume {:sourceloc "buggy_20.sol", 547, 9} {:message ""} true;
	call __send_ret#136 := __send(__msg_sender, __this, 0, call_arg#135);
	if (!(__send_ret#136)) {
	assume false;
	}

	counter_re_ent35#1630 := counter_re_ent35#1630[__this := (counter_re_ent35#1630[__this] + 1)];
	$return66:
	// Function body ends here
}

