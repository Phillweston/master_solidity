// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// This contract demonstrates inheritance in Solidity.

// 'Ownable' is a base contract that sets up ownership control.
contract Ownable {
    address owner;

    // The constructor sets the contract deployer as the owner.
    constructor() {
        owner = msg.sender;
    }

    // 'onlyOwner' is a modifier to restrict function access to the contract owner.
    modifier onlyOwner() {
        require(msg.sender == owner, "must be owner");
        _;
    }
}

// 'SecretVault' is a contract to store a secret string.
contract SecretVault {
    string secret;

    // The constructor initializes the contract with a secret string.
    constructor(string memory _secret) {
        secret = _secret;
    }

    // 'getSecret' allows reading the stored secret string.
    function getSecret() public view returns (string memory) {
        return secret;
    }
}

// 'Secret' is a contract that inherits from 'Ownable'.
contract Secret is Ownable {
    address secretVault;

    // The constructor creates a new 'SecretVault' contract and stores its address.
    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        // Note: 'super' is not needed here since there's no constructor in 'Ownable' that requires arguments.
    }

    // 'getSecret' is an 'onlyOwner' restricted function that retrieves the secret from 'SecretVault'.
    function getSecret() public view onlyOwner returns (string memory) {
        return SecretVault(secretVault).getSecret();
    }
}
