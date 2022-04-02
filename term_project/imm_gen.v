module imm_gen(inst_in, inst_out);
input wire [31:0] inst_in;
output wire [63:0] inst_out;

assign inst_out[31:0] = inst_in;
assign inst_out[63:32] = inst_in[31];

endmodule