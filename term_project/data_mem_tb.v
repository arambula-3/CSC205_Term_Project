`include "data_mem.v"

module testbench;
reg clk;
//reg reset;

reg mem_write, mem_read;
reg [63:0] address, wrt_data;
wire [63:0] read_data;

data_mem data_mem_inst(clk, address, wrt_data, mem_write, mem_read, read_data);

initial $monitor($time, " read data = %b", read_data);
initial $vcdpluson;

initial begin
    clk = 1'b0;
    mem_write = 1'b0;
    mem_read = 1'b1;
    address = 64'd0;
    wrt_data = 64'd916;
    #5 clk = 1'b1;
    #5 clk = 1'b0;
    #5 address = 64'd8;
    #5 clk = 1'b1;
    #10 $finish;
end

endmodule