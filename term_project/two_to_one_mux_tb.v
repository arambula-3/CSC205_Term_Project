`include "two_to_one_mux.v"

module testbench;
//reg clk;
//reg reset;

reg [63:0] i0, i1;
reg s;
wire [63:0] out;

two_to_one_mux two_to_one_mux_inst(out, i0, i1, s);

initial $monitor($time, " out = %h", out);
initial $vcdpluson;

initial begin
    i0 = 64'h530;
    i1 = 64'h916;
    s = 1'd1; // 530
    #10 s = 1'd0; // 916
    #5 $finish;
end

endmodule
