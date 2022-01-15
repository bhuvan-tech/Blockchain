pragma solidity ^0.4.17;

contract Lottery{
    address public manager;
    address[] public players;

    function Lottery() public {
        manager = msg.sender;       //msg object is has a global scope
    }

    function enter() public payable{
        require(msg.value > .01 ether);     //msg.value in wei
         
        players.push(msg.sender);
    }

    function random() private view returns(uint){
        return uint(keccak256(block.difficulty, now, players));
        //is also sha3 algorithm used to pick a random no, it takes current block difficulty, time and address as input
    }

    function pickWinner() public onlyManagerCanCall{
        uint winner = random() % players.length;
        players[winner].transfer(this.balance);     //sending pool money to address of winner

        players = new address[](0);     //new dynammic array of address with length 0 to create/prepare for another round 
    }

    modifier onlyManagerCanCall() {
        require(msg.sender == manager);     //used to check manager called this function
        _;  //replaces line no 23 to 26
    }

    function getPlayers() public view returns(address[]){
        return players;
    }
}