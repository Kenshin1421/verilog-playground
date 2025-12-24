//Simple pattern matcher , checks if '01' has occured in sequence.
//Implemented with Mealy FSM

module pattern_matcher(input a, output b, input CLK, input reset);
    reg state = 1'b0;
    wire S0_n = ~a;

    always @(posedge CLK) begin
        if (reset) begin
            state <= 1'b0;
        end
        else begin
            state <= S0_n;
        end
    end

    b = state&a;
endmodule