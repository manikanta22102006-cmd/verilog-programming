RTL CODE:-
`timescale 1ns / 1ps
module decoder_3X8(input [2:0]a,output reg [7:0]y);
    always@(*)begin
    case(a)
    3'b000:y=8'b00000001;
    3'b001:y=8'b00000010;
    3'b010:y=8'b00000100;
    3'b011:y=8'b00001000;
    3'b100:y=8'b00010000;
    3'b101:y=8'b00100000;
    3'b110:y=8'b01000000;
    3'b111:y=8'b10000000;
    endcase
  end
 endmodule
module fulladder_decoder(input a,b,cin,output s,cout);
    wire [7:0] y;
    decoder_3X8 d1(.a({a,b,cin}),.y(y));
  assign s=y[1]|y[2]|y[4]|y[7];
  assign cout=y[3]|y[5]|y[6]|y[7];   
endmodule

Test bench code:-
`timescale 1ns / 1ps
module tb_fulladder_decoder;
reg a,b,cin;
wire s,cout;
fulladder_decoder uut(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));
initial begin
    $monitor("a=%b b=%b cin=%b s=%b cout=%b",
              a,b,cin,s,cout);

    {a,b,cin}=3'b000; #10;
    {a,b,cin}=3'b001; #10;
    {a,b,cin}=3'b010; #10;
    {a,b,cin}=3'b011; #10;
    {a,b,cin}=3'b100; #10;
    {a,b,cin}=3'b101; #10;
    {a,b,cin}=3'b110; #10;
    {a,b,cin}=3'b111; #10;
    $finish;
end
endmodule