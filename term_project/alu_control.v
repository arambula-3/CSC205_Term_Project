module alu_control(ALUOp, funct7, funct3, operation);
input wire [1:0] ALUOp;
input wire funct7;
input wire [2:0] funct3;
output reg [3:0] operation;

always @(*) begin
    if (ALUOp == 2'b00)
        assign operation = 4'b0010; // ADD
    if (ALUOp == 2'b01)
        assign operation = 4'b0110; // SUB
    if (ALUOp[1] == 1'b1 && funct7 == 1'b1) 
        assign operation = 4'b0110; // SUB
    if (ALUOp[1] == 1'b1 && funct7 == 1'b0 && funct3 == 3'b000)
        assign operation = 4'b0010; // ADD
    if (ALUOp[1] == 1'b1 && funct7 == 1'b0 && funct3 == 3'b111)
        assign operation = 4'b0000; // AND
    if (ALUOp[1] == 1'b1 && funct7 == 1'b0 && funct3 == 3'b110)
        assign operation = 4'b0001; // OR
end

endmodule