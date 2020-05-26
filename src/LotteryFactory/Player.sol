pragma solidity ^0.4.0;

contract Player {
    struct Player {
        string name;
        uint index;
        uint stake;
    }

    mapping(address => Player) players;

    function _createPlayer(address player) internal {
        players[msg.sender].name = _playerName;
        players[msg.sender].stake = _stake;
        players[msg.sender].index = addressIndexes.push(msg.sender) - 1;
    }

}
