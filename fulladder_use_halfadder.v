// half adder design
module HA(input a,b, output s,c);
xor g1(s,a,b);
and g2(c,a,b);
endmodule

// full adder using half adder
module FA_using_HA(input a,b,cin,output s,cout);
wire w1,w2,w3;
HA hal (a,b,w1,w2);
HA ha2 (w1,cin,s,w3);
or g1(cout,w2,w3);
endmodule
// testbench code
`timescale 1ns / 1ps
module tb_FA_using_HA;
reg a,b,cin;
wire s,cout;
FA_using_HA uut(.a(a),.b(b),.cin(cin),.s(s),.cout (cout));
initial begin
$dumpfile("waveform.vcd");
$dumpvars (0,tb_FA_using_HA);
$monitor("time=%0t, a=%b, b=%b, cin=%b, s=%b, cout=%b", $time, a,b,cin,s,cout);
a=1'b0;b=1'b0;cin=1'b0;#2;
a=1'b0;b=1'b0;cin=1'b1;#2;
a=1'b0;b=1'b1;cin=1'b0;#2;
a=1'b0;b=1'b1;cin=1'b1;#2;
a=1'b1;b=1'b0;cin=1'b0;#2;
a=1'b1;b=1'b0;cin=1'b1;#2;
a=1'b1;b=1'b1;cin=1'b0;#2;
a=1'b1;b=1'b1;cin=1'b1;#2;
$finish;
end
endmodule