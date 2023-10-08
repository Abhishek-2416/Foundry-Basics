// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "forge-std/console.sol";

contract Counter {
    uint256 public count;

    function get() public view returns (uint256) {
        return count;
    }

    //Function to increment by 1
    function increment() public {
        console.log("Here",count);
        count += 1;
    }

    //Function to decrement by 1
    function decrement() public {
        //The function will fail if count = 0
        count -= 1;
    }
}
