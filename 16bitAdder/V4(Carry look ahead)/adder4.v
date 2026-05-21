module adder4(S, Cout, A, B, Cin);

    input [3:0] A, B;
    input Cin;
    output [3:0] S;
    output Cout;

    wire g[3:0], p[3:0], c[3:1];

    assign g[0] = A[0] & B[0],
           g[1] = A[1] & B[1],
           g[2] = A[2] & B[2],
           g[3] = A[3] & B[3];

    assign p[0] = A[0] ^ B[0],
           p[1] = A[1] ^ B[1],
           p[2] = A[2] ^ B[2],
           p[3] = A[3] ^ B[3];

    assign c[1] = g[0] | (p[0] & Cin),
           c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & Cin),
           c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & Cin),
           Cout = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & Cin);

    assign S[0] = p[0] ^ Cin,
           S[1] = p[1] ^ c[1],
           S[2] = p[2] ^ c[2],
           S[3] = p[3] ^ c[3];



endmodule