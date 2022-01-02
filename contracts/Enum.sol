//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Enum {
     //save in "EnumDeclarations.sol"
enum Status {
    Pending,
    Shipped,
    Accepted,
    Rejected,
    Canceled
}

//default value is the first one
Status public status;

function get() public view returns (Status){
    return status;
}

function set (Status _status) public{
    status = _status;
}

function cancel() public {
    status = Status.Canceled;
}

function reset() public{
    delete status;
}

//file that imports enum
// import "./EnumDeclaration.sol;"
//contract Enum{
//  Status public status;
//}
}
