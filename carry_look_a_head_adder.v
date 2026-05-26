// DAY 5: Implementation of a 4-Bit Carry Look-Ahead Adder
`timescale 1ns / 1ps

module carry_lookahead_adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire [3:0] G; // Carry Generate
    wire [3:0] P; // Carry Propagate
    wire [4:0] C; // Carry outputs

    // Step 1: Generate and Propagate logic
    assign G = A & B;
    assign P = A ^ B;

    // Step 2: Carry Look-Ahead Logic
    assign C[0] = Cin;
    assign C[1] = G[0] | (P[0] & C[0]);
    assign C[2] = G[1] | (P[1] & G[0]) | (P[1] & P[0] & C[0]);
    assign C[3] = G[2] | (P[2] & G[1]) | (P[2] & P[1] & G[0]) | (P[2] & P[1] & P[0] & C[0]);
    assign C[4] = G[3] | (P[3] & G[2]) | (P[3] & P[2] & G[1]) | (P[3] & P[2] & P[1] & G[0]) | (P[3] & P[2] & P[1] & P[0] & C[0]);

    // Step 3: Sum Logic
    assign Sum = P ^ C[3:0];
    assign Cout = C[4];

endmodule
// DAY 5: Testbench for 4-Bit Carry Look-Ahead Adder
`timescale 1ns / 1ps

module carry_lookahead_adder_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    carry_lookahead_adder uut (
        .A(A), 
        .B(B), 
        .Cin(Cin), 
        .Sum(Sum), 
        .Cout(Cout)
    );

    initial begin
        // Display format for simulation results
        $monitor("Time=%0t | A=%b (%d) | B=%b (%d) | Cin=%b | Sum=%b (%d) | Cout=%b", 
                 $time, A, A, B, B, Cin, Sum, Sum, Cout);
        
        // Test Case 1: 5 + 3 = 8
        A = 4'b0101; B = 4'b0011; Cin = 1'b0; #10;
        
        // Test Case 2: 10 + 6 = 16 (Sum=0, Cout=1)
        A = 4'b1010; B = 4'b0110; Cin = 1'b0; #10;
        
        // Test Case 3: 7 + 7 + 1 = 15
        A = 4'b0111; B = 4'b0111; Cin = 1'b1; #10;
        
        // Test Case 4: 15 + 15 + 1 = 31 (Sum=15, Cout=1)
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #10;
        
        // End simulation
        $finish;
    end
      
endmodule