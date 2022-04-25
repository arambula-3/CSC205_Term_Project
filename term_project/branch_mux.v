module branch_mux (out, i0, i1, s);
output wire [63:0] out;
input wire [31:0] i0;
input wire [63:0] i1;
input wire s;   

assign out = s ? i1 : i0;

endmodule
