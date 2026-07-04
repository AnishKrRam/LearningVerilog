//Instantiating UDP's

module full_adder (
    sum, cout, a, b, c
);
    input a, b, c;
    output sum, cout;

    udp_sum SUM (sum, a, b, c);
    udp_cy CARRY (cout, a, b, c);
    
endmodule