`include "uvm_macros.svh"

import trans::*;
import uvm_pkg::*;

class apb_subscriber extends uvm_subscriber#(apb_sequence_item);

`uvm_component_utils(apb_subscriber);

uvm_analysis_imp#(apb_sequence_item,apb_subscriber) imp;

logic [8:0] apb_write_paddr;
logic [8:0] apb_read_paddr;
logic [7:0] apb_write_data;
logic [7:0] apb_read_data_out;




covergroup cg;

W_ADDRESS : coverpoint apb_write_paddr {bins b1[] = {[0:255]};}
R_ADDRESS : coverpoint apb_read_paddr {bins b2[]={[0:255]};}
R_DATA  : coverpoint apb_read_data_out {bins b3[]={[0:255]};}
R_WRITE : coverpoint apb_write_data   {bins b3[]={[0:255]};}
endgroup



function new (string name="subscriber",uvm_component parent);

super.new(name,parent);
cg =new;
imp=new("imp_sub",this);
endfunction 

function void write(apb_sequence_item t);


apb_write_paddr = t.apb_write_paddr;
apb_read_paddr = t.apb_read_paddr;
apb_write_data = t.apb_write_data;
apb_read_data_out = t.apb_read_data_out;
cg.sample();

endfunction 

function void report_phase(uvm_phase phase);

super.report_phase(phase);

`uvm_info("COVERAGE","\n \n ----------------------- COVERAGE REPORT ----------------------- \n\n",UVM_HIGH);
`uvm_info("COVERAGE",$sformatf("              COVERAGE : %f",cg.get_coverage()),UVM_HIGH);
`uvm_info("COVERAGE","\n \n ---------------------------------------------------------------\n\n",UVM_HIGH);

endfunction

endclass
