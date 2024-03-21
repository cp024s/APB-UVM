`include "uvm_macros.svh"
`include"apb_agent.sv"
`include"apb_scoreboard.sv"
`include"apb_subscriber.sv"

import trans::*;
import uvm_pkg::*;

class apb_env extends uvm_env;

apb_agent agt;

apb_scoreboard scb;

apb_subscriber sub;

apb_config cfg;


`uvm_component_utils(apb_env);

function new(string name="env",uvm_component parent);

super.new(name,parent);

endfunction


function void connect_phase(uvm_phase phase);

super.connect_phase(phase);
if(cfg.has_scoreboard)
agt.mon.analysis.connect(scb.imp);
if(cfg.has_coverage)
agt.mon.analysis.connect(sub.imp);

endfunction 

function void build_phase(uvm_phase phase);

super.build_phase(phase);

agt=apb_agent::type_id::create("agt",this);

scb=apb_scoreboard::type_id::create("scb",this);

sub=apb_subscriber::type_id::create("sub",this);

if(!uvm_config_db#(apb_config)::get(this,"","cfg",cfg))
`uvm_fatal("ENV","VIF");

uvm_config_db#(apb_config)::set(this,"agt","cfg",cfg);


scb.set_report_verbosity_level(UVM_HIGH);
sub.set_report_verbosity_level(UVM_HIGH);

endfunction


endclass 
