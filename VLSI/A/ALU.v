module ALU (
    input  wire [6:0] A, B,
    input  wire       OP,     
    output reg  [6:0] result,
    output wire  CF,       
    output wire  SF,      
    output wire  ZF        
);

    wire [6:0] R_NOR, R_ADD;
    wire       carry_out;

    ALU_NOR_7bit NOR1 (.A(A), .B(B), .result(R_NOR));
    ALU_ADD_7bit ADD1 (.A(A), .B(B), .sum(R_ADD), .carry(CF));

    always @(*) begin
        case (OP)
            1'b0: result = R_NOR;
            1'b1: result = R_ADD;
            default: result = 7'b0000000;
        endcase
    end

    assign SF = result[6];

    assign ZF = (result == 7'b0000000);

endmodule
