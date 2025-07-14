// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.27;

import {ERC1155} from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract GameAssets is ERC1155, Ownable {
    string public name = "My Game Assets";

    uint256 public constant PirateSword = 1;
    uint256 public constant doubloon = 2;

    constructor(address initialOwner) ERC1155("https://aqua-secondary-marsupial-179.mypinata.cloud/ipfs/bafybeibpp4eg7ixnp5in347o6vqmxykdlfcjl4pjnlkpin7polgkkzk2ou/{id}.json") Ownable(initialOwner) {
        mint(msg.sender, PirateSword, 1, "");
        mint(msg.sender, doubloon, 100, "");
    }

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function mint(address account, uint256 id, uint256 amount, bytes memory data)
        public
        onlyOwner
    {
        _mint(account, id, amount, data);
    }

    function mintBatch(address to, uint256[] memory ids, uint256[] memory amounts, bytes memory data)
        public
        onlyOwner
    {
        _mintBatch(to, ids, amounts, data);
    }
}
