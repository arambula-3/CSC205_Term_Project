`include "reg_file.v"

module testbench;
reg clk;
//reg reset;

reg reg_write; 
reg [4:0] reg_write_dest, reg_read_addr_1, reg_read_addr_2;
reg [63:0] reg_write_data;
wire [63:0] reg_read_data_1, reg_read_data_2;

reg_file reg_file_inst(clk, reg_write, reg_write_dest, reg_read_addr_1, reg_read_addr_2, reg_write_data, reg_read_data_1, reg_read_data_2);

initial $monitor($time, " reg_read_data_1 = %h, reg_read_data_2 = %h", reg_read_data_1, reg_read_data_2);
initial $vcdpluson;

initial begin
    clk = 1'b0;
    reg_write = 1'b1;
    reg_write_dest = 5'd7;
    reg_read_addr_1 = 5'd6;
    reg_read_addr_2 = 5'd5;
    reg_write_data = 64'd916;
    #5 clk = 1'b1;
    #10 $finish;
end

endmodule