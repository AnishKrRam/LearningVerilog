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


module tb_maj3;
    reg A, B, C;
    wire Y;

    maj3_switch DUT(.A(A), .B(B), .C(C), .Y(Y));


    initial begin
        $monitor("t=%0t A=%b B=%b C=%b | y=%b",
                  $time, A, B, C, Y);
        $dumpfile("Question3mos_test.vcd");
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