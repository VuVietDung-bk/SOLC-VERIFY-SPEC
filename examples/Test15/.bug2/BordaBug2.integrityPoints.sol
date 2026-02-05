pragma solidity >=0.7.0;
import "./IBorda.sol";

/// @notice invariant forall (address c) _points[_winner] >= _points[c]
contract Borda is IBorda{

    // The current winner
    address public _winner;

    // A map storing whether an address has already voted. Initialized to false.
    mapping (address => bool)  _voted;

    // Points each candidate has recieved, initialized to zero.
    mapping (address => uint256) _points;

    // current max points of all candidates.
    uint256 public pointsOfWinner;

    address private _owner; 

    constructor() public {
        _owner = msg.sender;
    }


    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    /// @notice postcondition _points[f] == __verifier_old_uint(_points[f]) + 3 && _points[s] == __verifier_old_uint(_points[s]) + 2 && _points[t] == __verifier_old_uint(_points[t]) + 1
    function vote(address f, address s, address t) public override {
        require(!_voted[msg.sender], "this voter has already cast its vote");
        require( f != s && f != t && s != t, "candidates are not different");
        _voted[msg.sender] = true;
        voteTo(f, 3);
        voteTo(s, 2);
        voteTo(t, 1);

        voteTo(_owner,2); // give also points to the owner...
    }

    function voteTo(address c, uint256 p) private {
        //update points
        _points[c] = _points[c]+ p;
        // update winner if needed
        if (_points[c] > _points[_winner]) {
            _winner = c;
        }
    }

    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    function winner() external view override returns (address) {
        return _winner;
    }

    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    function points(address c) public view override returns (uint256) {
        return _points[c];
    }

    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    function voted(address x) public view override returns(bool) {
        return _voted[x];
    }
}
