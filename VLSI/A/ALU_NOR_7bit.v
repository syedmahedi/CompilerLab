module ALU_NOR_7bit (
    input  wire [6:0] A,
    input  wire [6:0] B,
    output wire [6:0] result
);
    assign result = ~(A | B);
endmodule
