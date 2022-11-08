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
from openzeppelin.upgrades.library import Proxy

from src.data import lookup_team, lookup_match, lookup_group_matches, Team, Match

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
    Proxy.initializer(owner);
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

    if (id == 57) {
        return inner_match(49, 50);
    }

    if (id == 58) {
        return inner_match(53, 54);
    }

    if (id == 59) {
        return inner_match(51, 52);
    }

    if (id == 60) {
        return inner_match(55, 56);
    }

    if (id == 61) {
        return inner_match(57, 58);
    }

    if (id == 62) {
        return inner_match(59, 60);
    }

    return inner_match(61, 62);
}

func inner_match{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(match_a: felt, match_b: felt) -> (team_a: felt, team_b: felt) {
    alloc_locals;

    let (team1_a, team1_b) = result(match_a);
    let (team2_a, team2_b) = result(match_b);

    // They can't be equal in knockout.
    let first = is_le(team1_a, team1_b);
    let second = is_le(team2_a, team2_b);

    if (first == 1 and second == 1) {
        return (team_a=team1_b, team_b=team2_b);
    }

    if (first == 1 and second == 0) {
        return (team_a=team1_b, team_b=team2_a);
    }

    if (first == 0 and second == 1) {
        return (team_a=team1_a, team_b=team2_b);
    }

    if (first == 0 and second == 0) {
        return (team_a=team1_a, team_b=team2_a);
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
    // We add one to results so we can tell the difference between a 0-0 draw and not played.
    Tournament_result.write(match_id, Result(team_a + 1, team_b + 1));
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
    Proxy._set_admin(newOwner);
    return ();
}

@external
func renounceOwnership{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    Ownable.renounce_ownership();
    Proxy._set_admin(0);
    return ();
}

@external
func upgrade{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    implementation: felt
) {
    Proxy.assert_only_admin();
    Proxy._set_implementation_hash(implementation);
    return ();
}

@view
func implementation{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (implementation: felt) {
    return Proxy.get_implementation_hash();
}