// SPDX-License-Identifier: MIT

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256

from openzeppelin.access.ownable.library import Ownable
from openzeppelin.security.pausable.library import Pausable

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    owner: felt
) {
    Ownable.initializer(owner);
    return ();
}

// return the fixtures for a team. since we only store finalized outcomes
// this returns the results of a teams fixtures.
@view
func fixtures(team felt) -> () {
}

// returns if a team is currently active (aka hasn't been knocked out).
@view
func active(team felt) -> (active: felt) {
}

// returns champion team if the tournament has been finalized. otherwise returns
// returns 0.
@view
func champion() -> (team: felt) {
}

@view
func owner{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (owner: felt) {
    return Ownable.owner();
}

// add a team to the tournament.
@external
func add{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    name felt, group felt
) {
    Ownable.assert_only_owner();
    return ();
}

// update the outcome of a game. calling update creates a unique fixture associated with
// the corresponding teams.
@external
func update{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    team_a felt, team_b felt, score_a felt, score_b felt
) {
    Ownable.assert_only_owner();
    return ();
}

// knock a team our of the tournament.
@external
func knockout{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    team felt
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
