// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Counter} from "../src/02-Counter.sol";

contract CounterTest is Test{
    Counter public counter;

    //The setUp() function will be called before each test
    function setUp() public{
        counter = new Counter(); //Deploying the contract
    }

    //Here we are checking if the increment function is working or not for this
    //We are simply going to increment the counter by calling the increment function and check if it is 1
    function testIncrement() public {
        counter.increment();
        assertEq(counter.count(),1);
    }

    //Now when we are testing for failures we need to meintion "testFail" with this the contract will understand that the condition we put in must fail
    //Here when we provide that the testFail we need to make sure the condition should fail so here what we do is we decrement the counter when it is set to zero
    function testFailDec() public{
        counter.decrement();
    }

    //This is another way of writing an failing test
    function testDecUnderflow() public{
        //Here this vm.expectRevert will 
        vm.expectRevert();
        counter.decrement();
    }

    //Here we are testing the decrement function
    //Here we are first incrementing the count variable then decrementing it and then checking if it equals to zero
    function testDescrement() public{
        counter.increment();
        counter.decrement();
        assertEq(counter.count(),0);
    }


}