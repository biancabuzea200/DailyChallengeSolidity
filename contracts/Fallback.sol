
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//fallback does not take any args and does not return anything
//executed when 
//a fcn that doe snot exist is called
//Ether is called directly to a  contract but receive() does not exist or msg.data is empty
//has a 2300 gas limit when called by **transfer** or **send**

contract Fallback {
    event Log(uint gas);

    //fallback fcn must be declated as external
    fallback() external payable {
        emit Log(gasleft());
        //send / transfer (forwards 2300 gas to this fallback fcn)
        //call (forwards all of the gas)
    }

    receive () external payable {
        
    }

    //helper fcn to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
 
}

contract sendToFallback {
    function transferToFallback(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function callFallback(address payable _to) public payable {
        (bool sent, ) = _to.call{value: msg.value} ("");
        require(sent, "Failed to send Ether");
    }

}
