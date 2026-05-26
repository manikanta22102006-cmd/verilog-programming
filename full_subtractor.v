// DAY 5: Implementation of a Full Subtractor
`timescale 1ns / 1ps

module full_subtractor (
    input a,
    input b,
    input bin,
    output diff,
    output borrow
);

    // Full Subtractor logic using dataflow modeling
    assign diff   = a ^ b ^ bin;
    assign borrow = (~a & b) | (~(a ^ b) & bin);

endmodule
// DAY 5: Testbench for Full Subtractor
`timescale 1ns / 1ps

module full_subtractor_tb;

    // Inputs
    reg a;
    reg b;
    reg bin;

    // Outputs
    wire diff;
    wire borrow;

    // Instantiate the Unit Under Test (UUT)
    full_subtractor uut (
        .a(a), 
        .b(b), 
        .bin(bin), 
        .diff(diff), 
        .borrow(borrow)
    );

    initial begin
        // Display format for simulation results
        $monitor("Time=%0t | a=%b b=%b bin=%b | Diff=%b Borrow=%b", $time, a, b, bin, diff, borrow);
        
        // Apply all possible 8 input combinations
        a = 0; b = 0; bin = 0; #10;
        a = 0; b = 0; bin = 1; #10;
        a = 0; b = 1; bin = 0; #10;
        a = 0; b = 1; bin = 1; #10;
        a = 1; b = 0; bin = 0; #10;
        a = 1; b = 0; bin = 1; #10;
        a = 1; b = 1; bin = 0; #10;
        a = 1; b = 1; bin = 1; #10;
        
        // End simulation
        $finish;
    end
      
endmodule