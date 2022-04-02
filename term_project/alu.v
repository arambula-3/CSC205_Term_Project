module alu(data1, data2, control, zero, result);
input wire [63:0] data1, data2;
input wire [3:0] control;
output reg zero;
output reg [63:0] result;

always @(*) begin
    // ADD
    if (control == 4'b0010)
        assign result = data1 + data2;
    // SUB
    if (control == 4'b0110)
        assign result = data1 - data2;
    // AND
    if (control == 4'b0000)
        assign result = data1 & data2;
    // OR
    if (control == 4'b0001)
        assign result = data1 | data2;
    // ZERO
    if (result == 0)
        assign zero = 1'b1;
    else
        assign zero = 1'b0;
end

endmodule