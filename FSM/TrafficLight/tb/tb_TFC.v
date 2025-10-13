`timescale 1ns/1ns

module tb_TFC;
    reg CLK;
    reg resetn;
    reg T_A;
    reg T_B;
    wire [1:0] L_A;
    wire [1:0] L_B;

    TFC dut(.CLK(CLK), .resetn(resetn), .T_A(T_A), .T_B(T_B), .L_A(L_A), .L_B(L_B));

    initial begin
        CLK = 0;
        forever #5 CLK = ~CLK;
    end

    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, tb_TFC);

        resetn = 0; T_A = 0; T_B = 0; #10;
        resetn = 1;

        $monitor("Time = %0t  T_A = %b  T_B = %b  |  L_A = %b  L_B = %b ", $time, T_A, T_B, L_A, L_B);
        T_A = 0; T_B = 0; #15;
        T_A = 0; T_B = 1; #15;
        T_A = 1; T_B = 0; #15;
        T_A = 1; T_B = 1; #15;

        #15 $finish;
    end

endmodule