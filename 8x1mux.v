rtl code:
`timescale 1ns / 1ps
module mux_2x1(input [1:0]a,input s,output y);
    assign y=s?a[1]:a[0];
endmodule
module mux_8x1(input [7:0]a,input [2:0]s,output y);
    wire [5:0]w;
    mux_2x1 m1(a[1:0],s[0],w[0]);
    mux_2x1 m2(a[3:2],s[0],w[1]);
    mux_2x1 m3(a[5:4],s[0],w[2]);
    mux_2x1 m4(a[7:6],s[0],w[3]);
    mux_2x1 m5(w[1:0],s[1],w[4]);
    mux_2x1 m6(w[3:2],s[1],w[5]);
    mux_2x1 m7(w[5:4],s[2],y);   
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_mux_8x1;
    reg [7:0]a;
    reg [2:0]s;
    wire y;
    mux_8x1 uut(.a(a),.s(s),.y(y));
    initial begin
        $monitor("a=%b,s=%b,y=%b",a,s,y);
        a=8'b01010101;
        s=3'b000;#2;
        s=3'b001;#2;
        s=3'b010;#2;
        s=3'b011;#2;
        s=3'b100;#2;
        s=3'b101;#2;
        s=3'b110;#2;
        s=3'b111;#2;
        $finish;
        end  
endmodule
