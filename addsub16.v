`timescale 1ns / 1ps

module add_sub_16(
    input [15:0] a,
    input [15:0] b,
    input mode,
    output [15:0] result,
    output carry
);

wire [15:0] tempb;

assign tempb = b ^ {16{mode}};

assign {carry,result} = a + tempb + mode;

endmodule


testbench:
`timescale 1ns / 1ps
module tb_add_sub_16;
reg [15:0] a,b;
reg mode;
wire [15:0] result;
wire carry;
add_sub_16 uut(
    .a(a),
    .b(b),
    .mode(mode),
    .result(result),
    .carry(carry)
);
initial begin
$monitor("a=%d,b=%d,mode=%d,result=%d,carry=%d",
          a,b,mode,result,carry);
a = 16'd10;
b = 16'd5;
mode = 0;
#10;
a = 16'd10;
b = 16'd5;
mode = 1;
#10;
$finish;
end
endmodule