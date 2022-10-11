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

contract PairFactory2 {
  mapping(address => mapping(address => address)) public getPair; // 通过两个代币地址查Pair地址
  address[] public allPairs; // 保存所有Pair地址

  constructor() payable {}

  function createPair2(address tokenA, address tokenB) payable external returns(address pairAddress) {
    // 避免tokenA和tokenB相同产生的冲突
    require(tokenA != tokenB, 'IDENTICAL_ADDRESSES');

    // 将tokenA和tokenB按大小排序
    (address _tokenA, address _tokenB) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
    bytes32 salt = keccak256(abi.encodePacked(_tokenA, _tokenB));

    // 用create2部署新合约
    Pair pair = new Pair{salt: salt, value: msg.value}();
    
    // 调用新合约的initialize方法
    pair.initialize(tokenA, tokenB);
    
    // 更新地址map
    pairAddress = address(pair);
    allPairs.push(pairAddress);
    getPair[tokenA][tokenB] = pairAddress;
    getPair[tokenB][tokenA] = pairAddress;
  }

  // 提前计算pair合约地址
  function calcAddress(address tokenA, address tokenB) public view returns(address predictedAddress) {
    // 避免tokenA和tokenB相同产生的冲突
    require(tokenA != tokenB, 'IDENTICAL_ADDRESSES');

    // 将tokenA和tokenB按大小排序
    (address _tokenA, address _tokenB) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA);
    bytes32 salt = keccak256(abi.encodePacked(_tokenA, _tokenB));

    // 计算合约地址方法 hash()
    predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
      bytes1(0xff),
      address(this),
      salt,
      keccak256(type(Pair).creationCode)
    )))));
    // 0x2c44b726ADF1963cA47Af88B284C06f30380fC78, 0xbb4CdB9CBd36B01bD1cBaEBF2De08d9173bc095c
  }
}
