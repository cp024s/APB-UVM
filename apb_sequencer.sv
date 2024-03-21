`include "uvm_macros.svh"

import trans::*;
import uvm_pkg::*;

class apb_sequencer extends uvm_sequencer#(apb_sequence_item);

`uvm_component_utils(apb_sequencer);

function new(string name="sequencer",uvm_component parent);

super.new(name,parent);

endfunction 

endclass
