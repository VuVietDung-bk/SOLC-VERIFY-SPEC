/**
 * @title  Native balances Example
 *
 * This is an example specification for using nativeBalances.
 */

variables {
    uint256 currentBid; 
}

rule bidIncreasesAssets() {
    require(msg.sender != contract.address);
    require(msg.value > currentBid);
    uint256 balanceBefore = contract.balance;
    bid();
    assert contract.balance > balanceBefore;
}

rule bidSuccessfullyExpectVacuous() {
    uint256 balanceBefore = contract.balance;
    require(msg.sender != contract.address);
    require(msg.value > 0 &&  msg.value > balanceBefore);
    require (balanceBefore > 0);
    bid();
    assert contract.balance >= balanceBefore;
}
