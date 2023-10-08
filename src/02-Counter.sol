// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Counter{
    uint public count;

    function get() public view returns(uint){
        return count;
    }

    //Function to increment by 1
    function increment() public{
        count += 1;
    }

    //Function to decrement by 1
    function decrement() public{
        //The function will fail if count = 0
        count -= 1;
    }
}