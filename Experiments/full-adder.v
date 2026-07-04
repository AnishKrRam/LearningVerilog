module fulladder(S, Cout,  A, B, Cin);

	input A, B, Cin;
	output S, Cout;
	wire wS, wC1, wC2;

	halfadder A1 (wS, wC1, A, B);
	halfadder A2 (S, wC2, wS, Cin);
	or (Cout, wC1, wC2);

endmodule

