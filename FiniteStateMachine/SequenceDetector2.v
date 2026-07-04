//Sequence detector for sequence 101010
module seq_detector(x, clk, reset, z);
    input x, clk, reset;
    output reg z;
    parameter S0=0, S1=1, S2=2, S3=3, S4=4, S5=5;
    reg [0:2] PS, NS;

    always @ (posedge clk or posedge reset)
        if (reset)  PS <= S0;
        else        PS <= NS;

    always @(PS, x)
        case (PS)
            S0: begin
                z = x ? 0 : 0;
                NS = x ? S1 : S0;
            end
            S1: begin
                z = x ? 0 : 0;
                NS = x ? S1 : S2;
            end
            S2: begin
                z = x ? 0 : 0;
                NS = x ? S3 : S0;
            end
            S3: begin
                z = x ? 0 : 0;
                NS = x ? S1 : S4;
            end
            S4: begin
                z = x ? 0 : 0;
                NS = x ? S5 : S0;
            end
            S5: begin
                z = x ? 0 : 1;
                NS = x ? S1 : S4;
            end
        endcase

endmodule