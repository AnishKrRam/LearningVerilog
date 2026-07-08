module MUL_datapath (eqz, LdA, LdB, LdP, clrP, decB, data_in, clk);
    input LdA, LdB, LdP, clrP, decB, clk;
    input [15:0] data_in;
    output eqz;
    wire [15:0] X, Y, Z, Bout, Bus;

    PIPO1 A (X, Bus, LdA, clk);
    PIPO2 P (Y, Z, LdP, clrP, clk);
    CNTR  B (Bout, Bus, LdB, decB, clk);
    ADD  AD (Z, X, Y);
    EQZ COMP (eqz, Bout);

endmodule