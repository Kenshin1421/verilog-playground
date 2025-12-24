`timescale 1ns/1ns

module tb_Pattern;
    reg CLK;
    reg reset;
    reg a;
    wire b;

    pattern_matcher DUT(.a(a), .b(b), .CLK(CLK), .reset(reset));

    initial begin
        CLK = 1'b0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_Pattern);

        reset = 1; a=0; #10;
        reset = 0;

        $monitor("Time = %0t  a = %b | b = %b", $time, a, b);
        a = 0; #15;
        a = 1; #15;
        a = 0; #15;
        a = 1; #15;

        #15 $finish;
    end

endmodule