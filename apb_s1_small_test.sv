`include "uvm_macros.svh"
`include"apb_s1_s2_sequence.sv"

import trans::*;
import uvm_pkg::*;
import test::*;

class apb_s1_small_test extends apb_test;

`uvm_component_utils(apb_s1_small_test);

apb_s1_s2_sequence seq;

function new (string name = "test_1",uvm_component parent);

super.new(name,parent);

endfunction 

function void build_phase(uvm_phase phase);

super.build_phase(phase);

seq=apb_s1_s2_sequence::type_id::create("test1");

endfunction

task run_phase(uvm_phase phase);

super.run_phase(phase);

seq= apb_s1_s2_sequence::type_id::create("seq");

phase.raise_objection(this,"CONNECT THE SEQUENCE");

seq.start(env.agt.seq);

phase.drop_objection(this,"CONNECTED");

endtask

endclass 

