// Implement module called full_adder
module full_adder (
    // Declare inputs 
    input A, B, 
    // Declare carry in 
    input Cin,
    // Declare output Y 
    output Y,
    // Declare carry out 
    output Cout 
);
    // Enter logic equations 
    assign Y = A ^ B ^ Cin; 
    assign Cout = (A & B) | (B & Cin) | (A & Cin);
endmodule 