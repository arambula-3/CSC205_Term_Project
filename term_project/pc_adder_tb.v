`include "pc_adder.v"

module testbench;
//reg clk;
//reg reset;

reg [31:0] pc_in;
wire [31:0] sum;

pc_adder pc_adder_inst(sum, pc_in);

initial $monitor($time, " sum = %h", sum);
initial $vcdpluson;

initial begin
    pc_in = 32'b0000_0000_0000_0000_0000_0000_0000_0000;
    #10 $finish;
end

endmodule