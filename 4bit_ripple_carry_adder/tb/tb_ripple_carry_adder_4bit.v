`timescale 1ns/1ps

module tb_rca_4bit;

    reg [3:0] A;
    reg [3:0] B;
    wire [3:0] SUM;
    wire COUT;

    rca_4bit dut(.a(A), .b(B), .sum(SUM), .cout(COUT));

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_rca_4bit);

        $monitor("Time=%0t A=%b B=%b | SUM = %b COUT = %b", $time, A, B, SUM, COUT);

        A = 4'b0000; B = 4'b0000; #10;
        A = 4'b0001; B = 4'b0010; #10;
        A = 4'b0101; B = 4'b0011; #10;
        A = 4'b1111; B = 4'b0001; #10;
        A = 4'b1010; B = 4'b0111; #10;

        $finish;
    end

endmodule