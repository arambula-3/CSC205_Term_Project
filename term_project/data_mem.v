module data_mem(clk, address, wrt_data, mem_write, mem_read, read_data);
input clk, mem_write, mem_read;
input wire [63:0] address, wrt_data;
output reg [63:0] read_data;

reg [63:0] mem [9:0];

always @(*) begin
    if (mem_read)
        assign read_data = mem[address];
    @(posedge clk ) begin
        if (mem_write)
            begin
                mem[address] = wrt_data;
                $display("write addy = %h, write data = %h", address, wrt_data);
            end

        $display("x5 = %h, x6 = %h, x7 = %h, read data = %h", mem[5], mem[6], mem[7], read_data);
    end
end

endmodule