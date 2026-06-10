rtl code:
`timescale 1ns / 1ps
module comparator_nbit #(parameter n=8)(input [n-1:0]a,b,output reg g,l,e);
    always@(*)begin
        if(a>b)begin
        g=1'b1;
        e=1'b0;
        l=1'b0;
        end
         else if(a<b)begin
         g=1'b0;
         e=1'b0;
         l=1'b1;
         end
          else begin
           g=1'b0;
           e=1'b1;
           l=1'b0;
           end
           end                              
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_comparator_nbit;
    parameter n = 8;
    reg [n-1:0]a,b;
    wire g,l,e;
 comparator_nbit uut(.a(a),.b(b),.g(g),.l(l),.e(e));
    initial begin  
    $monitor("a=%b,b=%b,g=%b,e=%b,l=%b",a,b,g,e,l);
    a = 8'd0;   b = 8'd0;   #10;
    a = 8'd25;  b = 8'd10;  #10;
    a = 8'd15;  b = 8'd30;  #10;
    a = 8'd50;  b = 8'd50;  #10;
    a = 8'd255; b = 8'd100; #10;
    a = 8'd12;  b = 8'd200; #10;
    $finish;
    end    
endmodule
