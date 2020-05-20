pragma solidity ^0.4.0;

import "./Player.sol";



contract JoinGame is Player {

    function _triggerCoolDown() internal {
        startingTime = now + coolDown;
    }

    function bet(uint _playerId) public onlyOwnerOf(_playerId) payable {
        players[_playerId].stake = msg.value;
        amountOfBets++;
        if (amountOfBets == 2) {
            _triggerCoolDown();
        }
    }

    function calculateWinProbability(uint _stake) internal returns (uint8){
        uint result = (_stake/pot)*100;
        return uint8(result);
    }

    function generateRandomNumber() private returns (uint){
        return 10;
    }

    //wait for the startingTime and call the method
    function selectWinner() internal returns (address){
        uint rand = generateRandomNumber();
        //check ranges of players
        //find the address of the winning player
        //return this address
        return null;
    }

    function transferToWinner(address _from) private{
        //transfer coins from the owner to the winner
        address to = selectWinner();

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
