// SPDX-License-Identifier: MIT
// OpenZeppelin Contracts for Cairo v0.4.0b (token/erc721/presets/ERC721MintablePausable.cairo)

%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_block_timestamp, get_caller_address, get_contract_address
from starkware.cairo.common.math import assert_not_zero, assert_le, unsigned_div_rem
from starkware.cairo.common.memcpy import memcpy
from starkware.cairo.common.alloc import alloc

from openzeppelin.access.ownable.library import Ownable
from openzeppelin.introspection.erc165.library import ERC165
from openzeppelin.security.pausable.library import Pausable
from openzeppelin.token.erc721.library import ERC721
from openzeppelin.token.erc20.IERC20 import IERC20

from src.discrete import DiscreteGDA
from cairo_math_64x61.math64x61 import Math64x61
from src.components import lookup_body, lookup_boots, lookup_hair, lookup_numbers, lookup_teams

const MAX = 832;

@contract_interface
namespace IPlayer {
    func balanceOf(owner: felt) -> (balance: Uint256) {
    }

    func ownerOf(tokenId: Uint256) -> (owner: felt) {
    }

    func safeTransferFrom(from_: felt, to: felt, tokenId: Uint256, data_len: felt, data: felt*) {
    }

    func transferFrom(from_: felt, to: felt, tokenId: Uint256) {
    }

    func approve(approved: felt, tokenId: Uint256) {
    }

    func setApprovalForAll(operator: felt, approved: felt) {
    }

    func getApproved(tokenId: Uint256) -> (approved: felt) {
    }

    func isApprovedForAll(owner: felt, operator: felt) -> (isApproved: felt) {
    }

    func owner() -> (owner: felt) {
    }

    func paused() -> (paused: felt) {
    }

    func purchase(value: felt) {
    }

    func price() -> (price: felt) {
    }

    func supply() -> (supply: felt) {
    }

    func tokenURI(tokenId: Uint256) -> (tokenURI_len: felt, tokenURI: felt*) {
    }
}

@storage_var
func Player_payment_token() -> (res : felt) {
}

@storage_var
func Player_supply() -> (res : felt) {
}

@storage_var
func Player_seed() -> (res : felt) {
}

//
// Constructor
//

@constructor
func constructor{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(owner: felt, auction_start_time: felt) {
    ERC721.initializer('Player', 'PLAYER');
    Ownable.initializer(owner);

    let initial_price = 100000000000000000;
    let initial_price_fp = Math64x61.fromFelt(initial_price);
    let scale_factor_fp = Math64x61.div(Math64x61.fromFelt(11), Math64x61.fromFelt(10)); 
    let decay_constant_fp = Math64x61.div(Math64x61.fromFelt(1), Math64x61.fromFelt(2));
    let auction_start_time_fp = Math64x61.fromFelt(auction_start_time);

    DiscreteGDA.initializer(initial_price_fp, scale_factor_fp, decay_constant_fp, auction_start_time_fp);
    return ();
}

//
// Getters
//

@view
func supportsInterface{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    interfaceId: felt
) -> (success: felt) {
    return ERC165.supports_interface(interfaceId);
}

@view
func name{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (name: felt) {
    return ERC721.name();
}

@view
func symbol{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (symbol: felt) {
    return ERC721.symbol();
}

@view
func balanceOf{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(owner: felt) -> (
    balance: Uint256
) {
    return ERC721.balance_of(owner);
}

@view
func ownerOf{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(tokenId: Uint256) -> (
    owner: felt
) {
    return ERC721.owner_of(tokenId);
}

@view
func getApproved{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    tokenId: Uint256
) -> (approved: felt) {
    return ERC721.get_approved(tokenId);
}

@view
func isApprovedForAll{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    owner: felt, operator: felt
) -> (isApproved: felt) {
    let (isApproved: felt) = ERC721.is_approved_for_all(owner, operator);
    return (isApproved=isApproved);
}

@view
func tokenURI{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    tokenId: Uint256
) -> (tokenURI_len: felt, tokenURI: felt*) {
    alloc_locals;
    // let (seed) = Player_seed.read();
    // let (_, rem) = unsigned_div_rem(seed * tokenId.low, MAX);

    let (arr) = alloc();
    assert arr[0] = '<svg xmlns="http://www.w3.org/';
    assert arr[1] = '2000/svg" shape-rendering="cri';
    assert arr[2] = 'spEdges" width="320" height="3';
    assert arr[3] = '20">';

    let (_, body) = unsigned_div_rem(tokenId.low, 4);
    let (_, team) = unsigned_div_rem(tokenId.low, 32);
    let (_, number) = unsigned_div_rem(tokenId.low, 26);
    let (_, boot) = unsigned_div_rem(tokenId.low, 4);
    let (_, hair) = unsigned_div_rem(tokenId.low, 37);

    let (body_len, body) = lookup_body(body);
    let (teams_len, teams) = lookup_teams(team);
    let (numbers_len, numbers) = lookup_numbers(number);
    let (boots_len, boots) = lookup_boots(boot);
    let (hairs_len, hairs) = lookup_hair(hair);

    memcpy(arr + 4, body, body_len);
    memcpy(arr + 4 + body_len, teams, teams_len);
    memcpy(arr + 4 + body_len + teams_len, numbers, numbers_len);
    memcpy(arr + 4 + body_len + teams_len + numbers_len, boots, boots_len);
    memcpy(arr + 4 + body_len + teams_len + numbers_len + boots_len, hairs, hairs_len);

    let len = 4 + hairs_len + boots_len + numbers_len + teams_len + body_len;

    assert arr[len] = '</svg>';

    return (tokenURI_len=len + 1, tokenURI=arr);
}

@view
func owner{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (owner: felt) {
    return Ownable.owner();
}

@view
func paused{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (paused: felt) {
    return Pausable.is_paused();
}

@view
func price{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}() -> (price: felt) {
    let (supply) = Player_supply.read();
    let price = DiscreteGDA.purchase_price(1, supply);
    return (price=price);
}

@view
func supply{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}() -> (supply: felt) {
    let (supply) = Player_supply.read();
    return (supply=supply);
}

//
// Externals
//

@external
func approve{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    to: felt, tokenId: Uint256
) {
    Pausable.assert_not_paused();
    ERC721.approve(to, tokenId);
    return ();
}

@external
func setApprovalForAll{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(
    operator: felt, approved: felt
) {
    Pausable.assert_not_paused();
    ERC721.set_approval_for_all(operator, approved);
    return ();
}

@external
func transferFrom{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    from_: felt, to: felt, tokenId: Uint256
) {
    Pausable.assert_not_paused();
    ERC721.transfer_from(from_, to, tokenId);
    return ();
}

@external
func safeTransferFrom{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    from_: felt, to: felt, tokenId: Uint256, data_len: felt, data: felt*
) {
    Pausable.assert_not_paused();
    ERC721.safe_transfer_from(from_, to, tokenId, data_len, data);
    return ();
}

@external
func purchase{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    value: felt,
) {
    alloc_locals;
    Pausable.assert_not_paused();

    let (to) = get_caller_address();
    let (supply) = Player_supply.read();

    with_attr error_message("sold out") {
        assert_not_zero(MAX - supply);
    }

    // Hardcoded until we can fix overflow issues with GDA.
    let price = 1000000000000000;
    // DiscreteGDA.purchase_price(1, supply);

    with_attr error_message("insufficient payment") {
        assert_le(price, value+1);
    }

    Player_supply.write(supply + 1);

    // There can only ever be 832 NFTs.
    ERC721._mint(to, Uint256(low=supply, high=0));

    if (supply + 1 == MAX) {
        // We trust starkware not to manipulate the timestamp *shrug*
        let (time) = get_block_timestamp();
        Player_seed.write(time);
        return ();
    }

    let (contract_address) = get_contract_address();

    let (success) = IERC20.transferFrom(0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7, to, contract_address, Uint256(low=price, high=0));

    with_attr error_message("payment failed") {
        assert_not_zero(success);
    }

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

@external
func pause{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    Ownable.assert_only_owner();
    Pausable._pause();
    return ();
}

@external
func unpause{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    Ownable.assert_only_owner();
    Pausable._unpause();
    return ();
}
