// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Event} from "../src/06-Event.sol";

contract EventTest is Test{
    Event public e;

    event Transfer(address indexed from, address indexed to,uint256 amount);

    function setUp() public{
        e = new Event();
    }

    //First we are going to test a single event
    function testEmitTransferEvent() public{
        //To test wether the evevnt was emiited or not we are going to call vm.expectEmit which takes in 4 inputs

        //To do this we have 3 steps we need to follow and they are as follows

        // 1. Tell Foundry which data to check
        // Check index 1, index 2 and data
        vm.expectEmit(true,true,false,true); //So here in the transfer function we have 2 indexed data so true , true for that and then we dont have 3rd indexed data so false and we want it to check for other data so true
        
        
        // 2. Emit the expected event
        emit Transfer(address(this),address(123),456);


        // 3. Call the function that should emit the event
        e.transfer(address(this),address(123),456);
        // If the event emitted in step 2 is equal to the event emitted in step 3 then our test will pass 

        //Now we can just test for particulary a specific index also ,this will just check for index 1
        //index 1
        vm.expectEmit(true,false,false,false);
        emit Transfer(address(this),address(123),456);
        e.transfer(address(this),address(12323),45643);

        /**
         * @dev Here we need to make sure that we follow this steps in this order
         * First we need to vm.expectEmit function
         * Second we need to emit the Transfer function
         * Third we need to call the function which will emit the event
         */

    }

    //Now let us check for multiple events
    function testEmitManyTransferEvent() public{
        //The way to test for multiple events is same as single event but we first need to prepare an array of addresses
        address[] memory to = new address[](2);
        to[0] = address(123);
        to[1] = address(456);

        uint256[] memory amounts = new uint256[](2);
        amounts[0] = 777;
        amounts[1] = 888;

        for(uint i = 0; i < to.length; i++){
            // 1. Tell Foundry which data to check
            vm.expectEmit(true,true,false,true);

            // 2. Emit the expected event
            emit Transfer(address(this),to[i],amounts[i]);

            // 3. Call the function that should emit the event
            e.transferMany(address(this),to,amounts);
            
        }
    }
}
