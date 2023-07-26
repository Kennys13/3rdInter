// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BhupatiToken is ERC20 {
    address private owner;

    constructor() ERC20("Bhupati", "BHU") {
        owner = msg.sender;
    }

    modifier ownerOnly() {
        require(msg.sender == owner, "only Owner can call this function.");
        _;
    }

    function transferTokens(address recipient, uint256 amount) public virtual returns (bool) {
        _transfer(msg.sender, recipient, amount);
        return true;
    }

    function burnTokens(uint256 amount) external {
        _burn(msg.sender, amount);
    }

    function mintTokens(address account, uint256 amount) external ownerOnly {
        _mint(account, amount);
    }
}