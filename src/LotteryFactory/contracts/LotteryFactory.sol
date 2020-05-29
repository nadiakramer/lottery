pragma solidity >=0.4.21 <0.7.0;

import "./Lottery.sol";

contract LotteryFactory is Lottery {
    address[] public lotteries;

    struct lottery{
        uint index;
        address manager;
    }

    mapping(address => lottery) lotteryStructs;

    function createLottery(string memory _name, uint _coolDown) public {
        address newLottery = (address) (new Lottery(_name, _coolDown,  msg.sender));
        lotteryStructs[newLottery].index = lotteries.push(newLottery) - 1;
        lotteryStructs[newLottery].manager = msg.sender;

        emit OpenLottery(newLottery);
    }

    function getLotteries() public view returns(address[] memory){
        return lotteries;
    }

    event OpenLottery(address lotteryAddress);
}
