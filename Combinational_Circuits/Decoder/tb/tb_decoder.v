`timescale 1ns/1ns

module tb_decoder;
    reg [1:0] in;
    wire [3:0] out;

    decoder dut(.in(in), .out(out));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_decoder);
        
        $monitor("Time = %0t  In = %b  |  Out = %b", $time, in, out);
        
        in = 2'b00; #10;
        in = 2'b01; #10;
        in = 2'b10; #10;
        in = 2'b11; #10;
        
        $finish;
    end
endmodule 