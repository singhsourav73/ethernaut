// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import { GareKeeperHack } from '../src/13_GateKeeper_One.sol';

contract TestGateKeeperOne is Test {
  GareKeeperHack private contractHack;

  function setUp() public {
    contractHack = new GareKeeperHack(address(0xDDBE8224FECb23E4a6e509c709594a90b120E2D8));
  }

  function testEnter() public {
    for (uint256 i = 100; i < 8191; i++) {
      try contractHack.enter(i) {
        console.log("gas: ", i);
        return;
      } catch {}
    }
    revert("all failed");
  }
}