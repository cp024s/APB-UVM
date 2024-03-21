package trans;

 import uvm_pkg::*;
`include "uvm_macros.svh"
`include"apb_config.sv"

 int count=1000;

class apb_sequence_item extends uvm_sequence_item;

`uvm_object_utils(apb_sequence_item)

logic PRESETn,READ_WRITE,transfer;

rand logic [7:0] apb_write_data;

randc logic [8:0] apb_write_paddr,apb_read_paddr;

logic [7:0] apb_read_data_out;

logic PSLVRR,PREADY;


function new(uvm_component parent=null,string name="trans");

super.new(name);

endfunction

endclass 
endpackage 