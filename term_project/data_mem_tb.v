`include "data_mem.v"

module testbench;
reg clk;
//reg reset;

reg mem_write, mem_read;
reg [63:0] address, wrt_data;
wire [63:0] read_data;

data_mem data_mem_inst(clk, address, wrt_data, mem_write, mem_read, read_data);

initial $monitor($time, " read data = %d", read_data);
initial $vcdpluson;

initial begin
    clk = 1'b0;
    mem_write = 1'b1;
    mem_read = 1'b0;
    address = 64'd4;
    wrt_data = 64'd3;
    #5 clk = 1'b1;
    #5 mem_read = 1'b1; //read_data = 3
    #5 mem_write = 1'b0;
    #10 $finish;
end

endmodule