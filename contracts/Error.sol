// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Error {

    //rewuire: used to validate inputs and conditions before execution
    //revert similar to require, for more complex consitions
    //assert: used to check for called that should be always true(invariants), falling assertion means there s a bug
    function testRequire( uint _i) public pure{
        //used to validate conditions
        require( _i > 10, "Input must be greater than 10");
    }

    function testRevert(uint _i) public pure{
        // revert is useful when the consition to check is complex
        if (_i <= 10){
            revert ("Input must be greater than 10");
        }
    }

    uint public num;

    function testAssert() public view{
        //only used to check for internal errors ans check invariants (properties that are expected to always be true)
        //here is impossible to update value of num
        assert (num == 0);
    }

    error InsufficientBalance(uint balance, uint withdrawAmount);

    function testCustomError(uint _withdrawAmount) public view{
        uint bal = address(this).balance;
        if (bal < _withdrawAmount){
            revert InsufficientBalance({balance: bal, withdrawAmount: _withdrawAmount});
        }

    }

}


