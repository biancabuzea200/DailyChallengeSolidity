// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Payable {
    address payable public owner;

    constructor() payable {
        owner = payable (msg.sender);
    }

    function deposit() public payable {}

    function notPayable() public {}
  
}