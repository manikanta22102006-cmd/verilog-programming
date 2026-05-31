rtl code:
`timescale 1ns / 1ps
module mux_4X1(input [3:0]a,input [1:0]s,output reg y);
   always @(*)
   begin
   case(s) 
   2'b00:y=a[0];
   2'b01:y=a[1];
   2'b10:y=a[2];
   2'b11:y=a[3];
   default:y=1'b0;
   endcase
   end
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_mux_4X1;
    reg [3:0]a;
    reg [1:0]s;
    wire y;
    mux_4X1 uut(.a(a),.s(s),.y(y));
    initial begin
    $monitor("a=%b,s=%b,y=%b",a,s,y);
    a=4'b0101;s=2'b00;#2;
    s=2'b01;#2;
    s=2'b10;#2;
    s=2'b11;#2;   
    $finish;
    end
endmodule
