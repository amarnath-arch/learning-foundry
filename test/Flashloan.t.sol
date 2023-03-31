// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.12;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "solmate/test/utils/mocks/MockERC20.sol";




import "../src/Contract.sol";

contract FlashloanerTest is Test {
    // Vm vm = Vm(HEVM_ADDRESS);

    address alice = address(0x1337);
    address bob = address(0x133702);

    MockERC20 token;
    Flashloaner loaner;



    function setUp() public {
        vm.label(alice, "Alice");
        vm.label(bob, "Bob");
        vm.label(address(this), "TestContract");

        token = new MockERC20("TestToken","TT0",18);
        vm.label(address(token),"TestToken");

        loaner = new Flashloaner(address(token));

        token.mint(address(this), 1e18);

    }


    function test_ConstructorNonZeroTokenRevert() public{
        vm.expectRevert(Flashloaner.TokenAddressCannotBeZero.selector);
        new Flashloaner(address(0x0));
    }

   
}
