// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import {Test} from "forge-std/Test.sol";
import {console} from "forge-std/console.sol";
import {Wallet} from "../src/08-SendEth.sol";

//Here we are going to see how to send Eth into this wallet contract
//deal(address, uint) = Set balance of address
//hoax(address, uint) = deal + prank, Sets up a prank and set the balance

contract sendEthTest is Test{
    Wallet public wallet;

    function setUp() public{
        wallet = new Wallet();
    }

    //This will send eth to the wallet address
    function _send(uint amount) private{
        (bool s,) = address(wallet).call{value:amount}("");
        require(s);
    }

    function testEthBalance() public view{
        console.log("ETH Balance",address(this).balance/1e18);
    }

    function testSendEth() public{
        uint bal = address(wallet).balance;
        //deal(address, uint) = Set balance of address
        deal(address(1),100);
        assertEq(address(1).balance,100);

        //hoax(address, uint) = deal + prank, Sets up a prank and set the balance
        //So hoax is similar to deal but in this it will set the balance of an account to whatever we set inside here and will call prank which make the specified address the msg.msg.sender
        // _send(123); //If we just write this we wont be sending it from the address(1) but just from the this contract
        hoax(address(1),123);
        _send(123);

        assertEq(address(wallet).balance, bal+123);
    }

}