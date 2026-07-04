module halfadder(S, C, A, B);
	input A, B;
	output S, C;
	xor G1 (S, A, B);
	and G2 (C, A, B);
endmodule

