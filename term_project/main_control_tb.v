`include "main_control.v"

module testbench;
//reg clk;
//reg reset;

reg [6:0] Opcode;
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;

main_control main_control_inst(Opcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

initial $monitor($time, " Branch = %b, MemRead = %b, MemtoReg = %b, ALUOp = %b, MemWrite = %b, ALUSrc = %b, RegWrite = %b", Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
initial $vcdpluson;

initial begin
    Opcode = 7'b1100011; // Branch = 1, MemRead = 0, MemtoReg = 0, ALUOp = 01, MemWrite = 0, ALUSrc = 0, RegWrite = 0
    #10 Opcode = 7'b0000011; // Branch = 0, MemRead = 1, MemtoReg = 1, ALUOp = 00, MemWrite = 0, ALUSrc = 1, RegWrite = 1
    #10 Opcode = 7'b0100011; // Branch = 0, MemRead = 0, MemtoReg = 0, ALUOp = 00, MemWrite = 1, ALUSrc = 1, RegWrite = 0
    #10 Opcode = 7'b1100111; // Branch = 0, MemRead = 0, MemtoReg = 0, ALUOp = 00, MemWrite = 1, ALUSrc = 0, RegWrite = 1
    #10 Opcode = 7'b0010011; // Branch = 0, MemRead = 0, MemtoReg = 0, ALUOp = 00, MemWrite = 0, ALUSrc = 1, RegWrite = 1
    #10 Opcode = 7'b0110011; // Branch = 0, MemRead = 0, MemtoReg = 0, ALUOp = 10, MemWrite = 0, ALUSrc = 0, RegWrite = 1
    #10 Opcode = 7'b1101111; // Branch = 0, MemRead = 0, MemtoReg = 0, ALUOp = 00, MemWrite = 0, ALUSrc = 0, RegWrite = 1
    #10 $finish;
end

endmodule