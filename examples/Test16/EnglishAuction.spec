/**
 * # English auction spec - invariants example
 */
variables
{
    address highestBidder; // highestBidder()
    uint highestBid;       // highestBid()
    uint bids;             // bids(address)
}


/// @title `highestBid` is the maximal bid
invariant integrityOfHighestBid {
    assert forall address bidder. bids(bidder) <= highestBid;
}
    

/// @title Highest bidder has the highest bid
invariant highestBidderHasHighestBid {
    assert (highestBidder != 0) => (bids(highestBidder) == highestBid);
}