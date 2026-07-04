`timescale 1ns/1ps 
module tb_mux(); 

    wire a, b, sel; 
    wire out;

    mux2to1 dut (.a(a), .b(b), .sel(sel), .out(out));

    always begin 
        a=0; b=0; sel=0;
        #20;
        a=1; b=0; sel=1;
        #20;
        a=1; b=1; sel=0;
        #20; $finish;
    end

    initial begin
        $monitor("%t a=%b b=%b sel=%b",$time, out, b, sel);
    end
endmodule