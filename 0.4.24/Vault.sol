pragma solidity 0.4.24;

import "./Ownable.sol";

// Add utility functions to manage the contract balance
// This contract balance can only be managed by owner

contract Vault is Ownable { 

  function getBalance() public view returns (uint) {
    return address(this).balance;
  }

  function withdraw(uint amount) public onlyOwner {
    require(address(this).balance >= amount, "Insufficient balance");
    owner.transfer(amount);
  }

  function withdrawAll() public onlyOwner {
    withdraw(address(this).balance);
  }
}