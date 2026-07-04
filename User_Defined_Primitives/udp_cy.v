// Full adder carry generation using UDP
primitive udp_cy (cout, a, b, c);
    input a, b, c;
    output cout;
    table
    //  a  b  c    cout
        0  0  ?  :  0;
        0  ?  0  :  0;
        ?  0  0  :  0;
        ?  1  1  :  1;
        1  ?  1  :  1;
        1  1  ?  :  1;
    endtable
endprimitive