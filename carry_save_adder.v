// File Name: carry_save_adder.v
// DAY 12: 4-Bit Carry Save Adder using Dataflow Modelling

`timescale 1ns / 1ps

module carry_save_adder(
    input  [3:0] A,
    input  [3:0] B,
    input  [3:0] C,
    output [3:0] Sum,
    output [3:0] Carry
);

    // Sum generation using XOR
    assign Sum = A ^ B ^ C;

    // Carry generation
    assign Carry = (A & B) | (B & C) | (A & C);

endmodule
// File Name: carry_save_adder_tb.v
// Testbench for 4-Bit Carry Save Adder

`timescale 1ns / 1ps

module carry_save_adder_tb;

    reg  [3:0] A;
    reg  [3:0] B;
    reg  [3:0] C;

    wire [3:0] Sum;
    wire [3:0] Carry;

    // Instantiate the DUT
    carry_save_adder uut (
        .A(A),
        .B(B),
        .C(C),
        .Sum(Sum),
        .Carry(Carry)
    );

    initial begin

        $monitor("Time=%0t | A=%b B=%b C=%b | Sum=%b Carry=%b",
                  $time, A, B, C, Sum, Carry);

        // Test Cases
        A = 4'b0000; B = 4'b0000; C = 4'b0000; #10;
        A = 4'b0001; B = 4'b0010; C = 4'b0011; #10;
        A = 4'b0101; B = 4'b0011; C = 4'b0001; #10;
        A = 4'b1111; B = 4'b0001; C = 4'b0010; #10;
        A = 4'b1010; B = 4'b0101; C = 4'b0011; #10;

        $finish;
    end

endmodule