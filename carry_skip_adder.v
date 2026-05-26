// File Name: carry_skip_adder.v
// DAY 11: 4-Bit Carry Skip Adder using Dataflow Modelling

`timescale 1ns / 1ps

module carry_skip_adder(
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

    wire [3:0] P, G;
    wire c1, c2, c3, c4;
    wire block_propagate;

    // Propagate and Generate signals
    assign P = A ^ B;
    assign G = A & B;

    // Carry generation
    assign c1 = G[0] | (P[0] & Cin);
    assign c2 = G[1] | (P[1] & c1);
    assign c3 = G[2] | (P[2] & c2);
    assign c4 = G[3] | (P[3] & c3);

    // Sum generation
    assign Sum[0] = P[0] ^ Cin;
    assign Sum[1] = P[1] ^ c1;
    assign Sum[2] = P[2] ^ c2;
    assign Sum[3] = P[3] ^ c3;

    // Block propagate signal
    assign block_propagate = P[0] & P[1] & P[2] & P[3];

    // Carry Skip Logic
    assign Cout = block_propagate ? Cin : c4;

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