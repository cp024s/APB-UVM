`include "uvm_macros.svh"

import trans::*;
import uvm_pkg::*;

class apb_scoreboard extends uvm_scoreboard;

`uvm_component_utils(apb_scoreboard);

uvm_analysis_imp#(apb_sequence_item,apb_scoreboard) imp;

int no_success=0,no_unsuccess=0,count=0;

real result;

function new (string name="scoreboard",uvm_component parent);

super.new(name,parent);
imp=new("imp",this);

endfunction 

function void write(apb_sequence_item item);

compare(item);

count++;

endfunction


function void report_phase(uvm_phase phase);

 result = no_success/count;

`uvm_info("COVERAGE","\n \n ---------------------- SCOREBOARD REPORT ----------------------\n\n",UVM_HIGH);
`uvm_info("COVERAGE",$sformatf("   TOTAL TEST CASES     : %d",count),UVM_HIGH);
`uvm_info("COVERAGE",$sformatf("   SUCCESS TEST CASES   : %d",no_success),UVM_HIGH);
`uvm_info("COVERAGE",$sformatf("   UNSUCCESS TEST CASES : %d",no_unsuccess),UVM_HIGH);
`uvm_info("COVERAGE",$sformatf("   SUCCESS RATE         : %f",result*100),UVM_HIGH);
`uvm_info("COVERAGE","\n \n ---------------------------------------------------------------\n\n",UVM_HIGH);


endfunction


task compare(apb_sequence_item item);

if(item.apb_write_data==item.apb_read_data_out)
begin

`uvm_info("COMPARE","READ WRITE SUCESS",UVM_HIGH);
 no_success++;
end


else
begin
`uvm_info("COMPARE","READ WRITE UNSUCESS",UVM_HIGH);
 no_unsuccess++;
end

endtask

endclass 
