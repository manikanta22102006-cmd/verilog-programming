// File Name: bcd_adder.v
// DAY 13: BCD Adder using Dataflow Modelling

`timescale 1ns / 1ps

module bcd_adder(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

    wire [4:0] Temp;
    wire [4:0] Corrected_Sum;
    wire K;

    // Initial binary addition
    assign Temp = A + B + Cin;

    // BCD correction condition
    assign K = Temp[4] | (Temp[3] & Temp[2]) | (Temp[3] & Temp[1]);

    // Add 6 if correction is needed
    assign Corrected_Sum = K ? (Temp + 5'b00110) : Temp;

    // Final outputs
    assign Sum  = Corrected_Sum[3:0];
    assign Cout = Corrected_Sum[4];

endmodule
// File Name: bcd_adder_tb.v
// Testbench for BCD Adder

`timescale 1ns / 1ps

module bcd_adder_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg        Cin;

    wire [3:0] Sum;
    wire       Cout;

    // Instantiate the DUT
    bcd_adder uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .Sum(Sum),
        .Cout(Cout)
    );

    initial begin

        $monitor("Time=%0t | A=%b B=%b Cin=%b | Sum=%b Cout=%b",
                  $time, A, B, Cin, Sum, Cout);

        // Test Cases
        A = 4'b0010; B = 4'b0011; Cin = 0; #10; // 2 + 3 = 5
        A = 4'b0101; B = 4'b0100; Cin = 0; #10; // 5 + 4 = 9
        A = 4'b1001; B = 4'b0001; Cin = 0; #10; // 9 + 1 = 10
        A = 4'b0111; B = 4'b0110; Cin = 0; #10; // 7 + 6 = 13
        A = 4'b1001; B = 4'b1001; Cin = 0; #10; // 9 + 9 = 18

        $finish;
    end

endmodule