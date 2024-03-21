import uvm_pkg::*;
import trans::*;
`include "uvm_macros.svh"
`include"apb_s1_small_sequence.sv"
`include"apb_s1_large_sequence.sv"
`include"apb_s2_small_sequence.sv"
`include"apb_s2_large_sequence.sv"

class apb_s1_s2_sequence extends uvm_sequence#(apb_sequence_item);

`uvm_object_utils(apb_s1_s2_sequence)

apb_s1_small_sequence t1;
apb_s2_large_sequence t2;
apb_s1_small_sequence t3;
apb_s2_large_sequence t4;


function new(string name="sequence");

super.new(name);

t1=apb_s1_small_sequence::type_id::create("t1");
t2=apb_s2_large_sequence::type_id::create("t2");
t3=apb_s1_small_sequence::type_id::create("t3");
t4=apb_s2_large_sequence::type_id::create("t4");

endfunction 


task body();

`uvm_do(t1);
`uvm_do(t2);
`uvm_do(t3);
`uvm_do(t4);

endtask

endclass

