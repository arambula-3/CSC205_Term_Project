`include "adder.v"

module testbench;
//reg clk;
//reg reset;

reg [31:0] i0;
reg [63:0] i1;
wire [63:0] sum;

adder adder_inst(i0, i1, sum);

initial $monitor($time, " sum = %h", sum);
initial $vcdpluson;

initial begin
    i0 = 32'd1;
    i1 = 64'd2;
    #10 $finish; //3
end

endmodule