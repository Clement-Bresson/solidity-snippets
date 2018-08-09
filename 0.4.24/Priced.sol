// Makes it possible to use price utilities

pragma solidity 0.4.24;

import "./Ownable.sol";

contract Priced is Ownable {

  uint public price;

  constructor (uint _price) public {
    price = _price;
  }

  function setPrice(uint _price) public onlyOwner {
    price = _price;
  }

  modifier exactCost {
    require(msg.value == price, "Wrong amount");
    _;
  }

  modifier minCost {
    require(msg.value >= price, "Insufficient amount");
    _;
  }

  modifier maxCost {
    require(msg.value <= price, "Too much amount");
    _;
  }
}