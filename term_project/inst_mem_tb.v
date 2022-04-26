`include "inst_mem.v"

module testbench;
//reg clk;
//reg reset;

reg [31:0] addr;
wire [31:0] inst;

inst_mem inst_mem_inst(addr, inst);

initial $monitor($time, " inst = %h", inst);
initial $vcdpluson;

initial begin
    addr = 32'd4; // 32'h00100293 = addi x5, x0, 1
    #5 addr = addr + 4; // 32'h00300313 = addi x6, x0, 3
    #5 addr = addr + 4; // 32'h0062B223 = sd x6, 4(x5)
    #5 addr = addr + 4; // 32'h0062E3B3 = or x7, x5, x6
    #5 addr = addr + 4; // 32'h0053B123 = sd x5, 2(x7)
    #5 addr = addr + 4; // 32'h0042B303 = ld x6, 4(x5)
    #5 addr = addr + 4; // 32'h00628263 = beq x5, x6, 4
    #5 addr = addr + 4; // 32'h006282B3 = add x5, x5, x6
    #5 addr = addr + 4; // 32'h405383B3 = sub x7, x7, x5
    #5 $finish;
end

endmodule