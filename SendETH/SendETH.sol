// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error SendFailed();
error CallFailed();

contract ReceiveETH {
  event Log(uint amount, uint gas);

  receive() external payable {
    emit Log(msg.value, getBalance());
  }

  function getBalance() public view returns(uint) {
    return address(this).balance;
  }
}

contract SendETH {
  constructor() payable {}

  receive() external payable {}

  function callETH(address payable _to, uint amount) external payable {
    (bool success, ) = _to.call{value: amount}('');
    if (!success) {
      revert CallFailed();
    }
  }

  function transferETH(address payable _to, uint amount) external payable {
    _to.transfer(amount);
  }

  function sendETH(address payable _to, uint amount) external payable {
    bool success = _to.send(amount);
    if (!success) {
      revert SendFailed();
    }
  }
}
