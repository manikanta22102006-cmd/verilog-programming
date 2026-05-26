// DAY 2: Implementation of a Half Adder

`timescale 1ns / 1ps

module half_adder (
    input a,
    input b,
    output sum,
    output carry
);

    // Half Adder logic using dataflow modeling
    assign sum   = a ^ b;  // XOR gate
    assign carry = a & b;  // AND gate

endmodule
// DAY 2: Testbench for Half Adder
`timescale 1ns / 1ps

module half_adder_tb;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire sum;
    wire carry;

    // Instantiate the Unit Under Test (UUT)
    half_adder uut (
        .a(a), 
        .b(b), 
        .sum(sum), 
        .carry(carry)
    );

    initial begin
        // Display format for simulation results
        $monitor("Time=%0t | a=%b b=%b | Sum=%b Carry=%b", $time, a, b, sum, carry);
        
        // Apply all 4 input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        // End simulation
        $finish;
    end
      
endmodule