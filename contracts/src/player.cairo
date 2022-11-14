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

from src.configuration import lookup_config
from src.components import lookup_accessory, lookup_beards, lookup_body, lookup_boots, lookup_hair, lookup_numbers, lookup_teams
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
    ERC721.initializer('Non Fungible Player', 'PLAYER');
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

    if (seed == 0) {
        let (placeholder_len, placeholder) = build_placeholder(tokenId);
        return (tokenURI_len=placeholder_len, tokenURI=placeholder);
    }

    let (_, rem) = unsigned_div_rem(seed * tokenId.low, MAX);

    let (_, background_idx) = unsigned_div_rem(rem, 2);
    let (accessory_idx, beard_idx, body_idx, boot_idx, hair_idx, number_idx, team_idx) = lookup_config(rem);

    let (beard_len, beard) = lookup_beards(beard_idx);
    let (body_len, body) = lookup_body(body_idx);
    let (teams_len, teams) = lookup_teams(team_idx);
    let (number_len, number) = lookup_numbers(number_idx);
    let (boots_len, boots) = lookup_boots(boot_idx);
    let (hair_len, hair) = lookup_hair(hair_idx);
    let (accessory_len, accessory) = lookup_accessory(accessory_idx);

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
    memcpy(arr + 14 + body_len + teams_len + number_len + boots_len + hair_len, accessory, accessory_len);
    memcpy(arr + 14 + body_len + teams_len + number_len + boots_len + hair_len + accessory_len, beard, beard_len);

    let len = 14 + beard_len + accessory_len + hair_len + boots_len + number_len + teams_len + body_len;

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

func build_placeholder{syscall_ptr: felt*, range_check_ptr}(tokenId: Uint256) -> (placeholder_len: felt, placeholder: felt*) {
    let (_, rem) = unsigned_div_rem(tokenId.low, MAX);
    let (_, background_idx) = unsigned_div_rem(rem, 2);

    let (placeholder) = alloc();
    assert placeholder[0] = 'data:application/json,{"name":"';
    assert placeholder[1] = 'Not Reaveled","descr';
    assert placeholder[2] = 'iption":"2022 World Cup Playe';
    assert placeholder[3] = 'r","image":"data:image/svg+xml';
    assert placeholder[4] = ',<?xml version=\"1.0\"  encodi';
    assert placeholder[5] = 'ng=\"UTF-8\"?>';

    assert placeholder[6] = '<svg xmlns=\"http://www.w3.org';
    assert placeholder[7] = '/2000/svg\" shape-rendering=\"';
    assert placeholder[8] = 'crispEdges\" width=\"320\" hei';
    assert placeholder[9] = 'ght=\"320\" viewBox=\"0 0 400 ';
    assert placeholder[10] = '400\"><rect width=\"400px\" he';
    assert placeholder[11] = 'ight=\"400px\" fill=\"';

    if (background_idx == 0) {
        assert placeholder[12] = '#ffcc02';
    } else {
        assert placeholder[12] = '#5a6ec7';
    }

    assert placeholder[13] = '\"/><defs><style>.c{fill:#fff;';
    assert placeholder[14] = '}</style></defs><rect class=\"';
    assert placeholder[15] = 'c\" x=\"40.19\" y=\"274.83\" w';
    assert placeholder[16] = 'idth=\"319.63\" height=\"4.98\';
    assert placeholder[17] = '"/><g><path class=\"c\" d=\"M5';
    assert placeholder[18] = '0.72,130.61h-10v-30h10v30Zm10-';
    assert placeholder[19] = '30h-10v-10h20v40h-10v-30Z\"/><';
    assert placeholder[20] = 'path class=\"c\" d=\"M102.22,1';
    assert placeholder[21] = '00.61h10v30h-30v-30h10v20h10v-';
    assert placeholder[22] = '20Zm-10-10h10v10h-10v-10Z\"/><';
    assert placeholder[23] = 'path class=\"c\" d=\"M133.72,1';
    assert placeholder[24] = '30.61h-10v-30h10v30Zm10-30h-10';
    assert placeholder[25] = 'v-10h20v40h-10v-30Z\"/><path c';
    assert placeholder[26] = 'lass=\"c\" d=\"M60.72,172.61h-';
    assert placeholder[27] = '10v20h-10v-40h30v10h-10v10Z\"/';
    assert placeholder[28] = '><path class=\"c\" d=\"M82.22,';
    assert placeholder[29] = '152.61h10v30h10v-30h10v40h-20v';
    assert placeholder[30] = '-10h-10v-30Z\"/><path class=\"';
    assert placeholder[31] = 'c\" d=\"M133.72,192.61h-10v-30';
    assert placeholder[32] = 'h10v30Zm10-30h-10v-10h20v40h-1';
    assert placeholder[33] = '0v-30Z\"/><path class=\"c\" d=';
    assert placeholder[34] = '\"M185.22,172.61h10v20h-30v-30';
    assert placeholder[35] = 'h10v20h10v-10Zm-10-20h10v10h-1';
    assert placeholder[36] = '0v-10Z\"/><path class=\"c\" d=';
    assert placeholder[37] = '\"M206.72,152.61h10v40h-10v-40';
    assert placeholder[38] = 'Z\"/><path class=\"c\" d=\"M22';
    assert placeholder[39] = '8.22,152.61h20v20h-10v10h10v-1';
    assert placeholder[40] = '0h10v20h-30v-40Z\"/><path clas';
    assert placeholder[41] = 's=\"c\" d=\"M269.72,152.61h10v';
    assert placeholder[42] = '30h20v10h-30v-40Z\"/><path cla';
    assert placeholder[43] = 'ss=\"c\" d=\"M331.22,172.61h-1';
    assert placeholder[44] = '0v10h20v10h-30v-40h30v10h-10v1';
    assert placeholder[45] = '0Z\"/><path class=\"c\" d=\"M6';
    assert placeholder[46] = '0.72,234.61h-10v20h-10v-40h30v';
    assert placeholder[47] = '10h-10v10Z\"/><path class=\"c\';
    assert placeholder[48] = '" d=\"M102.22,224.61h10v30h-30';
    assert placeholder[49] = 'v-30h10v20h10v-20Zm-10-10h10v1';
    assert placeholder[50] = '0h-10v-10Z\"/><path class=\"c\';
    assert placeholder[51] = '" d=\"M143.72,224.61h10v30h-30';
    assert placeholder[52] = 'v-30h10v20h10v-20Zm-10-10h10v1';
    assert placeholder[53] = '0h-10v-10Z\"/><path class=\"c\';
    assert placeholder[54] = '" d=\"M165.22,224.61v-10h30v10';
    assert placeholder[55] = 'h-10v30h-10v-30h-10Z\"/><path ';
    assert placeholder[56] = 'class=\"c\" d=\"M206.72,214.61';
    assert placeholder[57] = 'h20v20h-10v10h10v-10h10v20h-30';
    assert placeholder[58] = 'v-40Z\"/><path class=\"c\" d=\';
    assert placeholder[59] = '"M248.22,224.61h10v-10h20v40h-';
    assert placeholder[60] = '10v-20h-10v20h-10v-30Z\"/><pat';
    assert placeholder[61] = 'h class=\"c\" d=\"M289.72,214.';
    assert placeholder[62] = '61h10v30h20v10h-30v-40Z\"/><pa';
    assert placeholder[63] = 'th class=\"c\" d=\"M331.22,214';
    assert placeholder[64] = '.61h10v30h20v10h-30v-40Z\"/></';
    assert placeholder[65] = 'g><g><path class=\"c\" d=\"M39';
    assert placeholder[66] = '.72,293.82h7v21h-7v-21Zm7,21h7';
    assert placeholder[67] = 'v7h-7v-7Zm7-21h7v21h-7v-21Zm7,';
    assert placeholder[68] = '21h7v7h-7v-7Zm7-21h7v21h-7v-21';
    assert placeholder[69] = 'Z\"/><path class=\"c\" d=\"M95';
    assert placeholder[70] = '.37,300.82h7v21h-21v-21h7v14h7';
    assert placeholder[71] = 'v-14Zm-7-7h7v7h-7v-7Z\"/><path';
    assert placeholder[72] = ' class=\"c\" d=\"M116.02,307.8';
    assert placeholder[73] = '2h7v7h-7v7h-7v-28h14v7h-7v7Zm7';
    assert placeholder[74] = '-7h7v7h-7v-7Zm0,14h7v7h-7v-7Z\';
    assert placeholder[75] = '"/><path class=\"c\" d=\"M136.';
    assert placeholder[76] = '67,293.82h7v21h14v7h-21v-28Z\"';
    assert placeholder[77] = '/><path class=\"c\" d=\"M171.3';
    assert placeholder[78] = '2,314.82h7v7h-14v-28h14v7h-7v1';
    assert placeholder[79] = '4Zm7-14h7v14h-7v-14Z\"/><path ';
    assert placeholder[80] = 'class=\"c\" d=\"M191.97,300.82';
    assert placeholder[81] = 'h7v14h14v7h-21v-21Zm7-7h14v7h-';
    assert placeholder[82] = '14v-7Z\"/><path class=\"c\" d=';
    assert placeholder[83] = '\"M219.62,293.82h7v21h7v-21h7v';
    assert placeholder[84] = '28h-14v-7h-7v-21Z\"/><path cla';
    assert placeholder[85] = 'ss=\"c\" d=\"M254.27,307.82h7v';
    assert placeholder[86] = '7h-7v7h-7v-28h14v7h-7v7Zm7-7h7';
    assert placeholder[87] = 'v7h-7v-7Z\"/><path class=\"c\"';
    assert placeholder[88] = ' d=\"M276.32,293.82h7v7h-7v-7Z';
    assert placeholder[89] = 'm0,14h7v7h7v7h-14v-14Zm7-7h7v7';
    assert placeholder[90] = 'h-7v-7Z\"/><path class=\"c\" d';
    assert placeholder[91] = '=\"M296.97,300.82h7v14h-7v-14Z';
    assert placeholder[92] = 'm7-7h7v7h-7v-7Zm0,21h7v7h-7v-7';
    assert placeholder[93] = 'Zm7-14h7v14h-7v-14Z\"/><path c';
    assert placeholder[94] = 'lass=\"c\" d=\"M324.62,293.82h';
    assert placeholder[95] = '7v7h-7v-7Zm0,14h7v7h7v7h-14v-1';
    assert placeholder[96] = '4Zm7-7h7v7h-7v-7Z\"/><path cla';
    assert placeholder[97] = 'ss=\"c\" d=\"M345.27,293.82h7v';
    assert placeholder[98] = '7h-7v-7Zm0,14h7v7h7v7h-14v-14Z';
    assert placeholder[99] = 'm7-7h7v7h-7v-7Z\"/></g></svg>"';
    assert placeholder[100] = '}';

    return (placeholder_len=101, placeholder=placeholder);
}
