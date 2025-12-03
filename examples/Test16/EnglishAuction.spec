variables
{
    address highestBidder; 
    uint highestBid;     
    mapping (address => uint) bids;         
}


/// @title `highestBid` is the maximal bid
invariant integrityOfHighestBid {
    assert forall address bidder. bids[bidder] <= highestBid;
}
    

/// @title Highest bidder has the highest bid
invariant highestBidderHasHighestBid {
    assert (highestBidder != address(0)) => (bids[highestBidder] == highestBid);
}