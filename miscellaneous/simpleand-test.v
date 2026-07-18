module testbench;
	reg x, y;
	wire f;
	simpleand DUT(f, x, y);

	initial
		begin
			$dumpfile("Simpleand.vcd");
			$dumpvars(0, testbench);
			$monitor($time, " x = %b, y = %b, f = %b", x, y, f);
			#1 x = 0; y = 0;
			#1 x = 1; y = 0;
			#1 x = 0; y = 1;
			#1 x = 1; y = 1;
			#1 $finish;
		end
endmodule

