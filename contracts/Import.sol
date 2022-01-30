// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

struct Point {
    uint x;
    uint y;
}

error Unauthorized(address caller);

function add (uint x, uint y) pure returns (uint) {
    return x + y;
}

contract foo {
    string public name = "Foo";
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//import "Foo.sol" from current directory
import "./Foo.sol";


//import {symbol as alias, symbol2} from "filename";
import {Unauthorized, add as func, Point} from "./Foo.sol";

contract Import {
    Foo public foo = new Foo ();

    function getFooName() public view returns (string memory) {
        return foo.name();
    }
}


import "https://github.com/owner/repo/blob/branch/path/to/Contract.sol";

// Example import ECDSA.sol from openzeppelin-contract repo, release-v3.3 branch
// https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/cryptography/ECDSA.sol
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v3.3/contracts/cryptography/ECDSA.sol";

