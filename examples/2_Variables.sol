// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract named 'Variables' showcasing different types of variable declarations.
contract Variables {
    // State Variables are stored on the blockchain and represent the state of the contract.

    // Integer variables
    int256 public myInt = 1;          // Signed integer
    uint256 public myUint256 = 1;     // Unsigned integer (256 bits)
    uint8 public myUint8 = 1;         // Unsigned integer (8 bits)

    // String and bytes32 variables
    string public myString = "Hello, World!";  // String variable
    bytes32 public myBytes32 = "Hello, World!"; // bytes32 variable, more efficient for fixed-size data

    // Address variable
    address public myAddress = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2; // Ethereum address

    // Struct type declaration
    struct MyStruct {
        uint256 myUint256;
        string myString;
    }

    // Struct variable
    MyStruct public myStruct = MyStruct(1, "Hello, World!"); // Initializing a struct

    // Function demonstrating a local variable
    function getValue() public pure returns (uint256) {
        // Local Variable, exists only during function execution
        uint256 value = 1;
        return value;
    }
}
