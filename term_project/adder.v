module adder(i0, i1, sum);
input wire [31:0] i0;
input wire [63:0] i1;
output wire [63:0] sum;

assign {sum} = i0 + i1;

endmodule