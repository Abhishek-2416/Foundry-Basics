// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Bit} from "../src/09-Bit.sol";
/**Topics
 * Problem :- When you usually write a uint test you would specify some inputs to run some tests
 * Fuzz:- This has a limitation that you are only testing for inputs you specify on the other hand fuzzing would test inputs randomly
 * assume and bound:- These are two function where we can specify a range for fuzzing
 * stats:- This shows the stats when you fuzz a test μ and ~
 */
/**Note
 * μ: 19396 This is the mean amount of gas that is been used
 * ~: 10396 This is the median amount of gas that is been sused
 */

contract FuzzTest is Test {
    Bit public b;

    function setUp() external{
        b = new Bit();
    }

    //Here is implementation of mostSignificant bit where it scans each bit from right to left and wherever there is 1 it will increment is
    function mostSignificantBit(uint256 x)private pure returns(uint256){
        uint256 i = 0;
        while((x >>= 1) > 0){
            i++;
        }
        return i;
    }

    //First testing the normal way that is uint testing
    function testMostSignificantBitManual() public{
        assertEq(b.mostSignificantBit(0),0);
        assertEq(b.mostSignificantBit(1),0);
        assertEq(b.mostSignificantBit(2),1);
        assertEq(b.mostSignificantBit(4),2);
        assertEq(b.mostSignificantBit(8),3);
    }

    //It is absurd to keep calculating for all the values so we use fuzz test for this
    function testMostSignificantBitFuzz(uint256 x) public{
        uint i = b.mostSignificantBit(x);
        assertEq(i,mostSignificantBit(x));
    }

    function testMostSignificantBitFuzzWithAssume(uint256 x) public{
        //assume = if False,the fuzzer will discard the current fuzz inputs and start a new fuzz run
        vm.assume(x>0); //It will skip all test for x < 0
        uint i = b.mostSignificantBit(x);
        assertEq(i,mostSignificantBit(x));
    }

    function testMostSignificantBitFuzzWithBound(uint256 x) public{
        //bound(input,min,max) -- bound input between min and max
        x = bound(x,1,10);
        uint i = b.mostSignificantBit(x);
        assertEq(i,mostSignificantBit(x));
    }
}