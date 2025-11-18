/**
 * # ERC20 Parametric Example
 *
 * Another example specification for an ERC20 contract. This one using a parametric rule,
 * which is a rule that encompasses all the methods in the current contract. It is called
 * parametric since one of the rule's parameters is the current contract method.
 * To run enter:
 * 
 * certoraRun ERC20.sol --verify ERC20:Parametric.spec --solc solc8.0 --msg "Parametric rule"
 *
 * The `onlyHolderCanChangeAllowance` fails for one of the methods. Look at the Prover
 * results and understand the counter example - which discovers a weakness in the
 * current contract.
 */

// Converted to variables-only form: remove methods declarations.
// We keep calls like allowance(holder, spender) relying on relaxed validation.
variables
{
    mapping (address => mapping (address => uint)) allowance;   // allowance(holder, spender)
    mapping (address => uint) balanceOf;   // balanceOf(address)
    uint totalSupply; // totalSupply()
}


/// @title If `approve` changes a holder's allowance, then it was called by the holder
rule onlyHolderCanChangeAllowance(address holder, address spender, method f) {
    // Snapshot before
    mathint allowance_before = allowance[holder][spender];

    // Simplified call: no env, args passed directly if needed.
    calldataarg args;
    f(args);

    // Snapshot after
    mathint allowance_after = allowance[holder][spender];

    // Core property retained (environment removed):
    assert allowance_after > allowance_before => msg.sender == holder,
        "only the sender can change its own allowance";

    // NOTE: Original selector-based check removed (not supported in variables grammar).
}
