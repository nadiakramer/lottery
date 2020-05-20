pragma solidity ^0.4.0;

contract LotteryFactory {

    uint coolDown = 2 minutes;
    uint startingTime;

    mapping(address => uint) playersStake;
    mapping(uint => address) public playerToOwner;

    struct Player {
        string name;
        uint   money;
    }

    Player[] players;


    function _createPlayer(string _name, uint _money) internal {
        uint  id = players.push(Player(_name, _money)) -1;
        emit NewPlayer(id, _name, _money);
    }


    function LotteryFactory(){

    }
}
