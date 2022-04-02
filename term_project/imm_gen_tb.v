`include "imm_gen.v"

module testbench;
//reg clk;
//reg reset;

reg [31:0] inst_in;
wire [63:0] inst_out;

imm_gen imm_gen_inst(inst_in, inst_out);

initial $monitor($time, " inst_out = %h", inst_out);
initial $vcdpluson;

initial begin
    inst_in = 32'd2;
    #10 $finish; //2
end

endmodule