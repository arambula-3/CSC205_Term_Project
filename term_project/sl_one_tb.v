`include "sl_one.v"

module testbench;
//reg clk;
//reg reset;

reg [63:0] inst_in;
wire [63:0] inst_out;

sl_one sl_one_inst(inst_in, inst_out);

initial $monitor($time, " inst_out = %h", inst_out);
initial $vcdpluson;

initial begin
    inst_in = 64'd2;
    #10 $finish; //4
end

endmodule