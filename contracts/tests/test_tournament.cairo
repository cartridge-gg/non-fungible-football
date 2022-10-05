%lang starknet
from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_caller_address
from starkware.cairo.common.alloc import alloc

from src.tournament import ITournament, lookup_team, lookup_match

@external
func test_lookup_team{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    let qatar = lookup_team(0);
    assert qatar.name = 'Qatar';
    assert qatar.group = 'A';

    let ecuador = lookup_team(1);
    assert ecuador.name = 'Ecuador';
    assert ecuador.group = 'A';

    let iran = lookup_team(5);
    assert iran.name = 'Iran';
    assert iran.group = 'B';

    return ();
}

func test_lookup_match{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    let one = lookup_match(1);
    assert one.team_a = 0;
    assert one.team_b = 1;

    let five = lookup_match(5);
    assert five.team_a = 12;
    assert five.team_b = 13;

    return ();
}

@external
func test_getters{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;
    
    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/tournament.cairo", [123]).contract_address
    %}

    let (name, group) = ITournament.team(contract_address, 0);
    assert name = 'Qatar';
    assert group = 'A';

    let (team_ids: felt*) = alloc();
    assert team_ids[0] = 0;
    assert team_ids[1] = 5;
    assert team_ids[2] = 10;

    let (teams_len, teams) = ITournament.teams(contract_address, 3, team_ids);
    assert teams_len = 6;
    assert teams[0] = 'Qatar';
    assert teams[1] = 'A';
    assert teams[2] = 'Iran';
    assert teams[3] = 'B';
    assert teams[4] = 'Mexico';
    assert teams[5] = 'C';

    let (team_a, team_b) = ITournament.match(contract_address, 1);
    assert team_a = 0;
    assert team_b = 1;

    let (match_ids: felt*) = alloc();
    assert match_ids[0] = 1;
    assert match_ids[1] = 6;
    assert match_ids[2] = 11;

    let (matches_len, matches) = ITournament.matches(contract_address, 3, match_ids);
    assert matches_len = 6;
    assert matches[0] = 0;
    assert matches[1] = 1;
    assert matches[2] = 14;
    assert matches[3] = 15;
    assert matches[4] = 18;
    assert matches[5] = 19;

    return ();
}
