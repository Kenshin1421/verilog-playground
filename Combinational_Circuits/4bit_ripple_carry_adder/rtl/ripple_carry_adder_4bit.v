module rca_4bit (input [3:0] a, input [3:0] b, output [3:0] sum, output cout);

    wire w1,w2,w3; // Wires for carry between full adders

    full_adder f0(a[0], b[0], 1'b0, sum[0], w1);
    full_adder f1(a[1], b[1], w1, sum[1], w2);
    full_adder f2(a[2], b[2], w2, sum[2], w3);
    full_adder f3(a[3], b[3], w3, sum[3], cout);

endmodule