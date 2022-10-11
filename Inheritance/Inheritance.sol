// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract GrandParent {
  event Log(string msg);

  function hip() public virtual {
    emit Log('GrandParent: hip');
  }

  function pop() public virtual {
    emit Log('GrandParent: pop');
  }

  function grandParentSay() public virtual {
    emit Log('GrandParent: say');
  }
}

contract Parent is GrandParent {
  function hip() public virtual override {
    emit Log('Parent: hip');
  }

  function pop() public virtual override {
    emit Log('Parent: pop');
  }

  function parentSay() public virtual {
    emit Log('Parent: say');
  }

  function callGrandParentHip() public {
    GrandParent.hip();
  }

  function callGrandParentPop() public {
    super.pop();
  }
}

contract Child is GrandParent, Parent {
  function hip() public virtual override(GrandParent, Parent) {
    emit Log('Child: hip');
  }

  function pop() public virtual override(GrandParent, Parent) {
    emit Log('Child: pop');
  }
}
