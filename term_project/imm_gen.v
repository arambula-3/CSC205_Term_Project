module imm_gen(inst_in, inst_out);
input wire [31:0] inst_in;
output reg [63:0] inst_out;

always @(*) begin
    if (inst_in[6:0] == 7'b0000011 || inst_in[6:0] == 7'b0010011) /* load inst and addi inst imm gen */
        assign inst_out = {inst_in[31] ? {52{1'b1}} : {52{1'b0}}, inst_in[31:20]};
    if (inst_in[6:0] == 7'b0100011) /* store inst imm gen */
        assign inst_out = {inst_in[31] ? {52{1'b1}} : {52{1'b0}}, inst_in[31:25], inst_in[11:7]};
    if (inst_in[6:0] == 7'b1100011) /* branch inst imm gen */
        assign inst_out = {inst_in[31] ? {51{1'b1}} : {51{1'b0}}, inst_in[31], inst_in[7], inst_in[30:25], inst_in[11:8], 1'b0}; //13
end

endmodule