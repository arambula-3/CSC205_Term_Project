`timescale 1ps/1ps
`include "two_to_one_mux.v"
`include "pc_adder.v"
`include "pc.v"
`include "adder.v"
`include "imm_gen.v"
`include "inst_mem.v"
`include "sl_one.v"
`include "alu_control.v"
`include "alu.v"
`include "data_mem.v"
`include "main_control.v"
`include "reg_file.v"
`include "branch_mux.v"

module full_path(clk, rst, x5, x6, x7, pc_in);
input clk, rst;
output reg [63:0] x5, x6, x7;

//pc instantiation
output reg [31:0] pc_in;
wire [31:0] pc_out;
reg [31:0] pc_next;
//pc adder instantiation
wire [31:0] pc_adder_sum;
//instruction memory instantiation
wire [31:0] inst;
//main control instantiation
wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
wire [1:0] ALUOp;
//registers instantiation
wire [63:0] reg_read_data_1, reg_read_data_2;
//immediate extension instantiation
wire [63:0] inst_out;
//shift left one instantiation
wire [63:0] sl_inst_out;
//branch adder instantiation
wire [63:0] branch_adder_sum;
//alu control instantiation
wire [3:0] operation;
//alu mux instantiation
wire [63:0] alu_mux_out;
//alu instantiation
wire zero;
wire [63:0] alu_result;
//branch mux instantiation
wire branch_and = (Branch && zero);
wire [63:0] branch_mux_out;
//data memory instantiation
wire [63:0] read_data;
//data memory mux instantiation
wire [63:0] data_mem_mux_out;

//pc startup
initial begin
    assign pc_in = 32'h0;
    assign x5 = 64'b0;
    assign x6 = 64'b0;
    assign x7 = 64'b0;
end

//always @(posedge clk) begin
  //  pc_in = pc_next;
//end

pc pc_inst(pc_in, pc_out, rst, clk);

//pc adder
pc_adder pc_adder_inst(pc_adder_sum, pc_in);

//instruction memory
inst_mem inst_mem_inst(pc_out, inst);

//main control
main_control main_control_inst(inst[6:0], Branch, MemRead, MemtoReg, ALUOp, MemWrite, ALUSrc, RegWrite);

//registers
reg_file reg_file_inst(clk, RegWrite, inst[11:7], inst[19:15], inst[24:20], data_mem_mux_out, reg_read_data_1, reg_read_data_2);

//immediate extension
imm_gen imm_gen_inst(inst, inst_out);

//shift left one
sl_one sl_one_inst(inst_out, sl_inst_out);

//branch adder
adder adder_inst(pc_out, sl_inst_out, branch_adder_sum);

//alu control
alu_control alu_control_inst(ALUOp, inst[30], inst[14:12], operation);

//alu mux
two_to_one_mux two_to_one_mux_alu_inst(alu_mux_out, inst_out, reg_read_data_2, ALUSrc);

//alu
alu alu_inst(reg_read_data_1, alu_mux_out, operation, zero, alu_result);

//branch mux
branch_mux branch_mux_inst(branch_mux_out, pc_adder_sum, branch_adder_sum, branch_and);

always @(posedge clk) begin
    assign pc_in = branch_mux_out[31:0];
end

//data memory
data_mem data_mem_inst(clk, alu_result, reg_read_data_2, MemWrite, MemRead, read_data);

//data memory mux
two_to_one_mux two_to_one_mux_data_mem_inst(data_mem_mux_out, read_data, alu_result, MemtoReg);

//follow change in registers
always @(*) begin
    if (inst[11:7] == 5'd5 && RegWrite)
        assign x5 = data_mem_mux_out;
    if (inst[19:15] == 5'd5 && MemWrite)
        assign x5 = reg_read_data_2;
    if (inst[11:7] == 5'd6 && RegWrite)
        assign x6 = data_mem_mux_out;
    if (inst[19:15] == 5'd6 && MemWrite)
        assign x6 = reg_read_data_2;
    if (inst[11:7] == 5'd7 && RegWrite)
        assign x7 = data_mem_mux_out;
    if (inst[19:15] == 5'd7 && MemWrite)
        assign x7 = reg_read_data_2;
end

endmodule