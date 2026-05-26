// File Name: binary_adder_subtractor.v
// DAY 13: Binary Adder/Subtractor using Dataflow Modelling

`timescale 1ns / 1ps

module binary_adder_subtractor(
    input  [3:0] A,
    input  [3:0] B,
    input        M,
    output [3:0] Sum,
    output       Cout
);

    wire [3:0] B_mod;

    // XOR operation for addition/subtraction control
    assign B_mod = B ^ {4{M}};

    // Final addition/subtraction
    assign {Cout, Sum} = A + B_mod + M;

endmodule
`timescale 1ns / 1ps

module tb_cs_adder;

    reg [3:0] a, b;
    reg cin;
    wire [3:0] s;
    wire cout;

    cs_adder uut(
        .a(a),
        .b(b),
        .cin(cin),
        .s(s),
        .cout(cout)
    );

    initial begin
        $dumpfile("waveform.vcd");
        $dumpvars(0, tb_cs_adder);
        
        $monitor("a=%b, b=%b, cin=%b, s=%b, cout=%b", a, b, cin, s, cout);

        a = 4'b0000; b = 4'b0001; cin = 1'b0; #2;
        a = 4'b0001; b = 4'b0010; cin = 1'b1; #2;
        a = 4'b0010; b = 4'b0011; cin = 1'b0; #2;
        a = 4'b0011; b = 4'b0100; cin = 1'b1; #2;
        a = 4'b0100; b = 4'b0101; cin = 1'b0; #2;
        a = 4'b0101; b = 4'b0110; cin = 1'b1; #2;
        a = 4'b0110; b = 4'b0111; cin = 1'b0; #2;
        a = 4'b0111; b = 4'b1000; cin = 1'b1; #2;
        a = 4'b1000; b = 4'b1001; cin = 1'b0; #2;
        a = 4'b1001; b = 4'b1010; cin = 1'b1; #2;

        $finish;
    end

endmodule