`timescale 1ns / 1ps
module RAM_v(
input 
	wire clk,
	wire we,
	wire [31:0] a,
	wire [31:0] wd,
output
	wire [31:0] rd
);

reg [31:0] RAM[63:0];

assign rd = RAM[a[31:2]];

always@(posedge clk) begin
	if(we) RAM[a[31:2]] <= wd;
end

endmodule
