module D_Flip_Flop(
    input D, 
    input Clk,
    input reset,
    output reg Q,
    output wire NotQ
    );
    
    // Initalize 
    initial begin 
        Q <= 0;
     end 
     
     // Positive edge triggered D flip-flop
     always @(posedge Clk or posedge reset) begin 
       if (reset)
            Q <= 1'b0;
       else 
            Q <= D;
     end 
     
     // Complement output 
     assign NotQ = ~Q;
endmodule
