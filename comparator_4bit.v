rtl code:
`timescale 1ns / 1ps
module comparator_1bit(input a,input b,output g,output e,output l);
assign g = a & ~b;
assign e = ~(a ^ b);
assign l = ~a & b;
endmodule
module comparator_4bit(input [3:0] A,input [3:0] B,output G,output E,output L);
wire [3:0]g,e,l;
comparator_1bit c3(.a(A[3]),.b(B[3]),.g(g[3]),.e(e[3]),.l(l[3]));
comparator_1bit c2(.a(A[2]),.b(B[2]),.g(g[2]),.e(e[2]),.l(l[2]));
comparator_1bit c1(.a(A[1]),.b(B[1]),.g(g[1]),.e(e[1]),.l(l[1]));
comparator_1bit c0(.a(A[0]),.b(B[0]),.g(g[0]),.e(e[0]),.l(l[0]));
assign G = g[3] | (e[3] & g[2]) | (e[3] & e[2] & g[1]) | (e[3] & e[2] & e[1] & g[0]);
assign L = l[3] | (e[3] & l[2]) | (e[3] & e[2] & l[1]) | (e[3] & e[2] & e[1] & l[0]);
assign E = e[3] & e[2] & e[1] & e[0];
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_comparator_4bit;
reg [3:0] A,B;
wire G,E,L;
comparator_4bit uut(.A(A),.B(B),.G(G),.E(E),.L(L));
initial begin
$monitor("A=%b B=%b G=%b E=%b L=%b",
          A,B,G,E,L);
A=4'b0000; B=4'b0000; #10;
A=4'b0001; B=4'b0000; #10;
A=4'b0000; B=4'b0001; #10;
A=4'b0010; B=4'b0010; #10;
A=4'b0011; B=4'b0010; #10;
A=4'b0001; B=4'b0011; #10;
$finish;
end
endmodule