module sl_one(inst_in, inst_out);
input wire [63:0] inst_in;
output wire [63:0] inst_out;

assign inst_out = inst_in << 1;

endmodule