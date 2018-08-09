// Makes it possible to add admins for a contract
// Only the owner can add/remove admins
// Comes with an modifier to protect a function for admins

pragma solidity 0.4.24;

import "./Ownable.sol";

contract Administrable is Ownable {

  mapping(address => bool) isAdmin;

  constructor() public {
    isAdmin[msg.sender] = true;
  }

  modifier onlyAdmin {
    require(isAdmin[msg.sender], "Not authorized");
    _;
  }

  function addAdmin(address _admin) public onlyOwner {
    require(!isAdmin[_admin], "Already admin");
    isAdmin[_admin] = true;
  }

  function removeAdmin(address _admin) public onlyOwner {
    require(isAdmin[_admin], "Not admin");
    isAdmin[_admin] = false;
  }
}
