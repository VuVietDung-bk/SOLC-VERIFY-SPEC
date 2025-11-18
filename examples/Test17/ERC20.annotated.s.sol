// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity ^0.7.0;

/// @notice Modern and gas efficient ERC20 implementation.
/// @author Solmate (https://github.com/transmissions11/solmate/blob/main/src/tokens/ERC20.sol)
/// @author Modified from Uniswap
/// (https://github.com/Uniswap/uniswap-v2-core/blob/master/contracts/UniswapV2ERC20.sol)
/// @dev Do not manually set balances without updating totalSupply, as the sum of all
/// user balances must not exceed it.
/// @notice invariant forall (address a, address b) !(a != b) || (balanceOf[a] + balanceOf[b] <= totalSupply)
contract ERC20 {
    // EVENTS

    event Transfer(address indexed from, address indexed to, uint256 amount);

    event Approval(address indexed owner, address indexed spender, uint256 amount);

    // METADATA STORAGE

    string public name;

    string public symbol;

    uint8 public immutable decimals;

    // ERC20 STORAGE

    uint256 public totalSupply;

    mapping(address => uint256) public balanceOf;

    mapping(address => mapping(address => uint256)) public allowance;

    // CONSTRUCTOR

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
    }

    // ERC20 LOGIC
    /// @notice precondition amount >= 0
    function approve(address spender, uint256 amount) public virtual returns (bool) {
        allowance[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);

        return true;
    }

    /// @notice precondition amount >= 0
    function transfer(address to, uint256 amount) public virtual returns (bool) {
        balanceOf[msg.sender] -= amount;

        // Cannot overflow because the sum of all user
        // balances can't exceed the max uint256 value.
        balanceOf[to] += amount;

        emit Transfer(msg.sender, to, amount);

        return true;
    }

    /// @notice precondition amount >= 0
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public virtual returns (bool) {
        uint256 allowed = allowance[from][msg.sender]; // Saves gas for limited approvals.

        if (allowed != 115792089237316195423570985008687907853269984665640564039457584007913129639935) allowance[from][msg.sender] = allowed - amount;

        balanceOf[from] -= amount;

        // Cannot overflow because the sum of all user
        // balances can't exceed the max uint256 value.
        balanceOf[to] += amount;

        emit Transfer(from, to, amount);

        return true;
    }

    // INTERNAL MINT/BURN LOGIC
    /// @notice precondition amount >= 0
    function _mint(address to, uint256 amount) internal virtual {
        totalSupply += amount;

        // Cannot overflow because the sum of all user
        // balances can't exceed the max uint256 value.
        balanceOf[to] += amount;

        emit Transfer(address(0), to, amount);
    }

    /// @notice precondition amount >= 0
    function _burn(address from, uint256 amount) internal virtual {
        balanceOf[from] -= amount;

        // Cannot underflow because a user's balance
        // will never be larger than the total supply.
        totalSupply -= amount;

        emit Transfer(from, address(0), amount);
    }
}
