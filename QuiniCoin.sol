//SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "./ERC20.sol";

contract QuiniCoin {
    // Opening statements
    ERC20 private token;
    address payable public owner;
    address public _contract;
    uint public createdTokens = 10000;

    constructor() {
        token = new ERC20(createdTokens);
        owner = payable(msg.sender);
        _contract = address(this);
    }
}