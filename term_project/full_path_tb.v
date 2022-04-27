`include "full_path.v"

module testbench;
reg clk;
reg rst;

wire [63:0] x5, x6, x7;

full_path full_path_inst(clk, rst, x5, x6, x7);

initial $monitor($time, " x5 = %d, x6 = %d, x7 = %d", x5, x6, x7);
initial $vcdpluson;

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
    rst = 1'b0;
    #95 $finish;
end

endmodule;
