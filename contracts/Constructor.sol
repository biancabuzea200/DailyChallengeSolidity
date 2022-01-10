// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

// Base contract X
contract X {

    string public name;

    constructor(string memory _name){
        name = _name;
    }

}

contract Y{
    string public text;
    constructor(string memory _text){
        text = _text;
    }
}

//2 ways to init parent contract with params

contract B is X("Input to X"), Y("Input to Y"){

}

contract C is X, Y{
    //pass  params in the constructor, similar to fcn modifiers
    constructor(string memory _name, string memory _text) X(_name) Y(_text){}
}

//parent constructors are always called in order of inheritance
//regardless of the order of parent contracts listed in the constructor
//child contract

//order of constructors called Y, X, D
contract D is X, Y{
    constructor() X("X was called") Y ("Y was called"){}
}

//order of constructors called Y, X, E
contract E is X, Y{
    constructor() Y("Y was called") X ("X was called"){}
}