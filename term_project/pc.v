module pc (pc_in, pc_out, rst, clk);
input rst, clk;
input wire [31:0] pc_in;
output reg [31:0] pc_out;

always @(posedge clk) begin
    if (rst) pc_out = 32'd0;
    else pc_out = pc_in;
end

endmodule