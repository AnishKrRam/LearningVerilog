module testbench;
	
	reg A, B, Cin;
	wire S, Cout;
	
	fulladder DUT(S, Cout, A, B, Cin);

	initial
	begin
		$dumpfile ("Adder.vcd");
		$dumpvars (0, testbench);
		$monitor ($time, "A = %b, B  = %b, Cin = %b, S = %b, Cout = %b", A, B, Cin, S, Cout);
		#2 A = 0; B = 0; Cin = 0;
		#2 A = 1;
		#2 A = 0; B = 1;
		#2 A = 1;
		#2 A = 0; Cin = 1;
		#2 $finish;
	end
endmodule
