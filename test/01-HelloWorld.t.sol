// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

//These are the files which are needed for the test
import {Test} from "forge-std/Test.sol";
import {HelloWorld} from "../src/01-HelloWorld.sol";

contract HelloWorldTest is Test{
    HelloWorld public helloWorld;

    //This is function with which every test should start,This function is to deploy our function
    function setUp() public{
        helloWorld = new HelloWorld();
    }

    function testGreet() public{
        //The assertEq is a special function which is to check if both the values which are to be passed are the same
        //For example here helloWorld.greet() should be equal to the Hello World string here
        assertEq(helloWorld.greet(),"Hello World");
    }
}