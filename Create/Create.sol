// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract Pair {
  address public factory; // 工厂合约地址
  address public tokenA; // 代币1
  address public tokenB; // 代币2

  constructor() payable {
    factory = msg.sender;
  }

  function initialize(address _tokenA, address _tokenB) external {
    require(msg.sender == factory, 'UniswapV2: FORBIDDEN');
    tokenA = _tokenA;
    tokenB = _tokenB;
  }
}

contract PairFactory {
  mapping(address => mapping(address => address)) public getPair; // 通过两个代币地址查Pair地址
  address[] public allPairs; // 保存所有Pair地址

  function createPair(address tokenA, address tokenB) external returns(address pairAddress) {
    // 创建新合约
    Pair pair = new Pair();

    // 调用新合约的initialize方法
    pair.initialize(tokenA, tokenB);

    // 更新地址map
    pairAddress = address(pair);
    allPairs.push(pairAddress);
    getPair[tokenA][tokenB] = pairAddress;
    getPair[tokenB][tokenA] = pairAddress;
  }
}
