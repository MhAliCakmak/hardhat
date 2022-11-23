// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Recycle is ERC20 {
    constructor() ERC20("Recycle Token", "RCY") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }
}