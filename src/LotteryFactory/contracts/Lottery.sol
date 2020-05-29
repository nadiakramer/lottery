pragma solidity >=0.4.21 <0.7.0;

contract Lottery{

    //Player Contract
    //--------------------------------------
    struct LotteryPlayer {
        string name;
        uint index;
        uint stake;
    }

    mapping(address => LotteryPlayer) players;
    mapping(uint => address payable) indexToAddress;

    function _createPlayer(address payable _player, string memory _playerName, uint _stake) internal {
        players[msg.sender].name = _playerName;
        players[msg.sender].stake = _stake;
        players[msg.sender].index = addressIndexes.push(msg.sender) - 1;
        indexToAddress[players[msg.sender].index] = _player;
    }
    //--------------------------------------------------------------------------

    string public lotteryName;
    uint coolDown;

    uint startingTime;

    address public manager;

    address[] public addressIndexes;

    //TODO: mapping of addresses to stake
    address[] public pot;

    LotteryPlayer public winner;
    bool public isLotteryLive;
    uint public minEthToParticipate;

    constructor (string memory _name, uint _coolDown, address _creator) public {
        manager = _creator;
        lotteryName = _name;
        coolDown = _coolDown;
    }

    function () external payable {
        participate("Unknown", 0);
    }

    function participate(string memory _playerName, uint _stake) public payable {
        require(isLotteryLive);
        require(msg.value > minEthToParticipate * 1 ether);
        _createPlayer(msg.sender, _playerName, _stake);

        pot.push(msg.sender);

        //TODO: save stake in pot mapping

        emit PlayerJoined(players[msg.sender].name, players[msg.sender].stake);
    }


    function startLottery(uint _minEth) public {
        //TODO: lottery is live if min 2 players participate
        isLotteryLive = true;
        minEthToParticipate = _minEth == 0 ? (uint)(0.01): _minEth;
    }

    //wait for the startingTime and call the method
    function selectWinner() public {
        require(pot.length > 0);
        uint index = generateRandomNumber('Hallo Welt') % pot.length;
        address payable winnersAddress = indexToAddress[index];
        winnersAddress.transfer(address(this).balance);

        winner.name = players[pot[index]].name;

        string memory winnerName = winner.name;

        emit WinnerDeclared(winnerName);
    }

    function getWinningPrice() public view returns (uint){
        return address (this).balance;
    }

    function getPlayers() public view returns (address[] memory){
        return addressIndexes;
    }

    //TODO: add to logic
//    function calculateWinProbability(uint _stake) internal returns (uint8){
//        uint result = (_stake / pot) * 100;
//        return uint8(result);
//    }

//    function _triggerCoolDown() internal {
//        startingTime = now + coolDown;
//    }

    function generateRandomNumber(string memory _str) private returns (uint){
        return uint(keccak256(abi.encodePacked(_str)));
    }

//    //TODO: getStake of playeraddress
//    function stakeOf(address _owner) external view returns (uint){
//        return playersStake[_owner];
//    }

    event WinnerDeclared(string name);
    event PlayerJoined(string name, uint stake);
}
