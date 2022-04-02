`include "pc.v"

module testbench;
reg clk;
reg reset;
reg [31:0] pc_in;
wire [31:0] pc_out;

pc pc_inst(pc_in, pc_out, reset, clk);

initial clk = 1'b0;
always #5 clk = ~clk;
initial $monitor($time, " pc_out = %d", pc_out);
initial $vcdpluson;

initial begin
    reset = 1; // pc_out = 0
    assign pc_in = 32'd3;
    #10 reset = 0; // pc_out = 3
    #5 $finish;
end

endmodule