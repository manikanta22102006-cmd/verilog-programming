rtl code:
`timescale 1ns / 1ps
module demux_1x8(input d,input [2:0] s,output reg [7:0] y);
always @(*) begin
    y = 8'b00000000;
    case(s)
        3'b000: y[0] = d;
        3'b001: y[1] = d;
        3'b010: y[2] = d;
        3'b011: y[3] = d;
        3'b100: y[4] = d;
        3'b101: y[5] = d;
        3'b110: y[6] = d;
        3'b111: y[7] = d;
    endcase
end
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_demux_1x8;
reg d;
reg [2:0] s;
wire [7:0] y;
demux_1x8 uut(.d(d),.s(s),.y(y));
initial begin
$monitor("d=%b s=%b y=%b", d, s, y);
    d = 1;
    s = 3'b000; #10;
    s = 3'b001; #10;
    s = 3'b010; #10;
    s = 3'b011; #10;
    s = 3'b100; #10;
    s = 3'b101; #10;
    s = 3'b110; #10;
    s = 3'b111; #10;
    $finish;
end
endmodule