// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;
import { Ownable } from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import { Address } from "../lib/openzeppelin-contracts/contracts/utils/Address.sol"; 

contract NFFBridge is Ownable {
    event Deposit(address indexed from, uint256 indexed to, uint256 amount);

    address private constant cartridge = 0xC09c8905cd3112deE53BbFBdeBC1e9C9963BD325;
    address private constant mrfax = 0x50258A2aE0b3065754936828Cd7814731C6fC008;

    uint256 private constant cost = 0.02 ether;

    function deposit(uint256 to) external payable {
        require(msg.value == cost, "NFFBridge: invalid amount");
        
        emit Deposit(msg.sender, to, msg.value);
    }

    function withdraw() external {        
        payable(cartridge).transfer(address(this).balance / 2);
        payable(mrfax).transfer(address(this).balance / 2);
    }
}
