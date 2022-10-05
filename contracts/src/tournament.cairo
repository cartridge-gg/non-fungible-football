// SPDX-License-Identifier: MIT

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.cairo.common.registers import get_label_location
from starkware.cairo.common.alloc import alloc
from starkware.cairo.common.math_cmp import is_le
from starkware.cairo.common.math import assert_not_zero

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

    func result(match_id: felt) -> (team_a: felt, team_b: felt) {
    }

    func results(matches_len: felt, matches: felt*) -> (teams_len: felt, teams: felt*) {
    }

    func update(match_id: felt, team_a: felt, team_b: felt) {
    }

    func finalize_group(results_len: felt, results: felt*) {
    }
}

@storage_var
func Tournament_alive(team_id: felt) -> (alive: felt) {
}

@storage_var
func Tournament_result(match_id: felt) -> (result: Result) {
}

@storage_var
func Tournament_round_sixteen(match_id: felt) -> (match: Match) {
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
func match{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(id: felt) -> (team_a: felt, team_b: felt) {
    alloc_locals;

    let is_group = is_le(id, 48);
    if (is_group == 1) {
        let match = lookup_match(id);
        return (team_a=match.team_a, team_b=match.team_b);
    }

    let is_sixteen = is_le(id, 56);
    if (is_sixteen == 1) {
        let (res) = Tournament_round_sixteen.read(id);
        return (team_a=res.team_a, team_b=res.team_b);
    }

    return (team_a=0, team_b=0);
}

@view
func matches{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(ids_len: felt, ids: felt*) -> (matches_len: felt, matches: felt*) {
    alloc_locals;
    let (res) = alloc();
    matches_inner(ids_len, ids, res);
    return (2 * ids_len, res);
}

func matches_inner{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(ids_len: felt, ids: felt*, matches: felt*) {
    alloc_locals;

    if (ids_len == 0) {
        return ();
    }

    let id = ids[0];
    let (team_a, team_b) = match(ids[0]);
    assert matches[0] = team_a;
    assert matches[1] = team_b;
    return matches_inner(ids_len - 1, ids + 1, matches + 2);
}

@view
func result{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(match_id: felt) -> (team_a: felt, team_b: felt) {
    let (res) = Tournament_result.read(match_id);
    return (team_a=res.team_a, team_b=res.team_b);
}

@view
func results{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(ids_len: felt, ids: felt*) -> (results_len: felt, results: felt*) {
    alloc_locals;
    let (res) = alloc();
    results_inner(ids_len, ids, res);
    return (2 * ids_len, res);
}

func results_inner{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(ids_len: felt, ids: felt*, results: felt*) {
    alloc_locals;

    if (ids_len == 0) {
        return ();
    }

    let id = ids[0];
    let res = result(id);
    assert results[0] = res.team_a;
    assert results[1] = res.team_b;

    return results_inner(ids_len - 1, ids + 1, results + 2);
}

// returns if a team is currently active (aka hasn't been knocked out).
@view
func alive{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(team_id: felt) -> (alive: felt) {
    let (is_alive) = Tournament_alive.read(team_id);

    // We invert the boolean to initialize to all TRUE.
    if (is_alive == 0) {
        return (alive=1);
    }

    return (alive=0);
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
    match_id: felt, team_a: felt, team_b: felt,
) {
    alloc_locals;
    Ownable.assert_only_owner();
    Tournament_result.write(match_id, Result(team_a, team_b));
    return ();
}

// finalize the tournament. accepts input array with shape [match_id, team_a, team_b].
@external
func finalize_group{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(results_len: felt, results: felt*) {
    Ownable.assert_only_owner();

    inner_finalize_group(results_len, results);

    return ();
}

func inner_finalize_group{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(results_len: felt, results: felt*) {
    if (results_len == 0) {
        return ();
    }

    Tournament_round_sixteen.write(results[0], Match(results[1], results[2]));

    return inner_finalize_group(results_len - 3, results + 3);
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
    return cast(addr + ((index - 1) * 2), Team*);

    data_start:
    dw 'Qatar';         // 1
    dw 'A';
    dw 'Ecuador';       // 2
    dw 'A';
    dw 'Senegal';       // 3
    dw 'A';
    dw 'Netherlands';   // 4
    dw 'A';
    dw 'England';       // 5
    dw 'B';
    dw 'Iran';          // 6
    dw 'B';
    dw 'United States'; // 7
    dw 'B';
    dw 'Wales';         // 8
    dw 'B';
    dw 'Argentina';     // 9
    dw 'C';
    dw 'Saudi Arabia';  // 10
    dw 'C';
    dw 'Mexico';        // 11
    dw 'C';
    dw 'Poland';        // 12
    dw 'C';
    dw 'France';        // 13
    dw 'D';
    dw 'Australia';     // 14
    dw 'D';
    dw 'Denmark';       // 15
    dw 'D';
    dw 'Tunisia';       // 16
    dw 'D';
    dw 'Spain';         // 17
    dw 'E';
    dw 'Costa Rica';    // 18
    dw 'E';
    dw 'Germany';       // 19
    dw 'E';
    dw 'Japan';         // 20
    dw 'E';
    dw 'Belgium';       // 21
    dw 'F';
    dw 'Canada';        // 22
    dw 'F';
    dw 'Morocco';       // 23
    dw 'F';
    dw 'Croatia';       // 24
    dw 'F';
    dw 'Brazil';        // 25
    dw 'G';
    dw 'Serbia';        // 26
    dw 'G';
    dw 'Switzerland';   // 27
    dw 'G';
    dw 'Cameroon';      // 28
    dw 'G';
    dw 'Portugal';      // 29
    dw 'H';
    dw 'Ghana';         // 30
    dw 'H';
    dw 'Uruguay';       // 31
    dw 'H';
    dw 'South Korea';   // 32
    dw 'H';
}

func lookup_match(index: felt) -> Match* {
    let (addr) = get_label_location(data_start);
    return cast(addr + ((index - 1) * 2), Match*);

    data_start:
    // Match 1     Qatar        		 Ecuador
    dw 1;
    dw 2;
    // Match 2     Senegal      		 Netherlands
    dw 3;
    dw 4;
    // Match 3     England      		 Iran
    dw 5;
    dw 6;
    // Match 4     United States 		 Wales
    dw 7;
    dw 8;
    // Match 5     France       		 Australia
    dw 13;
    dw 14;
    // Match 6     Denmark      		 Tunisia
    dw 15;
    dw 16;
    // Match 7     Mexico       		 Poland
    dw 11;
    dw 12;
    // Match 8     Argentina             Saudi Arabia
    dw 9;
    dw 10;
    // Match 9     Belgium      		 Canada
    dw 21;
    dw 22;
    // Match 10    Spain        		 Costa Rica
    dw 17;
    dw 18;
    // Match 11    Germany      		 Japan
    dw 19;
    dw 20;
    // Match 12    Morocco      		 Croatia
    dw 23;
    dw 24;
    // Match 13    Switzerland           Cameroon
    dw 27;
    dw 28;
    // Match 14    Uruguay      		 South Korea
    dw 31;
    dw 32;
    // Match 15    Portugal              Ghana
    dw 29;
    dw 30;
    // Match 16    Brazil       		 Serbia
    dw 25;
    dw 26;
    // Match 17    Wales        		 Iran
    dw 8;
    dw 6;
    // Match 18    Qatar        		 Senegal
    dw 1;
    dw 3;
    // Match 19    Netherlands      	 Ecuador
    dw 4;
    dw 2;
    // Match 20    England      		 United States
    dw 5;
    dw 7;
    // Match 21    Tunisia      		 Australia
    dw 16;
    dw 14;
    // Match 22    Poland       		 Saudi Arabia
    dw 12;
    dw 10;
    // Match 23    France       		 Denmark
    dw 13;
    dw 15;
    // Match 24    Argentina        	 Mexico
    dw 9;
    dw 11;
    // Match 25    Japan        		 Costa Rica
    dw 20;
    dw 18;
    // Match 26    Belgium      		 Morocco
    dw 21;
    dw 23;
    // Match 27    Croatia      		 Canada
    dw 24;
    dw 22;
    // Match 28    Spain        		 Germany
    dw 17;
    dw 19;
    // Match 29    Cameroon              Serbia
    dw 28;
    dw 26;
    // Match 30    South Korea 		     Ghana
    dw 32;
    dw 30;
    // Match 31    Brazil       		 Switzerland
    dw 25;
    dw 27;
    // Match 32    Portugal              Uruguay
    dw 29;
    dw 31;
    // Match 33    Wales        		 England
    dw 8;
    dw 5;
    // Match 34    Iran         		 United States
    dw 6;
    dw 7;
    // Match 35    Ecuador      		 Senegal
    dw 2;
    dw 3;
    // Match 36    Netherlands      	 Qatar
    dw 4;
    dw 1;
    // Match 37    Australia             Denmark
    dw 14;
    dw 15;
    // Match 38    Tunisia      		 France
    dw 16;
    dw 13;
    // Match 39    Poland       		 Argentina
    dw 12;
    dw 9;
    // Match 40    Saudi Arabia 		 Mexico
    dw 10;
    dw 11;
    // Match 41    Croatia      		 Belgium
    dw 24;
    dw 21;
    // Match 42    Canada       		 Morocco
    dw 22;
    dw 23;
    // Match 43    Japan        		 Spain
    dw 20;
    dw 17;
    // Match 44    Costa Rica 		     Germany
    dw 18;
    dw 19;
    // Match 45    Ghana        		 Uruguay
    dw 30;
    dw 31;
    // Match 46    South Korea 		     Portugal
    dw 32;
    dw 29;
    // Match 47    Serbia       		 Switzerland
    dw 26;
    dw 27;
    // Match 48    Cameroon         	 Brazil
    dw 28;
    dw 25;
}

func lookup_group_matches(index: felt) -> felt* {
    let (addr) = get_label_location(data_start);
    return cast(addr + ((index - 1) * 6), felt*);

    data_start:
    // Group A
    dw 1;
    dw 2;
    dw 18;
    dw 19;
    dw 35;
    dw 36;
    // Group B
    dw 3;
    dw 4;
    dw 17;
    dw 20;
    dw 33;
    dw 34;
    // Group C
    dw 8;
    dw 7;
    dw 22;
    dw 24;
    dw 39;
    dw 40;
    // Group D
    dw 6;
    dw 5;
    dw 21;
    dw 23;
    dw 37;
    dw 38;
    // Group E
    dw 11;
    dw 10;
    dw 25;
    dw 28;
    dw 43;
    dw 44;
    // Group F
    dw 12;
    dw 9;
    dw 26;
    dw 27;
    dw 41;
    dw 42;
    // Group G
    dw 13;
    dw 16;
    dw 29;
    dw 31;
    dw 47;
    dw 48;
    // Group H
    dw 14;
    dw 15;
    dw 30;
    dw 32;
    dw 45;
    dw 46;
}
