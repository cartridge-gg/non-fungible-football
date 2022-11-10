%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_block_timestamp, get_caller_address

from src.player import IPlayer

@external
func test_mint_to{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/player.cairo", [123]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
        stop_mock = mock_call(0x049d36570d4e46f48e99674bd3fcc84644ddd6b96f7c741b1562b82f9e004dc7, "transferFrom", [1])
        stop_warp = warp(1665017283, ids.contract_address)
    %}

    IPlayer.unpause(contract_address);
    IPlayer.mint_to(contract_address, 123);
    let (balance) = IPlayer.balanceOf(contract_address, 123);
    assert balance = Uint256(1, 0);

    IPlayer.reveal(contract_address);

    %{ expect_revert(error_message="mint over") %}
    IPlayer.mint_to(contract_address, 123);

    %{ 
        stop_warp()
        stop_prank_callable()
        stop_mock()
    %}

    %{ expect_revert(error_message="Ownable: caller is not the owner") %}
    IPlayer.mint_to(contract_address, 123);

    return ();
}

@external
func test_token_uri{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/player.cairo", [123]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
        stop_warp = warp(1665017283, ids.contract_address)
    %}

    IPlayer.reveal(contract_address);

    let (uri_len, uri) = IPlayer.tokenURI(contract_address, Uint256(low=1, high=0));

    %{
        parts = memory.get_range(ids.uri, ids.uri_len)
        svg = ""
        for felt in parts:
            try:
                bytes_object = bytes.fromhex(hex(felt)[2:])
                ascii_string = bytes_object.decode("ASCII")
                svg += ascii_string
            except:
                print(felt)

        with open('tests/test_player.json', 'w') as f:
            f.write(svg)
    %}

    %{ 
        stop_warp()
        stop_prank_callable()
    %}

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
        ids.initial_implementation = declare("./src/player.cairo").class_hash
        ids.fake_implementation = declare("./src/tournament.cairo").class_hash
        ids.contract_address = deploy_contract("./lib/cairo_contracts/src/openzeppelin/upgrades/presets/proxy.cairo", [ids.initial_implementation, get_selector_from_name('initialize'), 1, 123]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    let (implementation) = IPlayer.implementation(contract_address);
    assert implementation = initial_implementation;

    IPlayer.upgrade(contract_address, fake_implementation);

    let (next_implementation) = IPlayer.implementation(contract_address);
    assert next_implementation = fake_implementation;

    %{ 
        stop_prank_callable()
    %}

    return ();
}
