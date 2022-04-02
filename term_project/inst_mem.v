module inst_mem(addr, inst);
input [31:0] addr;
output wire [31:0] inst;

wire [31:0] mem [8:0];

assign mem[0] = 32'h00100293; // addi x5, x0, 1
assign mem[1] = 32'h00300313; // addi x6, x0, 3
assign mem[2] = 32'h0062B223; // sd x6, 4(x5)
assign mem[3] = 32'h0062E3B3; // or x7, x5, x6
assign mem[4] = 32'h0053B123; // sd x5, 2(x7)
assign mem[5] = 32'h0042B303; // ld x6, 4(x5)
assign mem[6] = 32'h00628263; // beq x5, x6, 4
assign mem[7] = 32'h006282B3; // add x5, x5, x6
assign mem[8] = 32'h405383B3; // sub x7, x7, x5

assign inst = mem[addr[8:2]];

endmodule