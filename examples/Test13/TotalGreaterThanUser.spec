/**
 * # Total Supply Over-Approximation Example
 *
 * The rules here are intended to verify that an ERC20's `totalSupply` method follows
 * the basic property:
 *      For and `address user` we have `totalSupply() >= balanceOf(user)`.
 *
 * First run only the rule `totalSupplyAfterMint`:
 *
 * certoraRun ERC20.sol --verify ERC20:TotalGreaterThanUser.spec --solc --rule totalSupplyAfterMint
 *
 * This rule will fail due to the Prover's tendency to over-approximate the states.
 * Now run the fixed rule `totalSupplyAfterMintWithPrecondition`:
 *
 * certoraRun ERC20.sol --verify ERC20:TotalGreaterThanUser.spec --solc --rule totalSupplyAfterMintWithPrecondition
 *
 * Do you understand why the second rule passed?
 */

// The methods block below gives various declarations regarding solidity methods.
variables
{
    mapping (address => uint) balanceOf;      // balanceOf(address)
    mapping (address => mapping (address => uint)) allowance;      // allowance(address,address)
    uint totalSupply;    // totalSupply()
}


/// @title Total supply after mint is at least the balance of the receiving account
rule totalSupplyAfterMint(address account, uint256 amount) {
    mint(account, amount);
    
    uint256 userBalanceAfter = balanceOf[account];
    uint256 totalAfter = totalSupply;
    
    // Verify that the total supply of the system is at least the current balance of the account.
    assert totalAfter >=  userBalanceAfter, "total supply is less than a user's balance";
}


/** @title Total supply after mint is at least the balance of the receiving account, with
 *  precondition.
 */
rule totalSupplyAfterMintWithPrecondition(address account, uint256 amount) {
    // Assume that in the current state before calling mint, the total supply of the 
    // system is at least the user balance.
    uint256 userBalanceBefore =  balanceOf[account];
    uint256 totalBefore = totalSupply;
    require totalBefore >= userBalanceBefore; 
    
    mint(account, amount);
    
    uint256 userBalanceAfter = balanceOf[account];
    uint256 totalAfter = totalSupply;
    
    // Verify that the total supply of the system is at least the current balance of the account.
    assert totalAfter >= userBalanceAfter, "total supply is less than a user's balance ";
}
