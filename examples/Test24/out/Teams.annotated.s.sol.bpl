// Global declarations and definitions
type address_t = int;
var __balance: [address_t]int;
var __block_number: int;
var __block_timestamp: int;
var __alloc_counter: int;
// 
// ------- Source: ITeams.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: ITeams -------
// 
// Function: teamOf
procedure {:sourceloc "ITeams.sol", 17, 5} {:message "ITeams::teamOf"} teamOf#204(__this: address_t, __msg_sender: address_t, __msg_value: int, player#199: address_t)
	returns (#202: int);

// 
// Function: leaderOf
procedure {:sourceloc "ITeams.sol", 21, 5} {:message "ITeams::leaderOf"} leaderOf#212(__this: address_t, __msg_sender: address_t, __msg_value: int, teamId#207: int)
	returns (#210: address_t);

// 
// Function: createTeam
procedure {:sourceloc "ITeams.sol", 25, 5} {:message "ITeams::createTeam"} createTeam#224(__this: address_t, __msg_sender: address_t, __msg_value: int, leader#215: address_t, playerA#217: address_t, playerB#219: address_t, teamId#221: int);

// 
// Function: changeLeader
procedure {:sourceloc "ITeams.sol", 35, 5} {:message "ITeams::changeLeader"} changeLeader#230(__this: address_t, __msg_sender: address_t, __msg_value: int, newLeader#227: address_t);

// 
// Default constructor
procedure {:sourceloc "ITeams.sol", 13, 1} {:message "ITeams::[implicit_constructor]"} __constructor#231(__this: address_t, __msg_sender: address_t, __msg_value: int)
{
	assume (__balance[__this] >= 0);
}

// 
// ------- Source: Teams.annotated.s.sol -------
// Pragma: solidity^0.7.0
// 
// ------- Contract: Teams -------
// Contract invariant: forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId
// Inherits from: ITeams
// 
// State variable: _teamOf: mapping(address => uint8)
var {:sourceloc "Teams.annotated.s.sol", 11, 5} {:message "_teamOf"} _teamOf#10: [address_t][address_t]int;
// 
// State variable: _leaderOf: mapping(uint8 => address)
var {:sourceloc "Teams.annotated.s.sol", 12, 5} {:message "_leaderOf"} _leaderOf#14: [address_t][int]address_t;
// 
// Function: teamOf
procedure {:sourceloc "Teams.annotated.s.sol", 15, 5} {:message "Teams::teamOf"} teamOf#28(__this: address_t, __msg_sender: address_t, __msg_value: int, player#17: address_t)
	returns (#21: int)
	requires {:sourceloc "Teams.annotated.s.sol", 15, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold when entering function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

	ensures {:sourceloc "Teams.annotated.s.sol", 15, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold at end of function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#21 := _teamOf#10[__this][player#17];
	goto $return0;
	$return0:
	// Function body ends here
}

// 
// Function: leaderOf
procedure {:sourceloc "Teams.annotated.s.sol", 20, 5} {:message "Teams::leaderOf"} leaderOf#42(__this: address_t, __msg_sender: address_t, __msg_value: int, teamId#31: int)
	returns (#35: address_t)
	requires {:sourceloc "Teams.annotated.s.sol", 20, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold when entering function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

	ensures {:sourceloc "Teams.annotated.s.sol", 20, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold at end of function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	#35 := _leaderOf#14[__this][teamId#31];
	goto $return1;
	$return1:
	// Function body ends here
}

// 
// Function: createTeam
procedure {:sourceloc "Teams.annotated.s.sol", 26, 5} {:message "Teams::createTeam"} createTeam#148(__this: address_t, __msg_sender: address_t, __msg_value: int, leader#45: address_t, playerA#47: address_t, playerB#49: address_t, teamId#51: int)
	requires {:sourceloc "Teams.annotated.s.sol", 26, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold when entering function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));
	requires {:sourceloc "Teams.annotated.s.sol", 26, 5} {:message "Precondition 'teamId >= 0' might not hold when entering function."} (teamId#51 >= 0);

	ensures {:sourceloc "Teams.annotated.s.sol", 26, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold at end of function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

{
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	assume (_leaderOf#14[__this][teamId#51] == 0);
	assume (((_teamOf#10[__this][leader#45] == 0) && (_teamOf#10[__this][playerA#47] == 0)) && (_teamOf#10[__this][playerB#49] == 0));
	assume (((leader#45 != playerA#47) && (leader#45 != playerB#49)) && (playerA#47 != playerB#49));
	assume (((leader#45 != 0) && (playerA#47 != 0)) && (playerB#49 != 0));
	_leaderOf#14 := _leaderOf#14[__this := _leaderOf#14[__this][teamId#51 := leader#45]];
	_teamOf#10 := _teamOf#10[__this := _teamOf#10[__this][leader#45 := teamId#51]];
	_teamOf#10 := _teamOf#10[__this := _teamOf#10[__this][playerA#47 := teamId#51]];
	_teamOf#10 := _teamOf#10[__this := _teamOf#10[__this][playerB#49 := teamId#51]];
	$return2:
	// Function body ends here
}

// 
// Function: changeLeader
procedure {:sourceloc "Teams.annotated.s.sol", 44, 5} {:message "Teams::changeLeader"} changeLeader#192(__this: address_t, __msg_sender: address_t, __msg_value: int, newLeader#151: address_t)
	requires {:sourceloc "Teams.annotated.s.sol", 44, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold when entering function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

	ensures {:sourceloc "Teams.annotated.s.sol", 44, 5} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold at end of function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

{
	var {:sourceloc "Teams.annotated.s.sol", 45, 9} {:message "teamId"} teamId#156: int;
	// TCC assumptions
	assume (__msg_sender != 0);
	// Function body starts here
	teamId#156 := _teamOf#10[__this][__msg_sender];
	assume (teamId#156 != 0);
	assume (__msg_sender == _leaderOf#14[__this][teamId#156]);
	assume (_teamOf#10[__this][newLeader#151] == teamId#156);
	_leaderOf#14 := _leaderOf#14[__this := _leaderOf#14[__this][teamId#156 := newLeader#151]];
	$return3:
	// Function body ends here
}

// 
// Default constructor
function {:builtin "((as const (Array Int Int)) 0)"} default_address_t_int() returns ([address_t]int);
function {:builtin "((as const (Array Int Int)) 0)"} default_int_address_t() returns ([int]address_t);
procedure {:sourceloc "Teams.annotated.s.sol", 9, 1} {:message "Teams::[implicit_constructor]"} __constructor#193(__this: address_t, __msg_sender: address_t, __msg_value: int)
	ensures {:sourceloc "Teams.annotated.s.sol", 9, 1} {:message "State variable initializers might violate invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId'."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

{
	assume (__balance[__this] >= 0);
	_teamOf#10 := _teamOf#10[__this := default_address_t_int()];
	_leaderOf#14 := _leaderOf#14[__this := default_int_address_t()];
}

procedure {:sourceloc "Teams.annotated.s.sol", 9, 1} {:message "Teams::[receive_ether_selfdestruct]"} Teams_eth_receive(__this: address_t, __msg_value: int)
	requires {:sourceloc "Teams.annotated.s.sol", 9, 1} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold when entering function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

	ensures {:sourceloc "Teams.annotated.s.sol", 9, 1} {:message "Invariant 'forall (uint8 teamId, address player) !(teamId != 0 && _leaderOf[teamId] == address(0)) || _teamOf[player] != teamId' might not hold at end of function."} (forall teamId#2: int, player#4: address_t :: (!(((teamId#2 != 0) && (_leaderOf#14[__this][teamId#2] == 0))) || (_teamOf#10[__this][player#4] != teamId#2)));

{
	assume (__msg_value >= 0);
	__balance := __balance[__this := (__balance[__this] + __msg_value)];
}

