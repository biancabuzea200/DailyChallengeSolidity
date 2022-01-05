// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Function {

    //functions can retuirn multiple values
    function returnMany()
    public
    pure
    returns(
        uint, 
        bool,
        uint
    )
    {
        return (3,true, 4);
    }

    //return values can be named
    function named()
    public
    pure
    returns(
        uint x,
        bool b,
        uint y
    )
    {
        return (1, true, 4);
    }

    //return values can be assigned to their names
    function assigned()
    public
    pure
    returns(
        uint x,
        bool b,
        uint y
    ){
        x = 1;
        b = true;
        y = 2;
    }

    //use destructive assignment when calling other fcn that returns multiple vals
    function destructiveAssignment()
    public
    pure
    returns(
        uint,
        bool,
        uint,
        uint,
        uint
    ){
        (uint i, bool b, uint j) = returnMany();

        //velues can be left out

        (uint x, , uint y) = (4, 5, 6);
        return (i, b, j, x, y);
    }

    //cannot use map for input/output
    //can use array for input
    function arrayInput( uint[] memory _arr) public {}

    //can use array for output
    uint [] public arr;

    function arrayOutput () public view returns (uint[] memory){
        return arr;
    }

}