// DAY 4: Implementation of 4-Bit Parallel Adder (Ripple Carry Adder)
`timescale 1ns / 1ps

// Top Module: 4-Bit Parallel Adder
module parallel_adder (
    input [3:0] A,
    input [3:0] B,
    input Cin,
    output [3:0] Sum,
    output Cout
);

    wire c1, c2, c3; // Internal carry wires

    // Instantiating 4 Full Adders
    full_adder_module fa0 (A[0], B[0], Cin, Sum[0], c1);
    full_adder_module fa1 (A[1], B[1], c1,  Sum[1], c2);
    full_adder_module fa2 (A[2], B[2], c2,  Sum[2], c3);
    full_adder_module fa3 (A[3], B[3], c3,  Sum[3], Cout);

endmodule

// Helper Module: Full Adder
module full_adder_module (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
// DAY 4: Testbench for 4-Bit Parallel Adder
`timescale 1ns / 1ps

module parallel_adder_tb;

    // Inputs
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;

    // Outputs
    wire [3:0] Sum;
    wire Cout;

    // Instantiate the Unit Under Test (UUT)
    parallel_adder uut (
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
        
        // Test Case 1: 5 + 3 + 0 = 8
        A = 4'b0101; B = 4'b0011; Cin = 1'b0; #10;
        
        // Test Case 2: 12 + 4 + 0 = 16 (Sum=0, Cout=1)
        A = 4'b1100; B = 4'b0100; Cin = 1'b0; #10;
        
        // Test Case 3: 7 + 7 + 1 = 15
        A = 4'b0111; B = 4'b0111; Cin = 1'b1; #10;
        
        // Test Case 4: 15 + 15 + 1 = 31 (Sum=15, Cout=1)
        A = 4'b1111; B = 4'b1111; Cin = 1'b1; #10;
        
        // End simulation
        $finish;
    end
      
endmodule