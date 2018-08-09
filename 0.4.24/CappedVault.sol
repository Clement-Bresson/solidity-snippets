// a Vault capped to 33333 ether (in total ether sent over time)

pragma solidity 0.4.24;

import "./Vault.sol";

contract CappedVault is Vault { 

  uint public limit;
  uint withdrawn = 0;

  constructor() public {
    limit = 33333 ether;
  }

  function () public payable {
    require(total() + msg.value <= limit,"Limit reached");
  }

  function total() public view returns(uint) {
    return getBalance() + withdrawn;
  }

  function withdraw(uint amount) public onlyOwner {
    require(address(this).balance >= amount, "Insufficient balance");
    owner.transfer(amount);
    withdrawn += amount;
  }
}