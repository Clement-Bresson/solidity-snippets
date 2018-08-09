// Makes it possible to add admins/superadmins for a contract
// Only super admins can add/remove admins/super admins
// Comes with an modifier to protect a function for admins/super admins

pragma solidity 0.4.24;

import "./Ownable.sol";

contract SuperAdministrable  is Ownable {

  mapping(address => bool) isAdmin;
  mapping(address => bool) isSuperAdmin;

  modifier onlyAdmin {
    require(isAdmin[msg.sender] || isSuperAdmin[msg.sender] || msg.sender == owner, "Not authorized");
    _;
  }

  modifier onlySuperAdmin {
    require(isSuperAdmin[msg.sender], "Not authorized");
    _;
  }

  function addAdmin(address _admin) public onlySuperAdmin {
    require(!isAdmin[_admin], "Already admin");
    isAdmin[_admin] = true;
  }

  function removeAdmin(address _admin) public onlySuperAdmin {
    require(isAdmin[_admin], "Not admin");
    isAdmin[_admin] = false;
  }


  function addSuperAdmin(address _admin) public onlySuperAdmin {
    require(!isSuperAdmin[_admin], "Already super admin");
    isSuperAdmin[_admin] = true;
  }

  function removeSuperAdmin(address _admin) public onlySuperAdmin {
    require(isSuperAdmin[_admin], "Not super admin");
    isSuperAdmin[_admin] = false;
  }
}