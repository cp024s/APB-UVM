
`include "uvm_macros.svh"
`include"apb_test.sv"
`include"apb_s1_s2_test.sv"

import uvm_pkg::*;


module APB_TOP_TB;

bit PCLK;

itf vif(PCLK);

apb_top DUT(.PCLK(PCLK),
            .PRESETn(vif.PRESETn),
            .READ_WRITE(vif.READ_WRITE),
            .transfer(vif.transfer),
            .apb_write_data(vif.apb_write_data),
            .apb_write_paddr(vif.apb_write_paddr),
            .apb_read_paddr(vif.apb_read_paddr),
            .apb_read_data_out(vif.apb_read_data_out),
            .PSLVRR(vif.PSLVRR),
            .PREADY(vif.PREADY));

initial 
begin

uvm_config_db#(virtual itf)::set(uvm_root::get(),"*","VIF",vif);

run_test("apb_s1_s2_test");

end

always #5 PCLK=~PCLK;

endmodule
