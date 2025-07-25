// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {ERC20Permit} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract BaroloToken is ERC20, Ownable, ERC20Permit {
    constructor(address initialOwner)
        ERC20("Barolo Token", "BRL")
        Ownable(initialOwner)
        ERC20Permit("Barolo Token")
    {
        mint(msg.sender, 100*(10**18));
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
