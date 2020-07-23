pragma solidity ^0.6.9;


contract PriceOracleBuffer {
    
    uint public constant ONE_HOUR_CONFLUX = 7200; 
    
    uint cur;
    uint nxt;
    
    
    uint peeked_data;

    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    // GENERATED BY SIGNALSLOT PARSER
    
    // Original Code:
    // signal PriceFeedUpdate;

    // TODO: Arguments should not be limited to one 32 byte value

    // Generated variables that represent the signal
	uint private PriceFeedUpdate_data;
	bytes private PriceFeedUpdate_dataslot;
	uint private PriceFeedUpdate_status;
    bytes32 private PriceFeedUpdate_key;

    // Set the data to be emitted
	function set_PriceFeedUpdate_data(uint dataSet) private {
       PriceFeedUpdate_data = dataSet;
    }

    // Get the argument count
	function get_PriceFeedUpdate_argc() public pure returns (uint argc) {
       return 32;
    }

    // Get the signal key
	function get_PriceFeedUpdate_key() public view returns (bytes32 key) {
       return PriceFeedUpdate_key;
    }

    // Get the data slot
    function get_PriceFeedUpdate_dataslot() public view returns (bytes memory dataslot) {
       return PriceFeedUpdate_dataslot;
    }

    // signal PriceFeedUpdate construction
    // This should be called once in the contract construction.
    // This parser should automatically call it.
    function PriceFeedUpdate() private {
        PriceFeedUpdate_key = keccak256("function PriceFeedUpdate()");
		assembly {
			sstore(PriceFeedUpdate_status_slot, createsig(32, sload(PriceFeedUpdate_key_slot)))
			sstore(PriceFeedUpdate_dataslot_slot, PriceFeedUpdate_data_slot)
		}
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////


    
    //////////////////////////////////////////////////////////////////////////////////////////////////
    // GENERATED BY SIGNALSLOT PARSER

    // Original Code:
    // slot SendUpdate {...}

    // Generated variables that represent the slot
    uint private SendUpdate_status;
    bytes32 private SendUpdate_key;

    // Get the signal key
	function get_SendUpdate_key() public view returns (bytes32 key) {
       return SendUpdate_key;
    }

    // SendUpdate construction
    // Should be called once in the contract construction
    function SendUpdate() private {
        SendUpdate_key = keccak256("SendUpdate_func(uint)");
        assembly {
            sstore(SendUpdate_status_slot, createslot(32, 10, 30000, sload(SendUpdate_key_slot)))
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    // SendUpdate code to be executed
    // The slot is converted to a function that will be called in slot transactions.
    function SendUpdate_func(uint unused) public {
        peeked_data = peeked_data + 1;
        cur = nxt;
        nxt = peeked_data;
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER
        
        // Original Code:
        // emitsig PriceFeedUpdate(cur).delay(ONE_HOUR_CONFLUX)

        // Set the data field in the signal
        set_PriceFeedUpdate_data(cur);
        // Get the argument count
        uint this_emitsig_PriceFeedUpdate_argc = get_PriceFeedUpdate_argc();
        // Get the data slot
		bytes memory this_emitsig_PriceFeedUpdate_dataslot = get_PriceFeedUpdate_dataslot();
        // Get the signal key
		bytes32 this_emitsig_PriceFeedUpdate_key = get_PriceFeedUpdate_key();
        // Use assembly to emit the signal and queue up slot transactions
		assembly {
			mstore(0x40, emitsig(this_emitsig_PriceFeedUpdate_key, ONE_HOUR_CONFLUX, this_emitsig_PriceFeedUpdate_dataslot, this_emitsig_PriceFeedUpdate_argc))
	    }
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }

    
    constructor() public {
   PriceFeedUpdate();
   SendUpdate();
        
        
        peeked_data = 0;
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER

        // Original Code:
        // SendUpdate.bind(this.PriceFeedUpdate)

        // Convert to address
		address this_bindslot_address = address(this);
        // Get signal key from emitter contract
		bytes32 this_bindslot_PriceFeedUpdate_key = get_PriceFeedUpdate_key();
        // Get slot key from receiver contract
        bytes32 this_this_bindslot_SendUpdate_key = get_SendUpdate_key();
        // Use assembly to bind slot to signal
		assembly {
			mstore(0x40, bindslot(this_bindslot_address, this_bindslot_PriceFeedUpdate_key, this_this_bindslot_SendUpdate_key))
	    }
        //////////////////////////////////////////////////////////////////////////////////////////////////

        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER
        
        // Original Code:
        // emitsig PriceFeedUpdate(0).delay(0)

        // Set the data field in the signal
        set_PriceFeedUpdate_data(0);
        // Get the argument count
        uint this_emitsig_PriceFeedUpdate_argc = get_PriceFeedUpdate_argc();
        // Get the data slot
		bytes memory this_emitsig_PriceFeedUpdate_dataslot = get_PriceFeedUpdate_dataslot();
        // Get the signal key
		bytes32 this_emitsig_PriceFeedUpdate_key = get_PriceFeedUpdate_key();
        // Use assembly to emit the signal and queue up slot transactions
		assembly {
			mstore(0x40, emitsig(this_emitsig_PriceFeedUpdate_key, 0, this_emitsig_PriceFeedUpdate_dataslot, this_emitsig_PriceFeedUpdate_argc))
	    }
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }
}

contract ReceiverA {
    
    PriceOracleBuffer public oracle;
    
    uint price;

    //////////////////////////////////////////////////////////////////////////////////////////////////
    // GENERATED BY SIGNALSLOT PARSER

    // Original Code:
    // slot RecievePrice {...}

    // Generated variables that represent the slot
    uint private RecievePrice_status;
    bytes32 private RecievePrice_key;

    // Get the signal key
	function get_RecievePrice_key() public view returns (bytes32 key) {
       return RecievePrice_key;
    }

    // RecievePrice construction
    // Should be called once in the contract construction
    function RecievePrice() private {
        RecievePrice_key = keccak256("RecievePrice_func(uint)");
        assembly {
            sstore(RecievePrice_status_slot, createslot(32, 10, 30000, sload(RecievePrice_key_slot)))
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    // RecievePrice code to be executed
    // The slot is converted to a function that will be called in slot transactions.
    function RecievePrice_func(uint new_price) public {
        price = new_price;
    }

    constructor(address oracle_addr) public {
   RecievePrice();
        oracle = PriceOracleBuffer(oracle_addr);
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER

        // Original Code:
        // RecievePrice.bind(oracle.PriceFeedUpdate)

        // Convert to address
		address oracle_bindslot_address = address(oracle);
        // Get signal key from emitter contract
		bytes32 oracle_bindslot_PriceFeedUpdate_key = oracle.get_PriceFeedUpdate_key();
        // Get slot key from receiver contract
        bytes32 this_oracle_bindslot_RecievePrice_key = get_RecievePrice_key();
        // Use assembly to bind slot to signal
		assembly {
			mstore(0x40, bindslot(oracle_bindslot_address, oracle_bindslot_PriceFeedUpdate_key, this_oracle_bindslot_RecievePrice_key))
	    }
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }
    
    function detach() public {
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER

        // Original Code:
        // this.RecievePrice.detach(oracle.PriceFeedUpdate)

        // Get the signal key
		bytes32 oracle_detach_PriceFeedUpdate_key = oracle.get_PriceFeedUpdate_key();
        // Get the address
		address oracle_detach_address = address(oracle);
        //Get the slot key
        bytes32 this_oracle_bindslot_RecievePrice_key = get_RecievePrice_key();
        // Use assembly to detach the slot
		assembly{
			mstore(0x40, detachslot(oracle_detach_address, oracle_detach_PriceFeedUpdate_key, this_oracle_bindslot_RecievePrice_key))
		}
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }
}

contract ReceiverB {
    
    PriceOracleBuffer public oracle;
    
    uint price;

    //////////////////////////////////////////////////////////////////////////////////////////////////
    // GENERATED BY SIGNALSLOT PARSER

    // Original Code:
    // slot RecievePrice {...}

    // Generated variables that represent the slot
    uint private RecievePrice_status;
    bytes32 private RecievePrice_key;

    // Get the signal key
	function get_RecievePrice_key() public view returns (bytes32 key) {
       return RecievePrice_key;
    }

    // RecievePrice construction
    // Should be called once in the contract construction
    function RecievePrice() private {
        RecievePrice_key = keccak256("RecievePrice_func(uint)");
        assembly {
            sstore(RecievePrice_status_slot, createslot(32, 10, 30000, sload(RecievePrice_key_slot)))
        }
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////

    // RecievePrice code to be executed
    // The slot is converted to a function that will be called in slot transactions.
    function RecievePrice_func(uint new_price) public {
        price = new_price;
    }

    constructor(address oracle_addr) public {
   RecievePrice();
        oracle = PriceOracleBuffer(oracle_addr);
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER

        // Original Code:
        // RecievePrice.bind(oracle.PriceFeedUpdate)

        // Convert to address
		address oracle_bindslot_address = address(oracle);
        // Get signal key from emitter contract
		bytes32 oracle_bindslot_PriceFeedUpdate_key = oracle.get_PriceFeedUpdate_key();
        // Get slot key from receiver contract
        bytes32 this_oracle_bindslot_RecievePrice_key = get_RecievePrice_key();
        // Use assembly to bind slot to signal
		assembly {
			mstore(0x40, bindslot(oracle_bindslot_address, oracle_bindslot_PriceFeedUpdate_key, this_oracle_bindslot_RecievePrice_key))
	    }
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }
    
    function detach() public {
        //////////////////////////////////////////////////////////////////////////////////////////////////
        // GENERATED BY SIGNALSLOT PARSER

        // Original Code:
        // this.RecievePrice.detach(oracle.PriceFeedUpdate)

        // Get the signal key
		bytes32 oracle_detach_PriceFeedUpdate_key = oracle.get_PriceFeedUpdate_key();
        // Get the address
		address oracle_detach_address = address(oracle);
        //Get the slot key
        bytes32 this_oracle_bindslot_RecievePrice_key = get_RecievePrice_key();
        // Use assembly to detach the slot
		assembly{
			mstore(0x40, detachslot(oracle_detach_address, oracle_detach_PriceFeedUpdate_key, this_oracle_bindslot_RecievePrice_key))
		}
        //////////////////////////////////////////////////////////////////////////////////////////////////

    }
}