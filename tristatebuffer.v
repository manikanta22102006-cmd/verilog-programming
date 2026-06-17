RTL CODE:-
`timescale 1ns / 1ps
module tristate_buffer(input a,input en,output y);
assign y = (en) ? a : 1'bz;
endmodule

Test bench code:-
`timescale 1ns / 1ps
module tb_tristate_buffer;
reg a,en;
wire y;
tristate_buffer uut(.a(a),.en(en),.y(y));
initial begin
    $monitor("a=%b en=%b y=%b",a,en,y);
    a=0; en=0; #10;
    a=1; en=0; #10;
    a=0; en=1; #10;
    a=1; en=1; #10;
    $finish;
end
endmodule