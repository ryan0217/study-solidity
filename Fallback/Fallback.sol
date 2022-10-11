// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract ReceiveETH {
  event receivedCalled(address sender, uint value);
  event fallbackCalled(address sender, uint value, bytes data);

  receive() external payable {
    emit receivedCalled(msg.sender, msg.value);
  }

  fallback() external payable {
    emit fallbackCalled(msg.sender, msg.value, msg.data);
  }
}
