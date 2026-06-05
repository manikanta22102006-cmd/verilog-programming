rtl code:
`timescale 1ns / 1ps
module mux_7x1_latch(input [6:0]a,input [2:0]s,input en,output reg y);
    reg mux_out;
    always@(*)begin
        case(s)
            3'b000:mux_out = a[0];
            3'b001:mux_out = a[1];
            3'b010:mux_out = a[2];
            3'b011:mux_out = a[3];
            3'b100:mux_out = a[4];
            3'b101:mux_out = a[5];
            3'b110:mux_out = a[6];
            default:mux_out = 1'b0;
            endcase
            end
   always@(mux_out or en)begin
    if(en)
        y<=mux_out;
        end                        
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_mux_7x1_latch;
    reg [6:0]a;
    reg [2:0]s;
    reg en;
    wire y;   
    mux_7x1_latch uut(.a(a),.s(s),.en(en),.y(y));
    initial begin
        $monitor("a=%b,s=%b,en=%b,y=%b",a,s,en,y);
        a=7'b0101010;
        en=1'b1;
           s = 3'b000; #10;
           s = 3'b001; #10;
           s = 3'b010; #10;
           s = 3'b011; #10;
           s = 3'b100; #10;
           s = 3'b101; #10;
           s = 3'b110; #10;
           s = 3'b111; #10;
           en = 1'b0;
              a  = 7'b0100101;
              s  = 3'b000; #10;
              s  = 3'b100; #10;
              s  = 3'b110; #10;                        
              en = 1'b1;
              s  = 3'b000; #10;
              s  = 3'b100; #10;
              s  = 3'b110; #10;          
              $finish;
          end                   
endmodule
