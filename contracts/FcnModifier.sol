// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract FcnModifier {

    ///use modifiers for: restricting access, 
                        //validate inputs, 
                        //guard against reentrancy attacks

    address public owner;
    uint public x = 10;
    bool public locked;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not owner");
        _;
    }

    //modifiers can take inputs
    modifier validAddress(address _addr){
        require(_addr != address(0), "Not valid address");
        _;
    }

    function changeOwner(address _newOwner) public onlyOwner validAddress (_newOwner){
        owner = _newOwner;
    }

    //modifiers can be called before and after a fcn
    //prevent the function to get called while still executing
    modifier noReentrancy(){
        require(!locked, "No reentrancy");

        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy{
        x -= i;
        if (i > 1){
            decrement(i - 1);
        }
    }

}
