module T_Flip_Flop (
    input T, 
    input Clk,
    input reset,
    output wire Q
);

    wire d_input;
    
    assign d_input = T ^ Q;
    
    // D flip-flop inst
    D_Flip_Flop dff_inst (
        .D(d_input),
        .Clk(Clk),
        .reset(reset),
        .Q(Q),
        .NotQ()
    );

endmodule