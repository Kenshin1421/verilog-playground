module TFC(input T_A, input T_B, output [1:0] L_A, output [1:0] L_B, input CLK, input resetn);
    wire S1_n, S0_n;
    reg S1, S0;

    assign S1_n = S1^S0;
    assign S0_n = ((~T_A)&(~S1)&(~S0)) | ((~T_B)&(~S0)&(S1));

    always @(posedge CLK) begin
        if (~resetn) begin
            S1 <= 0;
            S0 <= 0;
        end
        else begin
            S1 <= S1_n;
            S0 <= S0_n;
        end
    end

    assign L_A[1] = S1;
    assign L_A[0] = (~S1)&S0;
    assign L_B[1] = ~S1;
    assign L_B[0] = S1&S0;  
endmodule