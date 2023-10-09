// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Error} from "../src/05-Error.sol";

contract TestError is Test {
    Error public err;

    function setUp() public {
        err = new Error();
    }

    //There are 2 simple ways to test for errors in foundry

    //This is the first method in which we name the function itself testFail , so it expects to fail
    function testFail() public view {
        err.throwError();
    }

    //This is the second method where in we use vm.expectrevert
    function testRevert() public {
        vm.expectRevert(); //This line make sure that the next line after this will throw an error
        err.throwError();
    }

    //Now we are going to see the test that the error that was thrown had a specific message
    function testRequireMessage() public {
        vm.expectRevert(bytes("Not authorised")); //The message inside will make sure this is the error when it gets reverted
        err.throwError();
    }

    //How to test for a custom error
    function testCustomError() public {
        vm.expectRevert(Error.NotAuthorized.selector);
        err.throwCustomError();
    }

    // Add label to assertions
    function testErrorLabel() public {
        assertEq(uint256(1), uint256(1), "test 1");
        assertEq(uint256(1), uint256(1), "test 2");
        assertEq(uint256(1), uint256(1), "test 3");
        assertEq(uint256(1), uint256(1), "test 4");
        assertEq(uint256(1), uint256(1), "test 5");
    }
}
