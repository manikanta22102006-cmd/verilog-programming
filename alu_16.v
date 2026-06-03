rtl code:
`timescale 1ns / 1ps
module alu_16(input [15:0]a,b,input [3:0]o,output reg [15:0]y,output reg [31:0] mul_out);
    always@(*)begin
    y = 16'd0;
        mul_out = 32'd0;
    case(o)
    4'b0000:y=a+b;
    4'b0001:y=a-b;
    4'b0010:mul_out=a*b;
    4'b0011:y=(b!=0)?a/b:16'd0;
    4'b0100:y=a&b;
    4'b0101:y=a|b;
    4'b0110:y=a^b;
    4'b0111:y=~(a&b);
    4'b1000:y=~(a|b);
    4'b1001:y=~(a^b);
    4'b1010:y=a<<1;
    4'b1011:y=a>>1;
    4'b1100:y=a+1;
    4'b1101:y=a-1;
    4'b1110:y=b+1;
    4'b1111:y=b-1;
    default:y=16'd0;
    endcase
    end  
endmodule


test bench code:
`timescale 1ns / 1ps
module tb_alu_16;
reg [15:0] a,b;
reg [3:0] o;
wire [15:0] y;
wire [31:0] mul_out;
alu_16 uut (.a(a),.b(b),.o(o),.y(y),.mul_out(mul_out));
initial begin
    $monitor("a=%d b=%d o=%b y=%d,mul_out=%b", a, b, 0, y,mul_out);
    a = 16'd20;
    b = 16'd10;
    o = 4'b0000; #10;
    o = 4'b0001; #10; 
    o = 4'b0010; #10; 
    o = 4'b0011; #10; 
    o = 4'b0100; #10; 
    o = 4'b0101; #10;
    o = 4'b0110; #10;
    o = 4'b0111; #10; 
    o = 4'b1000; #10;
    o = 4'b1001; #10;
    o = 4'b1010; #10; 
    o = 4'b1011; #10; 
    o = 4'b1100; #10;
    o = 4'b1101; #10;
    o = 4'b1110; #10; 
    o = 4'b1111; #10; 
    $finish;
end   
endmodule