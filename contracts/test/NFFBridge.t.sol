// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NFFBridge.sol";

contract NFFBridgeTest is Test {
    NFFBridge public bridge;

    function setUp() public {
        bridge = new NFFBridge();
    }

    event Deposit(address indexed from, uint256 indexed to, uint256 amount);
    function testDeposit() public {
        vm.expectEmit(true, true, false, true);

        emit Deposit(address(this), 0x07b5d15786D84555A6bd9A5B532EAe27B0f64Dbc5F3E99971CD6904a5DfF432b, 0.02 ether);

        bridge.deposit{
            value: 0.02 ether
        }(0x07b5d15786D84555A6bd9A5B532EAe27B0f64Dbc5F3E99971CD6904a5DfF432b);
    }
}
