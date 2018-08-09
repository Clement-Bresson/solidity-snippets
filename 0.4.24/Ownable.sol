// Makes the contract owned by its creator
// A utility function is provided to change the owner

pragma solidity 0.4.24;

contract Ownable {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner, "Not authorized");
    _;
  }

  function setOwner(address _owner) public onlyOwner {
    owner = _owner;
  }
}
