import uvm_pkg::*;
`include "uvm_macros.svh"


class apb_config extends uvm_object;

`uvm_object_utils(apb_config);

virtual itf vif;

uvm_active_passive_enum is_active = UVM_ACTIVE;

bit has_scoreboard = 1;

bit has_coverage = 1;


function new (string name ="obj");

super.new(name);

endfunction 

endclass
