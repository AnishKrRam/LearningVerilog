`timescale 1ns/1ps

module mystery_test;

    reg clk, a, b;
    wire y1, y2, y3;

    mystery DUT(clk, a, b, y1, y2, y3);

    initial begin
        $dumpfile ("question1_test.vcd");
        $dumpvars (0, mystery_test);
        clk = 1'b0;

    end

    always #10 clk = ~clk;

    initial begin
        a = 0; b = 0;
        #10 a = 1;
        #10 b = 1;
        #20 a = 0;
        #20 $finish;
    end

endmodule