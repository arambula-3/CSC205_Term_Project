module reg_file(clk, reg_write, reg_write_dest, reg_read_addr_1, reg_read_addr_2, reg_write_data, reg_read_data_1, reg_read_data_2);
input clk, reg_write; 
input wire [4:0] reg_write_dest, reg_read_addr_1, reg_read_addr_2;
input wire [63:0] reg_write_data;
output wire [63:0] reg_read_data_1, reg_read_data_2;

reg [63:0] reg_array [31:0];
integer i;

initial begin
  for (i = 0; i < 31; i = i + 1)
    reg_array[i] = 64'h0;
end

always @ (posedge clk) begin
  if (reg_write)
    reg_array[reg_write_dest] = reg_write_data;
end

assign reg_read_data_1 = reg_array[reg_read_addr_1];
assign reg_read_data_2 = reg_array[reg_read_addr_2];

endmodule
