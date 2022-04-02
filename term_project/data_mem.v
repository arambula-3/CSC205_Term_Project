module data_mem(clk, address, wrt_data, mem_write, mem_read, read_data)
input clk, mem_write, mem_read;
input wire [63:0] address, wrt_data;
output reg [63:0] read_data;

wire [31:0] mem [8:0];

always @(*) begin
    if (mem_read)
        assign read_data = mem[address];
    always @(posedge clk ) begin
        if (mem_write)
            assign mem[address] = wrt_data;
    end
end

endmodule