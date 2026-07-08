//tristate buffer not implemented
module RAM_test;
    reg [9:0] address;
    wire [7:0] data_out;
    reg [7:0] data_in;
    reg write, select;
    integer k, myseed;

    ram_3 RAM (data_out, data_in, address, write, select);


    initial begin
        for (k = 0; k <= 1023; k = k + 1)
            begin
                address = k;
                data_in = (k + k) % 256;
                write = 1; select = 1; // read = 0 removed
                #2 write = 0; select = 0;
            end
        repeat (20)
            begin
                #2 address = $random (myseed) % 1024;
                write = 0;
                select = 1;
                $display ("Address: %5d, Data: %4d", address, data_out);

            end
    end
    initial begin
        $dumpfile ("RAM_test.vcd");
        $dumpvars (0, RAM_test);
    end
    initial myseed = 35;

endmodule