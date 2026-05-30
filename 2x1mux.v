rtl code:
`timescale 1ns / 1ps
module mux_2x1(input a,b,sel,output y);
    assign y=(sel)?b:a;    
endmodule
test bench code:
`timescale 1ns / 1ps
module tb_mux_2x1;
    reg a,b,sel;
    wire y;
    mux_2x1 uut(.a(a),.b(b),.sel(sel),.y(y));
    initial begin
    $monitor("a=%b,b=%b,sel=%b,y=%b",a,b,sel,y);
    a=1'b0;b=1'b0;sel=1'b0;#2;
    a=1'b0;b=1'b1;sel=1'b1;#2;
    a=1'b1;b=1'b0;sel=1'b1;#2;
    a=1'b1;b=1'b1;sel=1'b0;#2;
    $finish;
    end       
endmodule
