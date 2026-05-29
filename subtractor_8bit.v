`timescale 1ns / 1ps

module subtractor_8bit (
    input [7:0] a, 
    input [7:0] b,
    output reg [7:0] s
);

reg [7:0] ts;

always @(*)
begin
    // Two's complement of 'b' (Invert and add 1)
    ts = (~b) + 1'b1;[cite: 1]
    // Adding two's complement to 'a' results in (a - b)
    s = a + ts;[cite: 1]
end

endmodule
`timescale 1ns / 1ps

module tb_subtractor_8bit;

reg [7:0] a, b;
wire [7:0] s;

// Unit Under Test (UUT) instantiation
subtractor_8bit uut (
    .a(a),
    .b(b),
    .s(s)
);[cite: 1]

initial begin
    $monitor("a=%d, b=%d, s=%d", a, b, s);[cite: 1]
    $dumpfile("waveform.vcd");[cite: 1]
    $dumpvars(0, tb_subtractor_8bit);[cite: 1]

    // 10 random test cases generate chestundi
    for (integer i = 0; i < 10; i = i + 1)
    begin
        a = $random() % 128;[cite: 1]
        b = $random() % 128;[cite: 1]
        #10;
    end

    $finish;[cite: 1]
end

endmodule