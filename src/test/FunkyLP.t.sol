// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.13;

import "../FunkyLP.sol";

import "@std/Test.sol";

contract GreeterTest is Test {
    using stdStorage for StdStorage;

    FunkyLP zap;
    uint amountA;

    address tokenA = 0x21be370D5312f44cB42ce377BC9b8a0cEF1A4C83;
    address tokenB = 0xF24Bcf4d1e507740041C9cFd2DddB29585aDCe1e;

    address lp = 0x648a7452DA25B4fB4BDB79bADf374a8f8a5ea2b5;

    address user =0x4901C740607E415685b4d09E4Aa960329cd183Ca;


    event GMEverybodyGM();

    function setUp() public {
        console.log(unicode"Testing FunkyLP...");
        emit GMEverybodyGM();
        zap = new FunkyLP();

    }

    // VM Cheatcodes can be found in ./lib/forge-std/src/Vm.sol
    // Or at https://github.com/foundry-rs/forge-std
    function testNormal() public {
       vm.startPrank(user);
       IERC20(tokenA).approve(address(zap), 1e33);
       amountA = 1e22;
       zap.zap(tokenA, tokenB, amountA, false);
       console.log(IERC20(lp).balanceOf(user), "LP TOKEN BALANCE");
       vm.stopPrank();
    }

    function testFunky() public {
       vm.startPrank(user);
       IERC20(tokenA).approve(address(zap), 1e33);
       amountA = 1e22;
       zap.zap(tokenA, tokenB, amountA, true);

       console.log(IERC20(lp).balanceOf(user), "LP TOKEN BALANCE");
       vm.stopPrank();
    }

}
