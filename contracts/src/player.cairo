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
from openzeppelin.security.initializable.library import Initializable
from openzeppelin.security.pausable.library import Pausable
from openzeppelin.token.erc721.library import ERC721
from openzeppelin.token.erc721.enumerable.library import ERC721Enumerable
from openzeppelin.token.erc20.IERC20 import IERC20
from openzeppelin.upgrades.library import Proxy

from src.components import lookup_body, lookup_boots, lookup_hair, lookup_numbers, lookup_teams
from src.data import lookup_team, lookup_number

@event
func quest_progress(
  id: felt,
  player: felt,
  metadataURI_len: felt,
  metadataURI: felt*
) {
}

const MAX = 832;

@contract_interface
namespace IPlayer {
    func initialize(owner: felt) {
    }

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

    func unpause() {
    }

    func mint_to(to: felt) {
    }

    func reveal() {
    }

    func totalSupply() -> (totalSupply: Uint256) {
    }

    func tokenByIndex(index: Uint256) -> (tokenId: Uint256) {
    }

    func tokenOfOwnerByIndex(owner: felt, index: Uint256) -> (tokenId: Uint256) {
    }

    func tokenURI(tokenId: Uint256) -> (tokenURI_len: felt, tokenURI: felt*) {
    }

    func upgrade(implementation: felt) {
    }

    func implementation() -> (implementation: felt) {
    }
}

@storage_var
func Player_seed() -> (res : felt) {
}

//
// Constructor
//

@external
func initialize{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}(owner: felt) {
    Initializable.initialize();
    ERC721.initializer('Player', 'PLAYER');
    ERC721Enumerable.initializer();
    Ownable.initializer(owner);
    Proxy.initializer(owner);
    Pausable._pause();
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

    let (seed) = Player_seed.read();
    let (_, rem) = unsigned_div_rem(seed * tokenId.low, MAX);

    let (_, background_idx) = unsigned_div_rem(rem, 2);
    let (_, body_idx) = unsigned_div_rem(rem, 4);
    let (_, team_idx) = unsigned_div_rem(rem, 32);
    let (_, number_idx) = unsigned_div_rem(rem, 26);
    let (_, boot_idx) = unsigned_div_rem(rem, 4);
    let (_, hair_idx) = unsigned_div_rem(rem, 37);

    let (body_len, body) = lookup_body(body_idx);
    let (teams_len, teams) = lookup_teams(team_idx);
    let (number_len, number) = lookup_numbers(number_idx);
    let (boots_len, boots) = lookup_boots(boot_idx);
    let (hair_len, hair) = lookup_hair(hair_idx);

    // Teams are 1 indexed in the schedule;
    let team = lookup_team(team_idx + 1);
    let number_str = lookup_number(number_idx);

    let (arr) = alloc();
    assert arr[0] = 'data:application/json,{"name":"';
    assert arr[1] = team.name;
    assert arr[2] = ' #';
    assert arr[3] = number_str;
    assert arr[4] = '","descr';
    assert arr[5] = 'iption":"2022 World Cup Playe';
    assert arr[6] = 'r","image":"data:image/svg+xml';
    assert arr[7] = ',<?xml version=\"1.0\"  encodi';
    assert arr[8] = 'ng=\"UTF-8\"?><svg xmlns=\"htt';
    assert arr[9] = 'p://www.w3.org/2000/svg\" shap';
    assert arr[10] = 'e-rendering=\"crispEdges\" wid';
    assert arr[11] = 'th=\"320\" height=\"320\"><rec';
    assert arr[12] = 't width=\"320px\" height=\"';

    if (background_idx == 0) {
        assert arr[13] = '320px\" fill=\"#ffcc02\" />';
    } else {
        assert arr[13] = '320px\" fill=\"#5a6ec7\" />';
    }

    memcpy(arr + 14, body, body_len);
    memcpy(arr + 14 + body_len, teams, teams_len);
    memcpy(arr + 14 + body_len + teams_len, number, number_len);
    memcpy(arr + 14 + body_len + teams_len + number_len, boots, boots_len);
    memcpy(arr + 14 + body_len + teams_len + number_len + boots_len, hair, hair_len);

    let len = 14 + hair_len + boots_len + number_len + teams_len + body_len;

    assert arr[len] = '</svg>","attributes":[{"trait_';
    assert arr[len + 1] = 'type":"Team","value":"';
    assert arr[len + 2] = team.name;
    assert arr[len + 3] = '"},{"trait_type":"Group","valu';
    assert arr[len + 4] = 'e":"';
    assert arr[len + 5] = team.group;
    assert arr[len + 6] = '"}]}';

    return (tokenURI_len=len + 7, tokenURI=arr);
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
func totalSupply{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}() -> (
    totalSupply: Uint256
) {
    let (totalSupply: Uint256) = ERC721Enumerable.total_supply();
    return (totalSupply=totalSupply);
}

@view
func tokenByIndex{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    index: Uint256
) -> (tokenId: Uint256) {
    let (tokenId: Uint256) = ERC721Enumerable.token_by_index(index);
    return (tokenId=tokenId);
}

@view
func tokenOfOwnerByIndex{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    owner: felt, index: Uint256
) -> (tokenId: Uint256) {
    let (tokenId: Uint256) = ERC721Enumerable.token_of_owner_by_index(owner, index);
    return (tokenId=tokenId);
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
    ERC721Enumerable.transfer_from(from_, to, tokenId);
    return ();
}

@external
func safeTransferFrom{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    from_: felt, to: felt, tokenId: Uint256, data_len: felt, data: felt*
) {
    Pausable.assert_not_paused();
    ERC721Enumerable.safe_transfer_from(from_, to, tokenId, data_len, data);
    return ();
}

@external
func mint_to{pedersen_ptr: HashBuiltin*, syscall_ptr: felt*, range_check_ptr}(
    to: felt,
) {
    alloc_locals;
    Ownable.assert_only_owner();

    let (seed) = Player_seed.read();
    with_attr error_message("mint over") {
        assert seed = 0;
    }

    let (supply: Uint256) = ERC721Enumerable.total_supply();
    with_attr error_message("sold out") {
        assert_not_zero(MAX - supply.low);
    }

    // There can only ever be 832 NFTs.
    ERC721Enumerable._mint(to, supply);

    return ();
}

@external
func reveal{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() {
    Ownable.assert_only_owner();

    // We trust starkware not to manipulate the timestamp *shrug*
    let (time) = get_block_timestamp();
    Player_seed.write(time);
    return ();
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