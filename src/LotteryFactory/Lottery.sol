pragma solidity ^0.4.0;

import "./Player.sol";

contract Lottery is Player{

    string public lotteryName;
    uint coolDown;

    uint startingTime;

    address public manager;

    address[] public addressIndexes;

    //TODO: mapping of addresses to stake
    address[] public pot;

    Player public winner;
    bool public isLotteryLive;
    uint public minEthToParticipate;

    function Lottery(string _name, uint _coolDown, address _creator) public {
        manager = _creator;
        lotteryName = _name;
        coolDown = _coolDown;
    }

    function () public payable {
        participate("Unknown");
    }

    function participate(string _playerName, string _stake) public payable {
        require(isLotteryLive);
        require(msg.value > minEthToParticipate * 1 ether);
        _createPlayer(msg.sender);

        pot.push(msg.sender);

        //TODO: save stake in pot mapping

        PlayerJoined(players[msg.sender].name, players[msg.sender].stake);
    }


    function startLottery(uint _minEth) public {
        //TODO: lottery is live if min 2 players participate
        isLotteryLive = true;
        minEthToParticipate = _minEth == 0 ? 0.01: _minEth;
    }

    //wait for the startingTime and call the method
    function selectWinner() internal {
        uint index = generateRandomNumber() % pot.length;
        pot[index].transfer(this.balance);

        winner.name = players[pot[index]].name;

        WinnerDeclared(winner.name);
    }

    function getWinningPrice() public view returns (uint){
        return this.balance;
    }

    function getPlayers() public view returns (address[]){
        return addressIndexes;
    }

    //TODO: add to logic
    function calculateWinProbability(uint _stake) internal returns (uint8){
        uint result = (_stake / pot) * 100;
        return uint8(result);
    }

    function _triggerCoolDown() internal {
        startingTime = now + coolDown;
    }

    function generateRandomNumber() private returns (uint){
        return uint(keccak256(block.difficulty, now, pot));
    }

    //TODO: getStake of playeraddress
    function stakeOf(address _owner) external view returns (uint){
        return playersStake[_owner];
    }

    event WinnerDeclared(string name);
    event PlayerJoined(string name, uint stake);
}
