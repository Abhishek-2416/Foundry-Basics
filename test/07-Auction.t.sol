// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Auction} from "../src/07-Auction.sol";

contract TestAuction is Test{
    Auction public auction;
    uint256 private startAt;

    //vm.warp = set block.timestamp to future timestamp
    //vm.roll = set block.number
    //skip = icrement current timestamp
    //rewind = decrement current timestamp

    function setUp() public{
        auction = new Auction();
        startAt = block.timestamp;
    }

    //In this test we are checking that the function should fail if called before the starttime
    function testBidFailsBeforeStartTime() public {
        vm.expectRevert(bytes("cannot bid"));
        auction.bid();
    }

    //In this we are going to check if we can call the auction after waiting one day
    function testBid() public{
        vm.warp(startAt + 1 days);
        auction.bid();
    }

    //Now we are checking that we shouldnt be able to call the function bid when the end time is over
    function testBidFailsAfterEndTime() public{
        vm.expectRevert();
        vm.warp(startAt + 2 days);
        auction.bid();
    }

    //How to use the skip and rewind
    function testTimestamp() public{
        uint256 t = block.timestamp;
        // set block.timestamp to t + 100
        skip(100);
        assertEq(block.timestamp, t + 100);

        // set block.timestamp to t + 100 - 100;
        rewind(100);
        assertEq(block.timestamp, t+100);
    }

    //This is how we use block.roll
    function testBlockNumber() public{
        //vm.roll sets the block.number
        uint b = block.number;
        vm.roll(999);
        assertEq(b,999);
    }

}