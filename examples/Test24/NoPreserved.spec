// This spec shows the invariant `nonExistTeamHasNoPlayers` cannot be proven without
// a preserved block.
// Converted to variables mode: remove methods block (calls remain allowed without declarations)


/** @title If a team does not exist it has not players
 *  This invariant cannot be proven without a preserved block.
 */
invariant nonExistTeamHasNoPlayers {
    assert forall uint8 teamId. address player. (teamId != 0 && leaderOf(teamId) == 0) => teamOf(player) != teamId;
}