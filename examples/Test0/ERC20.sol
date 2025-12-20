// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0;

contract ERC20 {
    mapping(address => uint256) private _balances;
 
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
