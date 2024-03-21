`include "uvm_macros.svh"

import trans::*;
import uvm_pkg::*;

class apb_driver extends uvm_driver#(apb_sequence_item);

`uvm_component_utils(apb_driver);

virtual itf vif;

apb_config cfg;

function new(string name="driver",uvm_component parent);


super.new(name,parent);


endfunction

function void build_phase(uvm_phase phase);

super.build_phase(phase);

endfunction

function void connect_phase(uvm_phase phase);

super.connect_phase(phase);

endfunction 


task run_phase(uvm_phase phase);

super.run_phase(phase);

reset();

forever
begin

write_opr();
end

endtask



task write_opr;

apb_sequence_item trans;

seq_item_port.get_next_item(trans);

vif.READ_WRITE=0;
vif.transfer=1;
vif.apb_write_paddr=trans.apb_write_paddr;
vif.apb_write_data=trans.apb_write_data;
@(posedge vif.PREADY);
vif.transfer=0;


vif.READ_WRITE=1;
vif.transfer=1;
vif.apb_read_paddr=trans.apb_read_paddr;
@(posedge vif.PREADY);
vif.transfer=0;

seq_item_port.item_done();

endtask


task reset;

vif.PRESETn<=1'b1;
repeat(5)
@(posedge vif.PCLK);
vif.PRESETn<=1'd0;
endtask


endclass  
