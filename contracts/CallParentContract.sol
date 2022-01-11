// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

//parent contracts can be called directly or by using "super"


contract A{
    event Log (string message);

    function foo() public virtual{
        emit Log("A.foo called");
    }

    function bar() public virtual{
        emit Log("A.bar called");
    }
}

contract B is A{
    function foo() public virtual override{
        emit Log("B.foo called");
        A.foo();
    }

    function bar() public virtual override{
        emit Log("B.bar called");
        super.bar();
    }
}

contract C is A{
    function foo() public virtual override{
        emit Log("C.foo called");
        A.foo();
    }

    function bar() public virtual override{
        emit Log("C.bar called");
        super.bar();
    }
}

contract D is B, C{
    //call D.foo and check logs, although it inherits  A, B and C, it only called C and then A
    //call D.bar and check the tx logs, D called C, then B, then A
    //although super was called twice(by B and C) it only called A once

    function foo() public override (B,C){
        super.foo();
    }

    function bar() public override(B,C){
        super.bar();
    }
}