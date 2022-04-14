`include "imm_gen.v"

module testbench;
//reg clk;
//reg reset;

reg [31:0] inst_in;
wire [63:0] inst_out;

imm_gen imm_gen_inst(inst_in, inst_out);

initial $monitor($time, " inst_out = %b", inst_out);
initial $vcdpluson;

initial begin
    inst_in = 32'b000001100100_00010_000_00001_0010011; //addi x1, x2, 2148
    #10 inst_in = 32'b0011111_00001_00010_010_01000_0100011; //sw x1, 1000(x2)
    #10 inst_in = 32'b000010010110_00010_010_00001_0000011; //lw x1, 150(x2)
    #10 inst_in = 32'b0_000000_00010_00001_000_0101_0_1100011; //beq x1, x2, 10
    #10 inst_in = 32'b1011111_00001_00010_010_01000_0100011; //sw x1, 3048(x2)
    #10 inst_in = 32'b100010010110_00010_010_00001_0000011; //lw x1, 2198(x2)
    #10 inst_in = 32'b1_000000_00010_00001_000_0101_0_1100011; //beq x1, x2, 2053
    #10 $finish;
end

endmodule