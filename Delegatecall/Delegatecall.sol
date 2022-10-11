// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract DelegatecallA {
  uint public num;
  address public sender;

  function setVars(uint _num) public payable {
    num = _num;
    sender = msg.sender;
  }
}

contract DelegatecallB {
  uint public num;
  address public sender;

  function callSetVars(address _address, uint _num) external payable {
    (bool success, bytes memory data) = _address.call(abi.encodeWithSignature('setVars(uint256)', _num));
  }

  function delegatecallSetVars(address _address, uint _num) external payable {
    (bool success, bytes memory data) = _address.delegatecall(abi.encodeWithSignature('setVars(uint256)', _num));
  }
}
