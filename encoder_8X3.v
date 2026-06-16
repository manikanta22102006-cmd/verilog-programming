RTL CODE:-
`timescale 1ns / 1ps
module encoder_8x3(input [7:0] a,output reg [2:0]y);
    always@(*)begin
    case(a)
    8'b00000001:y=3'b000;
    8'b00000010:y=3'b001; 
    8'b00000100:y=3'b010;  
    8'b00001000:y=3'b011;
    8'b00010000:y=3'b100;
    8'b00100000:y=3'b101;
    8'b01000000:y=3'b110;
    8'b10000000:y=3'b111;
    default:    y=3'bxxx;
    endcase
    end        
endmodule

Test bench code:-
`timescale 1ns / 1ps
module tb_encoder_8x3;
reg [7:0] a;
wire [2:0] y;
encoder_8x3 uut(.a(a),.y(y));
initial begin
    $monitor("a=%b y=%b", a, y);
    a = 8'b00000001; #10;
    a = 8'b00000010; #10;
    a = 8'b00000100; #10;
    a = 8'b00001000; #10;
    a = 8'b00010000; #10;
    a = 8'b00100000; #10;
    a = 8'b01000000; #10;
    a = 8'b10000000; #10;
    $finish;
end
endmodule