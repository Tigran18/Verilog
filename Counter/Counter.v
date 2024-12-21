module counter (
    input clk,          
    input reset,        
    output reg [3:0] q  
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 4'b0000;   
        else
            q <= q + 1;     
    end
endmodule
