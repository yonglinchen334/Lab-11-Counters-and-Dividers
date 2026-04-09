module top (
    input btnU, btnC,
    output [6:0]led
);

    wire [2:0]div_out;
    wire [2:0]ripple_out;
    wire div_pulse;
    
     Ripple_Counter rc (
        .Clk(btnC),
        .Reset(btnU),
        .result(ripple_out)
    );
    
    Modulo_Divider md_inst (
        .Clk(btnC),
        .Reset(btnU),
        .Result(div_out),
        .output_bit(div_pulse)
    );
    
    assign led[2:0] = ripple_out;
    assign led[5:3] = div_out;
    assign led[6] = div_pulse;

endmodule 