// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: EnglishAuction.annotated.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: ERC721Mock -------
// 
// State variable: ownership: mapping(uint256 => address)
var {:sourceloc "EnglishAuction.annotated.s.sol", 9, 5} {:message "ownership"} ownership#6: [address_t][int]address_t;
// 
// Function: transferFrom
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 11, 5} {:message "ERC721Mock::transferFrom"} transferFrom#30(__this: address_t, __msg_sender: address_t, __msg_value: int, from#8: address_t, to#10: address_t, tokenId#12: int)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (ownership#6[__this][tokenId#12] == from#8);
	ownership#6 := ownership#6[__this := ownership#6[__this][tokenId#12 := to#10]];
	$return0:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 7, 1} {:message "ERC721Mock::[implicit_constructor]"} __constructor#31(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	ownership#6 := ownership#6[__this := default_int_address_t()];
}

// 
// ------- Contract: ERC20Mock -------
// 
// State variable: balances: mapping(address => uint256)
var {:sourceloc "EnglishAuction.annotated.s.sol", 24, 5} {:message "balances"} balances#36: [address_t][address_t]int;
// 
// Function: transferFrom
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 26, 5} {:message "ERC20Mock::transferFrom"} transferFrom#71(__this: address_t, __msg_sender: address_t, __msg_value: int, from#38: address_t, to#40: address_t, amount#42: int)
	returns (#45: bool)
{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	if ((balances#36[__this][from#38] < amount#42)) {
	#45 := false;
	goto $return1;
	}

	balances#36 := balances#36[__this := balances#36[__this][from#38 := (balances#36[__this][from#38] - amount#42)]];
	balances#36 := balances#36[__this := balances#36[__this][to#40 := (balances#36[__this][to#40] + amount#42)]];
	#45 := true;
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 23, 1} {:message "ERC20Mock::[implicit_constructor]"} __constructor#72(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
	balances#36 := balances#36[__this := default_address_t_int()];
}

// 
// ------- Contract: EnglishAuction -------
// Contract invariant: forall (address bidder) bids[bidder] <= highestBid
// Contract invariant: !(highestBidder != address(0)) || (bids[highestBidder] == highestBid)
// 
// Event: Start
procedure {:inline 1} {:sourceloc "EnglishAuction.annotated.s.sol", 45, 5} {:message "[event] EnglishAuction::Start"} Start#75(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	
}

// 
// Event: Bid
procedure {:inline 1} {:sourceloc "EnglishAuction.annotated.s.sol", 46, 5} {:message "[event] EnglishAuction::Bid"} Bid#81(__this: address_t, __msg_sender: address_t, __msg_value: int, sender#77: address_t, amount#79: int)
{
	
}

// 
// Event: Withdraw
procedure {:inline 1} {:sourceloc "EnglishAuction.annotated.s.sol", 47, 5} {:message "[event] EnglishAuction::Withdraw"} Withdraw#87(__this: address_t, __msg_sender: address_t, __msg_value: int, bidder#83: address_t, amount#85: int)
{
	
}

// 
// Event: End
procedure {:inline 1} {:sourceloc "EnglishAuction.annotated.s.sol", 48, 5} {:message "[event] EnglishAuction::End"} End#93(__this: address_t, __msg_sender: address_t, __msg_value: int, winner#89: address_t, amount#91: int)
{
	
}

// 
// State variable: nft: contract ERC721Mock
var {:sourceloc "EnglishAuction.annotated.s.sol", 50, 5} {:message "nft"} nft#95: [address_t]address_t;
// 
// State variable: token: contract ERC20Mock
var {:sourceloc "EnglishAuction.annotated.s.sol", 51, 5} {:message "token"} token#97: [address_t]address_t;
// 
// State variable: nftId: uint256
var {:sourceloc "EnglishAuction.annotated.s.sol", 52, 5} {:message "nftId"} nftId#99: [address_t]int;
// 
// State variable: seller: address payable
var {:sourceloc "EnglishAuction.annotated.s.sol", 54, 5} {:message "seller"} seller#101: [address_t]address_t;
// 
// State variable: endAt: uint256
var {:sourceloc "EnglishAuction.annotated.s.sol", 55, 5} {:message "endAt"} endAt#103: [address_t]int;
// 
// State variable: started: bool
var {:sourceloc "EnglishAuction.annotated.s.sol", 56, 5} {:message "started"} started#105: [address_t]bool;
// 
// State variable: ended: bool
var {:sourceloc "EnglishAuction.annotated.s.sol", 57, 5} {:message "ended"} ended#107: [address_t]bool;
// 
// State variable: highestBidder: address
var {:sourceloc "EnglishAuction.annotated.s.sol", 59, 5} {:message "highestBidder"} highestBidder#109: [address_t]address_t;
// 
// State variable: highestBid: uint256
var {:sourceloc "EnglishAuction.annotated.s.sol", 60, 5} {:message "highestBid"} highestBid#111: [address_t]int;
// 
// State variable: bids: mapping(address => uint256)
var {:sourceloc "EnglishAuction.annotated.s.sol", 61, 5} {:message "bids"} bids#115: [address_t][address_t]int;
// 
// State variable: operators: mapping(address => mapping(address => bool))
var {:sourceloc "EnglishAuction.annotated.s.sol", 62, 5} {:message "operators"} operators#121: [address_t][address_t][address_t]bool;
function {:builtin "((as const (Array Int Bool)) false)"} default_address_t_bool() returns ([address_t]bool);
function {:builtin "((as const (Array Int (Array Int Bool))) ((as const (Array Int Bool)) false))"} default_address_t__k_address_t_v_bool() returns ([address_t][address_t]bool);
// 
// Function: 
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 69, 5} {:message "EnglishAuction::[constructor]"} __constructor#529(__this: address_t, __msg_sender: address_t, __msg_value: int, _nft#124: address_t, _erc20#126: address_t, _nftId#128: int, _startingBid#130: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 69, 5} {:message "Precondition '_nftId >= 0' might not hold when entering function."} (_nftId#128 >= 0);
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 69, 5} {:message "Precondition '_startingBid >= 0' might not hold when entering function."} (_startingBid#130 >= 0);

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 69, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 69, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	assume (__balance[__this] >= 0);
	nft#95 := nft#95[__this := 0];
	token#97 := token#97[__this := 0];
	nftId#99 := nftId#99[__this := 0];
	seller#101 := seller#101[__this := 0];
	endAt#103 := endAt#103[__this := 0];
	started#105 := started#105[__this := false];
	ended#107 := ended#107[__this := false];
	highestBidder#109 := highestBidder#109[__this := 0];
	highestBid#111 := highestBid#111[__this := 0];
	bids#115 := bids#115[__this := default_address_t_int()];
	operators#121 := operators#121[__this := default_address_t__k_address_t_v_bool()];
	// Function body starts here
	nft#95 := nft#95[__this := _nft#124];
	nftId#99 := nftId#99[__this := _nftId#128];
	token#97 := token#97[__this := _erc20#126];
	seller#101 := seller#101[__this := __msg_sender];
	highestBid#111 := highestBid#111[__this := _startingBid#130];
	$return2:
	// Function body ends here
}

type {:datatype} int_arr_type;
function {:constructor} int_arr#constr(arr: [int]int, length: int) returns (int_arr_type);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_int() returns ([int]int);
type int_arr_ptr = int;
var mem_arr_int: [int_arr_ptr]int_arr_type;
// 
// Function: start
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 85, 5} {:message "EnglishAuction::start"} start#213(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 85, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 85, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 85, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 85, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	var call_arg#0: int_arr_ptr;
	var new_array#1: int_arr_ptr;
	var call_arg#2: int_arr_ptr;
	var new_array#3: int_arr_ptr;
	var call_arg#4: int_arr_ptr;
	var new_array#5: int_arr_ptr;
	var call_arg#6: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#1 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#0 := new_array#1;
	mem_arr_int := mem_arr_int[call_arg#0 := int_arr#constr(default_int_int()[0 := 115][1 := 116][2 := 97][3 := 114][4 := 116][5 := 101][6 := 100], 7)];
	assume !(started#105[__this]);
	new_array#3 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#2 := new_array#3;
	mem_arr_int := mem_arr_int[call_arg#2 := int_arr#constr(default_int_int()[0 := 115][1 := 116][2 := 97][3 := 114][4 := 116][5 := 101][6 := 100], 7)];
	assume !(ended#107[__this]);
	new_array#5 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#4 := new_array#5;
	mem_arr_int := mem_arr_int[call_arg#4 := int_arr#constr(default_int_int()[0 := 110][1 := 111][2 := 116][3 := 32][4 := 115][5 := 101][6 := 108][7 := 108][8 := 101][9 := 114], 10)];
	assume (__msg_sender == seller#101[__this]);
	started#105 := started#105[__this := true];
	call_arg#6 := __msg_sender;
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 91, 9} {:message ""} true;
	call transferFrom#30(nft#95[__this], __this, 0, call_arg#6, __this, nftId#99[__this]);
	endAt#103 := endAt#103[__this := (__block_timestamp + 604800)];
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 94, 14} {:message ""} true;
	call Start#75(__this, __msg_sender, __msg_value);
	$return3:
	// Function body ends here
}

// 
// Function: setOperator
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 99, 5} {:message "EnglishAuction::setOperator"} setOperator#231(__this: address_t, __msg_sender: address_t, __msg_value: int, operator#216: address_t, trusted#218: bool)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 99, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 99, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 99, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 99, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	operators#121 := operators#121[__this := operators#121[__this][__msg_sender := operators#121[__this][__msg_sender][operator#216 := trusted#218]]];
	$return4:
	// Function body ends here
}

// 
// Function: bid
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 104, 5} {:message "EnglishAuction::bid"} bid#246(__this: address_t, __msg_sender: address_t, __msg_value: int, amount#234: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 104, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 104, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 104, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#234 >= 0);

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 104, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 104, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	var call_arg#7: address_t;
	var call_arg#8: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#7 := __msg_sender;
	call_arg#8 := __msg_sender;
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 105, 9} {:message ""} true;
	call _bid#333(__this, __msg_sender, __msg_value, call_arg#7, call_arg#8, amount#234);
	$return5:
	// Function body ends here
}

// 
// Function: bidFor
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 110, 5} {:message "EnglishAuction::bidFor"} bidFor#262(__this: address_t, __msg_sender: address_t, __msg_value: int, bidder#249: address_t, amount#251: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 110, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 110, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 110, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#251 >= 0);

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 110, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 110, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	var call_arg#9: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#9 := __msg_sender;
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 111, 9} {:message ""} true;
	call _bid#333(__this, __msg_sender, __msg_value, bidder#249, call_arg#9, amount#251);
	$return6:
	// Function body ends here
}

// 
// Function: _bid : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "EnglishAuction.annotated.s.sol", 117, 5} {:message "EnglishAuction::_bid"} _bid#333(__this: address_t, __msg_sender: address_t, __msg_value: int, bidder#265: address_t, payer#267: address_t, amount#269: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 117, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#269 >= 0);

{
	var call_arg#10: int_arr_ptr;
	var new_array#11: int_arr_ptr;
	var call_arg#12: int_arr_ptr;
	var new_array#13: int_arr_ptr;
	var {:sourceloc "EnglishAuction.annotated.s.sol", 120, 9} {:message "previousBid"} previousBid#286: int;
	var transferFrom#71_ret#14: bool;
	var call_arg#15: int_arr_ptr;
	var new_array#16: int_arr_ptr;
	var call_arg#17: int_arr_ptr;
	var new_array#18: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#11 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#10 := new_array#11;
	mem_arr_int := mem_arr_int[call_arg#10 := int_arr#constr(default_int_int()[0 := 110][1 := 111][2 := 116][3 := 32][4 := 115][5 := 116][6 := 97][7 := 114][8 := 116][9 := 101][10 := 100], 11)];
	assume started#105[__this];
	new_array#13 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#12 := new_array#13;
	mem_arr_int := mem_arr_int[call_arg#12 := int_arr#constr(default_int_int()[0 := 101][1 := 110][2 := 100][3 := 101][4 := 100], 5)];
	assume (__block_timestamp < endAt#103[__this]);
	previousBid#286 := highestBid#111[__this];
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 123, 13} {:message ""} true;
	call transferFrom#71_ret#14 := transferFrom#71(token#97[__this], __this, 0, payer#267, __this, amount#269);
	new_array#16 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#15 := new_array#16;
	mem_arr_int := mem_arr_int[call_arg#15 := int_arr#constr(default_int_int()[0 := 116][1 := 111][2 := 107][3 := 101][4 := 110][5 := 32][6 := 116][7 := 114][8 := 97][9 := 110][10 := 115][11 := 102][12 := 101][13 := 114][14 := 32][15 := 102][16 := 97][17 := 105][18 := 108][19 := 101][20 := 100], 21)];
	assume transferFrom#71_ret#14;
	bids#115 := bids#115[__this := bids#115[__this][bidder#265 := (bids#115[__this][bidder#265] + amount#269)]];
	highestBidder#109 := highestBidder#109[__this := bidder#265];
	highestBid#111 := highestBid#111[__this := bids#115[__this][highestBidder#109[__this]]];
	new_array#18 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#17 := new_array#18;
	mem_arr_int := mem_arr_int[call_arg#17 := int_arr#constr(default_int_int()[0 := 110][1 := 101][2 := 119][3 := 32][4 := 104][5 := 105][6 := 103][7 := 104][8 := 32][9 := 118][10 := 97][11 := 108][12 := 117][13 := 101][14 := 32][15 := 62][16 := 32][17 := 104][18 := 105][19 := 103][20 := 104][21 := 101][22 := 115][23 := 116], 24)];
	assume (bids#115[__this][highestBidder#109[__this]] > previousBid#286);
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 132, 14} {:message ""} true;
	call Bid#81(__this, __msg_sender, __msg_value, bidder#265, amount#269);
	$return7:
	// Function body ends here
}

// 
// Function: _withdraw : function (address,address,uint256)
procedure {:inline 1} {:sourceloc "EnglishAuction.annotated.s.sol", 138, 5} {:message "EnglishAuction::_withdraw"} _withdraw#379(__this: address_t, __msg_sender: address_t, __msg_value: int, bidder#336: address_t, recipient#338: address_t, amount#340: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 138, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#340 >= 0);

{
	var call_arg#19: int_arr_ptr;
	var new_array#20: int_arr_ptr;
	var {:sourceloc "EnglishAuction.annotated.s.sol", 142, 9} {:message "success"} success#357: bool;
	var transferFrom#71_ret#21: bool;
	var call_arg#22: int_arr_ptr;
	var new_array#23: int_arr_ptr;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#20 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#19 := new_array#20;
	mem_arr_int := mem_arr_int[call_arg#19 := int_arr#constr(default_int_int()[0 := 98][1 := 105][2 := 100][3 := 100][4 := 101][5 := 114][6 := 32][7 := 99][8 := 97][9 := 110][10 := 110][11 := 111][12 := 116][13 := 32][14 := 119][15 := 105][16 := 116][17 := 104][18 := 100][19 := 114][20 := 97][21 := 119], 22)];
	assume (bidder#336 != highestBidder#109[__this]);
	bids#115 := bids#115[__this := bids#115[__this][bidder#336 := (bids#115[__this][bidder#336] - amount#340)]];
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 142, 24} {:message ""} true;
	call transferFrom#71_ret#21 := transferFrom#71(token#97[__this], __this, 0, __this, recipient#338, amount#340);
	success#357 := transferFrom#71_ret#21;
	new_array#23 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#22 := new_array#23;
	mem_arr_int := mem_arr_int[call_arg#22 := int_arr#constr(default_int_int()[0 := 116][1 := 111][2 := 107][3 := 101][4 := 110][5 := 32][6 := 116][7 := 114][8 := 97][9 := 110][10 := 115][11 := 102][12 := 101][13 := 114][14 := 32][15 := 102][16 := 97][17 := 105][18 := 108][19 := 101][20 := 100], 21)];
	assume success#357;
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 145, 14} {:message ""} true;
	call Withdraw#87(__this, __msg_sender, __msg_value, bidder#336, amount#340);
	$return8:
	// Function body ends here
}

// 
// Function: withdraw
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 150, 5} {:message "EnglishAuction::withdraw"} withdraw#395(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 150, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 150, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 150, 5} {:message "Precondition 'bids[msg.sender] >= 0' might not hold when entering function."} (bids#115[__this][__msg_sender] >= 0);

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 150, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 150, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	var call_arg#24: address_t;
	var call_arg#25: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#24 := __msg_sender;
	call_arg#25 := __msg_sender;
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 151, 9} {:message ""} true;
	call _withdraw#379(__this, __msg_sender, __msg_value, call_arg#24, call_arg#25, bids#115[__this][__msg_sender]);
	$return9:
	// Function body ends here
}

// 
// Function: withdrawAmount
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 156, 5} {:message "EnglishAuction::withdrawAmount"} withdrawAmount#411(__this: address_t, __msg_sender: address_t, __msg_value: int, recipient#398: address_t, amount#400: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 156, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 156, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 156, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#400 >= 0);

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 156, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 156, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	var call_arg#26: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	call_arg#26 := __msg_sender;
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 157, 9} {:message ""} true;
	call _withdraw#379(__this, __msg_sender, __msg_value, call_arg#26, recipient#398, amount#400);
	$return10:
	// Function body ends here
}

// 
// Function: withdrawFor
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 163, 5} {:message "EnglishAuction::withdrawFor"} withdrawFor#442(__this: address_t, __msg_sender: address_t, __msg_value: int, bidder#414: address_t, amount#416: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 163, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 163, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 163, 5} {:message "Precondition 'amount >= 0' might not hold when entering function."} (amount#416 >= 0);

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 163, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 163, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	var call_arg#27: int_arr_ptr;
	var new_array#28: int_arr_ptr;
	var call_arg#29: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#28 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#27 := new_array#28;
	mem_arr_int := mem_arr_int[call_arg#27 := int_arr#constr(default_int_int()[0 := 116][1 := 104][2 := 97][3 := 116][4 := 32][5 := 111][6 := 112][7 := 101][8 := 114][9 := 97][10 := 116][11 := 111][12 := 114][13 := 32][14 := 119][15 := 97][16 := 115][17 := 32][18 := 110][19 := 111][20 := 116][21 := 32][22 := 97][23 := 108][24 := 108][25 := 111][26 := 119][27 := 101][28 := 100], 29)];
	assume (operators#121[__this][bidder#414][__msg_sender] || (__msg_sender == bidder#414));
	call_arg#29 := __msg_sender;
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 168, 9} {:message ""} true;
	call _withdraw#379(__this, __msg_sender, __msg_value, bidder#414, call_arg#29, amount#416);
	$return11:
	// Function body ends here
}

// 
// Function: end
procedure {:sourceloc "EnglishAuction.annotated.s.sol", 174, 5} {:message "EnglishAuction::end"} end#528(__this: address_t, __msg_sender: address_t, __msg_value: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 174, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 174, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 174, 5} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 174, 5} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	var call_arg#30: int_arr_ptr;
	var new_array#31: int_arr_ptr;
	var call_arg#32: int_arr_ptr;
	var new_array#33: int_arr_ptr;
	var call_arg#34: int_arr_ptr;
	var new_array#35: int_arr_ptr;
	var {:sourceloc "EnglishAuction.annotated.s.sol", 178, 9} {:message "_success"} _success#466: bool;
	var call_arg#36: address_t;
	var transferFrom#71_ret#37: bool;
	var call_arg#38: int_arr_ptr;
	var new_array#39: int_arr_ptr;
	var call_arg#40: address_t;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	new_array#31 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#30 := new_array#31;
	mem_arr_int := mem_arr_int[call_arg#30 := int_arr#constr(default_int_int()[0 := 110][1 := 111][2 := 116][3 := 32][4 := 115][5 := 116][6 := 97][7 := 114][8 := 116][9 := 101][10 := 100], 11)];
	assume started#105[__this];
	new_array#33 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#32 := new_array#33;
	mem_arr_int := mem_arr_int[call_arg#32 := int_arr#constr(default_int_int()[0 := 110][1 := 111][2 := 116][3 := 32][4 := 101][5 := 110][6 := 100][7 := 101][8 := 100], 9)];
	assume (__block_timestamp >= endAt#103[__this]);
	new_array#35 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#34 := new_array#35;
	mem_arr_int := mem_arr_int[call_arg#34 := int_arr#constr(default_int_int()[0 := 101][1 := 110][2 := 100][3 := 101][4 := 100], 5)];
	assume !(ended#107[__this]);
	_success#466 := false;
	ended#107 := ended#107[__this := true];
	if ((highestBidder#109[__this] != 0)) {
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 182, 13} {:message ""} true;
	call transferFrom#30(nft#95[__this], __this, 0, __this, highestBidder#109[__this], nftId#99[__this]);
	call_arg#36 := seller#101[__this];
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 183, 24} {:message ""} true;
	call transferFrom#71_ret#37 := transferFrom#71(token#97[__this], __this, 0, __this, call_arg#36, bids#115[__this][highestBidder#109[__this]]);
	_success#466 := transferFrom#71_ret#37;
	new_array#39 := __alloc_counter;
	__alloc_counter := (__alloc_counter + 1);
	call_arg#38 := new_array#39;
	mem_arr_int := mem_arr_int[call_arg#38 := int_arr#constr(default_int_int()[0 := 116][1 := 111][2 := 107][3 := 101][4 := 110][5 := 32][6 := 116][7 := 114][8 := 97][9 := 110][10 := 115][11 := 102][12 := 101][13 := 114][14 := 32][15 := 102][16 := 97][17 := 105][18 := 108][19 := 101][20 := 100], 21)];
	assume _success#466;
	}
	else {
	call_arg#40 := seller#101[__this];
	assume {:sourceloc "EnglishAuction.annotated.s.sol", 186, 13} {:message ""} true;
	call transferFrom#30(nft#95[__this], __this, 0, __this, call_arg#40, nftId#99[__this]);
	}

	assume {:sourceloc "EnglishAuction.annotated.s.sol", 189, 14} {:message ""} true;
	call End#93(__this, __msg_sender, __msg_value, highestBidder#109[__this], highestBid#111[__this]);
	$return12:
	// Function body ends here
}

procedure {:sourceloc "EnglishAuction.annotated.s.sol", 44, 1} {:message "EnglishAuction::[receive_ether_selfdestruct]"} EnglishAuction_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 44, 1} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold when entering function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	requires {:sourceloc "EnglishAuction.annotated.s.sol", 44, 1} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold when entering function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 44, 1} {:message "Invariant 'forall (address bidder) bids[bidder] <= highestBid' might not hold at end of function."} (forall bidder#2: address_t :: (bids#115[__this][bidder#2] <= highestBid#111[__this]));
	ensures {:sourceloc "EnglishAuction.annotated.s.sol", 44, 1} {:message "Invariant '!(highestBidder != address(0)) || (bids[highestBidder] == highestBid)' might not hold at end of function."} (!((highestBidder#109[__this] != 0)) || (bids#115[__this][highestBidder#109[__this]] == highestBid#111[__this]));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

