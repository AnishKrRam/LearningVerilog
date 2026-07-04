// Y = A.B + B.C + A.C

// 1) BEHAVIORAL LEVEL
module maj3_behavioral(
    input  A, B, C,
    output reg Y
);

    always @(*) begin

        case ({A, B, C})
            3'b000: Y = 1'b0;
            3'b001: Y = 1'b0;
            3'b010: Y = 1'b0;
            3'b011: Y = 1'b1;
            3'b100: Y = 1'b0;
            3'b101: Y = 1'b1;
            3'b110: Y = 1'b1;
            3'b111: Y = 1'b1;
            default: Y = 1'bx;
        endcase

    end

endmodule

// 2) DATAFLOW LEVEL
module maj3_dataflow(
    input  A, B, C,
    output Y
);

    assign Y = (A & B) | (B & C) | (A & C);

endmodule

// 3) GATE LEVEL
module maj3_gate(
    input  A, B, C,
    output Y
);

    wire w1, w2, w3;

    and and1 (w1, A, B);
    and and2 (w2, B, C);
    and and3 (w3, A, C);
    or  or1  (Y, w1, w2, w3);

endmodule

// 4) SWITCH LEVEL (built from nmos/pmos primitives)
module maj3_switch(
    input  A, B, C,
    output Y
);

    supply1 vdd;
    supply0 gnd;
    wire [0:2] PUN;
    wire [0:2] PDN;
    
    pmos p1a(PUN[0], vdd, A);
    pmos p1b(PUN[0], vdd, B);

    pmos p2a(PUN[1], PUN[0], B);
    pmos p3a(PUN[1], PUN[0], C);

    pmos p2b(PUN[2], PUN[1], C);
    pmos p3b(PUN[2], PUN[1], A);

    nmos n1a(PUN[2], PDN[0], A);
    nmos n1b(PDN[0], gnd, B);

    nmos n2a(PUN[2], PDN[1], B);
    nmos n2b(PDN[1], gnd, C);

    nmos n3a(PUN[2], PDN[2], C);
    nmos n3b(PDN[2], gnd, A);

    pmos p_inv(Y, vdd, PUN[2]);
    nmos n_inv(Y, gnd, PUN[2]);    

endmodule

// Testbench
module tb_maj3;

    reg A, B, C;
    wire Y_beh, Y_flow, Y_gate, Y_sw;

    maj3_behavioral DUT1(.A(A), .B(B), .C(C), .Y(Y_beh));
    maj3_dataflow   DUT2(.A(A), .B(B), .C(C), .Y(Y_flow));
    maj3_gate       DUT3(.A(A), .B(B), .C(C), .Y(Y_gate));
    maj3_switch     DUT4(.A(A), .B(B), .C(C), .Y(Y_sw));

    initial begin

        $monitor("t=%0t A=%b B=%b C=%b | beh=%b flow=%b gate=%b sw=%b",
                  $time, A, B, C, Y_beh, Y_flow, Y_gate, Y_sw);
        $dumpfile("Question3_test.vcd");
        $dumpvars(0, tb_maj3);

        A=0; B=0; C=0; #10;
        A=0; B=0; C=1; #10;
        A=0; B=1; C=0; #10;
        A=0; B=1; C=1; #10;
        A=1; B=0; C=0; #10;
        A=1; B=0; C=1; #10;
        A=1; B=1; C=0; #10;
        A=1; B=1; C=1; #10;
        $finish;
    end

endmodule