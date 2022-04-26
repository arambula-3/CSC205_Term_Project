`include "full_path.v"

module testbench;
reg clk;
reg rst;

wire [63:0] x5, x6, x7;
wire [31:0] pc;

full_path full_path_inst(clk, rst, x5, x6, x7, pc);

initial $monitor($time, " x5 = %d, x6 = %d, x7 = %d, pc = %h", x5, x6, x7, pc);
initial $vcdpluson;

initial clk = 1'b0;
always #5 clk = ~clk;

initial begin
    rst = 1'b0;
    //#5 rst = 1'b0;
    #100 $finish;
end

endmodule;
