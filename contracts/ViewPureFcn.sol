// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract ViewAndPure {
   uint public x = 1;

   // view: no state will be changed
   // pure: no state variable will be changed or read

   function addToX(uint y) public view returns (uint){
       return x + y;
   }

   function add (uint a, uint b) public pure returns (uint){
       return a + b;
   }
}