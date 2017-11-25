`timescale 1ns / 1ps
module flopenr_v(clk, reset, en, d, q);
parameter WIDTH = 8;

input wire clk;
input wire reset;
input wire en;
input wire [WIDTH-1:0] d;
output reg [WIDTH-1:0] q;

always@(posedge clk, posedge reset) begin
	if(reset) q <= 0;
	else q <= d;
end

endmodule
