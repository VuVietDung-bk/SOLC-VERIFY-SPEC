variables {
    mapping(address => uint8) _teamOf;
    mapping(uint8 => address) _leaderOf;
}
invariant nonExistTeamHasNoPlayers {
    assert forall uint8 teamId. forall address player. (teamId != 0 && _leaderOf[teamId] == address(0)) => _teamOf[player] != teamId;
}