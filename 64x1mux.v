rtl code:
`timescale 1ns / 1ps
module mux_4X1(input [3:0]a,input [1:0]s,output reg y);
    always@(*)begin
    case(s)
    2'b00:y=a[0];
    2'b01:y=a[1];
    2'b10:y=a[2];
    2'b11:y=a[3];
    endcase
    end
endmodule    
module mux_64X1(input [63:0]a,input [5:0]s,output y);
    wire [19:0]w;
    mux_4X1 m1(a[3:0],s[1:0],w[0]);
    mux_4X1 m2(a[7:4],s[1:0],w[1]);
    mux_4X1 m3(a[11:8],s[1:0],w[2]);
    mux_4X1 m4(a[15:12],s[1:0],w[3]);
    mux_4X1 m5(a[19:16],s[1:0],w[4]);
    mux_4X1 m6(a[23:20],s[1:0],w[5]);
    mux_4X1 m7(a[27:24],s[1:0],w[6]);
    mux_4X1 m8(a[31:28],s[1:0],w[7]);
    mux_4X1 m9(a[35:32],s[1:0],w[8]);
    mux_4X1 m10(a[39:36],s[1:0],w[9]);
    mux_4X1 m11(a[43:40],s[1:0],w[10]);
    mux_4X1 m12(a[47:44],s[1:0],w[11]);
    mux_4X1 m13(a[51:48],s[1:0],w[12]);
    mux_4X1 m14(a[55:52],s[1:0],w[13]);
    mux_4X1 m15(a[59:56],s[1:0],w[14]);
    mux_4X1 m16(a[63:60],s[1:0],w[15]);
    mux_4X1 m17(w[3:0],s[3:2],w[16]);                              
    mux_4X1 m18(w[7:4],s[3:2],w[17]);
    mux_4X1 m19(w[11:8],s[3:2],w[18]);
    mux_4X1 m20(w[15:12],s[3:2],w[19]);
    mux_4X1 m21(w[19:16],s[5:4],y);
endmodule

test bench code:
`timescale 1ns / 1ps
module tb_mux_64X1;
    reg [63:0]a;
    reg [5:0]s;
    wire y;
    mux_64X1 uut(.a(a),.s(s),.y(y));
    initial begin
    $monitor("a=%b,s=%b,y=%b",a,s,y);
    a = 64'hAAAAAAAAAAAAAAAA;
           s = 6'd0;  #10;
           s = 6'd1;  #10;
           s = 6'd2;  #10;
           s = 6'd3;  #10;
           s = 6'd10; #10;
           s = 6'd15; #10;
           s = 6'd20; #10;
           s = 6'd31; #10;
           s = 6'd40; #10;
           s = 6'd50; #10;
           s = 6'd63; #10;
     a = 64'hF0F0F0F0F0F0F0F0;     
                  s = 6'd0;  #10;
                  s = 6'd4;  #10;
                  s = 6'd8;  #10;
                  s = 6'd12; #10;
                  s = 6'd16; #10;
                  s = 6'd32; #10;
                  s = 6'd48; #10;
                  s = 6'd63; #10;
          
                  $finish;
              end      
          endmodule
