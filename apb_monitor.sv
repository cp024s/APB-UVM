`include "uvm_macros.svh"

import trans::*;
import uvm_pkg::*;


class apb_monitor extends uvm_monitor;

`uvm_component_utils(apb_monitor);

virtual itf vif;

apb_config cfg;


uvm_analysis_port#(apb_sequence_item) analysis;

function new(string name,uvm_component parent);

super.new(name,parent);

analysis = new("ap",parent);


endfunction 

function void build_phase(uvm_phase phase);

super.build_phase(phase);

endfunction 

function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

endfunction 


task run_phase(uvm_phase phase);

super.run_phase(phase);

forever
begin

// WRITE CYCLE

apb_sequence_item trans=new();
@(negedge vif.READ_WRITE);

@(posedge vif.PREADY);

trans.apb_write_data=vif.apb_write_data;
trans.apb_write_paddr=vif.apb_write_paddr;

// READ CYCLE

@(posedge vif.READ_WRITE);

@(posedge vif.PREADY);
#2;

trans.apb_read_paddr=vif.apb_write_paddr;
trans.apb_read_data_out=vif.apb_read_data_out;
analysis.write(trans);


end

endtask

endclass
