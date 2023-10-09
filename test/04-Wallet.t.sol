// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Wallet} from "../src/04-Wallet.sol";

//In this testing we are going to see how do we test for Authentication in Foundry
contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public {
        wallet = new Wallet();
    }

    //Here we are testing the setOwner function
    //Here the wallet has been deployed by the AuthTest contract which will be the owner of the wallet contract now
    function testSetOwner() public {
        //So here the basic test is that the owner sets the new owner to be the address(1) and then we check if the current owner is address(1) or not
        wallet.setOwner(address(1));
        assertEq(wallet.owner(), address(1));
    }

    //This is the test we are going to write for authentication,We are going to call the setOwner function but the owner wont call it so it is suppose to fail
    function testFailNotOwner() public {
        //Now if we simply call the wallet.owner() the current contract address will call it which is the owner right now so to change the msg.msg.sender
        //To change the msg.sender we need to use something know as vm.prank
        vm.prank(address(1)); //By doing this the nextline of code will be callled in by the address(1) WHICH IS NOT THE OWNER HENCE IT WILL FAIL
        wallet.setOwner(address(1));
    }

    //How do we call a function multiple times using
    function testFailSetOwnerAgain() public {
        wallet.setOwner(address(1));

        vm.startPrank(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        wallet.setOwner(address(1));
        vm.stopPrank();

        wallet.setOwner(address(1));
    }
}
