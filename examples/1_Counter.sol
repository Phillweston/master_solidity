// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract 'Counter' is designed to increment and return a count.
contract Counter {
    // State variable 'count' to store the number of increments.
    // It's initialized to 0 by default.
    uint256 count;

    // Function 'getCount' to retrieve the current count.
    // Marked as 'view' because it doesn't modify the contract's state.
    function getCount() public view returns (uint256) {
        return count;
    }

    // Function 'incrementCount' to increment the count by 1.
    function incrementCount() public {
        count++;
    }
}
