pragma solidity ^0.6.9;
contract B {
	bytes3 public LocalPriceSum;
    //////////////////////////////////////////////////////////////////////////////////////////////////
    // GENERATED BY SIGNALSLOT PARSER

    // Original Code:
    // slot priceReceive {...}

    // Generated variables that represent the slot
    uint private priceReceive_status;
    bytes32 private priceReceive_key;

    // priceReceive construction
    // Should be called once in the contract construction
    function priceReceive() private {
        priceReceive_key = keccak256("priceReceive_func(bytes3)");
        assembly {
            sstore(priceReceive_status_slot, createslot(3, 10, 30000, sload(priceReceive_key_slot)))
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    // priceReceive code to be executed
    // The slot is converted to a function that will be called in slot transactions.
    function priceReceive_func(bytes3 obj) public {
        LocalPriceSum = LocalPriceSum | obj;
    }
constructor() public {
   priceReceive();
}
}