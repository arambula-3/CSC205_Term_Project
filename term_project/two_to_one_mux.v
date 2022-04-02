module two_to_one_mux (out, i0, i1, s);
output wire [63:0] out;
input wire [63:0] i0, i1;
input wire s;   

assign out = s ? i0 : i1;

endmodule
