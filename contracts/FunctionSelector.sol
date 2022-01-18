// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract FucntionSelector{
    //when an addr is called, the first 4 bytes of calldata specifies which fcn to call
    //those 4 bytes are called function selector
    //eg: use call()to execute transfer() on a contract at the address addr

    //addr.call(abi.encodeWithSignature("transfer(address, uint256)", 0xSomeAddress, 123))
    //fisrt 4 bytes from abi.encodeWithSignature() is the fcn selector

    /*
     *"transfer (address, uint256)"
     0xassdnd
     "transferFrom(address, address, uint256)
     0xssbdd"
     */

     function getSelector(string calldata _func) external pure returns (bytes4) {
         return bytes4(keccak256(bytes(_func)));
     }
}
