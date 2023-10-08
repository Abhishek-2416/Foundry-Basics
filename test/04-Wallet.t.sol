// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {Wallet} from "../src/04-Wallet.sol";

//In this testing we are going to see how do we test for Authentication in Foundry
contract AuthTest is Test {
    Wallet public wallet;

    function setUp() public{
        wallet = new Wallet();
    }

    //Here we are testing the setOwner function 
    //Here the wallet has been deployed by the AuthTest contract which will be the owner of the wallet contract now
    function testSetOwner() public{
        wallet.setOwner(address(1)); 
        assertEq(wallet.owner(),address(1));
    }

    function testFailNotOwner() public{
        vm.prank(address(1));
        wallet.setOwner(address(1));
    }
}

