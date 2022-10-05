%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_caller_address
from starkware.cairo.common.alloc import alloc

from src.tournament import ITournament, lookup_team, lookup_match

@external
func test_lookup_team{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    let qatar = lookup_team(1);
    assert qatar.name = 'Qatar';
    assert qatar.group = 'A';

    let ecuador = lookup_team(2);
    assert ecuador.name = 'Ecuador';
    assert ecuador.group = 'A';

    let iran = lookup_team(6);
    assert iran.name = 'Iran';
    assert iran.group = 'B';

    return ();
}

func test_lookup_match{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    let one = lookup_match(1);
    assert one.team_a = 1;
    assert one.team_b = 2;

    let five = lookup_match(5);
    assert five.team_a = 13;
    assert five.team_b = 14;

    return ();
}

@external
func test_teams{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/tournament.cairo", [123]).contract_address
    %}

    let (name, group) = ITournament.team(contract_address, 1);
    assert name = 'Qatar';
    assert group = 'A';

    let (team_ids: felt*) = alloc();
    assert team_ids[0] = 1;
    assert team_ids[1] = 6;
    assert team_ids[2] = 11;

    let (teams_len, teams) = ITournament.teams(contract_address, 3, team_ids);
    assert teams_len = 6;
    assert teams[0] = 'Qatar';
    assert teams[1] = 'A';
    assert teams[2] = 'Iran';
    assert teams[3] = 'B';
    assert teams[4] = 'Mexico';
    assert teams[5] = 'C';

    return ();
}

@external
func test_matches{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{
        ids.contract_address = deploy_contract("./src/tournament.cairo", [123]).contract_address
    %}

    let (team_a, team_b) = ITournament.match(contract_address, 1);
    assert team_a = 1;
    assert team_b = 2;

    let (match_ids: felt*) = alloc();
    assert match_ids[0] = 1;
    assert match_ids[1] = 6;
    assert match_ids[2] = 11;

    let (matches_len, matches) = ITournament.matches(contract_address, 3, match_ids);
    assert matches_len = 6;
    assert matches[0] = 1;
    assert matches[1] = 2;
    assert matches[2] = 15;
    assert matches[3] = 16;
    assert matches[4] = 19;
    assert matches[5] = 20;

    return ();
}

@external
func test_results{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/tournament.cairo", [123]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    ITournament.update(contract_address, 1, 1);

    let (match1) = ITournament.result(contract_address, 1);
    assert match1 = 1;

    ITournament.update(contract_address, 11, 19);

    let (match11) = ITournament.result(contract_address, 11);
    assert match11 = 19;

    %{ expect_revert(error_message="invalid update") %}
    ITournament.update(contract_address, 11, 3);

    %{ stop_prank_callable() %}

    return ();
}
