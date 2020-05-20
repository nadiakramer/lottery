pragma solidity ^0.4.0;

contract LotteryFactory {

    uint coolDown = 2 minutes;
    uint startingTime;
    uint amountOfBets;
    uint pot;

    mapping(address => uint) playersRange;
    mapping(uint => address) public playerToOwner;

    struct Player {
        string name;
        uint   money;
        uint stake;
    }

    Player[] players;


    function _createPlayer(string _name, uint _money) internal {
        uint  id = players.push(Player(_name, _money)) -1;
        emit NewPlayer(id, _name, _money, 0);
    }


    function LotteryFactory(){

    }
}
