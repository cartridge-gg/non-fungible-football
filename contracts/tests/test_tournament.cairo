%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_caller_address
from starkware.cairo.common.alloc import alloc

from src.tournament import ITournament, Result, lookup_team, lookup_match

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
        ids.contract_address = deploy_contract("./src/tournament.cairo").contract_address
    %}

    ITournament.initialize(contract_address, 123);
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
        ids.contract_address = deploy_contract("./src/tournament.cairo").contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    ITournament.initialize(contract_address, 123);

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

    let (group_results: felt*) = alloc();
    assert group_results[0] = 49;
    assert group_results[1] = 2;
    assert group_results[2] = 3;

    assert group_results[3] = 50;
    assert group_results[4] = 7;
    assert group_results[5] = 5;

    assert group_results[6] = 51;
    assert group_results[7] = 11;
    assert group_results[8] = 9;

    assert group_results[9] = 52;
    assert group_results[10] = 13;
    assert group_results[11] = 5;

    assert group_results[12] = 53;
    assert group_results[13] = 17;
    assert group_results[14] = 19;

    assert group_results[15] = 54;
    assert group_results[16] = 21;
    assert group_results[17] = 23;

    assert group_results[18] = 55;
    assert group_results[19] = 25;
    assert group_results[20] = 28;

    assert group_results[21] = 56;
    assert group_results[22] = 29;
    assert group_results[23] = 31;

    ITournament.finalize_group(contract_address, 24, group_results);

    let (match_ids2: felt*) = alloc();
    assert match_ids2[0] = 49;
    assert match_ids2[1] = 50;
    assert match_ids2[2] = 51;
    assert match_ids2[3] = 52;
    assert match_ids2[4] = 53;
    assert match_ids2[5] = 54;
    assert match_ids2[6] = 55;
    assert match_ids2[7] = 56;
    let (matches_len2, matches2) = ITournament.matches(contract_address, 8, match_ids2);

    assert matches2[0] = 2;
    assert matches2[1] = 3;
    assert matches2[2] = 7;
    assert matches2[3] = 5;
    assert matches2[4] = 11;
    assert matches2[5] = 9;
    assert matches2[6] = 13;
    assert matches2[7] = 5;
    assert matches2[8] = 17;
    assert matches2[9] = 19;
    assert matches2[10] = 21;
    assert matches2[11] = 23;
    assert matches2[12] = 25;
    assert matches2[13] = 28;
    assert matches2[14] = 29;
    assert matches2[15] = 31;

    %{ stop_prank_callable() %}

    return ();
}

@external
func test_results{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/tournament.cairo").contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    ITournament.initialize(contract_address, 123);
    ITournament.update(contract_address, 1, 1, 2);

    let (team1_a, team1_b) = ITournament.result(contract_address, 1);
    assert team1_a = 2;
    assert team1_b = 3;

    ITournament.update(contract_address, 11, 19, 0);

    let (team2_a, team2_b) = ITournament.result(contract_address, 11);
    assert team2_a = 20;
    assert team2_b = 1;

    let (match_ids: felt*) = alloc();
    assert match_ids[0] = 1;
    assert match_ids[1] = 11;

    let (matches_len, matches) = ITournament.results(contract_address, 2, match_ids);
    assert matches_len = 4;
    assert matches[0] = 2;
    assert matches[1] = 3;
    assert matches[2] = 20;
    assert matches[3] = 1;

    %{ stop_prank_callable() %}

    return ();
}

@external
func test_upgrade{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local initial_implementation: felt;
    local fake_implementation: felt;
    local contract_address: felt;
    %{
        from starkware.starknet.compiler.compile import get_selector_from_name
        ids.initial_implementation = declare("./src/tournament.cairo").class_hash
        ids.fake_implementation = declare("./src/player.cairo").class_hash
        ids.contract_address = deploy_contract("./lib/cairo_contracts/src/openzeppelin/upgrades/presets/proxy.cairo", [ids.initial_implementation, get_selector_from_name('initialize'), 1, 123]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    let (implementation) = ITournament.implementation(contract_address);
    assert implementation = initial_implementation;

    ITournament.upgrade(contract_address, fake_implementation);

    let (next_implementation) = ITournament.implementation(contract_address);
    assert next_implementation = fake_implementation;

    %{ 
        stop_prank_callable()
    %}

    return ();
}
