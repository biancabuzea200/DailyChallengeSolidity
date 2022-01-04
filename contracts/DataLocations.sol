// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataLocations{
    //storage - state variable, stored on blockchain
    //memory - in memory, exists during fcn execution
    //calldata - contains fcn arguments, available only for external functions

    uint[] public arr;
    mapping(uint => address) map;
    struct MyStruct{
        uint foo;
    }

    mapping (uint => MyStruct) myStructs;

    function f() public{
        _f(arr, map, myStructs[1]);

        //get a struct from a mapping
        MyStruct storage myStruct = myStructs[1];

        //create a struct in memory
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map,
        MyStruct storage _myStruct
    )internal {
        //do something with memory array

    }

    function g(uint[] memory _arr) public returns (uint[] memory){
        //do sth with meory array
    }

    function h(uint[] calldata _arr) external{
        //do sth with calldata array
    }
}