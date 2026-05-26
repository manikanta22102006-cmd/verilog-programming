// DAY 4: Implementation of a Half Subtractor
`timescale 1ns / 1ps

module half_subtractor (
    input a,
    input b,
    output diff,
    output borrow
);

    // Half Subtractor logic using dataflow modeling
    assign diff   = a ^ b;      // XOR gate
    assign borrow = (~a) & b;   // NOT gate connected to AND gate

endmodule
// DAY 4: Testbench for Half Subtractor
`timescale 1ns / 1ps

module half_subtractor_tb;

    // Inputs
    reg a;
    reg b;

    // Outputs
    wire diff;
    wire borrow;

    // Instantiate the Unit Under Test (UUT)
    half_subtractor uut (
        .a(a), 
        .b(b), 
        .diff(diff), 
        .borrow(borrow)
    );

    initial begin
        // Display format for simulation results
        $monitor("Time=%0t | a=%b b=%b | Diff=%b Borrow=%b", $time, a, b, diff, borrow);
        
        // Apply all 4 input combinations
        a = 0; b = 0; #10;
        a = 0; b = 1; #10;
        a = 1; b = 0; #10;
        a = 1; b = 1; #10;
        
        // End simulation
        $finish;
    end
      
endmodule