// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Parent {
  modifier exactDividedBy2And3(uint number) virtual {
    require(number % 2 == 0 && number % 3 == 0, 'This number is invalid');
    _;
  }
}

contract Child is Parent {
  function getExactDividedBy2And3(uint _dividend) public pure exactDividedBy2And3(_dividend) returns(uint, uint) {
    uint div2 = _dividend / 2;
    uint div3 = _dividend / 3;
    return (div2, div3);
  }
}
