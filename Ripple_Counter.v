module Ripple_Counter ( 
    input Clk, Reset,
    output [2:0] result
);
    wire q0, q1, q2;
    
    T_Flip_Flop t0 (
        .T(1'b1),
        .Clk(Clk),
        .reset(Reset),
        .CurrentQ(q0),
        .NextQ()
    );
    
    T_Flip_Flop t1 (
        .T(1'b1),
        .Clk(q0),
        .reset(Reset),
        .CurrentQ(q1),
        .NextQ()
    );
    
    T_Flip_Flop t2 (
        .T(1'b1),
        .Clk(q1),
        .reset(Reset),
        .CurrentQ(q2),
        .NextQ()
    );
    
    assign result = {q2, q1, q0};
endmodule 