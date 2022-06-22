// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.13;

import "../FunkyLP.sol";

import "@std/Test.sol";

contract GreeterTest is Test {
    using stdStorage for StdStorage;

    FunkyLP zap;
    uint amountA;

    address tokenA = 0x04068DA6C83AFCFA0e13ba15A6696662335D5B75;
    address tokenB = 0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83;

    address lp = 0x2b4C76d0dc16BE1C31D4C1DC53bF9B45987Fc75c;

    address roosh = 0xdDf169Bf228e6D6e701180E2e6f290739663a784;


    event GMEverybodyGM();

    function setUp() public {
        console.log(unicode"Testing FunkyLP...");
        emit GMEverybodyGM();
        zap = new FunkyLP();

    }

    // VM Cheatcodes can be found in ./lib/forge-std/src/Vm.sol
    // Or at https://github.com/foundry-rs/forge-std
    function testNormal() public {
       vm.startPrank(roosh);
       IERC20(tokenA).approve(address(zap), 1e33);
       amountA = 1e6;
       zap.zap(tokenA, tokenB, amountA, false);
       console.log(IERC20(lp).balanceOf(roosh), "LP TOKEN BALANCE");
       vm.stopPrank();
    }

    function testFunky() public {
       vm.startPrank(roosh);
       IERC20(tokenA).approve(address(zap), 1e33);
       amountA = 1e6    ;
       zap.zap(tokenA, tokenB, amountA, true);

       console.log(IERC20(lp).balanceOf(roosh), "LP TOKEN BALANCE");
       vm.stopPrank();
    }

}
