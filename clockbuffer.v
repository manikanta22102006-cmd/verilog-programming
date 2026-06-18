RTL CODE:-
`timescale 1ns / 1ps
module clock_buffer(input clk_in, output clk_out);
assign clk_out = clk_in;
endmodule

Test bench code:-
`timescale 1ns / 1ps
module tb_clock_buffer;
reg clk_in;
wire clk_out;
clock_buffer uut(.clk_in(clk_in),.clk_out(clk_out));
initial begin
    clk_in = 0;
    forever #5 clk_in = ~clk_in;
end
initial begin
    $monitor("Time=%0t clk_in=%b clk_out=%b",
              $time, clk_in, clk_out);
    #50 $finish;
end
endmodule