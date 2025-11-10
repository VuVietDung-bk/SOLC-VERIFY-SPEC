/**
 * # English auction spec - invariants example
 */
methods
{
    // Declaring getters as `envfree`
    function highestBidder() external returns (address) envfree;
    function highestBid() external returns (uint) envfree;
    function bids(address) external returns (uint) envfree;
}


/// @title `highestBid` is the maximal bid
invariant integrityOfHighestBid {
    assert forall address bidder. bids(bidder) <= highestBid();
}
    

/// @title Highest bidder has the highest bid
invariant highestBidderHasHighestBid {
    assert (highestBidder() != 0) => (bids(highestBidder()) == highestBid());
}