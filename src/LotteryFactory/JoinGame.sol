pragma solidity ^0.4.0;

import "./LotteryFactory.sol";


contract JoinGame is LotteryFactory{

    function _triggerCoolDown() internal{
        startingTime = now + coolDown;
    }

    function bet (uint _playerId, uint stake) public onlyOwnerOf(_playerId) payable {
    }

    function JoinGame(){

    }

    modifier onlyOwnerOf(uint _playerId){
        require(msg.sender == playerToOwner[playerId]);
        _;
    }

    function stakeOf(address _owner) external view returns (uint){
        return playersStake[_owner];
    }


}
