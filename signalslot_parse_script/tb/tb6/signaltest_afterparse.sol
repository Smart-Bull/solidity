pragma solidity ^0.6.9;

contract A {
	uint data;
    uint public constant ONE_HOUR = 180;
    //////////////////////////////////////////////////////////////////////////////////////////////////
    // GENERATED BY SIGNALSLOT PARSER
    
    // Original Code:
    // signal priceFeedUpdate;

    // TODO: Arguments should not be limited to one 32 byte value

    // Generated variables that represent the signal
	bytes32 private priceFeedUpdate_data;
	bytes private priceFeedUpdate_dataslot;
	uint private priceFeedUpdate_status;
    bytes32 private priceFeedUpdate_key;

    // Set the data to be emitted
	function set_priceFeedUpdate_data(bytes32 dataSet) private {
       priceFeedUpdate_data = dataSet;
    }

    // Get the argument count
	function get_priceFeedUpdate_argc() public pure returns (uint argc) {
       return 32;
    }

    // Get the signal key
	function get_priceFeedUpdate_key() public view returns (bytes32 key) {
       return priceFeedUpdate_key;
    }

    // Get the data slot
    function get_priceFeedUpdate_dataslot() public view returns (bytes memory dataslot) {
       return priceFeedUpdate_dataslot;
    }

    // signal priceFeedUpdate construction
    // This should be called once in the contract construction.
    // This parser should automatically call it.
    function priceFeedUpdate() private {
        priceFeedUpdate_key = keccak256("function priceFeedUpdate()");
		assembly {
			sstore(priceFeedUpdate_status_slot, createsig(32, sload(priceFeedUpdate_key_slot)))
			sstore(priceFeedUpdate_dataslot_slot, priceFeedUpdate_data_slot)
		}
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    //////////////////////////////////////////////////////////////////////////////////////////////////
    // GENERATED BY SIGNALSLOT PARSER

    // Original code:
    // signal random

    // Generated variables that represent the signal
	bytes private random_dataslot;//the data pointer is NULL
	uint private random_status;
    bytes32 private random_key;

    // Get the signal key
	function get_random_key() public view returns (bytes32 key) {
       return random_key;
    }

    // Get the data slot
    function get_random_dataslot() private view returns (bytes memory dataslot) {
       return random_dataslot;
    }

    // signal random construction
    // This should be called once in the contract construction.
    // This parser should automatically call it.
    function random() private {
        random_key = keccak256("function random()");
		assembly {
			sstore(random_status_slot, createsig(0, sload(random_key_slot)))
			sstore(random_dataslot_slot, 0x0)
		}
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////


    function emitfunc(bytes32 DataSent) public {
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER
        
        // Original Code:
        // emitsig priceFeedUpdate(DataSent).delay(ONE_HOUR)

        // Set the data field in the signal
        set_priceFeedUpdate_data(DataSent);
        // Get the argument count
        uint this_priceFeedUpdate_argc = this.get_priceFeedUpdate_argc();
        // Get the data slot
		bytes memory this_priceFeedUpdate_dataslot = this.get_priceFeedUpdate_dataslot();
        // Get the signal key
		bytes32 this_priceFeedUpdate_key = this.get_priceFeedUpdate_key();
        // Use assembly to emit the signal and queue up slot transactions
		assembly {
			mstore(0x40, emitsig(this_priceFeedUpdate_key, ONE_HOUR, this_priceFeedUpdate_dataslot, this_priceFeedUpdate_argc))
	    }
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }

	constructor() public {
   priceFeedUpdate();
   random();
		data = 1;
	}
}

contract B {
	A dut;
	bytes32 public LocalPriceSum;
    uint public constant ONE_HOUR = 180;

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
        priceReceive_key = keccak256("priceReceive_func(bytes32)");
        assembly {
            sstore(priceReceive_status_slot, createslot(32, 10, 30000, sload(priceReceive_key_slot)))
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    // priceReceive code to be executed
    // The slot is converted to a function that will be called in slot transactions.
    function priceReceive_func(bytes32 obj) public {
        LocalPriceSum = LocalPriceSum | obj;
    }

	function bindfunc() public view {
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER

        // Original Code:
        // priceReceive.bind(dut.priceFeedUpdate)

        // Convert to address
		address dut_address = address(dut);
        // Get signal key from emitter contract
		bytes32 dut_priceFeedUpdate_key = dut.get_priceFeedUpdate_key();
        // Use assembly to bind slot to signal
		assembly {
			mstore(0x40, bindslot(dut_address, dut_priceFeedUpdate_key, sload(priceReceive_key_slot)))
	    }
        //////////////////////////////////////////////////////////////////////////////////////////////////

	}

    function detachfunc() public view {
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER

        // Original Code:
        // priceReceive.detach(dut.priceFeedUpdate)

        // Get the signal key
		bytes32 dut_priceFeedUpdate_key = dut.get_priceFeedUpdate_key();
        // Get the address
		address dut_address = address(dut);
        // Use assembly to detach the slot
		assembly{
			mstore(0x40, detachslot(dut_address, dut_priceFeedUpdate_key, sload(priceReceive_key_slot)))
		}
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }
}