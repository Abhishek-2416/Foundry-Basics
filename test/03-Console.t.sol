// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

//These are the files which are needed for the test
import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";

contract ConsoleTest is Test {
    function testLogSomething() public view {
        console.log("Print something here", 123);

        //However it cannot log int varible , if we want to logInt we need to do this
        console.logInt(-1);
    }
}
