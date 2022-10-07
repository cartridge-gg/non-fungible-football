%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin
from starkware.cairo.common.uint256 import Uint256
from starkware.starknet.common.syscalls import get_block_timestamp, get_caller_address

from src.components import lookup_body

@external
func test_components{syscall_ptr: felt*, range_check_ptr, pedersen_ptr: HashBuiltin*}() {
    alloc_locals;

    let (body_len, body) = lookup_body(0);

    %{
        parts = memory.get_range(ids.body, ids.body_len)
        svg = ""
        for felt in parts:
            try:
                bytes_object = bytes.fromhex(hex(felt)[2:])
                ascii_string = bytes_object.decode("ASCII")
                svg += ascii_string
            except:
                print(felt)

        with open('tests/test_body.svg', 'w') as f:
            f.write(svg)
    %}

    return ();
}