// SPDX-License-Identifier: MIT

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.registers import get_label_location
from starkware.cairo.common.alloc import alloc

from openzeppelin.access.ownable.library import Ownable
from openzeppelin.security.pausable.library import Pausable

struct Team {
    name: felt,
    group: felt,
}

struct Match {
    team_a: felt,
    team_b: felt,
}

struct Result {
    team_a: felt,
    team_b: felt,
}

@contract_interface
namespace ITournament {
    func add(name: felt, group: felt) -> () {
    }

    func team(id: felt) -> (name: felt, group: felt) {
    }

    func teams(ids_len: felt, ids: felt*) -> (teams_len: felt, teams: felt*) {
    }

    func match(id: felt) -> (team_a: felt, team_b: felt) {
    }

    func matches(ids_len: felt, ids: felt*) -> (matches_len: felt, matches: felt*) {
    }
}

@storage_var
func Tournament_result(match_id: felt) -> (winner: felt) {
}

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    owner: felt
) {
    Ownable.initializer(owner);
    return ();
}

@view
func team(id: felt) -> (name: felt, group: felt) {
    let team = lookup_team(id);
    return (name=team.name, group=team.group);
}

@view
func teams(ids_len: felt, ids: felt*) -> (teams_len: felt, teams: felt*) {
    alloc_locals;
    let (res) = alloc();
    teams_inner(ids_len, ids, res);
    return (2 * ids_len, res);
}

func teams_inner(ids_len: felt, ids: felt*, teams: felt*) {
    if (ids_len == 0) {
        return ();
    }
    let team = lookup_team(ids[0]);
    assert teams[0] = team.name;
    assert teams[1] = team.group;
    return teams_inner(ids_len - 1, ids + 1, teams + 2);
}

@view
func match(id: felt) -> (team_a: felt, team_b: felt) {
    if (id - 
    let match = lookup_match(id);
    return (team_a=match.team_a, team_b=match.team_b);
}

@view
func matches(ids_len: felt, ids: felt*) -> (matches_len: felt, matches: felt*) {
    alloc_locals;
    let (res) = alloc();
    matches_inner(ids_len, ids, res);
    return (2 * ids_len, res);
}

func matches_inner(ids_len: felt, ids: felt*, matches: felt*) {
    if (ids_len == 0) {
        return ();
    }
    let match = lookup_match(ids[0]);
    assert matches[0] = match.team_a;
    assert matches[1] = match.team_b;
    return matches_inner(ids_len - 1, ids + 1, matches + 2);
}


// return the fixtures for a team. since we only store finalized outcomes
// this returns the results of a teams fixtures.
@view
func fixtures(team: felt) -> () {
    return ();
}

// returns if a team is currently active (aka hasn't been knocked out).
@view
func active(team: felt) -> (active: felt) {
    return (active=0);
}

// returns champion team if the tournament has been finalized. otherwise returns
// returns 0.
@view
func champion() -> (team_id: felt) {
    return (team_id=0);
}

@view
func owner{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (owner: felt) {
    return Ownable.owner();
}

// update the outcome of a game. calling update creates a unique fixture associated with
// the corresponding teams.
@external
func update{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    team_a: felt, team_b: felt, score_a: felt, score_b: felt
) {
    Ownable.assert_only_owner();
    return ();
}

// knock a team our of the tournament.
@external
func knockout{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    team: felt
) {
    Ownable.assert_only_owner();
    return ();
}

// finalize the tournament
@external
func finalize{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    Ownable.assert_only_owner();
    return ();
}

@external
func transferOwnership{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    newOwner: felt
) {
    Ownable.transfer_ownership(newOwner);
    return ();
}

@external
func renounceOwnership{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    Ownable.renounce_ownership();
    return ();
}

func lookup_team(index: felt) -> Team* {
    let (addr) = get_label_location(data_start);
    return cast(addr + (index * 2), Team*);

    data_start:
    dw 'Qatar';         // 0
    dw 'A';
    dw 'Ecuador';       // 1
    dw 'A';
    dw 'Senegal';       // 2
    dw 'A';
    dw 'Netherlands';   // 3
    dw 'A';
    dw 'England';       // 4
    dw 'B';
    dw 'Iran';          // 5
    dw 'B';
    dw 'United States'; // 6
    dw 'B';
    dw 'Wales';         // 7
    dw 'B';
    dw 'Argentina';     // 8
    dw 'C';
    dw 'Saudi Arabia';  // 9
    dw 'C';
    dw 'Mexico';        // 10
    dw 'C';
    dw 'Poland';        // 11
    dw 'C';
    dw 'France';        // 12
    dw 'D';
    dw 'Australia';     // 13
    dw 'D';
    dw 'Denmark';       // 14
    dw 'D';
    dw 'Tunisia';       // 15
    dw 'D';
    dw 'Spain';         // 16
    dw 'E';
    dw 'Costa Rica';    // 17
    dw 'E';
    dw 'Germany';       // 18
    dw 'E';
    dw 'Japan';         // 19
    dw 'E';
    dw 'Belgium';       // 20
    dw 'F';
    dw 'Canada';        // 21
    dw 'F';
    dw 'Morocco';       // 22
    dw 'F';
    dw 'Croatia';       // 23
    dw 'F';
    dw 'Brazil';        // 24
    dw 'G';
    dw 'Serbia';        // 25
    dw 'G';
    dw 'Switzerland';   // 26
    dw 'G';
    dw 'Cameroon';      // 27
    dw 'G';
    dw 'Portugal';      // 28
    dw 'H';
    dw 'Ghana';         // 29
    dw 'H';
    dw 'Uruguay';       // 30
    dw 'H';
    dw 'South Korea';   // 31
    dw 'H';
}

func lookup_match(index: felt) -> Match* {
    let (addr) = get_label_location(data_start);
    return cast(addr + (index - 1 * 2), Match*);

    data_start:
    // Match 1     Qatar        		 Ecuador
    dw 0;
    dw 1;
    // Match 2     Senegal      		 Netherlands
    dw 2;
    dw 3;
    // Match 3     England      		 Iran
    dw 4;
    dw 5;
    // Match 4     United States 		 Wales
    dw 6;
    dw 7;
    // Match 5     France       		 Australia
    dw 12;
    dw 13;
    // Match 6     Denmark      		 Tunisia
    dw 14;
    dw 15;
    // Match 7     Mexico       		 Poland
    dw 10;
    dw 11;
    // Match 8     Argentina             Saudi Arabia
    dw 8;
    dw 9;
    // Match 9     Belgium      		 Canada
    dw 20;
    dw 21;
    // Match 10    Spain        		 Costa Rica
    dw 16;
    dw 17;
    // Match 11    Germany      		 Japan
    dw 18;
    dw 19;
    // Match 12    Morocco      		 Croatia
    dw 22;
    dw 23;
    // Match 13    Switzerland           Cameroon
    dw 26;
    dw 27;
    // Match 14    Uruguay      		 South Korea
    dw 30;
    dw 31;
    // Match 15    Portugal              Ghana
    dw 28;
    dw 29;
    // Match 16    Brazil       		 Serbia
    dw 24;
    dw 25;
    // Match 17    Wales        		 Iran
    dw 7;
    dw 5;
    // Match 18    Qatar        		 Senegal
    dw 0;
    dw 2;
    // Match 19    Netherlands      	 Ecuador
    dw 3;
    dw 1;
    // Match 20    England      		 United States
    dw 4;
    dw 6;
    // Match 21    Tunisia      		 Australia
    dw 15;
    dw 13;
    // Match 22    Poland       		 Saudi Arabia
    dw 11;
    dw 9;
    // Match 23    France       		 Denmark
    dw 12;
    dw 14;
    // Match 24    Argentina        	 Mexico
    dw 8;
    dw 10;
    // Match 25    Japan        		 Costa Rica
    dw 19;
    dw 17;
    // Match 26    Belgium      		 Morocco
    dw 20;
    dw 22;
    // Match 27    Croatia      		 Canada
    dw 23;
    dw 21;
    // Match 28    Spain        		 Germany
    dw 16;
    dw 18;
    // Match 29    Cameroon              Serbia
    dw 27;
    dw 25;
    // Match 30    South Korea 		     Ghana
    dw 31;
    dw 29;
    // Match 31    Brazil       		 Switzerland
    dw 24;
    dw 26;
    // Match 32    Portugal              Uruguay
    dw 28;
    dw 30;
    // Match 33    Wales        		 England
    dw 7;
    dw 4;
    // Match 34    Iran         		 United States
    dw 5;
    dw 6;
    // Match 35    Ecuador      		 Senegal
    dw 1;
    dw 2;
    // Match 36    Netherlands      	 Qatar
    dw 3;
    dw 0;
    // Match 37    Australia             Denmark
    dw 13;
    dw 14;
    // Match 38    Tunisia      		 France
    dw 15;
    dw 12;
    // Match 39    Poland       		 Argentina
    dw 11;
    dw 8;
    // Match 40    Saudi Arabia 		 Mexico
    dw 9;
    dw 10;
    // Match 41    Croatia      		 Belgium
    dw 23;
    dw 20;
    // Match 42    Canada       		 Morocco
    dw 21;
    dw 22;
    // Match 43    Japan        		 Spain
    dw 19;
    dw 16;
    // Match 44    Costa Rica 		     Germany
    dw 17;
    dw 18;
    // Match 45    Ghana        		 Uruguay
    dw 29;
    dw 30;
    // Match 46    South Korea 		     Portugal
    dw 31;
    dw 28;
    // Match 47    Serbia       		 Switzerland
    dw 25;
    dw 26;
    // Match 48    Cameroon         	 Brazil
    dw 27;
    dw 24;
}