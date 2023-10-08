// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

//First here we are going to install and use the ERC20 from the solmate library
import {ERC20} from "../lib/solmate/src/tokens/ERC20.sol";

contract Token is ERC20("name","symbol",18) {}