// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Wallet{
    address payable public owner;

    event Deposit(address account, uint256 amount);

    constructor() payable{
        owner = payable(msg.sender);
    }

    receive() external payable{
        emit Deposit(msg.sender,msg.value);
    }

    function withdraw(uint256 _amount) external{
        require(msg.sender == owner);
        (bool s,) = payable(msg.sender).call{value:_amount}("");
        require(s);
    }

    function setOwner(address _owner) external{
        require(msg.sender == owner);
        owner = payable(_owner);
    }
}