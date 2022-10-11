// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract OtherContract {
  uint private _x = 0;

  event Log(uint amount, uint gas);

  function getBalance() public view returns(uint) {
    return address(this).balance;
  }

  function setX(uint x) external payable {
    _x = x;
    if (msg.value > 0) {
      emit Log(msg.value, getBalance());
    }
  }

  function getX() external view returns(uint) {
    return _x;
  }
}

contract CallContract {
  function callSetX(address _address, uint _x) external {
    OtherContract(_address).setX(_x);
  }

  function callGetX(OtherContract _Address) external view returns(uint x) {
    x = _Address.getX();
  }

  function callGetX2(address _address) external view returns(uint x) {
    return OtherContract(_address).getX();
  }

  function setTransferETH(address _address, uint _x) external payable {
    OtherContract(_address).setX{value: msg.value}(_x);
  }
}
