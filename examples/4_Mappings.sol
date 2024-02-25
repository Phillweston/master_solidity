// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Contract named 'Mappings' that showcases the use of mappings and structs.
contract Mappings {
    // A mapping from unsigned integers to strings. Used to store names associated with an ID.
    mapping(uint256 => string) public names;

    // A mapping from unsigned integers to a 'Book' struct. Used to store information about books.
    mapping(uint256 => Book) public books;

    // A nested mapping. Maps an address to another mapping, which maps an ID to a 'Book' struct.
    // This allows each address to have a collection of books.
    mapping(address => mapping(uint256 => Book)) public myBooks;

    // Struct named 'Book' that represents a book with a title and an author.
    struct Book {
        string title;
        string author;
    }

    // Constructor to initialize some values in the 'names' mapping.
    constructor() {
        names[1] = "Adam";
        names[2] = "Bruce";
        names[3] = "Carl";
    }

    // Function to add a book to the 'books' mapping.
    function addBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        books[_id] = Book(_title, _author);
    }

    // Function to add a book to the 'myBooks' mapping for the caller's address.
    function addMyBook(
        uint256 _id,
        string memory _title,
        string memory _author
    ) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
    }
}
