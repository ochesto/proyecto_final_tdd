`timescale 1ns / 1ps
module top_v_test;

	// Inputs
	reg CLK;
	reg RESET;
	
	//Outputs
	wire [31:0] DataAdr, WriteData;
	wire MemWrite;
 
	// Instantiate the Unit Under Test (UUT)
	top_v uut (
		.CLK(CLK),
		.RESET(RESET),
		.DataAdr(DataAdr), 
		.WriteData(WriteData), 
		.MemWrite(MemWrite)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		RESET = 1;

		// Wait 100 ns for global reset to finish
		#22;
        
		// Add stimulus here
		RESET = 0;
	end
	
	always@(*) begin
		#5;
		CLK <= ~CLK;
	end
	
endmodule

