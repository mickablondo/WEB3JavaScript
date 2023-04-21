// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract TestContrat {
    uint public myNumber;

    function setNumber(uint _autreNumber) external {
        myNumber = _autreNumber;
    }
}