module adder4(S, Cout, A, B, Cin);

    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout;

    wire c[3:1];

    fulladder FA0 (S[0], c[1], A[0], B[0], Cin);
    fulladder FA1 (S[1], c[2], A[1], B[1], c[1]);
    fulladder FA2 (S[2], c[3], A[2], B[2], c[2]);
    fulladder FA3 (S[3], Cout, A[3], B[3], c[3]);

endmodule