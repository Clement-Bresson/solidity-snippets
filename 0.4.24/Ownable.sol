pragma solidity 0.4.24;

// Makes the contract owned by its creator
// A utility function is provided to change the owner

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
