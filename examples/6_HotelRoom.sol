// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This contract demonstrates a simple use case of a hotel room booking system.
contract HotelRoom {
    // 'Statuses' enum representing the room status: Vacant or Occupied.
    enum Statuses {
        Vacant,
        Occupied
    }
    // State variable to store the current status of the room.
    Statuses public currentStatus;

    // Event to be emitted when a room is booked.
    event Occupy(address _occupant, uint256 _value);

    // Owner of the hotel room; marked as 'payable' to receive Ether.
    address payable public owner;

    // Constructor sets the message sender as the owner and initializes room as Vacant.
    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    // Modifier to check if the room is vacant before booking.
    modifier onlyWhileVacant() {
        require(currentStatus == Statuses.Vacant, "Currently occupied.");
        _;
    }

    // Modifier to require a certain amount of Ether to proceed with booking.
    modifier costs(uint256 _amount) {
        require(msg.value >= _amount, "Not enough Ether provided.");
        _;
    }

    // Function to book the room. Requires the room to be vacant and the sent Ether to be sufficient.
    function book() public payable onlyWhileVacant costs(2 ether) {
        // Updating the status to occupied.
        currentStatus = Statuses.Occupied;

        // Transferring the sent Ether to the owner. 
        // Using 'call' for direct transfer and checking for successful execution.
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent, "Failed to send Ether");

        // Emitting an event after successful booking.
        emit Occupy(msg.sender, msg.value);
    }
}
