module ALU_tb;

    reg [6:0] A, B;
    reg OP;
    wire [6:0] R;
    wire CF, SF, ZF;

    ALU uut (
        .A(A),
        .B(B),
        .OP(OP),
        .result(R),
        .CF(CF),
        .SF(SF),
        .ZF(ZF)
    );

    initial begin
        $dumpfile("alu_test.vcd");
        $dumpvars(0, ALU_tb);

        $monitor("Time=%0t | A=%b B=%b OP=%b => R=%b | CF=%b SF=%b ZF=%b", 
                 $time, A, B, OP, R, CF, SF, ZF);

        // Test 1: NOR
        A = 7'b0001100;
        B = 7'b0000011;
        OP = 1'b0;
        #10;

        // Test 2: ADD
        A = 7'b0101010;
        B = 7'b0011001;
        OP = 1'b1;
        #10;

        $finish;
    end

endmodule
