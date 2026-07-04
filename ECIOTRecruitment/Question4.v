module math_mod(A, B, C, Ya, Yb, Yc, Yd, Ye);

    input [3:0] A, B;
    input [2:0] C;
    output wire [3:0] Ya, Yd, Ye;
    output wire Yb;
    output wire [6:0] Yc;

    assign Ya = A & B;
    assign Yb = & A;
    assign Yc = {A, C};
    assign Yd = A >> 2;
    assign Ye = A ? B : C;

endmodule

`timescale 1ns/1ps
module testbench;

    reg [3:0] A, B;
    reg [2:0] C;
    wire [3:0] Ya, Yd, Ye;
    wire Yb;
    wire [6:0] Yc;

    math_mod DUT(A, B, C, Ya, Yb, Yc, Yd, Ye);

    initial begin
        $monitor("t=%0t A=%b B=%b C=%b | Ya=%b Yb=%b Yc=%b Yd=%b Ye=%b",
                  $time, A, B, C, Ya, Yb, Yc, Yd, Ye);
        $dumpfile("Question4_test.vcd");
        $dumpvars(0, testbench);

        A = 4'b0000;
        B = 4'b0000;
        C = 3'b000;

        #10
        A = 4'b1100;
        B = 4'b1010;
        C = 3'b101;
        #10 $finish;

    end

endmodule