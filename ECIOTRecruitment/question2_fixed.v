module mux2to1 (a, b, sel, out);

    input a;
    input b;
    input sel;
    output out;
    wire [1:0] in;

    assign in = {a,b};

    assign out = in[sel];

endmodule




`timescale 1ns/1ps 
module tb_mux(); 

    reg a, b, sel; 
    wire out;

    mux2to1 dut (.a(a), .b(b), .sel(sel), .out(out));

    initial begin 
        a=1; b=0; sel=0;
        #20;
        a=1; b=0; sel=1;
        #20;
        a=1; b=1; sel=0;
        #20; $finish;
    end

    initial begin
        $monitor("%t a=%b b=%b sel=%b out=%b",$time, a, b, sel, out);
    end
endmodule

/*
question2_fixed.v:24: error: a is not a valid l-value in tb_mux.
question2_fixed.v:18:      : a is declared here as wire.
question2_fixed.v:24: error: b is not a valid l-value in tb_mux.
question2_fixed.v:18:      : b is declared here as wire.
question2_fixed.v:24: error: sel is not a valid l-value in tb_mux.
question2_fixed.v:18:      : sel is declared here as wire.
question2_fixed.v:26: error: a is not a valid l-value in tb_mux.
question2_fixed.v:18:      : a is declared here as wire.
question2_fixed.v:26: error: b is not a valid l-value in tb_mux.
question2_fixed.v:18:      : b is declared here as wire.
question2_fixed.v:26: error: sel is not a valid l-value in tb_mux.
question2_fixed.v:18:      : sel is declared here as wire.
question2_fixed.v:28: error: a is not a valid l-value in tb_mux.
question2_fixed.v:18:      : a is declared here as wire.
question2_fixed.v:28: error: b is not a valid l-value in tb_mux.
question2_fixed.v:18:      : b is declared here as wire.
question2_fixed.v:28: error: sel is not a valid l-value in tb_mux.
question2_fixed.v:18:      : sel is declared here as wire.
9 error(s) during elaboration.

*/