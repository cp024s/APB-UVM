import uvm_pkg::*;
import Sequence::*;
import trans::*;
`include "uvm_macros.svh"


class apb_s1_small_sequence extends apb_sequence;

`uvm_object_utils(apb_s1_small_sequence)

function new(string name="sequence_s1_small");

super.new(name);

endfunction 


virtual task body();

repeat(1000)
begin
apb_sequence_item trans;

trans=new();
start_item(trans);
if(!trans.randomize() with {trans.apb_write_paddr <= 9'h100 ;
                            trans.apb_write_data<8'h88; })
`uvm_fatal("SEQUENCER","ERROR IN RANDOMIZATION 1")
trans.apb_read_paddr = trans.apb_write_paddr;
finish_item(trans);
end

endtask

endclass 