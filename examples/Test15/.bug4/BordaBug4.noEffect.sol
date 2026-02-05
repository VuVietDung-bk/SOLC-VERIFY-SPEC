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


    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    /// @notice precondition !true
    /// @notice postcondition forall (address t) forall (address s) forall (address f) forall (address c) c == f || c == s || c == t || (_voted[c] == __verifier_old_bool(_voted[c]) || c == msg.sender) && _points[c] == __verifier_old_uint(_points[c])
    function vote(address f, address s, address t) public override {
        require(!_voted[msg.sender], "this voter has already cast its vote");
        require( f != s && f != t && s != t, "candidates are not different");
        _voted[msg.sender] = true; 
        voteTo(f, 3);
        voteTo(s, 2);
        voteTo(t, 1);
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
    /// @notice precondition !false
    /// @notice postcondition forall (address c) (_voted[c] == __verifier_old_bool(_voted[c]) || c == msg.sender) && _points[c] == __verifier_old_uint(_points[c])
    function winner() external view override returns (address) {
        return _winner;
    }

    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    /// @notice precondition !false
    /// @notice postcondition forall (address c) (_voted[c] == __verifier_old_bool(_voted[c]) || c == msg.sender) && _points[c] == __verifier_old_uint(_points[c])
    function points(address c) public view override returns (uint256) {
        return _points[c];
    }

    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    /// @notice precondition !false
    /// @notice postcondition forall (address c) (_voted[c] == __verifier_old_bool(_voted[c]) || c == msg.sender) && _points[c] == __verifier_old_uint(_points[c])
    function voted(address x) public view override returns(bool) {
        return _voted[x];
    }


    // backdoor
    /// @notice precondition forall (address extraVar0) _points[extraVar0] >= 0
    /// @notice precondition pointsOfWinner >= 0
    /// @notice precondition !false
    /// @notice postcondition forall (address c) (_voted[c] == __verifier_old_bool(_voted[c]) || c == msg.sender) && _points[c] == __verifier_old_uint(_points[c])
    function iAmTheWinner() external   {
         _winner = msg.sender; 
    }

}
