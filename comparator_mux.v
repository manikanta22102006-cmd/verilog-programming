rtl code:
`timescale 1ns / 1ps
module mux_4X1(input [3:0]d,input [1:0]s,output reg y);
    always@(*)begin
    case(s)
    2'b00:y=d[0];
    2'b01:y=d[1];
    2'b10:y=d[2];
    2'b11:y=d[3];
    endcase
    end
endmodule
module comparator_mux(input a,b,output g,l,e);
    mux_4X1 mux_g(.d(4'b0100),.s({a,b}),.y(g));
    mux_4X1 mux_e(.d(4'b1001),.s({a,b}),.y(e));
    mux_4X1 mux_l(.d(4'b0010),.s({a,b}),.y(l));       
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_comparator_mux;
   reg a,b;
    wire g,l,e;
 comparator_mux uut(.a(a),.b(b),.g(g),.l(l),.e(e));
    initial begin  
    $monitor("a=%b,b=%b,g=%b,e=%b,l=%b",a,b,g,e,l);
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;
    $finish;
    end    
endmodule

