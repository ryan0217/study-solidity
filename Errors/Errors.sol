// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

error TransferNotOwner();

contract errors {
  mapping(uint => address) private _owners;

  function transferOwner1(uint tokenId, address newOwner) public {
    if (_owners[tokenId] != msg.sender) {
      revert TransferNotOwner();
    }
    _owners[tokenId] = newOwner;
  }

  function transferOwner2(uint tokenId, address newOwner) public {
    require(_owners[tokenId] == msg.sender, 'Transfer not owner');
    _owners[tokenId] = newOwner;
  }

  function transferOwner3(uint tokenId, address newOwner) public {
    assert(_owners[tokenId] == msg.sender);
    _owners[tokenId] = newOwner;
  }
}
