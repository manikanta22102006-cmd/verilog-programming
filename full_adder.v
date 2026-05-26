// DAY 3: Implementation of a Full Adder
`timescale 1ns / 1ps

module full_adder (
    input a,
    input b,
    input cin,
    output sum,
    output cout
);

    // Full Adder logic using dataflow modeling
    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (b & cin) | (cin & a);

endmodule
// DAY 3: Testbench for Full Adder
`timescale 1ns / 1ps

module full_adder_tb;

    // Inputs
    reg a;
    reg b;
    reg cin;

    // Outputs
    wire sum;
    wire cout;

    // Instantiate the Unit Under Test (UUT)
    full_adder uut (
        .a(a), 
        .b(b), 
        .cin(cin), 
        .sum(sum), 
        .cout(cout)
    );

    initial begin
        // Display format for simulation results
        $monitor("Time=%0t | a=%b b=%b cin=%b | Sum=%b Cout=%b", $time, a, b, cin, sum, cout);
        
        // Apply all possible 8 input combinations
        a = 0; b = 0; cin = 0; #10;
        a = 0; b = 0; cin = 1; #10;
        a = 0; b = 1; cin = 0; #10;
        a = 0; b = 1; cin = 1; #10;
        a = 1; b = 0; cin = 0; #10;
        a = 1; b = 0; cin = 1; #10;
        a = 1; b = 1; cin = 0; #10;
        a = 1; b = 1; cin = 1; #10;
        
        // End simulation
        $finish;
    end
      
endmodule