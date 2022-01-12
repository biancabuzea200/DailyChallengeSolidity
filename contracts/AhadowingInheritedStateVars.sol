// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A{
    string public name = "Contract A";

    function getName() public view returns(string memory){
        return name;
    }
}

//shadowing is disallowed in Solidity 0.6, will ot compile
//contract B is A{
//  string public name = "Contract B";
//}

contract C is A{
    //correct way to override inherited state vars
    constructor(){
          name = "Contract C";
    }
    //C.getName returns "Contract C"
}