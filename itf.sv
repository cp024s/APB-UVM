interface itf(input bit PCLK);

logic PRESETn,READ_WRITE,transfer;

logic [7:0] apb_write_data;

logic [8:0] apb_write_paddr,apb_read_paddr;

logic [7:0] apb_read_data_out;

logic PSLVRR,PREADY;


clocking DRIVE@(posedge PCLK);

input  PCLK,PRESETn,transfer,READ_WRITE;
input  apb_write_paddr,apb_write_data,apb_read_paddr;
output PSLVRR,PREADY;
output apb_read_data_out;

endclocking 

modport DRIVER(clocking DRIVE);

endinterface 
