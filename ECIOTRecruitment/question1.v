module mystery (
    input clk, a, b,
    output reg y2, y3,
    output wire y1
    );

    reg tmp;
    initial tmp = 0;

    // Block A
    assign y1 = a & b;

    // Block B
    always @(*) begin
    
    if (a) y2 = ~b;
    
    else y2 = b;
    end
    // Block C
    always @(posedge clk) begin
    tmp <= a ^ b;
    y3 <= tmp;
    end
endmodule