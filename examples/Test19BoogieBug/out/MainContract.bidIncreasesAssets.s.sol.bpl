// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: MainContract.bidIncreasesAssets.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: MainContract -------
// 
// State variable: currentBidder: address
var {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 6, 5} {:message "currentBidder"} currentBidder#3: [address_t]address_t;
// 
// State variable: currentBid: uint256
var {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 7, 5} {:message "currentBid"} currentBid#5: [address_t]int;
procedure {:inline 1} {:message "transfer"} __transfer(__this: address_t, __msg_sender: address_t, __msg_value: int, amount: int)
{
	assume (__balance[__msg_sender] >= amount);
	assume (__this != __msg_sender);
	__balance := __balance[__this := (__balance[__this] + amount)];
	__balance := __balance[__msg_sender := (__balance[__msg_sender] - amount)];
	// TODO: call fallback, exception handling
}

// 
// Function: bid : function ()
procedure {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 14, 5} {:message "MainContract::bid"} bid#43(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 14, 5} {:message "Precondition 'msg.sender != address(this)' might not hold when entering function."} (__msg_sender != __this);
	requires {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 14, 5} {:message "Precondition 'msg.value > address(this).balance' might not hold when entering function."} (__msg_value > __balance[__this]);
	requires {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 14, 5} {:message "Precondition 'msg.value >= 0' might not hold when entering function."} (__msg_value >= 0);
	requires {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 14, 5} {:message "Precondition 'address(this).balance >= 0' might not hold when entering function."} (__balance[__this] >= 0);

	ensures {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 14, 5} {:message "Postcondition 'address(this).balance > __verifier_old_uint(address(this).balance)' might not hold at end of function."} (__balance[__this] == __msg_value);

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Update balance received by msg.value
	// Function body starts here
	assume (__msg_value >= __balance[__this]);
	assume {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 17, 9} {:message ""} true;
	call __transfer(currentBidder#3[__this], __this, 0, __balance[__this]);
	currentBidder#3 := currentBidder#3[__this := __msg_sender];
	currentBid#5 := currentBid#5[__this := __msg_value];
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
	$return0:
	// Function body ends here
}

// 
// Default constructor
procedure {:sourceloc "MainContract.bidIncreasesAssets.s.sol", 4, 1} {:message "MainContract::[implicit_constructor]"} __constructor#44(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	currentBidder#3 := currentBidder#3[__this := 0];
	currentBid#5 := currentBid#5[__this := 0];
}

