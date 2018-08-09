// Add possibility for the owner to pause/unpause a contract
// Comes along with modifiers to chose functions protected by pause/unpause state

pragma solidity 0.4.24;

import "./Ownable.sol";

contract Pausable is Ownable {
    
  event Pause();
  event Unpause();

  bool public paused = false;

  modifier whenNotPaused() {
    require(!paused, "Is paused");
    _;
  }

  modifier whenPaused() {
    require(paused, "Is not paused");
    _;
  }

  function pause() public onlyOwner whenNotPaused {
    paused = true;
    emit Pause();
  }

  function unpause() public onlyOwner whenPaused {
    paused = false;
    emit Unpause();
  }
}