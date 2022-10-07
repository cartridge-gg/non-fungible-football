%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_block_timestamp, get_caller_address

from src.player import IPlayer

@external
func test_purchase{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/player.cairo", [123, 1665017282]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    %{ stop_warp = warp(1665017283) %}

    let (price) = IPlayer.price(contract_address);
    IPlayer.purchase(contract_address, price);
    let (balance) = IPlayer.balanceOf(contract_address, 123);
    assert balance = Uint256(1, 0);

    let (bt) = get_block_timestamp();
    %{ stop_warp = warp(ids.bt + 1000) %}

    let (price2) = IPlayer.price(contract_address);
    IPlayer.purchase(contract_address, price2);
    let (balance2) = IPlayer.balanceOf(contract_address, 123);
    assert balance2 = Uint256(2, 0);

    %{ stop_prank_callable() %}

    return ();
}

@external
func test_token_uri{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/player.cairo", [123, 1665017282]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    let (uri_len, uri) = IPlayer.tokenURI(contract_address, Uint256(low=0, high=0));

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

        with open('tests/test_player.svg', 'w') as f:
            f.write(svg)
    %}

    return ();
}
