`timescale 1ns/1ps

module tb_4_to_1_Mux;
    reg [3:0] in0, in1, in2, in3;
    reg [1:0] sel;
    wire [3:0] out;


    mux dut(.in0(in0), .in1(in1), .in2(in2), .in3(in3), .sel(sel), .out(out));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_4_to_1_Mux);

        in0 = 4'b0001;
        in1 = 4'b0010;
        in2 = 4'b0100;
        in3 = 4'b1000;

        $monitor("Time=%0t  sel=%b  |  out=%b", $time, sel, out);
        sel = 2'b00;  #10;
        sel = 2'b01;  #10;
        sel = 2'b10;  #10;
        sel = 2'b11;  #10;

        $finish;
    end

endmodule