// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Parent {
  uint public parentNumber;

  constructor(uint _parentNumber) {
    parentNumber = _parentNumber;
  }
}

contract Child is Parent {
  constructor(uint _childNumber) Parent(_childNumber * _childNumber) {}
}
