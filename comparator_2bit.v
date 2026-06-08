rtl code:
`timescale 1ns / 1ps
module comparator_1bit(input a,input b,output g,output e,output l);
assign g = a & ~b;
assign e = ~(a ^ b);
assign l = ~a & b;
endmodule
module comparator_2bit(input [1:0] A,input [1:0] B,output G,output E,output L);
wire g1,e1,l1;
wire g0,e0,l0;
comparator_1bit c1(.a(A[1]),.b(B[1]),.g(g1),.e(e1),.l(l1));
comparator_1bit c0(.a(A[0]),.b(B[0]),.g(g0),.e(e0),.l(l0));
assign G = g1 | (e1 & g0);
assign L = l1 | (e1 & l0);
assign E = e1 & e0;
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_comparator_2bit;
reg [1:0] A,B;
wire G,E,L;
comparator_2bit uut(.A(A),.B(B),.G(G),.E(E),.L(L));
initial begin
$monitor("A=%b B=%b G=%b E=%b L=%b",
          A,B,G,E,L);
A=2'b00; B=2'b00; #10;
A=2'b01; B=2'b00; #10;
A=2'b00; B=2'b01; #10;
A=2'b10; B=2'b10; #10;
A=2'b11; B=2'b10; #10;
A=2'b01; B=2'b11; #10;
$finish;
end
endmodule