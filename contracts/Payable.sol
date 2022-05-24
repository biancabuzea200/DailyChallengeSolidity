// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Payable {
    address payable public owner;

    //payable constructor can receive ether
    constructor() payable {
        owner = payable (msg.sender);
    }

    //function to deposit ether into the contract, call it along with some ether
    //balance will autom. be updated
    function deposit() public payable {}

    //call this fcn along with some ether
    //fcn will throw since not payable
    function notPayable() public {}

    function withdraw() public {
        //get the amount of ether stored in this contract
        uint amount = address(this).balance;
        (bool success, ) = owner.call {value: amount}("");
        require(success, "failed to send ether");
    }

    //_to is declatred as payable

    function transfer (address payable _to, uint _amount) public {
        (bool success , ) =_to.call{value: _amount}("");
        require(success, "failed to send ether");
    }
  
}