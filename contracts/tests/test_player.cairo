%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_caller_address

from src.player import IPlayer

@external
func test_purchase{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;
    
    local contract_address: felt;
    %{ 
        ids.contract_address = deploy_contract("./src/player.cairo", [100, 0, 123]).contract_address
        stop_prank_callable = start_prank(123, target_contract_address=ids.contract_address)
    %}

    IPlayer.purchase(contract_address, 123, 1000000);

    let (balance) = IPlayer.balanceOf(contract_address, 123);

    assert balance = Uint256(1, 0);
    %{ stop_prank_callable() %}

    return ();
}
