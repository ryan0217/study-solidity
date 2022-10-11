// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract FunctionTypes {
  uint public number = 5;

  // 默认
  function add() external {
    number += 1;
  }

  // pure
  function addPure(uint _number) external pure returns(uint new_number) {
    new_number = _number + 1;
  }

  // view
  function addView() external view returns(uint new_number) {
    new_number = number + 2;
  }

  // internal
  function minus() internal {
    number -= 1;
  }

  // 合约内的函数可以调用内部函数
  function minusCall() external {
    minus();
  }

  // payable: 递钱，能给合约支付eth的函数
  function minusPayable() external payable returns(uint balance) {
    minus();
    balance = address(this).balance;
  }
}
