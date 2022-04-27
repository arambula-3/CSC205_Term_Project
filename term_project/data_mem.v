module data_mem(clk, address, wrt_data, mem_write, mem_read, read_data);
input clk, mem_write, mem_read;
input wire [63:0] address, wrt_data;
output reg [63:0] read_data;

reg [63:0] mem [65535:0]; // 4 bytes in DWORD, each address identifies an 8-bit byte; 4^8=65536

always @(*) begin
    if (mem_read)
        assign read_data = mem[address];  
end

always @(posedge clk) begin
    if (mem_write)
        mem[address] = wrt_data;
end

endmodule