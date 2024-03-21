import trans::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
`include"apb_sequencer.sv"
`include"apb_driver.sv"
`include"apb_monitor.sv"

class apb_agent extends uvm_agent;

apb_driver driv;
apb_sequencer seq;
apb_monitor mon;

apb_config cfg;

`uvm_component_utils_begin(apb_agent)
`uvm_field_object(driv,UVM_ALL_ON)
`uvm_field_object(seq,UVM_ALL_ON)
`uvm_field_object(mon,UVM_ALL_ON)
`uvm_component_utils_end

int no_of_count=0;

function new(string name="agt",uvm_component parent);

super.new(name,parent);


endfunction

function void build_phase(uvm_phase phase);

super.build_phase(phase);

if(!uvm_config_db#(apb_config)::get(this,"","cfg",cfg))
`uvm_fatal("AGT","VIF");

if(cfg.is_active==UVM_ACTIVE)
begin
driv=apb_driver::type_id::create("driv",this);
seq=apb_sequencer::type_id::create("seq",this);
end

mon=apb_monitor::type_id::create("monitor",this);


endfunction 

function void connect_phase(uvm_phase phase);

super.connect_phase(phase);


if(cfg.is_active==UVM_ACTIVE)
begin
driv.vif=cfg.vif;
mon.vif=cfg.vif;
end
driv.seq_item_port.connect(seq.seq_item_export);

endfunction 

task run_phase(uvm_phase phase);

super.run_phase(phase);

endtask


endclass 