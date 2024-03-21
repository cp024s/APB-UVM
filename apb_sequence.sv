package Sequence;

import uvm_pkg::*;
import trans::*;
`include "uvm_macros.svh"

class apb_sequence extends uvm_sequence#(apb_sequence_item);

`uvm_object_utils(apb_sequence)

int no_of_count=500;

function new(string name="sequence");

super.new(name);

endfunction 


task body();


//s1_small();

//s1_large();

//s2_small();

//s2_large();

endtask


task s2_large;


repeat(1000)
begin
apb_sequence_item trans;

trans=new();
start_item(trans);
if(!trans.randomize() with {trans.apb_write_paddr > 9'h100 ;
                            trans.apb_write_data>8'h88;   })
`uvm_fatal("SEQUENCER","ERROR IN RANDOMIZATION 2")
finish_item(trans);
end

endtask




task s2_small;


repeat(1000)
begin
apb_sequence_item trans;

trans=new();
start_item(trans);
if(!trans.randomize() with {trans.apb_write_paddr > 9'h100 ;
                            trans.apb_write_data<8'h88;   })
`uvm_fatal("SEQUENCER","ERROR IN RANDOMIZATION 2")
finish_item(trans);
end


endtask


endclass

endpackage 