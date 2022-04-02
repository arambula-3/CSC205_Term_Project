module pc_adder (sum, pc_in);
output wire [31:0] sum;
input wire [31:0] pc_in;

assign sum = pc_in + 4;

endmodule