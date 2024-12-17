module dff (
    input clk,
    input reset,
    input d,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module counter (
    input clk,
    input reset,
    output reg [2:0] count
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 3'b000;
        else
            count <= count + 1;
    end
endmodule

module mux8to1 (
    input [7:0] d,   
    input [2:0] sel, 
    output y         
);
    assign y = d[sel];
endmodule

module top (
    input clk,
    input reset,
    input [7:0] sn1, 
    output y         
);
    wire [7:0] q;        
    wire [2:0] sel;      

    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin
            dff dff_inst (
                .clk(clk),
                .reset(reset),
                .d(sn1[i]),
                .q(q[i])
            );
        end
    endgenerate

    counter counter_inst (
        .clk(clk),
        .reset(reset),
        .count(sel)
    );

    mux8to1 mux_inst (
        .d(q),
        .sel(sel),
        .y(y)
    );
endmodule