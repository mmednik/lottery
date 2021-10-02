//SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "./ERC20.sol";

contract QuiniCoin {
    // Opening statements
    ERC20 private token;
    address payable public owner;

    constructor() {
        token = new ERC20(10000);
        owner = payable(msg.sender);
    }
}