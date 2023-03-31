// SPDX-License-Identifier:MIT

pragma solidity 0.8.12;

import {ERC20} from "solmate/tokens/ERC20.sol";
import {ReentrancyGuard} from "solmate/utils/ReentrancyGuard.sol";

contract Flashloaner is ReentrancyGuard{
    ERC20 public immutable damnValuableToken;
    uint256 public poolBalance;

    error TokenAddressCannotBeZero();

    constructor(address _tokenAddress){
        if(_tokenAddress == address(0)) revert TokenAddressCannotBeZero();
        damnValuableToken = ERC20(_tokenAddress);
    }
}