// 2 to 1 multiplexer, Gate level
module mux2to1 (in, sel, out);

    input [1:0] in;
    input sel;
    output out;

    wire t1, t2, t3;

    and G0 (t1, in[1], sel);
    not G1 (t3, sel);
    and G2 (t2, in[0], t3);
    or  G3 (out, t1, t2);

endmodule