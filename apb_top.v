module apb_top(PCLK,PRESETn,READ_WRITE,transfer,apb_write_data,apb_write_paddr,apb_read_paddr,apb_read_data_out,PSLVRR,PREADY);
// defaults  READ-> READ_WRITE=1 , WRITE -> READ_WRITE=0;

input PCLK,PRESETn,READ_WRITE,transfer;

input [7:0] apb_write_data;

input [8:0] apb_write_paddr,apb_read_paddr;

output [7:0] apb_read_data_out;

output PSLVRR,PREADY;


wire [7:0] paddr,prdata1,prdata2,pwdata,prdata;

wire PREADY1,PREADY2,PWRITE,PENABLE,psel1,psel2;

 
// assignment :

assign PREADY = psel1?PREADY1:PREADY2;
assign prdata = psel1?prdata1:prdata2;
 
APB_MASTER master(.PCLK(PCLK),
                  .PRESETn(PRESETn),
						.transfer(transfer),
						.READ_WRITE(READ_WRITE),
						.apb_write_paddr(apb_write_paddr),
						.apb_write_data(apb_write_data),
						.apb_read_paddr(apb_read_paddr),
						.apb_read_data_out(apb_read_data_out),
						.paddr(paddr),
						.pwdata(pwdata),
						.prdata(prdata),
						.PENABLE(PENABLE),
						.PWRITE(PWRITE),
						.PREADY(PREADY),
						.psel1(psel1),
						.psel2(psel2),
						.PSLVRR(PSLVRR));

APB_SLAVE slave_1(.PCLK(PCLK),
                  .PRESETn(PRESETn),
						.PSEL(psel1),
						.PENABLE(PENABLE),
						.READ_WRITE(PWRITE),
						.paddr(paddr),
						.apb_write_data(pwdata),
						.prdata(prdata1),
						.PREADY(PREADY1));

APB_SLAVE slave_2(.PCLK(PCLK),
                  .PRESETn(PRESETn),
						.PSEL(psel2),
						.PENABLE(PENABLE),
						.READ_WRITE(PWRITE),
						.paddr(paddr),
						.apb_write_data(pwdata),
						.prdata(prdata2),
						.PREADY(PREADY2));
						

endmodule 

