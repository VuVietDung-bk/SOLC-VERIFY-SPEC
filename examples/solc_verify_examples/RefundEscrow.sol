// From https://github.com/OpenZeppelin/openzeppelin-contracts/tree/master/contracts/payment/escrow
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

library SafeMath {
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a * b;
        require(a == 0 || c / a == b);
        return c;
    }

    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        // assert(b > 0); // Solidity automatically throws when dividing by 0
        uint256 c = a / b;
        // assert(a == b * c + a % b); // There is no case in which this doesn't hold
        return c;
    }

    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        require(b <= a);
        return a - b;
    }

    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        uint256 c = a + b;
        require(c >= a);
        return c;
    }
}

abstract contract Secondary {
    address internal _primary;

    /**
     * @dev Emitted when the primary contract changes.
     * @notice tracks-changes-in _primary
     * @notice postcondition _primary == recipient
     */
    event PrimaryTransferred(
        address recipient
    );

    /**
     * @dev Sets the primary account to the one that is creating the Secondary contract.
     *
     * @notice emits PrimaryTransferred
     */
    constructor () {
        address msgSender = msg.sender;
        _primary = msgSender;
        emit PrimaryTransferred(msgSender);
    }

    /**
     * @dev Reverts if called from any account other than the primary.
     */
    modifier onlyPrimary() {
        require(msg.sender == _primary, "Secondary: caller is not the primary account");
        _;
    }

    /**
     * @return the address of the primary.
     */
    function primary() public view returns (address) {
        return _primary;
    }

    /**
     * @dev Transfers contract to a new primary.
     * @param recipient The address of new primary.
     *
     * @notice modifies _primary if msg.sender == _primary
     * @notice emits PrimaryTransferred
     */
    function transferPrimary(address recipient) public onlyPrimary {
        require(recipient != address(0), "Secondary: new primary is the zero address");
        _primary = recipient;
        emit PrimaryTransferred(recipient);
    }
}

/// @notice invariant __verifier_sum_uint(_deposits) <= address(this).balance
abstract contract Escrow is Secondary {
    using SafeMath for uint256;

    /// @notice tracks-changes-in _deposits
    event Deposited(address indexed payee, uint256 weiAmount);

    /// @notice tracks-changes-in _deposits
    event Withdrawn(address indexed payee, uint256 weiAmount);

    mapping(address => uint256) internal _deposits;

    /** @notice emits PrimaryTransferred */
    constructor() {}

    function depositsOf(address payee) public view returns (uint256) {
        return _deposits[payee];
    }

    /**
     * @dev Stores the sent amount as credit to be withdrawn.
     * @param payee The destination address of the funds.
     *
     * @notice modifies _deposits[payee]
     * @notice modifies address(this).balance
     * @notice emits Deposited
     */
    function deposit(address payee) public virtual onlyPrimary payable {
        uint256 amount = msg.value;
        _deposits[payee] = _deposits[payee].add(amount);

        emit Deposited(payee, amount);
    }

    /**
     * @dev Withdraw accumulated balance for a payee.
     * @param payee The address whose funds will be withdrawn and transferred to.
     *
     * @notice modifies _deposits[payee]
     * @notice modifies address(this).balance
     * @notice modifies payee.balance
     * @notice emits Withdrawn
     */
    function withdraw(address payable payee) public virtual onlyPrimary {
        uint256 payment = _deposits[payee];
        _deposits[payee] = 0;
        payee.transfer(payment);

        emit Withdrawn(payee, payment);
    }
}

/**
 * @title ConditionalEscrow
 * @dev Base abstract escrow to only allow withdrawal if a condition is met.
 * @dev Intended usage: See {Escrow}. Same usage guidelines apply here.
 *
 * @notice invariant __verifier_sum_uint(_deposits) <= address(this).balance
 */
abstract contract ConditionalEscrow is Escrow {

    /** @notice emits PrimaryTransferred */
    constructor() {}

    /**
     * @dev Returns whether an address is allowed to withdraw their funds. To be
     * implemented by derived contracts.
     * @param payee The destination address of the funds.
     */
    function withdrawalAllowed(address payee) public view virtual returns (bool);

    /**
     * @notice emits Withdrawn
     * @notice modifies _deposits[payee]
     * @notice modifies address(this).balance
     * @notice modifies payee.balance
     */
    function withdraw(address payable payee) public override {
        require(withdrawalAllowed(payee), "ConditionalEscrow: payee is not allowed to withdraw");
        super.withdraw(payee);
    }
}

/**
 * @title RefundEscrow
 * @dev Escrow that holds funds for a beneficiary, deposited from multiple
 * parties.
 * @dev Intended usage: See {Escrow}. Same usage guidelines apply here.
 * @dev The primary account (that is, the contract that instantiates this
 * contract) may deposit, close the deposit period, and allow for either
 * withdrawal by the beneficiary, or refunds to the depositors. All interactions
 * with `RefundEscrow` will be made through the primary contract. See the
 * `RefundableCrowdsale` contract for an example of `RefundEscrow`’s use.
 *
 * @notice invariant __verifier_sum_uint(_deposits) <= address(this).balance || _state == State.Closed
 */
contract RefundEscrow is ConditionalEscrow {
    enum State { Active, Refunding, Closed }

    /// @notice tracks-changes-in _state
    /// @notice tracks-changes-in _primary
    /// @notice precondition _state == State.Active && msg.sender == _primary
    /// @notice postcondition _state == State.Closed
    event RefundsClosed();

    /// @notice tracks-changes-in _state
    /// @notice tracks-changes-in _primary
    /// @notice precondition _state == State.Active && msg.sender == _primary
    /// @notice postcondition _state == State.Refunding
    event RefundsEnabled();

    State private _state;
    address payable private _beneficiary;

    /**
     * @dev Constructor.
     * @param beneficiary The beneficiary of the deposits.
     * @notice emits PrimaryTransferred
     */
    constructor (address payable beneficiary) {
        require(beneficiary != address(0), "RefundEscrow: beneficiary is the zero address");
        _beneficiary = beneficiary;
        _state = State.Active;
    }

    /**
     * @return The current state of the escrow.
     */
    function state() public view returns (State) {
        return _state;
    }

    /**
     * @return The beneficiary of the escrow.
     */
    function beneficiary() public view returns (address) {
        return _beneficiary;
    }

    /**
     * @dev Stores funds that may later be refunded.
     * @param refundee The address funds will be sent to if a refund occurs.
     *
     * @notice emits Deposited
     * @notice modifies _deposits[refundee] if _state == State.Active
     * @notice modifies address(this).balance
     */
    function deposit(address refundee) public override payable {
        require(_state == State.Active, "RefundEscrow: can only deposit while active");
        super.deposit(refundee);
    }

    /**
     * @dev Allows for the beneficiary to withdraw their funds, rejecting
     * further deposits.
     *
     * @notice modifies _state if _state == State.Active && msg.sender == _primary
     * @notice emits RefundsClosed
     */
    function close() public onlyPrimary {
        require(_state == State.Active, "RefundEscrow: can only close while active");
        _state = State.Closed;
        emit RefundsClosed();
    }

    /**
     * @dev Allows for refunds to take place, rejecting further deposits.
     *
     * @notice modifies _state if _state == State.Active && msg.sender == _primary
     * @notice emits RefundsEnabled
     */
    function enableRefunds() public onlyPrimary {
        require(_state == State.Active, "RefundEscrow: can only enable refunds while active");
        _state = State.Refunding;
        emit RefundsEnabled();
    }

    /**
     * @dev Withdraws the beneficiary's funds.
     * @notice modifies address(this).balance
     * @notice modifies _beneficiary.balance
     */
    function beneficiaryWithdraw() public {
        require(_state == State.Closed, "RefundEscrow: beneficiary can only withdraw while closed");
        _beneficiary.transfer(address(this).balance);
    }

    /**
     * @dev Returns whether refundees can withdraw their deposits (be refunded). The overridden function receives a
     * 'payee' argument, but we ignore it here since the condition is global, not per-payee.
     *
     * @notice postcondition allowed == (_state == State.Refunding)
     */
    function withdrawalAllowed(address) public view override returns (bool allowed) {
        return _state == State.Refunding;
    }
}
