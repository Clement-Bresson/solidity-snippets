pragma solidity 0.4.24;

contract Ownable {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function setOwner(address _owner) public onlyOwner {
    owner = _owner;
  }

  modifier onlyOwner {
    require(msg.sender == owner, "Not authorized");
    _;
  }
}