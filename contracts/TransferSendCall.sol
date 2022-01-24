// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ReceiveEther {

    /*
    transfer (2300 gas, throws error)
    send(2300 gas, returns bool)
    call(forwards all gas or set gas, returns bool)

    a contract receiving must have at least one of the following
    receive() external payable
    fallback() external payable
    receive() is called if msg.data is empty, otherwise fallback() is called

    call() in comb. with re-entrancy is the recommended method after Dec 2019
    re-entrancy: make all state changes before calling other contracts
    using re-entrancy guard mosifier
     */
    /*
    Which function is called, fallback() or receive()?

           send Ether
               |
         msg.data is empty?
              / \
            yes  no
            /     \
receive() exists?  fallback()
         /   \
        yes   no
        /      \
    receive()   fallback()
    */
receive() external payable {}

fallback() external payable {}
function getBalance() public view returns (uint) {
        return address (this).balance;
}

}

contract SendEther{
    function sendViaTransfer(address payable _to) public payable{

        //no longer recommended
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        //send returns a bool indicateing success or failure
        //not recommended for sending Ether
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send");
    }

    function sendViaCall(address payable _to) public payable {
        //call returrns a bool value indicating success or failure
        //curr recommended method to send Ether
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "failed to send");
    }
}

