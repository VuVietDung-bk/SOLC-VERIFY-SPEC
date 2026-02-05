// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

/// @notice invariant forall (address a) _balances[a] >= 0
contract ERC20 {
    mapping(address => uint256) private _balances;
 
    /// @notice precondition forall (address extraVar0) _balances[extraVar0] >= 0
    /// @notice precondition amount >= 0
    /// @notice postcondition recipient == msg.sender || _balances[msg.sender] == __verifier_old_uint(_balances[msg.sender]) - amount
    /// @notice postcondition recipient == msg.sender || _balances[recipient] == __verifier_old_uint(_balances[recipient]) + amount
    /// @notice postcondition recipient != msg.sender || _balances[msg.sender] == __verifier_old_uint(_balances[msg.sender])
    function transfer(address recipient, uint256 amount)
        public
        returns (bool)
    {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function _transfer(
        address sender,
        address recipient,
        uint256 amount
    ) internal {
        require(sender != address(0), "ERC20: transfer from the zero address");
        require(recipient != address(0), "ERC20: transfer to the zero address");

        uint256 senderBalance = _balances[sender];
        require(
            senderBalance >= amount,
            "ERC20: transfer amount exceeds balance"
        ); 
        _balances[sender] = senderBalance - amount;
        _balances[recipient] += amount;
    }
}
