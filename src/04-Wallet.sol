// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Wallet {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint256 _amount) external {
        require(msg.sender == owner, "Caller is not owner");
        (bool s,) = payable(msg.sender).call{value: _amount}("");
        require(s);
    }

    function setOwner(address _owner) external {
        require(msg.sender == owner, "caller is not owner");
        owner = payable(_owner);
    }
}
