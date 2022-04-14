module main_control(Opcode, Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);
input wire [6:0] Opcode;
output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
output reg [1:0] ALUOp;

always @(*) begin
    assign ALUOp = 2'b00;
    // branch check
    if (Opcode == 7'b1100011)
        assign Branch = 1;
    else
        assign Branch = 0;
    // memory read check
    if (Opcode == 7'b0000011) 
        assign MemRead = 1;
    else 
        assign MemRead = 0;
    // memory to register check
    if (Opcode == 7'b0000011)
        assign MemtoReg = 1;
    else
        assign MemtoReg = 0;
    // memory write check
    if (Opcode == 7'b0100011) 
        assign MemWrite = 1;
    else 
        assign MemWrite = 0;
    // alu source check
    if (Opcode == 7'b0000011 || Opcode == 7'b0100011 || Opcode == 7'b0010011)
        assign ALUSrc = 1;
    else 
        assign ALUSrc = 0;
    // register write check
    if (Opcode == 7'b0110011 || Opcode == 7'b0000011 || Opcode == 7'b0010011)
        assign RegWrite = 1;
    else 
        assign RegWrite = 0;
    // aluop check
    if (Opcode == 7'b1100011)
        assign ALUOp = 2'b01; //01
    //else
      //  assign ALUOp = 2'b00; //00
    if (Opcode == 7'b0110011) 
        assign ALUOp = 2'b10; //10
    //else 
      //  assign ALUOp = 2'b00; //00
end

endmodule