module Modulo_Divider (
    input Clk, Reset,
    output [2:0] Result,
    output output_bit
    );
    
    wire [2:0] curr_state;
    wire [2:0] next_state;
    wire [2:0] D_in;
    wire c1, c2;
    wire rst;
    assign rst = (curr_state[2] & ~curr_state[1] & curr_state[0]);
    
    // Add one to the current state to find the next state 
    full_adder fullAdder1 (
        .A(1'b0),
        .B(curr_state[0]),
        .Y(next_state[0]),
        .Cin(1'b1), 
        .Cout(c1)
    );
    
    full_adder fullAdder2 (
        .A(1'b0),
        .B(curr_state[1]),
        .Y(next_state[1]),
        .Cin(c1), 
        .Cout(c2)
    );
    
    full_adder fullAdder3 (
        .A(1'b0),
        .B(curr_state[2]),
        .Y(next_state[2]),
        .Cin(c2),  
        .Cout() // last FA does not have a carry out 
    );

    // gate next state
    assign D_in[0] = rst ? 1'b0 : next_state[0];
    assign D_in[1] = rst ? 1'b0 : next_state[1];
    assign D_in[2] = rst ? 1'b0 : next_state[2];
    
    D_Flip_Flop d0 (
        .D(D_in[0]),
        .Clk(Clk),
        .reset(Reset),
        .Q(curr_state[0]),
        .NotQ()
    );
    
    D_Flip_Flop d1 (
        .D(D_in[1]),
        .Clk(Clk),
        .reset(Reset),
        .Q(curr_state[1]),
        .NotQ()
    );
    
    D_Flip_Flop d2 (
        .D(D_in[2]),
        .Clk(Clk),
        .reset(Reset),
        .Q(curr_state[2]),
        .NotQ()
    );
    
    assign Result = curr_state;
    
    // output_bit toggles on rollover
    reg output_bit_reg;
    assign output_bit = output_bit_reg;
    
    always @(posedge Clk or posedge Reset) begin
        if (Reset)
            output_bit_reg <= 1'b0;
        else if (rst)
            output_bit_reg <= ~output_bit_reg;
    end 
    
endmodule
