// Layout of Contract:
// version
// imports
// errors
// interfaces, libraries, contracts
// Type declarations
// State variables
// Events
// Modifiers
// Functions

// Layout of Functions:
// constructor
// receive function (if exists)
// fallback function (if exists)
// external
// public
// internal
// private
// internal & private view & pure functions
// external & public view & pure functions

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

/**
 * @title A sample Raffle Contract
 * @dev Implements Chainlink VRFv2
 */

contract Raffle {
    // custom error messages
    error Raffle__NotEnoughEthSent();
    error Raffle__NotEnoughTimePassed();

    // state variables
    uint256 private immutable i_entranceFee;
    // @dev Duration of lottery in seconds
    uint256 private immutable i_interval;
    address payable[] private s_players;
    uint256 private s_rafflePot;
    uint256 private s_lastTimeStamp;

    //events
    event EnteredRaffle(address indexed player);

    //constructor
    constructor(uint256 entranceFee, uint256 interval) {
        i_entranceFee = entranceFee;
        i_interval = interval
        s.lastTimeStamp = block.timestamp;
    }

    //functions
    function enterRaffle() external payable {
        // require(msg.value >= i_entranceFee, "Not enough ETH sent"); more traditional yet less optimized way of doing it
        if (msg.value < i_entranceFee) {
            revert Raffle__NotEnoughEthSent();
        }
        s_players.push(payable(msg.sender));
        // Makes migration easier
        // Makes front-end "indexing" easier
        emit EnteredRaffle(msg.sender);
        s_rafflePot += msg.value;
    }

    // 1. Get a random number
    // 2. Use the random number to pick a player
    // 3. Be automatically called
    function pickWinner() external {
        if (block.timestamp - last.timestamp <= i_interval)
            revert Raffle__NotEnoughTimePassed();
        
    }

    // Getters
    function getEntranceFee() public view returns (uint256) {
        return i_entranceFee;
    }
}