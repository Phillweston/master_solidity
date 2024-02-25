// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract named 'Arrays' showcasing the use of different types of arrays.
contract Arrays {
    // Public array of unsigned integers.
    uint256[] public uint256Array = [1, 2, 3];

    // Public array of strings.
    string[] public stringArray = ["apple", "banana", "carrot"];

    // Public dynamic array for storing strings. It's initially empty.
    string[] public values;

    // Public two-dimensional array of unsigned integers.
    uint256[][] public array2D = [[1, 2, 3], [4, 5, 6]];

    // Function to add a new string to the 'values' array.
    function addValue(string memory _value) public {
        values.push(_value);
    }

    // Function to get the number of elements in the 'values' array.
    function valueCount() public view returns (uint256) {
        return values.length;
    }
}
