`include "alu.v"

module testbench;
//reg clk;
//reg reset;

reg [63:0] data1, data2;
reg [3:0] control;
wire zero;
wire [63:0] result;

alu alu_inst(data1, data2, control, zero, result);

initial $monitor($time, " zero = %b, result = %d", zero, result);
initial $vcdpluson;

initial begin
    data1 = 64'd3;
    data2 = 64'd2;
    control = 4'b0010; // result = 5, zero = 0
    #5 control = 4'b0110; // result = 1, zero = 0
    #5 control = 4'b0000; // result = 2, zero = 0
    #5 control = 4'b0001; // result = 3, zero = 0
    #5 data2 = 64'd3;
    #5 control = 4'b0110; // result = 0, zero = 1
    #5 $finish;
end

endmodule