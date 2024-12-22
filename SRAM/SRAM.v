module SRAM #(parameter ADDR=8, parameter WIDTH=32, parameter LENGTH=256)(
    input clk,
    input res,
    input WE,
    input [ADDR-1:0] addr,
    input [WIDTH-1:0] data_in,
    output reg [WIDTH-1:0] data_out
);

reg [WIDTH-1:0] mem[0:LENGTH-1];
integer i;  

always @(posedge clk) begin
    if (WE) begin
        mem[addr] <= data_in;
    end 
    else begin
        data_out <= mem[addr];
    end
end

endmodule
