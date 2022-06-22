// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.13;

import {FunkyLP} from "../FunkyLP.sol";

import "@std/Test.sol";

contract GreeterTest is Test {
    using stdStorage for StdStorage;

    FunkyLP greeter;


    event GMEverybodyGM();

    function setUp() public {
        console.log(unicode"🧪 Testing FunkyLP...");
        

    }

    // VM Cheatcodes can be found in ./lib/forge-std/src/Vm.sol
    // Or at https://github.com/foundry-rs/forge-std
    function testSetGm() public {
       
    }

}
