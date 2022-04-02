`include "alu_control.v"

module testbench;
//reg clk;
//reg reset;

reg [1:0] ALUOp;
reg [0] funct7;
reg [2:0] funct3;
wire [3:0] operation;

alu_control alu_control_inst(ALUOp, funct7, funct3, operation);

initial $monitor($time, " operation = %b", operation);
initial $vcdpluson;

initial begin 
    ALUOp = 2'b00; // 4'b0010
    funct7 = 1'b0;
    funct3 = 3'b000;
    #5 ALUOp = 2'b01; // 4'b0110
    #5 ALUOp = 2'b10;
    #5 funct7 = 1'b1; // 4'b0110
    #5 ALUOp = 2'b10;
    #5 funct7 = 1'b0;
    #5 funct3 = 3'b000; // 4'b0010
    #5 ALUOp = 2'b10;
    #5 funct7 = 1'b0;
    #5 funct3 = 3'b111; // 4'b0000
    #5 ALUOp = 2'b10;
    #5 funct7 = 1'b0;
    #5 funct3 = 3'b110; // 4'b0001
    #5 $finish;
end

endmodule