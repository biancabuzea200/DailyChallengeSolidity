// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Event {

    //listens to events and updates user interface
    //cheap form of storage
    
    //up to 3 params can be indexed
    //indexed patrams help filter the logs by indexed params

    event Log (address indexed address, string message);
    event AnotherLog();

    function test() public{
        emit Log(msg.sender, "Hello");
        emit Log(msg.sender, "This too");
        emit AnotherLog();
    }
}