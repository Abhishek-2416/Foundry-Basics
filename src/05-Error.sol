// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

contract Error {
    error NotAuthorized();

    function throwError() external pure {
        require(false, "Not authorised");
    }

    function throwCustomError() external pure {
        revert NotAuthorized();
    }
}
