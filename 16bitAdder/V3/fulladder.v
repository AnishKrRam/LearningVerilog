module fulladder(s, cout, a, b, c);
    input a, b, c;
    output s, cout;

    wire s1, c1, c2;

    xor G1 (s1, a, b);
    xor G2 (s, s1, c);
    or  G3 (cout, c1, c2);
    and G4 (c1, a, b);
    and G5 (c2, s1, c);

endmodule