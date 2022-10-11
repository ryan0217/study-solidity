// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract DeleteContract {
  uint public value = 10;
  address public owner;

  constructor() payable {
    owner = msg.sender;
  }

  receive() payable external {}

  modifier onlyOwner() {
    require(msg.sender == owner, 'You do not have this permission');
    _;
  }

  function deleteContract() external onlyOwner {
    // 调用selfdestruct销毁合约，并把剩余的ETH转给msg.sender
    selfdestruct(payable(msg.sender));
  }

  function getBalance() external view returns(uint balance) {
    balance = address(this).balance;
  }
}
