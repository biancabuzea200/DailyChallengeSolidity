// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Base {
  //private fcn can only be called inside the contract
  //contracts that inherit it cannot access them

  function privateFunc() private pure returns (string memory) {
      return "private function";
  }

  function testPrivateFunc() public pure returns (string memory) {
      return privateFunc();
  }

  //internal functions can be called
  //inside the contract
  //inside contracts that inherit the contract
  function internalFunc() internal pure returns (string memory) {
    return "internal function called";
  }

  function testInternalFunction() public pure virtual returns (string memory){
      return internalFunc();
  }

  //public can be called
  //inside the contract
  //inside contracts that inherit the contract
  //by other contracts and accounts

  function publicFunc() public pure returns (string memory){
      return "public function called";
  }
  //external fcn can only be called
  //by other contracts and accounts

  function externalFunc() external pure returns (string memory){
      return "external function called";
  }

  //will not work, this is inyternal and tries to call and external fcn
  //function testExternalFunc() public pure returns (string memory){
  //return externalFunc();
  //}
  string private privateString = "my private variable";
  string  internal  internalVar = "my internal var";
  string public publicVar = "My public var";
}

contract Child is Base{
    //inherited contracts do not have access to private functions
    //and state variables
    //function testPrivateFunc() public pure returns (string memory){
        //return privateFunc();
    
    //}

    function testInternalFunction() public pure override returns (string memory){
        return internalFunc();
    }
}