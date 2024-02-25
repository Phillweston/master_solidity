// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract named 'Conditionals'.
contract Conditionals {
    // An array of integers.
    uint256[] public numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    // State variable to store the owner's address.
    address public owner;

    // Constructor sets the deploying address as the owner of the contract.
    constructor() {
        owner = msg.sender;
    }

    // Function to count how many numbers in the array are even.
    function countEvenNumbers() public view returns (uint256) {
        uint256 count = 0;

        // Loop through each number in the array.
        for (uint256 i = 0; i < numbers.length; i++) {
            // Check if the number is even using 'isEvenNumber'.
            if (isEvenNumber(numbers[i])) {
                count++;
            }
        }

        // Return the count of even numbers.
        return count;
    }

    // Function to check if a number is even.
    function isEvenNumber(uint256 _number) public pure returns (bool) {
        // Returns true if the number is even, false otherwise.
        if (_number % 2 == 0) {
            return true;
        } else {
            return false;
        }
    }

    // Function to check if the caller is the owner of the contract.
    function isOwner() public view returns (bool) {
        // Returns true if the caller's address matches the owner's address.
        return (msg.sender == owner);
    }
}
