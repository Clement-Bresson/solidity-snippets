// Makes it possible to use price utilities

pragma solidity 0.4.24;

contract Priced {

  modifier minCost(uint _price){
    require(msg.value >= _price, "Insufficient amount");
    _;
  }

  modifier maxCost(uint _price){
    require(msg.value <= _price, "Too much amount");
    _;
  }

  modifier exactCost(uint _price){
    require(msg.value == _price, "Wrong amount");
    _;
  }
}