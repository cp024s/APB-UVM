package test;

`include "uvm_macros.svh"
`include"apb_env.sv"

import trans::*;
import uvm_pkg::*;

class apb_test extends uvm_test;

`uvm_component_utils(apb_test);

apb_env env;

//apb_sequence seq;

apb_config cfg;

virtual itf vif;

function new (string name = "test",uvm_component parent);

super.new(name,parent);

endfunction 

function void build_phase(uvm_phase phase);

super.build_phase(phase);

env=apb_env::type_id::create("env",this);

cfg = apb_config::type_id::create("config");
if(!uvm_config_db#(virtual itf)::get(this,"*","VIF",vif))
`uvm_fatal("TEST","VIF");

cfg.vif=vif;
cfg.is_active=UVM_ACTIVE;
cfg.has_scoreboard=1;
cfg.has_coverage=1;

uvm_config_db#(apb_config)::set(this,"env","cfg",cfg);


endfunction

/*task run_phase(uvm_phase phase);

super.run_phase(phase);

seq= apb_sequence::type_id::create("seq");

phase.raise_objection(this,"CONNECT THE SEQUENCE");

seq.start(env.agt.seq);

phase.drop_objection(this,"CONNECTED");

endtask*/

endclass 


 endpackage 