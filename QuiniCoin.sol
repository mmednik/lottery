//SPDX-License-Identifier: MIT
pragma solidity ^0.8;
import "./ERC20.sol";

contract QuiniCoin {
    // Opening statements
    ERC20 private token;
    address payable public owner;
    address public _contract;
    uint public createdTokens = 10000;

    event buyedTokens(uint, address);

    constructor() {
        token = new ERC20(createdTokens);
        owner = payable(msg.sender);
        _contract = address(this);
    }

    // Token management
    function tokenPrice(uint _tokenQty) internal pure returns(uint) {
        return _tokenQty*(1 ether);
    }

    function generateTokens(uint _tokenQty) public Lottery(msg.sender) {
        token.increaseTotalSupply(_tokenQty);
    }

    modifier Lottery(address _address) {
        require(_address==owner, "You don't have the permissions to execute this function");
        _;
    }

    function buyToken(uint _tokenQty) public payable {
        uint cost = tokenPrice(_tokenQty);
        require(msg.value>=cost, "You do not have the amount of ethers necessary for the purchase.");
        uint returnValue = msg.value-cost;
        payable(msg.sender).transfer(returnValue);
        uint balance = balanceOf();
        require(_tokenQty<=balance, "The number of tokens requested exceeds the number of tokens for sale.");
        token.transfer(msg.sender, _tokenQty);
        emit buyedTokens(_tokenQty, msg.sender);
    }

    function balanceOf() public view returns(uint) {
        return token.balanceOf(address(this));
    }

    function getJackpot() public view returns(uint) {
        return token.balanceOf(owner);
    }

    function myTokens() public view returns(uint) {
        return token.balanceOf(msg.sender);
    }
}