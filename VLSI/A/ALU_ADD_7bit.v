module ALU_ADD_7bit (
    input  wire [6:0] A, B,
    output wire [6:0] sum,
    output wire carry
);
    wire [7:0] full_sum;
    assign full_sum = A + B;
    assign sum   = full_sum[6:0];
    assign carry = full_sum[7];
endmodule
